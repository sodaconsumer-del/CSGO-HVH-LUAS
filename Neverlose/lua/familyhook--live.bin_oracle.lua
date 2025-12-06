local v0 = nil;
local v1 = nil;
v0 = common.get_username();
v1 = v0 == "v1pix" or v0 == "keqx";
local v2 = nil;
local v3 = nil;
v2 = render.screen_size();
v3 = v2 * 0.5;
local function v576()
    -- upvalues: v1 (ref), v2 (ref), v3 (ref)
    local v4 = "0ucHJINGekQRUwZWVbPXyYlshz65DfLnpxTtKiFvor4ad9A7M3mSBCE21gjO8q+/=";
    local v5 = nil;
    local v6 = nil;
    local v7 = nil;
    v5 = require("neverlose/clipboard");
    v6 = (function()
        local l_byte_0 = string.byte;
        local l_char_0 = string.char;
        local l_sub_0 = string.sub;
        local l_format_0 = string.format;
        local l_gsub_0 = string.gsub;
        local l_band_0 = bit.band;
        local l_rshift_0 = bit.rshift;
        local l_lshift_0 = bit.lshift;
        local l_next_0 = next;
        local l_tostring_0 = tostring;
        local l_concat_0 = table.concat;
        local v19 = {};
        local function v23(v20, v21, v22)
            -- upvalues: l_band_0 (ref), l_rshift_0 (ref), l_lshift_0 (ref)
            return l_band_0(l_rshift_0(v20, v21), l_lshift_0(1, v22) - 1);
        end;
        local function v29(v24)
            -- upvalues: l_byte_0 (ref), l_sub_0 (ref), l_tostring_0 (ref)
            local v25 = {};
            local v26 = {};
            for v27 = 1, 65 do
                local v28 = l_byte_0(l_sub_0(v24, v27, v27)) or 32;
                if v26[v28] ~= nil then
                    error("invalid alphabet: duplicate character " .. l_tostring_0(v28), 3);
                end;
                v25[v27 - 1] = v28;
                v26[v28] = v27 - 1;
            end;
            return v25, v26;
        end;
        local v30 = {};
        local v31 = {};
        local v32, v33 = v29("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=");
        v31.base64 = v33;
        v30.base64 = v32;
        v32 = {
            __index = function(v34, v35)
                -- upvalues: v30 (ref), v31 (ref), v29 (ref)
                if #v35 == 64 or #v35 == 65 then
                    local l_v30_0 = v30;
                    local l_v31_0 = v31;
                    local v38, v39 = v29(v35);
                    l_v31_0[v35] = v39;
                    l_v30_0[v35] = v38;
                    return v34[v35];
                else
                    return;
                end;
            end
        };
        setmetatable(v30, v32);
        setmetatable(v31, v32);
        v19.encode = function(v40, v41, v42)
            -- upvalues: v30 (ref), l_byte_0 (ref), l_char_0 (ref), v23 (ref), l_concat_0 (ref)
            v41 = v30[v41 or "base64"] or error("invalid alphabet specified", 2);
            local v43 = {};
            local v44 = 1;
            local v45 = #v40;
            local v46 = v45 % 3;
            local v47 = {};
            for v48 = 1, v45 - v46, 3 do
                local v49, v50, v51 = l_byte_0(v40, v48, v48 + 2);
                local v52 = v49 * 65536 + v50 * 256 + v51;
                local v53 = nil;
                if v42 then
                    v53 = v47[v52];
                    if not v53 then
                        v53 = l_char_0(v41[v23(v52, 18, 6)], v41[v23(v52, 12, 6)], v41[v23(v52, 6, 6)], v41[v23(v52, 0, 6)]);
                        v47[v52] = v53;
                    end;
                else
                    v53 = l_char_0(v41[v23(v52, 18, 6)], v41[v23(v52, 12, 6)], v41[v23(v52, 6, 6)], v41[v23(v52, 0, 6)]);
                end;
                v43[v44] = v53;
                v44 = v44 + 1;
            end;
            if v46 == 2 then
                local v54, v55 = l_byte_0(v40, v45 - 1, v45);
                local v56 = v54 * 65536 + v55 * 256;
                v43[v44] = l_char_0(v41[v23(v56, 18, 6)], v41[v23(v56, 12, 6)], v41[v23(v56, 6, 6)], v41[64]);
            elseif v46 == 1 then
                local v57 = l_byte_0(v40, v45) * 65536;
                v43[v44] = l_char_0(v41[v23(v57, 18, 6)], v41[v23(v57, 12, 6)], v41[64], v41[64]);
            end;
            return l_concat_0(v43);
        end;
        v19.decode = function(v58, v59, v60)
            -- upvalues: v31 (ref), l_next_0 (ref), l_format_0 (ref), l_char_0 (ref), l_gsub_0 (ref), l_sub_0 (ref), l_byte_0 (ref), v23 (ref), l_concat_0 (ref)
            v59 = v31[v59 or "base64"] or error("invalid alphabet specified", 2);
            local v61 = "[^%w%+%/%=]";
            if v59 then
                local v62 = nil;
                local v63 = nil;
                for v64, v65 in l_next_0, v59 do
                    if v65 == 62 then
                        v62 = v64;
                    elseif v65 == 63 then
                        v63 = v64;
                    end;
                end;
                v61 = l_format_0("[^%%w%%%s%%%s%%=]", l_char_0(v62), l_char_0(v63));
            end;
            v58 = l_gsub_0(v58, v61, "");
            local v66 = v60 and {};
            local v67 = {};
            local v68 = 1;
            local v69 = #v58;
            local v70 = l_sub_0(v58, -2) == "==" and 2 or l_sub_0(v58, -1) == "=" and 1 or 0;
            local v71 = 1;
            local v72 = v70 > 0 and v69 - 4 or v69;
            for v73 = v71, v72, 4 do
                local v74, v75, v76, v77 = l_byte_0(v58, v73, v73 + 3);
                local v78 = nil;
                if v60 then
                    local v79 = v74 * 16777216 + v75 * 65536 + v76 * 256 + v77;
                    v78 = v66[v79];
                    if not v78 then
                        local v80 = v59[v74] * 262144 + v59[v75] * 4096 + v59[v76] * 64 + v59[v77];
                        v78 = l_char_0(v23(v80, 16, 8), v23(v80, 8, 8), v23(v80, 0, 8));
                        v66[v79] = v78;
                    end;
                else
                    local v81 = v59[v74] * 262144 + v59[v75] * 4096 + v59[v76] * 64 + v59[v77];
                    v78 = l_char_0(v23(v81, 16, 8), v23(v81, 8, 8), v23(v81, 0, 8));
                end;
                v67[v68] = v78;
                v68 = v68 + 1;
            end;
            if v70 == 1 then
                local v82;
                v71, v72, v82 = l_byte_0(v58, v69 - 3, v69 - 1);
                local v83 = v59[v71] * 262144 + v59[v72] * 4096 + v59[v82] * 64;
                v67[v68] = l_char_0(v23(v83, 16, 8), v23(v83, 8, 8));
            elseif v70 == 2 then
                v71, v72 = l_byte_0(v58, v69 - 3, v69 - 2);
                local v84 = v59[v71] * 262144 + v59[v72] * 4096;
                v67[v68] = l_char_0(v23(v84, 16, 8));
            end;
            return l_concat_0(v67);
        end;
        return v19;
    end)();
    v7 = require("neverlose/smoothy");
    local v85 = nil;
    local v86 = nil;
    local v87 = nil;
    local v88 = nil;
    local v89 = nil;
    v87 = function(v90, v91, v92)
        return v90 + (v91 - v90) * v92;
    end;
    v88 = function(v93, v94, v95, v96)
        return v95 * v93 / v96 + v94;
    end;
    v89 = function(v97, v98, v99, v100)
        v97 = v97 / v100 * 2;
        if v97 < 1 then
            return v99 * 0.5 * v97 * v97 * v97 + v98;
        else
            v97 = v97 - 2;
            return v99 * 0.5 * (v97 * v97 * v97 + 2) + v98;
        end;
    end;
    local l_clamp_0 = math.clamp;
    local l_globals_0 = globals;
    v86 = {};
    do
        local l_l_clamp_0_0, l_l_globals_0_0 = l_clamp_0, l_globals_0;
        v85 = function(v105, v106, v107, v108, v109, v110)
            -- upvalues: v86 (ref), l_l_clamp_0_0 (ref), v88 (ref), l_l_globals_0_0 (ref)
            local v111 = v86[v105];
            if v111 == nil then
                v111 = v110 or v107;
                v86[v105] = v111;
            end;
            if v111 == v107 and not v106 then
                return v107;
            elseif v111 == v108 and v106 then
                return v108;
            else
                v111 = l_l_clamp_0_0(v88(1, v111, l_l_globals_0_0.frametime * (v106 and v109 or -v109) * 175, 1), v107, v108);
                v86[v105] = v111;
                return v111;
            end;
        end;
    end;
    l_clamp_0 = nil;
    l_globals_0 = nil;
    local v112 = nil;
    local v113 = ui.find("Aimbot", "Ragebot", "Main", "Enabled");
    local l_get_0 = v113.get;
    local l_set_0 = v113.set;
    v112 = v113.override;
    l_globals_0 = l_set_0;
    l_clamp_0 = l_get_0;
    v113 = nil;
    l_get_0 = nil;
    l_set_0 = ui.get_binds;
    local l_get_alpha_0 = ui.get_alpha;
    v113 = {};
    do
        local l_l_set_0_0, l_l_get_alpha_0_0 = l_set_0, l_get_alpha_0;
        events.render(function()
            -- upvalues: v113 (ref), l_l_set_0_0 (ref), l_get_0 (ref), l_l_get_alpha_0_0 (ref)
            v113 = l_l_set_0_0();
            for v119 = 1, #v113 do
                local v120 = v113[v119];
                v113[v120.name] = v120;
            end;
            l_get_0 = l_l_get_alpha_0_0();
        end);
    end;
    l_set_0 = nil;
    l_set_0 = {};
    l_get_alpha_0 = pcall;
    local l_assert_0 = assert;
    local l_type_0 = type;
    local l_next_1 = next;
    local l_format_1 = string.format;
    local v125 = {};
    local v126 = {};
    local v127 = nil;
    local v128 = nil;
    v128 = {
        switch = true, 
        slider = true, 
        combo = true, 
        selectable = true, 
        color_picker = true, 
        hotkey = true, 
        textbox = true, 
        list = true, 
        listable = true
    };
    local v129 = nil;
    local l_to_hex_0 = color().to_hex;
    do
        local l_l_get_alpha_0_1, l_l_assert_0_0, l_l_type_0_0, l_l_next_1_0, l_l_format_1_0, l_v125_0, l_v126_0, l_v127_0, l_v128_0, l_v129_0 = l_get_alpha_0, l_assert_0, l_type_0, l_next_1, l_format_1, v125, v126, v127, v128, v129;
        do
            local l_l_to_hex_0_0 = l_to_hex_0;
            l_v129_0 = function(v142)
                -- upvalues: l_l_next_1_0 (ref), l_l_to_hex_0_0 (ref), l_l_type_0_0 (ref)
                local v143 = {
                    color_picker = true
                };
                local v144 = v142:get();
                local v145 = v142:list();
                for _, v147 in l_l_next_1_0, v145 do
                    local v148 = v142:get(v147);
                    for v149, v150 in l_l_next_1_0, v148 do
                        local v151 = v143[v147];
                        if v151 == nil then
                            v151 = {};
                            v143[v147] = v151;
                        end;
                        v151[v149] = l_l_to_hex_0_0(v150);
                    end;
                end;
                if l_l_type_0_0(v144) == "string" then
                    v143.mode = v144;
                end;
                return v143;
            end;
        end;
        do
            local l_l_v128_0_0, l_l_v129_0_0 = l_v128_0, l_v129_0;
            l_v127_0 = function(v154)
                -- upvalues: l_l_next_1_0 (ref), l_l_v128_0_0 (ref), l_l_v129_0_0 (ref)
                local v155 = {};
                for _, v157 in l_l_next_1_0, v154 do
                    for v158, v159 in l_l_next_1_0, v157 do
                        local v160 = v159:type();
                        if l_l_v128_0_0[v160] ~= nil then
                            v155[v158] = v160 == "color_picker" and l_l_v129_0_0(v159) or v159:get();
                        end;
                    end;
                end;
                return v155;
            end;
        end;
        l_v128_0 = nil;
        l_v129_0 = nil;
        l_v129_0 = function(v161, v162)
            -- upvalues: l_l_get_alpha_0_1 (ref), l_globals_0 (ref), l_l_next_1_0 (ref)
            if v162.mode then
                l_l_get_alpha_0_1(l_globals_0, v161, v162.mode);
                v162.mode = nil;
            end;
            v162.color_picker = nil;
            for v163, v164 in l_l_next_1_0, v162 do
                for v165, v166 in l_l_next_1_0, v164 do
                    v164[v165] = color(v166);
                end;
                l_l_get_alpha_0_1(l_globals_0, v161, v163, v164);
            end;
        end;
        do
            local l_l_v129_0_1 = l_v129_0;
            l_v128_0 = function(v168, v169)
                -- upvalues: l_l_next_1_0 (ref), l_l_get_alpha_0_1 (ref), l_l_type_0_0 (ref), l_l_v129_0_1 (ref), l_globals_0 (ref), v1 (ref), l_l_format_1_0 (ref)
                local v170 = {};
                for _, v172 in l_l_next_1_0, v168 do
                    for v173, v174 in l_l_next_1_0, v172 do
                        v170[v173] = v174;
                    end;
                end;
                for v175, v176 in l_l_next_1_0, v169 do
                    local v177 = v170[v175];
                    if v177 ~= nil then
                        l_l_get_alpha_0_1(l_l_type_0_0(v176) == "table" and v176.color_picker and l_l_v129_0_1 or l_globals_0, v177, v176);
                    elseif v1 then
                        print_raw(l_l_format_1_0("reference %s is nil", v175));
                    end;
                end;
            end;
        end;
        l_v129_0 = function(v178, v179, v180)
            -- upvalues: l_l_assert_0_0 (ref), l_l_type_0_0 (ref)
            l_l_assert_0_0(l_l_type_0_0(v179) == "string", "invalid name");
            l_l_assert_0_0(l_l_type_0_0(v180) == "userdata", "invalid reference");
            l_l_assert_0_0(v178[v179] == nil, v179 .. " already exists");
            v178[v179] = v180;
        end;
        l_set_0.global = function(_, ...)
            -- upvalues: l_v127_0 (ref), l_v125_0 (ref), l_v126_0 (ref), l_l_type_0_0 (ref), l_v128_0 (ref), l_v129_0 (ref)
            if #{
                ...
            } == 0 then
                return l_v127_0({
                    [1] = l_v125_0, 
                    [2] = l_v126_0
                });
            elseif l_l_type_0_0(...) == "table" then
                return l_v128_0({
                    [1] = l_v125_0, 
                    [2] = l_v126_0
                }, ...);
            else
                local v182, v183 = ...;
                l_v129_0(l_v125_0, v182, v183);
                return v183;
            end;
        end;
        l_set_0.antiaim = function(_, ...)
            -- upvalues: l_v127_0 (ref), l_v126_0 (ref), l_l_type_0_0 (ref), l_v128_0 (ref), l_v129_0 (ref)
            if #{
                ...
            } == 0 then
                return l_v127_0({
                    [1] = l_v126_0
                });
            elseif l_l_type_0_0(...) == "table" then
                return l_v128_0({
                    [1] = l_v126_0
                }, ...);
            else
                local v185, v186 = ...;
                l_v129_0(l_v126_0, v185, v186);
                return v186;
            end;
        end;
    end;
    l_get_alpha_0 = nil;
    l_get_alpha_0 = {
        group = ui.create("dragging"), 
        is_in_area = function(v187, v188, v189)
            return v187.x >= v188.x and v187.x <= v188.x + v189.x and v187.y >= v188.y and v187.y <= v188.y + v189.y;
        end
    };
    l_assert_0 = function(v190, v191, v192)
        -- upvalues: l_get_alpha_0 (ref), v2 (ref)
        local v193 = tostring(v191);
        local v194 = v192 or vector();
        local v195 = {
            dragging = false, 
            positions = {
                x = v190.group:slider("x: " .. v193, -99999, 99999, v194.x):visibility(false), 
                y = v190.group:slider("y: " .. v193, -99999, 99999, v194.y):visibility(false)
            }
        };
        local v205 = {
            get_position = function(v196)
                return v196.position or vector(v196.positions.x:get(), v196.positions.y:get());
            end, 
            update = function(v197, v198, v199)
                -- upvalues: l_get_alpha_0 (ref), v193 (ref), v2 (ref), v194 (ref), v195 (ref)
                if not v199 then
                    v199 = vector();
                end;
                v197.position = vector(v197.positions.x:get(), v197.positions.y:get());
                local v200 = common.is_button_down(1);
                local v201 = common.is_button_down(2);
                local v202 = ui.get_mouse_position();
                if not (ui.get_alpha() > 0) then
                    return;
                else
                    local v203 = l_get_alpha_0.is_in_area(v202, v197.position - v199, v198 + v199);
                    if (v200 or v201) and v197.intersected == nil then
                        v197.intersected = v203;
                        v197.drag_position = v202 - v197.position;
                    end;
                    if (v200 or v201) and v197.intersected then
                        v197.dragging = true;
                    elseif not v200 and not v201 then
                        v197.dragging = false;
                        v197.intersected = nil;
                        l_get_alpha_0.target = nil;
                    end;
                    if v197.dragging then
                        if l_get_alpha_0.target == nil or l_get_alpha_0.target == v193 then
                            l_get_alpha_0.target = v193;
                            if v200 then
                                local v204 = v202 - v197.drag_position;
                                v197.positions.x:set(math.max(1 + v199.x, math.min(v2.x - v198.x - 1, v204.x)));
                                v197.positions.y:set(math.max(1 + v199.y, math.min(v2.y - v198.y - 1, v204.y)));
                            else
                                v197.positions.x:set(v194.x);
                                v197.positions.y:set(v194.y);
                            end;
                        else
                            v197.dragging = false;
                        end;
                    end;
                    v197.block_mouse_input = v195.dragging or v203;
                    return;
                end;
            end
        };
        _G.events.mouse_input(function()
            -- upvalues: v195 (ref)
            if ui.get_alpha() > 0 and v195.block_mouse_input then
                return false;
            else
                return;
            end;
        end);
        return setmetatable(v195, {
            __index = v205
        });
    end;
    l_get_alpha_0 = setmetatable(l_get_alpha_0, {
        __metatable = false, 
        __call = l_assert_0
    });
    l_assert_0 = nil;
    l_assert_0 = {};
    l_type_0 = ui.create("Familyhook", "Configs", 1);
    l_type_0:button("\239\149\174  export", function()
        -- upvalues: l_set_0 (ref), v6 (ref), v4 (ref), v5 (ref)
        local v206 = l_set_0:global();
        v206 = msgpack.pack(v206);
        v206 = v6.encode(v206, v4) .. "_familyhook";
        v5.set(v206);
    end, true);
    l_type_0:button("\239\149\175  import", function()
        -- upvalues: v5 (ref), v6 (ref), v4 (ref), l_set_0 (ref)
        local v207 = v5.get();
        if v207 == nil then
            return print("failed to import config");
        else
            local v208 = string.find(v207, "_familyhook");
            if v208 ~= nil then
                v207 = string.sub(v207, 1, v208);
            end;
            local l_status_0, l_result_0 = pcall(v6.decode, v207, v4);
            if not l_status_0 then
                return print("failed to import config");
            else
                local l_status_1, l_result_1 = pcall(msgpack.unpack, l_result_0);
                if not l_status_1 then
                    return print("failed to import config");
                else
                    l_set_0:global(l_result_1);
                    return;
                end;
            end;
        end;
    end, true);
    l_format_1, v125 = pcall(v6.decode, "2pu1oEkgw6fi5FIT5NYKrlkg5l82q4bTzG0286YTzNqSwMcthv03rNb7fEjKhFb7wqG+a6wTDHlKzNq254bTLlVB04bTzGU2zQbTzFVmK4rK52YT5NypfNIM4FxrzNypDEx7fGZthFV14NbrDEIT5NYKrNkFzHLP4Fb7flkdzPuBhsc46NiKzPuS6NqBDjwTLXNvzlgxhF3izQbTLlBBrswo6lzBrNkg5HGVEjbTzG030QbTLlMBj6wTDHTKzNq254bTzFVBKQbTLlVmuQbTLlV3ujItMjbTzN81SVJdrNkg5XNozNiShlkdzlPthv0BrNb7fEjKhFbSwNPihvi95SJ0oEkgU4fi5FIT5NYKoEkgwQfi5FIT5NYKrNkg5HeIrlkg5l8mjQwTLXZvzlgxhF3izQbTLsemH4YTzNqSUMcihFb7DSJ0rNkg5Hs3oEkgZQfi5FIT5NYKrlkK52UB0QbTLseCIjbTzGU3U4wT5StHrNkgzHycrNkFzHNVrNkg5XQF5liKzN3irNkg5XlF5liKzN3ioEk7UdZKhFbMUpcihvi95Ss7rlkK52Um0QwTDHQKzNq254bTzN8m0QbTzFVEK4rK52YT5NypfNIM4FxrzNypDEx7fGZKhFbMwfcvrNkKDSemrlkK52UC0QYTLlC7wWLKhFb7wDBu6QwTzHPozNiShlkdzlPthF8BMjbTzGUCXQwT5SWHoEkgw4fi5FIT5NYKoEkMUjbK52fArNkK5S5w0lTKhFzKUgcthF8EMjbTzFVCK4rK52YT5NypfNIM4FxrzNypDEx7fGZKhvidU/6ihFb7DSh0oEkMw4bK52fArNkgDtUioEk7wDZKhvidZ0ZKhviKUMQKhFbMw9c/rNkgDtphrNkg5XZiDExrzvPKhvimwx+KhviKZ0Pihvi95SW7rNkK5SWw0lTKhvi9ZQz96lbK5NlthFVS4NbrDEIT5NYKrNkKDHU0rlkg5l81jjYTLlC7wA+Khvi9w4z96lbK5NlthFVm4NbrDEIT5NYKoEkKw4xK6swxhF3izQbTzG010QbTLlVE04YTzNqSZ0cKhFbSUCAthFV2rGwM6ljKhvidw7QTzNvHrNkKDSxVoEkKU6xK6swxhF3izQbTzGUEU4bTzFV1K4rK52YT5NypfNIM4FxrzNypDEx7fGZthv02rNb7fEjtzNitp43t5E37DiqM6lwazsRHokNobKzNbKzNbK6KhFbMwwcvoEbrDMNthF82MjbTzN830QbTzN8BSVIorlbrDEqKMjbTLse3NQbTLseBR6wTLXLvzlgxhF3izQwt6lsHrNkg5HnSoEbrz4fKzlzxfl3BoEwrh1QdhEqd52knDNit6EYmMjcb4JzNVXIuUyzNrNkgDtDDoEkKw6xK6swxhF3izQIdK63x6lCT52VpDEx7fGZKhviKwMQKhvi9wjz96lbK5Ny=", v4);
    v126, v127 = pcall(msgpack.unpack, v125);
    do
        local l_v127_1 = v127;
        l_type_0:button("\239\140\150  default", function()
            -- upvalues: l_v127_1 (ref), l_set_0 (ref)
            if l_v127_1 == nil then
                return;
            else
                l_set_0:global(l_v127_1);
                return;
            end;
        end, true);
        v128 = ui.create("Familyhook", "\n Builder", 1);
        v129 = nil;
        v129 = {};
        l_to_hex_0 = {
            [1] = "global", 
            [2] = "standing", 
            [3] = "moving", 
            [4] = "slowwalk", 
            [5] = "crouching ct", 
            [6] = "crouching t", 
            [7] = "air", 
            [8] = "crouch-air"
        };
        local v214 = v128:combo("\239\131\154  condition", l_to_hex_0);
        do
            local l_v214_0 = v214;
            for v216 = 1, #l_to_hex_0 do
                local v217 = l_to_hex_0[v216];
                local v218 = {};
                local v219 = nil;
                if v216 ~= 1 then
                    v219 = l_set_0:antiaim("bo" .. v216, v128:switch("\239\131\154  override " .. v217));
                    v218.override = v219;
                end;
                local v220 = nil;
                v220 = ui.create("Familyhook", "##" .. v217, 1);
                do
                    local l_v216_0 = v216;
                    do
                        local l_v217_0, l_v218_0, l_v219_0, l_v220_0 = v217, v218, v219, v220;
                        local function v228()
                            -- upvalues: l_v214_0 (ref), l_v217_0 (ref), l_v216_0 (ref), l_v219_0 (ref), l_v220_0 (ref)
                            local v226 = l_v214_0:get() == l_v217_0;
                            if l_v216_0 ~= 1 then
                                l_v219_0:visibility(v226);
                            end;
                            local v227 = l_v216_0 == 1 or l_v219_0:get();
                            l_v220_0:visibility(v226 and v227);
                        end;
                        l_v214_0:set_callback(v228, true);
                        if l_v216_0 ~= 1 then
                            local l_l_v219_0_0 = l_v219_0;
                            l_v219_0.set_callback(l_l_v219_0_0, v228, true);
                        end;
                        l_v218_0.pitch = l_set_0:antiaim("bp" .. l_v216_0, l_v220_0:combo("\239\131\154  pitch ##" .. l_v217_0, "down", "zero"));
                        l_v218_0.yaw = l_set_0:antiaim("by" .. l_v216_0, l_v220_0:combo("\239\131\154  yaw", "disabled", "enabled")):tooltip("if two yaw have the same value - you will have a static body yaw. if yaw values are different -  you will have jitter body yaw.");
                        v228 = l_v218_0.yaw:create();
                        l_v218_0.yaw:set_callback(function(v230)
                            -- upvalues: v228 (ref)
                            v228:visibility(v230:get() ~= "disabled");
                        end, true);
                        l_v218_0.yaw_left = l_set_0:antiaim("byl" .. l_v216_0, v228:slider("\239\131\154  yaw left ##" .. l_v217_0, -180, 180, 0));
                        l_v218_0.yaw_right = l_set_0:antiaim("byr" .. l_v216_0, v228:slider("\239\131\154  yaw right ##" .. l_v217_0, -180, 180, 0));
                        l_v218_0.yaw_delay = l_set_0:antiaim("byd" .. l_v216_0, v228:slider("\239\131\154  yaw delay ##" .. l_v217_0, 1, 10, 1, 1, function(v231)
                            if v231 == 1 then
                                return "Off";
                            else
                                return v231;
                            end;
                        end));
                        l_v218_0.yaw_modifier = l_set_0:antiaim("bym" .. l_v216_0, l_v220_0:combo("\239\131\154  yaw modifier ##" .. l_v217_0, "disabled", "middle", "shift", "spin")):tooltip("middle yaw modifier like center in neverlose! \nshift yaw modifier like offset in neverlose! \n\nbut shift and middle are better! for example: this yaw modifiers works well with delay jitter!");
                        local v232 = l_v218_0.yaw_modifier:create();
                        l_v218_0.yaw_modifier:set_callback(function(v233)
                            -- upvalues: v232 (ref)
                            v232:visibility(v233:get() ~= "disabled");
                        end, true);
                        l_v218_0.yaw_modifier_offset = l_set_0:antiaim("bymo" .. l_v216_0, v232:slider("\239\131\154  offset ##" .. l_v217_0, -180, 180, 0));
                        l_v218_0.defensive_aa = l_set_0:antiaim("bd" .. l_v216_0, l_v220_0:combo("\239\131\154  defensive aa ##" .. l_v217_0, "disabled", "spin", "yaw"));
                        local v234 = l_v218_0.defensive_aa:create();
                        l_v218_0.defensive_aa_pitch = l_set_0:antiaim("bdp" .. l_v216_0, v234:slider("\239\131\154  pitch ##" .. l_v217_0, -89, 89, 0));
                        l_v218_0.defensive_aa_offset = l_set_0:antiaim("bdos" .. l_v216_0, v234:slider("\239\131\154  offset ##" .. l_v217_0, -180, 180, 0));
                        l_v218_0.defensive_aa_spin_offset = l_set_0:antiaim("bdo" .. l_v216_0, v234:slider("\239\131\154  offset ##spin" .. l_v217_0, -360, 360, 0));
                        l_v218_0.defensive_aa_speed = l_set_0:antiaim("bds" .. l_v216_0, v234:slider("\239\131\154  speed ##" .. l_v217_0, 1, 100, 50));
                        l_v218_0.defensive_aa:set_callback(function(v235)
                            -- upvalues: v234 (ref), l_v218_0 (ref)
                            local v236 = v235:get();
                            v234:visibility(v236 ~= "disabled");
                            local v237 = v236 == "yaw";
                            l_v218_0.defensive_aa_offset:visibility(v237);
                            local v238 = v236 == "spin";
                            l_v218_0.defensive_aa_spin_offset:visibility(v238);
                            l_v218_0.defensive_aa_speed:visibility(v238);
                        end, true);
                        l_v218_0.force_defensive = l_set_0:antiaim("bfd" .. l_v216_0, l_v220_0:selectable("\239\131\154  force defensive ##" .. l_v217_0, "double tap", "hide shots"));
                        v129[l_v216_0] = l_v218_0;
                    end;
                end;
            end;
            l_assert_0.builder = v129;
        end;
        l_to_hex_0 = ui.create("Familyhook", "Other", 2);
        v214 = nil;
        v214 = l_to_hex_0:selectable("\238\139\138  tweaks", "fast shooting on min dmg", "fast ladder move", "static with knife", "static on health", "bombsite e fix");
        local v239 = v214:create();
        do
            local l_v239_0 = v239;
            v214:set_callback(function(v241)
                -- upvalues: l_v239_0 (ref), l_clamp_0 (ref)
                l_v239_0:visibility(l_clamp_0(v241, "static on health"));
            end, true);
            l_assert_0.tweaks_health = l_v239_0:slider("health", 0, 100, 25);
            l_assert_0.tweaks = v214;
        end;
        v239 = nil;
        l_assert_0.manual_yaw = l_to_hex_0:combo("\239\141\164  manual yaw", "off", "left", "right", "forward");
        local _ = nil;
        l_assert_0.edge_yaw = l_to_hex_0:switch("\239\129\182   edge yaw");
        local v243 = nil;
        v243 = {
            enabled = l_set_0:global("cie", l_to_hex_0:switch("\239\129\155  crosshair indicators"))
        };
        v243.color = l_set_0:global("cic", v243.enabled:color_picker());
        v243.enabled:set_callback(function(v244)
            -- upvalues: v243 (ref), l_clamp_0 (ref)
            v243.color:visibility(l_clamp_0(v244));
        end, true);
        l_assert_0.crosshair_indicators = v243;
        local v245 = nil;
        v245 = {
            enabled = l_set_0:global("di", l_to_hex_0:switch("\239\135\158  damage indicator"))
        };
        local v246 = v245.enabled:create();
        do
            local l_v246_0 = v246;
            v245.enabled:set_callback(function(v248)
                -- upvalues: l_v246_0 (ref), l_clamp_0 (ref)
                l_v246_0:visibility(l_clamp_0(v248));
            end, true);
            v245.font = l_set_0:global("dif", l_v246_0:combo("font", "default", "pixel"));
            v245.color = l_set_0:global("dic", v245.font:color_picker());
            v245.style = l_set_0:global("dis", l_v246_0:list("\n style", "default", "kibit"));
            v245.show_on_damage = l_set_0:global("disod", l_v246_0:switch("show on damage"));
            v245.style:set_callback(function(v249)
                -- upvalues: v245 (ref), l_clamp_0 (ref)
                v245.show_on_damage:visibility(l_clamp_0(v249) == 1);
            end, true);
            l_assert_0.damage_indicator = v245;
        end;
        v246 = nil;
        l_assert_0.clan_tag = l_set_0:global("c", l_to_hex_0:switch("\239\128\171   clan tag"));
        local v250 = nil;
        v250 = {
            enabled = l_to_hex_0:selectable("\239\132\166   indicators", "fps", "ping", "time")
        };
        local v251 = v250.enabled:create();
        do
            local l_v251_0 = v251;
            v250.enabled:set_callback(function(v253)
                -- upvalues: l_v251_0 (ref), l_clamp_0 (ref)
                l_v251_0:visibility(#l_clamp_0(v253) > 0);
            end, true);
            v250.position = l_v251_0:list("\n position", "default", "inline");
            l_assert_0.indicators = v250;
        end;
        v251 = nil;
        l_assert_0.log_events = l_set_0:global("l", l_to_hex_0:selectable("\239\130\174  log events", "aimbot shots", "purchases"));
        ui.sidebar("\a{Link Active}familyhook", "\a{Link Active}\239\148\132");
    end;
    l_type_0 = nil;
    l_next_1 = nil;
    l_assert_0.tweaks:set_callback(function(v254)
        -- upvalues: l_type_0 (ref), l_clamp_0 (ref)
        l_type_0 = v254:list();
        for v255 = 1, #l_type_0 do
            l_type_0[v255] = l_clamp_0(v254, v255);
        end;
    end, true);
    l_assert_0.tweaks_health:set_callback(function(v256)
        -- upvalues: l_next_1 (ref), l_clamp_0 (ref)
        l_next_1 = l_clamp_0(v256);
    end, true);
    l_format_1 = nil;
    v125 = entity.get_local_player;
    v126 = ui.find("Aimbot", "Ragebot", "Safety", "Safe Points");
    do
        local l_v125_1, l_v126_1 = v125, v126;
        v127 = function(_)
            -- upvalues: l_v125_1 (ref), v113 (ref), l_type_0 (ref), v112 (ref), l_v126_1 (ref)
            local v260 = l_v125_1();
            if v260 == nil or not v260:is_alive() then
                return;
            else
                local v261 = v113["Min. Damage"];
                v261 = v261 ~= nil and v261.active;
                if l_type_0[1] and v261 then
                    v112(l_v126_1, "Default");
                else
                    v112(l_v126_1);
                end;
                return;
            end;
        end;
        events.createmove(v127);
    end;
    v125 = nil;
    v125 = {};
    v126 = math.min;
    v127 = math.max;
    v128 = math.abs;
    v129 = entity.get_local_player;
    l_to_hex_0 = l_assert_0.builder;
    local v262 = l_to_hex_0[1];
    local v263 = 0;
    local v264 = 0;
    local v265 = nil;
    local v266 = nil;
    v265 = {
        enabled = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"), 
        options = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options")
    };
    do
        local l_v126_2, l_v127_2, l_v128_1, l_v129_1, l_l_to_hex_0_1, l_v262_0, l_v263_0, l_v264_0, l_v265_0, l_v266_0 = v126, v127, v128, v129, l_to_hex_0, v262, v263, v264, v265, v266;
        l_v265_0.enabled:set_callback(function(v277)
            -- upvalues: l_v266_0 (ref), l_clamp_0 (ref)
            l_v266_0 = l_clamp_0(v277);
        end, true);
        local v278 = nil;
        local v279 = nil;
        v278 = {
            enabled = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"), 
            options = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options")
        };
        v278.enabled:set_callback(function(v280)
            -- upvalues: v279 (ref), l_clamp_0 (ref)
            v279 = l_clamp_0(v280);
        end, true);
        local v281 = ui.find("Aimbot", "Anti Aim", "Angles", "Enabled");
        local v282 = ui.find("Aimbot", "Anti Aim", "Angles", "Pitch");
        local v283 = nil;
        v283 = {
            mode = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"), 
            base = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"), 
            offset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"), 
            hidden = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden")
        };
        local v284 = nil;
        v284 = {
            mode = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"), 
            offset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset")
        };
        local v285 = nil;
        v285 = {
            enabled = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"), 
            inverter = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"), 
            left_limit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"), 
            right_limit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"), 
            options = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"), 
            freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding")
        };
        local v286 = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles");
        local v287 = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding");
        local v288 = nil;
        local v289 = nil;
        v288 = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"):set_callback(function(v290)
            -- upvalues: v289 (ref), l_clamp_0 (ref)
            v289 = l_clamp_0(v290);
        end, true);
        local v291 = nil;
        local v292 = nil;
        local l_length_0 = vector().length;
        local l_band_1 = bit.band;
        do
            local l_l_length_0_0, l_l_band_1_0 = l_length_0, l_band_1;
            v291 = function(v297, v298)
                -- upvalues: l_l_band_1_0 (ref), v292 (ref), l_l_length_0_0 (ref), v289 (ref)
                local v299 = l_l_band_1_0(v298.m_fFlags, 1) ~= 0 and not v297.in_jump;
                local v300 = v298.m_flDuckAmount > 0 or is_fakeduck;
                if not v299 then
                    v292 = v300 and 8 or 7;
                    return v292;
                elseif v300 then
                    v292 = v298.m_iTeamNum == 2 and 6 or 5;
                    return v292;
                elseif l_l_length_0_0(v298.m_vecAbsVelocity) < 2 then
                    v292 = 2;
                    return v292;
                elseif v289 then
                    v292 = 4;
                    return v292;
                elseif v299 then
                    v292 = 3;
                    return v292;
                else
                    return;
                end;
            end;
        end;
        l_length_0 = nil;
        l_band_1 = {
            forward = 180, 
            right = 100, 
            left = -75
        };
        do
            local l_l_band_1_1 = l_band_1;
            l_assert_0.manual_yaw:set_callback(function(v302)
                -- upvalues: l_length_0 (ref), l_l_band_1_1 (ref)
                l_length_0 = l_l_band_1_1[v302:get()];
            end, true);
        end;
        l_band_1 = nil;
        local v303 = nil;
        l_assert_0.edge_yaw:set_callback(function(v304)
            -- upvalues: v303 (ref), l_clamp_0 (ref)
            v303 = l_clamp_0(v304);
        end, true);
        local l_normalize_yaw_0 = math.normalize_yaw;
        local l_abs_0 = math.abs;
        local l_camera_angles_0 = render.camera_angles;
        local l_trace_line_0 = utils.trace_line;
        local l_sort_0 = table.sort;
        local v310 = vector();
        local l_angles_0 = v310.angles;
        local l_lerp_0 = v310.lerp;
        local v313 = {};
        for v314 = -162, 180, 18 do
            v313[v314] = l_angles_0(v310, 0, v314) * 96;
        end;
        local function v317(v315, v316)
            return v315.yaw < v316.yaw;
        end;
        do
            local l_l_normalize_yaw_0_0, l_l_abs_0_0, l_l_camera_angles_0_0, l_l_trace_line_0_0, l_l_sort_0_0, l_l_angles_0_0, l_l_lerp_0_0, l_v313_0, l_v317_0 = l_normalize_yaw_0, l_abs_0, l_camera_angles_0, l_trace_line_0, l_sort_0, l_angles_0, l_lerp_0, v313, v317;
            l_band_1 = function(v327, v328)
                -- upvalues: l_v313_0 (ref), l_l_trace_line_0_0 (ref), l_l_sort_0_0 (ref), l_v317_0 (ref), l_l_lerp_0_0 (ref), l_l_angles_0_0 (ref), l_l_camera_angles_0_0 (ref), l_l_normalize_yaw_0_0 (ref), l_l_abs_0_0 (ref)
                if v327.in_use then
                    return;
                else
                    local v329 = v328:get_eye_position();
                    local v330 = {};
                    for v331 = -162, 180, 18 do
                        local v332 = v329 + l_v313_0[v331];
                        local v333 = l_l_trace_line_0_0(v329, v332, v328, 33570827);
                        local l_entity_0 = v333.entity;
                        local l_fraction_0 = v333.fraction;
                        if l_entity_0 and l_entity_0:get_index() == 0 and l_fraction_0 < 0.3 then
                            v330[#v330 + 1] = {
                                endpos = v333.end_pos, 
                                yaw = v331
                            };
                        end;
                    end;
                    l_l_sort_0_0(v330, l_v317_0);
                    local v336 = nil;
                    if #v330 >= 2 then
                        local v337 = l_l_lerp_0_0(v330[1].endpos, v330[#v330].endpos, 0.5);
                        v336 = l_l_angles_0_0(v329 - v337);
                    end;
                    if v336 then
                        local l_y_0 = l_l_camera_angles_0_0().y;
                        local l_y_1 = v336.y;
                        local v340 = l_l_normalize_yaw_0_0(l_y_1 - l_y_0);
                        if l_l_abs_0_0(v340) < 90 then
                            v340 = 0;
                            l_y_0 = l_l_normalize_yaw_0_0(l_y_1 + 180);
                        end;
                        local v341 = -l_y_0;
                        v341 = l_l_normalize_yaw_0_0(v341 + l_y_1 + 180);
                        return (l_l_normalize_yaw_0_0(v341 + v340));
                    else
                        return;
                    end;
                end;
            end;
        end;
        l_normalize_yaw_0 = function(v342, v343, v344)
            local l_m_MoveType_0 = v343.m_MoveType;
            local v346 = v344:get_weapon_info();
            if v346 == nil then
                return;
            else
                local l_weapon_type_0 = v346.weapon_type;
                if l_m_MoveType_0 ~= 9 or l_weapon_type_0 == 9 then
                    return;
                else
                    if v342.sidemove == 0 then
                        v342.view_angles.y = v342.view_angles.y + 45;
                    end;
                    if v342.in_forward and v342.sidemove < 0 then
                        v342.view_angles.y = v342.view_angles.y + 90;
                    end;
                    if v342.in_back and v342.sidemove > 0 then
                        v342.view_angles.y = v342.view_angles.y + 90;
                    end;
                    v342.in_moveleft = v342.in_back;
                    v342.in_moveright = v342.in_forward;
                    if v342.view_angles.x < 0 then
                        v342.view_angles.x = -45;
                    end;
                    return;
                end;
            end;
        end;
        l_abs_0 = nil;
        l_camera_angles_0 = {};
        do
            local l_l_camera_angles_0_1 = l_camera_angles_0;
            l_abs_0 = function(v349)
                -- upvalues: l_l_camera_angles_0_1 (ref), l_clamp_0 (ref)
                if v349 == nil then
                    return;
                else
                    local v350 = l_l_camera_angles_0_1[v349];
                    if v350 == nil then
                        v349:set_callback(function(v351)
                            -- upvalues: v350 (ref), l_clamp_0 (ref), l_l_camera_angles_0_1 (ref), v349 (ref)
                            v350 = l_clamp_0(v351);
                            l_l_camera_angles_0_1[v349] = v350;
                        end, true);
                    end;
                    return v350;
                end;
            end;
        end;
        l_camera_angles_0 = rage.antiaim;
        l_trace_line_0 = {
            down = "Down", 
            zero = "Disabled"
        };
        l_sort_0 = rage.antiaim.inverter;
        v310 = {
            disabled = function()
                -- upvalues: v125 (ref)
                v125.inverter = false;
            end, 
            enabled = function(v352)
                -- upvalues: l_abs_0 (ref), l_v263_0 (ref), l_sort_0 (ref), l_camera_angles_0 (ref), v125 (ref)
                local v353 = l_abs_0(v352.yaw_left);
                local v354 = l_abs_0(v352.yaw_right);
                local v355 = l_abs_0(v352.yaw_delay);
                local v356 = v353 ~= v354;
                local v357 = v356 and v355 < l_v263_0 % (v355 * 2) + 1;
                l_sort_0(l_camera_angles_0, v357);
                v125.inverter = v357;
                return "Backward", "At Target", v357 and v353 or v354, v356, v357;
            end
        };
        l_angles_0 = {
            disabled = function(_, v359)
                return "Disabled", 0, v359;
            end, 
            middle = function(v360, v361, v362, v363)
                -- upvalues: l_abs_0 (ref)
                local v364 = l_abs_0(v360.yaw_modifier_offset);
                if not v362 then
                    return "Center", v364, v361;
                else
                    return "Disabled", 0, v361 + v364 * (v363 and 1 or -1);
                end;
            end, 
            shift = function(v365, v366, v367, v368)
                -- upvalues: l_abs_0 (ref)
                local v369 = l_abs_0(v365.yaw_modifier_offset);
                if not v367 then
                    return "Offset", v369, v366;
                else
                    if v368 then
                        v366 = v366 + v369;
                    end;
                    return "Disabled", v369, v366;
                end;
            end, 
            spin = function(v370, v371)
                -- upvalues: l_abs_0 (ref)
                return "Spin", l_abs_0(v370.yaw_modifier_offset), v371;
            end
        };
        l_lerp_0 = l_camera_angles_0.override_hidden_pitch;
        v313 = l_camera_angles_0.override_hidden_yaw_offset;
        v317 = 0;
        local v379 = {
            disabled = function()
                return false;
            end, 
            spin = function(v372)
                -- upvalues: l_abs_0 (ref), l_lerp_0 (ref), l_camera_angles_0 (ref), v317 (ref), v313 (ref)
                local v373 = l_abs_0(v372.defensive_aa_pitch);
                l_lerp_0(l_camera_angles_0, v373);
                local v374 = l_abs_0(v372.defensive_aa_spin_offset);
                local v375 = l_abs_0(v372.defensive_aa_speed) * 0.1;
                if v374 > 0 then
                    v317 = v317 + v375;
                    if v374 < v317 then
                        v317 = 0;
                    end;
                else
                    v317 = v317 - v375;
                    if v317 < v374 then
                        v317 = 0;
                    end;
                end;
                v313(l_camera_angles_0, v317);
                return true;
            end, 
            yaw = function(v376)
                -- upvalues: l_abs_0 (ref), l_lerp_0 (ref), l_camera_angles_0 (ref), v313 (ref)
                local v377 = l_abs_0(v376.defensive_aa_pitch);
                l_lerp_0(l_camera_angles_0, v377);
                local v378 = l_abs_0(v376.defensive_aa_offset);
                v313(l_camera_angles_0, v378);
                return true;
            end
        };
        local v380 = nil;
        local v381 = vector();
        local l_trace_hull_0 = utils.trace_hull;
        local l_get_entities_0 = entity.get_entities;
        local l_camera_angles_1 = render.camera_angles;
        local l_dist_0 = v381.dist;
        local l_angles_1 = v381.angles;
        local v387 = {
            CCSPlayer = true, 
            CFuncBrush = true, 
            CWorld = true
        };
        local v388 = vector(2, 2, 2);
        local v389 = 1174421515;
        local v390 = 8192;
        do
            local l_v381_0, l_l_trace_hull_0_0, l_l_get_entities_0_0, l_l_camera_angles_1_0, l_l_dist_0_0, l_l_angles_1_0, l_v387_0, l_v388_0, l_v389_0, l_v390_0 = v381, l_trace_hull_0, l_get_entities_0, l_camera_angles_1, l_dist_0, l_angles_1, v387, v388, v389, v390;
            v380 = function(v401, v402, v403)
                -- upvalues: l_l_get_entities_0_0 (ref), l_l_dist_0_0 (ref), l_l_camera_angles_1_0 (ref), l_l_angles_1_0 (ref), l_v381_0 (ref), l_v390_0 (ref), l_l_trace_hull_0_0 (ref), l_v388_0 (ref), l_v389_0 (ref), l_v387_0 (ref)
                local v404 = v403:get_weapon_index() == 49 and v402.m_bInBombZone;
                local v405 = l_l_get_entities_0_0("CPlantedC4");
                local v406 = #v405 > 0;
                local v407 = 100;
                if v406 then
                    local v408 = v405[#v405]:get_origin();
                    local v409 = v402:get_origin();
                    v407 = l_l_dist_0_0(v408, v409);
                end;
                if v407 < 62 and v402.m_iTeamNum == 3 then
                    return not v401.in_use;
                else
                    local v410 = v402:get_eye_position();
                    local v411 = l_l_camera_angles_1_0();
                    local v412 = v410 + l_l_angles_1_0(l_v381_0, v411) * l_v390_0;
                    local v413 = l_l_trace_hull_0_0(v410, v412, l_v388_0, l_v388_0, v402, l_v389_0);
                    local l_entity_1 = v413.entity;
                    local l_fraction_1 = v413.fraction;
                    local l_in_use_0 = v401.in_use;
                    local v417 = not l_in_use_0;
                    if l_entity_1 and l_fraction_1 < 0.97 then
                        l_in_use_0 = l_v387_0[l_entity_1:get_classname()] == nil;
                    end;
                    if not l_in_use_0 and not v404 then
                        v401.in_use = false;
                    end;
                    return v417;
                end;
            end;
        end;
        v381 = 0;
        l_trace_hull_0 = function(v418)
            -- upvalues: l_v129_1 (ref), v125 (ref), v291 (ref), l_v264_0 (ref), l_v263_0 (ref), l_l_to_hex_0_1 (ref), v292 (ref), l_abs_0 (ref), l_v262_0 (ref), l_trace_line_0 (ref), v310 (ref), l_angles_0 (ref), l_v128_1 (ref), v381 (ref), l_v126_2 (ref), l_v127_2 (ref), l_length_0 (ref), v379 (ref), v279 (ref), l_v266_0 (ref), v112 (ref), v278 (ref), l_v265_0 (ref), l_type_0 (ref), l_normalize_yaw_0 (ref), l_next_1 (ref), l_sort_0 (ref), l_camera_angles_0 (ref), v287 (ref), v303 (ref), l_band_1 (ref), v380 (ref), v281 (ref), v282 (ref), v283 (ref), v284 (ref), v285 (ref), v286 (ref)
            local v419 = l_v129_1();
            if v419 == nil or not v419:is_alive() then
                return;
            else
                local v420 = v419:get_player_weapon();
                if v420 == nil then
                    return;
                else
                    v125.condition = v291(v418, v419);
                    l_v264_0 = l_v264_0 + 1;
                    if globals.choked_commands == 0 then
                        l_v263_0 = l_v263_0 + 1;
                    end;
                    local v421 = l_l_to_hex_0_1[v292];
                    if not l_abs_0(v421.override) or not v421 then
                        v421 = l_v262_0;
                    end;
                    local v422 = l_trace_line_0[l_abs_0(v421.pitch)];
                    local v423, v424, v425, v426, v427 = v310[l_abs_0(v421.yaw)](v421);
                    local v428, v429, v430 = l_angles_0[l_abs_0(v421.yaw_modifier)](v421, v425, v426, v427);
                    local l_m_nTickBase_0 = v419.m_nTickBase;
                    if l_v128_1(l_m_nTickBase_0 - v381) > 64 then
                        v381 = 0;
                    end;
                    local v432 = 0;
                    if v381 < l_m_nTickBase_0 then
                        v381 = l_m_nTickBase_0;
                    elseif l_m_nTickBase_0 < v381 then
                        v432 = l_v126_2(14, l_v127_2(0, v381 - l_m_nTickBase_0 - 1));
                    end;
                    local v433 = l_abs_0(v421.defensive_aa);
                    local v434 = l_length_0 == nil and v432 > 0 and v379[v433](v421);
                    if v434 then
                        v424 = "Local View";
                    end;
                    local v435 = l_abs_0(v421.force_defensive);
                    for v436 = 1, #v435 do
                        v435[v435[v436]] = true;
                    end;
                    if v435["double tap"] ~= nil and v279 or v435["hide shots"] ~= nil and l_v266_0 then
                        v112(v278.options, "Always On");
                        v112(l_v265_0.options, "Break LC");
                    else
                        v112(v278.options);
                        v112(l_v265_0.options);
                    end;
                    if l_type_0[2] then
                        l_normalize_yaw_0(v418, v419, v420);
                    end;
                    local l_m_iHealth_0 = v419.m_iHealth;
                    if l_type_0[3] and v420:get_classname() == "CKnife" or l_type_0[4] and l_m_iHealth_0 <= l_next_1 then
                        v422 = "Down";
                        v423 = "Backward";
                        v424 = "At Target";
                        v430 = 28;
                        v434 = false;
                        v428 = "Offset";
                        v429 = -3;
                        l_sort_0(l_camera_angles_0, false);
                    end;
                    v112(v287);
                    if l_length_0 ~= nil then
                        v424 = "Local View";
                        v430 = l_length_0;
                        v428 = "Disabled";
                        l_sort_0(l_camera_angles_0, false);
                        v112(v287, false);
                    end;
                    if v303 then
                        v424 = "Local View";
                        v430 = l_band_1(v418, v419);
                        v428 = "Disabled";
                        l_sort_0(l_camera_angles_0, false);
                    end;
                    local v438 = true;
                    if l_type_0[5] then
                        v438 = v380(v418, v419, v420);
                    end;
                    v112(v281, v438);
                    v112(v282, v422);
                    v112(v283.mode, v423);
                    v112(v283.base, v424);
                    v112(v283.offset, v430);
                    v112(v283.hidden, v434);
                    v112(v284.mode, v428);
                    v112(v284.offset, v429);
                    v112(v285.enabled, true);
                    v112(v285.left_limit, 60);
                    v112(v285.right_limit, 60);
                    v112(v285.freestanding, "Off");
                    v112(v285.options, {});
                    v112(v286, false);
                    return;
                end;
            end;
        end;
        events.createmove(l_trace_hull_0);
    end;
    v126 = nil;
    v126 = l_assert_0.clan_tag;
    v127 = {
        [1] = "family", 
        [2] = "familyhook", 
        [3] = "family", 
        [4] = "familyhook", 
        [5] = "family", 
        [6] = "familyhook", 
        [7] = "familyh0ok", 
        [8] = "familyho0k", 
        [9] = "familyh00k", 
        [10] = "familyh00k", 
        [11] = "familyh0ok", 
        [12] = "familyhook", 
        [13] = "familyhook", 
        [14] = "familyh00k", 
        [15] = "familyhook", 
        [16] = "familyh00k", 
        [17] = "familyhook"
    };
    v128 = nil;
    v129 = #v127;
    l_to_hex_0 = entity.get_local_player;
    v262 = entity.get_game_rules;
    v263 = math.floor;
    v264 = math.fmod;
    v265 = common.set_clan_tag;
    v266 = utils.net_channel;
    local l_globals_1 = globals;
    do
        local l_v127_3, l_v128_2, l_v129_2, l_l_to_hex_0_2, l_v262_1, l_v263_1, l_v264_1, l_v265_1, l_v266_1, l_l_globals_1_0 = v127, v128, v129, l_to_hex_0, v262, v263, v264, v265, v266, l_globals_1;
        local function v455()
            -- upvalues: l_l_to_hex_0_2 (ref), l_v266_1 (ref), l_l_globals_1_0 (ref), l_v263_1 (ref), l_v264_1 (ref), l_v129_2 (ref), l_v127_3 (ref), l_v262_1 (ref), l_v128_2 (ref), l_v265_1 (ref)
            if l_l_to_hex_0_2() == nil then
                return;
            else
                local v450 = l_v266_1();
                if v450 == nil then
                    return;
                else
                    local v451 = v450.latency[0] / l_l_globals_1_0.tickinterval;
                    local v452 = l_v127_3[l_v263_1(l_v264_1((l_l_globals_1_0.tickcount + v451) / 14, l_v129_2)) + 1];
                    local v453 = l_v262_1();
                    if v453 ~= nil then
                        local l_m_gamePhase_0 = v453.m_gamePhase;
                        if l_m_gamePhase_0 == 4 or l_m_gamePhase_0 == 5 then
                            v452 = "familyhook";
                        end;
                    end;
                    if l_v128_2 ~= v452 then
                        l_v128_2 = v452;
                        l_v265_1(v452);
                    end;
                    return;
                end;
            end;
        end;
        local function v457()
            -- upvalues: l_v128_2 (ref), l_v265_1 (ref)
            local v456 = "";
            if l_v128_2 ~= v456 then
                l_v128_2 = v456;
                l_v265_1(v456);
            end;
        end;
        v126:set_callback(function(v458)
            -- upvalues: l_clamp_0 (ref), v455 (ref), v457 (ref)
            local v459 = l_clamp_0(v458);
            events.render(v455, v459);
            events.shutdown(v457, v459);
            if not v459 then
                v457();
            end;
        end, true);
    end;
    v127 = nil;
    v127 = l_assert_0.crosshair_indicators;
    v128 = nil;
    v129 = nil;
    do
        local l_v128_3, l_v129_3, l_v263_2, l_v264_2, l_v265_2, l_v266_2 = v128, v129, v263, v264, v265, v266;
        v127.color:set_callback(function(v466)
            -- upvalues: l_v128_3 (ref), l_clamp_0 (ref), l_v129_3 (ref)
            l_v128_3 = l_clamp_0(v466);
            l_v129_3 = "\a" .. l_v128_3:to_hex();
        end, true);
        l_to_hex_0 = render.rect;
        v262 = render.rect_outline;
        l_v263_2 = render.text;
        l_v264_2 = entity.get_local_player;
        l_v265_2 = vector;
        l_v266_2 = color;
        l_globals_1 = globals;
        local _ = math.abs;
        local _ = nil;
        local v469 = nil;
        ({
            enabled = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"), 
            options = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options")
        }).enabled:set_callback(function(v470)
            -- upvalues: v469 (ref), l_clamp_0 (ref)
            v469 = l_clamp_0(v470);
        end, true);
        local _ = nil;
        local v472 = nil;
        ({
            enabled = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"), 
            options = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options")
        }).enabled:set_callback(function(v473)
            -- upvalues: v472 (ref), l_clamp_0 (ref)
            v472 = l_clamp_0(v473);
        end, true);
        local l_alpha_modulate_0 = l_v266_2().alpha_modulate;
        local l_lerp_1 = l_v266_2().lerp;
        local l_to_hex_1 = l_v266_2().to_hex;
        local v477 = l_v266_2(255, 100);
        local v478 = l_v266_2(255, 255);
        local v479 = l_v266_2(143, 194, 21, 255);
        local v480 = l_v266_2(255, 0, 50, 255);
        local v481, v482 = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding");
        v481:set_callback(function(v483)
            -- upvalues: v482 (ref), l_clamp_0 (ref)
            v482 = l_clamp_0(v483);
        end, true);
        local v485 = {
            [1] = {
                name = "DT", 
                is_active = function()
                    -- upvalues: v469 (ref), l_to_hex_1 (ref), l_lerp_1 (ref), v480 (ref), v479 (ref)
                    local v484 = rage.exploit:get();
                    return v469, "\a" .. l_to_hex_1(l_lerp_1(v480, v479, v484));
                end
            }, 
            [2] = {
                name = "HS", 
                is_active = function()
                    -- upvalues: v472 (ref), v469 (ref)
                    return v472 and not v469, "";
                end
            }
        };
        local _ = render.load_font("calibri bold", l_v265_2(11, 11, 1), "ao");
        local function v497()
            -- upvalues: l_v264_2 (ref), l_v263_2 (ref), v3 (ref), l_v265_2 (ref), l_v266_2 (ref), l_v129_3 (ref), v485 (ref), v85 (ref), l_alpha_modulate_0 (ref), l_v128_3 (ref), v113 (ref), l_lerp_1 (ref), v477 (ref), v478 (ref), v482 (ref)
            local v487 = l_v264_2();
            if v487 == nil or not v487:is_alive() then
                return;
            else
                l_v263_2(2, v3 + l_v265_2(0, 23), l_v266_2(), nil, "FAMILY" .. l_v129_3 .. "  HOOK");
                local v488 = 0;
                for v489 = 1, #v485 do
                    local v490 = v485[v489];
                    local l_name_0 = v490.name;
                    local v492, v493 = v490.is_active();
                    local v494 = v85("crosshair indicators -> bind alpha: " .. l_name_0, v492, 0, 1, 0.0365);
                    if v494 > 0 then
                        l_v263_2(2, v3 + l_v265_2(0, 31), l_alpha_modulate_0(l_v128_3, v494 * 255), nil, v493 .. l_name_0);
                        v488 = v488 + 8 * v494;
                    end;
                end;
                local v495 = v113["Body Aim"];
                v495 = v495 ~= nil and v495.active;
                l_v263_2(2, v3 + l_v265_2(0, 31 + v488), l_lerp_1(v477, v478, v85("crosshair indicators -> baim", v495, 0, 1, 0.036)), nil, "BAIM");
                local v496 = v113["Safe Points"];
                v496 = v496 ~= nil and v496.active;
                l_v263_2(2, v3 + l_v265_2(20, 31 + v488), l_lerp_1(v477, v478, v85("crosshair indicators -> sp", v496, 0, 1, 0.036)), nil, "SP");
                l_v263_2(2, v3 + l_v265_2(32, 31 + v488), l_lerp_1(v477, v478, v85("crosshair indicators -> fs", v482, 0, 1, 0.036)), nil, "FS");
                return;
            end;
        end;
        v127.enabled:set_callback(function(v498)
            -- upvalues: v497 (ref), l_clamp_0 (ref)
            events.render(v497, l_clamp_0(v498));
        end, true);
    end;
    v128 = nil;
    v128 = l_assert_0.damage_indicator;
    v129 = tostring;
    l_to_hex_0 = vector;
    v262 = color;
    v263 = entity.get_local_player;
    v264 = render.measure_text;
    v265 = render.text;
    v266 = render.rect_outline;
    l_globals_1 = nil;
    local v499 = nil;
    local v500 = nil;
    local v501 = nil;
    do
        local l_v129_4, l_l_to_hex_0_3, l_v262_2, l_v263_3, l_v264_3, l_v265_3, l_v266_3, l_l_globals_1_1, l_v499_0, l_v500_0, l_v501_0 = v129, l_to_hex_0, v262, v263, v264, v265, v266, l_globals_1, v499, v500, v501;
        v128.font:set_callback(function(v513)
            -- upvalues: l_l_globals_1_1 (ref), l_clamp_0 (ref)
            l_l_globals_1_1 = l_clamp_0(v513);
            l_l_globals_1_1 = l_l_globals_1_1 == "default" and 1 or 2;
        end, true);
        v128.color:set_callback(function(v514)
            -- upvalues: l_v499_0 (ref), l_clamp_0 (ref)
            l_v499_0 = l_clamp_0(v514);
        end, true);
        v128.style:set_callback(function(v515)
            -- upvalues: l_v500_0 (ref), l_clamp_0 (ref)
            l_v500_0 = l_clamp_0(v515);
        end, true);
        v128.show_on_damage:set_callback(function(v516)
            -- upvalues: l_v501_0 (ref), l_clamp_0 (ref)
            l_v501_0 = l_clamp_0(v516);
        end, true);
        local v517 = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage");
        local v518 = l_get_alpha_0("damage indicator", l_l_to_hex_0_3(v3.x + 10, v3.y - 20));
        local function v527()
            -- upvalues: l_v263_3 (ref), v518 (ref), v113 (ref), l_v500_0 (ref), l_v501_0 (ref), l_clamp_0 (ref), v517 (ref), l_l_globals_1_1 (ref), l_v129_4 (ref), l_v264_3 (ref), l_v265_3 (ref), l_v499_0 (ref), l_l_to_hex_0_3 (ref), l_get_0 (ref), l_v266_3 (ref), l_v262_2 (ref)
            local v519 = l_v263_3();
            if v519 == nil or not v519:is_alive() then
                return;
            else
                local v520 = v518:get_position();
                local v521 = v113["Min. Damage"];
                local v522 = v521 ~= nil and v521.active;
                if l_v500_0 == 1 and l_v501_0 and not v522 then
                    return;
                else
                    local v523 = l_clamp_0(v517);
                    if v523 == 0 then
                        v523 = l_l_globals_1_1 == 1 and "Auto" or "AUTO";
                    end;
                    local v524 = l_v129_4(v523);
                    local v525 = l_v264_3(l_l_globals_1_1, nil, v524);
                    l_v265_3(l_l_globals_1_1, v520, l_v499_0, nil, v524);
                    if l_v500_0 == 2 then
                        l_v265_3(l_l_globals_1_1, v520 - l_l_to_hex_0_3(30, 0), l_v499_0, nil, v522 and "1" or "0");
                    end;
                    if l_get_0 == 0 then
                        return;
                    else
                        local v526 = l_v500_0 == 2 and l_l_to_hex_0_3(30, 0) or l_l_to_hex_0_3();
                        l_v266_3(v520 - v526 - l_l_to_hex_0_3(1, 1), v520 + v525 + l_l_to_hex_0_3(1, 1), l_v262_2(255, 255), 1, 4);
                        v518:update(v525, v526);
                        return;
                    end;
                end;
            end;
        end;
        v128.enabled:set_callback(function(v528)
            -- upvalues: v527 (ref), l_clamp_0 (ref)
            events.render(v527, l_clamp_0(v528));
        end, true);
    end;
    v129 = nil;
    v129 = l_assert_0.indicators;
    l_to_hex_0 = panorama.loadstring("            let _GetText = function(text) {\n                let panel = $.GetContextPanel().FindChildTraverse(\"HudRadar\").FindChildTraverse(\"DashboardLabel\");\n                return panel.text;\n            }\n\n            let _ChangeText = function(text) {\n                let panel = $.GetContextPanel().FindChildTraverse(\"HudRadar\").FindChildTraverse(\"DashboardLabel\");\n                panel.text = text;\n            }\n\n            return {\n                get_text: _GetText,\n                change_text: _ChangeText\n            }\n        ", "CSGOHud")();
    v262 = nil;
    v263 = nil;
    v264 = nil;
    do
        local l_l_to_hex_0_4, l_v262_3, l_v263_4, l_v264_4, l_v265_4, l_v266_4, l_l_globals_1_2, l_v499_1, l_v500_1, l_v501_1 = l_to_hex_0, v262, v263, v264, v265, v266, l_globals_1, v499, v500, v501;
        v129.enabled:set_callback(function(v539)
            -- upvalues: l_v262_3 (ref), l_clamp_0 (ref), l_v263_4 (ref), l_l_to_hex_0_4 (ref)
            l_v262_3 = #l_clamp_0(v539) > 0;
            l_v263_4 = v539:list();
            for v540 = 1, #l_v263_4 do
                l_v263_4[v540] = l_clamp_0(v539, v540);
            end;
            if not l_v262_3 then
                l_l_to_hex_0_4.change_text("");
            end;
        end, true);
        v129.position:set_callback(function(v541)
            -- upvalues: l_v264_4 (ref), l_clamp_0 (ref)
            l_v264_4 = l_clamp_0(v541);
        end, true);
        l_v265_4 = 0;
        l_v266_4 = nil;
        l_l_globals_1_2 = 0;
        l_v499_1 = globals;
        l_v500_1 = math.floor;
        l_v501_1 = table.concat;
        local l_get_date_0 = common.get_date;
        local l_net_channel_0 = utils.net_channel;
        local l_format_2 = string.format;
        local l_sub_1 = string.sub;
        events.render(function()
            -- upvalues: l_v265_4 (ref), l_v499_1 (ref), l_l_globals_1_2 (ref), l_v266_4 (ref), l_net_channel_0 (ref), l_v262_3 (ref), l_l_to_hex_0_4 (ref), l_sub_1 (ref), l_v500_1 (ref), l_v263_4 (ref), l_format_2 (ref), l_get_date_0 (ref), l_v501_1 (ref), l_v264_4 (ref)
            l_v265_4 = 0.9 * l_v265_4 + 0.1 * l_v499_1.absoluteframetime;
            local l_realtime_0 = l_v499_1.realtime;
            if l_l_globals_1_2 + 0.8 < l_realtime_0 or l_v266_4 == nil then
                l_v266_4 = 1 / l_v265_4;
                l_l_globals_1_2 = l_realtime_0;
            end;
            local v547 = l_net_channel_0();
            if v547 == nil then
                return;
            elseif not l_v262_3 then
                local v548 = l_l_to_hex_0_4.get_text();
                if l_sub_1(v548, 1, 1) == "#" then
                    l_l_to_hex_0_4.change_text(l_sub_1(v548, 2));
                end;
                return;
            else
                local v549 = v547.is_loopback and 0 or l_v500_1(v547.latency[1] * 1000);
                local v550 = {};
                if l_v263_4[1] then
                    v550[#v550 + 1] = l_format_2("FPS: %d", l_v266_4);
                end;
                if l_v263_4[2] then
                    v550[#v550 + 1] = l_format_2("PING: %d", v549);
                end;
                if l_v263_4[3] then
                    v550[#v550 + 1] = l_get_date_0("%H:%M");
                end;
                v550 = l_v501_1(v550, l_v264_4 == 1 and "\n" or " | ");
                l_l_to_hex_0_4.change_text(v550);
                return;
            end;
        end);
    end;
    l_to_hex_0 = nil;
    l_to_hex_0 = l_assert_0.log_events;
    v262 = entity.get_local_player;
    v263 = entity.get;
    v264 = string.format;
    v265 = {
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
    do
        local l_v262_4, l_v263_5, l_v264_5, l_v265_5, l_v266_5, l_l_globals_1_3, l_v499_2 = v262, v263, v264, v265, v266, l_globals_1, v499;
        l_v266_5 = function(v558)
            -- upvalues: l_v265_5 (ref), l_v264_5 (ref)
            local l_target_0 = v558.target;
            if l_target_0 == nil then
                return;
            else
                local v560 = l_target_0:get_name();
                local l_state_0 = v558.state;
                local l_hitchance_0 = v558.hitchance;
                local l_backtrack_0 = v558.backtrack;
                if l_state_0 == nil then
                    local v564 = l_v265_5[v558.hitgroup];
                    local l_damage_0 = v558.damage;
                    local l_wanted_damage_0 = v558.wanted_damage;
                    print_raw(l_v264_5("familyhook \aA0CB27FF[+]\aDEFAULT target: %s | %s %s(%s) | hc:%s | bt:%s", v560, v564, l_damage_0, l_wanted_damage_0, l_hitchance_0, l_backtrack_0));
                else
                    local v567 = l_v265_5[v558.wanted_hitgroup];
                    local l_wanted_damage_1 = v558.wanted_damage;
                    print_raw(l_v264_5("familyhook \aFF7575FF[-]\aDEFAULT target: %s | %s (%s) due to %s | hc:%s | bt:%s", v560, v567, l_wanted_damage_1, l_state_0, l_hitchance_0, l_backtrack_0));
                end;
                return;
            end;
        end;
        l_l_globals_1_3 = function(v569)
            -- upvalues: l_v262_4 (ref), l_v263_5 (ref), l_v264_5 (ref)
            local v570 = l_v262_4();
            if v570 == nil then
                return;
            else
                local v571 = l_v263_5(v569.userid, true);
                if v571 == nil or v571 == v570 then
                    return;
                else
                    local v572 = v571:get_name();
                    local l_weapon_0 = v569.weapon;
                    print_raw(l_v264_5("familyhook \aC7BB64FF[$]\aDEFAULT target: %s \226\128\148 bought %s", v572, l_weapon_0));
                    return;
                end;
            end;
        end;
        l_v499_2 = ui.find("Miscellaneous", "Main", "Other", "Log Events");
        v500 = function()
            -- upvalues: l_clamp_0 (ref), l_to_hex_0 (ref), v112 (ref), l_v499_2 (ref), l_v266_5 (ref), l_l_globals_1_3 (ref)
            local v574 = l_clamp_0(l_to_hex_0, "aimbot shots");
            local v575 = l_clamp_0(l_to_hex_0, "purchases");
            v112(l_v499_2);
            if v574 or v575 then
                v112(l_v499_2, {});
            end;
            events.aim_ack(l_v266_5, v574);
            events.item_purchase(l_l_globals_1_3, v575);
        end;
        l_to_hex_0:set_callback(v500, true);
        l_v499_2:set_callback(v500, true);
    end;
end;
utils.execute_after(0.05, v576);