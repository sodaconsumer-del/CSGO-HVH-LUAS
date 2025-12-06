local v0 = {
    bearer_token = "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJleXh5Z2VpdmtycXl2Z3lrZ2N0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzU2ODE5MzksImV4cCI6MjA1MTI1NzkzOX0._BK7l1W82zdbQaAvwyq-2hjg1diBRWKl0T92qaF6InY", 
    api_key = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJleXh5Z2VpdmtycXl2Z3lrZ2N0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzU2ODE5MzksImV4cCI6MjA1MTI1NzkzOX0._BK7l1W82zdbQaAvwyq-2hjg1diBRWKl0T92qaF6InY"
};
local l_gradient_0 = require("neverlose/gradient");
local l_system_0 = require("neverlose/drag_system");
local l_mtools_0 = require("neverlose/mtools");
local l_base64_0 = require("neverlose/base64");
local l_clipboard_0 = require("neverlose/clipboard");
local _ = require("neverlose/vmt_hook");
local l_pui_0 = require("neverlose/pui");
local l_ffi_0 = require("ffi");
local _ = require("neverlose/folder");
local l_lib_0 = require("neverlose/http_lib");
local function v11(v12)
    -- upvalues: v11 (ref)
    if type(v12) == "table" then
        for v13, v14 in pairs(v12) do
            if type(v14) == "table" then
                print(v13 .. " = {");
                v11(v14);
                print("}");
            else
                print(v13 .. " = " .. tostring(v14));
            end;
        end;
    else
        print("Not a table: " .. tostring(v12));
    end;
end;
local v15 = l_lib_0.new({
    task_interval = 0.3, 
    timeout = 10, 
    enable_debug = false
});
local v16 = render.screen_size();
l_ffi_0.cdef("    typedef uintptr_t (__thiscall* GetClientEntity_123123_t)(void*, int);\n    typedef struct {\n        float  m_flLayerAnimtime;\n        float  m_flLayerFadeOuttime;\n        void  *m_pDispatchedStudioHdr;\n        int    m_nDispatchedSrc;\n        int    m_nDispatchedDst;\n        int    m_nOrder;\n        int    m_nSequence;\n        float  m_flPrevCycle;\n        float  m_flWeight;\n        float  m_flWeightDeltaRate;\n        float  m_flPlaybackRate;\n        float  m_flCycle;\n        int    m_pOwner;\n        int    m_nInvalidatePhysicsBits;\n    } animlayer_t;\n");
local v17 = {};
local function v21(v18, v19, v20)
    -- upvalues: v17 (ref)
    if not v19 then
        v19 = 3;
    end;
    if not v20 then
        v20 = 0;
    end;
    table.insert(v17, {
        [1] = v18, 
        [2] = v20, 
        [3] = globals.curtime, 
        [4] = v19
    });
end;
local v22 = {
    defensive_active = false, 
    check_color = 0, 
    last_time = 0, 
    is_safe_head = false, 
    max_tickbase = 0, 
    st = 0, 
    end_time = 0, 
    ground_ticks = 1
};
local v25 = {
    GRENADE_SECONDARY_DAMPENING = 0.3, 
    console_material = {
        [1] = "vgui_white", 
        [2] = "vgui/hud/800corner1", 
        [3] = "vgui/hud/800corner2", 
        [4] = "vgui/hud/800corner3", 
        [5] = "vgui/hud/800corner4"
    }, 
    func_argum = function(v23, v24)
        return function(...)
            -- upvalues: v23 (ref), v24 (ref)
            return v23(v24, ...);
        end;
    end, 
    dll_engine = l_ffi_0.cast("void***", utils.create_interface("engine.dll", "VEngineClient014"))
};
v25.viibility_console = v25.func_argum(l_ffi_0.cast("bool(__thiscall*)(void*)", v25.dll_engine[0][11]), v25.dll_engine);
v25.custom_color = function(v26)
    -- upvalues: v22 (ref), v25 (ref)
    if v22.check_color ~= v26 then
        for _, v28 in pairs(v25.console_material) do
            materials.get_materials(v28)[1]:color_modulate(color(v26.r, v26.g, v26.b));
            materials.get_materials(v28)[1]:alpha_modulate(v26.a / 255);
        end;
        v22.check_color = v26;
    end;
end;
local v29 = v16.y / 1440;
if v29 < 1 then
    v29 = 1;
end;
local v30 = {
    [1] = {
        link = "https://files.catbox.moe/wkp4ub.ttf", 
        path = "nl\\atlantic\\Verdana Bold.ttf"
    }, 
    [2] = {
        link = "https://files.catbox.moe/rfw8ir.ttf", 
        path = "nl\\atlantic\\Bold.ttf"
    }, 
    [3] = {
        link = "https://files.catbox.moe/29eybb.otf", 
        path = "nl\\atlantic\\Bold2.otf"
    }, 
    [4] = {
        link = "https://files.catbox.moe/gsrsqb.png", 
        path = "nl\\atlantic\\logo.png"
    }, 
    [5] = {
        link = "https://files.catbox.moe/9f07l1.TTF", 
        path = "nl\\atlantic\\Roboto_Bold.ttf"
    }, 
    [6] = {
        link = "https://files.catbox.moe/axndq0.png", 
        path = "nl\\atlantic\\small_logo.png"
    }, 
    [7] = {
        link = "https://files.catbox.moe/wpqzlw.png", 
        path = "nl\\atlantic\\logo_score_board.png"
    }, 
    [8] = {
        link = "https://files.catbox.moe/ahg2vy.ttf", 
        path = "nl\\atlantic\\small_pixel.ttf"
    }
};
for _, v32 in pairs(v30) do
    if not files.read(v32.path) then
        l_mtools_0.Network.Download(v32.link, v32.path, true, 97);
    end;
end;
files.create_folder("nl\\atlantic");
local v33 = {
    verdana = render.load_font("nl\\atlantic\\Verdana Bold.ttf", 11 * v29), 
    bold = render.load_font("nl\\atlantic\\Bold.ttf", 11 * v29, "ab"), 
    bold2 = render.load_font("nl\\atlantic\\Bold2.otf", 11 * v29, "ab"), 
    crosshair_ind = render.load_font("nl\\atlantic\\Verdana Bold.ttf", 8 * v29), 
    Roboto_Bold = render.load_font("nl\\atlantic\\Roboto_Bold.ttf", 9 * v29, "ab"), 
    small_pixel = render.load_font("nl\\atlantic\\small_pixel.ttf", 9 * v29)
};
local v34 = {
    logo = render.load_image_from_file("nl\\atlantic\\logo.png", vector(260, 250)), 
    logo_small = render.load_image_from_file("nl\\atlantic\\small_logo.png", vector(100, 100)), 
    logo_small_2 = render.load_image_from_file("nl\\atlantic\\small_logo.png", vector(60, 60))
};
local v35 = {
    Data = {
        Points = 0, 
        User = common.get_username(), 
        Build = (not (common.get_username() ~= "igortabi21") or common.get_username() == "MultipleVAC") and "Developer" or "Alpha"
    }, 
    Menu = {
        Tabs = {
            Home = {
                Main = {
                    data = l_pui_0.create("\f<house>", "User Data", 1), 
                    lvd = l_pui_0.create("\f<house>", "", 1), 
                    main = l_pui_0.create("\f<house>", "Main ", 2), 
                    Discord = l_pui_0.create("\f<house>", "Discord", 2), 
                    Dashboard = l_pui_0.create("\f<house>", "Dashboard", 1)
                }, 
                Cloud = {
                    Configs = {
                        Main = l_pui_0.create("\f<house>", " ", 2), 
                        info = l_pui_0.create("\f<house>", "Configs Info", 2), 
                        more = l_pui_0.create("\f<house>", "Feedback", 2)
                    }, 
                    ChangeLogs = {
                        current = l_pui_0.create("\f<house>", " ", 2), 
                        todo = l_pui_0.create("\f<house>", "  ", 2)
                    }, 
                    Leaderboard = {
                        List = l_pui_0.create("\f<house>", "  ", 2), 
                        Add_User = l_pui_0.create("\f<house>", "    ", 2)
                    }, 
                    Questes = {
                        Main = l_pui_0.create("\f<house>", "Questes", 2)
                    }
                }
            }, 
            Rage = {
                AntiAim = {
                    Builder = {
                        Main = l_pui_0.create("\f<shield-halved>", "Settings", 1), 
                        Normal = l_pui_0.create("\f<shield-halved>", "Builder", 2), 
                        Yaw = l_pui_0.create("\f<shield-halved>", "Yaw", 2), 
                        Desync = l_pui_0.create("\f<shield-halved>", "Fake", 2), 
                        Defensive = {
                            Defensive = l_pui_0.create("\f<shield-halved>", "Defensive", 2)
                        }, 
                        Anti_bruteforce = {
                            Anti_bruteforce = l_pui_0.create("\f<shield-halved>", "Anti-Bruteforce", 2)
                        }, 
                        Antiaim = l_pui_0.create("\f<shield-halved>", "Addons", 1)
                    }, 
                    Settings = {
                        Teams = l_pui_0.create("\f<shield-halved>", "Teams", 1), 
                        States = l_pui_0.create("\f<shield-halved>", "Conditions", 1), 
                        Breakers = l_pui_0.create("\f<shield-halved>", "Breakers", 2), 
                        Anti_aim_other = l_pui_0.create("\f<shield-halved>", "AntiAim Addons", 2), 
                        manuals = l_pui_0.create("\f<shield-halved>", "Manuals", 2)
                    }
                }
            }, 
            Other = {
                Aimbot = {
                    Aimbot = l_pui_0.create("\f<gear>", "Aimbot", 1)
                }, 
                Visuals = {
                    Main = l_pui_0.create("\f<gear>", "Visuals", 2)
                }, 
                Misc = {
                    Main = l_pui_0.create("\f<gear>", "Misc", 1)
                }
            }
        }, 
        Other = {
            ChangeLogs = {
                [1] = "Improved L&R", 
                [2] = "Added Jitter to defensive Yaw", 
                [3] = "Removed Dormant Aimbot", 
                [4] = "Improved Watermark", 
                [5] = "Reworked Gradient Style", 
                [6] = "Reworked Notifications", 
                [7] = "Added Questes", 
                [8] = "Added Force Update Leaderboard"
            }, 
            Questes = {
                [1] = "Get 1000 Points"
            }
        }, 
        Main = {}, 
        AntiAim = {}, 
        Ragebot = {}, 
        Misc = {}, 
        Visuals = {}, 
        Builder = {}
    }, 
    Functions = {
        AntiAim = {}, 
        Ragebot = {}, 
        Misc = {}, 
        Visuals = {}, 
        Main = {}
    }, 
    AntiAim = {
        Teams = {
            [1] = "Terrorist", 
            [2] = "Counter-Terrorist"
        }, 
        States = {
            [1] = "Global", 
            [2] = "Standing", 
            [3] = "Slow-Walking", 
            [4] = "Running", 
            [5] = "Sneaking", 
            [6] = "Jumping", 
            [7] = "Crouching", 
            [8] = "Air+Crouching", 
            [9] = "FakeLag", 
            [10] = "Freestanding"
        }, 
        data = {
            Allow_defensive = false
        }
    }
};
leaderboard = {};
leaderboard.add_user = function(v36)
    -- upvalues: v0 (ref), v35 (ref), v15 (ref)
    local v37 = "https://beyxygeivkrqyvgykgct.supabase.co/rest/v1/Leaderboard";
    local v38 = {
        ["Content-Type"] = "application/json", 
        apikey = v0.api_key, 
        Authorization = v0.bearer_token
    };
    if not v36 or v36 == "" then
        print("Error: Username is required to add a new user.");
        return;
    else
        local v39 = json.stringify({
            Points = 0, 
            Username = v36, 
            Build = v35.Data.Build
        });
        v15:request("POST", v37, {
            headers = v38, 
            body = v39
        }, function(v40)
            -- upvalues: v36 (ref)
            if v40 then
                if v40.status == 201 then
                    print("Successfully added new user:", v36);
                else
                    print("Failed to add user. Status:", v40.status, "Body:", v40.body);
                end;
            else
                print("No response received while trying to add user.");
            end;
        end);
        return;
    end;
end;
leaderboard.add_points = function(v41)
    -- upvalues: v35 (ref), v0 (ref), v15 (ref)
    local l_User_0 = v35.Data.User;
    local v43 = "https://beyxygeivkrqyvgykgct.supabase.co/rest/v1/Leaderboard?select=Points&Username=eq." .. l_User_0;
    local v44 = {
        ["Content-Type"] = "application/json", 
        apikey = v0.api_key, 
        Authorization = v0.bearer_token
    };
    local function v47(v45, v46)
        _G.print("Error in " .. v45 .. (v46 and ": " .. v46 or ""));
    end;
    v15:request("GET", v43, {
        headers = v44
    }, function(v48)
        -- upvalues: v47 (ref), v41 (ref), l_User_0 (ref), v15 (ref), v44 (ref)
        if not v48 then
            return v47("GET", "No response received");
        elseif v48.status ~= 200 then
            return v47("GET", "Unexpected status: " .. v48.status);
        else
            local v49 = json.parse(v48.body or "");
            if not v49 or type(v49) ~= "table" or not v49[1] then
                return v47("GET", "User not found or invalid data");
            else
                local v50 = (tonumber(v49[1].Points) or 0) + v41;
                local v51 = "https://beyxygeivkrqyvgykgct.supabase.co/rest/v1/Leaderboard?Username=eq." .. l_User_0;
                local v52 = json.stringify({
                    Points = v50
                });
                v15:request("PATCH", v51, {
                    headers = v44, 
                    body = v52
                }, function(v53)
                    -- upvalues: v47 (ref)
                    if not v53 then
                        return v47("PATCH", "No response received");
                    elseif v53.status ~= 204 then
                        return v47("PATCH", "Unexpected status: " .. v53.status);
                    else
                        return;
                    end;
                end);
                return;
            end;
        end;
    end);
end;
leaderboard.get_points = function(v54)
    -- upvalues: v0 (ref), v35 (ref)
    local v55 = {
        ["Content-Type"] = "application/json", 
        apikey = v0.api_key, 
        Authorization = v0.bearer_token
    };
    network.get("https://beyxygeivkrqyvgykgct.supabase.co/rest/v1/Leaderboard", v55, function(v56)
        -- upvalues: v35 (ref), v54 (ref)
        if not v56 then
            print("Error: No response received");
            return;
        else
            local v57 = json.parse(v56);
            if not v57 then
                print("Error: Failed to parse JSON response");
                return;
            else
                local v58 = {};
                for _, v60 in ipairs(v57) do
                    local v61 = v60.Username or v60.username;
                    local v62 = v60.Build or v60.build;
                    local v63 = tonumber(v60.Points or v60.points) or 0;
                    table.insert(v58, {
                        Build = v62, 
                        Username = v61, 
                        Points = v63
                    });
                    if common.get_username() == v61 then
                        if v63 >= 1000 then
                            v35.Menu.Main.Questes:update({
                                [1] = "Completed"
                            });
                        else
                            v35.Menu.Main.Questes:update({
                                [1] = "Get 1000 Points"
                            });
                        end;
                        v35.Data.Points = v63;
                    end;
                end;
                table.sort(v58, function(v64, v65)
                    return v64.Points > v65.Points;
                end);
                local v66 = {};
                for _, v68 in ipairs(v58) do
                    table.insert(v66, v68.Build .. " | " .. v68.Username .. " | " .. v68.Points);
                end;
                if v54 then
                    v54(v66);
                end;
                return;
            end;
        end;
    end);
end;
leaderboard.get_points(function(v69)
    -- upvalues: v35 (ref)
    v35.Menu.Main.cloud_leaderboard_list:update(v69);
end);
leaderboard.get_users = function(v70)
    -- upvalues: v0 (ref), v35 (ref)
    local v71 = {
        ["Content-Type"] = "application/json", 
        apikey = v0.api_key, 
        Authorization = v0.bearer_token
    };
    network.get("https://beyxygeivkrqyvgykgct.supabase.co/rest/v1/Leaderboard", v71, function(v72)
        -- upvalues: v35 (ref), v70 (ref)
        if not v72 then
            print("Error: No response received");
            return;
        else
            local v73 = json.parse(v72);
            if not v73 then
                print("Error: Failed to parse JSON response");
                return;
            else
                local v74 = {};
                for _, v76 in ipairs(v73) do
                    local v77 = v76.Username or v76.username;
                    local v78 = v76.Build or v76.build;
                    local v79 = tonumber(v76.Points or v76.points) or 0;
                    table.insert(v74, {
                        Build = v78, 
                        Username = v77, 
                        Points = v79
                    });
                    if common.get_username() == v77 then
                        v35.Data.Points = v79;
                    end;
                end;
                table.sort(v74, function(v80, v81)
                    return v80.Points > v81.Points;
                end);
                if v70 then
                    v70(v74);
                end;
                return;
            end;
        end;
    end);
end;
local v82 = false;
local function v86()
    -- upvalues: v82 (ref), v35 (ref)
    leaderboard.get_users(function(v83)
        -- upvalues: v82 (ref), v35 (ref)
        v82 = false;
        for _, v85 in ipairs(v83) do
            if v85.Username == v35.Data.User then
                v82 = true;
                break;
            end;
        end;
    end);
end;
v86();
v35.Menu.Tabs.Home.Main.lvd:texture(v34.logo);
v35.Menu.Main.Tab = v35.Menu.Tabs.Home.Main.Dashboard:list("", {
    [1] = "Main", 
    [2] = "Local", 
    [3] = "Cloud"
});
v35.Menu.Main.cloud = v35.Menu.Tabs.Home.Main.Dashboard:list("Cloud Options", {
    [1] = "Leaderboard", 
    [2] = "Change Logs", 
    [3] = "Questes", 
    [4] = "Configs"
}):depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v35.Menu.Main.Tab
});
v35.Menu.Main.Questes = v35.Menu.Tabs.Home.Cloud.Questes.Main:list("Questes", v35.Menu.Other.Questes):depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v35.Menu.Main.Tab
}, {
    [1] = nil, 
    [2] = 3, 
    [1] = v35.Menu.Main.cloud
});
v35.Menu.Main.change_logs = v35.Menu.Tabs.Home.Cloud.ChangeLogs.current:list("Change Logs", v35.Menu.Other.ChangeLogs):depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v35.Menu.Main.Tab
}, {
    [1] = nil, 
    [2] = 2, 
    [1] = v35.Menu.Main.cloud
});
v35.Menu.Main.cloud_leaderboard_list = v35.Menu.Tabs.Home.Cloud.Leaderboard.List:list("Leaderboard", {}):depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v35.Menu.Main.Tab
}, {
    [1] = nil, 
    [2] = 1, 
    [1] = v35.Menu.Main.cloud
});
v35.Menu.Main.cloud_leaderboard_add_user = v35.Menu.Tabs.Home.Cloud.Leaderboard.Add_User:button("Join Leaderboard", function()
    -- upvalues: v35 (ref), v86 (ref)
    leaderboard.add_user(v35.Data.User);
    v86();
end):depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v35.Menu.Main.Tab
}, {
    [1] = nil, 
    [2] = 1, 
    [1] = v35.Menu.Main.cloud
});
v35.Menu.Main.cloud_leaderboard_force_reload = v35.Menu.Tabs.Home.Cloud.Leaderboard.Add_User:button("Force Update Leaderboard", function()
    -- upvalues: v35 (ref)
    leaderboard.get_points(function(v87)
        -- upvalues: v35 (ref)
        v35.Menu.Main.cloud_leaderboard_list:update(v87);
    end);
end):depend({
    [1] = nil, 
    [2] = 3, 
    [1] = v35.Menu.Main.Tab
}, {
    [1] = nil, 
    [2] = 1, 
    [1] = v35.Menu.Main.cloud
});
v35.Menu.Tabs.Home.Main.data:label(l_pui_0.get_icon("user") .. "    Welcome");
v35.Menu.Tabs.Home.Main.data:button("\v" .. v35.Data.User, function()

end, true);
v35.Menu.Tabs.Home.Main.data:label(l_pui_0.get_icon("bomb") .. "    Version:");
v35.Menu.Tabs.Home.Main.data:button("\v" .. v35.Data.Build, function()

end, true);
v35.Menu.Tabs.Home.Main.main:label(l_pui_0.get_icon("code") .. "    Developer:\v Tabihvh"):depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v35.Menu.Main.Tab
});
v35.Menu.Tabs.Home.Main.main:label(l_pui_0.get_icon("palette") .. "    designer:\v VAC"):depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v35.Menu.Main.Tab
});
v35.Menu.Main.color_accent = v35.Menu.Tabs.Other.Visuals.Main:label("Accent Color");
local v88 = v35.Menu.Main.color_accent:color_picker(color("#FBCEA2FF"));
v35.Menu.Visuals.shared_icon = v35.Menu.Tabs.Other.Visuals.Main:switch("Shared Icon");
v35.Menu.Ragebot.quick_stop = v35.Menu.Tabs.Other.Aimbot.Aimbot:switch("Quick Stop in Air");
v35.Menu.Misc.view_model = v35.Menu.Tabs.Other.Misc.Main:switch("View Model");
v35.Menu.Misc.view_model_create = v35.Menu.Misc.view_model:create();
v35.Menu.Misc.view_model_fov = v35.Menu.Misc.view_model_create:slider("Fov", 54, 125, 60):depend(v35.Menu.Misc.view_model);
v35.Menu.Misc.view_model_x = v35.Menu.Misc.view_model_create:slider("X", -100, 100, 0):depend(v35.Menu.Misc.view_model);
v35.Menu.Misc.view_model_y = v35.Menu.Misc.view_model_create:slider("Y", -100, 100, 0):depend(v35.Menu.Misc.view_model);
v35.Menu.Misc.view_model_z = v35.Menu.Misc.view_model_create:slider("Z", -100, 100, 0):depend(v35.Menu.Misc.view_model);
v35.Menu.Misc.trashtalk = v35.Menu.Tabs.Other.Misc.Main:switch("TrashTalk");
v35.Menu.Misc.types_settings = v35.Menu.Misc.trashtalk:create();
v35.Menu.Misc.trashtalk_type = v35.Menu.Misc.types_settings:combo("Type", {
    [1] = "advertisement", 
    [2] = "Medusa.uno", 
    [3] = "Toxic", 
    [4] = "1"
}):depend(v35.Menu.Misc.trashtalk);
v35.Menu.Misc.trashtalk_delay = v35.Menu.Misc.types_settings:slider("delay", 0, 10):depend(v35.Menu.Misc.trashtalk);
v35.Menu.Misc.clantag = v35.Menu.Tabs.Other.Misc.Main:switch("Clantag");
v35.Menu.Misc.clantag_create = v35.Menu.Misc.clantag:create();
v35.Menu.Misc.clantag_types = v35.Menu.Misc.clantag_create:combo("Clantag Types", {
    [1] = "Atlantic", 
    [2] = "Custom"
}):depend(v35.Menu.Misc.clantag);
v35.Menu.Misc.clantag_input = v35.Menu.Misc.clantag_create:input("Custom Clantag"):depend(v35.Menu.Misc.clantag, {
    [1] = nil, 
    [2] = "Custom", 
    [1] = v35.Menu.Misc.clantag_types
});
v35.Menu.Misc.unlock_ping_spike = v35.Menu.Tabs.Other.Misc.Main:switch("Unlock Fake Ping");
v35.Menu.Misc.logger = v35.Menu.Tabs.Other.Misc.Main:switch("Notifications");
v35.Menu.Misc.logger_create = v35.Menu.Misc.logger:create();
v35.Menu.Misc.logger_Style = v35.Menu.Misc.logger_create:combo("Style", {
    [1] = "Simple", 
    [2] = "Modern", 
    [3] = "Gradient", 
    [4] = "Atlantic"
}):depend({
    [1] = nil, 
    [2] = true, 
    [1] = v35.Menu.Misc.logger
});
v35.Menu.Misc.font = v35.Menu.Misc.logger_create:combo("Font", {
    [1] = "Verdana", 
    [2] = "Bold", 
    [3] = "Bold 2", 
    [4] = "Verdana Bold", 
    [5] = "Roboto Bold", 
    [6] = "Small Pixel"
}):depend({
    [1] = nil, 
    [2] = true, 
    [1] = v35.Menu.Misc.logger
});
v35.Menu.Misc.logger_y = v35.Menu.Misc.logger_create:slider("Yaw Offset", -1000, 1000, 0):depend({
    [1] = nil, 
    [2] = true, 
    [1] = v35.Menu.Misc.logger
});
v35.Menu.Misc.logger_round = v35.Menu.Misc.logger_create:slider("Round Amount", 0, 25, 0):depend({
    [1] = nil, 
    [2] = true, 
    [1] = v35.Menu.Misc.logger
}, {
    [1] = nil, 
    [2] = 2, 
    [1] = v35.Menu.Misc.logger_Style
});
v35.Menu.Misc.Console_color = v35.Menu.Tabs.Other.Misc.Main:color_picker("Console Color");
v35.Menu.Misc.grenade = v35.Menu.Tabs.Other.Misc.Main:label("Granade Helper");
v35.Menu.Misc.grenade_create = v35.Menu.Misc.grenade:create();
v35.Menu.Misc.grenade_supertoss = v35.Menu.Misc.grenade_create:switch("Super Toss");
v35.Menu.Misc.grenade_radius = v35.Menu.Misc.grenade_create:switch("Grenade Radius");
v35.Menu.Misc.grenade_select = v35.Menu.Misc.grenade_create:listable("", {
    [1] = "Smoke", 
    [2] = "Molotov"
}):depend(v35.Menu.Misc.grenade_radius);
v35.Menu.Misc.molotov_color = v35.Menu.Misc.grenade_create:color_picker("Friendly Molotov Color", color(116, 192, 41, 255)):depend(v35.Menu.Misc.grenade_radius, {
    [1] = nil, 
    [2] = 2, 
    [1] = v35.Menu.Misc.grenade_select
});
v35.Menu.Misc.molotov_color2 = v35.Menu.Misc.grenade_create:color_picker("Molotov Color", color(255, 63, 63, 255)):depend(v35.Menu.Misc.grenade_radius, {
    [1] = nil, 
    [2] = 2, 
    [1] = v35.Menu.Misc.grenade_select
});
v35.Menu.Misc.smoke_color = v35.Menu.Misc.grenade_create:color_picker("Smoke Color", color(61, 147, 250, 180)):depend(v35.Menu.Misc.grenade_radius, {
    [1] = nil, 
    [2] = 1, 
    [1] = v35.Menu.Misc.grenade_select
});
v35.Menu.Misc.fast_ladder = v35.Menu.Tabs.Other.Misc.Main:switch("Fast Ladder");
v35.Menu.Misc.auto_break_lc = v35.Menu.Tabs.Other.Misc.Main:switch("Auto Teleport");
v35.Menu.Misc.auto_break_lc_create = v35.Menu.Misc.auto_break_lc:create();
v35.Menu.Misc.auto_break_lc_options = v35.Menu.Misc.auto_break_lc_create:selectable("Options", {
    [1] = "Allow In Air", 
    [2] = "Delay"
}):depend(v35.Menu.Misc.auto_break_lc);
v35.Menu.Misc.auto_break_lc_options_delay = v35.Menu.Misc.auto_break_lc_create:slider("Delay", 0, 10, 0, 1, "s"):depend(v35.Menu.Misc.auto_break_lc, {
    [1] = nil, 
    [2] = "Delay", 
    [1] = v35.Menu.Misc.auto_break_lc_options
});
v35.Menu.Misc.air_stuck = v35.Menu.Tabs.Other.Misc.Main:switch("Air Stuck");
v35.Menu.Misc.connect_uwujka = v35.Menu.Tabs.Other.Misc.Main:button("Connect To Uwujka.pl", function()
    utils.console_exec("connect 51.77.47.242");
end);
v35.Menu.Visuals.customscope = v35.Menu.Tabs.Other.Visuals.Main:switch("Custom Scope");
v35.Menu.Visuals.customscope_settings = v35.Menu.Visuals.customscope:create();
v35.Menu.Visuals.customscope_Color = v35.Menu.Visuals.customscope_settings:color_picker("Custom Scope Color"):depend(v35.Menu.Visuals.customscope);
v35.Menu.Visuals.customscope_invert = v35.Menu.Visuals.customscope_settings:switch("Invert scope lines", false):depend(v35.Menu.Visuals.customscope);
v35.Menu.Visuals.customscope_settings_lines = v35.Menu.Visuals.customscope_settings:selectable("Remove", {
    [1] = "Up", 
    [2] = "Down", 
    [3] = "Left", 
    [4] = "Right"
}):depend(v35.Menu.Visuals.customscope);
v35.Menu.Visuals.customscope_Gap = v35.Menu.Visuals.customscope_settings:slider("Custom Scope Gap", 0, 100, 0, 0.1):depend(v35.Menu.Visuals.customscope);
v35.Menu.Visuals.customscope_Lenght = v35.Menu.Visuals.customscope_settings:slider("Custom Scope Lenght", 0, 100, 0, 0.1):depend(v35.Menu.Visuals.customscope);
v35.Menu.Visuals.Aspect_ratio = v35.Menu.Tabs.Other.Visuals.Main:slider("Aspect Ratio", 0, 200, 0, 0.01, function(v89)
    local v90 = {
        [1] = "16:9", 
        [2] = "16:10", 
        [3] = "4:3", 
        [4] = "5:4"
    };
    local v91 = {
        ["16:9"] = 177, 
        ["5:4"] = 125, 
        ["4:3"] = 133, 
        ["16:10"] = 160
    };
    local v92 = {};
    for v93 = 1, #v90 do
        local v94 = v90[v93];
        v92[v91[v94]] = v94;
    end;
    if v89 == 0 then
        return "Off";
    else
        return v92[v89];
    end;
end);
v35.Menu.Visuals.widgets = v35.Menu.Tabs.Other.Visuals.Main:selectable("Widgets", {
    [1] = "Keybind List", 
    [2] = "Watermark", 
    [3] = "Spectator List", 
    [4] = "Crosshair Indicators"
});
v35.Menu.Visuals.watermark_create = v35.Menu.Visuals.widgets:create();
v35.Menu.Visuals.watermark_type = v35.Menu.Visuals.watermark_create:combo("Watermark Type", "Solus", "OG");
v35.Menu.Visuals.watermark_build = v35.Menu.Visuals.watermark_create:switch("Lua Build", false):depend({
    [1] = nil, 
    [2] = "Watermark", 
    [1] = v35.Menu.Visuals.widgets
}, {
    [1] = nil, 
    [2] = "OG", 
    [1] = v35.Menu.Visuals.watermark_type
});
v35.Menu.Visuals.watermark_position = v35.Menu.Visuals.watermark_create:combo("Position", {
    [1] = "Bottom", 
    [2] = "Left", 
    [3] = "Right"
}):depend({
    [1] = nil, 
    [2] = "Watermark", 
    [1] = v35.Menu.Visuals.widgets
}, {
    [1] = nil, 
    [2] = "OG", 
    [1] = v35.Menu.Visuals.watermark_type
});
v35.Menu.Visuals.widgets_glow = v35.Menu.Visuals.watermark_create:selectable("Glow", {
    [1] = "Keybind List", 
    [2] = "Spectator List", 
    [3] = "Watermark"
});
v35.Menu.Visuals.keybinds_x = v35.Menu.Visuals.watermark_create:slider("Keybinds x", 0, v16.x, 300):visibility(false);
v35.Menu.Visuals.keybinds_y = v35.Menu.Visuals.watermark_create:slider("Keybinds y", 0, v16.y, 100):visibility(false);
v35.Menu.Visuals.specators_x = v35.Menu.Visuals.watermark_create:slider("Keybinds x", 0, v16.x, 300):visibility(false);
v35.Menu.Visuals.specators_y = v35.Menu.Visuals.watermark_create:slider("Keybinds y", 0, v16.y, 100):visibility(false);
v35.Menu.Visuals.crosshair_ind_text_style = v35.Menu.Visuals.watermark_create:combo("Crosshair Indicators Text Style", {
    [1] = "Old", 
    [2] = "Rework"
}):depend({
    [1] = nil, 
    [2] = "Crosshair Indicators", 
    [1] = v35.Menu.Visuals.widgets
});
v35.Menu.Visuals.crosshair_ind_settings = v35.Menu.Visuals.watermark_create:selectable("Crosshair Indicators Items", {
    [1] = "Conditions", 
    [2] = "Binds"
}):depend({
    [1] = nil, 
    [2] = "Crosshair Indicators", 
    [1] = v35.Menu.Visuals.widgets
});
v35.Menu.Visuals.crosshair_ind_color_1 = v35.Menu.Visuals.watermark_create:color_picker("Crosshair Indicators Animation Color 1"):depend({
    [1] = nil, 
    [2] = "Crosshair Indicators", 
    [1] = v35.Menu.Visuals.widgets
}, {
    [1] = nil, 
    [2] = "Rework", 
    [1] = v35.Menu.Visuals.crosshair_ind_text_style
});
v35.Menu.Visuals.crosshair_ind_color_2 = v35.Menu.Visuals.watermark_create:color_picker("Crosshair Indicators Animation Color 2"):depend({
    [1] = nil, 
    [2] = "Crosshair Indicators", 
    [1] = v35.Menu.Visuals.widgets
}, {
    [1] = nil, 
    [2] = "Rework", 
    [1] = v35.Menu.Visuals.crosshair_ind_text_style
});
v35.Menu.Visuals.crosshair_ind_color_3 = v35.Menu.Visuals.watermark_create:color_picker("Crosshair Indicators Animation Color 3"):depend({
    [1] = nil, 
    [2] = "Crosshair Indicators", 
    [1] = v35.Menu.Visuals.widgets
}, {
    [1] = nil, 
    [2] = "Rework", 
    [1] = v35.Menu.Visuals.crosshair_ind_text_style
});
v35.Menu.Visuals.crosshair_ind_animation_speed = v35.Menu.Visuals.watermark_create:slider("Crosshair Indicators Animation Speed", -10, 10, 1):depend({
    [1] = nil, 
    [2] = "Crosshair Indicators", 
    [1] = v35.Menu.Visuals.widgets
}, {
    [1] = nil, 
    [2] = "Rework", 
    [1] = v35.Menu.Visuals.crosshair_ind_text_style
});
v35.Menu.Visuals.crosshair_ind_y = v35.Menu.Visuals.watermark_create:slider("Crosshair Indicators Hight", -1000, 1000, 1):depend({
    [1] = nil, 
    [2] = "Crosshair Indicators", 
    [1] = v35.Menu.Visuals.widgets
});
v35.Menu.Tabs.Home.Main.Discord:label(l_pui_0.get_icon("arrow-right") .. " How to get \vRole:"):depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v35.Menu.Main.Tab
});
v35.Menu.Tabs.Home.Main.Discord:label(l_pui_0.get_icon("arrow-right") .. "   Click \v" .. l_pui_0.get_icon("link") .. " Join \aFFFFFFFFto join " .. l_pui_0.get_icon("discord") .. " Server"):depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v35.Menu.Main.Tab
});
v35.Menu.Tabs.Home.Main.Discord:label(l_pui_0.get_icon("arrow-right") .. "   Click \v" .. l_pui_0.get_icon("key") .. " Get Code"):depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v35.Menu.Main.Tab
});
v35.Menu.Tabs.Home.Main.Discord:label(l_pui_0.get_icon("arrow-right") .. "   On " .. l_pui_0.get_icon("discord") .. " Server go to channel \227\128\148\226\156\148\227\128\149verify-here and click \240\159\145\141 Emoji"):depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v35.Menu.Main.Tab
});
v35.Menu.Tabs.Home.Main.Discord:label(l_pui_0.get_icon("arrow-right") .. "   Now Move on to \227\128\148\240\159\148\145\227\128\149get-role channel in [Neverlose] Category"):depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v35.Menu.Main.Tab
});
v35.Menu.Tabs.Home.Main.Discord:label(l_pui_0.get_icon("arrow-right") .. "   Use verify_nl command and paste this code in empty argument"):depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v35.Menu.Main.Tab
});
v35.Menu.Tabs.Home.Main.Discord:label(l_pui_0.get_icon("arrow-right") .. "   Done"):depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v35.Menu.Main.Tab
});
v35.Menu.Tabs.Home.Main.Discord:label(l_pui_0.get_icon("discord")):depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v35.Menu.Main.Tab
});
v35.Menu.Tabs.Home.Main.Discord:button("\v" .. l_pui_0.get_icon("link") .. " Join", function()
    -- upvalues: l_mtools_0 (ref)
    l_mtools_0.Panorama:OpenLink("https://discord.gg/djmF9JXgtM");
end, true):depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v35.Menu.Main.Tab
});
v35.Menu.Tabs.Home.Main.Discord:button("\v" .. l_pui_0.get_icon("key") .. " Get Code", function()
    -- upvalues: v35 (ref), l_clipboard_0 (ref)
    local function v100(v95)
        local v96 = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        local v97 = "";
        for _ = 1, v95 do
            local v99 = math.random(1, #v96);
            v97 = v97 .. v96:sub(v99, v99);
        end;
        return v97;
    end;
    (function()
        -- upvalues: v100 (ref), v35 (ref), l_clipboard_0 (ref)
        local v101 = v100(69);
        local v102 = {
            ["Discord Id"] = "", 
            ["Nl Username"] = v35.Data.User, 
            Build = v35.Data.Build, 
            Key = v101
        };
        local v103 = "https://beyxygeivkrqyvgykgct.supabase.co/rest/v1/Discord";
        local v104 = {
            apikey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJleXh5Z2VpdmtycXl2Z3lrZ2N0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzU2ODE5MzksImV4cCI6MjA1MTI1NzkzOX0._BK7l1W82zdbQaAvwyq-2hjg1diBRWKl0T92qaF6InY", 
            ["Content-Type"] = "application/json", 
            Authorization = "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJleXh5Z2VpdmtycXl2Z3lrZ2N0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzU2ODE5MzksImV4cCI6MjA1MTI1NzkzOX0._BK7l1W82zdbQaAvwyq-2hjg1diBRWKl0T92qaF6InY"
        };
        network.post(v103, v102, v104, function(v105)
            -- upvalues: l_clipboard_0 (ref), v101 (ref)
            if v105 then
                print("User added successfully: " .. v105);
                l_clipboard_0.set(v101);
                print("Code copied to clipboard: " .. l_clipboard_0.get());
            else
                print("Failed to add user.");
            end;
        end);
    end)();
end, true):depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v35.Menu.Main.Tab
});
helpers = {
    hitgroup_str = {
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
    }, 
    animated_clantag = function(v106, v107)
        -- upvalues: v22 (ref)
        if globals.is_in_game then
            local v108 = math.floor(globals.curtime * v106);
            if v22.last_time ~= v108 then
                common.set_clan_tag(v107[math.floor(v108 % #v107) + 1]);
            end;
            v22.last_time = v108;
        end;
    end, 
    lerp = function(v109, v110, v111)
        return v109 + (v110 - v109) * globals.frametime * v111;
    end, 
    lerp2 = function(v112, v113, v114)
        return v112 + v114 * (v113 - v112);
    end, 
    lerpx = function(v115, v116, v117)
        return v116 * (1 - v115) + v117 * v115;
    end, 
    normalize_yaw = function(v118)
        while v118 > 180 do
            v118 = v118 - 360;
        end;
        while v118 < -180 do
            v118 = v118 + 360;
        end;
        return v118;
    end, 
    resolve_grenade_throw = function(v119, v120, v121, v122)
        -- upvalues: v25 (ref)
        v119.x = v119.x - 10 + math.abs(v119.x) / 9;
        local v123 = vector():angles(v119);
        local v124 = v122 * 1.25;
        local v125 = math.clamp(v120 * 0.9, 15, 750);
        local v126 = math.clamp(v121, 0, 1);
        v125 = v125 * helpers.lerp2(v25.GRENADE_SECONDARY_DAMPENING, 1, v126);
        local l_v123_0 = v123;
        for _ = 1, 8 do
            l_v123_0 = (v123 * (l_v123_0 * v125 + v124):length() - v124) / v125;
            l_v123_0:normalize();
        end;
        local v129 = l_v123_0.angles(l_v123_0);
        if v129.x > -10 then
            v129.x = 0.9 * v129.x + 9;
        else
            v129.x = 1.125 * v129.x + 11.25;
        end;
        return v129;
    end, 
    Resolve_angle = function(v130)
        local v131 = entity.get_local_player();
        if v131 == nil then
            return;
        else
            local v132 = v131:get_player_weapon();
            if v132 == nil then
                return;
            else
                local v133 = v132:get_weapon_info();
                if v133 == nil then
                    return;
                else
                    v130.angles = helpers.resolve_grenade_throw(v130.angles, v133.throw_velocity, v132.m_flThrowStrength, v130.velocity);
                    return;
                end;
            end;
        end;
    end, 
    getbinds = function()
        -- upvalues: l_pui_0 (ref)
        local v134 = {};
        local v135 = l_pui_0.get_binds();
        for v136 = 1, #v135 do
            table.insert(v134, 1, v135[v136]);
        end;
        return v134;
    end, 
    get_spectators = function(v137)
        local v138 = {};
        local v139 = v137:get_spectators();
        for _, v141 in pairs(v139) do
            if v141:get_index() ~= v137:get_index() and not v141:is_alive() then
                local v142 = v141:get_player_info();
                table.insert(v138, 1, {
                    id = v142.steamid, 
                    id64 = v142.steamid64, 
                    name = v141:get_name(), 
                    avatar = v141:get_steam_avatar()
                });
            end;
        end;
        return v138;
    end, 
    distance_2d = function(v143, v144)
        return math.sqrt((v144.x - v143.x) ^ 2 + (v144.y - v143.y) ^ 2);
    end, 
    lerp_position = function(v145, v146, v147)
        return vector((v146.x - v145.x) * v147 + v145.x, (v146.y - v145.y) * v147 + v145.y, (v146.z - v145.z) * v147 + v145.z);
    end, 
    get_hitgroup_index = function(_, v149)
        if v149 == 1 then
            return 1;
        elseif v149 == 2 then
            return 8;
        elseif v149 >= 3 and v149 <= 4 then
            return 3;
        elseif v149 >= 5 and v149 <= 7 then
            return 2;
        elseif v149 >= 8 and v149 <= 13 then
            if v149 % 2 == 0 then
                return 6;
            else
                return 7;
            end;
        elseif v149 >= 14 and v149 <= 19 then
            if v149 % 2 == 1 then
                return 4;
            else
                return 5;
            end;
        else
            return 0;
        end;
    end, 
    get_hitgroup_name = function(v150, v151)
        return v150.consts.hitgroup_str[v150:get_hitgroup_index(v151)];
    end, 
    get_damage_multiplier = function(v152, v153)
        local v154 = v152:get_hitgroup_name(v153);
        if v154 == "head" then
            return 4;
        elseif v154 == "stomach" then
            return 1.25;
        elseif v154 == "left leg" or v154 == "right leg" then
            return 0.75;
        else
            return 1;
        end;
    end, 
    get_weighted_damage = function(v155, v156, v157)
        local v158 = v155:get_hitgroup_name(v156);
        if v158 == "head" or v158 == "neck" then
            return v157 * 0.125;
        elseif v158 == "legs" then
            return v157 * 0.25;
        elseif v158 == "chest" then
            return v157 * 0.67;
        elseif v158 == "stomach" then
            return v157;
        else
            return 0;
        end;
    end, 
    get_hbox_radius = function(v159, v160)
        if v160 == nil then
            return 0;
        else
            return v159.consts.hbox_radius[v160] * v159.consts.hbox_factor[v160];
        end;
    end, 
    lp_check = function(_)
        if not globals.is_connected then
            return false;
        elseif not globals.is_in_game then
            return false;
        else
            return true;
        end;
    end, 
    autoscope = function(v162)
        if not v162.variables.lp.m_bIsScoped then
            v162.variables.cmd.in_attack2 = true;
        end;
    end, 
    get_team = function(v163)
        if v163 == 2 then
            return "Terrorist";
        elseif v163 == 3 then
            return "Counter-Terrorist";
        else
            return nil;
        end;
    end, 
    in_air = function()
        -- upvalues: v22 (ref)
        if not entity.get_local_player() == nil then
            return;
        else
            if bit.band(entity.get_local_player().m_fFlags, 1) == 1 then
                v22.ground_ticks = v22.ground_ticks + 1;
            else
                v22.ground_ticks = 0;
                v22.end_time = globals.curtime + 1;
            end;
            return v22.ground_ticks > 1 and v22.end_time > globals.curtime;
        end;
    end
};
local v164 = {
    References = {
        Rage = {
            Exploits = {
                dt = l_pui_0.find("Aimbot", "Ragebot", "Main", "Double Tap"), 
                hs = l_pui_0.find("Aimbot", "Ragebot", "Main", "Hide Shots"), 
                Options = {
                    hsoptions = l_pui_0.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options"), 
                    dtoptions = l_pui_0.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options")
                }
            }, 
            dormant = l_pui_0.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot")
        }, 
        AntiAim = {
            Main = {
                pitch = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Pitch"), 
                yaw = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Yaw"), 
                yawbase = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"), 
                yawoffset = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"), 
                yawmodifier = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"), 
                yawmodofsset = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"), 
                Desync = {
                    bodyyaw = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"), 
                    inverter = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"), 
                    left_limit = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"), 
                    right_limit = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"), 
                    options = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"), 
                    bodyfs = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding")
                }, 
                freestanding = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Freestanding"), 
                disableyaw = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Disable Yaw Modifiers"), 
                bodyfrees = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Body Freestanding")
            }, 
            Other = {
                Enable = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Enabled"), 
                avoidbackstab = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab"), 
                hidden = l_pui_0.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden"), 
                legs = l_pui_0.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"), 
                Fl_enable = l_pui_0.find("Aimbot", "Anti Aim", "Fake Lag", "Enabled"), 
                FL_limit = l_pui_0.find("Aimbot", "Anti Aim", "Fake Lag", "Limit"), 
                Fl_variability = l_pui_0.find("Aimbot", "Anti Aim", "Fake Lag", "Variability")
            }
        }, 
        Misc = {
            fd = l_pui_0.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"), 
            slowwalk = l_pui_0.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"), 
            clantag = l_pui_0.find("Miscellaneous", "Main", "In-Game", "Clan Tag"), 
            ping = l_pui_0.find("Miscellaneous", "Main", "Other", "Fake Latency"), 
            air_strafe = l_pui_0.find("Miscellaneous", "Main", "Movement", "Air Strafe"), 
            bh = l_pui_0.find("Miscellaneous", "Main", "Movement", "Bunny Hop")
        }, 
        Other = {
            remove_scope = l_pui_0.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay")
        }
    }
};
local v165 = {
    ON_GROUND = bit.lshift(1, 0), 
    DUCKING = bit.lshift(1, 1), 
    ANIMDUCKING = bit.lshift(1, 2), 
    WATERJUMP = bit.lshift(1, 3), 
    ON_TRAIN = bit.lshift(1, 4), 
    IN_RAIN = bit.lshift(1, 5), 
    FROZEN = bit.lshift(1, 6), 
    ATCONTROLS = bit.lshift(1, 7), 
    CLIENT = bit.lshift(1, 8), 
    FAKECLIENT = bit.lshift(1, 9), 
    IN_WATER = bit.lshift(1, 10)
};
local v166 = {
    AIM_BLEND_COURCH_IDLE = 16, 
    AIM_BLEND_CROUCH_WALK = 17, 
    DEATH_YAW = 18, 
    MOVE_BLEND_CROUCH = 8, 
    MOVE_YAW = 7, 
    JUMP_FALL = 6, 
    LADDER_SPEED = 5, 
    LADDER_YAW = 4, 
    SPEED = 3, 
    LEAN_YAW = 2, 
    STAND = 1, 
    STRAFE_YAW = 0, 
    AIM_BLEND_STAND_RUN = 15, 
    AIM_BLEND_STAND_WALK = 14, 
    AIM_BLEND_STAND_IDLE = 13, 
    BODY_PITCH = 12, 
    BODY_YAW = 11, 
    MOVE_BLEND_RUN = 10, 
    MOVE_BLEND_WALK = 9
};
local v167 = {
    FLASHED = 9, 
    WHOLE_BODY = 8, 
    WEAPON_ACTION = 7, 
    MOVEMENT_STRAFECHANGE = 6, 
    MOVEMENT_MOVE = 5, 
    MOVEMENT_LAND_OR_CLIMB = 4, 
    MOVEMENT_JUMP_OR_FALL = 3, 
    ADJUST = 2, 
    WEAPON_ACTION_RECROUCH = 1, 
    AIMMATRIX = 0, 
    LEAN = 12, 
    ALIVELOOP = 11, 
    FLINCH = 10
};
local _ = {
    INCOMING = 1, 
    OUTGOING = 0
};
v35.Menu.AntiAim.Tab = v35.Menu.Tabs.Rage.AntiAim.Builder.Main:list("", {
    [1] = "Settings", 
    [2] = "Builder"
});
v35.Menu.AntiAim.States = v35.Menu.Tabs.Rage.AntiAim.Settings.States:list("", v35.AntiAim.States):depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v35.Menu.AntiAim.Tab
});
local v169 = {
    main = v35.Menu.Tabs.Rage.AntiAim.Settings.Breakers:selectable("Animation Breakers", {
        [1] = "Ground", 
        [2] = "Air", 
        [3] = "Other"
    }):depend({
        [1] = nil, 
        [2] = 1, 
        [1] = v35.Menu.AntiAim.Tab
    })
};
v169.ground = v35.Menu.Tabs.Rage.AntiAim.Settings.Breakers:combo("Ground", "Jitter", "MoonWalk"):depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v35.Menu.AntiAim.Tab
}, {
    [1] = nil, 
    [2] = "Ground", 
    [1] = v169.main
});
v169.air = v35.Menu.Tabs.Rage.AntiAim.Settings.Breakers:combo("Air", "Static", "MoonWalk", "Jitter"):depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v35.Menu.AntiAim.Tab
}, {
    [1] = nil, 
    [2] = "Air", 
    [1] = v169.main
});
v169.other = v35.Menu.Tabs.Rage.AntiAim.Settings.Breakers:selectable("Other", "0 Pitch On Land", "Movement Lean", "Kangaroo", "Earth Quake"):depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v35.Menu.AntiAim.Tab
}, {
    [1] = nil, 
    [2] = "Other", 
    [1] = v169.main
});
v35.Menu.AntiAim.freestand = v35.Menu.Tabs.Rage.AntiAim.Settings.Anti_aim_other:switch("Freestanding"):depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v35.Menu.AntiAim.Tab
});
v35.Menu.AntiAim.freestand_create = v35.Menu.AntiAim.freestand:create();
v35.Menu.AntiAim.freestand_options = v35.Menu.AntiAim.freestand_create:selectable("Options", {
    [1] = "Body Freestanding", 
    [2] = "Disable Yaw Modifiers"
}):depend(v35.Menu.AntiAim.freestand);
v35.Menu.AntiAim.Safe_head = v35.Menu.Tabs.Rage.AntiAim.Settings.Anti_aim_other:selectable("Safe Head Weapons", {
    [1] = "C4", 
    [2] = "Knife", 
    [3] = "Zeus", 
    [4] = "Grenade", 
    [5] = "AWP"
}):depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v35.Menu.AntiAim.Tab
});
v35.Menu.AntiAim.Safe_head_create = v35.Menu.AntiAim.Safe_head:create();
v35.Menu.AntiAim.Safe_head_Yaw_Target = v35.Menu.AntiAim.Safe_head_create:combo("Yaw Target", {
    [1] = "Local View", 
    [2] = "At Target"
}):depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v35.Menu.AntiAim.Tab
});
v35.Menu.AntiAim.Safe_head_Yaw_Add = v35.Menu.AntiAim.Safe_head_create:slider("Yaw Add", -180, 180, 15, 1, function(v170)
    if v170 == 15 then
        return "Default";
    elseif v170 == 0 then
        return "Zero";
    else
        return;
    end;
end):depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v35.Menu.AntiAim.Tab
});
v35.Menu.AntiAim.createAntiAimBuilder = function(v171, v172)
    -- upvalues: v35 (ref), v164 (ref)
    local v173 = {};
    local v174 = {
        [1] = nil, 
        [2] = 2, 
        [1] = v35.Menu.AntiAim.Tab
    };
    local v175 = {
        [1] = v35.Menu.AntiAim.States, 
        [2] = v171
    };
    local v176 = {
        [1] = v35.Menu.AntiAim.States, 
        [2] = function()
            -- upvalues: v171 (ref)
            return v171 ~= 1;
        end
    };
    v173.override = v35.Menu.Tabs.Rage.AntiAim.Builder.Normal:switch(v172 .. " Override"):depend(v174, v176, v175);
    local v177 = {
        [1] = v173.override, 
        [2] = function()
            -- upvalues: v171 (ref), v173 (ref)
            return v171 == 1 or v173.override:get();
        end
    };
    v173.Pitch = v35.Menu.Tabs.Rage.AntiAim.Builder.Yaw:combo(v172 .. " Pitch", v164.References.AntiAim.Main.pitch:list()):depend(v174, v177, v175);
    v173.Yaw_Check = v35.Menu.Tabs.Rage.AntiAim.Builder.Yaw:switch(v172 .. " Enable Yaw"):depend(v174, v177, v175);
    v173.Yaw_Type = v35.Menu.Tabs.Rage.AntiAim.Builder.Yaw:combo("Yaw Type", {
        [1] = "Static", 
        [2] = "Left&Right", 
        [3] = "Spin"
    }):depend(v174, v175, v177, v173.Yaw_Check);
    local v178 = {
        [1] = v173.Yaw_Type, 
        [2] = function()
            -- upvalues: v173 (ref)
            return v173.Yaw_Type:get() == "Left&Right";
        end
    };
    local v179 = {
        [1] = v173.Yaw_Type, 
        [2] = function()
            -- upvalues: v173 (ref)
            return v173.Yaw_Type:get() == "Static";
        end
    };
    local v180 = {
        [1] = v173.Yaw_Type, 
        [2] = function()
            -- upvalues: v173 (ref)
            return v173.Yaw_Type:get() == "Spin";
        end
    };
    v173.Yaw_create = v173.Yaw_Type:create();
    v173.Yaw_base = v173.Yaw_create:combo("Yaw Base", {
        [1] = "Local View", 
        [2] = "At Target"
    }):depend(v173.Yaw_Check);
    v173.Yaw_Static = v173.Yaw_create:slider("Add Yaw", -180, 180, 0, 1, "\194\176"):depend(v173.Yaw_Check, v179);
    v173.Yaw_L = v173.Yaw_create:slider("Yaw Left", -180, 180, 0, 1, "\194\176"):depend(v173.Yaw_Check, v178);
    v173.Yaw_R = v173.Yaw_create:slider("Yaw Right", -180, 180, 0, 1, "\194\176"):depend(v173.Yaw_Check, v178);
    v173.Spin_range = v173.Yaw_create:slider("Spin Range", -360, 360, 1, "\194\176"):depend(v173.Yaw_Check, v180);
    v173.Spin_speed = v173.Yaw_create:slider("Spin Speed", -180, 180, 0, 1, ""):depend(v173.Yaw_Check, v180);
    v173.Yaw_Delay = v173.Yaw_create:slider("Yaw Delay", 0, 64, 1, 1, " t"):depend(v173.Yaw_Check, v178);
    v173.Yaw_Modifier_type = v173.Yaw_create:combo("Yaw Modifier Type", v164.References.AntiAim.Main.yawmodifier:list()):depend(v173.Yaw_Check);
    local v181 = {
        [1] = v173.Yaw_Modifier_type, 
        [2] = function()
            -- upvalues: v173 (ref)
            return v173.Yaw_Modifier_type:get() ~= "Disabled";
        end
    };
    v173.Yaw_Modifier_offset = v173.Yaw_create:slider("Yaw Modifier Offset", -180, 180, 1, 1, ""):depend(v173.Yaw_Check, v181);
    v173.desync_check = v35.Menu.Tabs.Rage.AntiAim.Builder.Desync:switch(v172 .. " Enable Desync"):depend(v177, v175, v174);
    v173.desync_create = v173.desync_check:create();
    local l_desync_check_0 = v173.desync_check;
    v173.desync_options = v173.desync_create:selectable("Desync Options", v164.References.AntiAim.Main.Desync.options:list()):depend(l_desync_check_0);
    v173.desync_peek = v173.desync_create:combo("Desync Peek", v164.References.AntiAim.Main.Desync.bodyfs:list()):depend(l_desync_check_0);
    v173.desync_type = v173.desync_create:combo("Desync Type", {
        [1] = "Static", 
        [2] = "Left&Right"
    }):depend(l_desync_check_0);
    v173.desync_mode = v173.desync_create:selectable("Desync Manipulations", {
        [1] = "Sway", 
        [2] = "Random"
    }):depend(l_desync_check_0);
    local v183 = {
        [1] = v173.desync_type, 
        [2] = function()
            -- upvalues: v173 (ref)
            return v173.desync_type:get() == "Static";
        end
    };
    local v184 = {
        [1] = v173.desync_type, 
        [2] = function()
            -- upvalues: v173 (ref)
            return v173.desync_type:get() == "Left&Right";
        end
    };
    v173.Desync_amount = v173.desync_create:slider("Desync Amount", -60, 60, 0, 1, function(v185)
        if v185 == 0 then
            return "Off";
        elseif v185 == 60 then
            return "Max";
        elseif v185 == -60 then
            return "Max";
        else
            return;
        end;
    end):depend(l_desync_check_0, v183);
    v173.Desync_L = v173.desync_create:slider("Right side Desync", 0, 60, 0, 1, function(v186)
        if v186 == 0 then
            return "Off";
        elseif v186 == 60 then
            return "Max";
        else
            return;
        end;
    end):depend(l_desync_check_0, v184);
    v173.Desync_R = v173.desync_create:slider("Left side Desync", 0, 60, 0, 1, function(v187)
        if v187 == 0 then
            return "Off";
        elseif v187 == 60 then
            return "Max";
        else
            return;
        end;
    end):depend(l_desync_check_0, v184);
    v173.Desync_sway_speed = v173.desync_create:slider("Sway Speed", 0, 100, 0, 1):depend(l_desync_check_0, {
        [1] = nil, 
        [2] = "Sway", 
        [1] = v173.desync_mode
    });
    v173.Desync_random_min = v173.desync_create:slider("Min Random", 0, 60, 0, 1):depend(l_desync_check_0, {
        [1] = nil, 
        [2] = "Random", 
        [1] = v173.desync_mode
    });
    v173.Desync_random_max = v173.desync_create:slider("Max Random", 0, 60, 0, 1):depend(l_desync_check_0, {
        [1] = nil, 
        [2] = "Random", 
        [1] = v173.desync_mode
    });
    v173.fl_types = v35.Menu.Tabs.Rage.AntiAim.Builder.Desync:combo("Fake Lag Types", {
        [1] = "Static", 
        [2] = "Jitter", 
        [3] = "Random", 
        [4] = "Dynamic"
    }):depend(v177, v175, v174);
    v173.fl_types_jitter1 = v35.Menu.Tabs.Rage.AntiAim.Builder.Desync:slider("Jitter 1", 1, 14, 0, 1):depend(v177, {
        [1] = nil, 
        [2] = "Jitter", 
        [1] = v173.fl_types, 
        [3] = v175
    }, v174);
    v173.fl_types_jitter2 = v35.Menu.Tabs.Rage.AntiAim.Builder.Desync:slider("Jitter 2", 1, 14, 0, 1):depend(v177, {
        [1] = nil, 
        [2] = "Jitter", 
        [1] = v173.fl_types
    }, v175, v174);
    v173.fl_types_random_min = v35.Menu.Tabs.Rage.AntiAim.Builder.Desync:slider("Random Min", 1, 14, 0, 1):depend(v177, {
        [1] = nil, 
        [2] = "Random", 
        [1] = v173.fl_types
    }, v175, v174);
    v173.fl_types_random_max = v35.Menu.Tabs.Rage.AntiAim.Builder.Desync:slider("Random Max", 1, 14, 0, 1):depend(v177, {
        [1] = nil, 
        [2] = "Random", 
        [1] = v173.fl_types, 
        [3] = v175
    }, v174);
    v173.fl_Limit = v35.Menu.Tabs.Rage.AntiAim.Builder.Desync:slider("Fake Lag limit", 0, 14, 0, 1):depend(v177, v175, v174);
    v173.fl_variability = v35.Menu.Tabs.Rage.AntiAim.Builder.Desync:slider("Fake Lag Varability", 0, 100, 0, 1, "%"):depend(v177, v175, v174);
    v173.defensive_enable = v35.Menu.Tabs.Rage.AntiAim.Builder.Defensive.Defensive:switch(v172 .. " Enable"):depend(v177, v175, v174);
    v173.defensive_logic = v35.Menu.Tabs.Rage.AntiAim.Builder.Defensive.Defensive:combo("Logic Mode", {
        [1] = "Old", 
        [2] = "New", 
        [3] = "Combined"
    }):depend(v177, {
        [1] = nil, 
        [2] = true, 
        [1] = v173.defensive_enable
    }, v175, v174);
    v173.defensive_activation_type = v35.Menu.Tabs.Rage.AntiAim.Builder.Defensive.Defensive:combo("Activation Type", {
        [1] = "Default", 
        [2] = "Hide Shots"
    }):depend(v177, {
        [1] = nil, 
        [2] = true, 
        [1] = v173.defensive_enable
    }, v175, v174);
    local v188 = {
        [1] = v173.defensive_logic, 
        [2] = function()
            -- upvalues: v173 (ref)
            return v173.defensive_logic:get() ~= "New";
        end
    };
    local v189 = {
        [1] = v173.defensive_logic, 
        [2] = function()
            -- upvalues: v173 (ref)
            return v173.defensive_logic:get() ~= "Old";
        end
    };
    v173.defensive_delay = v35.Menu.Tabs.Rage.AntiAim.Builder.Defensive.Defensive:slider("Delay", 0, 12, 1, 1):depend(v177, {
        [1] = nil, 
        [2] = true, 
        [1] = v173.defensive_enable
    }, v175, v174, v188);
    v173.durability = v35.Menu.Tabs.Rage.AntiAim.Builder.Defensive.Defensive:slider("Dubrability", 1, 13, 1, 1, "t"):depend(v177, {
        [1] = nil, 
        [2] = true, 
        [1] = v173.defensive_enable
    }, v175, v174, v189);
    v173.defensive_pitch = v35.Menu.Tabs.Rage.AntiAim.Builder.Defensive.Defensive:combo("Pitch", {
        [1] = "Up", 
        [2] = "Down", 
        [3] = "Random", 
        [4] = "Switch", 
        [5] = "Custom"
    }):depend(v177, {
        [1] = nil, 
        [2] = true, 
        [1] = v173.defensive_enable
    }, v175, v174);
    v173.defensive_pitch_Create = v173.defensive_pitch:create();
    v173.defensive_pitch_random_min = v173.defensive_pitch_Create:slider("Min Random", -89, 89, 0, 1):depend({
        [1] = nil, 
        [2] = "Random", 
        [1] = v173.defensive_pitch
    });
    v173.defensive_pitch_random_max = v173.defensive_pitch_Create:slider("Max Random", -89, 89, 0, 1):depend({
        [1] = nil, 
        [2] = "Random", 
        [1] = v173.defensive_pitch
    });
    v173.defensive_pitch_switch_1 = v173.defensive_pitch_Create:slider("Switch 1", -89, 89, 0, 1):depend({
        [1] = nil, 
        [2] = "Switch", 
        [1] = v173.defensive_pitch
    });
    v173.defensive_pitch_switch_2 = v173.defensive_pitch_Create:slider("Switch 2", -89, 89, 0, 1):depend({
        [1] = nil, 
        [2] = "Switch", 
        [1] = v173.defensive_pitch
    });
    v173.defensive_pitch_custom = v173.defensive_pitch_Create:slider("Custom Offset", -89, 89, 0, 1):depend({
        [1] = nil, 
        [2] = "Custom", 
        [1] = v173.defensive_pitch
    });
    v173.defensive_yaw = v35.Menu.Tabs.Rage.AntiAim.Builder.Defensive.Defensive:combo("Yaw", {
        [1] = "Spin", 
        [2] = "Random", 
        [3] = "Switch", 
        [4] = "Custom", 
        [5] = "Jitter"
    }):depend(v177, {
        [1] = nil, 
        [2] = true, 
        [1] = v173.defensive_enable
    }, v175, v174);
    v173.defensive_yaw_create = v173.defensive_yaw:create();
    v173.defensive_yaw_spin_Range = v173.defensive_yaw_create:slider("Spin Range", -360, 360, 0, 1):depend({
        [1] = nil, 
        [2] = "Spin", 
        [1] = v173.defensive_yaw
    });
    v173.defensive_yaw_spin_Speed = v173.defensive_yaw_create:slider("Spin Speed", -180, 180, 0, 1):depend({
        [1] = nil, 
        [2] = "Spin", 
        [1] = v173.defensive_yaw
    });
    v173.defensive_yaw_random_min = v173.defensive_yaw_create:slider("Min Random", -180, 180, 0, 1):depend({
        [1] = nil, 
        [2] = "Random", 
        [1] = v173.defensive_yaw
    });
    v173.defensive_yaw_random_max = v173.defensive_yaw_create:slider("Max Random", -180, 180, 0, 1):depend({
        [1] = nil, 
        [2] = "Random", 
        [1] = v173.defensive_yaw
    });
    v173.defensive_yaw_switch_1 = v173.defensive_yaw_create:slider("Switch 1", -180, 180, 0, 1):depend({
        [1] = nil, 
        [2] = "Switch", 
        [1] = v173.defensive_yaw
    });
    v173.defensive_yaw_switch_2 = v173.defensive_yaw_create:slider("Switch 2", -180, 180, 0, 1):depend({
        [1] = nil, 
        [2] = "Switch", 
        [1] = v173.defensive_yaw
    });
    v173.defensive_yaw_jitter_1 = v173.defensive_yaw_create:slider("Jitter 1", -180, 180, 0, 1):depend({
        [1] = nil, 
        [2] = "Jitter", 
        [1] = v173.defensive_yaw
    });
    v173.defensive_yaw_jitter_2 = v173.defensive_yaw_create:slider("Jitter 2", -180, 180, 0, 1):depend({
        [1] = nil, 
        [2] = "Jitter", 
        [1] = v173.defensive_yaw
    });
    v173.defensive_yaw_jitter_delay = v173.defensive_yaw_create:slider("Jitter Delay", 0, 64, 0, 1):depend({
        [1] = nil, 
        [2] = "Jitter", 
        [1] = v173.defensive_yaw
    });
    v173.defensive_yaw_custom = v173.defensive_yaw_create:slider("Custom Offset", -180, 180, 0, 1):depend({
        [1] = nil, 
        [2] = "Custom", 
        [1] = v173.defensive_yaw
    });
    return v173;
end;
for v190, v191 in ipairs(v35.AntiAim.States) do
    v35.Menu.Builder[v190] = v35.Menu.AntiAim.createAntiAimBuilder(v190, v191);
end;
v35.Functions.AntiAim.get_state = function()
    -- upvalues: v165 (ref), v164 (ref), v35 (ref), v22 (ref)
    local v192 = entity.get_local_player();
    if not v192 then
        return nil;
    else
        local l_m_fFlags_0 = v192.m_fFlags;
        local v194 = bit.band(l_m_fFlags_0, v165.ON_GROUND) ~= 0;
        local v195 = math.sqrt(v192.m_vecVelocity.x ^ 2 + v192.m_vecVelocity.y ^ 2);
        local v196 = v192.m_flDuckAmount > 0.7 or v164.References.Misc.fd:get();
        local v197 = v164.References.Misc.slowwalk:get();
        local v198 = not v194;
        local v199 = bit.band(v192.m_fFlags, 1) == 1;
        local _ = v194 and v195 > 10 and not v197;
        local _ = v194 and v195 < 10 and not v196;
        local _ = v35.Menu.Builder;
        if v164.References.AntiAim.Main.freestanding:get() and v35.Menu.Builder[10].override:get() then
            v22.st = 10;
        elseif not v164.References.Rage.Exploits.hs:get() and not v164.References.Rage.Exploits.dt:get() and v35.Menu.Builder[9].override:get() then
            v22.st = 9;
        elseif v198 and v196 and v35.Menu.Builder[8].override:get() then
            v22.st = 8;
        elseif v196 and v195 < 10 and v35.Menu.Builder[7].override:get() then
            v22.st = 7;
        elseif v198 and v35.Menu.Builder[6].override:get() then
            v22.st = 6;
        elseif v196 and v195 and v35.Menu.Builder[5].override:get() then
            v22.st = 5;
        elseif v199 and v195 > 10 and not v197 and v35.Menu.Builder[4].override:get() then
            v22.st = 4;
        elseif v165.ON_GROUND and v197 and v35.Menu.Builder[3].override:get() then
            v22.st = 3;
        elseif v199 and v35.Menu.Builder[2].override:get() then
            v22.st = 2;
        else
            v22.st = 1;
        end;
        return v22.st;
    end;
end;
local function v204(v203)
    rage.antiaim:override_hidden_pitch(v203);
end;
local function v206(v205)
    rage.antiaim:override_hidden_yaw_offset(v205);
end;
local v207 = v164.References.Rage.Exploits.Options.hsoptions:get();
v35.Functions.AntiAim.builder = function()
    -- upvalues: v164 (ref), v35 (ref), v22 (ref), v207 (ref), v204 (ref), v206 (ref)
    local v208 = {
        [1] = v164.References.AntiAim.Main.yawoffset, 
        [2] = v164.References.AntiAim.Main.pitch, 
        [3] = v164.References.AntiAim.Main.yawbase, 
        [4] = v164.References.AntiAim.Main.yaw, 
        [5] = v164.References.AntiAim.Main.yawmodifier, 
        [6] = v164.References.AntiAim.Main.yawmodofsset, 
        [7] = v164.References.AntiAim.Main.Desync.bodyyaw, 
        [8] = v164.References.AntiAim.Main.Desync.inverter, 
        [9] = v164.References.AntiAim.Main.Desync.left_limit
    };
    for _, v210 in ipairs(v208) do
        v210:disabled(true);
    end;
    local v211 = entity.get_local_player();
    if not v211 then
        return;
    elseif not v211:get_player_weapon() then
        return;
    else
        local v212 = v35.Functions.AntiAim.get_state();
        local l_m_iTeamNum_0 = v211.m_iTeamNum;
        local _ = helpers.get_team(l_m_iTeamNum_0);
        local _ = v35.Menu.Builder[v212];
        v164.References.AntiAim.Main.pitch:override(v35.Menu.Builder[v212].Pitch:get());
        v164.References.AntiAim.Main.yaw:override("Backward");
        local v216 = v211:get_player_weapon();
        if v216 == nil then
            return;
        else
            local v217 = v216:get_classname();
            local v218 = false;
            v164.References.AntiAim.Main.freestanding:override(v35.Menu.AntiAim.freestand:get());
            v164.References.AntiAim.Main.bodyfrees:override(v35.Menu.AntiAim.freestand_options:get("Body Freestanding"));
            v164.References.AntiAim.Main.disableyaw:override(v35.Menu.AntiAim.freestand_options:get("Disable Yaw Modifiers"));
            if v35.Menu.AntiAim.Safe_head:get("C4") and string.match(v217, "CC4") then
                v218 = true;
            end;
            if v35.Menu.AntiAim.Safe_head:get("Knife") and string.match(v217, "Knife") then
                v218 = true;
            end;
            if v35.Menu.AntiAim.Safe_head:get("Zeus") and string.match(v217, "Taser") then
                v218 = true;
            end;
            if v35.Menu.AntiAim.Safe_head:get("Zeus") and string.match(v217, "Grenade") then
                v218 = true;
            end;
            if v35.Menu.AntiAim.Safe_head:get("AWP") and string.match(v217, "CWeaponAWP") then
                v218 = true;
            end;
            if v218 == true then
                v164.References.AntiAim.Main.yawmodofsset:set(0);
                v164.References.AntiAim.Main.disableyaw:set(true);
                v164.References.AntiAim.Main.bodyfrees:set(true);
                v164.References.AntiAim.Main.Desync.options:set("");
                v164.References.AntiAim.Main.Desync.inverter:set(false);
                v164.References.AntiAim.Main.yawoffset:set(v35.Menu.AntiAim.Safe_head_Yaw_Add:get());
                v164.References.AntiAim.Other.hidden:set(false);
                v164.References.AntiAim.Main.Desync.bodyyaw:set(false);
                v35.AntiAim.data.Allow_defensive = false;
                v164.References.AntiAim.Main.yawmodifier:set("Disabled");
                v164.References.AntiAim.Main.yawbase:set(v35.Menu.AntiAim.Safe_head_Yaw_Target:get());
            else
                v35.AntiAim.data.Allow_defensive = true;
            end;
            if not v218 then
                if v35.Menu.Builder[v212].Yaw_Check:get() then
                    v164.References.AntiAim.Main.yawbase:override(v35.Menu.Builder[v212].Yaw_base:get());
                    if v35.Menu.Builder[v212].Yaw_Type:get() == "Static" then
                        v164.References.AntiAim.Main.yawoffset:override(v35.Menu.Builder[v212].Yaw_Static:get());
                    elseif v35.Menu.Builder[v212].Yaw_Type:get() == "Left&Right" then
                        local v219 = false;
                        local v220 = v35.Menu.Builder[v212].Yaw_Delay:get();
                        if globals.tickcount % (8 + v220) > 2 + v220 / 2 then
                            v219 = not v219;
                        end;
                        rage.antiaim:inverter(v219);
                        v164.References.AntiAim.Main.yawoffset:override(rage.antiaim:inverter() and v35.Menu.Builder[v212].Yaw_L:get() or v35.Menu.Builder[v212].Yaw_R:get());
                    elseif v35.Menu.Builder[v212].Yaw_Type:get() == "Spin" then
                        v164.References.AntiAim.Main.yawoffset:override(-math.fmod(globals.curtime * v35.Menu.Builder[v212].Spin_range:get() * 10, v35.Menu.Builder[v212].Spin_speed:get()));
                    end;
                    v164.References.AntiAim.Main.yawmodifier:override(v35.Menu.Builder[v212].Yaw_Modifier_type:get());
                    v164.References.AntiAim.Main.yawmodofsset:override(v35.Menu.Builder[v212].Yaw_Modifier_offset:get());
                end;
                v164.References.AntiAim.Main.Desync.bodyyaw:override(v35.Menu.Builder[v212].desync_check:get());
                if v35.Menu.Builder[v212].desync_check:get() then
                    local v221 = 0;
                    v164.References.AntiAim.Main.Desync.bodyyaw:override(v35.Menu.Builder[v212].desync_check:get());
                    v164.References.AntiAim.Main.Desync.options:override(v35.Menu.Builder[v212].desync_options:get());
                    v164.References.AntiAim.Main.Desync.bodyfs:override(v35.Menu.Builder[v212].desync_peek:get());
                    if v35.Menu.Builder[v212].desync_mode:get("Sway") then
                        local v222 = v35.Menu.Builder[v212].Desync_sway_speed:get();
                        local v223 = v35.Menu.Builder[v212].Desync_amount:get();
                        local v224 = v35.Menu.Builder[v212].Desync_amount:get();
                        local v225 = math.sin(globals.curtime * v222) * (v223 + v224) / 2;
                        if v224 or v223 < 0 then
                            v164.References.AntiAim.Main.Desync.inverter:override(true);
                        end;
                        if v225 > 60 then
                            v225 = v164.References.AntiAim.Main.Desync.inverter:get() and v223 or v224;
                        end;
                        v221 = v225;
                    end;
                    if v35.Menu.Builder[v212].desync_mode:get("Random") then
                        v221 = math.random(v35.Menu.Builder[v212].Desync_random_min:get(), v35.Menu.Builder[v212].Desync_random_max:get());
                    end;
                    if v35.Menu.Builder[v212].desync_type:get() == "Static" then
                        if v35.Menu.Builder[v212].Desync_amount:get() < 0 then
                            v164.References.AntiAim.Main.Desync.inverter:override(true);
                        else
                            v164.References.AntiAim.Main.Desync.inverter:override(false);
                        end;
                        v164.References.AntiAim.Main.Desync.left_limit:override(v35.Menu.Builder[v212].Desync_amount:get() - v221);
                        v164.References.AntiAim.Main.Desync.right_limit:override(v35.Menu.Builder[v212].Desync_amount:get() - v221);
                    elseif v35.Menu.Builder[v212].desync_type:get() == "Left&Right" then
                        v164.References.AntiAim.Main.Desync.left_limit:override(v35.Menu.Builder[v212].Desync_L:get() - v221);
                        v164.References.AntiAim.Main.Desync.right_limit:override(v35.Menu.Builder[v212].Desync_R:get() - v221);
                    end;
                end;
                v164.References.AntiAim.Other.Fl_enable:override(true);
                if v35.Menu.Builder[v212].fl_types:get() == "Static" then
                    v164.References.AntiAim.Other.FL_limit:override(v35.Menu.Builder[v212].fl_Limit:get());
                elseif v35.Menu.Builder[v212].fl_types:get() == "Jitter" then
                    if globals.tickcount % 3 == 0 then
                        v164.References.AntiAim.Other.FL_limit:override(v35.Menu.Builder[v212].fl_types_jitter1:get());
                    elseif globals.tickcount % 3 == 1 then
                        v164.References.AntiAim.Other.FL_limit:override(v35.Menu.Builder[v212].fl_types_jitter2:get());
                    end;
                elseif v35.Menu.Builder[v212].fl_types:get() == "Random" then
                    v164.References.AntiAim.Other.FL_limit:override(v35.Menu.Builder[v212].fl_Limit:get() - math.random(v35.Menu.Builder[v212].fl_types_random_min:get(), v35.Menu.Builder[v212].fl_types_random_max:get()));
                elseif v35.Menu.Builder[v212].fl_types:get() == "Dynamic" then
                    local v226 = v35.Menu.Builder[v212].fl_Limit:get();
                    if v164.References.Rage.Exploits.dt:get() then
                        v226 = 1;
                    end;
                    if v164.References.Rage.Exploits.hs:get() then
                        v226 = 1;
                    end;
                    v164.References.AntiAim.Other.FL_limit:override(v226);
                end;
                v164.References.AntiAim.Other.Fl_variability:override(v35.Menu.Builder[v212].fl_variability:get());
                v164.References.AntiAim.Other.hidden:override(v35.Menu.Builder[v212].defensive_enable:get());
                local l_m_nTickBase_0 = v211.m_nTickBase;
                local v228 = v35.Menu.Builder[v212].durability:get();
                if math.abs(l_m_nTickBase_0 - v22.max_tickbase) > 64 then
                    v22.max_tickbase = 0;
                end;
                local v229 = 0;
                if v22.max_tickbase < l_m_nTickBase_0 then
                    v22.max_tickbase = l_m_nTickBase_0;
                elseif l_m_nTickBase_0 < v22.max_tickbase then
                    v229 = math.min(14, math.max(0, v22.max_tickbase - l_m_nTickBase_0 - 1));
                end;
                local v230 = v35.Menu.Builder[v212];
                local v231 = rage.exploit:get();
                local v232 = v230.defensive_delay:get();
                if v230.defensive_activation_type:get() == "Hide Shots" then
                    v164.References.Rage.Exploits.Options.hsoptions:override("Break LC");
                else
                    v164.References.Rage.Exploits.Options.hsoptions:override(v207);
                end;
                if v230.defensive_enable:get() and v231 ~= 0 then
                    local v233 = v230.defensive_logic:get();
                    local v234 = true;
                    if v233 == "Old" then
                        v234 = globals.tickcount % v232 == 0;
                    elseif v233 == "New" then
                        v234 = 13 - v228 < v229 and v231 == 1;
                    elseif v233 == "Combined" then
                        v234 = 13 - v228 < v229 and v231 == 1 and globals.tickcount % v232 == 0;
                    end;
                    if v234 then
                        local v235 = 0;
                        local v236 = 0;
                        local v237 = v230.defensive_pitch:get();
                        if v237 == "Up" then
                            v235 = -89;
                        elseif v237 == "Down" then
                            v235 = 89;
                        elseif v237 == "Random" then
                            v235 = math.floor(math.random(v230.defensive_pitch_random_min:get(), v230.defensive_pitch_random_max:get()));
                        elseif v237 == "Switch" then
                            local v238 = 2;
                            local v239 = globals.tickcount % (8 + v238) > 2 + v238 / 2;
                            rage.antiaim:inverter(v239);
                            v235 = rage.antiaim:inverter() and v230.defensive_pitch_switch_1:get() or v230.defensive_pitch_switch_2:get();
                        elseif v237 == "Custom" then
                            v235 = v230.defensive_pitch_custom:get();
                        end;
                        local v240 = v230.defensive_yaw:get();
                        if v240 == "Spin" then
                            local v241 = v230.defensive_yaw_spin_Speed:get();
                            local v242 = v230.defensive_yaw_spin_Range:get();
                            v236 = globals.curtime * v241 * 10 % v242;
                        elseif v240 == "Random" then
                            v236 = math.floor(math.random(v230.defensive_yaw_random_min:get(), v230.defensive_yaw_random_max:get()));
                        elseif v240 == "Switch" then
                            local v243 = 2;
                            local v244 = globals.tickcount % (8 + v243) > 2 + v243 / 2;
                            rage.antiaim:inverter(v244);
                            v236 = rage.antiaim:inverter() and v230.defensive_yaw_switch_1:get() or v230.defensive_yaw_switch_2:get();
                        elseif v240 == "Custom" then
                            v236 = v230.defensive_yaw_custom:get();
                        elseif v240 == "Jitter" then
                            local v245 = v230.defensive_yaw_jitter_delay:get();
                            local v246 = globals.tickcount % (8 + v245) > 2 + v245 / 2;
                            rage.antiaim:inverter(v246);
                            v236 = rage.antiaim:inverter() and v230.defensive_yaw_jitter_1:get() or v230.defensive_yaw_jitter_2:get();
                        end;
                        v204(v235);
                        v206(v236);
                    else
                        rage.antiaim:override_hidden_yaw_offset(0);
                    end;
                end;
            end;
            return;
        end;
    end;
end;
v35.Functions.AntiAim.breakers = function(v247)
    -- upvalues: v165 (ref), l_ffi_0 (ref), v169 (ref), v166 (ref), v164 (ref), v167 (ref)
    local v248 = entity.get_local_player();
    if v248 == nil then
        return;
    else
        local v249 = math.sqrt(v248.m_vecVelocity.x ^ 2 + v248.m_vecVelocity.y ^ 2);
        local v250 = bit.band(v248.m_fFlags, 1) == 0 or not v165.ON_GROUND;
        local v251 = bit.band(v248.m_fFlags, 1) == 1;
        local _ = 1;
        local _ = 0;
        local v254 = l_ffi_0.cast("animlayer_t**", l_ffi_0.cast("uintptr_t", v248[0]) + 10640)[0];
        if not v254 then
            return;
        else
            if v169.main:get(1) and v251 then
                if v169.ground:get() == "Jitter" then
                    v248.m_flPoseParameter[v166.STRAFE_YAW] = globals.tickcount % 4 > 1 and 0.5 or 1;
                    v164.References.AntiAim.Other.legs:override("Sliding");
                end;
                if v169.ground:get() == "MoonWalk" then
                    v248.m_flPoseParameter[v166.MOVE_YAW] = 0;
                    v164.References.AntiAim.Other.legs:override("Walking");
                end;
            end;
            if v169.main:get(2) and v250 then
                if v169.air:get() == "Static" then
                    v248.m_flPoseParameter[v166.JUMP_FALL] = 1;
                end;
                if v169.air:get() == "MoonWalk" then
                    v254[v167.MOVEMENT_STRAFECHANGE].m_flWeight = 1;
                    v254[v167.MOVEMENT_STRAFECHANGE].m_flCycle = globals.curtime * 0.55 % 1;
                end;
                if v169.air:get() == "Jitter" then
                    v248.m_flPoseParameter[v166.JUMP_FALL] = math.random(0, 1);
                    v248.m_flPoseParameter[v166.MOVE_YAW] = math.random(0, 1);
                    v248.m_flPoseParameter[v166.SPEED] = math.random(0, 1);
                end;
            end;
            if v169.main:get(3) then
                if v169.other:get(1) and helpers.in_air() then
                    v248.m_flPoseParameter[v166.BODY_PITCH] = 0.5;
                end;
                if v169.other:get(2) and v249 > 10 then
                    v254[v167.LEAN].m_flWeight = 100;
                end;
                if v169.other:get(3) then
                    v248.m_flPoseParameter[v166.MOVE_BLEND_RUN] = math.random(0, 10) / 10;
                    v248.m_flPoseParameter[v166.JUMP_FALL] = math.random(0, 10) / 10;
                    v248.m_flPoseParameter[v166.MOVE_BLEND_WALK] = math.random(0, 10) / 10;
                end;
                if v169.other:get(4) then
                    v254[v167.LEAN].m_flWeight = utils.random_float(0.1, 1);
                    v247.animate_move_lean = true;
                else
                    v247.animate_move_lean = false;
                end;
            end;
            return;
        end;
    end;
end;
v35.Functions.Misc.view_model = function()
    -- upvalues: v35 (ref)
    cvar.viewmodel_fov:int(v35.Menu.Misc.view_model_fov:get(), true);
    cvar.viewmodel_offset_x:float(v35.Menu.Misc.view_model_x:get(), true);
    cvar.viewmodel_offset_y:float(v35.Menu.Misc.view_model_y:get(), true);
    cvar.viewmodel_offset_z:float(v35.Menu.Misc.view_model_z:get(), true);
end;
v35.Functions.Visuals.custom_scope = function()
    -- upvalues: v35 (ref)
    if not v35.Menu.Visuals.customscope:get() then
        return;
    elseif not globals.is_in_game then
        return;
    else
        local v255 = render.screen_size() / 2;
        local l_x_0 = v255.x;
        local l_y_0 = v255.y;
        local l_m_bIsScoped_0 = entity.get_local_player().m_bIsScoped;
        local _ = math.floor(v35.Menu.Visuals.customscope_Color:get().r * 120);
        local _ = math.floor(v35.Menu.Visuals.customscope_Color:get().g * 120);
        local _ = math.floor(v35.Menu.Visuals.customscope_Color:get().b * 120);
        local v262 = v35.Menu.Visuals.customscope_Color:get();
        local v263 = color(v262.r, v262.g, v262.b, 1);
        local v266 = (function(v264, v265)
            -- upvalues: v35 (ref)
            if not v35.Menu.Visuals.customscope_invert:get() then
                return v265;
            else
                return v264;
            end;
        end)(v262, v263);
        local v269 = (function(v267, v268)
            -- upvalues: v35 (ref)
            if not v35.Menu.Visuals.customscope_invert:get() then
                return v267;
            else
                return v268;
            end;
        end)(v262, v263);
        if l_m_bIsScoped_0 then
            render.gradient(vector(l_x_0, l_y_0 + (v35.Menu.Visuals.customscope_Gap:get() - 1) + 1), vector(l_x_0 + 1, l_y_0 + v35.Menu.Visuals.customscope_Lenght:get() + (v35.Menu.Visuals.customscope_Gap:get() - 1) + 1), v269, v269, v266, v266);
            render.gradient(vector(l_x_0 + 1 + v35.Menu.Visuals.customscope_Lenght:get() + (v35.Menu.Visuals.customscope_Gap:get() - 1), l_y_0), vector(l_x_0 + 1 + (v35.Menu.Visuals.customscope_Gap:get() - 1), l_y_0 + 1), v266, v269, v266, v269);
            render.gradient(vector(l_x_0, l_y_0 - (v35.Menu.Visuals.customscope_Gap:get() - 1) - v35.Menu.Visuals.customscope_Lenght:get()), vector(l_x_0 + 1, l_y_0 - (v35.Menu.Visuals.customscope_Gap:get() - 1)), v266, v266, v269, v269);
            render.gradient(vector(l_x_0 - v35.Menu.Visuals.customscope_Lenght:get() - (v35.Menu.Visuals.customscope_Gap:get() - 1), l_y_0), vector(l_x_0 - (v35.Menu.Visuals.customscope_Gap:get() - 1), l_y_0 + 1), v266, v269, v266, v269);
        end;
        return;
    end;
end;
v35.Functions.Misc.Clantag = function()
    -- upvalues: v35 (ref)
    if v35.Menu.Misc.clantag:get() then
        if v35.Menu.Misc.clantag_types:get() == "Atlantic" then
            helpers.animated_clantag(3, {
                [1] = " ", 
                [2] = "A", 
                [3] = "At", 
                [4] = "Atl", 
                [5] = "Atla", 
                [6] = "Atlan", 
                [7] = "Atlant", 
                [8] = "Atlanti", 
                [9] = "Atlantic", 
                [10] = " Atlantic", 
                [11] = "  Atlantic", 
                [12] = "   Atlantic", 
                [13] = "    Atlantic", 
                [14] = "     Atlantic", 
                [15] = "      Atlantic", 
                [16] = "       Atlantic", 
                [17] = "        Atlantic", 
                [18] = "       Atlantic", 
                [19] = "      Atlantic", 
                [20] = "     Atlantic", 
                [21] = "    Atlantic", 
                [22] = "   Atlantic", 
                [23] = "  Atlantic", 
                [24] = " Atlantic", 
                [25] = "Atlantic", 
                [26] = "Atlanti", 
                [27] = "Atlant", 
                [28] = "Atlan", 
                [29] = "Atla", 
                [30] = "Atl", 
                [31] = "At", 
                [32] = "A", 
                [33] = " "
            });
        elseif v35.Menu.Misc.clantag_types:get() == "Custom" then
            local v270 = v35.Menu.Misc.clantag_input:get();
            helpers.animated_clantag(1, {
                [1] = v270
            });
        end;
    else
        helpers.animated_clantag(1, {
            [1] = ""
        });
    end;
end;
v35.Functions.Misc.Logger = function()
    -- upvalues: v35 (ref), v33 (ref), v17 (ref), l_pui_0 (ref), v88 (ref), v34 (ref)
    if not v35.Menu.Misc.logger:get() then
        return;
    else
        local v271 = render.screen_size();
        local v272 = v271.x / 2;
        local v273 = v271.y / 2 + 300 + v35.Menu.Misc.logger_y:get();
        local v274 = 0;
        local v275 = ({
            Bold = v33.bold, 
            ["Bold 2"] = v33.bold2, 
            ["Verdana Bold"] = v33.crosshair_ind, 
            ["Roboto Bold"] = v33.Roboto_Bold, 
            ["Small Pixel"] = v33.small_pixel, 
            Verdana = v33.verdana
        })[v35.Menu.Misc.font:get()] or v33.verdana;
        for v276 = #v17, 1, -1 do
            local v277 = v17[v276];
            local v278 = v277[1];
            local v279 = v277[2];
            local v280 = v277[3];
            if l_pui_0.get_alpha() == 1 and v279 == 255 then
                v277[2] = 255;
            else
                local v281 = globals.curtime - v280 >= 4 or #v17 > 5 and v276 < #v17 - 5;
                v277[2] = helpers.lerp(v279, v281 and 0 or 255, 4);
            end;
            v279 = math.clamp(v277[2], 0, 255);
            if v279 <= 0 then
                table.remove(v17, v276);
            else
                local v282 = render.measure_text(v275, "s", v278);
                local l_x_1 = v282.x;
                local l_y_1 = v282.y;
                local v285 = v272 - l_x_1 / 2;
                local v286 = v35.Menu.Misc.logger_Style:get();
                if v286 == "Simple" then
                    v274 = v274 + 20;
                    render.text(v275, vector(v285, v273 - v274), color(255, 255, 255, v279), "s", v278);
                elseif v286 == "Modern" then
                    v274 = v274 + 40;
                    local v287 = v35.Menu.Misc.logger_round:get();
                    local v288 = 10;
                    local v289 = 30;
                    local v290 = v285 - v288;
                    local v291 = v273 - v274 - 5;
                    local v292 = v285 + l_x_1 + v288;
                    local v293 = v291 + v289;
                    render.rect(vector(v290, v291), vector(v292, v293), color(0, 0, 0, v279), v287, true);
                    render.rect_outline(vector(v290, v291), vector(v292, v293), color(v88:get().r, v88:get().g, v88:get().b, v279), 2, v287);
                    render.text(v275, vector(v272 - l_x_1 / 2, v291 + v289 / 2 - l_y_1 / 2), color(255, 255, 255, v279), "s", v278);
                elseif v286 == "Gradient" then
                    v274 = v274 + 45;
                    local v294 = l_x_1 + 18;
                    local v295 = 30;
                    local v296 = v272 - v294 / 2;
                    local v297 = v273 - v274;
                    render.rect(vector(v296 - 5, v297 - 5), vector(v296 + v294 + 5, v297 + v295 + 5), color(66, 66, 66, v279), 0);
                    render.rect(vector(v296 + 1, v297 + 1), vector(v296 + v294 - 1, v297 + v295 - 1), color(15, 15, 15, v279), 0);
                    local v298 = v296 + 2;
                    local v299 = v297 + 2;
                    local v300 = v294 - 4;
                    local v301 = 2.5;
                    local v302 = v300 / 2;
                    render.gradient(vector(v298, v299), vector(v298 + v302, v299 + v301), color(59, 175, 222, v279), color(202, 70, 205, v279), color(59, 175, 222, v279), color(202, 70, 205, v279));
                    render.gradient(vector(v298 + v302, v299), vector(v298 + v300, v299 + v301), color(202, 70, 205, v279), color(204, 227, 53, v279), color(202, 70, 205, v279), color(204, 227, 53, v279));
                    render.text(v275, vector(v272 - l_x_1 / 2, v297 + v295 / 2 - l_y_1 / 2), color(255, 255, 255, v279), "s", v278);
                elseif v286 == "Atlantic" then
                    v274 = v274 + 30;
                    local v303 = v272 - l_x_1 / 2 - 30;
                    local v304 = v273 - v274 - l_y_1 / 2 - 5;
                    local v305 = v272 + l_x_1 / 2 + 30;
                    local v306 = v304 + 26;
                    render.rect(vector(v303, v304), vector(v305, v306), color(20, 20, 20, v279), 0);
                    local l_logo_small_2_0 = v34.logo_small_2;
                    render.texture(l_logo_small_2_0, vector(v303 - 15, v304 - 7), vector(l_logo_small_2_0.width + 10, l_logo_small_2_0.height + 10), color(255, 255, 255, v279), "r", 0);
                    render.text(v275, vector(v272 - l_x_1 / 2, v304 + 8), color(255, 255, 255, v279), "s", "| " .. v278);
                end;
            end;
        end;
        return;
    end;
end;
v35.Functions.Misc.console_color = function()
    -- upvalues: v25 (ref), v35 (ref)
    local v308 = v25.viibility_console() and v35.Menu.Misc.Console_color:get() or color(255);
    v25.custom_color(v308);
end;
events.player_death:set(function(v309)
    -- upvalues: v35 (ref)
    local v310 = entity.get(v309.userid, true);
    local v311 = entity.get_local_player();
    local v312 = {
        [1] = "EZ owned by atlantic.oce", 
        [2] = "Get better get atlantic.oce", 
        [3] = "I see your lua suck i think you should buy atlantic.oce on discord: 32Jcnkx75E", 
        [4] = "Bored of using pasted luas? go use atlantic.oce instead", 
        [5] = "get 1'ed by atlantic.oce", 
        [6] = "unlock your full potential with atlantic.oce", 
        [7] = "want to be best version of your self? use atlantic.oce", 
        [8] = "atlantic.oce just made your kd worse", 
        [9] = "Anotha day, anotha carry by atlantic.oce", 
        [10] = "Anotha no named downed by atlantic.oce", 
        [11] = "Imagine still not using atlantic.oce", 
        [12] = "Bro its 2025 and you are not using atlantic.oce", 
        [13] = "Atlantic.oce Best Lua ever done that only you can wish for"
    };
    local v313 = {
        [1] = "Be humiliated because you just got 1 by Medusa.uno", 
        [2] = "OwO, what is this? Medusa.uno just made your kd worse", 
        [3] = "YOUR DEAD, IMAGINE, GET 1'ED BY MEDUSA.UNO", 
        [4] = "Get good, sting to death with Medusa.uno", 
        [5] = "Another no name down by Medusa.uno", 
        [6] = "UwU stings you to death cutely using Medusa.uno", 
        [7] = "Medusa.uno just stinged ur ass $$$$$", 
        [8] = "Just saw something, a 1 in my killfeed caused by Medusa.uno", 
        [9] = "Why you keep to see 1 caused by Medusa.uno", 
        [10] = "Knock Knock Who there? Medusa.uno here to exterminate the no names!", 
        [11] = "Taking down some no names? Get yourself Medusa.uno and wreck them >:}", 
        [12] = "Anotha day, anotha carry by Medusa.uno", 
        [13] = "Sit the fuck down no name, Medusa.uno will always be superior", 
        [14] = "WOMP WOMP GET 1'ED BY MEDUSA.UNO", 
        [15] = "No namer dying? Womp womp, Medusa.uno is your feudal leader", 
        [16] = "^=^ Woo hoo, anotha no name downed by Medusa.uno", 
        [17] = "Who this? No name dying to Medusa.uno? Womp womp."
    };
    local v314 = {
        "Why you are as that EZ", 
        nil, 
        "1 Sit nn Dog", 
        "Stare powiedzenie mowi, ze trening czyni mistrza. Ty grasz 20h dziennie i dalej jestes chvjowy.", 
        [2] = v310:get_name() .. " fucking leave, this game is waste of your time", 
        string.format("%s Choose your excuse: 1.Lags | 2.New mouse | 3.Low FPS | 4.Low team | 5.Hacker | 6.Lucker | 7.Smurf | 8.Hitbox | 9.Tickrate", v310:get_name())
    };
    local v315 = {
        advertisement = v312, 
        ["Medusa.uno"] = v313, 
        Toxic = v314, 
        ["1"] = {
            [1] = "1"
        }
    };
    local function v320()
        -- upvalues: v35 (ref), v315 (ref)
        local v316 = v35.Menu.Misc.trashtalk_type:get();
        local v317 = v35.Menu.Misc.trashtalk_delay:get();
        local v318 = v315[v316];
        if v318 then
            local v319 = v318[math.random(1, #v318)];
            utils.execute_after(v317, utils.console_exec, "say " .. v319);
        end;
    end;
    if entity.get(v309.attacker, true) == v311 and v310 ~= v311 then
        if v35.Menu.Misc.trashtalk:get() then
            v320();
        end;
        if not v310:is_bot() then
            leaderboard.add_points(1);
        end;
    end;
end);
v35.Functions.Visuals.aspect_ratio = function()
    -- upvalues: v35 (ref)
    cvar.r_aspectratio:float(v35.Menu.Visuals.Aspect_ratio:get() * 0.01, true);
end;
local _ = l_gradient_0.text_animate("A T L A N T I C", 1, {
    color(255, 255, 220), 
    color(170, 170, 170), 
    color(120, 120, 120)
});
local v322 = l_gradient_0.text_animate("A T L A N T I C", 1, {
    color(220, 220, 220), 
    color(170, 170, 170), 
    color(120, 120, 120)
});
local v323 = l_gradient_0.text_animate(string.format("[%s]", v35.Data.Build), 1, {
    color(255, 118, 0)
});
local _ = 0;
local _ = 1;
local _ = 0;
local _ = 0;
local _ = {
    [""] = {
        alpha_k = 0
    }
};
local _ = 1;
v35.Functions.Visuals.watermark = function()
    -- upvalues: v35 (ref), v33 (ref), v88 (ref), v322 (ref), v16 (ref), v323 (ref)
    if not globals.is_in_game then
        return;
    else
        local _ = render.screen_size();
        local v331 = render.screen_size() / 2;
        if v35.Menu.Visuals.widgets:get(2) then
            if v35.Menu.Visuals.watermark_type:get() == "Solus" then
                local v332 = math.floor(1 / globals.frametime);
                local v333 = string.format("%3d", v332);
                local v334 = string.format("Atlantic.oce | %s | %s | %s fps", v35.Data.Build, v35.Data.User, v333);
                local v335 = render.measure_text(v33.verdana, nil, v334);
                local v336 = render.screen_size();
                local v337 = 6;
                local v338 = v336.x - v335.x - v337;
                local l_v337_0 = v337;
                local l_r_0 = v88:get().r;
                local l_g_0 = v88:get().g;
                local l_b_0 = v88:get().b;
                local v343 = 255;
                render.rect(vector(v338 - 2, l_v337_0 - 2), vector(v338 + v335.x + 2, l_v337_0), color(l_r_0, l_g_0, l_b_0, v343), 0);
                if v35.Menu.Visuals.widgets_glow:get(3) then
                    render.shadow(vector(v338 - 2, l_v337_0 - 2), vector(v338 + v335.x + 2, l_v337_0), color(l_r_0, l_g_0, l_b_0, v343), 30, 0, 2);
                end;
                render.rect(vector(v338 - 2, l_v337_0), vector(v338 + v335.x + 2, l_v337_0 + v335.y + 4), color(0, 0, 0, v343 / 4), 0);
                render.text(v33.verdana, vector(v338, l_v337_0 + 2), color(255, 255, 255, v343), nil, v334);
            elseif v35.Menu.Visuals.watermark_type:get() == "OG" then
                v322:animate();
                local _ = 0;
                local _ = 0;
                if v35.Menu.Visuals.watermark_position:get() == "Left" then
                    render.text(1, vector(v331.x - 1270, v331.y + 0), color(255), nil, v322:get_animated_text() .. "\aA64646FF  ");
                end;
                if v35.Menu.Visuals.watermark_position:get() == "Right" then
                    render.text(1, vector(v331.x + 1140, v331.y + 0), color(255), nil, v322:get_animated_text() .. "\aA64646FF  ");
                end;
                if v35.Menu.Visuals.watermark_position:get() == "Bottom" then
                    render.text(1, vector(v331.x, v16.y + 690), color(255), nil, v322:get_animated_text() .. "\aA64646FF  ");
                end;
                if v35.Menu.Visuals.watermark_position:get() == "Left" and v35.Menu.Visuals.watermark_build:get() then
                    render.text(1, vector(v331.x - 1270, v331.y), color(255), nil, v322:get_animated_text() .. "\aA64646FF  ");
                    render.text(1, vector(v331.x - 1270 + 85, v331.y), color(255, 118, 0), nil, v323:get_text() .. "\aA64646FF  ");
                end;
                if v35.Menu.Visuals.watermark_position:get() == "Right" and v35.Menu.Visuals.watermark_build:get() then
                    render.text(1, vector(v331.x + 1140, v331.y), color(255), nil, v322:get_animated_text() .. "\aA64646FF  ");
                    render.text(1, vector(v331.x + 1140 + 87, v331.y), color(255, 118, 0), nil, v323:get_text() .. "\aA64646FF  ");
                end;
                if v35.Menu.Visuals.watermark_position:get() == "Bottom" and v35.Menu.Visuals.watermark_build:get() then
                    render.text(1, vector(v331.x, v331.y + 690), color(255), nil, v322:get_animated_text() .. "\aA64646FF  ");
                    render.text(1, vector(v331.x + 85, v331.y + 690), color(255, 118, 0), nil, v323:get_text() .. "\aA64646FF  ");
                end;
            end;
        end;
        return;
    end;
end;
local v346 = 0;
local v347 = 1;
local _ = 0;
local v349 = 0;
local v350 = {
    [""] = {
        alpha_k = 0
    }
};
local _ = 1;
v35.Functions.Visuals.Keybinds = l_system_0.register({
    [1] = v35.Menu.Visuals.keybinds_x, 
    [2] = v35.Menu.Visuals.keybinds_y
}, vector(100, 120), "Keybinds", function(v352)
    -- upvalues: v35 (ref), l_pui_0 (ref), v88 (ref), v350 (ref), v349 (ref), v347 (ref), v346 (ref)
    local l_x_2 = v352.position.x;
    local l_y_2 = v352.position.y;
    if v35.Menu.Visuals.widgets:get(1) then
        local v355 = 0;
        local v356 = globals.frametime * 16;
        local v357 = 0;
        local v358 = {};
        local v359 = l_pui_0.get_binds();
        solushex = color(v88:get().r, v88:get().g, v88:get().b, 255):to_hex();
        for v360 = 1, #v359 do
            local v361 = v359[v360];
            local v362 = v359[v360].mode == 1 and "Holding" or v359[v360].mode == 2 and "Toggled" or "[?]";
            local _ = v359[v360].value;
            local l_name_0 = v359[v360].name;
            local v365 = render.measure_text(1, "", v362);
            local v366 = render.measure_text(1, "", l_name_0);
            if v350[v361.name] == nil then
                v350[v361.name] = {
                    alpha_k = 0
                };
            end;
            v350[v361.name].alpha_k = helpers.lerpx(v356, v350[v361.name].alpha_k, v361.active and 255 or 0);
            render.text(1, vector(l_x_2 + 3, l_y_2 + 22 + v357), color(255, v350[v361.name].alpha_k), "", l_name_0);
            render.text(1, vector(l_x_2 + (v349 - v365.x - 8), l_y_2 + 22 + v357), color(255, v350[v361.name].alpha_k), "", "[" .. v362 .. "]");
            v357 = v357 + 16 * v350[v361.name].alpha_k / 255;
            local v367 = v365.x + v366.x + 18;
            if v367 > 119 and v355 < v367 then
                v355 = v367;
            end;
        end;
        v347 = helpers.lerpx(v356, v347, (not (l_pui_0.get_alpha() <= 0) or v357 > 0) and 1 or 0);
        v349 = helpers.lerpx(v356, v349, math.max(v355, 119));
        if l_pui_0.get_alpha() > 0 or v357 > 6 then
            v346 = helpers.lerpx(v356, v346, math.max(l_pui_0.get_alpha() * 255, v357 > 1 and 255 or 0));
        elseif v357 < 15.99 and l_pui_0.get_alpha() == 0 then
            v346 = helpers.lerpx(v356, v346, 0);
        end;
        if l_pui_0.get_alpha() or #v358 > 0 then
            local v368 = render.measure_text(1, "", "Keybinds");
            local l_r_1 = v88:get().r;
            local l_g_1 = v88:get().g;
            local l_b_1 = v88:get().b;
            render.rect(vector(l_x_2, l_y_2), vector(l_x_2 + v349 + 3, l_y_2 + 2), color(l_r_1, l_g_1, l_b_1, v346), 4);
            if v35.Menu.Visuals.widgets_glow:get(1) then
                render.shadow(vector(l_x_2, l_y_2), vector(l_x_2 + v349 + 3, l_y_2 + 2), color(l_r_1, l_g_1, l_b_1, v346), 30, 0, 2);
            end;
            render.rect(vector(l_x_2, l_y_2 + 2), vector(l_x_2 + v349 + 3, l_y_2 + 19), color(0, 0, 0, v346 / 4), 0);
            render.text(1, vector(l_x_2 + 3 + v349 / 2 + 1 - v368.x / 2, l_y_2 + 2 + 8 - v368.y / 2), color(255, 255, 255, v346), "", "Keybinds");
        end;
    end;
end);
v35.Functions.Visuals.spectators = l_system_0.register({
    [1] = v35.Menu.Visuals.specators_x, 
    [2] = v35.Menu.Visuals.specators_y
}, vector(100, 120), "Spectators", function(v372)
    -- upvalues: v35 (ref), l_pui_0 (ref)
    local l_x_3 = v372.position.x;
    local l_y_3 = v372.position.y;
    local v375 = 0;
    local v376 = 120;
    local v377 = 255;
    local v378 = 255;
    local v379 = 255;
    local v380 = 255;
    if v35.Menu.Visuals.widgets:get(3) then
        if v376 > 149 and v375 < v376 then
            v375 = v376;
        end;
        solushex = color(255, 255, 255, 255):to_hex();
        if l_pui_0.get_alpha() > 0.3 or l_pui_0.get_alpha() > 0.3 and not globals.is_in_game then
            render.rect(vector(l_x_3, l_y_3), vector(l_x_3 + v376 + 3, l_y_3 + 2), color(v377, v378, v379, v380), 4, false);
            render.rect(vector(l_x_3, l_y_3 + 2), vector(l_x_3 + v376 + 3, l_y_3 + 19), color(0, 0, 0, v380 / 4), 0);
            local v381 = render.measure_text(1, "", "spectators");
            if v35.Menu.Visuals.widgets_glow:get(2) then
                render.shadow(vector(l_x_3, l_y_3), vector(l_x_3 + v376 + 3, l_y_3 + 2), color(v377, v378, v379, v380), 20, 0, 0);
            end;
            render.text(1, vector(l_x_3 + 1 + v376 / 2 + 1 - v381.x / 2, l_y_3 + 2 + 8 - v381.y / 2), color(255, 255, 255, v380), "", "spectators");
        end;
        local v382 = entity.get_local_player();
        if v382 == nil then
            return;
        else
            local _ = v382:get_spectators();
            if v382.m_hObserverTarget and (v382.m_iObserverMode == 4 or v382.m_iObserverMode == 5) then
                v382 = v382.m_hObserverTarget;
            end;
            local v384 = v382.get_spectators(v382);
            if v384 == nil then
                return;
            else
                for v385, v386 in pairs(v384) do
                    local v387 = v386:get_name();
                    local _ = render.measure_text(1, "", v387).x;
                    name_sub = string.len(v387) > 20 and string.sub(v387, 0, 20) .. "..." or v387;
                    render.text(1, vector(v372.position.x + 5, v372.position.y + 8 + v385 * 15), color(), "u", name_sub);
                    render.texture(v386.avatar, vector(v372.position.x + 4, v372.position.y + 21 + string.format("%.0f", v385 * 15)), vector(12, 12), color(255, 255, 255, 255), "f", 0);
                end;
                if #v382.get_spectators(v382) > 0 or v382.m_iObserverMode == 4 or v382.m_iObserverMode == 5 then
                    render.rect(vector(l_x_3, l_y_3), vector(l_x_3 + v376 + 3, l_y_3 + 2), color(v377, v378, v379, v380), 4);
                    local v389 = render.measure_text(1, "", "spectators");
                    if v35.Menu.Visuals.widgets_glow:get(2) then
                        render.shadow(vector(l_x_3, l_y_3), vector(l_x_3 + v376 + 3, l_y_3 + 2), color(v377, v378, v379, v380), 20, 0, 0);
                    end;
                    render.text(1, vector(l_x_3 + 1 + v376 / 2 + 1 - v389.x / 2, l_y_3 + 2 + 8 - v389.y / 2), color(255, 255, 255, v380), "", "spectators");
                end;
            end;
        end;
    end;
end);
v35.Functions.Misc.super_toss = function(v390)
    if v390.jitter_move ~= true then
        return;
    else
        local v391 = entity.get_local_player();
        if v391 == nil then
            return;
        else
            local v392 = v391:get_player_weapon();
            if v392 == nil then
                return;
            else
                local v393 = v392:get_weapon_info();
                if v393 == nil or v393.weapon_type ~= 9 then
                    return;
                elseif v392.m_fThrowTime < globals.curtime - to_time(globals.clock_offset) then
                    return;
                else
                    v390.in_speed = true;
                    local v394 = v391:simulate_movement();
                    v394:think();
                    v390.view_angles = helpers.resolve_grenade_throw(v390.view_angles, v393.throw_velocity, v392.m_flThrowStrength, v394.velocity);
                    return;
                end;
            end;
        end;
    end;
end;
v35.Functions.Misc.fast_ladder = function(v395)
    -- upvalues: v35 (ref)
    if not v35.Menu.Misc.fast_ladder:get() then
        return;
    else
        local v396 = entity.get_local_player();
        if v396 == nil then
            return;
        else
            if v396.m_MoveType == 9 then
                if v395.sidemove == 0 then
                    v395.view_angles.y = v395.view_angles.y + 45;
                end;
                if v395.sidemove < 0 and v395.in_forward then
                    v395.view_angles.y = v395.view_angles.y + 90;
                end;
                if v395.sidemove > 0 and v395.in_back then
                    v395.view_angles.y = v395.view_angles.y + 90;
                end;
                v395.in_moveleft = v395.in_back;
                v395.in_moveright = v395.in_forward;
                if v395.view_angles.x < 0 then
                    v395.view_angles.x = -45;
                end;
            end;
            return;
        end;
    end;
end;
v35.Functions.Ragebot.Logs = function(v397)
    -- upvalues: v21 (ref)
    local _ = entity.get_local_player();
    local v399 = entity.get(v397.target);
    local _ = v397.damage;
    local _ = v397.wanted_damage;
    local v402 = helpers.hitgroup_str[v397.wanted_hitgroup];
    local l_hitchance_0 = v397.hitchance;
    local l_state_0 = v397.state;
    local l_backtrack_0 = v397.backtrack;
    local v406 = to_time(v397.backtrack) * 1000;
    local v407 = {
        ["damage rejection"] = "Unregistered shot", 
        ["backtrack failure"] = "Backtrack Failure", 
        ["prediction error"] = "Prediction Error", 
        spread = "Spread", 
        misprediction = "Jitter", 
        correction = "Resolver", 
        death = "Local Death (Ping)", 
        ["player death"] = "Target Death", 
        ["unregistered shot"] = "Unregistered shot"
    };
    if v397.state ~= "hit" then
        if not v399 or v399 == nil then
            return;
        else
            local l_m_iHealth_0 = v399.m_iHealth;
            local _ = "";
            local v410 = helpers.hitgroup_str[v397.hitgroup];
            if not globals.is_connected or not globals.is_in_game then
                return false;
            else
                if l_state_0 == nil then
                    print_raw(("Atlantic.oce --->>> Registered shot at %s's in %s for %d (remaining: " .. l_m_iHealth_0 .. ") (BT: %s(%s ms))"):format(v399:get_name(), v410, v397.damage, l_backtrack_0, v406));
                    v21(("\aFFFFFFFFRegistered shot at \aA1FF8FFF%s's\aFFFFFFFF in \aA1FF8FFF%s \aFFFFFFFFfor \aA1FF8FFF%d \aFFFFFFFF(remaining: \aA1FF8FFF" .. l_m_iHealth_0 .. "\aFFFFFFFF)"):format(v399:get_name(), v410, v397.damage));
                end;
                if l_state_0 ~= nil then
                    print_raw(string.format("Atlantic.oce --->>> Missed %s in the %s due to %s (hc: %s) (BT: %s (ms: %s))", v399:get_name(), v402, v407[v397.state], l_hitchance_0, l_backtrack_0, v406));
                    v21(string.format("\aFFFFFFFFMissed \aE94B4BAA%s \aFFFFFFFFin the  \aE94B4BAA%s \aFFFFFFFFdue to  \aE94B4BAA%s", v399:get_name(), v402, v407[v397.state]));
                end;
            end;
        end;
    end;
end;
local v411 = 0;
local v412 = l_gradient_0.text_animate("ATLANTIC.OCE", v35.Menu.Visuals.crosshair_ind_animation_speed:get(), {
    color(v35.Menu.Visuals.crosshair_ind_color_1:get().r, v35.Menu.Visuals.crosshair_ind_color_1:get().g, v35.Menu.Visuals.crosshair_ind_color_1:get().b), 
    color(v35.Menu.Visuals.crosshair_ind_color_2:get().r, v35.Menu.Visuals.crosshair_ind_color_2:get().g, v35.Menu.Visuals.crosshair_ind_color_2:get().b), 
    color(v35.Menu.Visuals.crosshair_ind_color_3:get().r, v35.Menu.Visuals.crosshair_ind_color_3:get().g, v35.Menu.Visuals.crosshair_ind_color_3:get().b)
});
local v413 = l_gradient_0.text_animate("ATLANTIC.OCE", 2, {
    color(220, 220, 220), 
    color(170, 170, 170), 
    color(120, 120, 120)
});
v35.Functions.Visuals.crosshair_indicators = function()
    -- upvalues: l_pui_0 (ref), v411 (ref), v35 (ref), v33 (ref), v412 (ref), v413 (ref), v22 (ref), v164 (ref)
    local v414 = entity.get_local_player();
    if not v414 or not v414:is_alive() then
        return;
    else
        local v415 = render.screen_size() / 2;
        local v416 = l_pui_0.get_binds();
        local l_m_bIsScoped_1 = v414.m_bIsScoped;
        v411 = helpers.lerp(v411, l_m_bIsScoped_1 and 50 or 0, 20);
        local v418 = v35.Menu.Visuals.crosshair_ind_y:get();
        local l_verdana_0 = v33.verdana;
        if v35.Menu.Visuals.crosshair_ind_text_style:get() == "Rework" then
            l_verdana_0 = v33.Roboto_Bold;
        end;
        if v35.Menu.Visuals.crosshair_ind_text_style:get() == "Rework" then
            v412:animate();
            local v420 = v412:get_animated_text();
            local v421 = vector(v415.x + v411, v415.y + 15 + v418);
            local v422 = {
                offset = 0, 
                rounding = 2, 
                thickness = 20, 
                pos_start = vector(v415.x - 30 + v411, v415.y + 15 + v418), 
                pos_end = vector(v415.x + 30 + v411, v415.y + 15 + v418), 
                color = color(255, 255, 255, 75)
            };
            v412:set_speed(v35.Menu.Visuals.crosshair_ind_animation_speed:get());
            v412:set_colors({
                color(v35.Menu.Visuals.crosshair_ind_color_1:get().r, v35.Menu.Visuals.crosshair_ind_color_1:get().g, v35.Menu.Visuals.crosshair_ind_color_1:get().b), 
                color(v35.Menu.Visuals.crosshair_ind_color_2:get().r, v35.Menu.Visuals.crosshair_ind_color_2:get().g, v35.Menu.Visuals.crosshair_ind_color_2:get().b), 
                color(v35.Menu.Visuals.crosshair_ind_color_3:get().r, v35.Menu.Visuals.crosshair_ind_color_3:get().g, v35.Menu.Visuals.crosshair_ind_color_3:get().b)
            });
            render.shadow(v422.pos_start, v422.pos_end, v422.color, v422.thickness, v422.offset, v422.rounding);
            render.text(l_verdana_0, v421, color(255, 255, 255), "c", v420);
        elseif v35.Menu.Visuals.crosshair_ind_text_style:get() == "Old" then
            render.text(v33.verdana, vector(v415.x + v411, v415.y + 15 + v418), color(255, 255, 255), "c", v413:get_animated_text());
        end;
        local v423 = 0;
        if v35.Menu.Visuals.crosshair_ind_settings:get("Conditions") then
            local v424 = v35.AntiAim.States[v22.st] or "";
            render.text(l_verdana_0, vector(v415.x + v411, v415.y + 25 + v423 + v418), color(255, 255, 255), "c", v424);
        end;
        if v35.Menu.Visuals.crosshair_ind_settings:get("Binds") then
            local v425 = rage.exploit:get() * 255;
            if v164.References.Rage.Exploits.dt:get() then
                render.text(l_verdana_0, vector(v415.x + v411, v415.y + 34 + v423 + v418), color(255, v425, v425, 255), "c", "DT");
                v423 = v423 + 10;
            end;
            if v164.References.Rage.Exploits.hs:get() then
                render.text(l_verdana_0, vector(v415.x + v411, v415.y + 34 + v423 + v418), color(255, v425, v425, 255), "c", "HS");
                v423 = v423 + 10;
            end;
            for _, v427 in ipairs(v416) do
                if v427.name == "Min. Damage" then
                    render.text(l_verdana_0, vector(v415.x + v411, v415.y + 33 + v423 + v418), color(255, v425, v425, 255), "c", "DMG");
                    v423 = v423 + 10;
                end;
            end;
        end;
        return;
    end;
end;
local v428 = 17.55;
local v429 = 125;
v35.Functions.Misc.grenade_radius = function()
    -- upvalues: v35 (ref), v428 (ref), v429 (ref)
    if not v35.Menu.Misc.grenade_radius:get() then
        return;
    else
        local v430 = entity.get_local_player();
        if not v430 then
            return;
        else
            if v35.Menu.Misc.grenade_select:get(2) then
                local v431 = entity.get_entities("CInferno");
                for v432 = 1, #v431 do
                    local v433 = v431[v432];
                    local v434 = v433:get_origin();
                    local l_m_iTeamNum_1 = (v433.m_hOwnerEntity or v430).m_iTeamNum;
                    local l_m_iTeamNum_2 = v430.m_iTeamNum;
                    local v437 = nil;
                    if l_m_iTeamNum_1 == l_m_iTeamNum_2 then
                        v437 = v35.Menu.Misc.molotov_color:get();
                    else
                        v437 = v35.Menu.Misc.molotov_color2:get();
                    end;
                    local v438 = 40;
                    local v439 = {};
                    local v440 = 0;
                    local v441 = nil;
                    local v442 = nil;
                    local v443 = v431[v432];
                    for v444 = 1, 64 do
                        if v443.m_bFireIsBurning[v444] == true then
                            table.insert(v439, vector(v433.m_fireXDelta[v444], v433.m_fireYDelta[v444], v433.m_fireZDelta[v444]));
                        end;
                    end;
                    for v445 = 1, #v439 do
                        for v446 = 1, #v439 do
                            local v447 = helpers.distance_2d(v439[v445], v439[v446]);
                            if v440 < v447 then
                                v440 = v447;
                                v441 = v439[v445];
                                v442 = v439[v446];
                            end;
                        end;
                    end;
                    if v441 ~= nil and v442 ~= nil then
                        local v448 = v434 + helpers.lerp_position(v441, v442, 0.5);
                        render.circle_3d_outline(v448, color(v437.r, v437.g, v437.b, 255), v440 / 2 + v438, 0, 1, 1);
                    end;
                end;
            end;
            if v35.Menu.Misc.grenade_select:get(1) then
                local l_tickcount_0 = globals.tickcount;
                local l_tickinterval_0 = globals.tickinterval;
                local v451 = entity.get_entities("CSmokeGrenadeProjectile");
                for v452 = 1, #v451 do
                    local v453 = v451[v452];
                    local v454 = v453:get_classname();
                    local v455 = 1;
                    if v454 == "CSmokeGrenadeProjectile" and v453.m_bDidSmokeEffect == true then
                        local l_m_nSmokeEffectTickBegin_0 = v453.m_nSmokeEffectTickBegin;
                        if l_m_nSmokeEffectTickBegin_0 ~= nil then
                            local v457 = l_tickinterval_0 * (l_tickcount_0 - l_m_nSmokeEffectTickBegin_0);
                            if v457 > 0 and v428 - v457 > 0 then
                                if grenade_timer then
                                    v455 = 1 - v457 / v428;
                                end;
                                local l_r_2 = v35.Menu.Misc.smoke_color:get().r;
                                local l_g_2 = v35.Menu.Misc.smoke_color:get().g;
                                local l_b_2 = v35.Menu.Misc.smoke_color:get().b;
                                local l_a_0 = v35.Menu.Misc.smoke_color:get().a;
                                local l_v429_0 = v429;
                                if v457 < 0.3 then
                                    l_v429_0 = l_v429_0 * 0.6 + l_v429_0 * (v457 / 0.3) * 0.4;
                                    l_a_0 = l_a_0 * (v457 / 0.3);
                                end;
                                if v428 - v457 < 1 then
                                    l_v429_0 = l_v429_0 * ((v428 - v457) / 1 * 0.3 + 0.7);
                                end;
                                render.circle_3d_outline(v453:get_origin(), color(l_r_2, l_g_2, l_b_2, l_a_0 * math.min(1, v455 * 1.3)), l_v429_0, 0, 1);
                            end;
                        end;
                    end;
                end;
            end;
            return;
        end;
    end;
end;
v35.Functions.Ragebot.quick_stop = function(v463)
    -- upvalues: v35 (ref), v165 (ref), v164 (ref)
    if v35.Menu.Ragebot.quick_stop:get() then
        local v464 = entity.get_local_player();
        local v465 = v464:get_player_weapon();
        if v465 == nil then
            return;
        else
            local v466 = v465:get_classname();
            for _, _ in ipairs(entity.get_players(true, false)) do
                if bit.band(v464.m_fFlags, 1) == 0 or not v165.ON_GROUND then
                    if string.match(v466, "SSG08") then
                        v463.in_forward = 1;
                        v463.in_back = 1;
                        v463.in_moveleft = 1;
                        v463.in_moveright = 1;
                        v463.forwardmove = 1;
                        v463.sidemove = 1;
                        v463.in_jump = 1;
                        v463.in_speed = 1;
                        v164.References.Misc.air_strafe:override(false);
                        v164.References.Misc.bh:override(false);
                    else
                        v164.References.Misc.air_strafe:override(true);
                        v164.References.Misc.bh:override(true);
                    end;
                else
                    v164.References.Misc.air_strafe:override(true);
                    v164.References.Misc.bh:override(true);
                end;
            end;
        end;
    else
        v164.References.Misc.air_strafe:override(true);
        v164.References.Misc.bh:override(true);
    end;
end;
v35.Functions.Misc.Auto_break_lc = function()
    -- upvalues: v35 (ref)
    local v469 = entity.get_local_player();
    if not v469 or not v469:is_alive() then
        return;
    elseif not v35.Menu.Misc.auto_break_lc:get() then
        return;
    else
        local v470 = bit.band(v469.m_fFlags, 1) == 0;
        local v471 = v35.Menu.Misc.auto_break_lc_options_delay:get() or 0;
        if not v35.Menu.Misc.auto_break_lc:get() then
            return;
        elseif entity.get_threat(true) == nil then
            return;
        else
            local function v472()
                -- upvalues: v471 (ref)
                rage.exploit:force_teleport();
                utils.execute_after(v471, function()
                    rage.exploit:force_charge();
                    rage.exploit:force_teleport();
                end);
            end;
            if v35.Menu.Misc.auto_break_lc_options:get(1) then
                if v470 then
                    v472();
                end;
                return;
            else
                return;
            end;
        end;
    end;
end;
local v473 = {};
local v474 = {
    [1] = 0, 
    [2] = 1, 
    [3] = 2, 
    [4] = 3, 
    [5] = 4, 
    [6] = 5, 
    [7] = 6, 
    [8] = 7, 
    [9] = 8, 
    [10] = 9, 
    [11] = 10, 
    [12] = 11, 
    [13] = 12, 
    [14] = 13, 
    [15] = 14, 
    [16] = 15, 
    [17] = 16, 
    [18] = 17
};
v35.Functions.AntiAim.evaded_shot = function(v475)
    -- upvalues: v473 (ref), v474 (ref), v21 (ref)
    local v476 = entity.get_local_player();
    if not v476 or not v476:is_alive() then
        return;
    else
        local v477 = entity.get(v475.userid, true);
        if not v477 or not v477:is_enemy() then
            return;
        else
            local v478 = v477:get_index();
            local l_curtime_0 = globals.curtime;
            if v473[v478] and l_curtime_0 - v473[v478] < 0.1 then
                return;
            else
                local v480 = entity.get_threat(true);
                if not v480 or v480:get_index() ~= v478 then
                    return;
                else
                    local v481 = vector(v475.x, v475.y, v475.z);
                    local v482 = v477:get_hitbox_position(0);
                    local l_huge_0 = math.huge;
                    for _, v485 in ipairs(v474) do
                        local v486 = v476:get_hitbox_position(v485);
                        if v486 then
                            local v487 = (v481 - v482):angles();
                            local v488 = (v486 - v482):angles() - v487;
                            v488.y = math.clamp(v488.y, -180, 180);
                            local v489 = math.sqrt(v488.x ^ 2 + v488.y ^ 2);
                            if v489 < l_huge_0 then
                                l_huge_0 = v489;
                            end;
                        end;
                    end;
                    if l_huge_0 < 10 then
                        v473[v478] = l_curtime_0;
                        v21("evaded \a74FF34FF" .. v477:get_name() .. " \aFFFFFFFFshot");
                    end;
                    return;
                end;
            end;
        end;
    end;
end;
events.bullet_impact:set(v35.Functions.AntiAim.evaded_shot);
events.render:set(function()
    -- upvalues: v35 (ref)
    v35.Functions.Visuals.custom_scope();
    v35.Functions.Misc.Clantag();
    v35.Functions.Main.sidebar();
    v35.Functions.Misc.Logger();
    v35.Functions.Visuals.aspect_ratio();
    v35.Functions.Misc.console_color();
    v35.Functions.Visuals.watermark();
    v35.Functions.Visuals.Keybinds:update();
    v35.Functions.Visuals.spectators:update();
    if v35.Menu.Visuals.widgets:get(4) then
        v35.Functions.Visuals.crosshair_indicators();
    end;
    v35.Functions.Misc.grenade_radius();
end);
events.aim_ack:set(v35.Functions.Ragebot.Logs);
events.createmove:set(function(v490)
    -- upvalues: v35 (ref)
    if v35.Menu.Misc.grenade_supertoss:get() then
        v35.Functions.Misc.super_toss(v490);
    end;
    v35.Functions.Ragebot.quick_stop(v490);
    v35.Functions.Misc.fast_ladder(v490);
    if v35.Menu.Misc.auto_break_lc:get() then
        v35.Functions.Misc.Auto_break_lc();
    end;
    if v35.Menu.Misc.unlock_ping_spike:get() then
        cvar.sv_maxunlag:float(0.75);
    else
        cvar.sv_maxunlag:float(0.2);
    end;
    v35.Functions.AntiAim.builder();
    local v491 = entity.get_local_player();
    local v492 = bit.band(v491.m_fFlags, 1) == 0;
    if v35.Menu.Misc.air_stuck:get() and v492 then
        v490.tickcount = 2147483647;
        v490.command_number = 2147483647;
    end;
end);
events.grenade_override_view(function(v493)
    -- upvalues: v35 (ref)
    if v35.Menu.Misc.grenade_supertoss:get() then
        helpers.Resolve_angle(v493);
    end;
end);
events.post_update_clientside_animation:set(function(v494)
    -- upvalues: v35 (ref)
    v35.Functions.AntiAim.breakers(v494);
end);
v35.Menu.Visuals.shared_icon:set_callback(function(v495)
    local v496 = entity.get_local_player();
    if not v496 or v496 == nil then
        return;
    else
        if v495:get() then
            v496:set_icon("https://tabi.shieldowskyy.pl/small_logo1.png");
        else
            v496:set_icon();
        end;
        entity.get_players(false, true, function(v497)
            -- upvalues: v495 (ref)
            if not v495:get() then
                v497:set_icon();
            end;
        end);
        return;
    end;
end);
events.voice_message:call(function(v498)
    v498:write_bits(8229, 16);
    v498:write_bits(globals.tickcount, 32);
end);
events.voice_message(function(v499)
    -- upvalues: v35 (ref)
    local l_buffer_0 = v499.buffer;
    if l_buffer_0:read_bits(16) ~= 8229 then
        return;
    else
        local _ = l_buffer_0:read_bits(32);
        if not v35.Menu.Visuals.shared_icon:get() then
            return;
        else
            v499.entity:set_icon("https://tabi.shieldowskyy.pl/small_logo1.png");
            return;
        end;
    end;
end);
v35.Functions.Misc.view_model();
v35.Menu.Misc.view_model:set_callback(function()
    -- upvalues: v35 (ref)
    v35.Functions.Misc.view_model();
end);
v35.Menu.Misc.view_model_fov:set_callback(function()
    -- upvalues: v35 (ref)
    v35.Functions.Misc.view_model();
end);
v35.Menu.Misc.view_model_x:set_callback(function()
    -- upvalues: v35 (ref)
    v35.Functions.Misc.view_model();
end);
v35.Menu.Misc.view_model_y:set_callback(function()
    -- upvalues: v35 (ref)
    v35.Functions.Misc.view_model();
end);
v35.Menu.Misc.view_model_z:set_callback(function()
    -- upvalues: v35 (ref)
    v35.Functions.Misc.view_model();
end);
local v502 = {};
local v503 = l_pui_0.setup({
    [1] = v35.Menu.Builder, 
    [2] = v35.Menu.Main, 
    [3] = v35.Menu.AntiAim, 
    [4] = v169, 
    [5] = v35.Menu.Misc, 
    [6] = v35.Menu.Visuals
}, true);
local v504 = db.Atlantic_oce_data or {};
v504.cfg_list = v504.cfg_list or {
    [1] = {
        [1] = "Default Config", 
        [2] = "NL->Atlantic.oce->Config->W1t7IkRlc3luY19MIjowLjAsIkRlc3luY19SIjowLjAsIkRlc3luY19hbW91bnQiOjAuMCwiRGVzeW5jX3JhbmRvbV9tYXgiOjAuMCwiRGVzeW5jX3JhbmRvbV9taW4iOjAuMCwiRGVzeW5jX3N3YXlfc3BlZWQiOjAuMCwiUGl0Y2giOiJEaXNhYmxlZCIsIlNwaW5fcmFuZ2UiOjEuMCwiU3Bpbl9zcGVlZCI6MC4wLCJZYXdfQ2hlY2siOmZhbHNlLCJZYXdfRGVsYXkiOjEuMCwiWWF3X0wiOjAuMCwiWWF3X01vZGlmaWVyX29mZnNldCI6MS4wLCJZYXdfTW9kaWZpZXJfdHlwZSI6IkRpc2FibGVkIiwiWWF3X1IiOjAuMCwiWWF3X1N0YXRpYyI6MC4wLCJZYXdfVHlwZSI6IlN0YXRpYyIsIllhd19iYXNlIjoiTG9jYWwgVmlldyIsImRlZmVuc2l2ZV9lbmFibGUiOmZhbHNlLCJkZWZlbnNpdmVfcGl0Y2giOiJVcCIsImRlZmVuc2l2ZV9waXRjaF9jdXN0b20iOjAuMCwiZGVmZW5zaXZlX3BpdGNoX3JhbmRvbV9tYXgiOjAuMCwiZGVmZW5zaXZlX3BpdGNoX3JhbmRvbV9taW4iOjAuMCwiZGVmZW5zaXZlX3BpdGNoX3N3aXRjaF8xIjowLjAsImRlZmVuc2l2ZV9waXRjaF9zd2l0Y2hfMiI6MC4wLCJkZWZlbnNpdmVfeWF3IjoiU3BpbiIsImRlZmVuc2l2ZV95YXdfY3VzdG9tIjowLjAsImRlZmVuc2l2ZV95YXdfaml0dGVyXzEiOjAuMCwiZGVmZW5zaXZlX3lhd19qaXR0ZXJfMiI6MC4wLCJkZWZlbnNpdmVfeWF3X2ppdHRlcl9kZWxheSI6MC4wLCJkZWZlbnNpdmVfeWF3X3JhbmRvbV9tYXgiOjAuMCwiZGVmZW5zaXZlX3lhd19yYW5kb21fbWluIjowLjAsImRlZmVuc2l2ZV95YXdfc3Bpbl9SYW5nZSI6MC4wLCJkZWZlbnNpdmVfeWF3X3NwaW5fU3BlZWQiOjAuMCwiZGVmZW5zaXZlX3lhd19zd2l0Y2hfMSI6MC4wLCJkZWZlbnNpdmVfeWF3X3N3aXRjaF8yIjowLjAsImRlc3luY19jaGVjayI6ZmFsc2UsImRlc3luY19tb2RlIjpbIn4iXSwiZGVzeW5jX29wdGlvbnMiOlsifiJdLCJkZXN5bmNfcGVlayI6Ik9mZiIsImRlc3luY190eXBlIjoiU3RhdGljIiwiZHVyYWJpbGl0eSI6Mi4wLCJmbF9MaW1pdCI6MC4wLCJmbF90eXBlcyI6IlN0YXRpYyIsImZsX3R5cGVzX2ppdHRlcjEiOjEuMCwiZmxfdHlwZXNfaml0dGVyMiI6MS4wLCJmbF90eXBlc19yYW5kb21fbWF4IjoxLjAsImZsX3R5cGVzX3JhbmRvbV9taW4iOjEuMCwiZmxfdmFyaWFiaWxpdHkiOjAuMCwib3ZlcnJpZGUiOmZhbHNlfSx7IkRlc3luY19MIjowLjAsIkRlc3luY19SIjowLjAsIkRlc3luY19hbW91bnQiOjU1LjAsIkRlc3luY19yYW5kb21fbWF4IjoxMC4wLCJEZXN5bmNfcmFuZG9tX21pbiI6MC4wLCJEZXN5bmNfc3dheV9zcGVlZCI6Mi4wLCJQaXRjaCI6IkRvd24iLCJTcGluX3JhbmdlIjoxLjAsIlNwaW5fc3BlZWQiOjAuMCwiWWF3X0NoZWNrIjp0cnVlLCJZYXdfRGVsYXkiOjAuMCwiWWF3X0wiOi0yOC4wLCJZYXdfTW9kaWZpZXJfb2Zmc2V0IjotNDguMCwiWWF3X01vZGlmaWVyX3R5cGUiOiJEaXNhYmxlZCIsIllhd19SIjo1NC4wLCJZYXdfU3RhdGljIjoxOS4wLCJZYXdfVHlwZSI6IkxlZnQmUmlnaHQiLCJZYXdfYmFzZSI6IkF0IFRhcmdldCIsImRlZmVuc2l2ZV9lbmFibGUiOmZhbHNlLCJkZWZlbnNpdmVfcGl0Y2giOiJVcCIsImRlZmVuc2l2ZV9waXRjaF9jdXN0b20iOjAuMCwiZGVmZW5zaXZlX3BpdGNoX3JhbmRvbV9tYXgiOjg5LjAsImRlZmVuc2l2ZV9waXRjaF9yYW5kb21fbWluIjotODkuMCwiZGVmZW5zaXZlX3BpdGNoX3N3aXRjaF8xIjotODkuMCwiZGVmZW5zaXZlX3BpdGNoX3N3aXRjaF8yIjowLjAsImRlZmVuc2l2ZV95YXciOiJKaXR0ZXIiLCJkZWZlbnNpdmVfeWF3X2N1c3RvbSI6LTE4MC4wLCJkZWZlbnNpdmVfeWF3X2ppdHRlcl8xIjotMTgwLjAsImRlZmVuc2l2ZV95YXdfaml0dGVyXzIiOjAuMCwiZGVmZW5zaXZlX3lhd19qaXR0ZXJfZGVsYXkiOjY0LjAsImRlZmVuc2l2ZV95YXdfcmFuZG9tX21heCI6MC4wLCJkZWZlbnNpdmVfeWF3X3JhbmRvbV9taW4iOjAuMCwiZGVmZW5zaXZlX3lhd19zcGluX1JhbmdlIjotMzYwLjAsImRlZmVuc2l2ZV95YXdfc3Bpbl9TcGVlZCI6MC4wLCJkZWZlbnNpdmVfeWF3X3N3aXRjaF8xIjotMTgwLjAsImRlZmVuc2l2ZV95YXdfc3dpdGNoXzIiOjAuMCwiZGVzeW5jX2NoZWNrIjp0cnVlLCJkZXN5bmNfbW9kZSI6WyJSYW5kb20iLCJ+Il0sImRlc3luY19vcHRpb25zIjpbIlJhbmRvbWl6ZSBKaXR0ZXIiLCJBbnRpIEJydXRlZm9yY2UiLCJ+Il0sImRlc3luY19wZWVrIjoiUGVlayBGYWtlIiwiZGVzeW5jX3R5cGUiOiJTdGF0aWMiLCJkdXJhYmlsaXR5IjoxNC4wLCJmbF9MaW1pdCI6MTQuMCwiZmxfdHlwZXMiOiJEeW5hbWljIiwiZmxfdHlwZXNfaml0dGVyMSI6MTQuMCwiZmxfdHlwZXNfaml0dGVyMiI6MTQuMCwiZmxfdHlwZXNfcmFuZG9tX21heCI6MS4wLCJmbF90eXBlc19yYW5kb21fbWluIjoxLjAsImZsX3ZhcmlhYmlsaXR5IjowLjAsIm92ZXJyaWRlIjp0cnVlfSx7IkRlc3luY19MIjo0OC4wLCJEZXN5bmNfUiI6NDguMCwiRGVzeW5jX2Ftb3VudCI6NjAuMCwiRGVzeW5jX3JhbmRvbV9tYXgiOjE0LjAsIkRlc3luY19yYW5kb21fbWluIjowLjAsIkRlc3luY19zd2F5X3NwZWVkIjoxMS4wLCJQaXRjaCI6IkRvd24iLCJTcGluX3JhbmdlIjoxLjAsIlNwaW5fc3BlZWQiOjAuMCwiWWF3X0NoZWNrIjp0cnVlLCJZYXdfRGVsYXkiOjguMCwiWWF3X0wiOi0zNi4wLCJZYXdfTW9kaWZpZXJfb2Zmc2V0IjoxLjAsIllhd19Nb2RpZmllcl90eXBlIjoiRGlzYWJsZWQiLCJZYXdfUiI6NDkuMCwiWWF3X1N0YXRpYyI6MC4wLCJZYXdfVHlwZSI6IkxlZnQmUmlnaHQiLCJZYXdfYmFzZSI6IkF0IFRhcmdldCIsImRlZmVuc2l2ZV9lbmFibGUiOmZhbHNlLCJkZWZlbnNpdmVfcGl0Y2giOiJDdXN0b20iLCJkZWZlbnNpdmVfcGl0Y2hfY3VzdG9tIjo4OS4wLCJkZWZlbnNpdmVfcGl0Y2hfcmFuZG9tX21heCI6MC4wLCJkZWZlbnNpdmVfcGl0Y2hfcmFuZG9tX21pbiI6MC4wLCJkZWZlbnNpdmVfcGl0Y2hfc3dpdGNoXzEiOjAuMCwiZGVmZW5zaXZlX3BpdGNoX3N3aXRjaF8yIjowLjAsImRlZmVuc2l2ZV95YXciOiJDdXN0b20iLCJkZWZlbnNpdmVfeWF3X2N1c3RvbSI6OTAuMCwiZGVmZW5zaXZlX3lhd19qaXR0ZXJfMSI6MC4wLCJkZWZlbnNpdmVfeWF3X2ppdHRlcl8yIjowLjAsImRlZmVuc2l2ZV95YXdfaml0dGVyX2RlbGF5IjowLjAsImRlZmVuc2l2ZV95YXdfcmFuZG9tX21heCI6MC4wLCJkZWZlbnNpdmVfeWF3X3JhbmRvbV9taW4iOjAuMCwiZGVmZW5zaXZlX3lhd19zcGluX1JhbmdlIjowLjAsImRlZmVuc2l2ZV95YXdfc3Bpbl9TcGVlZCI6MC4wLCJkZWZlbnNpdmVfeWF3X3N3aXRjaF8xIjowLjAsImRlZmVuc2l2ZV95YXdfc3dpdGNoXzIiOjAuMCwiZGVzeW5jX2NoZWNrIjp0cnVlLCJkZXN5bmNfbW9kZSI6WyJ+Il0sImRlc3luY19vcHRpb25zIjpbIn4iXSwiZGVzeW5jX3BlZWsiOiJQZWVrIEZha2UiLCJkZXN5bmNfdHlwZSI6IkxlZnQmUmlnaHQiLCJkdXJhYmlsaXR5IjoxNC4wLCJmbF9MaW1pdCI6MTQuMCwiZmxfdHlwZXMiOiJEeW5hbWljIiwiZmxfdHlwZXNfaml0dGVyMSI6MS4wLCJmbF90eXBlc19qaXR0ZXIyIjoxLjAsImZsX3R5cGVzX3JhbmRvbV9tYXgiOjQuMCwiZmxfdHlwZXNfcmFuZG9tX21pbiI6MS4wLCJmbF92YXJpYWJpbGl0eSI6MTYuMCwib3ZlcnJpZGUiOnRydWV9LHsiRGVzeW5jX0wiOjAuMCwiRGVzeW5jX1IiOjAuMCwiRGVzeW5jX2Ftb3VudCI6MzAuMCwiRGVzeW5jX3JhbmRvbV9tYXgiOjM3LjAsIkRlc3luY19yYW5kb21fbWluIjo4LjAsIkRlc3luY19zd2F5X3NwZWVkIjowLjAsIlBpdGNoIjoiRG93biIsIlNwaW5fcmFuZ2UiOjEuMCwiU3Bpbl9zcGVlZCI6MC4wLCJZYXdfQ2hlY2siOnRydWUsIllhd19EZWxheSI6MTMuMCwiWWF3X0wiOi0zMi4wLCJZYXdfTW9kaWZpZXJfb2Zmc2V0IjoxLjAsIllhd19Nb2RpZmllcl90eXBlIjoiRGlzYWJsZWQiLCJZYXdfUiI6NDEuMCwiWWF3X1N0YXRpYyI6LTIuMCwiWWF3X1R5cGUiOiJMZWZ0JlJpZ2h0IiwiWWF3X2Jhc2UiOiJBdCBUYXJnZXQiLCJkZWZlbnNpdmVfZW5hYmxlIjpmYWxzZSwiZGVmZW5zaXZlX3BpdGNoIjoiVXAiLCJkZWZlbnNpdmVfcGl0Y2hfY3VzdG9tIjowLjAsImRlZmVuc2l2ZV9waXRjaF9yYW5kb21fbWF4IjowLjAsImRlZmVuc2l2ZV9waXRjaF9yYW5kb21fbWluIjowLjAsImRlZmVuc2l2ZV9waXRjaF9zd2l0Y2hfMSI6MC4wLCJkZWZlbnNpdmVfcGl0Y2hfc3dpdGNoXzIiOjAuMCwiZGVmZW5zaXZlX3lhdyI6IlNwaW4iLCJkZWZlbnNpdmVfeWF3X2N1c3RvbSI6MC4wLCJkZWZlbnNpdmVfeWF3X2ppdHRlcl8xIjowLjAsImRlZmVuc2l2ZV95YXdfaml0dGVyXzIiOjAuMCwiZGVmZW5zaXZlX3lhd19qaXR0ZXJfZGVsYXkiOjAuMCwiZGVmZW5zaXZlX3lhd19yYW5kb21fbWF4IjowLjAsImRlZmVuc2l2ZV95YXdfcmFuZG9tX21pbiI6MC4wLCJkZWZlbnNpdmVfeWF3X3NwaW5fUmFuZ2UiOjAuMCwiZGVmZW5zaXZlX3lhd19zcGluX1NwZWVkIjowLjAsImRlZmVuc2l2ZV95YXdfc3dpdGNoXzEiOjAuMCwiZGVmZW5zaXZlX3lhd19zd2l0Y2hfMiI6LTE4MC4wLCJkZXN5bmNfY2hlY2siOnRydWUsImRlc3luY19tb2RlIjpbIlJhbmRvbSIsIn4iXSwiZGVzeW5jX29wdGlvbnMiOlsiSml0dGVyIiwifiJdLCJkZXN5bmNfcGVlayI6IlBlZWsgRmFrZSIsImRlc3luY190eXBlIjoiU3RhdGljIiwiZHVyYWJpbGl0eSI6Mi4wLCJmbF9MaW1pdCI6MTQuMCwiZmxfdHlwZXMiOiJEeW5hbWljIiwiZmxfdHlwZXNfaml0dGVyMSI6MS4wLCJmbF90eXBlc19qaXR0ZXIyIjoxLjAsImZsX3R5cGVzX3JhbmRvbV9tYXgiOjEuMCwiZmxfdHlwZXNfcmFuZG9tX21pbiI6MS4wLCJmbF92YXJpYWJpbGl0eSI6MjIuMCwib3ZlcnJpZGUiOnRydWV9LHsiRGVzeW5jX0wiOjAuMCwiRGVzeW5jX1IiOjAuMCwiRGVzeW5jX2Ftb3VudCI6NjAuMCwiRGVzeW5jX3JhbmRvbV9tYXgiOjMwLjAsIkRlc3luY19yYW5kb21fbWluIjowLjAsIkRlc3luY19zd2F5X3NwZWVkIjowLjAsIlBpdGNoIjoiRG93biIsIlNwaW5fcmFuZ2UiOjEuMCwiU3Bpbl9zcGVlZCI6MC4wLCJZYXdfQ2hlY2siOnRydWUsIllhd19EZWxheSI6Mi4wLCJZYXdfTCI6LTI0LjAsIllhd19Nb2RpZmllcl9vZmZzZXQiOjU3LjAsIllhd19Nb2RpZmllcl90eXBlIjoiRGlzYWJsZWQiLCJZYXdfUiI6NTQuMCwiWWF3X1N0YXRpYyI6MzYuMCwiWWF3X1R5cGUiOiJMZWZ0JlJpZ2h0IiwiWWF3X2Jhc2UiOiJBdCBUYXJnZXQiLCJkZWZlbnNpdmVfZW5hYmxlIjpmYWxzZSwiZGVmZW5zaXZlX3BpdGNoIjoiQ3VzdG9tIiwiZGVmZW5zaXZlX3BpdGNoX2N1c3RvbSI6LTQwLjAsImRlZmVuc2l2ZV9waXRjaF9yYW5kb21fbWF4IjowLjAsImRlZmVuc2l2ZV9waXRjaF9yYW5kb21fbWluIjowLjAsImRlZmVuc2l2ZV9waXRjaF9zd2l0Y2hfMSI6MC4wLCJkZWZlbnNpdmVfcGl0Y2hfc3dpdGNoXzIiOjAuMCwiZGVmZW5zaXZlX3lhdyI6IlN3aXRjaCIsImRlZmVuc2l2ZV95YXdfY3VzdG9tIjowLjAsImRlZmVuc2l2ZV95YXdfaml0dGVyXzEiOjAuMCwiZGVmZW5zaXZlX3lhd19qaXR0ZXJfMiI6MC4wLCJkZWZlbnNpdmVfeWF3X2ppdHRlcl9kZWxheSI6MC4wLCJkZWZlbnNpdmVfeWF3X3JhbmRvbV9tYXgiOjAuMCwiZGVmZW5zaXZlX3lhd19yYW5kb21fbWluIjowLjAsImRlZmVuc2l2ZV95YXdfc3Bpbl9SYW5nZSI6MC4wLCJkZWZlbnNpdmVfeWF3X3NwaW5fU3BlZWQiOjAuMCwiZGVmZW5zaXZlX3lhd19zd2l0Y2hfMSI6LTE4MC4wLCJkZWZlbnNpdmVfeWF3X3N3aXRjaF8yIjotOTAuMCwiZGVzeW5jX2NoZWNrIjp0cnVlLCJkZXN5bmNfbW9kZSI6WyJSYW5kb20iLCJ+Il0sImRlc3luY19vcHRpb25zIjpbIkppdHRlciIsIn4iXSwiZGVzeW5jX3BlZWsiOiJQZWVrIEZha2UiLCJkZXN5bmNfdHlwZSI6IlN0YXRpYyIsImR1cmFiaWxpdHkiOjE0LjAsImZsX0xpbWl0IjoxNC4wLCJmbF90eXBlcyI6IkR5bmFtaWMiLCJmbF90eXBlc19qaXR0ZXIxIjoxLjAsImZsX3R5cGVzX2ppdHRlcjIiOjEuMCwiZmxfdHlwZXNfcmFuZG9tX21heCI6MS4wLCJmbF90eXBlc19yYW5kb21fbWluIjoxLjAsImZsX3ZhcmlhYmlsaXR5IjozMC4wLCJvdmVycmlkZSI6dHJ1ZX0seyJEZXN5bmNfTCI6MzMuMCwiRGVzeW5jX1IiOjM4LjAsIkRlc3luY19hbW91bnQiOjMwLjAsIkRlc3luY19yYW5kb21fbWF4IjoxNC4wLCJEZXN5bmNfcmFuZG9tX21pbiI6Ni4wLCJEZXN5bmNfc3dheV9zcGVlZCI6MjIuMCwiUGl0Y2giOiJEb3duIiwiU3Bpbl9yYW5nZSI6MS4wLCJTcGluX3NwZWVkIjowLjAsIllhd19DaGVjayI6dHJ1ZSwiWWF3X0RlbGF5IjoxLjAsIllhd19MIjotMzMuMCwiWWF3X01vZGlmaWVyX29mZnNldCI6NDAuMCwiWWF3X01vZGlmaWVyX3R5cGUiOiJEaXNhYmxlZCIsIllhd19SIjozMy4wLCJZYXdfU3RhdGljIjowLjAsIllhd19UeXBlIjoiTGVmdCZSaWdodCIsIllhd19iYXNlIjoiQXQgVGFyZ2V0IiwiZGVmZW5zaXZlX2VuYWJsZSI6ZmFsc2UsImRlZmVuc2l2ZV9waXRjaCI6IkN1c3RvbSIsImRlZmVuc2l2ZV9waXRjaF9jdXN0b20iOi00NS4wLCJkZWZlbnNpdmVfcGl0Y2hfcmFuZG9tX21heCI6MC4wLCJkZWZlbnNpdmVfcGl0Y2hfcmFuZG9tX21pbiI6MC4wLCJkZWZlbnNpdmVfcGl0Y2hfc3dpdGNoXzEiOjAuMCwiZGVmZW5zaXZlX3BpdGNoX3N3aXRjaF8yIjotMjEuMCwiZGVmZW5zaXZlX3lhdyI6IkN1c3RvbSIsImRlZmVuc2l2ZV95YXdfY3VzdG9tIjowLjAsImRlZmVuc2l2ZV95YXdfaml0dGVyXzEiOjAuMCwiZGVmZW5zaXZlX3lhd19qaXR0ZXJfMiI6MC4wLCJkZWZlbnNpdmVfeWF3X2ppdHRlcl9kZWxheSI6MC4wLCJkZWZlbnNpdmVfeWF3X3JhbmRvbV9tYXgiOjAuMCwiZGVmZW5zaXZlX3lhd19yYW5kb21fbWluIjowLjAsImRlZmVuc2l2ZV95YXdfc3Bpbl9SYW5nZSI6MC4wLCJkZWZlbnNpdmVfeWF3X3NwaW5fU3BlZWQiOjAuMCwiZGVmZW5zaXZlX3lhd19zd2l0Y2hfMSI6LTkwLjAsImRlZmVuc2l2ZV95YXdfc3dpdGNoXzIiOjAuMCwiZGVzeW5jX2NoZWNrIjp0cnVlLCJkZXN5bmNfbW9kZSI6WyJSYW5kb20iLCJ+Il0sImRlc3luY19vcHRpb25zIjpbIkppdHRlciIsIlJhbmRvbWl6ZSBKaXR0ZXIiLCJ+Il0sImRlc3luY19wZWVrIjoiUGVlayBGYWtlIiwiZGVzeW5jX3R5cGUiOiJTdGF0aWMiLCJkdXJhYmlsaXR5IjoxNC4wLCJmbF9MaW1pdCI6MTQuMCwiZmxfdHlwZXMiOiJTdGF0aWMiLCJmbF90eXBlc19qaXR0ZXIxIjoxLjAsImZsX3R5cGVzX2ppdHRlcjIiOjEuMCwiZmxfdHlwZXNfcmFuZG9tX21heCI6MS4wLCJmbF90eXBlc19yYW5kb21fbWluIjoxLjAsImZsX3ZhcmlhYmlsaXR5IjowLjAsIm92ZXJyaWRlIjp0cnVlfSx7IkRlc3luY19MIjowLjAsIkRlc3luY19SIjowLjAsIkRlc3luY19hbW91bnQiOjQ4LjAsIkRlc3luY19yYW5kb21fbWF4IjowLjAsIkRlc3luY19yYW5kb21fbWluIjowLjAsIkRlc3luY19zd2F5X3NwZWVkIjoxNy4wLCJQaXRjaCI6IkRvd24iLCJTcGluX3JhbmdlIjoxLjAsIlNwaW5fc3BlZWQiOjAuMCwiWWF3X0NoZWNrIjp0cnVlLCJZYXdfRGVsYXkiOjIuMCwiWWF3X0wiOi00MS4wLCJZYXdfTW9kaWZpZXJfb2Zmc2V0Ijo0MC4wLCJZYXdfTW9kaWZpZXJfdHlwZSI6IkRpc2FibGVkIiwiWWF3X1IiOjQ5LjAsIllhd19TdGF0aWMiOjAuMCwiWWF3X1R5cGUiOiJMZWZ0JlJpZ2h0IiwiWWF3X2Jhc2UiOiJBdCBUYXJnZXQiLCJkZWZlbnNpdmVfZW5hYmxlIjpmYWxzZSwiZGVmZW5zaXZlX3BpdGNoIjoiQ3VzdG9tIiwiZGVmZW5zaXZlX3BpdGNoX2N1c3RvbSI6LTI3LjAsImRlZmVuc2l2ZV9waXRjaF9yYW5kb21fbWF4IjowLjAsImRlZmVuc2l2ZV9waXRjaF9yYW5kb21fbWluIjowLjAsImRlZmVuc2l2ZV9waXRjaF9zd2l0Y2hfMSI6LTIxLjAsImRlZmVuc2l2ZV9waXRjaF9zd2l0Y2hfMiI6MC4wLCJkZWZlbnNpdmVfeWF3IjoiQ3VzdG9tIiwiZGVmZW5zaXZlX3lhd19jdXN0b20iOi0xODAuMCwiZGVmZW5zaXZlX3lhd19qaXR0ZXJfMSI6MC4wLCJkZWZlbnNpdmVfeWF3X2ppdHRlcl8yIjowLjAsImRlZmVuc2l2ZV95YXdfaml0dGVyX2RlbGF5IjowLjAsImRlZmVuc2l2ZV95YXdfcmFuZG9tX21heCI6MC4wLCJkZWZlbnNpdmVfeWF3X3JhbmRvbV9taW4iOjAuMCwiZGVmZW5zaXZlX3lhd19zcGluX1JhbmdlIjozNjAuMCwiZGVmZW5zaXZlX3lhd19zcGluX1NwZWVkIjowLjAsImRlZmVuc2l2ZV95YXdfc3dpdGNoXzEiOjAuMCwiZGVmZW5zaXZlX3lhd19zd2l0Y2hfMiI6MC4wLCJkZXN5bmNfY2hlY2siOnRydWUsImRlc3luY19tb2RlIjpbIn4iXSwiZGVzeW5jX29wdGlvbnMiOlsiQXZvaWQgT3ZlcmxhcCIsIkppdHRlciIsIlJhbmRvbWl6ZSBKaXR0ZXIiLCJBbnRpIEJydXRlZm9yY2UiLCJ+Il0sImRlc3luY19wZWVrIjoiUGVlayBGYWtlIiwiZGVzeW5jX3R5cGUiOiJTdGF0aWMiLCJkdXJhYmlsaXR5Ijo4LjAsImZsX0xpbWl0IjoxNC4wLCJmbF90eXBlcyI6IlN0YXRpYyIsImZsX3R5cGVzX2ppdHRlcjEiOjEuMCwiZmxfdHlwZXNfaml0dGVyMiI6MS4wLCJmbF90eXBlc19yYW5kb21fbWF4IjoxLjAsImZsX3R5cGVzX3JhbmRvbV9taW4iOjEuMCwiZmxfdmFyaWFiaWxpdHkiOjI5LjAsIm92ZXJyaWRlIjp0cnVlfSx7IkRlc3luY19MIjowLjAsIkRlc3luY19SIjowLjAsIkRlc3luY19hbW91bnQiOjUwLjAsIkRlc3luY19yYW5kb21fbWF4IjoyMC4wLCJEZXN5bmNfcmFuZG9tX21pbiI6MC4wLCJEZXN5bmNfc3dheV9zcGVlZCI6MC4wLCJQaXRjaCI6IkRvd24iLCJTcGluX3JhbmdlIjoxLjAsIlNwaW5fc3BlZWQiOjAuMCwiWWF3X0NoZWNrIjp0cnVlLCJZYXdfRGVsYXkiOjguMCwiWWF3X0wiOi0xNS4wLCJZYXdfTW9kaWZpZXJfb2Zmc2V0IjotNjUuMCwiWWF3X01vZGlmaWVyX3R5cGUiOiJEaXNhYmxlZCIsIllhd19SIjo0OS4wLCJZYXdfU3RhdGljIjoxNS4wLCJZYXdfVHlwZSI6IkxlZnQmUmlnaHQiLCJZYXdfYmFzZSI6IkF0IFRhcmdldCIsImRlZmVuc2l2ZV9lbmFibGUiOmZhbHNlLCJkZWZlbnNpdmVfcGl0Y2giOiJVcCIsImRlZmVuc2l2ZV9waXRjaF9jdXN0b20iOjAuMCwiZGVmZW5zaXZlX3BpdGNoX3JhbmRvbV9tYXgiOjAuMCwiZGVmZW5zaXZlX3BpdGNoX3JhbmRvbV9taW4iOjAuMCwiZGVmZW5zaXZlX3BpdGNoX3N3aXRjaF8xIjowLjAsImRlZmVuc2l2ZV9waXRjaF9zd2l0Y2hfMiI6MC4wLCJkZWZlbnNpdmVfeWF3IjoiU3BpbiIsImRlZmVuc2l2ZV95YXdfY3VzdG9tIjowLjAsImRlZmVuc2l2ZV95YXdfaml0dGVyXzEiOjAuMCwiZGVmZW5zaXZlX3lhd19qaXR0ZXJfMiI6MC4wLCJkZWZlbnNpdmVfeWF3X2ppdHRlcl9kZWxheSI6MC4wLCJkZWZlbnNpdmVfeWF3X3JhbmRvbV9tYXgiOjAuMCwiZGVmZW5zaXZlX3lhd19yYW5kb21fbWluIjowLjAsImRlZmVuc2l2ZV95YXdfc3Bpbl9SYW5nZSI6MzYwLjAsImRlZmVuc2l2ZV95YXdfc3Bpbl9TcGVlZCI6LTM2LjAsImRlZmVuc2l2ZV95YXdfc3dpdGNoXzEiOjAuMCwiZGVmZW5zaXZlX3lhd19zd2l0Y2hfMiI6MC4wLCJkZXN5bmNfY2hlY2siOnRydWUsImRlc3luY19tb2RlIjpbIlJhbmRvbSIsIn4iXSwiZGVzeW5jX29wdGlvbnMiOlsiQXZvaWQgT3ZlcmxhcCIsIkppdHRlciIsIlJhbmRvbWl6ZSBKaXR0ZXIiLCJ+Il0sImRlc3luY19wZWVrIjoiUGVlayBGYWtlIiwiZGVzeW5jX3R5cGUiOiJTdGF0aWMiLCJkdXJhYmlsaXR5IjoxNC4wLCJmbF9MaW1pdCI6MTIuMCwiZmxfdHlwZXMiOiJTdGF0aWMiLCJmbF90eXBlc19qaXR0ZXIxIjoxLjAsImZsX3R5cGVzX2ppdHRlcjIiOjEuMCwiZmxfdHlwZXNfcmFuZG9tX21heCI6MS4wLCJmbF90eXBlc19yYW5kb21fbWluIjoxLjAsImZsX3ZhcmlhYmlsaXR5IjowLjAsIm92ZXJyaWRlIjp0cnVlfSx7IkRlc3luY19MIjowLjAsIkRlc3luY19SIjowLjAsIkRlc3luY19hbW91bnQiOjAuMCwiRGVzeW5jX3JhbmRvbV9tYXgiOjAuMCwiRGVzeW5jX3JhbmRvbV9taW4iOjAuMCwiRGVzeW5jX3N3YXlfc3BlZWQiOjAuMCwiUGl0Y2giOiJEb3duIiwiU3Bpbl9yYW5nZSI6MS4wLCJTcGluX3NwZWVkIjowLjAsIllhd19DaGVjayI6dHJ1ZSwiWWF3X0RlbGF5IjoxLjAsIllhd19MIjowLjAsIllhd19Nb2RpZmllcl9vZmZzZXQiOjEuMCwiWWF3X01vZGlmaWVyX3R5cGUiOiJEaXNhYmxlZCIsIllhd19SIjowLjAsIllhd19TdGF0aWMiOjYuMCwiWWF3X1R5cGUiOiJTdGF0aWMiLCJZYXdfYmFzZSI6IkF0IFRhcmdldCIsImRlZmVuc2l2ZV9lbmFibGUiOmZhbHNlLCJkZWZlbnNpdmVfcGl0Y2giOiJVcCIsImRlZmVuc2l2ZV9waXRjaF9jdXN0b20iOjAuMCwiZGVmZW5zaXZlX3BpdGNoX3JhbmRvbV9tYXgiOjAuMCwiZGVmZW5zaXZlX3BpdGNoX3JhbmRvbV9taW4iOjAuMCwiZGVmZW5zaXZlX3BpdGNoX3N3aXRjaF8xIjowLjAsImRlZmVuc2l2ZV9waXRjaF9zd2l0Y2hfMiI6MC4wLCJkZWZlbnNpdmVfeWF3IjoiU3BpbiIsImRlZmVuc2l2ZV95YXdfY3VzdG9tIjowLjAsImRlZmVuc2l2ZV95YXdfaml0dGVyXzEiOjAuMCwiZGVmZW5zaXZlX3lhd19qaXR0ZXJfMiI6MC4wLCJkZWZlbnNpdmVfeWF3X2ppdHRlcl9kZWxheSI6MC4wLCJkZWZlbnNpdmVfeWF3X3JhbmRvbV9tYXgiOjAuMCwiZGVmZW5zaXZlX3lhd19yYW5kb21fbWluIjowLjAsImRlZmVuc2l2ZV95YXdfc3Bpbl9SYW5nZSI6MC4wLCJkZWZlbnNpdmVfeWF3X3NwaW5fU3BlZWQiOjAuMCwiZGVmZW5zaXZlX3lhd19zd2l0Y2hfMSI6MC4wLCJkZWZlbnNpdmVfeWF3X3N3aXRjaF8yIjowLjAsImRlc3luY19jaGVjayI6ZmFsc2UsImRlc3luY19tb2RlIjpbIn4iXSwiZGVzeW5jX29wdGlvbnMiOlsifiJdLCJkZXN5bmNfcGVlayI6Ik9mZiIsImRlc3luY190eXBlIjoiU3RhdGljIiwiZHVyYWJpbGl0eSI6Mi4wLCJmbF9MaW1pdCI6MTQuMCwiZmxfdHlwZXMiOiJTdGF0aWMiLCJmbF90eXBlc19qaXR0ZXIxIjoxLjAsImZsX3R5cGVzX2ppdHRlcjIiOjEuMCwiZmxfdHlwZXNfcmFuZG9tX21heCI6MS4wLCJmbF90eXBlc19yYW5kb21fbWluIjoxLjAsImZsX3ZhcmlhYmlsaXR5IjoyNS4wLCJvdmVycmlkZSI6ZmFsc2V9LHsiRGVzeW5jX0wiOjAuMCwiRGVzeW5jX1IiOjAuMCwiRGVzeW5jX2Ftb3VudCI6LTYwLjAsIkRlc3luY19yYW5kb21fbWF4IjowLjAsIkRlc3luY19yYW5kb21fbWluIjowLjAsIkRlc3luY19zd2F5X3NwZWVkIjowLjAsIlBpdGNoIjoiRG93biIsIlNwaW5fcmFuZ2UiOjEuMCwiU3Bpbl9zcGVlZCI6MC4wLCJZYXdfQ2hlY2siOnRydWUsIllhd19EZWxheSI6MTYuMCwiWWF3X0wiOi0yLjAsIllhd19Nb2RpZmllcl9vZmZzZXQiOjYuMCwiWWF3X01vZGlmaWVyX3R5cGUiOiJEaXNhYmxlZCIsIllhd19SIjoxNS4wLCJZYXdfU3RhdGljIjowLjAsIllhd19UeXBlIjoiTGVmdCZSaWdodCIsIllhd19iYXNlIjoiQXQgVGFyZ2V0IiwiZGVmZW5zaXZlX2VuYWJsZSI6ZmFsc2UsImRlZmVuc2l2ZV9waXRjaCI6IlVwIiwiZGVmZW5zaXZlX3BpdGNoX2N1c3RvbSI6MC4wLCJkZWZlbnNpdmVfcGl0Y2hfcmFuZG9tX21heCI6MC4wLCJkZWZlbnNpdmVfcGl0Y2hfcmFuZG9tX21pbiI6MC4wLCJkZWZlbnNpdmVfcGl0Y2hfc3dpdGNoXzEiOjAuMCwiZGVmZW5zaXZlX3BpdGNoX3N3aXRjaF8yIjowLjAsImRlZmVuc2l2ZV95YXciOiJTcGluIiwiZGVmZW5zaXZlX3lhd19jdXN0b20iOjAuMCwiZGVmZW5zaXZlX3lhd19qaXR0ZXJfMSI6MC4wLCJkZWZlbnNpdmVfeWF3X2ppdHRlcl8yIjowLjAsImRlZmVuc2l2ZV95YXdfaml0dGVyX2RlbGF5IjowLjAsImRlZmVuc2l2ZV95YXdfcmFuZG9tX21heCI6MC4wLCJkZWZlbnNpdmVfeWF3X3JhbmRvbV9taW4iOjAuMCwiZGVmZW5zaXZlX3lhd19zcGluX1JhbmdlIjowLjAsImRlZmVuc2l2ZV95YXdfc3Bpbl9TcGVlZCI6MC4wLCJkZWZlbnNpdmVfeWF3X3N3aXRjaF8xIjowLjAsImRlZmVuc2l2ZV95YXdfc3dpdGNoXzIiOjAuMCwiZGVzeW5jX2NoZWNrIjp0cnVlLCJkZXN5bmNfbW9kZSI6WyJ+Il0sImRlc3luY19vcHRpb25zIjpbIkFudGkgQnJ1dGVmb3JjZSIsIn4iXSwiZGVzeW5jX3BlZWsiOiJQZWVrIEZha2UiLCJkZXN5bmNfdHlwZSI6IlN0YXRpYyIsImR1cmFiaWxpdHkiOjE0LjAsImZsX0xpbWl0IjoxNC4wLCJmbF90eXBlcyI6IlN0YXRpYyIsImZsX3R5cGVzX2ppdHRlcjEiOjEuMCwiZmxfdHlwZXNfaml0dGVyMiI6MS4wLCJmbF90eXBlc19yYW5kb21fbWF4IjoxLjAsImZsX3R5cGVzX3JhbmRvbV9taW4iOjEuMCwiZmxfdmFyaWFiaWxpdHkiOjIwLjAsIm92ZXJyaWRlIjp0cnVlfV0seyJRdWVzdGVzIjoxLjAsIlRhYiI6Mi4wLCJjaGFuZ2VfbG9ncyI6NS4wLCJjbG91ZCI6Mi4wLCJjbG91ZF9sZWFkZXJib2FyZF9saXN0IjoyLjAsImNvbG9yX2FjY2VudCI6IiNGRkZGRkZGRiJ9LHsiU2FmZV9oZWFkIjpbIkM0IiwiS25pZmUiLCJHcmVuYWRlIiwifiJdLCJTYWZlX2hlYWRfWWF3X0FkZCI6MTUuMCwiU2FmZV9oZWFkX1lhd19UYXJnZXQiOiJMb2NhbCBWaWV3IiwiU3RhdGVzIjoyLjAsIlRhYiI6Mi4wfSx7ImFpciI6IlN0YXRpYyIsImdyb3VuZCI6Ik1vb25XYWxrIiwibWFpbiI6WyJHcm91bmQiLCJBaXIiLCJPdGhlciIsIn4iXSwib3RoZXIiOlsiMCBQaXRjaCBPbiBMYW5kIiwifiJdfSx7IkNvbnNvbGVfY29sb3IiOiIjOTc5Nzk3OEQiLCJhaXJfc3R1Y2siOmZhbHNlLCJhdXRvX2JyZWFrX2xjIjpmYWxzZSwiYXV0b19icmVha19sY19vcHRpb25zIjpbIkFsbG93IEluIEFpciIsIn4iXSwiYXV0b19icmVha19sY19vcHRpb25zX2RlbGF5IjowLjAsImNsYW50YWciOmZhbHNlLCJjbGFudGFnX2lucHV0IjoiTWVkdXNhLnVubyIsImNsYW50YWdfdHlwZXMiOiJBdGxhbnRpYyIsImZhc3RfbGFkZGVyIjp0cnVlLCJncmVuYWRlX3JhZGl1cyI6dHJ1ZSwiZ3JlbmFkZV9zZWxlY3QiOlsxLjAsMi4wLCJ+Il0sImdyZW5hZGVfc3VwZXJ0b3NzIjp0cnVlLCJsb2dnZXIiOnRydWUsImxvZ2dlcl9TdHlsZSI6IkdyYWRpZW50IiwibG9nZ2VyX3JvdW5kIjowLjAsImxvZ2dlcl95IjoxMTMuMCwibW9sb3Rvdl9jb2xvciI6IiM3NEMwMjlGRiIsIm1vbG90b3ZfY29sb3IyIjoiI0ZGMDAwMEZGIiwic21va2VfY29sb3IiOiIjRkZGRkZGQjQiLCJ0cmFzaHRhbGsiOmZhbHNlLCJ0cmFzaHRhbGtfZGVsYXkiOjEuMCwidHJhc2h0YWxrX3R5cGUiOiJNZWR1c2EudW5vIiwidW5sb2NrX3Bpbmdfc3Bpa2UiOnRydWUsInZpZXdfbW9kZWwiOnRydWUsInZpZXdfbW9kZWxfZm92Ijo5OC4wLCJ2aWV3X21vZGVsX3giOjEuMCwidmlld19tb2RlbF95IjotOC4wLCJ2aWV3X21vZGVsX3oiOjEuMH0seyJBc3BlY3RfcmF0aW8iOjAuMCwiY3Jvc3NoYWlyX2luZF9hbmltYXRpb25fc3BlZWQiOjEuMCwiY3Jvc3NoYWlyX2luZF9jb2xvcl8xIjoiI0ZGRkZGRkZGIiwiY3Jvc3NoYWlyX2luZF9jb2xvcl8yIjoiIzNCM0IzQkZGIiwiY3Jvc3NoYWlyX2luZF9jb2xvcl8zIjoiI0ZGRkZGRkZGIiwiY3Jvc3NoYWlyX2luZF9zZXR0aW5ncyI6WyJDb25kaXRpb25zIiwiQmluZHMiLCJ+Il0sImNyb3NzaGFpcl9pbmRfdGV4dF9zdHlsZSI6IlJld29yayIsImNyb3NzaGFpcl9pbmRfeSI6MS4wLCJjdXN0b21zY29wZSI6dHJ1ZSwiY3VzdG9tc2NvcGVfQ29sb3IiOiIjRkZGRkZGRkYiLCJjdXN0b21zY29wZV9HYXAiOjEyLjAsImN1c3RvbXNjb3BlX0xlbmdodCI6NjUuMCwiY3VzdG9tc2NvcGVfaW52ZXJ0IjpmYWxzZSwiY3VzdG9tc2NvcGVfc2V0dGluZ3NfbGluZXMiOlsifiJdLCJzaGFyZWRfaWNvbiI6dHJ1ZSwid2F0ZXJtYXJrX2J1aWxkIjp0cnVlLCJ3YXRlcm1hcmtfcG9zaXRpb24iOiJMZWZ0Iiwid2F0ZXJtYXJrX3R5cGUiOiJTb2x1cyIsIndpZGdldHMiOlsiS2V5YmluZCBMaXN0IiwiV2F0ZXJtYXJrIiwiU3BlY3RhdG9yIExpc3QiLCJDcm9zc2hhaXIgSW5kaWNhdG9ycyIsIn4iXSwid2lkZ2V0c19nbG93IjpbIn4iXX1d"
    }
};
v504.menu_list = v504.menu_list or {
    [1] = "Default Config"
};
v504.cfg_list[1][2] = "NL->Atlantic.oce->Config->W1t7IkRlc3luY19MIjowLjAsIkRlc3luY19SIjowLjAsIkRlc3luY19hbW91bnQiOjAuMCwiRGVzeW5jX3JhbmRvbV9tYXgiOjAuMCwiRGVzeW5jX3JhbmRvbV9taW4iOjAuMCwiRGVzeW5jX3N3YXlfc3BlZWQiOjAuMCwiUGl0Y2giOiJEaXNhYmxlZCIsIlNwaW5fcmFuZ2UiOjEuMCwiU3Bpbl9zcGVlZCI6MC4wLCJZYXdfQ2hlY2siOmZhbHNlLCJZYXdfRGVsYXkiOjEuMCwiWWF3X0wiOjAuMCwiWWF3X01vZGlmaWVyX29mZnNldCI6MS4wLCJZYXdfTW9kaWZpZXJfdHlwZSI6IkRpc2FibGVkIiwiWWF3X1IiOjAuMCwiWWF3X1N0YXRpYyI6MC4wLCJZYXdfVHlwZSI6IlN0YXRpYyIsIllhd19iYXNlIjoiTG9jYWwgVmlldyIsImRlZmVuc2l2ZV9lbmFibGUiOmZhbHNlLCJkZWZlbnNpdmVfcGl0Y2giOiJVcCIsImRlZmVuc2l2ZV9waXRjaF9jdXN0b20iOjAuMCwiZGVmZW5zaXZlX3BpdGNoX3JhbmRvbV9tYXgiOjAuMCwiZGVmZW5zaXZlX3BpdGNoX3JhbmRvbV9taW4iOjAuMCwiZGVmZW5zaXZlX3BpdGNoX3N3aXRjaF8xIjowLjAsImRlZmVuc2l2ZV9waXRjaF9zd2l0Y2hfMiI6MC4wLCJkZWZlbnNpdmVfeWF3IjoiU3BpbiIsImRlZmVuc2l2ZV95YXdfY3VzdG9tIjowLjAsImRlZmVuc2l2ZV95YXdfaml0dGVyXzEiOjAuMCwiZGVmZW5zaXZlX3lhd19qaXR0ZXJfMiI6MC4wLCJkZWZlbnNpdmVfeWF3X2ppdHRlcl9kZWxheSI6MC4wLCJkZWZlbnNpdmVfeWF3X3JhbmRvbV9tYXgiOjAuMCwiZGVmZW5zaXZlX3lhd19yYW5kb21fbWluIjowLjAsImRlZmVuc2l2ZV95YXdfc3Bpbl9SYW5nZSI6MC4wLCJkZWZlbnNpdmVfeWF3X3NwaW5fU3BlZWQiOjAuMCwiZGVmZW5zaXZlX3lhd19zd2l0Y2hfMSI6MC4wLCJkZWZlbnNpdmVfeWF3X3N3aXRjaF8yIjowLjAsImRlc3luY19jaGVjayI6ZmFsc2UsImRlc3luY19tb2RlIjpbIn4iXSwiZGVzeW5jX29wdGlvbnMiOlsifiJdLCJkZXN5bmNfcGVlayI6Ik9mZiIsImRlc3luY190eXBlIjoiU3RhdGljIiwiZHVyYWJpbGl0eSI6Mi4wLCJmbF9MaW1pdCI6MC4wLCJmbF90eXBlcyI6IlN0YXRpYyIsImZsX3R5cGVzX2ppdHRlcjEiOjEuMCwiZmxfdHlwZXNfaml0dGVyMiI6MS4wLCJmbF90eXBlc19yYW5kb21fbWF4IjoxLjAsImZsX3R5cGVzX3JhbmRvbV9taW4iOjEuMCwiZmxfdmFyaWFiaWxpdHkiOjAuMCwib3ZlcnJpZGUiOmZhbHNlfSx7IkRlc3luY19MIjowLjAsIkRlc3luY19SIjowLjAsIkRlc3luY19hbW91bnQiOjU1LjAsIkRlc3luY19yYW5kb21fbWF4IjoxMC4wLCJEZXN5bmNfcmFuZG9tX21pbiI6MC4wLCJEZXN5bmNfc3dheV9zcGVlZCI6Mi4wLCJQaXRjaCI6IkRvd24iLCJTcGluX3JhbmdlIjoxLjAsIlNwaW5fc3BlZWQiOjAuMCwiWWF3X0NoZWNrIjp0cnVlLCJZYXdfRGVsYXkiOjAuMCwiWWF3X0wiOi0yOC4wLCJZYXdfTW9kaWZpZXJfb2Zmc2V0IjotNDguMCwiWWF3X01vZGlmaWVyX3R5cGUiOiJEaXNhYmxlZCIsIllhd19SIjo1NC4wLCJZYXdfU3RhdGljIjoxOS4wLCJZYXdfVHlwZSI6IkxlZnQmUmlnaHQiLCJZYXdfYmFzZSI6IkF0IFRhcmdldCIsImRlZmVuc2l2ZV9lbmFibGUiOmZhbHNlLCJkZWZlbnNpdmVfcGl0Y2giOiJVcCIsImRlZmVuc2l2ZV9waXRjaF9jdXN0b20iOjAuMCwiZGVmZW5zaXZlX3BpdGNoX3JhbmRvbV9tYXgiOjg5LjAsImRlZmVuc2l2ZV9waXRjaF9yYW5kb21fbWluIjotODkuMCwiZGVmZW5zaXZlX3BpdGNoX3N3aXRjaF8xIjotODkuMCwiZGVmZW5zaXZlX3BpdGNoX3N3aXRjaF8yIjowLjAsImRlZmVuc2l2ZV95YXciOiJKaXR0ZXIiLCJkZWZlbnNpdmVfeWF3X2N1c3RvbSI6LTE4MC4wLCJkZWZlbnNpdmVfeWF3X2ppdHRlcl8xIjotMTgwLjAsImRlZmVuc2l2ZV95YXdfaml0dGVyXzIiOjAuMCwiZGVmZW5zaXZlX3lhd19qaXR0ZXJfZGVsYXkiOjY0LjAsImRlZmVuc2l2ZV95YXdfcmFuZG9tX21heCI6MC4wLCJkZWZlbnNpdmVfeWF3X3JhbmRvbV9taW4iOjAuMCwiZGVmZW5zaXZlX3lhd19zcGluX1JhbmdlIjotMzYwLjAsImRlZmVuc2l2ZV95YXdfc3Bpbl9TcGVlZCI6MC4wLCJkZWZlbnNpdmVfeWF3X3N3aXRjaF8xIjotMTgwLjAsImRlZmVuc2l2ZV95YXdfc3dpdGNoXzIiOjAuMCwiZGVzeW5jX2NoZWNrIjp0cnVlLCJkZXN5bmNfbW9kZSI6WyJSYW5kb20iLCJ+Il0sImRlc3luY19vcHRpb25zIjpbIlJhbmRvbWl6ZSBKaXR0ZXIiLCJBbnRpIEJydXRlZm9yY2UiLCJ+Il0sImRlc3luY19wZWVrIjoiUGVlayBGYWtlIiwiZGVzeW5jX3R5cGUiOiJTdGF0aWMiLCJkdXJhYmlsaXR5IjoxNC4wLCJmbF9MaW1pdCI6MTQuMCwiZmxfdHlwZXMiOiJEeW5hbWljIiwiZmxfdHlwZXNfaml0dGVyMSI6MTQuMCwiZmxfdHlwZXNfaml0dGVyMiI6MTQuMCwiZmxfdHlwZXNfcmFuZG9tX21heCI6MS4wLCJmbF90eXBlc19yYW5kb21fbWluIjoxLjAsImZsX3ZhcmlhYmlsaXR5IjowLjAsIm92ZXJyaWRlIjp0cnVlfSx7IkRlc3luY19MIjo0OC4wLCJEZXN5bmNfUiI6NDguMCwiRGVzeW5jX2Ftb3VudCI6NjAuMCwiRGVzeW5jX3JhbmRvbV9tYXgiOjE0LjAsIkRlc3luY19yYW5kb21fbWluIjowLjAsIkRlc3luY19zd2F5X3NwZWVkIjoxMS4wLCJQaXRjaCI6IkRvd24iLCJTcGluX3JhbmdlIjoxLjAsIlNwaW5fc3BlZWQiOjAuMCwiWWF3X0NoZWNrIjp0cnVlLCJZYXdfRGVsYXkiOjguMCwiWWF3X0wiOi0zNi4wLCJZYXdfTW9kaWZpZXJfb2Zmc2V0IjoxLjAsIllhd19Nb2RpZmllcl90eXBlIjoiRGlzYWJsZWQiLCJZYXdfUiI6NDkuMCwiWWF3X1N0YXRpYyI6MC4wLCJZYXdfVHlwZSI6IkxlZnQmUmlnaHQiLCJZYXdfYmFzZSI6IkF0IFRhcmdldCIsImRlZmVuc2l2ZV9lbmFibGUiOmZhbHNlLCJkZWZlbnNpdmVfcGl0Y2giOiJDdXN0b20iLCJkZWZlbnNpdmVfcGl0Y2hfY3VzdG9tIjo4OS4wLCJkZWZlbnNpdmVfcGl0Y2hfcmFuZG9tX21heCI6MC4wLCJkZWZlbnNpdmVfcGl0Y2hfcmFuZG9tX21pbiI6MC4wLCJkZWZlbnNpdmVfcGl0Y2hfc3dpdGNoXzEiOjAuMCwiZGVmZW5zaXZlX3BpdGNoX3N3aXRjaF8yIjowLjAsImRlZmVuc2l2ZV95YXciOiJDdXN0b20iLCJkZWZlbnNpdmVfeWF3X2N1c3RvbSI6OTAuMCwiZGVmZW5zaXZlX3lhd19qaXR0ZXJfMSI6MC4wLCJkZWZlbnNpdmVfeWF3X2ppdHRlcl8yIjowLjAsImRlZmVuc2l2ZV95YXdfaml0dGVyX2RlbGF5IjowLjAsImRlZmVuc2l2ZV95YXdfcmFuZG9tX21heCI6MC4wLCJkZWZlbnNpdmVfeWF3X3JhbmRvbV9taW4iOjAuMCwiZGVmZW5zaXZlX3lhd19zcGluX1JhbmdlIjowLjAsImRlZmVuc2l2ZV95YXdfc3Bpbl9TcGVlZCI6MC4wLCJkZWZlbnNpdmVfeWF3X3N3aXRjaF8xIjowLjAsImRlZmVuc2l2ZV95YXdfc3dpdGNoXzIiOjAuMCwiZGVzeW5jX2NoZWNrIjp0cnVlLCJkZXN5bmNfbW9kZSI6WyJ+Il0sImRlc3luY19vcHRpb25zIjpbIn4iXSwiZGVzeW5jX3BlZWsiOiJQZWVrIEZha2UiLCJkZXN5bmNfdHlwZSI6IkxlZnQmUmlnaHQiLCJkdXJhYmlsaXR5IjoxNC4wLCJmbF9MaW1pdCI6MTQuMCwiZmxfdHlwZXMiOiJEeW5hbWljIiwiZmxfdHlwZXNfaml0dGVyMSI6MS4wLCJmbF90eXBlc19qaXR0ZXIyIjoxLjAsImZsX3R5cGVzX3JhbmRvbV9tYXgiOjQuMCwiZmxfdHlwZXNfcmFuZG9tX21pbiI6MS4wLCJmbF92YXJpYWJpbGl0eSI6MTYuMCwib3ZlcnJpZGUiOnRydWV9LHsiRGVzeW5jX0wiOjAuMCwiRGVzeW5jX1IiOjAuMCwiRGVzeW5jX2Ftb3VudCI6MzAuMCwiRGVzeW5jX3JhbmRvbV9tYXgiOjM3LjAsIkRlc3luY19yYW5kb21fbWluIjo4LjAsIkRlc3luY19zd2F5X3NwZWVkIjowLjAsIlBpdGNoIjoiRG93biIsIlNwaW5fcmFuZ2UiOjEuMCwiU3Bpbl9zcGVlZCI6MC4wLCJZYXdfQ2hlY2siOnRydWUsIllhd19EZWxheSI6MTMuMCwiWWF3X0wiOi0zMi4wLCJZYXdfTW9kaWZpZXJfb2Zmc2V0IjoxLjAsIllhd19Nb2RpZmllcl90eXBlIjoiRGlzYWJsZWQiLCJZYXdfUiI6NDEuMCwiWWF3X1N0YXRpYyI6LTIuMCwiWWF3X1R5cGUiOiJMZWZ0JlJpZ2h0IiwiWWF3X2Jhc2UiOiJBdCBUYXJnZXQiLCJkZWZlbnNpdmVfZW5hYmxlIjpmYWxzZSwiZGVmZW5zaXZlX3BpdGNoIjoiVXAiLCJkZWZlbnNpdmVfcGl0Y2hfY3VzdG9tIjowLjAsImRlZmVuc2l2ZV9waXRjaF9yYW5kb21fbWF4IjowLjAsImRlZmVuc2l2ZV9waXRjaF9yYW5kb21fbWluIjowLjAsImRlZmVuc2l2ZV9waXRjaF9zd2l0Y2hfMSI6MC4wLCJkZWZlbnNpdmVfcGl0Y2hfc3dpdGNoXzIiOjAuMCwiZGVmZW5zaXZlX3lhdyI6IlNwaW4iLCJkZWZlbnNpdmVfeWF3X2N1c3RvbSI6MC4wLCJkZWZlbnNpdmVfeWF3X2ppdHRlcl8xIjowLjAsImRlZmVuc2l2ZV95YXdfaml0dGVyXzIiOjAuMCwiZGVmZW5zaXZlX3lhd19qaXR0ZXJfZGVsYXkiOjAuMCwiZGVmZW5zaXZlX3lhd19yYW5kb21fbWF4IjowLjAsImRlZmVuc2l2ZV95YXdfcmFuZG9tX21pbiI6MC4wLCJkZWZlbnNpdmVfeWF3X3NwaW5fUmFuZ2UiOjAuMCwiZGVmZW5zaXZlX3lhd19zcGluX1NwZWVkIjowLjAsImRlZmVuc2l2ZV95YXdfc3dpdGNoXzEiOjAuMCwiZGVmZW5zaXZlX3lhd19zd2l0Y2hfMiI6LTE4MC4wLCJkZXN5bmNfY2hlY2siOnRydWUsImRlc3luY19tb2RlIjpbIlJhbmRvbSIsIn4iXSwiZGVzeW5jX29wdGlvbnMiOlsiSml0dGVyIiwifiJdLCJkZXN5bmNfcGVlayI6IlBlZWsgRmFrZSIsImRlc3luY190eXBlIjoiU3RhdGljIiwiZHVyYWJpbGl0eSI6Mi4wLCJmbF9MaW1pdCI6MTQuMCwiZmxfdHlwZXMiOiJEeW5hbWljIiwiZmxfdHlwZXNfaml0dGVyMSI6MS4wLCJmbF90eXBlc19qaXR0ZXIyIjoxLjAsImZsX3R5cGVzX3JhbmRvbV9tYXgiOjEuMCwiZmxfdHlwZXNfcmFuZG9tX21pbiI6MS4wLCJmbF92YXJpYWJpbGl0eSI6MjIuMCwib3ZlcnJpZGUiOnRydWV9LHsiRGVzeW5jX0wiOjAuMCwiRGVzeW5jX1IiOjAuMCwiRGVzeW5jX2Ftb3VudCI6NjAuMCwiRGVzeW5jX3JhbmRvbV9tYXgiOjMwLjAsIkRlc3luY19yYW5kb21fbWluIjowLjAsIkRlc3luY19zd2F5X3NwZWVkIjowLjAsIlBpdGNoIjoiRG93biIsIlNwaW5fcmFuZ2UiOjEuMCwiU3Bpbl9zcGVlZCI6MC4wLCJZYXdfQ2hlY2siOnRydWUsIllhd19EZWxheSI6Mi4wLCJZYXdfTCI6LTI0LjAsIllhd19Nb2RpZmllcl9vZmZzZXQiOjU3LjAsIllhd19Nb2RpZmllcl90eXBlIjoiRGlzYWJsZWQiLCJZYXdfUiI6NTQuMCwiWWF3X1N0YXRpYyI6MzYuMCwiWWF3X1R5cGUiOiJMZWZ0JlJpZ2h0IiwiWWF3X2Jhc2UiOiJBdCBUYXJnZXQiLCJkZWZlbnNpdmVfZW5hYmxlIjpmYWxzZSwiZGVmZW5zaXZlX3BpdGNoIjoiQ3VzdG9tIiwiZGVmZW5zaXZlX3BpdGNoX2N1c3RvbSI6LTQwLjAsImRlZmVuc2l2ZV9waXRjaF9yYW5kb21fbWF4IjowLjAsImRlZmVuc2l2ZV9waXRjaF9yYW5kb21fbWluIjowLjAsImRlZmVuc2l2ZV9waXRjaF9zd2l0Y2hfMSI6MC4wLCJkZWZlbnNpdmVfcGl0Y2hfc3dpdGNoXzIiOjAuMCwiZGVmZW5zaXZlX3lhdyI6IlN3aXRjaCIsImRlZmVuc2l2ZV95YXdfY3VzdG9tIjowLjAsImRlZmVuc2l2ZV95YXdfaml0dGVyXzEiOjAuMCwiZGVmZW5zaXZlX3lhd19qaXR0ZXJfMiI6MC4wLCJkZWZlbnNpdmVfeWF3X2ppdHRlcl9kZWxheSI6MC4wLCJkZWZlbnNpdmVfeWF3X3JhbmRvbV9tYXgiOjAuMCwiZGVmZW5zaXZlX3lhd19yYW5kb21fbWluIjowLjAsImRlZmVuc2l2ZV95YXdfc3Bpbl9SYW5nZSI6MC4wLCJkZWZlbnNpdmVfeWF3X3NwaW5fU3BlZWQiOjAuMCwiZGVmZW5zaXZlX3lhd19zd2l0Y2hfMSI6LTE4MC4wLCJkZWZlbnNpdmVfeWF3X3N3aXRjaF8yIjotOTAuMCwiZGVzeW5jX2NoZWNrIjp0cnVlLCJkZXN5bmNfbW9kZSI6WyJSYW5kb20iLCJ+Il0sImRlc3luY19vcHRpb25zIjpbIkppdHRlciIsIn4iXSwiZGVzeW5jX3BlZWsiOiJQZWVrIEZha2UiLCJkZXN5bmNfdHlwZSI6IlN0YXRpYyIsImR1cmFiaWxpdHkiOjE0LjAsImZsX0xpbWl0IjoxNC4wLCJmbF90eXBlcyI6IkR5bmFtaWMiLCJmbF90eXBlc19qaXR0ZXIxIjoxLjAsImZsX3R5cGVzX2ppdHRlcjIiOjEuMCwiZmxfdHlwZXNfcmFuZG9tX21heCI6MS4wLCJmbF90eXBlc19yYW5kb21fbWluIjoxLjAsImZsX3ZhcmlhYmlsaXR5IjozMC4wLCJvdmVycmlkZSI6dHJ1ZX0seyJEZXN5bmNfTCI6MzMuMCwiRGVzeW5jX1IiOjM4LjAsIkRlc3luY19hbW91bnQiOjMwLjAsIkRlc3luY19yYW5kb21fbWF4IjoxNC4wLCJEZXN5bmNfcmFuZG9tX21pbiI6Ni4wLCJEZXN5bmNfc3dheV9zcGVlZCI6MjIuMCwiUGl0Y2giOiJEb3duIiwiU3Bpbl9yYW5nZSI6MS4wLCJTcGluX3NwZWVkIjowLjAsIllhd19DaGVjayI6dHJ1ZSwiWWF3X0RlbGF5IjoxLjAsIllhd19MIjotMzMuMCwiWWF3X01vZGlmaWVyX29mZnNldCI6NDAuMCwiWWF3X01vZGlmaWVyX3R5cGUiOiJEaXNhYmxlZCIsIllhd19SIjozMy4wLCJZYXdfU3RhdGljIjowLjAsIllhd19UeXBlIjoiTGVmdCZSaWdodCIsIllhd19iYXNlIjoiQXQgVGFyZ2V0IiwiZGVmZW5zaXZlX2VuYWJsZSI6ZmFsc2UsImRlZmVuc2l2ZV9waXRjaCI6IkN1c3RvbSIsImRlZmVuc2l2ZV9waXRjaF9jdXN0b20iOi00NS4wLCJkZWZlbnNpdmVfcGl0Y2hfcmFuZG9tX21heCI6MC4wLCJkZWZlbnNpdmVfcGl0Y2hfcmFuZG9tX21pbiI6MC4wLCJkZWZlbnNpdmVfcGl0Y2hfc3dpdGNoXzEiOjAuMCwiZGVmZW5zaXZlX3BpdGNoX3N3aXRjaF8yIjotMjEuMCwiZGVmZW5zaXZlX3lhdyI6IkN1c3RvbSIsImRlZmVuc2l2ZV95YXdfY3VzdG9tIjowLjAsImRlZmVuc2l2ZV95YXdfaml0dGVyXzEiOjAuMCwiZGVmZW5zaXZlX3lhd19qaXR0ZXJfMiI6MC4wLCJkZWZlbnNpdmVfeWF3X2ppdHRlcl9kZWxheSI6MC4wLCJkZWZlbnNpdmVfeWF3X3JhbmRvbV9tYXgiOjAuMCwiZGVmZW5zaXZlX3lhd19yYW5kb21fbWluIjowLjAsImRlZmVuc2l2ZV95YXdfc3Bpbl9SYW5nZSI6MC4wLCJkZWZlbnNpdmVfeWF3X3NwaW5fU3BlZWQiOjAuMCwiZGVmZW5zaXZlX3lhd19zd2l0Y2hfMSI6LTkwLjAsImRlZmVuc2l2ZV95YXdfc3dpdGNoXzIiOjAuMCwiZGVzeW5jX2NoZWNrIjp0cnVlLCJkZXN5bmNfbW9kZSI6WyJSYW5kb20iLCJ+Il0sImRlc3luY19vcHRpb25zIjpbIkppdHRlciIsIlJhbmRvbWl6ZSBKaXR0ZXIiLCJ+Il0sImRlc3luY19wZWVrIjoiUGVlayBGYWtlIiwiZGVzeW5jX3R5cGUiOiJTdGF0aWMiLCJkdXJhYmlsaXR5IjoxNC4wLCJmbF9MaW1pdCI6MTQuMCwiZmxfdHlwZXMiOiJTdGF0aWMiLCJmbF90eXBlc19qaXR0ZXIxIjoxLjAsImZsX3R5cGVzX2ppdHRlcjIiOjEuMCwiZmxfdHlwZXNfcmFuZG9tX21heCI6MS4wLCJmbF90eXBlc19yYW5kb21fbWluIjoxLjAsImZsX3ZhcmlhYmlsaXR5IjowLjAsIm92ZXJyaWRlIjp0cnVlfSx7IkRlc3luY19MIjowLjAsIkRlc3luY19SIjowLjAsIkRlc3luY19hbW91bnQiOjQ4LjAsIkRlc3luY19yYW5kb21fbWF4IjowLjAsIkRlc3luY19yYW5kb21fbWluIjowLjAsIkRlc3luY19zd2F5X3NwZWVkIjoxNy4wLCJQaXRjaCI6IkRvd24iLCJTcGluX3JhbmdlIjoxLjAsIlNwaW5fc3BlZWQiOjAuMCwiWWF3X0NoZWNrIjp0cnVlLCJZYXdfRGVsYXkiOjIuMCwiWWF3X0wiOi00MS4wLCJZYXdfTW9kaWZpZXJfb2Zmc2V0Ijo0MC4wLCJZYXdfTW9kaWZpZXJfdHlwZSI6IkRpc2FibGVkIiwiWWF3X1IiOjQ5LjAsIllhd19TdGF0aWMiOjAuMCwiWWF3X1R5cGUiOiJMZWZ0JlJpZ2h0IiwiWWF3X2Jhc2UiOiJBdCBUYXJnZXQiLCJkZWZlbnNpdmVfZW5hYmxlIjpmYWxzZSwiZGVmZW5zaXZlX3BpdGNoIjoiQ3VzdG9tIiwiZGVmZW5zaXZlX3BpdGNoX2N1c3RvbSI6LTI3LjAsImRlZmVuc2l2ZV9waXRjaF9yYW5kb21fbWF4IjowLjAsImRlZmVuc2l2ZV9waXRjaF9yYW5kb21fbWluIjowLjAsImRlZmVuc2l2ZV9waXRjaF9zd2l0Y2hfMSI6LTIxLjAsImRlZmVuc2l2ZV9waXRjaF9zd2l0Y2hfMiI6MC4wLCJkZWZlbnNpdmVfeWF3IjoiQ3VzdG9tIiwiZGVmZW5zaXZlX3lhd19jdXN0b20iOi0xODAuMCwiZGVmZW5zaXZlX3lhd19qaXR0ZXJfMSI6MC4wLCJkZWZlbnNpdmVfeWF3X2ppdHRlcl8yIjowLjAsImRlZmVuc2l2ZV95YXdfaml0dGVyX2RlbGF5IjowLjAsImRlZmVuc2l2ZV95YXdfcmFuZG9tX21heCI6MC4wLCJkZWZlbnNpdmVfeWF3X3JhbmRvbV9taW4iOjAuMCwiZGVmZW5zaXZlX3lhd19zcGluX1JhbmdlIjozNjAuMCwiZGVmZW5zaXZlX3lhd19zcGluX1NwZWVkIjowLjAsImRlZmVuc2l2ZV95YXdfc3dpdGNoXzEiOjAuMCwiZGVmZW5zaXZlX3lhd19zd2l0Y2hfMiI6MC4wLCJkZXN5bmNfY2hlY2siOnRydWUsImRlc3luY19tb2RlIjpbIn4iXSwiZGVzeW5jX29wdGlvbnMiOlsiQXZvaWQgT3ZlcmxhcCIsIkppdHRlciIsIlJhbmRvbWl6ZSBKaXR0ZXIiLCJBbnRpIEJydXRlZm9yY2UiLCJ+Il0sImRlc3luY19wZWVrIjoiUGVlayBGYWtlIiwiZGVzeW5jX3R5cGUiOiJTdGF0aWMiLCJkdXJhYmlsaXR5Ijo4LjAsImZsX0xpbWl0IjoxNC4wLCJmbF90eXBlcyI6IlN0YXRpYyIsImZsX3R5cGVzX2ppdHRlcjEiOjEuMCwiZmxfdHlwZXNfaml0dGVyMiI6MS4wLCJmbF90eXBlc19yYW5kb21fbWF4IjoxLjAsImZsX3R5cGVzX3JhbmRvbV9taW4iOjEuMCwiZmxfdmFyaWFiaWxpdHkiOjI5LjAsIm92ZXJyaWRlIjp0cnVlfSx7IkRlc3luY19MIjowLjAsIkRlc3luY19SIjowLjAsIkRlc3luY19hbW91bnQiOjUwLjAsIkRlc3luY19yYW5kb21fbWF4IjoyMC4wLCJEZXN5bmNfcmFuZG9tX21pbiI6MC4wLCJEZXN5bmNfc3dheV9zcGVlZCI6MC4wLCJQaXRjaCI6IkRvd24iLCJTcGluX3JhbmdlIjoxLjAsIlNwaW5fc3BlZWQiOjAuMCwiWWF3X0NoZWNrIjp0cnVlLCJZYXdfRGVsYXkiOjguMCwiWWF3X0wiOi0xNS4wLCJZYXdfTW9kaWZpZXJfb2Zmc2V0IjotNjUuMCwiWWF3X01vZGlmaWVyX3R5cGUiOiJEaXNhYmxlZCIsIllhd19SIjo0OS4wLCJZYXdfU3RhdGljIjoxNS4wLCJZYXdfVHlwZSI6IkxlZnQmUmlnaHQiLCJZYXdfYmFzZSI6IkF0IFRhcmdldCIsImRlZmVuc2l2ZV9lbmFibGUiOmZhbHNlLCJkZWZlbnNpdmVfcGl0Y2giOiJVcCIsImRlZmVuc2l2ZV9waXRjaF9jdXN0b20iOjAuMCwiZGVmZW5zaXZlX3BpdGNoX3JhbmRvbV9tYXgiOjAuMCwiZGVmZW5zaXZlX3BpdGNoX3JhbmRvbV9taW4iOjAuMCwiZGVmZW5zaXZlX3BpdGNoX3N3aXRjaF8xIjowLjAsImRlZmVuc2l2ZV9waXRjaF9zd2l0Y2hfMiI6MC4wLCJkZWZlbnNpdmVfeWF3IjoiU3BpbiIsImRlZmVuc2l2ZV95YXdfY3VzdG9tIjowLjAsImRlZmVuc2l2ZV95YXdfaml0dGVyXzEiOjAuMCwiZGVmZW5zaXZlX3lhd19qaXR0ZXJfMiI6MC4wLCJkZWZlbnNpdmVfeWF3X2ppdHRlcl9kZWxheSI6MC4wLCJkZWZlbnNpdmVfeWF3X3JhbmRvbV9tYXgiOjAuMCwiZGVmZW5zaXZlX3lhd19yYW5kb21fbWluIjowLjAsImRlZmVuc2l2ZV95YXdfc3Bpbl9SYW5nZSI6MzYwLjAsImRlZmVuc2l2ZV95YXdfc3Bpbl9TcGVlZCI6LTM2LjAsImRlZmVuc2l2ZV95YXdfc3dpdGNoXzEiOjAuMCwiZGVmZW5zaXZlX3lhd19zd2l0Y2hfMiI6MC4wLCJkZXN5bmNfY2hlY2siOnRydWUsImRlc3luY19tb2RlIjpbIlJhbmRvbSIsIn4iXSwiZGVzeW5jX29wdGlvbnMiOlsiQXZvaWQgT3ZlcmxhcCIsIkppdHRlciIsIlJhbmRvbWl6ZSBKaXR0ZXIiLCJ+Il0sImRlc3luY19wZWVrIjoiUGVlayBGYWtlIiwiZGVzeW5jX3R5cGUiOiJTdGF0aWMiLCJkdXJhYmlsaXR5IjoxNC4wLCJmbF9MaW1pdCI6MTIuMCwiZmxfdHlwZXMiOiJTdGF0aWMiLCJmbF90eXBlc19qaXR0ZXIxIjoxLjAsImZsX3R5cGVzX2ppdHRlcjIiOjEuMCwiZmxfdHlwZXNfcmFuZG9tX21heCI6MS4wLCJmbF90eXBlc19yYW5kb21fbWluIjoxLjAsImZsX3ZhcmlhYmlsaXR5IjowLjAsIm92ZXJyaWRlIjp0cnVlfSx7IkRlc3luY19MIjowLjAsIkRlc3luY19SIjowLjAsIkRlc3luY19hbW91bnQiOjAuMCwiRGVzeW5jX3JhbmRvbV9tYXgiOjAuMCwiRGVzeW5jX3JhbmRvbV9taW4iOjAuMCwiRGVzeW5jX3N3YXlfc3BlZWQiOjAuMCwiUGl0Y2giOiJEb3duIiwiU3Bpbl9yYW5nZSI6MS4wLCJTcGluX3NwZWVkIjowLjAsIllhd19DaGVjayI6dHJ1ZSwiWWF3X0RlbGF5IjoxLjAsIllhd19MIjowLjAsIllhd19Nb2RpZmllcl9vZmZzZXQiOjEuMCwiWWF3X01vZGlmaWVyX3R5cGUiOiJEaXNhYmxlZCIsIllhd19SIjowLjAsIllhd19TdGF0aWMiOjYuMCwiWWF3X1R5cGUiOiJTdGF0aWMiLCJZYXdfYmFzZSI6IkF0IFRhcmdldCIsImRlZmVuc2l2ZV9lbmFibGUiOmZhbHNlLCJkZWZlbnNpdmVfcGl0Y2giOiJVcCIsImRlZmVuc2l2ZV9waXRjaF9jdXN0b20iOjAuMCwiZGVmZW5zaXZlX3BpdGNoX3JhbmRvbV9tYXgiOjAuMCwiZGVmZW5zaXZlX3BpdGNoX3JhbmRvbV9taW4iOjAuMCwiZGVmZW5zaXZlX3BpdGNoX3N3aXRjaF8xIjowLjAsImRlZmVuc2l2ZV9waXRjaF9zd2l0Y2hfMiI6MC4wLCJkZWZlbnNpdmVfeWF3IjoiU3BpbiIsImRlZmVuc2l2ZV95YXdfY3VzdG9tIjowLjAsImRlZmVuc2l2ZV95YXdfaml0dGVyXzEiOjAuMCwiZGVmZW5zaXZlX3lhd19qaXR0ZXJfMiI6MC4wLCJkZWZlbnNpdmVfeWF3X2ppdHRlcl9kZWxheSI6MC4wLCJkZWZlbnNpdmVfeWF3X3JhbmRvbV9tYXgiOjAuMCwiZGVmZW5zaXZlX3lhd19yYW5kb21fbWluIjowLjAsImRlZmVuc2l2ZV95YXdfc3Bpbl9SYW5nZSI6MC4wLCJkZWZlbnNpdmVfeWF3X3NwaW5fU3BlZWQiOjAuMCwiZGVmZW5zaXZlX3lhd19zd2l0Y2hfMSI6MC4wLCJkZWZlbnNpdmVfeWF3X3N3aXRjaF8yIjowLjAsImRlc3luY19jaGVjayI6ZmFsc2UsImRlc3luY19tb2RlIjpbIn4iXSwiZGVzeW5jX29wdGlvbnMiOlsifiJdLCJkZXN5bmNfcGVlayI6Ik9mZiIsImRlc3luY190eXBlIjoiU3RhdGljIiwiZHVyYWJpbGl0eSI6Mi4wLCJmbF9MaW1pdCI6MTQuMCwiZmxfdHlwZXMiOiJTdGF0aWMiLCJmbF90eXBlc19qaXR0ZXIxIjoxLjAsImZsX3R5cGVzX2ppdHRlcjIiOjEuMCwiZmxfdHlwZXNfcmFuZG9tX21heCI6MS4wLCJmbF90eXBlc19yYW5kb21fbWluIjoxLjAsImZsX3ZhcmlhYmlsaXR5IjoyNS4wLCJvdmVycmlkZSI6ZmFsc2V9LHsiRGVzeW5jX0wiOjAuMCwiRGVzeW5jX1IiOjAuMCwiRGVzeW5jX2Ftb3VudCI6LTYwLjAsIkRlc3luY19yYW5kb21fbWF4IjowLjAsIkRlc3luY19yYW5kb21fbWluIjowLjAsIkRlc3luY19zd2F5X3NwZWVkIjowLjAsIlBpdGNoIjoiRG93biIsIlNwaW5fcmFuZ2UiOjEuMCwiU3Bpbl9zcGVlZCI6MC4wLCJZYXdfQ2hlY2siOnRydWUsIllhd19EZWxheSI6MTYuMCwiWWF3X0wiOi0yLjAsIllhd19Nb2RpZmllcl9vZmZzZXQiOjYuMCwiWWF3X01vZGlmaWVyX3R5cGUiOiJEaXNhYmxlZCIsIllhd19SIjoxNS4wLCJZYXdfU3RhdGljIjowLjAsIllhd19UeXBlIjoiTGVmdCZSaWdodCIsIllhd19iYXNlIjoiQXQgVGFyZ2V0IiwiZGVmZW5zaXZlX2VuYWJsZSI6ZmFsc2UsImRlZmVuc2l2ZV9waXRjaCI6IlVwIiwiZGVmZW5zaXZlX3BpdGNoX2N1c3RvbSI6MC4wLCJkZWZlbnNpdmVfcGl0Y2hfcmFuZG9tX21heCI6MC4wLCJkZWZlbnNpdmVfcGl0Y2hfcmFuZG9tX21pbiI6MC4wLCJkZWZlbnNpdmVfcGl0Y2hfc3dpdGNoXzEiOjAuMCwiZGVmZW5zaXZlX3BpdGNoX3N3aXRjaF8yIjowLjAsImRlZmVuc2l2ZV95YXciOiJTcGluIiwiZGVmZW5zaXZlX3lhd19jdXN0b20iOjAuMCwiZGVmZW5zaXZlX3lhd19qaXR0ZXJfMSI6MC4wLCJkZWZlbnNpdmVfeWF3X2ppdHRlcl8yIjowLjAsImRlZmVuc2l2ZV95YXdfaml0dGVyX2RlbGF5IjowLjAsImRlZmVuc2l2ZV95YXdfcmFuZG9tX21heCI6MC4wLCJkZWZlbnNpdmVfeWF3X3JhbmRvbV9taW4iOjAuMCwiZGVmZW5zaXZlX3lhd19zcGluX1JhbmdlIjowLjAsImRlZmVuc2l2ZV95YXdfc3Bpbl9TcGVlZCI6MC4wLCJkZWZlbnNpdmVfeWF3X3N3aXRjaF8xIjowLjAsImRlZmVuc2l2ZV95YXdfc3dpdGNoXzIiOjAuMCwiZGVzeW5jX2NoZWNrIjp0cnVlLCJkZXN5bmNfbW9kZSI6WyJ+Il0sImRlc3luY19vcHRpb25zIjpbIkFudGkgQnJ1dGVmb3JjZSIsIn4iXSwiZGVzeW5jX3BlZWsiOiJQZWVrIEZha2UiLCJkZXN5bmNfdHlwZSI6IlN0YXRpYyIsImR1cmFiaWxpdHkiOjE0LjAsImZsX0xpbWl0IjoxNC4wLCJmbF90eXBlcyI6IlN0YXRpYyIsImZsX3R5cGVzX2ppdHRlcjEiOjEuMCwiZmxfdHlwZXNfaml0dGVyMiI6MS4wLCJmbF90eXBlc19yYW5kb21fbWF4IjoxLjAsImZsX3R5cGVzX3JhbmRvbV9taW4iOjEuMCwiZmxfdmFyaWFiaWxpdHkiOjIwLjAsIm92ZXJyaWRlIjp0cnVlfV0seyJRdWVzdGVzIjoxLjAsIlRhYiI6Mi4wLCJjaGFuZ2VfbG9ncyI6NS4wLCJjbG91ZCI6Mi4wLCJjbG91ZF9sZWFkZXJib2FyZF9saXN0IjoyLjAsImNvbG9yX2FjY2VudCI6IiNGRkZGRkZGRiJ9LHsiU2FmZV9oZWFkIjpbIkM0IiwiS25pZmUiLCJHcmVuYWRlIiwifiJdLCJTYWZlX2hlYWRfWWF3X0FkZCI6MTUuMCwiU2FmZV9oZWFkX1lhd19UYXJnZXQiOiJMb2NhbCBWaWV3IiwiU3RhdGVzIjoyLjAsIlRhYiI6Mi4wfSx7ImFpciI6IlN0YXRpYyIsImdyb3VuZCI6Ik1vb25XYWxrIiwibWFpbiI6WyJHcm91bmQiLCJBaXIiLCJPdGhlciIsIn4iXSwib3RoZXIiOlsiMCBQaXRjaCBPbiBMYW5kIiwifiJdfSx7IkNvbnNvbGVfY29sb3IiOiIjOTc5Nzk3OEQiLCJhaXJfc3R1Y2siOmZhbHNlLCJhdXRvX2JyZWFrX2xjIjpmYWxzZSwiYXV0b19icmVha19sY19vcHRpb25zIjpbIkFsbG93IEluIEFpciIsIn4iXSwiYXV0b19icmVha19sY19vcHRpb25zX2RlbGF5IjowLjAsImNsYW50YWciOmZhbHNlLCJjbGFudGFnX2lucHV0IjoiTWVkdXNhLnVubyIsImNsYW50YWdfdHlwZXMiOiJBdGxhbnRpYyIsImZhc3RfbGFkZGVyIjp0cnVlLCJncmVuYWRlX3JhZGl1cyI6dHJ1ZSwiZ3JlbmFkZV9zZWxlY3QiOlsxLjAsMi4wLCJ+Il0sImdyZW5hZGVfc3VwZXJ0b3NzIjp0cnVlLCJsb2dnZXIiOnRydWUsImxvZ2dlcl9TdHlsZSI6IkdyYWRpZW50IiwibG9nZ2VyX3JvdW5kIjowLjAsImxvZ2dlcl95IjoxMTMuMCwibW9sb3Rvdl9jb2xvciI6IiM3NEMwMjlGRiIsIm1vbG90b3ZfY29sb3IyIjoiI0ZGMDAwMEZGIiwic21va2VfY29sb3IiOiIjRkZGRkZGQjQiLCJ0cmFzaHRhbGsiOmZhbHNlLCJ0cmFzaHRhbGtfZGVsYXkiOjEuMCwidHJhc2h0YWxrX3R5cGUiOiJNZWR1c2EudW5vIiwidW5sb2NrX3Bpbmdfc3Bpa2UiOnRydWUsInZpZXdfbW9kZWwiOnRydWUsInZpZXdfbW9kZWxfZm92Ijo5OC4wLCJ2aWV3X21vZGVsX3giOjEuMCwidmlld19tb2RlbF95IjotOC4wLCJ2aWV3X21vZGVsX3oiOjEuMH0seyJBc3BlY3RfcmF0aW8iOjAuMCwiY3Jvc3NoYWlyX2luZF9hbmltYXRpb25fc3BlZWQiOjEuMCwiY3Jvc3NoYWlyX2luZF9jb2xvcl8xIjoiI0ZGRkZGRkZGIiwiY3Jvc3NoYWlyX2luZF9jb2xvcl8yIjoiIzNCM0IzQkZGIiwiY3Jvc3NoYWlyX2luZF9jb2xvcl8zIjoiI0ZGRkZGRkZGIiwiY3Jvc3NoYWlyX2luZF9zZXR0aW5ncyI6WyJDb25kaXRpb25zIiwiQmluZHMiLCJ+Il0sImNyb3NzaGFpcl9pbmRfdGV4dF9zdHlsZSI6IlJld29yayIsImNyb3NzaGFpcl9pbmRfeSI6MS4wLCJjdXN0b21zY29wZSI6dHJ1ZSwiY3VzdG9tc2NvcGVfQ29sb3IiOiIjRkZGRkZGRkYiLCJjdXN0b21zY29wZV9HYXAiOjEyLjAsImN1c3RvbXNjb3BlX0xlbmdodCI6NjUuMCwiY3VzdG9tc2NvcGVfaW52ZXJ0IjpmYWxzZSwiY3VzdG9tc2NvcGVfc2V0dGluZ3NfbGluZXMiOlsifiJdLCJzaGFyZWRfaWNvbiI6dHJ1ZSwid2F0ZXJtYXJrX2J1aWxkIjp0cnVlLCJ3YXRlcm1hcmtfcG9zaXRpb24iOiJMZWZ0Iiwid2F0ZXJtYXJrX3R5cGUiOiJTb2x1cyIsIndpZGdldHMiOlsiS2V5YmluZCBMaXN0IiwiV2F0ZXJtYXJrIiwiU3BlY3RhdG9yIExpc3QiLCJDcm9zc2hhaXIgSW5kaWNhdG9ycyIsIn4iXSwid2lkZ2V0c19nbG93IjpbIn4iXX1d";
v502.save_config = function(v505)
    -- upvalues: v503 (ref), v504 (ref), l_base64_0 (ref)
    if v505 == 1 then
        return;
    else
        local v506 = v503:save();
        v504.cfg_list[v505][2] = "NL->Atlantic.oce->Config->" .. l_base64_0.encode(json.stringify(v506));
        db.Atlantic_oce_data = v504;
        print("Config Has been Saved");
        return;
    end;
end;
v502.update_values = function(v507)
    -- upvalues: v504 (ref)
    local v508 = v504.cfg_list[v507][1] .. " - Loaded";
    for v509, v510 in ipairs(v504.cfg_list) do
        v504.menu_list[v509] = v510[1];
    end;
    v504.menu_list[v507] = v508;
end;
v502.create_config = function(v511)
    -- upvalues: v504 (ref)
    if type(v511) ~= "string" then
        return;
    elseif v511 == nil or v511 == "" or v511 == " " then
        return;
    else
        for v512 = #v504.menu_list, 1, -1 do
            if v504.menu_list[v512] == v511 then
                print("Atlantic.oce -->>", "Error: same name!");
                return;
            end;
        end;
        if #v504.cfg_list > 100 then
            print("Bro chill the limit is 100 configs");
            return;
        else
            local v513 = {
                [1] = nil, 
                [2] = "", 
                [1] = v511
            };
            table.insert(v504.cfg_list, v513);
            table.insert(v504.menu_list, v511);
            db.Atlantic_oce_data = v504;
            return;
        end;
    end;
end;
v502.remove_config = function(v514)
    -- upvalues: v504 (ref)
    if v514 == 1 then
        return;
    else
        local v515 = v504.cfg_list[v514][1];
        for v516 = #v504.cfg_list, 1, -1 do
            if v504.cfg_list[v516][1] == v515 then
                table.remove(v504.cfg_list, v516);
                table.remove(v504.menu_list, v516);
            end;
        end;
        db.Atlantic_oce_data = v504;
        return;
    end;
end;
v502.load_config = function(v517)
    -- upvalues: v504 (ref), v503 (ref), l_base64_0 (ref)
    if v504.cfg_list[v517][2] == nil or v504.cfg_list[v517][2] == "" then
        print(string.format("Atlantic.oce -->> Loading %s Failed", v517));
        return;
    elseif #v504.cfg_list < v517 then
        print(string.format("Atlantic.oce -->> Loading %s Failed", v517));
        return;
    else
        local v518 = v504.cfg_list[v517][2]:sub(#"NL->Atlantic.oce->Config->" + 1);
        v503:load(json.parse(l_base64_0.decode(v518)));
        print("Config Has been Loaded");
        return;
    end;
end;
v35.Functions.Main.sidebar = function()
    -- upvalues: l_gradient_0 (ref), v88 (ref), l_pui_0 (ref)
    local v519 = l_gradient_0.text_animate("Atlantic.oce", -3, {
        color(v88:get().r, v88:get().g, v88:get().b), 
        color(21, 21, 21, 255)
    });
    v519:animate();
    l_pui_0.sidebar(v519:get_animated_text(), "\a" .. color(v88:get().r, v88:get().g, v88:get().b):to_hex() .. l_pui_0.get_icon("water"));
end;
v35.Menu.Main.configs_local = {
    cfg_list = v35.Menu.Tabs.Home.Cloud.Configs.Main:list("", v504.menu_list):depend({
        [1] = nil, 
        [2] = 2, 
        [1] = v35.Menu.Main.Tab
    }), 
    name = v35.Menu.Tabs.Home.Cloud.Configs.Main:input("Name:", "My New P Config"):depend({
        [1] = nil, 
        [2] = 2, 
        [1] = v35.Menu.Main.Tab
    }), 
    create = v35.Menu.Tabs.Home.Cloud.Configs.Main:button(l_pui_0.get_icon("plus"), function()
        -- upvalues: v502 (ref), v35 (ref), v504 (ref)
        v502.create_config(v35.Menu.Main.configs_local.name:get());
        v35.Menu.Main.configs_local.cfg_list:update(v504.menu_list);
        cvar.play:call("ambient\\tones\\elev1");
    end, true):depend({
        [1] = nil, 
        [2] = 2, 
        [1] = v35.Menu.Main.Tab
    }):tooltip("Create"), 
    remove = v35.Menu.Tabs.Home.Cloud.Configs.Main:button(l_pui_0.get_icon("trash"), function()
        -- upvalues: v502 (ref), v35 (ref), v504 (ref)
        v502.remove_config(v35.Menu.Main.configs_local.cfg_list:get());
        cvar.play:call("ambient\\tones\\elev1");
        v35.Menu.Main.configs_local.cfg_list:update(v504.menu_list);
    end, true):depend({
        [1] = nil, 
        [2] = 2, 
        [1] = v35.Menu.Main.Tab
    }):tooltip("Remove"), 
    save = v35.Menu.Tabs.Home.Cloud.Configs.Main:button(l_pui_0.get_icon("floppy-disk"), function()
        -- upvalues: v502 (ref), v35 (ref)
        v502.save_config(v35.Menu.Main.configs_local.cfg_list:get());
        cvar.play:call("ambient\\tones\\elev1");
    end, true):depend({
        [1] = nil, 
        [2] = 2, 
        [1] = v35.Menu.Main.Tab
    }):tooltip("Save"), 
    load = v35.Menu.Tabs.Home.Cloud.Configs.Main:button(l_pui_0.get_icon("loader"), function()
        -- upvalues: v502 (ref), v35 (ref), v504 (ref)
        v502.update_values(v35.Menu.Main.configs_local.cfg_list:get());
        v502.load_config(v35.Menu.Main.configs_local.cfg_list:get());
        v35.Menu.Main.configs_local.cfg_list:update(v504.menu_list);
        cvar.play:call("ambient\\tones\\elev1");
    end, true):depend({
        [1] = nil, 
        [2] = 2, 
        [1] = v35.Menu.Main.Tab
    }):tooltip("Load"), 
    import = v35.Menu.Tabs.Home.Cloud.Configs.Main:button(l_pui_0.get_icon("file-import"), function()
        -- upvalues: l_clipboard_0 (ref), l_base64_0 (ref), v503 (ref)
        local v520 = l_clipboard_0.get();
        if v520 then
            local v521 = "NL->Atlantic.oce->Config->";
            if v520:sub(1, #v521) == v521 then
                local v522 = v520:sub(#v521 + 1);
                local v523 = l_base64_0.decode(v522);
                local v524 = json.parse(v523);
                if v524 then
                    v503:load(v524);
                    cvar.play:call("ambient\\tones\\elev1");
                else
                    print("Failed to parse JSON data.");
                end;
            else
                print("Clipboard data does not start with the expected prefix.");
            end;
        else
            print("Clipboard is empty or unavailable.");
        end;
    end, true):depend({
        [1] = nil, 
        [2] = 2, 
        [1] = v35.Menu.Main.Tab
    }):tooltip("Import"), 
    export = v35.Menu.Tabs.Home.Cloud.Configs.Main:button(l_pui_0.get_icon("file-export"), function()
        -- upvalues: l_base64_0 (ref), v503 (ref), l_clipboard_0 (ref)
        local v525 = "NL->Atlantic.oce->Config->" .. l_base64_0.encode(json.stringify(v503:save()));
        l_clipboard_0.set(v525);
        cvar.play:call("ambient\\tones\\elev1");
    end, true):depend({
        [1] = nil, 
        [2] = 2, 
        [1] = v35.Menu.Main.Tab
    }):tooltip("Export")
};
local v526 = {
    list = {}, 
    names = {}
};
v526.load_configs = function(v527)
    -- upvalues: v0 (ref), v526 (ref)
    local v528 = {
        ["Content-Type"] = "application/json", 
        apikey = v0.api_key, 
        Authorization = v0.bearer_token
    };
    network.get("https://beyxygeivkrqyvgykgct.supabase.co/rest/v1/Configs", v528, function(v529)
        -- upvalues: v526 (ref), v527 (ref)
        if not v529 then
            print("Error: No response received from Configs endpoint");
            return;
        else
            local v530 = json.parse(v529);
            if not v530 then
                print("Error: Failed to parse Configs JSON");
                return;
            else
                v526.list = {};
                v526.names = {};
                for _, v532 in ipairs(v530) do
                    local v533 = v532.Name or "Unnamed";
                    local v534 = v532.Config or "{}";
                    local v535 = v532.Author or "Unknown";
                    local v536 = v532.Updated or "Unknown";
                    local v537 = v532.Build or "Unknown";
                    local v538 = v532.Likes or "Unknown";
                    local v539 = v532.Downloads or "Unknown";
                    table.insert(v526.list, {
                        name = v533, 
                        config = v534, 
                        author = v535, 
                        update = v536, 
                        build = v537, 
                        likes = v538, 
                        downloads = v539
                    });
                end;
                table.sort(v526.list, function(v540, v541)
                    if v540.name == "Default" then
                        return true;
                    elseif v541.name == "Default" then
                        return false;
                    else
                        return v540.name:lower() < v541.name:lower();
                    end;
                end);
                for _, v543 in ipairs(v526.list) do
                    table.insert(v526.names, v543.name);
                end;
                if v527 then
                    v527(v526.names);
                end;
                return;
            end;
        end;
    end);
end;
v526.create_config = function(v544)
    -- upvalues: l_base64_0 (ref), v503 (ref), v35 (ref), v15 (ref)
    if not v544 or v544 == "" then
        print("Error: Config name cannot be empty");
        return;
    else
        local v545 = {
            apikey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJleXh5Z2VpdmtycXl2Z3lrZ2N0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzU2ODE5MzksImV4cCI6MjA1MTI1NzkzOX0._BK7l1W82zdbQaAvwyq-2hjg1diBRWKl0T92qaF6InY", 
            ["Content-Type"] = "application/json", 
            Authorization = "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJleXh5Z2VpdmtycXl2Z3lrZ2N0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzU2ODE5MzksImV4cCI6MjA1MTI1NzkzOX0._BK7l1W82zdbQaAvwyq-2hjg1diBRWKl0T92qaF6InY"
        };
        local v546 = "NL->Atlantic.oce->Config->" .. l_base64_0.encode(json.stringify(v503:save()));
        local v547 = common.get_system_time();
        local v548 = string.format("%04d-%02d-%02d %02d:%02d:%02d", v547.year, v547.month, v547.day, v547.hours, v547.minutes, v547.seconds);
        local v549 = json.stringify({
            Name = v544, 
            Updated = v548, 
            Author = v35.Data.User, 
            Build = v35.Data.Build, 
            Config = v546
        });
        v15:request("POST", "https://beyxygeivkrqyvgykgct.supabase.co/rest/v1/Configs", {
            headers = v545, 
            body = v549
        }, function(v550)
            if v550 then
                if v550.status == 204 then
                    print("Config Created Successfully");
                else
                    print("Failed to Create Config. Status:", v550.status, "Body:", v550.body);
                end;
            else
                print("No response received while trying to add user.");
            end;
        end);
        return;
    end;
end;
v526.load_config = function(v551)
    -- upvalues: v526 (ref), l_base64_0 (ref), v503 (ref)
    if not v526.list[v551] then
        print("Error: Invalid config ID");
        return;
    else
        local l_config_0 = v526.list[v551].config;
        local v553 = l_base64_0.decode(l_config_0:sub(#"NL->Atlantic.oce->Config->" + 1));
        local v554 = json.parse(v553);
        if v554 then
            v503:load(v554);
            cvar.play:call("ambient\\tones\\elev1");
            print("Config Loaded Successfully");
        else
            print("Failed to parse JSON data");
        end;
        return;
    end;
end;
v526.delete_config = function(v555)
    -- upvalues: v526 (ref), v15 (ref)
    local v556 = v526.list[v555];
    if not v556 then
        print("Atlantic.oce -->> Error: Invalid config ID.");
        return;
    else
        local v557 = {
            apikey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJleXh5Z2VpdmtycXl2Z3lrZ2N0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzU2ODE5MzksImV4cCI6MjA1MTI1NzkzOX0._BK7l1W82zdbQaAvwyq-2hjg1diBRWKl0T92qaF6InY", 
            ["Content-Type"] = "application/json", 
            Authorization = "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJleXh5Z2VpdmtycXl2Z3lrZ2N0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzU2ODE5MzksImV4cCI6MjA1MTI1NzkzOX0._BK7l1W82zdbQaAvwyq-2hjg1diBRWKl0T92qaF6InY"
        };
        local v558 = "https://beyxygeivkrqyvgykgct.supabase.co/rest/v1/Configs?Name=eq." .. v556.name:gsub(" ", "%%20");
        v15:request("DELETE", v558, {
            headers = v557
        }, function(v559)
            -- upvalues: v556 (ref), v526 (ref), v555 (ref)
            if v559 and v559.status == 204 then
                print("Atlantic.oce -->> Config '" .. v556.name .. "' deleted successfully.");
                cvar.play:call("ambient\\tones\\elev1");
                table.remove(v526.list, v555);
                for v560, v561 in ipairs(v526.names) do
                    if v561 == v556.name then
                        table.remove(v526.names, v560);
                        break;
                    end;
                end;
            else
                print("Atlantic.oce -->> Failed to delete config. Status:", v559.status or "N/A", "Body:", v559.body or "No response");
            end;
        end);
        return;
    end;
end;
v526.save_config = function(v562)
    -- upvalues: v526 (ref), l_base64_0 (ref), v503 (ref), v0 (ref), v15 (ref)
    if not v526.list[v562] then
        print("Error: Invalid config ID");
        return;
    else
        local v563 = "NL->Atlantic.oce->Config->" .. l_base64_0.encode(json.stringify(v503:save()));
        local v564 = "https://beyxygeivkrqyvgykgct.supabase.co/rest/v1/Configs" .. "?Name=eq." .. v526.list[v562].name;
        local v565 = {
            ["Content-Type"] = "application/json", 
            apikey = v0.api_key, 
            Authorization = v0.bearer_token
        };
        local v566 = json.stringify({
            Config = tostring(v563)
        });
        v15:request("PATCH", v564, {
            headers = v565, 
            body = v566
        }, function(v567)
            if v567 then
                if v567.status == 204 then
                    print("Config Saved Successfully");
                    cvar.play:call("ambient\\tones\\elev1");
                else
                    print("Failed to Save Config. Status:", v567.status, "Body:", v567.body);
                end;
            else
                print("No response received while trying to add user.");
            end;
        end);
        return;
    end;
end;
v526.add_likes = function(v568, v569)
    -- upvalues: v526 (ref), v0 (ref), v15 (ref)
    local v570 = v526.list[v568];
    if not v570 then
        print("Atlantic.oce -->> Error: Invalid config ID");
        return;
    elseif v568 == 1 then
        print("Atlantic.oce -->> Cannot like the Default config");
        return;
    else
        local v571 = "https://beyxygeivkrqyvgykgct.supabase.co/rest/v1/Configs" .. "?Name=eq." .. v570.name:gsub(" ", "%%20");
        local v572 = {
            ["Content-Type"] = "application/json", 
            apikey = v0.api_key, 
            Authorization = v0.bearer_token
        };
        network.get(v571, v572, function(v573)
            -- upvalues: v569 (ref), v15 (ref), v571 (ref), v572 (ref)
            if not v573 then
                print("Atlantic.oce -->> No response received from Supabase.");
                return;
            else
                local v574 = json.parse(v573);
                if not v574 or not v574[1] then
                    print("Atlantic.oce -->> Failed to find config in Supabase.");
                    return;
                else
                    local v575 = math.floor(tonumber(v574[1].Likes) or 0) + math.floor(tonumber(v569) or 0);
                    local v576 = json.stringify({
                        Likes = v575
                    });
                    v15:request("PATCH", v571, {
                        headers = v572, 
                        body = v576
                    }, function(v577)
                        -- upvalues: v575 (ref)
                        if v577 and v577.status == 204 then
                            print("Atlantic.oce -->> Likes updated to ", v575);
                        else
                            print("Atlantic.oce -->> Failed to update likes. Status:", v577 and v577.status or "N/A", "Body:", v577 and v577.body or "No response");
                        end;
                    end);
                    return;
                end;
            end;
        end);
        return;
    end;
end;
v526.add_Downloads = function(v578, v579)
    -- upvalues: v526 (ref), v0 (ref), v15 (ref)
    local v580 = v526.list[v578];
    if not v580 then
        print("Atlantic.oce -->> Error: Invalid config ID");
        return;
    elseif v578 == 1 then
        print("Atlantic.oce -->> Cannot like the Default config");
        return;
    else
        local v581 = "https://beyxygeivkrqyvgykgct.supabase.co/rest/v1/Configs" .. "?Name=eq." .. v580.name:gsub(" ", "%%20");
        local v582 = {
            ["Content-Type"] = "application/json", 
            apikey = v0.api_key, 
            Authorization = v0.bearer_token
        };
        network.get(v581, v582, function(v583)
            -- upvalues: v579 (ref), v15 (ref), v581 (ref), v582 (ref), v526 (ref), v578 (ref)
            if not v583 then
                print("Atlantic.oce -->> No response received from Supabase.");
                return;
            else
                local v584 = json.parse(v583);
                if not v584 or not v584[1] then
                    print("Atlantic.oce -->> Failed to find config in Supabase.");
                    return;
                else
                    local v585 = math.floor(tonumber(v584[1].Downloads) or 0) + math.floor(tonumber(v579) or 0);
                    local v586 = json.stringify({
                        Downloads = v585
                    });
                    v15:request("PATCH", v581, {
                        headers = v582, 
                        body = v586
                    }, function(v587)
                        -- upvalues: v585 (ref), v526 (ref), v578 (ref)
                        if v587 and v587.status == 204 then
                            print("Atlantic.oce -->> Downloads updated to ", v585);
                            v526.list[v578].Downloads = v585;
                        else
                            print("Atlantic.oce -->> Failed to update Downloads. Status:", v587 and v587.status or "N/A", "Body:", v587 and v587.body or "No response");
                        end;
                    end);
                    return;
                end;
            end;
        end);
        return;
    end;
end;
v526.Menu = function()
    -- upvalues: v526 (ref), v35 (ref), l_pui_0 (ref)
    v526.config_list = v35.Menu.Tabs.Home.Cloud.Configs.Main:list("", {}):depend({
        [1] = nil, 
        [2] = 3, 
        [1] = v35.Menu.Main.Tab
    }, {
        [1] = nil, 
        [2] = 4, 
        [1] = v35.Menu.Main.cloud
    });
    v526.name_input = v35.Menu.Tabs.Home.Cloud.Configs.Main:input("Name:", "My New P Config"):depend({
        [1] = nil, 
        [2] = 3, 
        [1] = v35.Menu.Main.Tab
    }, {
        [1] = nil, 
        [2] = 4, 
        [1] = v35.Menu.Main.cloud
    });
    v526.load_configs(function(v588)
        -- upvalues: v526 (ref), v35 (ref)
        if not v526.config_list then
            v526.config_list = v35.Menu.Tabs.Home.Cloud.Configs.Main:list("Configs", v588):depend({
                [1] = nil, 
                [2] = 3, 
                [1] = v35.Menu.Main.Tab
            }, {
                [1] = nil, 
                [2] = 4, 
                [1] = v35.Menu.Main.cloud
            });
        else
            v526.config_list:update(v588);
        end;
        for v589, v590 in ipairs(v526.list) do
            v526.cfg_info = v35.Menu.Tabs.Home.Cloud.Configs.info:list("Info about: " .. v590.name .. " Config", {}):depend({
                [1] = nil, 
                [2] = 3, 
                [1] = v35.Menu.Main.Tab
            }, {
                [1] = nil, 
                [2] = 4, 
                [1] = v35.Menu.Main.cloud
            }, {
                [1] = v526.config_list, 
                [2] = v589
            });
            v526.cfg_info:update({
                [1] = "Author: " .. v590.author, 
                [2] = "Build: " .. v590.build, 
                [3] = "Updated: " .. v590.update, 
                [4] = "Likes: " .. v590.likes, 
                [5] = "Downloads: " .. v590.downloads
            });
        end;
    end);
    v35.Menu.Tabs.Home.Cloud.Configs.Main:button(l_pui_0.get_icon("plus"), function()
        -- upvalues: v526 (ref), v35 (ref)
        v526.create_config(v526.name_input:get());
        v526.load_configs(function(v591)
            -- upvalues: v526 (ref), v35 (ref)
            if not v526.config_list then
                v526.config_list = v35.Menu.Tabs.Home.Cloud.Configs.Main:list("Configs", v591):depend({
                    [1] = nil, 
                    [2] = 3, 
                    [1] = v35.Menu.Main.Tab
                }, {
                    [1] = nil, 
                    [2] = 4, 
                    [1] = v35.Menu.Main.cloud
                });
            else
                v526.config_list:update(v591);
            end;
            for _, v593 in ipairs(v526.list) do
                v526.cfg_info:update({
                    [1] = "Author: " .. v593.author, 
                    [2] = "Build: " .. v593.build, 
                    [3] = "Updated: " .. v593.update, 
                    [4] = "Likes: " .. v593.likes, 
                    [5] = "Downloads: " .. v593.downloads
                });
            end;
        end);
    end, true):depend({
        [1] = nil, 
        [2] = 3, 
        [1] = v35.Menu.Main.Tab
    }, {
        [1] = nil, 
        [2] = 4, 
        [1] = v35.Menu.Main.cloud
    }):tooltip("Create");
    v526.force_update = v35.Menu.Tabs.Home.Cloud.Configs.Main:button(l_pui_0.get_icon("rotate"), function()
        -- upvalues: v526 (ref), v35 (ref)
        v526.load_configs(function(v594)
            -- upvalues: v526 (ref), v35 (ref)
            if not v526.config_list then
                v526.config_list = v35.Menu.Tabs.Home.Cloud.Configs.Main:list("Configs", v594):depend({
                    [1] = nil, 
                    [2] = 3, 
                    [1] = v35.Menu.Main.Tab
                }, {
                    [1] = nil, 
                    [2] = 4, 
                    [1] = v35.Menu.Main.cloud
                });
            else
                v526.config_list:update(v594);
            end;
            for _, v596 in ipairs(v526.list) do
                v526.cfg_info:update({
                    [1] = "Author: " .. v596.author, 
                    [2] = "Build: " .. v596.build, 
                    [3] = "Updated: " .. v596.update, 
                    [4] = "Likes: " .. v596.likes, 
                    [5] = "Downloads: " .. v596.downloads
                });
            end;
            common.reload_script();
        end);
    end, true):depend({
        [1] = nil, 
        [2] = 3, 
        [1] = v35.Menu.Main.Tab
    }, {
        [1] = nil, 
        [2] = 4, 
        [1] = v35.Menu.Main.cloud
    }):tooltip("Force Update");
    v526.save = v35.Menu.Tabs.Home.Cloud.Configs.Main:button(l_pui_0.get_icon("floppy-disk"), function()
        -- upvalues: v526 (ref), v35 (ref)
        if v526.list[v526.config_list:get()].author ~= v35.Data.User then
            print("Error: You can only save your own configs.");
            return;
        else
            v526.save_config(v526.config_list:get());
            return;
        end;
    end, true):depend({
        [1] = nil, 
        [2] = 3, 
        [1] = v35.Menu.Main.Tab
    }, {
        [1] = nil, 
        [2] = 4, 
        [1] = v35.Menu.Main.cloud
    }):tooltip("Save Config");
    v526.load = v35.Menu.Tabs.Home.Cloud.Configs.Main:button(l_pui_0.get_icon("loader"), function()
        -- upvalues: v526 (ref)
        v526.load_config(v526.config_list:get());
        v526.add_Downloads(v526.config_list:get(), 1);
        for _, v598 in ipairs(v526.list) do
            v526.cfg_info:update({
                [1] = "Author: " .. v598.author, 
                [2] = "Build: " .. v598.build, 
                [3] = "Updated: " .. v598.update, 
                [4] = "Likes: " .. v598.likes, 
                [5] = "Downloads: " .. v598.downloads
            });
        end;
    end, true):depend({
        [1] = nil, 
        [2] = 3, 
        [1] = v35.Menu.Main.Tab
    }, {
        [1] = nil, 
        [2] = 4, 
        [1] = v35.Menu.Main.cloud
    }):tooltip("Load Config");
    v526.delete = v35.Menu.Tabs.Home.Cloud.Configs.Main:button(l_pui_0.get_icon("trash"), function()
        -- upvalues: v526 (ref), v35 (ref)
        if v526.list[v526.config_list:get()].author ~= v35.Data.User then
            print("Error: You can only delete your own configs.");
            return;
        else
            v526.delete_config(v526.config_list:get());
            v526.load_configs(function(v599)
                -- upvalues: v526 (ref), v35 (ref)
                if not v526.config_list then
                    v526.config_list = v35.Menu.Tabs.Home.Cloud.Configs.Main:list("Configs", v599):depend({
                        [1] = nil, 
                        [2] = 3, 
                        [1] = v35.Menu.Main.Tab
                    }, {
                        [1] = nil, 
                        [2] = 4, 
                        [1] = v35.Menu.Main.cloud
                    });
                else
                    v526.config_list:update(v599);
                end;
                for _, v601 in ipairs(v526.list) do
                    v526.cfg_info:update({
                        [1] = "Author: " .. v601.author, 
                        [2] = "Build: " .. v601.build, 
                        [3] = "Updated: " .. v601.update, 
                        [4] = "Likes: " .. v601.likes, 
                        [5] = "Downloads: " .. v601.downloads
                    });
                end;
            end);
            return;
        end;
    end, true):depend({
        [1] = nil, 
        [2] = 3, 
        [1] = v35.Menu.Main.Tab
    }, {
        [1] = nil, 
        [2] = 4, 
        [1] = v35.Menu.Main.cloud
    }):tooltip("Delete Config");
    local v602 = {};
    local v603 = {};
    v526.load_configs(function(v604)
        -- upvalues: v526 (ref), v602 (ref), v35 (ref), l_pui_0 (ref)
        v526.config_list:update(v604);
        for v605, _ in ipairs(v526.list) do
            v602[v605] = {};
            v602[v605].like = v35.Menu.Tabs.Home.Cloud.Configs.more:switch(l_pui_0.get_icon("heart")):visibility(false):tooltip("Like Config");
        end;
    end);
    v35.Menu.Tabs.Home.Cloud.Configs.more:button(l_pui_0.get_icon("heart"), function()
        -- upvalues: v526 (ref), v603 (ref)
        local v607 = v526.config_list:get();
        if not v607 then
            print("No config selected.");
            return;
        else
            if v603[v607] then
                v526.add_likes(v607, -1);
                v603[v607] = false;
                print("Unliked config #" .. v607);
                for _, v609 in ipairs(v526.list) do
                    v526.cfg_info:update({
                        [1] = "Author: " .. v609.author, 
                        [2] = "Build: " .. v609.build, 
                        [3] = "Updated: " .. v609.update, 
                        [4] = "Likes: " .. v609.likes, 
                        [5] = "Downloads: " .. v609.downloads
                    });
                end;
            else
                v526.add_likes(v607, 1);
                v603[v607] = true;
                print("Liked config #" .. v607);
                for _, v611 in ipairs(v526.list) do
                    v526.cfg_info:update({
                        [1] = "Author: " .. v611.author, 
                        [2] = "Build: " .. v611.build, 
                        [3] = "Updated: " .. v611.update, 
                        [4] = "Likes: " .. v611.likes, 
                        [5] = "Downloads: " .. v611.downloads
                    });
                end;
            end;
            return;
        end;
    end):depend({
        [1] = nil, 
        [2] = 3, 
        [1] = v35.Menu.Main.Tab
    }, {
        [1] = nil, 
        [2] = 4, 
        [1] = v35.Menu.Main.cloud
    }):tooltip("Like on selected config");
end;
v526.Menu();
v21(string.format("Welcome \aFBCEA2FF%s\aFFFFFFFF to Atlantic.oce[\aFBCEA2FF%s\aFFFFFFFF]", v35.Data.User, v35.Data.Build));
print_raw("                                                                                                                                                                                                                                                                                                                                                                                                                                                      \n                                                                                \n                                     \226\150\150                                          \n                                \226\150\150\226\150\150\226\150\152\226\150\152\226\150\154\226\150\151\226\150\154\226\150\154\226\150\152\226\150\154\226\150\151                                     \n                             \226\150\151\226\150\157\226\150\150\226\150\150\226\150\158\226\150\158\226\150\155\226\150\158\226\150\158\226\150\158\226\150\158\226\150\158\226\150\158\226\150\150\226\150\140\226\150\154                                   \n                            \226\150\158\226\150\151\226\150\152\226\150\158\226\150\140\226\150\155\226\150\158\226\150\157      \226\150\157\226\150\157\226\150\150\226\150\140\226\150\150                                 \n                          \226\150\151\226\150\154\226\150\144 \226\150\151\226\150\154\226\150\154\226\150\152          \226\150\157\226\150\158\226\150\150                                 \n                         \226\150\151\226\150\154\226\150\158 \226\150\151\226\150\156\226\150\144             \226\150\158\226\150\158      \226\150\132\226\150\132\226\150\132                        \n                        \226\150\151\226\150\154\226\150\140\226\150\152 \226\150\159\226\150\144\226\150\152  \226\150\157          \226\150\158\226\150\157      \226\150\154\226\150\151\226\150\151\226\150\152     \226\150\150                 \n                        \226\150\154\226\150\153\226\150\152  \226\150\153\226\150\154\226\150\140 \226\150\157\226\150\158       \226\150\150\226\150\150\226\150\154\226\150\152        \226\150\157      \226\150\151\226\150\151                 \n                       \226\150\157\226\150\153\226\150\153\226\150\152  \226\150\153\226\150\155\226\150\132 \226\150\140\226\150\158\226\150\150                         \226\150\151\226\150\151                 \n                       \226\150\154\226\150\153\226\150\153\226\150\152  \226\150\154\226\150\155\226\150\153\226\150\153\226\150\154\226\150\132\226\150\144\226\150\151                       \226\150\151\226\150\152\226\150\150                 \n                       \226\150\156\226\150\159\226\150\159\226\150\140  \226\150\157\226\150\159\226\150\153\226\150\153\226\150\155\226\150\159\226\150\150\226\150\154\226\150\157\226\150\150         \226\150\152         \226\150\151\226\150\157\226\150\150\226\150\140                  \n                       \226\150\152\226\150\152\226\150\152\226\150\128   \226\150\157\226\150\159\226\150\158\226\150\155\226\150\153\226\150\156\226\150\140\226\150\140\226\150\158\226\150\158\226\150\150\226\150\150        \226\150\152 \226\150\150\226\150\132\226\150\150\226\150\140\226\150\140\226\150\155\226\150\158\226\150\158                    \n                                 \226\150\128\226\150\128\226\150\154\226\150\155\226\150\136\226\150\158\226\150\132\226\150\152\226\150\140\226\150\140\226\150\140\226\150\150\226\150\150                                  \n                     \226\150\150               \226\150\157\226\150\128\226\150\153\226\150\136\226\150\158\226\150\132\226\150\154\226\150\152\226\150\140\226\150\128\226\150\140\226\150\140\226\150\132\226\150\151\226\150\151       \226\150\151\226\150\132                   \n                   \226\150\157\226\150\151\226\150\151\226\150\152\226\150\128\226\150\158\226\150\144\226\150\157\226\150\157\226\150\157\226\150\157\226\150\150\226\150\150\226\150\150\226\150\150       \226\150\128\226\150\128\226\150\153\226\150\136\226\150\158\226\150\153\226\150\154\226\150\144\226\150\151\226\150\154\226\150\154\226\150\128\226\150\153\226\150\156\226\150\156\226\150\156\226\150\156\226\150\155\226\150\152                    \n                  \226\150\154\226\150\152\226\150\154\226\150\151\226\150\154\226\150\154\226\150\158\226\150\158\226\150\157\226\150\152\226\150\128\226\150\157\226\150\151\226\150\154\226\150\157\226\150\150\226\150\154\226\150\154\226\150\151\226\150\151       \226\150\157\226\150\152\226\150\128\226\150\128\226\150\128\226\150\155\226\150\153\226\150\156\226\150\144\226\150\128\226\150\152\226\150\128                       \n                 \226\150\157\226\150\150\226\150\154\226\150\154\226\150\154\226\150\154\226\150\152         \226\150\157\226\150\154\226\150\132\226\150\154\226\150\132\226\150\154\226\150\152\226\150\150\226\150\150                                      \n                 \226\150\157\226\150\144\226\150\144\226\150\144\226\150\144              \226\150\154\226\150\154\226\150\140\226\150\155\226\150\159\226\150\158\226\150\155\226\150\158\226\150\132\226\150\132\226\150\132\226\150\150\226\150\132\226\150\150\226\150\150\226\150\150\226\150\150\226\150\150\226\150\132\226\150\132\226\150\132\226\150\157                      \n                  \226\150\152\226\150\140\226\150\153\226\150\154\226\150\152    \226\150\151\226\150\155\226\150\136\226\150\155\226\150\136\226\150\156\226\150\153\226\150\153\226\150\132  \226\150\153\226\150\156\226\150\132\226\150\154\226\150\154\226\150\156\226\150\144\226\150\144\226\150\150\226\150\155\226\150\158\226\150\158\226\150\153\226\150\156\226\150\144\226\150\156\226\150\157                         \n                    \226\150\152\226\150\152\226\150\140     \226\150\157\226\150\154\226\150\136\226\150\156\226\150\153\226\150\153\226\150\153\226\150\153\226\150\136\226\150\156\226\150\159\226\150\154\226\150\155\226\150\155\226\150\155\226\150\159\226\150\154\226\150\153\226\150\153\226\150\153\226\150\156\226\150\159\226\150\159\226\150\158\226\150\152\226\150\152                          \n                               \226\150\152\226\150\128\226\150\159\226\150\153\226\150\155\226\150\159\226\150\156\226\150\159\226\150\156\226\150\159\226\150\156\226\150\156\226\150\156\226\150\156\226\150\159\226\150\159\226\150\158\226\150\155\226\150\157                              \n                                   \226\150\157\226\150\157\226\150\128\226\150\128\226\150\128\226\150\128\226\150\128\226\150\128\226\150\128\226\150\152\226\150\152                                  \n\n        \226\150\145\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\149\151\226\150\145\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\149\151\226\150\136\226\150\136\226\149\151\226\150\145\226\150\145\226\150\145\226\150\145\226\150\145\226\150\145\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\149\151\226\150\145\226\150\136\226\150\136\226\150\136\226\149\151\226\150\145\226\150\145\226\150\136\226\150\136\226\149\151\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\149\151\226\150\136\226\150\136\226\149\151\226\150\145\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\149\151\226\150\145\226\150\145\226\150\145\226\150\145\226\150\145\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\149\151\226\150\145\226\150\145\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\149\151\226\150\145\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\149\151\n        \226\150\136\226\150\136\226\149\148\226\149\144\226\149\144\226\150\136\226\150\136\226\149\151\226\149\154\226\149\144\226\149\144\226\150\136\226\150\136\226\149\148\226\149\144\226\149\144\226\149\157\226\150\136\226\150\136\226\149\145\226\150\145\226\150\145\226\150\145\226\150\145\226\150\145\226\150\136\226\150\136\226\149\148\226\149\144\226\149\144\226\150\136\226\150\136\226\149\151\226\150\136\226\150\136\226\150\136\226\150\136\226\149\151\226\150\145\226\150\136\226\150\136\226\149\145\226\149\154\226\149\144\226\149\144\226\150\136\226\150\136\226\149\148\226\149\144\226\149\144\226\149\157\226\150\136\226\150\136\226\149\145\226\150\136\226\150\136\226\149\148\226\149\144\226\149\144\226\150\136\226\150\136\226\149\151\226\150\145\226\150\145\226\150\145\226\150\136\226\150\136\226\149\148\226\149\144\226\149\144\226\150\136\226\150\136\226\149\151\226\150\136\226\150\136\226\149\148\226\149\144\226\149\144\226\150\136\226\150\136\226\149\151\226\150\136\226\150\136\226\149\148\226\149\144\226\149\144\226\149\144\226\149\144\226\149\157\n        \226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\149\145\226\150\145\226\150\145\226\150\145\226\150\136\226\150\136\226\149\145\226\150\145\226\150\145\226\150\145\226\150\136\226\150\136\226\149\145\226\150\145\226\150\145\226\150\145\226\150\145\226\150\145\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\149\145\226\150\136\226\150\136\226\149\148\226\150\136\226\150\136\226\149\151\226\150\136\226\150\136\226\149\145\226\150\145\226\150\145\226\150\145\226\150\136\226\150\136\226\149\145\226\150\145\226\150\145\226\150\145\226\150\136\226\150\136\226\149\145\226\150\136\226\150\136\226\149\145\226\150\145\226\150\145\226\149\154\226\149\144\226\149\157\226\150\145\226\150\145\226\150\145\226\150\136\226\150\136\226\149\145\226\150\145\226\150\145\226\150\136\226\150\136\226\149\145\226\150\136\226\150\136\226\149\145\226\150\145\226\150\145\226\149\154\226\149\144\226\149\157\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\149\151\226\150\145\226\150\145\n        \226\150\136\226\150\136\226\149\148\226\149\144\226\149\144\226\150\136\226\150\136\226\149\145\226\150\145\226\150\145\226\150\145\226\150\136\226\150\136\226\149\145\226\150\145\226\150\145\226\150\145\226\150\136\226\150\136\226\149\145\226\150\145\226\150\145\226\150\145\226\150\145\226\150\145\226\150\136\226\150\136\226\149\148\226\149\144\226\149\144\226\150\136\226\150\136\226\149\145\226\150\136\226\150\136\226\149\145\226\149\154\226\150\136\226\150\136\226\150\136\226\150\136\226\149\145\226\150\145\226\150\145\226\150\145\226\150\136\226\150\136\226\149\145\226\150\145\226\150\145\226\150\145\226\150\136\226\150\136\226\149\145\226\150\136\226\150\136\226\149\145\226\150\145\226\150\145\226\150\136\226\150\136\226\149\151\226\150\145\226\150\145\226\150\145\226\150\136\226\150\136\226\149\145\226\150\145\226\150\145\226\150\136\226\150\136\226\149\145\226\150\136\226\150\136\226\149\145\226\150\145\226\150\145\226\150\136\226\150\136\226\149\151\226\150\136\226\150\136\226\149\148\226\149\144\226\149\144\226\149\157\226\150\145\226\150\145\n        \226\150\136\226\150\136\226\149\145\226\150\145\226\150\145\226\150\136\226\150\136\226\149\145\226\150\145\226\150\145\226\150\145\226\150\136\226\150\136\226\149\145\226\150\145\226\150\145\226\150\145\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\149\151\226\150\136\226\150\136\226\149\145\226\150\145\226\150\145\226\150\136\226\150\136\226\149\145\226\150\136\226\150\136\226\149\145\226\150\145\226\149\154\226\150\136\226\150\136\226\150\136\226\149\145\226\150\145\226\150\145\226\150\145\226\150\136\226\150\136\226\149\145\226\150\145\226\150\145\226\150\145\226\150\136\226\150\136\226\149\145\226\149\154\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\149\148\226\149\157\226\150\136\226\150\136\226\149\151\226\149\154\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\149\148\226\149\157\226\149\154\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\149\148\226\149\157\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\150\136\226\149\151\n        \226\149\154\226\149\144\226\149\157\226\150\145\226\150\145\226\149\154\226\149\144\226\149\157\226\150\145\226\150\145\226\150\145\226\149\154\226\149\144\226\149\157\226\150\145\226\150\145\226\150\145\226\149\154\226\149\144\226\149\144\226\149\144\226\149\144\226\149\144\226\149\144\226\149\157\226\149\154\226\149\144\226\149\157\226\150\145\226\150\145\226\149\154\226\149\144\226\149\157\226\149\154\226\149\144\226\149\157\226\150\145\226\150\145\226\149\154\226\149\144\226\149\144\226\149\157\226\150\145\226\150\145\226\150\145\226\149\154\226\149\144\226\149\157\226\150\145\226\150\145\226\150\145\226\149\154\226\149\144\226\149\157\226\150\145\226\149\154\226\149\144\226\149\144\226\149\144\226\149\144\226\149\157\226\150\145\226\149\154\226\149\144\226\149\157\226\150\145\226\149\154\226\149\144\226\149\144\226\149\144\226\149\144\226\149\157\226\150\145\226\150\145\226\149\154\226\149\144\226\149\144\226\149\144\226\149\144\226\149\157\226\150\145\226\149\154\226\149\144\226\149\144\226\149\144\226\149\144\226\149\144\226\149\144\226\149\157                                                                                                                                                                                                      \n");