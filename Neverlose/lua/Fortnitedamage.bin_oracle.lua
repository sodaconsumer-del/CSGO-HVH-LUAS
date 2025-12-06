local l_utils_0 = utils;
local l_ui_0 = ui;
local l_entity_0 = entity;
local l_globals_0 = globals;
local l_events_0 = events;
local l_render_0 = render;
local _ = common;
local l_vector_0 = vector;
local l_color_0 = color;
local _ = bit;
local _ = rage;
local _ = cvar;
local l_files_0 = files;
local _ = math.clamp;
local l_new_class_0 = new_class;
local l_ffi_0 = require("ffi");
l_ffi_0.cdef("    void* __stdcall URLDownloadToFileA(void* LPUNKNOWN, const char* LPCSTR, const char* LPCSTR2, int a, int LPBINDSTATUSCALLBACK);\n    bool DeleteUrlCacheEntryA(const char* lpszUrlName);\n");
l_ffi_0.cast("void(__thiscall*)(void*)", l_utils_0.opcode_scan("client.dll", "8B F1 80 BE ? ? ? ? ? 74 36", -5) or error("cast error"));
local v16 = l_ffi_0.load("UrlMon");
local v17 = l_ffi_0.load("WinInet");
local function v20(v18, v19)
    -- upvalues: v17 (ref), v16 (ref)
    v17.DeleteUrlCacheEntryA(v18);
    v16.URLDownloadToFileA(nil, v18, v19, 0, 0);
    return true;
end;
(function()
    -- upvalues: l_files_0 (ref), l_render_0 (ref), l_vector_0 (ref), v20 (ref)
    local v21 = "nl\\Fortnite\\";
    l_files_0.create_folder("nl\\Fortnite");
    local v22 = "https://github.com/YHCwool/Fortnite_Image/releases/download/Release/%d.png";
    for v23 = 0, 9 do
        local v24 = v21 .. v23 .. ".png";
        do
            local l_v24_0 = v24;
            local l_status_0, _ = pcall(function()
                -- upvalues: l_render_0 (ref), l_v24_0 (ref), l_vector_0 (ref)
                return l_render_0.load_image_from_file(l_v24_0, l_vector_0(32, 30));
            end);
            if not l_status_0 then
                local v28 = string.format(v22, v23);
                v20(v28, l_v24_0);
            end;
        end;
    end;
end)();
l_new_class_0():struct("Data")({
    Height = 105, 
    Width = 59, 
    Ref = {
        World = l_ui_0.find("Visuals", "World", "World ESP")
    }, 
    Data = {}, 
    Image = {
        [1] = "0", 
        [2] = "1", 
        [3] = "2", 
        [4] = "3", 
        [5] = "4", 
        [6] = "5", 
        [7] = "6", 
        [8] = "7", 
        [9] = "8", 
        [10] = "9"
    }, 
    Image_Table = {}, 
    Mode = {
        Player = function(v29)
            -- upvalues: l_entity_0 (ref)
            return l_entity_0.get_local_player() == v29;
        end, 
        Teammates = function(v30)
            -- upvalues: l_entity_0 (ref)
            return not v30:is_enemy() and l_entity_0.get_local_player() ~= v30;
        end, 
        Enemies = function(v31)
            return v31:is_enemy();
        end
    }
}):struct("Menu")({
    CreateMenu = function(v32)
        -- upvalues: l_color_0 (ref)
        v32.Enabled = v32.Data.Ref.World:switch("Fortnite damage");
        v32.Gear = v32.Menu.Enabled:create();
        v32.Body_Color = v32.Menu.Gear:color_picker("Body Color", l_color_0(255, 255, 255, 255));
        v32.Head_Color = v32.Menu.Gear:color_picker("Headshot Color", l_color_0(255, 255, 0, 255));
        v32.Mode = v32.Menu.Gear:selectable("Mode", "Player", "Teammates", "Enemies");
        v32.Scale = v32.Menu.Gear:slider("Scale", 25, 200, 100, nil, "%");
        v32.Timeout = v32.Menu.Gear:slider("Fade time", 10, 100, 50, 0.1, function(v33)
            return v33 * 0.1 .. "s";
        end);
    end
}):struct("Handle")({
    Quart_in = function(_, v35, v36, v37, v38)
        v35 = v35 / v38;
        return v37 * math.pow(v35, 4) + v36;
    end, 
    Elastic_out = function(_, v40, v41, v42, v43, v44, v45)
        if v40 == 0 then
            return v41;
        else
            v40 = v40 / v43;
            if v40 == 1 then
                return v41 + v42;
            else
                if not v45 then
                    v45 = v43 * 0.3;
                end;
                local v46 = nil;
                if not v44 or v44 < math.abs(v42) then
                    v44 = v42;
                    v46 = v45 / 4;
                else
                    v46 = v45 / (2 * math.pi) * math.asin(v42 / v44);
                end;
                return v44 * math.pow(2, -10 * v40) * math.sin((v40 * v43 - v46) * (2 * math.pi) / v45) + v42 + v41;
            end;
        end;
    end, 
    Basic = function(v47, v48, v49, v50, v51, v52, v53, v54, v55)
        -- upvalues: l_render_0 (ref), l_vector_0 (ref), l_color_0 (ref)
        l_render_0.texture(v47.Data.Image_Table[v48], l_vector_0(v49 - v51 * v47.Data.Width / 2, v50 - v51 * v47.Data.Height / 2), l_vector_0(v47.Data.Width * v51, v47.Data.Height * v51), l_color_0(v52, v53, v54, -v55), "f");
    end, 
    Dynamic = function(v56, v57, v58, v59, v60, v61, v62, v63, v64, v65, v66)
        local v67 = v56:Quart_in(v64 / v57, 0, 1, 1);
        local v68 = v63 * (v67 - 1);
        local l_v67_0 = v67;
        local v70 = string.format("%d", v66);
        for v71 = 1, string.len(v70) do
            v56:Basic(tonumber(string.sub(v70, v71, v71)), v58 + v71 * v56.Data.Width * v65, v59 - l_v67_0 * 256, v65 * (v56:Elastic_out(v64, 0, 1, v71 * 0.25 + 1) - v67), v60, v61, v62, v68);
        end;
    end, 
    Draw = function(v72)
        -- upvalues: l_entity_0 (ref), l_globals_0 (ref), l_render_0 (ref)
        local l_Menu_0 = v72.Menu;
        local l_Data_0 = v72.Data;
        local v75 = l_entity_0.get_local_player();
        if not l_Menu_0.Enabled:get() or v75 == nil then
            return;
        else
            local v76 = l_Menu_0.Timeout:get() * 0.1;
            local v77 = l_Menu_0.Scale:get() * 0.005;
            local v78, v79, v80, v81 = l_Menu_0.Head_Color:get():unpack();
            local v82, v83, v84, v85 = l_Menu_0.Body_Color:get():unpack();
            local l_realtime_0 = l_globals_0.realtime;
            for v87, v88 in pairs(l_Data_0.Data) do
                if v88 then
                    local v89 = l_render_0.world_to_screen(v88[3]);
                    if v89 and v89.x then
                        local l_v82_0 = v82;
                        local l_v83_0 = v83;
                        local l_v84_0 = v84;
                        local l_v85_0 = v85;
                        if v88[4] then
                            l_v82_0 = v78;
                            l_v83_0 = v79;
                            l_v84_0 = v80;
                            l_v85_0 = v81;
                        end;
                        if v76 <= l_realtime_0 - v88[2] then
                            l_Data_0.Data[v87] = nil;
                        else
                            v72:Dynamic(v76, v89.x, v89.y, l_v82_0, l_v83_0, l_v84_0, l_v85_0, l_realtime_0 - v88[2], v77, v88[1]);
                        end;
                    end;
                end;
            end;
            return;
        end;
    end, 
    Visible = function(v94)
        local l_Menu_1 = v94.Menu;
        l_Menu_1.Gear:visibility(l_Menu_1.Enabled:get());
    end
}):struct("CallBack")({
    Player_Hurt = function(v96, v97)
        -- upvalues: l_entity_0 (ref), l_globals_0 (ref)
        local l_Menu_2 = v96.Menu;
        local l_Data_1 = v96.Data;
        if not l_Menu_2.Enabled:get() then
            return;
        elseif l_entity_0.get_local_player() == nil then
            return;
        else
            local v100 = l_entity_0.get(v97.attacker, true);
            local v101 = l_entity_0.get(v97.userid, true);
            for _, v103 in ipairs(l_Menu_2.Mode:get()) do
                if l_Data_1.Mode[v103](v100) then
                    if v101 == nil or v100 == nil then
                        return;
                    else
                        local v104 = v101:get_hitbox_position(0);
                        if v104.x ~= nil then
                            if l_Data_1.Data[v101:get_index()] then
                                local v105 = {
                                    [1] = l_Data_1.Data[v101:get_index()][1] + v97.dmg_health, 
                                    [2] = l_globals_0.realtime, 
                                    [3] = v104, 
                                    [4] = v97.hitgroup == 1
                                };
                                l_Data_1.Data[v101:get_index()] = v105;
                            else
                                local v106 = {
                                    [1] = v97.dmg_health, 
                                    [2] = l_globals_0.realtime, 
                                    [3] = v104, 
                                    [4] = v97.hitgroup == 1
                                };
                                l_Data_1.Data[v101:get_index()] = v106;
                            end;
                        end;
                        return;
                    end;
                end;
            end;
            return;
        end;
    end, 
    Render = function(v107)
        v107.Handle:Visible();
        v107.Handle:Draw();
    end
}):struct("Work")({
    Run = function(v108)
        -- upvalues: l_render_0 (ref), l_vector_0 (ref), l_events_0 (ref)
        for v109, v110 in ipairs(v108.Data.Image) do
            v108.Data.Image_Table[v109 - 1] = l_render_0.load_image_from_file("nl\\Fortnite\\" .. v110 .. ".png", l_vector_0(v108.Data.Width, v108.Data.Height));
        end;
        v108.Menu:CreateMenu();
        l_events_0.render:set(function()
            -- upvalues: v108 (ref)
            v108.CallBack:Render();
        end);
        l_events_0.player_hurt:set(function(v111)
            -- upvalues: v108 (ref)
            v108.CallBack:Player_Hurt(v111);
        end);
    end
}).Work:Run();