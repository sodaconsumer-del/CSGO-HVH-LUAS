local v0 = "hysteria";
_VER = "4.2a";
_PROJECT = v0;
_DEBUG = not _IS_MARKET;
v0 = 1;
local v1 = common.get_username();
local v2 = {
    common.get_timestamp()
};
local _ = globals.realtime;
local v4 = {
    OFFLINE = string.find(_NAME, "%-w") ~= nil, 
    NOFONTS = string.find(_NAME, "%-f") ~= nil
};
local l_print_0 = print;
local l_require_0 = require;
local l_print_raw_0 = print_raw;
local l_print_error_0 = print_error;
local l_color_0 = color;
local l_next_0 = next;
local l_vector_0 = vector;
local l_type_0 = type;
local _ = pairs;
local l_ipairs_0 = ipairs;
local _ = getmetatable;
local l_setmetatable_0 = setmetatable;
local _ = assert;
local l_rawget_0 = rawget;
local l_rawset_0 = rawset;
local l_unpack_0 = unpack;
local _ = select;
local l_tonumber_0 = tonumber;
local l_tostring_0 = tostring;
local l_error_0 = error;
local l_pcall_0 = pcall;
local _ = xpcall;
local l_print_dev_0 = print_dev;
local function v32(v28)
    -- upvalues: l_next_0 (ref)
    local v29 = {};
    for v30, v31 in l_next_0, v28 do
        v29[v30] = v31;
    end;
    return v29;
end;
local v33 = v32(table);
local v34 = v32(math);
local v35 = v32(string);
v33.new = l_require_0("table.new");
v33.clear = l_require_0("table.clear");
v33.has = function(v36, v37)
    for v38 = 1, #v36 do
        if v36[v38] == v37 then
            return true;
        end;
    end;
    return false;
end;
v33.find = function(v39, v40)
    for v41 = 1, #v39 do
        if v39[v41] == v40 then
            return v41;
        end;
    end;
end;
v33.copy = function(v42)
    -- upvalues: l_type_0 (ref), l_next_0 (ref), v33 (ref)
    if l_type_0(v42) ~= "table" then
        return v42;
    else
        local v43 = {};
        for v44, v45 in l_next_0, v42 do
            v43[v33.copy(v44)] = v33.copy(v45);
        end;
        return v43;
    end;
end;
v33.slide = function(v46, v47, v48)
    -- upvalues: v33 (ref)
    if #v46 == v48 then
        v33.remove(v46, 1);
    end;
    v46[#v46 + 1] = v47;
end;
v33.place = function(v49, v50, v51)
    -- upvalues: l_ipairs_0 (ref), l_type_0 (ref)
    local l_v49_0 = v49;
    for v53, v54 in l_ipairs_0(v50) do
        if l_type_0(l_v49_0[v54]) == "table" then
            l_v49_0 = l_v49_0[v54];
        else
            l_v49_0[v54] = v53 < #v50 and {} or v51;
            l_v49_0 = l_v49_0[v54];
        end;
    end;
    return v49;
end;
v33.random = function(v55)
    -- upvalues: v34 (ref)
    local v56 = v34.random(1, #v55);
    return v55[v56], v56;
end;
v33.filter = function(v57)
    -- upvalues: v33 (ref)
    local v58 = {};
    local v59 = 1;
    for v60 = 1, v33.maxn(v57) do
        if v57[v60] ~= nil then
            local l_v59_0 = v59;
            local v62 = v57[v60];
            v59 = v59 + 1;
            v58[l_v59_0] = v62;
        end;
    end;
    return v58;
end;
v33.distribute = function(v63, v64, v65)
    -- upvalues: l_ipairs_0 (ref)
    local v66 = {};
    for v67, v68 in l_ipairs_0(v63) do
        v66[v65 and v68[v65] or v67] = v64 == nil and v67 or v68[v64];
    end;
    return v66;
end;
local v69 = 180 / v34.pi;
v34.deginrad = v34.pi / 180;
v34.radindeg = v69;
v34.sq3 = function(v70, v71, v72)
    return v70 * v70 + v71 * v71 + (v72 and v72 * v72 or 0);
end;
v34.map = function(v73, v74, v75, v76, v77, v78)
    -- upvalues: v34 (ref)
    if v78 then
        local v79 = v34.clamp(v73, v74, v75);
        if v79 then
            v73 = v79;
        end;
    end;
    return v76 + (v73 - v74) * (v77 - v76) / (v75 - v74);
end;
v34.lerp = function(v80, v81, v82)
    return v80 + (v81 - v80) * v82;
end;
v34.dist = function(v83, v84, v85)
    -- upvalues: v34 (ref)
    local v86 = v84 and v84.x - v83.x or v83.x;
    local v87 = v84 and v84.y - v83.y or v83.y;
    local v88 = not v85 and (v84 and v84.z - v83.z or v83.z) or nil;
    return v34.sqrt(v86 * v86 + v87 * v87 + (v88 and v88 * v88 or 0));
end;
v34.distb = function(v89, v90, v91)
    -- upvalues: v34 (ref)
    local v92 = v90 and v90[1] - v89[1] or v89[1];
    local v93 = v90 and v90[2] - v89[2] or v89[2];
    local v94 = not v91 and (v90 and v90[3] - v89[3] or v89[3]) or nil;
    return v34.sqrt(v92 * v92 + v93 * v93 + (v94 and v94 * v94 or 0));
end;
v34.sqrt3 = function(v95, v96, v97)
    -- upvalues: v34 (ref)
    return v34.sqrt(v95 * v95 + v96 * v96 + (v97 and v97 * v97 or 0));
end;
v34.clamp = function(v98, v99, v100)
    return v98 < v99 and v99 or v100 < v98 and v100 or v98;
end;
v34.cycle = function(v101, v102)
    local v103 = v101 % v102;
    return v103 == 0 and v102 or v103;
end;
v34.round = function(v104)
    -- upvalues: v34 (ref)
    return v34.floor(v104 + 0.5);
end;
v34.roundb = function(v105, v106)
    -- upvalues: v34 (ref)
    local v107 = 10 ^ (v106 or 0);
    return v34.floor(v105 * v107 + 0.5) / v107;
end;
v34.medium = function(...)
    -- upvalues: l_ipairs_0 (ref)
    local v108 = 0;
    local v109 = 0;
    for v110, v111 in l_ipairs_0({
        ...
    }) do
        local l_v110_0 = v110;
        v108 = v108 + v111;
        v109 = l_v110_0;
    end;
    return v108 / v109;
end;
v34.average = function(v113)
    local v114 = 0;
    local v115 = 0;
    for v116 = 1, #v113 do
        local l_v116_0 = v116;
        v114 = v114 + v113[v116];
        v115 = l_v116_0;
    end;
    return v114 / v115;
end;
v34.tolerate = function(v118, v119)
    if v118 < v119 then
        return 0;
    elseif 1 - v119 < v118 then
        return 1;
    else
        return v118;
    end;
end;
v34.angle_to = function(v120, v121)
    -- upvalues: l_vector_0 (ref), v34 (ref)
    local v122 = v121.x - v120.x;
    local v123 = v121.y - v120.y;
    local v124 = v121.z - v120.z;
    return l_vector_0(v34.atan2(-v124, v34.sqrt(v122 * v122 + v123 * v123)) * v34.radindeg, v34.atan2(v123, v122) * v34.radindeg, 0);
end;
v34.angle_vec = function(v125, v126, v127)
    -- upvalues: v34 (ref), l_vector_0 (ref)
    local v128 = v125 * v34.deginrad;
    local v129 = v126 * v34.deginrad;
    v127 = v127 * v34.deginrad;
    v126 = v129;
    v125 = v128;
    v128 = v34.cos(v125);
    v129 = v34.sin(v125);
    local v130 = v34.cos(v126);
    local v131 = v34.sin(v126);
    local v132 = v34.cos(v127);
    local v133 = v34.sin(v127);
    return l_vector_0(v128 * v130, v128 * v131, -v129), l_vector_0(-1 * v133 * v129 * v130 + -1 * v132 * -v131, -1 * v133 * v129 * v131 + -1 * v132 * v130, -1 * v133 * v128);
end;
v34.extend_vec = function(v134, v135, v136, v137, v138)
    -- upvalues: v34 (ref)
    local v139 = v135 * v34.deginrad;
    return v136 + v34.cos(v139) * v134, v137 + v34.sin(v139) * v134, v138;
end;
v34.angle_diff = function(v140, v141)
    return (v140 - v141 + 180) % 360 - 180;
end;
v34.extrapolate = function(v142, v143, v144)
    return v142 + v143 * globals.tickinterval * v144;
end;
v34.relative_yaw = function(v145, v146)
    -- upvalues: v34 (ref)
    return v34.atan2(v145.y - v146.y, v145.x - v146.x) * v34.radindeg;
end;
v34.relative_pitch = function(v147, v148)
    -- upvalues: v34 (ref)
    return v34.atan2(-(v148.z - v147.z), v34.sqrt((v148.x - v147.x) * (v148.x - v147.x) + (v148.y - v147.y) * (v148.y - v147.y))) * v34.radindeg;
end;
v34.normalize_yaw = function(v149)
    return (v149 + 180) % -360 + 180;
end;
v34.normalize_pitch = function(v150)
    return v150 < -89 and -89 or v150 > 89 and 89 or v150;
end;
v35.clean = function(v151)
    -- upvalues: v35 (ref)
    return v35.gsub(v35.gsub(v151, "^%s+", ""), "%s+$", "");
end;
v35.limit = function(v152, v153, v154)
    -- upvalues: v35 (ref), v33 (ref)
    local v155 = {};
    local v156 = 1;
    for v157 in v35.gmatch(v152, ".[\128-\191]*") do
        local v158 = v156 + 1;
        v155[v156] = v157;
        v156 = v158;
        if v153 < v156 then
            if v154 then
                v155[v156] = v154 == true and "..." or v154;
                break;
            else
                break;
            end;
        end;
    end;
    return v33.concat(v155);
end;
v35.insert = function(v159, v160, v161)
    -- upvalues: v35 (ref)
    return v35.sub(v159, 1, v161) .. v160 .. v35.sub(v159, v161 + 1);
end;
v69 = function(...)
    -- upvalues: v33 (ref), v35 (ref)
    return v33.concat({
        v35.char(...)
    });
end;
local function _(v162)
    -- upvalues: v33 (ref), v35 (ref)
    return v33.concat({
        v35.byte(v162, 1, #v162)
    }, ",");
end;
local function v166(v164, v165)
    return v164 ~= v165;
end;
local v167 = l_require_0(v1 == "enQ" and "pui" or "neverlose/pui");
local v168 = l_require_0("neverlose/sec-base64");
local v169 = _DEBUG and function(...)
    -- upvalues: l_print_raw_0 (ref), l_print_dev_0 (ref)
    l_print_raw_0(_PROJECT, " \226\128\148 ", ...);
    l_print_dev_0(...);
end or function()

end;
if not _DEBUG or not l_require_0("inspect") then
    local function _(...)
        return ...;
    end;
end;
local function v174(v171, v172, v173)
    if v171 then
        return v172;
    else
        return v173;
    end;
end;
local function _(v175, ...)
    -- upvalues: l_pcall_0 (ref), l_unpack_0 (ref)
    local v176 = {
        l_pcall_0(v175, ...)
    };
    if v176[1] then
        return l_unpack_0(v176, 2);
    else
        return nil;
    end;
end;
if _DEBUG then
    l_setmetatable_0(_G, {
        __index = function(_, v179)
            -- upvalues: v169 (ref)
            v169("_G READ: ", v179);
            return nil;
        end, 
        __newindex = function(v180, v181, v182)
            -- upvalues: v169 (ref), l_rawset_0 (ref)
            v169("_G SET: ", v181);
            l_rawset_0(v180, v181, v182);
        end
    });
end;
local v183 = nil;
local v184 = nil;
local v185 = nil;
local l_events_0 = _G.events;
local l_any_0 = l_events_0.any;
local v188 = {
    set = l_any_0.set, 
    unset = l_any_0.unset, 
    call = l_any_0.call
};
local v189 = nil;
do
    local l_l_events_0_0, l_v188_0, l_v189_0 = l_events_0, v188, v189;
    l_v189_0 = {
        set = function(v193, v194)
            -- upvalues: l_type_0 (ref)
            if l_type_0(v194) == "function" and v193.proxy[v194] == nil then
                local v195 = #v193.callbacks + 1;
                local l_callbacks_0 = v193.callbacks;
                local l_proxy_0 = v193.proxy;
                local l_v194_0 = v194;
                l_proxy_0[v194] = v195;
                l_callbacks_0[v195] = l_v194_0;
            end;
        end, 
        unset = function(v199, v200)
            -- upvalues: v33 (ref), l_next_0 (ref)
            local v201 = v199.proxy[v200];
            if v201 == nil then
                return;
            else
                v33.remove(v199.callbacks, v201);
                v199.proxy[v200] = nil;
                for v202, v203 in l_next_0, v199.proxy do
                    if v201 < v203 then
                        v199.proxy[v202] = v203 - 1;
                    end;
                end;
                return;
            end;
        end, 
        __call = function(v204, v205, v206)
            -- upvalues: l_v189_0 (ref)
            if v206 ~= false then
                l_v189_0.set(v204, v205);
            else
                l_v189_0.unset(v204, v205);
            end;
        end, 
        call = function(v207, ...)
            -- upvalues: l_v188_0 (ref)
            if v207.name == "voice_message" then
                return l_v188_0.call(v207[0], ...);
            else
                return v207.mainfn(...);
            end;
        end, 
        gcall = function(v208, ...)
            -- upvalues: l_v188_0 (ref)
            l_v188_0.call(v208[0], ...);
        end, 
        unhook = function(v209)
            -- upvalues: l_v188_0 (ref)
            l_v188_0.unset(v209[0], v209.mainfn);
        end
    };
    l_v189_0.__index = l_v189_0;
    v185 = l_setmetatable_0({}, {
        __index = function(v210, v211)
            -- upvalues: l_setmetatable_0 (ref), l_l_events_0_0 (ref), l_v189_0 (ref), l_v188_0 (ref), l_rawset_0 (ref)
            local v212 = l_setmetatable_0({
                [0] = l_l_events_0_0[v211], 
                name = v211, 
                proxy = {}, 
                callbacks = {}
            }, l_v189_0);
            v212.mainfn = function(...)
                -- upvalues: v212 (ref)
                local v213 = nil;
                for v214 = 1, #v212.callbacks do
                    if v212.callbacks[v214] then
                        local v215 = v212.callbacks[v214](...);
                        if v215 ~= nil then
                            v213 = v215;
                        end;
                    end;
                end;
                return v213;
            end;
            l_v188_0.set(v212[0], v212.mainfn);
            l_rawset_0(v210, v211, v212);
            return v212;
        end
    });
end;
l_events_0 = nil;
l_any_0 = nil;
l_events_0 = l_print_0;
v188 = 0;
v189 = nil;
do
    local l_v188_1, l_v189_1 = v188, v189;
    v185.accent_settings_change:set(function(v218)
        -- upvalues: l_v189_1 (ref)
        l_v189_1 = v218.value[1];
    end);
    l_any_0 = function(...)
        -- upvalues: v184 (ref), l_v189_1 (ref), l_color_0 (ref), l_v188_1 (ref), l_type_0 (ref), v35 (ref), l_tostring_0 (ref), l_print_raw_0 (ref), l_unpack_0 (ref)
        local l_hex_0 = v184.hex;
        local l_hex2_0 = v184.hex2;
        if l_v189_1 == "Rainbow" then
            local _, v222, v223 = v184.accent:to_hsv();
            l_hex_0 = "\a" .. l_color_0():as_hsv(l_v188_1 * 15 % 360 / 360, v222, v223, 1):to_hex();
            l_hex2_0 = l_hex_0;
        end;
        local v224 = {
            ["\r"] = "\aDEFAULT", 
            ["\v"] = l_hex_0, 
            ["\f"] = l_hex2_0
        };
        local v225 = {
            ...
        };
        for v226 = 1, #v225 do
            if l_type_0(v225[v226]) == "string" then
                v225[v226] = v35.gsub(v225[v226], "[\v\r\f]", v224);
            else
                v225[v226] = l_tostring_0(v225[v226]);
            end;
        end;
        l_print_raw_0(l_unpack_0(v225));
        l_v188_1 = l_v188_1 == 23 and 0 or l_v188_1 + 1;
    end;
    l_print_0 = function(...)
        -- upvalues: l_any_0 (ref)
        l_any_0("\vhysteria\r ", ...);
    end;
end;
v188 = nil;
v189 = _PROJECT .. "::db";
local v227 = 2;
v188 = {
    key = v189, 
    version = v227
};
local v228 = db[v189];
if not v228 then
    db[v189] = {
        version = v188.version, 
        configs = {}, 
        stats = {}
    };
    v228 = db[v189];
end;
if v228.version ~= v227 then
    v228.version = v227;
end;
v228.stats.loaded = (v228.stats.loaded or 0) + 1;
do
    local l_v189_2, l_v228_0 = v189, v228;
    do
        local function v231()
            -- upvalues: v185 (ref), l_v189_2 (ref), l_v228_0 (ref), v231 (ref)
            v185.database_pre_save:call();
            db[l_v189_2] = l_v228_0;
            utils.execute_after(300, v231);
        end;
        utils.execute_after(300, v231);
    end;
    v185.shutdown:set(function()
        -- upvalues: l_v189_2 (ref), l_v228_0 (ref)
        db[l_v189_2] = l_v228_0;
    end);
    v188.stats = l_setmetatable_0({}, {
        __index = function(_, v233)
            -- upvalues: l_v228_0 (ref)
            local v234 = l_v228_0.stats[v233];
            if v234 then
                return v234;
            else
                l_v228_0.stats[v233] = 0;
                return 0;
            end;
        end, 
        __newindex = function(_, v236, v237)
            -- upvalues: l_v228_0 (ref), v185 (ref)
            l_v228_0.stats[v236] = v237;
            v185.stats_update:call();
        end
    });
    v188.__direct = l_v228_0;
    l_setmetatable_0(v188, {
        __index = l_v228_0, 
        __call = function(_)
            -- upvalues: l_v189_2 (ref), l_v228_0 (ref)
            db[l_v189_2] = l_v228_0;
        end
    });
end;
v189 = nil;
v227 = ffi.typeof("char[?]");
v228 = utils.get_vfunc("vgui2.dll", "VGUI_System010", 7, "int(__thiscall*)(void*)");
local v239 = utils.get_vfunc("vgui2.dll", "VGUI_System010", 9, "void(__thiscall*)(void*, const char*, int)");
local v240 = utils.get_vfunc("vgui2.dll", "VGUI_System010", 11, "int(__thiscall*)(void*, int, const char*, int)");
do
    local l_v227_0, l_v228_1, l_v239_0, l_v240_0 = v227, v228, v239, v240;
    v189 = {
        get = function()
            -- upvalues: l_v228_1 (ref), l_v227_0 (ref), l_v240_0 (ref)
            local v245 = l_v228_1();
            if v245 == 0 then
                return;
            else
                local v246 = l_v227_0(v245);
                l_v240_0(0, v246, v245);
                return ffi.string(v246, v245 - 1);
            end;
        end, 
        set = function(v247)
            -- upvalues: l_tostring_0 (ref), l_v239_0 (ref)
            v247 = l_tostring_0(v247);
            l_v239_0(v247, #v247);
        end
    };
end;
v227 = nil;
v228 = nil;
v239 = nil;
v240 = nil;
local v248 = 1;
local v249 = render.screen_size();
v239 = v249;
v227 = v249 / v248;
local v250 = v249 * 0.5;
v228 = v227 * 0.5;
v240 = v250;
v248 = nil;
v184 = {};
v249 = function(v251, v252, v253, v254)
    -- upvalues: v4 (ref), l_pcall_0 (ref), v169 (ref)
    if v4.NOFONTS then
        return v254 or 1;
    else
        local v255, v256 = l_pcall_0(render.load_font, v251, v252, v253);
        if not v255 then
            v169(v251, " font has not been loaded, contact developers if the problem persists.");
            return v254 or 1;
        else
            return v256;
        end;
    end;
end;
v250 = {
    big = v249("Segoe UI Bold", l_vector_0(16, 16), "a"), 
    bold = v249("Segoe UI Bold", l_vector_0(14, 12), "a"), 
    bold_d = v249("Segoe UI Bold", l_vector_0(14, 12), "ad"), 
    regular = v249("Segoe UI Semibold", l_vector_0(14, 12), "a"), 
    regular_d = v249("Segoe UI Semibold", l_vector_0(14, 12), "ad"), 
    small = v249("Segoe UI Semibold", l_vector_0(12, 11), "a", 1), 
    small_d = v249("Segoe UI Semibold", l_vector_0(12, 11), "ad", 1)
};
local v257 = {
    regular = 1, 
    small = 2, 
    bold_d = 4, 
    bold = 4, 
    small_d = 2, 
    big = 4, 
    regular_d = 1
};
v248 = v250;
do
    local l_v250_0, l_v257_0 = v250, v257;
    v185.style_changed:set(function(v260)
        -- upvalues: v248 (ref), l_v250_0 (ref), l_v257_0 (ref)
        v248 = v260 == 1 and l_v250_0 or l_v257_0;
    end);
    v184 = {
        hexs = "\a74A6A9", 
        hex = "\a74A6A9FF", 
        accent = l_color_0("74A6A9"), 
        back = l_color_0(23, 26, 28), 
        dark = l_color_0(5, 6, 8), 
        white = l_color_0(255), 
        black = l_color_0(0), 
        null = l_color_0(0, 0, 0, 0), 
        text = l_color_0(240), 
        themes = {
            dark = {
                text = l_color_0(240), 
                l1 = l_color_0(5, 6, 8, 96), 
                g1 = l_color_0(5, 6, 8, 140), 
                l2 = l_color_0(23, 26, 28, 96), 
                g2 = l_color_0(23, 26, 28, 140)
            }, 
            light = {
                text = l_color_0(24), 
                l1 = l_color_0(236, 239, 242), 
                g1 = l_color_0(236, 239, 242), 
                l2 = l_color_0(236, 239, 242), 
                g2 = l_color_0(236, 239, 242)
            }
        }, 
        simple = {
            g1 = l_color_0(0, 0, 0, 80)
        }
    };
    v184.panel = v184.themes.dark;
end;
v249 = nil;
v250 = _G.render;
v257 = v34.floor;
local v261 = 1;
local v262 = "s";
do
    local l_v250_1, l_v261_0, l_v262_0 = v250, v261, v262;
    local function v267(v266)
        -- upvalues: l_v261_0 (ref)
        if l_v261_0 == 1 then
            return v266;
        else
            return v266 * l_v261_0;
        end;
    end;
    local v268 = 1;
    local v269 = {};
    local l_alpha_modulate_0 = l_color_0().alpha_modulate;
    local function v273(v271, v272)
        -- upvalues: v268 (ref), v184 (ref), l_alpha_modulate_0 (ref)
        if v268 == 1 then
            return v271;
        elseif not v272 and v268 == 0 then
            return v184.null;
        else
            return l_alpha_modulate_0(v271, v268, true);
        end;
    end;
    local v274 = {};
    local _ = "";
    local v276 = l_v250_1.get_scale(2) ~= 1;
    do
        local l_v276_0 = v276;
        v274 = {
            callback = function(v278)
                -- upvalues: l_v261_0 (ref), l_v250_1 (ref), l_v262_0 (ref), v249 (ref), v185 (ref), l_v276_0 (ref)
                l_v261_0 = v278 and l_v250_1.get_scale(2) or 1;
                l_v262_0 = l_v261_0 ~= 1 and "s" or "";
                if v249.dpi ~= l_v261_0 then
                    v185.render_dpi:call(l_v261_0, v249.dpi, l_v276_0);
                    local l_v249_0 = v249;
                    local l_l_v261_0_0 = l_v261_0;
                    l_v276_0 = false;
                    l_v249_0.dpi = l_l_v261_0_0;
                end;
            end
        };
    end;
    v185.render_dpi:set(function(v281, _)
        -- upvalues: v227 (ref), v239 (ref), v228 (ref)
        v227 = v239 / v281;
        v228 = v227 * 0.5;
    end);
    v276 = v167.alpha > 0;
    do
        local l_v276_1 = v276;
        v185.render:set(function()
            -- upvalues: v185 (ref), l_v276_1 (ref), v167 (ref)
            v185.pre_render_native:call();
            if l_v276_1 then
                v185.render_ui:call();
            end;
            v185.pre_hud_render:call();
            l_v276_1 = v167.alpha > 0;
        end);
    end;
    v249 = l_setmetatable_0({
        style = 1, 
        dpi = 1, 
        cheap = false, 
        dpi_t = v274, 
        push_alpha = function(v284)
            -- upvalues: v269 (ref), l_error_0 (ref), v268 (ref)
            local v285 = #v269;
            if v285 > 255 then
                l_error_0("alpha stack exceeded 255 objects, report to developers");
            end;
            v269[v285 + 1] = v284;
            v268 = v268 * v269[v285 + 1] * (v269[v285] or 1);
        end, 
        pop_alpha = function()
            -- upvalues: v269 (ref), v268 (ref)
            local v286 = #v269;
            local l_v269_0 = v269;
            local l_v286_0 = v286;
            local v289 = nil;
            v286 = v286 - 1;
            l_v269_0[l_v286_0] = v289;
            v268 = v286 == 0 and 1 or v269[v286] * (v269[v286 - 1] or 1);
        end, 
        get_alpha = function(v290)
            -- upvalues: v269 (ref), v268 (ref)
            if v290 then
                return v269[v290];
            else
                return v268, #v269;
            end;
        end, 
        screen_size = function(v291)
            -- upvalues: l_v250_1 (ref), l_v261_0 (ref)
            return l_v250_1.screen_size() / (v291 and 1 or l_v261_0);
        end, 
        measure_text = function(v292, ...)
            -- upvalues: l_v250_1 (ref), l_v262_0 (ref), l_v261_0 (ref)
            return l_v250_1.measure_text(v292, l_v262_0, ...) / l_v261_0;
        end, 
        load_font = function(v293, v294, v295)
            -- upvalues: l_v250_1 (ref)
            return l_v250_1.load_font(v293, v294, v295 or "");
        end, 
        text = function(v296, v297, v298, v299, v300, v301)
            -- upvalues: l_v250_1 (ref), v267 (ref), v273 (ref), l_v262_0 (ref), v249 (ref)
            l_v250_1.text(v296, v267(v297), v273(v298), v299 and v299 .. l_v262_0 or l_v262_0, v300);
            if v301 == true then
                return v249.measure_text(v296, v300);
            else
                return;
            end;
        end, 
        blur = function(v302, v303, v304, v305, v306)
            -- upvalues: v249 (ref), l_type_0 (ref), v267 (ref), v268 (ref), l_v250_1 (ref)
            if v249.cheap then
                return;
            else
                if l_type_0(v306) == "table" then
                    for v307 = 1, 4 do
                        v306[v307] = v267(v306[v307] or 0);
                    end;
                else
                    v306 = v267(v306 or 0);
                end;
                local v308 = (v305 or 1) * v268;
                v304 = v267(v304 or 2);
                v305 = v308;
                if v305 > 0 and v304 > 0 then
                    l_v250_1.blur(v267(v302), v267(v303), v304, v305, v306);
                end;
                return;
            end;
        end, 
        shadow = function(v309, v310, v311, v312, v313, v314)
            -- upvalues: v249 (ref), l_v250_1 (ref), v267 (ref), v273 (ref)
            if v249.cheap then
                return;
            else
                l_v250_1.shadow(v267(v309), v267(v310), v273(v311), v267(v312 or 16), v267(v313 or 0), v267(v314 or 0));
                return;
            end;
        end, 
        poly = function(v315, ...)
            -- upvalues: v267 (ref), l_v250_1 (ref), v273 (ref), l_unpack_0 (ref)
            local v316 = {
                ...
            };
            for v317 = 1, #v316 do
                v316[v317] = v267(v316[v317]);
            end;
            l_v250_1.poly(v273(v315), l_unpack_0(v316));
        end, 
        line = function(v318, v319, v320)
            -- upvalues: l_v250_1 (ref), v267 (ref), v273 (ref)
            l_v250_1.line(v267(v318), v267(v319), v273(v320));
        end, 
        rect = function(v321, v322, v323, v324, v325)
            -- upvalues: l_type_0 (ref), v267 (ref), l_v250_1 (ref), v273 (ref)
            if l_type_0(v324) == "table" then
                for v326 = 1, 4 do
                    v324[v326] = v267(v324[v326] or 0);
                end;
            else
                v324 = v267(v324 or 0);
            end;
            l_v250_1.rect(v267(v321), v267(v322), v273(v323), v324, v325 or false);
        end, 
        rect_outline = function(v327, v328, v329, v330, v331, v332)
            -- upvalues: l_type_0 (ref), v267 (ref), l_v250_1 (ref), v273 (ref)
            if l_type_0(v331) == "table" then
                for v333 = 1, 4 do
                    v331[v333] = v267(v331[v333] or 0);
                end;
            else
                v331 = v267(v331 or 0);
            end;
            l_v250_1.rect_outline(v267(v327), v267(v328), v273(v329), v267(v330 or 0), v331, v332 or false);
        end, 
        gradient = function(v334, v335, v336, v337, v338, v339, v340)
            -- upvalues: l_v250_1 (ref), v267 (ref), v273 (ref)
            local v341 = v338 or v336;
            if not v339 then
                v339 = v337;
            end;
            l_v250_1.gradient(v267(v334), v267(v335), v273(v336, true), v273(v337, true), v273(v341, true), v273(v339, true), v340 or 0);
        end, 
        circle = function(v342, v343, v344, v345, v346)
            -- upvalues: l_v250_1 (ref), v267 (ref), v273 (ref)
            l_v250_1.circle(v267(v342), v273(v343), v267(v344), v345 or 0, v346 or 1);
        end, 
        circle_outline = function(v347, v348, v349, v350, v351, v352)
            -- upvalues: l_v250_1 (ref), v267 (ref), v273 (ref)
            l_v250_1.circle_outline(v267(v347), v273(v348), v267(v349), v350 or 0, v351 or 1, v267(v352 or 1));
        end, 
        circle_3d = function(v353, v354, v355, v356, v357)
            -- upvalues: l_v250_1 (ref), v273 (ref)
            l_v250_1.circle_3d(v353, v273(v354), v355, v356 or 0, v357 or 1, false);
        end, 
        circle_3d_outline = function(v358, v359, v360, v361, v362, v363)
            -- upvalues: l_v250_1 (ref), v273 (ref), v267 (ref)
            l_v250_1.circle_3d_outline(v358, v273(v359), v360, v361 or 0, v362 or 1, v267(v363 or 1));
        end, 
        circle_3d_gradient = function(v364, v365, v366, v367, v368, v369, v370)
            -- upvalues: l_v250_1 (ref), v273 (ref), v267 (ref)
            l_v250_1.circle_3d_gradient(v364, v273(v365), v273(v366), v367, v368 or 0, v369 or 1, v267(v370 or 1));
        end, 
        texture = function(v371, v372, v373, v374, v375, v376)
            -- upvalues: l_color_0 (ref), l_v250_1 (ref), v267 (ref), l_vector_0 (ref), v273 (ref)
            if not v371 then
                return;
            else
                if not v374 then
                    v374 = l_color_0();
                end;
                l_v250_1.texture(v371, v267(v372), v267(v373 or l_vector_0(v371.width, v371.height)), v273(v374), v375 or "", v376 or 0);
                return;
            end;
        end, 
        push_clip_rect = function(v377, v378, v379)
            -- upvalues: l_v250_1 (ref), v267 (ref)
            l_v250_1.push_clip_rect(v267(v377), v267(v378), v379 or false);
        end
    }, {
        __index = l_v250_1
    });
end;
v250 = nil;
v257 = l_setmetatable_0({}, {
    __mode = "k"
});
v261 = 0;
v262 = 1;
local v386 = {
    pow = {
        [1] = function(v380, v381)
            return 1 - (1 - v380) ^ (v381 or 3);
        end, 
        [2] = function(v382, v383)
            return v382 ^ (v383 or 3);
        end, 
        [3] = function(v384, v385)
            -- upvalues: v34 (ref)
            return v384 < 0.5 and 4 * v34.pow(v384, v385 or 3) or 1 - v34.pow(-2 * v384 + 2, v385 or 3) * 0.5;
        end
    }
};
do
    local l_v257_1, l_v261_1, l_v262_1, l_v386_0 = v257, v261, v262, v386;
    v250 = {
        pulse = 0, 
        easings = l_v386_0, 
        lerp = function(v391, v392, v393, v394)
            -- upvalues: l_v261_1 (ref), l_v262_1 (ref), v34 (ref)
            local v395 = v391 + (v392 - v391) * l_v261_1 * (v393 or 8) * l_v262_1;
            return v34.abs(v392 - v395) < (v394 or 0.002) and v392 or v395;
        end, 
        condition = function(v396, v397, v398, v399)
            -- upvalues: l_v257_1 (ref), l_type_0 (ref), v34 (ref), l_v261_1 (ref), l_v262_1 (ref), l_v386_0 (ref)
            local v400 = v396[1] and v396 or l_v257_1[v396];
            if not v400 then
                l_v257_1[v396] = {
                    [1] = v397 and 1 or 0, 
                    [2] = v397
                };
                v400 = l_v257_1[v396];
            end;
            if not v398 then
                v398 = 4;
            end;
            local l_v398_0 = v398;
            if l_type_0(v398) == "table" then
                l_v398_0 = v397 and v398[1] or v398[2];
            end;
            v400[1] = v34.clamp(v400[1] + l_v261_1 * v34.abs(l_v398_0) * l_v262_1 * (v397 and 1 or -1), 0, 1);
            return (not (v400[1] % 1 ~= 0) or l_v398_0 < 0) and v400[1] or l_v386_0.pow[v399 and (v397 and v399[1][1] or v399[2][1]) or v397 and 1 or 3](v400[1], v399 and (v397 and v399[1][2] or v399[2][2]) or 3);
        end
    };
    v185.post_render:set(function()
        -- upvalues: v250 (ref), v34 (ref), l_v261_1 (ref)
        v250.pulse = v34.abs(globals.realtime * 1 % 2 - 1);
        l_v261_1 = globals.frametime;
    end);
end;
v257 = nil;
v261 = nil;
v262 = {};
v386 = function(v402, v403, v404)
    return v402.x >= v403.x and v402.x <= v404.x and v402.y >= v403.y and v402.y <= v404.y;
end;
local v405 = v167.create("drag data");
v405:visibility(false);
do
    local l_v261_2, l_v262_2, l_v386_1, l_v405_0 = v261, v262, v386, v405;
    v257 = {
        data = l_v262_2, 
        in_bounds = l_v386_1, 
        ui_group = l_v405_0, 
        new = function(v410, v411)
            -- upvalues: l_v262_2 (ref), l_v405_0 (ref), v227 (ref), v34 (ref), l_vector_0 (ref), v239 (ref), v185 (ref), v167 (ref)
            if not v411 then
                v411 = {};
            end;
            l_v262_2[v410.id] = {
                x = l_v405_0:slider(v410.id .. "::x", 0, 10000, v410.pos.x / v227.x * 10000), 
                y = l_v405_0:slider(v410.id .. "::y", 0, 10000, v410.pos.y / v227.y * 10000)
            };
            l_v262_2[v410.id].x:set_callback(function(v412)
                -- upvalues: v410 (ref), v34 (ref), v227 (ref)
                v410.pos.x = v34.round(v412.value * 1.0E-4 * v227.x);
            end, true);
            l_v262_2[v410.id].y:set_callback(function(v413)
                -- upvalues: v410 (ref), v34 (ref), v227 (ref)
                v410.pos.y = v34.round(v413.value * 1.0E-4 * v227.y);
            end, true);
            v410.__drag = {
                active = false, 
                locked = false, 
                point = l_vector_0(), 
                progress = {
                    [1] = {
                        [1] = 0
                    }, 
                    [2] = {
                        [1] = 0
                    }, 
                    [3] = {
                        [1] = 0
                    }
                }, 
                border = v411.border or {
                    [1] = l_vector_0(), 
                    [2] = v239
                }, 
                rulers = v411.rulers or {}, 
                on_release = v411.on_release, 
                on_held = v411.on_held, 
                on_active = v411.on_active, 
                config = l_v262_2[v410.id]
            };
            v185.mouse_input:set(function()
                -- upvalues: v167 (ref), v410 (ref)
                if v167.alpha > 0 and (v410.__drag.hovered or v410.__drag.active) then
                    return false;
                else
                    return;
                end;
            end);
            v185.render_dpi:set(function(_, _, _)
                -- upvalues: l_v262_2 (ref), v410 (ref)
                l_v262_2[v410.id].x:set(l_v262_2[v410.id].x.value);
                l_v262_2[v410.id].y:set(l_v262_2[v410.id].y.value);
            end);
        end, 
        think = function(v417)
            -- upvalues: v167 (ref), v249 (ref), l_v386_1 (ref), l_v261_2 (ref), v250 (ref), v184 (ref), l_ipairs_0 (ref), v34 (ref), l_vector_0 (ref), v227 (ref), l_color_0 (ref)
            local l___drag_0 = v417.__drag;
            if l___drag_0.locked or v167.alpha == 0 then
                return;
            else
                local v419 = ui.get_mouse_position() / v249.dpi;
                local l_menu_position_0 = v167.menu_position;
                local l_menu_size_0 = v167.menu_size;
                local v422 = v167.alpha > 0 and common.is_button_down(1);
                local v423 = l_v386_1(v419, v417.pos, v417.pos + v417.size) and not l_v386_1(v419, l_menu_position_0 / v249.dpi, (l_menu_position_0 + l_menu_size_0) / v249.dpi);
                if v422 and l___drag_0.ready == nil then
                    local l_v423_0 = v423;
                    local v425 = v417.pos - v419;
                    l___drag_0.init = v417.pos:clone();
                    l___drag_0.point = v425;
                    l___drag_0.ready = l_v423_0;
                end;
                if v422 and l___drag_0.ready then
                    if l_v261_2 == nil and l___drag_0.on_held then
                        l___drag_0.on_held(v417, l___drag_0);
                    end;
                    l_v261_2 = l___drag_0.ready and l_v261_2 == nil and v417.id or l_v261_2;
                    l___drag_0.active = l_v261_2 == v417.id;
                elseif not v422 then
                    if l___drag_0.active and l___drag_0.on_release then
                        l___drag_0.on_release(v417, l___drag_0);
                    end;
                    l___drag_0.active = false;
                    local v426 = nil;
                    local v427 = nil;
                    local v428 = nil;
                    local v429 = nil;
                    l_v261_2 = nil;
                    l___drag_0.aligning = v429;
                    l___drag_0.init = v428;
                    l___drag_0.point = v427;
                    l___drag_0.ready = v426;
                end;
                local v430 = v417.pos * v249.dpi;
                local v431 = v417.size * v249.dpi;
                l___drag_0.hovered = v423 or l___drag_0.active;
                local v432 = {};
                local v433 = v430 + v431 * 0.5;
                local v434 = l___drag_0.point and (l___drag_0.point + v419) * v249.dpi or v430;
                local v435 = v250.condition(l___drag_0.progress[1], l___drag_0.active, 4);
                local v436 = v250.condition(l___drag_0.progress[2], l___drag_0.active or l___drag_0.hovered, -12);
                v249.push_alpha(v167.alpha);
                v249.rect(v417.pos - 4, v417.pos + v417.size + 4, v184.white:alpha_modulate(0.1 * (v436 * 0.65 + 0.35), true), 6);
                v249.rect_outline(v417.pos - 5, v417.pos + v417.size + 5, v184.white:alpha_modulate(0.3 * v435, true), 1, 7);
                v249.push_alpha(v435);
                if v435 > 0 and not common.is_button_down(162) then
                    local v437 = (v434 + v431 * 0.5) / v249.dpi;
                    for _, v439 in l_ipairs_0(l___drag_0.rulers) do
                        v439[4] = v439[4] or {
                            [1] = 0
                        };
                        local v440 = v439[2] / v249.dpi;
                        local v441 = v34.abs(v439[1] and v437.x - v440.x or v437.y - v440.y) < 10 * v249.dpi;
                        local l_v440_0 = v440;
                        local v443 = v439[1] and l_vector_0(v440.x + 1, v439[3] / v249.dpi) or l_vector_0(v439[3] / v249.dpi, v440.y + 1);
                        local v444 = v439[1] and 1 or 2;
                        if not v432[v444] then
                            v432[v444] = v441 and (v439[1] and v440.x - v417.size.x * 0.5 or v440.y - v417.size.y * 0.5) or nil;
                        end;
                        local v445 = v34.abs(v439[1] and v433.x - v440.x or v433.y - v440.y);
                        local v446 = v250.condition(v439[4], v441 or v445 < 10 * v249.dpi, -8) * 0.35 + 0.1;
                        v249.rect(l_v440_0, v443, v184.white:alpha_modulate(v446, true));
                    end;
                    if l___drag_0.border[3] then
                        local v447 = l_v386_1(v417.pos, l___drag_0.border[1], l___drag_0.border[2] - v417.size * 0.5 - 1);
                        local v448 = v250.condition(l___drag_0.progress[3], not v447);
                        v249.rect_outline(l___drag_0.border[1] / v249.dpi, l___drag_0.border[2] / v249.dpi, v184.white:alpha_modulate(v448 * 0.75 + 0.25, true), 1, 4);
                    end;
                end;
                v249.pop_alpha();
                v249.pop_alpha();
                if l___drag_0.active then
                    local v449 = v434 / v249.dpi;
                    if common.is_button_down(160) then
                        local v450 = l___drag_0.init:to(v449);
                        local v451 = v34.abs(v450.y);
                        local v452 = v34.abs(v450.x);
                        if l___drag_0.aligning == nil then
                            if v451 > 0.9 then
                                l___drag_0.aligning = 0;
                            elseif v452 > 0.9 then
                                l___drag_0.aligning = 1;
                            end;
                        end;
                        if l___drag_0.aligning == 0 then
                            v449.x = l___drag_0.init.x;
                            v249.rect(l_vector_0(v449.x + v417.size.x * 0.5, 0), l_vector_0(v449.x + v417.size.x * 0.5 + 1, v227.y), l_color_0(255, 64));
                        elseif l___drag_0.aligning == 1 then
                            v449.y = l___drag_0.init.y;
                            v249.rect(l_vector_0(0, v449.y + v417.size.y * 0.5), l_vector_0(v227.x, v449.y + v417.size.y * 0.5 + 1), l_color_0(255, 64));
                        end;
                    end;
                    local v453 = v432[1] or v449.x;
                    v449.y = v432[2] or v449.y;
                    v449.x = v453;
                    v453 = (l___drag_0.border[1] - v431 * 0.5) / v249.dpi;
                    local v454 = (l___drag_0.border[2] - v431 * 0.5) / v249.dpi;
                    v417:set_position(v34.clamp(v449.x, v453.x, v34.min(v454.x, v227.x - v417.size.x)), (v34.clamp(v449.y, v453.y, v34.min(v454.y, v227.y - v417.size.y))));
                    if l___drag_0.on_active then
                        l___drag_0.on_active(v417, l___drag_0, v449);
                    end;
                end;
                return;
            end;
        end
    };
end;
v261 = nil;
v262 = nil;
do
    local l_v262_3 = v262;
    l_v262_3 = {
        update = function(_)
            return 1;
        end, 
        paint = function(_, _, _)

        end, 
        set_position = function(v460, v461, v462)
            -- upvalues: l_type_0 (ref), v227 (ref)
            local v463 = nil;
            local v464 = nil;
            if l_type_0(v461) == "userdata" then
                local l_x_0 = v461.x;
                v464 = v461.y;
                v463 = l_x_0;
            else
                local l_v461_0 = v461;
                v464 = v462;
                v463 = l_v461_0;
            end;
            if v460.__drag then
                if v463 then
                    v460.__drag.config.x:set(v463 / v227.x * 10000);
                end;
                if v464 then
                    v460.__drag.config.y:set(v464 / v227.y * 10000);
                end;
            else
                local l_pos_0 = v460.pos;
                local l_pos_1 = v460.pos;
                local v469;
                if not v463 then
                    v469 = v460.pos.x;
                else
                    v469 = v463;
                end;
                local v470;
                if not v464 then
                    v470 = v460.pos.y;
                else
                    v470 = v464;
                end;
                l_pos_1.y = v470;
                l_pos_0.x = v469;
            end;
        end, 
        get_drag_position = function(v471)
            -- upvalues: l_vector_0 (ref), v227 (ref)
            local v472 = v471.__drag and v471.__drag.config;
            if not v472 then
                return v471.pos;
            else
                local l_value_0 = v472.x.value;
                local l_value_1 = v472.y.value;
                return l_vector_0(l_value_0 * 1.0E-4 * v227.x, l_value_1 * 1.0E-4 * v227.y);
            end;
        end, 
        __call = function(v475)
            -- upvalues: v249 (ref), v257 (ref), l_v262_3 (ref)
            local l___list_0 = v475.__list;
            local l___drag_1 = v475.__drag;
            if l___list_0 then
                local v478 = l___list_0.collect();
                l___list_0.active = 0;
                l___list_0.items = v478;
                for v479 = 1, #l___list_0.items do
                    if l___list_0.items[v479].active then
                        l___list_0.active = l___list_0.active + 1;
                    end;
                end;
            end;
            v475.alpha = v475:update();
            v249.push_alpha(v475.alpha);
            if v475.alpha > 0 then
                if l___drag_1 then
                    v257.think(v475);
                end;
                if l___list_0 then
                    l_v262_3.traverse(v475);
                end;
                v475:paint(v475.pos, v475.pos + v475.size);
            end;
            v249.pop_alpha();
        end, 
        enlist = function(v480, v481, v482, v483)
            -- upvalues: l_setmetatable_0 (ref)
            v480.__list = {
                active = 0, 
                longest = 0, 
                items = {}, 
                progress = l_setmetatable_0({}, {
                    __mode = "k"
                }), 
                minwidth = v480.size.x, 
                collect = v481, 
                paint = v482, 
                rev = v483
            };
        end, 
        traverse = function(v484)
            -- upvalues: l_vector_0 (ref), v250 (ref), v249 (ref), v34 (ref)
            local l___list_1 = v484.__list;
            local v486 = 0;
            local v487 = l_vector_0();
            local v488 = 0;
            l___list_1.longest = 0;
            l___list_1.active = v488;
            for v489 = 1, #l___list_1.items do
                local v490 = l___list_1.items[v489];
                local v491 = v490.name or v489;
                l___list_1.progress[v491] = l___list_1.progress[v491] or {
                    [1] = 0
                };
                local v492 = v250.condition(l___list_1.progress[v491], v490.active, 6, {
                    [1] = {
                        [1] = 1, 
                        [2] = 3
                    }, 
                    [2] = {
                        [1] = 2, 
                        [2] = 3
                    }
                });
                if v492 > 0 then
                    v249.push_alpha(v492);
                    v487 = l___list_1.paint(v484, v490, v486, v492);
                    v249.pop_alpha();
                    local v493 = l___list_1.active + 1;
                    v486 = v486 + v487.y * v492;
                    l___list_1.active = v493;
                    l___list_1.longest = v34.max(l___list_1.longest, v487.x);
                end;
            end;
            v484.size.x = v250.lerp(v484.size.x, v34.max(l___list_1.longest, l___list_1.minwidth), 10, 0.5);
        end, 
        lock = function(v494, v495)
            if not v494.__drag then
                return;
            else
                v494.__drag.locked = v495 and true or false;
                return;
            end;
        end
    };
    l_v262_3.__index = l_v262_3;
    v261 = {
        new = function(v496, v497, v498, v499)
            -- upvalues: v257 (ref), l_type_0 (ref), l_setmetatable_0 (ref), l_v262_3 (ref)
            local v500 = {
                alpha = 0, 
                id = v496, 
                pos = v497, 
                size = v498, 
                progress = {
                    [1] = 0
                }
            };
            if v499 then
                v257.new(v500, l_type_0(v499) == "table" and v499 or nil);
            end;
            return l_setmetatable_0(v500, l_v262_3);
        end
    };
end;
v262 = nil;
v262 = {};
v386 = {
    butterfly = {
        link = "https://cdn.hysteria.one/main/butterfly.png", 
        type = "png", 
        size = l_vector_0(540, 540)
    }, 
    avatar = {
        type = "png", 
        temp = true, 
        size = l_vector_0(64, 64), 
        link = v35.format("https://neverlose.cc/static/avatars/%s.png", v1)
    }, 
    logo_l = {
        bin = true, 
        type = "png", 
        link = "https://cdn.hysteria.one/logo/logo_l.png", 
        size = l_vector_0(26, 15)
    }, 
    logo_r = {
        bin = true, 
        type = "png", 
        link = "https://cdn.hysteria.one/logo/logo_r.png", 
        size = l_vector_0(24, 15)
    }, 
    logo_l2x = {
        bin = true, 
        type = "png", 
        link = "https://cdn.hysteria.one/logo/logo_l2x.png", 
        size = l_vector_0(52, 30)
    }, 
    logo_r2x = {
        bin = true, 
        type = "png", 
        link = "https://cdn.hysteria.one/logo/logo_r2x.png", 
        size = l_vector_0(48, 30)
    }, 
    logo_lo2x = {
        bin = true, 
        type = "png", 
        link = "https://cdn.hysteria.one/logo/logo_lo2x.png", 
        size = l_vector_0(52, 30)
    }, 
    logo_ro2x = {
        bin = true, 
        type = "png", 
        link = "https://cdn.hysteria.one/logo/logo_ro2x.png", 
        size = l_vector_0(48, 30)
    }
};
v262.corner_h1 = v249.load_image("<svg width=\"4\" height=\"5.87\" viewBox=\"0 0 4 6\"><path fill=\"#fff\" d=\"M0 6V4c0-2 2-4 4-4v2C2 2 0 4 0 6Z\"/></svg>", l_vector_0(8, 12));
v262.corner_h2 = v249.load_image("<svg width=\"4\" height=\"5.87\" viewBox=\"0 0 4 6\"><path fill=\"#fff\" d=\"M4 6c0-2-2-4-4-4V0c2 0 4 2 4 4v2Z\"/></svg>", l_vector_0(8, 12));
v262.corner_v1 = v249.load_image("<svg width=\"5.87\" height=\"4\" viewBox=\"0 0 6 4\"><path fill=\"#fff\" d=\"M2 4H0c0-2 2-4 4-4h2C4 0 2 2 2 4Z\"/></svg>", l_vector_0(12, 8));
v262.corner_v2 = v249.load_image("<svg width=\"5.87\" height=\"4\" viewBox=\"0 0 6 4\"><path fill=\"#fff\" d=\"M2 0H0c0 2 2 4 4 4h2C4 4 2 2 2 0Z\"/></svg>", l_vector_0(12, 12));
v262.warning = v249.load_image("<svg width=\"16\" height=\"16\" viewBox=\"0 0 16 16\"><path fill=\"#fff\" d=\"m13.259 13h-10.518c-0.35787 0.0023-0.68906-0.1889-0.866-0.5-0.18093-0.3088-0.18093-0.6912 0-1l5.259-9.015c0.1769-0.31014 0.50696-0.50115 0.864-0.5 0.3568-0.00121 0.68659 0.18986 0.863 0.5l5.26 9.015c0.1809 0.3088 0.1809 0.6912 0 1-0.1764 0.3097-0.5056 0.5006-0.862 0.5zm-6.259-3v2h2v-2zm0-5v4h2v-4z\"/></svg>", l_vector_0(32, 32));
v262.manual = v249.load_image("<svg width=\"8\" height=\"10\" viewBox=\"0 0 8 10\"><path fill=\"#fff\" d=\"m0.384 5.802c-0.24286-0.19453-0.3842-0.48884-0.3842-0.8s0.14134-0.60547 0.3842-0.8l6.08-4c0.29513-0.22371 0.69277-0.25727 1.0212-0.086202 0.32846 0.17107 0.52889 0.51613 0.51477 0.8862l-1.92 3.96 1.92 4.04c0.01412 0.37007-0.18631 0.71513-0.51477 0.8862-0.32846 0.1711-0.7261 0.1375-1.0212-0.0862z\"/></svg>", l_vector_0(20, 20));
v262.logo_lo = v249.load_image("\137PNG\r\n\026\n\000\000\000\rIHDR\000\000\000\026\000\000\000\015\b\006\000\000\000\250Q\223\230\000\000\000\004sBIT\b\b\b\b|\bd\136\000\000\002iIDAT8O\189T=\136\146q\024\255\191W\004\199\t\186X\225\226;5\229\023XN\r\1614T\208 \t\"M:\152\163\195\169\22494\b\026wC!.\n\146%t tX\139\248\210\226\144`)Nw:\164\131\017\182\168\220q\155\246{^\255\127\187$2\226\184\a\030|\190\222\223\239\249x_%vA\"]\016\015S\137F\163\209{\189^\255\128\236z\189~t\a\002\243\199y6AD[~\191\255\216\235\2452\167\211\201\002\129\000\203\231\243\2311\169o<\030\191n6\155\204\229r\153\b\208\001\253\212\239\247\153\209hd\146$\237\195\127F\131\174L\165\135\127\021z\002\237\175L{\019\254\156\199)/\015\135\195#\131\193p%\157N\179H$\"\017\017\001\236\206\231\243'\131\193\128\233t:\166\213jU\028\248J\185\\>\r\135\195\015\0050\026a\173V\139Y\173V\022\143\199\191D\163Q\139F\163\185$\242\157N\231\155\217l6\156m\164\221n/n\148\205f\191\a\131\193kdS\a\221n\151\229r9\186\215i\161P\216\1648\249\138\162\208\026Z\211\233\2122\155\2056j\181\218\137\219\237\222*\149J\204\231\243-\177q\n\181\158\bl6\155\026'\"\025\015|\165\251p\160e\199\232\254\016\249\014\242\030q?\187\221NM]\023\181\184\195r\003\147\201\1326\210F\189\149\234\249\218\182\019\137\132\155\136\156\184O\141\223\135%\147I%\022\13999\208+\228\203\000; @Y\150\153\000n4\026\204\225p01\r\192\213\151)\149JU\209\200=\154\130\206\208\235\245\166\197b\241P\202d2\251\161P\2321\031\243%\242\155\184W@\236agg\231\179\199\227\177\152L\166\203\020\163\174\233\134\152\246\024\rj\168A!\188\1852H\221DJB\184\213jU]\221[\168\135\023?\194\239-h\\<\140{\204*\149\202\006\221@\236\158\003~D\205\221%\203/\227)\204\236J\252\r\017\1898\019\220\131M\031j\020J\173\0260\221\1625.\2266poCo@\233\243\016r\000C\2251\241v4\224\171D\127\147\015H\222\255C\1936b\207\215<\251[z\029\017MC\128\139w\148\177\022t\023\250\014J\031\230?\203:\"\001$s\224\255\254\255\251\t\028\251\005y1\018\227l\000\000\000\000IEND\174B`\130", l_vector_0(26, 15));
v262.logo_ro = v249.load_image("\137PNG\r\n\026\n\000\000\000\rIHDR\000\000\000\024\000\000\000\015\b\006\000\000\000\254\164\015\219\000\000\000\004sBIT\b\b\b\b|\bd\136\000\000\002\bIDAT8O\213S=hZQ\020>\207`\151$(\017\135\184\248\b\181`\146\022%\133\186\137?%c\161\163\198\128\232P\002]2\232T4\163B;\180\014\025\212M\tAh\147\169P\149b\a\201 \021\146A\156t\144R\132`\v\165Xh_\191ss\031<)\164 d\200\133\143s\238y\231\156\239\187\031<\133n\248(7\188\159\230!X\156N\167c\147\201\244\199l6/\253O\224<\004\1755M{>\028\014IU\213' 8\189\142\196H\176\136F\021\248\001\f\fC\155\2005y\231\250'\192+\239;\136\021\153\219\017y\135qVX\244\180\221n\031\248|>^$N\173V\235\004\002\129{6\155m\217\168n<\030\255\182\219\237\v\\\147/\b#\253:\026\141:\014\135\227\014\215\187\221.y<\030\170V\171\020\141F\021\165\223\239\127w\185\\\203\249|\158\144S\177X\020M^\175\151&\147\tY,\022R\148\171\135&\018\t\n\006\131\020\137D\136\251\211\233\244\022z:\220\147L&\169T*\209`0 \171\213\202x\203\226\021\248\169?_,\209\151\2432&\147J>K[\190`\225*\247aA\171R\169\216@\182\209h4(\028\014\031\151\203\229\135\241x|M\222\133}\130@_j\176\227U\189^\223\015\133B\186\178\251\248v\209l6\223\195\186\237V\171\245\203\239\247\031\229r\185\221T*\165\139x\006\242C\195\139}\1529S\160B\227'\027O\161P\184\140\197b+R\2339\226\003\2063\153L;\155\205\242\1608l\029[\226t:\197\157\149\179(>\189^\239\167\219\237^gsg,\146\179\031\016\031\003\223\1287\192\vY\127\137\184o\016\211A\1905\163n\246\178\195\004\143\128\168\172\243\194\143\192]`C\214NX\156\204U\196\004`\001\206\128w\192\030\192\022\014Y8\176\rL\00017\207\143v\141\224\127?\221~\130\191).\187\139\030\210\019\211\000\000\000\000IEND\174B`\130", l_vector_0(24, 15));
v262.bfly = v249.load_image("\137PNG\r\n\026\n\000\000\000\rIHDR\000\000\000\t\000\000\000\t\b\006\000\000\000\224\145\006\016\000\000\000\004sBIT\b\b\b\b|\bd\136\000\000\000\253IDAT\024Wc\228\231\231\239\248\248\241c9\031\031\223\174O\159>\165300<\000b\005..\174\229\223\190}\179\000\202w2\002\005\254\191\127\255\158a\193\130\005\f\229\229\229\223\127\253\250\149\197\198\1986\181\179\179\147+!!\129APP\144\001\172\b\b\128\020\003Xabb\"\195\252\249\243\025@\n@\128\145\145\145\129\145\151\151\247\205\161C\135\132\r\f\f\224\na\n\014\0288\192\016\026\026z\145\017\228&II\201\188\246\246v\206\128\128\000\176B\016\216\176a\003CVV\214\143\231\207\159g\130\172sPSS\219r\243\230Mn\144\228\131\a\015\024\020\020\020\192\nUTT>\221\189{\215\031\164H\000\232\184\a\251\246\237\227\aI\248\250\250\254\217\188y3\v\136mnn\014\242\b\023H\017\b$\176\179\179O\a1~\254\252\185\018\200\014\a\249\006\168\192\n(t\001\166\b\238\022l\f\000$\223ai]i\219y\000\000\000\000IEND\174B`\130", l_vector_0(9, 9));
v405 = utils.get_vfunc("steamclient.dll", "SteamClient017", 2, "int(__thiscall*)(void*, int)");
local v501 = utils.get_vfunc("steamclient.dll", "SteamClient017", 8, "int*(__thiscall*)(void*, int, int, const char*)");
local v502 = utils.get_vfunc("steamclient.dll", "SteamClient017", 9, "int*(__thiscall*)(void*, int, const char*)");
local v503 = utils.get_vfunc(35, "int(__thiscall*)(void*, uint64_t)");
local v504 = utils.get_vfunc(5, "bool(__thiscall*)(void*, int, uint32_t*, uint32_t*)");
local v505 = utils.get_vfunc(6, "bool(__thiscall*)(void*, int, unsigned char*, int)");
local v506 = nil;
local v507 = nil;
local v508 = nil;
local v509 = nil;
if v506 == nil then
    v506 = 1;
    v509 = v501(v405(v506), v506, "SteamFriends015");
    v508 = v502(v506, "SteamUtils009");
end;
local v510 = ffi.typeof("char[?]");
local v511 = ffi.typeof("unsigned int[?]");
local function v514()
    -- upvalues: l_tonumber_0 (ref), v35 (ref)
    local v512 = panorama.GameStateAPI.GetLocalPlayerXuid();
    if not v512 then
        return;
    else
        local v513 = l_tonumber_0(v35.sub(v512, 4, -1));
        if not v513 then
            return;
        else
            return 76500000000000000ULL + v513;
        end;
    end;
end;
do
    local l_v503_0, l_v504_0, l_v505_0, l_v508_0, l_v509_0, l_v510_0, l_v511_0, l_v514_0 = v503, v504, v505, v508, v509, v510, v511, v514;
    local function v529(v523)
        -- upvalues: l_v503_0 (ref), l_v509_0 (ref), l_v511_0 (ref), l_v504_0 (ref), l_v508_0 (ref), l_v510_0 (ref), l_v505_0 (ref), v249 (ref), l_vector_0 (ref)
        if not v523 then
            return;
        else
            local v524 = l_v503_0(l_v509_0, v523);
            if v524 > 0 then
                local v525 = l_v511_0(1);
                local v526 = l_v511_0(1);
                if l_v504_0(l_v508_0, v524, v525, v526) and v525[0] > 0 and v526[0] > 0 then
                    local v527 = v525[0] * v526[0] * 4;
                    local v528 = l_v510_0(v527);
                    if l_v505_0(l_v508_0, v524, v528, v527) then
                        return v249.load_image_rgba(ffi.string(v528, v527), l_vector_0(v525[0], v526[0]));
                    end;
                end;
            end;
            return;
        end;
    end;
    local function v530()
        -- upvalues: l_v514_0 (ref), v529 (ref), v262 (ref), v185 (ref), v530 (ref)
        local v531 = l_v514_0();
        local v532 = v529(v531);
        if v532 then
            v262.steampfp = v532;
            v185.render:unset(v530);
        end;
    end;
    v185.render:set(v530);
end;
v405 = {
    safely = function(v533, v534, v535)
        -- upvalues: l_pcall_0 (ref), v249 (ref), l_print_error_0 (ref)
        local v536, v537 = l_pcall_0(v249.load_image, v533, v534);
        if not v536 then
            l_print_error_0("Couldn't load ", v535 or "an image", ". Reason: ", v537);
        end;
        return v536 and v537 or nil;
    end
};
do
    local l_v405_1 = v405;
    v185.file_loaded:set(function(v539, _, v541)
        -- upvalues: v262 (ref), l_v405_1 (ref), l_vector_0 (ref)
        if v539 == "butterfly" then
            v262.butterfly_s = l_v405_1.safely(v541, l_vector_0(64, 64), v539);
        end;
    end);
    files.create_folder(_PROJECT);
    v501 = nil;
    v502 = nil;
    v503 = nil;
    v504 = {};
    v502 = _PROJECT .. "/resources.bin";
    v501 = v504;
    v504 = files.read(v502, true);
    if v504 then
        for v542, v543 in l_next_0, msgpack.unpack(v504) do
            v501[v542] = v543;
        end;
        v503 = true;
    else
        for v544, _ in l_next_0, v386 do
            v501[v544] = false;
        end;
        v503 = false;
    end;
    v504 = 0;
    do
        local l_v501_0, l_v502_0, l_v504_1 = v501, v502, v504;
        for v549, v550 in l_next_0, v386 do
            v510 = nil;
            v511 = nil;
            if v550.bin then
                v511 = l_v501_0[v549];
            elseif v550.temp then
                v511 = nil;
            else
                v510 = v35.format("%s/%s.%s", _PROJECT, v549, v550.type);
                v511 = files.read(v510, true);
            end;
            do
                local l_v549_0, l_v550_0 = v549, v550;
                do
                    local l_v510_1 = v510;
                    if v511 and #v511 > 16 then
                        v262[l_v549_0] = l_v405_1.safely(v511, l_v550_0.size, l_v549_0);
                        v185.file_loaded:call(l_v549_0, v262[l_v549_0], v511);
                    elseif not v4.OFFLINE then
                        l_v504_1 = l_v504_1 + 1;
                        network.get(l_v550_0.link, nil, function(v554)
                            -- upvalues: l_v504_1 (ref), v35 (ref), v262 (ref), l_v549_0 (ref), l_v405_1 (ref), l_v550_0 (ref), v185 (ref), l_v501_0 (ref), l_v510_1 (ref)
                            l_v504_1 = l_v504_1 - 1;
                            if not v554 or v35.sub(v554, 2, 4) ~= "PNG" then
                                return;
                            else
                                v262[l_v549_0] = l_v405_1.safely(v554, l_v550_0.size, l_v549_0);
                                if v262[l_v549_0] then
                                    v185.file_loaded:call(l_v549_0, v262[l_v549_0], v554);
                                    if l_v550_0.bin then
                                        l_v501_0[l_v549_0] = v554;
                                    elseif l_v510_1 then
                                        files.write(l_v510_1, v554, true);
                                    end;
                                end;
                                return;
                            end;
                        end);
                    end;
                end;
            end;
        end;
        if not v503 and not v4.OFFLINE then
            do
                local l_v505_1 = v505;
                l_v505_1 = function()
                    -- upvalues: l_v504_1 (ref), v185 (ref), l_v505_1 (ref)
                    if l_v504_1 == 0 then
                        v185.render:unset(l_v505_1);
                        v185.binary_downloaded:call();
                    end;
                end;
                v185.render:set(l_v505_1);
                v185.binary_downloaded:set(function()
                    -- upvalues: l_v501_0 (ref), l_v502_0 (ref)
                    local v556 = msgpack.pack(l_v501_0);
                    files.write(l_v502_0, v556, true);
                end);
            end;
        end;
    end;
end;
v386 = {
    states = {
        [1] = {
            [1] = "default", 
            [2] = "Default", 
            [3] = "D"
        }, 
        [2] = {
            [1] = "stand", 
            [2] = "Standing", 
            [3] = "S"
        }, 
        [3] = {
            [1] = "run", 
            [2] = "Running", 
            [3] = "R"
        }, 
        [4] = {
            [1] = "walk", 
            [2] = "Walking", 
            [3] = "W"
        }, 
        [5] = {
            [1] = "air", 
            [2] = "Air", 
            [3] = "A"
        }, 
        [6] = {
            [1] = "airc", 
            [2] = "Air & crouch", 
            [3] = "AC"
        }, 
        [7] = {
            [1] = "crouch", 
            [2] = "Crouching", 
            [3] = "C"
        }, 
        [8] = {
            [1] = "sneak", 
            [2] = "Sneaking", 
            [3] = "3"
        }, 
        [9] = {
            [1] = "fakelag", 
            [2] = "Fakelag", 
            [3] = "FL"
        }
    }, 
    snaps = {
        [1] = {
            [1] = "default", 
            [2] = "Default", 
            [3] = "D"
        }, 
        [2] = {
            [1] = "air", 
            [2] = "Air", 
            [3] = "A"
        }, 
        [3] = {
            [1] = "airc", 
            [2] = "Air & crouch", 
            [3] = "AC"
        }, 
        [4] = {
            [1] = "crouch", 
            [2] = "Crouching", 
            [3] = "C"
        }, 
        [5] = {
            [1] = "sneak", 
            [2] = "Sneaking", 
            [3] = "S"
        }, 
        [6] = {
            [1] = "walk", 
            [2] = "Walking", 
            [3] = "W"
        }, 
        [7] = {
            [1] = "edge", 
            [2] = "Edge bait", 
            [3] = "EB"
        }
    }
};
v405 = {
    hitgroups = {
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
    states = v33.distribute(v386.states, nil, 1), 
    kstates = v33.distribute(v386.states, 1), 
    snaps = v33.distribute(v386.snaps, nil, 1), 
    build = {
        [1] = {
            [1] = "", 
            [2] = ""
        }, 
        [2] = {
            [1] = "S", 
            [2] = ""
        }, 
        [3] = {
            [1] = "\206\178", 
            [2] = ""
        }, 
        [4] = {
            [1] = "\226\153\170", 
            [2] = ""
        }
    }, 
    aipeek = {
        COOLDOWN = 2, 
        MOVING = 1, 
        STANDBY = 0, 
        MOVE_BACK = 3
    }, 
    exploit = {
        DT = 1, 
        HS = 2, 
        OS = 2
    }
};
v501 = {
    builder = {
        custom = {}
    }, 
    snap = {
        custom = {}
    }
};
v502 = nil;
v503 = nil;
v504 = nil;
v505 = nil;
v506 = {
    valid = false, 
    userid = 0, 
    side = 0, 
    exploit = {
        lc_left = 0
    }
};
v503 = {};
v502 = v506;
v506 = nil;
v507 = 0;
do
    local l_v507_0 = v507;
    v506 = function()
        -- upvalues: v183 (ref), v502 (ref), v405 (ref), v34 (ref), l_v507_0 (ref)
        local l_dt_0 = v183.rage.main.dt;
        local l_hs_0 = v183.rage.main.hs;
        local l_fd_0 = v183.antiaim.misc.fd;
        local v561 = l_dt_0:get_override();
        local v562 = l_hs_0:get_override();
        local v563 = l_fd_0:get_override();
        local l_value_2 = l_dt_0.value;
        local l_value_3 = l_hs_0.value;
        local l_value_4 = l_fd_0.value;
        if v561 ~= nil then
            l_value_2 = v561;
        end;
        if v562 ~= nil then
            l_value_3 = v562;
        end;
        if v563 ~= nil then
            l_value_4 = v563;
        end;
        v502.exploit.charge = rage.exploit:get();
        v502.exploit.fd = l_value_4;
        if l_value_4 then
            v502.exploit.active = v405.exploit.OFF;
        else
            v502.exploit.active = l_value_2 and v405.exploit.DT or l_value_3 and v405.exploit.HS or v405.exploit.OFF;
        end;
        local v567 = v502.self.m_nTickBase or 0;
        if v34.abs(v567 - l_v507_0) > 64 then
            l_v507_0 = 0;
        end;
        if l_v507_0 < v567 then
            l_v507_0 = v567;
        elseif v567 < l_v507_0 then

        end;
        v502.exploit.lc_left = v34.min(14, v34.max(0, l_v507_0 - v567 - 1));
        v502.exploit.defensive = v502.exploit.lc_left > 0;
    end;
end;
do
    local l_v506_0, l_v508_1 = v506, v508;
    v507 = function(v570)
        -- upvalues: v502 (ref), v503 (ref), v34 (ref), l_v506_0 (ref), v185 (ref)
        v502.self = entity.get_local_player();
        v502.valid = v502.self ~= nil and v502.self:is_alive();
        v503 = entity.get_players(false, false);
        v502.in_game = true;
        if v502.self then
            v502.userid = v502.self:get_player_info().userid;
            local l_v502_1 = v502;
            local l_v502_2 = v502;
            local v573 = entity.get_threat();
            l_v502_2.menace = entity.get_threat(true);
            l_v502_1.threat = v573;
            if v502.valid then
                v502.flags = v502.self.m_fFlags;
                v502.on_ground = bit.band(v502.flags, bit.lshift(1, 0)) == 1;
                v502.duck_amount = v502.self.m_flDuckAmount;
                v502.crouching = v502.duck_amount > 0.5;
                v502.side = v570.in_moveright and -1 or v570.in_moveleft and 1 or 0;
                v502.velocity = v34.sqrt3(v502.self.m_vecVelocity:unpack());
                l_v502_1 = v502;
                l_v502_2 = v502;
                v573 = v502.self:get_origin();
                l_v502_2.eyes = v502.self:get_eye_position();
                l_v502_1.origin = v573;
                l_v502_1 = v502;
                l_v502_2 = v502;
                v573 = v502.self:get_anim_state();
                l_v502_2.animlayers = v502.self:get_anim_overlay();
                l_v502_1.animstate = v573;
                l_v506_0();
                if v570 then
                    l_v502_1 = v502.self:get_player_weapon();
                    if l_v502_1 ~= v502.weapon then
                        l_v502_2 = v502;
                        v573 = v502;
                        local l_v502_3 = v502;
                        local l_l_v502_1_0 = l_v502_1;
                        local v576 = l_v502_1 and l_v502_1:get_weapon_info();
                        l_v502_3.weapon_i = l_v502_1 and l_v502_1:get_weapon_index();
                        v573.weapon_t = v576;
                        l_v502_2.weapon = l_l_v502_1_0;
                        v185.local_weapon_change:call(l_v502_1);
                    end;
                    v502.using = v570.in_use;
                    v502.walking = v502.velocity > 5 and v570.in_speed;
                    v502.jumping = v570.in_jump or not v502.on_ground;
                    v502.in_score = v570.in_score;
                    l_v502_2 = v502;
                    v573 = v502;
                    local l_in_attack_0 = v570.in_attack;
                    v573.in_attack2 = v570.in_attack2;
                    l_v502_2.in_attack = l_in_attack_0;
                end;
            end;
        end;
    end;
    v185.createmove:set(v507);
    v185.net_update_end:set(function()
        -- upvalues: v502 (ref)
        v502.self = entity.get_local_player();
        v502.valid = v502.self ~= nil and v502.self:is_alive();
        v502.gamerules = entity.get_game_rules();
    end);
    v185.player_death:set(function(v578)
        -- upvalues: v502 (ref), v185 (ref)
        if v578.userid == v502.userid then
            v185.local_death:call(v578);
        elseif v578.userid ~= v502.userid and v578.attacker == v502.userid then
            v185.local_frag:call(v578);
        end;
    end);
    v185.player_spawn:set(function(v579)
        -- upvalues: v502 (ref), v185 (ref)
        if v579.userid ~= v502.userid then
            return;
        else
            v185.local_spawn:call(v579);
            return;
        end;
    end);
    v185.player_connect_full:set(function(v580)
        -- upvalues: v502 (ref), v185 (ref)
        if v580.userid ~= v502.userid then
            return;
        else
            v185.local_connect_full:call(v580);
            return;
        end;
    end);
    l_v508_1 = nil;
    v509 = {};
    v505 = {};
    v504 = v509;
    v185.pre_render_native:set(function()
        -- upvalues: v502 (ref), v503 (ref), l_v508_1 (ref), v185 (ref)
        v502.self = entity.get_local_player();
        v502.valid = v502.self ~= nil and v502.self:is_alive();
        if v502.valid then
            local l_v502_4 = v502;
            local l_v502_5 = v502;
            local v583 = v502.self:get_origin();
            l_v502_5.eyes = v502.self:get_eye_position();
            l_v502_4.origin = v583;
        end;
        v503 = entity.get_players(false, false);
        local l_is_in_game_0 = globals.is_in_game;
        if l_v508_1 and not l_is_in_game_0 then
            local l_v502_6 = v502;
            local l_v502_7 = v502;
            local v587 = nil;
            l_v502_7.valid = false;
            l_v502_6.self = v587;
            v502.in_game = false;
            v185.local_disconnect:call();
            l_v508_1 = false;
        end;
        l_v508_1 = l_is_in_game_0;
    end);
end;
v506 = nil;
v507 = nil;
v508 = nil;
v509 = nil;
v510 = nil;
v511 = nil;
v514 = nil;
v514 = v35.find(_NAME, "\239\146\146");
v509 = v69(69, 86, 69, 78, 84, 33, 104, 89, 115, 84, 101, 82, 105, 65, 36, 66, 76, 73, 83, 83);
v510 = v69(66, 76, 73, 83, 83, 45, 75, 69, 89, 58, 58, 37, 115, 58, 58, 37, 48, 50, 88);
v508 = v69(71, 85, 72, 90, 65, 79, 75, 88, 67, 80, 76, 78, 81, 68, 86, 82, 83, 84, 89, 87, 74, 66, 73, 69, 70, 77, 105, 102, 103, 115, 110, 122, 108, 114, 117, 112, 98, 97, 118, 109, 119, 101, 111, 113, 106, 107, 99, 116, 104, 120, 100, 121, 48, 49, 57, 51, 53, 50, 54, 52, 55, 56, 43, 47, 61);
v507 = v69(104, 121, 115, 116, 101, 114, 105, 97, 58, 58, 75, 69, 89, 83, 58, 58, 48, 120, 48, 50);
local l_v508_2 = v508;
v508 = v507;
v507 = l_v508_2;
l_v508_2 = v509;
v509 = v510;
v510 = l_v508_2;
l_v508_2 = db[v508];
if l_v508_2 then
    v511 = v168.encode(v35.format(v509, v1, 255 - #v1), v507) == l_v508_2;
else
    v511 = false;
end;
do
    local l_v511_1 = v511;
    v185[v510]:set(function(v590, v591)
        -- upvalues: l_v511_1 (ref), v185 (ref)
        if v590 ~= l_v511_1 and v591 then
            v185.render_ui:set(function()
                common.reload_script();
            end);
        end;
    end);
    if _TEST_BUILD then
        l_v508_2 = false;
        v514 = false;
        _DEBUG = l_v508_2;
    end;
    if _DEBUG and (v1 == "enQ" or v1 == "maj0r") then
        v0 = 4;
    elseif _DEBUG or v514 then
        v0 = 3;
    elseif l_v511_1 then
        v0 = 2;
    end;
end;
v507 = {
    [1] = "live", 
    [2] = "bliss", 
    [3] = "beta", 
    [4] = "debug"
};
v506 = {
    title = "hysteria", 
    user = v1, 
    script = _PROJECT, 
    build = v507[v0] or "live", 
    version = _VER, 
    level = v0
};
v183 = {
    rage = {
        main = {
            enable = v167.find("Aimbot", "Ragebot", "Main", "Enabled", {
                dormant = "Dormant Aimbot"
            }), 
            peek = v167.find("Aimbot", "Ragebot", "Main", "Peek Assist", {
                retreat = "Retreat Mode"
            }), 
            dt = v167.find("Aimbot", "Ragebot", "Main", "Double Tap", {
                fl = "Fake Lag Limit", 
                lag = "Lag Options"
            }), 
            hs = v167.find("Aimbot", "Ragebot", "Main", "Hide shots", {
                options = "Options"
            })
        }, 
        selection = {
            hitboxes = v167.find("Aimbot", "Ragebot", "Selection", "Hitboxes"), 
            multipoint = v167.find("Aimbot", "Ragebot", "Selection", "Multipoint", {
                head = "Head Scale", 
                body = "Body Scale"
            }), 
            hitchance = v167.find("Aimbot", "Ragebot", "Selection", "Hit Chance"), 
            damage = v167.find("Aimbot", "Ragebot", "Selection", "Min. Damage", {
                delay = "Delay Shot"
            })
        }, 
        safety = {
            body_aim = v167.find("Aimbot", "Ragebot", "Safety", "Body Aim")
        }, 
        accuracy = {
            autostop = v167.find("Aimbot", "Ragebot", "Accuracy", "Auto Stop", {
                options = "Options"
            }), 
            autostop_ssg = v167.find("Aimbot", "Ragebot", "Accuracy", "Auto Stop", {
                options = "Options"
            })
        }
    }, 
    antiaim = {
        __groups = {
            angles = v167.find("Aimbot", "Anti Aim", "Angles")
        }, 
        fl = {
            enable = v167.find("Aimbot", "Anti Aim", "Fake Lag", "Enabled"), 
            limit = v167.find("Aimbot", "Anti Aim", "Fake Lag", "Limit")
        }, 
        misc = {
            fd = v167.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"), 
            sw = v167.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"), 
            leg = v167.find("Aimbot", "Anti Aim", "Misc", "Leg Movement")
        }, 
        angles = {
            enabled = v167.find("Aimbot", "Anti Aim", "Angles", "Enabled"), 
            pitch = v167.find("Aimbot", "Anti Aim", "Angles", "Pitch"), 
            yaw = v167.find("Aimbot", "Anti Aim", "Angles", "Yaw", {
                hidden = "Hidden", 
                offset = "Offset", 
                avoid_bs = "Avoid Backstab", 
                base = "Base"
            }), 
            modifier = v167.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", {
                offset = "Offset"
            }), 
            body = v167.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", {
                invert = "Inverter", 
                freestand = "Freestanding", 
                right = "Right Limit", 
                options = "Options", 
                left = "Left Limit"
            }), 
            freestand = v167.find("Aimbot", "Anti Aim", "Angles", "Freestanding", {
                body = "Body Freestanding", 
                disable_yaw = "Disable Yaw Modifiers"
            }), 
            extended = v167.find("Aimbot", "Anti Aim", "Angles", "Extended Angles")
        }
    }, 
    world = {
        main = {
            fov = v167.find("Visuals", "World", "Main", "Field of View"), 
            zoom = v167.find("Visuals", "World", "Main", "Override Zoom", {
                scope = "Scope Overlay"
            })
        }, 
        other = {
            hitmarker = v167.find("Visuals", "World", "Other", "Hit Marker")
        }
    }, 
    misc = {
        movement = {
            airstrafe = v167.find("Miscellaneous", "Main", "Movement", "Air Strafe", {
                smooth = "Smoothing"
            }), 
            aircrouch = v167.find("Miscellaneous", "Main", "Movement", "Air Duck", {
                mode = "Mode"
            })
        }, 
        other = {
            weaponacts = v167.find("Miscellaneous", "Main", "Other", "Weapon Actions"), 
            eventlog = v167.find("Miscellaneous", "Main", "Other", "Log Events"), 
            windows = v167.find("Miscellaneous", "Main", "Other", "Windows"), 
            fakeping = v167.find("Miscellaneous", "Main", "Other", "Fake Latency")
        }, 
        ingame = {
            clantag = v167.find("Miscellaneous", "Main", "In-Game", "Clan Tag")
        }
    }, 
    global = {
        language = v167.find("Settings", "Language"), 
        animspeed = v167.find("Settings", "Animation Speed"), 
        menu_scale = v167.find("Settings", "Menu Scale")
    }
};
v185.pre_render_native:set(function()
    -- upvalues: v504 (ref), v33 (ref), v505 (ref), v35 (ref)
    local v592 = ui.get_binds();
    v504 = v592;
    v33.clear(v505);
    for v593 = 1, #v592 do
        local v594 = v592[v593];
        if v594.active then
            v505[v35.lower(v594.name)] = v594;
        end;
    end;
end);
v507 = nil;
v508 = nil;
v509 = nil;
v510 = {};
v511 = {};
do
    local l_v509_1 = v509;
    do
        local l_v510_2, l_v511_2, l_v514_1, l_l_v508_2_0 = v510, v511, v514, l_v508_2;
        l_v509_1 = {
            send = function(v600, v601)
                -- upvalues: l_v511_2 (ref), l_v510_2 (ref)
                l_v511_2[v600] = l_v511_2[v600] or {
                    [1] = 0, 
                    [2] = nil, 
                    [3] = false
                };
                if not l_v511_2[v600][3] then
                    l_v510_2[#l_v510_2 + 1] = v600;
                end;
                local v602 = l_v511_2[v600];
                local v603 = l_v511_2[v600];
                local l_v601_0 = v601;
                v603[3] = true;
                v602[2] = l_v601_0;
            end, 
            setup = function(v605, v606)
                -- upvalues: v35 (ref), l_v509_1 (ref)
                local v607 = v605:name();
                if v35.find(v607, "\001") then
                    if v606 ~= nil then
                        v605:set_callback(function(v608)
                            -- upvalues: v606 (ref), l_v509_1 (ref), v607 (ref)
                            local v609, v610 = v606(v608);
                            if not v610 then
                                v609 = v609 and 1 or 0;
                            end;
                            l_v509_1.send(v607, v609);
                        end, true);
                    else
                        v605:set_callback(function(v611)
                            -- upvalues: l_v509_1 (ref), v607 (ref)
                            l_v509_1.send(v607, v611.value and 1 or 0);
                        end, true);
                    end;
                    return v605;
                else
                    return;
                end;
            end
        };
        l_v514_1 = ui.get_style("Small Text");
        l_l_v508_2_0 = v167.accent;
        v185.render_ui:set(function()
            -- upvalues: v167 (ref), l_v514_1 (ref), l_l_v508_2_0 (ref), l_v510_2 (ref), l_next_0 (ref), l_v511_2 (ref), v250 (ref), v35 (ref), v33 (ref)
            local v612 = ui.get_style("Small Text");
            local l_accent_0 = v167.accent;
            if l_v514_1 ~= v612 or l_l_v508_2_0 ~= l_accent_0 then
                local v614 = {};
                local l_v612_0 = v612;
                l_l_v508_2_0 = l_accent_0;
                l_v514_1 = l_v612_0;
                l_v510_2 = v614;
                for v616, v617 in l_next_0, l_v511_2 do
                    local l_l_v510_2_0 = l_v510_2;
                    local v619 = #l_v510_2 + 1;
                    local l_v616_0 = v616;
                    v617[3] = true;
                    l_l_v510_2_0[v619] = l_v616_0;
                end;
            end;
            for v621 = #l_v510_2, 1, -1 do
                local v622 = l_v510_2[v621];
                local v623 = l_v511_2[l_v510_2[v621]];
                if v623[3] then
                    local v624 = v250.condition(v623, v623[2] == 1, 4, {
                        [1] = {
                            [1] = 1, 
                            [2] = 2
                        }, 
                        [2] = {
                            [1] = 2, 
                            [2] = 2
                        }
                    });
                    local v625 = l_v514_1:lerp(l_l_v508_2_0, v624):to_hex();
                    local v626 = v35.gsub(v622, "\001", "\a" .. v625);
                    ui.localize("en", v622, v167.string(v626));
                    if v624 == v623[2] then
                        v623[3] = false;
                    end;
                end;
                if not v623[3] then
                    v33.remove(l_v510_2, v621);
                end;
            end;
        end);
    end;
    v167.macros.s = "\a{Small Text}";
    v167.macros.a = "\a{Active Text}";
    v167.macros.t = "\a{Text}";
    v167.macros.p = " \a{Small Text}\f<angle-right>\aDEFAULT\t";
    v508 = {};
    v507 = {
        anim = l_v509_1.setup, 
        selector = function(v627, v628)
            -- upvalues: l_ipairs_0 (ref), l_tostring_0 (ref), l_next_0 (ref), v185 (ref), l_v509_1 (ref), v183 (ref)
            local v629 = {};
            local v630 = {};
            local v631 = #v628;
            for v632, v633 in l_ipairs_0(v628) do
                local v634 = v633[1];
                v630[v632] = l_tostring_0(v632);
                v629[v632] = v634;
            end;
            v630[#v630 + 1] = "R";
            local v635 = v627:list("\next", v629, nil, false);
            local v636 = v627:list("\nint", v630, nil, false);
            v636:visibility(false);
            for v637, v638 in l_ipairs_0(v628) do
                local l_l_next_0_0 = l_next_0;
                local v640 = v638[2] or {};
                for _, v642 in l_l_next_0_0, v640 do
                    v642:depend({
                        [1] = v636, 
                        [2] = v637
                    });
                end;
            end;
            local v643 = 0;
            local v644 = false;
            local function v645()
                -- upvalues: v643 (ref), v644 (ref), v636 (ref), v635 (ref), v185 (ref), v645 (ref)
                if v643 < globals.realtime or v644 == false then
                    v636:set(v635.value);
                    v185.render_ui:unset(v645);
                    local v646 = 0;
                    v644 = false;
                    v643 = v646;
                end;
            end;
            for v647, v648 in l_ipairs_0(v629) do
                l_v509_1.send(v648, v635.value == v647 and 1 or 0);
            end;
            v635:set_callback(function()
                -- upvalues: l_ipairs_0 (ref), v629 (ref), l_v509_1 (ref), v635 (ref), v644 (ref), v636 (ref), v631 (ref), v643 (ref), v183 (ref), v185 (ref), v645 (ref)
                for v649, v650 in l_ipairs_0(v629) do
                    l_v509_1.send(v650, v635.value == v649 and 1 or 0);
                end;
                if v644 then
                    v636:set(v635.value);
                    v644 = false;
                elseif v636.value ~= v635.value then
                    v636:set(v631 + 1);
                    local v651 = globals.realtime + 0.25 * (1 / v183.global.animspeed.value);
                    v644 = true;
                    v643 = v651;
                    v185.render_ui:set(v645);
                end;
            end);
            if not _DEBUG then
                utils.execute_after(0, function()
                    -- upvalues: v635 (ref), v636 (ref)
                    v635:set(1);
                    v636:set(1);
                end);
            end;
            return v635, v636;
        end, 
        selectorb = function(v652, v653, v654)
            -- upvalues: l_ipairs_0 (ref), l_next_0 (ref), l_v509_1 (ref)
            local v655 = {};
            local _ = #v653;
            for v657, v658 in l_ipairs_0(v653) do
                v655[v657] = v658[1];
            end;
            local v659 = v652:list("\next", v655, nil, v654 == true);
            for v660, v661 in l_ipairs_0(v653) do
                local l_l_next_0_1 = l_next_0;
                local v663 = v661[2] or {};
                for _, v665 in l_l_next_0_1, v663 do
                    v665:depend({
                        [1] = v659, 
                        [2] = v660
                    });
                end;
            end;
            v659:set_callback(function()
                -- upvalues: l_ipairs_0 (ref), v655 (ref), l_v509_1 (ref), v659 (ref)
                for v666, v667 in l_ipairs_0(v655) do
                    l_v509_1.send(v667, v659.value == v666 and 1 or 0);
                end;
            end, true);
            if not _DEBUG and v654 ~= true then
                utils.execute_after(0, function()
                    -- upvalues: v659 (ref)
                    v659:set(1);
                end);
            end;
            return v659;
        end, 
        animlist = function(v668)
            -- upvalues: l_v509_1 (ref)
            local v669 = v668:list();
            v668:set_callback(function()
                -- upvalues: v669 (ref), l_v509_1 (ref), v668 (ref)
                for v670 = 1, #v669 do
                    l_v509_1.send(v669[v670], v668.value == v670 and 1 or 0);
                end;
            end, true);
            return v668;
        end, 
        lock = function(v671, v672, v673, _)
            if not v673 then
                v673 = function(v675)
                    -- upvalues: v672 (ref)
                    v675:set(v672 or false);
                end;
            end;
            local function v676()
                -- upvalues: v673 (ref), v671 (ref)
                utils.execute_after(0.01, v673, v671);
            end;
            utils.execute_after(0.5, v673, v671);
            v671:set_callback(v676, true);
            v671:disabled(true);
        end, 
        tabs = {
            home = v167.string("\f<house-blank>"), 
            vars = v167.string("\f<bars>"), 
            antiaim = v167.string("\f<shield>")
        }
    };
end;
v509 = nil;
v509 = {};
v510 = v507.tabs.home;
v511 = {
    info = v167.create(v510, "\ninfo", 1), 
    logo = v167.create(v510, "\nlogo", 1), 
    selector = v167.create(v510, "\nselector", 1), 
    stats = v167.create(v510, "Statistics", 2), 
    links = v167.create(v510, "Links", 2), 
    configsnew = v167.create(v510, "\nconfigsnew", 2), 
    configs = v167.create(v510, "\nconfigs", 2), 
    discord = v167.create(v510, "\nDiscord", 2)
};
v508.home = v511;
v509.selectors = v507.selector(v511.selector, {
    [1] = {
        [1] = "\001\f<bars-staggered>\r\tDashboard", 
        [2] = {
            [1] = v511.stats, 
            [2] = v511.links, 
            [3] = v511.discord
        }
    }, 
    [2] = {
        [1] = "\001\f<folder>\r\tConfigs", 
        [2] = {
            [1] = v511.configs, 
            [2] = v511.configsnew
        }
    }
});
v514 = ({
    [1] = nil, 
    [2] = "\v\f<bolt>  Bliss", 
    [3] = "\v\f<flask>  Beta", 
    [4] = "\v\f<brackets-curly>"
})[v0];
v509.info = {
    [1] = v511.info:label(" \a{Small Text}\f<user>\r \tUser"), 
    [2] = v511.info:button(v35.format(" %s \nuser", v1), nil, true), 
    [3] = v511.info:label("\a{Small Text}\f<code-commit>\r\tVersion"), 
    [4] = v511.info:button(v35.format(" %s \nver", _VER), nil, true), 
    [5] = v514 and v511.info:button(v35.format(" %s \nbuild", v514), nil, true) or nil
};
v509.stats = {
    [1] = v511.stats:label("\a{Small Text}\f<skull>\r\tFrags"), 
    [2] = v511.stats:button("stats-killed", nil, true), 
    [3] = v511.stats:label("\a{Small Text}\f<shield>\r\tEvaded"), 
    [4] = v511.stats:button("stats-evaded", nil, true), 
    [5] = v511.stats:label("\a{Small Text}\f<clock>\r\tPlaytime"), 
    [6] = v511.stats:button("stats-playtime", nil, true), 
    other = v511.stats:label("\a{Small Text}\f<ellipsis>\r\226\128\138\tOther", function(v677)
        local v678 = {
            [1] = v677:label("\a{Small Text}\f<crown>\r\tGod LC"), 
            [2] = v677:button("stats-godlc", nil, true), 
            [3] = v677:label("\a{Small Text}\f<burst>\r\226\128\138\tWorld threat LC"), 
            [4] = v677:button("stats-wtlc", nil, true), 
            [5] = v677:label("\a{Small Text}\f<bullseye>\r\226\128\138\tHeadshots"), 
            [6] = v677:button("stats-headshots", nil, true), 
            [7] = v677:label("\a{Small Text}\f<skull>\r\226\128\138\tDeaths"), 
            [8] = v677:button("stats-deaths", nil, true), 
            [9] = v677:label("\226\128\138\a{Small Text}\f<plus-minus>\r \tK/D"), 
            kd = v677:button("stats-kd", nil, true), 
            troll = v677:switch("Show risky actions"), 
            res = v677:button("  \aff5c5cff\f<arrow-rotate-left>\r  Reset  ", nil, true)
        };
        v678.troll:depend({
            [1] = nil, 
            [2] = false, 
            [1] = v678.troll
        });
        v678.res:depend({
            [1] = nil, 
            [2] = true, 
            [1] = v678.troll
        });
        return v678;
    end)
};
l_v508_2 = function()
    -- upvalues: v188 (ref), v35 (ref), v34 (ref), l_tostring_0 (ref)
    local l_stats_0 = v188.stats;
    local v680 = v35.format("%d h", v34.floor(l_stats_0.playtime), v34.floor(l_stats_0.playtime % 1 * 100));
    local v681 = v35.format("%.2f", l_stats_0.killed / (l_stats_0.deaths == 0 and 1 or l_stats_0.deaths));
    ui.localize("en", "stats-killed", l_tostring_0(l_stats_0.killed));
    ui.localize("en", "stats-evaded", l_tostring_0(l_stats_0.evaded));
    ui.localize("en", "stats-playtime", v680);
    ui.localize("en", "stats-godlc", l_tostring_0(l_stats_0.god_lc));
    ui.localize("en", "stats-wtlc", l_tostring_0(l_stats_0.wt_lc));
    ui.localize("en", "stats-deaths", l_tostring_0(l_stats_0.deaths));
    ui.localize("en", "stats-headshots", l_tostring_0(l_stats_0.headshots));
    ui.localize("en", "stats-kd", v681);
end;
l_v508_2();
v185.stats_update:set(l_v508_2);
do
    local l_l_v508_2_1 = l_v508_2;
    v509.stats.other.res:set_callback(function()
        -- upvalues: v188 (ref), l_l_v508_2_1 (ref)
        v188.__direct.stats = {};
        v188();
        l_l_v508_2_1();
    end);
end;
v509.links = {
    v511.links:label("\a{Small Text}Themes"), 
    v511.links:button(" \f<moon>  Dark ", function()
        panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://neverlose.cc/getitem?c=aZ0b4pLW4XUWThrd-6eUXQ59n-A");
    end, true), 
    v511.links:button(" \f<sun-bright>  Light ", function()
        panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://neverlose.cc/getitem?c=sWbZtdxgjqlx6bDm-S2s_FBrZIb");
    end, true), 
    v511.links:label("\a{Small Text}Scripts"), 
    v511.links:button(" \f<bolt>  Bliss ", function()
        panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://market.neverlose.cc/7kCCQB");
    end, true), 
    v511.links:button(" \f<shield>  ? ", function()

    end, true):disabled(true), 
    v511.links:button(" \f<tennis-ball>  GH ", function()
        panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://market.neverlose.cc/X6Qa7d");
    end, true), 
    v511.links:label("\a{Small Text}Other"), 
    v511.links:button(" \f<memo>  Config ", function()
        panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://en.neverlose.cc/market/item?id=vSZYDo");
    end, true)
};
do
    local l_v511_3 = v511;
    v509.discord = {
        [1] = l_v511_3.discord:label("\a{Small Text}\f<discord>"), 
        join = l_v511_3.discord:button("  \f<link>  Join  ", function()
            panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://discord.gg/eC82SmcF9E");
        end, true), 
        verify = l_v511_3.discord:button("  \f<key>  Get code  ", function(v684)
            -- upvalues: v35 (ref), l_ipairs_0 (ref), v33 (ref), v1 (ref), l_pcall_0 (ref), l_v511_3 (ref), v189 (ref)
            v684:disabled(true);
            local function v691(v685)
                -- upvalues: v35 (ref), l_ipairs_0 (ref), v33 (ref)
                local v686 = {};
                local v687 = {
                    v35.byte(v685, 1, #v685)
                };
                for v688, v689 in l_ipairs_0(v687) do
                    v686[v688] = v35.format("%x", v689);
                end;
                local v690 = v35.gsub(v33.concat(v686), "[64]", {
                    ["6"] = "a7", 
                    ["4"] = "9r"
                });
                while #v690 < 16 do
                    v690 = v690 .. v690;
                end;
                return v35.sub(v690, 1, 16);
            end;
            local v692 = _BLISS and "neverlose-bliss" or "neverlose";
            local v693 = v691(v1 .. v692);
            network.get("https://backend.hysteria.one/keygen", {
                ["hst-uname"] = v1, 
                ["hst-cheat"] = v692, 
                UserAgent = "ltcp_debug" .. ".." .. "|" .. ".." .. v693
            }, function(v694)
                -- upvalues: l_pcall_0 (ref), l_v511_3 (ref), v189 (ref)
                if not v694 then
                    return;
                else
                    local v695, v696 = l_pcall_0(json.parse, v694);
                    if not v695 then
                        l_v511_3.discord:label("\aFF4040FF\f<key>\r  Something went wrong. Try again later");
                        return;
                    else
                        if v696.is_connected == "yes" then
                            l_v511_3.discord:label("\aFF4040FF\f<key>\r  You have already linked your discord.");
                        else
                            v189.set(v696.status);
                            l_v511_3.discord:label("\aB6DE47FF\f<key>\r\tCopied successfully. Use #verify channel to get a role");
                        end;
                        return;
                    end;
                end;
            end);
        end, true)
    };
    if v262.butterfly then
        v509.butterfly = l_v511_3.logo:texture(v262.butterfly, l_vector_0(270));
    else
        do
            local l_l_v508_2_2 = l_v508_2;
            l_l_v508_2_2 = function(v698)
                -- upvalues: v509 (ref), l_v511_3 (ref), v262 (ref), l_vector_0 (ref), v185 (ref), l_l_v508_2_2 (ref)
                if v698 == "butterfly" then
                    v509.butterfly = l_v511_3.logo:texture(v262.butterfly, l_vector_0(270));
                    v185.file_loaded:unset(l_l_v508_2_2);
                end;
            end;
            v185.file_loaded:set(l_l_v508_2_2);
        end;
    end;
end;
v510 = nil;
v511 = v507.tabs.vars;
v514 = {
    selector = v167.create(v511, "\nselector", 1), 
    rage = v167.create(v511, "Rage", 1), 
    misc = v167.create(v511, "Misc", 2), 
    move = v167.create(v511, "Movement", 2), 
    style = v167.create(v511, "\nstyle", 1), 
    visuals = v167.create(v511, "Misc\nvisuals", 1), 
    indicators = v167.create(v511, "Indicators", 2), 
    widgets = v167.create(v511, "Widgets", 2)
};
v508.settings = v514;
v509.ftabs = v507.selector(v514.selector, {
    [1] = {
        [1] = "\001\f<wand-magic-sparkles>\r\tFeatures", 
        [2] = {
            [1] = v514.misc, 
            [2] = v514.move, 
            [3] = v514.rage
        }
    }, 
    [2] = {
        [1] = "\001\f<glasses-round>\r\tVisuals", 
        [2] = {
            [1] = v514.visuals, 
            [2] = v514.style, 
            [3] = v514.widgets, 
            [4] = v514.indicators
        }
    }
});
v510 = {
    settings = {
        teleport = v514.rage:switch("\001\f<person-from-portal>\r\tAuto teleport", false, function(v699, _)
            local v701 = {
                mode = v699:combo("Teleport style", {
                    [1] = "Offensive", 
                    [2] = "Defensive"
                }), 
                land = v699:switch("Ensure landing", true, "Ensure the moment of the landing and the shot."), 
                wpns = v699:selectable("Allowed weapons", {
                    [1] = "Automatics", 
                    [2] = "Pistols", 
                    [3] = "Heavy pistols", 
                    [4] = "Melee"
                }, "Non-automatic weapons are allowed by default.")
            };
            v701.land:depend({
                [1] = nil, 
                [2] = "Offensive", 
                [1] = v701.mode
            });
            v701.wpns:depend({
                [1] = nil, 
                [2] = "Defensive", 
                [1] = v701.mode
            });
            return v701, true;
        end), 
        airstop = v514.rage:switch("\001\f<wind>\r\tAirstop", false, function(v702)
            return {
                duck = v702:switch("Allow aircrouch"), 
                conds = v702:listable("Stop conditions", {
                    [1] = "Close to enemy", 
                    [2] = "Pressing shift"
                })
            }, true;
        end), 
        exswitch = v514.rage:switch("\001\f<shuffle>\r\tAuto hide shots", false, function(v703)
            return {
                p = v703:switch("Allow rifles and pistols", true), 
                hp = v703:switch("Allow Desert Eagle", true)
            }, true;
        end, "Will automatically enable hide shots with double tap."), 
        aipeek = v514.rage:switch("\001\238\130\160\r\tAI peek", false, function(v704)
            return {
                perf = v704:slider("Perfomance impact", 30, 100, 50), 
                ticks = v704:slider("Safety ticks", 1, 32, 8)
            }, true;
        end), 
        dormant = v514.rage:switch("\001\f<crosshairs-simple>\r\tDormant aimbot", false, function(v705)
            return {
                acc = v705:slider("Min. accuracy", 25, 90, 65, 1, "%")
            }, true;
        end), 
        ping = v514.rage:switch("\001\f<satellite-dish>\r\tUnlock fake ping", false, function(v706)
            return {
                ovr = v706:slider("\nping", 0, 200, 200, 1, "ms")
            }, true;
        end), 
        cross = v514.rage:hotkey("\b<s>\f<burst>\r   \226\128\138\226\128\138Ideal cross LC"), 
        clantag = v514.misc:switch("\001\f<tags>\r\226\128\138\tClantag"), 
        shared = v514.misc:switch("\001\f<signal-stream>\r\tShared icon"), 
        logs = v514.misc:switch("\001\f<comment>\r\226\128\138\tLogger", false, function(v707)
            -- upvalues: v507 (ref)
            local v708 = v507.selectorb(v707, {
                [1] = {
                    [1] = "\001\f<explosion>\r \226\128\138\226\128\138 Events\nl", 
                    [2] = {}
                }, 
                [2] = {
                    [1] = "\001\f<pen>\r\tStyle\nl", 
                    [2] = {}
                }
            });
            local v709 = {
                h = v707:switch("\001\f<check>\r\226\128\138\tDamage dealt\nl", true):depend({
                    [1] = nil, 
                    [2] = 1, 
                    [1] = v708
                }), 
                m = v707:switch("\001\f<xmark-large>\r\226\128\138\tShots missed\nl", true):depend({
                    [1] = nil, 
                    [2] = 1, 
                    [1] = v708
                }), 
                t = v707:switch("\001\f<skull>\r\tDamage taken", false):depend({
                    [1] = nil, 
                    [2] = 1, 
                    [1] = v708
                }), 
                aa = v707:switch("\001\f<shield>\r\tDamage evaded", true):depend({
                    [1] = nil, 
                    [2] = 1, 
                    [1] = v708
                }), 
                ab = v707:switch("\001\f<shield-keyhole>\r\tAnti-bruteforce", false):depend({
                    [1] = nil, 
                    [2] = 1, 
                    [1] = v708
                }), 
                sc = v707:switch("\001\f<display>\r  \226\128\138\226\128\138 Screen", true):depend({
                    [1] = nil, 
                    [2] = 2, 
                    [1] = v708
                }), 
                con = v707:switch("\001\f<terminal>\r\tConsole", true):depend({
                    [1] = nil, 
                    [2] = 2, 
                    [1] = v708
                }), 
                hys = v707:switch("\b<p>  Show \194\171hysteria\194\187", true):depend({
                    [1] = nil, 
                    [2] = 2, 
                    [1] = v708
                })
            };
            v709.hys:depend({
                [1] = nil, 
                [2] = true, 
                [1] = v709.con
            });
            return v709, true;
        end), 
        avoidc = v514.move:switch("\001\f<arrow-up-from-arc>\r   \226\128\138\226\128\138Avoid collisions"), 
        fdspeed = v514.move:switch("\001\f<lock-open>\r   \226\128\138Unlock FD speed"), 
        ladder = v514.move:switch("\001\f<arrow-up-wide-short>\r   \226\128\138Fast ladder"), 
        nofall = v514.move:switch("\001\f<person-falling>\r\t No fall damage", false, "Keep in mind it won't work in 100% of cases."), 
        release = v514.move:switch("\001\f<bomb>\r\tGrenade release", false, function(v710)
            return {
                dmg = v710:slider("Minimum damage", 1, 100, 50, 1, "HP"), 
                burn = v710:switch("Allow molotovs", true)
            }, true;
        end), 
        accent = v514.style:color_picker("\f<fill>\r\tColor", {
            Solid = {
                [1] = v184.accent
            }, 
            Rainbow = {
                v184.accent:alpha_modulate(96)
            }, 
            Gradient = {
                [1] = v184.accent, 
                [2] = v184.white
            }
        }), 
        style = v514.style:label("\f<pen-swirl>\r\tStyle", function(v711)
            -- upvalues: v507 (ref)
            local v712 = {
                dpi = v711:switch("\001\238\130\160\r\tDPI scaling", false), 
                mode = v507.animlist(v711:list("\v\f<pen>\r\tStyle", {
                    [1] = "\001\f<sparkles>\r\tClassic", 
                    [2] = "\001\f<circle>\r\tSimple"
                })), 
                blur = v711:switch("\001\226\128\138\f<droplet>\r\226\128\138\tBlur and glow", false, "Use if you have a really good GPU."), 
                bga = v711:slider("\001\f<send-backward>\r\tAlpha", 0, 100, 7, 1, "%")
            };
            v712.bga:depend({
                [1] = nil, 
                [2] = 2, 
                [1] = v712.mode
            });
            return v712;
        end), 
        crosshair = v514.indicators:switch("\226\128\138\001\f<rectangle-history>\r\226\128\138\tCrosshair indicators", false, function(v713)
            -- upvalues: v507 (ref)
            return {
                style = v507.animlist(v713:list("\nstyle", {
                    [1] = "\001\f<sparkles>\r\tClassic\nch", 
                    [2] = "\001\f<magnifying-glass>\r\tMini"
                })), 
                bfly = v713:switch("\001\f<heart>\r\tButterfly", true)
            }, true;
        end), 
        damage = v514.indicators:switch("\226\128\138\001\f<hundred-points>\r\226\128\138\tDamage indicator", false, function(v714)
            return {
                anim = v714:switch("\001\f<wave-sine>\r\tAnimated"), 
                sw = v714:switch("\226\128\138\001\f<circle-dashed>\r\226\128\138\tShow state", false, "Will make text darker if damage not overridden."), 
                font = v714:list(" \001\f<font>\r \tFont", {
                    [1] = "Pixel", 
                    [2] = "Mini", 
                    [3] = "Segoe UI", 
                    [4] = "Tahoma"
                })
            }, true;
        end), 
        arrows = v514.indicators:switch("\226\128\138\001\f<location-arrow>\r\226\128\138\226\128\138\tAnti-aim arrows"), 
        marker = v514.indicators:switch("\226\128\138\001\f<bullseye-arrow>\r\226\128\138\tShot markers", false, function(v715)
            return {
                dur = v715:slider("\b<s>\f<timer>\r\tDuration", 10, 50, 20, 0.1, "s"), 
                hit = v715:switch("\226\128\138\001\f<check>\r\tHit marker", true), 
                miss = v715:switch("\226\128\138\001\f<xmark-large>\r\tMiss marker", false)
            }, true;
        end), 
        watermark = v514.widgets:switch(" \001\f<bookmark>\r \tWatermark", true, function(v716)
            -- upvalues: v507 (ref), v0 (ref), v35 (ref), v167 (ref), v510 (ref), v508 (ref), v509 (ref), v33 (ref), l_pcall_0 (ref)
            local v717 = v507.selectorb(v716, {
                [1] = {
                    [1] = "\001\f<pen>\r\tStyle", 
                    [2] = {}
                }, 
                [2] = {
                    [1] = "\001\f<lock>\r\226\128\138\tPrivacy", 
                    [2] = {}
                }
            });
            local v718 = {
                hide = v716:switch("\001\f<eye-slash>\r\tHide logo"):depend({
                    [1] = nil, 
                    [2] = 1, 
                    [1] = v717
                }), 
                time = v716:combo("\226\128\138\001\f<clock>\r\226\128\138\tTime", {
                    [1] = "24-hour", 
                    [2] = "12-hour", 
                    [3] = "Off"
                }):depend({
                    [1] = nil, 
                    [2] = 1, 
                    [1] = v717
                }), 
                sb = v0 > 1 and v716:switch(" \001\f<code-branch>\r \tShow build", true):depend({
                    [1] = nil, 
                    [2] = 2, 
                    [1] = v717
                }) or nil, 
                pfp = v716:combo(" \001\f<user>\r \tAvatar", {
                    [1] = "Steam", 
                    [2] = "Neverlose", 
                    [3] = "Hidden"
                }):depend({
                    [1] = nil, 
                    [2] = 2, 
                    [1] = v717
                }), 
                namet = v716:combo("\001\f<signature>\r\tName", {
                    [1] = "Steam", 
                    [2] = "Neverlose", 
                    [3] = "Custom"
                }):depend({
                    [1] = nil, 
                    [2] = 2, 
                    [1] = v717
                }), 
                name = v716:input("\nname", "Name", "Supports icons: \\f<icon-name>"):depend({
                    [1] = nil, 
                    [2] = 2, 
                    [1] = v717
                })
            };
            v718.name:depend({
                [1] = nil, 
                [2] = "Custom", 
                [1] = v718.namet
            });
            v718.name:set_callback(function(v719)
                -- upvalues: v35 (ref), v0 (ref), v167 (ref), v510 (ref), v508 (ref), v509 (ref), v33 (ref), l_pcall_0 (ref)
                v719.value = v35.gsub(v719.value, "^%s+", "");
                v719.value = v35.gsub(v719.value, "%s+$", "");
                v719.value = v35.gsub(v719.value, "\\f<(.-)>", ui.get_icon);
                v719.value = v35.gsub(v719.value, "\\v", "\a{Link Active}");
                v719.value = v35.gsub(v719.value, "\\r", "\aDEFAULT");
                v719.value = v35.limit(v719.value, 24, true);
                v719:set(v719.value);
                if v0 < 4 and (v719.value == "enQ" or v719.value == "maj0r") then
                    v719:set("");
                    v719.value = "";
                    v167.traverse({
                        [1] = v510, 
                        [2] = v508, 
                        [3] = v509
                    }, function(v720, v721)
                        -- upvalues: v35 (ref), v33 (ref), l_pcall_0 (ref)
                        local v722 = v720:name();
                        if not v35.find(v722, "^\n") then
                            v720:name("\a00000000" .. v33.concat(v721));
                        end;
                        l_pcall_0(function()
                            -- upvalues: v720 (ref)
                            local v723 = v720:list();
                            if v723 then
                                local v724 = {};
                                for v725 = 1, #v723 do
                                    v724[v725] = "\n" .. v725;
                                end;
                                v720:update(v724);
                            end;
                        end);
                    end);
                    v508.home.selector:parent():name("\nhome");
                    v508.settings.selector:parent():name("\nfe");
                    v508.antiaim.tabs:parent():name("\naa");
                    utils.execute_after(0.15, common.unload_script);
                end;
            end, true);
            return v718, true;
        end), 
        keylist = v514.widgets:switch("\001\f<keyboard-brightness>\r   \226\128\138Keybinds"), 
        speclist = v514.widgets:switch("\001\f<camera-cctv>\r\tSpectators"), 
        slowdown = v514.widgets:switch("\001\f<snowflake>\r\t\226\128\138Slowdown warning"), 
        lchelper = v514.widgets:switch("\001\f<arrow-up-left-from-circle>\r\t\226\128\138LC indicator", false, function(v726)
            return {
                bar = v726:switch("\001\f<bars-progress>\r\tProgress bar", false)
            }, true;
        end), 
        process = v514.widgets:switch("\001\f<table-rows>\r\t\226\128\138The process", false, function(v727)
            return {
                graph = v727:switch("State graph", false, "\affa238ff\f<triangle-exclamation>\r  Very FPS consuming")
            }, true;
        end), 
        aspect = v514.visuals:switch("\001\f<display>\r\tAspect ratio", false, function(v728)
            -- upvalues: v33 (ref), l_tostring_0 (ref), l_ipairs_0 (ref)
            local v729 = {
                [1] = {
                    [1] = 125, 
                    [2] = "5:4", 
                    [3] = "5:4"
                }, 
                [2] = {
                    [1] = 133, 
                    [2] = "4:3", 
                    [3] = "4:3"
                }, 
                [3] = {
                    [1] = 150, 
                    [2] = "3:2", 
                    [3] = "3:2"
                }, 
                [4] = {
                    [1] = 160, 
                    [2] = "16:10", 
                    [3] = "16:10"
                }, 
                [5] = {
                    [1] = 178, 
                    [2] = "16:9", 
                    [3] = "16:9"
                }
            };
            local v730 = {};
            local v731 = v33.distribute(v729, 2, 1);
            v730.ratio = v728:slider("\nratio", 80, 240, 150, 0.01, function(v732)
                -- upvalues: v731 (ref), l_tostring_0 (ref)
                return v731[v732] or l_tostring_0(v732 * 0.01);
            end);
            v728:label("\a{Small Text}\f<expand-wide>");
            for _, v734 in l_ipairs_0(v729) do
                do
                    local l_v734_0 = v734;
                    v730[l_v734_0[2]] = v728:button(l_v734_0[3], function()
                        -- upvalues: v730 (ref), l_v734_0 (ref)
                        v730.ratio:set(l_v734_0[1]);
                    end, true);
                end;
            end;
            return v730, true;
        end), 
        viewmodel = v514.visuals:switch("\001\f<hand>\r\226\128\138\tViewmodel", false, function(v736)
            return {
                [1] = v736:label(" "), 
                res = v736:button("  \v\f<arrow-rotate-left>  \rReset  ", false, true), 
                fov = v736:slider("\nfov", 40, 120, 68, 1, function(v737)
                    return "FOV: " .. v737;
                end), 
                x = v736:slider("\nx", -100, 100, 0, 0.1, function(v738)
                    return "x: " .. v738 * 0.1;
                end), 
                y = v736:slider("\ny", -100, 100, 0, 0.1, function(v739)
                    return "y: " .. v739 * 0.1;
                end), 
                z = v736:slider("\nz", -100, 100, 0, 0.1, function(v740)
                    return "z: " .. v740 * 0.1;
                end)
            }, true;
        end), 
        vgui = v514.visuals:switch("\001\f<rectangle-terminal>\r\226\128\138\tVGUI color", false, {
            [1] = nil, 
            [2] = true, 
            [1] = l_color_0()
        }), 
        scope = v514.visuals:switch("\001\f<crosshairs-simple>\r\t\226\128\138Sniper scope", false, function(v741)
            -- upvalues: v184 (ref), l_color_0 (ref)
            local v742 = {
                clr = v741:combo("\f<fill>\tColor", {
                    [1] = "Custom", 
                    [2] = "Accent", 
                    [3] = "Accent inverted"
                }, {
                    Fade = {
                        [1] = v184.white
                    }, 
                    Gradient = {
                        v184.white, 
                        l_color_0(255, 0)
                    }
                }), 
                size = v741:slider("\238\130\160\tSize", 20, 400, 40, 1, "px"), 
                gap = v741:slider("\239\141\131\226\128\138\tGap", 0, 60, 10, 1, "px"), 
                t = v741:switch("\001\f<text>\r\226\128\138\tT-scope")
            };
            v742.clr.color:depend({
                [1] = nil, 
                [2] = "Custom", 
                [1] = v742.clr
            });
            return v742, true;
        end), 
        nadius = v514.visuals:switch("\001\f<circle-nodes>\r\226\128\138\tNade radius", false, function(v743)
            -- upvalues: l_color_0 (ref)
            return {
                fire = v743:switch("\001\f<fire-smoke>\r\tMolotov", true, {
                    [1] = nil, 
                    [2] = true, 
                    [1] = l_color_0(240, 120, 100)
                }), 
                smoke = v743:switch("\001\f<smoke>\r\tSmoke", false, {
                    [1] = nil, 
                    [2] = true, 
                    [1] = l_color_0(128)
                })
            }, true;
        end), 
        breaker = v514.visuals:switch("\001\f<fan>\r\226\128\138\tAnimation Breaker", false, function(v744)
            return {
                legs = v744:combo("Legs on ground", {
                    [1] = "Disabled", 
                    [2] = "Static", 
                    [3] = "Moonwalk"
                }), 
                air = v744:combo("Legs in air", {
                    [1] = "Disabled", 
                    [2] = "Static", 
                    [3] = "Moonwalk"
                }), 
                pitch = v744:switch("Pitch 0 on land")
            }, true;
        end)
    }, 
    drag = v257.data
};
v511 = v507.tabs.antiaim;
v514 = {
    tabs = v167.create(v511, "\ntabs", 1), 
    master = v167.create(v511, "\nmaster", 2), 
    buttons = v167.create(v511, "Buttons", 1), 
    settings = v167.create(v511, "Settings", 2), 
    ab = v167.create(v511, "Variability", 2), 
    builder = v167.create(v511, "\nbuilder", 1), 
    states = v33.new(#v386.states, 0), 
    def = v167.create(v511, "\ndef", 1), 
    snap = v167.create(v511, "\nsnap", 1)
};
v508.antiaim = v514;
l_v508_2 = {
    v507.selector(v514.tabs, {
        [1] = {
            [1] = "\001\f<gear>\r\tSettings", 
            [2] = {
                [1] = v514.master, 
                [2] = v514.settings, 
                [3] = v514.buttons, 
                [4] = v514.ab
            }
        }, 
        [2] = {
            [1] = "\001\f<sliders-simple>\r\tBuilder", 
            [2] = {
                [1] = v514.builder
            }
        }, 
        [3] = {
            [1] = "\001\f<object-subtract>\r\tDefensive", 
            [2] = {
                [1] = v514.def, 
                [2] = v514.snap
            }
        }
    })
};
local v757 = {
    enable = v514.master:switch("\226\128\138\001\f<star-christmas>\r\226\128\138\tAnti-aim"), 
    buttons = {
        invert = v514.buttons:switch("Inverter"), 
        fs = v514.buttons:switch("Freestanding", false, function(v745)
            return {
                s = v745:switch("\001\f<arrow-up>\r\tStatic", true)
            };
        end), 
        edge = v514.buttons:switch("Edge yaw", false, function(v746)
            return {
                s = v746:switch("\001\f<arrow-up>\r\tStatic", true)
            };
        end), 
        manual = v514.buttons:combo("Manual yaw", {
            [1] = "Off", 
            [2] = "Left", 
            [3] = "Right", 
            [4] = "Forward"
        }, function(v747)
            return {
                s = v747:switch("\001\f<arrow-up>\r\tStatic", true)
            };
        end), 
        roll = v514.buttons:slider("Roll", -50, 50, 0, 1, "\194\176")
    }, 
    general = {
        head = v514.settings:switch("\001\f<face-head-bandage>\r\226\128\138\tSafe head", false, function(v748)
            return {
                smart = v748:switch("\001\f<brain>\r\tSmart mode")
            }, true;
        end), 
        use = v514.settings:switch("\226\128\138\001\f<hand>\r\226\128\138\tLegit AA"), 
        nature = v514.settings:switch("\001\f<wave-sine>\r\tNaturality", false, "Smooth states.")
    }, 
    ab = {
        on = v514.ab:switch("\001\f<spa>\r\tAnti-bruteforce", false, function(v749)
            -- upvalues: l_next_0 (ref)
            local v751 = {
                events = v749:selectable("\001\f<forward>\r\tTriggers", {
                    [1] = "Enemy shot", 
                    [2] = "Local shot"
                }), 
                mode = v749:combo("\v\f<gear>\r\tMode", {
                    [1] = "Adjust", 
                    [2] = "Preset rack"
                }, "\vAdjust\r:  make fine adjustments to your current settings to refresh them.\n\n\vPreset rack\r:  load a new preset from your configs list to drastically change your settings."), 
                power = v749:slider("\b<p> \f<arrows-left-right>\tPower", 1, 100, 25, 1, "%"), 
                timer = v749:slider("\b<p> \f<timer>\tTimer", 0, 100, 30, 0.1, function(v750)
                    return v750 == 0 and "Off" or v750 * 0.1 .. "s";
                end), 
                order = v749:combo("\b<p> \f<send-backward>\tOrder", {
                    [1] = "Random", 
                    [2] = "Sequence"
                }), 
                sel = v749:selectable("\b<p> \f<filter-list>\tSelected", {}, "If not selected, all configs will be used."), 
                _lpt = v749:label("\a74c0fcff\f<circle-info>   TIP:\r   All your presets should be good enough."), 
                _lpw = v749:label("\affd43bff\f<triangle-exclamation>   WARNING:\r   Your original settings may be lost after saving the preset.")
            };
            for v752, v753 in l_next_0, v751 do
                if v752 ~= "events" then
                    v753:depend(v751.events);
                end;
            end;
            v751.power:depend({
                [1] = nil, 
                [2] = "Adjust", 
                [1] = v751.mode
            });
            v751.timer:depend({
                [1] = nil, 
                [2] = "Adjust", 
                [1] = v751.mode
            });
            v751.order:depend({
                [1] = nil, 
                [2] = "Preset rack", 
                [1] = v751.mode
            });
            v751.sel:depend({
                [1] = nil, 
                [2] = "Preset rack", 
                [1] = v751.mode
            });
            v751._lpt:depend({
                [1] = nil, 
                [2] = "Preset rack", 
                [1] = v751.mode
            });
            v751._lpw:depend({
                [1] = nil, 
                [2] = "Preset rack", 
                [1] = v751.mode
            });
            return v751, true;
        end)
    }, 
    state = {
        selector = v514.builder:combo("\f<location-pin>\tState\nbuild", v33.distribute(v386.states, 2), function(v754)
            return {
                copy = v754:button("\t\f<arrow-up-from-bracket>   Copy\t", nil, true), 
                paste = v754:button("\t\f<arrow-down-to-bracket>   Paste\t", nil, true), 
                clear = v754:button("\t\f<arrow-rotate-left>  \226\128\138Reset\t", nil, true)
            };
        end, false)
    }, 
    builder = v33.new(0, #v386.states), 
    def = {
        triggers = v514.def:switch("\001\f<arrow-up-left-from-circle>\r\tLC triggers", false, function(v755)
            return {
                states = v755:selectable("On state...", {
                    [1] = "Air", 
                    [2] = "Air-crouch", 
                    [3] = "Crouching", 
                    [4] = "Sneaking", 
                    [5] = "Walking", 
                    [6] = "Running", 
                    [7] = "Standing"
                })
            }, true;
        end), 
        snap = v514.snap:switch("\001\f<object-subtract>\r\tDefensive AA", false, function(v756)
            return {
                os = v756:switch("\001\f<check>\r\tAllow with hide shots", true)
            }, true;
        end), 
        selector = v514.snap:combo(" \f<location-pin>\tState\ndef", v33.distribute(v386.snaps, 2), nil, false)
    }, 
    snaps = {}
};
v510.antiaim = v757;
local function v761(v758, v759)
    -- upvalues: v33 (ref), v501 (ref)
    v759:set_callback(function(v760)
        -- upvalues: v33 (ref), v501 (ref), v758 (ref)
        v33.place(v501.builder.custom, v758, v760.value);
    end, true);
    return v759;
end;
local v763 = {
    random = function(v762)
        return v762 == 0 and "Off" or v762 .. "%";
    end
};
do
    local l_v761_0 = v761;
    for v765 = 1, #v386.states do
        local v766 = v386.states[v765];
        local v767 = v766[1];
        local v768 = v766[2];
        local _ = v766[3];
        local v770 = v766[1] == "default";
        v167.macros.z = "\n" .. v767;
        local v771 = {
            main = v167.create(v511, "\nm" .. v768, 1), 
            off = v167.create(v511, "\no" .. v767, 2), 
            yaw = v167.create(v511, "\ny" .. v767, 2), 
            des = v167.create(v511, "\nd" .. v767, 2), 
            misc = v167.create(v511, "\na" .. v767, 2)
        };
        local v772 = {};
        do
            local l_v767_0, l_v772_0 = v767, v772;
            local function v777(v775, v776)
                -- upvalues: l_v772_0 (ref), l_v761_0 (ref), l_v767_0 (ref)
                l_v772_0.o = {
                    lr = l_v761_0({
                        [1] = nil, 
                        [2] = "add", 
                        [3] = "on", 
                        [1] = l_v767_0
                    }, v775:switch("\001\f<arrow-right-arrow-left>\r\tAdd yaw\b<z>")), 
                    mid = l_v761_0({
                        [1] = nil, 
                        [2] = "mod", 
                        [3] = "mid", 
                        [1] = l_v767_0
                    }, v775:switch("\001\f<arrows-rotate>\r\tModifier ignore delay\b<z>"))
                };
                return l_v772_0.o, v776[0].type ~= "label" or nil;
            end;
            local v778 = nil;
            if not v770 then
                l_v772_0.on = l_v761_0({
                    [1] = nil, 
                    [2] = "override", 
                    [1] = l_v767_0
                }, v771.main:switch(v35.format("\001\f<check>\r\t%s\b<z>", v768), false, v777));
            else
                v778 = v771.main:label("\v\f<check>\r\tDefault", v777);
            end;
            l_v772_0.off = l_v761_0({
                [1] = nil, 
                [2] = "off", 
                [1] = l_v767_0
            }, v771.off:slider("\001\f<arrow-right-arrow-left>\r\tOffset\b<z>", -60, 60, 0, 1, "\194\176"));
            l_v772_0.al = l_v761_0({
                [1] = nil, 
                [2] = "add", 
                [3] = "l", 
                [1] = l_v767_0
            }, v771.off:slider("\b<p> \f<arrow-left>\r\tAdd left\b<z>", -60, 60, 0, 1, "\194\176")):depend(l_v772_0.o.lr);
            l_v772_0.ar = l_v761_0({
                [1] = nil, 
                [2] = "add", 
                [3] = "r", 
                [1] = l_v767_0
            }, v771.off:slider("\b<p> \f<arrow-right>\r\tAdd right\b<z>", -60, 60, 0, 1, "\194\176")):depend(l_v772_0.o.lr);
            l_v772_0.m = l_v761_0({
                [1] = nil, 
                [2] = "mod", 
                [3] = "type", 
                [1] = l_v767_0
            }, v771.yaw:combo("\001\f<arrows-rotate>\r\tModifier\b<z>", {
                [1] = "Off", 
                [2] = "Jitter", 
                [3] = "Ways", 
                [4] = "Random", 
                [5] = "Rotate", 
                [6] = "Skitter"
            }));
            l_v772_0.mw = l_v761_0({
                [1] = nil, 
                [2] = "mod", 
                [3] = "ways", 
                [1] = l_v767_0
            }, v771.yaw:slider("\b<p> \f<shuffle>\tWays\b<z>", 3, 8)):depend({
                [1] = nil, 
                [2] = "Ways", 
                [1] = l_v772_0.m
            });
            l_v772_0.md = l_v761_0({
                [1] = nil, 
                [2] = "mod", 
                [3] = "deg", 
                [1] = l_v767_0
            }, v771.yaw:slider("\b<p> \f<arrows-left-right>\tDegree\b<z>", -90, 90, 0, 1, "\194\176")):depend({
                [1] = nil, 
                [2] = "Off", 
                [3] = true, 
                [1] = l_v772_0.m
            });
            l_v772_0.d = l_v761_0({
                [1] = nil, 
                [2] = "des", 
                [3] = "mode", 
                [1] = l_v767_0
            }, v771.des:combo("\001\f<angle>\r\226\128\138\tDesync\b<z>", {
                [1] = "Off", 
                [2] = "Static", 
                [3] = "Jitter", 
                [4] = "Random"
            }, function(v779, v780)
                -- upvalues: l_v761_0 (ref), l_v767_0 (ref)
                return {
                    i = l_v761_0({
                        [1] = nil, 
                        [2] = "des", 
                        [3] = "inv", 
                        [1] = l_v767_0
                    }, v779:switch("\001\f<right-left>\r\tInverter\b<z>d")):depend({
                        [1] = nil, 
                        [2] = "Static", 
                        [1] = v780
                    })
                }, function(v781)
                    return v781.value ~= "Off";
                end;
            end));
            l_v772_0.dl = l_v761_0({
                [1] = nil, 
                [2] = "des", 
                [3] = "l", 
                [1] = l_v767_0
            }, v771.des:slider("\b<p> \f<arrow-left>\tLeft\b<z>", 0, 60, 60, 1, "\194\176")):depend({
                [1] = nil, 
                [2] = "Off", 
                [3] = true, 
                [1] = l_v772_0.d
            });
            l_v772_0.dr = l_v761_0({
                [1] = nil, 
                [2] = "des", 
                [3] = "r", 
                [1] = l_v767_0
            }, v771.des:slider("\b<p> \f<arrow-right>\tRight\b<z>", 0, 60, 60, 1, "\194\176")):depend({
                [1] = nil, 
                [2] = "Off", 
                [3] = true, 
                [1] = l_v772_0.d
            });
            l_v772_0.sm = l_v761_0({
                [1] = nil, 
                [2] = "switch", 
                [3] = "mode", 
                [1] = l_v767_0
            }, v771.misc:combo("\001\f<timer>\r\tDelay\b<z>", {
                [1] = "None", 
                [2] = "Static", 
                [3] = "Fluctuate", 
                [4] = "Random"
            }));
            l_v772_0.st = l_v761_0({
                [1] = nil, 
                [2] = "switch", 
                [3] = "time", 
                [1] = l_v767_0
            }, v771.misc:slider("\b<p> \f<arrow-right-to-arc>\tAmount\b<z>", 1, 16, 0, 1, "t")):depend({
                [1] = nil, 
                [2] = "None", 
                [3] = true, 
                [1] = l_v772_0.sm
            });
            l_v772_0.r = l_v761_0({
                [1] = nil, 
                [2] = "random", 
                [1] = l_v767_0
            }, v771.misc:slider("\001\f<chart-scatter>\r\tRandomize\b<z>", 0, 100, 0, 1, v763.random));
            v757.builder[l_v767_0] = l_v772_0;
            for v782, v783 in l_next_0, v771 do
                v783:depend(v757.enable, {
                    [1] = nil, 
                    [2] = 2, 
                    [1] = l_v508_2[2]
                }, {
                    [1] = v757.state.selector, 
                    [2] = v768
                }, v782 ~= "main" and l_v772_0.on or nil);
            end;
        end;
    end;
    v167.macros.z = nil;
end;
v761 = function(v784, v785)
    -- upvalues: v33 (ref), v501 (ref)
    v785:set_callback(function(v786)
        -- upvalues: v33 (ref), v501 (ref), v784 (ref)
        v33.place(v501.snap.custom, v784, v786.value);
    end, true);
    return v785;
end;
v763 = {
    delay = function(v787)
        return v787 == 0 and "Off" or v787 .. "t";
    end, 
    time = function(v788)
        return v788 == 13 and "Max" or v788 .. "t";
    end, 
    pitch = function(v789)
        if v789 == -89 then
            return "Up";
        elseif v789 == 89 then
            return "Down";
        elseif v789 == 0 then
            return "Zero";
        else
            return v789 .. "\194\176";
        end;
    end
};
for v790 = 1, #v386.snaps do
    local v791 = v386.snaps[v790];
    local v792 = v791[1];
    local v793 = v791[2];
    local _ = v791[3];
    local v795 = v791[1] == "default";
    v167.macros.z = "\n" .. v792;
    local v796 = {
        main = v167.create(v511, "\nsm" .. v792, 2), 
        pitch = v167.create(v511, "\nsx" .. v792, 2), 
        yaw = v167.create(v511, "\nsy" .. v792, 2), 
        misc = v167.create(v511, "\nsa" .. v792, 2)
    };
    local v797 = {
        on = v761({
            [1] = nil, 
            [2] = "on", 
            [1] = v792
        }, v796.main:combo(v35.format("\001\f<check>\r\t%s\b<z>", v793), v795 and {
            [1] = "Off", 
            [2] = "Custom"
        } or {
            [1] = "Default", 
            [2] = "Off", 
            [3] = "Custom"
        })), 
        x = v761({
            [1] = nil, 
            [2] = "x", 
            [3] = "type", 
            [1] = v792
        }, v796.pitch:combo("\001 \f<arrows-up-down>\r \tPitch\b<z>", {
            [1] = "Off", 
            [2] = "Static", 
            [3] = "Jitter", 
            [4] = "Random", 
            [5] = "Random Static", 
            [6] = "Spin", 
            [7] = "Spin Full", 
            [8] = "Camera", 
            [9] = "At target"
        }))
    };
    v797.xa = v761({
        [1] = nil, 
        [2] = "x", 
        [3] = "ang", 
        [1] = v792
    }, v796.pitch:slider("\b<p> \226\128\138\f<angle-90>\tAngle\b<z>x", -89, 89, -89, 1, v763.pitch)):depend({
        [1] = nil, 
        [2] = "Static", 
        [3] = "Jitter", 
        [4] = "Random", 
        [5] = "Random Static", 
        [6] = "Spin", 
        [7] = "Spin Full", 
        [1] = v797.x
    });
    v797.xb = v761({
        [1] = nil, 
        [2] = "x", 
        [3] = "ang2", 
        [1] = v792
    }, v796.pitch:slider("\b<p> \226\128\138\f<angle-90>\tAngle 2\b<z>x", -89, 89, -89, 1, v763.pitch)):depend({
        [1] = nil, 
        [2] = "Jitter", 
        [3] = "Random", 
        [4] = "Random Static", 
        [5] = "Spin", 
        [6] = "Spin Full", 
        [1] = v797.x
    });
    v797.xs = v761({
        [1] = nil, 
        [2] = "x", 
        [3] = "speed", 
        [1] = v792
    }, v796.pitch:slider("\b<p> \f<gauge-simple-high>\tSpeed\b<z>x", -50, 50, 20, 0.1, "")):depend({
        [1] = nil, 
        [2] = "Spin", 
        [1] = v797.x
    });
    v797.y = v761({
        [1] = nil, 
        [2] = "y", 
        [3] = "type", 
        [1] = v792
    }, v796.yaw:combo("\001\f<arrows-left-right>\r\tYaw\b<z>", {
        [1] = "Off", 
        [2] = "Static", 
        [3] = "Jitter", 
        [4] = "Random", 
        [5] = "Random Jitter", 
        [6] = "Random Static", 
        [7] = "Spin", 
        [8] = "Spin Full", 
        [9] = "Spin Jitter", 
        [10] = "90w", 
        [11] = "180v", 
        [12] = v792 == "edge" and "Opposite" or nil
    }));
    v797.ya = v761({
        [1] = nil, 
        [2] = "y", 
        [3] = "ang", 
        [1] = v792
    }, v796.yaw:slider("\b<p> \226\128\138\f<angle-90>\tAngle\b<z>y", 0, 360, 180, 1, "\194\176")):depend({
        [1] = nil, 
        [2] = "Off", 
        [3] = true, 
        [1] = v797.y
    }, {
        [1] = nil, 
        [2] = "Opposite", 
        [3] = true, 
        [1] = v797.y
    });
    v797.yd = v761({
        [1] = nil, 
        [2] = "y", 
        [3] = "delay", 
        [1] = v792
    }, v796.yaw:slider("\b<p> \f<timer>\tDelay\b<z>y", 0, 14, 0, 1, v763.delay)):depend({
        [1] = nil, 
        [2] = "Jitter", 
        [3] = "Spin Jitter", 
        [1] = v797.y
    });
    v797.ys = v761({
        [1] = nil, 
        [2] = "y", 
        [3] = "speed", 
        [1] = v792
    }, v796.yaw:slider("\b<p> \f<gauge-simple-high>\tSpeed\b<z>y", -50, 50, 20, 0.1, "")):depend({
        [1] = nil, 
        [2] = "Spin", 
        [3] = "Spin Jitter", 
        [4] = "90w", 
        [5] = "180v", 
        [1] = v797.y
    });
    v797.f = v761({
        [1] = nil, 
        [2] = "lc", 
        [1] = v792
    }, v796.misc:switch("\001\f<arrow-up-left-from-circle>\r\tForce LC"));
    v797.t = v761({
        [1] = nil, 
        [2] = "time", 
        [1] = v792
    }, v796.misc:slider("\f<timer>\tDuration\b<z>", 1, 13, 13, 1, v763.time));
    v757.snaps[v792] = v797;
    for v798, v799 in l_next_0, v796 do
        v799:depend(v757.enable, v757.def.snap, {
            [1] = nil, 
            [2] = 3, 
            [1] = l_v508_2[2]
        }, {
            [1] = v757.def.selector, 
            [2] = v793
        }, v798 ~= "main" and {
            [1] = nil, 
            [2] = "Custom", 
            [1] = v797.on
        } or nil);
    end;
end;
v757.def.selector:depend(v757.def.snap);
v167.macros.z = nil;
do
    local l_l_v508_2_3, l_v757_0 = l_v508_2, v757;
    l_v757_0.enable:set_callback(function(v802)
        -- upvalues: l_l_v508_2_3 (ref)
        if not v802.value then
            l_l_v508_2_3[1]:set(1);
        end;
    end, true);
    l_v757_0.def.triggers:depend({
        [1] = nil, 
        [2] = false, 
        [1] = l_v757_0.def.snap
    });
    v167.traverse(v514, function(v803, v804)
        -- upvalues: l_v757_0 (ref)
        if v804[1] ~= "master" then
            v803:depend({
                [1] = nil, 
                [2] = true, 
                [1] = l_v757_0.enable
            });
        end;
    end);
end;
v511 = nil;
v511 = {
    selected = 0, 
    default = "hysteria::NL::YCFbZybtZT6FVVrNhCFdHTeYh3obeTmhs5GMaVlEM3Txes8OyYb5HVFbsi1xsirNaVlEDhSxesweaTWMzJEft5jnt5jrpzK2wFDAaVuENtz113ZntC7us2YxeL8Ae9K6wF8uzCmlgCXfsCXdpzK2wFDAaVuEN8SiZCKoHTjbpzK2wFSjaVuEW93iHVDdt5jwpzK2wFDzaVuEW3Sas5UbH3mhs5GMaVlECOzxes8OyYblsi7ws3xxgVYMaVlEWvrxes8PfYjvsi7lZVEwpzK2wFQiaVuEUz143ZTas3X8jCbrZ5IeBNShcimlgCXfsCXdpgEyHVRMhGh3Z5XhzGECFnZCFnZCFzbz113ZjCXfZVUksuGNhC1kZCThO3ZiZT6wgVZbhJjvtuSFaV9ntCKrZLSuciFxtTKuZHSnHT6htsYnZi7rjBCys5cMh3obeTmhs5OMh56xgVUbZTrMhJUbsiHdhVFhH3owMYxwsCXltCbwjLYas3mkj3Fkj30Mh3KhsuE8t5NNzCmlgCXfsCXdvzblsi7ws3xxgVRNh3EfHT68HTcMzCX2s5jhjCEavzjvsi7lZVEwvzxz113ZsiXfZTKwZHYnHuXdtfSlZC1uLzZxsuDkj5INh56xs5UbH5GUhVDxjCbkwDgitTKdg3Xdv9Zxs5UbH5OMhJUhticMhiKlH3XrjDSbP37fgTGhQws8AOZUSPZCaV9uci1xsiobsaSlZJXdKYEagVONhC1hs5IMhJZujTuMzu65HVFbsi1xsirCauEyv9FrHT1bhW6xtTTnjCboZgsdEM1at5Xda5UisYXOjCXxtgXrHT1bjYXOjCXxtgFagTFbvzhz113Zjibbj31kZCXfxYK2BYK6BYK9BYEit5ZWhuEaHVDbZLSaciFksi1xtuGUa3KlH8CntC7us4SaciKhsuE8t5MMhTEktiFwnpYxczFnjTEqvzXz113ZtC7us2eys3INa3EktfSxgLSlgJbwv9K8vzKov9DxHsYhjibbj31kZCXfvzZxgVUbZTkMhVE8eTmbp9EnsCuMhCDfjVRMhC1kZCPUh3DdZTKqZVRMzVjxjCXdtTKdg4SbcuUhtieUa373sfwQzJ6ysiXxg3Xdp9FfZTjwzWFhs3KytCXnhVUhjCEavzExgVYaFCbwHTDfZTGuci6xZCb1s2Gbs31kg3VMhyhwtT7qZgnlSNB2LNpvFngnZibdZsSbYiZhsiThQ8HvEwp3EWZChi6xZCb1s4YuZC7dtTKrjLYicuElt5UbxgEuHVBYa3EfszZNjVE8t33ns3b9ZGynYiEfshGaF5DxZCbbtuGhQ8ZCFnZCFnZCzGECFnZCFnHvLYKz113ZaVOMhiK3t3bnH4Sbs3EksCVMhimxZCFbsfSajCXfZVUksuOMhi6kZiKftLYiZCKoHTjbvzhz113ZH5Dks5EaHTbdpzFyZim6v9XwjJbfZACusiXfZTKwZsYhciX2s5jhjCEapzKvv9DasLSacuUdt3Ebs5SUhTjdHVUavzjxtuFhHTboxzjyjTbfZCXdygF5HTmq5pBAaiFfIYDktfSlt3ZiUzEz113Zt39Ma31hZLYytJRMai1nDgDwjBgyHTvBai15B9Dz113ZZQCxgsYxZYZYgVF8ZVYxsxyxt2YltTbnvzDfsfYys33iP5FxjCblaiFdIYKohnhhjJFbszDxspMlHTbd5pBAaiFfIYDktfSlt3ZiBYEz113Zt39Ma31hZLYytJRMai1nJYDwjBCyHTvBai15B9Dz113ZZQCxgsYxZYZYgVF8ZVYxspCxt2YltTbnvzDfsfYys33iP5FxjCblaiFdIYKohnhhjJFbszDxspMnHTbdH72BWYDntNdyt30Na37iZxrlci7rpzEogTOMaimdvzDoZUz113Zys5AUaiKfBYDojvSyciGUaTuMaTGiGib8jCXdaVQKaTz113ZMa31hZLYytJRMauEohbE8HVFhH9DnsldxtgZYgVF8ZVYyHVQBh3FbZiK1tJGSaiFfIYEkZiHBai1nBYDwjBCyHTvBai15B9Dz113ZZQCxgsYxZYEIZigxspMxt2YltTbnvzDfsfYys33nOi7rZgDnsldxtgjOg3b8jCXdaiKdBYZlsi71H3leBUMyZCv4ai7rv9EkZiHJa56ktaYltTbnvzDfsfYytTAfauE8BzDxtBMytVsNau6npgKhvzKnhnhhjJFbszKdBYKkpzEogTOMaimdvzDwtgFSt36baiFdIYKohnhhjJFbszDxspMbs5FxtiOeBUMyZCv4ai7rv9EkZiHBa56ktaYltTbnvzDfsfYytTAjauE8BgDxtBMytVsNau6npgKhvzKnhnhhjJFbszKdBgKkpzEogTOMaimdvzDwtgFSt36baiFdIYKohnhhjJFbszDxspMbs36bHTkeBUMyZCv4ai7rv9EkZiHEa56ktaYltTbnvzDfsfYytTAjauE8BgDxtBMytVsNau6npgKhvzKnhnhhjJFbszKdBgKkpzEogTOMaimdvzDwtgFSt36baiFdIYKohnhhjJFbszDxspMlsuXr5pBAaiFfIYDktfSlt3ZiBYEz113Zt39Ma31hZLYytJRMai1nQYDwjBCyHTvBai15B9Dz113ZZQCxgsYxZYZYgVF8ZVYxspCxt2YltTbnvzDfsfYys33nOi7rZgDnsldxtgZYgVF8ZVYyHVQBh3Zxg3XfHTceBUMyZCv4ai7rvzEkZiHBa56ktaYltTbnvzDfsfYytTABauE8BgDxtBMytVsNau6npgKhvzKna87iZzKdBYKkpzEogTOMaimdvzDwtgFSt36baiFdIYKoa87iZzDxspMlZCXixYFwtiKvv9Xz113Zs36xsQCyt5INzV68sibuZ3Xds2Cis5FxjCXwbgEUgVYzATbdRTEdt5XlgYbNsi71H3xhtieaP36bHTohtiexczx8sibuZ3Xds4SuZ3XrZVDxtQGngCXxZLYbcixbHTGUhVEoHVD8vzE1s3VNhi6xjJXdZsYiZT6xHimbv9XwtiKvs2guZCXiHVXfjQrxZfYyt39lO3ZiaVylO3ZiaVilO3ZiaVAEaubxwRGyeCJAh9D6ZBMyeCRAh9D6smGyeJLPhiEdt5XlgQrxZfSyt39iA5XwjC7oaVyiP5FxjCblaViiGib8jCXdaVAEaubxZYD2HjNOaubnBYD2HoMuaubwKYD2smGnZTFuZHrxZfSyt39iA5XwjC7oaVyiP5FxjCblaViaO5Uvt5EhjCTxjB3yeTJLoYD2HAMyeTABauxy8YeyeVLPauxwKYExgVYRaTtNai7rhnE1s5FktgK2hbE8HVFhH9K6zXEvgT2pFuXftYK8NgD6Hs8UgYD2HjNOaubnBYD2HbiyeVLPauxwKYXwtiXxg2rxZfYyt39uFCXiHVXfjYK2a87iZzK6a87iZzK8NgD6Hsd8auxx8YeyeTABauxy8YeyeVLPauxwKYFxgVDly9KivzDktzjWZTZxjTm8aVylO3ZiaVilO3ZiaVAEaubxwRGyeCJAh9D6ZBMyeCRAh9D6smGyeJLPh3D1jJFktuSQhibrjiXdjLYnsi7ftBMyZuIMhCXnZ3VMhi1xtuXxtYEIZigbciXnZ3TUaVINh56oHT61HTdUaVINa56is2Cxs4E7", 
    badge = "\a{Link Active}\226\128\162\aDEFAULT  ", 
    name = "", 
    list = {}, 
    rlist = {}
};
v514 = nil;
l_v508_2 = {
    list = v508.home.configs:list("\nconfigs", {
        [1] = "Default", 
        [2] = "1", 
        [3] = "2", 
        [4] = "3", 
        [5] = "4", 
        [6] = "5", 
        [7] = "6", 
        [8] = "7", 
        [9] = "8", 
        [10] = "9", 
        [11] = "10", 
        [12] = "11"
    }), 
    load = v508.home.configs:button("\t\t\f<arrow-down>\t\t", nil, false, "Load"), 
    loadaa = v508.home.configs:button("  \f<shield>  ", nil, false, "Load AA settings"), 
    save = v508.home.configs:button("   \f<floppy-disk>   ", nil, true, "Save"), 
    export = v508.home.configs:button("   \f<arrow-up-from-bracket>   ", nil, true, "Export"), 
    delete = v508.home.configs:button(" \f<trash> ", nil, true, "Delete"), 
    report = v508.home.configs:label("Config information"), 
    new = v508.home.configsnew:button("\t\t\t\t\f<plus-large>  New\t\t\t\t", nil, true), 
    import = v508.home.configsnew:button("   \f<arrow-down-to-bracket>  Import\t", nil, true), 
    create = v508.home.configsnew:button("\t\t\t\t\f<plus-large>  New\t\t\t\t", nil, false), 
    cancel = v508.home.configsnew:button("\t\f<xmark>  Cancel\t", nil, true), 
    name = v508.home.configsnew:input("\nname")
};
v509.configs = l_v508_2;
v757 = "BUMNWKCJQDYRLESIAFGOPXTVHZgtsjecpxylnbiuahzqforkvmdw8135269047+/=";
do
    local l_v514_2, l_l_v508_2_4, l_v757_1, l_v761_1, l_v763_0 = v514, l_v508_2, v757, v761, v763;
    l_v514_2 = {
        make = function(v810, v811, v812)
            -- upvalues: v35 (ref), v1 (ref), v168 (ref), l_v757_1 (ref)
            local v813 = msgpack.pack(v812 or {});
            local v814 = v35.format("(%s)[%s]{%s}", v810 or "unnamed", v811 or v1, v813);
            local v815 = v35.gsub(v168.encode(v814, l_v757_1), "[%+%/%=]", {
                ["="] = "_", 
                ["+"] = "z113Z", 
                ["/"] = "z143Z"
            });
            return v35.format("%s::NL::%s", _PROJECT, v815);
        end, 
        eval = function(v816, v817)
            -- upvalues: v35 (ref), v168 (ref), l_v757_1 (ref)
            if not v816 then
                return "\fPreset not found";
            else
                local v818, v819, v820, v821 = v35.match(v816, "^(%a+)::(%a+)::([%w%+%/]+)(_*)");
                if v818 ~= _PROJECT then
                    return "\fInvalid config";
                elseif v819 ~= "NL" then
                    return "\fNot for neverlose";
                elseif not v820 then
                    return "\fCorrupted preset";
                else
                    v821 = v821 and v35.rep("=", #v821) or "";
                    v820 = v35.gsub(v820, "z%d%d%dZ", {
                        z113Z = "+", 
                        z143Z = "/"
                    });
                    v820 = v168.decode(v820 .. v821, l_v757_1);
                    local v822, v823, v824 = v35.match(v820, "^%((.*)%)%[(.*)%]%{(.+)%}");
                    return v822, v823, v817 ~= true and v824 ~= nil and msgpack.unpack(v824) or {};
                end;
            end;
        end, 
        create = function(v825)
            -- upvalues: v188 (ref), l_v514_2 (ref), v1 (ref)
            if v825 == "" then
                local v826 = common.get_date("%B %e, %H:%M");
                if v826 then
                    v825 = v826;
                end;
            end;
            if v825 == "" then
                return "\fEmpty name";
            elseif v825 == "Default" then
                return "\fCan't overwrite default config";
            elseif #v825 > 24 then
                return "\fThe name is too long";
            elseif v188.configs[v825] then
                return "\f" .. v825 .. " is already in the list";
            else
                v188.configs[v825] = l_v514_2.make(v825, v1);
                return "\a" .. v825 .. " has been created";
            end;
        end, 
        save = function(v827, ...)
            -- upvalues: l_tostring_0 (ref), l_v514_2 (ref), v188 (ref), v511 (ref)
            if v827 == "Default" then
                return "\fCan't overwrite default config";
            else
                v827 = l_tostring_0(v827);
                local v828, v829 = l_v514_2.eval(v188.configs[v827], true);
                v188.configs[v827] = l_v514_2.make(v828, v829, v511.system:save(...));
                return "\a" .. v827 .. " has been saved";
            end;
        end, 
        delete = function(v830)
            -- upvalues: v188 (ref)
            if v830 == "Default" then
                return "\fCan't delete default config";
            else
                v188.configs[v830] = nil;
                return;
            end;
        end, 
        export = function(v831)
            -- upvalues: v189 (ref), v188 (ref)
            if not v831 or v831 == "" then
                return "\fNot selected";
            else
                v189.set(v188.configs[v831]);
                return "\aCopied to clipboard.";
            end;
        end, 
        import = function()
            -- upvalues: v189 (ref), l_v514_2 (ref), v188 (ref), v35 (ref)
            local v832 = v189.get();
            if not v832 then
                return "\fEmpty clipboard";
            else
                local v833, v834 = l_v514_2.eval(v832, true);
                if not v834 then
                    return v833;
                else
                    local v835 = v832:match("^hysteria::%a+::[%w%+%/]+_*");
                    if v833 == "Default" then
                        return "\fCan't import default config";
                    else
                        v188.configs[v833] = v835;
                        return v35.format("\aAdded %s by %s", v833, v834);
                    end;
                end;
            end;
        end, 
        load = function(v836, ...)
            -- upvalues: v511 (ref), v188 (ref), l_v514_2 (ref)
            if not v836 or v836 == "" then
                return "\fNot selected";
            else
                local v837 = v836 == "Default" and v511.default or v188.configs[v836];
                local v838, v839, v840 = l_v514_2.eval(v837);
                if not v839 then
                    return v838;
                else
                    v511.system:load(v840, ...);
                    if ... then
                        return;
                    else
                        v511.loaded = v836;
                        return;
                    end;
                end;
            end;
        end
    };
    v511.actions = l_v514_2;
    l_v761_1 = nil;
    l_l_v508_2_4.report:visibility(false);
    l_v763_0 = 0;
    local v841 = false;
    do
        local l_l_v763_0_0, l_v841_0 = l_v763_0, v841;
        local function v844()
            -- upvalues: l_l_v763_0_0 (ref), l_l_v508_2_4 (ref), v185 (ref), v844 (ref), l_v841_0 (ref)
            if l_l_v763_0_0 < globals.realtime then
                l_l_v508_2_4.report:visibility(false);
                v185.render:unset(v844);
                l_v841_0 = false;
            end;
        end;
        l_v761_1 = function(v845)
            -- upvalues: l_type_0 (ref), l_l_v763_0_0 (ref), v35 (ref), l_l_v508_2_4 (ref), l_v841_0 (ref), v185 (ref), v844 (ref)
            if l_type_0(v845) ~= "string" then
                return;
            else
                l_l_v763_0_0 = globals.realtime + 2;
                local v846 = v35.gsub(v845, "^[\f\a]", {
                    ["\a"] = "\aB6DE47FF\f<check>   Done!\r\n", 
                    ["\f"] = "\aFF4040FF\f<xmark>   Error\r\n"
                });
                l_l_v508_2_4.report:name(v846);
                if not l_v841_0 then
                    l_l_v508_2_4.report:visibility(true);
                    v185.render:set(v844);
                    l_v841_0 = true;
                end;
                return;
            end;
        end;
    end;
    l_v763_0 = function(v847)
        -- upvalues: v511 (ref), l_next_0 (ref), v188 (ref), v33 (ref), l_l_v508_2_4 (ref), v510 (ref), v35 (ref)
        if v847 ~= true then
            v511.list = {};
            for v848 in l_next_0, v188.configs do
                v511.list[#v511.list + 1] = v848;
            end;
            v33.sort(v511.list);
            v33.insert(v511.list, 1, "Default");
            v511.rlist = v33.copy(v511.list);
            local v849 = v33.find(v511.list, v511.loaded);
            v511.loadedidx = v849;
            if v849 then
                v511.list[v849] = v511.badge .. v511.list[v849];
            else
                v511.loaded = 0;
            end;
            l_l_v508_2_4.list:update(v511.list);
            v510.antiaim.ab.on.sel:update(v511.rlist);
        end;
        v511.selected = l_l_v508_2_4.list.value;
        v511.name = v35.gsub(v511.list[v511.selected] or "Default", "^" .. v511.badge, "");
        l_l_v508_2_4.list:set(v511.selected);
    end;
    v841 = function(v850, ...)
        -- upvalues: l_pcall_0 (ref), l_v514_2 (ref), l_v761_1 (ref), l_v763_0 (ref), v188 (ref)
        local v851, v852, v853, _ = l_pcall_0(l_v514_2[v850], ...);
        if v851 then
            l_v761_1(v853 or v852);
        elseif v852 then
            l_v761_1("\f" .. v852);
        end;
        l_v763_0();
        v188();
    end;
    l_v763_0();
    l_l_v508_2_4.list:set_callback(function()
        -- upvalues: l_v763_0 (ref)
        l_v763_0(true);
    end);
    l_l_v508_2_4.load:set_callback(function()
        -- upvalues: v841 (ref), v511 (ref)
        v841("load", v511.name);
    end);
    l_l_v508_2_4.loadaa:set_callback(function()
        -- upvalues: v841 (ref), v511 (ref)
        v841("load", v511.name, "antiaim");
    end);
    l_l_v508_2_4.save:set_callback(function()
        -- upvalues: v841 (ref), v511 (ref)
        v841("save", v511.name);
    end);
    l_l_v508_2_4.export:set_callback(function()
        -- upvalues: v841 (ref), v511 (ref)
        v841("export", v511.name);
    end);
    l_l_v508_2_4.save:depend(true, {
        [1] = nil, 
        [2] = 1, 
        [3] = true, 
        [1] = l_l_v508_2_4.list
    });
    l_l_v508_2_4.export:depend(true, {
        [1] = nil, 
        [2] = 1, 
        [3] = true, 
        [1] = l_l_v508_2_4.list
    });
    l_l_v508_2_4.delete:depend(true, {
        [1] = nil, 
        [2] = 1, 
        [3] = true, 
        [1] = l_l_v508_2_4.list
    });
    local v855 = 0;
    local v856 = false;
    do
        local l_v855_0, l_v856_0 = v855, v856;
        local function v859()
            -- upvalues: l_v855_0 (ref), l_v856_0 (ref), l_l_v508_2_4 (ref), v185 (ref), v859 (ref)
            if l_v855_0 < globals.realtime or l_v856_0 == false then
                l_l_v508_2_4.delete:name(" \f<trash>\r ");
                v185.render_ui:unset(v859);
                l_v856_0 = false;
            end;
        end;
        l_l_v508_2_4.delete:set_callback(function()
            -- upvalues: l_v856_0 (ref), v841 (ref), v511 (ref), l_l_v508_2_4 (ref), l_v855_0 (ref), v185 (ref), v859 (ref)
            if l_v856_0 then
                v841("delete", v511.name);
                l_v856_0 = false;
            else
                l_l_v508_2_4.delete:name(" \ad25151ff\f<trash>\r ");
                local v860 = globals.realtime + 1;
                l_v856_0 = true;
                l_v855_0 = v860;
                v185.render_ui:set(v859);
            end;
        end);
    end;
    v855 = v508.home.configsnew:switch("\nconfignewstate");
    v855:visibility(false);
    do
        local l_v855_1 = v855;
        utils.execute_after(0.2, function()
            -- upvalues: l_v855_1 (ref)
            l_v855_1:set(false);
        end);
        l_l_v508_2_4.import:set_callback(function()
            -- upvalues: v841 (ref)
            v841("import");
        end);
        l_l_v508_2_4.create:set_callback(function()
            -- upvalues: v841 (ref), l_l_v508_2_4 (ref), l_v855_1 (ref)
            v841("create", l_l_v508_2_4.name:get());
            l_l_v508_2_4.name:set("");
            l_v855_1:set(false);
        end);
        l_l_v508_2_4.new:set_callback(function()
            -- upvalues: l_v855_1 (ref)
            l_v855_1:set(true);
        end);
        v509.selectors:set_callback(function(v862)
            -- upvalues: l_v855_1 (ref)
            if v862.value ~= 2 then
                l_v855_1:set(false);
            end;
        end);
        l_l_v508_2_4.cancel:set_callback(function()
            -- upvalues: l_v855_1 (ref), l_l_v508_2_4 (ref)
            l_v855_1:set(false);
            l_l_v508_2_4.name:set("");
        end);
        l_l_v508_2_4.new:depend({
            [1] = nil, 
            [2] = false, 
            [1] = l_v855_1
        });
        l_l_v508_2_4.import:depend({
            [1] = nil, 
            [2] = false, 
            [1] = l_v855_1
        });
        l_l_v508_2_4.load:depend({
            [1] = nil, 
            [2] = false, 
            [1] = l_v855_1
        });
        l_l_v508_2_4.loadaa:depend({
            [1] = nil, 
            [2] = false, 
            [1] = l_v855_1
        });
        l_l_v508_2_4.save:depend({
            [1] = nil, 
            [2] = false, 
            [1] = l_v855_1
        });
        l_l_v508_2_4.export:depend({
            [1] = nil, 
            [2] = false, 
            [1] = l_v855_1
        });
        l_l_v508_2_4.delete:depend({
            [1] = nil, 
            [2] = false, 
            [1] = l_v855_1
        });
        l_l_v508_2_4.name:depend(l_v855_1);
        l_l_v508_2_4.create:depend(l_v855_1);
        l_l_v508_2_4.cancel:depend(l_v855_1);
    end;
end;
v514 = "BUMNWKCJQDYRLESIAFGOPXTVHZgtsjecpxylnbiuahzqforkvmdw8135269047+/=";
do
    local l_v514_3, l_l_v508_2_5, l_v757_2 = v514, l_v508_2, v757;
    l_l_v508_2_5 = {
        export = function(v866)
            -- upvalues: v511 (ref), v35 (ref), v168 (ref), l_v514_3 (ref)
            local v867 = v511.system:save("antiaim", "builder", v866);
            local v868 = v35.gsub(v168.encode(msgpack.pack(v867), l_v514_3), "[%+%/%=]", {
                ["="] = "_", 
                ["+"] = "z113Z", 
                ["/"] = "z143Z"
            });
            return (v35.format("hysteria::NL:builder:%s::%s", v35.upper(v866), v868));
        end, 
        import = function(v869, v870)
            -- upvalues: l_type_0 (ref), v189 (ref), v35 (ref), v168 (ref), l_v514_3 (ref), v511 (ref)
            if l_type_0(v870) ~= "string" or not v870 then
                v870 = v189.get();
            end;
            if not v870 then
                return;
            else
                local v871, v872, v873, v874 = v35.match(v870, "hysteria::(%a+):builder:(%a+)::([%w%+%/]+)(_*)");
                if v871 ~= "NL" or not v872 or not v873 then
                    return;
                else
                    v872 = v35.lower(v872);
                    v874 = v874 and v35.rep("=", #v874) or "";
                    v873 = v35.gsub(v873, "z%d%d%dZ", {
                        z113Z = "+", 
                        z143Z = "/"
                    });
                    v873 = v168.decode(v873 .. v874, l_v514_3);
                    local v875 = {
                        antiaim = {
                            builder = {
                                [v869] = msgpack.unpack(v873).antiaim.builder[v872]
                            }
                        }
                    };
                    if v875.antiaim.builder[v869].on == nil then
                        v875.antiaim.builder[v869].on = true;
                    end;
                    v511.system:load(v875, "antiaim", "builder", v869);
                    return;
                end;
            end;
        end
    };
    l_v757_2 = v33.distribute(v386.states, 1, 2);
    v510.antiaim.state.selector.copy:set_callback(function()
        -- upvalues: l_v757_2 (ref), v510 (ref), v189 (ref), l_l_v508_2_5 (ref)
        local v876 = l_v757_2[v510.antiaim.state.selector.value];
        v189.set(l_l_v508_2_5.export(v876));
    end);
    v510.antiaim.state.selector.paste:set_callback(function()
        -- upvalues: l_v757_2 (ref), v510 (ref), l_l_v508_2_5 (ref)
        local v877 = l_v757_2[v510.antiaim.state.selector.value];
        l_l_v508_2_5.import(v877);
    end);
    v510.antiaim.state.selector.clear:set_callback(function()
        -- upvalues: l_v757_2 (ref), v510 (ref), v511 (ref)
        local v878 = l_v757_2[v510.antiaim.state.selector.value];
        v511.system:load({
            antiaim = {
                builder = {
                    [v878] = {
                        on = v878 ~= "default" and v510.antiaim.builder[v878].on.value or nil
                    }
                }
            }
        }, "antiaim", "builder", v878);
    end);
end;
v514 = 1;
l_v508_2 = {
    [2] = v167.get_icon("bolt"), 
    [3] = v167.get_icon("vial"), 
    [4] = v167.get_icon("brackets-curly")
};
v757 = {};
for v879 in v35.gmatch("hysteria", ".[\128-\191]*") do
    v757[#v757 + 1] = {
        d = false, 
        w = v879, 
        p = {
            [1] = 0
        }
    };
end;
v761 = v33.new(#v757, 0);
v763 = nil;
for v880 = 1, #v757 do
    local v881 = v757[v880];
    v761[#v761 + 1] = v35.format("\a%02x%02x%02x%02x%s", 0, 0, 0, 0, v881.w);
end;
v761[#v761 + 1] = v35.format("\a%02x%02x%02x%02x  \226\128\162  \a%02x%02x%02x%02x%s", 0, 0, 0, 0, 0, 0, 0, 0, l_v508_2[v0]);
v763 = v33.concat(v761);
v167.sidebar(v763, "\nempty");
do
    local l_v514_4, l_l_v508_2_6, l_v757_3, l_v761_2, l_v763_1 = v514, l_v508_2, v757, v761, v763;
    local v923 = {
        [1] = {
            p = {
                [1] = 0
            }, 
            work = function(v887)
                -- upvalues: v250 (ref), v35 (ref), v167 (ref), l_v763_1 (ref), l_v514_4 (ref)
                local v888, v889, v890, v891 = ui.get_style("Sidebar Text"):unpack();
                local v892 = v250.condition(v887.p, true, 4);
                local v893 = v35.format("\a%02x%02x%02x%02x\f<star-christmas>", v888, v889, v890, v891 * v892);
                v167.sidebar(l_v763_1, v893);
                if v892 == 1 then
                    l_v514_4 = 2;
                end;
            end
        }, 
        [2] = {
            work = function(_)
                -- upvalues: l_v757_3 (ref), v250 (ref), l_v761_2 (ref), v35 (ref), l_v763_1 (ref), v33 (ref), v167 (ref), l_v514_4 (ref)
                local v895 = ui.get_style("Sidebar Text");
                local v896, v897, v898, v899 = v895:unpack();
                for v900 = 1, #l_v757_3 do
                    local v901 = l_v757_3[v900];
                    v901.n = v901.n or globals.realtime + (v900 - 1) * 0.1;
                    v901.d = v901.d or globals.realtime >= v901.n;
                    local v902 = v250.condition(v901.p, v901.d, 2);
                    l_v761_2[v900] = v35.format("\a%02x%02x%02x%02x%s", v896, v897, v898, v899 * v902, v901.w);
                end;
                l_v763_1 = v33.concat(l_v761_2);
                v167.sidebar(l_v763_1, v35.format("\a%s\f<star-christmas>", v895:to_hex()));
                if l_v757_3[#l_v757_3].p[1] == 1 then
                    l_v514_4 = 3;
                end;
            end
        }, 
        [3] = {
            p = {
                [1] = 0
            }, 
            work = function(v903)
                -- upvalues: v250 (ref), v35 (ref), v167 (ref), l_v763_1 (ref), l_v514_4 (ref)
                local v904 = v250.condition(v903.p, true, 3);
                local v905, v906, v907, v908 = ui.get_style("Sidebar Text"):lerp(ui.get_style("Link Active"), v904):unpack();
                local v909 = v35.format("\a%02x%02x%02x%02x\f<star-christmas>", v905, v906, v907, v908);
                v167.sidebar(l_v763_1, v909);
                if v904 == 1 then
                    l_v514_4 = 4;
                end;
            end
        }, 
        [4] = {
            p = {
                [1] = 0
            }, 
            work = function(v910)
                -- upvalues: v0 (ref), v250 (ref), l_v761_2 (ref), v35 (ref), v167 (ref), l_l_v508_2_6 (ref), l_v763_1 (ref), v33 (ref), l_v514_4 (ref)
                if v0 > 1 then
                    local v911 = v250.condition(v910.p, true, 3);
                    local v912, v913, v914, v915 = ui.get_style("Link Active"):unpack();
                    local v916, v917, v918 = ui.get_style("Sidebar Text"):unpack();
                    l_v761_2[#l_v761_2] = v35.format("\a%02x%02x%02x%02x  \226\128\162  \a%02x%02x%02x%02x%s", v916, v917, v918, v911 * 32 * v167.alpha, v912, v913, v914, v915 * v911, l_l_v508_2_6[v0]);
                    l_v763_1 = v33.concat(l_v761_2);
                    v167.sidebar(l_v763_1, "star-christmas");
                    if v911 == 1 then
                        l_v514_4 = 5;
                    end;
                else
                    l_v514_4 = 5;
                end;
            end
        }, 
        [5] = {
            work = function(_)
                -- upvalues: l_v763_1 (ref), v0 (ref), v35 (ref), v167 (ref), l_l_v508_2_6 (ref)
                l_v763_1 = "hysteria";
                if v0 > 1 then
                    local v920, v921, v922 = ui.get_style("Sidebar Text"):unpack();
                    l_v763_1 = v35.format("hysteria\a%02x%02x%02x%02x  \226\128\162  \v%s", v920, v921, v922, 32 * v167.alpha, l_l_v508_2_6[v0]);
                end;
                v167.sidebar(l_v763_1, "\f<star-christmas>");
            end
        }
    };
    local function v924()
        -- upvalues: l_v514_4 (ref), v923 (ref), v185 (ref), v924 (ref)
        if l_v514_4 then
            v923[l_v514_4]:work();
        else
            v185.render_ui:unset(v924);
        end;
    end;
    utils.execute_after(0.25, function()
        -- upvalues: v185 (ref), v924 (ref)
        v185.render_ui:set(v924);
    end);
end;
v514 = v510.settings.accent;
l_v508_2 = v514:get("Rainbow")[1];
local v925;
v757, v761, v763, v925 = l_v508_2:to_hsv();
do
    local l_v514_5, l_l_v508_2_7, l_v757_4, l_v761_3, l_v763_2, l_v925_0 = v514, l_v508_2, v757, v761, v763, v925;
    v185.pre_hud_render:set(function()
        -- upvalues: l_v514_5 (ref), l_l_v508_2_7 (ref), l_color_0 (ref), l_v925_0 (ref), l_v761_3 (ref), l_v763_2 (ref)
        if l_v514_5.value[1] == "Rainbow" then
            l_l_v508_2_7 = l_color_0():as_hsv(globals.realtime * l_v925_0 % 1, l_v761_3, l_v763_2, l_v925_0);
            l_v514_5:set("Rainbow", {
                [1] = l_l_v508_2_7
            });
        end;
    end);
    l_v514_5:set_callback(function(v932)
        -- upvalues: v185 (ref), l_v514_5 (ref), v184 (ref), l_l_v508_2_7 (ref), l_v757_4 (ref), l_v761_3 (ref), l_v763_2 (ref), l_v925_0 (ref), v35 (ref), v509 (ref), v167 (ref)
        local v933 = v932.value[1];
        v185.accent_settings_change:call(v932);
        if v933 == "Solid" then
            l_v514_5:set("Solid", {
                v932.value[2]:alpha_modulate(255)
            });
            local l_v184_0 = v184;
            local l_v184_1 = v184;
            local v936 = v932.value[2];
            l_v184_1.secondary = v932.value[2];
            l_v184_0.accent = v936;
        elseif v933 == "Gradient" then
            local l_v184_2 = v184;
            local l_v184_3 = v184;
            local v939 = v932.value[2][1];
            l_v184_3.secondary = v932.value[2][2];
            l_v184_2.accent = v939;
        elseif v933 == "Rainbow" then
            if l_v514_5.value[2] ~= l_l_v508_2_7 then
                local v940, v941, v942, v943 = l_v514_5.value[2]:to_hsv();
                l_v925_0 = v943;
                l_v763_2 = v942;
                l_v761_3 = v941;
                l_v757_4 = v940;
            end;
            local l_v184_4 = v184;
            local l_v184_5 = v184;
            local v946 = v932.value[2];
            l_v184_5.secondary = v932.value[2];
            l_v184_4.accent = v946;
        end;
        local l_accent_1 = v184.accent;
        local l_secondary_0 = v184.secondary;
        local v949 = 255;
        l_secondary_0.a = 255;
        l_accent_1.a = v949;
        l_accent_1 = v184;
        l_secondary_0 = v184;
        v949 = "\a" .. v184.accent:to_hex();
        l_secondary_0.hex2 = "\a" .. v184.secondary:to_hex();
        l_accent_1.hex = v949;
        l_accent_1 = v184;
        l_secondary_0 = v184;
        v949 = v35.sub(v184.hex, 0, -3);
        l_secondary_0.hex2s = v35.sub(v184.hex2, 0, -3);
        l_accent_1.hexs = v949;
        if v509.butterfly and v167.alpha > 0 then
            v509.butterfly:set(nil, v184.accent);
        end;
    end, true);
    if v509.butterfly then
        v509.butterfly:set(nil, v184.accent);
    end;
end;
v510.settings.style.blur:set_callback(function(v950)
    -- upvalues: v249 (ref)
    v249.cheap = not v950.value;
end, true);
v510.settings.style.mode:set_callback(function(v951)
    -- upvalues: v249 (ref), v185 (ref)
    v249.style = v951.value;
    v185.style_changed:call(v951.value);
end, true);
v185.pre_render_native:set(function()
    -- upvalues: v249 (ref), v510 (ref)
    v249.dpi_t.callback(v510.settings.style.dpi.value);
end);
v183.global.menu_scale:set_callback(function()
    -- upvalues: v509 (ref), l_vector_0 (ref), v249 (ref)
    utils.execute_after(0.5, function()
        -- upvalues: v509 (ref), l_vector_0 (ref), v249 (ref)
        if v509.butterfly then
            v509.butterfly:set(l_vector_0(270, 270) * v249.get_scale(1));
        end;
    end);
end, true);
if v0 < 2 then
    v507.lock(v510.settings.aipeek);
    v507.lock(v510.settings.dormant);
    v507.lock(v510.settings.cross, 0);
    v507.lock(v510.antiaim.general.head.smart);
    v507.lock(v510.antiaim.general.nature);
    v507.lock(v510.antiaim.snaps.edge.on, "Off");
end;
v514 = nil;
l_v508_2 = nil;
v757 = {
    statew = 0, 
    stateb = 1, 
    switch = false, 
    state = 1, 
    send_packet = false, 
    counter = 0, 
    sent = 0, 
    states_record = {}
};
v761 = {
    mod = 0, 
    des = 0, 
    yaw = 0, 
    pitch = 89
};
v763 = {};
v925 = nil;
local v952 = {
    pitch = v183.antiaim.angles.pitch, 
    yaw_type = v183.antiaim.angles.yaw, 
    yaw_base = v183.antiaim.angles.yaw.base, 
    yaw = v183.antiaim.angles.yaw.offset, 
    avoid_bs = v183.antiaim.angles.yaw.avoid_bs, 
    hidden = v183.antiaim.angles.yaw.hidden, 
    modifier = v183.antiaim.angles.modifier, 
    mod_deg = v183.antiaim.angles.modifier.offset, 
    body_yaw = v183.antiaim.angles.body, 
    inverter = v183.antiaim.angles.body.invert, 
    left = v183.antiaim.angles.body.left, 
    right = v183.antiaim.angles.body.right, 
    options = v183.antiaim.angles.body.options, 
    desync_fs = v183.antiaim.angles.body.freestand, 
    freestand = v183.antiaim.angles.freestand, 
    extended = v183.antiaim.angles.extended, 
    fl_enable = v183.antiaim.fl.enable, 
    fl_limit = v183.antiaim.fl.limit, 
    fl_var = v183.antiaim.fl.var
};
local v953 = {};
for v954, v955 in l_next_0, v952 do
    v953[#v953 + 1] = {
        [1] = v954, 
        [2] = v955
    };
end;
v925 = l_setmetatable_0({
    list = v952, 
    keys = v953, 
    n = #v953
}, {
    __index = v952
});
v952 = nil;
v953 = 0;
do
    local l_l_v508_2_8, l_v757_5, l_v761_4, l_v763_3, l_v925_1, l_v953_0 = l_v508_2, v757, v761, v763, v925, v953;
    do
        local l_l_v953_0_0 = l_v953_0;
        v952 = {
            force_lc = function(v963)
                -- upvalues: v34 (ref), l_l_v953_0_0 (ref), l_l_v508_2_8 (ref)
                if v34.abs(l_l_v953_0_0 - globals.tickcount) >= (v963 or 12) then
                    local l_l_l_v508_2_8_0 = l_l_v508_2_8;
                    local v965 = true;
                    l_l_v953_0_0 = globals.tickcount;
                    l_l_l_v508_2_8_0.force_defensive = v965;
                end;
            end
        };
    end;
    l_v953_0 = nil;
    l_v953_0 = {};
    l_v953_0.override = function(v966, v967)
        -- upvalues: l_v953_0 (ref), l_v757_5 (ref), v405 (ref)
        local v968 = l_v953_0[0][v966];
        if v968 and (v967 or v968.override) then
            local l_l_v953_0_1 = l_v953_0;
            local l_l_v757_5_0 = l_v757_5;
            local l_v968_0 = v968;
            l_l_v757_5_0.stateb = v405.states[v966];
            l_l_v953_0_1.cur = l_v968_0;
            return true;
        else
            return false;
        end;
    end;
    local v972 = nil;
    local v989 = {
        [false] = function()
            -- upvalues: v502 (ref), v405 (ref)
            if not v502.jumping then
                if v502.duck_amount > 0 then
                    return v502.velocity > 5 and v405.states.sneak or v405.states.crouch;
                elseif v502.velocity > 5 then
                    return v502.walking and v405.states.walk or v405.states.run;
                else
                    return v405.states.stand;
                end;
            else
                return v502.duck_amount > 0 and v405.states.airc or v405.states.air;
            end;
        end, 
        [true] = function()
            -- upvalues: v502 (ref), v405 (ref), v34 (ref)
            local l_landing_0 = v502.animstate.landing;
            local l_anim_duck_amount_0 = v502.animstate.anim_duck_amount;
            local v975 = 1 - v502.animstate.in_air_smooth_value;
            local l_move_weight_0 = v502.animstate.move_weight;
            local l_walk_run_transition_0 = v502.animstate.walk_run_transition;
            local l_walk_to_run_transition_state_0 = v502.animstate.walk_to_run_transition_state;
            local l_speed_as_portion_of_walk_top_speed_0 = v502.animstate.speed_as_portion_of_walk_top_speed;
            local l_stand_0 = v405.states.stand;
            local l_crouch_0 = v405.states.crouch;
            local l_l_anim_duck_amount_0_0 = l_anim_duck_amount_0;
            if l_move_weight_0 > 0.01 then
                l_l_anim_duck_amount_0_0 = l_move_weight_0;
                l_crouch_0 = v502.walking and v405.states.walk or v405.states.run;
                if (l_walk_run_transition_0 > 0 or l_move_weight_0 < l_speed_as_portion_of_walk_top_speed_0) and v502.walking then
                    local v983 = (l_move_weight_0 - 0.621) * 2.635;
                    local l_run_0 = v405.states.run;
                    l_l_anim_duck_amount_0_0 = 1 - v983;
                    l_stand_0 = l_run_0;
                elseif v502.walking and not l_walk_to_run_transition_state_0 then
                    l_stand_0 = v405.states.walk;
                end;
                if l_anim_duck_amount_0 > 0 then
                    local l_sneak_0 = v405.states.sneak;
                    l_l_anim_duck_amount_0_0 = (1 - l_anim_duck_amount_0) * l_move_weight_0;
                    l_stand_0 = l_sneak_0;
                end;
            end;
            if v975 > 0 then
                if v975 < 1 then
                    local v986 = l_anim_duck_amount_0 > 0 and v405.states.airc or v405.states.air;
                    l_l_anim_duck_amount_0_0 = v975;
                    l_crouch_0 = v986;
                else
                    local l_air_0 = v405.states.air;
                    local l_airc_0 = v405.states.airc;
                    l_l_anim_duck_amount_0_0 = l_anim_duck_amount_0;
                    l_crouch_0 = l_airc_0;
                    l_stand_0 = l_air_0;
                end;
            end;
            if l_landing_0 then
                l_l_anim_duck_amount_0_0 = l_l_anim_duck_amount_0_0 * (1 - l_anim_duck_amount_0);
            end;
            return l_stand_0, l_crouch_0, (v34.tolerate(v34.clamp(l_l_anim_duck_amount_0_0, 0, 1), 0.05));
        end
    };
    local v994 = {
        select = function(v990, v991)
            -- upvalues: v502 (ref), v405 (ref), v386 (ref)
            if v990.fakelag.override and v502.exploit.active == v405.exploit.OFF then
                v991 = v405.states.fakelag;
            elseif not v990.airc.override and v991 == v405.states.airc then
                v991 = v405.states.air;
            elseif not v990.sneak.override and v991 == v405.states.sneak then
                v991 = v405.states.crouch;
            end;
            if not v990[v386.states[v991][1]].override or not v991 then
                v991 = v405.states.default;
            end;
            return v990[v386.states[v991][1]];
        end, 
        work = function(v992)
            -- upvalues: v501 (ref), l_v953_0 (ref), l_v757_5 (ref)
            local l_custom_0 = v501.builder.custom;
            l_v953_0 = {
                [0] = l_custom_0, 
                cur = v992.select(l_custom_0, l_v757_5.state), 
                next = l_v757_5.stateb and v992.select(l_custom_0, l_v757_5.stateb)
            };
        end
    };
    local function v999()
        -- upvalues: l_v953_0 (ref), v510 (ref), v502 (ref), v405 (ref), v501 (ref), l_v757_5 (ref), v386 (ref)
        l_v953_0.snap = nil;
        if not v510.antiaim.def.snap.value then
            return;
        elseif v502.exploit.active == v405.exploit.OS and not v510.antiaim.def.snap.os.value then
            return;
        else
            local v995 = nil;
            local v996 = 0;
            local l_default_0 = v405.snaps.default;
            if v996 == 0 then
                v995 = v501.snap.custom;
            else
                v995 = v501.snap[v996];
            end;
            if v995.airc.on ~= "Default" and v502.jumping and v502.crouching then
                l_default_0 = v405.snaps.airc;
            elseif v995.air.on ~= "Default" and v502.jumping then
                l_default_0 = v405.snaps.air;
            elseif v995.edge.on ~= "Default" and l_v757_5.freestand_raw and not v502.jumping then
                l_default_0 = v405.snaps.edge;
            elseif v995.sneak.on ~= "Default" and v502.on_ground and v502.crouching and v502.velocity > 5 then
                l_default_0 = v405.snaps.sneak;
            elseif v995.crouch.on ~= "Default" and v502.on_ground and v502.crouching then
                l_default_0 = v405.snaps.crouch;
            elseif v995.walk.on ~= "Default" and v502.on_ground and v502.walking then
                l_default_0 = v405.snaps.walk;
            end;
            local v998 = v995[v386.snaps[l_default_0][1]];
            if v998.on == "Off" then
                return;
            else
                if v998.on ~= "Custom" or not l_default_0 then
                    l_default_0 = v405.snaps.default;
                end;
                v998 = v995[v386.snaps[l_default_0][1]];
                if v998 and v998.on ~= "Off" then
                    l_v953_0.snap = v998;
                end;
                return;
            end;
        end;
    end;
    local function v1001()
        -- upvalues: l_v757_5 (ref), v249 (ref), v502 (ref), v34 (ref)
        l_v757_5.camera_ang = v249.camera_angles();
        local v1000 = v502.threat and v502.threat:get_origin();
        l_v757_5.threat_ang = v1000 and v34.angle_to(v502.origin, v1000) or nil;
        l_v757_5.threat_ang_raw = rage.antiaim:get_target();
        l_v757_5.freestand_raw = rage.antiaim:get_target(true);
        l_v757_5.threat_dist = v1000 and v34.dist(v502.origin, v1000);
    end;
    local v1002 = nil;
    local v1003 = {
        [v405.states.crouch] = 0, 
        [v405.states.sneak] = 1, 
        [v405.states.stand] = 2, 
        [v405.states.walk] = 3, 
        [v405.states.run] = 4, 
        [v405.states.airc] = 5, 
        [v405.states.air] = 6
    };
    do
        local l_v1003_0 = v1003;
        v1002 = function(v1005, v1006, v1007)
            -- upvalues: v510 (ref), l_v1003_0 (ref), v34 (ref), v33 (ref), v514 (ref)
            if not v510.settings.process.graph.value then
                return;
            else
                local v1008 = v1006 or v1005;
                if not v1007 then
                    v1007 = 0;
                end;
                v1006 = v1008;
                v1008 = l_v1003_0;
                local v1009 = v1008[v1005] or v1005;
                local v1010 = v1008[v1006];
                if v1010 then
                    v1006 = v1010;
                end;
                v1009 = v34.clamp(v34.lerp(v1009, v1006, v1007) / 7, 0, 1);
                if v1009 then
                    v33.slide(v514.data.states_record, v1009, 10);
                end;
                return;
            end;
        end;
    end;
    do
        local l_v989_0, l_v994_0, l_v999_0, l_v1001_0, l_v1002_0 = v989, v994, v999, v1001, v1002;
        v972 = function()
            -- upvalues: l_v757_5 (ref), l_l_v508_2_8 (ref), l_v989_0 (ref), v510 (ref), l_v1001_0 (ref), l_v994_0 (ref), l_v999_0 (ref), l_v1002_0 (ref)
            l_v757_5.send_packet = l_l_v508_2_8.choked_commands == 0;
            local l_l_v757_5_1 = l_v757_5;
            local l_l_v757_5_2 = l_v757_5;
            local l_l_v757_5_3 = l_v757_5;
            local v1019, v1020, v1021 = l_v989_0[v510.antiaim.general.nature.value]();
            l_l_v757_5_3.statew = v1021;
            l_l_v757_5_2.stateb = v1020;
            l_l_v757_5_1.state = v1019;
            l_v757_5.inverted = v510.antiaim.buttons.invert.value;
            l_v1001_0();
            l_v994_0:work();
            l_v999_0();
            l_v1002_0(l_v757_5.state, l_v757_5.stateb, l_v757_5.statew);
        end;
        v1003 = 0;
        local v1022 = 0;
        do
            local l_v1003_1, l_v1022_0 = v1003, v1022;
            v185.player_hurt:set(function(v1025)
                -- upvalues: v502 (ref), l_v1022_0 (ref)
                if v1025.userid == v502.userid then
                    l_v1022_0 = globals.tickcount;
                end;
            end);
            v185.bullet_impact:set(function(v1026)
                -- upvalues: v502 (ref), l_v1003_1 (ref), l_vector_0 (ref), v34 (ref), l_unpack_0 (ref), l_v757_5 (ref), v185 (ref), l_v1022_0 (ref)
                if not v502.valid or l_v1003_1 == globals.tickcount then
                    return;
                else
                    local v1027 = entity.get(v1026.userid, true);
                    if not v1027 or not v1027:is_enemy() or v1027:is_dormant() then
                        return;
                    else
                        local v1028 = l_vector_0(v1026.x, v1026.y, v1026.z);
                        local v1029 = v1027:get_eye_position();
                        local v1030 = {};
                        local v1031 = entity.get_players(false, false);
                        for v1032 = 1, #v1031 do
                            local v1033 = v1031[v1032];
                            if not v1033:is_enemy() then
                                local v1034 = v1033:get_origin() + l_vector_0(0, 0, 36);
                                local v1035 = v1034:closest_ray_point(v1029, v1028);
                                v1030[v1033 == v502.self and 0 or #v1030 + 1] = v1034:dist(v1035);
                            end;
                        end;
                        if v1030[0] and (#v1030 == 0 or v1030[0] < v34.min(l_unpack_0(v1030))) and v1030[0] < 80 then
                            local v1036 = l_v757_5.statew and l_v757_5.statew > 0.5 and l_v757_5.stateb or l_v757_5.state;
                            do
                                local l_v1036_0 = v1036;
                                utils.execute_after(to_time(1), function()
                                    -- upvalues: v185 (ref), l_v1003_1 (ref), l_v1022_0 (ref), v1030 (ref), v1027 (ref), v1026 (ref), l_v1036_0 (ref)
                                    v185.enemy_shot:call({
                                        damaged = l_v1003_1 == l_v1022_0, 
                                        dist = v1030[0], 
                                        attacker = v1027, 
                                        userid = v1026.userid, 
                                        last_state = l_v1036_0
                                    });
                                end);
                                l_v1003_1 = globals.tickcount;
                            end;
                        end;
                        return;
                    end;
                end;
            end);
        end;
    end;
    v989 = nil;
    v994 = {
        buttons = {
            manual = {
                Forward = 180, 
                Right = 90, 
                Left = -90
            }, 
            edge = function()
                -- upvalues: v502 (ref), l_vector_0 (ref), l_v757_5 (ref), v34 (ref)
                local v1038 = 1;
                local v1039 = nil;
                local v1040 = {};
                for v1041 = -180, 179, 45 do
                    local v1042 = v502.eyes + l_vector_0():angles(l_vector_0(0, v1041, 0)) * 24;
                    local v1043 = utils.trace_line(v502.eyes, v1042, v502.self);
                    if v1043.fraction < v1038 and (v1043.entity == nil or not v1043.entity:is_player()) then
                        local l_fraction_0 = v1043.fraction;
                        v1039 = v1041;
                        v1038 = l_fraction_0;
                    end;
                end;
                if v1039 == nil then
                    return;
                else
                    for v1045 = v1039 - 30, v1039 + 30, 10 do
                        local v1046 = v502.eyes + l_vector_0():angles(l_vector_0(0, v1045, 0)) * 24;
                        local v1047 = utils.trace_line(v502.eyes, v1046, v502.self);
                        if v1047.fraction < 1 then
                            v1040[#v1040 + 1] = v1045;
                            if v1047.fraction < v1038 then
                                local l_fraction_1 = v1047.fraction;
                                v1039 = v1045;
                                v1038 = l_fraction_1;
                            end;
                        end;
                    end;
                    local v1049 = v1039 * 2 - l_v757_5.camera_ang.y;
                    return v34.normalize_yaw(v1049);
                end;
            end
        }, 
        work = function(v1050)
            -- upvalues: l_v761_4 (ref), l_v757_5 (ref), v510 (ref), v502 (ref), l_v763_3 (ref)
            l_v761_4.yaw = 0;
            local l_l_v757_5_4 = l_v757_5;
            local l_l_v757_5_5 = l_v757_5;
            local l_l_v757_5_6 = l_v757_5;
            local v1054 = nil;
            local v1055 = nil;
            l_l_v757_5_6.edge = nil;
            l_l_v757_5_5.freestand = v1055;
            l_l_v757_5_4.manual_yaw = v1054;
            l_l_v757_5_4 = v510.antiaim.buttons;
            l_l_v757_5_5 = v1050.buttons.manual[l_l_v757_5_4.manual.value];
            l_l_v757_5_6 = l_l_v757_5_4.fs.value and not v502.jumping;
            v1054 = l_l_v757_5_4.edge.value;
            l_v761_4.fs = false;
            l_v763_3.selected_yaw = l_v757_5.threat_ang_raw or l_v757_5.camera_ang.y;
            if l_l_v757_5_5 then
                v1055 = l_v761_4;
                local l_l_v757_5_7 = l_v757_5;
                local l_l_l_v757_5_5_0 = l_l_v757_5_5;
                l_l_v757_5_7.manual_yaw = l_l_v757_5_5;
                v1055.yaw = l_l_l_v757_5_5_0;
                l_v763_3.force_camera = true;
                if l_l_v757_5_4.manual.s.value then
                    v1055 = l_v763_3;
                    l_l_v757_5_7 = l_v763_3;
                    l_l_l_v757_5_5_0 = l_v763_3;
                    local v1058 = true;
                    local v1059 = true;
                    l_l_l_v757_5_5_0.force_desync = l_v757_5.inverted and 60 or -60;
                    l_l_v757_5_7.no_offset = v1059;
                    v1055.no_modifier = v1058;
                end;
                l_v763_3.selected_yaw = l_v761_4.yaw + l_v757_5.camera_ang.y;
            elseif l_l_v757_5_6 then
                v1055 = l_v761_4;
                local l_l_v757_5_8 = l_v757_5;
                local v1061 = true;
                l_l_v757_5_8.freestand = l_v757_5.freestand_raw;
                v1055.fs = v1061;
                if l_v757_5.freestand then
                    if l_l_v757_5_4.fs.s.value then
                        v1055 = l_v763_3;
                        l_l_v757_5_8 = l_v763_3;
                        v1061 = l_v763_3;
                        local v1062 = true;
                        local v1063 = true;
                        v1061.force_desync = l_v757_5.inverted and 60 or -60;
                        l_l_v757_5_8.no_offset = v1063;
                        v1055.no_modifier = v1062;
                    end;
                    l_v763_3.selected_yaw = l_v757_5.freestand;
                end;
            elseif v1054 then
                v1055 = v1050.buttons.edge();
                if v1055 then
                    l_v763_3.force_static = true;
                    local l_l_v761_4_0 = l_v761_4;
                    local l_l_v757_5_9 = l_v757_5;
                    local l_v1055_0 = v1055;
                    l_l_v757_5_9.edge = v1055;
                    l_l_v761_4_0.yaw = l_v1055_0;
                    l_v763_3.selected_yaw = v1055;
                    if l_l_v757_5_4.edge.s.value then
                        l_l_v761_4_0 = l_v763_3;
                        l_l_v757_5_9 = l_v763_3;
                        l_v1055_0 = l_v763_3;
                        local v1067 = true;
                        local v1068 = true;
                        l_v1055_0.force_desync = l_v757_5.inverted and 60 or -60;
                        l_l_v757_5_9.no_offset = v1068;
                        l_l_v761_4_0.no_modifier = v1067;
                    end;
                end;
            end;
        end
    };
    v999 = {
        gsequence = {
            [1] = -1, 
            [2] = 1, 
            [3] = 0, 
            [4] = -1, 
            [5] = 1, 
            [6] = 0, 
            [7] = -1, 
            [8] = 0, 
            [9] = 1, 
            [10] = -1, 
            [11] = 0, 
            [12] = 1
        }, 
        type = {
            Jitter = function(v1069)
                -- upvalues: l_v757_5 (ref)
                return ((v1069.mid and l_v757_5.sent or l_v757_5.counter) % 2 == 0 and v1069.deg or -v1069.deg) + l_v757_5.abweight * 10;
            end, 
            Ways = function(v1070)
                -- upvalues: l_v757_5 (ref), v34 (ref)
                local v1071 = (v1070.mid and l_v757_5.sent or l_v757_5.counter) % v1070.ways / (v1070.ways - 1);
                return v34.lerp(-v1070.deg, v1070.deg, v1071);
            end, 
            ["Shuffle ways"] = function(v1072)
                -- upvalues: v34 (ref)
                local v1073 = v34.random(0, v1072.ways) / v1072.ways;
                return v34.lerp(-v1072.deg, v1072.deg, v1073);
            end, 
            Skitter = function(v1074, v1075)
                -- upvalues: v34 (ref), l_v757_5 (ref), l_v953_0 (ref), l_v763_3 (ref)
                local l_gsequence_0 = v1075.gsequence;
                local v1077 = l_gsequence_0[v34.cycle(v1074.mid and l_v757_5.sent or l_v757_5.counter, #l_gsequence_0)];
                local v1078 = v1077 * v1074.deg * 2;
                local l_des_0 = l_v953_0.cur.des;
                if l_des_0.mode == "Jitter" and l_v763_3.force_desync == nil then
                    l_v763_3.force_desync = v1077 > 0 and l_des_0.l or v1077 < 0 and -l_des_0.r or v1077 == 0 and 0;
                end;
                return v1078;
            end, 
            Rotate = function(v1080)
                -- upvalues: v34 (ref)
                return v34.lerp(-v1080.deg, v1080.deg, globals.curtime * 4 % 1);
            end, 
            Random = function(v1081)
                return utils.random_int(-v1081.deg, v1081.deg);
            end
        }, 
        work = function(v1082)
            -- upvalues: l_v761_4 (ref), l_v953_0 (ref), l_v757_5 (ref)
            l_v761_4.mod = 0;
            local l_mod_0 = l_v953_0.cur.mod;
            if l_mod_0 then
                local v1084 = v1082.type[l_mod_0.type];
                l_v761_4.mod = l_v761_4.mod + (v1084 and v1084(l_mod_0, v1082) or 0);
                local v1085 = l_v953_0.cur.random * 0.5;
                l_v761_4.mod = l_v761_4.mod + (v1085 > 0 and utils.random_int(-v1085, v1085) or 0);
                l_v761_4.mod = l_v761_4.mod + l_v757_5.abweight * -10;
            end;
        end
    };
    v1001 = {
        type = {
            Static = function(v1086)
                -- upvalues: v166 (ref), l_v757_5 (ref), l_v953_0 (ref)
                return v166(l_v757_5.inverted, l_v953_0.cur.des.inv) and v1086.r or -v1086.l;
            end, 
            Jitter = function(v1087)
                -- upvalues: l_v757_5 (ref)
                return l_v757_5.switch and v1087.r or -v1087.l;
            end, 
            Random = function(v1088)
                -- upvalues: v34 (ref)
                return v34.random() > 0.5 and v1088.r or -v1088.l;
            end
        }, 
        work = function(v1089)
            -- upvalues: l_v761_4 (ref), l_v953_0 (ref)
            local l_l_v761_4_1 = l_v761_4;
            local l_l_v761_4_2 = l_v761_4;
            local l_l_v761_4_3 = l_v761_4;
            local v1093 = nil;
            local v1094 = "Off";
            l_l_v761_4_3.deso = {};
            l_l_v761_4_2.desfs = v1094;
            l_l_v761_4_1.des = v1093;
            l_l_v761_4_1 = l_v953_0.cur.des;
            if v1089.type[l_l_v761_4_1.mode] then
                l_v761_4.des = v1089.type[l_l_v761_4_1.mode](l_l_v761_4_1);
                l_v761_4.desfs = l_l_v761_4_1.fs;
                l_v761_4.deso = l_l_v761_4_1.ao and {
                    [1] = "Avoid Overlap"
                } or l_v761_4.deso;
            end;
        end
    };
    v1002 = {
        data = {
            counter = 0, 
            ticks = 0, 
            once = {}
        }, 
        pitch = {
            Static = function(_, v1096)
                return v1096.ang;
            end, 
            Jitter = function(_, v1098)
                -- upvalues: l_v757_5 (ref)
                return l_v757_5.switch and v1098.ang or v1098.ang2;
            end, 
            Random = function(_, v1100)
                return utils.random_int(v1100.ang, v1100.ang2);
            end, 
            ["Random Static"] = function(v1101, v1102)
                if not v1101.once.srx then
                    v1101.once.srx = utils.random_int(v1102.ang, v1102.ang2);
                end;
                return v1101.once.srx;
            end, 
            Spin = function(_, v1104)
                -- upvalues: v34 (ref)
                return v34.lerp(v1104.ang, v1104.ang2, globals.curtime * v1104.speed * 0.1 % 1);
            end, 
            ["Spin Full"] = function(v1105, v1106)
                -- upvalues: v34 (ref), l_v953_0 (ref), v502 (ref)
                local v1107 = v34.min(v1105.once.apex, l_v953_0.snap.time);
                local v1108 = v1105.once.apex - (v1107 - 1);
                local v1109 = (v502.exploit.lc_left - v1108) / (v1107 - 1);
                return v34.lerp(v1106.ang, v1106.ang2, v1109);
            end, 
            Camera = function(_, _)
                -- upvalues: l_v757_5 (ref)
                return l_v757_5.camera_ang and l_v757_5.camera_ang.x or 0;
            end, 
            ["At target"] = function(_, _)
                -- upvalues: l_v757_5 (ref)
                return l_v757_5.threat_ang and l_v757_5.threat_ang.x or l_v757_5.camera_ang.x;
            end
        }, 
        yaw = {
            Static = function(_, v1115)
                return 360 - v1115.ang;
            end, 
            Jitter = function(v1116, v1117)
                return 180 + v1117.ang * (v1116.once.switch and 0.5 or -0.5);
            end, 
            Random = function(_, v1119)
                return 180 + utils.random_int(v1119.ang * -0.5, v1119.ang * 0.5);
            end, 
            ["Random Jitter"] = function(_, v1121)
                -- upvalues: v34 (ref)
                local v1122 = v34.random(0, 1) == 0 and 1 or -1;
                local v1123 = v34.random(v1121.ang * -0.25, v1121.ang * 0.25);
                return v1122 * 90 + v1123;
            end, 
            ["Random Static"] = function(v1124, v1125)
                -- upvalues: v34 (ref)
                if not v1124.once.sry then
                    v1124.once.sry = v34.random(v1125.ang * -0.5, v1125.ang * 0.5);
                end;
                return 180 + v1124.once.sry;
            end, 
            Spin = function(_, v1127)
                -- upvalues: v34 (ref)
                return 180 + v34.lerp(v1127.ang * -0.5, v1127.ang * 0.5, globals.curtime * (v1127.speed * 0.1) % 1), true;
            end, 
            ["Spin Full"] = function(v1128, v1129)
                -- upvalues: v34 (ref), l_v953_0 (ref), v502 (ref)
                local v1130 = v34.min(v1128.once.apex, l_v953_0.snap.time);
                local v1131 = v1128.once.apex - (v1130 - 1);
                local v1132 = (v502.exploit.lc_left - v1131) / (v1130 - 1);
                return 180 + v34.lerp(v1129.ang * -0.5, v1129.ang * 0.5, v1132);
            end, 
            ["Spin Jitter"] = function(v1133, v1134)
                -- upvalues: v34 (ref)
                local v1135 = v1133.once.switch and 1 or -1;
                local v1136 = v34.lerp(v1134.ang * -0.5, v1134.ang * 0.5, globals.curtime * (v1134.speed * 0.1) % 1);
                return v1135 * 90 + v1136;
            end, 
            ["90w"] = function(v1137, v1138)
                -- upvalues: v34 (ref), v502 (ref), l_v953_0 (ref)
                local v1139 = v1137.counter % 2 == 0 and 1 or -1;
                local v1140 = v34.lerp(v1138.ang * -0.5, v1138.ang * 0.5, v502.exploit.lc_left / l_v953_0.snap.time * v1138.speed * 0.05 % 1);
                return v1139 * 90 + v1140 - 90, true;
            end, 
            ["180v"] = function(_, v1142)
                -- upvalues: v34 (ref)
                local v1143 = v34.sin(globals.curtime * (v1142.speed * 0.2)) * 0.5 + 0.5;
                return 180 + v34.lerp(v1142.ang * -0.5, v1142.ang * 0.5, v1143), true;
            end, 
            Camera = function(_, v1145)
                -- upvalues: l_v757_5 (ref)
                return (l_v757_5.camera_ang and l_v757_5.camera_ang.y or 0) - v1145.ang + 180;
            end, 
            ["At target"] = function(_, v1147)
                -- upvalues: l_v757_5 (ref), l_v761_4 (ref)
                local v1148 = l_v757_5.threat_ang or l_v757_5.camera_ang;
                return (v1148 and v1148.y or 0) - l_v761_4.yaw - v1147.ang + 180;
            end, 
            Opposite = function(_, _)
                -- upvalues: l_v757_5 (ref), l_v763_3 (ref)
                if not l_v757_5.freestand_raw then
                    return;
                else
                    local l_selected_yaw_0 = l_v763_3.selected_yaw;
                    if l_v757_5.freestand then
                        return 180;
                    else
                        if l_v757_5.edge then
                            l_selected_yaw_0 = l_v757_5.camera_ang.y;
                        end;
                        return l_v757_5.freestand_raw - l_selected_yaw_0;
                    end;
                end;
            end
        }, 
        snap = function(v1152)
            -- upvalues: l_v761_4 (ref), l_v953_0 (ref), l_v757_5 (ref), v502 (ref), l_v763_3 (ref), v33 (ref)
            l_v761_4.snap = nil;
            local l_snap_0 = l_v953_0.snap;
            local l_data_0 = v1152.data;
            local v1155 = l_snap_0 and l_snap_0.on ~= "Off" and not l_v757_5.use_aa and v502.exploit.active and v502.exploit.lc_left > 0;
            if v1155 then
                l_data_0.ticks = l_data_0.ticks + 1;
                v1155 = l_snap_0.time >= l_data_0.ticks;
            else
                l_data_0.ticks = 0;
            end;
            if v1155 then
                local l_l_v757_5_10 = l_v757_5;
                local l_l_v761_4_4 = l_v761_4;
                local v1158 = true;
                l_l_v761_4_4.snap = {};
                l_l_v757_5_10.snapping = v1158;
                l_data_0.once.apex = l_data_0.once.apex or v502.exploit.lc_left;
                l_data_0.once.delayed = l_data_0.once.delayed or 0;
                if l_data_0.once.delayed >= l_snap_0.y.delay + 1 then
                    l_data_0.once.switch = not l_data_0.once.switch;
                    l_data_0.once.delayed = 0;
                elseif l_v757_5.send_packet then
                    l_data_0.once.delayed = l_data_0.once.delayed + 1;
                end;
                if l_snap_0.x.type ~= "Off" then
                    l_l_v757_5_10 = v1152.pitch[l_snap_0.x.type](l_data_0, l_snap_0.x);
                    if l_l_v757_5_10 then
                        l_v761_4.snap[1] = l_l_v757_5_10;
                    end;
                end;
                if l_snap_0.y.type ~= "Off" then
                    l_l_v757_5_10 = v1152.yaw[l_snap_0.y.type](l_data_0, l_snap_0.y);
                    if l_l_v757_5_10 then
                        l_v761_4.snap[2] = l_l_v757_5_10;
                    end;
                end;
                if l_v761_4.snap[2] and v502.exploit.defensive then
                    l_l_v757_5_10 = l_v763_3;
                    l_l_v761_4_4 = l_v763_3;
                    v1158 = true;
                    l_l_v761_4_4.no_offset = true;
                    l_l_v757_5_10.no_modifier = v1158;
                end;
            elseif l_v757_5.snapping then
                l_v757_5.snapping = false;
                l_data_0.counter = l_data_0.counter >= 65535 and 0 or l_data_0.counter + 1;
                v33.clear(l_data_0.once);
            end;
        end, 
        lc_check = function()
            -- upvalues: v502 (ref), v510 (ref), l_v953_0 (ref), l_v757_5 (ref), v405 (ref)
            local v1159 = false;
            if not v502.exploit.active then
                return false;
            else
                if v510.antiaim.def.snap.value then
                    local l_snap_1 = l_v953_0.snap;
                    if l_snap_1 and l_snap_1.on ~= "Off" then
                        v1159 = l_snap_1.lc;
                    end;
                elseif v510.antiaim.def.triggers.value then
                    local v1161 = v510.antiaim.def.triggers[1];
                    local v1162 = l_v757_5.statew and l_v757_5.statew > 0.5 and l_v757_5.stateb or l_v757_5.state;
                    if #v1161.states.value > 0 and not v1159 then
                        v1159 = v1162 == v405.states.airc and v1161.states:get("Air-crouch") or v1162 == v405.states.air and v1161.states:get("Air") or v1162 == v405.states.sneak and v1161.states:get("Sneaking") or v1162 == v405.states.crouch and v1161.states:get("Crouching") or v1162 == v405.states.walk and v1161.states:get("Walking") or v1162 == v405.states.run and v1161.states:get("Running") or v1162 == v405.states.stand and v1161.states:get("Standing");
                    end;
                end;
                return v1159;
            end;
        end, 
        lc = function(v1163)
            -- upvalues: v510 (ref), v183 (ref)
            local _ = v510.antiaim.def.triggers;
            local l_data_1 = v1163.data;
            if v1163.lc_check() then
                v183.rage.main.dt.lag:override("Always On");
                v183.rage.main.hs.options:override("Break LC");
                l_data_1.forced_lc = true;
            elseif l_data_1.forced_lc then
                v183.rage.main.dt.lag:override();
                v183.rage.main.hs.options:override();
                l_data_1.forced_lc = false;
            end;
        end, 
        work = function(v1166)
            v1166:lc();
            v1166:snap();
        end
    };
    v1003 = {
        movement_fix = function()
            -- upvalues: l_l_v508_2_8 (ref), v34 (ref)
            local l_forwardmove_0 = l_l_v508_2_8.forwardmove;
            local l_sidemove_0 = l_l_v508_2_8.sidemove;
            local v1169, v1170 = v34.angle_vec(0, l_l_v508_2_8.view_angles.y, 0);
            local v1171, v1172 = v34.angle_vec(l_l_v508_2_8.view_angles.x, l_l_v508_2_8.view_angles.y, l_l_v508_2_8.view_angles.z);
            local v1173 = 0;
            local v1174 = 0;
            local v1175 = 0;
            v1172.z = 0;
            v1171.z = v1175;
            v1170.z = v1174;
            v1169.z = v1173;
            v1173 = v1169 / v34.sqrt3(v1169:unpack());
            v1174 = v1170 / v34.sqrt3(v1170:unpack());
            v1175 = v1171 / v34.sqrt3(v1171:unpack());
            v1172 = v1172 / v34.sqrt3(v1172:unpack());
            v1171 = v1175;
            v1173 = v1173 * l_forwardmove_0 + v1174 * l_sidemove_0;
            l_l_v508_2_8.sidemove = (v1171.x * v1173.y - v1171.y * v1173.x) / (v1172.y * v1171.x - v1172.x * v1171.y);
            l_l_v508_2_8.forwardmove = (v1172.y * v1173.x - v1172.x * v1173.y) / (v1172.y * v1171.x - v1172.x * v1171.y);
        end, 
        work = function(v1176)
            -- upvalues: l_v757_5 (ref), v510 (ref), v502 (ref), v34 (ref), l_l_v508_2_8 (ref), l_v763_3 (ref)
            l_v757_5.roll_mode = nil;
            if v510.antiaim.buttons.roll.value == 0 then
                return;
            else
                local v1177 = v510.antiaim.buttons.roll.value * (l_v757_5.inverted and -1 or 1);
                if v502.velocity > 5 or not v502.on_ground then
                    v1177 = v34.clamp(v1177, -40, 40);
                end;
                l_l_v508_2_8.view_angles.z = v1177;
                l_v757_5.roll_mode = l_l_v508_2_8.view_angles.z;
                if v502.on_ground then
                    v1176.movement_fix();
                end;
                local l_l_v763_3_0 = l_v763_3;
                local l_l_v763_3_1 = l_v763_3;
                local l_l_v763_3_2 = l_v763_3;
                local v1181 = true;
                local v1182 = true;
                l_l_v763_3_2.no_snap = true;
                l_l_v763_3_1.no_offset = v1182;
                l_l_v763_3_0.no_modifier = v1181;
                l_v763_3.force_desync = l_l_v508_2_8.view_angles.z > 0 and 60 or -60;
                return;
            end;
        end
    };
    local v1227 = {
        use = {
            wait = false, 
            check = function()
                -- upvalues: v502 (ref), l_l_v508_2_8 (ref)
                local l_m_iTeamNum_0 = v502.self.m_iTeamNum;
                local l_m_bIsDefusing_0 = v502.self.m_bIsDefusing;
                local l_m_bIsGrabbingHostage_0 = v502.self.m_bIsGrabbingHostage;
                if l_m_bIsDefusing_0 or l_m_bIsGrabbingHostage_0 then
                    return false;
                else
                    if l_m_iTeamNum_0 == 3 and l_l_v508_2_8.view_angles.x > 15 then
                        local v1186 = entity.get_entities(129);
                        for v1187 = 1, #v1186 do
                            local v1188 = v1186[v1187]:get_origin();
                            if v1188 and v502.origin and v502.origin:dist(v1188) < 61 then
                                return false;
                            end;
                        end;
                    end;
                    return true;
                end;
            end, 
            work = function(v1189)
                -- upvalues: l_v757_5 (ref), v510 (ref), v502 (ref), l_v763_3 (ref), l_l_v508_2_8 (ref), l_v761_4 (ref)
                l_v757_5.use_aa = false;
                if not v510.antiaim.general.use.value then
                    return;
                else
                    if v502.using then
                        l_v757_5.use_aa = true;
                        l_v763_3.force_camera = true;
                        if v1189.wait == false then
                            l_v763_3.force_send = true;
                            l_v763_3.no_antiaim = true;
                            v1189.wait = true;
                        elseif v1189.wait == true then
                            if v1189.check() then
                                l_l_v508_2_8.in_use = false;
                                local l_l_v761_4_5 = l_v761_4;
                                local l_l_v761_4_6 = l_v761_4;
                                local l_l_v761_4_7 = l_v761_4;
                                local v1193 = "Disabled";
                                local v1194 = 180;
                                l_l_v761_4_7.desfs = "Peek real";
                                l_l_v761_4_6.yaw = v1194;
                                l_l_v761_4_5.pitch = v1193;
                                l_v763_3.no_snap = true;
                            else
                                l_v763_3.no_antiaim = true;
                            end;
                        end;
                    elseif v1189.wait then
                        l_v763_3.force_send = true;
                        local l_l_v763_3_3 = l_v763_3;
                        local l_l_v763_3_4 = l_v763_3;
                        local v1197 = true;
                        l_l_v763_3_4.no_modifier = true;
                        l_l_v763_3_3.no_offset = v1197;
                        v1189.wait = false;
                    end;
                    return;
                end;
            end
        }, 
        safe = {
            smart = function()
                -- upvalues: v502 (ref), l_v757_5 (ref), v405 (ref), l_v763_3 (ref)
                local v1198 = v502.threat:get_eye_position();
                local v1199 = v502.self:get_hitbox_position(1);
                if not v1198 or not v1199 then
                    return;
                else
                    local v1200 = (v1199.z - v1198.z) / l_v757_5.threat_dist;
                    local v1201 = 0;
                    local v1202 = 0.75;
                    if v502.on_ground and not v502.crouching then
                        local v1203 = 0.25;
                        v1202 = 0.5;
                        v1201 = v1203;
                    elseif v502.on_ground and v502.crouching then
                        local v1204 = -0.05;
                        v1202 = 0.3;
                        v1201 = v1204;
                    elseif l_v757_5.state == v405.states.air then
                        local v1205 = 0.15;
                        v1202 = 0.75;
                        v1201 = v1205;
                    elseif l_v757_5.state == v405.states.airc then
                        if (v502.weapon_t and v502.weapon_t.weapon_name) == "weapon_knife" then
                            local v1206 = -0.05;
                            v1202 = 0.55;
                            v1201 = v1206;
                        else
                            local v1207 = 0.1;
                            v1202 = 0.75;
                            v1201 = v1207;
                        end;
                    end;
                    if v1200 < v1201 or v1202 < v1200 then
                        return;
                    else
                        l_v757_5.safe_head = true;
                        local l_l_v763_3_5 = l_v763_3;
                        local l_l_v763_3_6 = l_v763_3;
                        local l_l_v763_3_7 = l_v763_3;
                        local v1211 = true;
                        local v1212 = true;
                        l_l_v763_3_7.force_desync = 0;
                        l_l_v763_3_6.no_offset = v1212;
                        l_l_v763_3_5.no_modifier = v1211;
                        return;
                    end;
                end;
            end, 
            basic = function()
                -- upvalues: v502 (ref), l_v757_5 (ref), l_v763_3 (ref)
                local v1213 = v502.threat:get_origin();
                if not v1213 then
                    return;
                else
                    local v1214 = v502.origin.z - v1213.z;
                    local v1215 = v502.weapon_t and v502.weapon_t.weapon_type == 0;
                    if v502.jumping and v1215 and v1214 > -32 then
                        l_v757_5.safe_head = true;
                        local l_l_v763_3_8 = l_v763_3;
                        local l_l_v763_3_9 = l_v763_3;
                        local l_l_v763_3_10 = l_v763_3;
                        local v1219 = true;
                        local v1220 = true;
                        l_l_v763_3_10.force_desync = 0;
                        l_l_v763_3_9.no_offset = v1220;
                        l_l_v763_3_8.no_modifier = v1219;
                    end;
                    return;
                end;
            end, 
            work = function(v1221)
                -- upvalues: l_v757_5 (ref), v510 (ref), v502 (ref)
                l_v757_5.safe_head = false;
                if not v510.antiaim.general.head.value or not v502.threat or l_v757_5.manual_yaw or l_v757_5.use_aa then
                    return;
                else
                    if v510.antiaim.general.head.smart.value then
                        v1221.smart();
                    else
                        v1221.basic();
                    end;
                    return;
                end;
            end
        }, 
        flick = {
            step = 0, 
            work = function(v1222)
                -- upvalues: l_v757_5 (ref), v510 (ref), v502 (ref), v166 (ref), l_v953_0 (ref), l_v763_3 (ref), l_l_v508_2_8 (ref), l_v761_4 (ref)
                l_v757_5.lcflick = false;
                if not v510.antiaim.buttons.flick.value or v502.exploit.charge < 1 then
                    return;
                else
                    local v1223 = l_v757_5.sent % 4 >= 2;
                    local _ = v166(v1223, l_v953_0.cur.des.inv) and -1 or 1;
                    local v1225 = v166(l_v757_5.inverted, l_v953_0.cur.des.inv) and -1 or 1;
                    l_v763_3.no_offset = true;
                    l_l_v508_2_8.force_defensive = true;
                    l_v761_4.des = -60 * v1225;
                    l_v761_4.mod = (not v502.exploit.defensive and ({
                        [1] = 40, 
                        [2] = 45, 
                        [3] = 45, 
                        [4] = 40
                    })[v1222.step % 4 + 1] or 0) * v1225;
                    if not v502.exploit.defensive and l_v757_5.send_packet then
                        v1222.step = v1222.step >= 255 and 0 or v1222.step + 1;
                    end;
                    return;
                end;
            end
        }, 
        work = function(v1226)
            v1226.use:work();
            v1226.safe:work();
        end
    };
    local function v1235(v1228, v1229, v1230)
        -- upvalues: l_v757_5 (ref), l_next_0 (ref), l_type_0 (ref), v34 (ref)
        if not v1230 then
            v1230 = l_v757_5.statew;
        end;
        if v1230 == 0 or not v1229 then
            return v1228;
        elseif v1230 == 1 then
            return v1229;
        else
            local v1231 = v1228 or {};
            if not v1229 then
                v1229 = {};
            end;
            v1228 = v1231;
            v1231 = {};
            for v1232 in l_next_0, v1228 do
                local v1233 = v1228[v1232];
                local v1234 = v1229[v1232];
                if l_type_0(v1233) == "number" and l_type_0(v1234) == "number" then
                    v1231[v1232] = v34.lerp(v1233, v1234, v1230);
                elseif v1230 < 0.5 then
                    v1231[v1232] = v1233;
                else
                    v1231[v1232] = v1234;
                end;
            end;
            return v1231;
        end;
    end;
    do
        local l_v994_1, l_v999_1, l_v1001_1, l_v1002_1, l_v1003_2, l_v1227_0, l_v1235_0 = v994, v999, v1001, v1002, v1003, v1227, v1235;
        local v1253 = {
            [true] = function()
                -- upvalues: l_v994_1 (ref), l_v757_5 (ref), l_v999_1 (ref), l_v1001_1 (ref), l_v953_0 (ref), v33 (ref), l_v761_4 (ref), l_v1235_0 (ref), l_v1003_2 (ref), l_v1002_1 (ref), l_v1227_0 (ref), l_v763_3 (ref), v34 (ref)
                l_v994_1:work();
                if l_v757_5.statew == 0 then
                    l_v999_1:work();
                    l_v1001_1:work();
                elseif l_v757_5.statew == 1 then
                    local l_l_v953_0_2 = l_v953_0;
                    local l_l_v953_0_3 = l_v953_0;
                    local l_next_1 = l_v953_0.next;
                    l_l_v953_0_3.next = l_v953_0.cur;
                    l_l_v953_0_2.cur = l_next_1;
                    l_v999_1:work();
                    l_v1001_1:work();
                    l_l_v953_0_2 = l_v953_0;
                    l_l_v953_0_3 = l_v953_0;
                    l_next_1 = l_v953_0.next;
                    l_l_v953_0_3.next = l_v953_0.cur;
                    l_l_v953_0_2.cur = l_next_1;
                else
                    l_v999_1:work();
                    l_v1001_1:work();
                    local v1246 = v33.copy(l_v761_4);
                    local l_l_v953_0_4 = l_v953_0;
                    local l_l_v953_0_5 = l_v953_0;
                    local l_next_2 = l_v953_0.next;
                    l_l_v953_0_5.next = l_v953_0.cur;
                    l_l_v953_0_4.cur = l_next_2;
                    l_v999_1:work();
                    l_v1001_1:work();
                    l_l_v953_0_4 = v33.copy(l_v761_4);
                    l_l_v953_0_5 = l_v953_0;
                    l_next_2 = l_v953_0;
                    local l_next_3 = l_v953_0.next;
                    l_next_2.next = l_v953_0.cur;
                    l_l_v953_0_5.cur = l_next_3;
                    l_v761_4 = l_v1235_0(v1246, l_l_v953_0_4);
                end;
                l_v1003_2:work();
                l_v1002_1:work();
                l_v1227_0:work();
                if l_v763_3.no_snap then
                    l_v761_4.snap = nil;
                end;
                if l_v763_3.no_modifier then
                    l_v761_4.mod = 0;
                end;
                if l_v763_3.force_desync ~= nil then
                    l_v761_4.des = l_v763_3.force_desync or nil;
                end;
                if not l_v763_3.no_offset then
                    local v1251 = l_v953_0.cur.off + (l_v953_0.cur.add.on and l_v761_4.des and l_v761_4.des ~= 0 and (l_v761_4.des > 0 and l_v953_0.cur.add.r or l_v953_0.cur.add.l) or 0);
                    local v1252 = l_v953_0.next.off + (l_v953_0.next.add.on and l_v761_4.des and l_v761_4.des ~= 0 and (l_v761_4.des > 0 and l_v953_0.next.add.r or l_v953_0.next.add.l) or 0);
                    l_v761_4.mod = l_v761_4.mod + v34.lerp(v1251, v1252, l_v757_5.statew);
                end;
            end, 
            [false] = function()
                -- upvalues: l_v994_1 (ref), l_v999_1 (ref), l_v1001_1 (ref), l_v1003_2 (ref), l_v1002_1 (ref), l_v1227_0 (ref), l_v763_3 (ref), l_v761_4 (ref), l_v953_0 (ref)
                l_v994_1:work();
                l_v999_1:work();
                l_v1001_1:work();
                l_v1003_2:work();
                l_v1002_1:work();
                l_v1227_0:work();
                if l_v763_3.no_snap then
                    l_v761_4.snap = nil;
                end;
                if l_v763_3.no_modifier then
                    l_v761_4.mod = 0;
                end;
                if l_v763_3.force_desync ~= nil then
                    l_v761_4.des = l_v763_3.force_desync or nil;
                end;
                if not l_v763_3.no_offset then
                    l_v761_4.mod = l_v761_4.mod + l_v953_0.cur.off;
                    if l_v953_0.cur.add.on and l_v761_4.des and l_v761_4.des ~= 0 then
                        l_v761_4.mod = l_v761_4.mod + (l_v761_4.des > 0 and l_v953_0.cur.add.r or l_v953_0.cur.add.l);
                    end;
                end;
            end
        };
        v989 = function()
            -- upvalues: v1253 (ref), v510 (ref)
            v1253[v510.antiaim.general.nature.value]();
        end;
        local l_on_0 = v510.antiaim.ab.on;
        l_v757_5.abweight = 0;
        l_v757_5.abcfgidx = 1;
        l_v757_5.abcfgname = "Default";
        local l_rlist_0 = v511.rlist;
        local v1256 = nil;
        do
            local l_l_on_0_0, l_l_rlist_0_0, l_v1256_0 = l_on_0, l_rlist_0, v1256;
            local function v1265()
                -- upvalues: l_l_on_0_0 (ref), l_v757_5 (ref), l_v1256_0 (ref), v33 (ref), l_l_rlist_0_0 (ref), v511 (ref), v34 (ref)
                if l_l_on_0_0.mode.value == "Adjust" then
                    local v1260 = l_l_on_0_0.power.value * 0.01;
                    l_v757_5.abweight = utils.random_float(-v1260, v1260);
                    if l_l_on_0_0.timer.value > 0 then
                        l_v1256_0 = globals.curtime;
                    end;
                elseif l_l_on_0_0.mode.value == "Preset rack" then
                    if l_l_on_0_0.order.value == "Random" then
                        local l_l_v757_5_11 = l_v757_5;
                        local l_l_v757_5_12 = l_v757_5;
                        local v1263, v1264 = v33.random(l_l_rlist_0_0);
                        l_l_v757_5_12.abcfgidx = v1264;
                        l_l_v757_5_11.abcfgname = v1263;
                        v511.actions.load(l_v757_5.abcfgname, {
                            [1] = "antiaim", 
                            [2] = "builder"
                        }, {
                            [1] = "antiaim", 
                            [2] = "snaps"
                        });
                    elseif l_l_on_0_0.order.value == "Sequence" then
                        l_v757_5.abcfgidx = v34.cycle(l_v757_5.abcfgidx + 1, #l_l_rlist_0_0);
                        l_v757_5.abcfgname = l_l_rlist_0_0[l_v757_5.abcfgidx];
                        v511.actions.load(l_v757_5.abcfgname, {
                            [1] = "antiaim", 
                            [2] = "builder"
                        }, {
                            [1] = "antiaim", 
                            [2] = "snaps"
                        });
                    end;
                end;
            end;
            local function v1266()
                -- upvalues: l_v757_5 (ref), v511 (ref)
                l_v757_5.abweight = 0;
                l_v757_5.abcfgidx = v511.loadedidx or 0;
                l_v757_5.abcfgname = v511.loaded or "Default";
            end;
            local function v1268(v1267)
                -- upvalues: l_l_on_0_0 (ref), v1265 (ref), v185 (ref), l_v757_5 (ref)
                if not l_l_on_0_0.events:get("Enemy shot") then
                    return;
                else
                    v1265();
                    v185.ab_set:call({
                        trigger = "enemy_shot", 
                        set = true, 
                        enemy = v1267.attacker, 
                        weight = l_v757_5.abweight, 
                        config = l_v757_5.abcfgname, 
                        mode = l_l_on_0_0.mode.value
                    });
                    return;
                end;
            end;
            local function v1270(v1269)
                -- upvalues: l_l_on_0_0 (ref), v502 (ref), v1265 (ref), v185 (ref), l_v757_5 (ref)
                if not l_l_on_0_0.events:get("Local shot") or v1269.userid ~= v502.userid then
                    return;
                else
                    v1265();
                    v185.ab_set:call({
                        trigger = "local_shot", 
                        set = true, 
                        enemy = v1269.attacker, 
                        weight = l_v757_5.abweight, 
                        config = l_v757_5.abcfgname, 
                        mode = l_l_on_0_0.mode.value
                    });
                    return;
                end;
            end;
            local function v1271()
                -- upvalues: v1266 (ref), v185 (ref), l_v757_5 (ref), l_l_on_0_0 (ref)
                v1266();
                v185.ab_set:call({
                    set = false, 
                    weight = l_v757_5.abweight, 
                    config = l_v757_5.abcfgname, 
                    mode = l_l_on_0_0.mode.value
                });
            end;
            local function v1273()
                -- upvalues: l_l_on_0_0 (ref), l_v1256_0 (ref), v34 (ref), v1266 (ref), v185 (ref), l_v757_5 (ref)
                local v1272 = l_l_on_0_0.timer.value * 0.1;
                if l_v1256_0 and v1272 < v34.abs(globals.curtime - l_v1256_0) then
                    v1266();
                    v185.ab_set:call({
                        trigger = "timer", 
                        set = false, 
                        weight = l_v757_5.abweight, 
                        config = l_v757_5.abcfgname, 
                        mode = l_l_on_0_0.mode.value
                    });
                    l_v1256_0 = nil;
                end;
            end;
            l_l_on_0_0.sel:set_callback(function(v1274)
                -- upvalues: l_l_on_0_0 (ref), l_l_rlist_0_0 (ref), v511 (ref)
                v1274.value = l_l_on_0_0.sel:get();
                l_l_rlist_0_0 = #v1274.value > 0 and v1274.value or v511.rlist;
            end, true);
            l_l_on_0_0:set_callback(function(v1275)
                -- upvalues: v185 (ref), v1268 (ref), v1270 (ref), v1271 (ref), v1273 (ref), v1266 (ref)
                v185.enemy_shot(v1268, v1275.value);
                v185.weapon_fire(v1270, v1275.value);
                v185.local_spawn(v1271, v1275.value);
                v185.local_disconnect(v1271, v1275.value);
                v185.createmove(v1273, v1275.value);
                if not v1275.value then
                    v1266();
                end;
            end, true);
        end;
    end;
    v514 = {
        data = l_v757_5, 
        ctx = l_v761_4
    };
    v994 = nil;
    v994 = function(_)
        -- upvalues: v34 (ref), l_v763_3 (ref), l_v761_4 (ref), l_v925_1 (ref), l_v757_5 (ref)
        local v1277 = v34.normalize_yaw(l_v763_3.force_yaw or l_v761_4.yaw + l_v761_4.mod);
        l_v925_1.freestand:override(l_v761_4.fs);
        l_v925_1.hidden:override(l_v761_4.snap ~= nil);
        if l_v761_4.snap then
            rage.antiaim:override_hidden_pitch(l_v761_4.snap[1] and v34.normalize_pitch(l_v761_4.snap[1]) or 89);
            rage.antiaim:override_hidden_yaw_offset(l_v761_4.snap[2] and v34.normalize_yaw(l_v761_4.snap[2]) or 0);
        end;
        if l_v757_5.send_packet or l_v763_3.force_send then
            l_v925_1.pitch:set(l_v757_5.use_aa and "Disabled" or "Down");
            l_v925_1.yaw:override(v1277);
            l_v925_1.yaw_type:override((not not l_v763_3.force_yaw or l_v763_3.force_static) and "Static" or "Backward");
            l_v925_1.yaw_base:override(l_v763_3.force_camera and "Local View" or "At Target");
            l_v925_1.modifier:override("Disabled");
            l_v925_1.extended:override(false);
            l_v925_1.body_yaw:override(l_v761_4.des ~= nil);
            if l_v761_4.des then
                l_v925_1.inverter:override(l_v761_4.des > 0);
                l_v925_1.left:override(-l_v761_4.des);
                l_v925_1.right:override(l_v761_4.des);
                l_v925_1.options:override(l_v761_4.deso);
                l_v925_1.desync_fs:override(l_v761_4.desfs);
            end;
        end;
    end;
    v999 = nil;
    v1001 = nil;
    v1002 = 0;
    v1003 = 0;
    do
        local l_v1002_2, l_v1003_3, l_v1227_1 = v1002, v1003, v1227;
        l_v1227_1 = {
            Static = function(v1281)
                return v1281.time;
            end, 
            Fluctuate = function(v1282)
                -- upvalues: l_v1003_3 (ref)
                return l_v1003_3 >= v1282.time and 0 or l_v1003_3 + 1;
            end, 
            Switch = function(v1283)
                -- upvalues: l_v1003_3 (ref)
                return l_v1003_3 == v1283.time and 0 or v1283.time;
            end, 
            Random = function(v1284)
                return utils.random_int(0, v1284.time);
            end
        };
        v1001 = function()
            -- upvalues: l_v757_5 (ref), l_v953_0 (ref), l_v1227_1 (ref), l_v1002_2 (ref), v502 (ref), v405 (ref), l_v1003_3 (ref)
            local v1285 = l_v757_5.statew and l_v757_5.statew > 0.5 and l_v953_0.next.switch or l_v953_0.cur.switch;
            local v1286 = l_v1227_1[v1285.mode] and l_v1227_1[v1285.mode](v1285) + 1 or 0;
            if v1286 <= l_v1002_2 or v502.exploit.active == v405.exploit.OFF then
                if l_v757_5.send_packet then
                    l_v757_5.counter = l_v757_5.counter >= 65535 and 0 or l_v757_5.counter + 1;
                    l_v757_5.switch = l_v757_5.counter % 2 == 0;
                    l_v1002_2 = 0;
                    l_v1003_3 = v1286 - 1;
                end;
            else
                l_v1002_2 = l_v1002_2 + 1;
            end;
        end;
    end;
    do
        local l_v1001_2 = v1001;
        v999 = function()
            -- upvalues: l_v757_5 (ref), l_v1001_2 (ref), v33 (ref), l_v763_3 (ref)
            if l_v757_5.send_packet then
                l_v757_5.sent = l_v757_5.sent >= 65535 and 0 or l_v757_5.sent + 1;
            end;
            l_v1001_2();
            v33.clear(l_v763_3);
        end;
    end;
    do
        local l_v994_2, l_v999_2, l_v1001_3 = v994, v999, v1001;
        l_v1001_3 = {
            work = function(v1291)
                -- upvalues: l_l_v508_2_8 (ref), v972 (ref), v989 (ref), l_v994_2 (ref), l_v999_2 (ref)
                l_l_v508_2_8 = v1291;
                v972();
                v989();
                l_v994_2();
                l_v999_2();
            end, 
            revert = function()
                -- upvalues: l_next_0 (ref), l_v925_1 (ref)
                for _, v1293 in l_next_0, l_v925_1.list do
                    v1293:override();
                end;
            end
        };
        v510.antiaim.enable:set_callback(function(v1294)
            -- upvalues: v183 (ref), v185 (ref), l_v1001_3 (ref)
            v183.antiaim.angles.enabled:override(v1294.value or nil);
            v183.antiaim.angles.yaw.avoid_bs:override(v1294.value or nil);
            v185.createmove(l_v1001_3.work, v1294.value);
            if not v1294.value then
                l_v1001_3.revert();
            end;
        end, true);
        v183.antiaim.angles.freestand:set_callback(function(v1295)
            -- upvalues: v510 (ref)
            v510.antiaim.buttons.fs:set(v1295.value);
        end, true);
        v185.shutdown:set(l_v1001_3.revert);
    end;
end;
l_v508_2 = nil;
l_v508_2 = {};
l_v508_2.shared = {
    code_mul = 143, 
    latest_rollcall = 0, 
    users = {}, 
    icons = {
        [1] = "https://cdn.hysteria.one/main/user.png", 
        [2] = "https://cdn.hysteria.one/main/bliss.png", 
        [3] = "https://cdn.hysteria.one/main/beta.png", 
        [4] = "https://cdn.hysteria.one/main/dev.png"
    }, 
    listen = function(v1296)
        -- upvalues: l_v508_2 (ref), v169 (ref), v35 (ref)
        local v1297 = v1296.buffer:read_bits(4);
        local v1298 = v1296.buffer:read_bits(8);
        local v1299 = v1296.buffer:read_bits(4);
        local v1300 = v1296.buffer:read_bits(20);
        local v1301 = v1296.buffer:read_bits(12);
        if v1296.entity and v1296.xuid == 0 then
            local v1302 = #v1296.entity:get_name();
            local v1303 = l_v508_2.shared.code_mul - v1302 - 1;
            if v1297 == 0 and v1298 == v1302 and v1299 > 0 and v1299 < 5 and v1300 % v1303 == 0 and v1300 % v1301 == 0 then
                v169(v35.format("%s is a %s user", v1296.entity:get_name(), v1299));
                l_v508_2.shared.set(v1296.entity, v1299);
            end;
        end;
        l_v508_2.shared.rollcall();
    end, 
    say = function()
        -- upvalues: v185 (ref), v0 (ref), l_v508_2 (ref)
        if not globals.is_in_game then
            return;
        else
            local v1304 = #cvar.name:string();
            local v1305 = utils.random_int(256, 4095);
            v185.voice_message:call(function(v1306)
                -- upvalues: v1304 (ref), v0 (ref), v1305 (ref), l_v508_2 (ref)
                v1306:write_bits(0, 4);
                v1306:write_bits(v1304, 8);
                v1306:write_bits(v0, 4);
                v1306:write_bits(v1305 * (l_v508_2.shared.code_mul - v1304 - 1), 20);
                v1306:write_bits(v1305, 12);
            end);
            return;
        end;
    end, 
    rollcall = function(v1307)
        -- upvalues: v34 (ref), l_v508_2 (ref), v502 (ref), v0 (ref)
        if v1307 == true or v34.abs(globals.tickcount - l_v508_2.shared.latest_rollcall) > 256 then
            l_v508_2.shared.say();
            l_v508_2.shared.set(v502.self, v0);
            l_v508_2.shared.latest_rollcall = globals.tickcount;
        end;
    end, 
    set = function(v1308, v1309, v1310)
        -- upvalues: l_v508_2 (ref), v510 (ref), v502 (ref)
        if not v1308 or v1308:is_bot() then
            return;
        else
            local l_shared_0 = l_v508_2.shared;
            local v1312 = l_shared_0.icons[v1309];
            local l_steamid_0 = v1308:get_player_info().steamid;
            if v510.settings.shared.value and v1309 and v1312 then
                if not l_shared_0.users[l_steamid_0] then
                    v1308:set_icon(v1312);
                    l_shared_0.active = true;
                    l_shared_0.users[l_steamid_0] = true;
                end;
            elseif l_shared_0.users[l_steamid_0] and (not v1310 or v1308 ~= v502.self) then
                v1308:set_icon();
                l_shared_0.users[l_steamid_0] = nil;
            end;
            return;
        end;
    end, 
    clear = function()
        -- upvalues: l_v508_2 (ref)
        entity.get_players(false, true, l_v508_2.shared.set);
        l_v508_2.shared.users = {};
    end, 
    run = function(v1314)
        -- upvalues: v510 (ref), v185 (ref), l_v508_2 (ref), v502 (ref), v0 (ref)
        v1314.say();
        v510.settings.shared:set_callback(function(v1315)
            -- upvalues: v185 (ref), v1314 (ref), l_v508_2 (ref), v502 (ref), v0 (ref)
            v185.voice_message(v1314.listen, v1315.value);
            if v1315.value then
                v1314.rollcall();
                l_v508_2.shared.set(v502.self, v0, true);
            else
                v1314.clear();
            end;
        end, true);
        v185.player_spawn:set(v1314.rollcall);
        v185.player_death:set(v1314.rollcall);
        v185.round_start:set(v1314.rollcall);
        v185.round_prestart:set(v1314.clear);
        v185.shutdown:set(v1314.clear);
    end
};
l_v508_2.clantag = {
    last = 0, 
    list = {
        [1] = "h \226\160\128 \226\160\128\226\160\128\226\160\128", 
        [2] = "hy \226\160\128 \226\160\128 \226\160\128", 
        [3] = "hys \226\160\128\226\160\128\226\160\128", 
        [4] = "hyst  \226\160\128\226\160\128 ", 
        [5] = "hyste\226\160\128\226\160\128", 
        [6] = "hyster \226\160\128", 
        [7] = "hysteri\226\160\128", 
        [8] = "hysteria", 
        [9] = "hysteria", 
        [10] = "hysteria", 
        [11] = "hysteria", 
        [12] = "hysteria", 
        [13] = "hysteria", 
        [14] = "hysteria", 
        [15] = "hysteria", 
        [16] = "hysteria", 
        [17] = "hysteria", 
        [18] = "\226\160\128ysteria", 
        [19] = "\226\160\128 steria", 
        [20] = "\226\160\128\226\160\128 teria", 
        [21] = "\226\160\128\226\160\128\226\160\128eria", 
        [22] = "\226\160\128\226\160\128 \226\160\128 ria", 
        [23] = "\226\160\128 \226\160\128 \226\160\128 ia", 
        [24] = "\226\160\128 \226\160\128\226\160\128\226\160\128 a"
    }, 
    work = function()
        -- upvalues: v34 (ref), l_v508_2 (ref)
        if not globals.is_in_game then
            return;
        else
            local v1316 = v34.floor(globals.curtime * 4 + 0.5) % #l_v508_2.clantag.list + 1;
            if v1316 == l_v508_2.clantag.last then
                return;
            else
                l_v508_2.clantag.last = v1316;
                common.set_clan_tag(l_v508_2.clantag.list[v1316] or "");
                return;
            end;
        end;
    end, 
    reset = function()
        common.set_clan_tag("");
    end, 
    run = function(v1317)
        -- upvalues: v510 (ref), v185 (ref), v183 (ref)
        v510.settings.clantag:set_callback(function(v1318)
            -- upvalues: v185 (ref), v1317 (ref), v510 (ref), v183 (ref)
            v185.net_update_end(v1317.work, v1318.value);
            if v510.settings.clantag.value then
                v183.misc.ingame.clantag:override(false);
            else
                v1317.reset();
                v183.misc.ingame.clantag:override();
            end;
        end, true);
        v185.shutdown:set(v1317.reset);
        v183.misc.ingame.clantag:depend(true, {
            [1] = nil, 
            [2] = false, 
            [1] = v510.settings.clantag
        });
    end
};
l_v508_2.ladder = {
    work = function(v1319)
        -- upvalues: v502 (ref), v249 (ref), v34 (ref)
        if v502.self.m_MoveType ~= 9 or v1319.forwardmove == 0 then
            return;
        else
            local v1320 = v249.camera_angles();
            local v1321 = v1319.forwardmove < 0 or v1320.x > 45;
            local l_v1321_0 = v1321;
            v1319.in_moveright = not v1321;
            v1319.in_moveleft = l_v1321_0;
            l_v1321_0 = v1321;
            v1319.in_back = not v1321;
            v1319.in_forward = l_v1321_0;
            l_v1321_0 = v1319.view_angles;
            local l_view_angles_0 = v1319.view_angles;
            local v1324 = 89;
            l_view_angles_0.y = v34.normalize_yaw(v1319.move_yaw + 90);
            l_v1321_0.x = v1324;
            return;
        end;
    end, 
    run = function(v1325)
        -- upvalues: v510 (ref), v185 (ref)
        v510.settings.ladder:set_callback(function(v1326)
            -- upvalues: v185 (ref), v1325 (ref)
            v185.createmove(v1325.work, v1326.value);
        end, true);
    end
};
l_v508_2.avoidc = {
    work = function(v1327)
        -- upvalues: v502 (ref), l_vector_0 (ref), v503 (ref), v34 (ref)
        if not v1327.in_jump or v1327.in_moveright or v1327.in_moveleft or not not v1327.in_back then
            return;
        else
            local l_origin_0 = v502.origin;
            if not l_origin_0 then
                return;
            else
                l_origin_0.z = l_origin_0.z + 16;
                local v1329 = l_origin_0 + l_vector_0():angles(l_vector_0(0, v1327.move_yaw, 0)) * 128;
                local v1330 = utils.trace_line(l_origin_0, v1329, v503, 33636363);
                if bit.band(v1330.contents, 536870912) ~= 0 or v1330.entity and v1330.entity:get_classname() == "CDynamicProp" then
                    return;
                else
                    local l_huge_0 = v34.huge;
                    local l_huge_1 = v34.huge;
                    for v1333 = -80, 80, 10 do
                        local v1334 = l_origin_0 + l_vector_0():angles(l_vector_0(0, v1327.move_yaw + v1333)) * 64;
                        local v1335 = utils.trace_line(l_origin_0, v1334, v503, 33636363);
                        local v1336 = l_origin_0:dist(v1335.end_pos);
                        if v1336 < l_huge_1 and (not v1335.entity or not v1335.entity:is_player()) then
                            local l_v1333_0 = v1333;
                            l_huge_1 = v1336;
                            l_huge_0 = l_v1333_0;
                        end;
                    end;
                    local v1338 = 35;
                    if l_huge_1 < v1338 then
                        local v1339 = v34.rad(l_huge_0 + 90);
                        local v1340 = v34.abs(l_huge_0) < v1338 and (v1338 - l_huge_1) / 15 or 1;
                        local v1341 = v34.abs(v502.velocity * v34.cos(v1339));
                        local v1342 = v502.velocity * v34.sin(v1339) * v1340;
                        v1327.forwardmove = v1341;
                        v1327.sidemove = v1342 * (l_huge_0 >= 0 and 1 or -1);
                    end;
                    return;
                end;
            end;
        end;
    end, 
    run = function(v1343)
        -- upvalues: v510 (ref), v185 (ref)
        v510.settings.avoidc:set_callback(function(v1344)
            -- upvalues: v185 (ref), v1343 (ref)
            v185.createmove(v1343.work, v1344.value);
        end, true);
    end
};
l_v508_2.release = {
    held = 0, 
    predict = function(v1345)
        -- upvalues: v502 (ref), v510 (ref), l_v508_2 (ref)
        if v502.in_attack and (v1345.type == "Frag" or v1345.type == "Molly" and v510.settings.release.burn.value) then
            local l_release_0 = l_v508_2.release;
            if v1345.fatal or v1345.damage >= v510.settings.release.dmg.value then
                if l_release_0.held < 8 then
                    l_release_0.held = l_release_0.held + 1;
                else
                    cvar["-attack"]:call();
                    if v502.in_attack then
                        l_release_0.held = 0;
                    end;
                end;
            elseif l_release_0.held ~= 0 then
                cvar["-attack"]:call();
                l_release_0.held = 0;
            end;
        end;
    end, 
    run = function(v1347)
        -- upvalues: v510 (ref), v185 (ref)
        v510.settings.release:set_callback(function(v1348)
            -- upvalues: v185 (ref), v1347 (ref)
            v185.grenade_prediction(v1347.predict, v1348.value);
        end, true);
    end
};
l_v508_2.nofall = {
    work = function(v1349)
        -- upvalues: v502 (ref), l_vector_0 (ref)
        local l_m_vecVelocity_0 = v502.self.m_vecVelocity;
        if l_m_vecVelocity_0.z < -10 and v502.origin then
            local l_origin_1 = v502.origin;
            local v1352 = utils.trace_line(l_origin_1, l_origin_1 + l_vector_0(0, 0, -512), nil, nil, 1);
            if l_origin_1.z - v1352.end_pos.z <= 70 and l_origin_1.z - v1352.end_pos.z >= 12 and l_m_vecVelocity_0.z < -450 then
                v1349.in_duck = true;
            end;
        end;
    end, 
    run = function(v1353)
        -- upvalues: v510 (ref), v185 (ref)
        v510.settings.nofall:set_callback(function(v1354)
            -- upvalues: v185 (ref), v1353 (ref)
            v185.createmove(v1353.work, v1354.value);
        end, true);
    end
};
l_v508_2.fdspeed = {
    work = function(v1355)
        -- upvalues: v502 (ref)
        if v502.on_ground and v502.exploit.fd then
            v1355.forwardmove = v1355.forwardmove * 2;
            v1355.sidemove = v1355.sidemove * 2;
        end;
    end, 
    run = function(v1356)
        -- upvalues: v510 (ref), v185 (ref)
        v510.settings.fdspeed:set_callback(function(v1357)
            -- upvalues: v185 (ref), v1356 (ref)
            v185.createmove_run(v1356.work, v1357.value);
        end, true);
    end
};
for _, v1359 in l_next_0, l_v508_2 do
    if v1359 then
        v1359:run();
    end;
end;
v757 = nil;
v761 = v33.new(50, 0);
v763 = {
    [1] = "knife", 
    [2] = "c4", 
    [3] = "decoy", 
    [4] = "flashbang", 
    [5] = "hegrenade", 
    [6] = "incgrenade", 
    [7] = "molotov", 
    [8] = "inferno", 
    [9] = "smokegrenade"
};
v757 = {
    list = v761
};
v925 = v510.settings.logs;
v952 = {};
v953 = nil;
do
    local l_v761_5, l_v763_4, l_v925_2, l_v952_0, l_v953_1 = v761, v763, v925, v952, v953;
    local function v1370(v1365, v1366, v1367)
        -- upvalues: l_v925_2 (ref), l_print_0 (ref), l_any_0 (ref), l_v952_0 (ref), l_print_raw_0 (ref), l_v761_5 (ref), v35 (ref), l_unpack_0 (ref), v33 (ref)
        if v1366 and l_v925_2.con.value then
            local v1368 = l_v925_2.hys.value and l_print_0 or l_any_0;
            if l_v952_0.round then
                l_print_raw_0("");
                v1368("round ", "\v" .. l_v952_0.round);
                l_v952_0.round = nil;
            end;
            v1368(v1366);
        end;
        if v1367 and l_v925_2.sc.value then
            if (v1365.event == "burnt" or v1365.event == "fire") and l_v761_5[1] and l_v761_5[1].event == v1365.event then
                l_v761_5[1].time = globals.realtime;
                l_v761_5[1].data[1] = l_v761_5[1].data[1] + v1365.data[1];
                l_v761_5[1].text = v35.format(v1367, l_v761_5[1].data[1]);
            else
                local v1369 = v1365.data and v35.format(v1367, l_unpack_0(v1365.data)) or v1367;
                v33.insert(l_v761_5, 1, {
                    text = v1369, 
                    props = v1365, 
                    event = v1365 and v1365.event, 
                    data = v1365 and v1365.data, 
                    time = globals.realtime, 
                    progress = {
                        [1] = 0
                    }
                });
            end;
        end;
    end;
    local function v1423(v1371, v1372, v1373)
        -- upvalues: v249 (ref), v33 (ref), l_type_0 (ref), l_ipairs_0 (ref), l_tostring_0 (ref), v1370 (ref)
        local v1374 = {};
        local v1375 = {};
        if v1371 then
            local v1376 = v1371.color and "\a" .. v1371.color:to_hex() or "";
            v1374[2] = "\194\183\aDEFAULT ";
            v1374[1] = v1376;
            v1376 = v1371.color and "\a" .. v1371.color:to_hex() or "";
            local v1377;
            if v1371.color then
                v1377 = v249.style == 1 and "\226\128\162\aDEFAULT " or "~\aDEFAULT ";
            else
                v1377 = "";
            end;
            v1375[2] = v1377;
            v1375[1] = v1376;
        end;
        for v1378 = 1, v33.maxn(v1372) do
            local v1379 = v1372[v1378];
            if v1379 then
                if l_type_0(v1379) == "table" then
                    local v1380 = v1372[v1378][1] == true and 1 or v1372[v1378][1] == false and 2 or 0;
                    for v1381, v1382 in l_ipairs_0(v1379) do
                        local v1383 = l_type_0(v1382);
                        if v1383 ~= "boolean" or v1381 ~= 1 then
                            if v1380 ~= 2 then
                                if v1383 == "table" then
                                    v33.move(v1382, 1, #v1382, #v1374 + 1, v1374);
                                else
                                    local v1384 = #v1374;
                                    local v1385 = v1384 + 1;
                                    local v1386 = v1384 + 2;
                                    local v1387 = v1384 + 3;
                                    local v1388 = "\r";
                                    local v1389 = l_tostring_0(v1382);
                                    v1374[v1387] = "\f";
                                    v1374[v1386] = v1389;
                                    v1374[v1385] = v1388;
                                end;
                            end;
                            if v1380 ~= 1 then
                                if v1383 == "table" then
                                    for v1390 = 1, #v1382 do
                                        local v1391 = #v1375;
                                        local v1392 = v1391 + 1;
                                        local v1393 = v1391 + 2;
                                        local v1394 = v1382[v1390];
                                        v1375[v1393] = "\aDEFAULT";
                                        v1375[v1392] = v1394;
                                    end;
                                else
                                    local v1395 = #v1375;
                                    local v1396 = v1395 + 1;
                                    local v1397 = v1395 + 2;
                                    local v1398 = v1395 + 3;
                                    local v1399 = "\aE6E6E660";
                                    local v1400 = l_tostring_0(v1382);
                                    v1375[v1398] = "\aDEFAULT";
                                    v1375[v1397] = v1400;
                                    v1375[v1396] = v1399;
                                end;
                            end;
                        end;
                    end;
                else
                    local v1401 = #v1374;
                    local v1402 = #v1375;
                    local v1403 = v1401 + 1;
                    local v1404 = v1401 + 2;
                    local v1405 = v1401 + 3;
                    local v1406 = "\a808080";
                    local v1407 = l_tostring_0(v1379);
                    v1374[v1405] = "\aDEFAULT";
                    v1374[v1404] = v1407;
                    v1374[v1403] = v1406;
                    v1403 = v1402 + 1;
                    v1404 = v1402 + 2;
                    v1405 = "\aE6E6E660";
                    v1375[v1404] = l_tostring_0(v1379);
                    v1375[v1403] = v1405;
                end;
            end;
        end;
        if v1373 and v33.maxn(v1373) > 0 then
            v1374[#v1374 + 1] = "  \f~\aDEFAULT  ";
            for v1408 = 1, v33.maxn(v1373) do
                local v1409 = v1373[v1408];
                if v1409 then
                    if l_type_0(v1409) == "table" then
                        for _, v1411 in l_ipairs_0(v1409) do
                            local v1412 = l_type_0(v1411);
                            if v1412 == "table" then
                                v1374[#v1374 + 1] = "\aAAAAAAFF";
                                v33.move(v1411, 1, #v1411, #v1374 + 1, v1374);
                            else
                                local v1413 = #v1374;
                                local v1414 = v1413 + 1;
                                local v1415 = v1413 + 2;
                                local v1416 = "\a707070FF";
                                v1374[v1415] = v1412 == "string" and v1411 or l_tostring_0(v1411);
                                v1374[v1414] = v1416;
                            end;
                            v1374[#v1374 + 1] = "\aDEFAULT";
                        end;
                    else
                        local v1417 = #v1374;
                        local v1418 = v1417 + 1;
                        local v1419 = v1417 + 2;
                        local v1420 = v1417 + 3;
                        local v1421 = "\a707070FF";
                        local v1422 = l_tostring_0(v1409);
                        v1374[v1420] = "\aDEFAULT";
                        v1374[v1419] = v1422;
                        v1374[v1418] = v1421;
                    end;
                    if v1408 < #v1373 then
                        v1374[#v1374 + 1] = "\a707070FF, \aDEFAULT";
                    end;
                end;
            end;
        end;
        v1370(v1371, v33.concat(v1374), v33.concat(v1375));
    end;
    l_v953_1 = {
        enemy_shot = {
            call = function(v1424)
                -- upvalues: l_v925_2 (ref), v1423 (ref), l_color_0 (ref), v35 (ref), v386 (ref)
                if not l_v925_2.aa.value or v1424.damaged then
                    return;
                else
                    v1423({
                        event = "evaded", 
                        color = l_color_0("b0e2ff")
                    }, {
                        [1] = {
                            [1] = true, 
                            [2] = "evaded ", 
                            [3] = {
                                v1424.attacker:get_name()
                            }
                        }, 
                        [2] = {
                            [1] = false, 
                            [2] = "Evaded ", 
                            [3] = {
                                v35.limit(v1424.attacker:get_name(), 20, true)
                            }
                        }, 
                        [3] = {
                            [1] = "'s shot"
                        }
                    }, {
                        [1] = {
                            [1] = "state: ", 
                            [2] = {
                                [1] = v386.states[v1424.last_state][1]
                            }
                        }
                    });
                    return;
                end;
            end
        }, 
        player_hurt = {
            given = function(v1425, v1426, _)
                -- upvalues: l_v925_2 (ref), v33 (ref), l_v763_4 (ref), v35 (ref), v1423 (ref), l_color_0 (ref)
                if not l_v925_2.h.value then
                    return;
                elseif not v33.find(l_v763_4, v1425.weapon) and v1425.weapon ~= "knife" then
                    return;
                else
                    local v1428 = v1425.health == 0;
                    local v1429 = "a " .. v1425.weapon;
                    if v1425.weapon == "hegrenade" then
                        v1429 = "an HE grenade";
                    end;
                    local v1430 = v35.gsub(v1426:get_name(), "\n", "");
                    local v1431 = v1425.weapon == "inferno";
                    local v1432 = v1428 and "Killed" or "Hurt";
                    if v1428 and v1425.weapon == "hegrenade" then
                        v1432 = "Exploded";
                    elseif v1428 and v1425.weapon == "knife" then
                        v1432 = "Stabbed";
                    elseif v1431 then
                        v1432 = "Burnt";
                    end;
                    v1423({
                        event = v1431 and "fire" or "hit", 
                        color = l_color_0("A3D350"), 
                        data = v1431 and {
                            [1] = v1425.dmg_health
                        } or nil
                    }, {
                        [1] = {
                            [1] = true, 
                            [2] = nil, 
                            [3] = " ", 
                            [2] = v35.lower(v1432), 
                            [4] = {
                                [1] = v1430
                            }
                        }, 
                        [2] = {
                            [1] = false, 
                            [2] = nil, 
                            [3] = " ", 
                            [2] = v1432, 
                            [4] = {
                                v35.limit(v1430, 20, true)
                            }
                        }, 
                        [3] = not v1428 and {
                            [1] = true, 
                            [2] = " for ", 
                            [3] = {
                                [1] = nil, 
                                [2] = " hp", 
                                [1] = v1425.dmg_health
                            }
                        } or nil, 
                        [4] = not v1428 and {
                            [1] = false, 
                            [2] = " for ", 
                            [3] = {
                                [1] = v1431 and "%s" or v1425.dmg_health
                            }
                        } or nil, 
                        [5] = v1428 and v1432 == "Burnt" and {
                            [1] = " to ", 
                            [2] = {
                                [1] = "death"
                            }
                        } or nil, 
                        [6] = (not (v1432 ~= "Killed") or v1432 == "Hurt") and {
                            [1] = true, 
                            [2] = " with ", 
                            [3] = {
                                [1] = v1429
                            }
                        } or nil
                    });
                    return;
                end;
            end, 
            taken = function(v1433, v1434, v1435)
                -- upvalues: l_v925_2 (ref), v405 (ref), v35 (ref), v1423 (ref), l_color_0 (ref)
                if not l_v925_2.t.value then
                    return;
                else
                    local v1436 = v1434 == v1435 or v1435 == 0;
                    local v1437 = v1433.health == 0;
                    local l_weapon_0 = v1433.weapon;
                    local l_dmg_health_0 = v1433.dmg_health;
                    local v1440 = v405.hitgroups[v1433.hitgroup] or "generic";
                    local v1441 = l_weapon_0 == "inferno";
                    local v1442 = v1437 and "Killed by" or "Hurt by";
                    local v1443 = v1437 and "killed" or "hurt";
                    if v1437 and l_weapon_0 == "hegrenade" then
                        local v1444 = "Exploded by";
                        v1443 = "exploded";
                        v1442 = v1444;
                    elseif v1437 and l_weapon_0 == "knife" then
                        local v1445 = "Stabbed by";
                        v1443 = "stabbed";
                        v1442 = v1445;
                    elseif v1441 then
                        local v1446 = "Burnt by";
                        v1443 = "burnt";
                        v1442 = v1446;
                    end;
                    v1435 = v1435 ~= 0 and v35.gsub(v1435:get_name(), "\n", "") or "world";
                    v1423({
                        event = v1441 and "burnt" or "hurt", 
                        color = l_color_0("ff7070"), 
                        data = v1441 and {
                            [1] = v1433.dmg_health
                        } or nil
                    }, {
                        [1] = v1436 and {
                            [1] = true, 
                            [2] = nil, 
                            [3] = " ", 
                            [4] = nil, 
                            [5] = " ", 
                            [2] = {
                                [1] = "you"
                            }, 
                            [4] = v1443
                        } or {
                            [1] = true, 
                            [2] = nil, 
                            [3] = " ", 
                            [2] = v35.lower(v1442)
                        }, 
                        [2] = v1436 and {
                            [1] = false, 
                            [2] = nil, 
                            [3] = " ", 
                            [4] = nil, 
                            [5] = " ", 
                            [2] = {
                                [1] = "You"
                            }, 
                            [4] = v1443
                        } or {
                            [1] = false, 
                            [2] = nil, 
                            [3] = " ", 
                            [2] = v1442
                        }, 
                        [3] = {
                            [1] = true, 
                            [2] = v1436 and {
                                [1] = "yourself"
                            } or {
                                [1] = v1435
                            }
                        }, 
                        [4] = {
                            [1] = false, 
                            [2] = v1436 and {
                                [1] = "yourself"
                            } or {
                                v35.limit(v1435, 20, true)
                            }
                        }, 
                        [5] = not v1436 and v1440 ~= "generic" and {
                            [1] = " in ", 
                            [2] = {
                                [1] = v1440
                            }
                        } or nil, 
                        [6] = not v1437 and {
                            [1] = true, 
                            [2] = " for ", 
                            [3] = {
                                [1] = nil, 
                                [2] = " hp", 
                                [1] = l_dmg_health_0
                            }
                        } or nil, 
                        [7] = not v1437 and {
                            [1] = false, 
                            [2] = " for ", 
                            [3] = {
                                [1] = v1441 and "%s" or l_dmg_health_0
                            }
                        } or nil
                    });
                    return;
                end;
            end, 
            call = function(v1447)
                -- upvalues: l_v953_1 (ref), v502 (ref)
                local l_player_hurt_0 = l_v953_1.player_hurt;
                local v1449 = entity.get(v1447.userid, true);
                local v1450 = v1447.attacker ~= 0 and entity.get(v1447.attacker, true) or 0;
                if v1450 == v502.self and v1449 ~= v502.self then
                    l_player_hurt_0.given(v1447, v1449, v1450);
                elseif v1449 == v502.self then
                    l_player_hurt_0.taken(v1447, v1449, v1450);
                end;
            end
        }, 
        aim_ack = {
            hit = function(v1451)
                -- upvalues: l_v925_2 (ref), v502 (ref), v35 (ref), v405 (ref), v1423 (ref), l_color_0 (ref), v183 (ref), v34 (ref)
                if not l_v925_2.h.value then
                    return;
                else
                    local v1452 = not v1451.target:is_alive();
                    local v1453 = "Hit";
                    if not v1451.target:is_alive() then
                        v1453 = v502.weapon and v502.weapon.m_iItemDefinitionIndex == 31 and "Tased" or "Killed";
                    end;
                    local v1454 = v35.gsub(v1451.target:get_name(), "\n", "");
                    local v1455 = v405.hitgroups[v1451.hitgroup];
                    local v1456 = v405.hitgroups[v1451.wanted_hitgroup];
                    local v1457 = not v1452 and v1451.hitgroup ~= v1451.wanted_hitgroup;
                    local v1458 = not v1452 and v1451.wanted_damage - v1451.damage > 10;
                    local v1459 = nil;
                    if v1458 and v1457 and v1456 then
                        v1459 = {
                            [1] = nil, 
                            [2] = "-", 
                            [1] = v1456, 
                            [3] = v1451.wanted_damage
                        };
                    elseif v1458 then
                        v1459 = {
                            [1] = nil, 
                            [2] = " hp", 
                            [1] = v1451.wanted_damage
                        };
                    end;
                    local l_v1423_0 = v1423;
                    local v1461 = {
                        event = "hit", 
                        color = l_color_0("cded74")
                    };
                    local v1462 = {
                        [1] = {
                            [1] = true, 
                            [2] = nil, 
                            [3] = " ", 
                            [2] = v35.lower(v1453), 
                            [4] = {
                                [1] = v1454
                            }
                        }, 
                        [2] = {
                            [1] = false, 
                            [2] = nil, 
                            [3] = " ", 
                            [2] = v1453, 
                            [4] = {
                                v35.limit(v1454, 20, true)
                            }
                        }, 
                        [3] = v1455 and v1455 ~= "generic" and {
                            [1] = v1453 == "Hit" and "'s " or " in ", 
                            [2] = {
                                [1] = v1455
                            }
                        } or nil, 
                        [4] = v1457 and {
                            [1] = "\aD59A4DFF!\r"
                        } or nil, 
                        [5] = not v1452 and {
                            [1] = true, 
                            [2] = " for ", 
                            [3] = {
                                [1] = nil, 
                                [2] = " hp", 
                                [1] = v1451.damage
                            }
                        } or nil, 
                        [6] = not v1452 and {
                            [1] = false, 
                            [2] = " for ", 
                            [3] = {
                                [1] = v1451.damage
                            }
                        } or nil, 
                        [7] = v1458 and {
                            [1] = "\aD59A4DFF!\r"
                        } or nil
                    };
                    local v1463 = {};
                    local v1464;
                    if v1459 then
                        v1464 = {
                            [1] = "exp: ", 
                            [2] = v1459
                        };
                    else
                        v1464 = v1459;
                    end;
                    v1463[1] = v1464;
                    v1463[2] = v1451.backtrack ~= 0 and {
                        [1] = "bt: ", 
                        [2] = {
                            [1] = nil, 
                            [2] = "t", 
                            [1] = v1451.backtrack
                        }
                    } or nil;
                    v1463[3] = v183.rage.selection.hitchance:get() - v1451.hitchance > 5 and {
                        [1] = "hc: ", 
                        [2] = nil, 
                        [3] = "\226\174\159", 
                        [2] = {
                            [1] = nil, 
                            [2] = "%", 
                            [1] = v34.floor(v1451.hitchance)
                        }
                    } or nil;
                    l_v1423_0(v1461, v1462, v1463);
                    return;
                end;
            end, 
            miss = function(v1465)
                -- upvalues: l_v925_2 (ref), v35 (ref), v405 (ref), v1423 (ref), l_color_0 (ref), v183 (ref)
                if not l_v925_2.m.value then
                    return;
                else
                    local v1466 = "Missed";
                    local v1467 = v35.gsub(v1465.target:get_name(), "\n", "");
                    local v1468 = v405.hitgroups[v1465.wanted_hitgroup];
                    local l_state_0 = v1465.state;
                    if l_state_0 == "prediction error" and v1465.backtrack > 2 then
                        l_state_0 = "unpredicted occasion";
                    elseif l_state_0 == "spread" and v1465.spread < 0.1 then
                        l_state_0 = "occlusion";
                    elseif l_state_0 == "correction" then
                        l_state_0 = "resolver";
                    end;
                    v1423({
                        event = "miss", 
                        color = l_color_0("d9b0ff")
                    }, {
                        [1] = {
                            [1] = true, 
                            [2] = nil, 
                            [3] = " ", 
                            [2] = v35.lower(v1466), 
                            [4] = {
                                [1] = v1467
                            }
                        }, 
                        [2] = {
                            [1] = false, 
                            [2] = nil, 
                            [3] = " ", 
                            [2] = v1466, 
                            [4] = {
                                v35.limit(v1467, 20, true)
                            }
                        }, 
                        [3] = v1468 and {
                            [1] = "'s ", 
                            [2] = {
                                [1] = v1468
                            }
                        }, 
                        [4] = {
                            [1] = " due to ", 
                            [2] = {
                                [1] = l_state_0
                            }
                        }
                    }, {
                        [1] = v1465.backtrack ~= 0 and {
                            [1] = "\206\148: ", 
                            [2] = {
                                [1] = nil, 
                                [2] = "t", 
                                [1] = v1465.backtrack
                            }
                        } or nil, 
                        [2] = v1465.spread and {
                            [1] = "\226\136\160: ", 
                            [2] = {
                                ("%.2f\194\186"):format(v1465.spread)
                            }
                        } or nil, 
                        [3] = v183.rage.selection.hitchance:get() - v1465.hitchance > 5 and {
                            [1] = "hc: ", 
                            [2] = {
                                [1] = nil, 
                                [2] = "%", 
                                [1] = v1465.hitchance
                            }
                        } or nil
                    });
                    return;
                end;
            end, 
            call = function(v1470)
                -- upvalues: l_v953_1 (ref)
                local l_aim_ack_0 = l_v953_1.aim_ack;
                if v1470.state then
                    l_aim_ack_0.miss(v1470);
                else
                    l_aim_ack_0.hit(v1470);
                end;
            end
        }, 
        round_start = {
            call = function(_)
                -- upvalues: l_v952_0 (ref)
                l_v952_0.round = entity.get_game_rules().m_totalRoundsPlayed;
            end
        }, 
        ab_set = {
            call = function(v1473)
                -- upvalues: l_v925_2 (ref), v1423 (ref), l_color_0 (ref), v35 (ref)
                if not l_v925_2.ab.value then
                    return;
                else
                    if v1473.set then
                        v1423({
                            event = "ab", 
                            color = l_color_0("b0bdff")
                        }, {
                            [1] = {
                                [1] = true, 
                                [2] = {
                                    [1] = "anti-brute "
                                }
                            }, 
                            [2] = {
                                [1] = false, 
                                [2] = "Anti-brute "
                            }, 
                            [3] = v1473.mode == "Adjust" and {
                                [1] = "weight: ", 
                                [2] = {
                                    v35.format("%.2f", v1473.weight)
                                }
                            } or {
                                [1] = "config: ", 
                                [2] = {
                                    v35.limit(v1473.config, 16, true)
                                }
                            }
                        }, {
                            [1] = v1473.trigger and {
                                [1] = "reason: ", 
                                [2] = {
                                    [1] = v1473.trigger
                                }
                            } or nil
                        });
                    else
                        v1423({
                            event = "ab", 
                            color = l_color_0("b0bdff")
                        }, {
                            [1] = {
                                [1] = true, 
                                [2] = {
                                    [1] = "anti-brute "
                                }
                            }, 
                            [2] = {
                                [1] = false, 
                                [2] = "Anti-brute "
                            }, 
                            [3] = {
                                [1] = {
                                    [1] = "reset"
                                }
                            }
                        }, {
                            [1] = v1473.trigger and {
                                [1] = "reason: ", 
                                [2] = {
                                    [1] = v1473.trigger
                                }
                            } or nil
                        });
                    end;
                    return;
                end;
            end
        }
    };
    l_v925_2:set_callback(function(v1474)
        -- upvalues: l_next_0 (ref), l_v953_1 (ref), v185 (ref), v183 (ref)
        for v1475, v1476 in l_next_0, l_v953_1 do
            v185[v1475](v1476.call, v1474.value);
        end;
        v183.misc.other.eventlog:override(v1474.value and {} or nil);
    end, true);
    v183.misc.other.eventlog:depend(true, {
        [1] = nil, 
        [2] = false, 
        [1] = l_v925_2
    });
end;
v761 = nil;
v761 = {};
v761.aspect = {
    active = false, 
    value = v227.x / v227.y, 
    init = v227.x / v227.y, 
    work = function()
        -- upvalues: v761 (ref), v510 (ref), v250 (ref), v185 (ref)
        local l_aspect_0 = v761.aspect;
        local l_aspect_1 = v510.settings.aspect;
        if l_aspect_1.value then
            local v1479 = l_aspect_1.ratio.value * 0.01;
            l_aspect_0.value = v250.lerp(l_aspect_0.value, v1479, 8, 0.001);
            l_aspect_0.active = v1479 ~= l_aspect_0.value;
            cvar.r_aspectratio:float(l_aspect_0.value);
            if v1479 == l_aspect_0.value then
                v185.render:unset(l_aspect_0.work);
            end;
        else
            l_aspect_0.value = v250.lerp(l_aspect_0.value, l_aspect_0.init);
            cvar.r_aspectratio:float(l_aspect_0.value);
            if l_aspect_0.value == l_aspect_0.init then
                v185.render:unset(l_aspect_0.work);
                cvar.r_aspectratio:float(0);
                l_aspect_0.active = false;
            end;
        end;
    end, 
    activate = function()
        -- upvalues: v761 (ref), v510 (ref), v185 (ref)
        local l_aspect_2 = v761.aspect;
        local l_aspect_3 = v510.settings.aspect;
        if not l_aspect_2.active and not l_aspect_3.value and l_aspect_2.value == l_aspect_2.init then
            return;
        else
            if not l_aspect_2.active then
                v185.render:set(l_aspect_2.work);
                l_aspect_2.active = true;
            end;
            return;
        end;
    end, 
    run = function()
        -- upvalues: v761 (ref), v510 (ref), v185 (ref)
        local l_aspect_4 = v761.aspect;
        local l_aspect_5 = v510.settings.aspect;
        l_aspect_5:set_callback(l_aspect_4.activate, true);
        l_aspect_5.ratio:set_callback(l_aspect_4.activate);
        v185.shutdown:set(function()
            cvar.r_aspectratio:float(0);
        end);
    end
};
v761.viewmodel = {
    active = false, 
    was_active = false, 
    value = {}, 
    init = {}, 
    e_names = {
        [1] = "fov", 
        [2] = "x", 
        [3] = "y", 
        [4] = "z"
    }, 
    e_cvars = {
        [1] = "fov", 
        [2] = "offset_x", 
        [3] = "offset_y", 
        [4] = "offset_z"
    }, 
    restore = function()
        -- upvalues: v761 (ref)
        local l_viewmodel_0 = v761.viewmodel;
        cvar.viewmodel_fov:float(l_viewmodel_0.init.fov, true);
        cvar.viewmodel_offset_x:float(l_viewmodel_0.init.x, true);
        cvar.viewmodel_offset_y:float(l_viewmodel_0.init.y, true);
        cvar.viewmodel_offset_z:float(l_viewmodel_0.init.z, true);
        l_viewmodel_0.was_active = false;
    end, 
    update = function()
        -- upvalues: v761 (ref), l_ipairs_0 (ref)
        local l_viewmodel_1 = v761.viewmodel;
        for v1486, v1487 in l_ipairs_0(l_viewmodel_1.e_names) do
            if not l_viewmodel_1.active then
                l_viewmodel_1.init[v1487] = cvar["viewmodel_" .. l_viewmodel_1.e_cvars[v1486]]:float();
            end;
            l_viewmodel_1.value[v1487] = l_viewmodel_1.init[v1487];
        end;
    end, 
    work = function()
        -- upvalues: v761 (ref), v510 (ref), v250 (ref), v185 (ref)
        local l_viewmodel_2 = v761.viewmodel;
        local l_viewmodel_3 = v510.settings.viewmodel;
        if not l_viewmodel_2.active then
            return;
        else
            if l_viewmodel_3.value then
                l_viewmodel_2.was_active = true;
                local v1490 = {};
                local v1491 = true;
                for v1492 = 1, #l_viewmodel_2.e_names do
                    local v1493 = l_viewmodel_2.e_names[v1492];
                    v1490[v1493] = l_viewmodel_3[v1493].value * (v1493 == "fov" and 1 or 0.1);
                    l_viewmodel_2.value[v1493] = v250.lerp(l_viewmodel_2.value[v1493], v1490[v1493]);
                    if l_viewmodel_2.value[v1493] ~= v1490[v1493] then
                        v1491 = false;
                    end;
                    cvar["viewmodel_" .. l_viewmodel_2.e_cvars[v1492]]:float(l_viewmodel_2.value[v1493], true);
                end;
                l_viewmodel_2.active = not v1491;
                if v1491 then
                    v185.render:unset(l_viewmodel_2.work);
                end;
            else
                local v1494 = true;
                for v1495 = 1, #l_viewmodel_2.e_names do
                    local v1496 = l_viewmodel_2.e_names[v1495];
                    l_viewmodel_2.value[v1496] = v250.lerp(l_viewmodel_2.value[v1496], l_viewmodel_2.init[v1496]);
                    if l_viewmodel_2.value[v1496] ~= l_viewmodel_2.init[v1496] then
                        v1494 = false;
                    end;
                    cvar["viewmodel_" .. l_viewmodel_2.e_cvars[v1495]]:float(l_viewmodel_2.value[v1496], true);
                end;
                if v1494 then
                    v185.render:unset(l_viewmodel_2.work);
                    l_viewmodel_2.restore();
                    l_viewmodel_2.active = false;
                end;
            end;
            return;
        end;
    end, 
    activate = function()
        -- upvalues: v761 (ref), v510 (ref), v185 (ref)
        local l_viewmodel_4 = v761.viewmodel;
        if not v510.settings.viewmodel.value and not l_viewmodel_4.was_active then
            return;
        else
            if not l_viewmodel_4.active then
                v185.render:set(l_viewmodel_4.work);
                l_viewmodel_4.active = true;
            end;
            return;
        end;
    end, 
    run = function(v1498)
        -- upvalues: v510 (ref), l_next_0 (ref), v185 (ref)
        local l_viewmodel_5 = v510.settings.viewmodel;
        v1498.update();
        l_viewmodel_5:set_callback(v1498.activate, true);
        l_viewmodel_5.res:set_callback(function()
            -- upvalues: l_viewmodel_5 (ref), v1498 (ref)
            l_viewmodel_5.fov:set(v1498.init.fov);
            l_viewmodel_5.x:set(v1498.init.x * 10);
            l_viewmodel_5.y:set(v1498.init.y * 10);
            l_viewmodel_5.z:set(v1498.init.z * 10);
        end);
        for _, v1501 in l_next_0, l_viewmodel_5[1] do
            v1501:set_callback(v1498.activate);
        end;
        v185.shutdown:set(v1498.restore);
    end
};
v761.marker = {
    list = {}, 
    duration = v510.settings.marker.dur.value * 0.1, 
    marker = function(v1502, v1503, v1504)
        -- upvalues: v249 (ref), v34 (ref), v761 (ref), v184 (ref), l_vector_0 (ref), v262 (ref)
        local v1505 = v1502.pos and v1502.pos:to_screen();
        if v1505 then
            v1505 = v1505 / v249.dpi;
            local v1506 = v1502.state == nil;
            local v1507 = 1 - v34.max((v1502.time - globals.realtime) / v761.marker.duration, 0);
            if v1504 then
                local v1508 = (v1506 and 32 or 16) * v1503;
                v249.circle(v1505, (v1506 and v184.accent or v184.black):alpha_modulate(1 - v1503, true), v1508);
            end;
            if v1506 then
                v249.shadow(v1505 - l_vector_0(1, 1), v1505 - l_vector_0(1, 1), v184.accent, 40);
                v249.texture(v262.bfly, v1505 - l_vector_0(5, 5), l_vector_0(9, 9), v184.accent);
            else
                v249.circle(v1505, v184.white:alpha_modulate(128), 2);
                v249.circle_outline(v1505, v184.white:alpha_modulate(0.5 - v1507, true), 24 * v1507, 0, 1, 1);
            end;
        end;
    end, 
    work = function()
        -- upvalues: v761 (ref), l_ipairs_0 (ref), v250 (ref), v249 (ref), v33 (ref)
        local l_marker_0 = v761.marker;
        for v1510, v1511 in l_ipairs_0(l_marker_0.list) do
            local v1512 = v1511.time > globals.realtime;
            local v1513 = v250.condition(v1511.progress, v1512, {
                [1] = 3, 
                [2] = -4
            }, {
                [1] = {
                    [1] = 1, 
                    [2] = 4
                }, 
                [2] = {
                    [1] = 3, 
                    [2] = 4
                }
            });
            v249.push_alpha(v1513);
            l_marker_0.marker(v1511, v1513, v1512);
            v249.pop_alpha();
            if not v1512 and v1513 == 0 then
                v33.remove(l_marker_0.list, v1510);
            end;
        end;
    end, 
    append = function(v1514)
        -- upvalues: v761 (ref), v510 (ref), v33 (ref)
        local l_marker_1 = v761.marker;
        local l_marker_2 = v510.settings.marker;
        if not v1514.state and not l_marker_2.hit.value or v1514.state and not l_marker_2.miss.value then
            return;
        else
            v33.insert(l_marker_1.list, 1, {
                state = v1514.state, 
                pos = v1514.aim, 
                damage = v1514.damage, 
                time = globals.realtime + l_marker_1.duration, 
                progress = {
                    [1] = 0
                }
            });
            return;
        end;
    end, 
    run = function(v1517)
        -- upvalues: v510 (ref), v185 (ref), v183 (ref), v174 (ref), v33 (ref)
        local l_marker_3 = v510.settings.marker;
        l_marker_3:set_callback(function(v1519)
            -- upvalues: v185 (ref), v1517 (ref), v183 (ref), v174 (ref), v33 (ref)
            v185.aim_ack(v1517.append, v1519.value);
            v185.render(v1517.work, v1519.value);
            v183.world.other.hitmarker:override(v174(v1519.value, false, nil));
            if not v1519.value then
                v33.clear(v1517.list);
            end;
        end, true);
        l_marker_3.dur:set_callback(function(v1520)
            -- upvalues: v1517 (ref)
            v1517.duration = v1520.value * 0.1;
        end);
        v183.world.other.hitmarker:depend(true, {
            [1] = nil, 
            [2] = false, 
            [1] = l_marker_3
        });
    end
};
v761.console = {
    alpha = 0, 
    overridden = false, 
    names = {
        [1] = "vgui_white", 
        [2] = "vgui/hud/800corner1", 
        [3] = "vgui/hud/800corner2", 
        [4] = "vgui/hud/800corner3", 
        [5] = "vgui/hud/800corner4"
    }, 
    cached = {}, 
    progress = {
        [1] = 0
    }, 
    in_console = utils.get_vfunc("client.dll", "GameConsole004", 5, "bool(__thiscall*)(void*)"), 
    is_cursor_locked = utils.get_vfunc("vguimatsurface.dll", "VGUI_Surface031", 58, "bool(__thiscall*)(void*)"), 
    work = function()
        -- upvalues: v761 (ref), v510 (ref), l_ipairs_0 (ref)
        local l_console_0 = v761.console;
        local l_vgui_0 = v510.settings.vgui;
        if l_vgui_0.value and (l_console_0.is_cursor_locked() or l_console_0.in_console()) then
            for _, v1524 in l_ipairs_0(l_console_0.cached) do
                v1524:color_modulate(l_vgui_0.color.value);
                v1524:alpha_modulate(l_console_0.alpha * (l_vgui_0.color.value.a / 255));
            end;
            l_console_0.overridden = true;
        elseif l_console_0.overridden then
            l_console_0.restore();
            local v1525 = false;
            l_console_0.progress = {
                [1] = 0
            };
            l_console_0.overridden = v1525;
        end;
    end, 
    alphen = function()
        -- upvalues: v761 (ref), v250 (ref)
        local l_console_1 = v761.console;
        l_console_1.alpha = v250.condition(l_console_1.progress, l_console_1.is_cursor_locked() or l_console_1.in_console(), 3);
    end, 
    restore = function()
        -- upvalues: l_ipairs_0 (ref), v761 (ref), l_color_0 (ref)
        for _, v1528 in l_ipairs_0(v761.console.cached) do
            v1528:color_modulate(l_color_0());
            v1528:alpha_modulate(1);
        end;
    end, 
    run = function(v1529)
        -- upvalues: v510 (ref), l_ipairs_0 (ref), v185 (ref)
        local l_vgui_1 = v510.settings.vgui;
        for _, v1532 in l_ipairs_0(v1529.names) do
            materials.get_materials(v1532, false, function(v1533)
                -- upvalues: v1529 (ref)
                v1529.cached[#v1529.cached + 1] = v1533;
            end);
        end;
        l_vgui_1:set_callback(function(v1534)
            -- upvalues: v185 (ref), v1529 (ref)
            v185.pre_render(v1529.alphen, v1534.value);
            v185.pre_render(v1529.work, v1534.value);
            if v1534.value then
                v1529.overridden = false;
            else
                v1529.restore();
            end;
        end, true);
        l_vgui_1.color:set_callback(function(_)
            -- upvalues: v1529 (ref), l_vgui_1 (ref)
            v1529.overridden = not l_vgui_1.value;
        end);
        v185.shutdown:set(v1529.restore);
    end
};
v761.nadius = {
    inferno = {
        list = {}, 
        gather = function(v1536)
            -- upvalues: v502 (ref), l_vector_0 (ref), l_next_0 (ref)
            entity.get_entities("CInferno", nil, function(v1537)
                -- upvalues: v502 (ref), v1536 (ref), l_vector_0 (ref)
                local l_m_vecOrigin_0 = v1537.m_vecOrigin;
                local v1539 = v1537:get_index();
                if cvar.mp_friendlyfire:int() == 0 and v502.valid then
                    local v1540 = v1537 and v1537.m_hOwnerEntity;
                    if v1540 and v502.self ~= v1540 and v502.self.m_iTeamNum == v1540.m_iTeamNum then
                        return;
                    end;
                end;
                v1536.list[v1539] = v1536.list[v1539] or {
                    [0] = {
                        [1] = 0, 
                        [2] = true, 
                        [3] = v1537.m_nFireEffectTickBegin
                    }, 
                    [1] = {
                        [1] = l_m_vecOrigin_0, 
                        [2] = {
                            [1] = 0, 
                            [2] = true
                        }
                    }
                };
                local v1541 = v1536.list[v1539];
                for v1542 = 0, v1537.m_fireCount - 1 do
                    local v1543 = v1542 + 1;
                    v1541[v1543] = v1541[v1543] or {
                        [1] = l_m_vecOrigin_0 + l_vector_0(v1537.m_fireXDelta[v1542], v1537.m_fireYDelta[v1542], v1537.m_fireZDelta[v1542]), 
                        [2] = {
                            [1] = 0, 
                            [2] = false
                        }
                    };
                    v1541[v1543][2][2] = v1537.m_bFireIsBurning[v1542];
                end;
            end);
            for v1544, v1545 in l_next_0, v1536.list do
                local v1546 = entity.get(v1544);
                if not v1546 or v1546:get_classname() ~= "CInferno" then
                    v1545[0][2] = false;
                end;
            end;
        end, 
        draw = function(v1547)
            -- upvalues: v510 (ref), l_next_0 (ref), v250 (ref), v502 (ref), v249 (ref)
            local l_value_5 = v510.settings.nadius.fire.color.value;
            for v1549, v1550 in l_next_0, v1547.list do
                local v1551 = v250.condition(v1550[0], v1550[0][2], 3);
                local v1552 = 1 - (globals.tickcount - v1550[0][3]) / to_ticks(7);
                for v1553 = 1, #v1550 do
                    local v1554 = v1550[v1553];
                    local v1555 = v250.condition(v1554[2], v1554[2][2] and v502.origin:dist(v1554[1]) < 576, 3);
                    if v1555 > 0 then
                        if v1553 == 1 then
                            v249.circle_3d_gradient(v1554[1], l_value_5:alpha_modulate(v1551 * v1555 * 0.6, true), l_value_5:alpha_modulate(0), 70 * v1555, 0, 1);
                            v249.circle_3d_outline(v1554[1], l_value_5:alpha_modulate(v1551 * v1555, true), 70 * v1555, 0, v1552, 4);
                        else
                            v249.circle_3d(v1554[1], l_value_5:alpha_modulate(v1551 * v1555 * 0.5, true), 70 * v1555, 0, 1);
                        end;
                    end;
                end;
                if v1551 == 0 and not v1550[0][2] then
                    v1547.list[v1549] = nil;
                end;
            end;
        end
    }, 
    smoke = {
        list = {}, 
        gather = function(v1556)
            -- upvalues: l_next_0 (ref)
            entity.get_entities("CSmokeGrenadeProjectile", nil, function(v1557)
                -- upvalues: v1556 (ref)
                if not v1557.m_bDidSmokeEffect then
                    return;
                else
                    local v1558 = v1557:get_index();
                    v1556.list[v1558] = v1556.list[v1558] or {
                        [1] = v1557.m_vecOrigin, 
                        [2] = {
                            [1] = 0, 
                            [2] = true
                        }, 
                        [3] = v1557.m_nSmokeEffectTickBegin
                    };
                    return;
                end;
            end);
            for v1559, v1560 in l_next_0, v1556.list do
                local v1561 = entity.get(v1559);
                if not v1561 or v1561:get_classname() ~= "CSmokeGrenadeProjectile" then
                    v1560[2][2] = false;
                end;
            end;
        end, 
        draw = function(v1562)
            -- upvalues: v510 (ref), l_next_0 (ref), v250 (ref), v502 (ref), v249 (ref)
            local l_value_6 = v510.settings.nadius.smoke.color.value;
            for v1564, v1565 in l_next_0, v1562.list do
                local v1566 = 1 - (globals.tickcount - v1565[3]) / to_ticks(18);
                local v1567 = v250.condition(v1565[2], v1565[2][2] and v502.origin:dist(v1565[1]) < 576, 3);
                v249.circle_3d(v1565[1], l_value_6:alpha_modulate(v1567, true), 150 * v1567, 0, 1);
                v249.circle_3d_outline(v1565[1], l_value_6:alpha_modulate(v1567 * 255), 150 * v1567, 0, v1566, 3);
                if v1567 == 0 and not v1565[2][2] then
                    v1562.list[v1564] = nil;
                end;
            end;
        end
    }, 
    gather = function()
        -- upvalues: v761 (ref)
        local l_nadius_0 = v761.nadius;
        l_nadius_0.inferno:gather();
        l_nadius_0.smoke:gather();
    end, 
    draw = function()
        -- upvalues: v761 (ref), v510 (ref), v502 (ref)
        local l_nadius_1 = v761.nadius;
        local l_nadius_2 = v510.settings.nadius;
        if not v502.origin then
            return;
        elseif not globals.is_in_game then
            return l_nadius_1.clear();
        else
            if l_nadius_2.fire.value then
                l_nadius_1.inferno:draw();
            end;
            if l_nadius_2.smoke.value then
                l_nadius_1.smoke:draw();
            end;
            return;
        end;
    end, 
    clear = function()
        -- upvalues: v761 (ref)
        local l_inferno_0 = v761.nadius.inferno;
        local l_smoke_0 = v761.nadius.smoke;
        local v1573 = {};
        l_smoke_0.list = {};
        l_inferno_0.list = v1573;
    end, 
    run = function(v1574)
        -- upvalues: v510 (ref), v185 (ref)
        v510.settings.nadius:set_callback(function(v1575)
            -- upvalues: v185 (ref), v1574 (ref)
            v185.net_update_end(v1574.gather, v1575.value);
            v185.pre_hud_render(v1574.draw, v1575.value);
            v185.round_poststart(v1574.clear, v1575.value);
            if not v1575.value then
                local l_inferno_1 = v1574.inferno;
                local l_smoke_1 = v1574.smoke;
                local v1578 = {};
                l_smoke_1.list = {};
                l_inferno_1.list = v1578;
            end;
        end, true);
    end
};
v761.scope = {
    progress = {
        [1] = 0
    }, 
    work = function()
        -- upvalues: v502 (ref), v250 (ref), v761 (ref), v510 (ref), v184 (ref), v249 (ref), l_vector_0 (ref), v228 (ref)
        if not v502.self or not v502.valid or not globals.is_in_game then
            return;
        else
            local v1579 = v250.condition(v761.scope.progress, v502.self.m_bIsScoped and not v502.in_score, {
                [1] = 2.5, 
                [2] = 6
            }, {
                [1] = {
                    [1] = 1, 
                    [2] = 4
                }, 
                [2] = {
                    [1] = 2, 
                    [2] = 2
                }
            });
            if v1579 == 0 then
                return;
            else
                local l_scope_0 = v510.settings.scope;
                local l_value_7 = l_scope_0.gap.value;
                local v1582 = (l_scope_0.gap.value + l_scope_0.size.value) * v1579;
                local v1583 = nil;
                if l_scope_0.clr.value == "Custom" then
                    local v1584 = l_scope_0.clr.color.value[1];
                    local v1585 = l_scope_0.clr.color.value[2];
                    if v1584 == "Fade" then
                        v1583 = {
                            v1585, 
                            v1585:alpha_modulate(0)
                        };
                    else
                        v1583 = {
                            [1] = v1585[1], 
                            [2] = v1585[2]
                        };
                    end;
                elseif l_scope_0.clr.value == "Accent" then
                    v1583 = {
                        v184.accent, 
                        v184.secondary:alpha_modulate(0)
                    };
                elseif l_scope_0.clr.value == "Accent inverted" then
                    v1583 = {
                        [1] = v184.accent:alpha_modulate(0), 
                        [2] = v184.secondary
                    };
                end;
                v249.push_alpha(v1579);
                v249.gradient(l_vector_0(v228.x + l_value_7, v228.y), l_vector_0(v228.x + v1582 + 1, v228.y + 1), v1583[1], v1583[2], v1583[1], v1583[2]);
                v249.gradient(l_vector_0(v228.x - l_value_7 + 1, v228.y), l_vector_0(v228.x - v1582, v228.y + 1), v1583[1], v1583[2], v1583[1], v1583[2]);
                v249.gradient(l_vector_0(v228.x, v228.y + l_value_7), l_vector_0(v228.x + 1, v228.y + v1582 + 1), v1583[1], v1583[1], v1583[2], v1583[2]);
                if not l_scope_0.t.value then
                    v249.gradient(l_vector_0(v228.x, v228.y - l_value_7 + 1), l_vector_0(v228.x + 1, v228.y - v1582), v1583[1], v1583[1], v1583[2], v1583[2]);
                end;
                v249.pop_alpha();
                return;
            end;
        end;
    end, 
    run = function(v1586)
        -- upvalues: v510 (ref), v185 (ref), v183 (ref)
        local l_scope_1 = v510.settings.scope;
        l_scope_1:set_callback(function(v1588)
            -- upvalues: v185 (ref), v1586 (ref), v183 (ref)
            v185.render(v1586.work, v1588.value);
            v183.world.main.zoom.scope:override(v1588.value and "Remove All" or nil);
        end, true);
        v183.world.main.zoom.scope:depend(true, {
            [1] = nil, 
            [2] = false, 
            [1] = l_scope_1
        });
    end
};
v761.breaker = {
    animlayer_t = ffi.typeof("struct { char pad_0x0000[0x18]; uint32_t sequence; float prev_cycle; float weight; float weight_delta_rate; float playback_rate; float cycle;void *entity;char pad_0x0038[0x4]; } **"), 
    work = function(v1589)
        -- upvalues: v761 (ref), v502 (ref), v510 (ref), v183 (ref)
        local l_breaker_0 = v761.breaker;
        local l_self_0 = v502.self;
        if not v502.valid or not l_self_0 then
            return;
        elseif v1589 ~= v502.self then
            return;
        else
            local v1592 = v502.self[0];
            local l_jumping_0 = v502.jumping;
            local v1594 = v510.settings.breaker[1];
            if l_jumping_0 then
                if v1594.air.value == "Static" then
                    l_self_0.m_flPoseParameter[6] = 1;
                elseif v1594.air.value == "Moonwalk" then
                    ffi.cast(l_breaker_0.animlayer_t, ffi.cast("uintptr_t", v1592) + 10640)[0][6].weight = 1;
                end;
            elseif v1594.legs.value == "Static" then
                v183.antiaim.misc.leg:override("Sliding");
                l_self_0.m_flPoseParameter[0] = 1;
            elseif v1594.legs.value == "Moonwalk" then
                v183.antiaim.misc.leg:override("Walking");
                l_self_0.m_flPoseParameter[7] = 0;
            end;
            if v1594.pitch.value then
                local v1595 = v502.self:get_anim_state();
                if not l_jumping_0 and v1595 and v1595.landing then
                    l_self_0.m_flPoseParameter[12] = 0.5;
                end;
            end;
            return;
        end;
    end, 
    run = function(v1596)
        -- upvalues: v510 (ref), v185 (ref), v183 (ref)
        v510.settings.breaker:set_callback(function(v1597)
            -- upvalues: v185 (ref), v1596 (ref), v183 (ref)
            v185.post_update_clientside_animation(v1596.work, v1597.value);
            if not v1597.value then
                v183.antiaim.misc.leg:override();
            end;
        end, true);
    end
};
for _, v1599 in l_next_0, v761 do
    if v1599 then
        v1599:run();
    end;
end;
v763 = nil;
v763 = {};
v763.teleport = {
    landing = function(v1600)
        -- upvalues: v502 (ref)
        local l_m_vecVelocity_1 = v502.self.m_vecVelocity;
        if l_m_vecVelocity_1.z >= 0 then
            return;
        else
            local v1602 = v502.self:get_origin();
            local v1603 = v502.extrapolate(v1602, l_m_vecVelocity_1, v1600);
            local v1604 = utils.trace_line(v1602, v1603, nil, nil, 0);
            return v1604 and v1604.fraction < 1;
        end;
    end, 
    defense = {
        check_weapon = function(v1605, v1606)
            -- upvalues: v510 (ref)
            if not v1606 then
                v1606 = v1605 and v1605:get_weapon_info();
            end;
            if not v1606 then
                return false;
            else
                local l_wpns_0 = v510.settings.teleport[1].wpns;
                local v1608 = v1605:get_weapon_index();
                local v1609 = v1608 == 1 or v1608 == 64;
                local l_weapon_type_0 = v1606.weapon_type;
                local l_full_auto_0 = v1606.full_auto;
                if l_weapon_type_0 == 9 or l_weapon_type_0 == 0 and not l_wpns_0:get("Melee") or v1609 and not l_wpns_0:get("Heavy pistols") or l_weapon_type_0 == 1 and not v1609 and not l_wpns_0:get("Pistols") then
                    return false;
                elseif l_full_auto_0 and l_weapon_type_0 ~= 1 and not l_wpns_0:get("Automatics") then
                    return false;
                else
                    return true;
                end;
            end;
        end, 
        select_matter = function(v1612, v1613)
            -- upvalues: v34 (ref)
            local v1614 = v34.clamp(v1612.m_iHealth, 0, 100);
            local v1615 = v1613:get_player_weapon();
            local v1616 = v1615 and v1615:get_weapon_info();
            if not v1616 then
                return 1, v1614 * 0.15;
            elseif v1616.damage < v1614 then
                return 1, v1614 * 0.15;
            else
                return 5, v1614 * 0.35;
            end;
        end, 
        work = function(v1617, v1618, _)
            -- upvalues: v502 (ref), v510 (ref)
            if not v502.valid or not v502.jumping or v502.exploit.active ~= 1 or v502.exploit.charge < 0.5 then
                return;
            else
                local _ = v510.settings.teleport;
                if not v1617.check_weapon(v502.weapon, v502.weapon_t) then
                    return;
                else
                    local _ = false;
                    local v1622 = false;
                    local _ = v502.self.m_vecVelocity;
                    if v502.menace ~= nil then
                        rage.exploit:force_teleport();
                    end;
                    if v1622 and v502.exploit.charge == 1 then
                        v1618.force_defensive = true;
                    end;
                    return;
                end;
            end;
        end
    }, 
    attack = {
        work = function(_, _, v1626)
            -- upvalues: v502 (ref), v405 (ref), v510 (ref), v183 (ref), l_vector_0 (ref), v503 (ref), v34 (ref)
            if not v502.jumping or v502.exploit.active ~= v405.exploit.DT then
                return;
            else
                local v1627 = false;
                local l_teleport_1 = v510.settings.teleport;
                if not v502.weapon then
                    return;
                else
                    local l_weapon_t_0 = v502.weapon_t;
                    local l_weapon_type_1 = l_weapon_t_0.weapon_type;
                    if l_weapon_t_0.full_auto or l_weapon_type_1 == 9 or l_weapon_type_1 == 0 or l_weapon_type_1 == 1 then
                        return;
                    else
                        local v1631 = rage.exploit:get();
                        local v1632 = v1631 * (16 - v183.rage.main.dt.fl.value - l_weapon_t_0.time_to_idle);
                        local v1633 = v502.self:get_simulation_time();
                        local v1634 = v502.weapon.m_flNextPrimaryAttack - v1633.current < 1;
                        if v1631 < 0.5 and not v1634 then
                            return;
                        else
                            local l_m_vecVelocity_3 = v502.self.m_vecVelocity;
                            local l_origin_2 = v502.origin;
                            local v1637 = v502.self:simulate_movement();
                            if not v1637 then
                                return;
                            else
                                v1637:think(v1632);
                                local v1638 = v502.self:get_eye_position();
                                local v1639 = v1637.origin + l_vector_0(0, 0, v1637.view_offset);
                                local l_damage_0 = v1626.damage;
                                local v1641 = utils.trace_line(v1638, v1639);
                                if v1641 then
                                    local l_end_pos_0 = v1641.end_pos;
                                    if l_end_pos_0 then
                                        v1641 = l_end_pos_0;
                                        goto label0 --[[  true, true  ]];
                                    end;
                                end;
                                v1641 = v1639;
                                ::label0::;
                                for v1643 = 1, #v503 do
                                    local v1644 = v503[v1643];
                                    if v1644 and v1644:is_enemy() and v1644:is_alive() and not v1644:is_dormant() then
                                        local v1645 = v1644:get_origin();
                                        if (l_origin_2:dist(v1645) < 400 or v1644 == v502.threat) and v1645:to_screen() then
                                            local v1646 = v1644:get_hitbox_position(0);
                                            local v1647, v1648 = utils.trace_bullet(v502.self, v1641, v1646);
                                            local v1649 = v34.min(l_damage_0, v1644.m_iHealth);
                                            if v1648 and v1648.entity == v1644 and v1648 and v1649 < v1647 or v1648.hitgroup == 1 then
                                                v1627 = true;
                                                break;
                                            end;
                                        end;
                                    end;
                                end;
                                if v1627 then
                                    if l_teleport_1.land.value then
                                        if v502.self.m_vecVelocity.z >= 0 then
                                            return;
                                        else
                                            local v1650 = v502.crouching and l_weapon_t_0.recovery_time_crouch or l_weapon_t_0.recovery_time_stand;
                                            local v1651 = v34.extrapolate(l_origin_2, l_m_vecVelocity_3, v1632);
                                            v1651.z = v1651.z - v1650;
                                            local v1652 = utils.trace_line(l_origin_2, v1651, nil, nil, 0);
                                            if not (v1652 and v1652.fraction < 1) then
                                                return;
                                            end;
                                        end;
                                    end;
                                    rage.exploit:force_teleport();
                                end;
                                return;
                            end;
                        end;
                    end;
                end;
            end;
        end
    }, 
    work = function(v1653, v1654)
        -- upvalues: v510 (ref), v763 (ref)
        local l_value_8 = v510.settings.teleport[1].mode.value;
        local l_teleport_2 = v763.teleport;
        if l_value_8 == "Offensive" then
            l_teleport_2.attack:work(v1653, v1654);
        else
            l_teleport_2.defense:work(v1653, v1654);
        end;
    end, 
    run = function(v1657)
        -- upvalues: v510 (ref), v185 (ref)
        v510.settings.teleport:set_callback(function(v1658)
            -- upvalues: v185 (ref), v1657 (ref)
            v185.ragebot_features(v1657.work, v1658.value);
        end, true);
    end
};
v763.dormant = {
    set_requirements = function(v1659, _, _)
        local _ = v1659:get_origin();
    end, 
    is_accurate_enough = function(_, _)
        -- upvalues: v502 (ref)
        return v502.weapon:get_spread() + v502.weapon:get_inaccuracy() < 0.0095;
    end, 
    work = function(v1665)
        -- upvalues: v502 (ref), v763 (ref), v183 (ref), v34 (ref), v503 (ref), v510 (ref), l_vector_0 (ref), v185 (ref)
        local l_weapon_t_1 = v502.weapon_t;
        if not l_weapon_t_1 then
            return;
        else
            local l_dormant_0 = v763.dormant;
            local l_weapon_type_2 = l_weapon_t_1.weapon_type;
            if l_weapon_type_2 == 0 or l_weapon_type_2 == 9 then
                return;
            else
                local v1669 = v502.self:get_simulation_time();
                local v1670 = v502.self:get_eye_position();
                local v1671 = v183.rage.selection.damage.ref:get();
                local v1672 = false;
                if v1671 > 100 then
                    local v1673 = v1671 - 100;
                    v1672 = true;
                    v1671 = v1673;
                end;
                local v1674 = false;
                if l_weapon_t_1.is_revolver then
                    v1674 = v1669.current > v502.weapon.m_flNextPrimaryAttack;
                else
                    v1674 = v1669.current > v34.max(v502.self.m_flNextAttack, v502.weapon.m_flNextPrimaryAttack, v502.weapon.m_flNextSecondaryAttack);
                end;
                if not v1674 then
                    return;
                else
                    local v1675 = nil;
                    for v1676 = 1, #v503 do
                        local v1677 = v503[v1676];
                        if v1677 and v1677:is_enemy() and v1677:is_alive() and v1677:is_dormant() then
                            local v1678 = v1677:get_origin();
                            local v1679 = v1677:get_network_state();
                            local v1680 = v1677:get_bbox();
                            if v1679 ~= 0 and v1679 < 4 and v1680.alpha < 0.8 and v1680.alpha > v510.settings.dormant.acc.value * 0.01 then
                                local v1681 = v1672 and v1671 + v1677.m_iHealth or v34.min(v1671, v1677.m_iHealth);
                                local v1682 = v1679 == 1 or v1680.alpha >= 0.75;
                                local v1683 = v1682 and v1681 > 80;
                                local v1684 = v1682 and v1677:get_hitbox_position(v1683 and 1 or 4) or v1678 + l_vector_0(0, 0, 40);
                                local v1685, v1686 = utils.trace_bullet(v502.self, v1670, v1684);
                                if v1683 then
                                    local v1687 = v1685 * l_weapon_t_1.headshot_multiplier;
                                    if v1687 then
                                        v1685 = v1687;
                                    end;
                                end;
                                if v1686 and v1681 < v1685 and v1686.entity and v1686.entity:get_name() == "CWorld" and (not v1675 or v1685 >= v1675.dmg or not v1675) then
                                    v1675 = {
                                        ent = v1677, 
                                        pos = v1684, 
                                        dmg = v1685, 
                                        net = v1679, 
                                        alpha = v1680.alpha
                                    };
                                end;
                            end;
                        end;
                    end;
                    if v1675 then
                        local v1688 = v1670:to(v1675.pos):angles();
                        v1665.block_movement = 1;
                        v1665.view_angles = v1688;
                        if not v502.self.m_bIsScoped and l_weapon_type_2 == 5 and not v502.jumping and v502.on_ground then
                            v1665.in_attack2 = true;
                        end;
                        if l_dormant_0.is_accurate_enough(v1675.pos, v1670) then
                            v1665.in_attack = true;
                            v763.dormant.latest_target = v1675;
                            v185.daim_shot:call({
                                target = v1675.ent, 
                                wanted_dmg = v1675.dmg, 
                                pos = v1675.pos, 
                                memory = v1675.alpha
                            });
                        end;
                    end;
                    return;
                end;
            end;
        end;
    end, 
    await = function(v1689)
        -- upvalues: v763 (ref), v502 (ref), v185 (ref)
        local v1690 = entity.get(v1689.userid, true);
        local v1691 = entity.get(v1689.attacker, true);
        local l_latest_target_0 = v763.dormant.latest_target;
        if v1691 == v502.self and l_latest_target_0 and v1690 == l_latest_target_0.ent then
            v185.daim_ack:call({
                hit = true, 
                fatal = v1689.health == 0, 
                target = v1690, 
                dmg = v1689.dmg_health, 
                wanted_dmg = l_latest_target_0.dmg, 
                hitgroup = v1689.hitgroup, 
                memory = l_latest_target_0.alpha
            });
            v763.dormant.latest_target = nil;
        end;
    end, 
    fetch = function(v1693)
        -- upvalues: v763 (ref), v185 (ref)
        utils.execute_after(1, function()
            -- upvalues: v763 (ref), v185 (ref), v1693 (ref)
            if v763.dormant.latest_target then
                v185.daim_ack:call({
                    hit = false, 
                    target = v1693.target, 
                    wanted_dmg = v1693.dmg, 
                    memory = v1693.memory
                });
                v763.dormant.latest_target = nil;
            end;
        end);
    end, 
    run = function(v1694)
        -- upvalues: v185 (ref), v510 (ref), v183 (ref), v174 (ref)
        v185.daim_shot:set(v1694.fetch);
        v510.settings.dormant:set_callback(function(v1695)
            -- upvalues: v185 (ref), v1694 (ref), v183 (ref), v174 (ref)
            v185.createmove(v1694.work, v1695.value);
            v185.player_hurt(v1694.await, v1695.value);
            v183.rage.main.enable.dormant:override(v174(v1695.value, false, nil));
        end, true);
    end
};
v763.peek = {
    timestamp = 0, 
    able = false, 
    state = v405.aipeek.STANDBY, 
    ensure_safety = {}, 
    hitbox_list = {
        Head = {
            [1] = 1, 
            [2] = {
                [1] = 0
            }
        }, 
        Chest = {
            [1] = 2, 
            [2] = {
                [1] = 4, 
                [2] = 5, 
                [3] = 6
            }
        }, 
        Stomach = {
            [1] = 3, 
            [2] = {
                [1] = 2, 
                [2] = 3
            }
        }, 
        Arms = {
            [1] = 4, 
            [2] = {
                [1] = 13, 
                [2] = 14, 
                [3] = 16, 
                [4] = 18
            }
        }, 
        Legs = {
            [1] = 6, 
            [2] = {
                [1] = 7, 
                [2] = 8, 
                [3] = 9, 
                [4] = 10
            }
        }
    }, 
    can_shoot = function()
        -- upvalues: v502 (ref)
        if not v502.valid or not v502.weapon then
            return;
        else
            local v1696 = v502.self.m_nTickBase * globals.tickinterval;
            local l_m_flNextAttack_0 = v502.self.m_flNextAttack;
            local l_m_flNextPrimaryAttack_0 = v502.weapon.m_flNextPrimaryAttack;
            return l_m_flNextAttack_0 <= v1696 and l_m_flNextPrimaryAttack_0 <= v1696;
        end;
    end, 
    check = function(v1699)
        -- upvalues: v183 (ref), v502 (ref), v763 (ref), v405 (ref)
        if not v183.rage.main.peek.value then
            return;
        elseif v1699.in_forward or v1699.in_back or v1699.in_moveleft or v1699.in_moveright or v1699.in_duck or v502.jumping then
            return;
        elseif not v502.weapon_t or v502.weapon_t.weapon_type == 0 or v502.weapon_t.weapon_type == 9 then
            return;
        elseif not v763.peek.can_shoot() or v502.exploit.active ~= v405.exploit.DT then
            return;
        else
            return true;
        end;
    end, 
    min_damage = function(v1700)
        -- upvalues: v183 (ref), v34 (ref)
        local v1701 = v183.rage.selection.damage:get();
        local l_m_iHealth_0 = v1700.m_iHealth;
        if v1701 > 100 then
            return l_m_iHealth_0 + (v1701 - 100);
        else
            return v34.min(l_m_iHealth_0, v34.max(1, v1701));
        end;
    end, 
    peekable_distance = function()
        -- upvalues: v502 (ref)
        if not v502.weapon then
            return 0, 0;
        else
            return v502.weapon:get_max_speed(), 0.25;
        end;
    end, 
    find_peekable = function(v1703)
        -- upvalues: v249 (ref), v502 (ref), v763 (ref), v34 (ref), v510 (ref), l_vector_0 (ref), v33 (ref)
        local v1704 = {};
        local v1705 = v249.camera_angles();
        local v1706 = v1703:get_origin();
        local v1707 = v502.origin:to(v1706);
        local v1708, v1709 = v763.peek.peekable_distance();
        if not v1708 then
            return v1704;
        else
            for v1710 = 0, 360, 360 / v34.floor(v510.settings.aipeek.perf.value * 0.16) do
                local v1711 = l_vector_0():angles(0, v1705.y + v1710):scaled(v1708);
                local v1712 = v502.self:simulate_movement(nil, v1711 - v502.self.m_vecVelocity);
                v1712:think(to_ticks(v1709));
                if v1712.origin then
                    if bit.band(v1712.flags, bit.lshift(1, 0)) ~= 0 then
                        local v1713 = v502.origin:to(v1712.origin);
                        local v1714 = v34.deg(v34.acos(v1707:dot(v1713)));
                        local v1715 = v1712.origin + l_vector_0(0, 0, v1712.view_offset);
                        v33.insert(v1704, {
                            [1] = v1715, 
                            [2] = v1705.y + v1710, 
                            [3] = v1712.origin:dist(v502.origin), 
                            [4] = v1714
                        });
                    else
                        break;
                    end;
                end;
            end;
            v33.sort(v1704, function(v1716, v1717)
                -- upvalues: v34 (ref)
                return v34.abs(90 - v1716[4]) < v34.abs(90 - v1717[4]);
            end);
            return v1704;
        end;
    end, 
    select = function()
        -- upvalues: v502 (ref), l_vector_0 (ref), v249 (ref), v34 (ref), v503 (ref)
        local l_eyes_0 = v502.eyes;
        local v1719 = l_vector_0():angles(v249.camera_angles());
        local l_huge_2 = v34.huge;
        local v1721 = nil;
        for v1722 = 1, #v503 do
            local v1723 = v503[v1722];
            if v1723:is_enemy() and not v1723.m_bGunGameImmunity then
                local v1724 = v1723:get_hitbox_position(2);
                if v1724.x ~= 0 or v1724.y ~= 0 or v1724.z ~= 0 then
                    local v1725 = v1724:dist_to_ray(l_eyes_0, v1719);
                    if v1725 < l_huge_2 then
                        local l_v1725_0 = v1725;
                        v1721 = v1723;
                        l_huge_2 = l_v1725_0;
                    end;
                end;
            end;
        end;
        return v1721;
    end, 
    scale_damage = function(v1727, v1728)
        -- upvalues: v502 (ref)
        if not v502.valid or not v502.weapon_t then
            return;
        else
            local l_weapon_t_2 = v502.weapon_t;
            local v1730 = ({
                [1] = 4, 
                [2] = 1.25, 
                [3] = nil, 
                [4] = nil, 
                [5] = nil, 
                [6] = 0.75
            })[v1728] or 1;
            local v1731 = ({
                [1] = nil, 
                [2] = true, 
                [3] = true, 
                [4] = true, 
                [1] = v1727.m_bHasHelmet
            })[v1728];
            local v1732 = l_weapon_t_2.damage * v1730;
            if v1731 then
                local v1733 = l_weapon_t_2.armor_ratio / 2;
                local l_m_ArmorValue_0 = v1727.m_ArmorValue;
                local v1735 = nil;
                if l_m_ArmorValue_0 < v1732 * v1733 / 2 then
                    v1735 = l_m_ArmorValue_0 * 4;
                else
                    v1735 = v1732;
                end;
                v1732 = v1732 - v1735 * (1 - v1733);
            end;
            return v1732;
        end;
    end, 
    aim = function(v1736, v1737)
        -- upvalues: v763 (ref), v183 (ref), l_unpack_0 (ref)
        local l_hitbox_list_0 = v763.peek.hitbox_list;
        local v1739 = {
            [1] = "Stomach", 
            [2] = "Arms", 
            [3] = "Legs", 
            [4] = "Head", 
            [5] = "Chest"
        };
        local v1740 = {};
        for v1741 = 1, #v1739 do
            local v1742 = v1739[v1741];
            if v183.rage.selection.hitboxes:get(v1742) then
                local v1743, v1744 = l_unpack_0(l_hitbox_list_0[v1742]);
                if v763.peek.scale_damage(v1736, v1743) >= v1737 then
                    for v1745 = 1, #v1744 do
                        v1740[#v1740 + 1] = v1744[v1745];
                    end;
                end;
            end;
        end;
        return v1740;
    end, 
    work = function(v1746)
        -- upvalues: v763 (ref), v405 (ref), v183 (ref), v502 (ref), v510 (ref), l_unpack_0 (ref)
        local l_peek_0 = v763.peek;
        local l_aipeek_0 = v405.aipeek;
        if not l_peek_0.check(v1746) then
            local v1749 = false;
            l_peek_0.state = l_aipeek_0.STANDBY;
            l_peek_0.able = v1749;
            return;
        else
            v183.rage.main.peek.retreat:override({
                [1] = "On Shot"
            });
            local v1750 = common.get_timestamp();
            if l_peek_0.state == l_aipeek_0.COOLDOWN then
                if v1750 < l_peek_0.timestamp then
                    l_peek_0.able = false;
                    return;
                else
                    l_peek_0.state = l_aipeek_0.STANDBY;
                end;
            end;
            if l_peek_0.state == l_aipeek_0.MOVING or l_peek_0.state == l_aipeek_0.MOVE_BACK then
                if not l_peek_0.direction or not l_peek_0.distance then
                    return;
                elseif l_peek_0.state == l_aipeek_0.MOVING and (not l_peek_0.target or not l_peek_0.target:is_alive()) then
                    l_peek_0.state = l_aipeek_0.STANDBY;
                    return;
                else
                    local v1751 = v502.origin:dist(l_peek_0.original_position);
                    if l_peek_0.distance * 1.1 < v1751 then
                        v1746.discharge_pending = true;
                        l_peek_0.state = l_aipeek_0.MOVE_BACK;
                    elseif l_peek_0.state == l_aipeek_0.MOVE_BACK and v1751 < 5 then
                        l_peek_0.state = l_aipeek_0.COOLDOWN;
                        l_peek_0.timestamp = v1750 + v510.settings.aipeek.perf.value * 100 / 2;
                    end;
                    v1746.move_yaw = l_peek_0.direction;
                    local v1752 = 450;
                    local v1753 = true;
                    local v1754 = false;
                    if l_peek_0.state == l_aipeek_0.MOVE_BACK then
                        local v1755 = 0;
                        local v1756 = false;
                        v1754 = false;
                        v1753 = v1756;
                        v1752 = v1755;
                    end;
                    if l_peek_0.state == l_aipeek_0.MOVE_BACK then
                        v183.rage.main.peek.retreat:override({
                            [1] = "On Shot", 
                            [2] = "On Key Release"
                        });
                    end;
                    local l_v1752_0 = v1752;
                    local l_v1753_0 = v1753;
                    v1746.in_back = v1754;
                    v1746.in_forward = l_v1753_0;
                    v1746.forwardmove = l_v1752_0;
                    l_v1752_0 = 0;
                    l_v1753_0 = false;
                    local v1759 = false;
                    local v1760 = false;
                    local v1761 = false;
                    v1746.in_jump = false;
                    v1746.in_moveright = v1761;
                    v1746.in_moveleft = v1760;
                    v1746.in_right = v1759;
                    v1746.in_left = l_v1753_0;
                    v1746.sidemove = l_v1752_0;
                    return;
                end;
            else
                local v1762 = l_peek_0.select();
                if not v1762 then
                    l_peek_0.able = false;
                    return;
                else
                    l_peek_0.able = true;
                    local v1763 = l_peek_0.min_damage(v1762);
                    local v1764 = l_peek_0.aim(v1762, v1763);
                    local v1765 = l_peek_0.find_peekable(v1762);
                    local v1766 = nil;
                    local v1767 = nil;
                    local v1768 = nil;
                    local v1769 = false;
                    for v1770 = 1, #v1765 do
                        local v1771, v1772, v1773 = l_unpack_0(v1765[v1770]);
                        for v1774 = 1, #v1764 do
                            local v1775 = v1762:get_hitbox_position(v1764[v1774]);
                            if v1775:length() > 0 then
                                local v1776, v1777 = utils.trace_bullet(v502.self, v1771, v1775);
                                local l_entity_0 = v1777.entity;
                                if (not l_entity_0 or l_entity_0:is_enemy()) and v1763 <= v1776 then
                                    local l_v1776_0 = v1776;
                                    local l_v1772_0 = v1772;
                                    v1768 = v1773;
                                    v1767 = l_v1772_0;
                                    v1766 = l_v1776_0;
                                    v1769 = true;
                                end;
                            end;
                            if v1769 then
                                break;
                            end;
                        end;
                        if v1769 then
                            break;
                        end;
                    end;
                    local v1781 = v1762:get_index();
                    if not v1767 or not v1768 or not v1766 then
                        l_peek_0.ensure_safety[v1781] = 0;
                    end;
                    l_peek_0.ensure_safety[v1781] = (l_peek_0.ensure_safety[v1781] or -1) + 1;
                    if l_peek_0.ensure_safety[v1781] < v510.settings.aipeek.ticks.value then
                        return;
                    else
                        l_peek_0.state = l_aipeek_0.MOVING;
                        l_peek_0.direction = v1767;
                        l_peek_0.original_position = v502.origin;
                        l_peek_0.target = v1762;
                        l_peek_0.distance = v1768;
                        return;
                    end;
                end;
            end;
        end;
    end, 
    run = function(v1782)
        -- upvalues: v510 (ref), v185 (ref), v183 (ref)
        v510.settings.aipeek:set_callback(function(v1783)
            -- upvalues: v185 (ref), v1782 (ref), v183 (ref)
            v185.createmove(v1782.work, v1783.value);
            if not v1783.value then
                v183.rage.main.peek.retreat:override();
            end;
        end, true);
    end
};
v763.airstop = {
    reloaded = false, 
    overridden = false, 
    work = function(v1784, v1785)
        -- upvalues: v502 (ref), v763 (ref), v510 (ref), v183 (ref), v174 (ref)
        if not v502.weapon then
            return;
        else
            local l_airstop_0 = v763.airstop;
            local l_airstop_1 = v510.settings.airstop;
            local l_weapon_i_0 = v502.weapon_i;
            if l_weapon_i_0 == 40 or l_weapon_i_0 == 64 then
                local l_autostoptions_0 = v1785.autostoptions;
                l_autostoptions_0[#l_autostoptions_0 + 1] = "In Air";
                local v1790 = 500;
                if v502.threat then
                    local v1791 = v502.threat:get_origin();
                    if v1791 then
                        local v1792 = v502.origin:dist(v1791);
                        if v1792 then
                            v1790 = v1792;
                        end;
                    end;
                end;
                local v1793 = l_airstop_1.conds:get(1);
                local v1794 = l_airstop_1.conds:get(2);
                local v1795 = v502.velocity < 20;
                local v1796 = v502.jumping and (v1793 and (not (v502.velocity >= 120) or not (v1790 >= 150)) or v1794 and v1784.in_speed);
                local v1797 = v502.jumping and l_airstop_1.duck.value and (not (v502.velocity >= 70) or v1790 < 300) and v502.self.m_MoveType ~= 9;
                v1785.autostoptions = v1796 and l_autostoptions_0 or nil;
                v183.misc.movement.airstrafe:override(v174(v1795, false, nil));
                if v1797 then
                    v1784.in_duck = true;
                end;
                l_airstop_0.overridden = true;
            elseif l_airstop_0.overridden then
                v183.misc.movement.airstrafe:override();
                l_airstop_0.overridden = false;
            end;
            if not l_airstop_0.reload and v510.settings.airstop.value and #common.get_active_scripts() > 1 then
                v510.settings.airstop:set(false);
                utils.execute_after(0.5, function()
                    -- upvalues: v510 (ref)
                    v510.settings.airstop:set(true);
                end);
                l_airstop_0.reload = true;
            end;
            return;
        end;
    end, 
    run = function(v1798)
        -- upvalues: v510 (ref), v185 (ref), v183 (ref)
        v510.settings.airstop:set_callback(function(v1799)
            -- upvalues: v185 (ref), v1798 (ref), v183 (ref)
            v185.ragebot_features(v1798.work, v1799.value);
            if not v1799.value then
                v183.misc.movement.airstrafe:override();
            end;
        end);
    end
};
v763.exswitch = {
    ovr = false, 
    work = function(_)
        -- upvalues: v763 (ref), v510 (ref), v502 (ref), v183 (ref)
        local l_exswitch_0 = v763.exswitch;
        local l_exswitch_1 = v510.settings.exswitch;
        local v1803;
        if (v502.walking or v502.velocity < 2) and not v183.rage.main.peek.value or v502.self.m_flDuckAmount > 0.5 then
            v1803 = false;
        else
            v1803 = true;
        end;
        local v1804 = false;
        local v1805 = false;
        if v502.weapon then
            local l_weapon_t_3 = v502.weapon_t;
            local l_weapon_i_1 = v502.weapon_i;
            local l_full_auto_1 = l_weapon_t_3.full_auto;
            local l_weapon_type_3 = l_weapon_t_3.weapon_type;
            v1804 = l_full_auto_1 or l_weapon_type_3 == 1 or l_weapon_i_1 == 1;
            if l_exswitch_1.p.value and l_weapon_i_1 ~= 1 and (l_weapon_type_3 == 1 or l_weapon_type_3 == 2 or l_weapon_type_3 == 3) or l_weapon_i_1 == 1 and l_exswitch_1.hp.value then
                v1804 = false;
            end;
            if l_weapon_t_3.is_revolver or l_weapon_type_3 == 9 or l_weapon_type_3 == 0 then
                v1805 = true;
            end;
        end;
        if not v1805 and not v502.jumping and v183.rage.main.dt.value and v502.exploit.charge == 1 and not v1804 and not v1803 then
            v183.rage.main.dt:override(false);
            v183.rage.main.hs:override(true);
            l_exswitch_0.ovr = true;
        elseif l_exswitch_0.ovr then
            v183.rage.main.dt:override();
            v183.rage.main.hs:override();
            l_exswitch_0.ovr = false;
        end;
    end, 
    run = function(v1810)
        -- upvalues: v510 (ref), v185 (ref), v183 (ref)
        v510.settings.exswitch:set_callback(function(v1811)
            -- upvalues: v185 (ref), v1810 (ref), v183 (ref)
            v185.createmove(v1810.work, v1811.value);
            if not v1811.value then
                v183.rage.main.dt:override();
                v183.rage.main.hs:override();
            end;
        end);
    end
};
v763.cross = {
    state = false, 
    active = false, 
    work = function(v1812)
        -- upvalues: v763 (ref), v510 (ref), v183 (ref), v502 (ref)
        local l_cross_0 = v763.cross;
        local v1814 = v510.settings.cross:get();
        l_cross_0.active = v1814;
        if v1814 and not v183.rage.main.dt.value and v502.exploit.charge == 0 and l_cross_0.state == 0 then
            v183.rage.main.dt:set(true);
            return;
        else
            local l_lc_left_0 = v502.exploit.lc_left;
            if v1814 then
                if v502.exploit.charge == 1 then
                    rage.exploit:allow_defensive(false);
                    l_cross_0.state = 1;
                end;
            elseif l_cross_0.state == 1 then
                v1812.force_defensive = true;
                l_cross_0.state = 2;
            elseif l_cross_0.state == 2 and l_lc_left_0 > 1 then
                v183.rage.main.dt:set(false);
                rage.exploit:force_teleport();
                rage.exploit:allow_defensive(true);
                l_cross_0.state = 0;
            end;
            return;
        end;
    end, 
    run = function(v1816)
        -- upvalues: v0 (ref), v185 (ref)
        if v0 > 1 then
            v185.createmove:set(v1816.work);
        end;
    end
};
v763.hsfix = {
    state = 0, 
    callback = function()
        -- upvalues: v183 (ref), v763 (ref)
        if v183.rage.main.hs.value then
            v183.rage.main.hs.options:override("Break LC");
            v763.hsfix.state = 1;
        end;
    end, 
    work = function()
        -- upvalues: v763 (ref), v183 (ref)
        if v763.hsfix.state == 1 then
            v763.hsfix.state = 2;
        elseif v763.hsfix.state == 2 then
            v183.rage.main.hs.options:override();
            v763.hsfix.state = 0;
        end;
    end, 
    run = function(v1817)
        -- upvalues: v185 (ref), v183 (ref)
        v185.createmove:set(v1817.work);
        v185.local_spawn:set(v1817.callback);
        v183.rage.main.hs:set_callback(v1817.callback);
    end
};
v763.nadefix = {
    ovr = false, 
    work = function()
        -- upvalues: v763 (ref), v502 (ref)
        local l_nadefix_0 = v763.nadefix;
        if v502.weapon and v502.weapon_t.weapon_type == 9 and (v502.weapon.m_bPinPulled or v502.weapon.m_fThrowTime ~= 0) then
            l_nadefix_0.timer = globals.tickcount + 16;
        elseif l_nadefix_0.timer and globals.tickcount > l_nadefix_0.timer then
            l_nadefix_0.timer = nil;
        end;
    end, 
    run = function(v1819)
        -- upvalues: v185 (ref)
        v185.createmove(v1819.work);
    end
};
v763.ping = {
    work = function(_)
        -- upvalues: v183 (ref), v510 (ref)
        v183.misc.other.fakeping:override(v510.settings.ping.ovr.value);
    end, 
    run = function(v1821)
        -- upvalues: v510 (ref), v185 (ref), v183 (ref)
        v510.settings.ping:set_callback(function(v1822)
            -- upvalues: v185 (ref), v1821 (ref), v183 (ref)
            v185.createmove(v1821.work, v1822.value);
            if not v1822.value then
                v183.misc.other.fakeping:override();
            end;
        end, true);
    end
};
v925 = {
    head_scale = v183.rage.selection.multipoint.head.ref, 
    body_scale = v183.rage.selection.multipoint.body.ref, 
    hitchance = v183.rage.selection.hitchance.ref, 
    damage = v183.rage.selection.damage.ref, 
    autostoptions = v183.rage.accuracy.autostop_ssg.options.ref
};
v952 = {};
do
    local l_v925_3, l_v952_1, l_v953_2 = v925, v952, v953;
    l_v953_2 = l_setmetatable_0({}, {
        __index = function(_, v1827)
            -- upvalues: l_rawget_0 (ref), l_v952_1 (ref), l_v925_3 (ref)
            local v1828 = l_rawget_0(l_v952_1, v1827);
            if v1828 ~= nil then
                return v1828;
            else
                return l_v925_3[v1827]:get();
            end;
        end, 
        __newindex = function(_, v1830, v1831)
            -- upvalues: l_rawset_0 (ref), l_v952_1 (ref)
            l_rawset_0(l_v952_1, v1830, v1831);
        end
    });
    v185.createmove:set(function(v1832)
        -- upvalues: v33 (ref), l_v952_1 (ref), v185 (ref), l_v953_2 (ref), l_next_0 (ref), l_v925_3 (ref)
        v33.clear(l_v952_1);
        v185.ragebot_features:call(v1832, l_v953_2);
        for v1833, v1834 in l_next_0, l_v925_3 do
            v1834:override(l_v952_1[v1833]);
        end;
    end);
end;
for _, v1836 in l_next_0, v763 do
    if v1836 then
        v1836:run();
    end;
end;
v185.enemy_shot:set(function(v1837)
    -- upvalues: v188 (ref)
    local v1838 = v1837.attacker and v1837.attacker:get_resource();
    if not v1838 or v1838.m_iPing == 0 then
        return;
    else
        if not v1837.damaged then
            v188.stats.evaded = v188.stats.evaded + 1;
        end;
        return;
    end;
end);
v185.local_frag:set(function(v1839)
    -- upvalues: v188 (ref)
    v188.stats.killed = v188.stats.killed + 1;
    v188.stats.headshots = v188.stats.headshots + (v1839.headshot and 1 or 0);
end);
v185.local_death:set(function(v1840)
    -- upvalues: v188 (ref)
    v188.stats.deaths = v188.stats.deaths + 1;
    v188.stats.hsed = v188.stats.hsed + (v1840.headshot and 1 or 0);
end);
v185.database_pre_save:set(function()
    -- upvalues: v188 (ref)
    v188.stats.playtime = v188.stats.playtime + 0.08;
end);
v249.logo = function(v1841, v1842)
    -- upvalues: v262 (ref), v249 (ref), l_vector_0 (ref), v184 (ref)
    local l_logo_l_0 = v262.logo_l;
    local l_logo_r_0 = v262.logo_r;
    local l_logo_lo_0 = v262.logo_lo;
    local l_logo_ro_0 = v262.logo_ro;
    local l_logo_l2x_0 = v262.logo_l2x;
    local l_logo_r2x_0 = v262.logo_r2x;
    local l_logo_lo2x_0 = v262.logo_lo2x;
    local l_logo_ro2x_0 = v262.logo_ro2x;
    if v249.dpi > 1 and l_logo_lo2x_0 and l_logo_ro2x_0 then
        local l_l_logo_l2x_0_0 = l_logo_l2x_0;
        local l_l_logo_r2x_0_0 = l_logo_r2x_0;
        local l_l_logo_lo2x_0_0 = l_logo_lo2x_0;
        l_logo_ro_0 = l_logo_ro2x_0;
        l_logo_lo_0 = l_l_logo_lo2x_0_0;
        l_logo_r_0 = l_l_logo_r2x_0_0;
        l_logo_l_0 = l_l_logo_l2x_0_0;
    end;
    if v1842 and l_logo_l_0 and l_logo_r_0 then
        v249.texture(l_logo_l_0, v1841, l_vector_0(26, 15), v184.accent);
        v249.texture(l_logo_r_0, l_vector_0(v1841.x + 26, v1841.y), l_vector_0(24, 15), v184.text);
    else
        v249.texture(l_logo_lo_0, v1841, l_vector_0(26, 15), v184.accent);
        v249.texture(l_logo_ro_0, l_vector_0(v1841.x + 26, v1841.y), l_vector_0(24, 15), v184.text);
    end;
end;
v249.edge_h = function(v1854, v1855, v1856, v1857)
    -- upvalues: v184 (ref), v249 (ref), l_vector_0 (ref), v262 (ref)
    local v1858 = v1856 or v184.accent;
    if not v1857 then
        v1857 = v184.secondary;
    end;
    v1856 = v1858;
    if v1856 == v1857 then
        v249.rect(l_vector_0(v1854.x + 4, v1854.y), v1854 + l_vector_0(v1855 - 4, 2), v1856);
    else
        v249.gradient(l_vector_0(v1854.x + 4, v1854.y), v1854 + l_vector_0(v1855 - 4, 2), v1856, v1857, v1856, v1857);
    end;
    v249.texture(v262.corner_h1, l_vector_0(v1854.x, v1854.y), l_vector_0(4, 6), v1856, "f");
    v1858 = v249.texture;
    local l_corner_h2_0 = v262.corner_h2;
    local v1860 = l_vector_0(v1854.x + v1855 - 4, v1854.y);
    local v1861 = l_vector_0(4, 6);
    local v1862;
    if not v1857 then
        v1862 = v1856;
    else
        v1862 = v1857;
    end;
    v1858(l_corner_h2_0, v1860, v1861, v1862, "f");
end;
v249.edge_v = function(v1863, v1864, v1865, v1866)
    -- upvalues: v184 (ref), v249 (ref), l_vector_0 (ref), v262 (ref)
    local v1867 = v1865 or v184.accent;
    if not v1866 then
        v1866 = v184.secondary;
    end;
    v1865 = v1867;
    if v1865 == v1866 then
        v249.rect(l_vector_0(v1863.x, v1863.y + 4), v1863 + l_vector_0(2, v1864 - 4), v1865);
    else
        v249.gradient(l_vector_0(v1863.x, v1863.y + 4), v1863 + l_vector_0(2, v1864 - 4), v1865, v1865, v1866, v1866);
    end;
    v249.texture(v262.corner_v1, l_vector_0(v1863.x, v1863.y), l_vector_0(6, 4), v1865, "f");
    v1867 = v249.texture;
    local l_corner_v2_0 = v262.corner_v2;
    local v1869 = l_vector_0(v1863.x, v1863.y + v1864 - 4);
    local v1870 = l_vector_0(6, 4);
    local v1871;
    if not v1866 then
        v1871 = v1865;
    else
        v1871 = v1866;
    end;
    v1867(l_corner_v2_0, v1869, v1870, v1871, "f");
end;
v249.side_h = function(v1872, v1873)
    -- upvalues: v249 (ref), v184 (ref), l_vector_0 (ref), l_color_0 (ref), v510 (ref)
    if v249.style == 1 then
        v249.blur(v1872, v1873, 1, 1, {
            [1] = 4, 
            [2] = 4, 
            [3] = 0, 
            [4] = 0
        });
        v249.rect(v1872, v1873, v184.panel.g1, {
            [1] = 4, 
            [2] = 4, 
            [3] = 0, 
            [4] = 0
        });
        v249.rect(l_vector_0(v1872.x, v1873.y), l_vector_0(v1873.x, v1873.y + 2), v184.panel.g1);
        v249.edge_h(l_vector_0(v1872.x, v1873.y), v1873.x - v1872.x);
    else
        v249.blur(v1872, v1873, 1, 1, 4);
        v249.rect(v1872, v1873, l_color_0(0, 0, 0, v510.settings.style[1].bga.value * 2.55), 4);
        v249.edge_h(l_vector_0(v1872.x, v1872.y - 1), v1873.x - v1872.x);
    end;
end;
v249.side_v = function(v1874, v1875)
    -- upvalues: v249 (ref), v184 (ref), l_vector_0 (ref)
    v249.blur(v1874, v1875, 1, 1, {
        [1] = 4, 
        [2] = 0, 
        [3] = 0, 
        [4] = 4
    });
    v249.rect(v1874, v1875, v184.panel.g1, {
        [1] = 4, 
        [2] = 0, 
        [3] = 0, 
        [4] = 4
    });
    v249.rect(l_vector_0(v1875.x, v1874.y), l_vector_0(v1875.x + 2, v1875.y), v184.panel.g1);
    v249.edge_v(l_vector_0(v1875.x, v1874.y), v1875.y - v1874.y);
end;
v925 = nil;
v925 = v261.new("crosshair", l_vector_0(v228.x - 24, v228.y + 32), l_vector_0(48, 16), {
    border = {
        l_vector_0(v240.x, v240.y - 100), 
        l_vector_0(v240.x, v240.y + 100)
    }, 
    rulers = {
        [1] = {
            [1] = true, 
            [2] = l_vector_0(v240.x, v240.y - 100), 
            [3] = v240.y + 100
        }
    }
});
v952 = {
    scope = {
        target = 0, 
        reserved = false, 
        side = 0
    }, 
    progress = {
        y = {
            [1] = 0
        }, 
        nade = {
            [1] = 0
        }
    }
};
v925.items = {
    [1] = {
        [1] = 0, 
        x = 0, 
        [2] = function(v1876, v1877)
            -- upvalues: v250 (ref), v510 (ref), v184 (ref), v249 (ref), l_vector_0 (ref), v34 (ref), v262 (ref)
            if v1876[1] > 0 then
                local v1878 = v250.condition(v1876.bfly, v510.settings.crosshair.bfly.value, -8);
                if v1878 > 0 then
                    local v1879 = v184.accent:alpha_modulate(v1878, true);
                    v249.shadow(l_vector_0(v1877.x + 4, v1877.y), l_vector_0(v1877.x + 16, v1877.y + 12), v1879, v34.lerp(25, 50, v250.pulse));
                    v249.texture(v262.butterfly_s, l_vector_0(v1877.x - 3, v1877.y - 10), l_vector_0(32, 32), v1879);
                end;
                v249.logo(v1877);
            end;
            return v510.settings.crosshair.style.value == 1, l_vector_0(50, 15);
        end, 
        bfly = {
            [1] = 0
        }
    }, 
    [2] = {
        [1] = 0, 
        x = 0, 
        [2] = function(v1880, v1881)
            -- upvalues: v249 (ref), v510 (ref), v262 (ref), l_vector_0 (ref), v184 (ref), v0 (ref), v35 (ref), v506 (ref)
            local v1882 = "HYSTERIA";
            local v1883, v1884 = v249.measure_text(2, v1882):unpack();
            if v1880[1] > 0 then
                if v510.settings.crosshair.bfly.value then
                    v249.texture(v262.bfly, l_vector_0(v1881.x + v1883 - 2, v1881.y + 2), l_vector_0(9, 9), v184.accent);
                    v1883 = v1883 + 5;
                elseif v0 > 1 then
                    v1882 = v35.format("HYSTERIA %s%s", v184.hex, v35.upper(v506.build));
                    v1883 = v249.measure_text(2, v1882):unpack();
                end;
                v249.text(2, v1881, v184.text, nil, v1882);
            end;
            return v510.settings.crosshair.style.value == 2, l_vector_0(v1883, v1884 + 2);
        end
    }, 
    [3] = {
        [1] = 0, 
        x = 0, 
        [2] = function(v1885, v1886)
            -- upvalues: v183 (ref), v250 (ref), v184 (ref), v35 (ref), v249 (ref)
            local l_value_9 = v183.rage.main.dt.value;
            local v1888 = v183.rage.main.dt.ref:get_override();
            if v1885[1] > 0 then
                local v1889 = rage.exploit:get();
                local v1890 = v250.condition(v1885.ovr_p, v1888 ~= false, -8);
                local v1891 = "DT " .. v184.hex2 .. v35.insert("IIIIII", "\aFFFFFF60", v1889 * 6);
                v249.text(2, v1886, v184.text:alpha_modulate(0.5 + v1890 * 0.5, true), nil, v1891);
            end;
            return l_value_9 or v1888, v249.measure_text(2, "DT IIIIII");
        end, 
        ovr_p = {
            [1] = 0
        }
    }, 
    [4] = {
        [1] = 0, 
        x = 0, 
        [2] = function(v1892, v1893)
            -- upvalues: v763 (ref), v184 (ref), v502 (ref), v249 (ref)
            local l_active_0 = v763.cross.active;
            local v1895 = "CLC";
            if v1892[1] > 0 then
                local v1896 = v184.text:alpha_modulate(96);
                if v502.exploit.charge == 1 then
                    v1896 = v184.accent;
                end;
                v249.text(2, v1893, v1896, nil, v1895);
            end;
            return l_active_0, v249.measure_text(2, v1895);
        end
    }, 
    [5] = {
        [1] = 0, 
        x = 0, 
        [2] = function(v1897, v1898)
            -- upvalues: v183 (ref), v250 (ref), v249 (ref), v184 (ref)
            local v1899 = v183.rage.main.hs.value or v183.rage.main.hs.ref:get_override();
            local v1900 = "OS";
            if v1897[1] > 0 then
                local v1901 = v183.rage.main.dt.value or v183.rage.main.dt.ref:get_override();
                local v1902 = v250.condition(v1897.a1, not v1901, -8);
                v249.text(2, v1898, v184.text:lerp(v184.secondary, v1902 * rage.exploit:get()), nil, v1900);
            end;
            return v1899, v249.measure_text(2, v1900);
        end, 
        a1 = {
            [1] = 0
        }
    }, 
    [6] = {
        [1] = 0, 
        x = 0, 
        [2] = function(v1903, v1904)
            -- upvalues: v183 (ref), v502 (ref), v250 (ref), v249 (ref), v184 (ref)
            local l_value_10 = v183.rage.main.peek.value;
            local v1906 = v502.exploit.active == 1 and rage.exploit:get() > 0.5;
            local v1907 = v1906 and "QP" or "AP";
            if v1903[1] > 0 then
                local v1908 = v250.condition(v1903.ideal, v1906, -8);
                v249.text(2, v1904, v184.text:lerp(v184.secondary, v1908), nil, v1907);
            end;
            return l_value_10, v249.measure_text(2, v1907);
        end, 
        ideal = {
            [1] = 0
        }
    }, 
    [7] = {
        [1] = 0, 
        x = 0, 
        [2] = function(v1909, v1910)
            -- upvalues: v514 (ref), v249 (ref), v184 (ref)
            local v1911 = v514.data.roll_mode ~= nil;
            local v1912 = "RO";
            if v1909[1] > 0 then
                v249.text(2, v1910, v184.text, nil, v1912);
            end;
            return v1911, v249.measure_text(2, v1912);
        end
    }, 
    [8] = {
        [1] = 0, 
        x = 0, 
        [2] = function(v1913, v1914)
            -- upvalues: v510 (ref), v250 (ref), v514 (ref), v249 (ref), v184 (ref)
            local l_value_11 = v510.antiaim.buttons.fs.value;
            local v1916 = "FS";
            if v1913[1] > 0 then
                local v1917 = v250.condition(v1913.a1, v514.data.freestand ~= nil, -8);
                v249.text(2, v1914, v184.text:alpha_modulate(96):lerp(v184.secondary, v1917), nil, v1916);
            end;
            return l_value_11, v249.measure_text(2, v1916);
        end, 
        a1 = {
            [1] = 0
        }
    }, 
    [9] = {
        [1] = 0, 
        x = 0, 
        [2] = function(v1918, v1919)
            -- upvalues: v510 (ref), v250 (ref), v514 (ref), v249 (ref), v184 (ref)
            local l_value_12 = v510.antiaim.buttons.edge.value;
            local v1921 = "EY";
            if v1918[1] > 0 then
                local v1922 = v250.condition(v1918.a1, v514.data.edge, -8);
                v249.text(2, v1919, v184.text:alpha_modulate(96):lerp(v184.secondary, v1922), nil, v1921);
            end;
            return l_value_12, v249.measure_text(2, v1921);
        end, 
        a1 = {
            [1] = 0
        }
    }, 
    [10] = {
        [1] = 0, 
        x = 0, 
        [2] = function(v1923, v1924)
            -- upvalues: v183 (ref), v249 (ref), v184 (ref)
            local v1925 = v183.rage.safety.body_aim.ref:get() == "Force";
            local v1926 = "BA";
            if v1923[1] > 0 then
                v249.text(2, v1924, v184.text, nil, v1926);
            end;
            return v1925, v249.measure_text(2, v1926);
        end
    }
};
do
    local l_v952_2 = v952;
    v925.enumerate = function(v1928)
        -- upvalues: l_vector_0 (ref), v250 (ref), l_v952_2 (ref), v228 (ref), v249 (ref), v34 (ref)
        local v1929 = l_vector_0(v1928.pos.x + v1928.size.x * 0.5, v1928.pos.y);
        local v1930 = v250.condition(l_v952_2.progress.y, v1928.pos.y > v228.y, 3) * 2 - 1;
        local l_side_0 = l_v952_2.scope.side;
        local v1932 = l_side_0 * 0.5 + 0.5;
        for v1933 = 1, #v1928.items do
            local v1934 = v1928.items[v1933];
            v1934[0] = v1934[0] or {
                [1] = 0
            };
            v249.push_alpha(v1934[1]);
            local v1935, v1936 = v1934[2](v1934, l_vector_0(v1929.x + v1934.x, v1929.y));
            v249.pop_alpha();
            v1934[1] = v250.condition(v1934[0], v1935, 6);
            v1934.x = v1936.x * -v1932 - l_side_0 * 16;
            v1929.y = v1929.y + (v1936.y - 2) * v1934[1] * v1930;
        end;
        return v34.abs(v1929.y - v1928.pos.y);
    end;
    v925.update = function(v1937)
        -- upvalues: v502 (ref), v510 (ref), v250 (ref), l_v952_2 (ref)
        if v502.in_score then
            v1937.progress[1] = 0;
            return 0;
        elseif not v510.settings.crosshair.value then
            return v250.condition(v1937.progress, false, -12);
        else
            local v1938 = v502.weapon and v502.weapon_t;
            local v1939 = (v1938 and v1938.weapon_type) == 9;
            local v1940 = v250.condition(l_v952_2.progress.nade, not v1939, -12) * 0.5 + 0.5;
            return v250.condition(v1937.progress, v502.valid, -12) * v1940;
        end;
    end;
    v925.paint = function(v1941)
        -- upvalues: v502 (ref), l_v952_2 (ref), v250 (ref)
        if v502.valid and v502.self.m_bIsScoped then
            if not l_v952_2.scope.reserved and v502.side ~= 0 then
                local l_scope_2 = l_v952_2.scope;
                local l_scope_3 = l_v952_2.scope;
                local v1944 = -v502.side;
                l_scope_3.reserved = true;
                l_scope_2.target = v1944;
            end;
        else
            local l_scope_4 = l_v952_2.scope;
            local l_scope_5 = l_v952_2.scope;
            local v1947 = 0;
            l_scope_5.reserved = false;
            l_scope_4.target = v1947;
        end;
        l_v952_2.scope.side = v250.lerp(l_v952_2.scope.side, l_v952_2.scope.target, 12, 0.01);
        v1941:enumerate();
    end;
    v185.render_dpi:set(function()
        -- upvalues: v925 (ref), v227 (ref), v510 (ref)
        local v1948 = v925.size.x / v227.x * 5000;
        v510.drag[v925.id].x:set(5000 - v1948);
    end);
end;
v952 = nil;
v952 = {
    watermark = v261.new("watermark", l_vector_0(v227.x - 24, 24), l_vector_0(320, 22), {
        rulers = {
            [1] = {
                [1] = true, 
                [2] = l_vector_0(v240.x, 0), 
                [3] = v239.y
            }, 
            [2] = {
                [1] = false, 
                [2] = l_vector_0(0, v239.y - 24), 
                [3] = v239.x
            }, 
            [3] = {
                [1] = false, 
                [2] = l_vector_0(0, 24), 
                [3] = v239.x
            }
        }, 
        on_release = function(v1949, v1950)
            -- upvalues: v227 (ref), v34 (ref)
            local v1951 = v227.x / 3;
            local v1952 = v1949.pos.x + v1949.size.x * 0.5;
            local v1953 = v34.floor(v1952 / v1951);
            if v1953 == v1949.align then
                return;
            else
                v1949.align = v1953;
                if v1949.align == 1 then
                    v1949:set_position(v1952);
                elseif v1949.align == 2 then
                    v1949:set_position(v1949.pos.x + v1949.size.x);
                end;
                v1950.config.a:set(v1953);
                return;
            end;
        end, 
        on_held = function(v1954, v1955)
            v1955.config.a:set(0);
            v1954.align = 0;
        end
    })
};
v952.watermark.active_items = 0;
v953 = v952.watermark;
local v1956 = "align";
local l_watermark_0 = v952.watermark;
local v1958 = "logop";
local l_watermark_1 = v952.watermark;
local v1960 = "logo";
local v1961 = 2;
local v1962 = {
    [1] = 0
};
l_watermark_1[v1960] = 0;
l_watermark_0[v1958] = v1962;
v953[v1956] = v1961;
v952.watermark.__drag.config.a = v257.ui_group:slider("watermark:align", 0, 2, v952.watermark.align);
v952.watermark.__drag.config.a:set_callback(function(v1963)
    -- upvalues: v952 (ref)
    v952.watermark.align = v1963.value;
end, true);
v952.watermark.get_name = function()
    -- upvalues: v510 (ref), v506 (ref)
    local v1964 = v510.settings.watermark[1];
    if v1964.namet.value == "Steam" then
        return cvar.name:string();
    elseif v1964.namet.value == "Neverlose" then
        return v506.user;
    elseif v1964.namet.value == "Custom" then
        return v1964.name.value;
    else
        return;
    end;
end;
v952.watermark.get_pfp = function()
    -- upvalues: v510 (ref), v262 (ref)
    local v1965 = v510.settings.watermark[1];
    if v1965.pfp.value == "Steam" then
        return v262.steampfp;
    elseif v1965.pfp.value == "Neverlose" then
        return v262.avatar;
    else
        return;
    end;
end;
v952.watermark.draw_item_back = function(v1966, v1967)
    -- upvalues: v249 (ref), l_vector_0 (ref), v184 (ref)
    if v249.style == 1 then
        v249.blur(v1967, l_vector_0(v1967.x + v1966.w, v1967.y + 22), 1, 1, 4);
        v249.rect(v1967, l_vector_0(v1967.x + v1966.w, v1967.y + 22), v184.panel.l2, 4);
    end;
end;
v952.watermark.builds = {
    nil, 
    v167.string("bliss \f<bolt>"), 
    v167.string("beta \f<flask>"), 
    v167.string("debug \f<brackets-curly>")
};
v952.watermark.items = {
    [1] = {
        [1] = 0, 
        w = 96, 
        [2] = function(v1968, v1969)
            -- upvalues: v510 (ref), v952 (ref), v0 (ref), v184 (ref), v249 (ref), v248 (ref), l_vector_0 (ref)
            local v1970 = v510.settings.watermark[1];
            local v1971 = v952.watermark.get_name();
            local v1972 = v1970.sb and v1970.sb.value and v952.watermark.builds[v0] or nil;
            local v1973 = v1971 .. (v1972 and (#v1971 > 0 and " \aFFFFFF40\226\128\148 " or "") .. v184.hex2 .. v1972 or "");
            local v1974 = v952.watermark.get_pfp();
            local v1975 = v249.measure_text(v248.regular, v1973).x + (v1974 and 16 or 0);
            if v1968[1] > 0 then
                v952.watermark.draw_item_back(v1968, v1969);
                v249.text(v248.regular, l_vector_0(v1969.x + (v1974 and 24 or 8), v1969.y + 4), v184.text, nil, v1973);
                if v1974 then
                    v249.texture(v1974, l_vector_0(v1969.x + 4, v1969.y + 3), l_vector_0(16, 16), v184.white, nil, 4);
                end;
            end;
            return v1974 or #v1971 > 0 or v1972, v1975 + 16;
        end, 
        [3] = {}
    }, 
    [2] = {
        [1] = 0, 
        w = 96, 
        [2] = function(v1976, v1977)
            -- upvalues: v510 (ref), v249 (ref), v248 (ref), v952 (ref), l_vector_0 (ref), v184 (ref)
            local v1978 = common.get_date(v510.settings.watermark.time.value == "12-hour" and "%I:%M %p \aFFFFFF50%A" or "%H:%M \aFFFFFF50%A");
            local l_x_1 = v249.measure_text(v248.regular, v1978).x;
            if v1976[1] > 0 then
                v952.watermark.draw_item_back(v1976, v1977);
                v249.text(v248.regular, l_vector_0(v1977.x + 8, v1977.y + 4), v184.text, nil, v1978);
            end;
            return v510.settings.watermark.time.value ~= "Off", l_x_1 + 16;
        end, 
        [3] = {}
    }, 
    [3] = {
        [1] = 0, 
        w = 96, 
        [2] = function(v1980, v1981)
            -- upvalues: v35 (ref), v249 (ref), v248 (ref), v952 (ref), l_vector_0 (ref), v184 (ref)
            local v1982 = utils.net_channel();
            local v1983 = v1982 and v1982.latency[1] * 1000 or 0;
            local v1984 = v35.format("%d \aFFFFFF60ms", v1983);
            local l_x_2 = v249.measure_text(v248.regular, v1984).x;
            if v1980[1] > 0 then
                v952.watermark.draw_item_back(v1980, v1981);
                v249.text(v248.regular, l_vector_0(v1981.x + 8, v1981.y + 4), v184.text, nil, v1984);
            end;
            return v1983 > 5 and v952.watermark.active_items > 0, l_x_2 + 16;
        end, 
        [3] = {}
    }
};
v952.watermark.enumerate = function(v1986)
    -- upvalues: v249 (ref), l_ipairs_0 (ref), l_vector_0 (ref), v250 (ref)
    local v1987 = v1986.logo * (v249.style == 1 and 68 or 54);
    v1986.active_items = 0;
    for _, v1989 in l_ipairs_0(v1986.items) do
        local v1990 = l_vector_0(v1986.pos.x + v1987, v1986.pos.y + (v249.style == 1 and 1 or 0));
        v249.push_alpha(v1989[1]);
        local v1991, v1992 = v1989[2](v1989, v1990);
        v249.pop_alpha();
        v1989[1] = v250.condition(v1989[3], v1991);
        v1989.w = v250.lerp(v1989.w, v1992, 16, 0.5);
        v1987 = v1987 + (v1989.w + (v249.style == 1 and 2 or -4)) * v1989[1];
        v1986.active_items = v1986.active_items + (v1989[1] > 0 and 1 or 0);
    end;
    v1986.size.x = v1987 + (v249.style == 1 and -2 or 6);
    if v1986.active_items == 0 then
        v1986.size.x = 66;
    end;
end;
v952.watermark.update = function(v1993)
    -- upvalues: v250 (ref), v510 (ref)
    local v1994 = v1993:get_drag_position();
    if v1993.align == 2 then
        v1993.pos.x = v1994.x - v1993.size.x * v1993.alpha;
    elseif v1993.align == 1 then
        v1993.pos.x = v1994.x - v1993.size.x * 0.5;
    end;
    return v250.condition(v1993.progress, v510.settings.watermark.value, 3, {
        [1] = {
            [1] = 1, 
            [2] = 4
        }, 
        [2] = {
            [1] = 3, 
            [2] = 4
        }
    });
end;
v952.watermark.paint = function(v1995, v1996, _)
    -- upvalues: v250 (ref), v510 (ref), v249 (ref), l_vector_0 (ref), v248 (ref), v184 (ref)
    v1995.logo = v250.condition(v1995.logop, not v510.settings.watermark[1].hide.value);
    if v1995.logo > 0 then
        v249.push_alpha(v1995.logo);
        if v1995.active_items > 0 then
            if v249.style == 1 then
                v249.side_v(v1996:clone(), l_vector_0(v1996.x + 64, v1996.y + 24));
                v249.logo(l_vector_0(v1996.x + 7, v1996.y + 5), true);
            else
                local v1998 = l_vector_0(v1996.x, v1996.y - 2);
                v249.side_h(v1998, l_vector_0(v1996.x + v1995.size.x, v1996.y + v1995.size.y));
                v249.text(v248.bold_d, l_vector_0(v1996.x + 8, v1996.y + 4), v184.text, nil, "hysteria");
            end;
        else
            v249.logo(l_vector_0(v1996.x + 8, v1996.y + 5), false);
        end;
        v249.pop_alpha();
    end;
    v1995:enumerate();
end;
v952.slowdown = v261.new("slowdown", l_vector_0(v228.x - 60, v228.y - 160), l_vector_0(120, 32), {
    rulers = {
        [1] = {
            [1] = true, 
            [2] = l_vector_0(v240.x, 0), 
            [3] = v239.y
        }
    }
});
v952.slowdown.speed = 0.5;
v952.slowdown.update = function(v1999)
    -- upvalues: v510 (ref), v502 (ref), v167 (ref), v250 (ref)
    if not v510.settings.slowdown.value or not v502.valid and v167.alpha <= 0 then
        return v250.condition(v1999.progress, false, -8);
    else
        v1999.speed = v502.valid and v502.self.m_flVelocityModifier or 1;
        return v250.condition(v1999.progress, v167.alpha > 0 or v502.valid and v1999.speed < 1, -8);
    end;
end;
v952.slowdown.style = {
    [1] = function(v2000, v2001, v2002)
        -- upvalues: l_color_0 (ref), v184 (ref), v249 (ref), l_vector_0 (ref), v262 (ref), v248 (ref), v35 (ref), v34 (ref)
        local v2003 = l_color_0(240, 60, 60):lerp(v184.text, v2000.speed);
        v249.blur(l_vector_0(v2001.x + 36, v2001.y + 1), l_vector_0(v2002.x, v2002.y - 1), 1, 1, 4);
        v249.rect(l_vector_0(v2001.x + 36, v2001.y + 1), l_vector_0(v2002.x, v2002.y - 1), v184.panel.l2, 4);
        v249.side_v(v2001, v2001 + 32);
        v249.texture(v262.warning, v2001 + 8, l_vector_0(16, 16), v2003);
        v249.text(v248.regular, l_vector_0(v2001.x + 44, v2001.y + 6), v184.text:alpha_modulate((1 - v2000.speed) * 196 + 64), nil, "slowed");
        v249.text(v248.regular, l_vector_0(v2002.x - 8, v2001.y + 6), v2003, "r", v35.format("%d%%", v2000.speed * 100));
        v249.rect(l_vector_0(v2001.x + 44, v2001.y + 21), l_vector_0(v2002.x - 8, v2001.y + 23), v184.white:alpha_modulate(32), 2);
        v249.rect(l_vector_0(v2001.x + 44, v2001.y + 21), l_vector_0(v34.lerp(v2001.x + 44, v2002.x - 8, v2000.speed), v2001.y + 23), v184.secondary:alpha_modulate(v2000.speed * 196 + 58), 2);
    end, 
    [2] = function(v2004, v2005, v2006)
        -- upvalues: l_color_0 (ref), v184 (ref), v249 (ref), v262 (ref), l_vector_0 (ref), v248 (ref), v35 (ref)
        local v2007 = l_color_0(240, 60, 60):lerp(v184.text, v2004.speed);
        local v2008 = (v2005.x + v2006.x) * 0.5;
        v249.texture(v262.warning, l_vector_0(v2008 - 8, v2005.y - 2), l_vector_0(16, 16), v2007);
        v249.text(v248.regular, l_vector_0(v2008, v2005.y + 20), v184.text, "c", "slowed down");
        v249.text(v248.regular, l_vector_0(v2008, v2005.y + 32), v2007:alpha_modulate((1 - v2004.speed) * 196 + 64), "c", v35.format("%d%%", v2004.speed * 100));
    end
};
v952.slowdown.paint = function(v2009, v2010, v2011)
    -- upvalues: v249 (ref)
    v2009.style[v249.style](v2009, v2010, v2011);
end;
v952.lchelper = v261.new("lchelper", l_vector_0(v228.x - 60, v228.y - 118), l_vector_0(120, 32), {
    rulers = {
        [1] = {
            [1] = true, 
            [2] = l_vector_0(v240.x, 0), 
            [3] = v239.y
        }
    }
});
v953 = v952.lchelper;
v1956 = "last_charge";
l_watermark_0 = v952.lchelper;
v1958 = "last_discharge_lc";
l_watermark_1 = v952.lchelper;
v1960 = "last_lc";
v1961 = 0;
v1962 = 0;
l_watermark_1[v1960] = 0;
l_watermark_0[v1958] = v1962;
v953[v1956] = v1961;
v952.lchelper.timer = nil;
v952.lchelper.breaking = false;
v952.lchelper.discharging = false;
v952.lchelper.praise = {
    [0] = {
        "failed", 
        l_color_0("FF4040")
    }, 
    [1] = {
        "bad", 
        l_color_0("FFAF68")
    }, 
    [2] = {
        "bad", 
        l_color_0("FFAF68")
    }, 
    [3] = {
        "bad", 
        l_color_0("FFAF68")
    }, 
    [4] = {
        [1] = "ok", 
        [2] = v184.text
    }, 
    [5] = {
        [1] = "ok", 
        [2] = v184.text
    }, 
    [6] = {
        [1] = "ok", 
        [2] = v184.text
    }, 
    [7] = {
        "good", 
        l_color_0("CDEC8E")
    }, 
    [8] = {
        "good", 
        l_color_0("CDEC8E")
    }, 
    [9] = {
        "good", 
        l_color_0("CDEC8E")
    }, 
    [10] = {
        "nice", 
        l_color_0("7AF1B6")
    }, 
    [11] = {
        "nice", 
        l_color_0("7AF1B6")
    }, 
    [12] = {
        "ideal lc", 
        l_color_0("65D5FF")
    }, 
    [13] = {
        "lc god", 
        l_color_0("CF91FF")
    }, 
    [14] = {
        "the world threat", 
        l_color_0("FF0000")
    }
};
v952.lchelper.update = function(v2012)
    -- upvalues: v510 (ref), v502 (ref), v167 (ref), v250 (ref), v183 (ref)
    if not v510.settings.lchelper.value or not v502.valid and v167.alpha <= 0 then
        return v250.condition(v2012.progress, false, -8);
    else
        local v2013 = (v183.rage.main.dt.lag:get_override() or v183.rage.main.dt.lag.value) == "Always On";
        local v2014 = (v183.rage.main.hs.options:get_override() or v183.rage.main.hs.options.value) == "Break LC";
        v2012.breaking = v2013 or v2014 or v2012.timer or v502.exploit.lc_left > 0;
        if v510.settings.lchelper.bar.value then
            if v2012.breaking and v502.jumping then
                v2012.progress[1] = 1;
            end;
            v2012.size.y = v2012.timer and 34 or 21;
            return v250.condition(v2012.progress, v167.alpha > 0 or v502.valid and v2012.breaking and (v502.jumping or v2012.timer), -8);
        else
            if v2012.timer and v502.jumping then
                v2012.progress[1] = 1;
            end;
            v2012.size.y = 21;
            return v250.condition(v2012.progress, v167.alpha > 0 or v502.valid and v2012.breaking and v2012.timer, -8);
        end;
    end;
end;
v952.lchelper.check = function(_)
    -- upvalues: v952 (ref), v510 (ref), v502 (ref), v188 (ref)
    local l_lchelper_0 = v952.lchelper;
    if not v510.settings.lchelper.value then
        return;
    else
        local l_charge_0 = v502.exploit.charge;
        if l_charge_0 < l_lchelper_0.last_charge and v502.jumping and not l_lchelper_0.discharging then
            l_lchelper_0.discharging = true;
            l_lchelper_0.timer = globals.realtime + (l_lchelper_0.last_lc == 14 and 2 or 0.66);
            l_lchelper_0.last_discharge_lc = l_lchelper_0.last_lc;
            if l_lchelper_0.last_discharge_lc >= 13 then
                v188.stats.god_lc = v188.stats.god_lc + 1;
            end;
            if l_lchelper_0.last_discharge_lc == 14 then
                v188.stats.wt_lc = v188.stats.wt_lc + 1;
            end;
        end;
        if l_lchelper_0.discharging and l_charge_0 == 0 then
            l_lchelper_0.discharging = false;
        end;
        if l_lchelper_0.timer and globals.realtime > l_lchelper_0.timer then
            l_lchelper_0.timer = nil;
        end;
        l_lchelper_0.last_charge = v502.exploit.charge;
        l_lchelper_0.last_lc = v502.exploit.lc_left;
        return;
    end;
end;
v952.lchelper.paint = function(v2018, v2019, v2020)
    -- upvalues: v510 (ref), v249 (ref), v184 (ref), v34 (ref), v502 (ref), l_vector_0 (ref), v167 (ref), v35 (ref), v248 (ref)
    local l_value_13 = v510.settings.lchelper.bar.value;
    if l_value_13 then
        v249.blur(v2019, v2020, 1, 1, 4);
        v249.rect(v2019, v2020, v184.panel.l2, 4);
    end;
    if l_value_13 then
        local v2022 = v34.clamp((v2018.timer and v2018.last_discharge_lc or v502.exploit.lc_left) / 12, 0, 1);
        local v2023 = l_vector_0(v34.lerp(v2020.x - 12, v2019.x + 4, v2022), v2020.y - 4);
        local v2024 = v2018.timer and v2018.last_discharge_lc or v2018.breaking and v502.exploit.lc_left or -1;
        v249.rect(l_vector_0(v2019.x + 8, v2020.y - 12), l_vector_0(v2019.x + 8 + 6, v2020.y - 8), v2018.praise[12][2]:alpha_modulate(v2024 == 12 and 1 or 0.33, true));
        v249.rect(l_vector_0(v2019.x + 8 + 7, v2020.y - 12), l_vector_0(v2019.x + 8 + 24, v2020.y - 8), v2018.praise[11][2]:alpha_modulate(v2024 <= 11 and v2024 > 9 and 1 or 0.33, true));
        v249.rect(l_vector_0(v2019.x + 8 + 25, v2020.y - 12), l_vector_0(v2019.x + 8 + 50, v2020.y - 8), v2018.praise[9][2]:alpha_modulate(v2024 <= 9 and v2024 > 6 and 1 or 0.33, true));
        v249.rect(l_vector_0(v2019.x + 8 + 51, v2020.y - 12), l_vector_0(v2019.x + 8 + 76, v2020.y - 8), v2018.praise[6][2]:alpha_modulate(v2024 <= 6 and v2024 > 3 and 1 or 0.33, true));
        v249.rect(l_vector_0(v2019.x + 8 + 77, v2020.y - 12), l_vector_0(v2019.x + 8 + 96, v2020.y - 8), v2018.praise[3][2]:alpha_modulate(v2024 <= 3 and v2024 > 0 and 1 or 0.33, true));
        v249.rect(l_vector_0(v2019.x + 8 + 97, v2020.y - 12), l_vector_0(v2019.x + 8 + 104, v2020.y - 8), v2018.praise[0][2]:alpha_modulate(v2024 == 0 and 1 or 0.3, true));
        if v2018.breaking then
            v249.poly(v184.white, v2023 + l_vector_0(0, 4), v2023 + l_vector_0(4, 0), v2023 + l_vector_0(8, 4));
        end;
    end;
    local l_timer_0 = v2018.timer;
    if not l_value_13 then
        l_timer_0 = v2018.alpha > 0 or v167.alpha > 0;
    end;
    if l_timer_0 then
        local v2026 = v2018.praise[v2018.last_discharge_lc];
        local l_last_discharge_lc_0 = v2018.last_discharge_lc;
        if l_value_13 then
            local v2028 = v35.format("\a%s%s", v2026[2]:to_hex(), v2026[1]);
            v249.text(l_last_discharge_lc_0 == 14 and v248.bold or v248.regular, l_vector_0((v2019.x + v2020.x) * 0.5, v2019.y + 10), v184.text, "c", v2028);
            v249.text(v248.regular, l_vector_0(v2020.x - 8, v2019.y + 5), v184.text:alpha_modulate(0.33, true), "r", l_last_discharge_lc_0);
        else
            local v2029;
            if v167.alpha > 0 and not v2018.timer then
                v2029 = "lc status";
            else
                v2029 = v35.format("\a%s%s", v2026[2]:to_hex(), v2026[1], l_last_discharge_lc_0);
            end;
            local v2030 = l_last_discharge_lc_0 == 14 and v34.random(-1, 1) or 0;
            v249.text(l_last_discharge_lc_0 == 14 and v248.bold_d or v248.regular_d, l_vector_0((v2019.x + v2020.x) * 0.5 + v2030, v2019.y + 4), v184.text, "c", v2029);
            v249.text(v248.regular_d, l_vector_0((v2019.x + v2020.x) * 0.5, v2019.y + 17), v184.text:alpha_modulate(0.5, true), "c", l_last_discharge_lc_0 .. "t");
        end;
    end;
end;
v510.settings.lchelper:set_callback(function(v2031)
    -- upvalues: v185 (ref), v952 (ref)
    v185.createmove(v952.lchelper.check, v2031.value);
end, true);
v952.keylist = v261.new("keylist", l_vector_0(v228.x - 400, v228.y), l_vector_0(120, 22), true);
v952.keylist.format = {
    knames = l_setmetatable_0({}, {
        mode = "kv"
    }), 
    name = function(v2032, v2033)
        -- upvalues: v35 (ref), v184 (ref)
        if not v2032.knames[v2033] then
            local l_v2033_0 = v2033;
            local v2035 = 0;
            local v2036 = 0;
            local v2037 = 0;
            local v2038, v2039 = v35.gsub(l_v2033_0, "\a{Link Active}", "\f");
            v2035 = v2039;
            v2038, v2039 = v35.gsub(v2038, "[\t\226\128\138]", {
                ["\t"] = "  ", 
                ["\226\128\138"] = ""
            });
            v2036 = v2039;
            l_v2033_0 = v2038;
            if v2036 == 0 then
                v2038, v2039 = v35.gsub(l_v2033_0, " %a", v35.lower);
                v2037 = v2039;
                l_v2033_0 = v2038;
            end;
            v2032.knames[v2033] = l_v2033_0;
        end;
        return v35.gsub(v2032.knames[v2033], "\f", v184.hex, 1), nil;
    end, 
    state = function(_, v2041)
        -- upvalues: l_type_0 (ref), v35 (ref), v33 (ref)
        local v2042 = l_type_0(v2041);
        if v2042 == "boolean" then
            return v2041 and "on" or "off";
        elseif v2042 == "table" then
            local v2043 = {};
            for v2044 = 1, #v2041 do
                v2043[v2044] = v35.sub(v2041[v2044], 1, 1);
            end;
            return v33.concat(v2043, ", ");
        else
            return v2041;
        end;
    end, 
    state2 = function(_, v2046, v2047)
        -- upvalues: l_type_0 (ref), v35 (ref), v33 (ref)
        local v2048 = l_type_0(v2046);
        if v2048 == "boolean" then
            if v2047 == 1 then
                return v2046 and "holding" or "holding";
            else
                return v2046 and "toggled" or "disabled";
            end;
        elseif v2048 == "table" then
            local v2049 = {};
            for v2050 = 1, #v2046 do
                v2049[v2050] = v35.sub(v2046[v2050], 1, 1);
            end;
            return v33.concat(v2049, ", ");
        else
            return v2046;
        end;
    end
};
v952.keylist.draw_item = {
    [1] = function(v2051, v2052, v2053, v2054)
        -- upvalues: l_vector_0 (ref), v249 (ref), v184 (ref), v248 (ref)
        local v2055 = nil;
        local v2056 = nil;
        v2055 = l_vector_0(v2051.pos.x + 4, v2051.pos.y + v2053 + 28 * (v2052.active and v2054 or 1));
        v2056 = l_vector_0(v2051.size.x - 8, 20);
        v249.blur(v2055, v2055 + v2056, 1, 1, 4);
        v249.rect(v2055, v2055 + v2056, v184.panel.l2, 4);
        local v2057 = v2051.format:name(v2052.name);
        local v2058 = v2051.format:state(v2052.value);
        v249.text(v248.regular, l_vector_0(v2055.x + 6, v2055.y + 3), v184.text, nil, v2057);
        v249.text(v248.regular, l_vector_0(v2055.x + v2056.x - 6, v2055.y + 3), v184.secondary, "r", v2058);
        local l_x_3 = v249.measure_text(v248.regular, v2057).x;
        local l_x_4 = v249.measure_text(v248.regular, v2058).x;
        return l_vector_0(l_x_3 + l_x_4 + 32, v2056.y + 2);
    end, 
    [2] = function(v2061, v2062, v2063, v2064)
        -- upvalues: l_vector_0 (ref), v35 (ref), v249 (ref), v248 (ref), v184 (ref)
        local v2065 = nil;
        local v2066 = nil;
        v2065 = l_vector_0(v2061.pos.x + 4, v2061.pos.y + v2063 + 21 * (v2062.active and v2064 or 1));
        v2066 = l_vector_0(v2061.size.x - 8, 14);
        local v2067 = v35.lower(v2061.format:name(v2062.name));
        local v2068 = v2061.format:state2(v2062.value, v2062.state);
        v249.text(v248.regular, l_vector_0(v2065.x, v2065.y + 3), v184.text, nil, v2067);
        v249.text(v248.regular, l_vector_0(v2065.x + v2066.x, v2065.y + 3), v184.text:alpha_modulate(0.5, true), "r", v2068);
        local l_x_5 = v249.measure_text(v248.regular, v2067).x;
        local l_x_6 = v249.measure_text(v248.regular, v2068).x;
        return l_vector_0(l_x_5 + l_x_6 + 32, v2066.y + 2);
    end
};
v952.keylist:enlist(function()
    -- upvalues: v504 (ref)
    return v504;
end, function(v2071, v2072, v2073, v2074)
    -- upvalues: v952 (ref), v249 (ref)
    return v952.keylist.draw_item[v249.style](v2071, v2072, v2073, v2074);
end);
v952.keylist.update = function(v2075)
    -- upvalues: v250 (ref), v510 (ref), v167 (ref)
    return v250.condition(v2075.progress, v510.settings.keylist.value and (v167.alpha > 0 or v2075.__list.active > 0));
end;
v952.keylist.paint = function(v2076, v2077, v2078)
    -- upvalues: v249 (ref), v35 (ref), v184 (ref), v167 (ref), v248 (ref), l_vector_0 (ref)
    v249.side_h(v2077, v2078);
    if v249.style == 1 then
        local v2079 = v35.format("%s%s\aDEFAULT %s", v184.hex, v167.get_icon("link-simple"), "Hotkeys");
        v249.text(v248.regular, l_vector_0(v2077.x + v2076.size.x * 0.5, v2077.y + 11), v184.text, "c", v2079);
    else
        v249.text(v248.regular, l_vector_0(v2077.x + v2076.size.x * 0.5, v2077.y + 11), v184.text, "c", "keybinds");
    end;
end;
v952.speclist = v261.new("speclist", l_vector_0(v228.x + 280, v228.y), l_vector_0(120, 22), true);
v952.speclist.draw_item = {
    [1] = function(v2080, v2081, v2082, v2083)
        -- upvalues: l_vector_0 (ref), v249 (ref), v184 (ref), v248 (ref)
        local v2084 = l_vector_0(v2080.pos.x + 4, v2080.pos.y + v2082 + 28 * (v2081.active and v2083 or 1));
        local v2085 = l_vector_0(v2080.size.x - 8, 20);
        local v2086 = v2084 + v2085;
        v249.blur(v2084, v2084 + v2085, 1, 1, 4);
        v249.rect(v2084, v2084 + v2085, v184.panel.l2, 4);
        local l_nick_0 = v2081.nick;
        local v2088 = v2081.ent:get_steam_avatar();
        v249.texture(v2088, l_vector_0(v2086.x - 20, v2084.y + 2), l_vector_0(16, 16), nil, nil, 8);
        v249.text(v248.regular, l_vector_0(v2084.x + 6, v2084.y + 3), v184.text, nil, l_nick_0);
        local l_x_7 = v249.measure_text(v248.regular, l_nick_0).x;
        return l_vector_0(l_x_7 + 40, 22);
    end, 
    [2] = function(v2090, v2091, v2092, v2093)
        -- upvalues: l_vector_0 (ref), v249 (ref), v248 (ref), v184 (ref)
        local v2094 = l_vector_0(v2090.pos.x + 4, v2090.pos.y + v2092 + 21 * (v2091.active and v2093 or 1));
        local v2095 = l_vector_0(v2090.size.x - 8, 14);
        local v2096 = v2094 + v2095;
        local l_nick_1 = v2091.nick;
        local v2098 = v2091.ent:get_steam_avatar();
        v249.texture(v2098, l_vector_0(v2096.x - 14, v2094.y + 2), l_vector_0(14, 14), nil, nil, 8);
        v249.text(v248.regular, l_vector_0(v2094.x, v2094.y + 3), v184.text, nil, l_nick_1);
        local l_x_8 = v249.measure_text(v248.regular, l_nick_1).x;
        return l_vector_0(l_x_8 + 40, v2095.y + 2);
    end
};
v952.speclist:enlist(function()
    -- upvalues: v502 (ref), v503 (ref), v35 (ref)
    local v2100 = {};
    if v502.valid then
        local v2101 = nil;
        if v502.self.m_hObserverTarget and (v502.self.m_iObserverMode == 4 or v502.self.m_iObserverMode == 5) then
            v2101 = v502.self.m_hObserverTarget;
        else
            v2101 = v502.self;
        end;
        for v2102 = 1, #v503 do
            local v2103 = v503[v2102];
            if v2103 and not v2103:is_dormant() then
                local l_m_hObserverTarget_0 = v2103.m_hObserverTarget;
                local l_m_iObserverMode_0 = v2103.m_iObserverMode;
                v2100[#v2100 + 1] = {
                    name = v2103:get_xuid(), 
                    ent = v2103, 
                    nick = v35.limit(v2103:get_name(), 20, "\aFFFFFF80..."), 
                    active = l_m_hObserverTarget_0 and l_m_hObserverTarget_0 == v2101 and v2103 ~= v502.self and (not (l_m_iObserverMode_0 ~= 4) or l_m_iObserverMode_0 == 5)
                };
            end;
        end;
    end;
    return v2100;
end, function(v2106, v2107, v2108, v2109)
    -- upvalues: v952 (ref), v249 (ref)
    return v952.speclist.draw_item[v249.style](v2106, v2107, v2108, v2109);
end);
v185.round_start:set(function()
    -- upvalues: v952 (ref)
    local l___list_2 = v952.speclist.__list;
    local l___list_3 = v952.speclist.__list;
    local v2112 = {};
    l___list_3.progress = {};
    l___list_2.items = v2112;
end);
v952.speclist.update = function(v2113)
    -- upvalues: v250 (ref), v510 (ref), v167 (ref)
    return v250.condition(v2113.progress, v510.settings.speclist.value and (v167.alpha > 0 or v2113.__list.active > 0));
end;
v952.speclist.paint = function(v2114, v2115, v2116)
    -- upvalues: v249 (ref), v35 (ref), v184 (ref), v167 (ref), v248 (ref), l_vector_0 (ref)
    v249.side_h(v2115, v2116);
    if v249.style == 1 then
        local v2117 = v35.format("%s%s\aDEFAULT  %s \aFFFFFF60(%d)", v184.hex, v167.get_icon("glasses-round"), "Spectators", v2114.__list.active);
        v249.text(v248.regular, l_vector_0(v2115.x + v2114.size.x * 0.5, v2115.y + 11), v184.text, "c", v2117);
    else
        v249.text(v248.regular, l_vector_0(v2115.x + v2114.size.x * 0.5, v2115.y + 11), v184.text, "c", "spectators");
    end;
end;
v952.arrows = v261.new("arrows", l_vector_0(v240.x - 40, v240.y - 4), l_vector_0(10, 10), {
    border = {
        l_vector_0(v240.x - 120, v240.y + 1), 
        l_vector_0(v240.x - 10, v240.y + 1)
    }, 
    rulers = {
        [1] = {
            [1] = false, 
            [2] = l_vector_0(v240.x - 120, v240.y), 
            [3] = v240.x - 10
        }
    }
});
v952.arrows.sides = {
    l = {
        [1] = 0
    }, 
    r = {
        [1] = 0
    }
};
v952.arrows.update = function(v2118)
    -- upvalues: v502 (ref), v510 (ref), v250 (ref), v167 (ref)
    if v502.in_score then
        v2118.progress[1] = 0;
        return 0;
    elseif not v510.settings.arrows.value then
        return v250.condition(v2118.progress, false, -8);
    else
        return v250.condition(v2118.progress, v502.valid or v167.alpha > 0, -8);
    end;
end;
v952.arrows.paint = function(v2119, v2120, _)
    -- upvalues: v184 (ref), v34 (ref), v514 (ref), v249 (ref), v250 (ref), v167 (ref), v262 (ref), l_vector_0 (ref), v227 (ref)
    local v2122 = v184.white:alpha_modulate(128);
    local v2123 = v34.normalize_yaw(v514.data.freestand and v514.data.freestand - v249.camera_angles().y or 0);
    local v2124 = v250.condition(v2119.sides.l, v514.data.manual_yaw == -90 or v2123 > 70 and v2123 < 110, -12);
    v249.push_alpha((not (v167.alpha ~= 0) or v2124 > 0) and v2124 or v167.alpha);
    v249.texture(v262.manual, v2120, l_vector_0(11, 10), v2122:lerp(v184.secondary, v2124));
    v249.pop_alpha();
    local v2125 = v250.condition(v2119.sides.r, v514.data.manual_yaw == 90 or v2123 < -70 and v2123 > -110, -12);
    v249.push_alpha((not (v167.alpha ~= 0) or v2125 > 0) and v2125 or v167.alpha);
    v249.push_rotation(270);
    v249.texture(v262.manual, l_vector_0(v227.x - v2120.x - 9, v2120.y), l_vector_0(11, 10), v2122:lerp(v184.secondary, v2125));
    v249.pop_alpha();
    v249.pop_rotation();
end;
v952.damage = v261.new("damage", l_vector_0(v228.x + 4, v228.y + 4), l_vector_0(6, 4), {
    border = {
        [1] = nil, 
        [2] = nil, 
        [3] = true, 
        [1] = v240 - 40, 
        [2] = v240 + 40
    }
});
v952.damage.dmg = v183.rage.selection.damage.value;
v953 = v952.damage;
v1956 = "ovr_progress";
l_watermark_0 = v952.damage;
v1958 = "ovr_alpha";
l_watermark_1 = {
    [1] = 0
};
l_watermark_0[v1958] = 0;
v953[v1956] = l_watermark_1;
v952.damage.fonts = {
    [1] = 2, 
    [2] = nil, 
    [3] = nil, 
    [4] = 1, 
    [2] = v248.small_d, 
    [3] = v248.regular_d
};
v952.damage.update = function(v2126)
    -- upvalues: v502 (ref), v510 (ref), v250 (ref), v505 (ref), v183 (ref), v167 (ref)
    if v502.in_score then
        v2126.progress[1] = 0;
        return 0;
    elseif not v510.settings.damage.value then
        return v250.condition(v2126.progress, false, -8);
    else
        local v2127 = true;
        if v510.settings.damage.sw.value then
            v2127 = v505["min. damage"] ~= nil;
        end;
        local v2128 = v183.rage.selection.damage:get();
        v2126.dmg = v510.settings.damage.anim.value and v250.lerp(v2126.dmg, v2128, 16) or v2128;
        v2126.ovr_alpha = v250.condition(v2126.ovr_progress, v2127, -8);
        local v2129 = v502.weapon and v502.weapon_t;
        local v2130 = v2129 and v2129.weapon_type ~= 9 and v2129.weapon_type ~= 0;
        return v250.condition(v2126.progress, v502.valid and (v2130 or v167.alpha > 0) and globals.is_in_game, -8);
    end;
end;
v952.damage.paint = function(v2131, v2132, _)
    -- upvalues: v34 (ref), l_tostring_0 (ref), v249 (ref), v510 (ref), v184 (ref)
    local v2134 = v34.round(v2131.dmg);
    v2134 = v2134 == 0 and "A" or v2134 > 100 and "+" .. v2134 - 100 or l_tostring_0(v2134);
    v2131.size = v249.measure_text(2, v2134);
    v249.text(v2131.fonts[v510.settings.damage.font.value], v2132, v184.text:alpha_modulate(v2131.ovr_alpha * 0.5 + 0.5, true), nil, v2134);
end;
v952.logs = v261.new("logs", l_vector_0(v228.x - 150, v228.y + 160), l_vector_0(300, 24), {
    rulers = {
        [1] = {
            [1] = true, 
            [2] = l_vector_0(v240.x, 0), 
            [3] = v239.y
        }
    }
});
v952.logs.data = {
    p1 = {
        [1] = 0
    }, 
    p2 = {
        [1] = 0
    }
};
v953 = v952.logs;
v1956 = "preview";
l_watermark_0 = v952.logs;
v1958 = "dummy";
l_watermark_1 = 0;
l_watermark_0[v1958] = {
    [1] = {
        text = "\ab6ff57FF\226\128\162\aE6E6E660 Killed \aE6E6E6FFmaj0r\aE6E6E660 in \aE6E6E6FFhead", 
        event = "hit", 
        time = v34.huge, 
        progress = {
            [1] = 0
        }
    }, 
    [2] = {
        text = "\ab8a6ffFF\226\128\162\aE6E6E660 Missed \aE6E6E6FFenQ\aE6E6E660's\aE6E6E6FF head\aE6E6E660 due to \aE6E6E6FFunpredicted occasion", 
        event = "miss", 
        time = v34.huge, 
        progress = {
            [1] = 0
        }
    }, 
    [3] = {
        text = "\aff5c5cFF\226\128\162\aE6E6E660 Harmed by \aE6E6E6FFenQ\aE6E6E660 in \aE6E6E6FFhead\aE6E6E660 for \aE6E6E6FF72", 
        event = "harm", 
        time = v34.huge, 
        progress = {
            [1] = 0
        }
    }
};
v953[v1956] = l_watermark_1;
v952.logs.update = function(v2135)
    -- upvalues: v250 (ref), v510 (ref)
    return v250.condition(v2135.progress, v510.settings.logs.value and globals.is_in_game and v510.settings.logs.sc.value);
end;
v952.logs.part = {
    [1] = function(v2136, v2137, v2138, v2139, v2140, v2141)
        -- upvalues: v249 (ref), v248 (ref), l_vector_0 (ref), v34 (ref), v184 (ref), v262 (ref)
        local v2142 = v249.measure_text(v248.regular, v2137.text).x + 32;
        local v2143 = l_vector_0(v34.lerp(v2136.pos.x + v2136.size.x * 0.5 - v2142 * 0.5 - 4, v2136.pos.x, v2136.align), v2136.pos.y + v2138);
        if not v2140 then
            v2143.x = v2143.x + (1 - v2139) * (v2142 * 0.5) * (v2136.align == 0 and v2141 % 2 == 0 and 1 or -1);
        end;
        v249.blur(l_vector_0(v2143.x + 27, v2143.y + 1), l_vector_0(v2143.x + v2142 + 8, v2143.y + 23), 1, 1, 4);
        v249.rect(l_vector_0(v2143.x + 27, v2143.y + 1), l_vector_0(v2143.x + v2142 + 8, v2143.y + 23), v184.panel.l2, 4);
        v249.text(v248.regular, l_vector_0(v2143.x + 33, v2143.y + 5), v184.text, nil, v2137.text);
        v249.side_v(v2143, v2143 + 24);
        v249.texture(v262.bfly, v2143 + 8, l_vector_0(9, 9), v184.accent);
    end, 
    [2] = function(v2144, v2145, v2146, v2147, v2148, v2149)
        -- upvalues: v249 (ref), v248 (ref), l_vector_0 (ref), v34 (ref), v184 (ref)
        local l_x_9 = v249.measure_text(v248.regular, v2145.text).x;
        local v2151 = l_vector_0(v34.lerp(v2144.pos.x + v2144.size.x * 0.5 - l_x_9 * 0.5 - 4, v2144.pos.x, v2144.align), v2144.pos.y + v2146);
        if not v2148 then
            v2151.x = v2151.x + (1 - v2147) * (l_x_9 * 0.5) * (v2144.align == 0 and v2149 % 2 == 0 and 1 or -1);
        end;
        v249.text(v248.regular, l_vector_0(v2151.x, v2151.y + 5), v184.text, nil, v2145.text);
    end
};
v952.logs.paint = function(v2152, _, _)
    -- upvalues: v250 (ref), v167 (ref), v757 (ref), v510 (ref), v227 (ref), v174 (ref), v249 (ref), v33 (ref)
    v2152.preview = v250.condition(v2152.data.p1, v167.alpha > 0 and #v757.list == 0 and v510.settings.logs.sc.value);
    v2152.align = v250.condition(v2152.data.p2, v2152.pos.x < v227.x / 3);
    local v2155 = 0;
    local v2156 = nil;
    local v2157 = v2152.preview > 0 and v2152.dummy or v757.list;
    for v2158 = 1, #v2157 do
        local v2159 = v2157[v2158];
        local v2160 = globals.realtime - v2159.time < 4 and v2158 < 8;
        local v2161 = v250.condition(v2159.progress, v174(v2152.preview > 0, v2152.preview == 1, v2160));
        if v2161 == 0 then
            v2156 = v2158;
        end;
        v249.push_alpha(v2161);
        v2152.part[v249.style](v2152, v2159, v2155, v2161, v2160, v2158);
        v249.pop_alpha();
        v2155 = v2155 + (v249.style == 1 and 28 or 20) * (v2160 and v2161 or 1);
    end;
    if v2156 then
        v33.remove(v757.list, v2156);
    end;
end;
v952.process = v261.new("process", l_vector_0(v228.x - 68, v228.y - 320), l_vector_0(136, 22), true);
v952.process.draw_graph = function(v2162, v2163, v2164, v2165, v2166)
    -- upvalues: l_vector_0 (ref), v249 (ref)
    local v2167 = #v2164;
    for v2168 = 1, v2167 - 1 do
        local v2169 = v2168 + 1;
        local v2170 = v2163.z * v2168;
        local v2171 = v2163.z * v2169;
        local v2172 = 1 - v2164[v2168];
        local v2173 = 1 - v2164[v2169];
        local v2174 = l_vector_0(v2162.x + v2170, v2162.y + v2163.y * v2172);
        local v2175 = l_vector_0(v2162.x + v2171, v2162.y + v2163.y * v2173);
        local v2176 = v2166 and v2165:lerp(v2166, v2168 / v2167) or v2165;
        v249.line(v2174, v2175, v2176);
    end;
end;
v952.process.factors = {
    ex = {
        work = function(_, v2178, _, _)
            -- upvalues: l_vector_0 (ref), v952 (ref), v249 (ref), v184 (ref), v502 (ref), v248 (ref), v35 (ref), l_color_0 (ref)
            local v2181 = 40;
            local v2182 = l_vector_0(v2178.x + v952.process.size.x - 8, v2178.y + v2181);
            v249.blur(v2178, v2182, 1, 1, 4);
            v249.rect(v2178, v2182, v184.panel.l2, 4);
            local v2183 = v502.exploit.active == 0 and "~" or v502.exploit.active == 1 and "DOUBLE TAP" or "HIDE SHOTS";
            v249.text(v248.small, l_vector_0(v2178.x + 8, v2178.y + 5), v184.text:alpha_modulate(0.25, true), nil, "EXPLOIT");
            v249.text(v248.small, l_vector_0(v2182.x - 8, v2178.y + 5), v184.text, "r", v2183);
            local v2184 = rage.exploit:get();
            local v2185 = v35.format("%dt", v2184 * 14);
            local v2186 = v184.text:lerp(v184.secondary, v2184);
            v249.text(v248.regular, l_vector_0(v2178.x + 8, v2178.y + 20), v184.text, nil, "Shifted");
            v249.circle_outline(l_vector_0(v2182.x - 12, v2178.y + 27), l_color_0(255, 40), 5, 0, 1, 1.5);
            v249.circle_outline(l_vector_0(v2182.x - 12, v2178.y + 27), v2186, 5, 0, v2184, 1.5);
            v249.text(v248.regular, l_vector_0(v2182.x - 20, v2178.y + 20), v2186, "r", v2185);
            return v2181;
        end
    }, 
    aa = {
        naturality = 0, 
        h = 46, 
        work = function(v2187, v2188, _)
            -- upvalues: v510 (ref), v952 (ref), l_vector_0 (ref), v249 (ref), v184 (ref), v248 (ref), v250 (ref), v514 (ref), l_color_0 (ref), v386 (ref), v34 (ref)
            local l_value_14 = v510.antiaim.general.nature.value;
            local l_value_15 = v510.settings.process.graph.value;
            local v2192 = l_value_15 and 64 or l_value_14 and 46 or 40;
            local v2193 = v952.process.size.x - 8;
            local v2194 = l_vector_0(v2188.x + v2193, v2188.y + v2192);
            v249.blur(v2188, v2194, 1, 1, 4);
            v249.rect(v2188, v2194, v184.panel.l2, 4);
            v249.text(v248.small, l_vector_0(v2188.x + 8, v2188.y + 5), v184.text:alpha_modulate(0.25, true), nil, "ANTI-AIM");
            v249.text(v248.small, l_vector_0(v2194.x - 8, v2188.y + 5), v184.text, "r", l_value_14 and "NATURAL" or "REGULAR");
            local v2195 = 0;
            if not l_value_15 then
                if l_value_14 then
                    v2187.naturality = v250.lerp(v2187.naturality, v514.data.statew or 0, 24);
                    local l_naturality_0 = v2187.naturality;
                    local l_state_1 = v514.data.state;
                    local v2198 = v514.data.stateb or v514.data.state;
                    v249.text(v248.regular, l_vector_0(v2188.x + 8, v2188.y + 20 + v2195), l_color_0(240, 80):lerp(v184.accent, 1 - l_naturality_0), nil, v386.states[l_state_1][2]);
                    v249.text(v248.regular, l_vector_0(v2194.x - 8, v2188.y + 20 + v2195), l_color_0(240, 80):lerp(v184.secondary, l_naturality_0), "r", v386.states[v2198][2]);
                    local v2199 = v34.max(2, (v2193 - 16) * l_naturality_0);
                    local v2200 = v184.accent:lerp(v184.secondary, l_naturality_0);
                    v249.rect(l_vector_0(v2188.x + 8, v2188.y + 36 + v2195), l_vector_0(v2194.x - 8, v2188.y + 38 + v2195), l_color_0(255, 16), 2);
                    v249.gradient(l_vector_0(v2188.x + 8, v2188.y + 36 + v2195), l_vector_0(v2188.x + 8 + v2199, v2188.y + 38 + v2195), v184.accent, v2200, v184.accent, v2200, 2);
                    v2195 = v2195 + 24;
                else
                    local l_state_2 = v514.data.state;
                    v249.text(v248.regular, l_vector_0(v2188.x + 8, v2188.y + 20 + v2195), v184.text, nil, "State");
                    v249.text(v248.regular, l_vector_0(v2194.x - 8, v2188.y + 20 + v2195), v184.secondary, "r", v386.states[l_state_2][2]);
                    v2195 = v2195 + 16;
                end;
            else
                local v2202 = not v510.settings.style.blur.value;
                v249.line(l_vector_0(v2188.x + 8, v2188.y + 22), l_vector_0(v2194.x - 8, v2188.y + 22), l_color_0(255, 16));
                v249.line(l_vector_0(v2188.x + 8, v2188.y + 54), l_vector_0(v2194.x - 8, v2188.y + 54), l_color_0(255, 16));
                v952.process.draw_graph(l_vector_0(v2188.x - 3, v2188.y + 17), l_vector_0(120, 37, 12), v514.data.states_record, v2202 and v184.secondary or v184.accent:alpha_modulate(80), not v2202 and v184.secondary or nil);
            end;
            return v2192;
        end
    }, 
    ven = {
        progress = {
            [1] = {
                [1] = 0
            }, 
            [2] = {
                [1] = 0
            }, 
            [3] = {
                [1] = 0
            }
        }, 
        work = function(_, v2204, _)
            -- upvalues: l_vector_0 (ref), v952 (ref), v514 (ref), v249 (ref), v184 (ref), v248 (ref), v35 (ref)
            local v2206 = 40;
            local v2207 = l_vector_0(v2204.x + v952.process.size.x - 8, v2204.y + v2206);
            local l_values_0 = v514.venture.values;
            if not v514.scenery.theatre.venture then
                local _ = {
                    long = {
                        gaslight = false
                    }, 
                    short = {
                        diversity = 0, 
                        evasion = false, 
                        tension = 0
                    }
                };
            end;
            v249.blur(v2204, v2207, 1, 1, 4);
            v249.rect(v2204, v2207, v184.panel.l2, 4);
            v249.text(v248.small, l_vector_0(v2204.x + 8, v2204.y + 5), v184.text:alpha_modulate(0.25, true), nil, "VENTURE");
            v249.text(v248.regular, l_vector_0(v2204.x + 8, v2204.y + 20), v184.text, nil, v35.format("G %s%.1f\aFFFFFF40 | \aDEFAULTE %s%.1f\aFFFFFF40 | \aDEFAULTT %s%d%%", v184.hex2, l_values_0.gaslight, v184.hex2, l_values_0.evasion * 10, v184.hex2, l_values_0.tension * 100));
            return v2206;
        end
    }
};
v952.process:enlist(function()
    -- upvalues: v183 (ref), v510 (ref)
    return {
        [1] = {
            name = "ex", 
            active = v183.rage.main.dt.value or v183.rage.main.hs.value
        }, 
        [2] = {
            name = "aa", 
            active = v510.antiaim.enable.value
        }
    };
end, function(v2210, v2211, v2212, v2213)
    -- upvalues: l_vector_0 (ref)
    local v2214 = l_vector_0(v2210.pos.x + 4, v2210.pos.y + v2212 + 28 * (v2211.active and v2213 or 1));
    local v2215 = l_vector_0(v2210.size.x - 8, 56);
    if v2210.factors[v2211.name] then
        local v2216 = v2210.factors[v2211.name]:work(v2214, v2213);
        return l_vector_0(120, (v2216 or v2215.y) + 2);
    else
        return l_vector_0(120, 0);
    end;
end);
v952.process.update = function(v2217)
    -- upvalues: v249 (ref), v250 (ref), v510 (ref), v167 (ref), v502 (ref)
    if v249.style == 1 then
        return v250.condition(v2217.progress, v510.settings.process.value and (v167.alpha > 0 or v502.valid and v2217.__list.active > 0));
    else
        return v250.condition(v2217.progress, v510.settings.process.value and (v167.alpha > 0 or v502.valid));
    end;
end;
v952.process.paint = function(_, v2219, v2220)
    -- upvalues: v249 (ref), v35 (ref), v184 (ref), v167 (ref), v248 (ref), l_vector_0 (ref)
    local v2221 = entity.get_threat();
    v249.side_h(v2219, v2220);
    local v2222 = v35.format("%s%s\aDEFAULT  Process", v184.hex, v167.get_icon("shield"));
    v249.text(v248.regular, l_vector_0(v2219.x + 8, v2219.y + 5), v184.text, nil, v2222);
    v249.text(v248.regular, l_vector_0(v2220.x - 8, v2219.y + 5), v184.text:alpha_modulate(0.5, true), "r", v2221 and v35.limit(v2221:get_name(), 7, true) or "~");
end;
v952.process.alt = function(v2223)
    -- upvalues: v249 (ref), v248 (ref), l_vector_0 (ref), v228 (ref), v184 (ref), v506 (ref), v514 (ref), v386 (ref), v510 (ref), v35 (ref), v502 (ref), v183 (ref)
    v2223.alpha = v2223:update();
    v249.push_alpha(v2223.alpha);
    local v2224 = 0;
    v249.text(v248.bold_d, l_vector_0(32, v228.y + v2224), v184.text, nil, v184.hex .. "hysteria\aDEFAULT \226\128\148 anti-aim panel");
    v2224 = v2224 + 14;
    v249.text(v248.regular_d, l_vector_0(32, v228.y + v2224), v184.text:alpha_modulate(0.33, true), nil, v506.build);
    v2224 = v2224 + 20;
    v249.text(v248.regular_d, l_vector_0(32, v228.y + v2224), v184.text, nil, "aa");
    local v2225 = v514.data.state and v386.states[v514.data.state][1] or "unk";
    v2224 = v2224 + 14;
    v249.text(v248.regular_d, l_vector_0(32, v228.y + v2224), v184.text, nil, "- current state: " .. v2225);
    if v510.antiaim.general.nature.value then
        local v2226 = v514.data.stateb and v386.states[v514.data.stateb][1] or "unk";
        v2224 = v2224 + 14;
        v249.text(v248.regular_d, l_vector_0(32, v228.y + v2224), v184.text, nil, "- next state: " .. v2226);
        v2224 = v2224 + 14;
        v249.text(v248.regular_d, l_vector_0(32, v228.y + v2224), v184.text, nil, v35.format("- naturality bias: %.2f", v514.data.statew or 0));
    end;
    if v502.exploit.active then
        v2224 = v2224 + 20;
        v249.text(v248.regular_d, l_vector_0(32, v228.y + v2224), v184.text, nil, "exp");
        v2224 = v2224 + 14;
        v249.text(v248.regular_d, l_vector_0(32, v228.y + v2224), v184.text, nil, "- type: " .. (v502.exploit.active == 1 and "dt" or "osaa"));
        v2224 = v2224 + 14;
        v249.text(v248.regular_d, l_vector_0(32, v228.y + v2224), v184.text, nil, v35.format("- charge: %d%%", rage.exploit:get() * 100));
    end;
    local v2227 = (v183.rage.main.dt.lag:get_override() or v183.rage.main.dt.lag.value) == "Always On";
    local v2228 = (v183.rage.main.hs.options:get_override() or v183.rage.main.hs.options.value) == "Break LC";
    if v2227 or v2228 or v2223.timer or v502.exploit.lc_left > 0 then
        v2224 = v2224 + 20;
        v249.text(v248.regular_d, l_vector_0(32, v228.y + v2224), v184.text, nil, "lc");
        v2224 = v2224 + 14;
        v249.text(v248.regular_d, l_vector_0(32, v228.y + v2224), v184.text, nil, "- active: " .. (v502.exploit.defensive and "+" or "-"));
        v2224 = v2224 + 14;
        v249.text(v248.regular_d, l_vector_0(32, v228.y + v2224), v184.text, nil, "- ticks left: " .. v502.exploit.lc_left);
    end;
    v249.pop_alpha();
end;
v952.process.nwater = function()
    -- upvalues: v249 (ref), v262 (ref), l_vector_0 (ref), v228 (ref), v227 (ref), v184 (ref)
    v249.texture(v262.bfly, l_vector_0(v228.x - 3, v227.y - 16), l_vector_0(9, 9), v184.accent);
end;
v185.render:set(function()
    -- upvalues: v952 (ref), v510 (ref), v925 (ref), v249 (ref)
    if v952.arrows.alpha > 0 or v510.settings.arrows.value then
        v952.arrows();
    end;
    if v952.damage.alpha > 0 or v510.settings.damage.value then
        v952.damage();
    end;
    if v925.alpha > 0 or v510.settings.crosshair.value then
        v925();
    end;
    if v952.logs.alpha > 0 or v510.settings.logs.value and v510.settings.logs.sc.value then
        v952.logs();
    end;
    if v952.speclist.alpha > 0 or v510.settings.speclist.value then
        v952.speclist();
    end;
    if v952.keylist.alpha > 0 or v510.settings.keylist.value then
        v952.keylist();
    end;
    if v952.process.alpha > 0 or v510.settings.process.value then
        if v249.style == 1 then
            v952.process();
        else
            v952.process:alt();
        end;
    end;
    if v952.slowdown.alpha > 0 or v510.settings.slowdown.value then
        v952.slowdown();
    end;
    if v952.lchelper.alpha > 0 or v510.settings.lchelper.value then
        v952.lchelper();
    end;
    if v952.watermark.alpha > 0 or v510.settings.watermark.value then
        v952.watermark();
    end;
    if v952.watermark.alpha == 0 and v925.alpha == 0 then
        v952.process.nwater();
    end;
end);
v953 = {
    combo = function(v2229)
        return v2229.value ~= "Off" and v2229.value ~= "Disabled" and v2229.value ~= "None";
    end, 
    selectable = function(v2230)
        return #v2230.value > 0;
    end, 
    slider = function(v2231)
        return v2231.value ~= 0;
    end
};
do
    local l_v953_3, l_v1956_0 = v953, v1956;
    l_v1956_0 = function(v2234)
        -- upvalues: l_type_0 (ref), v507 (ref), l_v953_3 (ref), l_next_0 (ref), l_v1956_0 (ref)
        if l_type_0(v2234) ~= "table" or v2234.__name ~= "pui::element" then
            return;
        else
            local v2235 = v2234:type();
            if v2234:type() == "color_picker" or v2234:type() == "label" and v2234[0].gear == nil then
                return;
            else
                v507.anim(v2234, l_v953_3[v2235]);
                if v2234[0].gear then
                    for _, v2237 in l_next_0, v2234[1] do
                        l_v1956_0(v2237);
                    end;
                end;
                return;
            end;
        end;
    end;
    v167.traverse(v510, l_v1956_0);
    v511.system = v167.setup(v510, true);
end;
v2[#v2 + 1] = common.get_timestamp();
v169("load time: ", v2[#v2] - v2[1]);