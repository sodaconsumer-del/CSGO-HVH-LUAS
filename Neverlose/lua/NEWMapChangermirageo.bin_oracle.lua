local v21 = {
    data = {
        buildInDataExp = {}, 
        haveMapChanged = {
            changed = false, 
            lastMapName = ""
        }
    }, 
    error = function(v0, v1)
        return {
            ERROR_KEYVALUE = "0B13X", 
            reason = v0, 
            value = v1
        };
    end, 
    checkForErrors = function(v2)
        if v2.ERROR_KEYVALUE ~= "0B13X" then
            return false;
        else
            return true;
        end;
    end, 
    setBuildInData = function(v3, v4)
        v3.data.buildInDataExp = v4;
    end, 
    getMaterialsMatchingInBuiltTable = function(v5)
        local v6 = common.get_map_data();
        if v6 == nil then
            return v5.error("library.getMaterialsMatchingInBuiltTable -> Failed to find currentLoadedMapName", v6);
        else
            v6 = v6.shortname;
            local v7 = v5.data.buildInDataExp.maps[v6];
            if v7 == nil then
                return v5.error("library.getMaterialsMatchingInBuiltTable -> Failed to find BuildInDataSector", v7);
            else
                local v8 = v5.getMaterialListInTableFromCurrentPath(v6);
                local l_materials_0 = v7.materials;
                local v10 = {};
                for _, v12 in pairs(v8) do
                    local v13 = v12:get_name();
                    for _, v15 in pairs(l_materials_0) do
                        if v15.path == v13 then
                            v10[#v10 + 1] = v15;
                        end;
                    end;
                end;
                return v10;
            end;
        end;
    end, 
    haveMapChangedHook = function(v16)
        local v17 = common.get_map_data();
        local v18 = v17 == nil and {} or v17.shortname;
        if v16.data.haveMapChanged.lastMapName ~= v18 then
            events.mapChanged:call();
            v16.data.haveMapChanged.lastMapName = v18;
        end;
    end, 
    getMaterialListInTableFromCurrentPath = function(v19)
        return materials.get_materials(v19);
    end, 
    hookMainSources = function(v20)
        events.render:set(function()
            -- upvalues: v20 (ref)
            v20:haveMapChangedHook();
        end);
    end
};
v21:hookMainSources();
({
    data = {
        overridedMaterialList = {}
    }, 
    loadBuiltInData = {
        loadExpData = function()
            -- upvalues: v21 (ref)
            v21:setBuildInData(json.parse(network.get("https://pastebin.com/raw/eccTNPC1")));
        end, 
        hookSelf = function(v22)
            v22.loadExpData();
        end
    }, 
    destroyOnUnload = function(v23)
        for _, v25 in pairs(v23.data.overridedMaterialList) do
            v25.loaded:reset();
            v25.prepared:reset();
        end;
        v23.data.overridedMaterialList = {};
    end, 
    hookMainSources = function(v26)
        -- upvalues: v21 (ref)
        v26.loadBuiltInData:hookSelf();
        local function v34()
            -- upvalues: v21 (ref), v26 (ref)
            utils.execute_after(0.1, function()
                -- upvalues: v21 (ref), v26 (ref)
                local v27 = v21:getMaterialsMatchingInBuiltTable();
                if v21.checkForErrors(v27) == false then
                    for _, v29 in pairs(v27) do
                        local v30 = materials.get(v29.path);
                        if v30 ~= nil and v30:is_valid() then
                            local v31 = materials.create(v30:get_name(), "[]");
                            v31:override(v30);
                            if v29.params ~= nil then
                                for v32, v33 in pairs(v29.params) do
                                    v30:shader_param(v32, v33);
                                end;
                            end;
                            v30:override(v31);
                            v26.data.overridedMaterialList[#v26.data.overridedMaterialList + 1] = {
                                loaded = v30, 
                                prepared = v31, 
                                prepared_params = v29.params
                            };
                        end;
                    end;
                end;
            end);
        end;
        events.shutdown:set(function()
            -- upvalues: v26 (ref)
            v26:destroyOnUnload();
        end);
        events.round_start:set(function()
            -- upvalues: v26 (ref), v34 (ref)
            v26:destroyOnUnload();
            v34();
        end);
        ui.find("Visuals", "World", "Ambient", "Night Mode"):set_callback(function()
            -- upvalues: v26 (ref), v34 (ref)
            if ui.find("Visuals", "World", "Ambient", "Night Mode"):get() == false then
                v26:destroyOnUnload();
                utils.execute_after(0.2, v34);
            else
                v34();
            end;
        end);
        events.level_init:set(function()
            -- upvalues: v26 (ref), v34 (ref)
            v26:destroyOnUnload();
            utils.execute_after(1, v34);
        end);
        v34();
    end
}):hookMainSources();