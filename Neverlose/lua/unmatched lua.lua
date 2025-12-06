if ffi == nil then
    ffi = require("ffi");
end;
if bit == nil then
    bit = require("bit");
end;
local l_ffi_0 = ffi;
local l_bit_0 = bit;
local l_new_0 = l_ffi_0.new;
local l_cast_0 = l_ffi_0.cast;
local _ = l_ffi_0.cdef;
local l_typeof_0 = l_ffi_0.typeof;
local l_band_0 = l_bit_0.band;
local l_bor_0 = l_bit_0.bor;
local l_bxor_0 = l_bit_0.bxor;
local l_bnot_0 = l_bit_0.bnot;
local l_lshift_0 = l_bit_0.lshift;
local l_rshift_0 = l_bit_0.rshift;
local _ = l_bit_0.ror;
local _ = l_bit_0.rol;
local v14 = nil;
local v15 = nil;
local v16 = nil;
local v17 = nil;
local v18 = nil;
local v19 = nil;
local _ = nil;
local v21 = nil;
local v22 = nil;
local v23 = nil;
local v24 = nil;
local v25 = nil;
local v26 = nil;
local v27 = nil;
local v28 = nil;
local v29 = nil;
local v30 = nil;
local v31 = nil;
local v32 = nil;
local v33 = nil;
local v34 = {
    debug = false, 
    spoof = false, 
    unmatched_lua = true
};
local v35 = {};
local function v39(v36)
    for v37, v38 in pairs(v36) do
        v36[v38] = v37;
    end;
    return v36;
end;
local function v40(...)
    -- upvalues: v34 (ref)
    if v34.debug then
        print(...);
    end;
end;
local v41 = v39({
    [1] = "Gamesense", 
    [2] = "Ev0lve", 
    [3] = "Fatality", 
    [4] = "Primordial", 
    [5] = "Pandora", 
    [6] = "Plague cheat", 
    [7] = "Legion", 
    [8] = "Nixware", 
    [9] = "Spirthack", 
    [10] = "Extension", 
    [11] = "Onetap", 
    [12] = "Legendware", 
    [13] = "Neverlose", 
    [14] = "Airflow", 
    [15] = "Airflow old", 
    [16] = "Weave", 
    [17] = "Fatality old", 
    [18] = "Solus UI"
});
local v42 = v39({
    [1] = "Self", 
    [2] = "Team", 
    [3] = "Enemies"
});
local v43 = v39({
    [1] = "Real", 
    [2] = "Random", 
    [3] = "Ghost"
});
local v44 = v39({
    [1] = "Original", 
    [2] = "Solus", 
    [3] = "Skeet colored", 
    [4] = "Skeet monotone"
});
local v45 = v39({
    [1] = "NONE", 
    [2] = "FATALITY", 
    [3] = "AIRFLOW", 
    [4] = "NEVERLOSE", 
    [5] = "PRIMORDIAL", 
    [6] = "GAMESENSE", 
    [7] = "PANDORA", 
    [8] = "ONETAP", 
    [9] = "EV0LVE", 
    [10] = "PLAGUE", 
    [11] = "NIXWARE", 
    [12] = "SOLUS_UI", 
    [13] = "RIFK7", 
    [14] = "LEGION", 
    [15] = "MONOLITH", 
    [16] = "AIMWARE", 
    [17] = "LEGENDWARE", 
    [18] = "SPIRTHACK", 
    [19] = "EXTENSION", 
    [20] = "WEAVE", 
    [21] = "FATALITY_OLD"
});
local v46 = v39({
    [1] = "EV0LVE", 
    [2] = "FATALITY", 
    [3] = "PRIMORDIAL", 
    [4] = "LEGION", 
    [5] = "PANDORA", 
    [6] = "GAMESENSE", 
    [7] = "LEGENDWARE", 
    [8] = "NEVERLOSE", 
    [9] = "NIXWARE", 
    [10] = "SPIRTHACK", 
    [11] = "RIFK7"
});
local v47 = {
    [v46.EV0LVE] = v45.EV0LVE, 
    [v46.FATALITY] = v45.FATALITY, 
    [v46.PRIMORDIAL] = v45.PRIMORDIAL, 
    [v46.LEGION] = v45.LEGION, 
    [v46.PANDORA] = v45.PANDORA, 
    [v46.GAMESENSE] = v45.GAMESENSE, 
    [v46.LEGENDWARE] = v45.LEGENDWARE, 
    [v46.NEVERLOSE] = v45.NEVERLOSE, 
    [v46.NIXWARE] = v45.NIXWARE, 
    [v46.SPIRTHACK] = v45.SPIRTHACK, 
    [v46.RIFK7] = v45.RIFK7
};
local v48 = nil;
if _G == nil then
    if quick_maths ~= nil then
        v48 = v46.RIFK7;
    elseif info.fatality == nil then
        v48 = v46.EV0LVE;
    else
        v48 = v46.FATALITY;
    end;
elseif MatSystem ~= nil then
    v48 = v46.SPIRTHACK;
elseif file ~= nil then
    v48 = v46.LEGENDWARE;
elseif penetration ~= nil then
    v48 = v46.PANDORA;
elseif math_utils ~= nil then
    v48 = v46.LEGION;
elseif plist ~= nil then
    v48 = v46.GAMESENSE;
elseif network ~= nil then
    v48 = v46.NEVERLOSE;
elseif renderer ~= nil and renderer.setup_texture ~= nil then
    v48 = v46.NIXWARE;
else
    v48 = v46.PRIMORDIAL;
end;
v40("implementation: " .. v46[v48]);
local l_panorama_0 = panorama;
if _G == nil or l_panorama_0 == nil then
    l_panorama_0 = (function()
        local v50 = nil;
        local v51 = nil;
        local v52 = nil;
        local v53 = nil;
        local v54 = nil;
        local v55 = nil;
        local v56 = nil;
        local v57 = nil;
        local v58 = nil;
        local v59 = nil;
        local v60 = nil;
        local v61 = nil;
        local v62 = nil;
        local v63 = nil;
        local v64 = nil;
        local v65 = nil;
        local v66 = nil;
        local v67 = nil;
        local v68 = nil;
        local v69 = nil;
        local v70 = nil;
        local v71 = nil;
        local v72 = nil;
        local v73 = nil;
        local v74 = nil;
        local v75 = nil;
        local v76 = nil;
        local v77 = nil;
        local v78 = nil;
        local v79 = nil;
        local v80 = nil;
        local v81 = nil;
        local v82 = nil;
        local v83 = nil;
        local v84 = nil;
        local v85 = nil;
        local v86 = nil;
        local v87 = nil;
        local v88 = nil;
        local v89 = nil;
        local v90 = nil;
        local v91 = nil;
        local v92 = nil;
        local v93 = nil;
        local v94 = nil;
        local v95 = nil;
        local v96 = nil;
        local v97 = nil;
        local v98 = nil;
        local v99 = nil;
        local v100 = nil;
        local v101 = nil;
        local v102 = nil;
        local v103 = nil;
        local v104 = nil;
        local v105 = nil;
        local v106 = nil;
        local v107 = nil;
        local v108 = nil;
        local v109 = nil;
        local v110 = nil;
        local v111 = nil;
        local v112 = nil;
        local v113 = nil;
        local v114 = nil;
        local v115 = nil;
        local v116 = nil;
        local v117 = nil;
        local v118 = nil;
        local v119 = nil;
        local v120 = nil;
        local v121 = nil;
        local v122 = nil;
        local v123 = nil;
        local v124 = nil;
        local v125 = nil;
        local v126 = nil;
        local v127 = nil;
        local v128 = nil;
        local v129 = nil;
        local v130 = nil;
        v50 = {
            _VERSION = 1.7
        };
        setmetatable(v50, {
            __call = function(v131)
                return v131._VERSION;
            end, 
            __tostring = function(v132)
                return v132._VERSION;
            end
        });
        v51 = require("ffi");
        local l_v51_0 = v51;
        local l_cast_1 = l_v51_0.cast;
        local l_typeof_1 = l_v51_0.typeof;
        local l_new_1 = l_v51_0.new;
        local l_string_0 = l_v51_0.string;
        v56 = l_v51_0.metatype;
        v55 = l_string_0;
        v54 = l_new_1;
        v53 = l_typeof_1;
        v52 = l_cast_1;
        v57 = function()
            return error("Unsupported provider");
        end;
        v58 = function()
            return error("Unsupported provider");
        end;
        v59 = function()
            return print("WARNING: Cleanup before shutdown disabled");
        end;
        l_v51_0 = nil;
        if _G == nil then
            if quick_maths == nil then
                l_v51_0 = info.fatality == nil and "ev0lve" or "fa7ality";
            else
                l_v51_0 = "rifk7";
            end;
        else
            l_v51_0 = MatSystem ~= nil and "spirthack" or file ~= nil and "legendware" or GameEventManager ~= nil and "memesense" or penetration ~= nil and "pandora" or math_utils ~= nil and "legion" or plist ~= nil and "gamesense" or network ~= nil and "neverlose" or renderer ~= nil and renderer.setup_texture ~= nil and "nixware" or "primordial";
        end;
        l_cast_1 = l_v51_0;
        if l_cast_1 == "ev0lve" then
            v57 = utils.find_pattern;
            v58 = utils.find_interface;
            v59 = function()

            end;
        elseif l_cast_1 == "fa7ality" then
            v57 = utils.find_pattern;
            v58 = utils.find_interface;
            v59 = function()

            end;
        elseif l_cast_1 == "primordial" then
            v57 = memory.find_pattern;
            v58 = memory.create_interface;
            v59 = function(v138)
                return callbacks.add(e_callbacks.SHUTDOWN, v138);
            end;
        elseif l_cast_1 == "memesense" then
            v57 = Utils.PatternScan;
            v58 = Utils.CreateInterface;
            v59 = function(v139)
                return Cheat.RegisterCallback("destroy", v139);
            end;
        elseif l_cast_1 == "legendware" then
            v57 = utils.find_signature;
            v58 = utils.create_interface;
            v59 = function(v140)
                return client.add_callback("unload", v140);
            end;
        elseif l_cast_1 == "pandora" then
            v57 = client.find_sig;
            v58 = client.create_interface;
        elseif l_cast_1 == "legion" then
            v57 = memory.find_pattern;
            v58 = memory.create_interface;
            v59 = function(v141)
                return client.add_callback("on_unload", v141);
            end;
        elseif l_cast_1 == "gamesense" then
            v57 = function(v142, v143)
                local v144 = "";
                for v145 in v143:gmatch("%S+") do
                    v144 = v144 .. (v145 == "?" and "\204" or _G.string.char(tonumber(v145, 16)));
                end;
                return client.find_signature(v142, v144);
            end;
            v58 = client.create_interface;
            v59 = function(v146)
                return client.set_event_callback("shutdown", v146);
            end;
        elseif l_cast_1 == "nixware" then
            v57 = client.find_pattern;
            v58 = se.create_interface;
            v59 = function(v147)
                return client.register_callback("unload", v147);
            end;
        elseif l_cast_1 == "neverlose" then
            v57 = utils.opcode_scan;
            v58 = utils.create_interface;
            v59 = function()

            end;
        elseif l_cast_1 == "rifk7" then
            v57 = function(v148, v149)
                -- upvalues: v52 (ref)
                local v150 = v52("uint32_t*", engine.signature(v148, v149));
                assert(tonumber(v150) ~= 0);
                return v150[0];
            end;
            v58 = function(v151, v152)
                -- upvalues: v55 (ref)
                v152 = v55.gsub(v152, "%d+", "");
                return general.create_interface(v151, v152);
            end;
            print = function(v153)
                return general.log_to_console_colored("[lua] " .. tostring(v153), 255, 141, 161, 255);
            end;
        elseif l_cast_1 == "spirthack" then
            v57 = Utils.PatternScan;
            v58 = Utils.CreateInterface;
        end;
        v60 = xpcall and pcall and true or false;
        v61 = v51.C and l_v51_0 ~= "gamesense";
        print(("\nluv8 panorama library %s;\nhttps://github.com/Shir0ha/luv8\napi: %s; safe_mode: %s; ffi.C: %s"):format(v50._VERSION, l_v51_0, tostring(v60), tostring(v61)));
        v62 = function()
            -- upvalues: v101 (ref), v106 (ref)
            for _, v155 in pairs(v101) do
                v106(v155):disposeGlobal();
            end;
        end;
        v63 = error;
        if error then
            error = function(v156)
                -- upvalues: v62 (ref), v63 (ref)
                v62();
                return v63(v156);
            end;
        end;
        v64 = function(v157)
            return print("Caught lua exception in V8 HandleScope: ", tostring(v157));
        end;
        v65 = function(v158)
            return print("Caught lua exception in V8 Function Callback: ", tostring(v158));
        end;
        v66 = function(v159, v160)
            local v161 = getmetatable(v159);
            setmetatable(v159, nil);
            local v162 = v159[v160];
            setmetatable(v159, v161);
            return v162;
        end;
        v67 = function(v163, v164, v165)
            local v166 = getmetatable(v163);
            setmetatable(v163, nil);
            v163[v164] = v165;
            return setmetatable(v163, v166);
        end;
        if not rawget then
            rawget = v66;
        end;
        if not rawset then
            rawset = v67;
        end;
        v68 = function(v167, v168)
            return function(...)
                -- upvalues: v167 (ref), v168 (ref)
                return v167(v168, ...);
            end;
        end;
        v69 = function(v169)
            local v170 = {};
            for v171, v172 in pairs(v169) do
                v170[v171] = v172;
            end;
            return v170;
        end;
        v70 = function(v173, v174, v175, v176)
            -- upvalues: v52 (ref), v58 (ref), v68 (ref)
            local v177 = v52("void***", v58(v173, v174)) or error(v174 .. " is nil.");
            return v68(v52(v176, v177[0][v175]), v177);
        end;
        v71 = v53("void***");
        v72 = function(v178, v179, v180)
            -- upvalues: v52 (ref), v71 (ref)
            return v52(v180, v52(v71, v178)[0][v179]);
        end;
        v73 = function(v181, v182)
            -- upvalues: v53 (ref), v72 (ref)
            local v183 = v53(v182);
            return function(v184, ...)
                -- upvalues: v72 (ref), v181 (ref), v183 (ref)
                return v72(v184, v181, v183)(v184, ...);
            end;
        end;
        v74 = (function()
            -- upvalues: v61 (ref), v51 (ref), v52 (ref), v57 (ref), l_v51_0 (ref), v53 (ref)
            local v185 = nil;
            v185 = function()
                return error("Failed to load GetProcAddress");
            end;
            local v186 = nil;
            v186 = function()
                return error("Failed to load GetModuleHandleA");
            end;
            if v61 then
                v51.cdef("            uint32_t GetProcAddress(uint32_t, const char*);\n          uint32_t GetModuleHandleA(const char*);\n      ");
                v185 = v51.C.GetProcAddress;
                v186 = v51.C.GetModuleHandleA;
            else
                v185 = v52("uint32_t(__stdcall*)(uint32_t, const char*)", v52("uint32_t**", v52("uint32_t", v57("engine.dll", "FF 15 ? ? ? ? A3 ? ? ? ? EB 05")) + 2)[0][0]);
                v186 = v52("uint32_t(__stdcall*)(const char*)", v52("uint32_t**", v52("uint32_t", v57("engine.dll", "FF 15 ? ? ? ? 85 C0 74 0B")) + 2)[0][0]);
            end;
            if l_v51_0 == "gamesense" then
                local v187 = v57("engine.dll", "51 C3");
                local v188 = v52("void*", v185);
                do
                    local l_v187_0, l_v188_0 = v187, v188;
                    v185 = function(v191, v192)
                        -- upvalues: v52 (ref), l_v187_0 (ref), l_v188_0 (ref)
                        return v52("uint32_t(__thiscall*)(void*, uint32_t, const char*)", l_v187_0)(l_v188_0, v191, v192);
                    end;
                    local v193 = v52("void*", v186);
                    v186 = function(v194)
                        -- upvalues: v52 (ref), l_v187_0 (ref), v193 (ref)
                        return v52("uint32_t(__thiscall*)(void*, const char*)", l_v187_0)(v193, v194);
                    end;
                end;
            end;
            return function(v195, v196, v197)
                -- upvalues: v52 (ref), v53 (ref), v185 (ref), v186 (ref)
                return v52(v53(v197), v185(v186(v195), v196));
            end;
        end)();
        v75 = function(v198)
            -- upvalues: v52 (ref)
            local v199 = v52("uint8_t*", v198);
            local v200 = v199[0];
            if v200 == 232 then
                return v52("uint32_t", v199 + v52("int32_t*", v199 + 1)[0] + 5);
            elseif v200 == 255 then
                if v199[1] == 21 then
                    return v52("uint32_t**", v52("const char*", v198) + 2)[0][0];
                else
                    return;
                end;
            else
                return v198;
            end;
        end;
        v76 = function(...)
            -- upvalues: v54 (ref), v107 (ref)
            local v201 = {
                ...
            };
            local v202 = #v201;
            local v203 = v54(("void*[%.f]"):format(v202));
            for v204 = 1, v202 do
                v203[v204 - 1] = v107:fromLua(v201[v204]):getInternal();
            end;
            return v202, v203;
        end;
        v77 = function(v205)
            -- upvalues: v113 (ref), v60 (ref), v65 (ref), v107 (ref)
            return function(v206)
                -- upvalues: v113 (ref), v60 (ref), v205 (ref), v65 (ref), v107 (ref)
                v206 = v113(v206);
                local v207 = {};
                local v208 = v206:length();
                if v208 > 0 then
                    for v209 = 0, v208 - 1 do
                        table.insert(v207, v206:get(v209));
                    end;
                end;
                local v210 = nil;
                if v60 then
                    local v211, v212 = xpcall(function()
                        -- upvalues: v205 (ref), v207 (ref)
                        return v205(unpack(v207));
                    end, v65);
                    if v211 then
                        v210 = v212;
                    end;
                else
                    v210 = v205(unpack(v207));
                end;
                return v206:setReturnValue(v107:fromLua(v210):getInternal());
            end;
        end;
        v78 = function(v213)
            local v214 = 1;
            for _ in pairs(v213) do
                if v213[v214] ~= nil then
                    v214 = v214 + 1;
                else
                    return false;
                end;
            end;
            return v214 ~= 1;
        end;
        v79 = v54("void*");
        v80 = v54("int[1]");
        v81 = {
            panelIDs = {}
        };
        l_typeof_1 = nil;
        l_new_1 = {
            get = function(v216, v217, v218)
                -- upvalues: v68 (ref), v52 (ref)
                return v68(v52(v218, v216.this[0][v217]), v216.this);
            end, 
            getInstance = function(v219)
                return v219.this;
            end
        };
        l_new_1.__index = l_new_1;
        do
            local l_l_new_1_0 = l_new_1;
            l_typeof_1 = setmetatable({
                __name = "vtable", 
                __init = function(v221, v222)
                    -- upvalues: v52 (ref)
                    v221.this = v52("void***", v222);
                end, 
                __base = l_l_new_1_0
            }, {
                __index = l_l_new_1_0, 
                __call = function(v223, ...)
                    -- upvalues: l_l_new_1_0 (ref)
                    local v224 = setmetatable({}, l_l_new_1_0);
                    v223.__init(v224, ...);
                    return v224;
                end
            });
            l_l_new_1_0.__class = l_typeof_1;
            v82 = l_typeof_1;
        end;
        l_typeof_1 = nil;
        l_new_1 = {
            cache = {}, 
            get = function(v225, v226, v227)
                -- upvalues: v74 (ref)
                if not v225.cache[v226] then
                    v225.cache[v226] = v74(v225.file, v226, v227);
                end;
                return v225.cache[v226];
            end
        };
        l_new_1.__index = l_new_1;
        do
            local l_l_new_1_1 = l_new_1;
            l_typeof_1 = setmetatable({
                __name = "DllImport", 
                __init = function(v229, v230)
                    v229.file = v230;
                end, 
                __base = l_l_new_1_1
            }, {
                __index = l_l_new_1_1, 
                __call = function(v231, ...)
                    -- upvalues: l_l_new_1_1 (ref)
                    local v232 = setmetatable({}, l_l_new_1_1);
                    v231.__init(v232, ...);
                    return v232;
                end
            });
            l_l_new_1_1.__class = l_typeof_1;
            v83 = l_typeof_1;
        end;
        v84 = v82(v70("panorama.dll", "PanoramaUIEngine001", 11, "void*(__thiscall*)(void*)")());
        v85 = v84:get(36, "bool(__thiscall*)(void*,void const*)");
        v86 = v84:get(56, "void*(__thiscall*)(void*)");
        v87 = v84:get(113, "void****(__thiscall*)(void*,void*,char const*,char const*,int,int,bool)");
        v88 = v68(v52(v53("void*(__thiscall*)(void*,void*,void*,void*,int,bool)"), v75(v57("panorama.dll", "E8 ? ? ? ? 8B 4C 24 10 FF 15"))), v84:getInstance());
        v89 = v84:get(123, "void*(__thiscall*)(void*)");
        v90 = v84:get(129, "void*(__thiscall*)(void*)");
        v91 = v84:get(121, "void(__thiscall*)(void*, void*, void*)");
        v92 = v73(25, "void*(__thiscall*)(void*)");
        v93 = v73(9, "const char*(__thiscall*)(void*)");
        v94 = v73(40, "void*(__thiscall*)(void*,const char*)");
        v95 = v73(218, "void*(__thiscall*)(void*)");
        v96 = v68(v52("void***(__thiscall*)(void*,void*)", v75(v57("panorama.dll", "E8 ? ? ? ? 8B 00 85 C0 75 1B"))), v84:getInstance());
        v97 = {};
        v98 = function(v233)
            -- upvalues: v97 (ref), v95 (ref)
            if v97[v233] ~= nil then
                return v97[v233];
            else
                v97[v233] = v95(v233);
                return v97[v233];
            end;
        end;
        v99 = v83("v8.dll");
        v100 = v90();
        v101 = {};
        l_typeof_1 = nil;
        l_new_1 = {};
        l_new_1.__index = l_new_1;
        do
            local l_l_new_1_2 = l_new_1;
            l_typeof_1 = setmetatable({
                __name = "Message", 
                __init = function(v235, v236)
                    -- upvalues: v52 (ref)
                    v235.this = v52("void*", v236);
                end, 
                __base = l_l_new_1_2
            }, {
                __index = l_l_new_1_2, 
                __call = function(v237, ...)
                    -- upvalues: l_l_new_1_2 (ref)
                    local v238 = setmetatable({}, l_l_new_1_2);
                    v237.__init(v238, ...);
                    return v238;
                end
            });
            l_l_new_1_2.__class = l_typeof_1;
            v102 = l_typeof_1;
        end;
        l_typeof_1 = nil;
        l_new_1 = {
            getInternal = function(v239)
                return v239.this;
            end, 
            isValid = function(v240)
                -- upvalues: v79 (ref)
                return v240.this[0] ~= v79;
            end, 
            getMessage = function(v241)
                -- upvalues: v102 (ref)
                return v102(v241.this[0]);
            end, 
            globalize = function(v242)
                -- upvalues: v99 (ref), v100 (ref), v106 (ref), v101 (ref)
                local v243 = v99:get("?GlobalizeReference@V8@v8@@CAPAPAVObject@internal@2@PAVIsolate@42@PAPAV342@@Z", "void*(__cdecl*)(void*,void*)")(v100, v242.this[0]);
                local v244 = v106(v243);
                v101[v244:getIdentityHash()] = v243;
                return v244;
            end, 
            __call = function(v245)
                -- upvalues: v107 (ref)
                return v107(v245.this[0]);
            end
        };
        l_new_1.__index = l_new_1;
        do
            local l_l_new_1_3 = l_new_1;
            l_typeof_1 = setmetatable({
                __name = "Local", 
                __init = function(v247, v248)
                    -- upvalues: v52 (ref)
                    v247.this = v52("void**", v248);
                end, 
                __base = l_l_new_1_3
            }, {
                __index = l_l_new_1_3, 
                __call = function(v249, ...)
                    -- upvalues: l_l_new_1_3 (ref)
                    local v250 = setmetatable({}, l_l_new_1_3);
                    v249.__init(v250, ...);
                    return v250;
                end
            });
            l_l_new_1_3.__class = l_typeof_1;
            v103 = l_typeof_1;
        end;
        l_typeof_1 = nil;
        l_new_1 = {
            getInternal = function(v251)
                return v251.this;
            end, 
            toLocalChecked = function(v252)
                -- upvalues: v79 (ref), v103 (ref)
                if v252.this[0] ~= v79 then
                    return v103(v252.this);
                else
                    return;
                end;
            end, 
            toValueChecked = function(v253)
                -- upvalues: v79 (ref), v107 (ref)
                if v253.this[0] ~= v79 then
                    return v107(v253.this[0]);
                else
                    return;
                end;
            end
        };
        l_new_1.__index = l_new_1;
        do
            local l_l_new_1_4 = l_new_1;
            l_typeof_1 = setmetatable({
                __name = "MaybeLocal", 
                __init = function(v255, v256)
                    -- upvalues: v52 (ref)
                    v255.this = v52("void**", v256);
                end, 
                __base = l_l_new_1_4
            }, {
                __index = l_l_new_1_4, 
                __call = function(v257, ...)
                    -- upvalues: l_l_new_1_4 (ref)
                    local v258 = setmetatable({}, l_l_new_1_4);
                    v257.__init(v258, ...);
                    return v258;
                end
            });
            l_l_new_1_4.__class = l_typeof_1;
            v104 = l_typeof_1;
        end;
        v105 = {
            __index = function(v259, v260)
                -- upvalues: v123 (ref), v107 (ref)
                local v261 = rawget(v259, "this");
                local v262 = v123()(function()
                    -- upvalues: v261 (ref), v107 (ref), v260 (ref)
                    return v261:getAsValue():toObject():get(v107:fromLua(v260):getInternal()):toValueChecked():toLua();
                end);
                if type(v262) == "table" then
                    rawset(v262, "parent", v261);
                end;
                return v262;
            end, 
            __newindex = function(v263, v264, v265)
                -- upvalues: v123 (ref), v107 (ref)
                local v266 = rawget(v263, "this");
                return v123()(function()
                    -- upvalues: v266 (ref), v107 (ref), v264 (ref), v265 (ref)
                    return v266:getAsValue():toObject():set(v107:fromLua(v264):getInternal(), v107:fromLua(v265):getInternal()):toValueChecked():toLua();
                end);
            end, 
            __len = function(v267)
                -- upvalues: v123 (ref)
                local v268 = rawget(v267, "this");
                local v269 = 0;
                if v268.baseType == "Array" then
                    v269 = v123()(function()
                        -- upvalues: v268 (ref)
                        return v268:getAsValue():toArray():length();
                    end);
                elseif v268.baseType == "Object" then
                    v269 = v123()(function()
                        -- upvalues: v268 (ref)
                        return v268:getAsValue():toObject():getPropertyNames():toValueChecked():toArray():length();
                    end);
                end;
                return v269;
            end, 
            __pairs = function(v270)
                -- upvalues: v123 (ref), v109 (ref)
                local v271 = rawget(v270, "this");
                local v272 = nil;
                v272 = function()
                    return nil;
                end;
                if v271.baseType == "Object" then
                    v123()(function()
                        -- upvalues: v109 (ref), v271 (ref), v272 (ref), v270 (ref)
                        local v273 = v109(v271:getAsValue():toObject():getPropertyNames():toValueChecked());
                        local v274 = 0;
                        local v275 = v273:length();
                        v272 = function()
                            -- upvalues: v274 (ref), v273 (ref), v275 (ref), v270 (ref)
                            v274 = v274 + 1;
                            local v276 = v273[v274 - 1];
                            if v274 <= v275 then
                                return v276, v270[v276];
                            else
                                return;
                            end;
                        end;
                    end);
                end;
                return v272;
            end, 
            __ipairs = function(v277)
                -- upvalues: v123 (ref)
                local v278 = rawget(v277, "this");
                local v279 = nil;
                v279 = function()
                    return nil;
                end;
                if v278.baseType == "Array" then
                    v123()(function()
                        -- upvalues: v278 (ref), v279 (ref), v277 (ref)
                        local v280 = 0;
                        local v281 = v278:getAsValue():toArray():length();
                        v279 = function()
                            -- upvalues: v280 (ref), v281 (ref), v277 (ref)
                            v280 = v280 + 1;
                            if v280 <= v281 then
                                return v280, v277[v280 - 1];
                            else
                                return;
                            end;
                        end;
                    end);
                end;
                return v279;
            end, 
            __call = function(v282, ...)
                -- upvalues: v123 (ref), v124 (ref), v91 (ref), v81 (ref), v60 (ref)
                local v283 = rawget(v282, "this");
                local v284 = {
                    ...
                };
                if v283.baseType ~= "Function" then
                    error("Attempted to call a non-function value: " .. v283.baseType);
                end;
                local v285 = false;
                local v288 = v123()(function()
                    -- upvalues: v124 (ref), v283 (ref), v282 (ref), v284 (ref), v91 (ref), v81 (ref), v60 (ref), v285 (ref)
                    local v286 = v124();
                    v286:enter();
                    local v287 = v283:getAsValue():toFunction():setParent(rawget(v282, "parent"))(unpack(v284)):toLocalChecked();
                    if v286:hasCaught() then
                        v91(v286:getInternal(), v81.getPanel("CSGOJsRegistration"));
                        if v60 then
                            v285 = true;
                        end;
                    end;
                    v286:exit();
                    if v287 == nil then
                        return nil;
                    else
                        return v287():toLua();
                    end;
                end);
                if v285 then
                    error("\n\nFailed to call the given javascript function, please check the error message above ^ \n\n(definitely not because I was too lazy to implement my own exception handler)\n");
                end;
                return v288;
            end, 
            __tostring = function(v289)
                -- upvalues: v123 (ref)
                local v290 = rawget(v289, "this");
                return v123()(function()
                    -- upvalues: v290 (ref)
                    return v290:getAsValue():stringValue();
                end);
            end, 
            __gc = function(v291)
                return rawget(v291, "this"):disposeGlobal();
            end
        };
        l_typeof_1 = nil;
        l_new_1 = {
            setType = function(v292, v293)
                v292.baseType = v293;
                return v292;
            end, 
            getInternal = function(v294)
                return v294.this;
            end, 
            disposeGlobal = function(v295)
                -- upvalues: v99 (ref)
                return v99:get("?DisposeGlobal@V8@v8@@CAXPAPAVObject@internal@2@@Z", "void(__cdecl*)(void*)")(v295.this);
            end, 
            get = function(v296)
                -- upvalues: v104 (ref), v123 (ref)
                return v104(v123:createHandle(v296.this));
            end, 
            getAsValue = function(v297)
                -- upvalues: v107 (ref), v123 (ref)
                return v107(v123:createHandle(v297.this)[0]);
            end, 
            toLua = function(v298)
                return v298:get():toValueChecked():toLua();
            end, 
            getIdentityHash = function(v299)
                -- upvalues: v99 (ref)
                return v99:get("?GetIdentityHash@Object@v8@@QAEHXZ", "int(__thiscall*)(void*)")(v299.this);
            end, 
            __call = function(v300)
                -- upvalues: v105 (ref)
                return setmetatable({
                    this = v300
                }, v105);
            end
        };
        l_new_1.__index = l_new_1;
        do
            local l_l_new_1_5 = l_new_1;
            l_typeof_1 = setmetatable({
                __name = "Persistent", 
                __init = function(v302, v303, v304)
                    if v304 == nil then
                        v304 = "Value";
                    end;
                    v302.this = v303;
                    v302.baseType = v304;
                end, 
                __base = l_l_new_1_5
            }, {
                __index = l_l_new_1_5, 
                __call = function(v305, ...)
                    -- upvalues: l_l_new_1_5 (ref)
                    local v306 = setmetatable({}, l_l_new_1_5);
                    v305.__init(v306, ...);
                    return v306;
                end
            });
            l_l_new_1_5.__class = l_typeof_1;
            v106 = l_typeof_1;
        end;
        l_typeof_1 = nil;
        l_new_1 = {
            fromLua = function(_, v308)
                -- upvalues: v115 (ref), v100 (ref), v117 (ref), v118 (ref), v120 (ref), v78 (ref), v109 (ref), v108 (ref), v112 (ref), v77 (ref)
                if v308 == nil then
                    return v115(v100):getValue();
                else
                    local v309 = type(v308);
                    if v309 == "boolean" then
                        return v117(v100, v308):getValue();
                    elseif v309 == "number" then
                        return v118(v100, v308):getInstance();
                    elseif v309 == "string" then
                        return v120(v100, v308):getInstance();
                    elseif v309 == "table" then
                        if v78(v308) then
                            return v109:fromLua(v100, v308);
                        else
                            return v108:fromLua(v100, v308);
                        end;
                    elseif v309 == "function" then
                        return v112(v77(v308)):getFunction()();
                    else
                        return error("Failed to convert from lua to v8js: Unknown type");
                    end;
                end;
            end, 
            isUndefined = function(v310)
                -- upvalues: v99 (ref)
                return v99:get("?IsUndefined@Value@v8@@QBE_NXZ", "bool(__thiscall*)(void*)")(v310.this);
            end, 
            isNull = function(v311)
                -- upvalues: v99 (ref)
                return v99:get("?IsNull@Value@v8@@QBE_NXZ", "bool(__thiscall*)(void*)")(v311.this);
            end, 
            isBoolean = function(v312)
                -- upvalues: v99 (ref)
                return v99:get("?IsBoolean@Value@v8@@QBE_NXZ", "bool(__thiscall*)(void*)")(v312.this);
            end, 
            isBooleanObject = function(v313)
                -- upvalues: v99 (ref)
                return v99:get("?IsBooleanObject@Value@v8@@QBE_NXZ", "bool(__thiscall*)(void*)")(v313.this);
            end, 
            isNumber = function(v314)
                -- upvalues: v99 (ref)
                return v99:get("?IsNumber@Value@v8@@QBE_NXZ", "bool(__thiscall*)(void*)")(v314.this);
            end, 
            isNumberObject = function(v315)
                -- upvalues: v99 (ref)
                return v99:get("?IsNumberObject@Value@v8@@QBE_NXZ", "bool(__thiscall*)(void*)")(v315.this);
            end, 
            isString = function(v316)
                -- upvalues: v99 (ref)
                return v99:get("?IsString@Value@v8@@QBE_NXZ", "bool(__thiscall*)(void*)")(v316.this);
            end, 
            isStringObject = function(v317)
                -- upvalues: v99 (ref)
                return v99:get("?IsStringObject@Value@v8@@QBE_NXZ", "bool(__thiscall*)(void*)")(v317.this);
            end, 
            isObject = function(v318)
                -- upvalues: v99 (ref)
                return v99:get("?IsObject@Value@v8@@QBE_NXZ", "bool(__thiscall*)(void*)")(v318.this);
            end, 
            isArray = function(v319)
                -- upvalues: v99 (ref)
                return v99:get("?IsArray@Value@v8@@QBE_NXZ", "bool(__thiscall*)(void*)")(v319.this);
            end, 
            isFunction = function(v320)
                -- upvalues: v99 (ref)
                return v99:get("?IsFunction@Value@v8@@QBE_NXZ", "bool(__thiscall*)(void*)")(v320.this);
            end, 
            booleanValue = function(v321)
                -- upvalues: v99 (ref)
                return v99:get("?BooleanValue@Value@v8@@QBE_NXZ", "bool(__thiscall*)(void*)")(v321.this);
            end, 
            numberValue = function(v322)
                -- upvalues: v99 (ref)
                return v99:get("?NumberValue@Value@v8@@QBENXZ", "double(__thiscall*)(void*)")(v322.this);
            end, 
            stringValue = function(v323)
                -- upvalues: v54 (ref), v99 (ref), v55 (ref)
                local v324 = v54("char*[2]");
                local v325 = v99:get("??0Utf8Value@String@v8@@QAE@V?$Local@VValue@v8@@@2@@Z", "struct{char* str; int length;}*(__thiscall*)(void*,void*)")(v324, v323.this);
                local v326 = v55(v325.str, v325.length);
                v99:get("??1Utf8Value@String@v8@@QAE@XZ", "void(__thiscall*)(void*)")(v324);
                return v326;
            end, 
            toObject = function(v327)
                -- upvalues: v108 (ref), v104 (ref), v99 (ref), v80 (ref)
                return v108(v104(v99:get("?ToObject@Value@v8@@QBE?AV?$Local@VObject@v8@@@2@XZ", "void*(__thiscall*)(void*,void*)")(v327.this, v80)):toValueChecked():getInternal());
            end, 
            toArray = function(v328)
                -- upvalues: v109 (ref), v104 (ref), v99 (ref), v80 (ref)
                return v109(v104(v99:get("?ToObject@Value@v8@@QBE?AV?$Local@VObject@v8@@@2@XZ", "void*(__thiscall*)(void*,void*)")(v328.this, v80)):toValueChecked():getInternal());
            end, 
            toFunction = function(v329)
                -- upvalues: v110 (ref), v104 (ref), v99 (ref), v80 (ref)
                return v110(v104(v99:get("?ToObject@Value@v8@@QBE?AV?$Local@VObject@v8@@@2@XZ", "void*(__thiscall*)(void*,void*)")(v329.this, v80)):toValueChecked():getInternal());
            end, 
            toLocal = function(v330)
                -- upvalues: v103 (ref), v54 (ref)
                return v103(v54("void*[1]", v330.this));
            end, 
            toLua = function(v331)
                if v331:isUndefined() or v331:isNull() then
                    return nil;
                elseif v331:isBoolean() or v331:isBooleanObject() then
                    return v331:booleanValue();
                elseif v331:isNumber() or v331:isNumberObject() then
                    return v331:numberValue();
                elseif v331:isString() or v331:isStringObject() then
                    return v331:stringValue();
                elseif v331:isObject() then
                    if v331:isArray() then
                        return v331:toArray():toLocal():globalize():setType("Array")();
                    elseif v331:isFunction() then
                        return v331:toFunction():toLocal():globalize():setType("Function")();
                    else
                        return v331:toObject():toLocal():globalize():setType("Object")();
                    end;
                else
                    return error("Failed to convert from v8js to lua: Unknown type");
                end;
            end, 
            getInternal = function(v332)
                return v332.this;
            end
        };
        l_new_1.__index = l_new_1;
        do
            local l_l_new_1_6 = l_new_1;
            l_typeof_1 = setmetatable({
                __name = "Value", 
                __init = function(v334, v335)
                    -- upvalues: v52 (ref)
                    v334.this = v52("void*", v335);
                end, 
                __base = l_l_new_1_6
            }, {
                __index = l_l_new_1_6, 
                __call = function(v336, ...)
                    -- upvalues: l_l_new_1_6 (ref)
                    local v337 = setmetatable({}, l_l_new_1_6);
                    v336.__init(v337, ...);
                    return v337;
                end
            });
            l_l_new_1_6.__class = l_typeof_1;
            v107 = l_typeof_1;
        end;
        l_typeof_1 = nil;
        l_new_1 = v107;
        l_string_0 = {
            fromLua = function(_, v339, v340)
                -- upvalues: v108 (ref), v104 (ref), v99 (ref), v80 (ref), v107 (ref)
                local v341 = v108(v104(v99:get("?New@Object@v8@@SA?AV?$Local@VObject@v8@@@2@PAVIsolate@2@@Z", "void*(__cdecl*)(void*,void*)")(v80, v339)):toValueChecked():getInternal());
                for v342, v343 in pairs(v340) do
                    v341:set(v107:fromLua(v342):getInternal(), v107:fromLua(v343):getInternal());
                end;
                return v341;
            end, 
            get = function(v344, v345)
                -- upvalues: v104 (ref), v99 (ref), v80 (ref)
                return v104(v99:get("?Get@Object@v8@@QAE?AV?$Local@VValue@v8@@@2@V32@@Z", "void*(__thiscall*)(void*,void*,void*)")(v344.this, v80, v345));
            end, 
            set = function(v346, v347, v348)
                -- upvalues: v99 (ref)
                return v99:get("?Set@Object@v8@@QAE_NV?$Local@VValue@v8@@@2@0@Z", "bool(__thiscall*)(void*,void*,void*)")(v346.this, v347, v348);
            end, 
            getPropertyNames = function(v349)
                -- upvalues: v104 (ref), v99 (ref), v80 (ref)
                return v104(v99:get("?GetPropertyNames@Object@v8@@QAE?AV?$Local@VArray@v8@@@2@XZ", "void*(__thiscall*)(void*,void*)")(v349.this, v80));
            end, 
            callAsFunction = function(v350, v351, v352, v353)
                -- upvalues: v104 (ref), v99 (ref), v80 (ref)
                return v104(v99:get("?CallAsFunction@Object@v8@@QAE?AV?$Local@VValue@v8@@@2@V32@HQAV32@@Z", "void*(__thiscall*)(void*,void*,void*,int,void*)")(v350.this, v80, v351, v352, v353));
            end, 
            getIdentityHash = function(v354)
                -- upvalues: v99 (ref)
                return v99:get("?GetIdentityHash@Object@v8@@QAEHXZ", "int(__thiscall*)(void*)")(v354.this);
            end
        };
        l_string_0.__index = l_string_0;
        setmetatable(l_string_0, l_new_1.__base);
        do
            local l_l_string_0_0 = l_string_0;
            l_typeof_1 = setmetatable({
                __name = "Object", 
                __init = function(v356, v357)
                    v356.this = v357;
                end, 
                __base = l_l_string_0_0, 
                __parent = l_new_1
            }, {
                __index = function(v358, v359)
                    -- upvalues: l_l_string_0_0 (ref)
                    local v360 = rawget(l_l_string_0_0, v359);
                    if v360 == nil then
                        local v361 = rawget(v358, "__parent");
                        if v361 then
                            return v361[v359];
                        else
                            return;
                        end;
                    else
                        return v360;
                    end;
                end, 
                __call = function(v362, ...)
                    -- upvalues: l_l_string_0_0 (ref)
                    local v363 = setmetatable({}, l_l_string_0_0);
                    v362.__init(v363, ...);
                    return v363;
                end
            });
            l_l_string_0_0.__class = l_typeof_1;
            if l_new_1.__inherited then
                l_new_1:__inherited(l_typeof_1);
            end;
            v108 = l_typeof_1;
        end;
        l_typeof_1 = nil;
        l_new_1 = v108;
        l_string_0 = {
            fromLua = function(_, v365, v366)
                -- upvalues: v109 (ref), v104 (ref), v99 (ref), v80 (ref), v107 (ref)
                local v367 = v109(v104(v99:get("?New@Array@v8@@SA?AV?$Local@VArray@v8@@@2@PAVIsolate@2@H@Z", "void*(__cdecl*)(void*,void*,int)")(v80, v365, #v366)):toValueChecked():getInternal());
                for v368 = 1, #v366 do
                    v367:set(v368 - 1, v107:fromLua(v366[v368]):getInternal());
                end;
                return v367;
            end, 
            get = function(v369, v370)
                -- upvalues: v104 (ref), v99 (ref), v80 (ref)
                return v104(v99:get("?Get@Object@v8@@QAE?AV?$Local@VValue@v8@@@2@I@Z", "void*(__thiscall*)(void*,void*,unsigned int)")(v369.this, v80, v370));
            end, 
            set = function(v371, v372, v373)
                -- upvalues: v99 (ref)
                return v99:get("?Set@Object@v8@@QAE_NIV?$Local@VValue@v8@@@2@@Z", "bool(__thiscall*)(void*,unsigned int,void*)")(v371.this, v372, v373);
            end, 
            length = function(v374)
                -- upvalues: v99 (ref)
                return v99:get("?Length@Array@v8@@QBEIXZ", "uint32_t(__thiscall*)(void*)")(v374.this);
            end
        };
        l_string_0.__index = l_string_0;
        setmetatable(l_string_0, l_new_1.__base);
        do
            local l_l_string_0_1 = l_string_0;
            l_typeof_1 = setmetatable({
                __name = "Array", 
                __init = function(v376, v377)
                    v376.this = v377;
                end, 
                __base = l_l_string_0_1, 
                __parent = l_new_1
            }, {
                __index = function(v378, v379)
                    -- upvalues: l_l_string_0_1 (ref)
                    local v380 = rawget(l_l_string_0_1, v379);
                    if v380 == nil then
                        local v381 = rawget(v378, "__parent");
                        if v381 then
                            return v381[v379];
                        else
                            return;
                        end;
                    else
                        return v380;
                    end;
                end, 
                __call = function(v382, ...)
                    -- upvalues: l_l_string_0_1 (ref)
                    local v383 = setmetatable({}, l_l_string_0_1);
                    v382.__init(v383, ...);
                    return v383;
                end
            });
            l_l_string_0_1.__class = l_typeof_1;
            if l_new_1.__inherited then
                l_new_1:__inherited(l_typeof_1);
            end;
            v109 = l_typeof_1;
        end;
        l_typeof_1 = nil;
        l_new_1 = v108;
        l_string_0 = {
            setParent = function(v384, v385)
                v384.parent = v385;
                return v384;
            end, 
            __call = function(v386, ...)
                -- upvalues: v122 (ref), v121 (ref), v76 (ref)
                if v386.parent == nil then
                    return v386:callAsFunction(v122(v121():getCurrentContext()):global():toValueChecked():getInternal(), v76(...));
                else
                    return v386:callAsFunction(v386.parent:getAsValue():getInternal(), v76(...));
                end;
            end
        };
        l_string_0.__index = l_string_0;
        setmetatable(l_string_0, l_new_1.__base);
        do
            local l_l_string_0_2 = l_string_0;
            l_typeof_1 = setmetatable({
                __name = "Function", 
                __init = function(v388, v389, v390)
                    v388.this = v389;
                    v388.parent = v390;
                end, 
                __base = l_l_string_0_2, 
                __parent = l_new_1
            }, {
                __index = function(v391, v392)
                    -- upvalues: l_l_string_0_2 (ref)
                    local v393 = rawget(l_l_string_0_2, v392);
                    if v393 == nil then
                        local v394 = rawget(v391, "__parent");
                        if v394 then
                            return v394[v392];
                        else
                            return;
                        end;
                    else
                        return v393;
                    end;
                end, 
                __call = function(v395, ...)
                    -- upvalues: l_l_string_0_2 (ref)
                    local v396 = setmetatable({}, l_l_string_0_2);
                    v395.__init(v396, ...);
                    return v396;
                end
            });
            l_l_string_0_2.__class = l_typeof_1;
            if l_new_1.__inherited then
                l_new_1:__inherited(l_typeof_1);
            end;
            v110 = l_typeof_1;
        end;
        l_typeof_1 = nil;
        l_new_1 = {};
        l_new_1.__index = l_new_1;
        do
            local l_l_new_1_7 = l_new_1;
            l_typeof_1 = setmetatable({
                __name = "ObjectTemplate", 
                __init = function(v398)
                    -- upvalues: v104 (ref), v99 (ref), v80 (ref)
                    v398.this = v104(v99:get("?New@ObjectTemplate@v8@@SA?AV?$Local@VObjectTemplate@v8@@@2@XZ", "void*(__cdecl*)(void*)")(v80)):toLocalChecked();
                end, 
                __base = l_l_new_1_7
            }, {
                __index = l_l_new_1_7, 
                __call = function(v399, ...)
                    -- upvalues: l_l_new_1_7 (ref)
                    local v400 = setmetatable({}, l_l_new_1_7);
                    v399.__init(v400, ...);
                    return v400;
                end
            });
            l_l_new_1_7.__class = l_typeof_1;
            v111 = l_typeof_1;
        end;
        l_typeof_1 = nil;
        l_new_1 = {
            getFunction = function(v401)
                -- upvalues: v104 (ref), v99 (ref), v80 (ref)
                return v104(v99:get("?GetFunction@FunctionTemplate@v8@@QAE?AV?$Local@VFunction@v8@@@2@XZ", "void*(__thiscall*)(void*, void*)")(v401:this():getInternal(), v80)):toLocalChecked();
            end, 
            getInstance = function(v402)
                return v402:this();
            end
        };
        l_new_1.__index = l_new_1;
        do
            local l_l_new_1_8 = l_new_1;
            l_typeof_1 = setmetatable({
                __name = "FunctionTemplate", 
                __init = function(v404, v405)
                    -- upvalues: v104 (ref), v99 (ref), v80 (ref), v100 (ref), v52 (ref), v54 (ref)
                    v404.this = v104(v99:get("?New@FunctionTemplate@v8@@SA?AV?$Local@VFunctionTemplate@v8@@@2@PAVIsolate@2@P6AXABV?$FunctionCallbackInfo@VValue@v8@@@2@@ZV?$Local@VValue@v8@@@2@V?$Local@VSignature@v8@@@2@HW4ConstructorBehavior@2@@Z", "void*(__cdecl*)(void*,void*,void*,void*,void*,int,int)")(v80, v100, v52("void(__cdecl*)(void******)", v405), v54("int[1]"), v54("int[1]"), 0, 0)):toLocalChecked();
                end, 
                __base = l_l_new_1_8
            }, {
                __index = l_l_new_1_8, 
                __call = function(v406, ...)
                    -- upvalues: l_l_new_1_8 (ref)
                    local v407 = setmetatable({}, l_l_new_1_8);
                    v406.__init(v407, ...);
                    return v407;
                end
            });
            l_l_new_1_8.__class = l_typeof_1;
            v112 = l_typeof_1;
        end;
        l_typeof_1 = nil;
        l_new_1 = {
            kNewTargetIndex = 7, 
            kContextSaveIndex = 6, 
            kCalleeIndex = 5, 
            kDataIndex = 4, 
            kReturnValueIndex = 3, 
            kReturnValueDefaultValueIndex = 2, 
            kIsolateIndex = 1, 
            kHolderIndex = 0, 
            getHolder = function(v408)
                -- upvalues: v104 (ref)
                return v104(v408:getImplicitArgs_()[v408.kHolderIndex]):toLocalChecked();
            end, 
            getIsolate = function(v409)
                -- upvalues: v121 (ref)
                return v121(v409:getImplicitArgs_()[v409.kIsolateIndex][0]);
            end, 
            getReturnValueDefaultValue = function(v410)
                -- upvalues: v107 (ref), v54 (ref)
                return v107(v54("void*[1]", v410:getImplicitArgs_()[v410.kReturnValueDefaultValueIndex]));
            end, 
            getReturnValue = function(v411)
                -- upvalues: v107 (ref), v54 (ref)
                return v107(v54("void*[1]", v411:getImplicitArgs_()[v411.kReturnValueIndex]));
            end, 
            setReturnValue = function(v412, v413)
                -- upvalues: v52 (ref)
                v412:getImplicitArgs_()[v412.kReturnValueIndex] = v52("void**", v413)[0];
            end, 
            getData = function(v414)
                -- upvalues: v104 (ref)
                return v104(v414:getImplicitArgs_()[v414.kDataIndex]):toLocalChecked();
            end, 
            getCallee = function(v415)
                -- upvalues: v104 (ref)
                return v104(v415:getImplicitArgs_()[v415.kCalleeIndex]):toLocalChecked();
            end, 
            getContextSave = function(v416)
                -- upvalues: v104 (ref)
                return v104(v416:getImplicitArgs_()[v416.kContextSaveIndex]):toLocalChecked();
            end, 
            getNewTarget = function(v417)
                -- upvalues: v104 (ref)
                return v104(v417:getImplicitArgs_()[v417.kNewTargetIndex]):toLocalChecked();
            end, 
            getImplicitArgs_ = function(v418)
                return v418.this[0];
            end, 
            getValues_ = function(v419)
                return v419.this[1];
            end, 
            getLength_ = function(v420)
                return v420.this[2];
            end, 
            length = function(v421)
                -- upvalues: v52 (ref)
                return tonumber(v52("int", v421:getLength_()));
            end, 
            get = function(v422, v423)
                -- upvalues: v107 (ref)
                if v423 < v422:length() then
                    return v107(v422:getValues_() - v423):toLua();
                else
                    return;
                end;
            end
        };
        l_new_1.__index = l_new_1;
        do
            local l_l_new_1_9 = l_new_1;
            l_typeof_1 = setmetatable({
                __name = "FunctionCallbackInfo", 
                __init = function(v425, v426)
                    -- upvalues: v52 (ref)
                    v425.this = v52("void****", v426);
                end, 
                __base = l_l_new_1_9
            }, {
                __index = l_l_new_1_9, 
                __call = function(v427, ...)
                    -- upvalues: l_l_new_1_9 (ref)
                    local v428 = setmetatable({}, l_l_new_1_9);
                    v427.__init(v428, ...);
                    return v428;
                end
            });
            l_l_new_1_9.__class = l_typeof_1;
            v113 = l_typeof_1;
        end;
        l_typeof_1 = nil;
        l_new_1 = v107;
        l_string_0 = {
            getValue = function(v429)
                return v429.this;
            end, 
            toString = function(v430)
                return v430.this:getValue():stringValue();
            end
        };
        l_string_0.__index = l_string_0;
        setmetatable(l_string_0, l_new_1.__base);
        do
            local l_l_string_0_3 = l_string_0;
            l_typeof_1 = setmetatable({
                __name = "Primitive", 
                __init = function(v432, v433)
                    v432.this = v433;
                end, 
                __base = l_l_string_0_3, 
                __parent = l_new_1
            }, {
                __index = function(v434, v435)
                    -- upvalues: l_l_string_0_3 (ref)
                    local v436 = rawget(l_l_string_0_3, v435);
                    if v436 == nil then
                        local v437 = rawget(v434, "__parent");
                        if v437 then
                            return v437[v435];
                        else
                            return;
                        end;
                    else
                        return v436;
                    end;
                end, 
                __call = function(v438, ...)
                    -- upvalues: l_l_string_0_3 (ref)
                    local v439 = setmetatable({}, l_l_string_0_3);
                    v438.__init(v439, ...);
                    return v439;
                end
            });
            l_l_string_0_3.__class = l_typeof_1;
            if l_new_1.__inherited then
                l_new_1:__inherited(l_typeof_1);
            end;
            v114 = l_typeof_1;
        end;
        l_typeof_1 = nil;
        l_new_1 = v114;
        l_string_0 = {};
        l_string_0.__index = l_string_0;
        setmetatable(l_string_0, l_new_1.__base);
        do
            local l_l_string_0_4 = l_string_0;
            l_typeof_1 = setmetatable({
                __name = "Null", 
                __init = function(v441, v442)
                    -- upvalues: v107 (ref), v52 (ref)
                    v441.this = v107(v52("uintptr_t", v442) + 72);
                end, 
                __base = l_l_string_0_4, 
                __parent = l_new_1
            }, {
                __index = function(v443, v444)
                    -- upvalues: l_l_string_0_4 (ref)
                    local v445 = rawget(l_l_string_0_4, v444);
                    if v445 == nil then
                        local v446 = rawget(v443, "__parent");
                        if v446 then
                            return v446[v444];
                        else
                            return;
                        end;
                    else
                        return v445;
                    end;
                end, 
                __call = function(v447, ...)
                    -- upvalues: l_l_string_0_4 (ref)
                    local v448 = setmetatable({}, l_l_string_0_4);
                    v447.__init(v448, ...);
                    return v448;
                end
            });
            l_l_string_0_4.__class = l_typeof_1;
            if l_new_1.__inherited then
                l_new_1:__inherited(l_typeof_1);
            end;
            v115 = l_typeof_1;
        end;
        l_typeof_1 = nil;
        l_new_1 = v114;
        l_string_0 = {};
        l_string_0.__index = l_string_0;
        setmetatable(l_string_0, l_new_1.__base);
        do
            local l_l_string_0_5 = l_string_0;
            l_typeof_1 = setmetatable({
                __name = "Undefined", 
                __init = function(v450, v451)
                    -- upvalues: v107 (ref), v52 (ref)
                    v450.this = v107(v52("uintptr_t", v451) + 86);
                end, 
                __base = l_l_string_0_5, 
                __parent = l_new_1
            }, {
                __index = function(v452, v453)
                    -- upvalues: l_l_string_0_5 (ref)
                    local v454 = rawget(l_l_string_0_5, v453);
                    if v454 == nil then
                        local v455 = rawget(v452, "__parent");
                        if v455 then
                            return v455[v453];
                        else
                            return;
                        end;
                    else
                        return v454;
                    end;
                end, 
                __call = function(v456, ...)
                    -- upvalues: l_l_string_0_5 (ref)
                    local v457 = setmetatable({}, l_l_string_0_5);
                    v456.__init(v457, ...);
                    return v457;
                end
            });
            l_l_string_0_5.__class = l_typeof_1;
            if l_new_1.__inherited then
                l_new_1:__inherited(l_typeof_1);
            end;
            v116 = l_typeof_1;
        end;
        l_typeof_1 = nil;
        l_new_1 = v114;
        l_string_0 = {};
        l_string_0.__index = l_string_0;
        setmetatable(l_string_0, l_new_1.__base);
        do
            local l_l_string_0_6 = l_string_0;
            l_typeof_1 = setmetatable({
                __name = "Boolean", 
                __init = function(v459, v460, v461)
                    -- upvalues: v107 (ref), v52 (ref)
                    v459.this = v107(v52("uintptr_t", v460) + (function()
                        -- upvalues: v461 (ref)
                        if v461 then
                            return 76;
                        else
                            return 80;
                        end;
                    end)());
                end, 
                __base = l_l_string_0_6, 
                __parent = l_new_1
            }, {
                __index = function(v462, v463)
                    -- upvalues: l_l_string_0_6 (ref)
                    local v464 = rawget(l_l_string_0_6, v463);
                    if v464 == nil then
                        local v465 = rawget(v462, "__parent");
                        if v465 then
                            return v465[v463];
                        else
                            return;
                        end;
                    else
                        return v464;
                    end;
                end, 
                __call = function(v466, ...)
                    -- upvalues: l_l_string_0_6 (ref)
                    local v467 = setmetatable({}, l_l_string_0_6);
                    v466.__init(v467, ...);
                    return v467;
                end
            });
            l_l_string_0_6.__class = l_typeof_1;
            if l_new_1.__inherited then
                l_new_1:__inherited(l_typeof_1);
            end;
            v117 = l_typeof_1;
        end;
        l_typeof_1 = nil;
        l_new_1 = v107;
        l_string_0 = {
            getLocal = function(v468)
                return v468.this;
            end, 
            getValue = function(v469)
                return v469:getInstance():numberValue();
            end, 
            getInstance = function(v470)
                return v470:this();
            end
        };
        l_string_0.__index = l_string_0;
        setmetatable(l_string_0, l_new_1.__base);
        do
            local l_l_string_0_7 = l_string_0;
            l_typeof_1 = setmetatable({
                __name = "Number", 
                __init = function(v472, v473, v474)
                    -- upvalues: v104 (ref), v99 (ref), v80 (ref)
                    v472.this = v104(v99:get("?New@Number@v8@@SA?AV?$Local@VNumber@v8@@@2@PAVIsolate@2@N@Z", "void*(__cdecl*)(void*,void*,double)")(v80, v473, tonumber(v474))):toLocalChecked();
                end, 
                __base = l_l_string_0_7, 
                __parent = l_new_1
            }, {
                __index = function(v475, v476)
                    -- upvalues: l_l_string_0_7 (ref)
                    local v477 = rawget(l_l_string_0_7, v476);
                    if v477 == nil then
                        local v478 = rawget(v475, "__parent");
                        if v478 then
                            return v478[v476];
                        else
                            return;
                        end;
                    else
                        return v477;
                    end;
                end, 
                __call = function(v479, ...)
                    -- upvalues: l_l_string_0_7 (ref)
                    local v480 = setmetatable({}, l_l_string_0_7);
                    v479.__init(v480, ...);
                    return v480;
                end
            });
            l_l_string_0_7.__class = l_typeof_1;
            if l_new_1.__inherited then
                l_new_1:__inherited(l_typeof_1);
            end;
            v118 = l_typeof_1;
        end;
        l_typeof_1 = nil;
        l_new_1 = v118;
        l_string_0 = {};
        l_string_0.__index = l_string_0;
        setmetatable(l_string_0, l_new_1.__base);
        do
            local l_l_string_0_8 = l_string_0;
            l_typeof_1 = setmetatable({
                __name = "Integer", 
                __init = function(v482, v483, v484)
                    -- upvalues: v104 (ref), v99 (ref), v80 (ref)
                    v482.this = v104(v99:get("?NewFromUnsigned@Integer@v8@@SA?AV?$Local@VInteger@v8@@@2@PAVIsolate@2@I@Z", "void*(__cdecl*)(void*,void*,uint32_t)")(v80, v483, tonumber(v484))):toLocalChecked();
                end, 
                __base = l_l_string_0_8, 
                __parent = l_new_1
            }, {
                __index = function(v485, v486)
                    -- upvalues: l_l_string_0_8 (ref)
                    local v487 = rawget(l_l_string_0_8, v486);
                    if v487 == nil then
                        local v488 = rawget(v485, "__parent");
                        if v488 then
                            return v488[v486];
                        else
                            return;
                        end;
                    else
                        return v487;
                    end;
                end, 
                __call = function(v489, ...)
                    -- upvalues: l_l_string_0_8 (ref)
                    local v490 = setmetatable({}, l_l_string_0_8);
                    v489.__init(v490, ...);
                    return v490;
                end
            });
            l_l_string_0_8.__class = l_typeof_1;
            if l_new_1.__inherited then
                l_new_1:__inherited(l_typeof_1);
            end;
            v119 = l_typeof_1;
        end;
        l_typeof_1 = nil;
        l_new_1 = v107;
        l_string_0 = {
            getLocal = function(v491)
                return v491.this;
            end, 
            getValue = function(v492)
                return v492:getInstance():stringValue();
            end, 
            getInstance = function(v493)
                return v493:this();
            end
        };
        l_string_0.__index = l_string_0;
        setmetatable(l_string_0, l_new_1.__base);
        do
            local l_l_string_0_9 = l_string_0;
            l_typeof_1 = setmetatable({
                __name = "String", 
                __init = function(v495, v496, v497)
                    -- upvalues: v104 (ref), v99 (ref), v80 (ref)
                    v495.this = v104(v99:get("?NewFromUtf8@String@v8@@SA?AV?$MaybeLocal@VString@v8@@@2@PAVIsolate@2@PBDW4NewStringType@2@H@Z", "void*(__cdecl*)(void*,void*,const char*,int,int)")(v80, v496, v497, 0, #v497)):toLocalChecked();
                end, 
                __base = l_l_string_0_9, 
                __parent = l_new_1
            }, {
                __index = function(v498, v499)
                    -- upvalues: l_l_string_0_9 (ref)
                    local v500 = rawget(l_l_string_0_9, v499);
                    if v500 == nil then
                        local v501 = rawget(v498, "__parent");
                        if v501 then
                            return v501[v499];
                        else
                            return;
                        end;
                    else
                        return v500;
                    end;
                end, 
                __call = function(v502, ...)
                    -- upvalues: l_l_string_0_9 (ref)
                    local v503 = setmetatable({}, l_l_string_0_9);
                    v502.__init(v503, ...);
                    return v503;
                end
            });
            l_l_string_0_9.__class = l_typeof_1;
            if l_new_1.__inherited then
                l_new_1:__inherited(l_typeof_1);
            end;
            v120 = l_typeof_1;
        end;
        l_typeof_1 = nil;
        l_new_1 = {
            enter = function(v504)
                -- upvalues: v99 (ref)
                return v99:get("?Enter@Isolate@v8@@QAEXXZ", "void(__thiscall*)(void*)")(v504.this);
            end, 
            exit = function(v505)
                -- upvalues: v99 (ref)
                return v99:get("?Exit@Isolate@v8@@QAEXXZ", "void(__thiscall*)(void*)")(v505.this);
            end, 
            getCurrentContext = function(v506)
                -- upvalues: v104 (ref), v99 (ref), v80 (ref)
                return v104(v99:get("?GetCurrentContext@Isolate@v8@@QAE?AV?$Local@VContext@v8@@@2@XZ", "void**(__thiscall*)(void*,void*)")(v506.this, v80)):toValueChecked():getInternal();
            end, 
            getInternal = function(v507)
                return v507.this;
            end
        };
        l_new_1.__index = l_new_1;
        do
            local l_l_new_1_10 = l_new_1;
            l_typeof_1 = setmetatable({
                __name = "Isolate", 
                __init = function(v509, v510)
                    -- upvalues: v100 (ref)
                    if v510 == nil then
                        v510 = v100;
                    end;
                    v509.this = v510;
                end, 
                __base = l_l_new_1_10
            }, {
                __index = l_l_new_1_10, 
                __call = function(v511, ...)
                    -- upvalues: l_l_new_1_10 (ref)
                    local v512 = setmetatable({}, l_l_new_1_10);
                    v511.__init(v512, ...);
                    return v512;
                end
            });
            l_l_new_1_10.__class = l_typeof_1;
            v121 = l_typeof_1;
        end;
        l_typeof_1 = nil;
        l_new_1 = {
            enter = function(v513)
                -- upvalues: v99 (ref)
                return v99:get("?Enter@Context@v8@@QAEXXZ", "void(__thiscall*)(void*)")(v513.this);
            end, 
            exit = function(v514)
                -- upvalues: v99 (ref)
                return v99:get("?Exit@Context@v8@@QAEXXZ", "void(__thiscall*)(void*)")(v514.this);
            end, 
            global = function(v515)
                -- upvalues: v104 (ref), v99 (ref), v80 (ref)
                return v104(v99:get("?Global@Context@v8@@QAE?AV?$Local@VObject@v8@@@2@XZ", "void*(__thiscall*)(void*,void*)")(v515.this, v80));
            end
        };
        l_new_1.__index = l_new_1;
        do
            local l_l_new_1_11 = l_new_1;
            l_typeof_1 = setmetatable({
                __name = "Context", 
                __init = function(v517, v518)
                    v517.this = v518;
                end, 
                __base = l_l_new_1_11
            }, {
                __index = l_l_new_1_11, 
                __call = function(v519, ...)
                    -- upvalues: l_l_new_1_11 (ref)
                    local v520 = setmetatable({}, l_l_new_1_11);
                    v519.__init(v520, ...);
                    return v520;
                end
            });
            l_l_new_1_11.__class = l_typeof_1;
            v122 = l_typeof_1;
        end;
        l_typeof_1 = nil;
        l_new_1 = {
            enter = function(v521)
                -- upvalues: v99 (ref), v100 (ref)
                return v99:get("??0HandleScope@v8@@QAE@PAVIsolate@1@@Z", "void(__thiscall*)(void*,void*)")(v521.this, v100);
            end, 
            exit = function(v522)
                -- upvalues: v99 (ref)
                return v99:get("??1HandleScope@v8@@QAE@XZ", "void(__thiscall*)(void*)")(v522.this);
            end, 
            createHandle = function(_, v524)
                -- upvalues: v99 (ref), v100 (ref)
                return v99:get("?CreateHandle@HandleScope@v8@@KAPAPAVObject@internal@2@PAVIsolate@42@PAV342@@Z", "void**(__cdecl*)(void*,void*)")(v100, v524);
            end, 
            __call = function(v525, v526, v527)
                -- upvalues: v81 (ref), v121 (ref), v96 (ref), v98 (ref), v122 (ref), v79 (ref), v60 (ref), v64 (ref)
                if v527 == nil then
                    v527 = v81.GetPanel("CSGOJsRegistration");
                end;
                local v528 = v121();
                v528:enter();
                v525:enter();
                local v529 = nil;
                if v527 then
                    v529 = v96(v98(v527))[0];
                else
                    v529 = v122(v528:getCurrentContext()):global():getInternal();
                end;
                v529 = v122((function()
                    -- upvalues: v529 (ref), v79 (ref), v525 (ref)
                    if v529 ~= v79 then
                        return v525:createHandle(v529[0]);
                    else
                        return 0;
                    end;
                end)());
                v529:enter();
                local v530 = nil;
                if v60 then
                    local v531, v532 = xpcall(v526, v64);
                    if v531 then
                        v530 = v532;
                    end;
                else
                    v530 = v526();
                end;
                v529:exit();
                v525:exit();
                v528:exit();
                return v530;
            end
        };
        l_new_1.__index = l_new_1;
        do
            local l_l_new_1_12 = l_new_1;
            l_typeof_1 = setmetatable({
                __name = "HandleScope", 
                __init = function(v534)
                    -- upvalues: v54 (ref)
                    v534.this = v54("char[0xC]");
                end, 
                __base = l_l_new_1_12
            }, {
                __index = l_l_new_1_12, 
                __call = function(v535, ...)
                    -- upvalues: l_l_new_1_12 (ref)
                    local v536 = setmetatable({}, l_l_new_1_12);
                    v535.__init(v536, ...);
                    return v536;
                end
            });
            l_l_new_1_12.__class = l_typeof_1;
            v123 = l_typeof_1;
        end;
        l_typeof_1 = nil;
        l_new_1 = {
            enter = function(v537)
                -- upvalues: v99 (ref), v100 (ref)
                return v99:get("??0TryCatch@v8@@QAE@PAVIsolate@1@@Z", "void(__thiscall*)(void*, void*)")(v537.this, v100);
            end, 
            exit = function(v538)
                -- upvalues: v99 (ref)
                return v99:get("??1TryCatch@v8@@QAE@XZ", "void(__thiscall*)(void*)")(v538.this);
            end, 
            canContinue = function(v539)
                -- upvalues: v99 (ref)
                return v99:get("?CanContinue@TryCatch@v8@@QBE_NXZ", "bool(__thiscall*)(void*)")(v539.this);
            end, 
            hasTerminated = function(v540)
                -- upvalues: v99 (ref)
                return v99:get("?HasTerminated@TryCatch@v8@@QBE_NXZ", "bool(__thiscall*)(void*)")(v540.this);
            end, 
            hasCaught = function(v541)
                -- upvalues: v99 (ref)
                return v99:get("?HasCaught@TryCatch@v8@@QBE_NXZ", "bool(__thiscall*)(void*)")(v541.this);
            end, 
            message = function(v542)
                -- upvalues: v103 (ref), v99 (ref), v80 (ref)
                return v103(v99:get("?Message@TryCatch@v8@@QBE?AV?$Local@VMessage@v8@@@2@XZ", "void*(__thiscall*)(void*, void*)")(v542.this, v80));
            end, 
            getInternal = function(v543)
                return v543.this;
            end
        };
        l_new_1.__index = l_new_1;
        do
            local l_l_new_1_13 = l_new_1;
            l_typeof_1 = setmetatable({
                __name = "TryCatch", 
                __init = function(v545)
                    -- upvalues: v54 (ref)
                    v545.this = v54("char[0x19]");
                end, 
                __base = l_l_new_1_13
            }, {
                __index = l_l_new_1_13, 
                __call = function(v546, ...)
                    -- upvalues: l_l_new_1_13 (ref)
                    local v547 = setmetatable({}, l_l_new_1_13);
                    v546.__init(v547, ...);
                    return v547;
                end
            });
            l_l_new_1_13.__class = l_typeof_1;
            v124 = l_typeof_1;
        end;
        l_typeof_1 = nil;
        l_new_1 = {
            compile = function(_, v549, v550, v551)
                -- upvalues: v68 (ref), v52 (ref), l_v51_0 (ref), v57 (ref), v84 (ref)
                if v551 == nil then
                    v551 = "";
                end;
                return v68(v52("void**(__thiscall*)(void*,void*,const char*,const char*)", l_v51_0 == "memesense" and v57("panorama.dll", "E8 ? ? ? ? 8B 4C 24 10 FF 15") - 2816 or v57("panorama.dll", "55 8B EC 83 E4 F8 83 EC 64 53 8B D9")), v84:getInstance())(v549, v550, v551);
            end, 
            loadstring = function(v552, v553, v554)
                -- upvalues: v104 (ref), v79 (ref), v60 (ref), v121 (ref), v123 (ref), v96 (ref), v98 (ref), v122 (ref), v88 (ref), v80 (ref)
                local v555 = v104(v552:compile(v554, v553)):toLocalChecked();
                if v555 == v79 then
                    if v60 then
                        error("\nFailed to compile the given javascript string, please check the error message above ^\n");
                    else
                        print("\nFailed to compile the given javascript string, please check the error message above ^\n");
                        return function()
                            return print("WARNING: Attempted to call nullptr (script compilation failed)");
                        end;
                    end;
                end;
                local v556 = v121();
                local v557 = v123();
                v556:enter();
                v557:enter();
                local v558 = nil;
                if v554 then
                    v558 = v96(v98(v554))[0];
                else
                    v558 = v122(v556:getCurrentContext()):global():getInternal();
                end;
                v558 = v122((function()
                    -- upvalues: v558 (ref), v79 (ref), v557 (ref)
                    if v558 ~= v79 then
                        return v557:createHandle(v558[0]);
                    else
                        return 0;
                    end;
                end)());
                v558:enter();
                local v559 = v104(v88(v80, v554, v555():getInternal(), 0, false)):toValueChecked();
                if v559 == v79 then
                    if v60 then
                        error("\nFailed to evaluate the given javascript string, please check the error message above ^\n");
                    else
                        print("\nFailed to evaluate the given javascript string, please check the error message above ^\n");
                        v559 = function()
                            return print("WARNING: Attempted to call nullptr (script execution failed)");
                        end;
                    end;
                else
                    v559 = v559:toLua();
                end;
                v558:exit();
                v557:exit();
                v556:exit();
                return v559;
            end
        };
        l_new_1.__index = l_new_1;
        do
            local l_l_new_1_14 = l_new_1;
            l_typeof_1 = setmetatable({
                __name = "Script", 
                __init = function()

                end, 
                __base = l_l_new_1_14
            }, {
                __index = l_l_new_1_14, 
                __call = function(v561, ...)
                    -- upvalues: l_l_new_1_14 (ref)
                    local v562 = setmetatable({}, l_l_new_1_14);
                    v561.__init(v562, ...);
                    return v562;
                end
            });
            l_l_new_1_14.__class = l_typeof_1;
            v125 = l_typeof_1;
        end;
        v126 = v53("    struct {\n      char* pad1[0x4];\n      void*         m_pPanel;\n      void* unk1;\n  }\n");
        v127 = v53("    struct {\n      struct {\n          $ *m_pMemory;\n          int m_nAllocationCount;\n          int m_nGrowSize;\n      } m_Memory;\n      int m_Size;\n      $ *m_pElements;\n  }\n", v126, v126);
        v56(v127, {
            __index = {
                Count = function(v563)
                    return v563.m_Memory.m_nAllocationCount;
                end, 
                Element = function(v564, v565)
                    -- upvalues: v52 (ref), v53 (ref), v126 (ref)
                    return v52(v53("$&", v126), v564.m_Memory.m_pMemory[v565]);
                end, 
                RemoveAll = function(v566)
                    -- upvalues: v53 (ref), v127 (ref)
                    v566 = nil;
                    v53("$[?]", v127)(1)[0].m_Size = 0;
                end
            }, 
            __ipairs = function(v567)
                -- upvalues: v85 (ref)
                local v568 = 0;
                local v569 = v567:Count();
                return function()
                    -- upvalues: v568 (ref), v567 (ref), v569 (ref), v85 (ref)
                    v568 = v568 + 1;
                    local l_m_pPanel_0 = v567:Element(v568 - 1).m_pPanel;
                    if v568 <= v569 and v85(l_m_pPanel_0) then
                        return v568, l_m_pPanel_0;
                    else
                        return;
                    end;
                end;
            end
        });
        v128 = v53("$[?]", v127)(1)[0];
        v129 = v52("unsigned int*", v52("uintptr_t**", v84:getInstance())[0][36] + 21)[0];
        v130 = v52(v128, v52("uintptr_t", v84:getInstance()) + v129);
        v81.hasPanel = function(v571)
            -- upvalues: v130 (ref), v55 (ref), v93 (ref)
            for _, v573 in ipairs(v130) do
                if v55(v93(v573)) == v571 then
                    return true;
                end;
            end;
            return false;
        end;
        v81.getPanel = function(v574, v575)
            -- upvalues: v81 (ref), v85 (ref), v55 (ref), v93 (ref), v79 (ref), v130 (ref)
            local v576 = v81.panelIDs[v574];
            if v576 ~= nil and v85(v576) and v55(v93(v576)) == v574 then
                return v576;
            else
                v81.panelIDs = {};
                local l_v79_0 = v79;
                for _, v579 in ipairs(v130) do
                    local v580 = v55(v93(v579));
                    if v580 ~= "" then
                        v81.panelIDs[v580] = v579;
                        if v580 == v574 then
                            l_v79_0 = v579;
                            break;
                        end;
                    end;
                end;
                if l_v79_0 == v79 then
                    if v575 ~= nil then
                        l_v79_0 = v81.getPanel(v575);
                    else
                        error(("Failed to get target panel %s (EAX == 0)"):format(tostring(v574)));
                    end;
                end;
                return l_v79_0;
            end;
        end;
        v81.getIsolate = function()
            -- upvalues: v121 (ref), v90 (ref)
            return v121(v90());
        end;
        v81.runScript = function(v581, v582, v583)
            -- upvalues: v81 (ref), v85 (ref), v87 (ref)
            if v582 == nil then
                v582 = v81.getPanel("CSGOJsRegistration");
            end;
            if v583 == nil then
                v583 = "panorama/layout/base.xml";
            end;
            if not v85(v582) then
                error("Invalid panel pointer (EAX == 0)");
            end;
            return v87(v582, v581, v583, 8, 10, false);
        end;
        v81.loadstring = function(v584, v585)
            -- upvalues: v125 (ref), v81 (ref)
            if v585 == nil then
                v585 = "CSGOJsRegistration";
            end;
            local v586 = "CSGOJsRegistration";
            if v585 == "CSGOMainMenu" then
                v586 = "CSGOHud";
            end;
            if v585 == "CSGOHud" then
                v586 = "CSGOMainMenu";
            end;
            return v125:loadstring(("(()=>{%s})"):format(v584), v81.getPanel(v585, v586));
        end;
        v81.open = function(v587)
            -- upvalues: v123 (ref), v122 (ref), v121 (ref), v81 (ref)
            if v587 == nil then
                v587 = "CSGOJsRegistration";
            end;
            local v588 = "CSGOJsRegistration";
            if v587 == "CSGOMainMenu" then
                v588 = "CSGOHud";
            end;
            if v587 == "CSGOHud" then
                v588 = "CSGOMainMenu";
            end;
            return v123()(function()
                -- upvalues: v122 (ref), v121 (ref)
                return v122(v121():getCurrentContext()):global():toValueChecked():toLua();
            end, v81.GetPanel(v587, v588));
        end;
        v81.GetPanel = v81.getPanel;
        v81.GetIsolate = v81.getIsolate;
        v81.RunScript = v81.runScript;
        v81.panelArray = v130;
        v81.info = v50;
        v81.flush = v62;
        setmetatable(v81, {
            __tostring = function(_)
                -- upvalues: v50 (ref)
                return ("luv8 panorama library v%.1f"):format(v50._VERSION);
            end, 
            __index = function(_, v591)
                -- upvalues: v81 (ref)
                if v81.hasPanel(v591) then
                    return v81.open(v591);
                else
                    return v81.open()[v591];
                end;
            end
        });
        return v81;
    end)();
end;
local v875 = (function()
    local v592 = true;
    local v593 = false;
    local v594 = "json";
    local l_pairs_0 = pairs;
    local l_type_0 = type;
    local l_tostring_0 = tostring;
    local l_tonumber_0 = tonumber;
    local l_getmetatable_0 = getmetatable;
    local l_setmetatable_0 = setmetatable;
    local _ = rawset;
    local l_error_0 = error;
    local l_require_0 = require;
    local l_pcall_0 = pcall;
    local l_select_0 = select;
    local l_floor_0 = math.floor;
    local l_huge_0 = math.huge;
    local l_rep_0 = string.rep;
    local l_gsub_0 = string.gsub;
    local l_sub_0 = string.sub;
    local l_byte_0 = string.byte;
    local l_char_0 = string.char;
    local l_find_0 = string.find;
    local l_len_0 = string.len;
    local l_format_0 = string.format;
    local l_match_0 = string.match;
    local l_concat_0 = table.concat;
    local v618 = {
        version = "dkjson 2.5"
    };
    if v593 then
        _G[v594] = v618;
    end;
    local _ = nil;
    l_pcall_0(function()
        -- upvalues: l_require_0 (ref), l_getmetatable_0 (ref)
        local l_getmetatable_1 = l_require_0("debug").getmetatable;
        if l_getmetatable_1 then
            l_getmetatable_0 = l_getmetatable_1;
        end;
    end);
    v618.null = l_setmetatable_0({}, {
        __tojson = function()
            return "null";
        end
    });
    local function v627(v621)
        -- upvalues: l_pairs_0 (ref), l_type_0 (ref), l_floor_0 (ref)
        local v622 = 0;
        local v623 = 0;
        local v624 = 0;
        for v625, v626 in l_pairs_0(v621) do
            if v625 == "n" and l_type_0(v626) == "number" then
                v624 = v626;
                if v622 < v626 then
                    v622 = v626;
                end;
            elseif l_type_0(v625) ~= "number" or v625 < 1 or l_floor_0(v625) ~= v625 then
                return false;
            else
                if v622 < v625 then
                    v622 = v625;
                end;
                v623 = v623 + 1;
            end;
        end;
        if v622 > 10 and v624 < v622 and v623 * 2 < v622 then
            return false;
        else
            return true, v622;
        end;
    end;
    local v628 = {
        ["\t"] = "\\t", 
        ["\\"] = "\\\\", 
        ["\r"] = "\\r", 
        ["\""] = "\\\"", 
        ["\n"] = "\\n", 
        ["\f"] = "\\f", 
        ["\b"] = "\\b"
    };
    local function v638(v629)
        -- upvalues: v628 (ref), l_byte_0 (ref), l_format_0 (ref), l_floor_0 (ref)
        local v630 = v628[v629];
        if v630 then
            return v630;
        else
            local v631, v632, v633, v634 = l_byte_0(v629, 1, 4);
            local v635 = v631 or 0;
            local v636 = v632 or 0;
            local v637 = v633 or 0;
            if not v634 then
                v634 = 0;
            end;
            v633 = v637;
            v632 = v636;
            v631 = v635;
            if v631 <= 127 then
                v630 = v631;
            elseif v631 >= 192 and v631 <= 223 and v632 >= 128 then
                v630 = (v631 - 192) * 64 + v632 - 128;
            elseif v631 >= 224 and v631 <= 239 and v632 >= 128 and v633 >= 128 then
                v630 = ((v631 - 224) * 64 + v632 - 128) * 64 + v633 - 128;
            elseif v631 >= 240 and v631 <= 247 and v632 >= 128 and v633 >= 128 and v634 >= 128 then
                v630 = (((v631 - 240) * 64 + v632 - 128) * 64 + v633 - 128) * 64 + v634 - 128;
            else
                return "";
            end;
            if v630 <= 65535 then
                return l_format_0("\\u%.4x", v630);
            elseif v630 <= 1114111 then
                v630 = v630 - 65536;
                v635 = 55296 + l_floor_0(v630 / 1024);
                v636 = 56320 + v630 % 1024;
                return l_format_0("\\u%.4x\\u%.4x", v635, v636);
            else
                return "";
            end;
        end;
    end;
    local function v642(v639, v640, v641)
        -- upvalues: l_find_0 (ref), l_gsub_0 (ref)
        if l_find_0(v639, v640) then
            return l_gsub_0(v639, v640, v641);
        else
            return v639;
        end;
    end;
    local function v644(v643)
        -- upvalues: v642 (ref), v638 (ref), l_find_0 (ref)
        v643 = v642(v643, "[%z\001-\031\"\\\127]", v638);
        if l_find_0(v643, "[\194\216\220\225\226\239]") then
            v643 = v642(v643, "\194[\128-\159\173]", v638);
            v643 = v642(v643, "\216[\128-\132]", v638);
            v643 = v642(v643, "\220\143", v638);
            v643 = v642(v643, "\225\158[\180\181]", v638);
            v643 = v642(v643, "\226\128[\140-\143\168-\175]", v638);
            v643 = v642(v643, "\226\129[\160-\175]", v638);
            v643 = v642(v643, "\239\187\191", v638);
            v643 = v642(v643, "\239\191[\176-\191]", v638);
        end;
        return "\"" .. v643 .. "\"";
    end;
    v618.quotestring = v644;
    local function v650(v645, v646, v647)
        -- upvalues: l_find_0 (ref), l_sub_0 (ref)
        local v648, v649 = l_find_0(v645, v646, 1, true);
        if v648 then
            return l_sub_0(v645, 1, v648 - 1) .. v647 .. l_sub_0(v645, v649 + 1, -1);
        else
            return v645;
        end;
    end;
    local v651 = nil;
    local v652 = nil;
    local function v653()
        -- upvalues: v651 (ref), l_match_0 (ref), l_tostring_0 (ref), v652 (ref), l_gsub_0 (ref)
        v651 = l_match_0(l_tostring_0(0.5), "([^05+])");
        v652 = "[^0-9%-%+eE" .. l_gsub_0(v651, "[%^%$%(%)%%%.%[%]%*%+%-%?]", "%%%0") .. "]+";
    end;
    v653();
    local function v655(v654)
        -- upvalues: v650 (ref), v642 (ref), l_tostring_0 (ref), v652 (ref), v651 (ref)
        return v650(v642(l_tostring_0(v654), v652, ""), v651, ".");
    end;
    local function v658(v656)
        -- upvalues: l_tonumber_0 (ref), v650 (ref), v651 (ref), v653 (ref)
        local v657 = l_tonumber_0(v650(v656, ".", v651));
        if not v657 then
            v653();
            v657 = l_tonumber_0(v650(v656, ".", v651));
        end;
        return v657;
    end;
    local function v662(v659, v660, v661)
        -- upvalues: l_rep_0 (ref)
        v660[v661 + 1] = "\n";
        v660[v661 + 2] = l_rep_0("  ", v659);
        return v661 + 2;
    end;
    v618.addnewline = function(v663)
        -- upvalues: v662 (ref)
        if v663.indent then
            v663.bufferlen = v662(v663.level or 0, v663.buffer, v663.bufferlen or #v663.buffer);
        end;
    end;
    local v664 = nil;
    local function v676(v665, v666, v667, v668, v669, v670, v671, v672, v673, v674)
        -- upvalues: l_type_0 (ref), v662 (ref), v644 (ref), v664 (ref)
        local v675 = l_type_0(v665);
        if v675 ~= "string" and v675 ~= "number" then
            return nil, "type '" .. v675 .. "' is not supported as a key by JSON.";
        else
            if v667 then
                v671 = v671 + 1;
                v670[v671] = ",";
            end;
            if v668 then
                v671 = v662(v669, v670, v671);
            end;
            v670[v671 + 1] = v644(v665);
            v670[v671 + 2] = ":";
            return v664(v666, v668, v669, v670, v671 + 2, v672, v673, v674);
        end;
    end;
    local function v681(v677, v678, v679)
        -- upvalues: l_type_0 (ref)
        local l_bufferlen_0 = v679.bufferlen;
        if l_type_0(v677) == "string" then
            l_bufferlen_0 = l_bufferlen_0 + 1;
            v678[l_bufferlen_0] = v677;
        end;
        return l_bufferlen_0;
    end;
    local function v691(v682, v683, v684, v685, v686, v687)
        -- upvalues: v681 (ref)
        if not v687 then
            v687 = v682;
        end;
        local l_exception_0 = v684.exception;
        if not l_exception_0 then
            return nil, v687;
        else
            v684.bufferlen = v686;
            local v689, v690 = l_exception_0(v682, v683, v684, v687);
            if not v689 then
                return nil, v690 or v687;
            else
                return v681(v689, v685, v684);
            end;
        end;
    end;
    v618.encodeexception = function(_, _, _, v695)
        -- upvalues: v644 (ref)
        return v644("<" .. v695 .. ">");
    end;
    v664 = function(v696, v697, v698, v699, v700, v701, v702, v703)
        -- upvalues: l_type_0 (ref), l_getmetatable_0 (ref), v691 (ref), v681 (ref), l_huge_0 (ref), v655 (ref), v644 (ref), v627 (ref), v664 (ref), v676 (ref), l_pairs_0 (ref), v662 (ref)
        local v704 = l_type_0(v696);
        local v705 = l_getmetatable_0(v696);
        if l_type_0(v705) ~= "table" then
            v705 = false;
        end;
        local v706;
        if v705 then
            v706 = v705.__tojson;
        else
            v706 = v705;
        end;
        if v706 then
            if v701[v696] then
                return v691("reference cycle", v696, v703, v699, v700);
            else
                v701[v696] = true;
                v703.bufferlen = v700;
                local v707, v708 = v706(v696, v703);
                if not v707 then
                    return v691("custom encoder failed", v696, v703, v699, v700, v708);
                else
                    v701[v696] = nil;
                    v700 = v681(v707, v699, v703);
                end;
            end;
        elseif v696 == nil then
            v700 = v700 + 1;
            v699[v700] = "null";
        elseif v704 == "number" then
            local v709 = nil;
            v709 = (not (v696 == v696 and l_huge_0 > v696) or -v696 >= l_huge_0) and "null" or v655(v696);
            v700 = v700 + 1;
            v699[v700] = v709;
        elseif v704 == "boolean" then
            v700 = v700 + 1;
            v699[v700] = v696 and "true" or "false";
        elseif v704 == "string" then
            v700 = v700 + 1;
            v699[v700] = v644(v696);
        elseif v704 == "table" then
            if v701[v696] then
                return v691("reference cycle", v696, v703, v699, v700);
            else
                v701[v696] = true;
                v698 = v698 + 1;
                local v710, v711 = v627(v696);
                if v711 == 0 and v705 and v705.__jsontype == "object" then
                    v710 = false;
                end;
                local v712 = nil;
                if v710 then
                    v700 = v700 + 1;
                    v699[v700] = "[";
                    for v713 = 1, v711 do
                        local v714, v715 = v664(v696[v713], v697, v698, v699, v700, v701, v702, v703);
                        v712 = v715;
                        v700 = v714;
                        if not v700 then
                            return nil, v712;
                        elseif v713 < v711 then
                            v700 = v700 + 1;
                            v699[v700] = ",";
                        end;
                    end;
                    v700 = v700 + 1;
                    v699[v700] = "]";
                else
                    local v716 = false;
                    v700 = v700 + 1;
                    v699[v700] = "{";
                    local v717 = v705 and v705.__jsonorder or v702;
                    if v717 then
                        local v718 = {};
                        for v719 = 1, #v717 do
                            local v720 = v717[v719];
                            local v721 = v696[v720];
                            if v721 then
                                v718[v720] = true;
                                local v722, v723 = v676(v720, v721, v716, v697, v698, v699, v700, v701, v702, v703);
                                v712 = v723;
                                v700 = v722;
                                v716 = true;
                            end;
                        end;
                        for v724, v725 in l_pairs_0(v696) do
                            if not v718[v724] then
                                local v726, v727 = v676(v724, v725, v716, v697, v698, v699, v700, v701, v702, v703);
                                v712 = v727;
                                v700 = v726;
                                if not v700 then
                                    return nil, v712;
                                else
                                    v716 = true;
                                end;
                            end;
                        end;
                    else
                        for v728, v729 in l_pairs_0(v696) do
                            local v730, v731 = v676(v728, v729, v716, v697, v698, v699, v700, v701, v702, v703);
                            v712 = v731;
                            v700 = v730;
                            if not v700 then
                                return nil, v712;
                            else
                                v716 = true;
                            end;
                        end;
                    end;
                    if v697 then
                        v700 = v662(v698 - 1, v699, v700);
                    end;
                    v700 = v700 + 1;
                    v699[v700] = "}";
                end;
                v701[v696] = nil;
            end;
        else
            return v691("unsupported type", v696, v703, v699, v700, "type '" .. v704 .. "' is not supported by JSON.");
        end;
        return v700;
    end;
    v618.encode = function(v732, v733)
        -- upvalues: v653 (ref), v664 (ref), l_error_0 (ref), l_concat_0 (ref)
        if not v733 then
            v733 = {};
        end;
        local l_buffer_0 = v733.buffer;
        local v735 = l_buffer_0 or {};
        v733.buffer = v735;
        v653();
        local v736, v737 = v664(v732, v733.indent, v733.level or 0, v735, v733.bufferlen or 0, v733.tables or {}, v733.keyorder, v733);
        if not v736 then
            l_error_0(v737, 2);
            return;
        elseif l_buffer_0 == v735 then
            v733.bufferlen = v736;
            return true;
        else
            v733.bufferlen = nil;
            v733.buffer = nil;
            return l_concat_0(v735);
        end;
    end;
    local function v743(v738, v739)
        -- upvalues: l_find_0 (ref)
        local v740 = 1;
        local v741 = 1;
        local v742 = 0;
        while true do
            v741 = l_find_0(v738, "\n", v741, true);
            if v741 and v741 < v739 then
                v740 = v740 + 1;
                v742 = v741;
                v741 = v741 + 1;
            else
                break;
            end;
        end;
        return "line " .. v740 .. ", column " .. v739 - v742;
    end;
    local function v747(v744, v745, v746)
        -- upvalues: l_len_0 (ref), v743 (ref)
        return nil, l_len_0(v744) + 1, "unterminated " .. v745 .. " at " .. v743(v744, v746);
    end;
    local function v751(v748, v749)
        -- upvalues: l_find_0 (ref), l_sub_0 (ref)
        while true do
            v749 = l_find_0(v748, "%S", v749);
            if not v749 then
                return nil;
            else
                local v750 = l_sub_0(v748, v749, v749 + 1);
                if v750 == "\239\187" and l_sub_0(v748, v749 + 2, v749 + 2) == "\191" then
                    v749 = v749 + 3;
                elseif v750 == "//" then
                    v749 = l_find_0(v748, "[\n\r]", v749 + 2);
                    if not v749 then
                        return nil;
                    end;
                elseif v750 == "/*" then
                    v749 = l_find_0(v748, "*/", v749 + 2);
                    if not v749 then
                        return nil;
                    else
                        v749 = v749 + 2;
                    end;
                else
                    return v749;
                end;
            end;
        end;
    end;
    local v752 = {
        b = "\b", 
        ["\\"] = "\\", 
        ["/"] = "/", 
        ["\""] = "\"", 
        r = "\r", 
        n = "\n", 
        t = "\t", 
        f = "\f"
    };
    local function v754(v753)
        -- upvalues: l_char_0 (ref), l_floor_0 (ref)
        if v753 < 0 then
            return nil;
        elseif v753 <= 127 then
            return l_char_0(v753);
        elseif v753 <= 2047 then
            return l_char_0(192 + l_floor_0(v753 / 64), 128 + l_floor_0(v753) % 64);
        elseif v753 <= 65535 then
            return l_char_0(224 + l_floor_0(v753 / 4096), 128 + l_floor_0(v753 / 64) % 64, 128 + l_floor_0(v753) % 64);
        elseif v753 <= 1114111 then
            return l_char_0(240 + l_floor_0(v753 / 262144), 128 + l_floor_0(v753 / 4096) % 64, 128 + l_floor_0(v753 / 64) % 64, 128 + l_floor_0(v753) % 64);
        else
            return nil;
        end;
    end;
    local function v764(v755, v756)
        -- upvalues: l_find_0 (ref), v747 (ref), l_sub_0 (ref), l_tonumber_0 (ref), v754 (ref), v752 (ref), l_concat_0 (ref)
        local v757 = v756 + 1;
        local v758 = {};
        local v759 = 0;
        while true do
            local v760 = l_find_0(v755, "[\"\\]", v757);
            if not v760 then
                return v747(v755, "string", v756);
            else
                if v757 < v760 then
                    v759 = v759 + 1;
                    v758[v759] = l_sub_0(v755, v757, v760 - 1);
                end;
                if l_sub_0(v755, v760, v760) == "\"" then
                    v757 = v760 + 1;
                    if v759 == 1 then
                        return v758[1], v757;
                    elseif v759 > 1 then
                        return l_concat_0(v758), v757;
                    else
                        return "", v757;
                    end;
                else
                    local v761 = l_sub_0(v755, v760 + 1, v760 + 1);
                    local v762 = nil;
                    if v761 == "u" then
                        v762 = l_tonumber_0(l_sub_0(v755, v760 + 2, v760 + 5), 16);
                        if v762 then
                            local v763 = nil;
                            if v762 >= 55296 and v762 <= 56319 and l_sub_0(v755, v760 + 6, v760 + 7) == "\\u" then
                                v763 = l_tonumber_0(l_sub_0(v755, v760 + 8, v760 + 11), 16);
                                if v763 and v763 >= 56320 and v763 <= 57343 then
                                    v762 = (v762 - 55296) * 1024 + (v763 - 56320) + 65536;
                                else
                                    v763 = nil;
                                end;
                            end;
                            if v762 then
                                v762 = v754(v762);
                            end;
                            if v762 then
                                if v763 then
                                    v757 = v760 + 12;
                                else
                                    v757 = v760 + 6;
                                end;
                            end;
                        end;
                    end;
                    if not v762 then
                        v762 = v752[v761] or v761;
                        v757 = v760 + 2;
                    end;
                    v759 = v759 + 1;
                    v758[v759] = v762;
                end;
            end;
        end;
    end;
    local v765 = nil;
    local function v784(v766, v767, v768, v769, v770, v771, v772)
        -- upvalues: l_len_0 (ref), l_setmetatable_0 (ref), v751 (ref), v747 (ref), l_sub_0 (ref), v765 (ref), v743 (ref)
        local _ = l_len_0(v768);
        local v774 = {};
        local v775 = 0;
        local v776 = v769 + 1;
        if v766 == "object" then
            l_setmetatable_0(v774, v771);
        else
            l_setmetatable_0(v774, v772);
        end;
        while true do
            v776 = v751(v768, v776);
            if not v776 then
                return v747(v768, v766, v769);
            elseif l_sub_0(v768, v776, v776) == v767 then
                return v774, v776 + 1;
            else
                local v777 = nil;
                local v778 = nil;
                local v779, v780, v781 = v765(v768, v776, v770, v771, v772);
                v778 = v781;
                v776 = v780;
                v777 = v779;
                if v778 then
                    return nil, v776, v778;
                else
                    v776 = v751(v768, v776);
                    if not v776 then
                        return v747(v768, v766, v769);
                    else
                        local v782 = l_sub_0(v768, v776, v776);
                        if v782 == ":" then
                            if v777 == nil then
                                return nil, v776, "cannot use nil as table index (at " .. v743(v768, v776) .. ")";
                            else
                                v776 = v751(v768, v776 + 1);
                                if not v776 then
                                    return v747(v768, v766, v769);
                                else
                                    v779 = nil;
                                    local v783;
                                    v780, v781, v783 = v765(v768, v776, v770, v771, v772);
                                    v778 = v783;
                                    v776 = v781;
                                    v779 = v780;
                                    if v778 then
                                        return nil, v776, v778;
                                    else
                                        v774[v777] = v779;
                                        v776 = v751(v768, v776);
                                        if not v776 then
                                            return v747(v768, v766, v769);
                                        else
                                            v782 = l_sub_0(v768, v776, v776);
                                        end;
                                    end;
                                end;
                            end;
                        else
                            v775 = v775 + 1;
                            v774[v775] = v777;
                        end;
                        if v782 == "," then
                            v776 = v776 + 1;
                        end;
                    end;
                end;
            end;
        end;
    end;
    v765 = function(v785, v786, v787, v788, v789)
        -- upvalues: v751 (ref), l_len_0 (ref), l_sub_0 (ref), v784 (ref), v764 (ref), l_find_0 (ref), v658 (ref), v743 (ref)
        if not v786 then
            v786 = 1;
        end;
        v786 = v751(v785, v786);
        if not v786 then
            return nil, l_len_0(v785) + 1, "no valid JSON value (reached the end)";
        else
            local v790 = l_sub_0(v785, v786, v786);
            if v790 == "{" then
                return v784("object", "}", v785, v786, v787, v788, v789);
            elseif v790 == "[" then
                return v784("array", "]", v785, v786, v787, v788, v789);
            elseif v790 == "\"" then
                return v764(v785, v786);
            else
                local v791, v792 = l_find_0(v785, "^%-?[%d%.]+[eE]?[%+%-]?%d*", v786);
                if v791 then
                    local v793 = v658(l_sub_0(v785, v791, v792));
                    if v793 then
                        return v793, v792 + 1;
                    end;
                end;
                local v794, v795 = l_find_0(v785, "^%a%w*", v786);
                v792 = v795;
                v791 = v794;
                if v791 then
                    v794 = l_sub_0(v785, v791, v792);
                    if v794 == "true" then
                        return true, v792 + 1;
                    elseif v794 == "false" then
                        return false, v792 + 1;
                    elseif v794 == "null" then
                        return v787, v792 + 1;
                    end;
                end;
                return nil, v786, "no valid JSON value at " .. v743(v785, v786);
            end;
        end;
    end;
    local function v796(...)
        -- upvalues: l_select_0 (ref)
        if l_select_0("#", ...) > 0 then
            return ...;
        else
            return {
                __jsontype = "object"
            }, {
                __jsontype = "array"
            };
        end;
    end;
    v618.decode = function(v797, v798, v799, ...)
        -- upvalues: v796 (ref), v765 (ref)
        local v800, v801 = v796(...);
        return v765(v797, v798, v799, v800, v801);
    end;
    v618.use_lpeg = function()
        -- upvalues: l_require_0 (ref), l_error_0 (ref), v743 (ref), v752 (ref), l_tonumber_0 (ref), v754 (ref), v658 (ref), l_setmetatable_0 (ref), v618 (ref), v796 (ref)
        local v802 = l_require_0("lpeg");
        if v802.version() == "0.11" then
            l_error_0("due to a bug in LPeg 0.11, it cannot be used for JSON matching");
        end;
        local l_match_1 = v802.match;
        local l_P_0 = v802.P;
        local l_S_0 = v802.S;
        local l_R_0 = v802.R;
        local function v811(v807, v808, v809, v810)
            -- upvalues: v743 (ref)
            if not v810.msg then
                v810.msg = v809 .. " at " .. v743(v807, v808);
                v810.pos = v808;
            end;
            return false;
        end;
        local function v813(v812)
            -- upvalues: v802 (ref), v811 (ref)
            return v802.Cmt(v802.Cc(v812) * v802.Carg(2), v811);
        end;
        local v814 = l_P_0("//") * (1 - l_S_0("\n\r")) ^ 0;
        local v815 = l_P_0("/*") * (1 - l_P_0("*/")) ^ 0 * l_P_0("*/");
        local v816 = (l_S_0(" \n\r\t") + l_P_0("\239\187\191") + v814 + v815) ^ 0;
        local v817 = 1 - l_S_0("\"\\\n\r");
        local v818 = l_P_0("\\") * v802.C(l_S_0("\"\\/bfnrt") + v813("unsupported escape sequence")) / v752;
        local v819 = l_R_0("09", "af", "AF");
        local function v825(_, _, v822, v823)
            -- upvalues: l_tonumber_0 (ref), v754 (ref)
            local v824 = l_tonumber_0(v822, 16);
            v823 = l_tonumber_0(v823, 16);
            v822 = v824;
            if v822 >= 55296 and v822 <= 56319 and v823 >= 56320 and v823 <= 57343 then
                return true, v754((v822 - 55296) * 1024 + (v823 - 56320) + 65536);
            else
                return false;
            end;
        end;
        local function v827(v826)
            -- upvalues: v754 (ref), l_tonumber_0 (ref)
            return v754(l_tonumber_0(v826, 16));
        end;
        local v828 = l_P_0("\\u") * v802.C(v819 * v819 * v819 * v819);
        local v829 = v802.Cmt(v828 * v828, v825) + v828 / v827 + v818 + v817;
        local v830 = l_P_0("\"") * v802.Cs(v829 ^ 0) * (l_P_0("\"") + v813("unterminated string"));
        local v831 = l_P_0("-") ^ (-1) * (l_P_0("0") + l_R_0("19") * l_R_0("09") ^ 0);
        local v832 = l_P_0(".") * l_R_0("09") ^ 0;
        local v833 = l_S_0("eE") * l_S_0("+-") ^ (-1) * l_R_0("09") ^ 1;
        local v834 = v831 * v832 ^ (-1) * v833 ^ (-1) / v658;
        local v835 = l_P_0("true") * v802.Cc(true) + l_P_0("false") * v802.Cc(false) + l_P_0("null") * v802.Carg(1);
        local v836 = v834 + v830 + v835;
        local v837 = nil;
        local v838 = nil;
        local function v851(v839, v840, v841, v842)
            -- upvalues: l_match_1 (ref), v837 (ref), l_setmetatable_0 (ref)
            local v843 = nil;
            local v844 = nil;
            local v845 = nil;
            local v846 = {};
            local v847 = 0;
            while true do
                local v848, v849, v850 = l_match_1(v837, v839, v840, v841, v842);
                v845 = v850;
                v844 = v849;
                v843 = v848;
                if v845 then
                    v840 = v845;
                    v847 = v847 + 1;
                    v846[v847] = v843;
                    if v844 == "last" then
                        break;
                    end;
                else
                    break;
                end;
            end;
            return v840, l_setmetatable_0(v846, v842.arraymeta);
        end;
        local function v865(v852, v853, v854, v855)
            -- upvalues: l_match_1 (ref), v838 (ref), l_setmetatable_0 (ref)
            local v856 = nil;
            local v857 = nil;
            local v858 = nil;
            local v859 = nil;
            local v860 = {};
            while true do
                local v861, v862, v863, v864 = l_match_1(v838, v852, v853, v854, v855);
                v859 = v864;
                v858 = v863;
                v856 = v862;
                v857 = v861;
                if v859 then
                    v853 = v859;
                    v860[v857] = v856;
                    if v858 == "last" then
                        break;
                    end;
                else
                    break;
                end;
            end;
            return v853, l_setmetatable_0(v860, v855.objectmeta);
        end;
        local v866 = v816 * (l_P_0("[") * v802.Cmt(v802.Carg(1) * v802.Carg(2), v851) * v816 * (l_P_0("]") + v813("']' expected")) + l_P_0("{") * v802.Cmt(v802.Carg(1) * v802.Carg(2), v865) * v816 * (l_P_0("}") + v813("'}' expected")) + v836);
        local v867 = v866 + v816 * v813("value expected");
        v837 = v866 * v816 * (l_P_0(",") * v802.Cc("cont") + v802.Cc("last")) * v802.Cp();
        v838 = v802.Cg(v816 * v830 * v816 * (l_P_0(":") + v813("colon expected")) * v867) * v816 * (l_P_0(",") * v802.Cc("cont") + v802.Cc("last")) * v802.Cp();
        local v868 = v867 * v802.Cp();
        v618.decode = function(v869, v870, v871, ...)
            -- upvalues: v796 (ref), l_match_1 (ref), v868 (ref)
            local v872 = {};
            local v873, v874 = v796(...);
            v872.arraymeta = v874;
            v872.objectmeta = v873;
            v873, v874 = l_match_1(v868, v869, v870, v871, v872);
            if v872.msg then
                return nil, v872.pos, v872.msg;
            else
                return v873, v874;
            end;
        end;
        v618.use_lpeg = function()
            -- upvalues: v618 (ref)
            return v618;
        end;
        v618.using_lpeg = true;
        return v618;
    end;
    if v592 then
        l_pcall_0(v618.use_lpeg);
    end;
    v618.parse = v618.decode;
    v618.stringify = v618.encode;
    return v618;
end)();
local v925 = (function()
    -- upvalues: l_bit_0 (ref), l_ffi_0 (ref)
    local l_band_1 = l_bit_0.band;
    local l_bor_1 = l_bit_0.bor;
    local l_bnot_1 = l_bit_0.bnot;
    local l_bxor_1 = l_bit_0.bxor;
    local l_lshift_1 = l_bit_0.lshift;
    local l_rshift_1 = l_bit_0.rshift;
    local v882 = {};
    v882.__index = v882;
    local v883 = 14;
    local v884 = 5;
    local v885 = l_lshift_1(1, v884);
    local v886 = 1 / v885;
    v882.new = function(v887)
        -- upvalues: v882 (ref), l_ffi_0 (ref)
        if v887 == nil then
            v887 = {
                [1] = 0, 
                [2] = 0, 
                [3] = 0, 
                [4] = 0, 
                [5] = 0, 
                [6] = 0, 
                [7] = 0, 
                [8] = 0, 
                [9] = 0, 
                [10] = 0, 
                [11] = 0, 
                [12] = 0, 
                [13] = 0, 
                [14] = 0, 
                [15] = 0, 
                [16] = 0, 
                [17] = 0, 
                [18] = 0, 
                [19] = 0, 
                [20] = 0
            };
        end;
        local v888 = setmetatable({}, v882);
        v888.data = l_ffi_0.new("uint8_t[?]", #v887, v887);
        v888.size = #v887;
        v888.pos = 0;
        v888.bit_pos = 0;
        return v888;
    end;
    v882.read_bits = function(v889, v890)
        -- upvalues: l_lshift_1 (ref), l_bor_1 (ref), l_band_1 (ref), l_rshift_1 (ref)
        local v891 = 0;
        local l_v890_0 = v890;
        while l_v890_0 > 0 do
            while v889.bit_pos == 8 do
                v889.bit_pos = v889.bit_pos - 8;
                v889.pos = v889.pos + 1;
            end;
            local v893 = v889.data[v889.pos];
            local v894 = math.min(l_v890_0, 8 - v889.bit_pos);
            local v895 = l_lshift_1(1, v894) - 1;
            v891 = l_bor_1(v891, l_lshift_1(l_band_1(l_rshift_1(v893, v889.bit_pos), v895), v890 - l_v890_0));
            l_v890_0 = l_v890_0 - v894;
            v889.bit_pos = v889.bit_pos + v894;
        end;
        return v891;
    end;
    v882.write_bits = function(v896, v897, v898)
        -- upvalues: l_lshift_1 (ref), l_bor_1 (ref), l_band_1 (ref), l_bnot_1 (ref), l_rshift_1 (ref)
        local l_v898_0 = v898;
        while l_v898_0 > 0 do
            while v896.bit_pos == 8 do
                v896.bit_pos = v896.bit_pos - 8;
                v896.pos = v896.pos + 1;
            end;
            local v900 = v896.data[v896.pos];
            local v901 = math.min(l_v898_0, 8 - v896.bit_pos);
            local v902 = l_lshift_1(1, v901) - 1;
            v900 = l_bor_1(l_band_1(v900, l_bnot_1(l_lshift_1(v902, v896.bit_pos))), l_lshift_1(l_band_1(v897, v902), v896.bit_pos));
            v897 = l_rshift_1(v897, v901);
            l_v898_0 = l_v898_0 - v901;
            v896.bit_pos = v896.bit_pos + v901;
            v896.data[v896.pos] = v900;
        end;
    end;
    v882.read_coord = function(v903)
        -- upvalues: v883 (ref), v884 (ref)
        local v904 = v903:read_bits(1);
        local v905 = v903:read_bits(1);
        if v904 == 0 and v905 == 0 then
            return 0;
        else
            local v906 = v903:read_bits(1);
            if v904 == 1 then
                v904 = v903:read_bits(v883) + 1;
            end;
            if v905 == 1 then
                v905 = v903:read_bits(v884);
            end;
            local v907 = v904 + v905 * 0.03125;
            if v906 == 1 then
                v907 = -v907;
            end;
            return v907;
        end;
    end;
    v882.write_coord = function(v908, v909)
        -- upvalues: v886 (ref), v885 (ref), v883 (ref), v884 (ref)
        local v910 = v909 <= -v886;
        local v911 = math.abs(v909);
        local v912 = math.abs(v909 * v885) % v885;
        v908:write_bits(v911 ~= 0 and 1 or 0, 1);
        v908:write_bits(v912 ~= 0 and 1 or 0, 1);
        if v911 ~= 0 or v912 ~= 0 then
            v908:write_bits(v910 and 1 or 0, 1);
            if v911 ~= 0 then
                v908:write_bits(v911 - 1, v883);
            end;
            if v912 ~= 0 then
                v908:write_bits(v912, v884);
            end;
        end;
    end;
    v882.reset = function(v913)
        v913.pos = 0;
        v913.bit_pos = 0;
    end;
    v882.to_bytes = function(v914)
        local v915 = {};
        for v916 = 0, v914.size - 1 do
            table.insert(v915, v914.data[v916]);
        end;
        return v915;
    end;
    v882.get_raw_buffer = function(v917)
        return v917.data;
    end;
    v882.crypt = function(v918, v919)
        -- upvalues: l_bxor_1 (ref)
        if type(v919) == "string" then
            local v920 = {};
            for v921 = 1, #v919 do
                table.insert(v920, string.byte(v919, v921));
            end;
            v919 = v920;
        end;
        local v922 = #v919;
        local v923 = 0;
        for v924 = 0, v918.size - 1 do
            v918.data[v924] = l_bxor_1(v918.data[v924], v919[v923 + 1]);
            v923 = (v923 + 1) % v922;
        end;
    end;
    return v882;
end)();
local function v930(v926, v927)
    for _, v929 in pairs(v926) do
        if v929 == v927 then
            return true;
        end;
    end;
    return false;
end;
local v1014 = {
    [v46.NEVERLOSE] = function()
        -- upvalues: v34 (ref), v41 (ref), v42 (ref), v43 (ref), v44 (ref), l_ffi_0 (ref), l_panorama_0 (ref)
        local v931 = nil;
        local v943 = (function()
            local v932 = {};
            local function v935(v933)
                return {
                    status = #v933 ~= 0 and 200 or 500, 
                    body = v933, 
                    success = function(_)
                        return true;
                    end, 
                    headers = {}
                };
            end;
            v932.request = function(_, v937, v938, v939, v940)
                -- upvalues: v935 (ref)
                if v937 == "get" then
                    network.get(v938, v939.headers, function(v941)
                        -- upvalues: v940 (ref), v935 (ref)
                        v940(v935(v941));
                    end);
                elseif v937 == "post" then
                    network.post(v938, v939.body, v939.headers, function(v942)
                        -- upvalues: v940 (ref), v935 (ref)
                        v940(v935(v942));
                    end);
                end;
            end;
            return v932;
        end)();
        events.voice_message:set(function(v944)
            -- upvalues: v931 (ref)
            local l_status_0, l_result_0 = pcall(function()
                -- upvalues: v931 (ref), v944 (ref)
                if v931 ~= nil then
                    v931(v944[0], v944.is_nl);
                end;
            end);
            if not l_status_0 then
                print(l_result_0);
            end;
        end);
        local v947 = nil;
        events.shutdown:set(function()
            -- upvalues: v947 (ref)
            if v947 ~= nil then
                v947();
            end;
        end);
        local v948 = nil;
        events.player_connect_full:set(function(v949)
            -- upvalues: v948 (ref)
            if v948 ~= nil and v949 ~= nil and v949.userid ~= nil and entity.get(v949.userid, true) ~= nil then
                v948(entity.get(v949.userid, true):get_index());
            end;
        end);
        local v950 = nil;
        events.render:set(function()
            -- upvalues: v950 (ref)
            if v950 ~= nil then
                v950();
            end;
        end);
        local v951 = nil;
        events.net_update_end:set(function()
            -- upvalues: v951 (ref)
            if v951 ~= nil then
                v951();
            end;
        end);
        local v952 = nil;
        events.round_start:set(function()
            -- upvalues: v952 (ref)
            if v952 ~= nil then
                v952();
            end;
        end);
        local v953 = nil;
        events.player_death:set(function(v954)
            -- upvalues: v953 (ref)
            if v953 ~= nil and v954 ~= nil and v954.userid ~= nil and v954.attacker ~= nil then
                v953(v954.attacker, v954.assister, v954.userid);
            end;
        end);
        local v955 = nil;
        v955 = v34.unmatched_lua and "Unmatched.lua" or "Cheat detector";
        local v956 = ui.create(v955);
        local v957 = v956:switch("Reveal unmatched.gg Rank", true);
        local v958 = v956:switch("Display Estimated Data", true);
        local v959 = v956:selectable("Detection Features", {
            [1] = "rank image", 
            [2] = "scoreboard color", 
            [3] = "spectator hud", 
            [4] = "killfeed icons"
        });
        local v960 = nil;
        local function v961()
            -- upvalues: v960 (ref)
            if v960 ~= nil then
                v960();
            end;
        end;
        v959:set_callback(v961);
        v957:set_callback(v961);
        v958:set_callback(v961);
        local v962 = {};
        local v963 = 0;
        for v964, v965 in pairs(v41) do
            if type(v964) == "number" then
                v963 = v963 + 1;
                v962[v963] = v965;
            end;
        end;
        local v966 = nil;
        if v34.spoof then
            v966 = v956:selectable("Spoof cheat", v962);
        end;
        local v967 = {};
        local v968 = 0;
        for v969, v970 in pairs(v42) do
            if type(v969) == "number" then
                v968 = v968 + 1;
                v967[v968] = v970;
            end;
        end;
        local v971 = nil;
        if v34.spoof then
            v971 = v956:selectable("Spoof position of", v967);
        end;
        local v972 = {};
        local v973 = 0;
        for v974, v975 in pairs(v43) do
            if type(v974) == "number" then
                v973 = v973 + 1;
                v972[v973] = v975;
            end;
        end;
        local v976 = nil;
        if v34.spoof then
            v976 = v956:selectable("Spoof mode", v972);
        end;
        local v977 = {};
        local v978 = 0;
        for v979, v980 in pairs(v44) do
            if type(v979) == "number" then
                v978 = v978 + 1;
                v977[v978] = v980;
            end;
        end;
        local v981 = v956:combo("Cheat icon pack", v977);
        v981:set_callback(v961);
        local v982 = l_ffi_0.cast("uint32_t(__fastcall*)(void*, void*)", utils.opcode_scan("engine.dll", "56 57 8B F9 8D 4F 08 C7 07 ? ? ? ? E8 ? ? ? ? C7"));
        return {
            panorama = l_panorama_0, 
            http = v943, 
            get_api_key = function()
                return "5PJIYZfPOLgurRGfuTtf25Au3MwSa6aH";
            end, 
            set_shutdown_callback = function(v983)
                -- upvalues: v947 (ref)
                v947 = v983;
            end, 
            set_player_connect_callback = function(v984)
                -- upvalues: v948 (ref)
                v948 = v984;
            end, 
            set_paint_callback = function(v985)
                -- upvalues: v950 (ref)
                v950 = v985;
            end, 
            set_net_update_callback = function(v986)
                -- upvalues: v951 (ref)
                v951 = v986;
            end, 
            set_round_start_callback = function(v987)
                -- upvalues: v952 (ref)
                v952 = v987;
            end, 
            set_player_death_callback = function(v988)
                -- upvalues: v953 (ref)
                v953 = v988;
            end, 
            is_in_game = function()
                return globals.is_in_game;
            end, 
            get_local_player_id = function()
                return entity.get_local_player():get_index();
            end, 
            set_voice_callback = function(v989)
                -- upvalues: v931 (ref)
                v931 = v989;
            end, 
            is_unmatched_enabled = function()
                -- upvalues: v957 (ref)
                return v957:get();
            end, 
            is_rank_image_enabled = function()
                -- upvalues: v959 (ref)
                return v959:get(1);
            end, 
            is_scoreboard_color_enabled = function()
                -- upvalues: v959 (ref)
                return v959:get(2);
            end, 
            is_spectator_hud_enabled = function()
                -- upvalues: v959 (ref)
                return v959:get(3);
            end, 
            is_killfeed_icons_enabled = function()
                -- upvalues: v959 (ref)
                return v959:get(4);
            end, 
            should_display_estimated_data = function()
                -- upvalues: v958 (ref)
                return v958:get();
            end, 
            set_features_update_callback = function(v990)
                -- upvalues: v960 (ref)
                v960 = v990;
            end, 
            get_spoofed_cheats = function()
                -- upvalues: v34 (ref), v962 (ref), v966 (ref)
                if not v34.spoof then
                    return {};
                else
                    local v991 = {};
                    for v992 = 1, #v962 do
                        if v966:get(v992) then
                            v991[v992] = true;
                        end;
                    end;
                    return v991;
                end;
            end, 
            get_spoof_targets = function()
                -- upvalues: v34 (ref), v967 (ref), v971 (ref)
                if not v34.spoof then
                    return {};
                else
                    local v993 = {};
                    for v994 = 1, #v967 do
                        if v971:get(v994) then
                            v993[v994] = true;
                        end;
                    end;
                    return v993;
                end;
            end, 
            get_spoof_modes = function()
                -- upvalues: v34 (ref), v976 (ref)
                if not v34.spoof then
                    return {};
                else
                    local v995 = {};
                    for v996 = 1, #to_pass_mode do
                        if v976:get(v996) then
                            v995[v996] = true;
                        end;
                    end;
                    return v995;
                end;
            end, 
            get_icon_pack = function()
                -- upvalues: v44 (ref), v981 (ref)
                return v44[v981:get()];
            end, 
            create_interface = function(v997, v998)
                return utils.create_interface(v997, v998);
            end, 
            get_unix_time = function()
                return common.get_unixtime();
            end, 
            get_construct_voice_message = function()
                -- upvalues: v982 (ref)
                return v982;
            end, 
            get_players = function()
                local v999 = entity.get_players(false, true);
                if not v999 then
                    return nil;
                else
                    local v1000 = {};
                    local v1001 = 0;
                    for _, v1003 in pairs(v999) do
                        v1001 = v1001 + 1;
                        v1000[v1001] = v1003:get_index();
                    end;
                    return v1000;
                end;
            end, 
            is_player_valid = function(v1004)
                local v1005 = entity.get(v1004);
                if v1005 == nil then
                    return false;
                else
                    return v1005:is_alive();
                end;
            end, 
            is_player_enemy = function(v1006)
                local v1007 = entity.get(v1006);
                if v1007 == nil then
                    return false;
                else
                    return v1007:is_enemy();
                end;
            end, 
            is_player_dormant = function(v1008)
                local v1009 = entity.get(v1008);
                if v1009 == nil then
                    return false;
                else
                    return v1009:is_dormant();
                end;
            end, 
            get_active_weapon_index = function(v1010)
                local v1011 = entity.get(v1010);
                if v1011 == nil then
                    return nil;
                else
                    local v1012 = v1011:get_player_weapon();
                    if v1012 == nil then
                        return nil;
                    else
                        return v1012:get_weapon_index();
                    end;
                end;
            end, 
            get_tick_count = function()
                return globals.tickcount;
            end, 
            get_player_position = function(v1013)
                return entity.get(v1013):get_origin();
            end, 
            get_jmp_edx_addr = function()
                return jmp_edx_addr;
            end
        };
    end
};
local v1015 = nil;
if v1014[v48] ~= nil then
    v1015 = v1014[v48]();
    local v1016 = {};
    local function v1018()
        -- upvalues: v1016 (ref)
        for v1017 = 1, #v1016 do
            v1016[v1017]();
        end;
    end;
    local function v1020(v1019)
        -- upvalues: v1016 (ref)
        table.insert(v1016, v1019);
    end;
    v1015.set_shutdown_callback(v1018);
    local function v1023(v1021, v1022)
        return function(...)
            -- upvalues: v1021 (ref), v1022 (ref)
            return v1021(v1022, ...);
        end;
    end;
    local function v1029(v1024, v1025, v1026, v1027)
        -- upvalues: l_cast_0 (ref), v1015 (ref), v1023 (ref)
        local v1028 = l_cast_0("void***", v1015.create_interface(v1024, v1025)) or error(v1025 .. " is nil.");
        return v1023(l_cast_0(v1027, v1028[0][v1026]), v1028);
    end;
    local v1030 = l_typeof_0("void***");
    local function v1034(v1031, v1032, v1033)
        -- upvalues: l_cast_0 (ref), v1030 (ref)
        return l_cast_0(v1033, l_cast_0(v1030, v1031)[0][v1032]);
    end;
    local function _(v1035, v1036)
        -- upvalues: l_typeof_0 (ref), v1034 (ref)
        local v1037 = l_typeof_0(v1036);
        return function(v1038, ...)
            -- upvalues: v1034 (ref), v1035 (ref), v1037 (ref)
            return v1034(v1038, v1035, v1037)(v1038, ...);
        end;
    end;
    local v1040 = l_typeof_0("  struct {\n      uint64_t version; // 0x0\n      union {\n          int64_t   xuid;\n          struct {\n              uint32_t   xuid_low;\n              uint32_t   xuid_high;\n          };\n      };\n      char name[128]; // 0x10\n      int user_id; // 0x90\n      char guid[33];\n      uint32_t friends_id;\n      char friends_name[128];\n      bool fakeplayer;\n      bool hltv;\n      int customfiles[4];\n      unsigned char files_downloaded;\n  }\n");
    local v1041 = l_typeof_0("$[1]", v1040);
    local v1042 = l_typeof_0("$*", v1040);
    local v1043 = l_typeof_0("  struct {\n      uint32_t xuid_low;\n      uint32_t xuid_high;\n      uint32_t sequence_bytes;\n      uint32_t section_number;\n      uint32_t uncompressed_sample_offset;\n  }\n");
    local v1044 = l_typeof_0("$[1]", v1043);
    local v1045 = l_typeof_0("$*", v1043);
    local v1046 = l_typeof_0("  struct {\n      uint32_t section_number;\n      uint32_t sequence_bytes;\n      uint32_t uncompressed_sample_offset;\n      uint32_t xuid_low;\n      uint32_t xuid_high;\n  }\n");
    local v1047 = l_typeof_0("$[1]", v1046);
    local _ = l_typeof_0("$*", v1046);
    local v1049 = l_typeof_0("  struct {\n      char data[16];\n      uint32_t current_length;\n      uint32_t max_length;\n  }\n");
    local _ = l_typeof_0("$[1]", v1049);
    local _ = l_typeof_0("$*", v1049);
    local v1052 = l_typeof_0("  struct {\n      uint8_t data[20];\n  }\n");
    local _ = l_typeof_0("$[1]", v1052);
    local v1054 = l_typeof_0("$*", v1052);
    local v1055 = l_typeof_0("  struct {\n      char pad_0000[16];\n      uint32_t size;\n  }\n");
    local _ = l_typeof_0("$[1]", v1055);
    local v1057 = l_typeof_0("$*", v1055);
    local v1058 = l_typeof_0("  struct {\n      char pad_0000[8]; // 0x0000\n      int32_t client; // 0x0008\n      int32_t audible_mask; // 0x000C\n      uint32_t xuid_low; // 0x0010\n      uint32_t xuid_high; // 0x0014\n      $ voice_data; // 0x0018\n      int32_t proximity; // 0x001C\n      int32_t format; // 0x0020\n      int32_t sequence_bytes; // 0x0024\n      uint32_t section_number; // 0x0028\n      uint32_t uncompressed_sample_offset; // 0x002C\n      int32_t cached_size; //0x0030\n      uint32_t flags; //0x0034\n      int8_t no_stack_overflow[0xFF];\n  }\n", v1057);
    local _ = l_typeof_0("$[1]", v1058);
    local v1060 = l_typeof_0("$*", v1058);
    local v1061 = l_typeof_0("  struct {\n      uint32_t INetMessage_Vtable; //0x0000\n      char pad_0004[4]; //0x0004\n      uint32_t CCLCMsg_VoiceData_Vtable; //0x0008\n      char pad_000C[8]; //0x000C\n      void* data; //0x0014\n      uint32_t xuid_low;\n      uint32_t xuid_high;\n      int32_t format; //0x0020\n      int32_t sequence_bytes; //0x0024\n      uint32_t section_number; //0x0028\n      uint32_t uncompressed_sample_offset; //0x002C\n      int32_t cached_size; //0x0030\n\n      uint32_t flags; //0x0034\n      uint8_t no_stack_overflow[0xFF];\n  }\n");
    local _ = l_typeof_0("$[1]", v1061);
    local _ = l_typeof_0("$*", v1061);
    local v1064 = l_typeof_0("  struct {\n      uint16_t id; // 0x0\n      uint8_t user_id; // 0x2\n      uint8_t weapon_id; // 0x3\n      uint32_t server_tick; // 0x4\n      float x; // 0x8\n      float y; // 0xC\n      float z; // 0x10\n  }\n");
    local _ = l_typeof_0("$[1]", v1064);
    local v1066 = l_typeof_0("$*", v1064);
    local v1067 = l_typeof_0("  struct {\n      uint32_t identifier;\n      int32_t entityId;\n      int32_t x;\n      int32_t y;\n      int32_t z;\n  }\n");
    local _ = l_typeof_0("$[1]", v1067);
    local v1069 = l_typeof_0("$*", v1067);
    local v1070 = l_typeof_0("  struct {\n      uint32_t id;\n      uint8_t entity_id;\n      uint8_t tick_count;\n      int16_t x;\n      int16_t y;\n      int16_t z;\n      uint8_t pad[9];\n  }\n");
    local v1071 = l_typeof_0("$[1]", v1070);
    local v1072 = l_typeof_0("$*", v1070);
    local v1073 = l_typeof_0("  struct {\n      char pad_0000[8]; //0x0000\n      uint8_t keyp1; // 0x8\n      uint8_t eidp1; // 0x9\n      uint8_t mutualkey; // 0xA (10)\n      uint8_t loc_xor_key; // 0xB (11)\n      uint16_t xored_x; // 0xC (12)\n      uint16_t xored_y; // 0xE (14)\n      uint16_t xored_z; // 0x10 (16)\n      uint8_t keyp2; // 0x12 (18)\n  }\n");
    local v1074 = l_typeof_0("$[1]", v1073);
    local v1075 = l_typeof_0("$*", v1073);
    local v1076 = l_typeof_0("  struct {\n      uint8_t entity;\n      float x;\n      float y;\n      float z;\n      uint8_t key;\n  }\n");
    local _ = l_typeof_0("$[1]", v1076);
    local _ = l_typeof_0("$*", v1076);
    local v1079 = l_typeof_0("  struct {\n      uint8_t entity;\n      uint32_t tickcount;\n      int16_t x; // these are actually supposed to be floats, but i can't care enough (we'll just send integers)\n      int16_t y;\n      int16_t z;\n  }\n");
    local _ = l_typeof_0("$[1]", v1079);
    local _ = l_typeof_0("$*", v1079);
    local v1082 = l_typeof_0("  struct {\n      uint32_t id; // 0x0\n      uint8_t entity; // 0x4\n      uint8_t health; // 0x5\n      int16_t x; // 0x6\n      int16_t y; // 0x8\n      int16_t z; // 0xA\n      uint8_t entity_again; // 0xC\n      char pad_000D[3]; // 0xD\n      uint32_t second_id; // 0x10\n  }\n");
    local _ = l_typeof_0("$[1]", v1082);
    local v1084 = l_typeof_0("$*", v1082);
    local v1085 = l_typeof_0("  struct {\n      char legion[6];\n      char random[14];\n  }\n");
    local _ = l_typeof_0("$[1]", v1085);
    local _ = l_typeof_0("$*", v1085);
    local v1088 = l_typeof_0("  struct {\n      uint8_t legion_xor[6];\n      char random[14];\n  }\n");
    local v1089 = l_typeof_0("$[1]", v1088);
    local v1090 = l_typeof_0("$*", v1088);
    local v1091 = l_typeof_0("  struct {\n      uint16_t m_key;\n      int t;\n      char nothing[14];\n  }\n");
    local v1092 = l_typeof_0("$[1]", v1091);
    local v1093 = l_typeof_0("$*", v1091);
    local v1094 = l_typeof_0("  struct{\n      uint8_t msg_type;\n      uint8_t cheat_id;\n      uint16_t base_id;//xuid low end\n      uint8_t user_id; // xuid high\n      int16_t x;\n      int16_t y;\n      int16_t z;\n      int8_t health;\n      uint32_t tick;\n\n      struct {\n          uint16_t id;\n          uint8_t crash;\n          uint8_t boss;\n      } user_info;\n  }\n");
    local _ = l_typeof_0("$[1]", v1094);
    local _ = l_typeof_0("$*", v1094);
    local v1097 = l_typeof_0("  struct {\n      uint32_t xuid_low;\n      uint32_t xuid_high;\n      uint32_t section_number;\n      uint32_t sequence_bytes;\n      uint32_t uncompressed_sample_offset;\n  }\n");
    local _ = l_typeof_0("$[1]", v1097);
    local v1099 = l_typeof_0("$*", v1097);
    local v1100 = l_typeof_0("  struct {\n      uint16_t tick_count;\n      char name[3];\n      uint16_t tick_count_shifted;\n  }\n");
    local _ = l_typeof_0("$[1]", v1100);
    local v1102 = l_typeof_0("$*", v1100);
    local v1103 = v1029("engine.dll", "VEngineClient014", 8, l_typeof_0("bool(__thiscall*)(void*, int, $)", v1042));
    local v1104 = v1029("engine.dll", "VEngineClient014", 78, "void*(__thiscall*)(void*)");
    local v1105 = l_new_0(v1041);
    local function v1108(v1106)
        -- upvalues: v1103 (ref), v1105 (ref), l_ffi_0 (ref)
        if not v1103(v1106, v1105) then
            return nil;
        else
            local v1107 = v1105[0];
            return {
                xuid = tonumber(v1107.xuid), 
                xuid_low = tonumber(v1107.xuid_low), 
                xuid_high = tonumber(v1107.xuid_high), 
                name = l_ffi_0.string(v1107.name), 
                user_id = tonumber(v1107.user_id), 
                guid = l_ffi_0.string(v1107.guid)
            };
        end;
    end;
    local v2266 = (function()
        -- upvalues: l_bit_0 (ref)
        local v1109 = false;
        local v1110 = table.unpack or unpack;
        local l_concat_1 = table.concat;
        local l_byte_1 = string.byte;
        local l_char_1 = string.char;
        local l_rep_1 = string.rep;
        local l_sub_1 = string.sub;
        local l_gsub_1 = string.gsub;
        local l_gmatch_0 = string.gmatch;
        local l_format_1 = string.format;
        local l_floor_1 = math.floor;
        local l_ceil_0 = math.ceil;
        local l_min_0 = math.min;
        local l_max_0 = math.max;
        local l_tonumber_1 = tonumber;
        local l_type_1 = type;
        local _ = math.huge;
        local function v1134(v1126)
            local v1127 = 0;
            local l_v1126_0 = v1126;
            local l_v1126_1 = v1126;
            local v1130 = nil;
            while true do
                local v1131 = v1127 + 1;
                local l_l_v1126_0_0 = l_v1126_0;
                local v1133 = l_v1126_0 + l_v1126_0 + 1;
                l_v1126_1 = l_v1126_1 + l_v1126_1 + v1127 % 2;
                l_v1126_0 = v1133;
                v1130 = l_l_v1126_0_0;
                v1127 = v1131;
                if v1127 > 256 or l_v1126_0 - (l_v1126_0 - 1) ~= 1 or l_v1126_1 - (l_v1126_1 - 1) ~= 1 or l_v1126_0 == l_v1126_1 then
                    return v1127, false;
                elseif l_v1126_0 == v1130 then
                    return v1127, true;
                end;
            end;
        end;
        local v1135 = 0.6666666666666666;
        local v1136 = v1135 * 5 > 3 and v1135 * 4 < 3 and v1134(1) >= 53;
        assert(v1136, "at least 53-bit floating point numbers are required");
        local v1137, v1138 = v1134(1);
        local v1139 = v1138 and v1137 == 64;
        local v1140 = v1138 and v1137 == 32;
        assert(v1139 or v1140 or not v1138, "Lua integers must be either 32-bit or 64-bit");
        local v1141 = true;
        local v1142 = nil;
        local v1143 = nil;
        local v1144 = nil;
        local v1145 = nil;
        local v1146 = nil;
        if v1141 then
            v1145 = l_bit_0;
            v1146 = "bit";
            local v1147 = true;
            local l_v1144_0 = v1144;
            if v1147 then
                v1144 = l_v1144_0;
            end;
            v1142 = false;
            v1143 = l_type_1(jit) == "table" and jit.arch or v1144 and v1144.arch or nil;
        else
            local l_ipairs_0 = ipairs;
            local v1150 = _VERSION == "Lua 5.2" and {
                [1] = "bit32", 
                [2] = "bit"
            } or {
                [1] = "bit", 
                [2] = "bit32"
            };
            for _, v1152 in l_ipairs_0(v1150) do
                if l_type_1(_G[v1152]) == "table" and _G[v1152].bxor then
                    v1145 = _G[v1152];
                    v1146 = v1152;
                    break;
                end;
            end;
        end;
        if v1109 then
            print("Abilities:");
            print("   Lua version:               " .. (v1141 and "LuaJIT " .. (v1142 and "2.1 " or "2.0 ") .. (not v1143 and "" or v1143) .. (v1144 and " with FFI" or " without FFI") or _VERSION));
            print("   Integer bitwise operators: " .. (v1139 and "int64" or v1140 and "int32" or "no"));
            print("   32-bit bitwise library:    " .. (not v1146 and "not found" or v1146));
        end;
        local v1153 = nil;
        local v1154 = nil;
        if v1141 and v1144 then
            v1153 = "Using 'ffi' library of LuaJIT";
            v1154 = "FFI";
        elseif v1141 then
            v1153 = "Using special code for sandboxed LuaJIT (no FFI)";
            v1154 = "LJ";
        elseif v1139 then
            v1153 = "Using native int64 bitwise operators";
            v1154 = "INT64";
        elseif v1140 then
            v1153 = "Using native int32 bitwise operators";
            v1154 = "INT32";
        elseif v1146 then
            v1153 = "Using '" .. v1146 .. "' library";
            v1154 = "LIB32";
        else
            v1153 = "Emulating bitwise operators using look-up table";
            v1154 = "EMUL";
        end;
        if v1109 then
            print("Implementation selected:");
            print("   " .. v1153);
        end;
        local v1155 = nil;
        local v1156 = nil;
        local v1157 = nil;
        local v1158 = nil;
        local v1159 = nil;
        local v1160 = nil;
        local v1161 = nil;
        local v1162 = nil;
        local v1163 = nil;
        local v1164 = nil;
        local v1165 = nil;
        if v1154 == "FFI" or v1154 == "LJ" or v1154 == "LIB32" then
            v1155 = v1145.band;
            v1156 = v1145.bor;
            v1157 = v1145.bxor;
            v1158 = v1145.lshift;
            v1159 = v1145.rshift;
            v1160 = v1145.rol or v1145.lrotate;
            v1161 = v1145.ror or v1145.rrotate;
            v1162 = v1145.bnot;
            v1163 = v1145.tobit;
            v1164 = v1145.tohex;
            assert(v1155 and v1156 and v1157 and v1158 and v1159 and v1160 and v1161 and v1162, "Library '" .. v1146 .. "' is incomplete");
            v1165 = v1157;
        end;
        if not v1164 then
            v1164 = pcall(l_format_1, "%x", 2147483648) and function(v1166)
                -- upvalues: l_format_1 (ref)
                return l_format_1("%08x", v1166 % 4294967296);
            end or function(v1167)
                -- upvalues: l_format_1 (ref)
                return l_format_1("%08x", (v1167 + 2147483648) % 4294967296 - 2147483648);
            end;
        end;
        local function v1170(v1168, v1169)
            -- upvalues: v1157 (ref)
            return v1157(v1168, v1169 or 2779096485) % 4294967296;
        end;
        local function v1171()
            return {
                [1] = 0, 
                [2] = 0, 
                [3] = 0, 
                [4] = 0, 
                [5] = 0, 
                [6] = 0, 
                [7] = 0, 
                [8] = 0, 
                [9] = 0, 
                [10] = 0, 
                [11] = 0, 
                [12] = 0, 
                [13] = 0, 
                [14] = 0, 
                [15] = 0, 
                [16] = 0, 
                [17] = 0, 
                [18] = 0, 
                [19] = 0, 
                [20] = 0, 
                [21] = 0, 
                [22] = 0, 
                [23] = 0, 
                [24] = 0, 
                [25] = 0
            };
        end;
        local v1172 = nil;
        local v1173 = nil;
        local v1174 = nil;
        local v1175 = nil;
        local v1176 = nil;
        local v1177 = nil;
        local v1178 = nil;
        local v1179 = nil;
        local v1180 = {};
        local v1181 = {};
        local v1182 = {};
        local v1183 = {};
        local v1184 = {};
        local v1185 = {};
        local v1186 = {
            [224] = {}, 
            [256] = v1183
        };
        local v1187 = {
            [384] = {}, 
            [512] = v1182
        };
        local v1188 = {
            [384] = {}, 
            [512] = v1183
        };
        local v1189 = {};
        local _ = {
            [1] = 1732584193, 
            [2] = 4023233417, 
            [3] = 2562383102, 
            [4] = 271733878, 
            [5] = 3285377520
        };
        local _ = {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0, 
            [5] = 0, 
            [6] = 0, 
            [7] = 0, 
            [8] = 0, 
            [9] = 28, 
            [10] = 25, 
            [11] = 26, 
            [12] = 27, 
            [13] = 0, 
            [14] = 0, 
            [15] = 10, 
            [16] = 9, 
            [17] = 11, 
            [18] = 12, 
            [19] = 0, 
            [20] = 15, 
            [21] = 16, 
            [22] = 17, 
            [23] = 18, 
            [24] = 0, 
            [25] = 20, 
            [26] = 22, 
            [27] = 23, 
            [28] = 21
        };
        local v1192 = nil;
        local v1193 = nil;
        local v1194 = {};
        local l_v1194_0 = v1194;
        local l_v1194_1 = v1194;
        local v1197 = {};
        local v1198 = 4294967296;
        local v1199 = 0;
        local v1200 = 0;
        local v1201 = {
            [1] = {
                [1] = 1, 
                [2] = 2, 
                [3] = 3, 
                [4] = 4, 
                [5] = 5, 
                [6] = 6, 
                [7] = 7, 
                [8] = 8, 
                [9] = 9, 
                [10] = 10, 
                [11] = 11, 
                [12] = 12, 
                [13] = 13, 
                [14] = 14, 
                [15] = 15, 
                [16] = 16
            }, 
            [2] = {
                [1] = 15, 
                [2] = 11, 
                [3] = 5, 
                [4] = 9, 
                [5] = 10, 
                [6] = 16, 
                [7] = 14, 
                [8] = 7, 
                [9] = 2, 
                [10] = 13, 
                [11] = 1, 
                [12] = 3, 
                [13] = 12, 
                [14] = 8, 
                [15] = 6, 
                [16] = 4
            }, 
            [3] = {
                [1] = 12, 
                [2] = 9, 
                [3] = 13, 
                [4] = 1, 
                [5] = 6, 
                [6] = 3, 
                [7] = 16, 
                [8] = 14, 
                [9] = 11, 
                [10] = 15, 
                [11] = 4, 
                [12] = 7, 
                [13] = 8, 
                [14] = 2, 
                [15] = 10, 
                [16] = 5
            }, 
            [4] = {
                [1] = 8, 
                [2] = 10, 
                [3] = 4, 
                [4] = 2, 
                [5] = 14, 
                [6] = 13, 
                [7] = 12, 
                [8] = 15, 
                [9] = 3, 
                [10] = 7, 
                [11] = 6, 
                [12] = 11, 
                [13] = 5, 
                [14] = 1, 
                [15] = 16, 
                [16] = 9
            }, 
            [5] = {
                [1] = 10, 
                [2] = 1, 
                [3] = 6, 
                [4] = 8, 
                [5] = 3, 
                [6] = 5, 
                [7] = 11, 
                [8] = 16, 
                [9] = 15, 
                [10] = 2, 
                [11] = 12, 
                [12] = 13, 
                [13] = 7, 
                [14] = 9, 
                [15] = 4, 
                [16] = 14
            }, 
            [6] = {
                [1] = 3, 
                [2] = 13, 
                [3] = 7, 
                [4] = 11, 
                [5] = 1, 
                [6] = 12, 
                [7] = 9, 
                [8] = 4, 
                [9] = 5, 
                [10] = 14, 
                [11] = 8, 
                [12] = 6, 
                [13] = 16, 
                [14] = 15, 
                [15] = 2, 
                [16] = 10
            }, 
            [7] = {
                [1] = 13, 
                [2] = 6, 
                [3] = 2, 
                [4] = 16, 
                [5] = 15, 
                [6] = 14, 
                [7] = 5, 
                [8] = 11, 
                [9] = 1, 
                [10] = 8, 
                [11] = 7, 
                [12] = 4, 
                [13] = 10, 
                [14] = 3, 
                [15] = 9, 
                [16] = 12
            }, 
            [8] = {
                [1] = 14, 
                [2] = 12, 
                [3] = 8, 
                [4] = 15, 
                [5] = 13, 
                [6] = 2, 
                [7] = 4, 
                [8] = 10, 
                [9] = 6, 
                [10] = 1, 
                [11] = 16, 
                [12] = 5, 
                [13] = 9, 
                [14] = 7, 
                [15] = 3, 
                [16] = 11
            }, 
            [9] = {
                [1] = 7, 
                [2] = 16, 
                [3] = 15, 
                [4] = 10, 
                [5] = 12, 
                [6] = 4, 
                [7] = 1, 
                [8] = 9, 
                [9] = 13, 
                [10] = 3, 
                [11] = 14, 
                [12] = 8, 
                [13] = 2, 
                [14] = 5, 
                [15] = 11, 
                [16] = 6
            }, 
            [10] = {
                [1] = 11, 
                [2] = 3, 
                [3] = 9, 
                [4] = 5, 
                [5] = 8, 
                [6] = 7, 
                [7] = 2, 
                [8] = 6, 
                [9] = 16, 
                [10] = 12, 
                [11] = 10, 
                [12] = 15, 
                [13] = 4, 
                [14] = 13, 
                [15] = 14, 
                [16] = 1
            }
        };
        local v1202 = v1201[1];
        v1201[12] = v1201[2];
        v1201[11] = v1202;
        v1202 = {
            [1] = 1, 
            [2] = 3, 
            [3] = 4, 
            [4] = 11, 
            [5] = 13, 
            [6] = 10, 
            [7] = 12, 
            [8] = 6, 
            [9] = 1, 
            [10] = 3, 
            [11] = 4, 
            [12] = 11, 
            [13] = 13, 
            [14] = 10, 
            [15] = 2, 
            [16] = 7, 
            [17] = 5, 
            [18] = 8, 
            [19] = 14, 
            [20] = 15, 
            [21] = 16, 
            [22] = 9, 
            [23] = 2, 
            [24] = 7, 
            [25] = 5, 
            [26] = 8, 
            [27] = 14, 
            [28] = 15
        };
        local _ = function(v1203)
            -- upvalues: l_rep_1 (ref)
            local v1204 = {};
            for _, v1206 in ipairs({
                [1] = 1, 
                [2] = 9, 
                [3] = 13, 
                [4] = 17, 
                [5] = 18, 
                [6] = 21
            }) do
                v1204[v1206] = "<" .. l_rep_1(v1203, v1206);
            end;
            return v1204;
        end;
        if v1154 == "FFI" then
            local v1208 = v1144.new("int32_t[?]", 80);
            l_v1194_1 = v1208;
            v1197 = v1144.new("int32_t[?]", 16);
            v1202 = v1144.new("uint8_t[?]", #v1202 + 1, 0, v1110(v1202));
            for v1209 = 1, 10 do
                v1201[v1209] = v1144.new("uint8_t[?]", #v1201[v1209] + 1, 0, v1110(v1201[v1209]));
            end;
            local v1210 = v1201[1];
            v1201[12] = v1201[2];
            v1201[11] = v1210;
            do
                local l_v1208_0, l_v1210_0 = v1208, v1210;
                v1172 = function(v1213, v1214, v1215, v1216)
                    -- upvalues: l_v1208_0 (ref), v1181 (ref), l_byte_1 (ref), v1156 (ref), v1158 (ref), v1163 (ref), v1157 (ref), v1161 (ref), v1160 (ref), v1159 (ref), v1155 (ref)
                    local l_l_v1208_0_0 = l_v1208_0;
                    local l_v1181_0 = v1181;
                    for v1219 = v1215, v1215 + v1216 - 1, 64 do
                        for v1220 = 0, 15 do
                            v1219 = v1219 + 4;
                            local v1221, v1222, v1223, v1224 = l_byte_1(v1214, v1219 - 3, v1219);
                            l_l_v1208_0_0[v1220] = v1156(v1158(v1221, 24), v1158(v1222, 16), v1158(v1223, 8), v1224);
                        end;
                        for v1225 = 16, 63 do
                            local v1226 = l_l_v1208_0_0[v1225 - 15];
                            local v1227 = l_l_v1208_0_0[v1225 - 2];
                            l_l_v1208_0_0[v1225] = v1163(v1157(v1161(v1226, 7), v1160(v1226, 14), v1159(v1226, 3)) + v1157(v1160(v1227, 15), v1160(v1227, 13), v1159(v1227, 10)) + l_l_v1208_0_0[v1225 - 7] + l_l_v1208_0_0[v1225 - 16]);
                        end;
                        local v1228 = v1213[1];
                        local v1229 = v1213[2];
                        local v1230 = v1213[3];
                        local v1231 = v1213[4];
                        local v1232 = v1213[5];
                        local v1233 = v1213[6];
                        local v1234 = v1213[7];
                        local v1235 = v1213[8];
                        for v1236 = 0, 63, 8 do
                            local v1237 = v1163(v1157(v1234, v1155(v1232, v1157(v1233, v1234))) + v1157(v1161(v1232, 6), v1161(v1232, 11), v1160(v1232, 7)) + (l_l_v1208_0_0[v1236] + l_v1181_0[v1236 + 1] + v1235));
                            local l_v1234_0 = v1234;
                            local l_v1233_0 = v1233;
                            local l_v1232_0 = v1232;
                            v1232 = v1163(v1231 + v1237);
                            v1233 = l_v1232_0;
                            v1234 = l_v1233_0;
                            v1235 = l_v1234_0;
                            l_v1234_0 = v1230;
                            l_v1233_0 = v1229;
                            l_v1232_0 = v1228;
                            v1228 = v1163(v1157(v1155(v1228, v1157(v1229, v1230)), v1155(v1229, v1230)) + v1157(v1161(v1228, 2), v1161(v1228, 13), v1160(v1228, 10)) + v1237);
                            v1229 = l_v1232_0;
                            v1230 = l_v1233_0;
                            v1231 = l_v1234_0;
                            v1237 = v1163(v1157(v1234, v1155(v1232, v1157(v1233, v1234))) + v1157(v1161(v1232, 6), v1161(v1232, 11), v1160(v1232, 7)) + (l_l_v1208_0_0[v1236 + 1] + l_v1181_0[v1236 + 2] + v1235));
                            l_v1234_0 = v1234;
                            l_v1233_0 = v1233;
                            l_v1232_0 = v1232;
                            v1232 = v1163(v1231 + v1237);
                            v1233 = l_v1232_0;
                            v1234 = l_v1233_0;
                            v1235 = l_v1234_0;
                            l_v1234_0 = v1230;
                            l_v1233_0 = v1229;
                            l_v1232_0 = v1228;
                            v1228 = v1163(v1157(v1155(v1228, v1157(v1229, v1230)), v1155(v1229, v1230)) + v1157(v1161(v1228, 2), v1161(v1228, 13), v1160(v1228, 10)) + v1237);
                            v1229 = l_v1232_0;
                            v1230 = l_v1233_0;
                            v1231 = l_v1234_0;
                            v1237 = v1163(v1157(v1234, v1155(v1232, v1157(v1233, v1234))) + v1157(v1161(v1232, 6), v1161(v1232, 11), v1160(v1232, 7)) + (l_l_v1208_0_0[v1236 + 2] + l_v1181_0[v1236 + 3] + v1235));
                            l_v1234_0 = v1234;
                            l_v1233_0 = v1233;
                            l_v1232_0 = v1232;
                            v1232 = v1163(v1231 + v1237);
                            v1233 = l_v1232_0;
                            v1234 = l_v1233_0;
                            v1235 = l_v1234_0;
                            l_v1234_0 = v1230;
                            l_v1233_0 = v1229;
                            l_v1232_0 = v1228;
                            v1228 = v1163(v1157(v1155(v1228, v1157(v1229, v1230)), v1155(v1229, v1230)) + v1157(v1161(v1228, 2), v1161(v1228, 13), v1160(v1228, 10)) + v1237);
                            v1229 = l_v1232_0;
                            v1230 = l_v1233_0;
                            v1231 = l_v1234_0;
                            v1237 = v1163(v1157(v1234, v1155(v1232, v1157(v1233, v1234))) + v1157(v1161(v1232, 6), v1161(v1232, 11), v1160(v1232, 7)) + (l_l_v1208_0_0[v1236 + 3] + l_v1181_0[v1236 + 4] + v1235));
                            l_v1234_0 = v1234;
                            l_v1233_0 = v1233;
                            l_v1232_0 = v1232;
                            v1232 = v1163(v1231 + v1237);
                            v1233 = l_v1232_0;
                            v1234 = l_v1233_0;
                            v1235 = l_v1234_0;
                            l_v1234_0 = v1230;
                            l_v1233_0 = v1229;
                            l_v1232_0 = v1228;
                            v1228 = v1163(v1157(v1155(v1228, v1157(v1229, v1230)), v1155(v1229, v1230)) + v1157(v1161(v1228, 2), v1161(v1228, 13), v1160(v1228, 10)) + v1237);
                            v1229 = l_v1232_0;
                            v1230 = l_v1233_0;
                            v1231 = l_v1234_0;
                            v1237 = v1163(v1157(v1234, v1155(v1232, v1157(v1233, v1234))) + v1157(v1161(v1232, 6), v1161(v1232, 11), v1160(v1232, 7)) + (l_l_v1208_0_0[v1236 + 4] + l_v1181_0[v1236 + 5] + v1235));
                            l_v1234_0 = v1234;
                            l_v1233_0 = v1233;
                            l_v1232_0 = v1232;
                            v1232 = v1163(v1231 + v1237);
                            v1233 = l_v1232_0;
                            v1234 = l_v1233_0;
                            v1235 = l_v1234_0;
                            l_v1234_0 = v1230;
                            l_v1233_0 = v1229;
                            l_v1232_0 = v1228;
                            v1228 = v1163(v1157(v1155(v1228, v1157(v1229, v1230)), v1155(v1229, v1230)) + v1157(v1161(v1228, 2), v1161(v1228, 13), v1160(v1228, 10)) + v1237);
                            v1229 = l_v1232_0;
                            v1230 = l_v1233_0;
                            v1231 = l_v1234_0;
                            v1237 = v1163(v1157(v1234, v1155(v1232, v1157(v1233, v1234))) + v1157(v1161(v1232, 6), v1161(v1232, 11), v1160(v1232, 7)) + (l_l_v1208_0_0[v1236 + 5] + l_v1181_0[v1236 + 6] + v1235));
                            l_v1234_0 = v1234;
                            l_v1233_0 = v1233;
                            l_v1232_0 = v1232;
                            v1232 = v1163(v1231 + v1237);
                            v1233 = l_v1232_0;
                            v1234 = l_v1233_0;
                            v1235 = l_v1234_0;
                            l_v1234_0 = v1230;
                            l_v1233_0 = v1229;
                            l_v1232_0 = v1228;
                            v1228 = v1163(v1157(v1155(v1228, v1157(v1229, v1230)), v1155(v1229, v1230)) + v1157(v1161(v1228, 2), v1161(v1228, 13), v1160(v1228, 10)) + v1237);
                            v1229 = l_v1232_0;
                            v1230 = l_v1233_0;
                            v1231 = l_v1234_0;
                            v1237 = v1163(v1157(v1234, v1155(v1232, v1157(v1233, v1234))) + v1157(v1161(v1232, 6), v1161(v1232, 11), v1160(v1232, 7)) + (l_l_v1208_0_0[v1236 + 6] + l_v1181_0[v1236 + 7] + v1235));
                            l_v1234_0 = v1234;
                            l_v1233_0 = v1233;
                            l_v1232_0 = v1232;
                            v1232 = v1163(v1231 + v1237);
                            v1233 = l_v1232_0;
                            v1234 = l_v1233_0;
                            v1235 = l_v1234_0;
                            l_v1234_0 = v1230;
                            l_v1233_0 = v1229;
                            l_v1232_0 = v1228;
                            v1228 = v1163(v1157(v1155(v1228, v1157(v1229, v1230)), v1155(v1229, v1230)) + v1157(v1161(v1228, 2), v1161(v1228, 13), v1160(v1228, 10)) + v1237);
                            v1229 = l_v1232_0;
                            v1230 = l_v1233_0;
                            v1231 = l_v1234_0;
                            v1237 = v1163(v1157(v1234, v1155(v1232, v1157(v1233, v1234))) + v1157(v1161(v1232, 6), v1161(v1232, 11), v1160(v1232, 7)) + (l_l_v1208_0_0[v1236 + 7] + l_v1181_0[v1236 + 8] + v1235));
                            l_v1234_0 = v1234;
                            l_v1233_0 = v1233;
                            l_v1232_0 = v1232;
                            v1232 = v1163(v1231 + v1237);
                            v1233 = l_v1232_0;
                            v1234 = l_v1233_0;
                            v1235 = l_v1234_0;
                            l_v1234_0 = v1230;
                            l_v1233_0 = v1229;
                            l_v1232_0 = v1228;
                            v1228 = v1163(v1157(v1155(v1228, v1157(v1229, v1230)), v1155(v1229, v1230)) + v1157(v1161(v1228, 2), v1161(v1228, 13), v1160(v1228, 10)) + v1237);
                            v1229 = l_v1232_0;
                            v1230 = l_v1233_0;
                            v1231 = l_v1234_0;
                        end;
                        local v1241 = v1163(v1228 + v1213[1]);
                        local v1242 = v1163(v1229 + v1213[2]);
                        local v1243 = v1163(v1230 + v1213[3]);
                        v1213[4] = v1163(v1231 + v1213[4]);
                        v1213[3] = v1243;
                        v1213[2] = v1242;
                        v1213[1] = v1241;
                        v1241 = v1163(v1232 + v1213[5]);
                        v1242 = v1163(v1233 + v1213[6]);
                        v1243 = v1163(v1234 + v1213[7]);
                        v1213[8] = v1163(v1235 + v1213[8]);
                        v1213[7] = v1243;
                        v1213[6] = v1242;
                        v1213[5] = v1241;
                    end;
                end;
                l_v1210_0 = v1144.new("int64_t[?]", 80);
                l_v1194_0 = l_v1210_0;
                local v1244 = v1144.typeof("int64_t");
                local v1245 = v1144.typeof("int32_t");
                local v1246 = v1144.typeof("uint32_t");
                v1199 = v1244(4294967296);
                if v1142 then
                    local l_v1155_0 = v1155;
                    local l_v1156_0 = v1156;
                    local l_v1157_0 = v1157;
                    local l_v1162_0 = v1162;
                    local _ = v1158;
                    local l_v1159_0 = v1159;
                    local l_v1160_0 = v1160;
                    local l_v1161_0 = v1161;
                    v1192 = v1164;
                    local v1255 = v1144.new("int64_t[?]", 16);
                    local l_l_v1194_0_0 = l_v1194_0;
                    do
                        local l_l_v1155_0_0, l_l_v1156_0_0, l_l_v1157_0_0, l_l_v1162_0_0, l_l_v1159_0_0, l_l_v1160_0_0, l_l_v1161_0_0, l_v1255_0, l_l_l_v1194_0_0_0 = l_v1155_0, l_v1156_0, l_v1157_0, l_v1162_0, l_v1159_0, l_v1160_0, l_v1161_0, v1255, l_l_v1194_0_0;
                        do
                            local l_l_v1255_0_0, l_l_l_l_v1194_0_0_0_0 = l_v1255_0, l_l_l_v1194_0_0_0;
                            local function v1285(v1268, v1269, v1270, v1271, v1272, v1273)
                                -- upvalues: l_l_v1255_0_0 (ref), l_l_l_l_v1194_0_0_0_0 (ref), l_l_v1161_0_0 (ref), l_l_v1157_0_0 (ref), l_l_v1160_0_0 (ref)
                                local v1274 = l_l_v1255_0_0[v1268];
                                local v1275 = l_l_v1255_0_0[v1269];
                                local v1276 = l_l_v1255_0_0[v1270];
                                local v1277 = l_l_v1255_0_0[v1271];
                                v1274 = l_l_l_l_v1194_0_0_0_0[v1272] + (v1274 + v1275);
                                v1277 = l_l_v1161_0_0(l_l_v1157_0_0(v1277, v1274), 32);
                                v1276 = v1276 + v1277;
                                v1275 = l_l_v1161_0_0(l_l_v1157_0_0(v1275, v1276), 24);
                                v1274 = l_l_l_l_v1194_0_0_0_0[v1273] + (v1274 + v1275);
                                v1277 = l_l_v1161_0_0(l_l_v1157_0_0(v1277, v1274), 16);
                                v1276 = v1276 + v1277;
                                v1275 = l_l_v1160_0_0(l_l_v1157_0_0(v1275, v1276), 1);
                                local l_l_l_v1255_0_0_0 = l_l_v1255_0_0;
                                local l_l_l_v1255_0_0_1 = l_l_v1255_0_0;
                                local l_l_l_v1255_0_0_2 = l_l_v1255_0_0;
                                local l_l_l_v1255_0_0_3 = l_l_v1255_0_0;
                                local l_v1274_0 = v1274;
                                local l_v1275_0 = v1275;
                                local l_v1276_0 = v1276;
                                l_l_l_v1255_0_0_3[v1271] = v1277;
                                l_l_l_v1255_0_0_2[v1270] = l_v1276_0;
                                l_l_l_v1255_0_0_1[v1269] = l_v1275_0;
                                l_l_l_v1255_0_0_0[v1268] = l_v1274_0;
                            end;
                            v1178 = function(v1286, _, v1288, v1289, v1290, v1291, v1292, v1293)
                                -- upvalues: l_byte_1 (ref), l_l_l_l_v1194_0_0_0_0 (ref), l_l_v1157_0_0 (ref), v1156 (ref), v1158 (ref), v1244 (ref), v1246 (ref), v1245 (ref), l_l_v1255_0_0 (ref), v1182 (ref), l_l_v1162_0_0 (ref), v1201 (ref), v1285 (ref)
                                local v1294 = v1286[1];
                                local v1295 = v1286[2];
                                local v1296 = v1286[3];
                                local v1297 = v1286[4];
                                local v1298 = v1286[5];
                                local v1299 = v1286[6];
                                local v1300 = v1286[7];
                                local v1301 = v1286[8];
                                for v1302 = v1289, v1289 + v1290 - 1, 128 do
                                    if v1288 then
                                        for v1303 = 1, 16 do
                                            v1302 = v1302 + 8;
                                            local v1304, v1305, v1306, v1307, v1308, v1309, v1310, v1311 = l_byte_1(v1288, v1302 - 7, v1302);
                                            l_l_l_l_v1194_0_0_0_0[v1303] = l_l_v1157_0_0(v1156(v1158(v1311, 24), v1158(v1310, 16), v1158(v1309, 8), v1308) * v1244(4294967296), v1246(v1245(v1156(v1158(v1307, 24), v1158(v1306, 16), v1158(v1305, 8), v1304))));
                                        end;
                                    end;
                                    local l_l_l_v1255_0_0_4 = l_l_v1255_0_0;
                                    local l_l_l_v1255_0_0_5 = l_l_v1255_0_0;
                                    local l_l_l_v1255_0_0_6 = l_l_v1255_0_0;
                                    local l_l_l_v1255_0_0_7 = l_l_v1255_0_0;
                                    local l_l_l_v1255_0_0_8 = l_l_v1255_0_0;
                                    local l_l_l_v1255_0_0_9 = l_l_v1255_0_0;
                                    local l_l_l_v1255_0_0_10 = l_l_v1255_0_0;
                                    local l_l_l_v1255_0_0_11 = l_l_v1255_0_0;
                                    local l_v1294_0 = v1294;
                                    local l_v1295_0 = v1295;
                                    local l_v1296_0 = v1296;
                                    local l_v1297_0 = v1297;
                                    local l_v1298_0 = v1298;
                                    local l_v1299_0 = v1299;
                                    local l_v1300_0 = v1300;
                                    l_l_l_v1255_0_0_11[7] = v1301;
                                    l_l_l_v1255_0_0_10[6] = l_v1300_0;
                                    l_l_l_v1255_0_0_9[5] = l_v1299_0;
                                    l_l_l_v1255_0_0_8[4] = l_v1298_0;
                                    l_l_l_v1255_0_0_7[3] = l_v1297_0;
                                    l_l_l_v1255_0_0_6[2] = l_v1296_0;
                                    l_l_l_v1255_0_0_5[1] = l_v1295_0;
                                    l_l_l_v1255_0_0_4[0] = l_v1294_0;
                                    l_l_l_v1255_0_0_4 = l_l_v1255_0_0;
                                    l_l_l_v1255_0_0_5 = l_l_v1255_0_0;
                                    l_l_l_v1255_0_0_6 = l_l_v1255_0_0;
                                    l_l_l_v1255_0_0_7 = l_l_v1255_0_0;
                                    l_l_l_v1255_0_0_8 = l_l_v1255_0_0;
                                    l_l_l_v1255_0_0_9 = l_l_v1255_0_0;
                                    l_l_l_v1255_0_0_10 = l_l_v1255_0_0;
                                    l_l_l_v1255_0_0_11 = v1182[1];
                                    l_v1294_0 = v1182[2];
                                    l_v1295_0 = v1182[3];
                                    l_v1296_0 = v1182[4];
                                    l_v1297_0 = v1182[6];
                                    l_v1298_0 = v1182[7];
                                    l_l_l_v1255_0_0_10[15] = v1182[8];
                                    l_l_l_v1255_0_0_9[14] = l_v1298_0;
                                    l_l_l_v1255_0_0_8[13] = l_v1297_0;
                                    l_l_l_v1255_0_0_7[11] = l_v1296_0;
                                    l_l_l_v1255_0_0_6[10] = l_v1295_0;
                                    l_l_l_v1255_0_0_5[9] = l_v1294_0;
                                    l_l_l_v1255_0_0_4[8] = l_l_l_v1255_0_0_11;
                                    v1291 = v1291 + (v1292 or 128);
                                    l_l_v1255_0_0[12] = l_l_v1157_0_0(v1182[5], v1291);
                                    if v1292 then
                                        l_l_v1255_0_0[14] = l_l_v1162_0_0(l_l_v1255_0_0[14]);
                                    end;
                                    if v1293 then
                                        l_l_v1255_0_0[15] = l_l_v1162_0_0(l_l_v1255_0_0[15]);
                                    end;
                                    for v1327 = 1, 12 do
                                        l_l_l_v1255_0_0_8 = v1201[v1327];
                                        v1285(0, 4, 8, 12, l_l_l_v1255_0_0_8[1], l_l_l_v1255_0_0_8[2]);
                                        v1285(1, 5, 9, 13, l_l_l_v1255_0_0_8[3], l_l_l_v1255_0_0_8[4]);
                                        v1285(2, 6, 10, 14, l_l_l_v1255_0_0_8[5], l_l_l_v1255_0_0_8[6]);
                                        v1285(3, 7, 11, 15, l_l_l_v1255_0_0_8[7], l_l_l_v1255_0_0_8[8]);
                                        v1285(0, 5, 10, 15, l_l_l_v1255_0_0_8[9], l_l_l_v1255_0_0_8[10]);
                                        v1285(1, 6, 11, 12, l_l_l_v1255_0_0_8[11], l_l_l_v1255_0_0_8[12]);
                                        v1285(2, 7, 8, 13, l_l_l_v1255_0_0_8[13], l_l_l_v1255_0_0_8[14]);
                                        v1285(3, 4, 9, 14, l_l_l_v1255_0_0_8[15], l_l_l_v1255_0_0_8[16]);
                                    end;
                                    v1294 = l_l_v1157_0_0(v1294, l_l_v1255_0_0[0], l_l_v1255_0_0[8]);
                                    v1295 = l_l_v1157_0_0(v1295, l_l_v1255_0_0[1], l_l_v1255_0_0[9]);
                                    v1296 = l_l_v1157_0_0(v1296, l_l_v1255_0_0[2], l_l_v1255_0_0[10]);
                                    v1297 = l_l_v1157_0_0(v1297, l_l_v1255_0_0[3], l_l_v1255_0_0[11]);
                                    v1298 = l_l_v1157_0_0(v1298, l_l_v1255_0_0[4], l_l_v1255_0_0[12]);
                                    v1299 = l_l_v1157_0_0(v1299, l_l_v1255_0_0[5], l_l_v1255_0_0[13]);
                                    v1300 = l_l_v1157_0_0(v1300, l_l_v1255_0_0[6], l_l_v1255_0_0[14]);
                                    v1301 = l_l_v1157_0_0(v1301, l_l_v1255_0_0[7], l_l_v1255_0_0[15]);
                                end;
                                local l_v1294_1 = v1294;
                                local l_v1295_1 = v1295;
                                local l_v1296_1 = v1296;
                                local l_v1297_1 = v1297;
                                local l_v1298_1 = v1298;
                                local l_v1299_1 = v1299;
                                local l_v1300_1 = v1300;
                                v1286[8] = v1301;
                                v1286[7] = l_v1300_1;
                                v1286[6] = l_v1299_1;
                                v1286[5] = l_v1298_1;
                                v1286[4] = l_v1297_1;
                                v1286[3] = l_v1296_1;
                                v1286[2] = l_v1295_1;
                                v1286[1] = l_v1294_1;
                                return v1291;
                            end;
                        end;
                        l_v1255_0 = v1144.typeof("int64_t[?]");
                        v1193 = 0;
                        v1200 = v1244(4294967296);
                        v1171 = function()
                            -- upvalues: l_v1255_0 (ref)
                            return l_v1255_0(30);
                        end;
                        v1176 = function(v1335, _, v1337, v1338, v1339, v1340)
                            -- upvalues: v1184 (ref), v1159 (ref), l_byte_1 (ref), l_l_v1157_0_0 (ref), l_l_v1156_0_0 (ref), v1156 (ref), v1158 (ref), v1244 (ref), v1246 (ref), v1245 (ref), l_l_v1160_0_0 (ref), l_l_v1155_0_0 (ref), l_l_v1162_0_0 (ref)
                            local l_v1184_0 = v1184;
                            local v1342 = v1159(v1340, 3);
                            for v1343 = v1338, v1338 + v1339 - 1, v1340 do
                                for v1344 = 0, v1342 - 1 do
                                    v1343 = v1343 + 8;
                                    local v1345, v1346, v1347, v1348, v1349, v1350, v1351, v1352 = l_byte_1(v1337, v1343 - 7, v1343);
                                    v1335[v1344] = l_l_v1157_0_0(v1335[v1344], l_l_v1156_0_0(v1156(v1158(v1352, 24), v1158(v1351, 16), v1158(v1350, 8), v1349) * v1244(4294967296), v1246(v1245(v1156(v1158(v1348, 24), v1158(v1347, 16), v1158(v1346, 8), v1345)))));
                                end;
                                for v1353 = 1, 24 do
                                    for v1354 = 0, 4 do
                                        v1335[25 + v1354] = l_l_v1157_0_0(v1335[v1354], v1335[v1354 + 5], v1335[v1354 + 10], v1335[v1354 + 15], v1335[v1354 + 20]);
                                    end;
                                    local v1355 = l_l_v1157_0_0(v1335[25], l_l_v1160_0_0(v1335[27], 1));
                                    local v1356 = l_l_v1160_0_0(l_l_v1157_0_0(v1355, v1335[6]), 44);
                                    local v1357 = l_l_v1160_0_0(l_l_v1157_0_0(v1355, v1335[16]), 45);
                                    local v1358 = l_l_v1160_0_0(l_l_v1157_0_0(v1355, v1335[1]), 1);
                                    v1335[16] = l_l_v1160_0_0(l_l_v1157_0_0(v1355, v1335[11]), 10);
                                    v1335[11] = v1358;
                                    v1335[6] = v1357;
                                    v1335[1] = v1356;
                                    v1335[21] = l_l_v1160_0_0(l_l_v1157_0_0(v1355, v1335[21]), 2);
                                    v1355 = l_l_v1157_0_0(v1335[26], l_l_v1160_0_0(v1335[28], 1));
                                    v1356 = l_l_v1160_0_0(l_l_v1157_0_0(v1355, v1335[12]), 43);
                                    v1357 = l_l_v1160_0_0(l_l_v1157_0_0(v1355, v1335[22]), 61);
                                    v1358 = l_l_v1160_0_0(l_l_v1157_0_0(v1355, v1335[7]), 6);
                                    v1335[22] = l_l_v1160_0_0(l_l_v1157_0_0(v1355, v1335[2]), 62);
                                    v1335[12] = v1358;
                                    v1335[7] = v1357;
                                    v1335[2] = v1356;
                                    v1335[17] = l_l_v1160_0_0(l_l_v1157_0_0(v1355, v1335[17]), 15);
                                    v1355 = l_l_v1157_0_0(v1335[27], l_l_v1160_0_0(v1335[29], 1));
                                    v1356 = l_l_v1160_0_0(l_l_v1157_0_0(v1355, v1335[18]), 21);
                                    v1357 = l_l_v1160_0_0(l_l_v1157_0_0(v1355, v1335[3]), 28);
                                    v1358 = l_l_v1160_0_0(l_l_v1157_0_0(v1355, v1335[23]), 56);
                                    v1335[23] = l_l_v1160_0_0(l_l_v1157_0_0(v1355, v1335[8]), 55);
                                    v1335[18] = v1358;
                                    v1335[8] = v1357;
                                    v1335[3] = v1356;
                                    v1335[13] = l_l_v1160_0_0(l_l_v1157_0_0(v1355, v1335[13]), 25);
                                    v1355 = l_l_v1157_0_0(v1335[28], l_l_v1160_0_0(v1335[25], 1));
                                    v1356 = l_l_v1160_0_0(l_l_v1157_0_0(v1355, v1335[24]), 14);
                                    v1357 = l_l_v1160_0_0(l_l_v1157_0_0(v1355, v1335[19]), 8);
                                    v1358 = l_l_v1160_0_0(l_l_v1157_0_0(v1355, v1335[4]), 27);
                                    v1335[24] = l_l_v1160_0_0(l_l_v1157_0_0(v1355, v1335[14]), 39);
                                    v1335[19] = v1358;
                                    v1335[14] = v1357;
                                    v1335[4] = v1356;
                                    v1335[9] = l_l_v1160_0_0(l_l_v1157_0_0(v1355, v1335[9]), 20);
                                    v1355 = l_l_v1157_0_0(v1335[29], l_l_v1160_0_0(v1335[26], 1));
                                    v1356 = l_l_v1160_0_0(l_l_v1157_0_0(v1355, v1335[10]), 3);
                                    v1357 = l_l_v1160_0_0(l_l_v1157_0_0(v1355, v1335[20]), 18);
                                    v1358 = l_l_v1160_0_0(l_l_v1157_0_0(v1355, v1335[5]), 36);
                                    v1335[20] = l_l_v1160_0_0(l_l_v1157_0_0(v1355, v1335[15]), 41);
                                    v1335[15] = v1358;
                                    v1335[10] = v1357;
                                    v1335[5] = v1356;
                                    v1335[0] = l_l_v1157_0_0(v1355, v1335[0]);
                                    v1356 = l_l_v1157_0_0(v1335[0], l_l_v1155_0_0(l_l_v1162_0_0(v1335[1]), v1335[2]), l_v1184_0[v1353]);
                                    v1357 = l_l_v1157_0_0(v1335[1], l_l_v1155_0_0(l_l_v1162_0_0(v1335[2]), v1335[3]));
                                    v1358 = l_l_v1157_0_0(v1335[2], l_l_v1155_0_0(l_l_v1162_0_0(v1335[3]), v1335[4]));
                                    local v1359 = l_l_v1157_0_0(v1335[3], l_l_v1155_0_0(l_l_v1162_0_0(v1335[4]), v1335[0]));
                                    v1335[4] = l_l_v1157_0_0(v1335[4], l_l_v1155_0_0(l_l_v1162_0_0(v1335[0]), v1335[1]));
                                    v1335[3] = v1359;
                                    v1335[2] = v1358;
                                    v1335[1] = v1357;
                                    v1335[0] = v1356;
                                    v1356 = l_l_v1157_0_0(v1335[8], l_l_v1155_0_0(l_l_v1162_0_0(v1335[9]), v1335[5]));
                                    v1357 = l_l_v1157_0_0(v1335[9], l_l_v1155_0_0(l_l_v1162_0_0(v1335[5]), v1335[6]));
                                    v1358 = l_l_v1157_0_0(v1335[5], l_l_v1155_0_0(l_l_v1162_0_0(v1335[6]), v1335[7]));
                                    v1359 = l_l_v1157_0_0(v1335[6], l_l_v1155_0_0(l_l_v1162_0_0(v1335[7]), v1335[8]));
                                    v1335[9] = l_l_v1157_0_0(v1335[7], l_l_v1155_0_0(l_l_v1162_0_0(v1335[8]), v1335[9]));
                                    v1335[8] = v1359;
                                    v1335[7] = v1358;
                                    v1335[6] = v1357;
                                    v1335[5] = v1356;
                                    v1356 = l_l_v1157_0_0(v1335[11], l_l_v1155_0_0(l_l_v1162_0_0(v1335[12]), v1335[13]));
                                    v1357 = l_l_v1157_0_0(v1335[12], l_l_v1155_0_0(l_l_v1162_0_0(v1335[13]), v1335[14]));
                                    v1358 = l_l_v1157_0_0(v1335[13], l_l_v1155_0_0(l_l_v1162_0_0(v1335[14]), v1335[10]));
                                    v1359 = l_l_v1157_0_0(v1335[14], l_l_v1155_0_0(l_l_v1162_0_0(v1335[10]), v1335[11]));
                                    v1335[14] = l_l_v1157_0_0(v1335[10], l_l_v1155_0_0(l_l_v1162_0_0(v1335[11]), v1335[12]));
                                    v1335[13] = v1359;
                                    v1335[12] = v1358;
                                    v1335[11] = v1357;
                                    v1335[10] = v1356;
                                    v1356 = l_l_v1157_0_0(v1335[19], l_l_v1155_0_0(l_l_v1162_0_0(v1335[15]), v1335[16]));
                                    v1357 = l_l_v1157_0_0(v1335[15], l_l_v1155_0_0(l_l_v1162_0_0(v1335[16]), v1335[17]));
                                    v1358 = l_l_v1157_0_0(v1335[16], l_l_v1155_0_0(l_l_v1162_0_0(v1335[17]), v1335[18]));
                                    v1359 = l_l_v1157_0_0(v1335[17], l_l_v1155_0_0(l_l_v1162_0_0(v1335[18]), v1335[19]));
                                    v1335[19] = l_l_v1157_0_0(v1335[18], l_l_v1155_0_0(l_l_v1162_0_0(v1335[19]), v1335[15]));
                                    v1335[18] = v1359;
                                    v1335[17] = v1358;
                                    v1335[16] = v1357;
                                    v1335[15] = v1356;
                                    v1356 = l_l_v1157_0_0(v1335[22], l_l_v1155_0_0(l_l_v1162_0_0(v1335[23]), v1335[24]));
                                    v1357 = l_l_v1157_0_0(v1335[23], l_l_v1155_0_0(l_l_v1162_0_0(v1335[24]), v1335[20]));
                                    v1358 = l_l_v1157_0_0(v1335[24], l_l_v1155_0_0(l_l_v1162_0_0(v1335[20]), v1335[21]));
                                    v1359 = l_l_v1157_0_0(v1335[20], l_l_v1155_0_0(l_l_v1162_0_0(v1335[21]), v1335[22]));
                                    v1335[24] = l_l_v1157_0_0(v1335[21], l_l_v1155_0_0(l_l_v1162_0_0(v1335[22]), v1335[23]));
                                    v1335[23] = v1359;
                                    v1335[22] = v1358;
                                    v1335[21] = v1357;
                                    v1335[20] = v1356;
                                end;
                            end;
                        end;
                        l_l_l_v1194_0_0_0 = 2779096485 * v1244(4294967297);
                        v1170 = function(v1360, v1361)
                            -- upvalues: l_l_v1157_0_0 (ref), l_l_l_v1194_0_0_0 (ref)
                            return l_l_v1157_0_0(v1360, v1361 or l_l_l_v1194_0_0_0);
                        end;
                        v1173 = function(v1362, _, v1364, v1365, v1366)
                            -- upvalues: l_v1210_0 (ref), v1180 (ref), l_byte_1 (ref), l_l_v1156_0_0 (ref), v1156 (ref), v1158 (ref), v1244 (ref), v1246 (ref), v1245 (ref), l_l_v1157_0_0 (ref), l_l_v1161_0_0 (ref), l_l_v1159_0_0 (ref), l_l_v1160_0_0 (ref), l_l_v1155_0_0 (ref)
                            local l_l_v1210_0_0 = l_v1210_0;
                            local l_v1180_0 = v1180;
                            for v1369 = v1365, v1365 + v1366 - 1, 128 do
                                for v1370 = 0, 15 do
                                    v1369 = v1369 + 8;
                                    local v1371, v1372, v1373, v1374, v1375, v1376, v1377, v1378 = l_byte_1(v1364, v1369 - 7, v1369);
                                    l_l_v1210_0_0[v1370] = l_l_v1156_0_0(v1156(v1158(v1371, 24), v1158(v1372, 16), v1158(v1373, 8), v1374) * v1244(4294967296), v1246(v1245(v1156(v1158(v1375, 24), v1158(v1376, 16), v1158(v1377, 8), v1378))));
                                end;
                                for v1379 = 16, 79 do
                                    local v1380 = l_l_v1210_0_0[v1379 - 15];
                                    local v1381 = l_l_v1210_0_0[v1379 - 2];
                                    l_l_v1210_0_0[v1379] = l_l_v1157_0_0(l_l_v1161_0_0(v1380, 1), l_l_v1161_0_0(v1380, 8), l_l_v1159_0_0(v1380, 7)) + l_l_v1157_0_0(l_l_v1161_0_0(v1381, 19), l_l_v1160_0_0(v1381, 3), l_l_v1159_0_0(v1381, 6)) + l_l_v1210_0_0[v1379 - 7] + l_l_v1210_0_0[v1379 - 16];
                                end;
                                local v1382 = v1362[1];
                                local v1383 = v1362[2];
                                local v1384 = v1362[3];
                                local v1385 = v1362[4];
                                local v1386 = v1362[5];
                                local v1387 = v1362[6];
                                local v1388 = v1362[7];
                                local v1389 = v1362[8];
                                for v1390 = 0, 79, 8 do
                                    local v1391 = l_l_v1157_0_0(l_l_v1161_0_0(v1386, 14), l_l_v1161_0_0(v1386, 18), l_l_v1160_0_0(v1386, 23)) + l_l_v1157_0_0(v1388, l_l_v1155_0_0(v1386, l_l_v1157_0_0(v1387, v1388))) + v1389 + l_v1180_0[v1390 + 1] + l_l_v1210_0_0[v1390];
                                    local l_v1388_0 = v1388;
                                    local l_v1387_0 = v1387;
                                    local l_v1386_0 = v1386;
                                    v1386 = v1391 + v1385;
                                    v1387 = l_v1386_0;
                                    v1388 = l_v1387_0;
                                    v1389 = l_v1388_0;
                                    l_v1388_0 = v1384;
                                    l_v1387_0 = v1383;
                                    l_v1386_0 = v1382;
                                    v1382 = l_l_v1157_0_0(l_l_v1155_0_0(l_l_v1157_0_0(v1382, v1383), v1384), l_l_v1155_0_0(v1382, v1383)) + l_l_v1157_0_0(l_l_v1161_0_0(v1382, 28), l_l_v1160_0_0(v1382, 25), l_l_v1160_0_0(v1382, 30)) + v1391;
                                    v1383 = l_v1386_0;
                                    v1384 = l_v1387_0;
                                    v1385 = l_v1388_0;
                                    v1391 = l_l_v1157_0_0(l_l_v1161_0_0(v1386, 14), l_l_v1161_0_0(v1386, 18), l_l_v1160_0_0(v1386, 23)) + l_l_v1157_0_0(v1388, l_l_v1155_0_0(v1386, l_l_v1157_0_0(v1387, v1388))) + v1389 + l_v1180_0[v1390 + 2] + l_l_v1210_0_0[v1390 + 1];
                                    l_v1388_0 = v1388;
                                    l_v1387_0 = v1387;
                                    l_v1386_0 = v1386;
                                    v1386 = v1391 + v1385;
                                    v1387 = l_v1386_0;
                                    v1388 = l_v1387_0;
                                    v1389 = l_v1388_0;
                                    l_v1388_0 = v1384;
                                    l_v1387_0 = v1383;
                                    l_v1386_0 = v1382;
                                    v1382 = l_l_v1157_0_0(l_l_v1155_0_0(l_l_v1157_0_0(v1382, v1383), v1384), l_l_v1155_0_0(v1382, v1383)) + l_l_v1157_0_0(l_l_v1161_0_0(v1382, 28), l_l_v1160_0_0(v1382, 25), l_l_v1160_0_0(v1382, 30)) + v1391;
                                    v1383 = l_v1386_0;
                                    v1384 = l_v1387_0;
                                    v1385 = l_v1388_0;
                                    v1391 = l_l_v1157_0_0(l_l_v1161_0_0(v1386, 14), l_l_v1161_0_0(v1386, 18), l_l_v1160_0_0(v1386, 23)) + l_l_v1157_0_0(v1388, l_l_v1155_0_0(v1386, l_l_v1157_0_0(v1387, v1388))) + v1389 + l_v1180_0[v1390 + 3] + l_l_v1210_0_0[v1390 + 2];
                                    l_v1388_0 = v1388;
                                    l_v1387_0 = v1387;
                                    l_v1386_0 = v1386;
                                    v1386 = v1391 + v1385;
                                    v1387 = l_v1386_0;
                                    v1388 = l_v1387_0;
                                    v1389 = l_v1388_0;
                                    l_v1388_0 = v1384;
                                    l_v1387_0 = v1383;
                                    l_v1386_0 = v1382;
                                    v1382 = l_l_v1157_0_0(l_l_v1155_0_0(l_l_v1157_0_0(v1382, v1383), v1384), l_l_v1155_0_0(v1382, v1383)) + l_l_v1157_0_0(l_l_v1161_0_0(v1382, 28), l_l_v1160_0_0(v1382, 25), l_l_v1160_0_0(v1382, 30)) + v1391;
                                    v1383 = l_v1386_0;
                                    v1384 = l_v1387_0;
                                    v1385 = l_v1388_0;
                                    v1391 = l_l_v1157_0_0(l_l_v1161_0_0(v1386, 14), l_l_v1161_0_0(v1386, 18), l_l_v1160_0_0(v1386, 23)) + l_l_v1157_0_0(v1388, l_l_v1155_0_0(v1386, l_l_v1157_0_0(v1387, v1388))) + v1389 + l_v1180_0[v1390 + 4] + l_l_v1210_0_0[v1390 + 3];
                                    l_v1388_0 = v1388;
                                    l_v1387_0 = v1387;
                                    l_v1386_0 = v1386;
                                    v1386 = v1391 + v1385;
                                    v1387 = l_v1386_0;
                                    v1388 = l_v1387_0;
                                    v1389 = l_v1388_0;
                                    l_v1388_0 = v1384;
                                    l_v1387_0 = v1383;
                                    l_v1386_0 = v1382;
                                    v1382 = l_l_v1157_0_0(l_l_v1155_0_0(l_l_v1157_0_0(v1382, v1383), v1384), l_l_v1155_0_0(v1382, v1383)) + l_l_v1157_0_0(l_l_v1161_0_0(v1382, 28), l_l_v1160_0_0(v1382, 25), l_l_v1160_0_0(v1382, 30)) + v1391;
                                    v1383 = l_v1386_0;
                                    v1384 = l_v1387_0;
                                    v1385 = l_v1388_0;
                                    v1391 = l_l_v1157_0_0(l_l_v1161_0_0(v1386, 14), l_l_v1161_0_0(v1386, 18), l_l_v1160_0_0(v1386, 23)) + l_l_v1157_0_0(v1388, l_l_v1155_0_0(v1386, l_l_v1157_0_0(v1387, v1388))) + v1389 + l_v1180_0[v1390 + 5] + l_l_v1210_0_0[v1390 + 4];
                                    l_v1388_0 = v1388;
                                    l_v1387_0 = v1387;
                                    l_v1386_0 = v1386;
                                    v1386 = v1391 + v1385;
                                    v1387 = l_v1386_0;
                                    v1388 = l_v1387_0;
                                    v1389 = l_v1388_0;
                                    l_v1388_0 = v1384;
                                    l_v1387_0 = v1383;
                                    l_v1386_0 = v1382;
                                    v1382 = l_l_v1157_0_0(l_l_v1155_0_0(l_l_v1157_0_0(v1382, v1383), v1384), l_l_v1155_0_0(v1382, v1383)) + l_l_v1157_0_0(l_l_v1161_0_0(v1382, 28), l_l_v1160_0_0(v1382, 25), l_l_v1160_0_0(v1382, 30)) + v1391;
                                    v1383 = l_v1386_0;
                                    v1384 = l_v1387_0;
                                    v1385 = l_v1388_0;
                                    v1391 = l_l_v1157_0_0(l_l_v1161_0_0(v1386, 14), l_l_v1161_0_0(v1386, 18), l_l_v1160_0_0(v1386, 23)) + l_l_v1157_0_0(v1388, l_l_v1155_0_0(v1386, l_l_v1157_0_0(v1387, v1388))) + v1389 + l_v1180_0[v1390 + 6] + l_l_v1210_0_0[v1390 + 5];
                                    l_v1388_0 = v1388;
                                    l_v1387_0 = v1387;
                                    l_v1386_0 = v1386;
                                    v1386 = v1391 + v1385;
                                    v1387 = l_v1386_0;
                                    v1388 = l_v1387_0;
                                    v1389 = l_v1388_0;
                                    l_v1388_0 = v1384;
                                    l_v1387_0 = v1383;
                                    l_v1386_0 = v1382;
                                    v1382 = l_l_v1157_0_0(l_l_v1155_0_0(l_l_v1157_0_0(v1382, v1383), v1384), l_l_v1155_0_0(v1382, v1383)) + l_l_v1157_0_0(l_l_v1161_0_0(v1382, 28), l_l_v1160_0_0(v1382, 25), l_l_v1160_0_0(v1382, 30)) + v1391;
                                    v1383 = l_v1386_0;
                                    v1384 = l_v1387_0;
                                    v1385 = l_v1388_0;
                                    v1391 = l_l_v1157_0_0(l_l_v1161_0_0(v1386, 14), l_l_v1161_0_0(v1386, 18), l_l_v1160_0_0(v1386, 23)) + l_l_v1157_0_0(v1388, l_l_v1155_0_0(v1386, l_l_v1157_0_0(v1387, v1388))) + v1389 + l_v1180_0[v1390 + 7] + l_l_v1210_0_0[v1390 + 6];
                                    l_v1388_0 = v1388;
                                    l_v1387_0 = v1387;
                                    l_v1386_0 = v1386;
                                    v1386 = v1391 + v1385;
                                    v1387 = l_v1386_0;
                                    v1388 = l_v1387_0;
                                    v1389 = l_v1388_0;
                                    l_v1388_0 = v1384;
                                    l_v1387_0 = v1383;
                                    l_v1386_0 = v1382;
                                    v1382 = l_l_v1157_0_0(l_l_v1155_0_0(l_l_v1157_0_0(v1382, v1383), v1384), l_l_v1155_0_0(v1382, v1383)) + l_l_v1157_0_0(l_l_v1161_0_0(v1382, 28), l_l_v1160_0_0(v1382, 25), l_l_v1160_0_0(v1382, 30)) + v1391;
                                    v1383 = l_v1386_0;
                                    v1384 = l_v1387_0;
                                    v1385 = l_v1388_0;
                                    v1391 = l_l_v1157_0_0(l_l_v1161_0_0(v1386, 14), l_l_v1161_0_0(v1386, 18), l_l_v1160_0_0(v1386, 23)) + l_l_v1157_0_0(v1388, l_l_v1155_0_0(v1386, l_l_v1157_0_0(v1387, v1388))) + v1389 + l_v1180_0[v1390 + 8] + l_l_v1210_0_0[v1390 + 7];
                                    l_v1388_0 = v1388;
                                    l_v1387_0 = v1387;
                                    l_v1386_0 = v1386;
                                    v1386 = v1391 + v1385;
                                    v1387 = l_v1386_0;
                                    v1388 = l_v1387_0;
                                    v1389 = l_v1388_0;
                                    l_v1388_0 = v1384;
                                    l_v1387_0 = v1383;
                                    l_v1386_0 = v1382;
                                    v1382 = l_l_v1157_0_0(l_l_v1155_0_0(l_l_v1157_0_0(v1382, v1383), v1384), l_l_v1155_0_0(v1382, v1383)) + l_l_v1157_0_0(l_l_v1161_0_0(v1382, 28), l_l_v1160_0_0(v1382, 25), l_l_v1160_0_0(v1382, 30)) + v1391;
                                    v1383 = l_v1386_0;
                                    v1384 = l_v1387_0;
                                    v1385 = l_v1388_0;
                                end;
                                v1362[1] = v1382 + v1362[1];
                                v1362[2] = v1383 + v1362[2];
                                v1362[3] = v1384 + v1362[3];
                                v1362[4] = v1385 + v1362[4];
                                v1362[5] = v1386 + v1362[5];
                                v1362[6] = v1387 + v1362[6];
                                v1362[7] = v1388 + v1362[7];
                                v1362[8] = v1389 + v1362[8];
                            end;
                        end;
                    end;
                else
                    local v1395 = v1144.new("union{int64_t i64; struct{int32_t " .. (v1144.abi("le") and "lo, hi" or "hi, lo") .. ";} i32;}[3]");
                    do
                        local l_v1395_0 = v1395;
                        local function v1401(v1397)
                            -- upvalues: l_v1395_0 (ref), v1157 (ref), v1159 (ref), v1158 (ref), v1244 (ref), v1246 (ref), v1245 (ref)
                            l_v1395_0[0].i64 = v1397;
                            local l_lo_0 = l_v1395_0[0].i32.lo;
                            local l_hi_0 = l_v1395_0[0].i32.hi;
                            local v1400 = v1157(v1159(l_lo_0, 1), v1158(l_hi_0, 31), v1159(l_lo_0, 8), v1158(l_hi_0, 24), v1159(l_lo_0, 7), v1158(l_hi_0, 25));
                            return v1157(v1159(l_hi_0, 1), v1158(l_lo_0, 31), v1159(l_hi_0, 8), v1158(l_lo_0, 24), v1159(l_hi_0, 7)) * v1244(4294967296) + v1246(v1245(v1400));
                        end;
                        local function v1406(v1402)
                            -- upvalues: l_v1395_0 (ref), v1157 (ref), v1159 (ref), v1158 (ref), v1244 (ref), v1246 (ref), v1245 (ref)
                            l_v1395_0[0].i64 = v1402;
                            local l_lo_1 = l_v1395_0[0].i32.lo;
                            local l_hi_1 = l_v1395_0[0].i32.hi;
                            local v1405 = v1157(v1159(l_lo_1, 19), v1158(l_hi_1, 13), v1158(l_lo_1, 3), v1159(l_hi_1, 29), v1159(l_lo_1, 6), v1158(l_hi_1, 26));
                            return v1157(v1159(l_hi_1, 19), v1158(l_lo_1, 13), v1158(l_hi_1, 3), v1159(l_lo_1, 29), v1159(l_hi_1, 6)) * v1244(4294967296) + v1246(v1245(v1405));
                        end;
                        local function v1411(v1407)
                            -- upvalues: l_v1395_0 (ref), v1157 (ref), v1159 (ref), v1158 (ref), v1244 (ref), v1246 (ref), v1245 (ref)
                            l_v1395_0[0].i64 = v1407;
                            local l_lo_2 = l_v1395_0[0].i32.lo;
                            local l_hi_2 = l_v1395_0[0].i32.hi;
                            local v1410 = v1157(v1159(l_lo_2, 14), v1158(l_hi_2, 18), v1159(l_lo_2, 18), v1158(l_hi_2, 14), v1158(l_lo_2, 23), v1159(l_hi_2, 9));
                            return v1157(v1159(l_hi_2, 14), v1158(l_lo_2, 18), v1159(l_hi_2, 18), v1158(l_lo_2, 14), v1158(l_hi_2, 23), v1159(l_lo_2, 9)) * v1244(4294967296) + v1246(v1245(v1410));
                        end;
                        local function v1416(v1412)
                            -- upvalues: l_v1395_0 (ref), v1157 (ref), v1159 (ref), v1158 (ref), v1244 (ref), v1246 (ref), v1245 (ref)
                            l_v1395_0[0].i64 = v1412;
                            local l_lo_3 = l_v1395_0[0].i32.lo;
                            local l_hi_3 = l_v1395_0[0].i32.hi;
                            local v1415 = v1157(v1159(l_lo_3, 28), v1158(l_hi_3, 4), v1158(l_lo_3, 30), v1159(l_hi_3, 2), v1158(l_lo_3, 25), v1159(l_hi_3, 7));
                            return v1157(v1159(l_hi_3, 28), v1158(l_lo_3, 4), v1158(l_hi_3, 30), v1159(l_lo_3, 2), v1158(l_hi_3, 25), v1159(l_lo_3, 7)) * v1244(4294967296) + v1246(v1245(v1415));
                        end;
                        local function v1427(v1417, v1418, v1419)
                            -- upvalues: l_v1395_0 (ref), v1157 (ref), v1155 (ref), v1244 (ref), v1246 (ref), v1245 (ref)
                            l_v1395_0[0].i64 = v1418;
                            l_v1395_0[1].i64 = v1419;
                            l_v1395_0[2].i64 = v1417;
                            local l_lo_4 = l_v1395_0[0].i32.lo;
                            local l_hi_4 = l_v1395_0[0].i32.hi;
                            local l_lo_5 = l_v1395_0[1].i32.lo;
                            local l_hi_5 = l_v1395_0[1].i32.hi;
                            local l_lo_6 = l_v1395_0[2].i32.lo;
                            local l_hi_6 = l_v1395_0[2].i32.hi;
                            local v1426 = v1157(l_lo_5, v1155(l_lo_6, v1157(l_lo_4, l_lo_5)));
                            return v1157(l_hi_5, v1155(l_hi_6, v1157(l_hi_4, l_hi_5))) * v1244(4294967296) + v1246(v1245(v1426));
                        end;
                        local function v1438(v1428, v1429, v1430)
                            -- upvalues: l_v1395_0 (ref), v1157 (ref), v1155 (ref), v1244 (ref), v1246 (ref), v1245 (ref)
                            l_v1395_0[0].i64 = v1428;
                            l_v1395_0[1].i64 = v1429;
                            l_v1395_0[2].i64 = v1430;
                            local l_lo_7 = l_v1395_0[0].i32.lo;
                            local l_hi_7 = l_v1395_0[0].i32.hi;
                            local l_lo_8 = l_v1395_0[1].i32.lo;
                            local l_hi_8 = l_v1395_0[1].i32.hi;
                            local l_lo_9 = l_v1395_0[2].i32.lo;
                            local l_hi_9 = l_v1395_0[2].i32.hi;
                            local v1437 = v1157(v1155(v1157(l_lo_7, l_lo_8), l_lo_9), v1155(l_lo_7, l_lo_8));
                            return v1157(v1155(v1157(l_hi_7, l_hi_8), l_hi_9), v1155(l_hi_7, l_hi_8)) * v1244(4294967296) + v1246(v1245(v1437));
                        end;
                        local function v1449(v1439, v1440, v1441)
                            -- upvalues: l_v1395_0 (ref), v1157 (ref), v1159 (ref), v1158 (ref), v1244 (ref), v1246 (ref), v1245 (ref)
                            l_v1395_0[0].i64 = v1439;
                            l_v1395_0[1].i64 = v1440;
                            local l_lo_10 = l_v1395_0[0].i32.lo;
                            local l_hi_10 = l_v1395_0[0].i32.hi;
                            local l_lo_11 = l_v1395_0[1].i32.lo;
                            local l_hi_11 = l_v1395_0[1].i32.hi;
                            local v1446 = v1157(l_lo_10, l_lo_11);
                            local v1447 = v1157(l_hi_10, l_hi_11);
                            local v1448 = v1157(v1159(v1446, v1441), v1158(v1447, -v1441));
                            return v1157(v1159(v1447, v1441), v1158(v1446, -v1441)) * v1244(4294967296) + v1246(v1245(v1448));
                        end;
                        local function v1459(v1450, v1451)
                            -- upvalues: l_v1395_0 (ref), v1157 (ref), v1158 (ref), v1159 (ref), v1244 (ref), v1246 (ref), v1245 (ref)
                            l_v1395_0[0].i64 = v1450;
                            l_v1395_0[1].i64 = v1451;
                            local l_lo_12 = l_v1395_0[0].i32.lo;
                            local l_hi_12 = l_v1395_0[0].i32.hi;
                            local l_lo_13 = l_v1395_0[1].i32.lo;
                            local l_hi_13 = l_v1395_0[1].i32.hi;
                            local v1456 = v1157(l_lo_12, l_lo_13);
                            local v1457 = v1157(l_hi_12, l_hi_13);
                            local v1458 = v1157(v1158(v1456, 1), v1159(v1457, 31));
                            return v1157(v1158(v1457, 1), v1159(v1456, 31)) * v1244(4294967296) + v1246(v1245(v1458));
                        end;
                        local function v1468(v1460, v1461)
                            -- upvalues: l_v1395_0 (ref), v1157 (ref), v1244 (ref), v1246 (ref), v1245 (ref)
                            l_v1395_0[0].i64 = v1460;
                            l_v1395_0[1].i64 = v1461;
                            local l_lo_14 = l_v1395_0[0].i32.lo;
                            local l_hi_14 = l_v1395_0[0].i32.hi;
                            local l_lo_15 = l_v1395_0[1].i32.lo;
                            local l_hi_15 = l_v1395_0[1].i32.hi;
                            local v1466 = v1157(l_lo_14, l_lo_15);
                            local v1467 = v1157(l_hi_14, l_hi_15);
                            return v1466 * v1244(4294967296) + v1246(v1245(v1467));
                        end;
                        local function v1476(v1469, v1470)
                            -- upvalues: l_v1395_0 (ref), v1157 (ref), v1244 (ref), v1246 (ref), v1245 (ref)
                            l_v1395_0[0].i64 = v1469;
                            l_v1395_0[1].i64 = v1470;
                            local l_lo_16 = l_v1395_0[0].i32.lo;
                            local l_hi_16 = l_v1395_0[0].i32.hi;
                            local l_lo_17 = l_v1395_0[1].i32.lo;
                            local l_hi_17 = l_v1395_0[1].i32.hi;
                            local v1475 = v1157(l_lo_16, l_lo_17);
                            return v1157(l_hi_16, l_hi_17) * v1244(4294967296) + v1246(v1245(v1475));
                        end;
                        local function v1487(v1477, v1478, v1479)
                            -- upvalues: l_v1395_0 (ref), v1157 (ref), v1244 (ref), v1246 (ref), v1245 (ref)
                            l_v1395_0[0].i64 = v1477;
                            l_v1395_0[1].i64 = v1478;
                            l_v1395_0[2].i64 = v1479;
                            local l_lo_18 = l_v1395_0[0].i32.lo;
                            local l_hi_18 = l_v1395_0[0].i32.hi;
                            local l_lo_19 = l_v1395_0[1].i32.lo;
                            local l_hi_19 = l_v1395_0[1].i32.hi;
                            local l_lo_20 = l_v1395_0[2].i32.lo;
                            local l_hi_20 = l_v1395_0[2].i32.hi;
                            local v1486 = v1157(l_lo_18, l_lo_19, l_lo_20);
                            return v1157(l_hi_18, l_hi_19, l_hi_20) * v1244(4294967296) + v1246(v1245(v1486));
                        end;
                        v1170 = function(v1488, v1489)
                            -- upvalues: l_v1395_0 (ref), v1157 (ref), v1244 (ref), v1246 (ref), v1245 (ref)
                            l_v1395_0[0].i64 = v1488;
                            local l_lo_21 = l_v1395_0[0].i32.lo;
                            local l_hi_21 = l_v1395_0[0].i32.hi;
                            local v1492 = 2779096485;
                            local v1493 = 2779096485;
                            if v1489 then
                                l_v1395_0[1].i64 = v1489;
                                local l_lo_22 = l_v1395_0[1].i32.lo;
                                v1493 = l_v1395_0[1].i32.hi;
                                v1492 = l_lo_22;
                            end;
                            l_lo_21 = v1157(l_lo_21, v1492);
                            return v1157(l_hi_21, v1493) * v1244(4294967296) + v1246(v1245(l_lo_21));
                        end;
                        v1192 = function(v1495)
                            -- upvalues: l_v1395_0 (ref), v1164 (ref)
                            l_v1395_0[0].i64 = v1495;
                            return v1164(l_v1395_0[0].i32.hi) .. v1164(l_v1395_0[0].i32.lo);
                        end;
                        v1173 = function(v1496, _, v1498, v1499, v1500)
                            -- upvalues: l_v1210_0 (ref), v1180 (ref), l_byte_1 (ref), v1156 (ref), v1158 (ref), v1244 (ref), v1246 (ref), v1245 (ref), v1401 (ref), v1406 (ref), v1411 (ref), v1427 (ref), v1438 (ref), v1416 (ref)
                            local l_l_v1210_0_1 = l_v1210_0;
                            local l_v1180_1 = v1180;
                            for v1503 = v1499, v1499 + v1500 - 1, 128 do
                                for v1504 = 0, 15 do
                                    v1503 = v1503 + 8;
                                    local v1505, v1506, v1507, v1508, v1509, v1510, v1511, v1512 = l_byte_1(v1498, v1503 - 7, v1503);
                                    l_l_v1210_0_1[v1504] = v1156(v1158(v1505, 24), v1158(v1506, 16), v1158(v1507, 8), v1508) * v1244(4294967296) + v1246(v1245(v1156(v1158(v1509, 24), v1158(v1510, 16), v1158(v1511, 8), v1512)));
                                end;
                                for v1513 = 16, 79 do
                                    l_l_v1210_0_1[v1513] = v1401(l_l_v1210_0_1[v1513 - 15]) + v1406(l_l_v1210_0_1[v1513 - 2]) + l_l_v1210_0_1[v1513 - 7] + l_l_v1210_0_1[v1513 - 16];
                                end;
                                local v1514 = v1496[1];
                                local v1515 = v1496[2];
                                local v1516 = v1496[3];
                                local v1517 = v1496[4];
                                local v1518 = v1496[5];
                                local v1519 = v1496[6];
                                local v1520 = v1496[7];
                                local v1521 = v1496[8];
                                for v1522 = 0, 79, 8 do
                                    local v1523 = v1411(v1518) + v1427(v1518, v1519, v1520) + v1521 + l_v1180_1[v1522 + 1] + l_l_v1210_0_1[v1522];
                                    local l_v1520_0 = v1520;
                                    local l_v1519_0 = v1519;
                                    local l_v1518_0 = v1518;
                                    v1518 = v1523 + v1517;
                                    v1519 = l_v1518_0;
                                    v1520 = l_v1519_0;
                                    v1521 = l_v1520_0;
                                    l_v1520_0 = v1516;
                                    l_v1519_0 = v1515;
                                    l_v1518_0 = v1514;
                                    v1514 = v1438(v1514, v1515, v1516) + v1416(v1514) + v1523;
                                    v1515 = l_v1518_0;
                                    v1516 = l_v1519_0;
                                    v1517 = l_v1520_0;
                                    v1523 = v1411(v1518) + v1427(v1518, v1519, v1520) + v1521 + l_v1180_1[v1522 + 2] + l_l_v1210_0_1[v1522 + 1];
                                    l_v1520_0 = v1520;
                                    l_v1519_0 = v1519;
                                    l_v1518_0 = v1518;
                                    v1518 = v1523 + v1517;
                                    v1519 = l_v1518_0;
                                    v1520 = l_v1519_0;
                                    v1521 = l_v1520_0;
                                    l_v1520_0 = v1516;
                                    l_v1519_0 = v1515;
                                    l_v1518_0 = v1514;
                                    v1514 = v1438(v1514, v1515, v1516) + v1416(v1514) + v1523;
                                    v1515 = l_v1518_0;
                                    v1516 = l_v1519_0;
                                    v1517 = l_v1520_0;
                                    v1523 = v1411(v1518) + v1427(v1518, v1519, v1520) + v1521 + l_v1180_1[v1522 + 3] + l_l_v1210_0_1[v1522 + 2];
                                    l_v1520_0 = v1520;
                                    l_v1519_0 = v1519;
                                    l_v1518_0 = v1518;
                                    v1518 = v1523 + v1517;
                                    v1519 = l_v1518_0;
                                    v1520 = l_v1519_0;
                                    v1521 = l_v1520_0;
                                    l_v1520_0 = v1516;
                                    l_v1519_0 = v1515;
                                    l_v1518_0 = v1514;
                                    v1514 = v1438(v1514, v1515, v1516) + v1416(v1514) + v1523;
                                    v1515 = l_v1518_0;
                                    v1516 = l_v1519_0;
                                    v1517 = l_v1520_0;
                                    v1523 = v1411(v1518) + v1427(v1518, v1519, v1520) + v1521 + l_v1180_1[v1522 + 4] + l_l_v1210_0_1[v1522 + 3];
                                    l_v1520_0 = v1520;
                                    l_v1519_0 = v1519;
                                    l_v1518_0 = v1518;
                                    v1518 = v1523 + v1517;
                                    v1519 = l_v1518_0;
                                    v1520 = l_v1519_0;
                                    v1521 = l_v1520_0;
                                    l_v1520_0 = v1516;
                                    l_v1519_0 = v1515;
                                    l_v1518_0 = v1514;
                                    v1514 = v1438(v1514, v1515, v1516) + v1416(v1514) + v1523;
                                    v1515 = l_v1518_0;
                                    v1516 = l_v1519_0;
                                    v1517 = l_v1520_0;
                                    v1523 = v1411(v1518) + v1427(v1518, v1519, v1520) + v1521 + l_v1180_1[v1522 + 5] + l_l_v1210_0_1[v1522 + 4];
                                    l_v1520_0 = v1520;
                                    l_v1519_0 = v1519;
                                    l_v1518_0 = v1518;
                                    v1518 = v1523 + v1517;
                                    v1519 = l_v1518_0;
                                    v1520 = l_v1519_0;
                                    v1521 = l_v1520_0;
                                    l_v1520_0 = v1516;
                                    l_v1519_0 = v1515;
                                    l_v1518_0 = v1514;
                                    v1514 = v1438(v1514, v1515, v1516) + v1416(v1514) + v1523;
                                    v1515 = l_v1518_0;
                                    v1516 = l_v1519_0;
                                    v1517 = l_v1520_0;
                                    v1523 = v1411(v1518) + v1427(v1518, v1519, v1520) + v1521 + l_v1180_1[v1522 + 6] + l_l_v1210_0_1[v1522 + 5];
                                    l_v1520_0 = v1520;
                                    l_v1519_0 = v1519;
                                    l_v1518_0 = v1518;
                                    v1518 = v1523 + v1517;
                                    v1519 = l_v1518_0;
                                    v1520 = l_v1519_0;
                                    v1521 = l_v1520_0;
                                    l_v1520_0 = v1516;
                                    l_v1519_0 = v1515;
                                    l_v1518_0 = v1514;
                                    v1514 = v1438(v1514, v1515, v1516) + v1416(v1514) + v1523;
                                    v1515 = l_v1518_0;
                                    v1516 = l_v1519_0;
                                    v1517 = l_v1520_0;
                                    v1523 = v1411(v1518) + v1427(v1518, v1519, v1520) + v1521 + l_v1180_1[v1522 + 7] + l_l_v1210_0_1[v1522 + 6];
                                    l_v1520_0 = v1520;
                                    l_v1519_0 = v1519;
                                    l_v1518_0 = v1518;
                                    v1518 = v1523 + v1517;
                                    v1519 = l_v1518_0;
                                    v1520 = l_v1519_0;
                                    v1521 = l_v1520_0;
                                    l_v1520_0 = v1516;
                                    l_v1519_0 = v1515;
                                    l_v1518_0 = v1514;
                                    v1514 = v1438(v1514, v1515, v1516) + v1416(v1514) + v1523;
                                    v1515 = l_v1518_0;
                                    v1516 = l_v1519_0;
                                    v1517 = l_v1520_0;
                                    v1523 = v1411(v1518) + v1427(v1518, v1519, v1520) + v1521 + l_v1180_1[v1522 + 8] + l_l_v1210_0_1[v1522 + 7];
                                    l_v1520_0 = v1520;
                                    l_v1519_0 = v1519;
                                    l_v1518_0 = v1518;
                                    v1518 = v1523 + v1517;
                                    v1519 = l_v1518_0;
                                    v1520 = l_v1519_0;
                                    v1521 = l_v1520_0;
                                    l_v1520_0 = v1516;
                                    l_v1519_0 = v1515;
                                    l_v1518_0 = v1514;
                                    v1514 = v1438(v1514, v1515, v1516) + v1416(v1514) + v1523;
                                    v1515 = l_v1518_0;
                                    v1516 = l_v1519_0;
                                    v1517 = l_v1520_0;
                                end;
                                v1496[1] = v1514 + v1496[1];
                                v1496[2] = v1515 + v1496[2];
                                v1496[3] = v1516 + v1496[3];
                                v1496[4] = v1517 + v1496[4];
                                v1496[5] = v1518 + v1496[5];
                                v1496[6] = v1519 + v1496[6];
                                v1496[7] = v1520 + v1496[7];
                                v1496[8] = v1521 + v1496[8];
                            end;
                        end;
                        local v1527 = v1144.new("int64_t[?]", 16);
                        local l_l_v1194_0_1 = l_v1194_0;
                        do
                            local l_v1527_0, l_l_l_v1194_0_1_0 = v1527, l_l_v1194_0_1;
                            local function v1548(v1531, v1532, v1533, v1534, v1535, v1536)
                                -- upvalues: l_v1527_0 (ref), l_l_l_v1194_0_1_0 (ref), v1468 (ref), v1449 (ref), v1459 (ref)
                                local v1537 = l_v1527_0[v1531];
                                local v1538 = l_v1527_0[v1532];
                                local v1539 = l_v1527_0[v1533];
                                local v1540 = l_v1527_0[v1534];
                                v1537 = l_l_l_v1194_0_1_0[v1535] + (v1537 + v1538);
                                v1540 = v1468(v1540, v1537);
                                v1539 = v1539 + v1540;
                                v1538 = v1449(v1538, v1539, 24);
                                v1537 = l_l_l_v1194_0_1_0[v1536] + (v1537 + v1538);
                                v1540 = v1449(v1540, v1537, 16);
                                v1539 = v1539 + v1540;
                                v1538 = v1459(v1538, v1539);
                                local l_l_v1527_0_0 = l_v1527_0;
                                local l_l_v1527_0_1 = l_v1527_0;
                                local l_l_v1527_0_2 = l_v1527_0;
                                local l_l_v1527_0_3 = l_v1527_0;
                                local l_v1537_0 = v1537;
                                local l_v1538_0 = v1538;
                                local l_v1539_0 = v1539;
                                l_l_v1527_0_3[v1534] = v1540;
                                l_l_v1527_0_2[v1533] = l_v1539_0;
                                l_l_v1527_0_1[v1532] = l_v1538_0;
                                l_l_v1527_0_0[v1531] = l_v1537_0;
                            end;
                            v1178 = function(v1549, _, v1551, v1552, v1553, v1554, v1555, v1556)
                                -- upvalues: l_byte_1 (ref), l_l_l_v1194_0_1_0 (ref), v1476 (ref), v1156 (ref), v1158 (ref), v1244 (ref), v1246 (ref), v1245 (ref), l_v1527_0 (ref), v1182 (ref), v1201 (ref), v1548 (ref), v1487 (ref)
                                local v1557 = v1549[1];
                                local v1558 = v1549[2];
                                local v1559 = v1549[3];
                                local v1560 = v1549[4];
                                local v1561 = v1549[5];
                                local v1562 = v1549[6];
                                local v1563 = v1549[7];
                                local v1564 = v1549[8];
                                for v1565 = v1552, v1552 + v1553 - 1, 128 do
                                    if v1551 then
                                        for v1566 = 1, 16 do
                                            v1565 = v1565 + 8;
                                            local v1567, v1568, v1569, v1570, v1571, v1572, v1573, v1574 = l_byte_1(v1551, v1565 - 7, v1565);
                                            l_l_l_v1194_0_1_0[v1566] = v1476(v1156(v1158(v1574, 24), v1158(v1573, 16), v1158(v1572, 8), v1571) * v1244(4294967296), v1246(v1245(v1156(v1158(v1570, 24), v1158(v1569, 16), v1158(v1568, 8), v1567))));
                                        end;
                                    end;
                                    local l_l_v1527_0_4 = l_v1527_0;
                                    local l_l_v1527_0_5 = l_v1527_0;
                                    local l_l_v1527_0_6 = l_v1527_0;
                                    local l_l_v1527_0_7 = l_v1527_0;
                                    local l_l_v1527_0_8 = l_v1527_0;
                                    local l_l_v1527_0_9 = l_v1527_0;
                                    local l_l_v1527_0_10 = l_v1527_0;
                                    local l_l_v1527_0_11 = l_v1527_0;
                                    local l_v1557_0 = v1557;
                                    local l_v1558_0 = v1558;
                                    local l_v1559_0 = v1559;
                                    local l_v1560_0 = v1560;
                                    local l_v1561_0 = v1561;
                                    local l_v1562_0 = v1562;
                                    local l_v1563_0 = v1563;
                                    l_l_v1527_0_11[7] = v1564;
                                    l_l_v1527_0_10[6] = l_v1563_0;
                                    l_l_v1527_0_9[5] = l_v1562_0;
                                    l_l_v1527_0_8[4] = l_v1561_0;
                                    l_l_v1527_0_7[3] = l_v1560_0;
                                    l_l_v1527_0_6[2] = l_v1559_0;
                                    l_l_v1527_0_5[1] = l_v1558_0;
                                    l_l_v1527_0_4[0] = l_v1557_0;
                                    l_l_v1527_0_4 = l_v1527_0;
                                    l_l_v1527_0_5 = l_v1527_0;
                                    l_l_v1527_0_6 = l_v1527_0;
                                    l_l_v1527_0_7 = l_v1527_0;
                                    l_l_v1527_0_8 = l_v1527_0;
                                    l_l_v1527_0_9 = l_v1527_0;
                                    l_l_v1527_0_10 = l_v1527_0;
                                    l_l_v1527_0_11 = v1182[1];
                                    l_v1557_0 = v1182[2];
                                    l_v1558_0 = v1182[3];
                                    l_v1559_0 = v1182[4];
                                    l_v1560_0 = v1182[6];
                                    l_v1561_0 = v1182[7];
                                    l_l_v1527_0_10[15] = v1182[8];
                                    l_l_v1527_0_9[14] = l_v1561_0;
                                    l_l_v1527_0_8[13] = l_v1560_0;
                                    l_l_v1527_0_7[11] = l_v1559_0;
                                    l_l_v1527_0_6[10] = l_v1558_0;
                                    l_l_v1527_0_5[9] = l_v1557_0;
                                    l_l_v1527_0_4[8] = l_l_v1527_0_11;
                                    v1554 = v1554 + (v1555 or 128);
                                    l_v1527_0[12] = v1476(v1182[5], v1554);
                                    if v1555 then
                                        l_v1527_0[14] = -1 - l_v1527_0[14];
                                    end;
                                    if v1556 then
                                        l_v1527_0[15] = -1 - l_v1527_0[15];
                                    end;
                                    for v1590 = 1, 12 do
                                        l_l_v1527_0_8 = v1201[v1590];
                                        v1548(0, 4, 8, 12, l_l_v1527_0_8[1], l_l_v1527_0_8[2]);
                                        v1548(1, 5, 9, 13, l_l_v1527_0_8[3], l_l_v1527_0_8[4]);
                                        v1548(2, 6, 10, 14, l_l_v1527_0_8[5], l_l_v1527_0_8[6]);
                                        v1548(3, 7, 11, 15, l_l_v1527_0_8[7], l_l_v1527_0_8[8]);
                                        v1548(0, 5, 10, 15, l_l_v1527_0_8[9], l_l_v1527_0_8[10]);
                                        v1548(1, 6, 11, 12, l_l_v1527_0_8[11], l_l_v1527_0_8[12]);
                                        v1548(2, 7, 8, 13, l_l_v1527_0_8[13], l_l_v1527_0_8[14]);
                                        v1548(3, 4, 9, 14, l_l_v1527_0_8[15], l_l_v1527_0_8[16]);
                                    end;
                                    v1557 = v1487(v1557, l_v1527_0[0], l_v1527_0[8]);
                                    v1558 = v1487(v1558, l_v1527_0[1], l_v1527_0[9]);
                                    v1559 = v1487(v1559, l_v1527_0[2], l_v1527_0[10]);
                                    v1560 = v1487(v1560, l_v1527_0[3], l_v1527_0[11]);
                                    v1561 = v1487(v1561, l_v1527_0[4], l_v1527_0[12]);
                                    v1562 = v1487(v1562, l_v1527_0[5], l_v1527_0[13]);
                                    v1563 = v1487(v1563, l_v1527_0[6], l_v1527_0[14]);
                                    v1564 = v1487(v1564, l_v1527_0[7], l_v1527_0[15]);
                                end;
                                local l_v1557_1 = v1557;
                                local l_v1558_1 = v1558;
                                local l_v1559_1 = v1559;
                                local l_v1560_1 = v1560;
                                local l_v1561_1 = v1561;
                                local l_v1562_1 = v1562;
                                local l_v1563_1 = v1563;
                                v1549[8] = v1564;
                                v1549[7] = l_v1563_1;
                                v1549[6] = l_v1562_1;
                                v1549[5] = l_v1561_1;
                                v1549[4] = l_v1560_1;
                                v1549[3] = l_v1559_1;
                                v1549[2] = l_v1558_1;
                                v1549[1] = l_v1557_1;
                                return v1554;
                            end;
                        end;
                    end;
                end;
                v1174 = function(v1598, v1599, v1600, v1601)
                    -- upvalues: l_v1208_0 (ref), v1189 (ref), l_byte_1 (ref), v1156 (ref), v1158 (ref), v1163 (ref), v1160 (ref), v1157 (ref), v1155 (ref), v1162 (ref)
                    local l_l_v1208_0_1 = l_v1208_0;
                    local l_v1189_0 = v1189;
                    for v1604 = v1600, v1600 + v1601 - 1, 64 do
                        for v1605 = 0, 15 do
                            v1604 = v1604 + 4;
                            local v1606, v1607, v1608, v1609 = l_byte_1(v1599, v1604 - 3, v1604);
                            l_l_v1208_0_1[v1605] = v1156(v1158(v1609, 24), v1158(v1608, 16), v1158(v1607, 8), v1606);
                        end;
                        local v1610 = v1598[1];
                        local v1611 = v1598[2];
                        local v1612 = v1598[3];
                        local v1613 = v1598[4];
                        for v1614 = 0, 15, 4 do
                            local l_v1613_0 = v1613;
                            local l_v1612_0 = v1612;
                            local l_v1611_0 = v1611;
                            v1611 = v1163(v1160(v1157(v1613, v1155(v1611, v1157(v1612, v1613))) + (l_v1189_0[v1614 + 1] + l_l_v1208_0_1[v1614] + v1610), 7) + v1611);
                            v1612 = l_v1611_0;
                            v1613 = l_v1612_0;
                            v1610 = l_v1613_0;
                            l_v1613_0 = v1613;
                            l_v1612_0 = v1612;
                            l_v1611_0 = v1611;
                            v1611 = v1163(v1160(v1157(v1613, v1155(v1611, v1157(v1612, v1613))) + (l_v1189_0[v1614 + 2] + l_l_v1208_0_1[v1614 + 1] + v1610), 12) + v1611);
                            v1612 = l_v1611_0;
                            v1613 = l_v1612_0;
                            v1610 = l_v1613_0;
                            l_v1613_0 = v1613;
                            l_v1612_0 = v1612;
                            l_v1611_0 = v1611;
                            v1611 = v1163(v1160(v1157(v1613, v1155(v1611, v1157(v1612, v1613))) + (l_v1189_0[v1614 + 3] + l_l_v1208_0_1[v1614 + 2] + v1610), 17) + v1611);
                            v1612 = l_v1611_0;
                            v1613 = l_v1612_0;
                            v1610 = l_v1613_0;
                            l_v1613_0 = v1613;
                            l_v1612_0 = v1612;
                            l_v1611_0 = v1611;
                            v1611 = v1163(v1160(v1157(v1613, v1155(v1611, v1157(v1612, v1613))) + (l_v1189_0[v1614 + 4] + l_l_v1208_0_1[v1614 + 3] + v1610), 22) + v1611);
                            v1612 = l_v1611_0;
                            v1613 = l_v1612_0;
                            v1610 = l_v1613_0;
                        end;
                        for v1618 = 16, 31, 4 do
                            local v1619 = 5 * v1618;
                            local l_v1613_1 = v1613;
                            local l_v1612_1 = v1612;
                            local l_v1611_1 = v1611;
                            v1611 = v1163(v1160(v1157(v1612, v1155(v1613, v1157(v1611, v1612))) + (l_v1189_0[v1618 + 1] + l_l_v1208_0_1[v1155(v1619 + 1, 15)] + v1610), 5) + v1611);
                            v1612 = l_v1611_1;
                            v1613 = l_v1612_1;
                            v1610 = l_v1613_1;
                            l_v1613_1 = v1613;
                            l_v1612_1 = v1612;
                            l_v1611_1 = v1611;
                            v1611 = v1163(v1160(v1157(v1612, v1155(v1613, v1157(v1611, v1612))) + (l_v1189_0[v1618 + 2] + l_l_v1208_0_1[v1155(v1619 + 6, 15)] + v1610), 9) + v1611);
                            v1612 = l_v1611_1;
                            v1613 = l_v1612_1;
                            v1610 = l_v1613_1;
                            l_v1613_1 = v1613;
                            l_v1612_1 = v1612;
                            l_v1611_1 = v1611;
                            v1611 = v1163(v1160(v1157(v1612, v1155(v1613, v1157(v1611, v1612))) + (l_v1189_0[v1618 + 3] + l_l_v1208_0_1[v1155(v1619 - 5, 15)] + v1610), 14) + v1611);
                            v1612 = l_v1611_1;
                            v1613 = l_v1612_1;
                            v1610 = l_v1613_1;
                            l_v1613_1 = v1613;
                            l_v1612_1 = v1612;
                            l_v1611_1 = v1611;
                            v1611 = v1163(v1160(v1157(v1612, v1155(v1613, v1157(v1611, v1612))) + (l_v1189_0[v1618 + 4] + l_l_v1208_0_1[v1155(v1619, 15)] + v1610), 20) + v1611);
                            v1612 = l_v1611_1;
                            v1613 = l_v1612_1;
                            v1610 = l_v1613_1;
                        end;
                        for v1623 = 32, 47, 4 do
                            local v1624 = 3 * v1623;
                            local l_v1613_2 = v1613;
                            local l_v1612_2 = v1612;
                            local l_v1611_2 = v1611;
                            v1611 = v1163(v1160(v1157(v1611, v1612, v1613) + (l_v1189_0[v1623 + 1] + l_l_v1208_0_1[v1155(v1624 + 5, 15)] + v1610), 4) + v1611);
                            v1612 = l_v1611_2;
                            v1613 = l_v1612_2;
                            v1610 = l_v1613_2;
                            l_v1613_2 = v1613;
                            l_v1612_2 = v1612;
                            l_v1611_2 = v1611;
                            v1611 = v1163(v1160(v1157(v1611, v1612, v1613) + (l_v1189_0[v1623 + 2] + l_l_v1208_0_1[v1155(v1624 + 8, 15)] + v1610), 11) + v1611);
                            v1612 = l_v1611_2;
                            v1613 = l_v1612_2;
                            v1610 = l_v1613_2;
                            l_v1613_2 = v1613;
                            l_v1612_2 = v1612;
                            l_v1611_2 = v1611;
                            v1611 = v1163(v1160(v1157(v1611, v1612, v1613) + (l_v1189_0[v1623 + 3] + l_l_v1208_0_1[v1155(v1624 - 5, 15)] + v1610), 16) + v1611);
                            v1612 = l_v1611_2;
                            v1613 = l_v1612_2;
                            v1610 = l_v1613_2;
                            l_v1613_2 = v1613;
                            l_v1612_2 = v1612;
                            l_v1611_2 = v1611;
                            v1611 = v1163(v1160(v1157(v1611, v1612, v1613) + (l_v1189_0[v1623 + 4] + l_l_v1208_0_1[v1155(v1624 - 2, 15)] + v1610), 23) + v1611);
                            v1612 = l_v1611_2;
                            v1613 = l_v1612_2;
                            v1610 = l_v1613_2;
                        end;
                        for v1628 = 48, 63, 4 do
                            local v1629 = 7 * v1628;
                            local l_v1613_3 = v1613;
                            local l_v1612_3 = v1612;
                            local l_v1611_3 = v1611;
                            v1611 = v1163(v1160(v1157(v1612, v1156(v1611, v1162(v1613))) + (l_v1189_0[v1628 + 1] + l_l_v1208_0_1[v1155(v1629, 15)] + v1610), 6) + v1611);
                            v1612 = l_v1611_3;
                            v1613 = l_v1612_3;
                            v1610 = l_v1613_3;
                            l_v1613_3 = v1613;
                            l_v1612_3 = v1612;
                            l_v1611_3 = v1611;
                            v1611 = v1163(v1160(v1157(v1612, v1156(v1611, v1162(v1613))) + (l_v1189_0[v1628 + 2] + l_l_v1208_0_1[v1155(v1629 + 7, 15)] + v1610), 10) + v1611);
                            v1612 = l_v1611_3;
                            v1613 = l_v1612_3;
                            v1610 = l_v1613_3;
                            l_v1613_3 = v1613;
                            l_v1612_3 = v1612;
                            l_v1611_3 = v1611;
                            v1611 = v1163(v1160(v1157(v1612, v1156(v1611, v1162(v1613))) + (l_v1189_0[v1628 + 3] + l_l_v1208_0_1[v1155(v1629 - 2, 15)] + v1610), 15) + v1611);
                            v1612 = l_v1611_3;
                            v1613 = l_v1612_3;
                            v1610 = l_v1613_3;
                            l_v1613_3 = v1613;
                            l_v1612_3 = v1612;
                            l_v1611_3 = v1611;
                            v1611 = v1163(v1160(v1157(v1612, v1156(v1611, v1162(v1613))) + (l_v1189_0[v1628 + 4] + l_l_v1208_0_1[v1155(v1629 + 5, 15)] + v1610), 21) + v1611);
                            v1612 = l_v1611_3;
                            v1613 = l_v1612_3;
                            v1610 = l_v1613_3;
                        end;
                        local v1633 = v1163(v1610 + v1598[1]);
                        local v1634 = v1163(v1611 + v1598[2]);
                        local v1635 = v1163(v1612 + v1598[3]);
                        v1598[4] = v1163(v1613 + v1598[4]);
                        v1598[3] = v1635;
                        v1598[2] = v1634;
                        v1598[1] = v1633;
                    end;
                end;
                v1175 = function(v1636, v1637, v1638, v1639)
                    -- upvalues: l_v1208_0 (ref), l_byte_1 (ref), v1156 (ref), v1158 (ref), v1160 (ref), v1157 (ref), v1161 (ref), v1163 (ref), v1155 (ref)
                    local l_l_v1208_0_2 = l_v1208_0;
                    for v1641 = v1638, v1638 + v1639 - 1, 64 do
                        for v1642 = 0, 15 do
                            v1641 = v1641 + 4;
                            local v1643, v1644, v1645, v1646 = l_byte_1(v1637, v1641 - 3, v1641);
                            l_l_v1208_0_2[v1642] = v1156(v1158(v1643, 24), v1158(v1644, 16), v1158(v1645, 8), v1646);
                        end;
                        for v1647 = 16, 79 do
                            l_l_v1208_0_2[v1647] = v1160(v1157(l_l_v1208_0_2[v1647 - 3], l_l_v1208_0_2[v1647 - 8], l_l_v1208_0_2[v1647 - 14], l_l_v1208_0_2[v1647 - 16]), 1);
                        end;
                        local v1648 = v1636[1];
                        local v1649 = v1636[2];
                        local v1650 = v1636[3];
                        local v1651 = v1636[4];
                        local v1652 = v1636[5];
                        for v1653 = 0, 19, 5 do
                            local l_v1651_0 = v1651;
                            local l_v1650_0 = v1650;
                            local v1656 = v1161(v1649, 2);
                            local l_v1648_0 = v1648;
                            v1648 = v1163(v1160(v1648, 5) + v1157(v1651, v1155(v1649, v1157(v1651, v1650))) + (l_l_v1208_0_2[v1653] + 1518500249 + v1652));
                            v1649 = l_v1648_0;
                            v1650 = v1656;
                            v1651 = l_v1650_0;
                            v1652 = l_v1651_0;
                            l_v1651_0 = v1651;
                            l_v1650_0 = v1650;
                            v1656 = v1161(v1649, 2);
                            l_v1648_0 = v1648;
                            v1648 = v1163(v1160(v1648, 5) + v1157(v1651, v1155(v1649, v1157(v1651, v1650))) + (l_l_v1208_0_2[v1653 + 1] + 1518500249 + v1652));
                            v1649 = l_v1648_0;
                            v1650 = v1656;
                            v1651 = l_v1650_0;
                            v1652 = l_v1651_0;
                            l_v1651_0 = v1651;
                            l_v1650_0 = v1650;
                            v1656 = v1161(v1649, 2);
                            l_v1648_0 = v1648;
                            v1648 = v1163(v1160(v1648, 5) + v1157(v1651, v1155(v1649, v1157(v1651, v1650))) + (l_l_v1208_0_2[v1653 + 2] + 1518500249 + v1652));
                            v1649 = l_v1648_0;
                            v1650 = v1656;
                            v1651 = l_v1650_0;
                            v1652 = l_v1651_0;
                            l_v1651_0 = v1651;
                            l_v1650_0 = v1650;
                            v1656 = v1161(v1649, 2);
                            l_v1648_0 = v1648;
                            v1648 = v1163(v1160(v1648, 5) + v1157(v1651, v1155(v1649, v1157(v1651, v1650))) + (l_l_v1208_0_2[v1653 + 3] + 1518500249 + v1652));
                            v1649 = l_v1648_0;
                            v1650 = v1656;
                            v1651 = l_v1650_0;
                            v1652 = l_v1651_0;
                            l_v1651_0 = v1651;
                            l_v1650_0 = v1650;
                            v1656 = v1161(v1649, 2);
                            l_v1648_0 = v1648;
                            v1648 = v1163(v1160(v1648, 5) + v1157(v1651, v1155(v1649, v1157(v1651, v1650))) + (l_l_v1208_0_2[v1653 + 4] + 1518500249 + v1652));
                            v1649 = l_v1648_0;
                            v1650 = v1656;
                            v1651 = l_v1650_0;
                            v1652 = l_v1651_0;
                        end;
                        for v1658 = 20, 39, 5 do
                            local l_v1651_1 = v1651;
                            local l_v1650_1 = v1650;
                            local v1661 = v1161(v1649, 2);
                            local l_v1648_1 = v1648;
                            v1648 = v1163(v1160(v1648, 5) + v1157(v1649, v1650, v1651) + (l_l_v1208_0_2[v1658] + 1859775393 + v1652));
                            v1649 = l_v1648_1;
                            v1650 = v1661;
                            v1651 = l_v1650_1;
                            v1652 = l_v1651_1;
                            l_v1651_1 = v1651;
                            l_v1650_1 = v1650;
                            v1661 = v1161(v1649, 2);
                            l_v1648_1 = v1648;
                            v1648 = v1163(v1160(v1648, 5) + v1157(v1649, v1650, v1651) + (l_l_v1208_0_2[v1658 + 1] + 1859775393 + v1652));
                            v1649 = l_v1648_1;
                            v1650 = v1661;
                            v1651 = l_v1650_1;
                            v1652 = l_v1651_1;
                            l_v1651_1 = v1651;
                            l_v1650_1 = v1650;
                            v1661 = v1161(v1649, 2);
                            l_v1648_1 = v1648;
                            v1648 = v1163(v1160(v1648, 5) + v1157(v1649, v1650, v1651) + (l_l_v1208_0_2[v1658 + 2] + 1859775393 + v1652));
                            v1649 = l_v1648_1;
                            v1650 = v1661;
                            v1651 = l_v1650_1;
                            v1652 = l_v1651_1;
                            l_v1651_1 = v1651;
                            l_v1650_1 = v1650;
                            v1661 = v1161(v1649, 2);
                            l_v1648_1 = v1648;
                            v1648 = v1163(v1160(v1648, 5) + v1157(v1649, v1650, v1651) + (l_l_v1208_0_2[v1658 + 3] + 1859775393 + v1652));
                            v1649 = l_v1648_1;
                            v1650 = v1661;
                            v1651 = l_v1650_1;
                            v1652 = l_v1651_1;
                            l_v1651_1 = v1651;
                            l_v1650_1 = v1650;
                            v1661 = v1161(v1649, 2);
                            l_v1648_1 = v1648;
                            v1648 = v1163(v1160(v1648, 5) + v1157(v1649, v1650, v1651) + (l_l_v1208_0_2[v1658 + 4] + 1859775393 + v1652));
                            v1649 = l_v1648_1;
                            v1650 = v1661;
                            v1651 = l_v1650_1;
                            v1652 = l_v1651_1;
                        end;
                        for v1663 = 40, 59, 5 do
                            local l_v1651_2 = v1651;
                            local l_v1650_2 = v1650;
                            local v1666 = v1161(v1649, 2);
                            local l_v1648_2 = v1648;
                            v1648 = v1163(v1160(v1648, 5) + v1157(v1155(v1651, v1157(v1649, v1650)), v1155(v1649, v1650)) + (l_l_v1208_0_2[v1663] + 2400959708 + v1652));
                            v1649 = l_v1648_2;
                            v1650 = v1666;
                            v1651 = l_v1650_2;
                            v1652 = l_v1651_2;
                            l_v1651_2 = v1651;
                            l_v1650_2 = v1650;
                            v1666 = v1161(v1649, 2);
                            l_v1648_2 = v1648;
                            v1648 = v1163(v1160(v1648, 5) + v1157(v1155(v1651, v1157(v1649, v1650)), v1155(v1649, v1650)) + (l_l_v1208_0_2[v1663 + 1] + 2400959708 + v1652));
                            v1649 = l_v1648_2;
                            v1650 = v1666;
                            v1651 = l_v1650_2;
                            v1652 = l_v1651_2;
                            l_v1651_2 = v1651;
                            l_v1650_2 = v1650;
                            v1666 = v1161(v1649, 2);
                            l_v1648_2 = v1648;
                            v1648 = v1163(v1160(v1648, 5) + v1157(v1155(v1651, v1157(v1649, v1650)), v1155(v1649, v1650)) + (l_l_v1208_0_2[v1663 + 2] + 2400959708 + v1652));
                            v1649 = l_v1648_2;
                            v1650 = v1666;
                            v1651 = l_v1650_2;
                            v1652 = l_v1651_2;
                            l_v1651_2 = v1651;
                            l_v1650_2 = v1650;
                            v1666 = v1161(v1649, 2);
                            l_v1648_2 = v1648;
                            v1648 = v1163(v1160(v1648, 5) + v1157(v1155(v1651, v1157(v1649, v1650)), v1155(v1649, v1650)) + (l_l_v1208_0_2[v1663 + 3] + 2400959708 + v1652));
                            v1649 = l_v1648_2;
                            v1650 = v1666;
                            v1651 = l_v1650_2;
                            v1652 = l_v1651_2;
                            l_v1651_2 = v1651;
                            l_v1650_2 = v1650;
                            v1666 = v1161(v1649, 2);
                            l_v1648_2 = v1648;
                            v1648 = v1163(v1160(v1648, 5) + v1157(v1155(v1651, v1157(v1649, v1650)), v1155(v1649, v1650)) + (l_l_v1208_0_2[v1663 + 4] + 2400959708 + v1652));
                            v1649 = l_v1648_2;
                            v1650 = v1666;
                            v1651 = l_v1650_2;
                            v1652 = l_v1651_2;
                        end;
                        for v1668 = 60, 79, 5 do
                            local l_v1651_3 = v1651;
                            local l_v1650_3 = v1650;
                            local v1671 = v1161(v1649, 2);
                            local l_v1648_3 = v1648;
                            v1648 = v1163(v1160(v1648, 5) + v1157(v1649, v1650, v1651) + (l_l_v1208_0_2[v1668] + 3395469782 + v1652));
                            v1649 = l_v1648_3;
                            v1650 = v1671;
                            v1651 = l_v1650_3;
                            v1652 = l_v1651_3;
                            l_v1651_3 = v1651;
                            l_v1650_3 = v1650;
                            v1671 = v1161(v1649, 2);
                            l_v1648_3 = v1648;
                            v1648 = v1163(v1160(v1648, 5) + v1157(v1649, v1650, v1651) + (l_l_v1208_0_2[v1668 + 1] + 3395469782 + v1652));
                            v1649 = l_v1648_3;
                            v1650 = v1671;
                            v1651 = l_v1650_3;
                            v1652 = l_v1651_3;
                            l_v1651_3 = v1651;
                            l_v1650_3 = v1650;
                            v1671 = v1161(v1649, 2);
                            l_v1648_3 = v1648;
                            v1648 = v1163(v1160(v1648, 5) + v1157(v1649, v1650, v1651) + (l_l_v1208_0_2[v1668 + 2] + 3395469782 + v1652));
                            v1649 = l_v1648_3;
                            v1650 = v1671;
                            v1651 = l_v1650_3;
                            v1652 = l_v1651_3;
                            l_v1651_3 = v1651;
                            l_v1650_3 = v1650;
                            v1671 = v1161(v1649, 2);
                            l_v1648_3 = v1648;
                            v1648 = v1163(v1160(v1648, 5) + v1157(v1649, v1650, v1651) + (l_l_v1208_0_2[v1668 + 3] + 3395469782 + v1652));
                            v1649 = l_v1648_3;
                            v1650 = v1671;
                            v1651 = l_v1650_3;
                            v1652 = l_v1651_3;
                            l_v1651_3 = v1651;
                            l_v1650_3 = v1650;
                            v1671 = v1161(v1649, 2);
                            l_v1648_3 = v1648;
                            v1648 = v1163(v1160(v1648, 5) + v1157(v1649, v1650, v1651) + (l_l_v1208_0_2[v1668 + 4] + 3395469782 + v1652));
                            v1649 = l_v1648_3;
                            v1650 = v1671;
                            v1651 = l_v1650_3;
                            v1652 = l_v1651_3;
                        end;
                        local v1673 = v1163(v1648 + v1636[1]);
                        local v1674 = v1163(v1649 + v1636[2]);
                        local v1675 = v1163(v1650 + v1636[3]);
                        local v1676 = v1163(v1651 + v1636[4]);
                        v1636[5] = v1163(v1652 + v1636[5]);
                        v1636[4] = v1676;
                        v1636[3] = v1675;
                        v1636[2] = v1674;
                        v1636[1] = v1673;
                    end;
                end;
            end;
        end;
        if v1154 == "FFI" and not v1142 or v1154 == "LJ" then
            if v1154 == "FFI" then
                local v1677 = v1144.typeof("int32_t[?]");
                do
                    local l_v1677_0 = v1677;
                    v1171 = function()
                        -- upvalues: l_v1677_0 (ref)
                        return l_v1677_0(31);
                    end;
                end;
            end;
            v1176 = function(v1679, v1680, v1681, v1682, v1683, v1684)
                -- upvalues: v1184 (ref), v1185 (ref), v1159 (ref), l_byte_1 (ref), v1157 (ref), v1156 (ref), v1158 (ref), v1155 (ref), v1162 (ref)
                local l_v1184_1 = v1184;
                local l_v1185_0 = v1185;
                local v1687 = v1159(v1684, 3);
                for v1688 = v1682, v1682 + v1683 - 1, v1684 do
                    for v1689 = 1, v1687 do
                        local v1690, v1691, v1692, v1693 = l_byte_1(v1681, v1688 + 1, v1688 + 4);
                        v1679[v1689] = v1157(v1679[v1689], v1156(v1158(v1693, 24), v1158(v1692, 16), v1158(v1691, 8), v1690));
                        v1688 = v1688 + 8;
                        local v1694, v1695, v1696, v1697 = l_byte_1(v1681, v1688 - 3, v1688);
                        v1680[v1689] = v1157(v1680[v1689], v1156(v1158(v1697, 24), v1158(v1696, 16), v1158(v1695, 8), v1694));
                    end;
                    for v1698 = 1, 24 do
                        for v1699 = 1, 5 do
                            v1679[25 + v1699] = v1157(v1679[v1699], v1679[v1699 + 5], v1679[v1699 + 10], v1679[v1699 + 15], v1679[v1699 + 20]);
                        end;
                        for v1700 = 1, 5 do
                            v1680[25 + v1700] = v1157(v1680[v1700], v1680[v1700 + 5], v1680[v1700 + 10], v1680[v1700 + 15], v1680[v1700 + 20]);
                        end;
                        local v1701 = v1157(v1679[26], v1158(v1679[28], 1), v1159(v1680[28], 31));
                        local v1702 = v1157(v1680[26], v1158(v1680[28], 1), v1159(v1679[28], 31));
                        local v1703 = v1157(v1159(v1157(v1701, v1679[7]), 20), v1158(v1157(v1702, v1680[7]), 12));
                        local v1704 = v1157(v1159(v1157(v1702, v1680[7]), 20), v1158(v1157(v1701, v1679[7]), 12));
                        local v1705 = v1157(v1159(v1157(v1701, v1679[17]), 19), v1158(v1157(v1702, v1680[17]), 13));
                        local v1706 = v1157(v1159(v1157(v1702, v1680[17]), 19), v1158(v1157(v1701, v1679[17]), 13));
                        local v1707 = v1157(v1158(v1157(v1701, v1679[2]), 1), v1159(v1157(v1702, v1680[2]), 31));
                        local v1708 = v1157(v1158(v1157(v1702, v1680[2]), 1), v1159(v1157(v1701, v1679[2]), 31));
                        local v1709 = v1157(v1158(v1157(v1701, v1679[12]), 10), v1159(v1157(v1702, v1680[12]), 22));
                        v1680[17] = v1157(v1158(v1157(v1702, v1680[12]), 10), v1159(v1157(v1701, v1679[12]), 22));
                        v1679[17] = v1709;
                        v1680[12] = v1708;
                        v1679[12] = v1707;
                        v1680[7] = v1706;
                        v1679[7] = v1705;
                        v1680[2] = v1704;
                        v1679[2] = v1703;
                        v1703 = v1157(v1701, v1679[22]);
                        v1704 = v1157(v1702, v1680[22]);
                        v1705 = v1157(v1158(v1703, 2), v1159(v1704, 30));
                        v1680[22] = v1157(v1158(v1704, 2), v1159(v1703, 30));
                        v1679[22] = v1705;
                        v1701 = v1157(v1679[27], v1158(v1679[29], 1), v1159(v1680[29], 31));
                        v1702 = v1157(v1680[27], v1158(v1680[29], 1), v1159(v1679[29], 31));
                        v1705 = v1157(v1159(v1157(v1701, v1679[13]), 21), v1158(v1157(v1702, v1680[13]), 11));
                        v1706 = v1157(v1159(v1157(v1702, v1680[13]), 21), v1158(v1157(v1701, v1679[13]), 11));
                        v1707 = v1157(v1159(v1157(v1701, v1679[23]), 3), v1158(v1157(v1702, v1680[23]), 29));
                        v1708 = v1157(v1159(v1157(v1702, v1680[23]), 3), v1158(v1157(v1701, v1679[23]), 29));
                        v1709 = v1157(v1158(v1157(v1701, v1679[8]), 6), v1159(v1157(v1702, v1680[8]), 26));
                        local v1710 = v1157(v1158(v1157(v1702, v1680[8]), 6), v1159(v1157(v1701, v1679[8]), 26));
                        local v1711 = v1157(v1159(v1157(v1701, v1679[3]), 2), v1158(v1157(v1702, v1680[3]), 30));
                        v1680[23] = v1157(v1159(v1157(v1702, v1680[3]), 2), v1158(v1157(v1701, v1679[3]), 30));
                        v1679[23] = v1711;
                        v1680[13] = v1710;
                        v1679[13] = v1709;
                        v1680[8] = v1708;
                        v1679[8] = v1707;
                        v1680[3] = v1706;
                        v1679[3] = v1705;
                        v1705 = v1157(v1701, v1679[18]);
                        v1704 = v1157(v1702, v1680[18]);
                        v1703 = v1705;
                        v1705 = v1157(v1158(v1703, 15), v1159(v1704, 17));
                        v1680[18] = v1157(v1158(v1704, 15), v1159(v1703, 17));
                        v1679[18] = v1705;
                        v1701 = v1157(v1679[28], v1158(v1679[30], 1), v1159(v1680[30], 31));
                        v1702 = v1157(v1680[28], v1158(v1680[30], 1), v1159(v1679[30], 31));
                        v1705 = v1157(v1158(v1157(v1701, v1679[19]), 21), v1159(v1157(v1702, v1680[19]), 11));
                        v1706 = v1157(v1158(v1157(v1702, v1680[19]), 21), v1159(v1157(v1701, v1679[19]), 11));
                        v1707 = v1157(v1158(v1157(v1701, v1679[4]), 28), v1159(v1157(v1702, v1680[4]), 4));
                        v1708 = v1157(v1158(v1157(v1702, v1680[4]), 28), v1159(v1157(v1701, v1679[4]), 4));
                        v1709 = v1157(v1159(v1157(v1701, v1679[24]), 8), v1158(v1157(v1702, v1680[24]), 24));
                        v1710 = v1157(v1159(v1157(v1702, v1680[24]), 8), v1158(v1157(v1701, v1679[24]), 24));
                        v1711 = v1157(v1159(v1157(v1701, v1679[9]), 9), v1158(v1157(v1702, v1680[9]), 23));
                        v1680[24] = v1157(v1159(v1157(v1702, v1680[9]), 9), v1158(v1157(v1701, v1679[9]), 23));
                        v1679[24] = v1711;
                        v1680[19] = v1710;
                        v1679[19] = v1709;
                        v1680[9] = v1708;
                        v1679[9] = v1707;
                        v1680[4] = v1706;
                        v1679[4] = v1705;
                        v1705 = v1157(v1701, v1679[14]);
                        v1704 = v1157(v1702, v1680[14]);
                        v1703 = v1705;
                        v1705 = v1157(v1158(v1703, 25), v1159(v1704, 7));
                        v1680[14] = v1157(v1158(v1704, 25), v1159(v1703, 7));
                        v1679[14] = v1705;
                        v1701 = v1157(v1679[29], v1158(v1679[26], 1), v1159(v1680[26], 31));
                        v1702 = v1157(v1680[29], v1158(v1680[26], 1), v1159(v1679[26], 31));
                        v1705 = v1157(v1158(v1157(v1701, v1679[25]), 14), v1159(v1157(v1702, v1680[25]), 18));
                        v1706 = v1157(v1158(v1157(v1702, v1680[25]), 14), v1159(v1157(v1701, v1679[25]), 18));
                        v1707 = v1157(v1158(v1157(v1701, v1679[20]), 8), v1159(v1157(v1702, v1680[20]), 24));
                        v1708 = v1157(v1158(v1157(v1702, v1680[20]), 8), v1159(v1157(v1701, v1679[20]), 24));
                        v1709 = v1157(v1158(v1157(v1701, v1679[5]), 27), v1159(v1157(v1702, v1680[5]), 5));
                        v1710 = v1157(v1158(v1157(v1702, v1680[5]), 27), v1159(v1157(v1701, v1679[5]), 5));
                        v1711 = v1157(v1159(v1157(v1701, v1679[15]), 25), v1158(v1157(v1702, v1680[15]), 7));
                        v1680[25] = v1157(v1159(v1157(v1702, v1680[15]), 25), v1158(v1157(v1701, v1679[15]), 7));
                        v1679[25] = v1711;
                        v1680[20] = v1710;
                        v1679[20] = v1709;
                        v1680[15] = v1708;
                        v1679[15] = v1707;
                        v1680[5] = v1706;
                        v1679[5] = v1705;
                        v1705 = v1157(v1701, v1679[10]);
                        v1704 = v1157(v1702, v1680[10]);
                        v1703 = v1705;
                        v1705 = v1157(v1158(v1703, 20), v1159(v1704, 12));
                        v1680[10] = v1157(v1158(v1704, 20), v1159(v1703, 12));
                        v1679[10] = v1705;
                        v1701 = v1157(v1679[30], v1158(v1679[27], 1), v1159(v1680[27], 31));
                        v1702 = v1157(v1680[30], v1158(v1680[27], 1), v1159(v1679[27], 31));
                        v1705 = v1157(v1158(v1157(v1701, v1679[11]), 3), v1159(v1157(v1702, v1680[11]), 29));
                        v1706 = v1157(v1158(v1157(v1702, v1680[11]), 3), v1159(v1157(v1701, v1679[11]), 29));
                        v1707 = v1157(v1158(v1157(v1701, v1679[21]), 18), v1159(v1157(v1702, v1680[21]), 14));
                        v1708 = v1157(v1158(v1157(v1702, v1680[21]), 18), v1159(v1157(v1701, v1679[21]), 14));
                        v1709 = v1157(v1159(v1157(v1701, v1679[6]), 28), v1158(v1157(v1702, v1680[6]), 4));
                        v1710 = v1157(v1159(v1157(v1702, v1680[6]), 28), v1158(v1157(v1701, v1679[6]), 4));
                        v1711 = v1157(v1159(v1157(v1701, v1679[16]), 23), v1158(v1157(v1702, v1680[16]), 9));
                        v1680[21] = v1157(v1159(v1157(v1702, v1680[16]), 23), v1158(v1157(v1701, v1679[16]), 9));
                        v1679[21] = v1711;
                        v1680[16] = v1710;
                        v1679[16] = v1709;
                        v1680[11] = v1708;
                        v1679[11] = v1707;
                        v1680[6] = v1706;
                        v1679[6] = v1705;
                        v1705 = v1157(v1701, v1679[1]);
                        v1680[1] = v1157(v1702, v1680[1]);
                        v1679[1] = v1705;
                        v1705 = v1157(v1679[1], v1155(v1162(v1679[2]), v1679[3]), l_v1184_1[v1698]);
                        v1706 = v1157(v1679[2], v1155(v1162(v1679[3]), v1679[4]));
                        v1707 = v1157(v1679[3], v1155(v1162(v1679[4]), v1679[5]));
                        v1708 = v1157(v1679[4], v1155(v1162(v1679[5]), v1679[1]));
                        v1679[5] = v1157(v1679[5], v1155(v1162(v1679[1]), v1679[2]));
                        v1679[4] = v1708;
                        v1679[3] = v1707;
                        v1679[2] = v1706;
                        v1679[1] = v1705;
                        v1705 = v1157(v1679[9], v1155(v1162(v1679[10]), v1679[6]));
                        v1706 = v1157(v1679[10], v1155(v1162(v1679[6]), v1679[7]));
                        v1707 = v1157(v1679[6], v1155(v1162(v1679[7]), v1679[8]));
                        v1708 = v1157(v1679[7], v1155(v1162(v1679[8]), v1679[9]));
                        v1679[10] = v1157(v1679[8], v1155(v1162(v1679[9]), v1679[10]));
                        v1679[9] = v1708;
                        v1679[8] = v1707;
                        v1679[7] = v1706;
                        v1679[6] = v1705;
                        v1705 = v1157(v1679[12], v1155(v1162(v1679[13]), v1679[14]));
                        v1706 = v1157(v1679[13], v1155(v1162(v1679[14]), v1679[15]));
                        v1707 = v1157(v1679[14], v1155(v1162(v1679[15]), v1679[11]));
                        v1708 = v1157(v1679[15], v1155(v1162(v1679[11]), v1679[12]));
                        v1679[15] = v1157(v1679[11], v1155(v1162(v1679[12]), v1679[13]));
                        v1679[14] = v1708;
                        v1679[13] = v1707;
                        v1679[12] = v1706;
                        v1679[11] = v1705;
                        v1705 = v1157(v1679[20], v1155(v1162(v1679[16]), v1679[17]));
                        v1706 = v1157(v1679[16], v1155(v1162(v1679[17]), v1679[18]));
                        v1707 = v1157(v1679[17], v1155(v1162(v1679[18]), v1679[19]));
                        v1708 = v1157(v1679[18], v1155(v1162(v1679[19]), v1679[20]));
                        v1679[20] = v1157(v1679[19], v1155(v1162(v1679[20]), v1679[16]));
                        v1679[19] = v1708;
                        v1679[18] = v1707;
                        v1679[17] = v1706;
                        v1679[16] = v1705;
                        v1705 = v1157(v1679[23], v1155(v1162(v1679[24]), v1679[25]));
                        v1706 = v1157(v1679[24], v1155(v1162(v1679[25]), v1679[21]));
                        v1707 = v1157(v1679[25], v1155(v1162(v1679[21]), v1679[22]));
                        v1708 = v1157(v1679[21], v1155(v1162(v1679[22]), v1679[23]));
                        v1679[25] = v1157(v1679[22], v1155(v1162(v1679[23]), v1679[24]));
                        v1679[24] = v1708;
                        v1679[23] = v1707;
                        v1679[22] = v1706;
                        v1679[21] = v1705;
                        v1705 = v1157(v1680[1], v1155(v1162(v1680[2]), v1680[3]), l_v1185_0[v1698]);
                        v1706 = v1157(v1680[2], v1155(v1162(v1680[3]), v1680[4]));
                        v1707 = v1157(v1680[3], v1155(v1162(v1680[4]), v1680[5]));
                        v1708 = v1157(v1680[4], v1155(v1162(v1680[5]), v1680[1]));
                        v1680[5] = v1157(v1680[5], v1155(v1162(v1680[1]), v1680[2]));
                        v1680[4] = v1708;
                        v1680[3] = v1707;
                        v1680[2] = v1706;
                        v1680[1] = v1705;
                        v1705 = v1157(v1680[9], v1155(v1162(v1680[10]), v1680[6]));
                        v1706 = v1157(v1680[10], v1155(v1162(v1680[6]), v1680[7]));
                        v1707 = v1157(v1680[6], v1155(v1162(v1680[7]), v1680[8]));
                        v1708 = v1157(v1680[7], v1155(v1162(v1680[8]), v1680[9]));
                        v1680[10] = v1157(v1680[8], v1155(v1162(v1680[9]), v1680[10]));
                        v1680[9] = v1708;
                        v1680[8] = v1707;
                        v1680[7] = v1706;
                        v1680[6] = v1705;
                        v1705 = v1157(v1680[12], v1155(v1162(v1680[13]), v1680[14]));
                        v1706 = v1157(v1680[13], v1155(v1162(v1680[14]), v1680[15]));
                        v1707 = v1157(v1680[14], v1155(v1162(v1680[15]), v1680[11]));
                        v1708 = v1157(v1680[15], v1155(v1162(v1680[11]), v1680[12]));
                        v1680[15] = v1157(v1680[11], v1155(v1162(v1680[12]), v1680[13]));
                        v1680[14] = v1708;
                        v1680[13] = v1707;
                        v1680[12] = v1706;
                        v1680[11] = v1705;
                        v1705 = v1157(v1680[20], v1155(v1162(v1680[16]), v1680[17]));
                        v1706 = v1157(v1680[16], v1155(v1162(v1680[17]), v1680[18]));
                        v1707 = v1157(v1680[17], v1155(v1162(v1680[18]), v1680[19]));
                        v1708 = v1157(v1680[18], v1155(v1162(v1680[19]), v1680[20]));
                        v1680[20] = v1157(v1680[19], v1155(v1162(v1680[20]), v1680[16]));
                        v1680[19] = v1708;
                        v1680[18] = v1707;
                        v1680[17] = v1706;
                        v1680[16] = v1705;
                        v1705 = v1157(v1680[23], v1155(v1162(v1680[24]), v1680[25]));
                        v1706 = v1157(v1680[24], v1155(v1162(v1680[25]), v1680[21]));
                        v1707 = v1157(v1680[25], v1155(v1162(v1680[21]), v1680[22]));
                        v1708 = v1157(v1680[21], v1155(v1162(v1680[22]), v1680[23]));
                        v1680[25] = v1157(v1680[22], v1155(v1162(v1680[23]), v1680[24]));
                        v1680[24] = v1708;
                        v1680[23] = v1707;
                        v1680[22] = v1706;
                        v1680[21] = v1705;
                    end;
                end;
            end;
        end;
        if v1154 == "LJ" then
            v1172 = function(v1712, v1713, v1714, v1715)
                -- upvalues: v1194 (ref), v1181 (ref), l_byte_1 (ref), v1156 (ref), v1158 (ref), v1163 (ref), v1157 (ref), v1161 (ref), v1160 (ref), v1159 (ref), v1155 (ref)
                local l_v1194_2 = v1194;
                local l_v1181_1 = v1181;
                for v1718 = v1714, v1714 + v1715 - 1, 64 do
                    for v1719 = 1, 16 do
                        v1718 = v1718 + 4;
                        local v1720, v1721, v1722, v1723 = l_byte_1(v1713, v1718 - 3, v1718);
                        l_v1194_2[v1719] = v1156(v1158(v1720, 24), v1158(v1721, 16), v1158(v1722, 8), v1723);
                    end;
                    for v1724 = 17, 64 do
                        local v1725 = l_v1194_2[v1724 - 15];
                        local v1726 = l_v1194_2[v1724 - 2];
                        l_v1194_2[v1724] = v1163(v1163(v1157(v1161(v1725, 7), v1160(v1725, 14), v1159(v1725, 3)) + v1157(v1160(v1726, 15), v1160(v1726, 13), v1159(v1726, 10))) + v1163(l_v1194_2[v1724 - 7] + l_v1194_2[v1724 - 16]));
                    end;
                    local v1727 = v1712[1];
                    local v1728 = v1712[2];
                    local v1729 = v1712[3];
                    local v1730 = v1712[4];
                    local v1731 = v1712[5];
                    local v1732 = v1712[6];
                    local v1733 = v1712[7];
                    local v1734 = v1712[8];
                    for v1735 = 1, 64, 8 do
                        local v1736 = v1163(v1157(v1161(v1731, 6), v1161(v1731, 11), v1160(v1731, 7)) + v1157(v1733, v1155(v1731, v1157(v1732, v1733))) + (l_v1181_1[v1735] + l_v1194_2[v1735] + v1734));
                        local l_v1733_0 = v1733;
                        local l_v1732_0 = v1732;
                        local l_v1731_0 = v1731;
                        v1731 = v1163(v1730 + v1736);
                        v1732 = l_v1731_0;
                        v1733 = l_v1732_0;
                        v1734 = l_v1733_0;
                        l_v1733_0 = v1729;
                        l_v1732_0 = v1728;
                        l_v1731_0 = v1727;
                        v1727 = v1163(v1157(v1155(v1727, v1157(v1728, v1729)), v1155(v1728, v1729)) + v1157(v1161(v1727, 2), v1161(v1727, 13), v1160(v1727, 10)) + v1736);
                        v1728 = l_v1731_0;
                        v1729 = l_v1732_0;
                        v1730 = l_v1733_0;
                        v1736 = v1163(v1157(v1161(v1731, 6), v1161(v1731, 11), v1160(v1731, 7)) + v1157(v1733, v1155(v1731, v1157(v1732, v1733))) + (l_v1181_1[v1735 + 1] + l_v1194_2[v1735 + 1] + v1734));
                        l_v1733_0 = v1733;
                        l_v1732_0 = v1732;
                        l_v1731_0 = v1731;
                        v1731 = v1163(v1730 + v1736);
                        v1732 = l_v1731_0;
                        v1733 = l_v1732_0;
                        v1734 = l_v1733_0;
                        l_v1733_0 = v1729;
                        l_v1732_0 = v1728;
                        l_v1731_0 = v1727;
                        v1727 = v1163(v1157(v1155(v1727, v1157(v1728, v1729)), v1155(v1728, v1729)) + v1157(v1161(v1727, 2), v1161(v1727, 13), v1160(v1727, 10)) + v1736);
                        v1728 = l_v1731_0;
                        v1729 = l_v1732_0;
                        v1730 = l_v1733_0;
                        v1736 = v1163(v1157(v1161(v1731, 6), v1161(v1731, 11), v1160(v1731, 7)) + v1157(v1733, v1155(v1731, v1157(v1732, v1733))) + (l_v1181_1[v1735 + 2] + l_v1194_2[v1735 + 2] + v1734));
                        l_v1733_0 = v1733;
                        l_v1732_0 = v1732;
                        l_v1731_0 = v1731;
                        v1731 = v1163(v1730 + v1736);
                        v1732 = l_v1731_0;
                        v1733 = l_v1732_0;
                        v1734 = l_v1733_0;
                        l_v1733_0 = v1729;
                        l_v1732_0 = v1728;
                        l_v1731_0 = v1727;
                        v1727 = v1163(v1157(v1155(v1727, v1157(v1728, v1729)), v1155(v1728, v1729)) + v1157(v1161(v1727, 2), v1161(v1727, 13), v1160(v1727, 10)) + v1736);
                        v1728 = l_v1731_0;
                        v1729 = l_v1732_0;
                        v1730 = l_v1733_0;
                        v1736 = v1163(v1157(v1161(v1731, 6), v1161(v1731, 11), v1160(v1731, 7)) + v1157(v1733, v1155(v1731, v1157(v1732, v1733))) + (l_v1181_1[v1735 + 3] + l_v1194_2[v1735 + 3] + v1734));
                        l_v1733_0 = v1733;
                        l_v1732_0 = v1732;
                        l_v1731_0 = v1731;
                        v1731 = v1163(v1730 + v1736);
                        v1732 = l_v1731_0;
                        v1733 = l_v1732_0;
                        v1734 = l_v1733_0;
                        l_v1733_0 = v1729;
                        l_v1732_0 = v1728;
                        l_v1731_0 = v1727;
                        v1727 = v1163(v1157(v1155(v1727, v1157(v1728, v1729)), v1155(v1728, v1729)) + v1157(v1161(v1727, 2), v1161(v1727, 13), v1160(v1727, 10)) + v1736);
                        v1728 = l_v1731_0;
                        v1729 = l_v1732_0;
                        v1730 = l_v1733_0;
                        v1736 = v1163(v1157(v1161(v1731, 6), v1161(v1731, 11), v1160(v1731, 7)) + v1157(v1733, v1155(v1731, v1157(v1732, v1733))) + (l_v1181_1[v1735 + 4] + l_v1194_2[v1735 + 4] + v1734));
                        l_v1733_0 = v1733;
                        l_v1732_0 = v1732;
                        l_v1731_0 = v1731;
                        v1731 = v1163(v1730 + v1736);
                        v1732 = l_v1731_0;
                        v1733 = l_v1732_0;
                        v1734 = l_v1733_0;
                        l_v1733_0 = v1729;
                        l_v1732_0 = v1728;
                        l_v1731_0 = v1727;
                        v1727 = v1163(v1157(v1155(v1727, v1157(v1728, v1729)), v1155(v1728, v1729)) + v1157(v1161(v1727, 2), v1161(v1727, 13), v1160(v1727, 10)) + v1736);
                        v1728 = l_v1731_0;
                        v1729 = l_v1732_0;
                        v1730 = l_v1733_0;
                        v1736 = v1163(v1157(v1161(v1731, 6), v1161(v1731, 11), v1160(v1731, 7)) + v1157(v1733, v1155(v1731, v1157(v1732, v1733))) + (l_v1181_1[v1735 + 5] + l_v1194_2[v1735 + 5] + v1734));
                        l_v1733_0 = v1733;
                        l_v1732_0 = v1732;
                        l_v1731_0 = v1731;
                        v1731 = v1163(v1730 + v1736);
                        v1732 = l_v1731_0;
                        v1733 = l_v1732_0;
                        v1734 = l_v1733_0;
                        l_v1733_0 = v1729;
                        l_v1732_0 = v1728;
                        l_v1731_0 = v1727;
                        v1727 = v1163(v1157(v1155(v1727, v1157(v1728, v1729)), v1155(v1728, v1729)) + v1157(v1161(v1727, 2), v1161(v1727, 13), v1160(v1727, 10)) + v1736);
                        v1728 = l_v1731_0;
                        v1729 = l_v1732_0;
                        v1730 = l_v1733_0;
                        v1736 = v1163(v1157(v1161(v1731, 6), v1161(v1731, 11), v1160(v1731, 7)) + v1157(v1733, v1155(v1731, v1157(v1732, v1733))) + (l_v1181_1[v1735 + 6] + l_v1194_2[v1735 + 6] + v1734));
                        l_v1733_0 = v1733;
                        l_v1732_0 = v1732;
                        l_v1731_0 = v1731;
                        v1731 = v1163(v1730 + v1736);
                        v1732 = l_v1731_0;
                        v1733 = l_v1732_0;
                        v1734 = l_v1733_0;
                        l_v1733_0 = v1729;
                        l_v1732_0 = v1728;
                        l_v1731_0 = v1727;
                        v1727 = v1163(v1157(v1155(v1727, v1157(v1728, v1729)), v1155(v1728, v1729)) + v1157(v1161(v1727, 2), v1161(v1727, 13), v1160(v1727, 10)) + v1736);
                        v1728 = l_v1731_0;
                        v1729 = l_v1732_0;
                        v1730 = l_v1733_0;
                        v1736 = v1163(v1157(v1161(v1731, 6), v1161(v1731, 11), v1160(v1731, 7)) + v1157(v1733, v1155(v1731, v1157(v1732, v1733))) + (l_v1181_1[v1735 + 7] + l_v1194_2[v1735 + 7] + v1734));
                        l_v1733_0 = v1733;
                        l_v1732_0 = v1732;
                        l_v1731_0 = v1731;
                        v1731 = v1163(v1730 + v1736);
                        v1732 = l_v1731_0;
                        v1733 = l_v1732_0;
                        v1734 = l_v1733_0;
                        l_v1733_0 = v1729;
                        l_v1732_0 = v1728;
                        l_v1731_0 = v1727;
                        v1727 = v1163(v1157(v1155(v1727, v1157(v1728, v1729)), v1155(v1728, v1729)) + v1157(v1161(v1727, 2), v1161(v1727, 13), v1160(v1727, 10)) + v1736);
                        v1728 = l_v1731_0;
                        v1729 = l_v1732_0;
                        v1730 = l_v1733_0;
                    end;
                    local v1740 = v1163(v1727 + v1712[1]);
                    local v1741 = v1163(v1728 + v1712[2]);
                    local v1742 = v1163(v1729 + v1712[3]);
                    v1712[4] = v1163(v1730 + v1712[4]);
                    v1712[3] = v1742;
                    v1712[2] = v1741;
                    v1712[1] = v1740;
                    v1740 = v1163(v1731 + v1712[5]);
                    v1741 = v1163(v1732 + v1712[6]);
                    v1742 = v1163(v1733 + v1712[7]);
                    v1712[8] = v1163(v1734 + v1712[8]);
                    v1712[7] = v1742;
                    v1712[6] = v1741;
                    v1712[5] = v1740;
                end;
            end;
            local function v1753(v1743, v1744, v1745, v1746, v1747, v1748, v1749, v1750)
                -- upvalues: v1163 (ref), l_floor_1 (ref)
                local v1751 = v1743 % 4294967296 + v1745 % 4294967296 + v1747 % 4294967296 + v1749 % 4294967296;
                local v1752 = v1744 + v1746 + v1748 + v1750;
                return v1163(v1751), (v1163(v1752 + l_floor_1(v1751 / 4294967296)));
            end;
            do
                local l_v1753_0 = v1753;
                v1173 = v1143 == "x86" and function(v1755, v1756, v1757, v1758, v1759)
                    -- upvalues: v1194 (ref), v1180 (ref), v1181 (ref), l_byte_1 (ref), v1156 (ref), v1158 (ref), v1157 (ref), v1159 (ref), l_v1753_0 (ref), v1155 (ref), v1163 (ref), l_floor_1 (ref)
                    local l_v1194_3 = v1194;
                    local l_v1180_2 = v1180;
                    local l_v1181_2 = v1181;
                    for v1763 = v1758, v1758 + v1759 - 1, 128 do
                        for v1764 = 1, 32 do
                            v1763 = v1763 + 4;
                            local v1765, v1766, v1767, v1768 = l_byte_1(v1757, v1763 - 3, v1763);
                            l_v1194_3[v1764] = v1156(v1158(v1765, 24), v1158(v1766, 16), v1158(v1767, 8), v1768);
                        end;
                        for v1769 = 34, 160, 2 do
                            local v1770 = l_v1194_3[v1769 - 30];
                            local v1771 = l_v1194_3[v1769 - 31];
                            local v1772 = v1157(v1156(v1159(v1770, 1), v1158(v1771, 31)), v1156(v1159(v1770, 8), v1158(v1771, 24)), v1156(v1159(v1770, 7), v1158(v1771, 25)));
                            local v1773 = v1157(v1156(v1159(v1771, 1), v1158(v1770, 31)), v1156(v1159(v1771, 8), v1158(v1770, 24)), v1159(v1771, 7));
                            local v1774 = l_v1194_3[v1769 - 4];
                            local v1775 = l_v1194_3[v1769 - 5];
                            local v1776 = v1157(v1156(v1159(v1774, 19), v1158(v1775, 13)), v1156(v1158(v1774, 3), v1159(v1775, 29)), v1156(v1159(v1774, 6), v1158(v1775, 26)));
                            local v1777 = v1157(v1156(v1159(v1775, 19), v1158(v1774, 13)), v1156(v1158(v1775, 3), v1159(v1774, 29)), v1159(v1775, 6));
                            local v1778 = v1769 - 1;
                            local v1779, v1780 = l_v1753_0(v1772, v1773, v1776, v1777, l_v1194_3[v1769 - 14], l_v1194_3[v1769 - 15], l_v1194_3[v1769 - 32], l_v1194_3[v1769 - 33]);
                            l_v1194_3[v1778] = v1780;
                            l_v1194_3[v1769] = v1779;
                        end;
                        local v1781 = v1755[1];
                        local v1782 = v1755[2];
                        local v1783 = v1755[3];
                        local v1784 = v1755[4];
                        local v1785 = v1755[5];
                        local v1786 = v1755[6];
                        local v1787 = v1755[7];
                        local v1788 = v1755[8];
                        local v1789 = v1756[1];
                        local v1790 = v1756[2];
                        local v1791 = v1756[3];
                        local v1792 = v1756[4];
                        local v1793 = v1756[5];
                        local v1794 = v1756[6];
                        local v1795 = v1756[7];
                        local v1796 = v1756[8];
                        local v1797 = 0;
                        for v1798 = 1, 80 do
                            local v1799 = v1157(v1787, v1155(v1785, v1157(v1786, v1787)));
                            local v1800 = v1157(v1795, v1155(v1793, v1157(v1794, v1795)));
                            local v1801 = v1157(v1156(v1159(v1785, 14), v1158(v1793, 18)), v1156(v1159(v1785, 18), v1158(v1793, 14)), v1156(v1158(v1785, 23), v1159(v1793, 9)));
                            local v1802 = v1157(v1156(v1159(v1793, 14), v1158(v1785, 18)), v1156(v1159(v1793, 18), v1158(v1785, 14)), v1156(v1158(v1793, 23), v1159(v1785, 9)));
                            local v1803 = v1801 % 4294967296 + v1799 % 4294967296 + v1788 % 4294967296 + l_v1180_2[v1798] + l_v1194_3[2 * v1798] % 4294967296;
                            local v1804 = v1163(v1803);
                            local v1805 = v1163(v1802 + v1800 + v1796 + l_v1181_2[v1798] + l_v1194_3[2 * v1798 - 1] + l_floor_1(v1803 / 4294967296));
                            v1797 = v1797 + v1797;
                            local v1806 = v1156(v1797, v1787);
                            local v1807 = v1156(v1797, v1795);
                            local v1808 = v1156(v1797, v1786);
                            local v1809 = v1156(v1797, v1794);
                            local v1810 = v1156(v1797, v1785);
                            v1794 = v1156(v1797, v1793);
                            v1786 = v1810;
                            v1795 = v1809;
                            v1787 = v1808;
                            v1796 = v1807;
                            v1788 = v1806;
                            v1806 = v1804 % 4294967296 + v1784 % 4294967296;
                            v1807 = v1163(v1806);
                            v1793 = v1163(v1805 + v1792 + l_floor_1(v1806 / 4294967296));
                            v1785 = v1807;
                            v1807 = v1156(v1797, v1783);
                            v1808 = v1156(v1797, v1791);
                            v1809 = v1156(v1797, v1782);
                            v1810 = v1156(v1797, v1790);
                            local v1811 = v1156(v1797, v1781);
                            v1790 = v1156(v1797, v1789);
                            v1782 = v1811;
                            v1791 = v1810;
                            v1783 = v1809;
                            v1792 = v1808;
                            v1784 = v1807;
                            v1801 = v1157(v1156(v1159(v1782, 28), v1158(v1790, 4)), v1156(v1158(v1782, 30), v1159(v1790, 2)), v1156(v1158(v1782, 25), v1159(v1790, 7)));
                            v1802 = v1157(v1156(v1159(v1790, 28), v1158(v1782, 4)), v1156(v1158(v1790, 30), v1159(v1782, 2)), v1156(v1158(v1790, 25), v1159(v1782, 7)));
                            v1799 = v1156(v1155(v1784, v1783), v1155(v1782, v1157(v1784, v1783)));
                            v1800 = v1156(v1155(v1792, v1791), v1155(v1790, v1157(v1792, v1791)));
                            v1807 = v1804 % 4294967296 + v1799 % 4294967296 + v1801 % 4294967296;
                            v1808 = v1163(v1807);
                            v1789 = v1163(v1805 + v1800 + v1802 + l_floor_1(v1807 / 4294967296));
                            v1781 = v1808;
                        end;
                        local v1812, v1813 = l_v1753_0(v1755[1], v1756[1], v1781, v1789, 0, 0, 0, 0);
                        v1756[1] = v1813;
                        v1755[1] = v1812;
                        v1812, v1813 = l_v1753_0(v1755[2], v1756[2], v1782, v1790, 0, 0, 0, 0);
                        v1756[2] = v1813;
                        v1755[2] = v1812;
                        v1812, v1813 = l_v1753_0(v1755[3], v1756[3], v1783, v1791, 0, 0, 0, 0);
                        v1756[3] = v1813;
                        v1755[3] = v1812;
                        v1812, v1813 = l_v1753_0(v1755[4], v1756[4], v1784, v1792, 0, 0, 0, 0);
                        v1756[4] = v1813;
                        v1755[4] = v1812;
                        v1812, v1813 = l_v1753_0(v1755[5], v1756[5], v1785, v1793, 0, 0, 0, 0);
                        v1756[5] = v1813;
                        v1755[5] = v1812;
                        v1812, v1813 = l_v1753_0(v1755[6], v1756[6], v1786, v1794, 0, 0, 0, 0);
                        v1756[6] = v1813;
                        v1755[6] = v1812;
                        v1812, v1813 = l_v1753_0(v1755[7], v1756[7], v1787, v1795, 0, 0, 0, 0);
                        v1756[7] = v1813;
                        v1755[7] = v1812;
                        v1812, v1813 = l_v1753_0(v1755[8], v1756[8], v1788, v1796, 0, 0, 0, 0);
                        v1756[8] = v1813;
                        v1755[8] = v1812;
                    end;
                end or function(v1814, v1815, v1816, v1817, v1818)
                    -- upvalues: v1194 (ref), v1180 (ref), v1181 (ref), l_byte_1 (ref), v1156 (ref), v1158 (ref), v1157 (ref), v1159 (ref), l_v1753_0 (ref), v1155 (ref), v1163 (ref), l_floor_1 (ref)
                    local l_v1194_4 = v1194;
                    local l_v1180_3 = v1180;
                    local l_v1181_3 = v1181;
                    for v1822 = v1817, v1817 + v1818 - 1, 128 do
                        for v1823 = 1, 32 do
                            v1822 = v1822 + 4;
                            local v1824, v1825, v1826, v1827 = l_byte_1(v1816, v1822 - 3, v1822);
                            l_v1194_4[v1823] = v1156(v1158(v1824, 24), v1158(v1825, 16), v1158(v1826, 8), v1827);
                        end;
                        for v1828 = 34, 160, 2 do
                            local v1829 = l_v1194_4[v1828 - 30];
                            local v1830 = l_v1194_4[v1828 - 31];
                            local v1831 = v1157(v1156(v1159(v1829, 1), v1158(v1830, 31)), v1156(v1159(v1829, 8), v1158(v1830, 24)), v1156(v1159(v1829, 7), v1158(v1830, 25)));
                            local v1832 = v1157(v1156(v1159(v1830, 1), v1158(v1829, 31)), v1156(v1159(v1830, 8), v1158(v1829, 24)), v1159(v1830, 7));
                            local v1833 = l_v1194_4[v1828 - 4];
                            local v1834 = l_v1194_4[v1828 - 5];
                            local v1835 = v1157(v1156(v1159(v1833, 19), v1158(v1834, 13)), v1156(v1158(v1833, 3), v1159(v1834, 29)), v1156(v1159(v1833, 6), v1158(v1834, 26)));
                            local v1836 = v1157(v1156(v1159(v1834, 19), v1158(v1833, 13)), v1156(v1158(v1834, 3), v1159(v1833, 29)), v1159(v1834, 6));
                            local v1837 = v1828 - 1;
                            local v1838, v1839 = l_v1753_0(v1831, v1832, v1835, v1836, l_v1194_4[v1828 - 14], l_v1194_4[v1828 - 15], l_v1194_4[v1828 - 32], l_v1194_4[v1828 - 33]);
                            l_v1194_4[v1837] = v1839;
                            l_v1194_4[v1828] = v1838;
                        end;
                        local v1840 = v1814[1];
                        local v1841 = v1814[2];
                        local v1842 = v1814[3];
                        local v1843 = v1814[4];
                        local v1844 = v1814[5];
                        local v1845 = v1814[6];
                        local v1846 = v1814[7];
                        local v1847 = v1814[8];
                        local v1848 = v1815[1];
                        local v1849 = v1815[2];
                        local v1850 = v1815[3];
                        local v1851 = v1815[4];
                        local v1852 = v1815[5];
                        local v1853 = v1815[6];
                        local v1854 = v1815[7];
                        local v1855 = v1815[8];
                        for v1856 = 1, 80 do
                            local v1857 = v1157(v1846, v1155(v1844, v1157(v1845, v1846)));
                            local v1858 = v1157(v1854, v1155(v1852, v1157(v1853, v1854)));
                            local v1859 = v1157(v1156(v1159(v1844, 14), v1158(v1852, 18)), v1156(v1159(v1844, 18), v1158(v1852, 14)), v1156(v1158(v1844, 23), v1159(v1852, 9)));
                            local v1860 = v1157(v1156(v1159(v1852, 14), v1158(v1844, 18)), v1156(v1159(v1852, 18), v1158(v1844, 14)), v1156(v1158(v1852, 23), v1159(v1844, 9)));
                            local v1861 = v1859 % 4294967296 + v1857 % 4294967296 + v1847 % 4294967296 + l_v1180_3[v1856] + l_v1194_4[2 * v1856] % 4294967296;
                            local v1862 = v1163(v1861);
                            local v1863 = v1163(v1860 + v1858 + v1855 + l_v1181_3[v1856] + l_v1194_4[2 * v1856 - 1] + l_floor_1(v1861 / 4294967296));
                            local l_v1846_0 = v1846;
                            local l_v1854_0 = v1854;
                            local l_v1845_0 = v1845;
                            local l_v1853_0 = v1853;
                            local l_v1844_0 = v1844;
                            v1853 = v1852;
                            v1845 = l_v1844_0;
                            v1854 = l_v1853_0;
                            v1846 = l_v1845_0;
                            v1855 = l_v1854_0;
                            v1847 = l_v1846_0;
                            l_v1846_0 = v1862 % 4294967296 + v1843 % 4294967296;
                            l_v1854_0 = v1163(l_v1846_0);
                            v1852 = v1163(v1863 + v1851 + l_floor_1(l_v1846_0 / 4294967296));
                            v1844 = l_v1854_0;
                            l_v1854_0 = v1842;
                            l_v1845_0 = v1850;
                            l_v1853_0 = v1841;
                            l_v1844_0 = v1849;
                            local l_v1840_0 = v1840;
                            v1849 = v1848;
                            v1841 = l_v1840_0;
                            v1850 = l_v1844_0;
                            v1842 = l_v1853_0;
                            v1851 = l_v1845_0;
                            v1843 = l_v1854_0;
                            v1859 = v1157(v1156(v1159(v1841, 28), v1158(v1849, 4)), v1156(v1158(v1841, 30), v1159(v1849, 2)), v1156(v1158(v1841, 25), v1159(v1849, 7)));
                            v1860 = v1157(v1156(v1159(v1849, 28), v1158(v1841, 4)), v1156(v1158(v1849, 30), v1159(v1841, 2)), v1156(v1158(v1849, 25), v1159(v1841, 7)));
                            v1857 = v1156(v1155(v1843, v1842), v1155(v1841, v1157(v1843, v1842)));
                            v1858 = v1156(v1155(v1851, v1850), v1155(v1849, v1157(v1851, v1850)));
                            l_v1854_0 = v1862 % 4294967296 + v1859 % 4294967296 + v1857 % 4294967296;
                            l_v1845_0 = v1163(l_v1854_0);
                            v1848 = v1163(v1863 + v1860 + v1858 + l_floor_1(l_v1854_0 / 4294967296));
                            v1840 = l_v1845_0;
                        end;
                        local v1870, v1871 = l_v1753_0(v1814[1], v1815[1], v1840, v1848, 0, 0, 0, 0);
                        v1815[1] = v1871;
                        v1814[1] = v1870;
                        v1870, v1871 = l_v1753_0(v1814[2], v1815[2], v1841, v1849, 0, 0, 0, 0);
                        v1815[2] = v1871;
                        v1814[2] = v1870;
                        v1870, v1871 = l_v1753_0(v1814[3], v1815[3], v1842, v1850, 0, 0, 0, 0);
                        v1815[3] = v1871;
                        v1814[3] = v1870;
                        v1870, v1871 = l_v1753_0(v1814[4], v1815[4], v1843, v1851, 0, 0, 0, 0);
                        v1815[4] = v1871;
                        v1814[4] = v1870;
                        v1870, v1871 = l_v1753_0(v1814[5], v1815[5], v1844, v1852, 0, 0, 0, 0);
                        v1815[5] = v1871;
                        v1814[5] = v1870;
                        v1870, v1871 = l_v1753_0(v1814[6], v1815[6], v1845, v1853, 0, 0, 0, 0);
                        v1815[6] = v1871;
                        v1814[6] = v1870;
                        v1870, v1871 = l_v1753_0(v1814[7], v1815[7], v1846, v1854, 0, 0, 0, 0);
                        v1815[7] = v1871;
                        v1814[7] = v1870;
                        v1870, v1871 = l_v1753_0(v1814[8], v1815[8], v1847, v1855, 0, 0, 0, 0);
                        v1815[8] = v1871;
                        v1814[8] = v1870;
                    end;
                end;
                v1174 = function(v1872, v1873, v1874, v1875)
                    -- upvalues: v1194 (ref), v1189 (ref), l_byte_1 (ref), v1156 (ref), v1158 (ref), v1163 (ref), v1160 (ref), v1157 (ref), v1155 (ref), v1162 (ref)
                    local l_v1194_5 = v1194;
                    local l_v1189_1 = v1189;
                    for v1878 = v1874, v1874 + v1875 - 1, 64 do
                        for v1879 = 1, 16 do
                            v1878 = v1878 + 4;
                            local v1880, v1881, v1882, v1883 = l_byte_1(v1873, v1878 - 3, v1878);
                            l_v1194_5[v1879] = v1156(v1158(v1883, 24), v1158(v1882, 16), v1158(v1881, 8), v1880);
                        end;
                        local v1884 = v1872[1];
                        local v1885 = v1872[2];
                        local v1886 = v1872[3];
                        local v1887 = v1872[4];
                        for v1888 = 1, 16, 4 do
                            local l_v1887_0 = v1887;
                            local l_v1886_0 = v1886;
                            local l_v1885_0 = v1885;
                            v1885 = v1163(v1160(v1157(v1887, v1155(v1885, v1157(v1886, v1887))) + (l_v1189_1[v1888] + l_v1194_5[v1888] + v1884), 7) + v1885);
                            v1886 = l_v1885_0;
                            v1887 = l_v1886_0;
                            v1884 = l_v1887_0;
                            l_v1887_0 = v1887;
                            l_v1886_0 = v1886;
                            l_v1885_0 = v1885;
                            v1885 = v1163(v1160(v1157(v1887, v1155(v1885, v1157(v1886, v1887))) + (l_v1189_1[v1888 + 1] + l_v1194_5[v1888 + 1] + v1884), 12) + v1885);
                            v1886 = l_v1885_0;
                            v1887 = l_v1886_0;
                            v1884 = l_v1887_0;
                            l_v1887_0 = v1887;
                            l_v1886_0 = v1886;
                            l_v1885_0 = v1885;
                            v1885 = v1163(v1160(v1157(v1887, v1155(v1885, v1157(v1886, v1887))) + (l_v1189_1[v1888 + 2] + l_v1194_5[v1888 + 2] + v1884), 17) + v1885);
                            v1886 = l_v1885_0;
                            v1887 = l_v1886_0;
                            v1884 = l_v1887_0;
                            l_v1887_0 = v1887;
                            l_v1886_0 = v1886;
                            l_v1885_0 = v1885;
                            v1885 = v1163(v1160(v1157(v1887, v1155(v1885, v1157(v1886, v1887))) + (l_v1189_1[v1888 + 3] + l_v1194_5[v1888 + 3] + v1884), 22) + v1885);
                            v1886 = l_v1885_0;
                            v1887 = l_v1886_0;
                            v1884 = l_v1887_0;
                        end;
                        for v1892 = 17, 32, 4 do
                            local v1893 = 5 * v1892 - 4;
                            local l_v1887_1 = v1887;
                            local l_v1886_1 = v1886;
                            local l_v1885_1 = v1885;
                            v1885 = v1163(v1160(v1157(v1886, v1155(v1887, v1157(v1885, v1886))) + (l_v1189_1[v1892] + l_v1194_5[v1155(v1893, 15) + 1] + v1884), 5) + v1885);
                            v1886 = l_v1885_1;
                            v1887 = l_v1886_1;
                            v1884 = l_v1887_1;
                            l_v1887_1 = v1887;
                            l_v1886_1 = v1886;
                            l_v1885_1 = v1885;
                            v1885 = v1163(v1160(v1157(v1886, v1155(v1887, v1157(v1885, v1886))) + (l_v1189_1[v1892 + 1] + l_v1194_5[v1155(v1893 + 5, 15) + 1] + v1884), 9) + v1885);
                            v1886 = l_v1885_1;
                            v1887 = l_v1886_1;
                            v1884 = l_v1887_1;
                            l_v1887_1 = v1887;
                            l_v1886_1 = v1886;
                            l_v1885_1 = v1885;
                            v1885 = v1163(v1160(v1157(v1886, v1155(v1887, v1157(v1885, v1886))) + (l_v1189_1[v1892 + 2] + l_v1194_5[v1155(v1893 + 10, 15) + 1] + v1884), 14) + v1885);
                            v1886 = l_v1885_1;
                            v1887 = l_v1886_1;
                            v1884 = l_v1887_1;
                            l_v1887_1 = v1887;
                            l_v1886_1 = v1886;
                            l_v1885_1 = v1885;
                            v1885 = v1163(v1160(v1157(v1886, v1155(v1887, v1157(v1885, v1886))) + (l_v1189_1[v1892 + 3] + l_v1194_5[v1155(v1893 - 1, 15) + 1] + v1884), 20) + v1885);
                            v1886 = l_v1885_1;
                            v1887 = l_v1886_1;
                            v1884 = l_v1887_1;
                        end;
                        for v1897 = 33, 48, 4 do
                            local v1898 = 3 * v1897 + 2;
                            local l_v1887_2 = v1887;
                            local l_v1886_2 = v1886;
                            local l_v1885_2 = v1885;
                            v1885 = v1163(v1160(v1157(v1885, v1886, v1887) + (l_v1189_1[v1897] + l_v1194_5[v1155(v1898, 15) + 1] + v1884), 4) + v1885);
                            v1886 = l_v1885_2;
                            v1887 = l_v1886_2;
                            v1884 = l_v1887_2;
                            l_v1887_2 = v1887;
                            l_v1886_2 = v1886;
                            l_v1885_2 = v1885;
                            v1885 = v1163(v1160(v1157(v1885, v1886, v1887) + (l_v1189_1[v1897 + 1] + l_v1194_5[v1155(v1898 + 3, 15) + 1] + v1884), 11) + v1885);
                            v1886 = l_v1885_2;
                            v1887 = l_v1886_2;
                            v1884 = l_v1887_2;
                            l_v1887_2 = v1887;
                            l_v1886_2 = v1886;
                            l_v1885_2 = v1885;
                            v1885 = v1163(v1160(v1157(v1885, v1886, v1887) + (l_v1189_1[v1897 + 2] + l_v1194_5[v1155(v1898 + 6, 15) + 1] + v1884), 16) + v1885);
                            v1886 = l_v1885_2;
                            v1887 = l_v1886_2;
                            v1884 = l_v1887_2;
                            l_v1887_2 = v1887;
                            l_v1886_2 = v1886;
                            l_v1885_2 = v1885;
                            v1885 = v1163(v1160(v1157(v1885, v1886, v1887) + (l_v1189_1[v1897 + 3] + l_v1194_5[v1155(v1898 - 7, 15) + 1] + v1884), 23) + v1885);
                            v1886 = l_v1885_2;
                            v1887 = l_v1886_2;
                            v1884 = l_v1887_2;
                        end;
                        for v1902 = 49, 64, 4 do
                            local v1903 = v1902 * 7;
                            local l_v1887_3 = v1887;
                            local l_v1886_3 = v1886;
                            local l_v1885_3 = v1885;
                            v1885 = v1163(v1160(v1157(v1886, v1156(v1885, v1162(v1887))) + (l_v1189_1[v1902] + l_v1194_5[v1155(v1903 - 7, 15) + 1] + v1884), 6) + v1885);
                            v1886 = l_v1885_3;
                            v1887 = l_v1886_3;
                            v1884 = l_v1887_3;
                            l_v1887_3 = v1887;
                            l_v1886_3 = v1886;
                            l_v1885_3 = v1885;
                            v1885 = v1163(v1160(v1157(v1886, v1156(v1885, v1162(v1887))) + (l_v1189_1[v1902 + 1] + l_v1194_5[v1155(v1903, 15) + 1] + v1884), 10) + v1885);
                            v1886 = l_v1885_3;
                            v1887 = l_v1886_3;
                            v1884 = l_v1887_3;
                            l_v1887_3 = v1887;
                            l_v1886_3 = v1886;
                            l_v1885_3 = v1885;
                            v1885 = v1163(v1160(v1157(v1886, v1156(v1885, v1162(v1887))) + (l_v1189_1[v1902 + 2] + l_v1194_5[v1155(v1903 + 7, 15) + 1] + v1884), 15) + v1885);
                            v1886 = l_v1885_3;
                            v1887 = l_v1886_3;
                            v1884 = l_v1887_3;
                            l_v1887_3 = v1887;
                            l_v1886_3 = v1886;
                            l_v1885_3 = v1885;
                            v1885 = v1163(v1160(v1157(v1886, v1156(v1885, v1162(v1887))) + (l_v1189_1[v1902 + 3] + l_v1194_5[v1155(v1903 - 2, 15) + 1] + v1884), 21) + v1885);
                            v1886 = l_v1885_3;
                            v1887 = l_v1886_3;
                            v1884 = l_v1887_3;
                        end;
                        local v1907 = v1163(v1884 + v1872[1]);
                        local v1908 = v1163(v1885 + v1872[2]);
                        local v1909 = v1163(v1886 + v1872[3]);
                        v1872[4] = v1163(v1887 + v1872[4]);
                        v1872[3] = v1909;
                        v1872[2] = v1908;
                        v1872[1] = v1907;
                    end;
                end;
                v1175 = function(v1910, v1911, v1912, v1913)
                    -- upvalues: v1194 (ref), l_byte_1 (ref), v1156 (ref), v1158 (ref), v1160 (ref), v1157 (ref), v1161 (ref), v1163 (ref), v1155 (ref)
                    local l_v1194_6 = v1194;
                    for v1915 = v1912, v1912 + v1913 - 1, 64 do
                        for v1916 = 1, 16 do
                            v1915 = v1915 + 4;
                            local v1917, v1918, v1919, v1920 = l_byte_1(v1911, v1915 - 3, v1915);
                            l_v1194_6[v1916] = v1156(v1158(v1917, 24), v1158(v1918, 16), v1158(v1919, 8), v1920);
                        end;
                        for v1921 = 17, 80 do
                            l_v1194_6[v1921] = v1160(v1157(l_v1194_6[v1921 - 3], l_v1194_6[v1921 - 8], l_v1194_6[v1921 - 14], l_v1194_6[v1921 - 16]), 1);
                        end;
                        local v1922 = v1910[1];
                        local v1923 = v1910[2];
                        local v1924 = v1910[3];
                        local v1925 = v1910[4];
                        local v1926 = v1910[5];
                        for v1927 = 1, 20, 5 do
                            local l_v1925_0 = v1925;
                            local l_v1924_0 = v1924;
                            local v1930 = v1161(v1923, 2);
                            local l_v1922_0 = v1922;
                            v1922 = v1163(v1160(v1922, 5) + v1157(v1925, v1155(v1923, v1157(v1925, v1924))) + (l_v1194_6[v1927] + 1518500249 + v1926));
                            v1923 = l_v1922_0;
                            v1924 = v1930;
                            v1925 = l_v1924_0;
                            v1926 = l_v1925_0;
                            l_v1925_0 = v1925;
                            l_v1924_0 = v1924;
                            v1930 = v1161(v1923, 2);
                            l_v1922_0 = v1922;
                            v1922 = v1163(v1160(v1922, 5) + v1157(v1925, v1155(v1923, v1157(v1925, v1924))) + (l_v1194_6[v1927 + 1] + 1518500249 + v1926));
                            v1923 = l_v1922_0;
                            v1924 = v1930;
                            v1925 = l_v1924_0;
                            v1926 = l_v1925_0;
                            l_v1925_0 = v1925;
                            l_v1924_0 = v1924;
                            v1930 = v1161(v1923, 2);
                            l_v1922_0 = v1922;
                            v1922 = v1163(v1160(v1922, 5) + v1157(v1925, v1155(v1923, v1157(v1925, v1924))) + (l_v1194_6[v1927 + 2] + 1518500249 + v1926));
                            v1923 = l_v1922_0;
                            v1924 = v1930;
                            v1925 = l_v1924_0;
                            v1926 = l_v1925_0;
                            l_v1925_0 = v1925;
                            l_v1924_0 = v1924;
                            v1930 = v1161(v1923, 2);
                            l_v1922_0 = v1922;
                            v1922 = v1163(v1160(v1922, 5) + v1157(v1925, v1155(v1923, v1157(v1925, v1924))) + (l_v1194_6[v1927 + 3] + 1518500249 + v1926));
                            v1923 = l_v1922_0;
                            v1924 = v1930;
                            v1925 = l_v1924_0;
                            v1926 = l_v1925_0;
                            l_v1925_0 = v1925;
                            l_v1924_0 = v1924;
                            v1930 = v1161(v1923, 2);
                            l_v1922_0 = v1922;
                            v1922 = v1163(v1160(v1922, 5) + v1157(v1925, v1155(v1923, v1157(v1925, v1924))) + (l_v1194_6[v1927 + 4] + 1518500249 + v1926));
                            v1923 = l_v1922_0;
                            v1924 = v1930;
                            v1925 = l_v1924_0;
                            v1926 = l_v1925_0;
                        end;
                        for v1932 = 21, 40, 5 do
                            local l_v1925_1 = v1925;
                            local l_v1924_1 = v1924;
                            local v1935 = v1161(v1923, 2);
                            local l_v1922_1 = v1922;
                            v1922 = v1163(v1160(v1922, 5) + v1157(v1923, v1924, v1925) + (l_v1194_6[v1932] + 1859775393 + v1926));
                            v1923 = l_v1922_1;
                            v1924 = v1935;
                            v1925 = l_v1924_1;
                            v1926 = l_v1925_1;
                            l_v1925_1 = v1925;
                            l_v1924_1 = v1924;
                            v1935 = v1161(v1923, 2);
                            l_v1922_1 = v1922;
                            v1922 = v1163(v1160(v1922, 5) + v1157(v1923, v1924, v1925) + (l_v1194_6[v1932 + 1] + 1859775393 + v1926));
                            v1923 = l_v1922_1;
                            v1924 = v1935;
                            v1925 = l_v1924_1;
                            v1926 = l_v1925_1;
                            l_v1925_1 = v1925;
                            l_v1924_1 = v1924;
                            v1935 = v1161(v1923, 2);
                            l_v1922_1 = v1922;
                            v1922 = v1163(v1160(v1922, 5) + v1157(v1923, v1924, v1925) + (l_v1194_6[v1932 + 2] + 1859775393 + v1926));
                            v1923 = l_v1922_1;
                            v1924 = v1935;
                            v1925 = l_v1924_1;
                            v1926 = l_v1925_1;
                            l_v1925_1 = v1925;
                            l_v1924_1 = v1924;
                            v1935 = v1161(v1923, 2);
                            l_v1922_1 = v1922;
                            v1922 = v1163(v1160(v1922, 5) + v1157(v1923, v1924, v1925) + (l_v1194_6[v1932 + 3] + 1859775393 + v1926));
                            v1923 = l_v1922_1;
                            v1924 = v1935;
                            v1925 = l_v1924_1;
                            v1926 = l_v1925_1;
                            l_v1925_1 = v1925;
                            l_v1924_1 = v1924;
                            v1935 = v1161(v1923, 2);
                            l_v1922_1 = v1922;
                            v1922 = v1163(v1160(v1922, 5) + v1157(v1923, v1924, v1925) + (l_v1194_6[v1932 + 4] + 1859775393 + v1926));
                            v1923 = l_v1922_1;
                            v1924 = v1935;
                            v1925 = l_v1924_1;
                            v1926 = l_v1925_1;
                        end;
                        for v1937 = 41, 60, 5 do
                            local l_v1925_2 = v1925;
                            local l_v1924_2 = v1924;
                            local v1940 = v1161(v1923, 2);
                            local l_v1922_2 = v1922;
                            v1922 = v1163(v1160(v1922, 5) + v1157(v1155(v1925, v1157(v1923, v1924)), v1155(v1923, v1924)) + (l_v1194_6[v1937] + 2400959708 + v1926));
                            v1923 = l_v1922_2;
                            v1924 = v1940;
                            v1925 = l_v1924_2;
                            v1926 = l_v1925_2;
                            l_v1925_2 = v1925;
                            l_v1924_2 = v1924;
                            v1940 = v1161(v1923, 2);
                            l_v1922_2 = v1922;
                            v1922 = v1163(v1160(v1922, 5) + v1157(v1155(v1925, v1157(v1923, v1924)), v1155(v1923, v1924)) + (l_v1194_6[v1937 + 1] + 2400959708 + v1926));
                            v1923 = l_v1922_2;
                            v1924 = v1940;
                            v1925 = l_v1924_2;
                            v1926 = l_v1925_2;
                            l_v1925_2 = v1925;
                            l_v1924_2 = v1924;
                            v1940 = v1161(v1923, 2);
                            l_v1922_2 = v1922;
                            v1922 = v1163(v1160(v1922, 5) + v1157(v1155(v1925, v1157(v1923, v1924)), v1155(v1923, v1924)) + (l_v1194_6[v1937 + 2] + 2400959708 + v1926));
                            v1923 = l_v1922_2;
                            v1924 = v1940;
                            v1925 = l_v1924_2;
                            v1926 = l_v1925_2;
                            l_v1925_2 = v1925;
                            l_v1924_2 = v1924;
                            v1940 = v1161(v1923, 2);
                            l_v1922_2 = v1922;
                            v1922 = v1163(v1160(v1922, 5) + v1157(v1155(v1925, v1157(v1923, v1924)), v1155(v1923, v1924)) + (l_v1194_6[v1937 + 3] + 2400959708 + v1926));
                            v1923 = l_v1922_2;
                            v1924 = v1940;
                            v1925 = l_v1924_2;
                            v1926 = l_v1925_2;
                            l_v1925_2 = v1925;
                            l_v1924_2 = v1924;
                            v1940 = v1161(v1923, 2);
                            l_v1922_2 = v1922;
                            v1922 = v1163(v1160(v1922, 5) + v1157(v1155(v1925, v1157(v1923, v1924)), v1155(v1923, v1924)) + (l_v1194_6[v1937 + 4] + 2400959708 + v1926));
                            v1923 = l_v1922_2;
                            v1924 = v1940;
                            v1925 = l_v1924_2;
                            v1926 = l_v1925_2;
                        end;
                        for v1942 = 61, 80, 5 do
                            local l_v1925_3 = v1925;
                            local l_v1924_3 = v1924;
                            local v1945 = v1161(v1923, 2);
                            local l_v1922_3 = v1922;
                            v1922 = v1163(v1160(v1922, 5) + v1157(v1923, v1924, v1925) + (l_v1194_6[v1942] + 3395469782 + v1926));
                            v1923 = l_v1922_3;
                            v1924 = v1945;
                            v1925 = l_v1924_3;
                            v1926 = l_v1925_3;
                            l_v1925_3 = v1925;
                            l_v1924_3 = v1924;
                            v1945 = v1161(v1923, 2);
                            l_v1922_3 = v1922;
                            v1922 = v1163(v1160(v1922, 5) + v1157(v1923, v1924, v1925) + (l_v1194_6[v1942 + 1] + 3395469782 + v1926));
                            v1923 = l_v1922_3;
                            v1924 = v1945;
                            v1925 = l_v1924_3;
                            v1926 = l_v1925_3;
                            l_v1925_3 = v1925;
                            l_v1924_3 = v1924;
                            v1945 = v1161(v1923, 2);
                            l_v1922_3 = v1922;
                            v1922 = v1163(v1160(v1922, 5) + v1157(v1923, v1924, v1925) + (l_v1194_6[v1942 + 2] + 3395469782 + v1926));
                            v1923 = l_v1922_3;
                            v1924 = v1945;
                            v1925 = l_v1924_3;
                            v1926 = l_v1925_3;
                            l_v1925_3 = v1925;
                            l_v1924_3 = v1924;
                            v1945 = v1161(v1923, 2);
                            l_v1922_3 = v1922;
                            v1922 = v1163(v1160(v1922, 5) + v1157(v1923, v1924, v1925) + (l_v1194_6[v1942 + 3] + 3395469782 + v1926));
                            v1923 = l_v1922_3;
                            v1924 = v1945;
                            v1925 = l_v1924_3;
                            v1926 = l_v1925_3;
                            l_v1925_3 = v1925;
                            l_v1924_3 = v1924;
                            v1945 = v1161(v1923, 2);
                            l_v1922_3 = v1922;
                            v1922 = v1163(v1160(v1922, 5) + v1157(v1923, v1924, v1925) + (l_v1194_6[v1942 + 4] + 3395469782 + v1926));
                            v1923 = l_v1922_3;
                            v1924 = v1945;
                            v1925 = l_v1924_3;
                            v1926 = l_v1925_3;
                        end;
                        local v1947 = v1163(v1922 + v1910[1]);
                        local v1948 = v1163(v1923 + v1910[2]);
                        local v1949 = v1163(v1924 + v1910[3]);
                        local v1950 = v1163(v1925 + v1910[4]);
                        v1910[5] = v1163(v1926 + v1910[5]);
                        v1910[4] = v1950;
                        v1910[3] = v1949;
                        v1910[2] = v1948;
                        v1910[1] = v1947;
                    end;
                end;
                local v1951 = {};
                local v1952 = {};
                do
                    local l_v1951_0, l_v1952_0 = v1951, v1952;
                    local function v1978(v1955, v1956, v1957, v1958, v1959, v1960)
                        -- upvalues: v1194 (ref), l_v1951_0 (ref), l_v1952_0 (ref), v1163 (ref), l_floor_1 (ref), v1157 (ref), v1159 (ref), v1158 (ref)
                        local l_v1194_7 = v1194;
                        local v1962 = l_v1951_0[v1955];
                        local v1963 = l_v1951_0[v1956];
                        local v1964 = l_v1951_0[v1957];
                        local v1965 = l_v1951_0[v1958];
                        local v1966 = l_v1952_0[v1955];
                        local v1967 = l_v1952_0[v1956];
                        local v1968 = l_v1952_0[v1957];
                        local v1969 = l_v1952_0[v1958];
                        local v1970 = l_v1194_7[2 * v1959 - 1] + (v1962 % 4294967296 + v1963 % 4294967296);
                        v1962 = v1163(v1970);
                        v1966 = v1163(l_v1194_7[2 * v1959] + (v1966 + v1967 + l_floor_1(v1970 / 4294967296)));
                        local v1971 = v1157(v1969, v1966);
                        v1969 = v1157(v1965, v1962);
                        v1965 = v1971;
                        v1970 = v1964 % 4294967296 + v1965 % 4294967296;
                        v1964 = v1163(v1970);
                        v1968 = v1163(v1968 + v1969 + l_floor_1(v1970 / 4294967296));
                        v1971 = v1157(v1963, v1964);
                        v1967 = v1157(v1967, v1968);
                        v1963 = v1971;
                        v1971 = v1157(v1159(v1963, 24), v1158(v1967, 8));
                        v1967 = v1157(v1159(v1967, 24), v1158(v1963, 8));
                        v1963 = v1971;
                        v1970 = l_v1194_7[2 * v1960 - 1] + (v1962 % 4294967296 + v1963 % 4294967296);
                        v1962 = v1163(v1970);
                        v1966 = v1163(l_v1194_7[2 * v1960] + (v1966 + v1967 + l_floor_1(v1970 / 4294967296)));
                        v1971 = v1157(v1965, v1962);
                        v1969 = v1157(v1969, v1966);
                        v1965 = v1971;
                        v1971 = v1157(v1159(v1965, 16), v1158(v1969, 16));
                        v1969 = v1157(v1159(v1969, 16), v1158(v1965, 16));
                        v1965 = v1971;
                        v1970 = v1964 % 4294967296 + v1965 % 4294967296;
                        v1964 = v1163(v1970);
                        v1968 = v1163(v1968 + v1969 + l_floor_1(v1970 / 4294967296));
                        v1971 = v1157(v1963, v1964);
                        v1967 = v1157(v1967, v1968);
                        v1963 = v1971;
                        v1971 = v1157(v1158(v1963, 1), v1159(v1967, 31));
                        v1967 = v1157(v1158(v1967, 1), v1159(v1963, 31));
                        v1963 = v1971;
                        v1971 = l_v1951_0;
                        local l_l_v1951_0_0 = l_v1951_0;
                        local l_l_v1951_0_1 = l_v1951_0;
                        local l_l_v1951_0_2 = l_v1951_0;
                        local l_v1962_0 = v1962;
                        local l_v1963_0 = v1963;
                        local l_v1964_0 = v1964;
                        l_l_v1951_0_2[v1958] = v1965;
                        l_l_v1951_0_1[v1957] = l_v1964_0;
                        l_l_v1951_0_0[v1956] = l_v1963_0;
                        v1971[v1955] = l_v1962_0;
                        v1971 = l_v1952_0;
                        l_l_v1951_0_0 = l_v1952_0;
                        l_l_v1951_0_1 = l_v1952_0;
                        l_l_v1951_0_2 = l_v1952_0;
                        l_v1962_0 = v1966;
                        l_v1963_0 = v1967;
                        l_v1964_0 = v1968;
                        l_l_v1951_0_2[v1958] = v1969;
                        l_l_v1951_0_1[v1957] = l_v1964_0;
                        l_l_v1951_0_0[v1956] = l_v1963_0;
                        v1971[v1955] = l_v1962_0;
                    end;
                    v1178 = function(v1979, v1980, v1981, v1982, v1983, v1984, v1985, v1986)
                        -- upvalues: v1194 (ref), l_byte_1 (ref), v1156 (ref), v1158 (ref), l_v1951_0 (ref), v1182 (ref), l_v1952_0 (ref), v1183 (ref), l_floor_1 (ref), v1157 (ref), v1162 (ref), v1201 (ref), v1978 (ref)
                        local l_v1194_8 = v1194;
                        local v1988 = v1979[1];
                        local v1989 = v1979[2];
                        local v1990 = v1979[3];
                        local v1991 = v1979[4];
                        local v1992 = v1979[5];
                        local v1993 = v1979[6];
                        local v1994 = v1979[7];
                        local v1995 = v1979[8];
                        local v1996 = v1980[1];
                        local v1997 = v1980[2];
                        local v1998 = v1980[3];
                        local v1999 = v1980[4];
                        local v2000 = v1980[5];
                        local v2001 = v1980[6];
                        local v2002 = v1980[7];
                        local v2003 = v1980[8];
                        for v2004 = v1982, v1982 + v1983 - 1, 128 do
                            if v1981 then
                                for v2005 = 1, 32 do
                                    v2004 = v2004 + 4;
                                    local v2006, v2007, v2008, v2009 = l_byte_1(v1981, v2004 - 3, v2004);
                                    l_v1194_8[v2005] = v2009 * 16777216 + v1156(v1158(v2008, 16), v1158(v2007, 8), v2006);
                                end;
                            end;
                            local l_l_v1951_0_3 = l_v1951_0;
                            local l_l_v1951_0_4 = l_v1951_0;
                            local l_l_v1951_0_5 = l_v1951_0;
                            local l_l_v1951_0_6 = l_v1951_0;
                            local l_l_v1951_0_7 = l_v1951_0;
                            local l_l_v1951_0_8 = l_v1951_0;
                            local l_l_v1951_0_9 = l_v1951_0;
                            local l_l_v1951_0_10 = l_v1951_0;
                            local l_v1988_0 = v1988;
                            local l_v1989_0 = v1989;
                            local l_v1990_0 = v1990;
                            local l_v1991_0 = v1991;
                            local l_v1992_0 = v1992;
                            local l_v1993_0 = v1993;
                            local l_v1994_0 = v1994;
                            l_l_v1951_0_10[7] = v1995;
                            l_l_v1951_0_9[6] = l_v1994_0;
                            l_l_v1951_0_8[5] = l_v1993_0;
                            l_l_v1951_0_7[4] = l_v1992_0;
                            l_l_v1951_0_6[3] = l_v1991_0;
                            l_l_v1951_0_5[2] = l_v1990_0;
                            l_l_v1951_0_4[1] = l_v1989_0;
                            l_l_v1951_0_3[0] = l_v1988_0;
                            l_l_v1951_0_3 = l_v1951_0;
                            l_l_v1951_0_4 = l_v1951_0;
                            l_l_v1951_0_5 = l_v1951_0;
                            l_l_v1951_0_6 = l_v1951_0;
                            l_l_v1951_0_7 = l_v1951_0;
                            l_l_v1951_0_8 = l_v1951_0;
                            l_l_v1951_0_9 = l_v1951_0;
                            l_l_v1951_0_10 = l_v1951_0;
                            l_v1988_0 = v1182[1];
                            l_v1989_0 = v1182[2];
                            l_v1990_0 = v1182[3];
                            l_v1991_0 = v1182[4];
                            l_v1992_0 = v1182[5];
                            l_v1993_0 = v1182[6];
                            l_v1994_0 = v1182[7];
                            l_l_v1951_0_10[15] = v1182[8];
                            l_l_v1951_0_9[14] = l_v1994_0;
                            l_l_v1951_0_8[13] = l_v1993_0;
                            l_l_v1951_0_7[12] = l_v1992_0;
                            l_l_v1951_0_6[11] = l_v1991_0;
                            l_l_v1951_0_5[10] = l_v1990_0;
                            l_l_v1951_0_4[9] = l_v1989_0;
                            l_l_v1951_0_3[8] = l_v1988_0;
                            l_l_v1951_0_3 = l_v1952_0;
                            l_l_v1951_0_4 = l_v1952_0;
                            l_l_v1951_0_5 = l_v1952_0;
                            l_l_v1951_0_6 = l_v1952_0;
                            l_l_v1951_0_7 = l_v1952_0;
                            l_l_v1951_0_8 = l_v1952_0;
                            l_l_v1951_0_9 = l_v1952_0;
                            l_l_v1951_0_10 = l_v1952_0;
                            l_v1988_0 = v1996;
                            l_v1989_0 = v1997;
                            l_v1990_0 = v1998;
                            l_v1991_0 = v1999;
                            l_v1992_0 = v2000;
                            l_v1993_0 = v2001;
                            l_v1994_0 = v2002;
                            l_l_v1951_0_10[7] = v2003;
                            l_l_v1951_0_9[6] = l_v1994_0;
                            l_l_v1951_0_8[5] = l_v1993_0;
                            l_l_v1951_0_7[4] = l_v1992_0;
                            l_l_v1951_0_6[3] = l_v1991_0;
                            l_l_v1951_0_5[2] = l_v1990_0;
                            l_l_v1951_0_4[1] = l_v1989_0;
                            l_l_v1951_0_3[0] = l_v1988_0;
                            l_l_v1951_0_3 = l_v1952_0;
                            l_l_v1951_0_4 = l_v1952_0;
                            l_l_v1951_0_5 = l_v1952_0;
                            l_l_v1951_0_6 = l_v1952_0;
                            l_l_v1951_0_7 = l_v1952_0;
                            l_l_v1951_0_8 = l_v1952_0;
                            l_l_v1951_0_9 = l_v1952_0;
                            l_l_v1951_0_10 = l_v1952_0;
                            l_v1988_0 = v1183[1];
                            l_v1989_0 = v1183[2];
                            l_v1990_0 = v1183[3];
                            l_v1991_0 = v1183[4];
                            l_v1992_0 = v1183[5];
                            l_v1993_0 = v1183[6];
                            l_v1994_0 = v1183[7];
                            l_l_v1951_0_10[15] = v1183[8];
                            l_l_v1951_0_9[14] = l_v1994_0;
                            l_l_v1951_0_8[13] = l_v1993_0;
                            l_l_v1951_0_7[12] = l_v1992_0;
                            l_l_v1951_0_6[11] = l_v1991_0;
                            l_l_v1951_0_5[10] = l_v1990_0;
                            l_l_v1951_0_4[9] = l_v1989_0;
                            l_l_v1951_0_3[8] = l_v1988_0;
                            v1984 = v1984 + (v1985 or 128);
                            l_l_v1951_0_3 = v1984 % 4294967296;
                            l_l_v1951_0_4 = l_floor_1(v1984 / 4294967296);
                            l_v1951_0[12] = v1157(l_v1951_0[12], l_l_v1951_0_3);
                            l_v1952_0[12] = v1157(l_v1952_0[12], l_l_v1951_0_4);
                            if v1985 then
                                l_v1951_0[14] = v1162(l_v1951_0[14]);
                                l_v1952_0[14] = v1162(l_v1952_0[14]);
                            end;
                            if v1986 then
                                l_v1951_0[15] = v1162(l_v1951_0[15]);
                                l_v1952_0[15] = v1162(l_v1952_0[15]);
                            end;
                            for v2025 = 1, 12 do
                                l_l_v1951_0_9 = v1201[v2025];
                                v1978(0, 4, 8, 12, l_l_v1951_0_9[1], l_l_v1951_0_9[2]);
                                v1978(1, 5, 9, 13, l_l_v1951_0_9[3], l_l_v1951_0_9[4]);
                                v1978(2, 6, 10, 14, l_l_v1951_0_9[5], l_l_v1951_0_9[6]);
                                v1978(3, 7, 11, 15, l_l_v1951_0_9[7], l_l_v1951_0_9[8]);
                                v1978(0, 5, 10, 15, l_l_v1951_0_9[9], l_l_v1951_0_9[10]);
                                v1978(1, 6, 11, 12, l_l_v1951_0_9[11], l_l_v1951_0_9[12]);
                                v1978(2, 7, 8, 13, l_l_v1951_0_9[13], l_l_v1951_0_9[14]);
                                v1978(3, 4, 9, 14, l_l_v1951_0_9[15], l_l_v1951_0_9[16]);
                            end;
                            v1988 = v1157(v1988, l_v1951_0[0], l_v1951_0[8]);
                            v1989 = v1157(v1989, l_v1951_0[1], l_v1951_0[9]);
                            v1990 = v1157(v1990, l_v1951_0[2], l_v1951_0[10]);
                            v1991 = v1157(v1991, l_v1951_0[3], l_v1951_0[11]);
                            v1992 = v1157(v1992, l_v1951_0[4], l_v1951_0[12]);
                            v1993 = v1157(v1993, l_v1951_0[5], l_v1951_0[13]);
                            v1994 = v1157(v1994, l_v1951_0[6], l_v1951_0[14]);
                            v1995 = v1157(v1995, l_v1951_0[7], l_v1951_0[15]);
                            v1996 = v1157(v1996, l_v1952_0[0], l_v1952_0[8]);
                            v1997 = v1157(v1997, l_v1952_0[1], l_v1952_0[9]);
                            v1998 = v1157(v1998, l_v1952_0[2], l_v1952_0[10]);
                            v1999 = v1157(v1999, l_v1952_0[3], l_v1952_0[11]);
                            v2000 = v1157(v2000, l_v1952_0[4], l_v1952_0[12]);
                            v2001 = v1157(v2001, l_v1952_0[5], l_v1952_0[13]);
                            v2002 = v1157(v2002, l_v1952_0[6], l_v1952_0[14]);
                            v2003 = v1157(v2003, l_v1952_0[7], l_v1952_0[15]);
                        end;
                        local v2026 = v1988 % 4294967296;
                        local v2027 = v1989 % 4294967296;
                        local v2028 = v1990 % 4294967296;
                        local v2029 = v1991 % 4294967296;
                        local v2030 = v1992 % 4294967296;
                        local v2031 = v1993 % 4294967296;
                        local v2032 = v1994 % 4294967296;
                        v1979[8] = v1995 % 4294967296;
                        v1979[7] = v2032;
                        v1979[6] = v2031;
                        v1979[5] = v2030;
                        v1979[4] = v2029;
                        v1979[3] = v2028;
                        v1979[2] = v2027;
                        v1979[1] = v2026;
                        v2026 = v1996 % 4294967296;
                        v2027 = v1997 % 4294967296;
                        v2028 = v1998 % 4294967296;
                        v2029 = v1999 % 4294967296;
                        v2030 = v2000 % 4294967296;
                        v2031 = v2001 % 4294967296;
                        v2032 = v2002 % 4294967296;
                        v1980[8] = v2003 % 4294967296;
                        v1980[7] = v2032;
                        v1980[6] = v2031;
                        v1980[5] = v2030;
                        v1980[4] = v2029;
                        v1980[3] = v2028;
                        v1980[2] = v2027;
                        v1980[1] = v2026;
                        return v1984;
                    end;
                end;
            end;
        end;
        if v1154 == "FFI" or v1154 == "LJ" then
            local l_l_v1194_1_0 = l_v1194_1;
            local l_v1197_0 = v1197;
            do
                local l_l_l_v1194_1_0_0, l_l_v1197_0_0 = l_l_v1194_1_0, l_v1197_0;
                local function v2054(v2037, v2038, v2039, v2040, v2041, v2042)
                    -- upvalues: l_l_v1197_0_0 (ref), v1163 (ref), l_l_l_v1194_1_0_0 (ref), v1161 (ref), v1157 (ref)
                    local v2043 = l_l_v1197_0_0[v2037];
                    local v2044 = l_l_v1197_0_0[v2038];
                    local v2045 = l_l_v1197_0_0[v2039];
                    local v2046 = l_l_v1197_0_0[v2040];
                    v2043 = v1163(l_l_l_v1194_1_0_0[v2041] + (v2043 + v2044));
                    v2046 = v1161(v1157(v2046, v2043), 16);
                    v2045 = v1163(v2045 + v2046);
                    v2044 = v1161(v1157(v2044, v2045), 12);
                    v2043 = v1163(l_l_l_v1194_1_0_0[v2042] + (v2043 + v2044));
                    v2046 = v1161(v1157(v2046, v2043), 8);
                    v2045 = v1163(v2045 + v2046);
                    v2044 = v1161(v1157(v2044, v2045), 7);
                    local l_l_l_v1197_0_0_0 = l_l_v1197_0_0;
                    local l_l_l_v1197_0_0_1 = l_l_v1197_0_0;
                    local l_l_l_v1197_0_0_2 = l_l_v1197_0_0;
                    local l_l_l_v1197_0_0_3 = l_l_v1197_0_0;
                    local l_v2043_0 = v2043;
                    local l_v2044_0 = v2044;
                    local l_v2045_0 = v2045;
                    l_l_l_v1197_0_0_3[v2040] = v2046;
                    l_l_l_v1197_0_0_2[v2039] = l_v2045_0;
                    l_l_l_v1197_0_0_1[v2038] = l_v2044_0;
                    l_l_l_v1197_0_0_0[v2037] = l_v2043_0;
                end;
                v1177 = function(v2055, v2056, v2057, v2058, v2059, v2060, v2061)
                    -- upvalues: v1163 (ref), l_byte_1 (ref), l_l_l_v1194_1_0_0 (ref), v1156 (ref), v1158 (ref), l_l_v1197_0_0 (ref), v1183 (ref), l_floor_1 (ref), v1157 (ref), v1162 (ref), v1201 (ref), v2054 (ref)
                    local v2062 = v1163(v2055[1]);
                    local v2063 = v1163(v2055[2]);
                    local v2064 = v1163(v2055[3]);
                    local v2065 = v1163(v2055[4]);
                    local v2066 = v1163(v2055[5]);
                    local v2067 = v1163(v2055[6]);
                    local v2068 = v1163(v2055[7]);
                    local v2069 = v1163(v2055[8]);
                    for v2070 = v2057, v2057 + v2058 - 1, 64 do
                        if v2056 then
                            for v2071 = 1, 16 do
                                v2070 = v2070 + 4;
                                local v2072, v2073, v2074, v2075 = l_byte_1(v2056, v2070 - 3, v2070);
                                l_l_l_v1194_1_0_0[v2071] = v1156(v1158(v2075, 24), v1158(v2074, 16), v1158(v2073, 8), v2072);
                            end;
                        end;
                        local l_l_l_v1197_0_0_4 = l_l_v1197_0_0;
                        local l_l_l_v1197_0_0_5 = l_l_v1197_0_0;
                        local l_l_l_v1197_0_0_6 = l_l_v1197_0_0;
                        local l_l_l_v1197_0_0_7 = l_l_v1197_0_0;
                        local l_l_l_v1197_0_0_8 = l_l_v1197_0_0;
                        local l_l_l_v1197_0_0_9 = l_l_v1197_0_0;
                        local l_l_l_v1197_0_0_10 = l_l_v1197_0_0;
                        local l_l_l_v1197_0_0_11 = l_l_v1197_0_0;
                        local l_v2062_0 = v2062;
                        local l_v2063_0 = v2063;
                        local l_v2064_0 = v2064;
                        local l_v2065_0 = v2065;
                        local l_v2066_0 = v2066;
                        local l_v2067_0 = v2067;
                        local l_v2068_0 = v2068;
                        l_l_l_v1197_0_0_11[7] = v2069;
                        l_l_l_v1197_0_0_10[6] = l_v2068_0;
                        l_l_l_v1197_0_0_9[5] = l_v2067_0;
                        l_l_l_v1197_0_0_8[4] = l_v2066_0;
                        l_l_l_v1197_0_0_7[3] = l_v2065_0;
                        l_l_l_v1197_0_0_6[2] = l_v2064_0;
                        l_l_l_v1197_0_0_5[1] = l_v2063_0;
                        l_l_l_v1197_0_0_4[0] = l_v2062_0;
                        l_l_l_v1197_0_0_4 = l_l_v1197_0_0;
                        l_l_l_v1197_0_0_5 = l_l_v1197_0_0;
                        l_l_l_v1197_0_0_6 = l_l_v1197_0_0;
                        l_l_l_v1197_0_0_7 = l_l_v1197_0_0;
                        l_l_l_v1197_0_0_8 = l_l_v1197_0_0;
                        l_l_l_v1197_0_0_9 = l_l_v1197_0_0;
                        l_l_l_v1197_0_0_10 = v1163(v1183[1]);
                        l_l_l_v1197_0_0_11 = v1163(v1183[2]);
                        l_v2062_0 = v1163(v1183[3]);
                        l_v2063_0 = v1163(v1183[4]);
                        l_v2064_0 = v1163(v1183[7]);
                        l_l_l_v1197_0_0_9[15] = v1163(v1183[8]);
                        l_l_l_v1197_0_0_8[14] = l_v2064_0;
                        l_l_l_v1197_0_0_7[11] = l_v2063_0;
                        l_l_l_v1197_0_0_6[10] = l_v2062_0;
                        l_l_l_v1197_0_0_5[9] = l_l_l_v1197_0_0_11;
                        l_l_l_v1197_0_0_4[8] = l_l_l_v1197_0_0_10;
                        v2059 = v2059 + (v2060 or 64);
                        l_l_l_v1197_0_0_4 = v2059 % 4294967296;
                        l_l_l_v1197_0_0_5 = l_floor_1(v2059 / 4294967296);
                        l_l_v1197_0_0[12] = v1157(v1183[5], l_l_l_v1197_0_0_4);
                        l_l_v1197_0_0[13] = v1157(v1183[6], l_l_l_v1197_0_0_5);
                        if v2060 then
                            l_l_v1197_0_0[14] = v1162(l_l_v1197_0_0[14]);
                        end;
                        if v2061 then
                            l_l_v1197_0_0[15] = v1162(l_l_v1197_0_0[15]);
                        end;
                        for v2091 = 1, 10 do
                            l_l_l_v1197_0_0_10 = v1201[v2091];
                            v2054(0, 4, 8, 12, l_l_l_v1197_0_0_10[1], l_l_l_v1197_0_0_10[2]);
                            v2054(1, 5, 9, 13, l_l_l_v1197_0_0_10[3], l_l_l_v1197_0_0_10[4]);
                            v2054(2, 6, 10, 14, l_l_l_v1197_0_0_10[5], l_l_l_v1197_0_0_10[6]);
                            v2054(3, 7, 11, 15, l_l_l_v1197_0_0_10[7], l_l_l_v1197_0_0_10[8]);
                            v2054(0, 5, 10, 15, l_l_l_v1197_0_0_10[9], l_l_l_v1197_0_0_10[10]);
                            v2054(1, 6, 11, 12, l_l_l_v1197_0_0_10[11], l_l_l_v1197_0_0_10[12]);
                            v2054(2, 7, 8, 13, l_l_l_v1197_0_0_10[13], l_l_l_v1197_0_0_10[14]);
                            v2054(3, 4, 9, 14, l_l_l_v1197_0_0_10[15], l_l_l_v1197_0_0_10[16]);
                        end;
                        v2062 = v1157(v2062, l_l_v1197_0_0[0], l_l_v1197_0_0[8]);
                        v2063 = v1157(v2063, l_l_v1197_0_0[1], l_l_v1197_0_0[9]);
                        v2064 = v1157(v2064, l_l_v1197_0_0[2], l_l_v1197_0_0[10]);
                        v2065 = v1157(v2065, l_l_v1197_0_0[3], l_l_v1197_0_0[11]);
                        v2066 = v1157(v2066, l_l_v1197_0_0[4], l_l_v1197_0_0[12]);
                        v2067 = v1157(v2067, l_l_v1197_0_0[5], l_l_v1197_0_0[13]);
                        v2068 = v1157(v2068, l_l_v1197_0_0[6], l_l_v1197_0_0[14]);
                        v2069 = v1157(v2069, l_l_v1197_0_0[7], l_l_v1197_0_0[15]);
                    end;
                    local l_v2062_1 = v2062;
                    local l_v2063_1 = v2063;
                    local l_v2064_1 = v2064;
                    local l_v2065_1 = v2065;
                    local l_v2066_1 = v2066;
                    local l_v2067_1 = v2067;
                    local l_v2068_1 = v2068;
                    v2055[8] = v2069;
                    v2055[7] = l_v2068_1;
                    v2055[6] = l_v2067_1;
                    v2055[5] = l_v2066_1;
                    v2055[4] = l_v2065_1;
                    v2055[3] = l_v2064_1;
                    v2055[2] = l_v2063_1;
                    v2055[1] = l_v2062_1;
                    return v2059;
                end;
                v1179 = function(v2099, v2100, v2101, v2102, v2103, v2104, v2105, v2106, v2107)
                    -- upvalues: v1163 (ref), l_byte_1 (ref), l_l_l_v1194_1_0_0 (ref), v1156 (ref), v1158 (ref), l_l_v1197_0_0 (ref), v1183 (ref), l_floor_1 (ref), v2054 (ref), v1202 (ref), v1157 (ref)
                    if not v2107 then
                        v2107 = 64;
                    end;
                    local v2108 = v1163(v2104[1]);
                    local v2109 = v1163(v2104[2]);
                    local v2110 = v1163(v2104[3]);
                    local v2111 = v1163(v2104[4]);
                    local v2112 = v1163(v2104[5]);
                    local v2113 = v1163(v2104[6]);
                    local v2114 = v1163(v2104[7]);
                    local v2115 = v1163(v2104[8]);
                    if not v2105 then
                        v2105 = v2104;
                    end;
                    for v2116 = v2100, v2100 + v2101 - 1, 64 do
                        if v2099 then
                            for v2117 = 1, 16 do
                                v2116 = v2116 + 4;
                                local v2118, v2119, v2120, v2121 = l_byte_1(v2099, v2116 - 3, v2116);
                                l_l_l_v1194_1_0_0[v2117] = v1156(v1158(v2121, 24), v1158(v2120, 16), v1158(v2119, 8), v2118);
                            end;
                        end;
                        local l_l_l_v1197_0_0_12 = l_l_v1197_0_0;
                        local l_l_l_v1197_0_0_13 = l_l_v1197_0_0;
                        local l_l_l_v1197_0_0_14 = l_l_v1197_0_0;
                        local l_l_l_v1197_0_0_15 = l_l_v1197_0_0;
                        local l_l_l_v1197_0_0_16 = l_l_v1197_0_0;
                        local l_l_l_v1197_0_0_17 = l_l_v1197_0_0;
                        local l_l_l_v1197_0_0_18 = l_l_v1197_0_0;
                        local l_l_l_v1197_0_0_19 = l_l_v1197_0_0;
                        local l_v2108_0 = v2108;
                        local l_v2109_0 = v2109;
                        local l_v2110_0 = v2110;
                        local l_v2111_0 = v2111;
                        local l_v2112_0 = v2112;
                        local l_v2113_0 = v2113;
                        local l_v2114_0 = v2114;
                        l_l_l_v1197_0_0_19[7] = v2115;
                        l_l_l_v1197_0_0_18[6] = l_v2114_0;
                        l_l_l_v1197_0_0_17[5] = l_v2113_0;
                        l_l_l_v1197_0_0_16[4] = l_v2112_0;
                        l_l_l_v1197_0_0_15[3] = l_v2111_0;
                        l_l_l_v1197_0_0_14[2] = l_v2110_0;
                        l_l_l_v1197_0_0_13[1] = l_v2109_0;
                        l_l_l_v1197_0_0_12[0] = l_v2108_0;
                        l_l_l_v1197_0_0_12 = l_l_v1197_0_0;
                        l_l_l_v1197_0_0_13 = l_l_v1197_0_0;
                        l_l_l_v1197_0_0_14 = l_l_v1197_0_0;
                        l_l_l_v1197_0_0_15 = l_l_v1197_0_0;
                        l_l_l_v1197_0_0_16 = v1163(v1183[1]);
                        l_l_l_v1197_0_0_17 = v1163(v1183[2]);
                        l_l_l_v1197_0_0_18 = v1163(v1183[3]);
                        l_l_l_v1197_0_0_15[11] = v1163(v1183[4]);
                        l_l_l_v1197_0_0_14[10] = l_l_l_v1197_0_0_18;
                        l_l_l_v1197_0_0_13[9] = l_l_l_v1197_0_0_17;
                        l_l_l_v1197_0_0_12[8] = l_l_l_v1197_0_0_16;
                        l_l_v1197_0_0[12] = v1163(v2103 % 4294967296);
                        l_l_v1197_0_0[13] = l_floor_1(v2103 / 4294967296);
                        l_l_l_v1197_0_0_12 = l_l_v1197_0_0;
                        l_l_l_v1197_0_0_13 = l_l_v1197_0_0;
                        l_l_l_v1197_0_0_14 = v2107;
                        l_l_l_v1197_0_0_13[15] = v2102;
                        l_l_l_v1197_0_0_12[14] = l_l_l_v1197_0_0_14;
                        for v2137 = 1, 7 do
                            v2054(0, 4, 8, 12, v1202[v2137], v1202[v2137 + 14]);
                            v2054(1, 5, 9, 13, v1202[v2137 + 1], v1202[v2137 + 2]);
                            v2054(2, 6, 10, 14, v1202[v2137 + 16], v1202[v2137 + 7]);
                            v2054(3, 7, 11, 15, v1202[v2137 + 15], v1202[v2137 + 17]);
                            v2054(0, 5, 10, 15, v1202[v2137 + 21], v1202[v2137 + 5]);
                            v2054(1, 6, 11, 12, v1202[v2137 + 3], v1202[v2137 + 6]);
                            v2054(2, 7, 8, 13, v1202[v2137 + 4], v1202[v2137 + 18]);
                            v2054(3, 4, 9, 14, v1202[v2137 + 19], v1202[v2137 + 20]);
                        end;
                        if v2106 then
                            v2105[9] = v1157(v2108, l_l_v1197_0_0[8]);
                            v2105[10] = v1157(v2109, l_l_v1197_0_0[9]);
                            v2105[11] = v1157(v2110, l_l_v1197_0_0[10]);
                            v2105[12] = v1157(v2111, l_l_v1197_0_0[11]);
                            v2105[13] = v1157(v2112, l_l_v1197_0_0[12]);
                            v2105[14] = v1157(v2113, l_l_v1197_0_0[13]);
                            v2105[15] = v1157(v2114, l_l_v1197_0_0[14]);
                            v2105[16] = v1157(v2115, l_l_v1197_0_0[15]);
                        end;
                        v2108 = v1157(l_l_v1197_0_0[0], l_l_v1197_0_0[8]);
                        v2109 = v1157(l_l_v1197_0_0[1], l_l_v1197_0_0[9]);
                        v2110 = v1157(l_l_v1197_0_0[2], l_l_v1197_0_0[10]);
                        v2111 = v1157(l_l_v1197_0_0[3], l_l_v1197_0_0[11]);
                        v2112 = v1157(l_l_v1197_0_0[4], l_l_v1197_0_0[12]);
                        v2113 = v1157(l_l_v1197_0_0[5], l_l_v1197_0_0[13]);
                        v2114 = v1157(l_l_v1197_0_0[6], l_l_v1197_0_0[14]);
                        v2115 = v1157(l_l_v1197_0_0[7], l_l_v1197_0_0[15]);
                    end;
                    local l_v2108_1 = v2108;
                    local l_v2109_1 = v2109;
                    local l_v2110_1 = v2110;
                    local l_v2111_1 = v2111;
                    local l_v2112_1 = v2112;
                    local l_v2113_1 = v2113;
                    local l_v2114_1 = v2114;
                    v2105[8] = v2115;
                    v2105[7] = l_v2114_1;
                    v2105[6] = l_v2113_1;
                    v2105[5] = l_v2112_1;
                    v2105[4] = l_v2111_1;
                    v2105[3] = l_v2110_1;
                    v2105[2] = l_v2109_1;
                    v2105[1] = l_v2108_1;
                end;
            end;
        end;
        local function v2156(v2145, v2146, v2147, v2148)
            -- upvalues: l_max_0 (ref), l_min_0 (ref), l_floor_1 (ref)
            local v2149 = {};
            local v2150 = 0;
            local v2151 = 0;
            local v2152 = 1;
            for v2153 = 1, v2148 do
                for v2154 = l_max_0(1, v2153 + 1 - #v2146), l_min_0(v2153, #v2145) do
                    v2150 = v2150 + v2147 * v2145[v2154] * v2146[v2153 + 1 - v2154];
                end;
                local v2155 = v2150 % 16777216;
                v2149[v2153] = l_floor_1(v2155);
                v2150 = (v2150 - v2155) / 16777216;
                v2151 = v2151 + v2155 * v2152;
                v2152 = v2152 * 16777216;
            end;
            return v2149, v2151;
        end;
        local v2157 = 0;
        local v2158 = {
            [1] = 4, 
            [2] = 1, 
            [3] = 2, 
            [4] = -2, 
            [5] = 2
        };
        local v2159 = 4;
        local v2160 = {
            [1] = 1
        };
        local l_v1183_0 = v1183;
        local l_v1182_0 = v1182;
        repeat
            v2159 = v2159 + v2158[v2159 % 6];
            local v2163 = 1;
            while true do
                v2163 = v2163 + v2158[v2163 % 6];
                if v2159 < v2163 * v2163 then
                    local v2164 = v2159 ^ 0.3333333333333333;
                    local v2165 = v2164 * 1099511627776;
                    v2165 = v2156({
                        [1] = v2165 - v2165 % 1
                    }, v2160, 1, 2);
                    local v2166, v2167 = v2156(v2165, v2156(v2165, v2165, 1, 4), -1, 4);
                    local v2168 = v2165[2] % 65536 * 65536 + l_floor_1(v2165[1] / 256);
                    local v2169 = v2165[1] % 256 * 16777216 + l_floor_1(v2167 * 4.625929269271485E-18 * v2164 / v2159);
                    if v2157 < 16 then
                        v2164 = v2159 ^ 0.5;
                        v2165 = v2164 * 1099511627776;
                        v2165 = v2156({
                            [1] = v2165 - v2165 % 1
                        }, v2160, 1, 2);
                        local v2170, v2171 = v2156(v2165, v2165, -1, 2);
                        v2167 = v2171;
                        v2166 = v2170;
                        v2170 = v2165[2] % 65536 * 65536 + l_floor_1(v2165[1] / 256);
                        v2171 = v2165[1] % 256 * 16777216 + l_floor_1(v2167 * 7.62939453125E-6 / v2164);
                        local v2172 = v2157 % 8 + 1;
                        v1186[224][v2172] = v2171;
                        local l_v2170_0 = v2170;
                        l_v1182_0[v2172] = v2171 + v2170 * v1199;
                        l_v1183_0[v2172] = l_v2170_0;
                        if v2172 > 7 then
                            l_v2170_0 = v1188[384];
                            l_v1182_0 = v1187[384];
                            l_v1183_0 = l_v2170_0;
                        end;
                    end;
                    v2157 = v2157 + 1;
                    local l_v2168_0 = v2168;
                    v1180[v2157] = v2169 % v1198 + v2168 * v1199;
                    v1181[v2157] = l_v2168_0;
                    break;
                elseif v2159 % v2163 == 0 then
                    break;
                end;
            end;
        until v2157 > 79;
        for v2175 = 224, 256, 32 do
            v2160 = {};
            l_v1183_0 = nil;
            if v1192 then
                for v2176 = 1, 8 do
                    v2160[v2176] = v1170(v1182[v2176]);
                end;
            else
                l_v1183_0 = {};
                for v2177 = 1, 8 do
                    v2160[v2177] = v1170(v1182[v2177]);
                    l_v1183_0[v2177] = v1170(v1183[v2177]);
                end;
            end;
            v1173(v2160, l_v1183_0, "SHA-512/" .. tostring(v2175) .. "\128" .. l_rep_1("\000", 115) .. "X", 0, 128);
            v1187[v2175] = v2160;
            v1188[v2175] = l_v1183_0;
        end;
        v2156 = math.sin;
        v2157 = math.abs;
        v2158 = math.modf;
        for v2178 = 1, 64 do
            local v2179, v2180 = v2158(v2157(v2156(v2178)) * 65536);
            v1189[v2178] = v2179 * 65536 + l_floor_1(v2180 * 65536);
        end;
        v2156 = 29;
        do
            local l_v2156_0 = v2156;
            v2157 = function()
                -- upvalues: l_v2156_0 (ref), v1165 (ref)
                local v2182 = l_v2156_0 % 2;
                l_v2156_0 = v1165((l_v2156_0 - v2182) / 2, 142 * v2182);
                return v2182;
            end;
            for v2183 = 1, 24 do
                l_v1182_0 = 0;
                local v2184 = nil;
                for _ = 1, 6 do
                    if v2184 then
                        local v2186 = v2184 * v2184 * 2;
                        if v2186 then
                            v2184 = v2186;
                            goto label0 --[[  true, true  ]];
                        end;
                    end;
                    v2184 = 1;
                    ::label0::;
                    l_v1182_0 = l_v1182_0 + v2157() * v2184;
                end;
                local v2187 = v2157() * v2184;
                local l_v2187_0 = v2187;
                v1184[v2183] = l_v1182_0 + v2187 * v1200;
                v1185[v2183] = l_v2187_0;
            end;
        end;
        if v1154 == "FFI" then
            v1181 = v1144.new("uint32_t[?]", #v1181 + 1, 0, v1110(v1181));
            v1180 = v1144.new("int64_t[?]", #v1180 + 1, 0, v1110(v1180));
            if v1200 == 0 then
                v1184 = v1144.new("uint32_t[?]", #v1184 + 1, 0, v1110(v1184));
                v1185 = v1144.new("uint32_t[?]", #v1185 + 1, 0, v1110(v1185));
            else
                v1184 = v1144.new("int64_t[?]", #v1184 + 1, 0, v1110(v1184));
            end;
        end;
        v2156 = function(v2189, v2190)
            -- upvalues: v1110 (ref), v1186 (ref), v1172 (ref), l_sub_1 (ref), l_rep_1 (ref), l_char_1 (ref), l_floor_1 (ref), l_concat_1 (ref), v1164 (ref)
            local v2191 = {
                v1110(v1186[v2189])
            };
            local v2192 = 0;
            local v2193 = "";
            local function v2194(v2195)
                -- upvalues: v2193 (ref), v2192 (ref), v1172 (ref), v2191 (ref), l_sub_1 (ref), v2194 (ref), l_rep_1 (ref), l_char_1 (ref), l_floor_1 (ref), l_concat_1 (ref), v2189 (ref), v1164 (ref)
                if v2195 then
                    if v2193 then
                        v2192 = v2192 + #v2195;
                        local v2196 = 0;
                        if v2193 ~= "" and #v2193 + #v2195 >= 64 then
                            v2196 = 64 - #v2193;
                            v1172(v2191, v2193 .. l_sub_1(v2195, 1, v2196), 0, 64);
                            v2193 = "";
                        end;
                        local v2197 = #v2195 - v2196;
                        local v2198 = v2197 % 64;
                        v1172(v2191, v2195, v2196, v2197 - v2198);
                        v2193 = v2193 .. l_sub_1(v2195, #v2195 + 1 - v2198);
                        return v2194;
                    else
                        error("Adding more chunks is not allowed after receiving the result", 2);
                        return;
                    end;
                else
                    if v2193 then
                        local v2199 = {
                            nil, 
                            "\128", 
                            [1] = v2193, 
                            l_rep_1("\000", (-9 - v2192) % 64 + 1)
                        };
                        v2193 = nil;
                        v2192 = v2192 * 1.1102230246251565E-16;
                        for v2200 = 4, 10 do
                            v2192 = v2192 % 1 * 256;
                            v2199[v2200] = l_char_1(l_floor_1(v2192));
                        end;
                        v2199 = l_concat_1(v2199);
                        v1172(v2191, v2199, 0, #v2199);
                        local v2201 = v2189 / 32;
                        for v2202 = 1, v2201 do
                            v2191[v2202] = v1164(v2191[v2202]);
                        end;
                        v2191 = l_concat_1(v2191, "", 1, v2201);
                    end;
                    return v2191;
                end;
            end;
            if v2190 then
                return v2194(v2190)();
            else
                return v2194;
            end;
        end;
        v2157 = function(v2203, v2204)
            -- upvalues: v1110 (ref), v1187 (ref), v1192 (ref), v1188 (ref), v1173 (ref), l_sub_1 (ref), l_rep_1 (ref), l_char_1 (ref), l_floor_1 (ref), l_concat_1 (ref), l_ceil_0 (ref), v1164 (ref)
            local v2205 = 0;
            local v2206 = "";
            local v2207 = {
                v1110(v1187[v2203])
            };
            local v2208 = not v1192 and {
                v1110(v1188[v2203])
            };
            local function v2209(v2210)
                -- upvalues: v2206 (ref), v2205 (ref), v1173 (ref), v2207 (ref), v2208 (ref), l_sub_1 (ref), v2209 (ref), l_rep_1 (ref), l_char_1 (ref), l_floor_1 (ref), l_concat_1 (ref), l_ceil_0 (ref), v2203 (ref), v1192 (ref), v1164 (ref)
                if v2210 then
                    if v2206 then
                        v2205 = v2205 + #v2210;
                        local v2211 = 0;
                        if v2206 ~= "" and #v2206 + #v2210 >= 128 then
                            v2211 = 128 - #v2206;
                            v1173(v2207, v2208, v2206 .. l_sub_1(v2210, 1, v2211), 0, 128);
                            v2206 = "";
                        end;
                        local v2212 = #v2210 - v2211;
                        local v2213 = v2212 % 128;
                        v1173(v2207, v2208, v2210, v2211, v2212 - v2213);
                        v2206 = v2206 .. l_sub_1(v2210, #v2210 + 1 - v2213);
                        return v2209;
                    else
                        error("Adding more chunks is not allowed after receiving the result", 2);
                        return;
                    end;
                else
                    if v2206 then
                        local v2214 = {
                            nil, 
                            "\128", 
                            [1] = v2206, 
                            l_rep_1("\000", (-17 - v2205) % 128 + 9)
                        };
                        v2206 = nil;
                        v2205 = v2205 * 1.1102230246251565E-16;
                        for v2215 = 4, 10 do
                            v2205 = v2205 % 1 * 256;
                            v2214[v2215] = l_char_1(l_floor_1(v2205));
                        end;
                        v2214 = l_concat_1(v2214);
                        v1173(v2207, v2208, v2214, 0, #v2214);
                        local v2216 = l_ceil_0(v2203 / 64);
                        if v1192 then
                            for v2217 = 1, v2216 do
                                v2207[v2217] = v1192(v2207[v2217]);
                            end;
                        else
                            for v2218 = 1, v2216 do
                                v2207[v2218] = v1164(v2208[v2218]) .. v1164(v2207[v2218]);
                            end;
                            v2208 = nil;
                        end;
                        v2207 = l_sub_1(l_concat_1(v2207, "", 1, v2216), 1, v2203 / 4);
                    end;
                    return v2207;
                end;
            end;
            if v2204 then
                return v2209(v2204)();
            else
                return v2209;
            end;
        end;
        v2158 = nil;
        v2159 = nil;
        v2160 = nil;
        l_v1183_0 = nil;
        v2158 = function(v2219)
            -- upvalues: l_gsub_1 (ref), l_char_1 (ref), l_tonumber_1 (ref)
            return (l_gsub_1(v2219, "%x%x", function(v2220)
                -- upvalues: l_char_1 (ref), l_tonumber_1 (ref)
                return l_char_1(l_tonumber_1(v2220, 16));
            end));
        end;
        v2159 = function(v2221)
            -- upvalues: l_gsub_1 (ref), l_format_1 (ref), l_byte_1 (ref)
            return (l_gsub_1(v2221, ".", function(v2222)
                -- upvalues: l_format_1 (ref), l_byte_1 (ref)
                return l_format_1("%02x", l_byte_1(v2222));
            end));
        end;
        l_v1182_0 = {
            ["/"] = 63, 
            [63] = "/", 
            [-1] = "=", 
            _ = 63, 
            ["-"] = 62, 
            ["="] = -1, 
            ["+"] = 62, 
            [62] = "+", 
            ["."] = -1
        };
        local v2223 = 0;
        for _, v2225 in ipairs({
            [1] = "AZ", 
            [2] = "az", 
            [3] = "09"
        }) do
            for v2226 = l_byte_1(v2225), l_byte_1(v2225, 2) do
                local v2227 = l_char_1(v2226);
                l_v1182_0[v2227] = v2223;
                l_v1182_0[v2223] = v2227;
                v2223 = v2223 + 1;
            end;
        end;
        do
            local l_l_v1182_0_0 = l_v1182_0;
            v2160 = function(v2229)
                -- upvalues: l_byte_1 (ref), l_sub_1 (ref), l_l_v1182_0_0 (ref), l_floor_1 (ref), l_concat_1 (ref)
                local v2230 = {};
                for v2231 = 1, #v2229, 3 do
                    local v2232, v2233, v2234, v2235 = l_byte_1(l_sub_1(v2229, v2231, v2231 + 2) .. "\000", 1, -1);
                    v2230[#v2230 + 1] = l_l_v1182_0_0[l_floor_1(v2232 / 4)] .. l_l_v1182_0_0[v2232 % 4 * 16 + l_floor_1(v2233 / 16)] .. l_l_v1182_0_0[v2234 and v2233 % 16 * 4 + l_floor_1(v2234 / 64) or -1] .. l_l_v1182_0_0[v2235 and v2234 % 64 or -1];
                end;
                return l_concat_1(v2230);
            end;
            l_v1183_0 = function(v2236)
                -- upvalues: l_gmatch_0 (ref), l_gsub_1 (ref), l_l_v1182_0_0 (ref), l_floor_1 (ref), l_sub_1 (ref), l_char_1 (ref), l_concat_1 (ref)
                local v2237 = {};
                local v2238 = 3;
                for v2239, v2240 in l_gmatch_0(l_gsub_1(v2236, "%s+", ""), "()(.)") do
                    local v2241 = l_l_v1182_0_0[v2240];
                    if v2241 < 0 then
                        v2238 = v2238 - 1;
                        v2241 = 0;
                    end;
                    local v2242 = v2239 % 4;
                    if v2242 > 0 then
                        v2237[-v2242] = v2241;
                    else
                        local v2243 = v2237[-1] * 4 + l_floor_1(v2237[-2] / 16);
                        local v2244 = v2237[-2] % 16 * 16 + l_floor_1(v2237[-3] / 4);
                        local v2245 = v2237[-3] % 4 * 64 + v2241;
                        v2237[#v2237 + 1] = l_sub_1(l_char_1(v2243, v2244, v2245), 1, v2238);
                    end;
                end;
                return l_concat_1(v2237);
            end;
        end;
        l_v1182_0 = nil;
        v2223 = function(v2246, v2247, v2248)
            -- upvalues: l_gsub_1 (ref), l_char_1 (ref), v1165 (ref), l_byte_1 (ref), l_rep_1 (ref)
            return l_gsub_1(v2246, ".", function(v2249)
                -- upvalues: l_char_1 (ref), v1165 (ref), l_byte_1 (ref), v2248 (ref)
                return l_char_1(v1165(l_byte_1(v2249), v2248));
            end) .. l_rep_1(l_char_1(v2248), v2247 - #v2246);
        end;
        local function v2258(v2250, v2251, v2252)
            -- upvalues: l_v1182_0 (ref), v2158 (ref), v2223 (ref)
            local v2253 = l_v1182_0[v2250];
            if not v2253 then
                error("Unknown hash function", 2);
            end;
            if v2253 < #v2251 then
                v2251 = v2158(v2250(v2251));
            end;
            local v2254 = v2250()(v2223(v2251, v2253, 54));
            local v2255 = nil;
            local function v2256(v2257)
                -- upvalues: v2255 (ref), v2250 (ref), v2223 (ref), v2251 (ref), v2253 (ref), v2158 (ref), v2254 (ref), v2256 (ref)
                if not v2257 then
                    v2255 = v2255 or v2250(v2223(v2251, v2253, 92) .. v2158(v2254()));
                    return v2255;
                elseif v2255 then
                    error("Adding more chunks is not allowed after receiving the result", 2);
                    return;
                else
                    v2254(v2257);
                    return v2256;
                end;
            end;
            if v2252 then
                return v2256(v2252)();
            else
                return v2256;
            end;
        end;
        local v2265 = {
            sha224 = function(v2259)
                -- upvalues: v2156 (ref)
                return v2156(224, v2259);
            end, 
            sha256 = function(v2260)
                -- upvalues: v2156 (ref)
                return v2156(256, v2260);
            end, 
            sha512_224 = function(v2261)
                -- upvalues: v2157 (ref)
                return v2157(224, v2261);
            end, 
            sha512_256 = function(v2262)
                -- upvalues: v2157 (ref)
                return v2157(256, v2262);
            end, 
            sha384 = function(v2263)
                -- upvalues: v2157 (ref)
                return v2157(384, v2263);
            end, 
            sha512 = function(v2264)
                -- upvalues: v2157 (ref)
                return v2157(512, v2264);
            end, 
            hmac = v2258, 
            hex_to_bin = v2158, 
            bin_to_hex = v2159, 
            base64_to_bin = l_v1183_0, 
            bin_to_base64 = v2160, 
            hex2bin = v2158, 
            bin2hex = v2159, 
            base642bin = l_v1183_0, 
            bin2base64 = v2160
        };
        l_v1182_0 = {
            [v2265.sha224] = 64, 
            [v2265.sha256] = 64, 
            [v2265.sha512_224] = 128, 
            [v2265.sha512_256] = 128, 
            [v2265.sha384] = 128, 
            [v2265.sha512] = 128
        };
        return v2265;
    end)();
    local v2574 = {
        gamesense = (function()
            -- upvalues: l_ffi_0 (ref), l_bit_0 (ref), v1108 (ref), v925 (ref), v1015 (ref), v1099 (ref), v1045 (ref)
            local l_new_2 = l_ffi_0.new;
            local l_cast_2 = l_ffi_0.cast;
            local _ = l_ffi_0.cdef;
            local _ = l_ffi_0.typeof;
            local l_band_2 = l_bit_0.band;
            local l_bor_2 = l_bit_0.bor;
            local l_bxor_2 = l_bit_0.bxor;
            local _ = l_bit_0.bnot;
            local l_lshift_2 = l_bit_0.lshift;
            local l_rshift_2 = l_bit_0.rshift;
            local l_ror_1 = l_bit_0.ror;
            local l_rol_1 = l_bit_0.rol;
            local function v2280(v2279)
                -- upvalues: l_band_2 (ref), l_rshift_2 (ref)
                return l_band_2(l_rshift_2(v2279, 16), 65535);
            end;
            local function v2283(v2281, v2282)
                -- upvalues: l_band_2 (ref), l_bor_2 (ref), l_lshift_2 (ref), l_ror_1 (ref)
                v2281 = l_band_2(v2281, 65535);
                v2281 = l_bor_2(v2281, l_lshift_2(v2281, 16));
                return l_band_2(l_ror_1(v2281, v2282), 65535);
            end;
            local function v2286(v2284, v2285)
                -- upvalues: l_bor_2 (ref), l_rshift_2 (ref), l_lshift_2 (ref)
                return l_bor_2(l_rshift_2(v2284, v2285), l_lshift_2(v2284, 32 - v2285));
            end;
            local function v2289(v2287, v2288)
                -- upvalues: l_band_2 (ref), l_bor_2 (ref), l_lshift_2 (ref), l_rshift_2 (ref)
                v2287 = l_band_2(v2287, 65535);
                return l_band_2(l_bor_2(l_lshift_2(v2287, v2288), l_rshift_2(v2287, 16 - v2288)), 65535);
            end;
            local v2290 = l_new_2("uint8_t[24]");
            local v2291 = l_cast_2("uint16_t*", v2290);
            local v2292 = l_cast_2("uint32_t*", v2290);
            local function v2325(v2293, v2294)
                -- upvalues: v1108 (ref), v2292 (ref), l_band_2 (ref), v2290 (ref), l_bxor_2 (ref), v2291 (ref), l_rol_1 (ref), v2283 (ref), v2280 (ref), v925 (ref), v1015 (ref)
                local v2295 = v1108(v2294);
                v2292[0] = v2293[0].xuid_low;
                v2292[1] = v2293[0].xuid_high;
                v2292[2] = v2293[0].section_number;
                v2292[3] = v2293[0].sequence_bytes;
                v2292[4] = v2293[0].uncompressed_sample_offset;
                local v2296 = {
                    [0] = 94, 
                    [1] = 4, 
                    [2] = 184, 
                    [3] = 28, 
                    [4] = 143, 
                    [5] = 210, 
                    [6] = 241, 
                    [7] = 56, 
                    [8] = 207, 
                    [9] = 171, 
                    [10] = 136, 
                    [11] = 61, 
                    [12] = 194, 
                    [13] = 59, 
                    [14] = 115, 
                    [15] = 88, 
                    [16] = 65, 
                    [17] = 204, 
                    [18] = 6, 
                    [19] = 249, 
                    [20] = 32, 
                    [21] = 68, 
                    [22] = 121, 
                    [23] = 77, 
                    [24] = 172, 
                    [25] = 47, 
                    [26] = 202, 
                    [27] = 150, 
                    [28] = 217, 
                    [29] = 237, 
                    [30] = 34, 
                    [31] = 247, 
                    [32] = 44, 
                    [33] = 244, 
                    [34] = 67, 
                    [35] = 147, 
                    [36] = 13, 
                    [37] = 208, 
                    [38] = 70, 
                    [39] = 45, 
                    [40] = 141, 
                    [41] = 42, 
                    [42] = 180, 
                    [43] = 225, 
                    [44] = 12, 
                    [45] = 53, 
                    [46] = 89, 
                    [47] = 16, 
                    [48] = 114, 
                    [49] = 18, 
                    [50] = 236, 
                    [51] = 165, 
                    [52] = 79, 
                    [53] = 188, 
                    [54] = 174, 
                    [55] = 58, 
                    [56] = 71, 
                    [57] = 102, 
                    [58] = 205, 
                    [59] = 40, 
                    [60] = 160, 
                    [61] = 104, 
                    [62] = 154, 
                    [63] = 181, 
                    [64] = 92, 
                    [65] = 99, 
                    [66] = 246, 
                    [67] = 183, 
                    [68] = 36, 
                    [69] = 43, 
                    [70] = 195, 
                    [71] = 51, 
                    [72] = 90, 
                    [73] = 81, 
                    [74] = 76, 
                    [75] = 140, 
                    [76] = 49, 
                    [77] = 212, 
                    [78] = 177, 
                    [79] = 159, 
                    [80] = 122, 
                    [81] = 86, 
                    [82] = 235, 
                    [83] = 82, 
                    [84] = 112, 
                    [85] = 253, 
                    [86] = 2, 
                    [87] = 135, 
                    [88] = 84, 
                    [89] = 151, 
                    [90] = 232, 
                    [91] = 83, 
                    [92] = 10, 
                    [93] = 96, 
                    [94] = 120, 
                    [95] = 29, 
                    [96] = 145, 
                    [97] = 179, 
                    [98] = 134, 
                    [99] = 191, 
                    [100] = 98, 
                    [101] = 189, 
                    [102] = 201, 
                    [103] = 199, 
                    [104] = 7, 
                    [105] = 46, 
                    [106] = 80, 
                    [107] = 106, 
                    [108] = 105, 
                    [109] = 62, 
                    [110] = 190, 
                    [111] = 162, 
                    [112] = 166, 
                    [113] = 22, 
                    [114] = 119, 
                    [115] = 26, 
                    [116] = 196, 
                    [117] = 238, 
                    [118] = 87, 
                    [119] = 175, 
                    [120] = 146, 
                    [121] = 164, 
                    [122] = 176, 
                    [123] = 113, 
                    [124] = 9, 
                    [125] = 173, 
                    [126] = 152, 
                    [127] = 41, 
                    [128] = 206, 
                    [129] = 25, 
                    [130] = 224, 
                    [131] = 54, 
                    [132] = 198, 
                    [133] = 220, 
                    [134] = 230, 
                    [135] = 107, 
                    [136] = 211, 
                    [137] = 223, 
                    [138] = 148, 
                    [139] = 95, 
                    [140] = 131, 
                    [141] = 21, 
                    [142] = 52, 
                    [143] = 234, 
                    [144] = 153, 
                    [145] = 33, 
                    [146] = 221, 
                    [147] = 192, 
                    [148] = 19, 
                    [149] = 11, 
                    [150] = 254, 
                    [151] = 111, 
                    [152] = 66, 
                    [153] = 155, 
                    [154] = 75, 
                    [155] = 50, 
                    [156] = 64, 
                    [157] = 219, 
                    [158] = 222, 
                    [159] = 109, 
                    [160] = 14, 
                    [161] = 27, 
                    [162] = 124, 
                    [163] = 85, 
                    [164] = 255, 
                    [165] = 91, 
                    [166] = 158, 
                    [167] = 39, 
                    [168] = 57, 
                    [169] = 103, 
                    [170] = 138, 
                    [171] = 5, 
                    [172] = 73, 
                    [173] = 193, 
                    [174] = 37, 
                    [175] = 30, 
                    [176] = 31, 
                    [177] = 116, 
                    [178] = 228, 
                    [179] = 8, 
                    [180] = 216, 
                    [181] = 110, 
                    [182] = 127, 
                    [183] = 203, 
                    [184] = 245, 
                    [185] = 242, 
                    [186] = 137, 
                    [187] = 250, 
                    [188] = 38, 
                    [189] = 17, 
                    [190] = 72, 
                    [191] = 169, 
                    [192] = 125, 
                    [193] = 167, 
                    [194] = 200, 
                    [195] = 142, 
                    [196] = 243, 
                    [197] = 23, 
                    [198] = 35, 
                    [199] = 93, 
                    [200] = 128, 
                    [201] = 197, 
                    [202] = 48, 
                    [203] = 74, 
                    [204] = 130, 
                    [205] = 1, 
                    [206] = 240, 
                    [207] = 251, 
                    [208] = 182, 
                    [209] = 144, 
                    [210] = 185, 
                    [211] = 108, 
                    [212] = 209, 
                    [213] = 163, 
                    [214] = 0, 
                    [215] = 15, 
                    [216] = 20, 
                    [217] = 215, 
                    [218] = 161, 
                    [219] = 129, 
                    [220] = 170, 
                    [221] = 63, 
                    [222] = 132, 
                    [223] = 60, 
                    [224] = 252, 
                    [225] = 126, 
                    [226] = 239, 
                    [227] = 229, 
                    [228] = 187, 
                    [229] = 139, 
                    [230] = 213, 
                    [231] = 186, 
                    [232] = 218, 
                    [233] = 156, 
                    [234] = 149, 
                    [235] = 231, 
                    [236] = 69, 
                    [237] = 157, 
                    [238] = 55, 
                    [239] = 24, 
                    [240] = 101, 
                    [241] = 100, 
                    [242] = 214, 
                    [243] = 117, 
                    [244] = 178, 
                    [245] = 226, 
                    [246] = 133, 
                    [247] = 233, 
                    [248] = 248, 
                    [249] = 78, 
                    [250] = 118, 
                    [251] = 123, 
                    [252] = 168, 
                    [253] = 3, 
                    [254] = 97, 
                    [255] = 227
                };
                local v2297 = 7;
                for v2298 = 0, 20 do
                    local v2299 = v2296[v2298 + 129];
                    v2296[v2298 + 129] = v2296[l_band_2(v2297 + v2299, 255)];
                    v2296[l_band_2(v2297 + v2299, 255)] = v2299;
                    v2297 = l_band_2(v2297 + v2299, 255);
                    v2290[v2298] = l_bxor_2(v2290[v2298], v2296[l_band_2(v2299 + v2296[v2298 + 129], 255)]);
                end;
                local v2300 = 0;
                local v2301 = 0;
                local v2302 = 0;
                local v2303 = 0;
                local v2304 = 0;
                local v2305 = 0;
                local v2306 = 0;
                local v2307 = 0;
                local v2308 = 0;
                local v2309 = 0;
                for v2310 = 0, 4 do
                    local v2311 = 2 * v2310 + 1;
                    v2300 = v2291[v2311];
                    v2301 = v2291[v2311 + 1];
                    v2302 = 2446691973;
                    v2304 = v2300;
                    v2303 = v2301;
                    for _ = 1, 15 do
                        v2305 = l_rol_1(v2302, 1);
                        v2306 = v2283(v2303 - v2302, l_band_2(v2304, 15));
                        v2302 = l_rol_1(v2302, 2);
                        v2303 = l_band_2(l_bxor_2(v2304, v2306), 65535);
                        v2307 = l_band_2(l_bxor_2(v2303, v2283(v2304 - v2305, l_band_2(v2303, 15))), 65535);
                        v2304 = l_band_2(v2307, 65535);
                    end;
                    v2291[v2311] = l_bxor_2(v2308, v2307 - l_rol_1(v2302, 1));
                    v2291[v2311 + 1] = l_band_2(l_bxor_2(v2309, v2303 - v2302), 65535);
                    v2308 = v2300;
                    v2309 = v2301;
                end;
                local v2313 = v2292[0];
                local v2314 = v2292[1];
                local v2315 = v2292[2];
                v2314 = l_bxor_2(v2314, v2295.user_id);
                v2315 = l_bxor_2(v2315, v2294);
                local v2316 = l_bxor_2(v2280(v2295.xuid_low), v2280(v2313)) == 9252;
                v2292[0] = v2313;
                v2292[1] = v2314;
                v2292[2] = v2315;
                if v2316 then
                    local v2317 = {};
                    for v2318 = 0, 20 do
                        v2317[v2318 + 1] = v2290[v2318];
                    end;
                    local v2319 = v925.new(v2317);
                    v2319:read_bits(32);
                    v2319:read_bits(32);
                    local v2320 = v2319:read_bits(7) + 1;
                    v2319:read_bits(9);
                    local v2321 = v2319:read_coord();
                    local v2322 = v2319:read_coord();
                    local v2323 = v2319:read_coord();
                    if v2321 < -16384 or v2321 > 16384 or v2322 < -16384 or v2322 > 16384 or v2323 < -16384 or v2323 > 16384 then
                        return nil;
                    elseif not v1015.is_player_valid(v2320) then
                        return nil;
                    else
                        local v2324 = v1015.get_tick_count();
                        if math.abs(v2324 - tonumber(v2314)) > 32 then
                            return nil;
                        else
                            return {
                                entity = v2320, 
                                tickcount = tonumber(v2314), 
                                x = v2321, 
                                y = v2322, 
                                z = v2323
                            };
                        end;
                    end;
                else
                    return nil;
                end;
            end;
            local function v2338(v2326)
                -- upvalues: v2286 (ref), l_band_2 (ref), l_bxor_2 (ref), v2289 (ref)
                local v2327 = 0;
                local v2328 = 0;
                local v2329 = 0;
                local v2330 = 0;
                local v2331 = 0;
                local v2332 = 3370829634;
                local v2333 = v2286(v2332, 1);
                for v2334 = 0, 4 do
                    local v2335 = 2 * v2334 + 1;
                    v2329 = l_band_2(v2332 + l_bxor_2(v2328, v2326[v2335]), 65535);
                    local v2336 = v2286(v2333, 1);
                    v2327 = l_band_2(v2333 + l_bxor_2(v2327, v2326[v2335 + 1]), 65535);
                    local v2337 = 15;
                    while v2337 ~= 0 do
                        v2330 = l_band_2(v2336 + v2289(l_bxor_2(v2329, v2327), l_band_2(v2327, 15)), 65535);
                        v2331 = v2286(v2336, 1);
                        v2329 = v2330;
                        v2327 = l_band_2(v2331 + v2289(l_bxor_2(v2330, v2327), l_band_2(v2330, 15)), 65535);
                        v2336 = v2286(v2331, 1);
                        v2337 = v2337 - 1;
                    end;
                    v2328 = v2330;
                    v2326[v2335] = v2330;
                    v2326[v2335 + 1] = v2327;
                end;
            end;
            local function v2351(v2339, v2340)
                -- upvalues: v1108 (ref), v925 (ref), l_cast_2 (ref), v1099 (ref), l_bxor_2 (ref), v2280 (ref), v2338 (ref), l_band_2 (ref), v1045 (ref)
                local v2341 = v1108(v2340);
                local v2342 = v925.new({
                    [1] = 0, 
                    [2] = 0, 
                    [3] = 0, 
                    [4] = 0, 
                    [5] = 0, 
                    [6] = 0, 
                    [7] = 0, 
                    [8] = 0, 
                    [9] = 0, 
                    [10] = 0, 
                    [11] = 0, 
                    [12] = 0, 
                    [13] = 0, 
                    [14] = 0, 
                    [15] = 0, 
                    [16] = 0, 
                    [17] = 0, 
                    [18] = 0, 
                    [19] = 0, 
                    [20] = 0, 
                    [21] = 0, 
                    [22] = 0, 
                    [23] = 0, 
                    [24] = 0
                });
                v2342:write_bits(0, 32);
                v2342:write_bits(0, 32);
                v2342:write_bits(v2339.entity - 1, 7);
                v2342:write_bits(511, 9);
                v2342:write_coord(v2339.x);
                v2342:write_coord(v2339.y);
                v2342:write_coord(v2339.z);
                local v2343 = l_cast_2("uint8_t*", v2342:get_raw_buffer());
                local v2344 = l_cast_2(v1099, v2343);
                local v2345 = l_cast_2("uint16_t*", v2343);
                v2345[0] = math.random(0, 65535);
                v2345[1] = 9252;
                v2344[0].xuid_high = v2339.tickcount;
                v2345[1] = l_bxor_2(v2345[1], v2280(v2341.xuid_low));
                v2344[0].xuid_high = l_bxor_2(v2344[0].xuid_high, v2341.user_id);
                v2344[0].section_number = l_bxor_2(v2344[0].section_number, v2340);
                v2338(v2345);
                local v2346 = {
                    [0] = 94, 
                    [1] = 4, 
                    [2] = 184, 
                    [3] = 28, 
                    [4] = 143, 
                    [5] = 210, 
                    [6] = 241, 
                    [7] = 56, 
                    [8] = 207, 
                    [9] = 171, 
                    [10] = 136, 
                    [11] = 61, 
                    [12] = 194, 
                    [13] = 59, 
                    [14] = 115, 
                    [15] = 88, 
                    [16] = 65, 
                    [17] = 204, 
                    [18] = 6, 
                    [19] = 249, 
                    [20] = 32, 
                    [21] = 68, 
                    [22] = 121, 
                    [23] = 77, 
                    [24] = 172, 
                    [25] = 47, 
                    [26] = 202, 
                    [27] = 150, 
                    [28] = 217, 
                    [29] = 237, 
                    [30] = 34, 
                    [31] = 247, 
                    [32] = 44, 
                    [33] = 244, 
                    [34] = 67, 
                    [35] = 147, 
                    [36] = 13, 
                    [37] = 208, 
                    [38] = 70, 
                    [39] = 45, 
                    [40] = 141, 
                    [41] = 42, 
                    [42] = 180, 
                    [43] = 225, 
                    [44] = 12, 
                    [45] = 53, 
                    [46] = 89, 
                    [47] = 16, 
                    [48] = 114, 
                    [49] = 18, 
                    [50] = 236, 
                    [51] = 165, 
                    [52] = 79, 
                    [53] = 188, 
                    [54] = 174, 
                    [55] = 58, 
                    [56] = 71, 
                    [57] = 102, 
                    [58] = 205, 
                    [59] = 40, 
                    [60] = 160, 
                    [61] = 104, 
                    [62] = 154, 
                    [63] = 181, 
                    [64] = 92, 
                    [65] = 99, 
                    [66] = 246, 
                    [67] = 183, 
                    [68] = 36, 
                    [69] = 43, 
                    [70] = 195, 
                    [71] = 51, 
                    [72] = 90, 
                    [73] = 81, 
                    [74] = 76, 
                    [75] = 140, 
                    [76] = 49, 
                    [77] = 212, 
                    [78] = 177, 
                    [79] = 159, 
                    [80] = 122, 
                    [81] = 86, 
                    [82] = 235, 
                    [83] = 82, 
                    [84] = 112, 
                    [85] = 253, 
                    [86] = 2, 
                    [87] = 135, 
                    [88] = 84, 
                    [89] = 151, 
                    [90] = 232, 
                    [91] = 83, 
                    [92] = 10, 
                    [93] = 96, 
                    [94] = 120, 
                    [95] = 29, 
                    [96] = 145, 
                    [97] = 179, 
                    [98] = 134, 
                    [99] = 191, 
                    [100] = 98, 
                    [101] = 189, 
                    [102] = 201, 
                    [103] = 199, 
                    [104] = 7, 
                    [105] = 46, 
                    [106] = 80, 
                    [107] = 106, 
                    [108] = 105, 
                    [109] = 62, 
                    [110] = 190, 
                    [111] = 162, 
                    [112] = 166, 
                    [113] = 22, 
                    [114] = 119, 
                    [115] = 26, 
                    [116] = 196, 
                    [117] = 238, 
                    [118] = 87, 
                    [119] = 175, 
                    [120] = 146, 
                    [121] = 164, 
                    [122] = 176, 
                    [123] = 113, 
                    [124] = 9, 
                    [125] = 173, 
                    [126] = 152, 
                    [127] = 41, 
                    [128] = 206, 
                    [129] = 25, 
                    [130] = 224, 
                    [131] = 54, 
                    [132] = 198, 
                    [133] = 220, 
                    [134] = 230, 
                    [135] = 107, 
                    [136] = 211, 
                    [137] = 223, 
                    [138] = 148, 
                    [139] = 95, 
                    [140] = 131, 
                    [141] = 21, 
                    [142] = 52, 
                    [143] = 234, 
                    [144] = 153, 
                    [145] = 33, 
                    [146] = 221, 
                    [147] = 192, 
                    [148] = 19, 
                    [149] = 11, 
                    [150] = 254, 
                    [151] = 111, 
                    [152] = 66, 
                    [153] = 155, 
                    [154] = 75, 
                    [155] = 50, 
                    [156] = 64, 
                    [157] = 219, 
                    [158] = 222, 
                    [159] = 109, 
                    [160] = 14, 
                    [161] = 27, 
                    [162] = 124, 
                    [163] = 85, 
                    [164] = 255, 
                    [165] = 91, 
                    [166] = 158, 
                    [167] = 39, 
                    [168] = 57, 
                    [169] = 103, 
                    [170] = 138, 
                    [171] = 5, 
                    [172] = 73, 
                    [173] = 193, 
                    [174] = 37, 
                    [175] = 30, 
                    [176] = 31, 
                    [177] = 116, 
                    [178] = 228, 
                    [179] = 8, 
                    [180] = 216, 
                    [181] = 110, 
                    [182] = 127, 
                    [183] = 203, 
                    [184] = 245, 
                    [185] = 242, 
                    [186] = 137, 
                    [187] = 250, 
                    [188] = 38, 
                    [189] = 17, 
                    [190] = 72, 
                    [191] = 169, 
                    [192] = 125, 
                    [193] = 167, 
                    [194] = 200, 
                    [195] = 142, 
                    [196] = 243, 
                    [197] = 23, 
                    [198] = 35, 
                    [199] = 93, 
                    [200] = 128, 
                    [201] = 197, 
                    [202] = 48, 
                    [203] = 74, 
                    [204] = 130, 
                    [205] = 1, 
                    [206] = 240, 
                    [207] = 251, 
                    [208] = 182, 
                    [209] = 144, 
                    [210] = 185, 
                    [211] = 108, 
                    [212] = 209, 
                    [213] = 163, 
                    [214] = 0, 
                    [215] = 15, 
                    [216] = 20, 
                    [217] = 215, 
                    [218] = 161, 
                    [219] = 129, 
                    [220] = 170, 
                    [221] = 63, 
                    [222] = 132, 
                    [223] = 60, 
                    [224] = 252, 
                    [225] = 126, 
                    [226] = 239, 
                    [227] = 229, 
                    [228] = 187, 
                    [229] = 139, 
                    [230] = 213, 
                    [231] = 186, 
                    [232] = 218, 
                    [233] = 156, 
                    [234] = 149, 
                    [235] = 231, 
                    [236] = 69, 
                    [237] = 157, 
                    [238] = 55, 
                    [239] = 24, 
                    [240] = 101, 
                    [241] = 100, 
                    [242] = 214, 
                    [243] = 117, 
                    [244] = 178, 
                    [245] = 226, 
                    [246] = 133, 
                    [247] = 233, 
                    [248] = 248, 
                    [249] = 78, 
                    [250] = 118, 
                    [251] = 123, 
                    [252] = 168, 
                    [253] = 3, 
                    [254] = 97, 
                    [255] = 227
                };
                local v2347 = 7;
                for v2348 = 0, 20 do
                    local v2349 = v2346[v2348 + 129];
                    v2346[v2348 + 129] = v2346[l_band_2(v2347 + v2349, 255)];
                    v2346[l_band_2(v2347 + v2349, 255)] = v2349;
                    v2347 = l_band_2(v2347 + v2349, 255);
                    v2343[v2348] = l_bxor_2(v2343[v2348], v2346[l_band_2(v2349 + v2346[v2348 + 129], 255)]);
                end;
                local l_sequence_bytes_0 = v2344[0].sequence_bytes;
                v2344[0].sequence_bytes = v2344[0].section_number;
                v2344[0].section_number = l_sequence_bytes_0;
                return l_cast_2(v1045, v2344);
            end;
            return {
                decode = v2325, 
                encode = v2351
            };
        end)(), 
        primordial = (function()
            -- upvalues: l_ffi_0 (ref), l_bxor_0 (ref), l_cast_0 (ref), v1015 (ref), v1074 (ref)
            local v2352 = l_ffi_0.new("int16_t[1]");
            local function v2355(v2353, v2354)
                -- upvalues: v2352 (ref), l_bxor_0 (ref), l_cast_0 (ref)
                v2352[0] = l_bxor_0(v2353, v2354);
                return tonumber(l_cast_0("float", v2352[0]));
            end;
            local function v2363(v2356)
                -- upvalues: l_bxor_0 (ref), v2355 (ref), v1015 (ref)
                local v2357 = l_bxor_0(v2356.eidp1, v2356.mutualkey);
                local v2358 = v2355(v2356.xored_x, v2356.loc_xor_key);
                local v2359 = v2355(v2356.xored_y, v2356.loc_xor_key);
                local v2360 = v2355(v2356.xored_z, v2356.loc_xor_key);
                local v2361 = l_bxor_0(v2356.keyp1, v2356.keyp2) - v2356.mutualkey;
                if v2357 == nil or not v1015.is_player_valid(v2357) then
                    return nil;
                elseif v1015.is_player_dormant(v2357) then
                    return nil;
                else
                    local v2362 = v1015.get_player_position(v2357);
                    if math.abs(v2362.x - v2358) > 256 or math.abs(v2362.y - v2359) > 256 or math.abs(v2362.z - v2360) > 256 then
                        return nil;
                    else
                        return {
                            entity = v2357, 
                            x = v2358, 
                            y = v2359, 
                            z = v2360, 
                            key = v2361
                        };
                    end;
                end;
            end;
            local function v2366(v2364)
                -- upvalues: l_ffi_0 (ref), v1074 (ref)
                local v2365 = l_ffi_0.new(v1074);
                v2365[0].mutualkey = 0;
                v2365[0].eidp1 = v2364[0].entity;
                v2365[0].keyp2 = 0;
                v2365[0].keyp1 = v2364[0].key;
                v2365[0].loc_xor_key = 0;
                v2365[0].xored_x = v2364[0].x;
                v2365[0].xored_y = v2364[0].y;
                v2365[0].xored_z = v2364[0].z;
                return v2365;
            end;
            return {
                decode = v2363, 
                encode = v2366
            };
        end)(), 
        rifk7 = (function()
            -- upvalues: l_cast_0 (ref), l_rshift_0 (ref), l_bor_0 (ref)
            return {
                decode = function(v2367, v2368)
                    -- upvalues: l_cast_0 (ref), l_rshift_0 (ref), l_bor_0 (ref)
                    local v2369 = tonumber(l_cast_0("int32_t", v2367[0].xuid_low));
                    local v2370 = v2369 + 28;
                    local v2371 = v2369 + 31;
                    if v2370 >= 0 then
                        v2371 = v2370;
                    end;
                    local v2372 = l_rshift_0(v2371, 2) - v2368 - v2368 + 54;
                    local v2373 = l_bor_0(v2372, 64);
                    if v2373 ~= 124 and v2373 ~= 252 then
                        return false;
                    else
                        return true;
                    end;
                end
            };
        end)(), 
        legion = (function()
            -- upvalues: l_ffi_0 (ref), v1108 (ref), l_bxor_0 (ref), l_cast_0 (ref), l_new_0 (ref), v1089 (ref)
            local v2374 = l_ffi_0.new("uint8_t[8]");
            local function v2378(v2375, v2376)
                -- upvalues: v1108 (ref), v2374 (ref), l_bxor_0 (ref), l_cast_0 (ref)
                local l_user_id_0 = v1108(v2376).user_id;
                v2374[0] = l_bxor_0(v2375[0].legion_xor[0], l_user_id_0);
                v2374[1] = l_bxor_0(v2375[0].legion_xor[1], l_user_id_0);
                v2374[2] = l_bxor_0(v2375[0].legion_xor[2], l_user_id_0);
                v2374[3] = l_bxor_0(v2375[0].legion_xor[3], l_user_id_0);
                v2374[4] = l_bxor_0(v2375[0].legion_xor[4], l_user_id_0);
                v2374[5] = l_bxor_0(v2375[0].legion_xor[5], l_user_id_0);
                v2374[6] = l_bxor_0(v2375[0].legion_xor[6], l_user_id_0);
                v2374[7] = l_bxor_0(v2375[0].legion_xor[7], l_user_id_0);
                return (l_cast_0("char*", v2374));
            end;
            local v2379 = l_new_0("uint8_t[6]");
            local function v2384(v2380, v2381)
                -- upvalues: l_new_0 (ref), v1089 (ref), v1108 (ref), v2379 (ref), l_bxor_0 (ref)
                local v2382 = l_new_0(v1089);
                local l_user_id_1 = v1108(v2381).user_id;
                v2379[0] = l_bxor_0(v2380[0].legion[0], l_user_id_1);
                v2379[1] = l_bxor_0(v2380[0].legion[1], l_user_id_1);
                v2379[2] = l_bxor_0(v2380[0].legion[2], l_user_id_1);
                v2379[3] = l_bxor_0(v2380[0].legion[3], l_user_id_1);
                v2379[4] = l_bxor_0(v2380[0].legion[4], l_user_id_1);
                v2379[5] = l_bxor_0(v2380[0].legion[5], l_user_id_1);
                v2382[0].legion_xor[0] = v2379[0];
                v2382[0].legion_xor[1] = v2379[1];
                v2382[0].legion_xor[2] = v2379[2];
                v2382[0].legion_xor[3] = v2379[3];
                v2382[0].legion_xor[4] = v2379[4];
                v2382[0].legion_xor[5] = v2379[5];
                v2382[0].random = v2380[0].random;
                return v2382;
            end;
            return {
                decode = v2378, 
                encode = v2384
            };
        end)(), 
        pandora = (function()
            -- upvalues: v1015 (ref)
            return {
                decode = function(v2385)
                    -- upvalues: v1015 (ref)
                    local l_identifier_0 = v2385[0].identifier;
                    if l_identifier_0 ~= 6969 and l_identifier_0 ~= 420187 then
                        return false;
                    else
                        local l_entityId_0 = v2385[0].entityId;
                        local l_x_0 = v2385[0].x;
                        local l_y_0 = v2385[0].y;
                        local l_z_0 = v2385[0].z;
                        if l_entityId_0 > 64 or l_entityId_0 < 0 or not v1015.is_player_valid(l_entityId_0) then
                            return false;
                        elseif v1015.is_player_dormant(l_entityId_0) then
                            return false;
                        else
                            local v2391 = v1015.get_player_position(l_entityId_0);
                            if math.abs(v2391.x - l_x_0) > 256 or math.abs(v2391.y - l_y_0) > 256 or math.abs(v2391.z - l_z_0) > 256 then
                                return false;
                            else
                                return true;
                            end;
                        end;
                    end;
                end
            };
        end)(), 
        airflow = (function()
            -- upvalues: l_band_0 (ref), l_rshift_0 (ref), l_lshift_0 (ref), l_bnot_0 (ref), l_bor_0 (ref), v39 (ref), l_new_0 (ref), l_cast_0 (ref), v925 (ref), l_ffi_0 (ref), v1015 (ref), v1045 (ref)
            local function _(v2392)
                -- upvalues: l_band_0 (ref)
                return l_band_0(v2392, 65535);
            end;
            local function _(v2394)
                -- upvalues: l_band_0 (ref), l_rshift_0 (ref)
                return l_band_0(l_rshift_0(v2394, 16), 65535);
            end;
            local function _(v2396)
                -- upvalues: l_band_0 (ref), l_rshift_0 (ref)
                return l_band_0(l_rshift_0(v2396, 24), 255);
            end;
            local function _(v2398)
                -- upvalues: l_band_0 (ref), l_rshift_0 (ref)
                return l_band_0(l_rshift_0(v2398, 8), 255);
            end;
            local function _(v2400, v2401)
                -- upvalues: l_band_0 (ref), l_lshift_0 (ref), l_bnot_0 (ref), l_bor_0 (ref)
                local l_v2400_0 = v2400;
                for v2403 = 0, 31 do
                    if l_band_0(l_v2400_0, l_lshift_0(1, v2403)) == l_band_0(l_lshift_0(1, v2403), v2401) then
                        l_v2400_0 = l_band_0(l_v2400_0, l_bnot_0(l_lshift_0(1, v2403)));
                    else
                        l_v2400_0 = l_bor_0(l_v2400_0, l_lshift_0(1, v2403));
                    end;
                end;
                return l_v2400_0;
            end;
            local v2405 = v39({
                [175] = "Airflow Old", 
                [102] = "Floridahook", 
                [153] = "Weave", 
                [180] = "Karnazity", 
                [187] = "Boss", 
                [250] = "Airflow", 
                [220] = "Furcore", 
                [186] = "Airflow Boss"
            });
            local function v2407(v2406)
                if v2406 <= 32767 then
                    return v2406;
                else
                    return v2406 - 65536;
                end;
            end;
            local v2408 = l_new_0("uint8_t[24]");
            local _ = l_cast_0("uint16_t*", v2408);
            local v2410 = l_cast_0("uint32_t*", v2408);
            local function v2426(v2411)
                -- upvalues: v2410 (ref), v2408 (ref), v925 (ref), v2407 (ref), l_ffi_0 (ref), v2405 (ref), v1015 (ref), l_band_0 (ref)
                if v2411[0].section_number == 0 or v2411[0].sequence_bytes == 0 or v2411[0].uncompressed_sample_offset == 0 then
                    return nil;
                else
                    v2410[0] = v2411[0].xuid_low;
                    v2410[1] = v2411[0].xuid_high;
                    v2410[2] = v2411[0].sequence_bytes;
                    v2410[3] = v2411[0].section_number;
                    v2410[4] = v2411[0].uncompressed_sample_offset;
                    local v2412 = {};
                    for v2413 = 0, 20 do
                        v2412[v2413 + 1] = v2408[v2413];
                    end;
                    local v2414 = v925.new(v2412);
                    local v2415 = v2414:read_bits(8);
                    local v2416 = v2414:read_bits(8);
                    local v2417 = v2414:read_bits(16);
                    local v2418 = v2414:read_bits(8);
                    local v2419 = v2407(tonumber(l_ffi_0.cast("float", v2414:read_bits(16))));
                    local v2420 = v2407(tonumber(l_ffi_0.cast("float", v2414:read_bits(16))));
                    local v2421 = v2407(tonumber(l_ffi_0.cast("float", v2414:read_bits(16))));
                    local v2422 = v2414:read_bits(8);
                    local v2423 = v2414:read_bits(32);
                    if v2417 ~= 57005 or v2415 ~= 241 then
                        return nil;
                    elseif v2405[v2416] == nil then
                        return nil;
                    elseif v2418 > 64 or v2418 < 0 or not v1015.is_player_valid(v2418) then
                        return nil;
                    elseif v1015.is_player_dormant(v2418) then
                        return nil;
                    else
                        local v2424 = v1015.get_player_position(v2418);
                        if math.abs(v2424.x - v2419) > 256 or math.abs(v2424.y - v2420) > 256 or math.abs(v2424.z - v2421) > 256 then
                            return nil;
                        else
                            local v2425 = l_band_0(v1015.get_tick_count(), 65535);
                            if math.abs(v2425 - v2423) > 32 then
                                return nil;
                            else
                                return {
                                    cheat_id = v2416, 
                                    id = v2418, 
                                    x = v2419, 
                                    y = v2420, 
                                    z = v2421, 
                                    tick_count = v2423, 
                                    health = v2422
                                };
                            end;
                        end;
                    end;
                end;
            end;
            local function v2430(v2427)
                -- upvalues: v925 (ref), l_band_0 (ref), l_cast_0 (ref), v1045 (ref)
                local v2428 = v925.new({
                    [1] = 0, 
                    [2] = 0, 
                    [3] = 0, 
                    [4] = 0, 
                    [5] = 0, 
                    [6] = 0, 
                    [7] = 0, 
                    [8] = 0, 
                    [9] = 0, 
                    [10] = 0, 
                    [11] = 0, 
                    [12] = 0, 
                    [13] = 0, 
                    [14] = 0, 
                    [15] = 0, 
                    [16] = 0, 
                    [17] = 0, 
                    [18] = 0, 
                    [19] = 0, 
                    [20] = 0
                });
                v2428:write_bits(241, 8);
                v2428:write_bits(v2427.cheat_id, 8);
                v2428:write_bits(57005, 16);
                v2428:write_bits(v2427.id, 8);
                v2428:write_bits(v2427.x, 16);
                v2428:write_bits(v2427.y, 16);
                v2428:write_bits(v2427.z, 16);
                v2428:write_bits(v2427.health, 8);
                v2428:write_bits(l_band_0(v2427.tick_count, 65535), 32);
                v2428:write_bits(16515072, 24);
                v2428:write_bits(v2427.boss, 8);
                local v2429 = l_cast_0("uint8_t*", v2428:get_raw_buffer());
                return l_cast_0(v1045, v2429);
            end;
            return {
                cheat_type = v2405, 
                decode = v2426, 
                encode = v2430
            };
        end)(), 
        legendware = (function()
            -- upvalues: l_new_0 (ref), v1092 (ref)
            local function v2432(v2431)
                return v2431[0].m_key == 29804 and (not (v2431[0].t ~= 1337) or v2431[0].t == 4759537);
            end;
            local v2433 = l_new_0(v1092);
            v2433[0].m_key = 29804;
            v2433[0].t = 1337;
            local function v2435(_)
                -- upvalues: v2433 (ref)
                return v2433;
            end;
            return {
                decode = v2432, 
                encode = v2435
            };
        end)(), 
        nixware = (function()
            -- upvalues: v1015 (ref)
            return {
                decode = function(v2436, v2437)
                    -- upvalues: v1015 (ref)
                    local v2438 = v2436:read_bits(16);
                    local v2439 = v2436:read_bits(7) + 1;
                    local v2440 = v2436:read_coord();
                    local v2441 = v2436:read_coord();
                    local v2442 = v2436:read_coord();
                    local v2443 = v2436:read_bits(32);
                    local v2444 = v2436:read_bits(7);
                    v2436:reset();
                    if v2437 then
                        print("--------------------");
                        print("id: " .. v2438);
                        print("user_id: " .. v2439);
                        print("x: " .. v2440);
                        print("y: " .. v2441);
                        print("z: " .. v2442);
                        print("tick_count: " .. v2443);
                        print("health: " .. v2444);
                        print("--------------------");
                    end;
                    if v2438 ~= 48879 then
                        return nil;
                    elseif v2440 < -16384 or v2440 > 16384 or v2441 < -16384 or v2441 > 16384 or v2442 < -16384 or v2442 > 16384 then
                        return nil;
                    else
                        local v2445 = v1015.get_tick_count();
                        if math.abs(v2445 - v2443) > 32 then
                            return nil;
                        elseif not v1015.is_player_valid(v2439) then
                            return nil;
                        elseif v1015.is_player_dormant(v2439) then
                            return nil;
                        else
                            local v2446 = v1015.get_player_position(v2439);
                            if math.abs(v2446.x - v2440) > 256 or math.abs(v2446.y - v2441) > 256 or math.abs(v2446.z - v2442) > 256 then
                                return nil;
                            else
                                return {
                                    id = v2438, 
                                    entity_id = v2439, 
                                    x = v2440, 
                                    y = v2441, 
                                    z = v2442, 
                                    tickcount = v2443, 
                                    health = v2444
                                };
                            end;
                        end;
                    end;
                end, 
                encode = function(v2447, v2448)
                    v2448:write_bits(v2447.id, 16);
                    v2448:write_bits(v2447.entity_id - 1, 7);
                    v2448:write_coord(v2447.x);
                    v2448:write_coord(v2447.y);
                    v2448:write_coord(v2447.z);
                    v2448:write_bits(v2447.tick_count, 32);
                    v2448:write_bits(v2447.health, 7);
                    return v2448;
                end
            };
        end)(), 
        plague = (function()
            -- upvalues: v1015 (ref)
            return {
                decode = function(v2449)
                    -- upvalues: v1015 (ref)
                    if v2449[0].id ~= 907415600 then
                        return false;
                    else
                        local l_entity_0 = v2449[0].entity;
                        local l_x_1 = v2449[0].x;
                        local l_y_1 = v2449[0].y;
                        local l_z_1 = v2449[0].z;
                        if l_entity_0 > 64 or l_entity_0 < 0 or not v1015.is_player_valid(l_entity_0) then
                            return false;
                        elseif v1015.is_player_dormant(l_entity_0) then
                            return false;
                        else
                            local v2454 = v1015.get_player_position(l_entity_0);
                            if math.abs(v2454.x - l_x_1) > 256 or math.abs(v2454.y - l_y_1) > 256 or math.abs(v2454.z - l_z_1) > 256 then
                                return false;
                            else
                                return true;
                            end;
                        end;
                    end;
                end
            };
        end)(), 
        onetap = (function()
            -- upvalues: l_ffi_0 (ref), l_bit_0 (ref), v1072 (ref), v1015 (ref), v925 (ref), v1071 (ref)
            local l_new_3 = l_ffi_0.new;
            local l_cast_3 = l_ffi_0.cast;
            local _ = l_ffi_0.cdef;
            local _ = l_ffi_0.typeof;
            local l_band_3 = l_bit_0.band;
            local _ = l_bit_0.bor;
            local l_bxor_3 = l_bit_0.bxor;
            local _ = l_bit_0.bnot;
            local _ = l_bit_0.lshift;
            local l_rshift_3 = l_bit_0.rshift;
            local _ = l_bit_0.ror;
            local _ = l_bit_0.rol;
            local v2467 = l_new_3("uint8_t[20]");
            local _ = l_cast_3("uint16_t*", v2467);
            local v2469 = l_cast_3("uint32_t*", v2467);
            local function v2471(v2470)
                if v2470 <= 32767 then
                    return v2470;
                else
                    return v2470 - 65536;
                end;
            end;
            local v2472 = 1401050875;
            local v2473 = 359866515;
            local v2474 = 928134322;
            local v2475 = {
                l_band_3(v2473, 255), 
                l_band_3(l_rshift_3(v2473, 8), 255), 
                l_band_3(l_rshift_3(v2473, 16), 255), 
                l_band_3(l_rshift_3(v2473, 24), 255)
            };
            local v2476 = {
                l_band_3(v2474, 255), 
                l_band_3(l_rshift_3(v2474, 8), 255), 
                l_band_3(l_rshift_3(v2474, 16), 255), 
                l_band_3(l_rshift_3(v2474, 24), 255)
            };
            local function v2495(v2477, v2478)
                -- upvalues: v2469 (ref), v2467 (ref), l_bxor_3 (ref), v2475 (ref), v2476 (ref), l_ffi_0 (ref), v1072 (ref), v2472 (ref), v1015 (ref), v925 (ref), l_band_3 (ref), v2471 (ref)
                v2469[0] = v2477[0].xuid_low;
                v2469[1] = v2477[0].xuid_high;
                v2469[2] = v2477[0].sequence_bytes;
                v2469[3] = v2477[0].section_number;
                v2469[4] = v2477[0].uncompressed_sample_offset;
                for v2479 = 0, 19 do
                    v2467[v2479] = l_bxor_3(v2467[v2479], v2478);
                end;
                for v2480 = 1, 4 do
                    v2467[v2480 + 3] = l_bxor_3(v2467[v2480 + 3], v2475[v2480]);
                end;
                for v2481 = 1, 4 do
                    v2467[v2481 + 7] = l_bxor_3(v2467[v2481 + 7], v2476[v2481]);
                end;
                for v2482 = 1, 4 do
                    v2467[v2482 + 11] = l_bxor_3(v2467[v2482 + 11], v2475[v2482]);
                end;
                for v2483 = 1, 4 do
                    v2467[v2483 + 15] = l_bxor_3(v2467[v2483 + 15], v2476[v2483]);
                end;
                local v2484 = l_ffi_0.cast(v1072, v2467)[0];
                if v2484.id == v2472 and v1015.is_player_valid(v2484.entity_id) then
                    local v2485 = {};
                    for v2486 = 0, 20 do
                        v2485[v2486 + 1] = v2467[v2486];
                    end;
                    local v2487 = v925.new(v2485);
                    local v2488 = l_band_3(v1015.get_tick_count(), 255);
                    v2487:read_bits(32);
                    local v2489 = v2487:read_bits(8);
                    local v2490 = v2487:read_bits(8);
                    local v2491 = v2471(tonumber(l_ffi_0.cast("float", v2487:read_bits(16))));
                    local v2492 = v2471(tonumber(l_ffi_0.cast("float", v2487:read_bits(16))));
                    local v2493 = v2471(tonumber(l_ffi_0.cast("float", v2487:read_bits(16))));
                    if v1015.is_player_dormant(v2489) then
                        return nil;
                    else
                        local v2494 = v1015.get_player_position(v2489);
                        if math.abs(v2494.x - v2491) > 256 or math.abs(v2494.y - v2492) > 256 or math.abs(v2494.z - v2493) > 256 then
                            return nil;
                        elseif math.abs(v2488 - v2490) > 32 then
                            return nil;
                        else
                            return {
                                entity = v2484.entity_id, 
                                tick_count_byte = v2490, 
                                x = v2491, 
                                y = v2492, 
                                z = v2493
                            };
                        end;
                    end;
                else
                    return nil;
                end;
            end;
            local function v2506(v2496, v2497)
                -- upvalues: l_new_3 (ref), v1071 (ref), l_cast_3 (ref), v2472 (ref), l_band_3 (ref), l_bxor_3 (ref), v2475 (ref), v2476 (ref)
                local v2498 = l_new_3(v1071);
                local v2499 = l_cast_3("uint8_t*", v2498);
                local _ = l_cast_3("uint32_t*", v2498);
                v2498[0].id = v2472;
                v2498[0].entity_id = v2496.entity;
                v2498[0].tick_count = l_band_3(v2496.tick_count, 255);
                v2498[0].x = v2496.x;
                v2498[0].y = v2496.y;
                v2498[0].z = v2496.z;
                for v2501 = 1, 4 do
                    v2499[v2501 + 3] = l_bxor_3(v2499[v2501 + 3], v2475[v2501]);
                end;
                for v2502 = 1, 4 do
                    v2499[v2502 + 7] = l_bxor_3(v2499[v2502 + 7], v2476[v2502]);
                end;
                for v2503 = 1, 4 do
                    v2499[v2503 + 11] = l_bxor_3(v2499[v2503 + 11], v2475[v2503]);
                end;
                for v2504 = 1, 4 do
                    v2499[v2504 + 15] = l_bxor_3(v2499[v2504 + 15], v2476[v2504]);
                end;
                for v2505 = 0, 19 do
                    v2499[v2505] = l_bxor_3(v2499[v2505], v2497);
                end;
                v2498[0].pad[0] = v2497;
                v2498[0].pad[1] = v2497;
                v2498[0].pad[2] = v2497;
                v2498[0].pad[3] = v2497;
                v2498[0].pad[4] = v2497;
                v2498[0].pad[5] = v2497;
                v2498[0].pad[6] = v2497;
                v2498[0].pad[7] = v2497;
                v2498[0].pad[8] = v2497;
                return v2498;
            end;
            return {
                decode = v2495, 
                encode = v2506
            };
        end)(), 
        neverlose = (function()
            return {
                decode = function()
                    return nil;
                end
            };
        end)(), 
        ev0lity_old = (function()
            -- upvalues: l_cast_0 (ref), v1066 (ref), v1015 (ref), v1108 (ref), l_band_0 (ref)
            local function _(v2507)
                if v2507 <= 127 then
                    return v2507;
                else
                    return v2507 - 256;
                end;
            end;
            return {
                decode = function(v2509)
                    -- upvalues: l_cast_0 (ref), v1066 (ref), v1015 (ref), v1108 (ref), l_band_0 (ref)
                    local v2510 = l_cast_0(v1066, v2509)[0];
                    if v2510 == nil then
                        return nil;
                    elseif v2510.id ~= 32762 and v2510.id ~= 32763 and v2510.id ~= 32764 and v2510.id ~= 32765 then
                        return nil;
                    elseif v2510.x == nil or v2510.y == nil or v2510.z == nil then
                        return nil;
                    elseif v2510.x < -16384 or v2510.x > 16384 or v2510.y < -16384 or v2510.y > 16384 or v2510.z < -16384 or v2510.z > 16384 then
                        return nil;
                    elseif v2510.user_id == nil then
                        return nil;
                    else
                        local v2511 = nil;
                        for _, v2513 in pairs(v1015.get_players()) do
                            local v2514 = v1108(v2513);
                            if v2514 ~= nil and l_band_0(v2514.user_id, 255) == v2510.user_id then
                                v2511 = v2513;
                                break;
                            end;
                        end;
                        if v2511 == nil or not v1015.is_player_valid(v2511) then
                            return nil;
                        elseif v1015.is_player_dormant(v2511) then
                            return nil;
                        else
                            local v2515 = v1015.get_player_position(v2511);
                            if math.abs(v2515.x - v2510.x) > 256 or math.abs(v2515.y - v2510.y) > 256 or math.abs(v2515.z - v2510.z) > 256 then
                                return nil;
                            else
                                local v2516 = v1015.get_tick_count();
                                if math.abs(v2516 - v2510.server_tick) > 32 then
                                    return nil;
                                else
                                    local v2517 = v1015.get_active_weapon_index(v2511);
                                    if v2517 == nil then
                                        return nil;
                                    elseif l_band_0(v2517, 255) ~= v2510.weapon_id then
                                        return nil;
                                    else
                                        return {
                                            id = v2510.id, 
                                            entity_id = v2511, 
                                            x = v2510.x, 
                                            y = v2510.y, 
                                            z = v2510.z, 
                                            tick_count = v2510.server_tick
                                        };
                                    end;
                                end;
                            end;
                        end;
                    end;
                end, 
                encode = function(_)

                end
            };
        end)(), 
        ev0lity = (function()
            -- upvalues: v1108 (ref), l_band_0 (ref), l_bxor_0 (ref), l_bor_0 (ref), l_cast_0 (ref), l_rshift_0 (ref), l_lshift_0 (ref), v925 (ref), v1015 (ref), v1045 (ref)
            local function v2520(v2519)
                if v2519 <= 32767 then
                    return v2519;
                else
                    return v2519 - 65536;
                end;
            end;
            local function v2539(v2521, v2522)
                -- upvalues: v1108 (ref), l_band_0 (ref), l_bxor_0 (ref), l_bor_0 (ref), l_cast_0 (ref), l_rshift_0 (ref), l_lshift_0 (ref), v925 (ref), v2520 (ref), v1015 (ref)
                local v2523 = v1108(v2522);
                local v2524 = l_band_0(l_bxor_0(v2523.xuid_high, v2522) % v2523.xuid_low, 4294967295);
                v2524 = l_bor_0(v2524, l_band_0(l_bxor_0(v2523.xuid_high, v2523.xuid_low), 65535));
                local v2525 = l_cast_0("uint8_t*", v2521);
                local v2526 = {};
                for v2527 = 0, 20 do
                    v2526[v2527 + 1] = v2525[v2527];
                end;
                local v2528 = {
                    l_band_0(v2524, 255), 
                    l_band_0(l_rshift_0(v2524, 8), 255), 
                    l_band_0(l_rshift_0(v2524, 16), 255), 
                    l_band_0(l_rshift_0(v2524, 24), 255)
                };
                for v2529 = 1, #v2526 do
                    v2526[v2529] = l_band_0(l_bxor_0(v2526[v2529], v2528[(v2529 - 1) % 4 + 1]), 255);
                    if (v2529 - 1) % 4 == 3 then
                        v2524 = l_bor_0(l_lshift_0(v2524, 8), l_band_0(v2529 - 1, 255));
                        v2528 = {
                            l_band_0(v2524, 255), 
                            l_band_0(l_rshift_0(v2524, 8), 255), 
                            l_band_0(l_rshift_0(v2524, 16), 255), 
                            l_band_0(l_rshift_0(v2524, 24), 255)
                        };
                    end;
                end;
                local v2530 = v925.new(v2526);
                local v2531 = v2530:read_bits(16);
                local v2532 = v2530:read_bits(8);
                local v2533 = v2530:read_bits(8);
                local v2534 = v2520(v2530:read_bits(16));
                local v2535 = v2520(v2530:read_bits(16));
                local v2536 = v2520(v2530:read_bits(16));
                local _ = v2530:read_bits(16);
                local v2538 = v2530:read_bits(32);
                if v2531 ~= 32762 and v2531 ~= 32763 and v2531 ~= 32764 and v2531 ~= 32765 then
                    return nil;
                elseif not v1015.is_player_valid(v2532) then
                    return nil;
                elseif v2534 < -16384 or v2534 > 16384 or v2535 < -16384 or v2535 > 16384 or v2536 < -16384 or v2536 > 16384 then
                    return nil;
                else
                    return {
                        id = v2531, 
                        entity_id = v2532, 
                        weapon_id = v2533, 
                        x = v2534, 
                        y = v2535, 
                        z = v2536, 
                        tick_count = v2538
                    };
                end;
            end;
            local function v2548(v2540, v2541)
                -- upvalues: v925 (ref), v1108 (ref), l_cast_0 (ref), l_band_0 (ref), l_bxor_0 (ref), l_bor_0 (ref), l_rshift_0 (ref), l_lshift_0 (ref), v1045 (ref)
                local v2542 = v925.new();
                v2542:write_bits(v2540.id, 16);
                v2542:write_bits(v2540.entity_id, 8);
                v2542:write_bits(v2540.weapon_id, 8);
                v2542:write_bits(v2540.x, 16);
                v2542:write_bits(v2540.y, 16);
                v2542:write_bits(v2540.z, 16);
                v2542:write_bits(0, 16);
                v2542:write_bits(v2540.tick_count, 32);
                local v2543 = v1108(v2541);
                local v2544 = l_cast_0("uint8_t*", v2542:get_raw_buffer());
                local v2545 = l_band_0(l_bxor_0(v2543.xuid_high, v2541) % v2543.xuid_low, 4294967295);
                v2545 = l_bor_0(v2545, l_band_0(l_bxor_0(v2543.xuid_high, v2543.xuid_low), 65535));
                local v2546 = {
                    l_band_0(v2545, 255), 
                    l_band_0(l_rshift_0(v2545, 8), 255), 
                    l_band_0(l_rshift_0(v2545, 16), 255), 
                    l_band_0(l_rshift_0(v2545, 24), 255)
                };
                for v2547 = 1, 20 do
                    v2544[v2547 - 1] = l_band_0(l_bxor_0(v2544[v2547 - 1], v2546[(v2547 - 1) % 4 + 1]), 255);
                    if (v2547 - 1) % 4 == 3 then
                        v2545 = l_bor_0(l_lshift_0(v2545, 8), l_band_0(v2547 - 1, 255));
                        v2546 = {
                            l_band_0(v2545, 255), 
                            l_band_0(l_rshift_0(v2545, 8), 255), 
                            l_band_0(l_rshift_0(v2545, 16), 255), 
                            l_band_0(l_rshift_0(v2545, 24), 255)
                        };
                    end;
                end;
                return l_cast_0(v1045, v2544);
            end;
            return {
                decode = v2539, 
                encode = v2548
            };
        end)(), 
        solus = (function()
            -- upvalues: l_ffi_0 (ref), l_bit_0 (ref), v1015 (ref)
            local v2549 = {
                SECURITY_KEY = ".ZnVtaW5v|", 
                RV_PLAYER_SEND = 2, 
                RV_PLAYER_REQUEST = 1, 
                HASH = 65262, 
                ID = 3735943697
            };
            local function v2551(v2550)
                if v2550 >= 0 then
                    return v2550;
                else
                    return v2550 + 4294967296;
                end;
            end;
            local function _(v2552)
                -- upvalues: l_ffi_0 (ref)
                local v2553 = type(v2552) == "number";
                local v2554 = l_ffi_0.typeof(v2553 and "union { uint32_t num; char bytes[5]; }" or "union { char bytes[5]; uint32_t num; }")(v2552);
                return v2553 and l_ffi_0.string(v2554.bytes) or v2554.num;
            end;
            local function v2559(v2556, v2557)
                -- upvalues: l_bit_0 (ref)
                local v2558 = l_bit_0.bxor(v2556, v2557);
                return (v2558 + l_bit_0.lshift(v2558, 1) + l_bit_0.lshift(v2558, 4) + l_bit_0.lshift(v2558, 7) + l_bit_0.lshift(v2558, 8) + l_bit_0.lshift(v2558, 24)) % 4294967296;
            end;
            local function v2567(v2560)
                -- upvalues: v2549 (ref), v2551 (ref), v1015 (ref), v2559 (ref)
                local l_SECURITY_KEY_0 = v2549.SECURITY_KEY;
                v2560:crypt(l_SECURITY_KEY_0);
                local v2562 = v2560:read_bits(32);
                local v2563 = v2551(v2560:read_bits(32));
                local v2564 = v2551(v2560:read_bits(32));
                local v2565 = v2560:read_bits(4);
                v2560:crypt(l_SECURITY_KEY_0);
                v2560:reset();
                local v2566 = v1015.get_tick_count();
                if math.abs(v2566 - v2562) > 32 then
                    return nil;
                elseif v2559(v2562, v2549.HASH) ~= v2563 then
                    return nil;
                elseif v2564 ~= v2549.ID then
                    return nil;
                else
                    return {
                        type = v2565, 
                        tick_count = v2562
                    };
                end;
            end;
            local function v2570(v2568, v2569)
                -- upvalues: v2559 (ref), v2549 (ref)
                v2569:write_bits(v2568.tick_count, 32);
                v2569:write_bits(v2559(v2568.tick_count, v2549.HASH), 32);
                v2569:write_bits(v2549.ID, 32);
                v2569:write_bits(v2549.RV_PLAYER_REQUEST, 4);
                v2569:crypt(v2549.SECURITY_KEY);
                return v2569;
            end;
            return {
                info = v2549, 
                decode = v2567, 
                encode = v2570
            };
        end)(), 
        extension = (function()
            -- upvalues: l_cast_0 (ref), v1102 (ref), l_ffi_0 (ref), l_band_0 (ref), v1015 (ref)
            return {
                decode = function(v2571)
                    -- upvalues: l_cast_0 (ref), v1102 (ref), l_ffi_0 (ref), l_band_0 (ref), v1015 (ref)
                    local v2572 = l_cast_0(v1102, v2571)[0];
                    if l_ffi_0.string(v2572.name, 3) ~= "ext" then
                        return false;
                    else
                        local v2573 = l_band_0(v1015.get_tick_count(), 65535);
                        if math.abs(v2573 - v2572.tick_count) > 128 then
                            return false;
                        else
                            return true;
                        end;
                    end;
                end
            };
        end)()
    };
    local v2575 = l_new_0(v1047);
    local v2576 = l_cast_0(v1054, v2575);
    local function v2581(v2577)
        -- upvalues: l_cast_0 (ref), v1045 (ref), v2575 (ref), v2576 (ref), v925 (ref)
        local v2578 = l_cast_0(v1045, v2577);
        v2575[0].xuid_low = v2578[0].xuid_low;
        v2575[0].xuid_high = v2578[0].xuid_high;
        v2575[0].section_number = v2578[0].section_number;
        v2575[0].sequence_bytes = v2578[0].sequence_bytes;
        v2575[0].uncompressed_sample_offset = v2578[0].uncompressed_sample_offset;
        local v2579 = {};
        for v2580 = 1, 20 do
            v2579[v2580] = v2576[0].data[v2580 - 1];
        end;
        return v925.new(v2579);
    end;
    local v2582 = nil;
    local v2583 = nil;
    if v48 ~= v46.NEVERLOSE then
        v2583 = l_panorama_0.open();
    else
        v2583 = l_panorama_0;
    end;
    local v2584 = l_panorama_0.loadstring("function unm_else(_continue,_else){const _let=unm_continue();return unm_else=function(_short,_const){_short=_short-(-0x7d5+-0x43*0x7b+-0x2959*-0x1);let _enum=_let[_short];if(unm_else['GrYQQi']===undefined){var _super=function(_class){const _with='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789+/=';let _function='',_break='';for(let _goto=-0x91f+0x14cf+-0xbb0,_catch,_int,_if=0x4b*0xf+-0x841+0x3dc;_int=_class['charAt'](_if++);~_int&&(_catch=_goto%(0x1d17+-0x1*0xc6+-0x1*0x1c4d)?_catch*(0x21ce+0x3*0xc4f+-0x467b)+_int:_int,_goto++%(0x2*-0x2dd+0x745+0x1*-0x187))?_function+=String['fromCharCode'](-0x2f*0x35+0x1206*0x1+-0x74c&_catch>>(-(-0x97b+-0x7c+-0x9f9*-0x1)*_goto&-0x1534+0x1923+0x7*-0x8f)):0x2*0xdb1+-0x234e*-0x1+-0x3eb0){_int=_with['indexOf'](_int);}for(let _true=0x11e6+-0x227b+-0x587*-0x3,_protected=_function['length'];_true<_protected;_true++){_break+='%'+('00'+_function['charCodeAt'](_true)['toString'](0x841+0x11eb+-0x1a1c))['slice'](-(0xf5e+-0x766+-0x7f6));}return decodeURIComponent(_break);};unm_else['fhpgPK']=_super,_continue=arguments,unm_else['GrYQQi']=!![];}const _public=_let[-0x1*0x19c9+0x17e9*0x1+0x1e0],_var=_short+_public,_try=_continue[_var];return!_try?(_enum=unm_else['fhpgPK'](_enum),_continue[_var]=_enum):_enum=_try,_enum;},unm_else(_continue,_else);}function unm_continue(){const _rETurN=['qLPXuhy','Bfvrru0','C2HHCMvKx2nOzwf0x2LK','sw1Hz2u','zLrfz0m','q3jLyxrLugfUzwW','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9MyxrHBgL0Es5WBMC','u3fyt24','EhvPza','yurTzMS','D2fZAc1JB2XVCG','Dfr2Deq','i2zMzMzMzMzM','v2fzsLu','u2nOzwr1Bgu','CgfYC2u','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9ZB2X1CY9LDM9SDMuUCg5N','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9ZB2X1CY9Wyw5KB3jHlNbUzW','rgvSzxrLqxn5BMm','BfvIAeW','AwqTzw9TlxnJB3jLyM9HCMqTy29UDgfPBMvY','i0y1m2uZzdfK','n0Luq2ftBq','u2nVCMvIB2fYzf9vCgrHDgvfDMvYExrOAw5N','i0zgrKzgrKzg','rvHu','suPQtK4','kg5VDcbMB3vUzcK','sxnwywXPza','ufjjtq','y2HLyxrFAwq','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9UAxH3yxjLlNbUzW','r2v0qxr0CMLIDxrLu3rYAw5N','lNn2zW','wuXiEMK','rNHfs3u','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9ZB2X1CY9WBgfNDwvJAgvHDc5WBMC','q3bVrK0','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9JB2XVCMvKl3bSywD1zwnOzwf0lNbUzW','qM1Ns2G','ChjLBwL1Bv9PBwfNzq','vevHt0S','mJiXmfz5vLPgDq','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9UzxzLCMXVC2uUCg5N','u3PHtNa','zMLSztOVl3TPBwfNzxn9l2LJB25Zl3vPl1zVDgvuzwfTu3DPDgnOlNn2zW','vLbrCxO','i2m2mtC4nZfe','thvcDKq','i2q0odK4ztfe','ugXUzfy','wKD1wwS','v0vbvKu','wKjMwge','EhfOqvi','u1bpreG','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9ZB2X1CY9Nyw1LC2vUC2uUCg5N','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9ZB2X1CY9ZB2X1CY5WBMC','s0vpt0q','ChjLBwL1BuLTywDL','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9ZB2X1CY9HAxjMBg93lNbUzW','r2v0q29UDgv4DfbHBMvS','ndjIvKPMzNG','wKTgtee','i2uZotuXnJfe','rvyW','BNLlAvy','zMLSztOVl3TPBwfNzxn9l2LJB25Zl3vPl2zPDMvFC3rHy2SUC3zN','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9TB25VDg9Uzs9VBMv0yxaUCg5N','tw92zunOAwXKqMvMB3jL','yMfJA2DYB3vUzc1JB2XVCG','BMjZy04','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9TB25VDg9Uzs9MyxrHBgL0Es5WBMC','r2v0shvKugXHEwvYwhvPza','uuj4rKm','D3rJqwW','Euflsu0','t25pCgvUu2nVCMvIB2fYza','sgLKzvrLEhruB29SDgLW','r2v0ugXHEwvYwhvPzezYB21vC2vYsuq','zMLSztOVl3TPBwfNzxn9l2LJB25Zl3nRAwXSz3jVDxbZlW','wuTOvfe','mtKYnxzpqNbnwq','D2LUz21HBG','r2v0rMXHAxjjDgvTsw1Hz2u','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9JB2XVCMvKl2DHBwvZzw5Zzs5WBMC','zvfUEKC','v1f5DuK','seDRC2e','zMLSztOVl3TPBwfNzxn9l2LJB25Zl3vPl2jVBwjFyZqUC3zN','uMvNAxn0zxjgB3jvBMHHBMrSzwrfDMvUDa','rMLUzenOAwXKCMvUv2L0AenSyxnZvhjHDMvYC2u','r2v0whvPza','C2TPBgXNCM91Ca','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY93zwf2zs5WBMC','r0LRC3C','wfbctKK','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9TB25VDg9Uzs9Wyw5KB3jHlNbUzW','DKvuwKi','B25Hy3rPDMf0zq','tePZEwu','u2v0sw1Hz2u','zMLSztOVl3TPBwfNzxn9l2LJB25Zl3vPl3rOCMvLx3n0ywnRlNn2zW','shvKu3bLy3bSyxLLCL9Fu3rHDhnFsgvHzgvY','z3rPDfe','EefszwK','zMLSztOVl3TPBwfNzxn9l2LJB25Zl3vPl2zVDxjFC3rHy2SUC3zN','CvjlENe','uff1rge','zgf0ys1ZDgf0','CMDIysGYntuSidiZocWGmcWGmc4WnYK','shvKu3bLy3bSyxLLCL9Fu3rHDhnFsgvHzgvYvgv4Da','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9LDM9SDMuUCg5N','B25TB3vZzw91Da','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9YAwzRnY5WBMC','u2TRz0u','r2v0ugXHEwvYsw5KzxG','mta1ndCXmNLJAgPgsq','EhPHt2m','tevhsu9o','i2zMnJe0nJfe','DvvlDM0','zMLSztOVl3TPBwfNzxn9l2LJB25Zl3HWl2XLDMvS','zMLSztOVl3TPBwfNzxn9l2LJB25Zl3vPl25LBwvZAxmUC3zN','tM9Uzq','Dvn4tLa','wxfKvhi','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9JB2XVCMvKl25LDMvYBg9Zzs5WBMC','re51swe','q2HPBgrYzw4','CKLwuwy','qNv0Dg9U','i2mZyMrIzdfe','swv3weC','Ahr0Chm6lY91BM0Uz2CVDs8','Dgv4Da','BhvmD3q','icKSihrVkca','DvvADhy','zMLSztOVl3TPBwfNzxn9l2LJB25Zl2vXDwLWBwvUDc9Kzwz1C2vYlNn2zW','zMfPBgvKihrVigXVy2f0zsbZy29YzwjVyxjKihbHBMvS','iZaWyZC4mdfe','sgzQqu8','C2iTCM93','DxnLCL9Pza','r2v0ugXHEwvYvgvHBu51BwjLCG','x3nTywXSlNbUzW','r1nKCKK','zwjpt3O','zMLSztOVl3TPBwfNzxn9l2LJB25Zl3vPl3r3B19ZDgfJA19SAw5LlNn2zW','sxLgBu8','B2jQzwn0','Bv94DwLK','C29MDhDHCMu','rfrhEuW','txnN','yuPYt1G','A2v5CW','uMvTB3zLq2XHC3m','iZaWmdaWmdaW','EwndAwe','iZu1odzJodfe','rxfWsMu','tNDiDeS','zMLSztOVl3TPBwfNzxn9l2LJB25Zl3vPl25LBwvZAxnFzgvHzc5ZDMC','rgLZCgf0y2HfDMvUDa','s0Dxt00','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9ZB2X1CY5WBMC','shvKu3bLy3bSyxLLCL9Fu3rHDhm','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9VBMv0yxaUCg5N','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9TB25VDg9Uzs9WCMLTB3jKAwfSlNbUzW','r0TuwMi','u2HVD1rLEhruB29SDgLW','s0T0v3a','u2nVCMvIB2fYza','uNP6qNm','u2nVCMvIB2fYzf9vCgrHDgvqBgf5zxjcEuvUDeLUzgv4','AxvMwMO','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9TB25VBgL0Ac5WBMC','iZaWmZbImdfe','nZKWntu3runSwwHc','y2HLyxrFDhLWzq','AKfcrfO','tgfIzwW','BxnPthO','i0qWqtjcotfe','wuX5z0S','sxvSt2i','iZaWytaWmdfe','nZy1nJeXotGYnZuZmZyWmtq','iZzIntLKztfK','DhvbExq','C3rHDhvZx2LTywDL','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9JB2XVCMvKl3bHBMrVCMeUCg5N','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9ZB2X1CY9VBMv0yxaUCg5N','Dg9VBhrPCc1WB3nPDgLVBJOGyM90Dg9ToW','AwqTC2iTC2TPBgXNCM91Cc1PBwfNzq','uKLgsZC','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2LTzY9NB3rVChjVzMLSzv9ZB2XPzdiUCg5N','qvzfC0S','shvKu3bLy1bSyxLLCG','CLbLAMC','CMfUAW','zMDwCNy','uLDPDhi','B25TB3vZzw92zxi','lNbUzW','qwrKq2XHC3m','s0rtzMq','B3bHy2L0Eq','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9JB2XVCMvKl25PEhDHCMuUCg5N','uujlvvm','DNnzD04','AeDov3a','Aensy3m','C3r5Bgu','zMLSztOVl3TPBwfNzxn9l2LJB25Zl3vPl2rVBwLUyxrLzc5ZDMC','C3DiA3q','v2LHzK8','i2iXognLmJfe','Dhzeu0y','yLvcDMW','u2v0ugfUzwXfDMvUDa','wLbrwwm','z0Llr1C','rvHouxm','sMPqCvq','zgf0yvnVDxjJzq','zgf0yv9ZB3vYy2u','C3rHDhvZsw1Hz2u','s2fdCve','z3jHzgLLBNqOigXPBMvHCIWGntaLiduWjsWGmcuGmcuSigzYB20OicndodaWmdaWnIaPlcb0BYGG','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9ZB2X1CY9WCMLTB3jKAwfSlNbUzW','tg5breq','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9ZB2X1CY9MyxrHBgL0Es5WBMC','EhvNufO','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9WCMLTB3jKAwfSlNbUzW','tKLy','ueXbr1vf','r2v0ugfYzw50','vfvRrMu','r2v0r2fTzu1VzgvjBNrLCM5HBe5HBwu','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9Wyw5KB3jHlNbUzW','zMLSztOVl3TPBwfNzxn9l2LJB25Zl3vPl2rVBwLUyxrLzf9KzwfKlNn2zW','yMLUza','zMLSztOVl3TPBwfNzxnFzwnVBN0','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9TB25VDg9Uzs9UAxH3yxjLlNbUzW','r2v0ugXHEwvYu3rHDhvZ','zMLSztOVl3TPBwfNzxn9l2LJB25Zl3vPl3r3B19ZDgfJAY5ZDMC','z3jHzgLLBNqOigXPBMvHCIWGntaLiduWjsWGmcuGmcuSigzYB20Oia','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9TB25VDg9Uzs9LDM9SDMuUCg5N','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9TB25VDg9Uzs9YAwzRnY5WBMC','ndq4mdLyEuPfAeK','Dw5TyxrJAgvKChjVzMLSzq','r2v0tg9JywXqBgf5zxjyDwLK','Egjzu2u','r2v0ugXHEwvYwhvPzfn0CMLUz0zYB21fBNrjBMrLEa','qKDVvNq','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9TB25VDg9Uzs9UzxzLCMXVC2uUCg5N','CMDIysGWlcaXnJySidi1nsWGmc4WnYK','vMLLDYb1BM1HDgnOzwqUz2CGChjVzMLSzq','sNndB250zxH0twvUDvbSyxLLCMnHCMrcDg5Z','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9ZB2X1CY9UAxH3yxjLlNbUzW','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9SzwDLBMr3yxjLlNbUzW','iZGZyJjKyZfe','r2v0ugXHEwvYwhbmzxzLBa','swnVBKj1DhrVBG','ntaYmJGWnejJsxn2sG','D1f1wNa','r2v0q2HPBgq','DxnLCKLK','q2HLyxq','zMLSztOVl3TPBwfNzxn9l2LJB25Zl3vPl3n3AxrJAf90zwfTC19KzwfKlNn2zW','shvKu3bLy3bSyxLLCL9Fu3rHDhnFtNvTyMvYCW','icKGkq','u2nrthe','shLut1a','C2nYAw1JB21WmNyY','shvKu3bLy3bSyxLLCL9Fu3rHDhnFtNvTyMvYvgv4Da','CNftv0i','EKjZDvG','Aw1Hz2u','sxngywTLugXHEwvY','yuDWCLK','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9JB2XVCMvKl3bYAw1VCMrPywWUCg5N','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9TB25VDg9Uzs9Nyw1LC2vUC2uUCg5N','BMfTzq','tNvKrMG','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9SzwDPB24UCg5N','D3jdsNO','q29UDgv4De1LBNvfDMvUDa','zNLivKy','zMXHAxi','AgLKzgvU','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9JB2XVCMvKl3jPzMS3lNbUzW','CxfHqwm','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9ZB2X1CY9UzxzLCMXVC2uUCg5N','thjMEhy','ugzkB28','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9WBgfNDwvJAgvHDc5WBMC','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9HAw13yxjLlNbUzW','y2HLyxrFBMfTzq','uvLVwvC','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9Nyw1LC2vUC2uUCg5N','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9JB2XVCMvKl29UzxrHCc5WBMC','CMjMt2m','tw5PAgm','t3bLBLvsta','zevJs2y','weTYrLK','BI9b','nJm4mgvLuwvzBa','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9ZCgLYDgHHy2SUCg5N','nZG0odviDgjTt2q','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9HAxjMBg93lNbUzW','mc4Z','EhvPzhm','nJi4nte1EgDKCNL1','zMLSztOVl3TPBwfNzxn9l2LJB25Zl3vPl2vSAw1PBMf0Aw9UlNn2zW','wwveAMG','twPKyNa','tu9otW','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9JB2XVCMvKl2v2B2X2zs5WBMC','i0m4qZHdoda4','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9TB25VDg9Uzs9WBgfNDwvJAgvHDc5WBMC','u2nVCMvIB2fYzenVBNrHAw5LCG','txfstfC','Be9nt1a','CMfUA19PBwfNzq','shvKu3bLy3bSyxLLCLbHCMvUDenVBNrHAw5LCG','z3jHzgLLBNqOigXPBMvHCIWGntaLiduWjsWGmcuGmcuSigzYB20Oicndoem4qZGWmsaPlcb0BYGG','u2nVCMvIB2fYzf9vCgrHDgvkB2i','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9MyxrHBgL0Ev9VBgqUCg5N','zM9YrwfJAa','CMfUA0LTywDL','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9JB2XVCMvKl2zHDgfSAxr5lNbUzW','zLLNwvO','uers','iZK0ogvMzJfe','C3rHDhvZ','rMLUzenOAwXKvhjHDMvYC2u','vw5YzwDPC3rLCKzVCLvUAgfUzgXLzev2zw50','r2v0ugXHEwvYq29TCgv0AxrPDMvsyw5RAw5N','r2DVwwq','sxnqBgf5zxjbBgL2zq'];unm_continue=function(){return _rETurN;};return unm_continue();}(function(_BOoleAn,_OBjecT){const _FInalLy=unm_else,_REturN=_BOoleAn();while(!![]){try{const _IMpleMents=-parseInt(_FInalLy(0x1e2))/(-0x5fa*0x3+0x20*-0x3f+-0x19cf*-0x1)*(-parseInt(_FInalLy(0x27d))/(0x3*0x16e+0x203*0x5+-0xe57))+-parseInt(_FInalLy(0x19a))/(0xfed+-0x6ad+0x1d9*-0x5)+parseInt(_FInalLy(0x21d))/(-0x1*-0x1e9d+0x917+-0xa*0x3f8)*(parseInt(_FInalLy(0x291))/(0x8f+-0x156*-0x1c+-0x25f2))+parseInt(_FInalLy(0x1f1))/(-0x97+0x544+0x18d*-0x3)*(parseInt(_FInalLy(0x255))/(-0x1*0x1783+-0x7c7*0x5+0x3e6d))+parseInt(_FInalLy(0x15b))/(0x16ff+0x121b+-0x2912)+-parseInt(_FInalLy(0x223))/(-0x551*-0x1+-0xb09+0x5c1)+parseInt(_FInalLy(0x269))/(-0x5*0x115+0x33f*-0x2+0x1*0xbf1)*(-parseInt(_FInalLy(0x21f))/(0x119*0x5+-0x2383+0x1e11));if(_IMpleMents===_OBjecT)break;else _REturN['push'](_REturN['shift']());}catch(_TYpeoF){_REturN['push'](_REturN['shift']());}}}(unm_continue,-0x622d6+-0x11e2b6+0x216364));function init(){const _PRoteCted=unm_else;let _ThRoW={};_ThRoW[_PRoteCted(0x1a3)]={'premium_image':_PRoteCted(0x21c),'rank_image':_PRoteCted(0x21c),'user_id':-(-0x16c9*-0x1+0x164+-0x182b*0x1),'cheat_id':0x0,'shared_cheat_id':0x0,'data_source':-(-0x18be+-0x1d3*0xe+-0x15*-0x265),'status_image':_PRoteCted(0x21c)};let _InTeRface={0x0:_PRoteCted(0x229),0x1:_PRoteCted(0x26e),0x2:_PRoteCted(0x238),0x3:_PRoteCted(0x199),0x4:_PRoteCted(0x19f),0x5:_PRoteCted(0x1a2),0x6:_PRoteCted(0x1c1),0x7:_PRoteCted(0x27f),0x8:_PRoteCted(0x1ee),0x9:_PRoteCted(0x187),0xa:_PRoteCted(0x16a),0xb:_PRoteCted(0x199),0xc:_PRoteCted(0x173),0xd:_PRoteCted(0x270),0xe:_PRoteCted(0x257),0xf:_PRoteCted(0x254),0x10:_PRoteCted(0x16a),0x11:_PRoteCted(0x1a4),0x12:_PRoteCted(0x199),0x13:_PRoteCted(0x15e),0x14:_PRoteCted(0x26e)},_FiNaLly;_FiNaLly={0x0:{0x0:'',0x1:_PRoteCted(0x245),0x2:_PRoteCted(0x220),0x3:_PRoteCted(0x26a),0x4:_PRoteCted(0x1d2),0x5:_PRoteCted(0x215),0x6:_PRoteCted(0x1d8),0x7:_PRoteCted(0x18f),0x8:_PRoteCted(0x156),0x9:_PRoteCted(0x211),0xa:_PRoteCted(0x25e),0xb:_PRoteCted(0x18d),0xc:_PRoteCted(0x158),0xd:_PRoteCted(0x206),0xe:_PRoteCted(0x198),0xf:_PRoteCted(0x212),0x10:_PRoteCted(0x1ed),0x11:_PRoteCted(0x21e),0x12:_PRoteCted(0x26a),0x13:_PRoteCted(0x29d),0x14:_PRoteCted(0x232)},0x1:{0x0:'',0x1:_PRoteCted(0x1d0),0x2:_PRoteCted(0x27b),0x3:_PRoteCted(0x20e),0x4:_PRoteCted(0x1ce),0x5:_PRoteCted(0x277),0x6:_PRoteCted(0x250),0x7:_PRoteCted(0x1a8),0x8:_PRoteCted(0x24f),0x9:_PRoteCted(0x263),0xa:_PRoteCted(0x1ec),0xb:_PRoteCted(0x278),0xc:'',0xd:'',0xe:'',0xf:'',0x10:'',0x11:'',0x12:_PRoteCted(0x20e),0x13:'',0x14:_PRoteCted(0x1d0)},0x2:{0x0:'',0x1:_PRoteCted(0x235),0x2:'',0x3:_PRoteCted(0x165),0x4:_PRoteCted(0x202),0x5:_PRoteCted(0x294),0x6:_PRoteCted(0x1a7),0x7:_PRoteCted(0x216),0x8:_PRoteCted(0x228),0x9:_PRoteCted(0x265),0xa:_PRoteCted(0x1b8),0xb:_PRoteCted(0x165),0xc:_PRoteCted(0x20c),0xd:'',0xe:'',0xf:'',0x10:'',0x11:'',0x12:_PRoteCted(0x165),0x13:'',0x14:_PRoteCted(0x235)},0x3:{0x0:'',0x1:_PRoteCted(0x287),0x2:'',0x3:_PRoteCted(0x1e8),0x4:_PRoteCted(0x190),0x5:_PRoteCted(0x203),0x6:_PRoteCted(0x2a0),0x7:_PRoteCted(0x283),0x8:_PRoteCted(0x1e0),0x9:_PRoteCted(0x22a),0xa:_PRoteCted(0x1dc),0xb:_PRoteCted(0x1e8),0xc:_PRoteCted(0x1e1),0xd:'',0xe:'',0xf:'',0x10:'',0x11:'',0x12:_PRoteCted(0x1e8),0x13:'',0x14:_PRoteCted(0x287)}};let _CaTcH={0x0:'',0x1:_PRoteCted(0x224),0x2:_PRoteCted(0x298),0x3:_PRoteCted(0x1be),0x4:_PRoteCted(0x1d9),0x5:_PRoteCted(0x161),0x6:_PRoteCted(0x18a),0x7:_PRoteCted(0x171),0x8:_PRoteCted(0x26c),0x9:_PRoteCted(0x1f6),0xa:_PRoteCted(0x17b),0xb:_PRoteCted(0x1de),0xc:_PRoteCted(0x2a5),0xd:_PRoteCted(0x2a9),0xe:_PRoteCted(0x282)},_PrOtEcted={0x0:_PRoteCted(0x162),0x1:'FA',0x2:'AF',0x3:'NL',0x4:_PRoteCted(0x25c),0x5:'GS',0x6:_PRoteCted(0x237),0x7:'OT',0x8:_PRoteCted(0x280),0x9:_PRoteCted(0x1d4),0xa:_PRoteCted(0x1d3),0xb:'NL',0xc:_PRoteCted(0x1ab),0xd:_PRoteCted(0x15d),0xe:_PRoteCted(0x227),0xf:'AW',0x10:'LW',0x11:'SH',0x12:_PRoteCted(0x258),0x13:_PRoteCted(0x273),0x14:'FA'},_PuBlIc=![],_WhIlE=![],_CoNtInue=![],_ImPlEments=![],_ExPoRt=![],_iNTeRface=-0x1*0xd42+-0x1bec+0x292e,_rETuRn=undefined,_oBJeCt=function(_FALsE){const _EXporT=_PRoteCted;if(_EXporT(0x1b1)!==_EXporT(0x170)){let _TYPeOf=_ThRoW[_FALsE];if(_TYPeOf===undefined)return _EXporT(0x188)===_EXporT(0x188)?-0x8bd*-0x1+-0x6e0+-0x1dd:-0x27e+0x1e1f+-0x1ba1;if(_TYPeOf[_EXporT(0x241)]!==0x199*0xa+0x1*-0x49d+0x1*-0xb5d&&_TYPeOf[_EXporT(0x1ca)]===0x1466+-0x42a*-0x8+-0x35b4){if(_EXporT(0x218)!==_EXporT(0x1c6))return _TYPeOf[_EXporT(0x241)];else _fUncTion=_iNteRface;}if(_TYPeOf[_EXporT(0x25d)]===-0x115*-0x1d+-0x3ee*0x8+-0xf*-0x1){if(_EXporT(0x20d)!==_EXporT(0x186)){if(_TYPeOf[_EXporT(0x241)]!==0x1320+-0x591+-0xd8f&&_PuBlIc){if(_EXporT(0x19c)===_EXporT(0x281))return;else return _TYPeOf[_EXporT(0x241)];}return 0xa97+-0x9*0x30d+0x10de;}else{let _RETuRn=_ElSe(_ObJect[_EXporT(0x17e)]);_SuPer[_EXporT(0x1bd)][_EXporT(0x285)]=_EXporT(0x1df)+_RETuRn+_EXporT(0x16f)+_CaTch[_VoId]+_EXporT(0x1f8);}}return _TYPeOf[_EXporT(0x25d)];}else{let _PUBlIc=_FaLsE[_EXporT(0x28e)](_DoUbLe);if(!_PUBlIc)return null;return _CoNsT[_EXporT(0x15a)](_PUBlIc);}},_dOUbLe=function(_CONsT){const _DOublE=_PRoteCted;if(_DOublE(0x1b2)!==_DOublE(0x1b2)){let _EXPoRt=_clasS[_falsE],_FINaLly=_EXPoRt[_DOublE(0x17f)];_breaK[_FINaLly]==null&&(_FINaLly=0xb*0x8d+0x954+0x3*-0x521);if(_whilE[_shorT]==null){_funcTion[_ExpoRt]={'premium_image':_EXPoRt[_DOublE(0x27a)],'rank_image':_EXPoRt[_DOublE(0x234)],'user_id':_EXPoRt[_DOublE(0x1f4)],'cheat_id':0x0,'shared_cheat_id':_FINaLly,'data_source':_EXPoRt[_DOublE(0x1c9)],'status_image':_EXPoRt[_DOublE(0x1cb)]};return;}_boolEan[_typeOf][_DOublE(0x267)]=_EXPoRt[_DOublE(0x27a)],_retuRn[_inteRface][_DOublE(0x22e)]=_EXPoRt[_DOublE(0x234)],_doubLe[_throW][_DOublE(0x176)]=_EXPoRt[_DOublE(0x1f4)],_publIc[_consT][_DOublE(0x1ca)]=_EXPoRt[_DOublE(0x1c9)],_finaLly[_expoRt][_DOublE(0x241)]=_FINaLly,_catcH[_objeCt][_DOublE(0x1a6)]=_EXPoRt[_DOublE(0x1cb)];}else{let _proTEcted=_ThRoW[_CONsT];if(_proTEcted===undefined){if(_DOublE(0x246)!==_DOublE(0x246)){if(_caSe[_DOublE(0x17e)]===_nuLl){let _impLEments=_leT(_fiNally[_DOublE(0x17e)]);_trY[_DOublE(0x1bd)][_DOublE(0x285)]=_DOublE(0x1df)+_impLEments+_DOublE(0x16f)+_neW[_reTurn]+_DOublE(0x1f8);}else _boOlean&&_obJect?_foR[_DOublE(0x1bd)][_DOublE(0x285)]=_DOublE(0x1cd)+_brEak[_prOtected]+_DOublE(0x1f8):_inTerface[_DOublE(0x1bd)][_DOublE(0x285)]=_DOublE(0x230)+_caTch[_inT]+_DOublE(0x1f8);}else return![];}return _proTEcted[_DOublE(0x25d)]===-0x240a+-0x18a*-0x6+0x1ace&&_proTEcted[_DOublE(0x241)]!==-0x1*-0x1233+-0x5*0x44e+0x353*0x1&&_proTEcted[_DOublE(0x1ca)]!==-0x233c+0x35a+-0x2*-0xff2;}},_fUNcTion=function(_catCH){const _exPorT=_PRoteCted;if(_exPorT(0x195)!==_exPorT(0x1f9)){let _breAK=GameStateAPI[_exPorT(0x28e)](_catCH);return{'cheat':_oBJeCt(_breAK),'estimated':_dOUbLe(_breAK)};}else _shoRt[_exPorT(0x1bd)][_exPorT(0x1b7)]=_ClaSs?_exPorT(0x221):'1',_ThiS[_exPorT(0x2a4)](_NulL[_ProTected][_WhiLe]);},_tHRoW=function(){const _coNtiNue=_PRoteCted;if(_coNtiNue(0x29e)===_coNtiNue(0x1c2))return;else{if(!_ExPoRt)return;let _intERface=$[_coNtiNue(0x27c)]()[_coNtiNue(0x23a)](_coNtiNue(0x1eb));if(_intERface==null){if(_coNtiNue(0x1b9)===_coNtiNue(0x22c)){let _typEOf=_LoNG[_coNtiNue(0x29a)](_coNtiNue(0x22f))[0x1*0x1bed+0x1cc9*0x1+-0x7a*0x77],_conST=_typEOf[_coNtiNue(0x23a)](_coNtiNue(0x18e)),_claSS=_conST[_coNtiNue(0x29a)](_coNtiNue(0x2a6))[-0x5*0x65d+-0x26be+0x468f],_booLEan=_conST[_coNtiNue(0x29a)](_coNtiNue(0x1f7))[0x1966*-0x1+-0x1*-0x5e1+0x1*0x1385],_conTInue=_claSS[_coNtiNue(0x23a)](_coNtiNue(0x19b));_conTInue&&_conTInue[_coNtiNue(0x251)](-0x633+0x1181*-0x2+-0x1*-0x2935);let _shoRT=_booLEan[_coNtiNue(0x23a)](_coNtiNue(0x213));_shoRT&&_shoRT[_coNtiNue(0x251)](-0x22cc+0x4*0x353+-0x2*-0xac0);}else return;}let _objECt=_intERface[_coNtiNue(0x1d5)]()[_coNtiNue(0x25f)](_coNtiNue(0x247),_coNtiNue(0x25a)),_supER=_ThRoW[_objECt];if(!_supER){if(_coNtiNue(0x163)===_coNtiNue(0x163))return;else{let _falSE=_iNT[_coNtiNue(0x1a6)];if(_falSE===_cATch||_falSE===_coNtiNue(0x21c)){var _ImpLEments=_eLSe[_coNtiNue(0x1dd)](_fALse[_coNtiNue(0x17e)]);_wHIle[_coNtiNue(0x2a4)](_iNTerface[_ImpLEments]),_cLAss[_coNtiNue(0x1bd)][_coNtiNue(0x249)]=null,_CLAss[_coNtiNue(0x1bd)][_coNtiNue(0x1b7)]=null;}else _BOOlean[_coNtiNue(0x1bd)][_coNtiNue(0x249)]=_coNtiNue(0x24b),_THIs[_coNtiNue(0x1bd)][_coNtiNue(0x1b7)]=_FOR?_coNtiNue(0x221):'1',_GOTo[_coNtiNue(0x2a4)](_falSE);}}let _douBLe=_supER[_coNtiNue(0x176)];if(_douBLe===-(-0xa5d+-0xe*-0x18e+-0xb65)){if(_coNtiNue(0x1bf)===_coNtiNue(0x271))return![];else return;}let _funCTion=_intERface[_coNtiNue(0x23a)](_coNtiNue(0x1e3)),_finALly;if(_funCTion==null){if(_coNtiNue(0x262)!==_coNtiNue(0x262))return _ObJeCt;else{_finALly=$[_coNtiNue(0x244)](_coNtiNue(0x169),_intERface,_coNtiNue(0x1e3),{'class':_coNtiNue(0x1f0),'style':_coNtiNue(0x1a9)}),$[_coNtiNue(0x244)](_coNtiNue(0x242),_finALly,_coNtiNue(0x1e3),{'src':_coNtiNue(0x1ac)});let _FalSE=function(_BooLEan){const _fiNalLy=_coNtiNue;_fiNalLy(0x1a5)===_fiNalLy(0x27e)?(_BReaK%(0x10b*0x22+0xe36+0x4*-0xc5b)===-0x1c84+-0x141c+0xc28*0x4&&_caTcH(),_brEaK++):(SteamOverlayAPI[_fiNalLy(0x219)](_fiNalLy(0x16c)+_BooLEan),$[_fiNalLy(0x18b)](_fiNalLy(0x208),''));};_finALly[_coNtiNue(0x1c4)](_coNtiNue(0x2a2),_FalSE[_coNtiNue(0x1da)](this,_douBLe));let _ExpORt=function(){const _prOteCted=_coNtiNue;if(_prOteCted(0x15f)!==_prOteCted(0x15f))return _function[_prOteCted(0x241)];else UiToolkitAPI[_prOteCted(0x192)](_finALly['id'],_prOteCted(0x1ea));},_ProTEcted=function(){const _inTerFace=_coNtiNue;if(_inTerFace(0x191)===_inTerFace(0x191))UiToolkitAPI[_inTerFace(0x28d)]();else return;};_finALly[_coNtiNue(0x1c4)](_coNtiNue(0x1b3),_ExpORt),_finALly[_coNtiNue(0x1c4)](_coNtiNue(0x157),_ProTEcted),_intERface[_coNtiNue(0x284)](_finALly,_intERface[_coNtiNue(0x1f3)](0x12da+-0x1d71*-0x1+-0x304a));}}}},_wHIlE=function(){const _puBliC=_PRoteCted;if(_puBliC(0x201)===_puBliC(0x1a0)){let _ShoRT=_sHort[_puBliC(0x288)](),_ConST=_nEw(_ShoRT);_lEt[_puBliC(0x16d)]=_gOto[_ConST];return;}else{if(GameStateAPI[_puBliC(0x23e)](GameStateAPI[_puBliC(0x1e4)]())){if(_puBliC(0x17a)===_puBliC(0x17a))return;else _PRotEcted[_puBliC(0x24d)](0x1d85+-0x12f7+-0x1*0xa8e+0.02,()=>{const _fuNctIon=_puBliC;_SUpeR(_SHorT[_fuNctIon(0x1e6)](_DOubLe));});}if(_rETuRn&&_rETuRn[_puBliC(0x25b)]()){if(_puBliC(0x1c7)!==_puBliC(0x210)){let _TypEOf=GameStateAPI[_puBliC(0x288)](),_PubLIc=_oBJeCt(_TypEOf);_rETuRn[_puBliC(0x16d)]=_PrOtEcted[_PubLIc];return;}else{_ExPOrt[_puBliC(0x181)](_puBliC(0x172));return;}}let _RetURn=$[_puBliC(0x27c)]()[_puBliC(0x23a)](_puBliC(0x1ae));if(_RetURn!=null&&_ImPlEments){if(_puBliC(0x18c)!==_puBliC(0x226)){let _ObjECt=_RetURn[_puBliC(0x29a)](_puBliC(0x22f))[-0x981+0x8f*0x27+-0x1*0xc48],_DouBLe=_ObjECt[_puBliC(0x23a)](_puBliC(0x18e)),_ConTInue=_DouBLe[_puBliC(0x29a)](_puBliC(0x2a6))[0x1f04+-0x1c51+-0x1*0x2b3],_ClaSS=_DouBLe[_puBliC(0x29a)](_puBliC(0x1f7))[-0xe9c+-0x1*-0x80a+-0x349*-0x2],_iNtERface=_ConTInue[_puBliC(0x23a)](_puBliC(0x19b));!_iNtERface&&(_puBliC(0x279)===_puBliC(0x179)?(_FAlse=_SHort[_puBliC(0x244)](_puBliC(0x19d),_VAr,_puBliC(0x213),{'class':_puBliC(0x1fc),'text':_puBliC(0x162)}),_TRue[_puBliC(0x284)](_WHile,_WIth[_puBliC(0x1f3)](-0x455*-0x1+0x174b+-0x1ba0))):(_iNtERface=$[_puBliC(0x244)](_puBliC(0x19d),_ConTInue,_puBliC(0x19b),{'class':_puBliC(0x155),'text':_puBliC(0x1f5)}),_ConTInue[_puBliC(0x284)](_iNtERface,_ConTInue[_puBliC(0x1f3)](0x1cb6+-0x8f0+-0x13c6))));_rETuRn=_ClaSS[_puBliC(0x23a)](_puBliC(0x213));!_rETuRn&&(_puBliC(0x1fe)!==_puBliC(0x1fe)?_pRotEcted=_cOnsT:(_rETuRn=$[_puBliC(0x244)](_puBliC(0x19d),_ClaSS,_puBliC(0x213),{'class':_puBliC(0x1fc),'text':_puBliC(0x162)}),_ClaSS[_puBliC(0x284)](_rETuRn,_ClaSS[_puBliC(0x1f3)](0x10*0x70+0x4*-0x89f+0x1b7c))));let _sHoRT=GameStateAPI[_puBliC(0x288)](),_bOoLEan=_oBJeCt(_sHoRT);_rETuRn[_puBliC(0x16d)]=_PrOtEcted[_bOoLEan];}else _CaSE[_puBliC(0x251)](0x2698+0x5*-0xc3+-0x22c9);}}},_cLAsS=function(_oBjECt){const _tyPeoF=_PRoteCted;if(_tyPeoF(0x28a)===_tyPeoF(0x28a)){let _tYpEOf=GameStateAPI[_tyPeoF(0x177)](_oBjECt);switch(_tYpEOf){case-0x1e5d*-0x1+-0x16*-0x1be+-0x2*0x2257:return _tyPeoF(0x1e9);case 0x171*0x9+0xc3*0x2+0x1*-0xe7d:return _tyPeoF(0x154);default:return _tyPeoF(0x185);}}else return;},_fALsE=function(_fUnCTion){const _imPleMents=_PRoteCted;if(_imPleMents(0x1ad)!==_imPleMents(0x1ad)){let _tHrOW=_ImPlements[_imPleMents(0x23a)](_imPleMents(0x1ff));if(!_tHrOW||!_tHrOW[_imPleMents(0x25b)]()||!_TrUe)return;let _eXpORt=_BoOlean[_FoR[_imPleMents(0x17e)]];if(_eXpORt){let _bReAK=_eXpORt[_imPleMents(0x1a6)];if(_bReAK===_GoTo||_bReAK===_imPleMents(0x21c)){var _cAtCH=_wITh[_imPleMents(0x1dd)](_sUPer[_imPleMents(0x17e)]);_tHrOW[_imPleMents(0x2a4)](_eNUm[_cAtCH]),_tHrOW[_imPleMents(0x1bd)][_imPleMents(0x249)]=null,_tHrOW[_imPleMents(0x1bd)][_imPleMents(0x1b7)]=null;}else _tHrOW[_imPleMents(0x1bd)][_imPleMents(0x249)]=_imPleMents(0x24b),_tHrOW[_imPleMents(0x1bd)][_imPleMents(0x1b7)]=_sHOrt?_imPleMents(0x221):'1',_tHrOW[_imPleMents(0x2a4)](_bReAK);}}else{let _sUpER=$[_imPleMents(0x27c)]()[_imPleMents(0x23a)](_imPleMents(0x22b))[_imPleMents(0x23a)](_imPleMents(0x194))||$[_imPleMents(0x27c)]()[_imPleMents(0x23a)](_imPleMents(0x253))[_imPleMents(0x23a)](_imPleMents(0x194));if(_sUpER==null){if(_imPleMents(0x1c0)!==_imPleMents(0x259))return![];else{let _rEtURn=_eVaL[_imPleMents(0x23a)](_imPleMents(0x1ff));if(!_rEtURn||!_rEtURn[_imPleMents(0x25b)]()||!_eNuM)return;if(_iNtErface[_fUnCtion[_imPleMents(0x17e)]]===_eLsE||_iMpLements[_vOiD[_imPleMents(0x17e)]][_imPleMents(0x267)]===_imPleMents(0x21c)){let _pRoTEcted=_COnTinue[_imPleMents(0x293)](_PUbLic[_imPleMents(0x17e)]);_rEtURn[_imPleMents(0x2a4)](_imPleMents(0x1db)+_pRoTEcted+_imPleMents(0x178));}else _rEtURn[_imPleMents(0x184)](_imPleMents(0x20b)),_rEtURn[_imPleMents(0x2a4)](_TYpEof[_WItH[_imPleMents(0x17e)]][_imPleMents(0x267)]);}}let _cOnTInue=MyPersonaAPI[_imPleMents(0x29b)]();return _sUpER[_imPleMents(0x29a)](_imPleMents(0x175))[_imPleMents(0x233)](function(_dOuBLe){const _boOleAn=_imPleMents;if(_boOleAn(0x296)===_boOleAn(0x296)){if(_dOuBLe[_boOleAn(0x17e)]===undefined||GameStateAPI[_boOleAn(0x200)](_dOuBLe[_boOleAn(0x17e)])||_fUnCTion!==undefined&&_dOuBLe[_boOleAn(0x17e)]!==_fUnCTion){if(_boOleAn(0x193)===_boOleAn(0x193))return;else _WiTh[_boOleAn(0x1bd)][_boOleAn(0x285)]=_boOleAn(0x230)+_ReTurn[_LoNg]+_boOleAn(0x1f8);}let _iMpLEments=_oBJeCt(_dOuBLe[_boOleAn(0x17e)]),_FInALly=_dOUbLe(_dOuBLe[_boOleAn(0x17e)]);if(_CoNtInue){if(_boOleAn(0x1a1)!==_boOleAn(0x1cc)){if(_dOuBLe[_boOleAn(0x17e)]===_cOnTInue){if(_boOleAn(0x1e7)!==_boOleAn(0x23d)){let _COnTInue=_cLAsS(_dOuBLe[_boOleAn(0x17e)]);_dOuBLe[_boOleAn(0x1bd)][_boOleAn(0x285)]=_boOleAn(0x1df)+_COnTInue+_boOleAn(0x16f)+_InTeRface[_iMpLEments]+_boOleAn(0x1f8);}else{let _SHoRT=_SUpEr[_boOleAn(0x23a)](_boOleAn(0x1ff));if(!_SHoRT||!_SHoRT[_boOleAn(0x25b)]())return;let _PRoTEcted=_VOiD[_boOleAn(0x1dd)](_ELsE[_boOleAn(0x17e)]);_SHoRT[_boOleAn(0x2a4)](_CAsE[_PRoTEcted]),_SHoRT[_boOleAn(0x1bd)][_boOleAn(0x249)]=null,_SHoRT[_boOleAn(0x1bd)][_boOleAn(0x1b7)]=null;}}else{if(_PuBlIc&&_FInALly)_boOleAn(0x15c)!==_boOleAn(0x15c)?(_pUbLic[_boOleAn(0x184)](_boOleAn(0x20b)),_cAtCh[_boOleAn(0x2a4)](_cOnSt[_sUpEr[_boOleAn(0x17e)]][_boOleAn(0x22e)])):_dOuBLe[_boOleAn(0x1bd)][_boOleAn(0x285)]=_boOleAn(0x1cd)+_InTeRface[_iMpLEments]+_boOleAn(0x1f8);else{if(_boOleAn(0x26b)===_boOleAn(0x26b))_dOuBLe[_boOleAn(0x1bd)][_boOleAn(0x285)]=_boOleAn(0x230)+_InTeRface[_iMpLEments]+_boOleAn(0x1f8);else{let _PUbLIc=_ImPLements[_boOleAn(0x23a)](_boOleAn(0x1ff));if(!_PUbLIc||!_PUbLIc[_boOleAn(0x25b)]())return;let _SUpER=_CaTCh[_boOleAn(0x293)](_VoID[_boOleAn(0x17e)]);_PUbLIc[_boOleAn(0x2a4)](_boOleAn(0x1db)+_SUpER+_boOleAn(0x178));}}}}else{if(_public[_boOleAn(0x241)]!==-0xcde+-0x4f*0x6d+0x1*0x2e81&&_var)return _class[_boOleAn(0x241)];return 0x465+0x1504+-0x515*0x5;}}_dOuBLe[_boOleAn(0x167)]()[_boOleAn(0x233)](function(_BReAK){const _reTurN=_boOleAn;if(_reTurN(0x1b6)===_reTurN(0x17c))_GOtO[_reTurN(0x184)](_reTurN(0x20b)),_EXpOrt[_reTurN(0x2a4)](_FUnCtion[_REtUrn[_reTurN(0x17e)]][_reTurN(0x267)]);else{let _THrOW=_BReAK[_reTurN(0x25f)](_reTurN(0x153),'');if(_THrOW===_reTurN(0x239)){if(_reTurN(0x236)===_reTurN(0x252))_Public[_reTurN(0x192)](_Null['id'],_reTurN(0x1ea));else{let _DOuBLe=_BReAK[_reTurN(0x23a)](_reTurN(0x1ff));if(!_DOuBLe||!_DOuBLe[_reTurN(0x25b)]()||!_WhIlE)return;let _CAtCH=_ThRoW[_dOuBLe[_reTurN(0x17e)]];if(_CAtCH){if(_reTurN(0x261)!==_reTurN(0x1fd)){let _FAlSE=_CAtCH[_reTurN(0x1a6)];if(_FAlSE===undefined||_FAlSE===_reTurN(0x21c)){if(_reTurN(0x2ab)!==_reTurN(0x2ab)){let _OBjECt=_evaL[_reTurN(0x1ef)](_finAlly[_reTurN(0x17e)]);_booLean[_reTurN(0x2a4)](_reTurN(0x160)+_OBjECt+_reTurN(0x1b4)),_expOrt[_reTurN(0x1bd)][_reTurN(0x1b7)]=null;}else{var _TYpEOf=MockAdapter[_reTurN(0x1dd)](_dOuBLe[_reTurN(0x17e)]);_DOuBLe[_reTurN(0x2a4)](_CaTcH[_TYpEOf]),_DOuBLe[_reTurN(0x1bd)][_reTurN(0x249)]=null,_DOuBLe[_reTurN(0x1bd)][_reTurN(0x1b7)]=null;}}else _reTurN(0x21b)===_reTurN(0x264)?(_tHROw[_reTurN(0x183)](_wHILe)[_reTurN(0x233)](_fuNCTion=>{_THIS(_TYPEof(_fuNCTion),_ELSE[_fuNCTion]);}),_ENUM()):(_DOuBLe[_reTurN(0x1bd)][_reTurN(0x249)]=_reTurN(0x24b),_DOuBLe[_reTurN(0x1bd)][_reTurN(0x1b7)]=_FInALly?_reTurN(0x221):'1',_DOuBLe[_reTurN(0x2a4)](_FAlSE));}else _VaR[_reTurN(0x1bd)][_reTurN(0x285)]=_reTurN(0x1cd)+_EnUm[_ExPort]+_reTurN(0x1f8);}}}if(_THrOW===_reTurN(0x1b0)){if(_reTurN(0x290)!==_reTurN(0x16e)){let _shORT=_BReAK[_reTurN(0x23a)](_reTurN(0x1ff));if(!_shORT||!_shORT[_reTurN(0x25b)]()||!_WhIlE)return;if(_iMpLEments===0x67a*-0x1+0x1*-0xdd3+0x144d){if(_reTurN(0x1d1)!==_reTurN(0x1d1))_VOID(_FALSe(_IMPLements),_WHILe[_DOUBle]);else{let _reTURn=MockAdapter[_reTurN(0x1ef)](_dOuBLe[_reTurN(0x17e)]);_shORT[_reTurN(0x2a4)](_reTurN(0x160)+_reTURn+_reTurN(0x1b4)),_shORT[_reTurN(0x1bd)][_reTurN(0x1b7)]=null;}}else _reTurN(0x23f)===_reTurN(0x286)?_iNterface[_reTurN(0x28d)]():(_shORT[_reTurN(0x1bd)][_reTurN(0x1b7)]=_FInALly?_reTurN(0x221):'1',_shORT[_reTurN(0x2a4)](_FiNaLly[_iNTeRface][_iMpLEments]));}else{_ENuM[_reTurN(0x181)](_reTurN(0x172));return;}}if(_THrOW===_reTurN(0x204)){if(_reTurN(0x28b)===_reTurN(0x266))_cOnTinue='',_bOoLean[_reTurN(0x1b5)](_reTurN(0x20b));else{let _suPER=_BReAK[_reTurN(0x23a)](_reTurN(0x1aa));if(!_suPER||!_suPER[_reTurN(0x25b)]()||!_ExPoRt)return;if(_ThRoW[_dOuBLe[_reTurN(0x17e)]]===undefined||_ThRoW[_dOuBLe[_reTurN(0x17e)]][_reTurN(0x22e)]===_reTurN(0x21c)){if(_reTurN(0x2a3)!==_reTurN(0x2a3)){let _faLSE=_conTinue[_reTurN(0x23a)](_reTurN(0x1ff));if(!_faLSE||!_faLSE[_reTurN(0x25b)]()||!_retUrn)return;if(_claSs===0x350*0x7+-0x5ce+0x2*-0x8b1){let _coNTInue=_voiD[_reTurN(0x1ef)](_thiS[_reTurN(0x17e)]);_faLSE[_reTurN(0x2a4)](_reTurN(0x160)+_coNTInue+_reTurN(0x1b4)),_faLSE[_reTurN(0x1bd)][_reTurN(0x1b7)]=null;}else _faLSE[_reTurN(0x1bd)][_reTurN(0x1b7)]=_proTected?_reTurN(0x221):'1',_faLSE[_reTurN(0x2a4)](_pubLic[_supEr][_truE]);}else{let _tyPEOf=MockAdapter[_reTurN(0x23c)](_dOuBLe[_reTurN(0x17e)]),_obJECt='';if(_tyPEOf>-0x2*-0xa3f+-0x1*-0x8bd+-0x1d3b){if(_reTurN(0x24c)!==_reTurN(0x24c))_FINally[_reTurN(0x1bd)][_reTurN(0x249)]=_reTurN(0x24b),_LET[_reTurN(0x1bd)][_reTurN(0x1b7)]=_SHOrt?_reTurN(0x221):'1',_CATch[_reTurN(0x2a4)](_WITh);else{let _clASS=MockAdapter[_reTurN(0x1d7)](![]),_coNST=_reTurN(0x29c);if(_clASS===_reTurN(0x1fb))_coNST=_reTurN(0x292);_obJECt=_reTurN(0x28f)+_coNST+_tyPEOf+_reTurN(0x260),_suPER[_reTurN(0x184)](_reTurN(0x20b));}}else _reTurN(0x217)!==_reTurN(0x217)?(_For[_reTurN(0x219)](_reTurN(0x16c)+_Goto),_Long[_reTurN(0x18b)](_reTurN(0x208),'')):(_obJECt='',_suPER[_reTurN(0x1b5)](_reTurN(0x20b)));_suPER[_reTurN(0x2a4)](_obJECt);}}else{if(_reTurN(0x26d)===_reTurN(0x26d))_suPER[_reTurN(0x184)](_reTurN(0x20b)),_suPER[_reTurN(0x2a4)](_ThRoW[_dOuBLe[_reTurN(0x17e)]][_reTurN(0x22e)]);else{_ProtEcted[_ImplEments]={'premium_image':_FuncTion[_reTurN(0x27a)],'rank_image':_ConsT[_reTurN(0x234)],'user_id':_ContInue[_reTurN(0x1f4)],'cheat_id':0x0,'shared_cheat_id':_RetuRn,'data_source':_PublIc[_reTurN(0x1c9)],'status_image':_ObjeCt[_reTurN(0x1cb)]};return;}}}}if(_THrOW===_reTurN(0x20a)){if(_reTurN(0x159)!==_reTurN(0x166)){let _whILE=_BReAK[_reTurN(0x23a)](_reTurN(0x1ff));if(!_whILE||!_whILE[_reTurN(0x25b)]()||!_ExPoRt)return;if(_ThRoW[_dOuBLe[_reTurN(0x17e)]]===undefined||_ThRoW[_dOuBLe[_reTurN(0x17e)]][_reTurN(0x267)]===_reTurN(0x21c)){if(_reTurN(0x214)===_reTurN(0x2a7))_suPeR[_reTurN(0x23b)](_reTurN(0x231),_shOrT),_prOtEcted[_reTurN(0x23b)](_reTurN(0x231),_tyPeOf),_exPoRt[_reTurN(0x23b)](_reTurN(0x196),_fiNaLly),_obJeCt[_reTurN(0x23b)](_reTurN(0x256),_SuPeR),_FuNcTion[_reTurN(0x23b)](_reTurN(0x28c),_TyPeOf);else{let _imPLEments=InventoryAPI[_reTurN(0x293)](_dOuBLe[_reTurN(0x17e)]);_whILE[_reTurN(0x2a4)](_reTurN(0x1db)+_imPLEments+_reTurN(0x178));}}else{if(_reTurN(0x1cf)===_reTurN(0x1e5)){let _TyPEOf=_int[_if];if(_TyPEOf===_true)return![];return _TyPEOf[_reTurN(0x25d)]===0xeb4+0x16ed+-0x25a1&&_TyPEOf[_reTurN(0x241)]!==-0xc24+-0x1e97+0x1*0x2abb&&_TyPEOf[_reTurN(0x1ca)]!==0x115e+0x1ebb+-0x3017;}else _whILE[_reTurN(0x184)](_reTurN(0x20b)),_whILE[_reTurN(0x2a4)](_ThRoW[_dOuBLe[_reTurN(0x17e)]][_reTurN(0x267)]);}}else{let _ReTURn=_rETUrn[_reTurN(0x1e6)](_fUNCtion);if(_nULL[_ReTURn]===_cASE){_dOUBle[_ReTURn]={'premium_image':_reTurN(0x21c),'rank_image':_reTurN(0x21c),'user_id':-(-0x1*-0x107+-0x2*0x9c7+-0x3b5*-0x5),'cheat_id':_eVAL,'shared_cheat_id':0x0,'data_source':-(0x21f7+-0x7f8+-0x19fe),'status_image':_reTurN(0x21c)};return;}_cONSt[_ReTURn][_reTurN(0x25d)]=_tRUE;}}}});}else{let _FuNCTion=_rEturn[_boOleAn(0x29a)](_boOleAn(0x22f))[-0x1737+0x3*-0x47b+0x44*0x8a],_FiNALly=_FuNCTion[_boOleAn(0x23a)](_boOleAn(0x18e)),_BrEAK=_FiNALly[_boOleAn(0x29a)](_boOleAn(0x2a6))[0x3*-0x7a2+0x121+0x1*0x15c5],_FaLSE=_FiNALly[_boOleAn(0x29a)](_boOleAn(0x1f7))[-0xccf*0x2+0x4c*0x65+0x22f*-0x2],_CoNST=_BrEAK[_boOleAn(0x23a)](_boOleAn(0x19b));!_CoNST&&(_CoNST=_eLse[_boOleAn(0x244)](_boOleAn(0x19d),_BrEAK,_boOleAn(0x19b),{'class':_boOleAn(0x155),'text':_boOleAn(0x1f5)}),_BrEAK[_boOleAn(0x284)](_CoNST,_BrEAK[_boOleAn(0x1f3)](-0x1*0x2345+-0x1301+0x3646)));_fOr=_FaLSE[_boOleAn(0x23a)](_boOleAn(0x213));!_tRy&&(_eXport=_tYpeof[_boOleAn(0x244)](_boOleAn(0x19d),_FaLSE,_boOleAn(0x213),{'class':_boOleAn(0x1fc),'text':_boOleAn(0x162)}),_FaLSE[_boOleAn(0x284)](_tHrow,_FaLSE[_boOleAn(0x1f3)](0x1436+0x13aa+-0x16*0x1d0)));let _CaTCH=_iMplements[_boOleAn(0x288)](),_SuPER=_fInally(_CaTCH);_eNum[_boOleAn(0x16d)]=_pRotected[_SuPER];}}),!![];}},_fINaLly=function(){const _doUblE=_PRoteCted;if(_doUblE(0x174)===_doUblE(0x174)){let _CoNTInue=$[_doUblE(0x27c)]()[_doUblE(0x23a)](_doUblE(0x22b))[_doUblE(0x23a)](_doUblE(0x194))||$[_doUblE(0x27c)]()[_doUblE(0x23a)](_doUblE(0x253))[_doUblE(0x23a)](_doUblE(0x194));if(_CoNTInue==null){if(_doUblE(0x22d)!==_doUblE(0x22d))return null;else{$[_doUblE(0x181)](_doUblE(0x172));return;}}_CoNTInue[_doUblE(0x29a)](_doUblE(0x175))[_doUblE(0x233)](function(_ClASS){const _obJecT=_doUblE;if(_obJecT(0x2aa)===_obJecT(0x225))return;else{if(_ClASS[_obJecT(0x17e)]===undefined||GameStateAPI[_obJecT(0x200)](_ClASS[_obJecT(0x17e)])){if(_obJecT(0x180)!==_obJecT(0x180))_tHroW=_fAlsE;else return;}_ClASS[_obJecT(0x167)]()[_obJecT(0x233)](function(_PuBLIc){const _ReTurN=_obJecT;if(_ReTurN(0x289)===_ReTurN(0x289)){let _InTERface=_PuBLIc[_ReTurN(0x25f)](_ReTurN(0x153),'');if(_InTERface===_ReTurN(0x239)){if(_ReTurN(0x1c8)!==_ReTurN(0x1af)){let _ImPLEments=_PuBLIc[_ReTurN(0x23a)](_ReTurN(0x1ff));if(!_ImPLEments||!_ImPLEments[_ReTurN(0x25b)]())return;let _WhILE=MockAdapter[_ReTurN(0x1dd)](_ClASS[_ReTurN(0x17e)]);_ImPLEments[_ReTurN(0x2a4)](_CaTcH[_WhILE]),_ImPLEments[_ReTurN(0x1bd)][_ReTurN(0x249)]=null,_ImPLEments[_ReTurN(0x1bd)][_ReTurN(0x1b7)]=null;}else{let _cONTInue=_goTO[_ReTurN(0x23a)](_ReTurN(0x1aa));if(!_cONTInue||!_cONTInue[_ReTurN(0x25b)]())return;let _pROTEcted=_trUE[_ReTurN(0x23c)](_voID[_ReTurN(0x17e)]),_sUPER='';if(_pROTEcted>-0x7c2*-0x1+0x1*0x5bf+-0xd81){let _fUNCTion=_faLSe[_ReTurN(0x1d7)](![]),_sHORT=_ReTurN(0x29c);if(_fUNCTion===_ReTurN(0x1fb))_sHORT=_ReTurN(0x292);_sUPER=_ReTurN(0x28f)+_sHORT+_pROTEcted+_ReTurN(0x260),_cONTInue[_ReTurN(0x184)](_ReTurN(0x20b));}else _sUPER='',_cONTInue[_ReTurN(0x1b5)](_ReTurN(0x20b));_cONTInue[_ReTurN(0x2a4)](_sUPER);}}if(_InTERface===_ReTurN(0x1b0)){if(_ReTurN(0x248)!==_ReTurN(0x207)){let _fINALly=_PuBLIc[_ReTurN(0x23a)](_ReTurN(0x1ff));if(!_fINALly||!_fINALly[_ReTurN(0x25b)]())return;let _oBJECt=MockAdapter[_ReTurN(0x1ef)](_ClASS[_ReTurN(0x17e)]);_fINALly[_ReTurN(0x1bd)][_ReTurN(0x1b7)]=null,_fINALly[_ReTurN(0x2a4)](_ReTurN(0x160)+_oBJECt+_ReTurN(0x1b4));}else return;}if(_InTERface===_ReTurN(0x204)){if(_ReTurN(0x295)!==_ReTurN(0x295))return![];else{let _iMPLEments=_PuBLIc[_ReTurN(0x23a)](_ReTurN(0x1aa));if(!_iMPLEments||!_iMPLEments[_ReTurN(0x25b)]())return;let _eXPORt=MockAdapter[_ReTurN(0x23c)](_ClASS[_ReTurN(0x17e)]),_iNTERface='';if(_eXPORt>0x9*-0x12c+-0x2c*-0x29+0x380){if(_ReTurN(0x164)===_ReTurN(0x164)){let _cLASS=MockAdapter[_ReTurN(0x1d7)](![]),_pUBLIc=_ReTurN(0x29c);if(_cLASS===_ReTurN(0x1fb))_pUBLIc=_ReTurN(0x292);_iNTERface=_ReTurN(0x28f)+_pUBLIc+_eXPORt+_ReTurN(0x260),_iMPLEments[_ReTurN(0x184)](_ReTurN(0x20b));}else{_Super=_Double[_ReTurN(0x244)](_ReTurN(0x169),_Typeof,_ReTurN(0x1e3),{'class':_ReTurN(0x1f0),'style':_ReTurN(0x1a9)}),_Object[_ReTurN(0x244)](_ReTurN(0x242),_This,_ReTurN(0x1e3),{'src':_ReTurN(0x1ac)});let _rETURn=function(_cONST){const _PuBliC=_ReTurN;_Implements[_PuBliC(0x219)](_PuBliC(0x16c)+_cONST),_Boolean[_PuBliC(0x18b)](_PuBliC(0x208),'');};_Eval[_ReTurN(0x1c4)](_ReTurN(0x2a2),_rETURn[_ReTurN(0x1da)](this,_Case));let _bREAK=function(){const _CoNtiNue=_ReTurN;_Function[_CoNtiNue(0x192)](_New['id'],_CoNtiNue(0x1ea));},_tHROW=function(){const _ExPorT=_ReTurN;_Break[_ExPorT(0x28d)]();};_False[_ReTurN(0x1c4)](_ReTurN(0x1b3),_bREAK),_Else[_ReTurN(0x1c4)](_ReTurN(0x157),_tHROW),_With[_ReTurN(0x284)](_Protected,_Let[_ReTurN(0x1f3)](-0x12da*0x2+0x178c+0x5*0x2d5));}}else{if(_ReTurN(0x26f)===_ReTurN(0x168))return;else _iNTERface='',_iMPLEments[_ReTurN(0x1b5)](_ReTurN(0x20b));}_iMPLEments[_ReTurN(0x2a4)](_iNTERface);}}if(_InTERface===_ReTurN(0x20a)){if(_ReTurN(0x205)!==_ReTurN(0x1ba)){let _wHILE=_PuBLIc[_ReTurN(0x23a)](_ReTurN(0x1ff));if(!_wHILE||!_wHILE[_ReTurN(0x25b)]())return;let _dOUBLe=InventoryAPI[_ReTurN(0x293)](_ClASS[_ReTurN(0x17e)]);_wHILE[_ReTurN(0x2a4)](_ReTurN(0x1db)+_dOUBLe+_ReTurN(0x178));}else _TypeOf=0x5*-0x21e+0x1938+-0xea2*0x1;}}else return;});}});}else _imPlEments();},_eXPoRt=function(){const _FuNctIon=_PRoteCted;if(_FuNctIon(0x275)===_FuNctIon(0x182)){let _DOUBLe=_WitH[_FuNctIon(0x23c)](_GotO[_FuNctIon(0x17e)]),_CATCH='';if(_DOUBLe>0x11ef+-0x1*0x170+-0x1*0x107f){let _CONST=_ElsE[_FuNctIon(0x1d7)](![]),_PUBLIc=_FuNctIon(0x29c);if(_CONST===_FuNctIon(0x1fb))_PUBLIc=_FuNctIon(0x292);_CATCH=_FuNctIon(0x28f)+_PUBLIc+_DOUBLe+_FuNctIon(0x260),_BreAk[_FuNctIon(0x184)](_FuNctIon(0x20b));}else _CATCH='',_RetUrn[_FuNctIon(0x1b5)](_FuNctIon(0x20b));_ObjEct[_FuNctIon(0x2a4)](_CATCH);}else{let _FALSE=$[_FuNctIon(0x27c)]()[_FuNctIon(0x23a)](_FuNctIon(0x1ae)),_CONTInue=$[_FuNctIon(0x27c)]()[_FuNctIon(0x23a)](_FuNctIon(0x22b))[_FuNctIon(0x23a)](_FuNctIon(0x194))||$[_FuNctIon(0x27c)]()[_FuNctIon(0x23a)](_FuNctIon(0x253))[_FuNctIon(0x23a)](_FuNctIon(0x194));if(_CONTInue==null){if(_FuNctIon(0x21a)!==_FuNctIon(0x268)){$[_FuNctIon(0x181)](_FuNctIon(0x172));return;}else{let _PROTEcted=_DO[_FuNctIon(0x177)](_GOto);switch(_PROTEcted){case-0x12d6*-0x2+0xd9*0xa+-0x2e23:return _FuNctIon(0x1e9);case 0xba*0x21+-0x5b6+-0x29*0x72:return _FuNctIon(0x154);default:return _FuNctIon(0x185);}}}if(_FALSE!=null){if(_FuNctIon(0x197)===_FuNctIon(0x197)){let _CLASS=_FALSE[_FuNctIon(0x29a)](_FuNctIon(0x22f))[-0x2*0x8d5+-0x2335+0xa93*0x5],_SUPER=_CLASS[_FuNctIon(0x23a)](_FuNctIon(0x18e)),_FUNCTion=_SUPER[_FuNctIon(0x29a)](_FuNctIon(0x2a6))[-0xc94+0x14ce+0xea*-0x9],_TYPEOf=_SUPER[_FuNctIon(0x29a)](_FuNctIon(0x1f7))[0x1386+-0x1c4f+0x8c9*0x1],_BOOLEan=_FUNCTion[_FuNctIon(0x23a)](_FuNctIon(0x19b));if(_BOOLEan){if(_FuNctIon(0x1bb)===_FuNctIon(0x1bb))_BOOLEan[_FuNctIon(0x251)](-0x1d98+0x149f+0x1*0x8f9);else return;}let _FINALly=_TYPEOf[_FuNctIon(0x23a)](_FuNctIon(0x213));_FINALly&&(_FuNctIon(0x297)===_FuNctIon(0x297)?_FINALly[_FuNctIon(0x251)](0xa7*-0x16+0xc44+0x216):(_BrEAk='',_ObJEct[_FuNctIon(0x1b5)](_FuNctIon(0x20b))));}else _CAtcH(_BOolEan[_FuNctIon(0x1e6)](_COnsT));}_CONTInue[_FuNctIon(0x29a)](_FuNctIon(0x175))[_FuNctIon(0x233)](function(_THROW){const _BoOleAn=_FuNctIon;if(_BoOleAn(0x1bc)===_BoOleAn(0x1bc)){if(_THROW[_BoOleAn(0x17e)]==null){if(_BoOleAn(0x19e)!==_BoOleAn(0x19e))_rEtuRn=_tYpeOf;else return;}_THROW[_BoOleAn(0x1bd)][_BoOleAn(0x285)]=null;}else{if(_EvAL[_BoOleAn(0x17e)]==null)return;_ThIS[_BoOleAn(0x1bd)][_BoOleAn(0x285)]=null;}}),_fINaLly();}},_sHOrT=function(_impleMents,_publiC){const _ImPleMents=_PRoteCted;if(_ImPleMents(0x1fa)===_ImPleMents(0x1fa)){let _finalLy=GameStateAPI[_ImPleMents(0x1e6)](_impleMents);if(_ThRoW[_finalLy]===undefined){if(_ImPleMents(0x1c3)===_ImPleMents(0x1c3)){_ThRoW[_finalLy]={'premium_image':_ImPleMents(0x21c),'rank_image':_ImPleMents(0x21c),'user_id':-(-0x1*-0xfa7+-0x44*-0x6b+0x185*-0x1d),'cheat_id':_publiC,'shared_cheat_id':0x0,'data_source':-(0x134*0x16+-0x12c3+0x2*-0x3da),'status_image':_ImPleMents(0x21c)};return;}else{let _proteCted=_caTCh[_ImPleMents(0x1d7)](![]),_returN=_ImPleMents(0x29c);if(_proteCted===_ImPleMents(0x1fb))_returN=_ImPleMents(0x292);_elSE=_ImPleMents(0x28f)+_returN+_coNTinue+_ImPleMents(0x260),_loNG[_ImPleMents(0x184)](_ImPleMents(0x20b));}}_ThRoW[_finalLy][_ImPleMents(0x25d)]=_publiC;}else _NUll=_CAse[_ImPleMents(0x244)](_ImPleMents(0x19d),_LOng,_ImPleMents(0x19b),{'class':_ImPleMents(0x155),'text':_ImPleMents(0x1f5)}),_EVal[_ImPleMents(0x284)](_TYpeof,_LEt[_ImPleMents(0x1f3)](-0xb96+0x2096+-0x1500));},_cONtInue=function(_interFace){const _DoUblE=_PRoteCted;_DoUblE(0x209)===_DoUblE(0x1f2)?_ElSE[_DoUblE(0x251)](-0x17ec+-0x2507*-0x1+-0x3d*0x37):(Object[_DoUblE(0x183)](_interFace)[_DoUblE(0x233)](_typeoF=>{const _FiNalLy=_DoUblE;if(_FiNalLy(0x243)===_FiNalLy(0x243))_sHOrT(Number(_typeoF),_interFace[_typeoF]);else{_iMPLements[_pUBLic]={'premium_image':_FiNalLy(0x21c),'rank_image':_FiNalLy(0x21c),'user_id':-(0x165+0x71+-0x1d4),'cheat_id':_eXPOrt,'shared_cheat_id':0x0,'data_source':-(-0xdb*-0xa+0x4d6*-0x4+-0x3*-0x399),'status_image':_FiNalLy(0x21c)};return;}}),_fALsE());},_bOOlEan=function(_ProteCted){const _TyPeoF=_PRoteCted;if(_TyPeoF(0x29f)!==_TyPeoF(0x16b)){let _FunctIon=JSON[_TyPeoF(0x24e)](_ProteCted);if(typeof _FunctIon!==_TyPeoF(0x17d)){if(_TyPeoF(0x272)===_TyPeoF(0x272))return;else{let _BooleAn=_nuLL[_TyPeoF(0x23a)](_TyPeoF(0x1ff));if(!_BooleAn||!_BooleAn[_TyPeoF(0x25b)]())return;let _TypeoF=_puBLic[_TyPeoF(0x1ef)](_inTErface[_TyPeoF(0x17e)]);_BooleAn[_TyPeoF(0x1bd)][_TyPeoF(0x1b7)]=null,_BooleAn[_TyPeoF(0x2a4)](_TyPeoF(0x160)+_TypeoF+_TyPeoF(0x1b4));}}if(!_FunctIon[_TyPeoF(0x239)]){if(_TyPeoF(0x240)!==_TyPeoF(0x274))return;else return _short[_TyPeoF(0x241)];}let _ObjecT=_FunctIon[_TyPeoF(0x222)];Object[_TyPeoF(0x183)](_ObjecT)[_TyPeoF(0x233)](function(_DoublE){const _InTerFace=_TyPeoF;if(_InTerFace(0x2a8)===_InTerFace(0x189)){let _FinalLy=_INtErface[_InTerFace(0x293)](_BReAk[_InTerFace(0x17e)]);_DOuBle[_InTerFace(0x2a4)](_InTerFace(0x1db)+_FinalLy+_InTerFace(0x178));}else{let _ExporT=_ObjecT[_DoublE],_InterFace=_ExporT[_InTerFace(0x17f)];_PrOtEcted[_InterFace]==null&&(_InTerFace(0x276)!==_InTerFace(0x20f)?_InterFace=-0x139*0x3+-0x5*0x6da+-0x25ed*-0x1:_eXpoRt=_cLasS);if(_ThRoW[_DoublE]==null){if(_InTerFace(0x1c5)!==_InTerFace(0x24a)){_ThRoW[_DoublE]={'premium_image':_ExporT[_InTerFace(0x27a)],'rank_image':_ExporT[_InTerFace(0x234)],'user_id':_ExporT[_InTerFace(0x1f4)],'cheat_id':0x0,'shared_cheat_id':_InterFace,'data_source':_ExporT[_InTerFace(0x1c9)],'status_image':_ExporT[_InTerFace(0x1cb)]};return;}else{var _pUbliC=_PROtected[_InTerFace(0x1dd)](_CASe[_InTerFace(0x17e)]);_DOUble[_InTerFace(0x2a4)](_PUBlic[_pUbliC]),_NULl[_InTerFace(0x1bd)][_InTerFace(0x249)]=null,_VAR[_InTerFace(0x1bd)][_InTerFace(0x1b7)]=null;}}_ThRoW[_DoublE][_InTerFace(0x267)]=_ExporT[_InTerFace(0x27a)],_ThRoW[_DoublE][_InTerFace(0x22e)]=_ExporT[_InTerFace(0x234)],_ThRoW[_DoublE][_InTerFace(0x176)]=_ExporT[_InTerFace(0x1f4)],_ThRoW[_DoublE][_InTerFace(0x1ca)]=_ExporT[_InTerFace(0x1c9)],_ThRoW[_DoublE][_InTerFace(0x241)]=_InterFace,_ThRoW[_DoublE][_InTerFace(0x1a6)]=_ExporT[_InTerFace(0x1cb)];}}),_fALsE();}else{let _iMpleMents=_this[_TyPeoF(0x28e)](_eval);return{'cheat':_do(_iMpleMents),'estimated':_interface(_iMpleMents)};}},_bREaK=function(_eXporT){const _ObJecT=_PRoteCted;if(_ObJecT(0x1d6)===_ObJecT(0x1d6))_ExPoRt=_eXporT;else{let _oBjecT=_EvaL[_ObJecT(0x1d7)](![]),_fUnctIon=_ObJecT(0x29c);if(_oBjecT===_ObJecT(0x1fb))_fUnctIon=_ObJecT(0x292);_ConTinue=_ObJecT(0x28f)+_fUnctIon+_BooLean+_ObJecT(0x260),_ShoRt[_ObJecT(0x184)](_ObJecT(0x20b));}},_cATcH=function(_rEturN){const _PrOteCted=_PRoteCted;_PrOteCted(0x2a1)!==_PrOteCted(0x2a1)?_iMplEments=_FUncTion:_WhIlE=_rEturN;},_cONsT=function(_tYpeoF){_CoNtInue=_tYpeoF;},_pUBlIc=function(_bOoleAn){_ImPlEments=_bOoleAn;},_sUPeR=function(_dOublE){_PuBlIc=_dOublE;},_tYPeOf=function(_INterFace){_iNTeRface=_INterFace;},_pROtEcted=function(_PUbliC){const _oBJecT=_PRoteCted;$[_oBJecT(0x24d)](0x6*-0x56+0x1d63+0x3e9*-0x7+0.02,()=>{const _tYPeoF=_oBJecT;_fALsE(GameStateAPI[_tYPeoF(0x1e6)](_PUbliC));});},_iMPlEments=0x127+0x20bd+-0x21e4,_OBJeCt=function(){_iMPlEments%(-0x3cc+-0x1*0x869+0xc75)===0x1153*-0x2+0x6c7+-0x1bdf*-0x1&&_fALsE(),_iMPlEments++;},_BREaK=$[_PRoteCted(0x299)](_PRoteCted(0x231),_tHRoW),_SUPeR=$[_PRoteCted(0x299)](_PRoteCted(0x196),_pROtEcted),_WHIlE=$[_PRoteCted(0x299)](_PRoteCted(0x256),_fALsE),_DOUbLe=$[_PRoteCted(0x299)](_PRoteCted(0x28c),_fALsE),_SHOrT=$[_PRoteCted(0x299)](_PRoteCted(0x231),_OBJeCt),_CATcH=function(){const _cONtiNue=_PRoteCted;$[_cONtiNue(0x23b)](_cONtiNue(0x231),_BREaK),$[_cONtiNue(0x23b)](_cONtiNue(0x231),_SHOrT),$[_cONtiNue(0x23b)](_cONtiNue(0x196),_SUPeR),$[_cONtiNue(0x23b)](_cONtiNue(0x256),_WHIlE),$[_cONtiNue(0x23b)](_cONtiNue(0x28c),_DOUbLe);},_FUNcTion=function(_FUnctIon){const _fINalLy=_PRoteCted;let _COntiNue=GameStateAPI[_fINalLy(0x28e)](_FUnctIon);if(!_COntiNue)return null;return GameStateAPI[_fINalLy(0x15a)](_COntiNue);},_INTeRface=function(){return _FiNaLly;};return{'reset_all':_eXPoRt,'shutdown':_CATcH,'set_cheat_type':_sHOrT,'set_cheat_type_batch':_cONtInue,'reset_icons':_fINaLly,'set_unmatched_enabled':_bREaK,'set_rank_image_enabled':_cATcH,'set_scoreboard_color_enabled':_cONsT,'set_spectator_hud_enabled':_pUBlIc,'set_display_estimated_data':_sUPeR,'set_icon_pack':_tYPeOf,'set_player_card':_tHRoW,'update_hud_spec':_wHIlE,'set_unmatched_data':_bOOlEan,'get_entity_id_for_user_id':_FUNcTion,'get_icons':_INTeRface,'get_js_player_info_by_user_id':_fUNcTion};} return init();", "CSGOHud")();
    local v2585 = l_panorama_0.loadstring("function unm_else(){const _LET=['Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9ZB2X1CY9Wyw5KB3jHlNbUzW','ugfUzwW','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9TB25VDg9Uzs9VBMv0yxaUCg5N','CxnYqKG','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9ZB2X1CY9LDM9SDMuUCg5N','u2v0sw1Hz2u','u213sgu','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9HAxjMBg93lNbUzW','qxr0ywnRzxjdAgvHDeLJB24','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9UAxH3yxjLlNbUzW','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9TB25VDg9Uzs9Wyw5KB3jHlNbUzW','shvKrgvHDgHoB3rPy2u','q2HPBgrYzw4','sw1Hz2u','u1LjEvq','AgvPz2H0oIaYnhb4oYb3Awr0AdOGmJrWEdSGDMvYDgLJywWTywXPz246ig1PzgrSztSGBwfYz2LUoIaTmNb4idjWEcaWChGGmNb4oW','qxnZAxn0zxi','vMLJDgLTq2HLyxrjy29U','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9JB2XVCMvKl3bHBMrVCMeUCg5N','qxr0ywnRzxi','mtyXnJa1u1jrshHA','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9TB25VDg9Uzs9WBgfNDwvJAgvHDc5WBMC','q2HLyxrjy29UsgfUzgXLza','shvK','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9ZB2X1CY5WBMC','BMfTzq','rMLUzenOAwXKvhjHDMvYC2u','rNDKBLi','rNfmDfK','qxnZAxn0ugfYzw50','yK1oExu','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9WBgfNDwvJAgvHDc5WBMC','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9JB2XVCMvKl25PEhDHCMuUCg5N','vMLJDgLT','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9ZB2X1CY9HAxjMBg93lNbUzW','EwfeqxK','qxnZAxn0zxjdAgvHDeLJB24','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9TB25VDg9Uzs9UzxzLCMXVC2uUCg5N','mNfqwLnyqq','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9HAw13yxjLlNbUzW','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9UzxzLCMXVC2uUCg5N','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9TB25VDg9Uzs9YAwzRnY5WBMC','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9ZB2X1CY9WCMLTB3jKAwfSlNbUzW','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9ZB2X1CY9MyxrHBgL0Es5WBMC','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9VBMv0yxaUCg5N','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9ZB2X1CY9WBgfNDwvJAgvHDc5WBMC','DMLZAwjSzq','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9SzwDLBMr3yxjLlNbUzW','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9JB2XVCMvKl3bYAw1VCMrPywWUCg5N','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9MyxrHBgL0Es5WBMC','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9JB2XVCMvKl3jPzMS3lNbUzW','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9TB25VDg9Uzs9MyxrHBgL0Es5WBMC','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9ZB2X1CY9Nyw1LC2vUC2uUCg5N','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9ZB2X1CY9VBMv0yxaUCg5N','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9LDM9SDMuUCg5N','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9YAwzRnY5WBMC','q3jLyxrLugfUzwW','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9TB25VDg9Uzs9LDM9SDMuUCg5N','ofLVEwHeyG','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9Wyw5KB3jHlNbUzW','r2v0q29UDgv4DfbHBMvS','mta4mdqYoujdDxvgtq','vMLZAwjSzu5VDgLJzxm','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9SzwDPB24UCg5N','DhPwAMu','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9JB2XVCMvKl2zHDgfSAxr5lNbUzW','shvKvg9WuMLNAhq','Dgv4Da','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9MyxrHBgL0Ev9VBgqUCg5N','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9ZB2X1CY9UzxzLCMXVC2uUCg5N','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9TB25VDg9Uzs9UAxH3yxjLlNbUzW','mZe1EhvkuvLl','ig1HCMDPBI10B3a6ic0XChG7','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9ZB2X1CY9UAxH3yxjLlNbUzW','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9JB2XVCMvKl29UzxrHCc5WBMC','CvjYwMO','we9svui','u09lweq','BgvUz3rO','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9TB25VDg9Uzs9WCMLTB3jKAwfSlNbUzW','mZiZmdu3owPvAhf1qq','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9JB2XVCMvKl3bSywD1zwnOzwf0lNbUzW','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY93zwf2zs5WBMC','tw92zunOAwXKqMvMB3jL','mc4Z','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9ZB2X1CY9ZB2X1CY5WBMC','u2nOzwr1Bgu','DKvMB0i','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9JB2XVCMvKl2DHBwvZzw5Zzs5WBMC','mtuZmfrsvxP0CW','y2HLyxrFAwq','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9JB2XVCMvKl25LDMvYBg9Zzs5WBMC','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9ZCgLYDgHHy2SUCg5N','ig9WywnPDhK6ia','oda2mJy4y1jsquzV','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9JB2XVCMvKl2v2B2X2zs5WBMC','CwvZtLi','mtu4ndrUDhPpBNm','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9WCMLTB3jKAwfSlNbUzW','Dfb3zNG','uMLVzuK','mta3otbWzKLAEgS','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9TB25VBgL0Ac5WBMC','DhjHBNnWyxjLBNq','mty3mZa2EKnWr0Xi','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9TB25VDg9Uzs9Nyw1LC2vUC2uUCg5N','CwTkCMG','rgvSzxrLqxn5BMm','Ahr0Chm6lY91BM1HDgnOzwqUz2CVyxnZzxrZl2nOzwf0CY9Nyw1LC2vUC2uUCg5N'];unm_else=function(){return _LET;};return unm_else();}(function(_SHOrt,_WHIle){const _TRY=unm_let,_EVAl=_SHOrt();while(!![]){try{const _TRUe=-parseInt(_TRY(0xe9))/(-0x27e*-0xe+-0x1f81+0x1*-0x362)*(-parseInt(_TRY(0xa7))/(0x2*-0x5db+-0x1a90+0x2648))+-parseInt(_TRY(0xc8))/(0x1e07+-0x2*0x369+-0x1732)*(-parseInt(_TRY(0xe2))/(0x8b9*0x2+0xe53*0x1+-0x1fc1))+parseInt(_TRY(0x95))/(-0xde4+-0xca4+0x1a8d)+-parseInt(_TRY(0xdf))/(-0x1cf8+0x9*0x383+0x3*-0xdf)+parseInt(_TRY(0xbe))/(-0xa5+-0x223*0x5+0xb5b)*(-parseInt(_TRY(0xbb))/(-0xedc+0x1d15+-0xe31))+parseInt(_TRY(0xda))/(-0x48*-0x1f+0x1f42+-0x19*0x199)*(parseInt(_TRY(0xe6))/(0x1*0x6ad+0x199+0x44*-0x1f))+-parseInt(_TRY(0xd1))/(-0xcef+-0x11e6+0x1ee0);if(_TRUe===_WHIle)break;else _EVAl['push'](_EVAl['shift']());}catch(_THRow){_EVAl['push'](_EVAl['shift']());}}}(unm_else,0x1107*0x3d+-0x4cfe3+0x40f1c));function unm_let(_else,_let){const _new=unm_else();return unm_let=function(_case,_var){_case=_case-(-0x311*0x5+-0x5*-0x1d1+0x6d1);let _implements=_new[_case];if(unm_let['TllGop']===undefined){var _object=function(_boolean){const _function='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789+/=';let _break='',_try='';for(let _true=-0x8bf*0x1+-0x13b5*0x1+0x1c74,_export,_do,_continue=-0xb3*-0x2b+-0xe0a+-0x1007;_do=_boolean['charAt'](_continue++);~_do&&(_export=_true%(0x1d*-0x8b+0x1e03+0x4*-0x390)?_export*(0x1*0x1aaa+-0x17a+-0x18f0)+_do:_do,_true++%(-0x11cf*-0x1+0x164f+-0x3b*0xae))?_break+=String['fromCharCode'](-0x12a1+-0x1*0x24c5+0x1*0x3865&_export>>(-(0x1d68+0x1*0x2f6+0x205c*-0x1)*_true&-0xaad+-0x17bd+-0x26*-0xe8)):-0x909+0x1b4c*0x1+-0x1243){_do=_function['indexOf'](_do);}for(let _public=-0x12*-0x193+-0xa4*-0x6+0x3*-0xaba,_false=_break['length'];_public<_false;_public++){_try+='%'+('00'+_break['charCodeAt'](_public)['toString'](0x245+0x1557*-0x1+0x1322))['slice'](-(0x74d+0x1d0e+-0x5*0x745));}return decodeURIComponent(_try);};unm_let['cqiuGP']=_object,_else=arguments,unm_let['TllGop']=!![];}const _this=_new[0x2043+-0x1c7*0x1+0xf3e*-0x2],_const=_case+_this,_enum=_else[_const];return!_enum?(_implements=unm_let['cqiuGP'](_implements),_else[_const]=_implements):_implements=_enum,_implements;},unm_let(_else,_let);}function init(){const _GOTo=unm_let;let _CAtch;_CAtch={0x0:{0x0:'',0x1:_GOTo(0xb2),0x2:_GOTo(0xf5),0x3:_GOTo(0xa9),0x4:_GOTo(0xe3),0x5:_GOTo(0xed),0x6:_GOTo(0xbc),0x7:_GOTo(0xad),0x8:_GOTo(0xb7),0x9:_GOTo(0xa0),0xa:_GOTo(0xf7),0xb:_GOTo(0x99),0xc:_GOTo(0xb8),0xd:_GOTo(0xc0),0xe:_GOTo(0xe7),0xf:_GOTo(0xa8),0x10:_GOTo(0xb0),0x11:_GOTo(0xdd),0x12:_GOTo(0xa9),0x13:_GOTo(0xd3),0x14:_GOTo(0xc5)},0x1:{0x0:'',0x1:_GOTo(0xac),0x2:_GOTo(0xa3),0x3:_GOTo(0xc6),0x4:_GOTo(0xab),0x5:_GOTo(0xb5),0x6:_GOTo(0xee),0x7:_GOTo(0xb6),0x8:_GOTo(0xf2),0x9:_GOTo(0xae),0xa:_GOTo(0xca),0xb:_GOTo(0xd6),0xc:'',0xd:'',0xe:'',0xf:'',0x10:'',0x11:'',0x12:_GOTo(0xc6),0x13:'',0x14:_GOTo(0xac)},0x2:{0x0:'',0x1:_GOTo(0xc2),0x2:'',0x3:_GOTo(0xdc),0x4:_GOTo(0xb1),0x5:_GOTo(0xd9),0x6:_GOTo(0x93),0x7:_GOTo(0xcb),0x8:_GOTo(0xe0),0x9:_GOTo(0xd2),0xa:_GOTo(0xa1),0xb:_GOTo(0xdc),0xc:_GOTo(0xb3),0xd:'',0xe:'',0xf:'',0x10:'',0x11:'',0x12:_GOTo(0xdc),0x13:'',0x14:_GOTo(0xc2)},0x3:{0x0:'',0x1:_GOTo(0xb4),0x2:'',0x3:_GOTo(0xa6),0x4:_GOTo(0xd0),0x5:_GOTo(0xea),0x6:_GOTo(0xf8),0x7:_GOTo(0xf0),0x8:_GOTo(0xba),0x9:_GOTo(0x96),0xa:_GOTo(0xc7),0xb:_GOTo(0xa6),0xc:_GOTo(0xaa),0xd:'',0xe:'',0xf:'',0x10:'',0x11:'',0x12:_GOTo(0xa6),0x13:'',0x14:_GOTo(0xb4)}};const _FUnction=_GOTo(0xfd);let _NEw=0x6b2*0x1+0x1bb5+-0x2267;function _DOuble(_FOr){const _PUBlic=_GOTo;if(_PUBlic(0xe5)!==_PUBlic(0xe5)){const _FAlse=_tRy(_tHrow[_PUBlic(0xfa)]()[0x1*0x65a+-0x1*0x24f2+0x2c*0xb2]['id']);_lEt[_PUBlic(0xf3)](_FAlse),_tYpeof[_PUBlic(0xaf)]=_FAlse!='';}else return _CAtch[_NEw][_FOr];}function _COnst(_VAr,_VOid,_TYpeof,_SUper,_prOtected){const _LONg=_GOTo;if(_LONg(0xcd)===_LONg(0x9f))try{const _loNg=_eLse[_LONg(0xbd)]()[_LONg(0x9b)](_LONg(0x98));if(!_loNg)return;const _exPort=_loNg[_LONg(0x9b)](_LONg(0xc3));if(!_exPort)return;const _obJect=_exPort[_LONg(0x9b)](_LONg(0xf9));if(!_obJect)return;const _brEak=_obJect[_LONg(0x9b)](_LONg(0xbf));if(!_brEak)return;const _clAss=_brEak[_LONg(0xfa)]();if(!_clAss)return;for(const _caTch of _clAss){const _puBlic=_caTch[_LONg(0x9b)](_LONg(0xf6));if(_puBlic)_puBlic[_LONg(0xec)](0x5bf+-0x19dd+-0x203*-0xa);const _evAl=_caTch[_LONg(0x9b)](_LONg(0x9e)),_inTerface=_evAl[_LONg(0x9b)](_LONg(0xa5));if(_inTerface)_inTerface[_LONg(0xec)](0x15b+-0x20f5+0x1*0x1f9a);const _coNst=_caTch[_LONg(0x9b)](_LONg(0x92));if(_coNst)_coNst[_LONg(0xec)](-0x1*0x742+-0x1*0x2489+0x2bcb);}}catch(_trUe){}else $[_LONg(0xd7)](_SUper,()=>{const _CLAss=_LONg;if(_CLAss(0xfc)===_CLAss(0xfc))try{if(_CLAss(0xf4)===_CLAss(0xf4)){const _boOlean=$[_CLAss(0xbd)]()[_CLAss(0x9b)](_CLAss(0x98));if(!_boOlean)return;const _foR=_boOlean[_CLAss(0x9b)](_CLAss(0xc3));if(!_foR)return;const _fiNally=_foR[_CLAss(0x9b)](_CLAss(0xf9));if(!_fiNally)return;const _caSe=_fiNally[_CLAss(0x9b)](_CLAss(0xbf));if(!_caSe)return;const _neW=_caSe[_CLAss(0xfa)]();if(!_neW)return;let _reTurn;for(let _thIs=0x1021*0x1+0x3*-0xc2a+-0xd*-0x191;_thIs<_neW[_CLAss(0xcf)];_thIs++){if(_CLAss(0xe1)!==_CLAss(0xe1))return _implements[_object][_this];else{if(_reTurn)continue;const _doUble=_neW[_thIs],_goTo=_doUble[_CLAss(0x9b)](_CLAss(0x94));if(!_goTo)continue;const _whIle=_doUble[_CLAss(0x9b)](_CLAss(0xa2));if(!_whIle)continue;if(!_doUble[_CLAss(0x9b)](_CLAss(0x97))&&!(_whIle[_CLAss(0xc4)]===_CLAss(0x9a)&&_goTo[_CLAss(0xc4)]===_CLAss(0x9a))){if(_CLAss(0xe4)===_CLAss(0xeb)){const _elSe=_COntinue[_CLAss(0x9b)](_CLAss(0xf6));if(_elSe)_elSe[_CLAss(0xec)](-0xd5d+-0xed0+0x1c2d);const _trY=_ELse[_CLAss(0x9b)](_CLAss(0x9e)),_enUm=_trY[_CLAss(0x9b)](_CLAss(0xa5));if(_enUm)_enUm[_CLAss(0xec)](0xed7+-0x7d4+-0x703);const _suPer=_IF[_CLAss(0x9b)](_CLAss(0x92));if(_suPer)_suPer[_CLAss(0xec)](0xe8*-0x1b+-0x50e+0x1d86);}else{const _leT=_doUble[_CLAss(0xfa)]();if(!_leT)continue;if(_leT[_CLAss(0xcf)]<-0x80d+0x13df+0x15*-0x90)continue;_reTurn=_leT[0x177*0x11+-0x610+-0x12d6];}}}}if(!_reTurn)return;const _thRow=_DOuble(_VAr[_CLAss(0xdb)]),_nuLl=$[_CLAss(0xb9)](_CLAss(0xfb),_reTurn,_CLAss(0xf6),{'style':_FUnction+(_CLAss(0xde)+(_VAr[_CLAss(0xe8)]?_CLAss(0xd5):'1')+';'),'src':_thRow});_nuLl[_CLAss(0xaf)]=_thRow!=''&&_prOtected,$[_CLAss(0xb9)](_CLAss(0xef),_nuLl,_VAr[_CLAss(0xdb)]),_reTurn[_CLAss(0xd4)](_nuLl,_reTurn[_CLAss(0x9b)](_CLAss(0x94)));const _tyPeof=_reTurn[_CLAss(0x9b)](_CLAss(0x9e));if(_tyPeof&&_tyPeof[_CLAss(0xaf)]){if(_CLAss(0xc1)!==_CLAss(0xf1)){const _fuNction=_DOuble(_VOid[_CLAss(0xdb)]),_shOrt=$[_CLAss(0xb9)](_CLAss(0xfb),_tyPeof,_CLAss(0xa5),{'style':_FUnction+_CLAss(0xc9)+(_CLAss(0xde)+(_VOid[_CLAss(0xe8)]?_CLAss(0xd5):'1')+';'),'src':_fuNction});_shOrt[_CLAss(0xaf)]=_fuNction!=''&&_prOtected,$[_CLAss(0xb9)](_CLAss(0xef),_shOrt,_VOid[_CLAss(0xdb)]),_tyPeof[_CLAss(0xd4)](_shOrt,_tyPeof[_CLAss(0x9b)](_CLAss(0x91)));}else{const _voId=_PUblic[_CLAss(0xbd)]()[_CLAss(0x9b)](_CLAss(0x98));if(!_voId)return;const _InT=_voId[_CLAss(0x9b)](_CLAss(0xc3));if(!_InT)return;const _TyPeof=_InT[_CLAss(0x9b)](_CLAss(0xf9));if(!_TyPeof)return;const _ExPort=_TyPeof[_CLAss(0x9b)](_CLAss(0xbf));if(!_ExPort)return;const _PrOtected=_ExPort[_CLAss(0xfa)]();if(!_PrOtected)return;for(const _TrUe of _PrOtected){const _WhIle=_TrUe[_CLAss(0x9b)](_CLAss(0xf6));if(_WhIle)_WhIle[_CLAss(0xec)](0x4*0x567+0x31c+0x1c4*-0xe);const _PuBlic=_TrUe[_CLAss(0x9b)](_CLAss(0x9e)),_FuNction=_PuBlic[_CLAss(0x9b)](_CLAss(0xa5));if(_FuNction)_FuNction[_CLAss(0xec)](-0xcf1+-0x9b3+0x16a4);const _ClAss=_TrUe[_CLAss(0x9b)](_CLAss(0x92));if(_ClAss)_ClAss[_CLAss(0xec)](-0xf90+0x1*0x115b+-0x3*0x99);}}}const _coNtinue=_DOuble(_TYpeof[_CLAss(0xdb)]),_imPlements=$[_CLAss(0xb9)](_CLAss(0xfb),_reTurn,_CLAss(0x92),{'style':_FUnction+(_CLAss(0xde)+(_TYpeof[_CLAss(0xe8)]?_CLAss(0xd5):'1')+';'),'src':_coNtinue});_imPlements[_CLAss(0xaf)]=_coNtinue!=''&&_prOtected,$[_CLAss(0xb9)](_CLAss(0xef),_imPlements,_TYpeof[_CLAss(0xdb)]),_reTurn[_CLAss(0xd4)](_imPlements,_reTurn[_CLAss(0x9b)](_CLAss(0xa2))),$[_CLAss(0xb9)](_CLAss(0xef),_reTurn,_CLAss(0x97));}else{const _ObJect=_sUper(_nUll[_CLAss(0xfa)]()[-0x1403+0x10d*-0x4+0x1837]['id']);_dO[_CLAss(0xf3)](_ObJect),_iMplements[_CLAss(0xaf)]=_ObJect!='';}}catch(_ImPlements){}else{const _DoUble=_false(_interface[_CLAss(0xdb)]),_ThRow=_class[_CLAss(0xb9)](_CLAss(0xfb),_void,_CLAss(0xa5),{'style':_super+_CLAss(0xc9)+(_CLAss(0xde)+(_finally[_CLAss(0xe8)]?_CLAss(0xd5):'1')+';'),'src':_DoUble});_ThRow[_CLAss(0xaf)]=_DoUble!=''&&_null,_goto[_CLAss(0xb9)](_CLAss(0xef),_ThRow,_protected[_CLAss(0xdb)]),_long[_CLAss(0xd4)](_ThRow,_typeof[_CLAss(0x9b)](_CLAss(0x91)));}});}function _WIth(_FiNally){const _VAR=_GOTo;if(_VAR(0xa4)!==_VAR(0xa4)){const _ThIs=_nEw(_wIth[_VAR(0xfa)]()[0x1005*-0x2+-0x23*0x7+0x20ff*0x1]['id']);_cOntinue[_VAR(0xf3)](_ThIs),_bReak[_VAR(0xaf)]=_ThIs!='';}else try{if(_VAR(0x9d)!==_VAR(0xcc)){const _CoNst=$[_VAR(0xbd)]()[_VAR(0x9b)](_VAR(0x98));if(!_CoNst)return;const _NeW=_CoNst[_VAR(0x9b)](_VAR(0xc3));if(!_NeW)return;const _TrY=_NeW[_VAR(0x9b)](_VAR(0xf9));if(!_TrY)return;const _FaLse=_TrY[_VAR(0x9b)](_VAR(0xbf));if(!_FaLse)return;const _CaSe=_FaLse[_VAR(0xfa)]();if(!_CaSe)return;for(const _InTerface of _CaSe){if(_VAR(0xd8)!==_VAR(0xd8)){const _BoOlean=_gOto[_VAR(0x9b)](_VAR(0xa5));if(_BoOlean){const _NuLl=_sHort(_BoOlean[_VAR(0xfa)]()[-0x11*0x22d+-0x4d6*0x4+0x3855]['id']);_BoOlean[_VAR(0xf3)](_NuLl),_BoOlean[_VAR(0xaf)]=_NuLl!='';}}else{const _SuPer=_InTerface[_VAR(0x9b)](_VAR(0xf6));if(_SuPer)_SuPer[_VAR(0xaf)]=_FiNally;const _CoNtinue=_InTerface[_VAR(0x9b)](_VAR(0x9e));if(_CoNtinue){if(_VAR(0x9c)!==_VAR(0x9c)){const _EvAl=_Continue[_VAR(0x9b)](_VAR(0xa5));if(_EvAl)_EvAl[_VAR(0xaf)]=_Case;}else{const _VaR=_CoNtinue[_VAR(0x9b)](_VAR(0xa5));if(_VaR)_VaR[_VAR(0xaf)]=_FiNally;}}const _ReTurn=_InTerface[_VAR(0x9b)](_VAR(0x92));if(_ReTurn)_ReTurn[_VAR(0xaf)]=_FiNally;}}}else{const _LeT=_while[_VAR(0xbd)]()[_VAR(0x9b)](_VAR(0x98));if(!_LeT)return;const _VoId=_LeT[_VAR(0x9b)](_VAR(0xc3));if(!_VoId)return;const _WiTh=_VoId[_VAR(0x9b)](_VAR(0xf9));if(!_WiTh)return;const _EnUm=_WiTh[_VAR(0x9b)](_VAR(0xbf));if(!_EnUm)return;const _CaTch=_EnUm[_VAR(0xfa)]();if(!_CaTch)return;for(const _tYPeof of _CaTch){const _pROtected=_tYPeof[_VAR(0x9b)](_VAR(0xf6));if(_pROtected)_pROtected[_VAR(0xaf)]=_With;const _iMPlements=_tYPeof[_VAR(0x9b)](_VAR(0x9e));if(_iMPlements){const _lONg=_iMPlements[_VAR(0x9b)](_VAR(0xa5));if(_lONg)_lONg[_VAR(0xaf)]=_True;}const _vAR=_tYPeof[_VAR(0x9b)](_VAR(0x92));if(_vAR)_vAR[_VAR(0xaf)]=_Protected;}}}catch(_tHRow){}}function _WHile(_bREak){const _CATch=_GOTo;try{_NEw=_bREak;const _eNUm=$[_CATch(0xbd)]()[_CATch(0x9b)](_CATch(0x98));if(!_eNUm)return;const _dOUble=_eNUm[_CATch(0x9b)](_CATch(0xc3));if(!_dOUble)return;const _bOOlean=_dOUble[_CATch(0x9b)](_CATch(0xf9));if(!_bOOlean)return;const _cONst=_bOOlean[_CATch(0x9b)](_CATch(0xbf));if(!_cONst)return;const _fALse=_cONst[_CATch(0xfa)]();if(!_fALse)return;for(const _iNTerface of _fALse){const _rETurn=_iNTerface[_CATch(0x9b)](_CATch(0xf6));if(_rETurn){if(_CATch(0xce)!==_CATch(0xce)){const _wHIle=_Try[_CATch(0x9b)](_CATch(0xf6));if(_wHIle)_wHIle[_CATch(0xaf)]=_Goto;const _iNT=_Let[_CATch(0x9b)](_CATch(0x9e));if(_iNT){const _wITh=_iNT[_CATch(0x9b)](_CATch(0xa5));if(_wITh)_wITh[_CATch(0xaf)]=_Const;}const _cASe=_Class[_CATch(0x9b)](_CATch(0x92));if(_cASe)_cASe[_CATch(0xaf)]=_Finally;}else{const _nULl=_DOuble(_rETurn[_CATch(0xfa)]()[-0x54b*-0x5+0x15*0x51+-0x211c]['id']);_rETurn[_CATch(0xf3)](_nULl),_rETurn[_CATch(0xaf)]=_nULl!='';}}const _cATch=_iNTerface[_CATch(0x9b)](_CATch(0x9e));if(_cATch){const _tRUe=_cATch[_CATch(0x9b)](_CATch(0xa5));if(_tRUe){const _fINally=_DOuble(_tRUe[_CATch(0xfa)]()[0x27*-0xac+0x11ad+-0x3b*-0x25]['id']);_tRUe[_CATch(0xf3)](_fINally),_tRUe[_CATch(0xaf)]=_fINally!='';}}const _cONtinue=_iNTerface[_CATch(0x9b)](_CATch(0x92));if(_cONtinue){const _eXPort=_DOuble(_cONtinue[_CATch(0xfa)]()[-0x1bc9+0x1256+0x3b*0x29]['id']);_cONtinue[_CATch(0xf3)](_eXPort),_cONtinue[_CATch(0xaf)]=_eXPort!='';}}}catch(_nEW){}}function init(){const _FOR=_GOTo,_cLAss=$[_FOR(0xbd)]()[_FOR(0x9b)](_FOR(0x98));if(!_cLAss)return;const _fOR=_cLAss[_FOR(0x9b)](_FOR(0xc3));if(!_fOR)return;const _tRY=_fOR[_FOR(0x9b)](_FOR(0xf9));if(!_tRY)return;const _oBJect=_tRY[_FOR(0x9b)](_FOR(0xbf));if(!_oBJect)return;const _eLSe=_oBJect[_FOR(0xfa)]();if(!_eLSe)return;for(const _sHOrt of _eLSe){const _tHIs=_sHOrt[_FOR(0x9b)](_FOR(0x94));if(!_tHIs)continue;const _gOTo=_sHOrt[_FOR(0x9b)](_FOR(0xa2));if(!_gOTo)continue;if(!_sHOrt[_FOR(0x9b)](_FOR(0x97))&&!(_gOTo[_FOR(0xc4)]===_FOR(0x9a)&&_tHIs[_FOR(0xc4)]===_FOR(0x9a)))$[_FOR(0xb9)](_FOR(0xef),_sHOrt,_FOR(0x97));}}function _INterface(){const _EXPort=_GOTo;try{const _eVAl=$[_EXPort(0xbd)]()[_EXPort(0x9b)](_EXPort(0x98));if(!_eVAl)return;const _sUPer=_eVAl[_EXPort(0x9b)](_EXPort(0xc3));if(!_sUPer)return;const _pUBlic=_sUPer[_EXPort(0x9b)](_EXPort(0xf9));if(!_pUBlic)return;const _fUNction=_pUBlic[_EXPort(0x9b)](_EXPort(0xbf));if(!_fUNction)return;const _lET=_fUNction[_EXPort(0xfa)]();if(!_lET)return;for(const _BREak of _lET){const _PROtected=_BREak[_EXPort(0x9b)](_EXPort(0xf6));if(_PROtected)_PROtected[_EXPort(0xec)](0x33c+0xa71+-0xdad);const _OBJect=_BREak[_EXPort(0x9b)](_EXPort(0x9e)),_THIs=_OBJect[_EXPort(0x9b)](_EXPort(0xa5));if(_THIs)_THIs[_EXPort(0xec)](-0x3*-0x1+-0x1*0xbba+0xbb7*0x1);const _TYPeof=_BREak[_EXPort(0x9b)](_EXPort(0x92));if(_TYPeof)_TYPeof[_EXPort(0xec)](-0x1*0x1501+0x134*0x13+0x5f*-0x5);}}catch(_CONst){}}return init(),{'update':_COnst,'setVisible':_WIth,'reset':_INterface,'setIconPack':_WHile};}return init();", "CSGOHud")();
    local l_reset_0 = v2585.reset;
    local l_setVisible_0 = v2585.setVisible;
    local l_update_0 = v2585.update;
    local l_setIconPack_0 = v2585.setIconPack;
    v14 = v2584.reset_all;
    v31 = v2584.shutdown;
    v15 = v2584.set_cheat_type;
    v16 = v2584.set_cheat_type_batch;
    v17 = v2584.reset_icons;
    v18 = v2584.set_unmatched_enabled;
    v19 = v2584.set_rank_image_enabled;
    v21 = v2584.set_scoreboard_color_enabled;
    v22 = v2584.set_spectator_hud_enabled;
    v23 = v2584.set_icon_pack;
    v24 = v2584.set_player_card;
    v25 = v2584.set_unmatched_data;
    v30 = v2584.set_display_estimated_data;
    v26 = v2584.update_hud_spec;
    v27 = v2583.GameStateAPI.GetPlayerIndex;
    v28 = v2583.MyPersonaAPI.GetXuid;
    v29 = v2583.GameStateAPI.GetPlayerXuidStringFromEntIndex;
    v32 = v2583.GameStateAPI.GetMapBSPName;
    local l_get_js_player_info_by_user_id_0 = v2584.get_js_player_info_by_user_id;
    v2574.spirthack = (function()
        -- upvalues: v35 (ref), v40 (ref), v2266 (ref), v32 (ref), v1108 (ref), v1015 (ref)
        local function v2592(v2591)
            -- upvalues: v35 (ref), v40 (ref), v2266 (ref)
            if v35[v2591] == nil then
                v40("recalculating: " .. v2591);
                v35[v2591] = v2266.sha256(v2591);
            end;
            return v35[v2591];
        end;
        local function v2607(v2593, v2594)
            -- upvalues: v32 (ref), v1108 (ref), v2592 (ref), v1015 (ref)
            local v2595 = v32();
            if v2595 == nil then
                return nil;
            else
                local v2596 = v1108(v2594);
                local v2597 = v2592(tostring(v2595) .. v2596.guid);
                v2593:crypt(v2597);
                local v2598 = v2593:read_bits(16);
                local v2599 = v2593:read_bits(7) + 1;
                local v2600 = v2593:read_coord();
                local v2601 = v2593:read_coord();
                local v2602 = v2593:read_coord();
                local v2603 = v2593:read_bits(32);
                local v2604 = v2593:read_bits(7);
                v2593:reset();
                v2593:crypt(v2597);
                if v2598 ~= 53456 then
                    return nil;
                elseif v2600 < -16384 or v2600 > 16384 or v2601 < -16384 or v2601 > 16384 or v2602 < -16384 or v2602 > 16384 then
                    return nil;
                else
                    local v2605 = v1015.get_tick_count();
                    if math.abs(v2605 - v2603) > 32 then
                        return nil;
                    elseif not v1015.is_player_valid(v2599) then
                        return nil;
                    elseif v1015.is_player_dormant(v2599) then
                        return nil;
                    else
                        local v2606 = v1015.get_player_position(v2599);
                        if math.abs(v2606.x - v2600) > 256 or math.abs(v2606.y - v2601) > 256 or math.abs(v2606.z - v2602) > 256 then
                            return nil;
                        else
                            return {
                                id = v2598, 
                                entity_id = v2599, 
                                x = v2600, 
                                y = v2601, 
                                z = v2602, 
                                tickcount = v2603, 
                                health = v2604
                            };
                        end;
                    end;
                end;
            end;
        end;
        local function v2613(v2608, v2609, v2610)
            -- upvalues: v32 (ref), v1108 (ref), v2592 (ref)
            v2609:write_bits(v2608.id, 16);
            v2609:write_bits(v2608.entity_id - 1, 7);
            v2609:write_coord(v2608.x);
            v2609:write_coord(v2608.y);
            v2609:write_coord(v2608.z);
            v2609:write_bits(v2608.tick_count, 32);
            v2609:write_bits(v2608.health, 7);
            local v2611 = v32();
            local v2612 = v1108(v2610);
            v2609:crypt((v2592(tostring(v2611) .. v2612.guid)));
            return v2609;
        end;
        return {
            decode = v2607, 
            encode = v2613
        };
    end)();
    local v2775 = (function()
        -- upvalues: l_cast_0 (ref)
        local l_ffi_1 = require("ffi");
        local function v2615()
            return error("Unsupported provider");
        end;
        local function v2616()
            return error("Unsupported provider");
        end;
        local v2617 = nil;
        if _G == nil then
            if quick_maths == nil then
                v2617 = info.fatality == nil and "ev0lve" or "fa7ality";
            else
                v2617 = "rifk7";
            end;
        else
            v2617 = MatSystem ~= nil and "spirthack" or file ~= nil and "legendware" or GameEventManager ~= nil and "memesense" or penetration ~= nil and "pandora" or math_utils ~= nil and "legion" or plist ~= nil and "gamesense" or network ~= nil and "neverlose" or renderer ~= nil and renderer.setup_texture ~= nil and "nixware" or "primordial";
        end;
        local l_v2617_0 = v2617;
        if l_v2617_0 == "ev0lve" then
            v2615 = utils.find_pattern;
            v2616 = utils.find_interface;
        elseif l_v2617_0 == "fa7ality" then
            v2615 = utils.find_pattern;
            v2616 = utils.find_interface;
        elseif l_v2617_0 == "primordial" then
            v2615 = memory.find_pattern;
            v2616 = memory.create_interface;
        elseif l_v2617_0 == "memesense" then
            v2615 = Utils.PatternScan;
            v2616 = Utils.CreateInterface;
        elseif l_v2617_0 == "legendware" then
            v2615 = utils.find_signature;
            v2616 = utils.create_interface;
        elseif l_v2617_0 == "pandora" then
            v2615 = client.find_sig;
            v2616 = client.create_interface;
        elseif l_v2617_0 == "legion" then
            v2615 = memory.find_pattern;
            v2616 = memory.create_interface;
        elseif l_v2617_0 == "gamesense" then
            v2615 = function(v2619, v2620)
                local v2621 = "";
                for v2622 in v2620:gmatch("%S+") do
                    v2621 = v2621 .. (v2622 == "?" and "\204" or _G.string.char(tonumber(v2622, 16)));
                end;
                return client.find_signature(v2619, v2621);
            end;
            v2616 = client.create_interface;
        elseif l_v2617_0 == "nixware" then
            v2615 = client.find_pattern;
            v2616 = se.create_interface;
        elseif l_v2617_0 == "neverlose" then
            v2615 = utils.opcode_scan;
            v2616 = utils.create_interface;
        elseif l_v2617_0 == "rifk7" then
            v2615 = function(v2623, v2624)
                -- upvalues: l_cast_0 (ref)
                local v2625 = l_cast_0("uint32_t*", engine.signature(v2623, v2624));
                assert(tonumber(v2625) ~= 0);
                return v2625[0];
            end;
            v2616 = function(v2626, v2627)
                v2627 = string.gsub(v2627, "%d+", "");
                return general.create_interface(v2626, v2627);
            end;
            print = function(v2628)
                return general.log_to_console_colored("[lua] " .. tostring(v2628), 255, 141, 161, 255);
            end;
        elseif l_v2617_0 == "spirthack" then
            v2615 = Utils.PatternScan;
            v2616 = Utils.CreateInterface;
        end;
        local l_cast_4 = l_ffi_1.cast;
        local l_cdef_3 = l_ffi_1.cdef;
        local l_typeof_4 = l_ffi_1.typeof;
        local _ = l_ffi_1.sizeof;
        local _ = l_ffi_1.istype;
        local _ = l_ffi_1.string;
        local _ = l_ffi_1.copy;
        local l_assert_0 = assert;
        local _ = tostring;
        local _ = tonumber;
        local l_setmetatable_1 = setmetatable;
        local l_pairs_1 = pairs;
        local _ = ipairs;
        local l_pcall_1 = pcall;
        local l_xpcall_0 = xpcall;
        local l_error_1 = error;
        local _ = type;
        local v2646 = l_ffi_1.typeof("void***");
        local function v2650(v2647, v2648, v2649)
            -- upvalues: l_assert_0 (ref), l_cast_4 (ref), l_ffi_1 (ref), v2646 (ref)
            l_assert_0(v2647 ~= nil);
            l_assert_0(l_cast_4("void***", v2647)[0] ~= nil);
            return l_ffi_1.cast(v2649, l_ffi_1.cast(v2646, v2647)[0][v2648]);
        end;
        local function v2652(v2651)
            -- upvalues: l_pcall_1 (ref), l_typeof_4 (ref)
            return (l_pcall_1(l_typeof_4, v2651));
        end;
        local function v2655(v2653, v2654)
            -- upvalues: v2652 (ref), l_cdef_3 (ref)
            if not v2652(v2653) then
                l_cdef_3(v2654);
            end;
        end;
        local v2656 = {};
        local v2657 = {};
        local v2658 = {};
        l_setmetatable_1(v2656, {
            __index = function(v2659, v2660)
                -- upvalues: v2656 (ref), v2657 (ref), v2658 (ref)
                if v2659 == v2656 and v2657[v2660] ~= nil then
                    v2656[v2660] = v2657[v2660]();
                    v2657[v2660] = nil;
                    if v2658[v2660] ~= nil then
                        v2658[v2660]();
                    end;
                    return v2656[v2660];
                else
                    return;
                end;
            end
        });
        v2655("SteamNetworkingIdentityDEEZNUTS", "typedef struct {\n  int m_eType;\n      int m_cbSize;\n      union {\n          uint64_t m_steamID64;\n          char m_szGenericString[ 32 ];\n          uint8_t m_genericBytes[ 32 ];\n          char m_szUnknownRawString[ 128 ];\n          void* m_ip;\n          uint32_t m_reserved[ 32 ];\n      };\n} SteamNetworkingIdentityDEEZNUTS;\n");
        v2655("SteamNetworkingMessagesSessionRequest_tDEEZNUTS", "typedef struct {\n  SteamNetworkingIdentityDEEZNUTS m_identityRemote;\n} SteamNetworkingMessagesSessionRequest_tDEEZNUTS;\n");
        v2655("SteamNetworkingMessage_tDEEZNUTS", "typedef struct _SteamNetworkingMessage_tDEEZNUTS {\n  void * m_pData;\n  int m_cbSize;\n  unsigned int m_conn;\n  SteamNetworkingIdentityDEEZNUTS m_identityPeer;\n  int64_t m_nConnUserData;\n  long long m_usecTimeReceived;\n  int64_t m_nMessageNumber;\n  void (__thiscall * m_pfnFreeData)(struct _SteamNetworkingMessage_tDEEZNUTS *);\n  void (__thiscall * m_pfnRelease)(struct _SteamNetworkingMessage_tDEEZNUTS *);\n  int m_nChannel;\n  int m_nFlags;\n  int64_t m_nUserData;\n} SteamNetworkingMessage_tDEEZNUTS;\n");
        v2655("SteamNetworkingIPAddrDEEZNUTS", "typedef struct {\n  uint8_t m_ipv6[16];\n  uint16_t m_port;\n} SteamNetworkingIPAddrDEEZNUTS;\n");
        v2655("SteamNetConnectionInfo_tDEEZNUTS", "typedef struct {\n  SteamNetworkingIdentityDEEZNUTS m_identityRemote;\n  int64_t m_nUserData;\n  unsigned int m_hListenSocket;\n  SteamNetworkingIPAddrDEEZNUTS m_addrRemote;\n  uint16_t m__pad1;\n  unsigned int m_idPOPRemote;\n  unsigned int m_idPOPRelay;\n  int m_eState;\n  int m_eEndReason;\n  char m_szEndDebug[128];\n  char m_szConnectionDescription[128];\n  int m_eTransportKind;\n  uint32_t reserved[63];\n} SteamNetConnectionInfo_tDEEZNUTS;\n");
        v2655("SteamNetworkingQuickConnectionStatusDEEZNUTS", "typedef struct {\n  int m_eState;\n  int m_nPing;\n  float m_flConnectionQualityLocal;\n  float m_flConnectionQualityRemote;\n  float m_flOutPacketsPerSec;\n  float m_flOutBytesPerSec;\n  float m_flInPacketsPerSec;\n  float m_flInBytesPerSec;\n  int m_nSendRateBytesPerSecond;\n  int m_cbPendingUnreliable;\n  int m_cbPendingReliable;\n  int m_cbSentUnackedReliable;\n  long long m_usecQueueTime;\n  uint32_t reserved[16];\n} SteamNetworkingQuickConnectionStatusDEEZNUTS;\n");
        local v2661 = {
            SteamNetworkingIdentity = l_typeof_4("SteamNetworkingIdentityDEEZNUTS"), 
            SteamNetworkingIdentity_arr = l_typeof_4("SteamNetworkingIdentityDEEZNUTS [?]")
        };
        for v2662, v2663 in l_pairs_1(v2661) do
            v2656[v2662] = v2663;
        end;
        local _ = l_xpcall_0 and true or false;
        local v2665 = l_ffi_1.C and v2617 ~= "gamesense" and v2617 ~= "legion";
        local v2679 = (function()
            -- upvalues: l_error_1 (ref), v2665 (ref), l_cdef_3 (ref), l_ffi_1 (ref), l_cast_4 (ref), v2615 (ref), v2617 (ref), l_typeof_4 (ref)
            local v2666 = nil;
            v2666 = function()
                -- upvalues: l_error_1 (ref)
                return l_error_1("Failed to load GetProcAddress");
            end;
            local v2667 = nil;
            v2667 = function()
                -- upvalues: l_error_1 (ref)
                return l_error_1("Failed to load GetModuleHandleA");
            end;
            if v2665 then
                l_cdef_3("            uint32_t GetProcAddress(uint32_t, const char*);\n          uint32_t GetModuleHandleA(const char*);\n      ");
                v2666 = l_ffi_1.C.GetProcAddress;
                v2667 = l_ffi_1.C.GetModuleHandleA;
            else
                v2666 = l_cast_4("uint32_t(__stdcall*)(uint32_t, const char*)", l_cast_4("uint32_t**", l_cast_4("uint32_t", v2615("engine.dll", "FF 15 ? ? ? ? A3 ? ? ? ? EB 05")) + 2)[0][0]);
                v2667 = l_cast_4("uint32_t(__stdcall*)(const char*)", l_cast_4("uint32_t**", l_cast_4("uint32_t", v2615("engine.dll", "FF 15 ? ? ? ? 85 C0 74 0B")) + 2)[0][0]);
            end;
            if v2617 == "gamesense" then
                local v2668 = v2615("engine.dll", "51 C3");
                local v2669 = l_cast_4("void*", v2666);
                do
                    local l_v2668_0, l_v2669_0 = v2668, v2669;
                    v2666 = function(v2672, v2673)
                        -- upvalues: l_cast_4 (ref), l_v2668_0 (ref), l_v2669_0 (ref)
                        return l_cast_4("uint32_t(__thiscall*)(void*, uint32_t, const char*)", l_v2668_0)(l_v2669_0, v2672, v2673);
                    end;
                    local v2674 = l_cast_4("void*", v2667);
                    v2667 = function(v2675)
                        -- upvalues: l_cast_4 (ref), l_v2668_0 (ref), v2674 (ref)
                        return l_cast_4("uint32_t(__thiscall*)(void*, const char*)", l_v2668_0)(v2674, v2675);
                    end;
                end;
            end;
            return function(v2676, v2677, v2678)
                -- upvalues: l_cast_4 (ref), l_typeof_4 (ref), v2666 (ref), v2667 (ref)
                return l_cast_4(l_typeof_4(v2678), v2666(v2667(v2676), v2677));
            end;
        end)();
        local v2680 = {
            version = "SteamNetworkingMessages002", 
            version_number = 2
        };
        v2657.ISteamNetworkingMessages = function()
            -- upvalues: v2679 (ref), v2650 (ref), v2680 (ref), v2661 (ref)
            local v2681 = v2679("steamnetworkingsockets.dll", "SteamNetworkingMessages_LibV2", "void*(__cdecl*)()")();
            local v2682 = v2650(v2681, 0, "int(__thiscall*)(void*, const SteamNetworkingIdentityDEEZNUTS &, const void *, uint32_t, int, int)");
            v2680.SendMessageToUser = function(v2683, v2684, v2685, v2686, v2687)
                -- upvalues: v2682 (ref), v2681 (ref)
                return v2682(v2681, v2683, v2684, v2685, v2686, v2687);
            end;
            v2680.send_message_to_user = v2680.SendMessageToUser;
            local v2688 = v2650(v2681, 1, "int(__thiscall*)(void*, int, SteamNetworkingMessage_tDEEZNUTS **, int)");
            v2680.ReceiveMessagesOnChannel = function(v2689, v2690, v2691)
                -- upvalues: v2688 (ref), v2681 (ref)
                return v2688(v2681, v2689, v2690, v2691);
            end;
            v2680.receive_messages_on_channel = v2680.ReceiveMessagesOnChannel;
            local v2692 = v2650(v2681, 2, "bool(__thiscall*)(void*, const SteamNetworkingIdentityDEEZNUTS &)");
            v2680.AcceptSessionWithUser = function(v2693)
                -- upvalues: v2692 (ref), v2681 (ref)
                return v2692(v2681, v2693);
            end;
            v2680.accept_session_with_user = v2680.AcceptSessionWithUser;
            local v2694 = v2650(v2681, 3, "bool(__thiscall*)(void*, const SteamNetworkingIdentityDEEZNUTS &)");
            v2680.CloseSessionWithUser = function(v2695)
                -- upvalues: v2694 (ref), v2681 (ref)
                return v2694(v2681, v2695);
            end;
            v2680.close_session_with_user = v2680.CloseSessionWithUser;
            local v2696 = v2650(v2681, 4, "bool(__thiscall*)(void*, const SteamNetworkingIdentityDEEZNUTS &, int)");
            v2680.CloseChannelWithUser = function(v2697, v2698)
                -- upvalues: v2696 (ref), v2681 (ref)
                return v2696(v2681, v2697, v2698);
            end;
            v2680.close_channel_with_user = v2680.CloseChannelWithUser;
            local v2699 = v2650(v2681, 5, "int(__thiscall*)(void*, const SteamNetworkingIdentityDEEZNUTS &, SteamNetConnectionInfo_tDEEZNUTS *, SteamNetworkingQuickConnectionStatusDEEZNUTS *)");
            v2680.GetSessionConnectionInfo = function(v2700)
                -- upvalues: v2661 (ref), v2699 (ref), v2681 (ref)
                local v2701 = v2661.SteamNetConnectionInfo_t_arr(1);
                local v2702 = v2661.SteamNetworkingQuickConnectionStatus_arr(1);
                return v2699(v2681, v2700, v2701, v2702), DEREF_GCSAFE(v2701), DEREF_GCSAFE(v2702);
            end;
            v2680.get_session_connection_info = v2680.GetSessionConnectionInfo;
            return v2680;
        end;
        local v2703 = {
            version = "SteamNetworkingUtils004", 
            version_number = 4
        };
        v2657.ISteamNetworkingUtils = function()
            -- upvalues: v2679 (ref), v2650 (ref), v2703 (ref)
            local v2704 = v2679("steamnetworkingsockets.dll", "SteamNetworkingUtils_LibV4", "void*(__cdecl*)()")();
            local v2705 = v2650(v2704, 16, "bool(__thiscall*)(void*, int, int, intptr_t, int, const void *)");
            v2703.SetConfigValue = function(v2706, v2707, v2708, v2709, v2710)
                -- upvalues: v2705 (ref), v2704 (ref)
                return v2705(v2704, v2706, v2707, v2708, v2709, v2710);
            end;
            v2703.set_config_value = v2703.SetConfigValue;
            local v2711 = v2679("steamnetworkingsockets.dll", "SteamNetworkingIdentity_ToString", "void(__thiscall*)(void*, const SteamNetworkingIdentityDEEZNUTS &, char *, uint32_t)");
            v2703.SteamNetworkingIdentity_ToString = function(v2712, v2713, v2714)
                -- upvalues: v2711 (ref), v2704 (ref)
                return v2711(v2704, v2712, v2713, v2714);
            end;
            v2703.steam_networking_identity_to_string = v2703.SteamNetworkingIdentity_ToString;
            local v2715 = v2679("steamnetworkingsockets.dll", "SteamNetworkingIdentity_ParseString", "bool(__cdecl*)(SteamNetworkingIdentityDEEZNUTS*, unsigned int ,const char*)");
            v2703.SteamNetworkingIdentity_ParseString = function(v2716, v2717)
                -- upvalues: v2715 (ref)
                return v2715(v2716, 136, v2717);
            end;
            v2703.steam_networking_identity_parse_string = v2703.SteamNetworkingIdentity_ParseString;
            return v2703;
        end;
        v2657.FileSystem = function()
            -- upvalues: v2616 (ref), l_ffi_1 (ref), l_error_1 (ref), l_setmetatable_1 (ref)
            local v2718 = v2616("filesystem_stdio.dll", "VBaseFileSystem011");
            local v2719 = l_ffi_1.cast(l_ffi_1.typeof("void***"), v2718);
            local v2720 = v2719[0];
            local v2721 = l_ffi_1.cast("int (__thiscall*)(void*, void*, int, void*)", v2720[0]);
            local v2722 = l_ffi_1.cast("int (__thiscall*)(void*, void const*, int, void*)", v2720[1]);
            local v2723 = l_ffi_1.cast("void* (__thiscall*)(void*, const char*, const char*, const char*)", v2720[2]);
            local v2724 = l_ffi_1.cast("void (__thiscall*)(void*, void*)", v2720[3]);
            local v2725 = l_ffi_1.cast("unsigned int (__thiscall*)(void*, void*)", v2720[7]);
            local v2726 = l_ffi_1.cast("bool (__thiscall*)(void*, const char*, const char*)", v2720[10]);
            local v2727 = v2616("filesystem_stdio.dll", "VFileSystem017");
            local v2728 = l_ffi_1.cast(l_ffi_1.typeof("void***"), v2727);
            local v2729 = v2728[0];
            local v2730 = l_ffi_1.cast("void (__thiscall*)(void*, const char*, const char*, int)", v2729[11]);
            local v2731 = l_ffi_1.cast("bool (__thiscall*)(void*, const char*, const char*)", v2729[12]);
            local v2732 = l_ffi_1.cast("void (__thiscall*)(void*, const char*, const char*)", v2729[20]);
            local v2733 = l_ffi_1.cast("bool (__thiscall*)(void*, const char*, const char*, const char*)", v2729[21]);
            local v2734 = l_ffi_1.cast("void (__thiscall*)(void*, const char*, const char*)", v2729[22]);
            local v2735 = l_ffi_1.cast("bool (__thiscall*)(void*, const char*, const char*)", v2729[23]);
            local v2736 = l_ffi_1.cast("const char* (__thiscall*)(void*, const char*, int*)", v2729[32]);
            local v2737 = l_ffi_1.cast("const char* (__thiscall*)(void*, int)", v2729[33]);
            local v2738 = l_ffi_1.cast("bool (__thiscall*)(void*, int)", v2729[34]);
            local v2739 = l_ffi_1.cast("void (__thiscall*)(void*, int)", v2729[35]);
            local v2740 = {
                ["wb+"] = "wb+", 
                rb = "rb", 
                ab = "ab", 
                ["a+"] = "a+", 
                wb = "wb", 
                ["r+"] = "r+", 
                ["w+"] = "w+", 
                r = "r", 
                w = "w", 
                ["rb+"] = "rb+", 
                a = "a", 
                ["ab+"] = "ab+"
            };
            local v2741 = {};
            v2741.__index = v2741;
            v2741.exists = function(v2742, v2743)
                -- upvalues: v2726 (ref), v2719 (ref)
                return v2726(v2719, v2742, v2743);
            end;
            v2741.rename = function(v2744, v2745, v2746)
                -- upvalues: v2733 (ref), v2728 (ref)
                v2733(v2728, v2744, v2745, v2746);
            end;
            v2741.remove = function(v2747, v2748)
                -- upvalues: v2732 (ref), v2728 (ref)
                v2732(v2728, v2747, v2748);
            end;
            v2741.create_directory = function(v2749, v2750)
                -- upvalues: v2734 (ref), v2728 (ref)
                v2734(v2728, v2749, v2750);
            end;
            v2741.is_directory = function(v2751, v2752)
                -- upvalues: v2735 (ref), v2728 (ref)
                return v2735(v2728, v2751, v2752);
            end;
            v2741.find_first = function(v2753)
                -- upvalues: l_ffi_1 (ref), v2736 (ref), v2728 (ref)
                local v2754 = l_ffi_1.new("int[1]");
                local v2755 = v2736(v2728, v2753, v2754);
                if v2755 == l_ffi_1.NULL then
                    return nil;
                else
                    return v2754, l_ffi_1.string(v2755);
                end;
            end;
            v2741.find_next = function(v2756)
                -- upvalues: v2737 (ref), v2728 (ref), l_ffi_1 (ref)
                local v2757 = v2737(v2728, v2756);
                if v2757 == l_ffi_1.NULL then
                    return nil;
                else
                    return l_ffi_1.string(v2757);
                end;
            end;
            v2741.find_is_directory = function(v2758)
                -- upvalues: v2738 (ref), v2728 (ref)
                return v2738(v2728, v2758);
            end;
            v2741.find_close = function(v2759)
                -- upvalues: v2739 (ref), v2728 (ref)
                v2739(v2728, v2759);
            end;
            v2741.add_search_path = function(v2760, v2761, v2762)
                -- upvalues: v2730 (ref), v2728 (ref)
                v2730(v2728, v2760, v2761, v2762);
            end;
            v2741.remove_search_path = function(v2763, v2764)
                -- upvalues: v2731 (ref), v2728 (ref)
                v2731(v2728, v2763, v2764);
            end;
            v2741.open = function(v2765, v2766, v2767)
                -- upvalues: v2740 (ref), l_error_1 (ref), l_setmetatable_1 (ref), v2723 (ref), v2719 (ref), v2741 (ref)
                if not v2740[v2766] then
                    l_error_1("Invalid mode!");
                end;
                return (l_setmetatable_1({
                    file = v2765, 
                    mode = v2766, 
                    path_id = v2767, 
                    handle = v2723(v2719, v2765, v2766, v2767)
                }, v2741));
            end;
            v2741.get_size = function(v2768)
                -- upvalues: v2725 (ref), v2719 (ref)
                return v2725(v2719, v2768.handle);
            end;
            v2741.write = function(v2769, v2770)
                -- upvalues: v2722 (ref), v2719 (ref)
                v2722(v2719, v2770, #v2770, v2769.handle);
            end;
            v2741.read = function(v2771)
                -- upvalues: l_ffi_1 (ref), v2721 (ref), v2719 (ref)
                local v2772 = v2771:get_size();
                local v2773 = l_ffi_1.new("char[?]", v2772 + 1);
                v2721(v2719, v2773, v2772, v2771.handle);
                return l_ffi_1.string(v2773);
            end;
            v2741.close = function(v2774)
                -- upvalues: v2724 (ref), v2719 (ref)
                v2724(v2719, v2774.handle);
            end;
            return v2741;
        end;
        return v2656;
    end)();
    local v2855 = (function()
        -- upvalues: v1015 (ref), l_cast_0 (ref), l_typeof_0 (ref), v1104 (ref), v48 (ref), v46 (ref), l_ffi_0 (ref), v2775 (ref), v875 (ref), v40 (ref), v2266 (ref), v45 (ref), v47 (ref), v28 (ref), v29 (ref), v33 (ref), v25 (ref)
        local v2776 = v1015.get_jmp_edx_addr();
        local v2777 = l_cast_0("char *(__fastcall*)(void*, void*)", v2776);
        local v2778 = l_typeof_0("char *(__thiscall*)(void*)");
        local v2779 = l_typeof_0("void***");
        local function v2784()
            -- upvalues: v1104 (ref), l_cast_0 (ref), v2779 (ref), v48 (ref), v46 (ref), l_ffi_0 (ref), v2778 (ref), v2777 (ref)
            local l_status_1, l_result_1 = pcall(function()
                -- upvalues: v1104 (ref), l_cast_0 (ref), v2779 (ref), v48 (ref), v46 (ref), l_ffi_0 (ref), v2778 (ref), v2777 (ref)
                local v2780 = v1104();
                if v2780 == nil then
                    return "";
                elseif tonumber(v2780) == 0 then
                    return "";
                else
                    local v2781 = l_cast_0(v2779, v2780)[0][1];
                    if v48 == v46.EV0LVE or v48 == v46.NEVERLOSE then
                        return l_ffi_0.string(l_cast_0(v2778, v2781)(v2780));
                    else
                        return l_ffi_0.string(v2777(v2780, v2781));
                    end;
                end;
            end);
            if l_status_1 then
                return l_result_1;
            else
                return "";
            end;
        end;
        local v2785 = v1015.get_api_key();
        local v2786 = "5";
        local v2787 = v1015.get_unix_time();
        local v2788 = nil;
        local v2789 = {};
        local v2790 = false;
        local v2791 = "unmatched.gg";
        local v2792 = "https://api.unmatched.gg/external/v2";
        local v2793 = {
            [1] = {
                [1] = "https://api.unmatched.gg/external/v2", 
                [2] = "unmatched.gg"
            }, 
            [2] = {
                [1] = "https://api.cheat.show/v2/lua", 
                [2] = "api.cheat.show"
            }
        };
        local function v2797(v2794)
            -- upvalues: v2775 (ref)
            local v2795 = v2775.FileSystem.open(v2794, "r+", "game");
            local v2796 = v2795:read();
            v2795:close();
            return v2796;
        end;
        local function v2801(v2798, v2799)
            -- upvalues: v2775 (ref)
            local v2800 = v2775.FileSystem.open(v2798, "w+", "game");
            v2800:write(v2799);
            v2800:close();
            return true;
        end;
        local function v2806(v2802)
            local v2803 = {};
            for v2804, v2805 in pairs(v2802) do
                v2803[v2805 + 1] = v2804;
            end;
            return v2803;
        end;
        local v2807 = v2797("unmatched.json");
        local v2808 = #v2807 == 0 and {} or v875.parse(v2807);
        for _, v2810 in pairs(v2793) do
            if v2808[v2810[2]] == nil then
                v2808[v2810[2]] = {
                    uuid = "00000000-0000-0000-0000-000000000000", 
                    uuidSignature = "d812fb10178ebca548801d9af25bfdfe04b2585deff4cd6c480c1fe2958660fd"
                };
            end;
        end;
        v2801("unmatched.json", v875.stringify(v2808));
        local function v2824(v2811, v2812, v2813)
            -- upvalues: v2790 (ref), v2793 (ref), v875 (ref), v2808 (ref), v1015 (ref), v40 (ref), v2786 (ref), v2266 (ref), v2785 (ref), v2801 (ref), v2789 (ref), v2806 (ref), v45 (ref), v2784 (ref)
            if v2790 then
                return false;
            else
                for v2814, v2815 in pairs(v2793) do
                    local v2816 = v875.stringify({
                        xuid = v2811, 
                        software = v2812, 
                        uuid = v2808[v2815[2]].uuid, 
                        uuidSignature = v2808[v2815[2]].uuidSignature
                    });
                    local v2817 = tostring(v1015.get_unix_time());
                    v40("attempting to connect to " .. v2815[2]);
                    v40(("sending /auth to %s: %s"):format(v2815[2], v2816));
                    do
                        local l_v2814_0, l_v2815_0 = v2814, v2815;
                        v1015.http:request("post", l_v2815_0[1] .. "/auth", {
                            headers = {
                                ["Content-Type"] = "application/json", 
                                Accept = "application/json", 
                                Version = v2786, 
                                Timestamp = v2817, 
                                Signature = v2266.hmac(v2266.sha256, v2785, v2816 .. v2817 .. v2786)
                            }, 
                            body = v2816
                        }, function(v2820)
                            -- upvalues: l_v2814_0 (ref), v40 (ref), l_v2815_0 (ref), v875 (ref), v2808 (ref), v2801 (ref), v2790 (ref), v2789 (ref), v2806 (ref), v45 (ref), v2813 (ref), v2784 (ref)
                            if not v2820:success() then
                                if l_v2814_0 == 1 then
                                    print("failed to connect to unmatched.gg");
                                    v40(v2820.body);
                                    v40(v2820.status);
                                else
                                    v40(("failed to connect to %s"):format(l_v2815_0[2]));
                                end;
                                return;
                            else
                                local v2821 = v875.parse(v2820.body);
                                if v2821 == nil or not v2821.status then
                                    v40("Dev Error: " .. (v2821 ~= nil and v2821.error ~= nil and v2821.error or "Server Side Error"));
                                    return;
                                else
                                    if v2808[l_v2815_0[2]].uuid ~= v2821.uuid then
                                        v2808[l_v2815_0[2]].uuid = v2821.uuid;
                                        v2808[l_v2815_0[2]].uuidSignature = v2821.uuidSignature;
                                        v2801("unmatched.json", v875.stringify(v2808));
                                    end;
                                    if l_v2814_0 == 1 then
                                        v2790 = true;
                                        v2789 = v2806(v2821.disabled);
                                        for v2822, _ in pairs(v2789) do
                                            v40("disabled cheat: " .. v45[v2822] .. " (" .. v2822 - 1 .. ")");
                                        end;
                                        pcall(v2813);
                                    end;
                                    v40("connected to " .. l_v2815_0[2]);
                                    v40("server ip: " .. v2784());
                                    return;
                                end;
                            end;
                        end);
                    end;
                end;
                return true;
            end;
        end;
        local function v2827()
            -- upvalues: v1015 (ref), v2792 (ref), v2786 (ref), v2266 (ref), v2785 (ref), v40 (ref), v2788 (ref)
            local v2825 = tostring(v1015.get_unix_time());
            v1015.http:request("get", v2792 .. "/key/pull", {
                headers = {
                    ["Content-Type"] = "text/plain", 
                    Accept = "text/plain", 
                    Version = v2786, 
                    Timestamp = v2825, 
                    Signature = v2266.hmac(v2266.sha256, v2785, v2825 .. v2786)
                }
            }, function(v2826)
                -- upvalues: v40 (ref), v2788 (ref)
                if not v2826:success() then
                    v40("failed to retrieve neverlose key");
                    v40(v2826.body);
                    v40(v2826.status);
                    return;
                else
                    v40("retrieved neverlose key");
                    v40(v2826.body);
                    v40(v2826.status);
                    v2788 = v2826.body;
                    return;
                end;
            end);
        end;
        local function v2828()
            -- upvalues: v2788 (ref)
            return v2788;
        end;
        local function v2834(v2829, v2830)
            -- upvalues: v2808 (ref), v2791 (ref), v2784 (ref), v875 (ref), v1015 (ref), v40 (ref), v2792 (ref), v2786 (ref), v2266 (ref), v2785 (ref)
            v2829.uuid = v2808[v2791].uuid;
            v2829.uuidSignature = v2808[v2791].uuidSignature;
            v2829.serverIp = v2784();
            local v2831 = v875.stringify(v2829);
            local v2832 = tostring(v1015.get_unix_time());
            v40("sending /pull: " .. v2831);
            v1015.http:request("post", v2792 .. "/pull", {
                headers = {
                    ["Content-Type"] = "application/json", 
                    Accept = "application/json", 
                    Version = v2786, 
                    Timestamp = v2832, 
                    Signature = v2266.hmac(v2266.sha256, v2785, v2831 .. v2832 .. v2786)
                }, 
                body = v2831
            }, function(v2833)
                -- upvalues: v40 (ref), v2830 (ref)
                if not v2833:success() then
                    v40("failed to connect to unmatched.gg");
                    v40(v2833.body);
                    v40(v2833.status);
                    return;
                else
                    pcall(v2830, v2833.body);
                    v40(("received: %s"):format(v2833.body));
                    return;
                end;
            end);
        end;
        local function v2842(v2835)
            -- upvalues: v2784 (ref), v2793 (ref), v40 (ref), v2808 (ref), v875 (ref), v1015 (ref), v2786 (ref), v2266 (ref), v2785 (ref)
            v2835.serverIp = v2784();
            for _, v2837 in pairs(v2793) do
                v40("attempting to send to " .. v2837[2]);
                v2835.uuid = v2808[v2837[2]].uuid;
                v2835.uuidSignature = v2808[v2837[2]].uuidSignature;
                local v2838 = v875.stringify(v2835);
                local v2839 = tostring(v1015.get_unix_time());
                v40("sending /push: " .. v2838);
                v1015.http:request("post", v2837[1] .. "/push", {
                    headers = {
                        ["Content-Type"] = "application/json", 
                        Accept = "application/json", 
                        Version = v2786, 
                        Timestamp = v2839, 
                        Signature = v2266.hmac(v2266.sha256, v2785, v2838 .. v2839 .. v2786)
                    }, 
                    body = v2838
                }, function(v2840)
                    -- upvalues: v40 (ref), v875 (ref)
                    if not _DEBUG then
                        return;
                    elseif not v2840:success() then
                        v40("failed to connect to unmatched.gg");
                        v40(v2840.body);
                        v40(v2840.status);
                        return;
                    else
                        local v2841 = v875.parse(v2840.body);
                        if v2841 == nil or not v2841.status then
                            v40("Dev Error: " .. (v2841 ~= nil and v2841.error ~= nil and v2841.error or "Server Side Error"));
                            return;
                        else
                            return;
                        end;
                    end;
                end);
            end;
        end;
        local function v2848()
            -- upvalues: v1015 (ref), v2787 (ref), v47 (ref), v48 (ref), v28 (ref), v29 (ref), v33 (ref), v2842 (ref)
            if not v1015.is_in_game() then
                return;
            else
                local v2843 = v1015.get_players();
                if not v2843 then
                    return;
                elseif math.abs(v2787 - v1015.get_unix_time()) <= 2 then
                    return;
                else
                    local v2844 = {
                        software = v47[v48] - 1, 
                        xuid = v28(), 
                        xuids = {}
                    };
                    local v2845 = v1015.get_local_player_id();
                    for _, v2847 in pairs(v2843) do
                        xuid = tostring(v29(tonumber(v2847)));
                        if tonumber(xuid) > 64 and v2847 ~= v2845 then
                            v2844.xuids[xuid] = v33(v2847) - 1;
                        end;
                    end;
                    v2842(v2844);
                    v2787 = v1015.get_unix_time();
                    return;
                end;
            end;
        end;
        local function v2853()
            -- upvalues: v1015 (ref), v47 (ref), v48 (ref), v28 (ref), v29 (ref), v2834 (ref), v25 (ref)
            if not v1015.is_in_game() then
                return;
            else
                local v2849 = v1015.get_players();
                if not v2849 then
                    return;
                else
                    local v2850 = {
                        software = v47[v48] - 1, 
                        xuid = v28(), 
                        xuids = {}
                    };
                    for _, v2852 in pairs(v2849) do
                        xuid = tostring(v29(tonumber(v2852)));
                        if tonumber(xuid) > 64 then
                            table.insert(v2850.xuids, xuid);
                        end;
                    end;
                    v2834(v2850, v25);
                    return;
                end;
            end;
        end;
        local function v2854()
            -- upvalues: v2789 (ref)
            return v2789;
        end;
        return {
            auth = v2824, 
            get = v2834, 
            upload = v2842, 
            update_data = v2853, 
            log_cheat_batch = v2848, 
            update_neverlose_key = v2827, 
            get_neverlose_key = v2828, 
            get_disabled_cheats = v2854
        };
    end)();
    local v2856 = {};
    local v2857 = true;
    local function v2861()
        -- upvalues: v2856 (ref), v45 (ref)
        v2856 = {};
        for v2858 = 0, 64 do
            v2856[v2858] = {
                last_update_time = 0, 
                initial_update_time = 0, 
                cheats = {}, 
                last_update_cheat = v45.NONE, 
                last_data = {}
            };
            for _, v2860 in pairs(v45) do
                if type(v2860) ~= "number" then
                    v2856[v2858].cheats[v2860] = 0;
                else
                    break;
                end;
            end;
        end;
    end;
    local function v2862()
        -- upvalues: v2861 (ref), v2855 (ref)
        v2861();
        v2855.update_data();
        v2855.update_neverlose_key();
    end;
    local function v2864()
        -- upvalues: v2856 (ref)
        for v2863 = 0, 64 do
            v2856[v2863].initial_update_time = 0;
        end;
    end;
    local function v2868(v2865)
        -- upvalues: v2856 (ref), v45 (ref)
        if v2856[v2865] then
            v2856[v2865] = {
                last_update_time = 0, 
                initial_update_time = 0, 
                cheats = {}, 
                last_update_cheat = v45.NONE, 
                last_data = {}
            };
            for _, v2867 in pairs(v45) do
                if type(v2867) ~= "number" then
                    v2856[v2865].cheats[v2867] = 0;
                else
                    break;
                end;
            end;
        end;
    end;
    v2861();
    local function v2872(v2869, v2870)
        -- upvalues: v1015 (ref), v2856 (ref), v2857 (ref)
        local v2871 = v1015.get_unix_time();
        if v2856[v2869].last_update_cheat ~= v2870 then
            v2857 = true;
        end;
        if v2856[v2869].initial_update_time == 0 then
            v2856[v2869].initial_update_time = v2871;
        end;
        v2856[v2869].cheats[v2870] = v2871;
        v2856[v2869].last_update_cheat = v2870;
        v2856[v2869].last_update_time = v2871;
    end;
    local function v2875(v2873)
        -- upvalues: v34 (ref), v2856 (ref), v45 (ref), v1015 (ref)
        if v34.debug then
            return true;
        else
            local v2874 = v2856[v2873];
            if v2874.initial_update_time == 0 then
                return true;
            elseif v2874.last_update_cheat == v45.NEVERLOSE or v2874.last_update_cheat == v45.SOLUS_UI then
                return (v1015.get_unix_time() - v2874.initial_update_time) % 60 < 2;
            else
                return v1015.get_unix_time() - v2874.last_update_time > 60;
            end;
        end;
    end;
    local function v2878(v2876, v2877)
        -- upvalues: v2856 (ref)
        v2856[v2876].last_data = v2877;
    end;
    v33 = function(v2879)
        -- upvalues: v2856 (ref), v45 (ref), v1015 (ref)
        local v2880 = v2856[v2879];
        if v2880.last_update_cheat ~= v45.AIMWARE and v1015.get_unix_time() - v2880.last_update_time > 180 then
            return v45.NONE;
        else
            return v2880.last_update_cheat;
        end;
    end;
    local v2881 = {};
    local function v2887(v2882)
        -- upvalues: v40 (ref), v2868 (ref), v2857 (ref), v2855 (ref), v28 (ref), v47 (ref), v48 (ref), v2862 (ref), v2881 (ref), v27 (ref), v33 (ref), v45 (ref), v2872 (ref)
        v40("handle player connect: " .. v2882);
        v2868(v2882);
        v2857 = true;
        if not v2855.auth(v28(), v47[v48] - 1, v2862) then
            v2855.update_neverlose_key();
            v2855.update_data();
        end;
        for _, v2884 in pairs(v2881) do
            local v2885 = v27(v2884);
            if v2885 ~= 0 then
                local v2886 = v33(v2885);
                if v2886 == v45.NONE or v2886 == v45.AIMWARE then
                    v2872(v2885, v45.AIMWARE);
                end;
            end;
        end;
    end;
    v1015.set_player_connect_callback(v2887);
    local v2888 = {};
    local function v2899(v2889, v2890)
        -- upvalues: v1015 (ref), v2888 (ref), v2872 (ref)
        return function(v2891, v2892, v2893)
            -- upvalues: v1015 (ref), v2888 (ref), v2889 (ref), v2890 (ref), v2872 (ref)
            local v2894 = v1015.get_unix_time();
            if v2888[v2891] == nil then
                v2888[v2891] = {};
            end;
            if v2888[v2891][v2892] == nil then
                v2888[v2891][v2892] = {};
            end;
            local v2895 = v2888[v2891][v2892];
            local v2896 = {
                time = v2894, 
                data = v2893
            };
            local v2897 = false;
            for v2898 = 1, #v2895 do
                if v2895[v2898].data == v2896.data then
                    v2897 = true;
                    break;
                end;
            end;
            if v2897 then
                v2888[v2891][v2892] = {};
                return;
            else
                table.insert(v2895, v2896);
                if #v2895 > v2889 then
                    table.remove(v2895, 1);
                end;
                if #v2895 == v2889 and v2894 - v2895[1].time <= v2890 then
                    v2872(v2891, v2892);
                end;
                return;
            end;
        end;
    end;
    local v2900 = v2899(4, 5);
    local v2901 = v2899(4, 5);
    local v2902 = v2899(4, 5);
    local v2903 = v2899(4, 5);
    local v2904 = v2899(4, 5);
    local v2905 = v2899(4, 5);
    local v2906 = v2899(4, 5);
    local v2907 = v2899(4, 5);
    local v2908 = v2899(4, 5);
    local v2909 = v2899(4, 5);
    local v2910 = v2899(4, 5);
    local v2911 = false;
    local function v2912()
        -- upvalues: v1015 (ref), v2911 (ref), v2861 (ref)
        if not v1015.is_in_game() and v2911 == true then
            v2861();
        end;
        v2911 = v1015.is_in_game();
    end;
    v1015.set_paint_callback(v2912);
    local v2913 = l_new_0(v1044);
    local v2914 = 16;
    local v2915 = {};
    local v2916 = {};
    local function v2918(v2917)
        return tonumber(v2917.xuid_low) .. "." .. tonumber(v2917.xuid_high) .. "." .. tonumber(v2917.sequence_bytes) .. "." .. tonumber(v2917.section_number) .. "." .. tonumber(v2917.uncompressed_sample_offset);
    end;
    local function v2925(v2919, v2920)
        -- upvalues: v2918 (ref), v1015 (ref), v2915 (ref), v2916 (ref), v930 (ref), v2914 (ref)
        local v2921 = v2918(v2919);
        local v2922 = v1015.get_unix_time();
        for v2923, v2924 in pairs(v2915) do
            if v2922 - v2916[v2923] > 5 then
                v2915[v2923] = {};
                v2916[v2923] = 0;
            elseif v930(v2924, v2921) then
                v2916[v2923] = v2922;
                return true, false, v2921;
            end;
        end;
        if v2915[v2920] == nil then
            v2915[v2920] = {};
        end;
        table.insert(v2915[v2920], 1, v2921);
        v2916[v2920] = v2922;
        if #v2915[v2920] > v2914 then
            table.remove(v2915[v2920]);
            return false, true, v2921;
        else
            return false, false, v2921;
        end;
    end;
    v2582 = function(v2926, v2927)
        -- upvalues: v1015 (ref), l_cast_0 (ref), v1060 (ref), v2925 (ref), v2913 (ref), v2855 (ref), v45 (ref), v2574 (ref), v2872 (ref), v2875 (ref), v1108 (ref), v1054 (ref), v2856 (ref), v33 (ref), v1075 (ref), v2900 (ref), v2878 (ref), v2581 (ref), v2902 (ref), v2904 (ref), v2905 (ref), v2903 (ref), v2906 (ref), v2908 (ref), v1090 (ref), l_ffi_0 (ref), v1093 (ref), v1069 (ref), v2909 (ref), v1084 (ref), v2907 (ref), v2910 (ref), v2901 (ref)
        if v2926 == nil then
            return;
        elseif not v1015.is_in_game() then
            return;
        else
            v2926 = l_cast_0(v1060, v2926);
            local v2928 = v2926[0];
            local v2929 = 0;
            if v2928.voice_data ~= nil then
                v2929 = v2928.voice_data[0].size;
            end;
            if v2929 ~= 0 then
                return;
            else
                local l_format_2 = v2928.format;
                local v2931 = v2928.client + 1;
                local v2932, v2933, v2934 = v2925(v2926, v2931);
                if v2932 then
                    return;
                else
                    v2913[0].xuid_low = v2928.xuid_low;
                    v2913[0].xuid_high = v2928.xuid_high;
                    v2913[0].sequence_bytes = v2928.sequence_bytes;
                    v2913[0].section_number = v2928.section_number;
                    v2913[0].uncompressed_sample_offset = v2928.uncompressed_sample_offset;
                    local v2935 = v2855.get_disabled_cheats();
                    if v2935[v45.EXTENSION] == nil and v2574.extension.decode(v2913) then
                        v2872(v2931, v45.EXTENSION);
                        return;
                    elseif not v2875(v2931) then
                        return;
                    elseif v1108(v2931) == nil then
                        return;
                    else
                        local v2936 = l_cast_0(v1054, v2913)[0];
                        local v2937 = {};
                        for v2938 = 1, 20 do
                            v2937[v2938] = v2936.data[v2938 - 1];
                        end;
                        local _ = v2856[v2931].last_data;
                        local v2940 = v33(v2931);
                        if l_format_2 == 1 then
                            local v2941 = v2574.primordial.decode(l_cast_0(v1075, v2913));
                            if v2941 ~= nil and v2935[v45.PRIMORDIAL] == nil and (v2941.key == 77 or v2941.key == 67) and v2941.x > -16384 and v2941.x < 16384 and v2941.y > -16384 and v2941.y < 16384 and v2941.z > -16384 and v2941.z < 16384 then
                                v2900(v2931, v45.PRIMORDIAL, v2934);
                                v2878(v2931, v2937);
                                return;
                            end;
                        end;
                        local v2942 = v2581(v2913);
                        local v2943 = v2574.gamesense.decode(v2926, v2931);
                        if v2943 ~= nil and v2935[v45.GAMESENSE] == nil and v2943.x > -16384 and v2943.x < 16384 and v2943.y > -16384 and v2943.y < 16384 and v2943.z > -16384 and v2943.z < 16384 then
                            v2902(v2931, v45.GAMESENSE, v2934);
                            v2878(v2931, v2937);
                            return;
                        else
                            local v2944 = v2574.ev0lity.decode(v2913, v2931);
                            if v2944 ~= nil then
                                if v2944.id == 32762 or v2944.id == 32763 and v2935[v45.FATALITY] == nil then
                                    v2904(v2931, v45.FATALITY, v2934);
                                    v2878(v2931, v2937);
                                    return;
                                elseif v2944.id == 32764 or v2944.id == 32765 and v2935[v45.EV0LVE] == nil then
                                    v2905(v2931, v45.EV0LVE, v2934);
                                    v2878(v2931, v2937);
                                    return;
                                end;
                            end;
                            local v2945 = v2574.ev0lity_old.decode(v2913);
                            if v2945 ~= nil and v2935[v45.FATALITY_OLD] == nil and (v2945.id == 32762 or v2945.id == 32763) then
                                v2903(v2931, v45.FATALITY_OLD, v2934);
                                v2878(v2931, v2937);
                                return;
                            elseif v2574.rifk7.decode(v2913, v2931) and v2935[v45.RIFK7] == nil and (v2940 == v45.NONE or v2940 == v45.RIFK7) then
                                v2906(v2931, v45.RIFK7, v2934);
                                v2878(v2931, v2937);
                                return;
                            else
                                local v2946 = v2574.airflow.decode(v2913);
                                if v2946 ~= nil then
                                    if v2935[v45.AIRFLOW] == nil and v2946.cheat_id == v2574.airflow.cheat_type.Airflow then
                                        v2908(v2931, v45.AIRFLOW, v2934);
                                        v2878(v2931, v2937);
                                        return;
                                    elseif v2935[v45.WEAVE] == nil and v2946.cheat_id == v2574.airflow.cheat_type.Weave then
                                        v2908(v2931, v45.WEAVE, v2934);
                                        v2878(v2931, v2937);
                                        return;
                                    end;
                                end;
                                if v2574.solus.decode(v2942) ~= nil and v2935[v45.SOLUS_UI] == nil then
                                    v2872(v2931, v45.SOLUS_UI);
                                    v2878(v2931, v2937);
                                    return;
                                else
                                    local v2947 = true;
                                    for v2948 = 8, #v2937 do
                                        if v2937[v2948] == 0 then
                                            v2947 = false;
                                            break;
                                        end;
                                    end;
                                    local v2949 = v2574.legion.decode(l_cast_0(v1090, v2913), v2931);
                                    if v2935[v45.LEGION] == nil and v2947 and l_ffi_0.string(v2949, 6) == "LEGION" then
                                        v2872(v2931, v45.LEGION);
                                        v2878(v2931, v2937);
                                        return;
                                    elseif v2935[v45.MONOLITH] == nil and v2947 and l_ffi_0.string(v2949, 8) == "MONOLITH" then
                                        v2872(v2931, v45.MONOLITH);
                                        v2878(v2931, v2937);
                                        return;
                                    elseif v2935[v45.LEGENDWARE] == nil and v2574.legendware.decode(l_cast_0(v1093, v2913)) then
                                        v2872(v2931, v45.LEGENDWARE);
                                        return;
                                    elseif v2935[v45.PANDORA] == nil and v2933 and v2574.pandora.decode(l_cast_0(v1069, v2913)) then
                                        v2909(v2931, v45.PANDORA, v2934);
                                        v2878(v2931, v2937);
                                        return;
                                    elseif v2935[v45.PLAGUE] == nil and v2933 and v2574.plague.decode(l_cast_0(v1084, v2913)) then
                                        v2907(v2931, v45.PLAGUE, v2934);
                                        v2878(v2931, v2937);
                                        return;
                                    else
                                        local v2950 = v2574.nixware.decode(v2942);
                                        if v2950 ~= nil then
                                            if v2935[v45.NIXWARE] == nil and v2950.id == 48879 then
                                                v2872(v2931, v45.NIXWARE);
                                                v2878(v2931, v2937);
                                                return;
                                            elseif v2935[v45.SPIRTHACK] == nil and v2950.id == 53456 then
                                                v2872(v2931, v45.SPIRTHACK);
                                                v2878(v2931, v2937);
                                                return;
                                            end;
                                        end;
                                        local v2951 = v2574.onetap.decode(v2926, v2931);
                                        if v2935[v45.ONETAP] == nil and v2933 and l_format_2 == 0 and v2951 ~= nil then
                                            v2910(v2931, v45.ONETAP, v2934);
                                            v2878(v2931, v2937);
                                            return;
                                        else
                                            local v2952 = v2855.get_neverlose_key();
                                            if v2952 ~= nil then
                                                local v2953 = v2574.neverlose.decode(v2942, v2952, v2931);
                                                if v2935[v45.NEVERLOSE] == nil and v2953 ~= nil and v2940 ~= v45.SOLUS_UI then
                                                    v2901(v2931, v45.NEVERLOSE, v2934);
                                                    v2878(v2931, v2937);
                                                    return;
                                                end;
                                            end;
                                            if v2927 == true and v2935[v45.NEVERLOSE] == nil and v2940 ~= v45.SOLUS_UI then
                                                v2901(v2931, v45.NEVERLOSE, v2934);
                                                v2878(v2931, v2937);
                                                return;
                                            else
                                                v2878(v2931, v2937);
                                                return;
                                            end;
                                        end;
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;
    v1015.set_voice_callback(v2582);
    local v2954 = l_new_0("char[26]");
    local function v2964()
        -- upvalues: l_new_0 (ref), v2775 (ref), v40 (ref), l_ffi_0 (ref), v2954 (ref), v930 (ref), v2881 (ref), v27 (ref), v33 (ref), v45 (ref), v2872 (ref)
        local v2955 = l_new_0("SteamNetworkingMessage_tDEEZNUTS*[32]");
        local v2956 = v2775.ISteamNetworkingMessages.receive_messages_on_channel(1, v2955, 32);
        if v2956 ~= 0 then
            v40("received message :troll: " .. tostring(v2956));
            for v2957 = 0, v2956 - 1 do
                v40(tostring(l_ffi_0.string(v2955[v2957][0].m_pData, v2955[v2957][0].m_cbSize)));
                v40(tostring(v2955[v2957][0].m_cbSize));
                local l_m_identityPeer_0 = v2955[v2957][0].m_identityPeer;
                local v2959 = l_new_0("SteamNetworkingIdentityDEEZNUTS");
                v2959.m_eType = 16;
                v2959.m_cbSize = l_m_identityPeer_0.m_eType;
                v2959.m_reserved[0] = l_m_identityPeer_0.m_cbSize;
                v2959.m_reserved[1] = l_m_identityPeer_0.m_reserved[0];
                if v2959.m_cbSize == 8 then
                    v2775.ISteamNetworkingMessages.close_session_with_user(v2959);
                    if v2956 > 1 then
                        v2775.ISteamNetworkingUtils.SteamNetworkingIdentity_ToString(v2959, v2954, 26);
                        local v2960 = l_ffi_0.string(v2954, 25);
                        local v2961 = string.sub(v2960, 9, 25);
                        if not v930(v2881, v2961) then
                            table.insert(v2881, v2961);
                        end;
                        local v2962 = v27(v2961);
                        if v2962 ~= 0 then
                            local v2963 = v33(v2962);
                            if v2963 == v45.NONE or v2963 == v45.AIMWARE then
                                v2872(v2962, v45.AIMWARE);
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;
    local function v2971(v2965)
        -- upvalues: v2775 (ref), v2954 (ref), l_ffi_0 (ref), v930 (ref), v2881 (ref), v40 (ref)
        local l_status_2, l_result_2 = pcall(function()
            -- upvalues: v2965 (ref), v2775 (ref), v2954 (ref), l_ffi_0 (ref), v930 (ref), v2881 (ref)
            local l_m_identityRemote_0 = v2965[0].m_identityRemote;
            if l_m_identityRemote_0.m_eType == 16 then
                v2775.ISteamNetworkingUtils.SteamNetworkingIdentity_ToString(l_m_identityRemote_0, v2954, 26);
                local v2967 = l_ffi_0.string(v2954, 25);
                local v2968 = string.sub(v2967, 9, 25);
                if v930(v2881, v2968) then
                    v2775.ISteamNetworkingMessages.close_session_with_user(l_m_identityRemote_0);
                else
                    v2775.ISteamNetworkingMessages.accept_session_with_user(l_m_identityRemote_0);
                end;
            end;
        end);
        if not l_status_2 then
            v40(l_result_2);
        end;
    end;
    if jit then
        jit.off(v2971);
        jit.off(v2964);
    end;
    local v2972 = l_cast_0("void(__cdecl*)(SteamNetworkingMessagesSessionRequest_tDEEZNUTS*)", v2971);
    local v2973 = l_new_0("void*[1]", v2972);
    v2775.ISteamNetworkingUtils.SetConfigValue(204, 1, 0, 5, v2973);
    v1020(function()
        -- upvalues: v2775 (ref), l_cast_0 (ref)
        v2775.ISteamNetworkingUtils.SetConfigValue(204, 1, 0, 5, l_cast_0("void*", 0));
    end);
    local v2974 = (function()
        return {
            update = function(...)

            end
        };
    end)();
    local _ = v1015.get_unix_time();
    local v2976 = v1015.get_unix_time();
    local function v2983()
        -- upvalues: v2964 (ref), v1015 (ref), v2974 (ref), v40 (ref), v2976 (ref), v35 (ref), v2855 (ref), v28 (ref), v47 (ref), v48 (ref), v2862 (ref), v2857 (ref), v33 (ref), v16 (ref), v26 (ref)
        v2964();
        if not v1015.is_in_game() then
            return;
        else
            local l_status_3, l_result_3 = pcall(function()
                -- upvalues: v2974 (ref)
                v2974.update();
            end);
            if not l_status_3 then
                v40(l_result_3);
            end;
            if v1015.get_unix_time() - v2976 > 120 then
                v35 = {};
                if not v2855.auth(v28(), v47[v48] - 1, v2862) then
                    v2855.update_neverlose_key();
                    v2855.update_data();
                end;
                v2855.log_cheat_batch();
                v2976 = v1015.get_unix_time();
            end;
            if v2857 then
                local v2979 = v1015.get_players();
                if not v2979 then
                    return;
                else
                    local v2980 = {};
                    for _, v2982 in pairs(v2979) do
                        v2980[tostring(v2982)] = v33(v2982) - 1;
                    end;
                    v16(v2980);
                    v2857 = false;
                end;
            end;
            v26();
            return;
        end;
    end;
    v1015.set_net_update_callback(v2983);
    local function v2984()
        -- upvalues: v2855 (ref), v28 (ref), v47 (ref), v48 (ref), v2862 (ref), v2864 (ref)
        if not v2855.auth(v28(), v47[v48] - 1, v2862) then
            v2855.update_neverlose_key();
            v2855.update_data();
        end;
        v2855.log_cheat_batch();
        v2864();
    end;
    v1015.set_round_start_callback(v2984);
    local function v2995(v2985, v2986, v2987)
        -- upvalues: v1015 (ref), l_get_js_player_info_by_user_id_0 (ref), l_update_0 (ref)
        local v2988 = v1015.should_display_estimated_data();
        local v2989 = {
            transparent = false, 
            user_id = 0, 
            cheat_id = 0
        };
        if v2985 ~= 0 then
            local v2990 = l_get_js_player_info_by_user_id_0(v2985);
            if v2990 ~= nil and (not v2990.estimated or v2990.estimated and v2988) then
                v2989 = {
                    user_id = v2985, 
                    cheat_id = v2990.cheat, 
                    transparent = v2990.estimated
                };
            end;
        end;
        local v2991 = {
            transparent = false, 
            user_id = 0, 
            cheat_id = 0
        };
        if v2986 ~= 0 then
            local v2992 = l_get_js_player_info_by_user_id_0(v2986);
            if v2992 ~= nil and (not v2992.estimated or v2992.estimated and v2988) then
                v2991 = {
                    user_id = v2986, 
                    cheat_id = v2992.cheat, 
                    transparent = v2992.estimated
                };
            end;
        end;
        local v2993 = {
            transparent = false, 
            user_id = 0, 
            cheat_id = 0
        };
        if v2987 ~= 0 then
            local v2994 = l_get_js_player_info_by_user_id_0(v2987);
            if v2994 ~= nil and (not v2994.estimated or v2994.estimated and v2988) then
                v2993 = {
                    user_id = v2987, 
                    cheat_id = v2994.cheat, 
                    transparent = v2994.estimated
                };
            end;
        end;
        l_update_0(v2989, v2991, v2993, 0.015625, v1015.is_killfeed_icons_enabled());
    end;
    v1015.set_player_death_callback(v2995);
    v1020(function()
        -- upvalues: v1015 (ref), v19 (ref), v18 (ref), v21 (ref), v22 (ref), v14 (ref), v31 (ref), l_reset_0 (ref)
        if v1015.unhook ~= nil then
            v1015.unhook();
        end;
        v19(false);
        v18(false);
        v21(false);
        v22(false);
        v14();
        v31();
        l_reset_0();
    end);
    if v46.EV0LVE == v48 then
        on_round_start = function()
            -- upvalues: v2984 (ref)
            v2984();
        end;
        on_player_death = function(v2996)
            -- upvalues: v2995 (ref)
            v2995(v2996.attacker, v2996.assister, v2996.userid);
        end;
        on_frame_stage_notify = function(v2997, _)
            -- upvalues: v2983 (ref)
            if v2997 ~= 4 then
                return;
            else
                v2983();
                return;
            end;
        end;
        on_paint = function()
            -- upvalues: v2912 (ref)
            v2912();
        end;
        on_player_connect_full = function(v2999)
            -- upvalues: v2887 (ref)
            if v2999 ~= nil then
                v2887(engine.get_player_for_user_id(v2999:get_int("userid")));
            end;
        end;
        on_shutdown = function()
            -- upvalues: v1018 (ref)
            v1018();
        end;
    end;
    local function v3000()
        -- upvalues: v18 (ref), v1015 (ref), v19 (ref), v21 (ref), v30 (ref), v22 (ref), v23 (ref), v14 (ref), v2857 (ref), l_setIconPack_0 (ref), l_setVisible_0 (ref)
        v18(v1015.is_unmatched_enabled());
        v19(v1015.is_rank_image_enabled());
        v21(v1015.is_scoreboard_color_enabled());
        v30(v1015.should_display_estimated_data());
        v22(v1015.is_spectator_hud_enabled());
        v23(v1015.get_icon_pack() - 1);
        v14();
        v2857 = true;
        l_setIconPack_0(v1015.get_icon_pack() - 1);
        l_setVisible_0(v1015.is_killfeed_icons_enabled());
    end;
    v1015.set_features_update_callback(v3000);
    local _ = (function()
        -- upvalues: l_panorama_0 (ref), v1020 (ref)
        local v3001 = {
            CharacterAnims = "file://{resources}/scripts/common/characteranims.js", 
            SessionUtil = "file://{resources}/scripts/common/sessionutil.js", 
            Scheduler = "file://{resources}/scripts/common/scheduler.js", 
            FlipPanelAnimation = "file://{resources}/scripts/common/flip_panel_anim.js", 
            LicenseUtil = "file://{resources}/scripts/common/licenseutil.js", 
            TeamColor = "file://{resources}/scripts/common/teamcolor.js", 
            ItemContextEntires = "file://{resources}/scripts/common/item_context_entries.js", 
            OperationUtil = "file://{resources}/scripts/operation/operation_util.js", 
            IconUtil = "file://{resources}/scripts/common/icon.js", 
            OperationMissionCard = "file://{resources}/scripts/operation/operation_mission_card.js", 
            FormatText = "file://{resources}/scripts/common/formattext.js", 
            MockAdapter = "file://{resources}/scripts/mock_adapter.js", 
            EventUtil = "file://{resources}/scripts/common/eventutil.js", 
            Avatar = "file://{resources}/scripts/avatar.js", 
            ItemInfo = "file://{resources}/scripts/common/iteminfo.js"
        };
        local v3002 = {};
        table.insert(v3002, "<root>");
        table.insert(v3002, "\t<scripts>");
        for _, v3004 in pairs(v3001) do
            table.insert(v3002, "\t\t<include src=\"" .. v3004 .. "\"/>");
        end;
        table.insert(v3002, "\t</scripts>");
        table.insert(v3002, "");
        table.insert(v3002, "\t<script>");
        for v3005, _ in pairs(v3001) do
            table.insert(v3002, string.format("\t\t$.GetContextPanel().%s = %s;", v3005, v3005));
        end;
        table.insert(v3002, "\t</script>");
        table.insert(v3002, "");
        table.insert(v3002, "\t<Panel>");
        table.insert(v3002, "\t</Panel>");
        table.insert(v3002, "</root>");
        v3002 = table.concat(v3002, "\n");
        local v3007 = "let global_this = this\nlet modified_props = {}\nlet _Create = function(layout, utilities) {\n  let parent = $.GetContextPanel()\n  if(!parent)\n    return false\n  let panel = $.CreatePanel(\"Panel\", parent, \"\")\n  if(!panel)\n    return false\n  if(!panel.BLoadLayoutFromString(layout, false, false))\n    return false\n  for(name in utilities) {\n    if(panel[name]) {\n      // global_this[name] = panel[name]\n      Object.defineProperty(global_this, name, {\n        enumerable: false,\n        writable: false,\n        configurable: true,\n        value: panel[name]\n      })\n      modified_props[name] = true\n    }\n  }\n  panel.RemoveAndDeleteChildren()\n  panel.DeleteAsync(0.0)\n}\nlet _Destroy = function() {\n  for(key in modified_props) {\n    delete global_this[key];\n  }\n  modified_props = {}\n}\nreturn {\n  create: _Create,\n  destroy: _Destroy\n}\n";
        local v3008 = {};
        local function v3011(v3009)
            -- upvalues: v3008 (ref), l_panorama_0 (ref), v3007 (ref), v3002 (ref), v3001 (ref)
            if not v3009 then
                v3009 = "";
            end;
            if v3008[v3009] ~= nil then
                return false;
            elseif type(v3009) ~= "string" and v3009.gsub(v3009, " ", "") ~= "" then
                return error("invalid context, expected a non-empty string");
            else
                local v3010 = v3009 == "" and l_panorama_0.loadstring(v3007)() or l_panorama_0.loadstring(v3007, v3009)();
                v3010.create(v3002, v3001);
                v3008[v3009] = v3010;
                return;
            end;
        end;
        pcall(function()
            -- upvalues: v3011 (ref)
            v3011();
        end);
        v1020(function()
            -- upvalues: v3008 (ref)
            for _, v3013 in pairs(v3008) do
                v3013.destroy();
            end;
        end);
        local v3014 = {
            [1] = "CSGOJsRegistration", 
            [2] = "CSGOHud"
        };
        for v3015 = 1, #v3014 do
            do
                local l_v3015_0 = v3015;
                pcall(function()
                    -- upvalues: v3011 (ref), v3014 (ref), l_v3015_0 (ref)
                    v3011(v3014[l_v3015_0]);
                end);
            end;
        end;
        return {
            register_for_context = v3011
        };
    end)();
    v2855.auth(v28(), v47[v48] - 1, v2862);
    v3000();
    return;
else
    print("ERROR: no implementation for " .. v46[v48] .. " found");
    return;
end;