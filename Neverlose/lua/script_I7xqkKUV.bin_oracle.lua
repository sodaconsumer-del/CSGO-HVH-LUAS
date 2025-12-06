local l_websockets_0 = require("neverlose/websockets");
local function v8(v1, v2)
    local v3 = {};
    for v4 = 1, #v1 do
        local v5 = string.byte(v1, v4);
        local v6 = string.byte(v2, (v4 - 1) % #v2 + 1);
        local v7 = bit.bxor(v5, v6);
        table.insert(v3, string.char(v7));
    end;
    return table.concat(v3);
end;
local v9 = "blamelessvsall";
local v10 = common.get_username();
local v11 = {
    link = "ws://94.159.102.30:8888", 
    sended = v8(v10, v9), 
    curr_messgae = nil
};
v11.callbacks = {
    open = function(v12)
        -- upvalues: v11 (ref)
        v12:send(v11.sended);
    end, 
    message = function(_, v14)
        -- upvalues: v11 (ref)
        v11.curr_messgae = v14;
    end, 
    close = function(v15)
        v15:close();
    end
};
l_websockets_0.connect(v11.link, v11.callbacks);
utils.execute_after(3, function()
    -- upvalues: v11 (ref), v8 (ref), v9 (ref)
    if not v11.curr_messgae then
        common.add_event("Check Internet Connection", "moon-stars");
        print("Check Internet Connection");
        return;
    else
        local v16 = v8(v11.curr_messgae, v9);
        if not v16 then
            return;
        else
            local v17 = json.parse(v16);
            if not v17 then
                return;
            else
                if tonumber(v17.remaining_time) > 0 then
                    print("Welcome Back, \v" .. common.get_username());
                    print("Remaining subscription time: \v" .. math.floor(tonumber(v17.remaining_time)) .. "\r minutes");
                    common.add_event("Welcome Back, \v" .. common.get_username(), "moon-stars");
                    common.add_event("Remaining subscription time: \v" .. math.floor(tonumber(v17.remaining_time)) .. "\r minutes", "moon-stars");
                    print("genesis.lua - \vhttps://ru.neverlose.cc/market/item?id=5O16jT");
                    local l_pui_0 = require("neverlose/pui");
                    local l_base64_0 = require("neverlose/base64");
                    local l_clipboard_0 = require("neverlose/clipboard");
                    local l_gradient_0 = require("neverlose/gradient");
                    local l_system_0 = require("neverlose/drag_system");
                    local v315 = (function()
                        local v23 = {};
                        local l_pow_0 = math.pow;
                        local l_sin_0 = math.sin;
                        local l_cos_0 = math.cos;
                        local l_pi_0 = math.pi;
                        local l_sqrt_0 = math.sqrt;
                        local l_abs_0 = math.abs;
                        local l_asin_0 = math.asin;
                        local function v35(v31, v32, v33, v34)
                            return v33 * v31 / v34 + v32;
                        end;
                        local function v40(v36, v37, v38, v39)
                            -- upvalues: l_pow_0 (ref)
                            return v38 * l_pow_0(v36 / v39, 2) + v37;
                        end;
                        local function v45(v41, v42, v43, v44)
                            v41 = v41 / v44;
                            return -v43 * v41 * (v41 - 2) + v42;
                        end;
                        local function v50(v46, v47, v48, v49)
                            -- upvalues: l_pow_0 (ref)
                            v46 = v46 / v49 * 2;
                            if v46 < 1 then
                                return v48 / 2 * l_pow_0(v46, 2) + v47;
                            else
                                return -v48 / 2 * ((v46 - 1) * (v46 - 3) - 1) + v47;
                            end;
                        end;
                        local function v55(v51, v52, v53, v54)
                            -- upvalues: v45 (ref), v40 (ref)
                            if v51 < v54 / 2 then
                                return v45(v51 * 2, v52, v53 / 2, v54);
                            else
                                return v40(v51 * 2 - v54, v52 + v53 / 2, v53 / 2, v54);
                            end;
                        end;
                        local function v60(v56, v57, v58, v59)
                            -- upvalues: l_pow_0 (ref)
                            return v58 * l_pow_0(v56 / v59, 3) + v57;
                        end;
                        local function v65(v61, v62, v63, v64)
                            -- upvalues: l_pow_0 (ref)
                            return v63 * (l_pow_0(v61 / v64 - 1, 3) + 1) + v62;
                        end;
                        local function v70(v66, v67, v68, v69)
                            v66 = v66 / v69 * 2;
                            if v66 < 1 then
                                return v68 / 2 * v66 * v66 * v66 + v67;
                            else
                                v66 = v66 - 2;
                                return v68 / 2 * (v66 * v66 * v66 + 2) + v67;
                            end;
                        end;
                        local function v75(v71, v72, v73, v74)
                            -- upvalues: v65 (ref), v60 (ref)
                            if v71 < v74 / 2 then
                                return v65(v71 * 2, v72, v73 / 2, v74);
                            else
                                return v60(v71 * 2 - v74, v72 + v73 / 2, v73 / 2, v74);
                            end;
                        end;
                        local function v80(v76, v77, v78, v79)
                            -- upvalues: l_pow_0 (ref)
                            return v78 * l_pow_0(v76 / v79, 4) + v77;
                        end;
                        local function v85(v81, v82, v83, v84)
                            -- upvalues: l_pow_0 (ref)
                            return -v83 * (l_pow_0(v81 / v84 - 1, 4) - 1) + v82;
                        end;
                        local function v90(v86, v87, v88, v89)
                            -- upvalues: l_pow_0 (ref)
                            v86 = v86 / v89 * 2;
                            if v86 < 1 then
                                return v88 / 2 * l_pow_0(v86, 4) + v87;
                            else
                                return -v88 / 2 * (l_pow_0(v86 - 2, 4) - 2) + v87;
                            end;
                        end;
                        local function v95(v91, v92, v93, v94)
                            -- upvalues: v85 (ref), v80 (ref)
                            if v91 < v94 / 2 then
                                return v85(v91 * 2, v92, v93 / 2, v94);
                            else
                                return v80(v91 * 2 - v94, v92 + v93 / 2, v93 / 2, v94);
                            end;
                        end;
                        local function v100(v96, v97, v98, v99)
                            -- upvalues: l_pow_0 (ref)
                            return v98 * l_pow_0(v96 / v99, 5) + v97;
                        end;
                        local function v105(v101, v102, v103, v104)
                            -- upvalues: l_pow_0 (ref)
                            return v103 * (l_pow_0(v101 / v104 - 1, 5) + 1) + v102;
                        end;
                        local function v110(v106, v107, v108, v109)
                            -- upvalues: l_pow_0 (ref)
                            v106 = v106 / v109 * 2;
                            if v106 < 1 then
                                return v108 / 2 * l_pow_0(v106, 5) + v107;
                            else
                                return v108 / 2 * (l_pow_0(v106 - 2, 5) + 2) + v107;
                            end;
                        end;
                        local function v115(v111, v112, v113, v114)
                            -- upvalues: v105 (ref), v100 (ref)
                            if v111 < v114 / 2 then
                                return v105(v111 * 2, v112, v113 / 2, v114);
                            else
                                return v100(v111 * 2 - v114, v112 + v113 / 2, v113 / 2, v114);
                            end;
                        end;
                        local function v120(v116, v117, v118, v119)
                            -- upvalues: l_cos_0 (ref), l_pi_0 (ref)
                            return -v118 * l_cos_0(v116 / v119 * l_pi_0 / 2) + v118 + v117;
                        end;
                        local function v125(v121, v122, v123, v124)
                            -- upvalues: l_sin_0 (ref), l_pi_0 (ref)
                            return v123 * l_sin_0(v121 / v124 * l_pi_0 / 2) + v122;
                        end;
                        local function v130(v126, v127, v128, v129)
                            -- upvalues: l_cos_0 (ref), l_pi_0 (ref)
                            return -v128 / 2 * (l_cos_0(l_pi_0 * v126 / v129) - 1) + v127;
                        end;
                        local function v135(v131, v132, v133, v134)
                            -- upvalues: v125 (ref), v120 (ref)
                            if v131 < v134 / 2 then
                                return v125(v131 * 2, v132, v133 / 2, v134);
                            else
                                return v120(v131 * 2 - v134, v132 + v133 / 2, v133 / 2, v134);
                            end;
                        end;
                        local function v140(v136, v137, v138, v139)
                            -- upvalues: l_pow_0 (ref)
                            if v136 == 0 then
                                return v137;
                            else
                                return v138 * l_pow_0(2, 10 * (v136 / v139 - 1)) + v137 - v138 * 0.001;
                            end;
                        end;
                        local function v145(v141, v142, v143, v144)
                            -- upvalues: l_pow_0 (ref)
                            if v141 == v144 then
                                return v142 + v143;
                            else
                                return v143 * 1.001 * (-l_pow_0(2, -10 * v141 / v144) + 1) + v142;
                            end;
                        end;
                        local function v150(v146, v147, v148, v149)
                            -- upvalues: l_pow_0 (ref)
                            if v146 == 0 then
                                return v147;
                            elseif v146 == v149 then
                                return v147 + v148;
                            else
                                v146 = v146 / v149 * 2;
                                if v146 < 1 then
                                    return v148 / 2 * l_pow_0(2, 10 * (v146 - 1)) + v147 - v148 * 5.0E-4;
                                else
                                    return v148 / 2 * 1.0005 * (-l_pow_0(2, -10 * (v146 - 1)) + 2) + v147;
                                end;
                            end;
                        end;
                        local function v155(v151, v152, v153, v154)
                            -- upvalues: v145 (ref), v140 (ref)
                            if v151 < v154 / 2 then
                                return v145(v151 * 2, v152, v153 / 2, v154);
                            else
                                return v140(v151 * 2 - v154, v152 + v153 / 2, v153 / 2, v154);
                            end;
                        end;
                        local function v160(v156, v157, v158, v159)
                            -- upvalues: l_sqrt_0 (ref), l_pow_0 (ref)
                            return -v158 * (l_sqrt_0(1 - l_pow_0(v156 / v159, 2)) - 1) + v157;
                        end;
                        local function v165(v161, v162, v163, v164)
                            -- upvalues: l_sqrt_0 (ref), l_pow_0 (ref)
                            return v163 * l_sqrt_0(1 - l_pow_0(v161 / v164 - 1, 2)) + v162;
                        end;
                        local function v170(v166, v167, v168, v169)
                            -- upvalues: l_sqrt_0 (ref)
                            v166 = v166 / v169 * 2;
                            if v166 < 1 then
                                return -v168 / 2 * (l_sqrt_0(1 - v166 * v166) - 1) + v167;
                            else
                                v166 = v166 - 2;
                                return v168 / 2 * (l_sqrt_0(1 - v166 * v166) + 1) + v167;
                            end;
                        end;
                        local function v175(v171, v172, v173, v174)
                            -- upvalues: v165 (ref), v160 (ref)
                            if v171 < v174 / 2 then
                                return v165(v171 * 2, v172, v173 / 2, v174);
                            else
                                return v160(v171 * 2 - v174, v172 + v173 / 2, v173 / 2, v174);
                            end;
                        end;
                        local function v181(v176, v177, v178, v179)
                            -- upvalues: l_abs_0 (ref), l_pi_0 (ref), l_asin_0 (ref)
                            local v180 = v176 or v179 * 0.3;
                            if not v177 then
                                v177 = 0;
                            end;
                            v176 = v180;
                            if v177 < l_abs_0(v178) then
                                return v176, v178, v176 / 4;
                            else
                                return v176, v177, v176 / (2 * l_pi_0) * l_asin_0(v178 / v177);
                            end;
                        end;
                        local function v192(v182, v183, v184, v185, v186, v187)
                            -- upvalues: v181 (ref), l_pow_0 (ref), l_sin_0 (ref), l_pi_0 (ref)
                            local v188 = nil;
                            if v182 == 0 then
                                return v183;
                            else
                                v182 = v182 / v185;
                                if v182 == 1 then
                                    return v183 + v184;
                                else
                                    local v189, v190, v191 = v181(v187, v186, v184, v185);
                                    v188 = v191;
                                    v186 = v190;
                                    v187 = v189;
                                    v182 = v182 - 1;
                                    return -(v186 * l_pow_0(2, 10 * v182) * l_sin_0((v182 * v185 - v188) * 2 * l_pi_0 / v187)) + v183;
                                end;
                            end;
                        end;
                        local function v203(v193, v194, v195, v196, v197, v198)
                            -- upvalues: v181 (ref), l_pow_0 (ref), l_sin_0 (ref), l_pi_0 (ref)
                            local _ = nil;
                            if v193 == 0 then
                                return v194;
                            else
                                v193 = v193 / v196;
                                if v193 == 1 then
                                    return v194 + v195;
                                else
                                    local v200, v201, v202 = v181(v198, v197, v195, v196);
                                    return v201 * l_pow_0(2, -10 * v193) * l_sin_0((v193 * v196 - v202) * 2 * l_pi_0 / v200) + v195 + v194;
                                end;
                            end;
                        end;
                        local function v214(v204, v205, v206, v207, v208, v209)
                            -- upvalues: v181 (ref), l_pow_0 (ref), l_sin_0 (ref), l_pi_0 (ref)
                            local v210 = nil;
                            if v204 == 0 then
                                return v205;
                            else
                                v204 = v204 / v207 * 2;
                                if v204 == 2 then
                                    return v205 + v206;
                                else
                                    local v211, v212, v213 = v181(v209, v208, v206, v207);
                                    v210 = v213;
                                    v208 = v212;
                                    v209 = v211;
                                    v204 = v204 - 1;
                                    if v204 < 0 then
                                        return -0.5 * v208 * l_pow_0(2, 10 * v204) * l_sin_0((v204 * v207 - v210) * 2 * l_pi_0 / v209) + v205;
                                    else
                                        return v208 * l_pow_0(2, -10 * v204) * l_sin_0((v204 * v207 - v210) * 2 * l_pi_0 / v209) * 0.5 + v206 + v205;
                                    end;
                                end;
                            end;
                        end;
                        local function v221(v215, v216, v217, v218, v219, v220)
                            -- upvalues: v203 (ref), v192 (ref)
                            if v215 < v218 / 2 then
                                return v203(v215 * 2, v216, v217 / 2, v218, v219, v220);
                            else
                                return v192(v215 * 2 - v218, v216 + v217 / 2, v217 / 2, v218, v219, v220);
                            end;
                        end;
                        local function v227(v222, v223, v224, v225, v226)
                            if not v226 then
                                v226 = 1.70158;
                            end;
                            v222 = v222 / v225;
                            return v224 * v222 * v222 * ((v226 + 1) * v222 - v226) + v223;
                        end;
                        local function v233(v228, v229, v230, v231, v232)
                            if not v232 then
                                v232 = 1.70158;
                            end;
                            v228 = v228 / v231 - 1;
                            return v230 * (v228 * v228 * ((v232 + 1) * v228 + v232) + 1) + v229;
                        end;
                        local function v239(v234, v235, v236, v237, v238)
                            v238 = (v238 or 1.70158) * 1.525;
                            v234 = v234 / v237 * 2;
                            if v234 < 1 then
                                return v236 / 2 * v234 * v234 * ((v238 + 1) * v234 - v238) + v235;
                            else
                                v234 = v234 - 2;
                                return v236 / 2 * (v234 * v234 * ((v238 + 1) * v234 + v238) + 2) + v235;
                            end;
                        end;
                        local function v245(v240, v241, v242, v243, v244)
                            -- upvalues: v233 (ref), v227 (ref)
                            if v240 < v243 / 2 then
                                return v233(v240 * 2, v241, v242 / 2, v243, v244);
                            else
                                return v227(v240 * 2 - v243, v241 + v242 / 2, v242 / 2, v243, v244);
                            end;
                        end;
                        local function v250(v246, v247, v248, v249)
                            v246 = v246 / v249;
                            if v246 < 0.36363636363636365 then
                                return v248 * 7.5625 * v246 * v246 + v247;
                            elseif v246 < 0.7272727272727273 then
                                v246 = v246 - 0.5454545454545454;
                                return v248 * (7.5625 * v246 * v246 + 0.75) + v247;
                            elseif v246 < 0.9090909090909091 then
                                v246 = v246 - 0.8181818181818182;
                                return v248 * (7.5625 * v246 * v246 + 0.9375) + v247;
                            else
                                v246 = v246 - 0.9545454545454546;
                                return v248 * (7.5625 * v246 * v246 + 0.984375) + v247;
                            end;
                        end;
                        local function v255(v251, v252, v253, v254)
                            -- upvalues: v250 (ref)
                            return v253 - v250(v254 - v251, 0, v253, v254) + v252;
                        end;
                        local function v260(v256, v257, v258, v259)
                            -- upvalues: v255 (ref), v250 (ref)
                            if v256 < v259 / 2 then
                                return v255(v256 * 2, 0, v258, v259) * 0.5 + v257;
                            else
                                return v250(v256 * 2 - v259, 0, v258, v259) * 0.5 + v258 * 0.5 + v257;
                            end;
                        end;
                        local function v265(v261, v262, v263, v264)
                            -- upvalues: v250 (ref), v255 (ref)
                            if v261 < v264 / 2 then
                                return v250(v261 * 2, v262, v263 / 2, v264);
                            else
                                return v255(v261 * 2 - v264, v262 + v263 / 2, v263 / 2, v264);
                            end;
                        end;
                        v23.easing = {
                            linear = v35, 
                            inQuad = v40, 
                            outQuad = v45, 
                            inOutQuad = v50, 
                            outInQuad = v55, 
                            inCubic = v60, 
                            outCubic = v65, 
                            inOutCubic = v70, 
                            outInCubic = v75, 
                            inQuart = v80, 
                            outQuart = v85, 
                            inOutQuart = v90, 
                            outInQuart = v95, 
                            inQuint = v100, 
                            outQuint = v105, 
                            inOutQuint = v110, 
                            outInQuint = v115, 
                            inSine = v120, 
                            outSine = v125, 
                            inOutSine = v130, 
                            outInSine = v135, 
                            inExpo = v140, 
                            outExpo = v145, 
                            inOutExpo = v150, 
                            outInExpo = v155, 
                            inCirc = v160, 
                            outCirc = v165, 
                            inOutCirc = v170, 
                            outInCirc = v175, 
                            inElastic = v192, 
                            outElastic = v203, 
                            inOutElastic = v214, 
                            outInElastic = v221, 
                            inBack = v227, 
                            outBack = v233, 
                            inOutBack = v239, 
                            outInBack = v245, 
                            inBounce = v255, 
                            outBounce = v250, 
                            inOutBounce = v260, 
                            outInBounce = v265
                        };
                        local function v266(v267, v268, v269)
                            -- upvalues: v266 (ref)
                            if not v269 then
                                v269 = v268;
                            end;
                            local v270 = getmetatable(v268);
                            if v270 and getmetatable(v267) == nil then
                                setmetatable(v267, v270);
                            end;
                            for v271, v272 in pairs(v268) do
                                if type(v272) == "table" then
                                    v267[v271] = v266({}, v272, v269[v271]);
                                else
                                    v267[v271] = v269[v271];
                                end;
                            end;
                            return v267;
                        end;
                        local function v273(v274, v275, v276)
                            -- upvalues: v266 (ref), v273 (ref)
                            if not v276 then
                                v276 = {};
                            end;
                            local v277 = nil;
                            local v278 = nil;
                            for v279, v280 in pairs(v275) do
                                local v281 = type(v280);
                                v278 = v266({}, v276);
                                v277 = v281;
                                table.insert(v278, tostring(v279));
                                if v277 == "number" then
                                    assert(type(v274[v279]) == "number", "Parameter '" .. table.concat(v278, "/") .. "' is missing from subject or isn't a number");
                                elseif v277 == "table" then
                                    v273(v274[v279], v280, v278);
                                else
                                    assert(v277 == "number", "Parameter '" .. table.concat(v278, "/") .. "' must be a number or table of numbers");
                                end;
                            end;
                        end;
                        local function v287(v282, v283, v284, v285)
                            -- upvalues: v273 (ref)
                            assert(type(v282) == "number" and v282 > 0, "duration must be a positive number. Was " .. tostring(v282));
                            local v286 = type(v283);
                            assert(v286 == "table" or v286 == "userdata", "subject must be a table or userdata. Was " .. tostring(v283));
                            assert(type(v284) == "table", "target must be a table. Was " .. tostring(v284));
                            assert(type(v285) == "function", "easing must be a function. Was " .. tostring(v285));
                            v273(v283, v284);
                        end;
                        local function v290(v288)
                            -- upvalues: v23 (ref)
                            if not v288 then
                                v288 = "linear";
                            end;
                            if type(v288) == "string" then
                                local l_v288_0 = v288;
                                v288 = v23.easing[l_v288_0];
                                if type(v288) ~= "function" then
                                    error("The easing function name '" .. l_v288_0 .. "' is invalid");
                                end;
                            end;
                            return v288;
                        end;
                        local function v291(v292, v293, v294, v295, v296, v297)
                            -- upvalues: v291 (ref)
                            local _ = nil;
                            local _ = nil;
                            local _ = nil;
                            local _ = nil;
                            for v302, v303 in pairs(v293) do
                                if type(v303) == "table" then
                                    v291(v292[v302], v303, v294[v302], v295, v296, v297);
                                else
                                    v292[v302] = v297(v295, v294[v302], v303 - v294[v302], v296);
                                end;
                            end;
                        end;
                        local v304 = {};
                        local v305 = {
                            __index = v304
                        };
                        v304.set = function(v306, v307)
                            -- upvalues: v266 (ref), v291 (ref)
                            assert(type(v307) == "number", "clock must be a positive number or 0");
                            v306.initial = v306.initial or v266({}, v306.target, v306.subject);
                            v306.clock = v307;
                            if v306.clock <= 0 then
                                v306.clock = 0;
                                v266(v306.subject, v306.initial);
                            elseif v306.clock >= v306.duration then
                                v306.clock = v306.duration;
                                v266(v306.subject, v306.target);
                            else
                                v291(v306.subject, v306.target, v306.initial, v306.clock, v306.duration, v306.easing);
                            end;
                            return v306.clock >= v306.duration;
                        end;
                        v304.reset = function(v308)
                            return v308:set(0);
                        end;
                        v304.update = function(v309, v310)
                            assert(type(v310) == "number", "dt must be a number");
                            return v309:set(v309.clock + v310);
                        end;
                        v23.new = function(v311, v312, v313, v314)
                            -- upvalues: v290 (ref), v287 (ref), v305 (ref)
                            v314 = v290(v314);
                            v287(v311, v312, v313, v314);
                            return setmetatable({
                                clock = 0, 
                                duration = v311, 
                                subject = v312, 
                                target = v313, 
                                easing = v314
                            }, v305);
                        end;
                        return v23;
                    end)();
                    breathe = function(v316, v317)
                        local v318 = globals.realtime * (v317 or 1) % math.pi;
                        local v319 = math.sin(v318 + (v316 or 0));
                        return (math.abs(v319));
                    end;
                    local v320 = {
                        fs = 0, 
                        dmg = 0, 
                        fd = 0, 
                        hs = 0, 
                        dt = 0, 
                        alpha = 0, 
                        custom_scope_offset = 0, 
                        scope_alpha = 0, 
                        scope_offset = 0
                    };
                    local v321 = {};
                    local v322 = render.load_image_from_file("materials/panorama/images/icons/ui/bomb_c4.svg");
                    local v323 = render.load_font("Calibri", 23, "bda");
                    local v324 = render.load_font("Calibri", 11, "bda");
                    local v325 = {};
                    math.lerp = function(v326, v327, v328)
                        return v326 + (v327 - v326) * globals.frametime * v328;
                    end;
                    ascii_to_hex = function(v329)
                        local v330 = "";
                        for v331 = 1, #v329 do
                            local v332 = string.byte(v329, v331);
                            v330 = v330 .. string.format("%02X", v332);
                        end;
                        return v330;
                    end;
                    do
                        local l_l_pui_0_0, l_l_base64_0_0, l_l_clipboard_0_0, l_l_gradient_0_0, l_v315_0, l_v320_0, l_v321_0, l_v322_0, l_v323_0, l_v324_0, l_v325_0 = l_pui_0, l_base64_0, l_clipboard_0, l_gradient_0, v315, v320, v321, v322, v323, v324, v325;
                        local function _()
                            -- upvalues: l_l_base64_0_0 (ref)
                            local v344 = {
                                lua = "genesis_beta", 
                                username = common.get_username()
                            };
                            return ascii_to_hex(l_l_base64_0_0.encode(json.stringify(v344)));
                        end;
                        local v346 = db.genesis_pidor or {
                            [1] = 0, 
                            [2] = 0, 
                            [3] = 0
                        };
                        local v347 = common.get_unixtime();
                        local function v352(v348)
                            local v349 = math.floor(v348 / 3600);
                            local v350 = math.floor((v348 - v349 * 3600) / 60);
                            local v351 = math.floor(v348 - v349 * 3600 - v350 * 60);
                            return string.format("%02d:%02d:%02d", v349, v350, v351);
                        end;
                        local v353 = {
                            aa_enable = ui.find("Aimbot", "Anti Aim", "Angles", "Enabled"), 
                            pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"), 
                            yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"), 
                            yawbase = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"), 
                            yawoffset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"), 
                            avoidbackstab = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab"), 
                            hidden = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden"), 
                            yawmodifier = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"), 
                            yawmodoffset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"), 
                            bodyyaw = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"), 
                            inverter = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"), 
                            leftlimit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"), 
                            rightlimit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"), 
                            options = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"), 
                            bodyfrees = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding"), 
                            freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"), 
                            disableyawmod = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Disable Yaw Modifiers"), 
                            bodyfreestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Body Freestanding"), 
                            extendedangles = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles"), 
                            extendedpitch = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles", "Extended Pitch"), 
                            extendedroll = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles", "Extended Roll"), 
                            fakelag = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Enabled"), 
                            fakelaglimit = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Limit"), 
                            fakelagvariab = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Variability"), 
                            fakeduck = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"), 
                            slowwalk = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"), 
                            legmovement = ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"), 
                            scopeoverlay = ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay"), 
                            clantag = ui.find("Miscellaneous", "Main", "In-Game", "Clan Tag"), 
                            lagoptions = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"), 
                            hsoptions = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options")
                        };
                        local v354 = {
                            main = l_l_pui_0_0.create("\b969696FF\b666666FF[G E N E S I S]", "\n", 1), 
                            info = l_l_pui_0_0.create("\b969696FF\b666666FF[G E N E S I S]", "\n\n", 1), 
                            config = l_l_pui_0_0.create("\b969696FF\b666666FF[G E N E S I S]", "\n\n\n", 2), 
                            picture = l_l_pui_0_0.create("\b969696FF\b666666FF[G E N E S I S]", "\n\n\n\n", 2), 
                            selector = l_l_pui_0_0.create("REBORN \v\f<heart>", "\n", 1), 
                            other_selector = l_l_pui_0_0.create("REBORN \v\f<heart>", "\n\n", 2), 
                            antiaim = l_l_pui_0_0.create("REBORN \v\f<heart>", "\n\n\n", 1), 
                            team = l_l_pui_0_0.create("REBORN \v\f<heart>", "\n\n\n\n\n\n\n\n\n", 2), 
                            builder = l_l_pui_0_0.create("REBORN \v\f<heart>", "\n\n\n\n", 2), 
                            visuals = l_l_pui_0_0.create("REBORN \v\f<heart>", "\n\n\n\n\n", 2), 
                            interface = l_l_pui_0_0.create("REBORN \v\f<heart>", "\n\n\n\n\n\n", 1), 
                            misc = l_l_pui_0_0.create("REBORN \v\f<heart>", "\n\n\n\n\n\n\n", 1), 
                            other = l_l_pui_0_0.create("REBORN \v\f<heart>", "\n\n\n\n\n\n\n\n", 2)
                        };
                        local v355 = {
                            main = {}, 
                            antiaim = {}, 
                            builder = {}, 
                            builder_t = {}, 
                            visuals = {}, 
                            misc = {}
                        };
                        v354.main:button("                         \v\f<discord>\r  Discord Server                         ", function()
                            panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://discord.gg/cyXNeBwATu");
                        end, true):tooltip("This button will open you the discord server of this script");
                        v354.main:button("                \v\f<crosshairs>\r  Neverlose Configuration              ", function()
                            panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://ru.neverlose.cc/market/item?id=aKSflX");
                        end, true):tooltip("This button will open the configuration page on the market");
                        v354.main:button("               \v\f<discord>\r  Author -> blameless1337             ", function()
                            panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://discordapp.com/users/578960933528010782");
                        end, true):tooltip("This button will open the authors discord profile");
                        v355.main.tab = v354.selector:list("", {
                            [1] = "\v\f<user-helmet-safety>\r    Anti-Aim", 
                            [2] = "\v\f<sliders>\r    Other"
                        });
                        v355.misc.selector = v354.other_selector:list("", {
                            [1] = "\v\f<palette>\r    Visuals", 
                            [2] = "\v\f<gears>\r    Misc"
                        }):depend({
                            [1] = nil, 
                            [2] = 2, 
                            [1] = v355.main.tab
                        });
                        v354.info:label("\v\f<user>\r   User: ");
                        v354.info:button("\v" .. common.get_username(), function()

                        end, true);
                        v354.info:label("\v\f<code-branch>\r   Version: ");
                        v354.info:button("\v2.0", function()

                        end, true);
                        v354.info:label("\v\f<code-compare>\r   Stay With US: ");
                        v354.info:button("\vG E N E S I S", function()

                        end, true);
                        v355.generate_key = v354.config:button("                       \v\f<discord>\r  Discord Verify Key                 ", function()
                            panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://ru.neverlose.cc/market/item?id=5O16jT");
                        end, true);
                        v355.import = v354.config:button("   \v\f<download>\r  Import Config  ", function()

                        end, true);
                        v355.export = v354.config:button("   \v\f<share-nodes>\r  Export Config  ", function()

                        end, true);
                        v355.default = v354.config:button("                        \v\f<check>\r  Default Config                         ", function()

                        end, true);
                        local v356 = v352(v346[3]);
                        v354.picture:label("\v\f<clock>\r   Time Played: ");
                        v354.picture:button(" \v" .. v356 .. " ", function()

                        end, true);
                        v354.picture:label("\v\f<shield>\r   Missed shots at \vyou: ");
                        v354.picture:button(" \v" .. v346[2] .. " ", function()

                        end, true);
                        v354.picture:label("\v\f<skull>\r   Enemies \veliminated: ");
                        v354.picture:button(" \v" .. v346[1] .. " ", function()

                        end, true);
                        v355.misc.clantag = v354.misc:switch("\v\f<tag>\r   Clantag"):depend({
                            [1] = nil, 
                            [2] = 2, 
                            [1] = v355.main.tab
                        }, {
                            [1] = nil, 
                            [2] = 2, 
                            [1] = v355.misc.selector
                        });
                        v355.misc.trashtalk = v354.misc:switch("\v\f<comment>\r   Trashtalk"):depend({
                            [1] = nil, 
                            [2] = 2, 
                            [1] = v355.main.tab
                        }, {
                            [1] = nil, 
                            [2] = 2, 
                            [1] = v355.misc.selector
                        });
                        v355.misc.edge_stop = v354.misc:switch("\v\f<block-brick>\r   Edge Stop"):depend({
                            [1] = nil, 
                            [2] = 2, 
                            [1] = v355.main.tab
                        }, {
                            [1] = nil, 
                            [2] = 2, 
                            [1] = v355.misc.selector
                        });
                        v355.misc.fastladder = v354.misc:switch("\v\f<water-ladder>\r   Fast Ladder"):depend({
                            [1] = nil, 
                            [2] = 2, 
                            [1] = v355.main.tab
                        }, {
                            [1] = nil, 
                            [2] = 2, 
                            [1] = v355.misc.selector
                        });
                        v355.misc.aspectratio = v354.misc:switch("\v\f<eye>\r   Aspect Ratio"):depend({
                            [1] = nil, 
                            [2] = 2, 
                            [1] = v355.main.tab
                        }, {
                            [1] = nil, 
                            [2] = 2, 
                            [1] = v355.misc.selector
                        });
                        v355.misc.aspectratio_create = v355.misc.aspectratio:create();
                        v355.misc.aspectratio_amount = v355.misc.aspectratio_create:slider("Amount", 0, 200, 0, 1, function(v357)
                            local _ = 0;
                            return v357 == 125 and "5:4" or v357 == 133 and "4:3" or v357 == 150 and "3:2" or v357 == 160 and "16:10" or v357 == 180 and "16:9" or v357;
                        end):depend(v355.misc.aspectratio);
                        v355.misc.aspectratio_create:button("  \v5:4  ", function()
                            -- upvalues: v355 (ref)
                            v355.misc.aspectratio_amount:set(125);
                        end, true):depend(v355.misc.aspectratio);
                        v355.misc.aspectratio_create:button("  \v4:3  ", function()
                            -- upvalues: v355 (ref)
                            v355.misc.aspectratio_amount:set(133);
                        end, true):depend(v355.misc.aspectratio);
                        v355.misc.aspectratio_create:button("  \v3:2  ", function()
                            -- upvalues: v355 (ref)
                            v355.misc.aspectratio_amount:set(150);
                        end, true):depend(v355.misc.aspectratio);
                        v355.misc.aspectratio_create:button("  \v16:10  ", function()
                            -- upvalues: v355 (ref)
                            v355.misc.aspectratio_amount:set(160);
                        end, true):depend(v355.misc.aspectratio);
                        v355.misc.aspectratio_create:button("  \v16:9  ", function()
                            -- upvalues: v355 (ref)
                            v355.misc.aspectratio_amount:set(180);
                        end, true):depend(v355.misc.aspectratio);
                        v355.misc.rage_logs = v354.misc:switch("\v\f<gun>\r   Ragebot Logs"):depend({
                            [1] = nil, 
                            [2] = 2, 
                            [1] = v355.main.tab
                        }, {
                            [1] = nil, 
                            [2] = 2, 
                            [1] = v355.misc.selector
                        });
                        v355.misc.rage_logs_create = v355.misc.rage_logs:create();
                        v355.misc.rage_logs_type = v355.misc.rage_logs_create:listable("", {
                            [1] = "Console", 
                            [2] = "Event", 
                            [3] = "Screen"
                        }):depend(v355.misc.rage_logs);
                        v355.misc.rage_logs_style = v355.misc.rage_logs_create:list("", {
                            [1] = "Default", 
                            [2] = "Modern"
                        }):depend(v355.misc.rage_logs, {
                            [1] = nil, 
                            [2] = 3, 
                            [1] = v355.misc.rage_logs_type
                        });
                        v355.misc.rage_logs_round = v355.misc.rage_logs_create:slider("Rounding", 0, 10, 3):depend(v355.misc.rage_logs, {
                            [1] = nil, 
                            [2] = 3, 
                            [1] = v355.misc.rage_logs_type
                        }, {
                            [1] = nil, 
                            [2] = 2, 
                            [1] = v355.misc.rage_logs_style
                        });
                        v355.misc.rage_logs_hit = v355.misc.rage_logs_create:color_picker("Hit Color", color(186, 196, 249)):depend(v355.misc.rage_logs, {
                            [1] = nil, 
                            [2] = 3, 
                            [1] = v355.misc.rage_logs_type
                        }, {
                            [1] = v355.misc.rage_logs_style, 
                            [2] = function()
                                -- upvalues: v355 (ref)
                                return v355.misc.rage_logs_style:get() ~= 3;
                            end
                        });
                        v355.misc.rage_logs_miss = v355.misc.rage_logs_create:color_picker("Miss Color", color(186, 90, 90)):depend(v355.misc.rage_logs, {
                            [1] = nil, 
                            [2] = 3, 
                            [1] = v355.misc.rage_logs_type
                        }, {
                            [1] = v355.misc.rage_logs_style, 
                            [2] = function()
                                -- upvalues: v355 (ref)
                                return v355.misc.rage_logs_style:get() ~= 3;
                            end
                        });
                        v355.misc.auto_teleport = v354.misc:switch("\v\f<transporter>\r   Auto Teleport"):depend({
                            [1] = nil, 
                            [2] = 2, 
                            [1] = v355.main.tab
                        }, {
                            [1] = nil, 
                            [2] = 2, 
                            [1] = v355.misc.selector
                        });
                        v355.misc.no_fall_damage = v354.other:switch("\v\f<person-falling>\r   No Fall Damage"):depend({
                            [1] = nil, 
                            [2] = 2, 
                            [1] = v355.main.tab
                        }, {
                            [1] = nil, 
                            [2] = 2, 
                            [1] = v355.misc.selector
                        });
                        v355.misc.dormant_aimbot = v354.other:switch("\v\f<eye-slash>\r   Dormant Aimbot"):depend({
                            [1] = nil, 
                            [2] = 2, 
                            [1] = v355.main.tab
                        }, {
                            [1] = nil, 
                            [2] = 2, 
                            [1] = v355.misc.selector
                        });
                        v355.misc.fakeping = v354.other:switch("\v\f<wifi>\r   Unlock Fake Ping"):depend({
                            [1] = nil, 
                            [2] = 2, 
                            [1] = v355.main.tab
                        }, {
                            [1] = nil, 
                            [2] = 2, 
                            [1] = v355.misc.selector
                        });
                        v355.misc.fakeping_create = v355.misc.fakeping:create();
                        v355.misc.fakeping_amount = v355.misc.fakeping_create:slider("Amount", 0, 200, 130):depend(v355.misc.fakeping);
                        v355.misc.hitchance = v354.other:switch("\v\f<location-crosshairs-slash>\r   Custom Hitchance"):depend({
                            [1] = nil, 
                            [2] = 2, 
                            [1] = v355.main.tab
                        }, {
                            [1] = nil, 
                            [2] = 2, 
                            [1] = v355.misc.selector
                        });
                        v355.misc.hitchance_create = v355.misc.hitchance:create();
                        v355.misc.hitchance_air = v355.misc.hitchance_create:selectable("In Air Hitchance", {
                            [1] = "Scout", 
                            [2] = "R8", 
                            [3] = "Shotgun", 
                            [4] = "SMG"
                        }):depend(v355.misc.hitchance);
                        v355.misc.hitchance_scope = v355.misc.hitchance_create:selectable("No Scope Hitchance", {
                            [1] = "AWP", 
                            [2] = "Auto", 
                            [3] = "Scout"
                        }):depend(v355.misc.hitchance);
                        v355.misc.hitchance_air_scout = v355.misc.hitchance_create:slider("[AIR] Scout", 0, 100, 40):depend(v355.misc.hitchance, {
                            [1] = nil, 
                            [2] = "Scout", 
                            [1] = v355.misc.hitchance_air
                        });
                        v355.misc.hitchance_air_r8 = v355.misc.hitchance_create:slider("[AIR] R8", 0, 100, 40):depend(v355.misc.hitchance, {
                            [1] = nil, 
                            [2] = "R8", 
                            [1] = v355.misc.hitchance_air
                        });
                        v355.misc.hitchance_air_shotgun = v355.misc.hitchance_create:slider("[AIR] Shotgun", 0, 100, 40):depend(v355.misc.hitchance, {
                            [1] = nil, 
                            [2] = "Shotgun", 
                            [1] = v355.misc.hitchance_air
                        });
                        v355.misc.hitchance_air_smg = v355.misc.hitchance_create:slider("[AIR] SMG", 0, 100, 40):depend(v355.misc.hitchance, {
                            [1] = nil, 
                            [2] = "SMG", 
                            [1] = v355.misc.hitchance_air
                        });
                        v355.misc.hitchance_scope_awp = v355.misc.hitchance_create:slider("[NO SCOPE] AWP", 0, 100, 40):depend(v355.misc.hitchance, {
                            [1] = nil, 
                            [2] = "AWP", 
                            [1] = v355.misc.hitchance_scope
                        });
                        v355.misc.hitchance_scope_auto = v355.misc.hitchance_create:slider("[NO SCOPE] Auto", 0, 100, 40):depend(v355.misc.hitchance, {
                            [1] = nil, 
                            [2] = "Auto", 
                            [1] = v355.misc.hitchance_scope
                        });
                        v355.misc.hitchance_scope_scout = v355.misc.hitchance_create:slider("[NO SCOPE] Scout", 0, 100, 40):depend(v355.misc.hitchance, {
                            [1] = nil, 
                            [2] = "Scout", 
                            [1] = v355.misc.hitchance_scope
                        });
                        v355.misc.viewmodel = v354.other:switch("\v\f<hands-praying>\r   Viewmodel Changer"):depend({
                            [1] = nil, 
                            [2] = 2, 
                            [1] = v355.main.tab
                        }, {
                            [1] = nil, 
                            [2] = 2, 
                            [1] = v355.misc.selector
                        });
                        v355.misc.viewmodel_create = v355.misc.viewmodel:create();
                        v355.misc.viewmodel_fov = v355.misc.viewmodel_create:slider("Fov", -100, 100, 68):depend(v355.misc.viewmodel);
                        v355.misc.viewmodel_x = v355.misc.viewmodel_create:slider("X", -10, 10, 3):depend(v355.misc.viewmodel);
                        v355.misc.viewmodel_y = v355.misc.viewmodel_create:slider("Y", -10, 10, 0):depend(v355.misc.viewmodel);
                        v355.misc.viewmodel_z = v355.misc.viewmodel_create:slider("Z", -10, 10, -2):depend(v355.misc.viewmodel);
                        v355.misc.viewmodel_create:button("                        \vReset \rViewmodel                       ", function()
                            -- upvalues: v355 (ref)
                            v355.misc.viewmodel_fov:set(68);
                            v355.misc.viewmodel_x:set(2.5);
                            v355.misc.viewmodel_y:set(0);
                            v355.misc.viewmodel_z:set(-1.5);
                        end, true):depend(v355.misc.viewmodel);
                        v355.misc.auto_hs = v354.other:switch("\v\f<shield>\r   Automatic Hide Shots"):depend({
                            [1] = nil, 
                            [2] = 2, 
                            [1] = v355.main.tab
                        }, {
                            [1] = nil, 
                            [2] = 2, 
                            [1] = v355.misc.selector
                        });
                        v355.misc.auto_hs:tooltip("Automatically turns off the double tap, and turns on the hide shots in the crouch. Working only on scout, awp");
                        v355.misc.auto_grenade = v354.other:switch("\v\f<bomb>\r   Auto Grenade Release"):depend({
                            [1] = nil, 
                            [2] = 2, 
                            [1] = v355.main.tab
                        }, {
                            [1] = nil, 
                            [2] = 2, 
                            [1] = v355.misc.selector
                        });
                        v355.misc.auto_grenade_create = v355.misc.auto_grenade:create();
                        v355.misc.auto_grenade_he = v355.misc.auto_grenade_create:slider("HE Damage", 0, 50, 20):depend(v355.misc.auto_grenade);
                        v355.misc.auto_grenade_molotov = v355.misc.auto_grenade_create:slider("Molotov Radius", 10, 200, 100):depend(v355.misc.auto_grenade);
                        v355.visuals.solus_ui = v354.interface:switch("\v\f<window>\r   Solus UI"):depend({
                            [1] = nil, 
                            [2] = 2, 
                            [1] = v355.main.tab
                        }, {
                            [1] = nil, 
                            [2] = 1, 
                            [1] = v355.misc.selector
                        });
                        v355.visuals.solus_ui_create = v355.visuals.solus_ui:create();
                        v355.visuals.solus_ui_type = v355.visuals.solus_ui_create:list("", {
                            [1] = "V1", 
                            [2] = "V2", 
                            [3] = "V3", 
                            [4] = "Modern"
                        }):depend(v355.visuals.solus_ui);
                        v355.visuals.solus_ui_round = v355.visuals.solus_ui_create:slider("Rounding", 0, 10, 3):depend(v355.visuals.solus_ui, {
                            [1] = nil, 
                            [2] = "Modern", 
                            [1] = v355.visuals.solus_ui_type
                        });
                        v355.visuals.solus_ui_list = v355.visuals.solus_ui_create:listable("", {
                            [1] = "Watermark", 
                            [2] = "Keybinds", 
                            [3] = "Spectators", 
                            [4] = "Bomb Info"
                        }):depend(v355.visuals.solus_ui);
                        v355.visuals.solus_ui_name = v355.visuals.solus_ui_create:input("Username", common.get_username()):depend(v355.visuals.solus_ui, {
                            [1] = nil, 
                            [2] = 1, 
                            [1] = v355.visuals.solus_ui_list
                        });
                        v355.visuals.solus_ui_color = v355.visuals.solus_ui_create:color_picker("Accent", color(186, 196, 249)):depend(v355.visuals.solus_ui);
                        v355.visuals.windows = v354.interface:switch("\v\f<slider>\r   Windows"):depend({
                            [1] = nil, 
                            [2] = 2, 
                            [1] = v355.main.tab
                        }, {
                            [1] = nil, 
                            [2] = 1, 
                            [1] = v355.misc.selector
                        });
                        v355.visuals.windows_create = v355.visuals.windows:create();
                        v355.visuals.windows_select = v355.visuals.windows_create:listable("", {
                            [1] = "Velocity", 
                            [2] = "Defensive"
                        }):depend(v355.visuals.windows);
                        v355.visuals.windows_slowed = v355.visuals.windows_create:combo("Velocity Style", {
                            [1] = "Default", 
                            [2] = "Modern", 
                            [3] = "Newest"
                        }):depend(v355.visuals.windows, {
                            [1] = nil, 
                            [2] = 1, 
                            [1] = v355.visuals.windows_select
                        });
                        v355.visuals.windows_slowed_clr = v355.visuals.windows_create:color_picker("Velocity Color", color(220)):depend(v355.visuals.windows, {
                            [1] = nil, 
                            [2] = 1, 
                            [1] = v355.visuals.windows_select
                        });
                        v355.visuals.windows_defensive = v355.visuals.windows_create:combo("Defensive Style", {
                            [1] = "Default", 
                            [2] = "Modern", 
                            [3] = "Newest"
                        }):depend(v355.visuals.windows, {
                            [1] = nil, 
                            [2] = 2, 
                            [1] = v355.visuals.windows_select
                        });
                        v355.visuals.windows_defensive_clr = v355.visuals.windows_create:color_picker("Defensive Color", color(220)):depend(v355.visuals.windows, {
                            [1] = nil, 
                            [2] = 2, 
                            [1] = v355.visuals.windows_select
                        });
                        v355.visuals.gs_features = v354.interface:switch("\v\f<message-text>\r   G\a9AAF36FFS\r Features"):depend({
                            [1] = nil, 
                            [2] = 2, 
                            [1] = v355.main.tab
                        }, {
                            [1] = nil, 
                            [2] = 1, 
                            [1] = v355.misc.selector
                        });
                        v355.visuals.gs_features_create = v355.visuals.gs_features:create();
                        v355.visuals.gs_indicators = v355.visuals.gs_features_create:switch("Indicators"):depend(v355.visuals.gs_features, {
                            [1] = nil, 
                            [2] = 2, 
                            [1] = v355.main.tab
                        }, {
                            [1] = nil, 
                            [2] = 1, 
                            [1] = v355.misc.selector
                        });
                        v355.visuals.gs_spectators = v355.visuals.gs_features_create:switch("Spectators"):depend(v355.visuals.gs_features, {
                            [1] = nil, 
                            [2] = 2, 
                            [1] = v355.main.tab
                        }, {
                            [1] = nil, 
                            [2] = 1, 
                            [1] = v355.misc.selector
                        });
                        v355.visuals.gs_trans = v355.visuals.gs_features_create:switch("Keep Model Transparency"):depend(v355.visuals.gs_features, {
                            [1] = nil, 
                            [2] = 2, 
                            [1] = v355.main.tab
                        }, {
                            [1] = nil, 
                            [2] = 1, 
                            [1] = v355.misc.selector
                        });
                        v355.visuals.custom_scope = v354.interface:switch("\v\f<crosshairs>\r   Custom Scope"):depend({
                            [1] = nil, 
                            [2] = 2, 
                            [1] = v355.main.tab
                        }, {
                            [1] = nil, 
                            [2] = 1, 
                            [1] = v355.misc.selector
                        });
                        v355.visuals.custom_scope_create = v355.visuals.custom_scope:create();
                        v355.visuals.custom_scope_t = v355.visuals.custom_scope_create:switch("T Scope"):depend(v355.visuals.custom_scope);
                        v355.visuals.custom_scope_inverted = v355.visuals.custom_scope_create:switch("Inverted"):depend(v355.visuals.custom_scope);
                        v355.visuals.custom_scope_length = v355.visuals.custom_scope_create:slider("Length", 10, 250, 50):depend(v355.visuals.custom_scope);
                        v355.visuals.custom_scope_offset = v355.visuals.custom_scope_create:slider("Offset", 1, 50, 10):depend(v355.visuals.custom_scope);
                        v355.visuals.custom_scope_anim = v355.visuals.custom_scope_create:slider("Animation", 1, 20, 10):depend(v355.visuals.custom_scope);
                        v355.visuals.custom_scope_color = v355.visuals.custom_scope_create:color_picker("Color"):depend(v355.visuals.custom_scope);
                        v355.visuals.world_hitmarker = v354.visuals:switch("\v\f<earth-africa>\r   World Hitmarker"):depend({
                            [1] = nil, 
                            [2] = 2, 
                            [1] = v355.main.tab
                        }, {
                            [1] = nil, 
                            [2] = 1, 
                            [1] = v355.misc.selector
                        });
                        v355.visuals.world_hitmarker_clr = v355.visuals.world_hitmarker:color_picker("Color", color(88, 255, 209, 255)):depend(v355.visuals.world_hitmarker);
                        v355.visuals.world_missmarker = v354.visuals:switch("\v\f<bomb>\r   World Missmarker"):depend({
                            [1] = nil, 
                            [2] = 2, 
                            [1] = v355.main.tab
                        }, {
                            [1] = nil, 
                            [2] = 1, 
                            [1] = v355.misc.selector
                        });
                        v355.visuals.world_missmarker_clr = v355.visuals.world_missmarker:color_picker("Color", color(255, 0, 0)):depend(v355.visuals.world_missmarker);
                        v355.visuals.crosshair_ind = v354.visuals:switch("\v\f<display>\r   Crosshair Indicators"):depend({
                            [1] = nil, 
                            [2] = 2, 
                            [1] = v355.main.tab
                        }, {
                            [1] = nil, 
                            [2] = 1, 
                            [1] = v355.misc.selector
                        });
                        v355.visuals.crosshair_ind_create = v355.visuals.crosshair_ind:create();
                        v355.visuals.crosshair_ind_color1 = v355.visuals.crosshair_ind_create:color_picker("Color 1", color(255, 100, 100)):depend(v355.visuals.crosshair_ind);
                        v355.visuals.crosshair_ind_color2 = v355.visuals.crosshair_ind_create:color_picker("Color 2", color(200)):depend(v355.visuals.crosshair_ind);
                        v355.visuals.damage_indicator = v354.visuals:switch("\v\f<gun>\r   Min. Damage Indicator"):depend({
                            [1] = nil, 
                            [2] = 2, 
                            [1] = v355.main.tab
                        }, {
                            [1] = nil, 
                            [2] = 1, 
                            [1] = v355.misc.selector
                        });
                        v355.visuals.damage_indicator_create = v355.visuals.damage_indicator:create();
                        v355.visuals.damage_indicator_font = v355.visuals.damage_indicator_create:combo("Font", {
                            [1] = "Default", 
                            [2] = "Small", 
                            [3] = "Bold", 
                            [4] = "Console"
                        }):depend(v355.visuals.damage_indicator);
                        v355.antiaim.pitch = v354.antiaim:combo("\v\f<user>\r   Pitch", v353.pitch:list()):depend({
                            [1] = nil, 
                            [2] = 1, 
                            [1] = v355.main.tab
                        });
                        v355.antiaim.yaw = v354.antiaim:combo("\v\f<right-left>\r   Yaw Base", {
                            [1] = "Local View", 
                            [2] = "At Target", 
                            [3] = "Left", 
                            [4] = "Right", 
                            [5] = "Forward"
                        }):depend({
                            [1] = nil, 
                            [2] = 1, 
                            [1] = v355.main.tab
                        });
                        v355.antiaim.yaw_create = v355.antiaim.yaw:create();
                        v355.antiaim.yaw_static = v355.antiaim.yaw_create:switch("Static On Manual Yaw"):depend({
                            [1] = nil, 
                            [2] = 1, 
                            [1] = v355.main.tab
                        });
                        v355.antiaim.yaw_flick = v355.antiaim.yaw_create:switch("Defensive Flick On Manual Yaw"):depend({
                            [1] = nil, 
                            [2] = 1, 
                            [1] = v355.main.tab
                        });
                        v355.antiaim.yaw_hit = v355.antiaim.yaw_create:switch("Hittable Check"):depend(v355.antiaim.yaw_flick, {
                            [1] = nil, 
                            [2] = 1, 
                            [1] = v355.main.tab
                        });
                        v355.antiaim.yaw_pitch = v355.antiaim.yaw_create:slider("Pitch Offset", -89, 89, 0):depend(v355.antiaim.yaw_flick, {
                            [1] = nil, 
                            [2] = 1, 
                            [1] = v355.main.tab
                        });
                        v355.antiaim.additions = v354.antiaim:selectable("\v\f<calculator-simple>\r   Additions", {
                            [1] = "Safe Head", 
                            [2] = "Warmup Anti-Aim", 
                            [3] = "Avoid Backstab"
                        }):depend({
                            [1] = nil, 
                            [2] = 1, 
                            [1] = v355.main.tab
                        });
                        v355.antiaim.additions_create = v355.antiaim.additions:create();
                        v355.antiaim.safe_head = v355.antiaim.additions_create:selectable("\v\f<caret-right>\r   Safe Head", {
                            [1] = "Air~C Knife", 
                            [2] = "Air~C Taser", 
                            [3] = "Height Difference"
                        }):depend({
                            [1] = nil, 
                            [2] = 1, 
                            [1] = v355.main.tab
                        }, {
                            [1] = nil, 
                            [2] = "Safe Head", 
                            [1] = v355.antiaim.additions
                        });
                        v355.antiaim.safe_head_difference = v355.antiaim.additions_create:slider("Difference", 0, 200, 50, 1, "%"):depend({
                            [1] = nil, 
                            [2] = 1, 
                            [1] = v355.main.tab
                        }, {
                            [1] = nil, 
                            [2] = "Safe Head", 
                            [1] = v355.antiaim.additions
                        }, {
                            [1] = nil, 
                            [2] = "Height Difference", 
                            [1] = v355.antiaim.safe_head
                        });
                        v355.antiaim.freestanding = v354.antiaim:switch("\v\f<arrows-up-down-left-right>\r   Freestanding"):depend({
                            [1] = nil, 
                            [2] = 1, 
                            [1] = v355.main.tab
                        });
                        v355.antiaim.freestanding_create = v355.antiaim.freestanding:create();
                        v355.antiaim.freestanding_flick = v355.antiaim.freestanding_create:switch("Defensive Flick"):depend({
                            [1] = nil, 
                            [2] = 1, 
                            [1] = v355.main.tab
                        });
                        v355.antiaim.freestanding_hit = v355.antiaim.freestanding_create:switch("Hittable Check"):depend(v355.antiaim.freestanding_flick, {
                            [1] = nil, 
                            [2] = 1, 
                            [1] = v355.main.tab
                        });
                        v355.antiaim.freestanding_pitch = v355.antiaim.freestanding_create:slider("Pitch Offset", -89, 89, 0):depend(v355.antiaim.freestanding_flick, {
                            [1] = nil, 
                            [2] = 1, 
                            [1] = v355.main.tab
                        });
                        v355.antiaim.freestanding_bodyfreestanding = v355.antiaim.freestanding_create:switch("Body Freestanding"):depend({
                            [1] = nil, 
                            [2] = 1, 
                            [1] = v355.main.tab
                        });
                        v355.antiaim.freestanding_disableyawmod = v355.antiaim.freestanding_create:switch("Disable Yaw Modifiers"):depend({
                            [1] = nil, 
                            [2] = 1, 
                            [1] = v355.main.tab
                        });
                        v355.antiaim.anim_breakers = v354.antiaim:switch("\v\f<boot>\r   Anim. Breakers"):depend({
                            [1] = nil, 
                            [2] = 1, 
                            [1] = v355.main.tab
                        });
                        v355.antiaim.anim_breakers_create = v355.antiaim.anim_breakers:create();
                        v355.antiaim.anim_ground = v355.antiaim.anim_breakers_create:combo("On Ground", {
                            [1] = "Disabled", 
                            [2] = "Static", 
                            [3] = "Sliding", 
                            [4] = "Moonwalk", 
                            [5] = "Jitter", 
                            [6] = "Better Jitter"
                        }):depend(v355.antiaim.anim_breakers, {
                            [1] = nil, 
                            [2] = 1, 
                            [1] = v355.main.tab
                        });
                        v355.antiaim.anim_jitter = v355.antiaim.anim_breakers_create:slider("Jitter", 0, 100, 80):depend(v355.antiaim.anim_breakers, {
                            [1] = nil, 
                            [2] = 1, 
                            [1] = v355.main.tab
                        }, {
                            [1] = v355.antiaim.anim_ground, 
                            [2] = function()
                                -- upvalues: v355 (ref)
                                return v355.antiaim.anim_ground:get() == "Jitter" or v355.antiaim.anim_ground:get() == "Better Jitter";
                            end
                        });
                        v355.antiaim.anim_air = v355.antiaim.anim_breakers_create:combo("In Air", {
                            [1] = "Disabled", 
                            [2] = "Static", 
                            [3] = "Flying", 
                            [4] = "Moonwalk", 
                            [5] = "Jitter", 
                            [6] = "Better Jitter"
                        }):depend(v355.antiaim.anim_breakers, {
                            [1] = nil, 
                            [2] = 1, 
                            [1] = v355.main.tab
                        });
                        v355.antiaim.anim_air_jitter = v355.antiaim.anim_breakers_create:slider("In Air Jitter", 0, 100, 80):depend(v355.antiaim.anim_breakers, {
                            [1] = nil, 
                            [2] = 1, 
                            [1] = v355.main.tab
                        }, {
                            [1] = v355.antiaim.anim_air, 
                            [2] = function()
                                -- upvalues: v355 (ref)
                                return v355.antiaim.anim_air:get() == "Jitter" or v355.antiaim.anim_air:get() == "Better Jitter";
                            end
                        });
                        v355.antiaim.anim_other = v355.antiaim.anim_breakers_create:selectable("Other", {
                            [1] = "Zero Pitch On Land", 
                            [2] = "Move Lean", 
                            [3] = "EarthQuake", 
                            [4] = "Static"
                        }):depend(v355.antiaim.anim_breakers, {
                            [1] = nil, 
                            [2] = 1, 
                            [1] = v355.main.tab
                        });
                        v355.antiaim.anim_lean = v355.antiaim.anim_breakers_create:slider("Move Lean", 0, 100, 100):depend(v355.antiaim.anim_breakers, {
                            [1] = nil, 
                            [2] = 1, 
                            [1] = v355.main.tab
                        }, {
                            [1] = nil, 
                            [2] = "Move Lean", 
                            [1] = v355.antiaim.anim_other
                        });
                        v355.antiaim.config_manager = v354.antiaim:label("\v\f<rectangle-list>\r   Config Manager"):depend({
                            [1] = nil, 
                            [2] = 1, 
                            [1] = v355.main.tab
                        });
                        v355.antiaim.config_manager_create = v355.antiaim.config_manager:create();
                        v355.antiaim.cond = {
                            [1] = "General", 
                            [2] = "Standing", 
                            [3] = "Moving", 
                            [4] = "Walking", 
                            [5] = "Crouching", 
                            [6] = "Snaking", 
                            [7] = "In Air", 
                            [8] = "In Air~C", 
                            [9] = "Discharged", 
                            [10] = "Direction"
                        };
                        v355.antiaim.short_cond = {
                            [1] = "\vG\r \194\183 ", 
                            [2] = "\vS\r \194\183 ", 
                            [3] = "\vM\r \194\183 ", 
                            [4] = "\vW\r \194\183 ", 
                            [5] = "\vC\r \194\183 ", 
                            [6] = "\vS\r \194\183 ", 
                            [7] = "\vA\r \194\183 ", 
                            [8] = "\vA~C\r \194\183 ", 
                            [9] = "\vD\r \194\183 ", 
                            [10] = "\vDR\r \194\183 "
                        };
                        v355.antiaim.team = v354.team:list("\n", {
                            [1] = "\v\f<shield>\r  CT", 
                            [2] = "\v\f<gun>\r  T"
                        }):depend({
                            [1] = nil, 
                            [2] = 1, 
                            [1] = v355.main.tab
                        });
                        local function v360(v359)
                            -- upvalues: v355 (ref)
                            if v359:get() == 1 then
                                v355.antiaim.condname = "\v\f<shield>\r  ";
                            else
                                v355.antiaim.condname = "\v\f<gun>\r  ";
                            end;
                        end;
                        v360(v355.antiaim.team);
                        v355.antiaim.conditions = v354.builder:combo(v355.antiaim.condname .. " State", v355.antiaim.cond):depend({
                            [1] = nil, 
                            [2] = 1, 
                            [1] = v355.main.tab
                        });
                        v355.antiaim.team:set_callback(function(v361)
                            -- upvalues: v360 (ref), v355 (ref)
                            v360(v361);
                            v355.antiaim.conditions:name(v355.antiaim.condname .. " State");
                        end);
                        for v362 = 1, #v355.antiaim.cond do
                            v355.builder[v362] = {};
                            v355.builder[v362].enable = v354.builder:switch("\v" .. "\f<square-check>\r  Override \v" .. v355.antiaim.cond[v362] .. "\r State");
                            v355.builder[v362].yaw_left = v354.builder:slider("\v\f<left-from-line>\r  Yaw Left", -180, 180, 0, 1, "\194\176");
                            v355.builder[v362].yaw_right = v354.builder:slider("\v\f<right-from-line>\r  Yaw Right", -180, 180, 0, 1, "\194\176");
                            v355.builder[v362].yaw_random = v354.builder:slider("\v\f<dice-five>\r  Yaw Random", 0, 100, 0, 1, "%");
                            v355.builder[v362].yawmodifier = v354.builder:combo("\v\f<arrows-left-right-to-line>\r  Modifier", v353.yawmodifier:list());
                            v355.builder[v362].yawmodifier_create = v355.builder[v362].yawmodifier:create();
                            v355.builder[v362].yawmodifier_offset = v355.builder[v362].yawmodifier_create:slider("Offset", -180, 180, 0);
                            v355.builder[v362].yawmodifier_random = v355.builder[v362].yawmodifier_create:slider("Random", 0, 100, 0);
                            v355.builder[v362].bodyyaw = v354.builder:switch("\v\f<angle>\r  Body Yaw");
                            v355.builder[v362].bodyyaw_create = v355.builder[v362].bodyyaw:create();
                            v355.builder[v362].invert = v355.builder[v362].bodyyaw_create:switch("Inverter");
                            v355.builder[v362].leftlimit = v355.builder[v362].bodyyaw_create:slider("Left Limit", 0, 60, 60);
                            v355.builder[v362].rightlimit = v355.builder[v362].bodyyaw_create:slider("Right Limit", 0, 60, 60);
                            v355.builder[v362].options = v355.builder[v362].bodyyaw_create:selectable("Options", v353.options:list());
                            v355.builder[v362].delay = v355.builder[v362].bodyyaw_create:slider("Jitter Speed", 1, 10, 1, 1, function(v363)
                                return v363 == 1 and "NL" or v363;
                            end);
                            v355.builder[v362].bodyfreestanding = v355.builder[v362].bodyyaw_create:combo("Freestanding", v353.bodyfrees:list());
                            v355.builder[v362].defensive_type = v354.builder:selectable("\v\f<explosion>\r  Break \aD8DB68FFLC", {
                                [1] = "DT", 
                                [2] = "Hide Shots"
                            });
                            v355.builder[v362].defensive_type_create = v355.builder[v362].defensive_type:create();
                            v355.builder[v362].defensive_type_type = v355.builder[v362].defensive_type_create:list("\n", {
                                [1] = "Default", 
                                [2] = "Switch", 
                                [3] = "Always"
                            });
                            v355.builder[v362].defensive = v354.builder:switch("\v\f<arrows-spin>\r  Defensive Snap");
                            v355.builder[v362].defensive_create = v355.builder[v362].defensive:create();
                            v355.builder[v362].defensive_clear = v355.builder[v362].defensive_create:switch("Clear Yaw");
                            v355.builder[v362].defensive_yaw = v355.builder[v362].defensive_create:combo("Yaw", {
                                [1] = "Disabled", 
                                [2] = "Default", 
                                [3] = "Spin", 
                                [4] = "Progressive Spin", 
                                [5] = "Offset", 
                                [6] = "Random", 
                                [7] = "Side", 
                                [8] = "Center", 
                                [9] = "3-Way"
                            });
                            v355.builder[v362].exploit_direction = v355.builder[v362].defensive_create:switch("Side Based");
                            v355.builder[v362].defensive_yaw_offset = v355.builder[v362].defensive_create:slider("Yaw Offset", -180, 180, 0);
                            v355.builder[v362].defensive_pitch = v355.builder[v362].defensive_create:combo("Pitch", {
                                [1] = "Disabled", 
                                [2] = "Offset", 
                                [3] = "Random", 
                                [4] = "Corner", 
                                [5] = "Side"
                            });
                            v355.builder[v362].defensive_pitch_offset = v355.builder[v362].defensive_create:slider("Pitch Offset", -89, 89, 0);
                            v355.builder[v362].send_to_t = v354.builder:button("              \v\f<share-nodes>\r  Send \vCurrent State\r To \vT             ", function()

                            end, true);
                        end;
                        for v364 = 1, #v355.antiaim.cond do
                            v355.builder_t[v364] = {};
                            v355.builder_t[v364].enable = v354.builder:switch("\v" .. "\f<square-check>\r  Override \v" .. v355.antiaim.cond[v364] .. "\r State");
                            v355.builder_t[v364].yaw_left = v354.builder:slider("\v\f<left-from-line>\r  Yaw Left", -180, 180, 0, 1, "\194\176");
                            v355.builder_t[v364].yaw_right = v354.builder:slider("\v\f<right-from-line>\r  Yaw Right", -180, 180, 0, 1, "\194\176");
                            v355.builder_t[v364].yaw_random = v354.builder:slider("\v\f<dice-five>\r  Yaw Random", 0, 100, 0, 1, "%");
                            v355.builder_t[v364].yawmodifier = v354.builder:combo("\v\f<arrows-left-right-to-line>\r  Modifier", v353.yawmodifier:list());
                            v355.builder_t[v364].yawmodifier_create = v355.builder_t[v364].yawmodifier:create();
                            v355.builder_t[v364].yawmodifier_offset = v355.builder_t[v364].yawmodifier_create:slider("Offset", -180, 180, 0);
                            v355.builder_t[v364].yawmodifier_random = v355.builder_t[v364].yawmodifier_create:slider("Random", 0, 100, 0);
                            v355.builder_t[v364].bodyyaw = v354.builder:switch("\v\f<angle>\r  Body Yaw");
                            v355.builder_t[v364].bodyyaw_create = v355.builder_t[v364].bodyyaw:create();
                            v355.builder_t[v364].invert = v355.builder_t[v364].bodyyaw_create:switch("Inverter");
                            v355.builder_t[v364].leftlimit = v355.builder_t[v364].bodyyaw_create:slider("Left Limit", 0, 60, 60);
                            v355.builder_t[v364].rightlimit = v355.builder_t[v364].bodyyaw_create:slider("Right Limit", 0, 60, 60);
                            v355.builder_t[v364].options = v355.builder_t[v364].bodyyaw_create:selectable("Options", v353.options:list());
                            v355.builder_t[v364].delay = v355.builder_t[v364].bodyyaw_create:slider("Jitter Speed", 1, 10, 1, 1, function(v365)
                                return v365 == 1 and "NL" or v365;
                            end);
                            v355.builder_t[v364].bodyfreestanding = v355.builder_t[v364].bodyyaw_create:combo("Freestanding", v353.bodyfrees:list());
                            v355.builder_t[v364].defensive_type = v354.builder:selectable("\v\f<explosion>\r  Break \aD8DB68FFLC", {
                                [1] = "DT", 
                                [2] = "Hide Shots"
                            });
                            v355.builder_t[v364].defensive_type_create = v355.builder_t[v364].defensive_type:create();
                            v355.builder_t[v364].defensive_type_type = v355.builder_t[v364].defensive_type_create:list("\n", {
                                [1] = "Default", 
                                [2] = "Switch", 
                                [3] = "Always"
                            });
                            v355.builder_t[v364].defensive = v354.builder:switch("\v\f<arrows-spin>\r  Defensive Snap");
                            v355.builder_t[v364].defensive_create = v355.builder_t[v364].defensive:create();
                            v355.builder_t[v364].defensive_clear = v355.builder_t[v364].defensive_create:switch("Clear Yaw");
                            v355.builder_t[v364].defensive_yaw = v355.builder_t[v364].defensive_create:combo("Yaw", {
                                [1] = "Disabled", 
                                [2] = "Default", 
                                [3] = "Spin", 
                                [4] = "Progressive Spin", 
                                [5] = "Offset", 
                                [6] = "Random", 
                                [7] = "Side", 
                                [8] = "Center", 
                                [9] = "3-Way"
                            });
                            v355.builder_t[v364].exploit_direction = v355.builder_t[v364].defensive_create:switch("Side Based");
                            v355.builder_t[v364].defensive_yaw_offset = v355.builder_t[v364].defensive_create:slider("Yaw Offset", -180, 180, 0);
                            v355.builder_t[v364].defensive_pitch = v355.builder_t[v364].defensive_create:combo("Pitch", {
                                [1] = "Disabled", 
                                [2] = "Offset", 
                                [3] = "Random", 
                                [4] = "Corner", 
                                [5] = "Side"
                            });
                            v355.builder_t[v364].defensive_pitch_offset = v355.builder_t[v364].defensive_create:slider("Pitch Offset", -89, 89, 0);
                            v355.builder_t[v364].send_to_ct = v354.builder:button("              \v\f<share-nodes>\r  Send \vCurrent State\r To \vCT           ", function()

                            end, true);
                        end;
                        for v366 = 1, #v355.antiaim.cond do
                            local v367 = {
                                [1] = nil, 
                                [2] = 1, 
                                [1] = v355.antiaim.team
                            };
                            local v368 = {
                                [1] = nil, 
                                [2] = 1, 
                                [1] = v355.main.tab
                            };
                            do
                                local l_v366_0 = v366;
                                local v370 = {
                                    [1] = v355.antiaim.conditions, 
                                    [2] = function()
                                        -- upvalues: l_v366_0 (ref)
                                        return l_v366_0 ~= 1;
                                    end
                                };
                                local v371 = {
                                    [1] = v355.builder[l_v366_0].enable, 
                                    [2] = function()
                                        -- upvalues: l_v366_0 (ref), v355 (ref)
                                        if l_v366_0 == 1 then
                                            return true;
                                        else
                                            return v355.builder[l_v366_0].enable:get();
                                        end;
                                    end
                                };
                                local v372 = {
                                    [1] = v355.antiaim.conditions, 
                                    [2] = v355.antiaim.cond[l_v366_0]
                                };
                                local v373 = {
                                    [1] = v355.builder[l_v366_0].yawmodifier, 
                                    [2] = function()
                                        -- upvalues: v355 (ref), l_v366_0 (ref)
                                        if v355.builder[l_v366_0].yawmodifier:get() == "Disabled" then
                                            return false;
                                        else
                                            return true;
                                        end;
                                    end
                                };
                                local l_bodyyaw_0 = v355.builder[l_v366_0].bodyyaw;
                                local v375 = {
                                    [1] = nil, 
                                    [2] = "Jitter", 
                                    [1] = v355.builder[l_v366_0].options
                                };
                                local l_defensive_0 = v355.builder[l_v366_0].defensive;
                                local v377 = {
                                    [1] = v355.builder[l_v366_0].defensive_yaw, 
                                    [2] = function()
                                        -- upvalues: v355 (ref), l_v366_0 (ref)
                                        return v355.builder[l_v366_0].defensive_yaw:get() ~= "Disabled" and v355.builder[l_v366_0].defensive_yaw:get() ~= "Default" and v355.builder[l_v366_0].defensive_yaw:get() ~= "Random";
                                    end
                                };
                                local v378 = {
                                    [1] = v355.builder[l_v366_0].defensive_pitch, 
                                    [2] = function()
                                        -- upvalues: v355 (ref), l_v366_0 (ref)
                                        return v355.builder[l_v366_0].defensive_pitch:get() == "Offset" or v355.builder[l_v366_0].defensive_pitch:get() == "Side";
                                    end
                                };
                                local v379 = {
                                    [1] = v355.builder[l_v366_0].defensive_yaw, 
                                    [2] = function()
                                        -- upvalues: v355 (ref), l_v366_0 (ref)
                                        return string.match(v355.builder[l_v366_0].defensive_yaw:get(), "Flick");
                                    end
                                };
                                local _ = {
                                    [1] = v355.builder[l_v366_0].defensive_yaw, 
                                    [2] = function()
                                        -- upvalues: v355 (ref), l_v366_0 (ref)
                                        return v355.builder[l_v366_0].defensive_yaw:get() == "Progressive Spin";
                                    end
                                };
                                v355.builder[l_v366_0].enable:depend(v368, v370, v372, v367);
                                v355.builder[l_v366_0].yaw_left:depend(v368, v371, v372, v367);
                                v355.builder[l_v366_0].yaw_right:depend(v368, v371, v372, v367);
                                v355.builder[l_v366_0].yaw_random:depend(v368, v371, v372, v367);
                                v355.builder[l_v366_0].yawmodifier:depend(v368, v371, v372, v367);
                                v355.builder[l_v366_0].yawmodifier_offset:depend(v368, v371, v372, v373, v367);
                                v355.builder[l_v366_0].yawmodifier_random:depend(v368, v371, v372, v373, v367);
                                v355.builder[l_v366_0].bodyyaw:depend(v368, v371, v372, v367);
                                v355.builder[l_v366_0].invert:depend(v368, v371, v372, l_bodyyaw_0, v367);
                                v355.builder[l_v366_0].leftlimit:depend(v368, v371, v372, l_bodyyaw_0, v367);
                                v355.builder[l_v366_0].rightlimit:depend(v368, v371, v372, l_bodyyaw_0, v367);
                                v355.builder[l_v366_0].options:depend(v368, v371, v372, l_bodyyaw_0, v367);
                                v355.builder[l_v366_0].delay:depend(v368, v371, v372, l_bodyyaw_0, v375, v367);
                                v355.builder[l_v366_0].bodyfreestanding:depend(v368, v371, v372, l_bodyyaw_0, v367);
                                v355.builder[l_v366_0].defensive:depend(v368, v371, v372, v367);
                                v355.builder[l_v366_0].defensive_clear:depend(v368, v371, v372, v367, l_defensive_0);
                                v355.builder[l_v366_0].defensive_type:depend(v368, v371, v372, v367);
                                v355.builder[l_v366_0].defensive_type_type:depend(v368, v371, v372, v367, {
                                    [1] = v355.builder[l_v366_0].defensive_type, 
                                    [2] = function()
                                        -- upvalues: v355 (ref), l_v366_0 (ref)
                                        return v355.builder[l_v366_0].defensive_type:get("DT") or v355.builder[l_v366_0].defensive_type:get("Hide Shots");
                                    end
                                });
                                v355.builder[l_v366_0].defensive_yaw:depend(v368, v371, v372, l_defensive_0, v367);
                                v355.builder[l_v366_0].defensive_yaw_offset:depend(v368, v371, v372, l_defensive_0, v377, v367);
                                v355.builder[l_v366_0].exploit_direction:depend(v368, v371, v372, l_defensive_0, v367, v379);
                                v355.builder[l_v366_0].defensive_pitch:depend(v368, v371, v372, l_defensive_0, v367);
                                v355.builder[l_v366_0].defensive_pitch_offset:depend(v368, v371, v372, l_defensive_0, v378, v367);
                                v355.builder[l_v366_0].send_to_t:depend(v368, v371, v372, v367);
                            end;
                        end;
                        for v381 = 1, #v355.antiaim.cond do
                            local v382 = {
                                [1] = nil, 
                                [2] = 2, 
                                [1] = v355.antiaim.team
                            };
                            local v383 = {
                                [1] = nil, 
                                [2] = 1, 
                                [1] = v355.main.tab
                            };
                            do
                                local l_v381_0 = v381;
                                local v385 = {
                                    [1] = v355.antiaim.conditions, 
                                    [2] = function()
                                        -- upvalues: l_v381_0 (ref)
                                        return l_v381_0 ~= 1;
                                    end
                                };
                                local v386 = {
                                    [1] = v355.builder_t[l_v381_0].enable, 
                                    [2] = function()
                                        -- upvalues: l_v381_0 (ref), v355 (ref)
                                        if l_v381_0 == 1 then
                                            return true;
                                        else
                                            return v355.builder_t[l_v381_0].enable:get();
                                        end;
                                    end
                                };
                                local v387 = {
                                    [1] = v355.antiaim.conditions, 
                                    [2] = v355.antiaim.cond[l_v381_0]
                                };
                                local v388 = {
                                    [1] = v355.builder_t[l_v381_0].yawmodifier, 
                                    [2] = function()
                                        -- upvalues: v355 (ref), l_v381_0 (ref)
                                        if v355.builder_t[l_v381_0].yawmodifier:get() == "Disabled" then
                                            return false;
                                        else
                                            return true;
                                        end;
                                    end
                                };
                                local l_bodyyaw_1 = v355.builder_t[l_v381_0].bodyyaw;
                                local v390 = {
                                    [1] = nil, 
                                    [2] = "Jitter", 
                                    [1] = v355.builder_t[l_v381_0].options
                                };
                                local l_defensive_1 = v355.builder_t[l_v381_0].defensive;
                                local v392 = {
                                    [1] = v355.builder_t[l_v381_0].defensive_yaw, 
                                    [2] = function()
                                        -- upvalues: v355 (ref), l_v381_0 (ref)
                                        return v355.builder_t[l_v381_0].defensive_yaw:get() ~= "Disabled" and v355.builder_t[l_v381_0].defensive_yaw:get() ~= "Default" and v355.builder_t[l_v381_0].defensive_yaw:get() ~= "Random";
                                    end
                                };
                                local v393 = {
                                    [1] = v355.builder_t[l_v381_0].defensive_pitch, 
                                    [2] = function()
                                        -- upvalues: v355 (ref), l_v381_0 (ref)
                                        return v355.builder_t[l_v381_0].defensive_pitch:get() == "Offset" or v355.builder_t[l_v381_0].defensive_pitch:get() == "Side";
                                    end
                                };
                                local v394 = {
                                    [1] = v355.builder_t[l_v381_0].defensive_yaw, 
                                    [2] = function()
                                        -- upvalues: v355 (ref), l_v381_0 (ref)
                                        return string.match(v355.builder_t[l_v381_0].defensive_yaw:get(), "Flick");
                                    end
                                };
                                local _ = {
                                    [1] = v355.builder_t[l_v381_0].defensive_yaw, 
                                    [2] = function()
                                        -- upvalues: v355 (ref), l_v381_0 (ref)
                                        return v355.builder_t[l_v381_0].defensive_yaw:get() == "Progressive Spin";
                                    end
                                };
                                v355.builder_t[l_v381_0].enable:depend(v383, v385, v387, v382);
                                v355.builder_t[l_v381_0].yaw_left:depend(v383, v386, v387, v382);
                                v355.builder_t[l_v381_0].yaw_right:depend(v383, v386, v387, v382);
                                v355.builder_t[l_v381_0].yaw_random:depend(v383, v386, v387, v382);
                                v355.builder_t[l_v381_0].yawmodifier:depend(v383, v386, v387, v382);
                                v355.builder_t[l_v381_0].yawmodifier_offset:depend(v383, v386, v387, v388, v382);
                                v355.builder_t[l_v381_0].yawmodifier_random:depend(v383, v386, v387, v388, v382);
                                v355.builder_t[l_v381_0].bodyyaw:depend(v383, v386, v387, v382);
                                v355.builder_t[l_v381_0].invert:depend(v383, v386, v387, l_bodyyaw_1, v382);
                                v355.builder_t[l_v381_0].leftlimit:depend(v383, v386, v387, l_bodyyaw_1, v382);
                                v355.builder_t[l_v381_0].rightlimit:depend(v383, v386, v387, l_bodyyaw_1, v382);
                                v355.builder_t[l_v381_0].options:depend(v383, v386, v387, l_bodyyaw_1, v382);
                                v355.builder_t[l_v381_0].delay:depend(v383, v386, v387, l_bodyyaw_1, v390, v382);
                                v355.builder_t[l_v381_0].bodyfreestanding:depend(v383, v386, v387, l_bodyyaw_1, v382);
                                v355.builder_t[l_v381_0].defensive:depend(v383, v386, v387, v382);
                                v355.builder_t[l_v381_0].defensive_clear:depend(v383, v386, v387, v382, l_defensive_1);
                                v355.builder_t[l_v381_0].defensive_type:depend(v383, v386, v387, v382);
                                v355.builder_t[l_v381_0].defensive_type_type:depend(v383, v386, v387, v382, {
                                    [1] = v355.builder_t[l_v381_0].defensive_type, 
                                    [2] = function()
                                        -- upvalues: v355 (ref), l_v381_0 (ref)
                                        return v355.builder_t[l_v381_0].defensive_type:get("DT") or v355.builder_t[l_v381_0].defensive_type:get("Hide Shots");
                                    end
                                });
                                v355.builder_t[l_v381_0].defensive_yaw:depend(v383, v386, v387, l_defensive_1, v382);
                                v355.builder_t[l_v381_0].defensive_yaw_offset:depend(v383, v386, v387, l_defensive_1, v392, v382);
                                v355.builder_t[l_v381_0].exploit_direction:depend(v383, v386, v387, l_defensive_1, v382, v394);
                                v355.builder_t[l_v381_0].defensive_pitch:depend(v383, v386, v387, l_defensive_1, v382);
                                v355.builder_t[l_v381_0].defensive_pitch_offset:depend(v383, v386, v387, l_defensive_1, v393, v382);
                                v355.builder_t[l_v381_0].send_to_ct:depend(v383, v386, v387, v382);
                            end;
                        end;
                        local function v397(v396)
                            -- upvalues: v355 (ref)
                            v355.builder[v396].enable:set(v355.builder_t[v396].enable:get());
                            v355.builder[v396].yaw_left:set(v355.builder_t[v396].yaw_left:get());
                            v355.builder[v396].yaw_right:set(v355.builder_t[v396].yaw_right:get());
                            v355.builder[v396].yaw_random:set(v355.builder_t[v396].yaw_random:get());
                            v355.builder[v396].yawmodifier:set(v355.builder_t[v396].yawmodifier:get());
                            v355.builder[v396].yawmodifier_offset:set(v355.builder_t[v396].yawmodifier_offset:get());
                            v355.builder[v396].yawmodifier_random:set(v355.builder_t[v396].yawmodifier_random:get());
                            v355.builder[v396].bodyyaw:set(v355.builder_t[v396].bodyyaw:get());
                            v355.builder[v396].invert:set(v355.builder_t[v396].invert:get());
                            v355.builder[v396].leftlimit:set(v355.builder_t[v396].leftlimit:get());
                            v355.builder[v396].rightlimit:set(v355.builder_t[v396].rightlimit:get());
                            v355.builder[v396].options:set(v355.builder_t[v396].options:get());
                            v355.builder[v396].delay:set(v355.builder_t[v396].delay:get());
                            v355.builder[v396].bodyfreestanding:set(v355.builder_t[v396].bodyfreestanding:get());
                            v355.builder[v396].defensive:set(v355.builder_t[v396].defensive:get());
                            v355.builder[v396].defensive_clear:set(v355.builder_t[v396].defensive_clear:get());
                            v355.builder[v396].defensive_type:set(v355.builder_t[v396].defensive_type:get());
                            v355.builder[v396].defensive_yaw:set(v355.builder_t[v396].defensive_yaw:get());
                            v355.builder[v396].exploit_direction:set(v355.builder_t[v396].exploit_direction:get());
                            v355.builder[v396].defensive_yaw_offset:set(v355.builder_t[v396].defensive_yaw_offset:get());
                            v355.builder[v396].defensive_pitch:set(v355.builder_t[v396].defensive_pitch:get());
                            v355.builder[v396].defensive_pitch_offset:set(v355.builder_t[v396].defensive_pitch_offset:get());
                            common.add_event("Successfully sent to T", "moon-stars");
                            cvar.play:call("ambient\\tones\\elev1");
                        end;
                        local function v399(v398)
                            -- upvalues: v355 (ref)
                            v355.builder_t[v398].enable:set(v355.builder[v398].enable:get());
                            v355.builder_t[v398].yaw_left:set(v355.builder[v398].yaw_left:get());
                            v355.builder_t[v398].yaw_right:set(v355.builder[v398].yaw_right:get());
                            v355.builder_t[v398].yaw_random:set(v355.builder[v398].yaw_random:get());
                            v355.builder_t[v398].yawmodifier:set(v355.builder[v398].yawmodifier:get());
                            v355.builder_t[v398].yawmodifier_offset:set(v355.builder[v398].yawmodifier_offset:get());
                            v355.builder_t[v398].yawmodifier_random:set(v355.builder[v398].yawmodifier_random:get());
                            v355.builder_t[v398].bodyyaw:set(v355.builder[v398].bodyyaw:get());
                            v355.builder_t[v398].invert:set(v355.builder[v398].invert:get());
                            v355.builder_t[v398].leftlimit:set(v355.builder[v398].leftlimit:get());
                            v355.builder_t[v398].rightlimit:set(v355.builder[v398].rightlimit:get());
                            v355.builder_t[v398].options:set(v355.builder[v398].options:get());
                            v355.builder_t[v398].delay:set(v355.builder[v398].delay:get());
                            v355.builder_t[v398].bodyfreestanding:set(v355.builder[v398].bodyfreestanding:get());
                            v355.builder_t[v398].defensive:set(v355.builder[v398].defensive:get());
                            v355.builder_t[v398].defensive_clear:set(v355.builder[v398].defensive_clear:get());
                            v355.builder_t[v398].defensive_type:set(v355.builder[v398].defensive_type:get());
                            v355.builder_t[v398].defensive_yaw:set(v355.builder[v398].defensive_yaw:get());
                            v355.builder_t[v398].exploit_direction:set(v355.builder[v398].exploit_direction:get());
                            v355.builder_t[v398].defensive_yaw_offset:set(v355.builder[v398].defensive_yaw_offset:get());
                            v355.builder_t[v398].defensive_pitch:set(v355.builder[v398].defensive_pitch:get());
                            v355.builder_t[v398].defensive_pitch_offset:set(v355.builder[v398].defensive_pitch_offset:get());
                            common.add_event("Successfully sent to CT", "moon-stars");
                            cvar.play:call("ambient\\tones\\elev1");
                        end;
                        for v400 = 1, #v355.antiaim.cond do
                            do
                                local l_v400_0 = v400;
                                v355.builder[l_v400_0].send_to_t:set_callback(function()
                                    -- upvalues: v399 (ref), l_v400_0 (ref)
                                    v399(l_v400_0);
                                end);
                                v355.builder_t[l_v400_0].send_to_ct:set_callback(function()
                                    -- upvalues: v397 (ref), l_v400_0 (ref)
                                    v397(l_v400_0);
                                end);
                            end;
                        end;
                        local v402 = l_l_pui_0_0.setup({
                            [1] = v355.builder_t, 
                            [2] = v355.builder
                        }, true);
                        local v403 = {};
                        local v404 = {};
                        configs_db = db.genesis_beta3 or {};
                        configs_db.cfg_list = configs_db.cfg_list or {
                            [1] = {
                                [1] = "Flick \vExploit + Unhittable", 
                                [2] = "W1t7ImJvZHlmcmVlc3RhbmRpbmciOiJPZmYiLCJib2R5eWF3Ijp0cnVlLCJkZWZlbnNpdmUiOnRydWUsImRlZmVuc2l2ZV9jbGVhciI6ZmFsc2UsImRlZmVuc2l2ZV9waXRjaCI6IlJhbmRvbSIsImRlZmVuc2l2ZV9waXRjaF9vZmZzZXQiOjAuMCwiZGVmZW5zaXZlX3R5cGUiOlsiRFQiLCJIaWRlIFNob3RzIiwifiJdLCJkZWZlbnNpdmVfeWF3IjoiRGVmYXVsdCIsImRlZmVuc2l2ZV95YXdfb2Zmc2V0IjotMTI2LjAsImRlbGF5IjoxLjAsImVuYWJsZSI6ZmFsc2UsImV4cGxvaXRfZGlyZWN0aW9uIjpmYWxzZSwiZm9yY2VfZGVmIjpmYWxzZSwibGVmdGxpbWl0Ijo2MC4wLCJvcHRpb25zIjpbIkppdHRlciIsIn4iXSwicmlnaHRsaW1pdCI6NjAuMCwieWF3X2xlZnQiOjcuMCwieWF3X3JhbmRvbSI6MC4wLCJ5YXdfcmlnaHQiOjYuMCwieWF3bW9kaWZpZXIiOiJDZW50ZXIiLCJ5YXdtb2RpZmllcl9vZmZzZXQiOi01NS4wLCJ5YXdtb2RpZmllcl9yYW5kb20iOjguMH0seyJib2R5ZnJlZXN0YW5kaW5nIjoiT2ZmIiwiYm9keXlhdyI6dHJ1ZSwiZGVmZW5zaXZlIjp0cnVlLCJkZWZlbnNpdmVfY2xlYXIiOmZhbHNlLCJkZWZlbnNpdmVfcGl0Y2giOiJSYW5kb20iLCJkZWZlbnNpdmVfcGl0Y2hfb2Zmc2V0IjowLjAsImRlZmVuc2l2ZV90eXBlIjpbIkRUIiwiSGlkZSBTaG90cyIsIn4iXSwiZGVmZW5zaXZlX3lhdyI6IkZsaWNrIEV4cGxvaXQgVjIiLCJkZWZlbnNpdmVfeWF3X29mZnNldCI6LTkwLjAsImRlbGF5IjoxLjAsImVuYWJsZSI6dHJ1ZSwiZXhwbG9pdF9kaXJlY3Rpb24iOmZhbHNlLCJmb3JjZV9kZWYiOmZhbHNlLCJsZWZ0bGltaXQiOjYwLjAsIm9wdGlvbnMiOlsifiJdLCJyaWdodGxpbWl0Ijo2MC4wLCJ5YXdfbGVmdCI6NS4wLCJ5YXdfcmFuZG9tIjowLjAsInlhd19yaWdodCI6NS4wLCJ5YXdtb2RpZmllciI6IkRpc2FibGVkIiwieWF3bW9kaWZpZXJfb2Zmc2V0IjotNDEuMCwieWF3bW9kaWZpZXJfcmFuZG9tIjo1LjB9LHsiYm9keWZyZWVzdGFuZGluZyI6Ik9mZiIsImJvZHl5YXciOnRydWUsImRlZmVuc2l2ZSI6dHJ1ZSwiZGVmZW5zaXZlX2NsZWFyIjp0cnVlLCJkZWZlbnNpdmVfcGl0Y2giOiJEaXNhYmxlZCIsImRlZmVuc2l2ZV9waXRjaF9vZmZzZXQiOjAuMCwiZGVmZW5zaXZlX3R5cGUiOlsiRFQiLCJIaWRlIFNob3RzIiwifiJdLCJkZWZlbnNpdmVfeWF3IjoiMy1XYXkiLCJkZWZlbnNpdmVfeWF3X29mZnNldCI6LTM4LjAsImRlbGF5IjoxLjAsImVuYWJsZSI6dHJ1ZSwiZXhwbG9pdF9kaXJlY3Rpb24iOnRydWUsImZvcmNlX2RlZiI6dHJ1ZSwibGVmdGxpbWl0Ijo2MC4wLCJvcHRpb25zIjpbIn4iXSwicmlnaHRsaW1pdCI6NjAuMCwieWF3X2xlZnQiOjYuMCwieWF3X3JhbmRvbSI6MC4wLCJ5YXdfcmlnaHQiOjYuMCwieWF3bW9kaWZpZXIiOiJEaXNhYmxlZCIsInlhd21vZGlmaWVyX29mZnNldCI6LTM4LjAsInlhd21vZGlmaWVyX3JhbmRvbSI6Ny4wfSx7ImJvZHlmcmVlc3RhbmRpbmciOiJQZWVrIEZha2UiLCJib2R5eWF3Ijp0cnVlLCJkZWZlbnNpdmUiOnRydWUsImRlZmVuc2l2ZV9jbGVhciI6dHJ1ZSwiZGVmZW5zaXZlX3BpdGNoIjoiUmFuZG9tIiwiZGVmZW5zaXZlX3BpdGNoX29mZnNldCI6MC4wLCJkZWZlbnNpdmVfdHlwZSI6WyJEVCIsIkhpZGUgU2hvdHMiLCJ+Il0sImRlZmVuc2l2ZV95YXciOiJGbGljayBFeHBsb2l0IFYyIiwiZGVmZW5zaXZlX3lhd19vZmZzZXQiOi05MC4wLCJkZWxheSI6MS4wLCJlbmFibGUiOnRydWUsImV4cGxvaXRfZGlyZWN0aW9uIjp0cnVlLCJmb3JjZV9kZWYiOmZhbHNlLCJsZWZ0bGltaXQiOjYwLjAsIm9wdGlvbnMiOlsifiJdLCJyaWdodGxpbWl0Ijo2MC4wLCJ5YXdfbGVmdCI6MTIuMCwieWF3X3JhbmRvbSI6MC4wLCJ5YXdfcmlnaHQiOjEyLjAsInlhd21vZGlmaWVyIjoiRGlzYWJsZWQiLCJ5YXdtb2RpZmllcl9vZmZzZXQiOi02NS4wLCJ5YXdtb2RpZmllcl9yYW5kb20iOjguMH0seyJib2R5ZnJlZXN0YW5kaW5nIjoiT2ZmIiwiYm9keXlhdyI6dHJ1ZSwiZGVmZW5zaXZlIjp0cnVlLCJkZWZlbnNpdmVfY2xlYXIiOnRydWUsImRlZmVuc2l2ZV9waXRjaCI6Ik9mZnNldCIsImRlZmVuc2l2ZV9waXRjaF9vZmZzZXQiOi04OS4wLCJkZWZlbnNpdmVfdHlwZSI6WyJEVCIsIkhpZGUgU2hvdHMiLCJ+Il0sImRlZmVuc2l2ZV95YXciOiJTcGluIiwiZGVmZW5zaXZlX3lhd19vZmZzZXQiOi0xNC4wLCJkZWxheSI6MS4wLCJlbmFibGUiOnRydWUsImV4cGxvaXRfZGlyZWN0aW9uIjpmYWxzZSwiZm9yY2VfZGVmIjpmYWxzZSwibGVmdGxpbWl0Ijo2MC4wLCJvcHRpb25zIjpbIkppdHRlciIsIn4iXSwicmlnaHRsaW1pdCI6NjAuMCwieWF3X2xlZnQiOjcuMCwieWF3X3JhbmRvbSI6MC4wLCJ5YXdfcmlnaHQiOjguMCwieWF3bW9kaWZpZXIiOiJDZW50ZXIiLCJ5YXdtb2RpZmllcl9vZmZzZXQiOi02MC4wLCJ5YXdtb2RpZmllcl9yYW5kb20iOjAuMH0seyJib2R5ZnJlZXN0YW5kaW5nIjoiT2ZmIiwiYm9keXlhdyI6dHJ1ZSwiZGVmZW5zaXZlIjp0cnVlLCJkZWZlbnNpdmVfY2xlYXIiOmZhbHNlLCJkZWZlbnNpdmVfcGl0Y2giOiJPZmZzZXQiLCJkZWZlbnNpdmVfcGl0Y2hfb2Zmc2V0IjotODkuMCwiZGVmZW5zaXZlX3R5cGUiOlsiRFQiLCJIaWRlIFNob3RzIiwifiJdLCJkZWZlbnNpdmVfeWF3IjoiRGVmYXVsdCIsImRlZmVuc2l2ZV95YXdfb2Zmc2V0IjotMTQuMCwiZGVsYXkiOjEuMCwiZW5hYmxlIjp0cnVlLCJleHBsb2l0X2RpcmVjdGlvbiI6ZmFsc2UsImZvcmNlX2RlZiI6ZmFsc2UsImxlZnRsaW1pdCI6NjAuMCwib3B0aW9ucyI6WyJKaXR0ZXIiLCJ+Il0sInJpZ2h0bGltaXQiOjYwLjAsInlhd19sZWZ0Ijo2LjAsInlhd19yYW5kb20iOjAuMCwieWF3X3JpZ2h0Ijo2LjAsInlhd21vZGlmaWVyIjoiQ2VudGVyIiwieWF3bW9kaWZpZXJfb2Zmc2V0IjotNTAuMCwieWF3bW9kaWZpZXJfcmFuZG9tIjoxNS4wfSx7ImJvZHlmcmVlc3RhbmRpbmciOiJPZmYiLCJib2R5eWF3Ijp0cnVlLCJkZWZlbnNpdmUiOnRydWUsImRlZmVuc2l2ZV9jbGVhciI6dHJ1ZSwiZGVmZW5zaXZlX3BpdGNoIjoiRGlzYWJsZWQiLCJkZWZlbnNpdmVfcGl0Y2hfb2Zmc2V0IjotNzMuMCwiZGVmZW5zaXZlX3R5cGUiOlsiRFQiLCJIaWRlIFNob3RzIiwifiJdLCJkZWZlbnNpdmVfeWF3IjoiUHJvZ3Jlc3NpdmUgU3BpbiIsImRlZmVuc2l2ZV95YXdfb2Zmc2V0IjotMTAuMCwiZGVsYXkiOjEuMCwiZW5hYmxlIjp0cnVlLCJleHBsb2l0X2RpcmVjdGlvbiI6ZmFsc2UsImZvcmNlX2RlZiI6dHJ1ZSwibGVmdGxpbWl0Ijo2MC4wLCJvcHRpb25zIjpbIkppdHRlciIsIn4iXSwicmlnaHRsaW1pdCI6NjAuMCwieWF3X2xlZnQiOjUuMCwieWF3X3JhbmRvbSI6MC4wLCJ5YXdfcmlnaHQiOjQuMCwieWF3bW9kaWZpZXIiOiJDZW50ZXIiLCJ5YXdtb2RpZmllcl9vZmZzZXQiOi03LjAsInlhd21vZGlmaWVyX3JhbmRvbSI6OC4wfSx7ImJvZHlmcmVlc3RhbmRpbmciOiJPZmYiLCJib2R5eWF3Ijp0cnVlLCJkZWZlbnNpdmUiOnRydWUsImRlZmVuc2l2ZV9jbGVhciI6dHJ1ZSwiZGVmZW5zaXZlX3BpdGNoIjoiRGlzYWJsZWQiLCJkZWZlbnNpdmVfcGl0Y2hfb2Zmc2V0IjowLjAsImRlZmVuc2l2ZV90eXBlIjpbIkRUIiwiSGlkZSBTaG90cyIsIn4iXSwiZGVmZW5zaXZlX3lhdyI6IlByb2dyZXNzaXZlIFNwaW4iLCJkZWZlbnNpdmVfeWF3X29mZnNldCI6LTEwLjAsImRlbGF5IjoxLjAsImVuYWJsZSI6dHJ1ZSwiZXhwbG9pdF9kaXJlY3Rpb24iOmZhbHNlLCJmb3JjZV9kZWYiOnRydWUsImxlZnRsaW1pdCI6NjAuMCwib3B0aW9ucyI6WyJKaXR0ZXIiLCJ+Il0sInJpZ2h0bGltaXQiOjYwLjAsInlhd19sZWZ0IjoxMi4wLCJ5YXdfcmFuZG9tIjowLjAsInlhd19yaWdodCI6MTguMCwieWF3bW9kaWZpZXIiOiJEaXNhYmxlZCIsInlhd21vZGlmaWVyX29mZnNldCI6MC4wLCJ5YXdtb2RpZmllcl9yYW5kb20iOjAuMH0seyJib2R5ZnJlZXN0YW5kaW5nIjoiT2ZmIiwiYm9keXlhdyI6ZmFsc2UsImRlZmVuc2l2ZSI6ZmFsc2UsImRlZmVuc2l2ZV9jbGVhciI6ZmFsc2UsImRlZmVuc2l2ZV9waXRjaCI6IkRpc2FibGVkIiwiZGVmZW5zaXZlX3BpdGNoX29mZnNldCI6MC4wLCJkZWZlbnNpdmVfdHlwZSI6WyJ+Il0sImRlZmVuc2l2ZV95YXciOiJEaXNhYmxlZCIsImRlZmVuc2l2ZV95YXdfb2Zmc2V0IjowLjAsImRlbGF5IjoxLjAsImVuYWJsZSI6ZmFsc2UsImV4cGxvaXRfZGlyZWN0aW9uIjpmYWxzZSwiZm9yY2VfZGVmIjpmYWxzZSwibGVmdGxpbWl0Ijo2MC4wLCJvcHRpb25zIjpbIn4iXSwicmlnaHRsaW1pdCI6NjAuMCwieWF3X2xlZnQiOjAuMCwieWF3X3JhbmRvbSI6MC4wLCJ5YXdfcmlnaHQiOjAuMCwieWF3bW9kaWZpZXIiOiJEaXNhYmxlZCIsInlhd21vZGlmaWVyX29mZnNldCI6MC4wLCJ5YXdtb2RpZmllcl9yYW5kb20iOjAuMH0seyJib2R5ZnJlZXN0YW5kaW5nIjoiT2ZmIiwiYm9keXlhdyI6dHJ1ZSwiZGVmZW5zaXZlIjpmYWxzZSwiZGVmZW5zaXZlX2NsZWFyIjpmYWxzZSwiZGVmZW5zaXZlX3BpdGNoIjoiRGlzYWJsZWQiLCJkZWZlbnNpdmVfcGl0Y2hfb2Zmc2V0IjowLjAsImRlZmVuc2l2ZV90eXBlIjpbIn4iXSwiZGVmZW5zaXZlX3lhdyI6IkRpc2FibGVkIiwiZGVmZW5zaXZlX3lhd19vZmZzZXQiOjAuMCwiZGVsYXkiOjEuMCwiZW5hYmxlIjp0cnVlLCJleHBsb2l0X2RpcmVjdGlvbiI6ZmFsc2UsImZvcmNlX2RlZiI6ZmFsc2UsImxlZnRsaW1pdCI6NjAuMCwib3B0aW9ucyI6WyJKaXR0ZXIiLCJ+Il0sInJpZ2h0bGltaXQiOjYwLjAsInlhd19sZWZ0IjowLjAsInlhd19yYW5kb20iOjAuMCwieWF3X3JpZ2h0IjowLjAsInlhd21vZGlmaWVyIjoiQ2VudGVyIiwieWF3bW9kaWZpZXJfb2Zmc2V0IjotNTAuMCwieWF3bW9kaWZpZXJfcmFuZG9tIjoxMC4wfV0sW3siYm9keWZyZWVzdGFuZGluZyI6Ik9mZiIsImJvZHl5YXciOnRydWUsImRlZmVuc2l2ZSI6dHJ1ZSwiZGVmZW5zaXZlX2NsZWFyIjp0cnVlLCJkZWZlbnNpdmVfcGl0Y2giOiJSYW5kb20iLCJkZWZlbnNpdmVfcGl0Y2hfb2Zmc2V0IjowLjAsImRlZmVuc2l2ZV90eXBlIjpbIkRUIiwiSGlkZSBTaG90cyIsIn4iXSwiZGVmZW5zaXZlX3lhdyI6IkRlZmF1bHQiLCJkZWZlbnNpdmVfeWF3X29mZnNldCI6My4wLCJkZWxheSI6MS4wLCJlbmFibGUiOmZhbHNlLCJleHBsb2l0X2RpcmVjdGlvbiI6ZmFsc2UsImZvcmNlX2RlZiI6ZmFsc2UsImxlZnRsaW1pdCI6NjAuMCwib3B0aW9ucyI6WyJKaXR0ZXIiLCJ+Il0sInJpZ2h0bGltaXQiOjYwLjAsInlhd19sZWZ0Ijo3LjAsInlhd19yYW5kb20iOjAuMCwieWF3X3JpZ2h0Ijo2LjAsInlhd21vZGlmaWVyIjoiQ2VudGVyIiwieWF3bW9kaWZpZXJfb2Zmc2V0IjotNTUuMCwieWF3bW9kaWZpZXJfcmFuZG9tIjo4LjB9LHsiYm9keWZyZWVzdGFuZGluZyI6Ik9mZiIsImJvZHl5YXciOnRydWUsImRlZmVuc2l2ZSI6dHJ1ZSwiZGVmZW5zaXZlX2NsZWFyIjpmYWxzZSwiZGVmZW5zaXZlX3BpdGNoIjoiT2Zmc2V0IiwiZGVmZW5zaXZlX3BpdGNoX29mZnNldCI6MC4wLCJkZWZlbnNpdmVfdHlwZSI6WyJEVCIsIkhpZGUgU2hvdHMiLCJ+Il0sImRlZmVuc2l2ZV95YXciOiJGbGljayBFeHBsb2l0IFYyIiwiZGVmZW5zaXZlX3lhd19vZmZzZXQiOi05MC4wLCJkZWxheSI6MS4wLCJlbmFibGUiOnRydWUsImV4cGxvaXRfZGlyZWN0aW9uIjp0cnVlLCJmb3JjZV9kZWYiOmZhbHNlLCJsZWZ0bGltaXQiOjYwLjAsIm9wdGlvbnMiOlsifiJdLCJyaWdodGxpbWl0Ijo2MC4wLCJ5YXdfbGVmdCI6NS4wLCJ5YXdfcmFuZG9tIjowLjAsInlhd19yaWdodCI6NS4wLCJ5YXdtb2RpZmllciI6IkRpc2FibGVkIiwieWF3bW9kaWZpZXJfb2Zmc2V0IjotNDEuMCwieWF3bW9kaWZpZXJfcmFuZG9tIjo1LjB9LHsiYm9keWZyZWVzdGFuZGluZyI6Ik9mZiIsImJvZHl5YXciOnRydWUsImRlZmVuc2l2ZSI6dHJ1ZSwiZGVmZW5zaXZlX2NsZWFyIjpmYWxzZSwiZGVmZW5zaXZlX3BpdGNoIjoiRGlzYWJsZWQiLCJkZWZlbnNpdmVfcGl0Y2hfb2Zmc2V0IjowLjAsImRlZmVuc2l2ZV90eXBlIjpbIkRUIiwiSGlkZSBTaG90cyIsIn4iXSwiZGVmZW5zaXZlX3lhdyI6IjMtV2F5IiwiZGVmZW5zaXZlX3lhd19vZmZzZXQiOjMwLjAsImRlbGF5IjoxLjAsImVuYWJsZSI6dHJ1ZSwiZXhwbG9pdF9kaXJlY3Rpb24iOmZhbHNlLCJmb3JjZV9kZWYiOnRydWUsImxlZnRsaW1pdCI6NjAuMCwib3B0aW9ucyI6WyJ+Il0sInJpZ2h0bGltaXQiOjYwLjAsInlhd19sZWZ0IjoxMi4wLCJ5YXdfcmFuZG9tIjowLjAsInlhd19yaWdodCI6MTIuMCwieWF3bW9kaWZpZXIiOiJEaXNhYmxlZCIsInlhd21vZGlmaWVyX29mZnNldCI6LTU5LjAsInlhd21vZGlmaWVyX3JhbmRvbSI6Ny4wfSx7ImJvZHlmcmVlc3RhbmRpbmciOiJQZWVrIEZha2UiLCJib2R5eWF3Ijp0cnVlLCJkZWZlbnNpdmUiOnRydWUsImRlZmVuc2l2ZV9jbGVhciI6dHJ1ZSwiZGVmZW5zaXZlX3BpdGNoIjoiUmFuZG9tIiwiZGVmZW5zaXZlX3BpdGNoX29mZnNldCI6MC4wLCJkZWZlbnNpdmVfdHlwZSI6WyJEVCIsIkhpZGUgU2hvdHMiLCJ+Il0sImRlZmVuc2l2ZV95YXciOiJGbGljayBFeHBsb2l0IFYyIiwiZGVmZW5zaXZlX3lhd19vZmZzZXQiOi05MC4wLCJkZWxheSI6MS4wLCJlbmFibGUiOnRydWUsImV4cGxvaXRfZGlyZWN0aW9uIjp0cnVlLCJmb3JjZV9kZWYiOmZhbHNlLCJsZWZ0bGltaXQiOjYwLjAsIm9wdGlvbnMiOlsifiJdLCJyaWdodGxpbWl0Ijo2MC4wLCJ5YXdfbGVmdCI6OC4wLCJ5YXdfcmFuZG9tIjowLjAsInlhd19yaWdodCI6OC4wLCJ5YXdtb2RpZmllciI6IkRpc2FibGVkIiwieWF3bW9kaWZpZXJfb2Zmc2V0IjotNjUuMCwieWF3bW9kaWZpZXJfcmFuZG9tIjo4LjB9LHsiYm9keWZyZWVzdGFuZGluZyI6Ik9mZiIsImJvZHl5YXciOnRydWUsImRlZmVuc2l2ZSI6dHJ1ZSwiZGVmZW5zaXZlX2NsZWFyIjp0cnVlLCJkZWZlbnNpdmVfcGl0Y2giOiJPZmZzZXQiLCJkZWZlbnNpdmVfcGl0Y2hfb2Zmc2V0IjotODkuMCwiZGVmZW5zaXZlX3R5cGUiOlsiRFQiLCJIaWRlIFNob3RzIiwifiJdLCJkZWZlbnNpdmVfeWF3IjoiU3BpbiIsImRlZmVuc2l2ZV95YXdfb2Zmc2V0IjotMTQuMCwiZGVsYXkiOjEuMCwiZW5hYmxlIjp0cnVlLCJleHBsb2l0X2RpcmVjdGlvbiI6ZmFsc2UsImZvcmNlX2RlZiI6ZmFsc2UsImxlZnRsaW1pdCI6NjAuMCwib3B0aW9ucyI6WyJKaXR0ZXIiLCJ+Il0sInJpZ2h0bGltaXQiOjYwLjAsInlhd19sZWZ0Ijo3LjAsInlhd19yYW5kb20iOjAuMCwieWF3X3JpZ2h0Ijo4LjAsInlhd21vZGlmaWVyIjoiQ2VudGVyIiwieWF3bW9kaWZpZXJfb2Zmc2V0IjotNjAuMCwieWF3bW9kaWZpZXJfcmFuZG9tIjowLjB9LHsiYm9keWZyZWVzdGFuZGluZyI6Ik9mZiIsImJvZHl5YXciOnRydWUsImRlZmVuc2l2ZSI6dHJ1ZSwiZGVmZW5zaXZlX2NsZWFyIjp0cnVlLCJkZWZlbnNpdmVfcGl0Y2giOiJPZmZzZXQiLCJkZWZlbnNpdmVfcGl0Y2hfb2Zmc2V0IjotODkuMCwiZGVmZW5zaXZlX3R5cGUiOlsiRFQiLCJIaWRlIFNob3RzIiwifiJdLCJkZWZlbnNpdmVfeWF3IjoiRGVmYXVsdCIsImRlZmVuc2l2ZV95YXdfb2Zmc2V0IjotMTQuMCwiZGVsYXkiOjEuMCwiZW5hYmxlIjp0cnVlLCJleHBsb2l0X2RpcmVjdGlvbiI6ZmFsc2UsImZvcmNlX2RlZiI6ZmFsc2UsImxlZnRsaW1pdCI6NjAuMCwib3B0aW9ucyI6WyJKaXR0ZXIiLCJ+Il0sInJpZ2h0bGltaXQiOjYwLjAsInlhd19sZWZ0Ijo2LjAsInlhd19yYW5kb20iOjAuMCwieWF3X3JpZ2h0Ijo2LjAsInlhd21vZGlmaWVyIjoiQ2VudGVyIiwieWF3bW9kaWZpZXJfb2Zmc2V0IjotNTAuMCwieWF3bW9kaWZpZXJfcmFuZG9tIjowLjB9LHsiYm9keWZyZWVzdGFuZGluZyI6Ik9mZiIsImJvZHl5YXciOnRydWUsImRlZmVuc2l2ZSI6dHJ1ZSwiZGVmZW5zaXZlX2NsZWFyIjp0cnVlLCJkZWZlbnNpdmVfcGl0Y2giOiJEaXNhYmxlZCIsImRlZmVuc2l2ZV9waXRjaF9vZmZzZXQiOi03My4wLCJkZWZlbnNpdmVfdHlwZSI6WyJEVCIsIkhpZGUgU2hvdHMiLCJ+Il0sImRlZmVuc2l2ZV95YXciOiJQcm9ncmVzc2l2ZSBTcGluIiwiZGVmZW5zaXZlX3lhd19vZmZzZXQiOi0xMC4wLCJkZWxheSI6MS4wLCJlbmFibGUiOnRydWUsImV4cGxvaXRfZGlyZWN0aW9uIjpmYWxzZSwiZm9yY2VfZGVmIjp0cnVlLCJsZWZ0bGltaXQiOjYwLjAsIm9wdGlvbnMiOlsiSml0dGVyIiwifiJdLCJyaWdodGxpbWl0Ijo2MC4wLCJ5YXdfbGVmdCI6NS4wLCJ5YXdfcmFuZG9tIjowLjAsInlhd19yaWdodCI6NC4wLCJ5YXdtb2RpZmllciI6IkNlbnRlciIsInlhd21vZGlmaWVyX29mZnNldCI6LTcuMCwieWF3bW9kaWZpZXJfcmFuZG9tIjo4LjB9LHsiYm9keWZyZWVzdGFuZGluZyI6Ik9mZiIsImJvZHl5YXciOnRydWUsImRlZmVuc2l2ZSI6dHJ1ZSwiZGVmZW5zaXZlX2NsZWFyIjp0cnVlLCJkZWZlbnNpdmVfcGl0Y2giOiJEaXNhYmxlZCIsImRlZmVuc2l2ZV9waXRjaF9vZmZzZXQiOjAuMCwiZGVmZW5zaXZlX3R5cGUiOlsiRFQiLCJIaWRlIFNob3RzIiwifiJdLCJkZWZlbnNpdmVfeWF3IjoiUHJvZ3Jlc3NpdmUgU3BpbiIsImRlZmVuc2l2ZV95YXdfb2Zmc2V0IjotMTAuMCwiZGVsYXkiOjEuMCwiZW5hYmxlIjp0cnVlLCJleHBsb2l0X2RpcmVjdGlvbiI6ZmFsc2UsImZvcmNlX2RlZiI6dHJ1ZSwibGVmdGxpbWl0Ijo2MC4wLCJvcHRpb25zIjpbIkppdHRlciIsIn4iXSwicmlnaHRsaW1pdCI6NjAuMCwieWF3X2xlZnQiOjEyLjAsInlhd19yYW5kb20iOjAuMCwieWF3X3JpZ2h0IjoxOC4wLCJ5YXdtb2RpZmllciI6IkRpc2FibGVkIiwieWF3bW9kaWZpZXJfb2Zmc2V0IjowLjAsInlhd21vZGlmaWVyX3JhbmRvbSI6MC4wfSx7ImJvZHlmcmVlc3RhbmRpbmciOiJPZmYiLCJib2R5eWF3IjpmYWxzZSwiZGVmZW5zaXZlIjpmYWxzZSwiZGVmZW5zaXZlX2NsZWFyIjpmYWxzZSwiZGVmZW5zaXZlX3BpdGNoIjoiRGlzYWJsZWQiLCJkZWZlbnNpdmVfcGl0Y2hfb2Zmc2V0IjowLjAsImRlZmVuc2l2ZV90eXBlIjpbIn4iXSwiZGVmZW5zaXZlX3lhdyI6IkRpc2FibGVkIiwiZGVmZW5zaXZlX3lhd19vZmZzZXQiOjAuMCwiZGVsYXkiOjEuMCwiZW5hYmxlIjpmYWxzZSwiZXhwbG9pdF9kaXJlY3Rpb24iOmZhbHNlLCJmb3JjZV9kZWYiOmZhbHNlLCJsZWZ0bGltaXQiOjYwLjAsIm9wdGlvbnMiOlsifiJdLCJyaWdodGxpbWl0Ijo2MC4wLCJ5YXdfbGVmdCI6MC4wLCJ5YXdfcmFuZG9tIjowLjAsInlhd19yaWdodCI6MC4wLCJ5YXdtb2RpZmllciI6IkRpc2FibGVkIiwieWF3bW9kaWZpZXJfb2Zmc2V0IjowLjAsInlhd21vZGlmaWVyX3JhbmRvbSI6MC4wfSx7ImJvZHlmcmVlc3RhbmRpbmciOiJPZmYiLCJib2R5eWF3IjpmYWxzZSwiZGVmZW5zaXZlIjpmYWxzZSwiZGVmZW5zaXZlX2NsZWFyIjpmYWxzZSwiZGVmZW5zaXZlX3BpdGNoIjoiRGlzYWJsZWQiLCJkZWZlbnNpdmVfcGl0Y2hfb2Zmc2V0IjowLjAsImRlZmVuc2l2ZV90eXBlIjpbIn4iXSwiZGVmZW5zaXZlX3lhdyI6IkRpc2FibGVkIiwiZGVmZW5zaXZlX3lhd19vZmZzZXQiOjAuMCwiZGVsYXkiOjEuMCwiZW5hYmxlIjpmYWxzZSwiZXhwbG9pdF9kaXJlY3Rpb24iOmZhbHNlLCJmb3JjZV9kZWYiOmZhbHNlLCJsZWZ0bGltaXQiOjYwLjAsIm9wdGlvbnMiOlsifiJdLCJyaWdodGxpbWl0Ijo2MC4wLCJ5YXdfbGVmdCI6MC4wLCJ5YXdfcmFuZG9tIjowLjAsInlhd19yaWdodCI6MC4wLCJ5YXdtb2RpZmllciI6IkRpc2FibGVkIiwieWF3bW9kaWZpZXJfb2Zmc2V0IjowLjAsInlhd21vZGlmaWVyX3JhbmRvbSI6MC4wfV1d"
                            }
                        };
                        configs_db.menu_list = configs_db.menu_list or {
                            [1] = "Flick Exploit + Unhittable"
                        };
                        configs_db.cfg_list[1][2] = "W1t7ImJvZHlmcmVlc3RhbmRpbmciOiJPZmYiLCJib2R5eWF3Ijp0cnVlLCJkZWZlbnNpdmUiOnRydWUsImRlZmVuc2l2ZV9jbGVhciI6ZmFsc2UsImRlZmVuc2l2ZV9waXRjaCI6IlJhbmRvbSIsImRlZmVuc2l2ZV9waXRjaF9vZmZzZXQiOjAuMCwiZGVmZW5zaXZlX3R5cGUiOlsiRFQiLCJIaWRlIFNob3RzIiwifiJdLCJkZWZlbnNpdmVfeWF3IjoiRGVmYXVsdCIsImRlZmVuc2l2ZV95YXdfb2Zmc2V0IjotMTI2LjAsImRlbGF5IjoxLjAsImVuYWJsZSI6ZmFsc2UsImV4cGxvaXRfZGlyZWN0aW9uIjpmYWxzZSwiZm9yY2VfZGVmIjpmYWxzZSwibGVmdGxpbWl0Ijo2MC4wLCJvcHRpb25zIjpbIkppdHRlciIsIn4iXSwicmlnaHRsaW1pdCI6NjAuMCwieWF3X2xlZnQiOjcuMCwieWF3X3JhbmRvbSI6MC4wLCJ5YXdfcmlnaHQiOjYuMCwieWF3bW9kaWZpZXIiOiJDZW50ZXIiLCJ5YXdtb2RpZmllcl9vZmZzZXQiOi01NS4wLCJ5YXdtb2RpZmllcl9yYW5kb20iOjguMH0seyJib2R5ZnJlZXN0YW5kaW5nIjoiT2ZmIiwiYm9keXlhdyI6dHJ1ZSwiZGVmZW5zaXZlIjp0cnVlLCJkZWZlbnNpdmVfY2xlYXIiOmZhbHNlLCJkZWZlbnNpdmVfcGl0Y2giOiJSYW5kb20iLCJkZWZlbnNpdmVfcGl0Y2hfb2Zmc2V0IjowLjAsImRlZmVuc2l2ZV90eXBlIjpbIkRUIiwiSGlkZSBTaG90cyIsIn4iXSwiZGVmZW5zaXZlX3lhdyI6IkZsaWNrIEV4cGxvaXQgVjIiLCJkZWZlbnNpdmVfeWF3X29mZnNldCI6LTkwLjAsImRlbGF5IjoxLjAsImVuYWJsZSI6dHJ1ZSwiZXhwbG9pdF9kaXJlY3Rpb24iOmZhbHNlLCJmb3JjZV9kZWYiOmZhbHNlLCJsZWZ0bGltaXQiOjYwLjAsIm9wdGlvbnMiOlsifiJdLCJyaWdodGxpbWl0Ijo2MC4wLCJ5YXdfbGVmdCI6NS4wLCJ5YXdfcmFuZG9tIjowLjAsInlhd19yaWdodCI6NS4wLCJ5YXdtb2RpZmllciI6IkRpc2FibGVkIiwieWF3bW9kaWZpZXJfb2Zmc2V0IjotNDEuMCwieWF3bW9kaWZpZXJfcmFuZG9tIjo1LjB9LHsiYm9keWZyZWVzdGFuZGluZyI6Ik9mZiIsImJvZHl5YXciOnRydWUsImRlZmVuc2l2ZSI6dHJ1ZSwiZGVmZW5zaXZlX2NsZWFyIjp0cnVlLCJkZWZlbnNpdmVfcGl0Y2giOiJEaXNhYmxlZCIsImRlZmVuc2l2ZV9waXRjaF9vZmZzZXQiOjAuMCwiZGVmZW5zaXZlX3R5cGUiOlsiRFQiLCJIaWRlIFNob3RzIiwifiJdLCJkZWZlbnNpdmVfeWF3IjoiMy1XYXkiLCJkZWZlbnNpdmVfeWF3X29mZnNldCI6LTM4LjAsImRlbGF5IjoxLjAsImVuYWJsZSI6dHJ1ZSwiZXhwbG9pdF9kaXJlY3Rpb24iOnRydWUsImZvcmNlX2RlZiI6dHJ1ZSwibGVmdGxpbWl0Ijo2MC4wLCJvcHRpb25zIjpbIn4iXSwicmlnaHRsaW1pdCI6NjAuMCwieWF3X2xlZnQiOjYuMCwieWF3X3JhbmRvbSI6MC4wLCJ5YXdfcmlnaHQiOjYuMCwieWF3bW9kaWZpZXIiOiJEaXNhYmxlZCIsInlhd21vZGlmaWVyX29mZnNldCI6LTM4LjAsInlhd21vZGlmaWVyX3JhbmRvbSI6Ny4wfSx7ImJvZHlmcmVlc3RhbmRpbmciOiJQZWVrIEZha2UiLCJib2R5eWF3Ijp0cnVlLCJkZWZlbnNpdmUiOnRydWUsImRlZmVuc2l2ZV9jbGVhciI6dHJ1ZSwiZGVmZW5zaXZlX3BpdGNoIjoiUmFuZG9tIiwiZGVmZW5zaXZlX3BpdGNoX29mZnNldCI6MC4wLCJkZWZlbnNpdmVfdHlwZSI6WyJEVCIsIkhpZGUgU2hvdHMiLCJ+Il0sImRlZmVuc2l2ZV95YXciOiJGbGljayBFeHBsb2l0IFYyIiwiZGVmZW5zaXZlX3lhd19vZmZzZXQiOi05MC4wLCJkZWxheSI6MS4wLCJlbmFibGUiOnRydWUsImV4cGxvaXRfZGlyZWN0aW9uIjp0cnVlLCJmb3JjZV9kZWYiOmZhbHNlLCJsZWZ0bGltaXQiOjYwLjAsIm9wdGlvbnMiOlsifiJdLCJyaWdodGxpbWl0Ijo2MC4wLCJ5YXdfbGVmdCI6MTIuMCwieWF3X3JhbmRvbSI6MC4wLCJ5YXdfcmlnaHQiOjEyLjAsInlhd21vZGlmaWVyIjoiRGlzYWJsZWQiLCJ5YXdtb2RpZmllcl9vZmZzZXQiOi02NS4wLCJ5YXdtb2RpZmllcl9yYW5kb20iOjguMH0seyJib2R5ZnJlZXN0YW5kaW5nIjoiT2ZmIiwiYm9keXlhdyI6dHJ1ZSwiZGVmZW5zaXZlIjp0cnVlLCJkZWZlbnNpdmVfY2xlYXIiOnRydWUsImRlZmVuc2l2ZV9waXRjaCI6Ik9mZnNldCIsImRlZmVuc2l2ZV9waXRjaF9vZmZzZXQiOi04OS4wLCJkZWZlbnNpdmVfdHlwZSI6WyJEVCIsIkhpZGUgU2hvdHMiLCJ+Il0sImRlZmVuc2l2ZV95YXciOiJTcGluIiwiZGVmZW5zaXZlX3lhd19vZmZzZXQiOi0xNC4wLCJkZWxheSI6MS4wLCJlbmFibGUiOnRydWUsImV4cGxvaXRfZGlyZWN0aW9uIjpmYWxzZSwiZm9yY2VfZGVmIjpmYWxzZSwibGVmdGxpbWl0Ijo2MC4wLCJvcHRpb25zIjpbIkppdHRlciIsIn4iXSwicmlnaHRsaW1pdCI6NjAuMCwieWF3X2xlZnQiOjcuMCwieWF3X3JhbmRvbSI6MC4wLCJ5YXdfcmlnaHQiOjguMCwieWF3bW9kaWZpZXIiOiJDZW50ZXIiLCJ5YXdtb2RpZmllcl9vZmZzZXQiOi02MC4wLCJ5YXdtb2RpZmllcl9yYW5kb20iOjAuMH0seyJib2R5ZnJlZXN0YW5kaW5nIjoiT2ZmIiwiYm9keXlhdyI6dHJ1ZSwiZGVmZW5zaXZlIjp0cnVlLCJkZWZlbnNpdmVfY2xlYXIiOmZhbHNlLCJkZWZlbnNpdmVfcGl0Y2giOiJPZmZzZXQiLCJkZWZlbnNpdmVfcGl0Y2hfb2Zmc2V0IjotODkuMCwiZGVmZW5zaXZlX3R5cGUiOlsiRFQiLCJIaWRlIFNob3RzIiwifiJdLCJkZWZlbnNpdmVfeWF3IjoiRGVmYXVsdCIsImRlZmVuc2l2ZV95YXdfb2Zmc2V0IjotMTQuMCwiZGVsYXkiOjEuMCwiZW5hYmxlIjp0cnVlLCJleHBsb2l0X2RpcmVjdGlvbiI6ZmFsc2UsImZvcmNlX2RlZiI6ZmFsc2UsImxlZnRsaW1pdCI6NjAuMCwib3B0aW9ucyI6WyJKaXR0ZXIiLCJ+Il0sInJpZ2h0bGltaXQiOjYwLjAsInlhd19sZWZ0Ijo2LjAsInlhd19yYW5kb20iOjAuMCwieWF3X3JpZ2h0Ijo2LjAsInlhd21vZGlmaWVyIjoiQ2VudGVyIiwieWF3bW9kaWZpZXJfb2Zmc2V0IjotNTAuMCwieWF3bW9kaWZpZXJfcmFuZG9tIjoxNS4wfSx7ImJvZHlmcmVlc3RhbmRpbmciOiJPZmYiLCJib2R5eWF3Ijp0cnVlLCJkZWZlbnNpdmUiOnRydWUsImRlZmVuc2l2ZV9jbGVhciI6dHJ1ZSwiZGVmZW5zaXZlX3BpdGNoIjoiRGlzYWJsZWQiLCJkZWZlbnNpdmVfcGl0Y2hfb2Zmc2V0IjotNzMuMCwiZGVmZW5zaXZlX3R5cGUiOlsiRFQiLCJIaWRlIFNob3RzIiwifiJdLCJkZWZlbnNpdmVfeWF3IjoiUHJvZ3Jlc3NpdmUgU3BpbiIsImRlZmVuc2l2ZV95YXdfb2Zmc2V0IjotMTAuMCwiZGVsYXkiOjEuMCwiZW5hYmxlIjp0cnVlLCJleHBsb2l0X2RpcmVjdGlvbiI6ZmFsc2UsImZvcmNlX2RlZiI6dHJ1ZSwibGVmdGxpbWl0Ijo2MC4wLCJvcHRpb25zIjpbIkppdHRlciIsIn4iXSwicmlnaHRsaW1pdCI6NjAuMCwieWF3X2xlZnQiOjUuMCwieWF3X3JhbmRvbSI6MC4wLCJ5YXdfcmlnaHQiOjQuMCwieWF3bW9kaWZpZXIiOiJDZW50ZXIiLCJ5YXdtb2RpZmllcl9vZmZzZXQiOi03LjAsInlhd21vZGlmaWVyX3JhbmRvbSI6OC4wfSx7ImJvZHlmcmVlc3RhbmRpbmciOiJPZmYiLCJib2R5eWF3Ijp0cnVlLCJkZWZlbnNpdmUiOnRydWUsImRlZmVuc2l2ZV9jbGVhciI6dHJ1ZSwiZGVmZW5zaXZlX3BpdGNoIjoiRGlzYWJsZWQiLCJkZWZlbnNpdmVfcGl0Y2hfb2Zmc2V0IjowLjAsImRlZmVuc2l2ZV90eXBlIjpbIkRUIiwiSGlkZSBTaG90cyIsIn4iXSwiZGVmZW5zaXZlX3lhdyI6IlByb2dyZXNzaXZlIFNwaW4iLCJkZWZlbnNpdmVfeWF3X29mZnNldCI6LTEwLjAsImRlbGF5IjoxLjAsImVuYWJsZSI6dHJ1ZSwiZXhwbG9pdF9kaXJlY3Rpb24iOmZhbHNlLCJmb3JjZV9kZWYiOnRydWUsImxlZnRsaW1pdCI6NjAuMCwib3B0aW9ucyI6WyJKaXR0ZXIiLCJ+Il0sInJpZ2h0bGltaXQiOjYwLjAsInlhd19sZWZ0IjoxMi4wLCJ5YXdfcmFuZG9tIjowLjAsInlhd19yaWdodCI6MTguMCwieWF3bW9kaWZpZXIiOiJEaXNhYmxlZCIsInlhd21vZGlmaWVyX29mZnNldCI6MC4wLCJ5YXdtb2RpZmllcl9yYW5kb20iOjAuMH0seyJib2R5ZnJlZXN0YW5kaW5nIjoiT2ZmIiwiYm9keXlhdyI6ZmFsc2UsImRlZmVuc2l2ZSI6ZmFsc2UsImRlZmVuc2l2ZV9jbGVhciI6ZmFsc2UsImRlZmVuc2l2ZV9waXRjaCI6IkRpc2FibGVkIiwiZGVmZW5zaXZlX3BpdGNoX29mZnNldCI6MC4wLCJkZWZlbnNpdmVfdHlwZSI6WyJ+Il0sImRlZmVuc2l2ZV95YXciOiJEaXNhYmxlZCIsImRlZmVuc2l2ZV95YXdfb2Zmc2V0IjowLjAsImRlbGF5IjoxLjAsImVuYWJsZSI6ZmFsc2UsImV4cGxvaXRfZGlyZWN0aW9uIjpmYWxzZSwiZm9yY2VfZGVmIjpmYWxzZSwibGVmdGxpbWl0Ijo2MC4wLCJvcHRpb25zIjpbIn4iXSwicmlnaHRsaW1pdCI6NjAuMCwieWF3X2xlZnQiOjAuMCwieWF3X3JhbmRvbSI6MC4wLCJ5YXdfcmlnaHQiOjAuMCwieWF3bW9kaWZpZXIiOiJEaXNhYmxlZCIsInlhd21vZGlmaWVyX29mZnNldCI6MC4wLCJ5YXdtb2RpZmllcl9yYW5kb20iOjAuMH0seyJib2R5ZnJlZXN0YW5kaW5nIjoiT2ZmIiwiYm9keXlhdyI6dHJ1ZSwiZGVmZW5zaXZlIjpmYWxzZSwiZGVmZW5zaXZlX2NsZWFyIjpmYWxzZSwiZGVmZW5zaXZlX3BpdGNoIjoiRGlzYWJsZWQiLCJkZWZlbnNpdmVfcGl0Y2hfb2Zmc2V0IjowLjAsImRlZmVuc2l2ZV90eXBlIjpbIn4iXSwiZGVmZW5zaXZlX3lhdyI6IkRpc2FibGVkIiwiZGVmZW5zaXZlX3lhd19vZmZzZXQiOjAuMCwiZGVsYXkiOjEuMCwiZW5hYmxlIjp0cnVlLCJleHBsb2l0X2RpcmVjdGlvbiI6ZmFsc2UsImZvcmNlX2RlZiI6ZmFsc2UsImxlZnRsaW1pdCI6NjAuMCwib3B0aW9ucyI6WyJKaXR0ZXIiLCJ+Il0sInJpZ2h0bGltaXQiOjYwLjAsInlhd19sZWZ0IjowLjAsInlhd19yYW5kb20iOjAuMCwieWF3X3JpZ2h0IjowLjAsInlhd21vZGlmaWVyIjoiQ2VudGVyIiwieWF3bW9kaWZpZXJfb2Zmc2V0IjotNTAuMCwieWF3bW9kaWZpZXJfcmFuZG9tIjoxMC4wfV0sW3siYm9keWZyZWVzdGFuZGluZyI6Ik9mZiIsImJvZHl5YXciOnRydWUsImRlZmVuc2l2ZSI6dHJ1ZSwiZGVmZW5zaXZlX2NsZWFyIjp0cnVlLCJkZWZlbnNpdmVfcGl0Y2giOiJSYW5kb20iLCJkZWZlbnNpdmVfcGl0Y2hfb2Zmc2V0IjowLjAsImRlZmVuc2l2ZV90eXBlIjpbIkRUIiwiSGlkZSBTaG90cyIsIn4iXSwiZGVmZW5zaXZlX3lhdyI6IkRlZmF1bHQiLCJkZWZlbnNpdmVfeWF3X29mZnNldCI6My4wLCJkZWxheSI6MS4wLCJlbmFibGUiOmZhbHNlLCJleHBsb2l0X2RpcmVjdGlvbiI6ZmFsc2UsImZvcmNlX2RlZiI6ZmFsc2UsImxlZnRsaW1pdCI6NjAuMCwib3B0aW9ucyI6WyJKaXR0ZXIiLCJ+Il0sInJpZ2h0bGltaXQiOjYwLjAsInlhd19sZWZ0Ijo3LjAsInlhd19yYW5kb20iOjAuMCwieWF3X3JpZ2h0Ijo2LjAsInlhd21vZGlmaWVyIjoiQ2VudGVyIiwieWF3bW9kaWZpZXJfb2Zmc2V0IjotNTUuMCwieWF3bW9kaWZpZXJfcmFuZG9tIjo4LjB9LHsiYm9keWZyZWVzdGFuZGluZyI6Ik9mZiIsImJvZHl5YXciOnRydWUsImRlZmVuc2l2ZSI6dHJ1ZSwiZGVmZW5zaXZlX2NsZWFyIjpmYWxzZSwiZGVmZW5zaXZlX3BpdGNoIjoiT2Zmc2V0IiwiZGVmZW5zaXZlX3BpdGNoX29mZnNldCI6MC4wLCJkZWZlbnNpdmVfdHlwZSI6WyJEVCIsIkhpZGUgU2hvdHMiLCJ+Il0sImRlZmVuc2l2ZV95YXciOiJGbGljayBFeHBsb2l0IFYyIiwiZGVmZW5zaXZlX3lhd19vZmZzZXQiOi05MC4wLCJkZWxheSI6MS4wLCJlbmFibGUiOnRydWUsImV4cGxvaXRfZGlyZWN0aW9uIjp0cnVlLCJmb3JjZV9kZWYiOmZhbHNlLCJsZWZ0bGltaXQiOjYwLjAsIm9wdGlvbnMiOlsifiJdLCJyaWdodGxpbWl0Ijo2MC4wLCJ5YXdfbGVmdCI6NS4wLCJ5YXdfcmFuZG9tIjowLjAsInlhd19yaWdodCI6NS4wLCJ5YXdtb2RpZmllciI6IkRpc2FibGVkIiwieWF3bW9kaWZpZXJfb2Zmc2V0IjotNDEuMCwieWF3bW9kaWZpZXJfcmFuZG9tIjo1LjB9LHsiYm9keWZyZWVzdGFuZGluZyI6Ik9mZiIsImJvZHl5YXciOnRydWUsImRlZmVuc2l2ZSI6dHJ1ZSwiZGVmZW5zaXZlX2NsZWFyIjpmYWxzZSwiZGVmZW5zaXZlX3BpdGNoIjoiRGlzYWJsZWQiLCJkZWZlbnNpdmVfcGl0Y2hfb2Zmc2V0IjowLjAsImRlZmVuc2l2ZV90eXBlIjpbIkRUIiwiSGlkZSBTaG90cyIsIn4iXSwiZGVmZW5zaXZlX3lhdyI6IjMtV2F5IiwiZGVmZW5zaXZlX3lhd19vZmZzZXQiOjMwLjAsImRlbGF5IjoxLjAsImVuYWJsZSI6dHJ1ZSwiZXhwbG9pdF9kaXJlY3Rpb24iOmZhbHNlLCJmb3JjZV9kZWYiOnRydWUsImxlZnRsaW1pdCI6NjAuMCwib3B0aW9ucyI6WyJ+Il0sInJpZ2h0bGltaXQiOjYwLjAsInlhd19sZWZ0IjoxMi4wLCJ5YXdfcmFuZG9tIjowLjAsInlhd19yaWdodCI6MTIuMCwieWF3bW9kaWZpZXIiOiJEaXNhYmxlZCIsInlhd21vZGlmaWVyX29mZnNldCI6LTU5LjAsInlhd21vZGlmaWVyX3JhbmRvbSI6Ny4wfSx7ImJvZHlmcmVlc3RhbmRpbmciOiJQZWVrIEZha2UiLCJib2R5eWF3Ijp0cnVlLCJkZWZlbnNpdmUiOnRydWUsImRlZmVuc2l2ZV9jbGVhciI6dHJ1ZSwiZGVmZW5zaXZlX3BpdGNoIjoiUmFuZG9tIiwiZGVmZW5zaXZlX3BpdGNoX29mZnNldCI6MC4wLCJkZWZlbnNpdmVfdHlwZSI6WyJEVCIsIkhpZGUgU2hvdHMiLCJ+Il0sImRlZmVuc2l2ZV95YXciOiJGbGljayBFeHBsb2l0IFYyIiwiZGVmZW5zaXZlX3lhd19vZmZzZXQiOi05MC4wLCJkZWxheSI6MS4wLCJlbmFibGUiOnRydWUsImV4cGxvaXRfZGlyZWN0aW9uIjp0cnVlLCJmb3JjZV9kZWYiOmZhbHNlLCJsZWZ0bGltaXQiOjYwLjAsIm9wdGlvbnMiOlsifiJdLCJyaWdodGxpbWl0Ijo2MC4wLCJ5YXdfbGVmdCI6OC4wLCJ5YXdfcmFuZG9tIjowLjAsInlhd19yaWdodCI6OC4wLCJ5YXdtb2RpZmllciI6IkRpc2FibGVkIiwieWF3bW9kaWZpZXJfb2Zmc2V0IjotNjUuMCwieWF3bW9kaWZpZXJfcmFuZG9tIjo4LjB9LHsiYm9keWZyZWVzdGFuZGluZyI6Ik9mZiIsImJvZHl5YXciOnRydWUsImRlZmVuc2l2ZSI6dHJ1ZSwiZGVmZW5zaXZlX2NsZWFyIjp0cnVlLCJkZWZlbnNpdmVfcGl0Y2giOiJPZmZzZXQiLCJkZWZlbnNpdmVfcGl0Y2hfb2Zmc2V0IjotODkuMCwiZGVmZW5zaXZlX3R5cGUiOlsiRFQiLCJIaWRlIFNob3RzIiwifiJdLCJkZWZlbnNpdmVfeWF3IjoiU3BpbiIsImRlZmVuc2l2ZV95YXdfb2Zmc2V0IjotMTQuMCwiZGVsYXkiOjEuMCwiZW5hYmxlIjp0cnVlLCJleHBsb2l0X2RpcmVjdGlvbiI6ZmFsc2UsImZvcmNlX2RlZiI6ZmFsc2UsImxlZnRsaW1pdCI6NjAuMCwib3B0aW9ucyI6WyJKaXR0ZXIiLCJ+Il0sInJpZ2h0bGltaXQiOjYwLjAsInlhd19sZWZ0Ijo3LjAsInlhd19yYW5kb20iOjAuMCwieWF3X3JpZ2h0Ijo4LjAsInlhd21vZGlmaWVyIjoiQ2VudGVyIiwieWF3bW9kaWZpZXJfb2Zmc2V0IjotNjAuMCwieWF3bW9kaWZpZXJfcmFuZG9tIjowLjB9LHsiYm9keWZyZWVzdGFuZGluZyI6Ik9mZiIsImJvZHl5YXciOnRydWUsImRlZmVuc2l2ZSI6dHJ1ZSwiZGVmZW5zaXZlX2NsZWFyIjp0cnVlLCJkZWZlbnNpdmVfcGl0Y2giOiJPZmZzZXQiLCJkZWZlbnNpdmVfcGl0Y2hfb2Zmc2V0IjotODkuMCwiZGVmZW5zaXZlX3R5cGUiOlsiRFQiLCJIaWRlIFNob3RzIiwifiJdLCJkZWZlbnNpdmVfeWF3IjoiRGVmYXVsdCIsImRlZmVuc2l2ZV95YXdfb2Zmc2V0IjotMTQuMCwiZGVsYXkiOjEuMCwiZW5hYmxlIjp0cnVlLCJleHBsb2l0X2RpcmVjdGlvbiI6ZmFsc2UsImZvcmNlX2RlZiI6ZmFsc2UsImxlZnRsaW1pdCI6NjAuMCwib3B0aW9ucyI6WyJKaXR0ZXIiLCJ+Il0sInJpZ2h0bGltaXQiOjYwLjAsInlhd19sZWZ0Ijo2LjAsInlhd19yYW5kb20iOjAuMCwieWF3X3JpZ2h0Ijo2LjAsInlhd21vZGlmaWVyIjoiQ2VudGVyIiwieWF3bW9kaWZpZXJfb2Zmc2V0IjotNTAuMCwieWF3bW9kaWZpZXJfcmFuZG9tIjowLjB9LHsiYm9keWZyZWVzdGFuZGluZyI6Ik9mZiIsImJvZHl5YXciOnRydWUsImRlZmVuc2l2ZSI6dHJ1ZSwiZGVmZW5zaXZlX2NsZWFyIjp0cnVlLCJkZWZlbnNpdmVfcGl0Y2giOiJEaXNhYmxlZCIsImRlZmVuc2l2ZV9waXRjaF9vZmZzZXQiOi03My4wLCJkZWZlbnNpdmVfdHlwZSI6WyJEVCIsIkhpZGUgU2hvdHMiLCJ+Il0sImRlZmVuc2l2ZV95YXciOiJQcm9ncmVzc2l2ZSBTcGluIiwiZGVmZW5zaXZlX3lhd19vZmZzZXQiOi0xMC4wLCJkZWxheSI6MS4wLCJlbmFibGUiOnRydWUsImV4cGxvaXRfZGlyZWN0aW9uIjpmYWxzZSwiZm9yY2VfZGVmIjp0cnVlLCJsZWZ0bGltaXQiOjYwLjAsIm9wdGlvbnMiOlsiSml0dGVyIiwifiJdLCJyaWdodGxpbWl0Ijo2MC4wLCJ5YXdfbGVmdCI6NS4wLCJ5YXdfcmFuZG9tIjowLjAsInlhd19yaWdodCI6NC4wLCJ5YXdtb2RpZmllciI6IkNlbnRlciIsInlhd21vZGlmaWVyX29mZnNldCI6LTcuMCwieWF3bW9kaWZpZXJfcmFuZG9tIjo4LjB9LHsiYm9keWZyZWVzdGFuZGluZyI6Ik9mZiIsImJvZHl5YXciOnRydWUsImRlZmVuc2l2ZSI6dHJ1ZSwiZGVmZW5zaXZlX2NsZWFyIjp0cnVlLCJkZWZlbnNpdmVfcGl0Y2giOiJEaXNhYmxlZCIsImRlZmVuc2l2ZV9waXRjaF9vZmZzZXQiOjAuMCwiZGVmZW5zaXZlX3R5cGUiOlsiRFQiLCJIaWRlIFNob3RzIiwifiJdLCJkZWZlbnNpdmVfeWF3IjoiUHJvZ3Jlc3NpdmUgU3BpbiIsImRlZmVuc2l2ZV95YXdfb2Zmc2V0IjotMTAuMCwiZGVsYXkiOjEuMCwiZW5hYmxlIjp0cnVlLCJleHBsb2l0X2RpcmVjdGlvbiI6ZmFsc2UsImZvcmNlX2RlZiI6dHJ1ZSwibGVmdGxpbWl0Ijo2MC4wLCJvcHRpb25zIjpbIkppdHRlciIsIn4iXSwicmlnaHRsaW1pdCI6NjAuMCwieWF3X2xlZnQiOjEyLjAsInlhd19yYW5kb20iOjAuMCwieWF3X3JpZ2h0IjoxOC4wLCJ5YXdtb2RpZmllciI6IkRpc2FibGVkIiwieWF3bW9kaWZpZXJfb2Zmc2V0IjowLjAsInlhd21vZGlmaWVyX3JhbmRvbSI6MC4wfSx7ImJvZHlmcmVlc3RhbmRpbmciOiJPZmYiLCJib2R5eWF3IjpmYWxzZSwiZGVmZW5zaXZlIjpmYWxzZSwiZGVmZW5zaXZlX2NsZWFyIjpmYWxzZSwiZGVmZW5zaXZlX3BpdGNoIjoiRGlzYWJsZWQiLCJkZWZlbnNpdmVfcGl0Y2hfb2Zmc2V0IjowLjAsImRlZmVuc2l2ZV90eXBlIjpbIn4iXSwiZGVmZW5zaXZlX3lhdyI6IkRpc2FibGVkIiwiZGVmZW5zaXZlX3lhd19vZmZzZXQiOjAuMCwiZGVsYXkiOjEuMCwiZW5hYmxlIjpmYWxzZSwiZXhwbG9pdF9kaXJlY3Rpb24iOmZhbHNlLCJmb3JjZV9kZWYiOmZhbHNlLCJsZWZ0bGltaXQiOjYwLjAsIm9wdGlvbnMiOlsifiJdLCJyaWdodGxpbWl0Ijo2MC4wLCJ5YXdfbGVmdCI6MC4wLCJ5YXdfcmFuZG9tIjowLjAsInlhd19yaWdodCI6MC4wLCJ5YXdtb2RpZmllciI6IkRpc2FibGVkIiwieWF3bW9kaWZpZXJfb2Zmc2V0IjowLjAsInlhd21vZGlmaWVyX3JhbmRvbSI6MC4wfSx7ImJvZHlmcmVlc3RhbmRpbmciOiJPZmYiLCJib2R5eWF3IjpmYWxzZSwiZGVmZW5zaXZlIjpmYWxzZSwiZGVmZW5zaXZlX2NsZWFyIjpmYWxzZSwiZGVmZW5zaXZlX3BpdGNoIjoiRGlzYWJsZWQiLCJkZWZlbnNpdmVfcGl0Y2hfb2Zmc2V0IjowLjAsImRlZmVuc2l2ZV90eXBlIjpbIn4iXSwiZGVmZW5zaXZlX3lhdyI6IkRpc2FibGVkIiwiZGVmZW5zaXZlX3lhd19vZmZzZXQiOjAuMCwiZGVsYXkiOjEuMCwiZW5hYmxlIjpmYWxzZSwiZXhwbG9pdF9kaXJlY3Rpb24iOmZhbHNlLCJmb3JjZV9kZWYiOmZhbHNlLCJsZWZ0bGltaXQiOjYwLjAsIm9wdGlvbnMiOlsifiJdLCJyaWdodGxpbWl0Ijo2MC4wLCJ5YXdfbGVmdCI6MC4wLCJ5YXdfcmFuZG9tIjowLjAsInlhd19yaWdodCI6MC4wLCJ5YXdtb2RpZmllciI6IkRpc2FibGVkIiwieWF3bW9kaWZpZXJfb2Zmc2V0IjowLjAsInlhd21vZGlmaWVyX3JhbmRvbSI6MC4wfV1d";
                        v404.save_config = function(v405)
                            -- upvalues: v402 (ref), l_l_base64_0_0 (ref)
                            if v405 == 1 then
                                return;
                            else
                                local v406 = v402:save();
                                configs_db.cfg_list[v405][2] = l_l_base64_0_0.encode(json.stringify(v406));
                                db.genesis_beta3 = configs_db;
                                return;
                            end;
                        end;
                        v404.update_values = function(v407)
                            local v408 = configs_db.cfg_list[v407][1] .. "\v - Active";
                            for v409, v410 in ipairs(configs_db.cfg_list) do
                                configs_db.menu_list[v409] = v410[1];
                            end;
                            configs_db.menu_list[v407] = v408;
                        end;
                        v404.create_config = function(v411)
                            if type(v411) ~= "string" then
                                return;
                            elseif v411 == nil or v411 == "" or v411 == " " then
                                common.add_notify("genesis.lua", "Wrong Name");
                                return;
                            else
                                for v412 = #configs_db.menu_list, 1, -1 do
                                    if configs_db.menu_list[v412] == v411 then
                                        common.add_notify("genesis.lua", "Another config has the same name");
                                        return;
                                    end;
                                end;
                                if #configs_db.cfg_list > 8 then
                                    common.add_notify("genesis.lua", "Maximum number of configs: 9");
                                    return;
                                else
                                    local v413 = {
                                        [1] = nil, 
                                        [2] = "", 
                                        [1] = v411
                                    };
                                    table.insert(configs_db.cfg_list, v413);
                                    table.insert(configs_db.menu_list, v411);
                                    db.genesis_beta3 = configs_db;
                                    return;
                                end;
                            end;
                        end;
                        v404.remove_config = function(v414)
                            if v414 == 1 then
                                return;
                            else
                                local v415 = configs_db.cfg_list[v414][1];
                                for v416 = #configs_db.cfg_list, 1, -1 do
                                    if configs_db.cfg_list[v416][1] == v415 then
                                        table.remove(configs_db.cfg_list, v416);
                                        table.remove(configs_db.menu_list, v416);
                                    end;
                                end;
                                db.genesis_beta3 = configs_db;
                                return;
                            end;
                        end;
                        v404.load_config = function(v417)
                            -- upvalues: v402 (ref), l_l_base64_0_0 (ref)
                            if configs_db.cfg_list[v417][2] == nil or configs_db.cfg_list[v417][2] == "" then
                                print("Problem with: " .. v417 .. " Config");
                                return;
                            elseif #configs_db.cfg_list < v417 then
                                print("Problem with: " .. v417 .. " Config");
                                return;
                            else
                                v402:load(json.parse(l_l_base64_0_0.decode(configs_db.cfg_list[v417][2])));
                                cvar.play:call("ambient\\tones\\elev1");
                                return;
                            end;
                        end;
                        v403.cfg_selector = v355.antiaim.config_manager_create:list("", configs_db.menu_list);
                        v403.name = v355.antiaim.config_manager_create:input("", "Config Name");
                        v403.create = v355.antiaim.config_manager_create:button("  \v\f<layer-plus>  ", function()
                            -- upvalues: v404 (ref), v403 (ref)
                            v404.create_config(v403.name:get());
                            v403.cfg_selector:update(configs_db.menu_list);
                            cvar.play:call("ambient\\tones\\elev1");
                        end, true);
                        v403.create:tooltip("Create Config");
                        v403.remove = v355.antiaim.config_manager_create:button("   \v\f<trash-xmark>   ", function()
                            -- upvalues: v404 (ref), v403 (ref)
                            v404.remove_config(v403.cfg_selector:get());
                            v403.cfg_selector:update(configs_db.menu_list);
                            cvar.play:call("ambient\\tones\\elev1");
                        end, true);
                        v403.remove:tooltip("Remove Config");
                        v403.save = v355.antiaim.config_manager_create:button("   \v\f<floppy-disk>   ", function()
                            -- upvalues: v404 (ref), v403 (ref)
                            v404.save_config(v403.cfg_selector:get());
                            cvar.play:call("ambient\\tones\\elev1");
                        end, true);
                        v403.save:tooltip("Save Config");
                        v403.load = v355.antiaim.config_manager_create:button("  \v\f<check>  ", function()
                            -- upvalues: v404 (ref), v403 (ref)
                            v404.update_values(v403.cfg_selector:get());
                            v404.load_config(v403.cfg_selector:get());
                            v403.cfg_selector:update(configs_db.menu_list);
                            cvar.play:call("ambient\\tones\\elev1");
                        end, true);
                        v403.load:tooltip("Load Config");
                        v403.import = v355.antiaim.config_manager_create:button("  \v\f<download>  ", function()
                            -- upvalues: v402 (ref), l_l_base64_0_0 (ref), l_l_clipboard_0_0 (ref)
                            v402:load(json.parse(l_l_base64_0_0.decode(l_l_clipboard_0_0.get())));
                            cvar.play:call("ambient\\tones\\elev1");
                        end, true);
                        v403.import:tooltip("Import Config");
                        v403.export = v355.antiaim.config_manager_create:button("  \v\f<share-nodes>  ", function()
                            -- upvalues: l_l_clipboard_0_0 (ref), l_l_base64_0_0 (ref), v402 (ref)
                            l_l_clipboard_0_0.set(l_l_base64_0_0.encode(json.stringify(v402:save())));
                            cvar.play:call("ambient\\tones\\elev1");
                        end, true);
                        v403.export:tooltip("Export Config");
                        local function v424(v418)
                            -- upvalues: v353 (ref)
                            local v419 = entity.get_local_player();
                            if not v419 then
                                return;
                            else
                                local v420 = bit.band(v419.m_fFlags, 1) == 1;
                                local v421 = bit.band(v419.m_fFlags, 1) == 0 or v418.in_jump;
                                local v422 = v419.m_flDuckAmount > 0.7 or v353.fakeduck:get();
                                local v423 = v419.m_vecVelocity:length() > 5;
                                if v421 and v422 then
                                    return "AIR~C";
                                elseif v421 then
                                    return "AIR";
                                elseif v422 and v423 then
                                    return "SNAKING";
                                elseif v422 then
                                    return "CROUCHING";
                                elseif v420 and v423 and v353.slowwalk:get() then
                                    return "WALKING";
                                elseif v420 and v423 then
                                    return "RUNNING";
                                elseif v420 then
                                    return "STANDING";
                                else
                                    return "GENERAL";
                                end;
                            end;
                        end;
                        local v425 = 1;
                        local v426 = false;
                        local function v431(v427)
                            -- upvalues: v426 (ref), v355 (ref), v425 (ref), v424 (ref)
                            local v428 = entity.get_local_player();
                            if not v428 then
                                return;
                            else
                                local l_m_iTeamNum_0 = v428.m_iTeamNum;
                                local v430 = rage.exploit:get() < 0.9;
                                if l_m_iTeamNum_0 ~= 3 then
                                    if v426 and v355.builder_t[10].enable:get() then
                                        v425 = 10;
                                    elseif v430 and v355.builder_t[9].enable:get() then
                                        v425 = 9;
                                    elseif v355.builder_t[8].enable:get() and v424(v427) == "AIR~C" then
                                        v425 = 8;
                                    elseif v355.builder_t[7].enable:get() and v424(v427) == "AIR" then
                                        v425 = 7;
                                    elseif v355.builder_t[6].enable:get() and v424(v427) == "SNAKING" then
                                        v425 = 6;
                                    elseif v355.builder_t[5].enable:get() and v424(v427) == "CROUCHING" then
                                        v425 = 5;
                                    elseif v355.builder_t[4].enable:get() and v424(v427) == "WALKING" then
                                        v425 = 4;
                                    elseif v355.builder_t[3].enable:get() and v424(v427) == "RUNNING" then
                                        v425 = 3;
                                    elseif v355.builder_t[2].enable:get() and v424(v427) == "STANDING" then
                                        v425 = 2;
                                    else
                                        v425 = 1;
                                    end;
                                elseif v426 and v355.builder[10].enable:get() then
                                    v425 = 10;
                                elseif v430 and v355.builder[9].enable:get() then
                                    v425 = 9;
                                elseif v355.builder[8].enable:get() and v424(v427) == "AIR~C" then
                                    v425 = 8;
                                elseif v355.builder[7].enable:get() and v424(v427) == "AIR" then
                                    v425 = 7;
                                elseif v355.builder[6].enable:get() and v424(v427) == "SNAKING" then
                                    v425 = 6;
                                elseif v355.builder[5].enable:get() and v424(v427) == "CROUCHING" then
                                    v425 = 5;
                                elseif v355.builder[4].enable:get() and v424(v427) == "WALKING" then
                                    v425 = 4;
                                elseif v355.builder[3].enable:get() and v424(v427) == "RUNNING" then
                                    v425 = 3;
                                elseif v355.builder[2].enable:get() and v424(v427) == "STANDING" then
                                    v425 = 2;
                                else
                                    v425 = 1;
                                end;
                                return;
                            end;
                        end;
                        local v432 = {
                            defensive = 0, 
                            tickbase = 0, 
                            defensive_check = 0, 
                            cmd = 0
                        };
                        local function v433()
                            -- upvalues: v432 (ref)
                            v432.defensive = 0;
                            v432.defensive_check = 0;
                            v432.cmd = 0;
                            v432.tickbase = 0;
                        end;
                        events.createmove_run:set(function(_)
                            -- upvalues: v433 (ref), v432 (ref)
                            if rage.exploit:get() < 1 then
                                v433();
                                return;
                            else
                                me = entity.get_local_player();
                                if not me or not me:is_alive() then
                                    v432.defensive = 0;
                                    v432.defensive_check = 0;
                                    return;
                                else
                                    v432.tickbase = entity.get_local_player().m_nTickBase;
                                    v432.defensive_check = math.max(v432.tickbase, v432.defensive_check);
                                    v432.cmd = 0;
                                    if v432.defensive_check > v432.tickbase then
                                        v432.defensive = math.abs(v432.tickbase - v432.defensive_check);
                                    end;
                                    if math.abs(v432.tickbase - v432.defensive_check) > 64 then
                                        v432.defensive = 0;
                                        v432.defensive_check = 0;
                                    end;
                                    return;
                                end;
                            end;
                        end);
                        is_defensive_active = function(_)
                            -- upvalues: v432 (ref)
                            is_defensive = v432.tickbase_check and v432.defensive > 2 and v432.defensive < 14;
                            return is_defensive;
                        end;
                        local function v440(v436, v437)
                            local v438 = v436 - v436 * v437 / 100;
                            local v439 = v436 + v436 * v437 / 100;
                            return math.random(v438, v439);
                        end;
                        local function v443(v441, v442)
                            rage.antiaim:override_hidden_yaw_offset(v441);
                            rage.antiaim:override_hidden_pitch(v442);
                        end;
                        local function v447(v444, v445, v446)
                            -- upvalues: v353 (ref)
                            if v444 then
                                v353.options:override("");
                                v353.inverter:override(v446);
                                v353.yawmodifier:override("Disabled");
                            end;
                            if v445 then
                                v353.yawoffset:override(v445);
                            end;
                        end;
                        local function v448()
                            -- upvalues: v353 (ref)
                            v353.hidden:override(true);
                            v353.lagoptions:override("Always On");
                            v353.hsoptions:override("Break LC");
                        end;
                        local v449 = v355.builder_t[v425];
                        local v450 = false;
                        local v451 = 0;
                        local _ = 0;
                        local v453 = 0;
                        local v454 = 0;
                        local v455 = 1;
                        local function v464(v456)
                            -- upvalues: v431 (ref), v426 (ref), v449 (ref), v355 (ref), v425 (ref), v451 (ref), v450 (ref), v353 (ref), v440 (ref), v432 (ref), v447 (ref), v453 (ref), v454 (ref), v455 (ref), v448 (ref), v443 (ref), v424 (ref)
                            local v457 = entity.get_local_player();
                            if not v457 then
                                return;
                            else
                                v431(v456);
                                v426 = false;
                                if v457.m_iTeamNum == 3 then
                                    v449 = v355.builder[v425];
                                else
                                    v449 = v355.builder_t[v425];
                                end;
                                if globals.tickcount > v451 + v449.delay:get() then
                                    if v456.choked_commands == 0 then
                                        v450 = not v450;
                                        v451 = globals.tickcount;
                                    end;
                                elseif globals.tickcount < v451 then
                                    v451 = globals.tickcount;
                                end;
                                v353.hidden:override(false);
                                v353.aa_enable:override(true);
                                v353.pitch:override(v355.antiaim.pitch:get());
                                v353.yaw:override("Backward");
                                v353.yawoffset:override(rage.antiaim:inverter() and v440(v449.yaw_left:get(), v449.yaw_random:get()) or v440(v449.yaw_right:get(), v449.yaw_random:get()));
                                v353.avoidbackstab:override(v355.antiaim.additions:get("Avoid Backstab"));
                                v353.yawmodifier:override(v449.yawmodifier:get());
                                v353.yawmodoffset:override(v440(v449.yawmodifier_offset:get(), v449.yawmodifier_random:get()));
                                v353.bodyyaw:override(v449.bodyyaw:get());
                                v353.leftlimit:override(v449.leftlimit:get());
                                v353.rightlimit:override(v449.rightlimit:get());
                                v353.bodyfrees:override(v449.bodyfreestanding:get());
                                v353.freestanding:override(v355.antiaim.freestanding:get());
                                v353.disableyawmod:override(v355.antiaim.freestanding_disableyawmod:get());
                                v353.bodyfreestanding:override(v355.antiaim.freestanding_bodyfreestanding:get());
                                v353.lagoptions:override(v449.defensive_type:get("DT") and "Always On" or "On Peek");
                                v353.hsoptions:override(v449.defensive_type:get("Hide Shots") and "Break LC" or "Favor Fire Rate");
                                if v449.delay:get() == 1 then
                                    v353.inverter:override(v449.invert:get());
                                    v353.options:override(v449.options:get());
                                elseif v449.options:get("Jitter") then
                                    v353.options:override("");
                                    v353.inverter:override(v450);
                                end;
                                local v458 = v449.defensive_yaw_offset:get();
                                if v449.defensive_type_type:get() ~= 1 and (v449.defensive_type:get("DT") or v449.defensive_type:get("Hide Shots")) and not string.match(v449.defensive_yaw:get(), "Flick") then
                                    if v449.defensive_type_type:get() == 2 then
                                        v456.force_defensive = v456.choked_commands == 1 and v456.send_packet == true and (not (v432.defensive >= 2) or v432.defensive > 13);
                                    elseif v449.defensive_type_type:get() == 3 then
                                        v456.force_defensive = v456.choked_commands == 1 and v456.send_packet == true and (not (v432.defensive >= 4) or v432.defensive > 13);
                                    end;
                                end;
                                if v449.defensive:get() then
                                    if v449.defensive_clear:get() and is_defensive_active(v457) then
                                        v447(true, nil, v449.invert:get());
                                    end;
                                    if v449.defensive_yaw:get() == "Default" then
                                        v353.hidden:override(true);
                                        v453 = 0;
                                    elseif v449.defensive_yaw:get() == "Spin" then
                                        if is_defensive_active(v457) then
                                            if v458 > 0 then
                                                if v453 <= 179 then
                                                    v453 = v453 + v449.defensive_yaw_offset:get();
                                                else
                                                    v453 = -v453 - v449.defensive_yaw_offset:get();
                                                end;
                                            elseif v453 >= -179 then
                                                v453 = v453 + v449.defensive_yaw_offset:get();
                                            else
                                                v453 = -v453 - v449.defensive_yaw_offset:get();
                                            end;
                                        end;
                                        v353.hidden:override(true);
                                        rage.antiaim:override_hidden_yaw_offset(v453);
                                    elseif v449.defensive_yaw:get() == "Progressive Spin" then
                                        if is_defensive_active(v457) then
                                            if v458 > 0 then
                                                if v453 <= 179 then
                                                    v453 = v453 + (v458 + v454);
                                                else
                                                    v453 = -v453 - (v458 + v454);
                                                end;
                                            elseif v453 >= -179 then
                                                v453 = v453 + (v458 - v454);
                                            else
                                                v453 = -v453 - (v458 - v454);
                                            end;
                                        end;
                                        v353.hidden:override(true);
                                        rage.antiaim:override_hidden_yaw_offset(v453);
                                        if v455 == 1 then
                                            v454 = v454 + 1;
                                            if v454 >= 10 then
                                                v454 = 10;
                                                v455 = -1;
                                            end;
                                        elseif v455 == -1 then
                                            v454 = v454 - 1;
                                            if v454 <= 0 then
                                                v454 = 0;
                                                v455 = 1;
                                            end;
                                        end;
                                    elseif v449.defensive_yaw:get() == "Offset" then
                                        v353.hidden:override(true);
                                        rage.antiaim:override_hidden_yaw_offset(v458);
                                    elseif v449.defensive_yaw:get() == "Random" then
                                        v353.hidden:override(true);
                                        rage.antiaim:override_hidden_yaw_offset(math.random(-180, 180));
                                    elseif v449.defensive_yaw:get() == "Side" then
                                        v353.hidden:override(true);
                                        rage.antiaim:override_hidden_yaw_offset(rage.antiaim:inverter() and v458 or -v458);
                                    elseif v449.defensive_yaw:get() == "Center" then
                                        v353.hidden:override(true);
                                        rage.antiaim:override_hidden_yaw_offset(globals.tickcount % 4 > 1 and v458 or -v458);
                                    elseif v449.defensive_yaw:get() == "3-Way" then
                                        if globals.tickcount % 3 == 0 then
                                            rage.antiaim:override_hidden_yaw_offset(v458 - v353.yawoffset:get());
                                        elseif globals.tickcount % 3 == 1 then
                                            rage.antiaim:override_hidden_yaw_offset(v353.yawoffset:get());
                                        elseif globals.tickcount % 3 == 2 then
                                            rage.antiaim:override_hidden_yaw_offset(-v458 + v353.yawoffset:get());
                                        end;
                                        v353.hidden:override(true);
                                    else
                                        rage.antiaim:override_hidden_yaw_offset(v353.yawoffset:get());
                                    end;
                                    if v449.defensive_pitch:get() == "Offset" then
                                        v353.hidden:override(true);
                                        rage.antiaim:override_hidden_pitch(v449.defensive_pitch_offset:get());
                                    elseif v449.defensive_pitch:get() == "Random" then
                                        v353.hidden:override(true);
                                        rage.antiaim:override_hidden_pitch(math.random(-89, 89));
                                    elseif v449.defensive_pitch:get() == "Corner" then
                                        if globals.tickcount % 3 == 0 then
                                            rage.antiaim:override_hidden_pitch(0);
                                        elseif globals.tickcount % 3 == 1 then
                                            rage.antiaim:override_hidden_pitch(-89);
                                        elseif globals.tickcount % 3 == 2 then
                                            rage.antiaim:override_hidden_pitch(0);
                                        end;
                                        v353.hidden:override(true);
                                    elseif v449.defensive_pitch:get() == "Side" then
                                        v353.hidden:override(true);
                                        rage.antiaim:override_hidden_pitch(rage.antiaim:inverter() and v449.defensive_pitch_offset:get() or -v449.defensive_pitch_offset:get());
                                    end;
                                end;
                                if v355.antiaim.freestanding_flick:get() and v355.antiaim.freestanding:get() then
                                    if not rage.antiaim:get_target(true) then
                                        return;
                                    elseif not v457:get_anim_state() then
                                        return;
                                    else
                                        lp_yaw = math.floor(v457:get_anim_state().abs_yaw) - 180;
                                        v426 = true;
                                        if v355.antiaim.freestanding_hit:get() then
                                            if not entity.get_threat(true) then
                                                return;
                                            else
                                                v448();
                                                v443(lp_yaw > 0 and 180 or -180, v355.antiaim.freestanding_pitch:get());
                                            end;
                                        else
                                            v448();
                                            v443(lp_yaw > 0 and 180 or -180, v355.antiaim.freestanding_pitch:get());
                                        end;
                                    end;
                                end;
                                if v355.antiaim.yaw:get() == "Local View" then
                                    v353.yawbase:override("Local View");
                                elseif v355.antiaim.yaw:get() == "At Target" then
                                    v353.yawbase:override("At Target");
                                elseif v355.antiaim.yaw:get() == "Left" then
                                    v353.yawbase:override("Local View");
                                    v353.yawoffset:override(-90);
                                    v426 = true;
                                    v447(v355.antiaim.yaw_static:get(), nil, false);
                                    if v355.antiaim.yaw_flick:get() then
                                        if v355.antiaim.yaw_hit:get() then
                                            if not entity.get_threat(true) then
                                                return;
                                            else
                                                v448();
                                                v443(180, v355.antiaim.yaw_pitch:get());
                                            end;
                                        else
                                            v448();
                                            v443(180, v355.antiaim.yaw_pitch:get());
                                        end;
                                    end;
                                elseif v355.antiaim.yaw:get() == "Right" then
                                    v353.yawbase:override("Local View");
                                    v353.yawoffset:override(90);
                                    v426 = true;
                                    v447(v355.antiaim.yaw_static:get(), nil, false);
                                    if v355.antiaim.yaw_flick:get() then
                                        if v355.antiaim.yaw_hit:get() then
                                            if not entity.get_threat(true) then
                                                return;
                                            else
                                                v448();
                                                v443(180, v355.antiaim.yaw_pitch:get());
                                            end;
                                        else
                                            v448();
                                            v443(180, v355.antiaim.yaw_pitch:get());
                                        end;
                                    end;
                                elseif v355.antiaim.yaw:get() == "Forward" then
                                    v353.yawbase:override("Local View");
                                    v353.yawoffset:override(180);
                                    v447(v355.antiaim.yaw_static:get(), nil, false);
                                    if v355.antiaim.yaw_flick:get() then
                                        if v355.antiaim.yaw_hit:get() then
                                            if not entity.get_threat(true) then
                                                return;
                                            else
                                                v448();
                                                v443(180, v355.antiaim.yaw_pitch:get());
                                            end;
                                        else
                                            v448();
                                            v443(180, v355.antiaim.yaw_pitch:get());
                                        end;
                                    end;
                                end;
                                v353.avoidbackstab:override(v355.antiaim.additions:get("Avoid Backstab"));
                                if v355.antiaim.additions:get("Warmup Anti-Aim") and entity.get_game_rules().m_bWarmupPeriod then
                                    v353.bodyyaw:override(false);
                                    v447(true, nil, false);
                                end;
                                if v355.antiaim.additions:get("Safe Head") then
                                    local v459 = v457:get_player_weapon();
                                    if not v459 then
                                        return;
                                    else
                                        local v460 = v459:get_classname();
                                        if not v460 then
                                            return;
                                        else
                                            if v424(v456) == "AIR~C" then
                                                if v355.antiaim.safe_head:get("Air~C Knife") and v460 == "CKnife" then
                                                    v447(true, -4, true);
                                                end;
                                                if v355.antiaim.safe_head:get("Air~C Taser") and v460 == "CWeaponTaser" then
                                                    v447(true, -4, true);
                                                end;
                                            end;
                                            if v355.antiaim.safe_head:get("Height Difference") then
                                                local v461 = entity.get_threat(true);
                                                if not v461 then
                                                    return;
                                                else
                                                    local v462 = v457:get_hitbox_position(1);
                                                    local v463 = v461:get_hitbox_position(1);
                                                    if not v462 then
                                                        return;
                                                    elseif not v463 then
                                                        return;
                                                    elseif v462.z - v463.z > v355.antiaim.safe_head_difference:get() then
                                                        v447(true, -4, true);
                                                    end;
                                                end;
                                            end;
                                        end;
                                    end;
                                end;
                                if entity.get_game_rules().m_gamePhase == 5 or entity.get_game_rules().m_gamePhase == 4 then
                                    v456.force_defensive = false;
                                end;
                                return;
                            end;
                        end;
                        local l_realtime_0 = globals.realtime;
                        local l_realtime_1 = globals.realtime;
                        events.bullet_impact:set(function(v467)
                            -- upvalues: l_realtime_1 (ref), v346 (ref), l_realtime_0 (ref), v355 (ref)
                            local v468 = entity.get_local_player();
                            if not v468 then
                                return;
                            elseif not v468:is_alive() then
                                return;
                            else
                                local v469 = entity.get(v467.userid, true);
                                if not v469:is_enemy() then
                                    return;
                                elseif entity.get_threat(true) == nil then
                                    return;
                                else
                                    local v470 = (vector(v467.x, v467.y, v467.z) - v469:get_hitbox_position(0)):angles();
                                    local v471 = (v468:get_hitbox_position(3) - v469:get_hitbox_position(0)):angles() - v470;
                                    v471.y = math.clamp(v471.y, -180, 180);
                                    if math.sqrt(v471.y * v471.y + v471.x * v471.x) < 10 and l_realtime_1 + 0.1 < globals.realtime then
                                        v346[2] = v346[2] + 1;
                                        l_realtime_0 = globals.realtime;
                                        l_realtime_1 = globals.realtime + 0.1;
                                        if v355.misc.rage_logs:get() and v355.misc.rage_logs_type:get(3) then
                                            render.notify("\aBAC4F9F7" .. ui.get_icon("moon-stars") .. "  \aFFFFFFFF" .. v469:get_name() .. " shot at you", color(v355.misc.rage_logs_hit:get().r, v355.misc.rage_logs_hit:get().g, v355.misc.rage_logs_hit:get().b, 255));
                                        end;
                                    end;
                                    return;
                                end;
                            end;
                        end);
                        ffi.cdef("            typedef void*(__thiscall* get_client_entity_t)(void*, int);\n            typedef struct {\n                char  pad_0000[20];\n                int m_nOrder;\n                int m_nSequence;\n                float m_flPrevCycle;\n                float m_flWeight;\n                float m_flWeightDeltaRate;\n                float m_flPlaybackRate;\n                float m_flCycle;\n                void *m_pOwner;\n                char  pad_0038[4];\n            } animstate_layer_t;\n        ");
                        local _ = ffi.typeof("uintptr_t**");
                        local v473 = utils.get_vfunc("client.dll", "VClientEntityList003", 3, "void*(__thiscall*)(void*, int)");
                        local v474 = 0;
                        local v475 = 0;
                        local function v477()
                            -- upvalues: v474 (ref), v475 (ref)
                            local v476 = entity.get_local_player();
                            if not v476 then
                                return;
                            else
                                if bit.band(v476.m_fFlags, 1) == 1 then
                                    v474 = v474 + 1;
                                else
                                    v474 = 0;
                                    v475 = globals.curtime + 1;
                                end;
                                return v474 > 1 and v475 > globals.curtime;
                            end;
                        end;
                        local v478 = false;
                        local function v483(v479)
                            -- upvalues: v478 (ref), v473 (ref), v355 (ref), v353 (ref), v477 (ref)
                            v478 = false;
                            v479 = entity.get_local_player();
                            if v479 == nil then
                                return;
                            elseif not v479:is_alive() then
                                return;
                            elseif v479:get_index() == nil then
                                return;
                            else
                                local v480 = v473(v479:get_index());
                                local v481 = v479.m_vecVelocity:length() > 5;
                                local _ = bit.band(v479.m_fFlags, 1) == 0;
                                if not v355.antiaim.anim_breakers:get() then
                                    return;
                                else
                                    if v355.antiaim.anim_ground:get() == "Static" then
                                        v479.m_flPoseParameter[0] = 1;
                                        v353.legmovement:override("Sliding");
                                    elseif v355.antiaim.anim_ground:get() == "Sliding" then
                                        v479.m_flPoseParameter[10] = 0;
                                        v353.legmovement:override("Walking");
                                    elseif v355.antiaim.anim_ground:get() == "Moonwalk" then
                                        v479.m_flPoseParameter[10] = 1;
                                        v353.legmovement:override("Walking");
                                    elseif v355.antiaim.anim_ground:get() == "Jitter" then
                                        v479.m_flPoseParameter[0] = globals.tickcount % 4 > 1 and v355.antiaim.anim_jitter:get() / 100 or 1;
                                        v478 = true;
                                        v353.legmovement:override(globals.tickcount % 8 > 3 and "Walking" or "Sliding");
                                    elseif v355.antiaim.anim_ground:get() == "Better Jitter" then
                                        v479.m_flPoseParameter[0] = math.random(v355.antiaim.anim_jitter:get() / 10, 10) / 10;
                                        v353.legmovement:override(globals.tickcount % 8 > 3 and "Walking" or "Sliding");
                                        v478 = true;
                                    end;
                                    if v355.antiaim.anim_air:get() == "Static" then
                                        v479.m_flPoseParameter[6] = 1;
                                    elseif v355.antiaim.anim_air:get() == "Moonwalk" then
                                        ffi.cast("animstate_layer_t**", ffi.cast("uintptr_t", v480) + 10640)[0][6].m_flWeight = 1;
                                    elseif v355.antiaim.anim_air:get() == "Jitter" then
                                        v479.m_flPoseParameter[6] = globals.tickcount % 4 > 1 and v355.antiaim.anim_air_jitter:get() / 100 or 0;
                                    elseif v355.antiaim.anim_air:get() == "Better Jitter" then
                                        v479.m_flPoseParameter[3] = math.random(0, v355.antiaim.anim_jitter:get() / 10) / 10;
                                        v479.m_flPoseParameter[6] = math.random(0, v355.antiaim.anim_jitter:get() / 10) / 10;
                                        v478 = true;
                                    elseif v355.antiaim.anim_air:get() == "Flying" then
                                        ffi.cast("animstate_layer_t**", ffi.cast("uintptr_t", v480) + 10640)[0][5].m_flWeight = 1;
                                    end;
                                    if v355.antiaim.anim_other:get("Zero Pitch On Land") and v477() then
                                        v479.m_flPoseParameter[12] = 0.5;
                                    end;
                                    if v355.antiaim.anim_other:get("Move Lean") and not v355.antiaim.anim_other:get("EarthQuake") and v481 then
                                        ffi.cast("animstate_layer_t**", ffi.cast("uintptr_t", v480) + 10640)[0][12].m_flWeight = v355.antiaim.anim_lean:get() / 100;
                                    end;
                                    if v355.antiaim.anim_other:get("Static") then
                                        ffi.cast("animstate_layer_t**", ffi.cast("uintptr_t", v480) + 10640)[0][7].m_flWeight = 1;
                                    end;
                                    if v355.antiaim.anim_other:get("EarthQuake") then
                                        ffi.cast("animstate_layer_t**", ffi.cast("uintptr_t", v480) + 10640)[0][12].m_flWeight = math.random(0, 100) / 100;
                                        v478 = true;
                                    end;
                                    return;
                                end;
                            end;
                        end;
                        events.post_update_clientside_animation:set(v483);
                        local function v486()
                            -- upvalues: l_l_gradient_0_0 (ref), l_l_pui_0_0 (ref)
                            local v484 = l_l_gradient_0_0.text_animate("G E N E S I S", -1, {
                                color(200, 200, 200, 240), 
                                color(150, 150, 150, 200), 
                                color(100, 100, 100, 160)
                            });
                            local v485 = l_l_gradient_0_0.text_animate(ui.get_icon("star") .. " " .. ui.get_icon("star") .. " " .. ui.get_icon("star"), -1, {
                                color(200, 200, 200, 240), 
                                color(150, 150, 150, 200), 
                                color(100, 100, 100, 160)
                            });
                            v484:animate();
                            v485:animate();
                            if ui.get_alpha() > 0 then
                                l_l_pui_0_0.sidebar(v484:get_animated_text(), "\a969696FF" .. ui.get_icon("code"));
                            end;
                            render.text(4, vector(render.screen_size().x * 0.5, render.screen_size().y - 10), color(255), "c", v484:get_animated_text());
                            render.text(4, vector(render.screen_size().x * 0.5, render.screen_size().y - 20), color(255), "c", v485:get_animated_text());
                        end;
                        local v487 = render.screen_size() / 2;
                        local v488 = {};
                        local function v502()
                            -- upvalues: v488 (ref), v355 (ref), v487 (ref)
                            for v489, v490 in pairs(v488) do
                                if v490.FadeTime <= 0 then
                                    v488[v489] = nil;
                                else
                                    v490.WaitTime = v490.WaitTime - globals.frametime;
                                    if v490.WaitTime <= 0 then
                                        v490.FadeTime = v490.FadeTime - 2 * globals.frametime;
                                    end;
                                    if v355.visuals.world_hitmarker:get() and v490.Position.x ~= nil and v490.Position.y ~= nil and v490.Position.z ~= nil and v490.Reason == nil then
                                        local v491 = render.world_to_screen(vector(v490.Position.x, v490.Position.y, v490.Position.z));
                                        if v491 ~= nil then
                                            local l_x_0 = v491.x;
                                            local l_y_0 = v491.y;
                                            local v494 = v487 * 2;
                                            local v495, v496, v497, v498 = v355.visuals.world_hitmarker_clr:get():unpack();
                                            render.rect(vector(l_x_0 - 0.5 / v494.x * v494.x, l_y_0 - 6 / v494.y * v494.y), vector(l_x_0 + 0.5 / v494.x * v494.x, l_y_0 + 6 / v494.y * v494.y), color(v495, v496, v497, v498 * v490.FadeTime), 0, true);
                                            render.rect(vector(l_x_0 - 6 / v494.x * v494.x, l_y_0 - 0.5 / v494.y * v494.y), vector(l_x_0 + 6 / v494.x * v494.x, l_y_0 + 0.5 / v494.y * v494.y), color(v495, v496, v497, v498 * v490.FadeTime), 0, true);
                                        end;
                                    end;
                                    if v355.visuals.world_missmarker:get() and v490.Position.x ~= nil and v490.Position.y ~= nil and v490.Position.z ~= nil and v490.Reason ~= nil then
                                        local v499 = render.world_to_screen(vector(v490.Position.x, v490.Position.y, v490.Position.z));
                                        if not v499 then
                                            return;
                                        else
                                            local v500 = render.measure_text(1, "", "x   ");
                                            local v501 = render.measure_text(1, "", v490.Reason);
                                            render.shadow(vector(v499.x + v500.x, v499.y + v500.y / 2), vector(v499.x + v500.x + v501.x, v499.y + v500.y / 2), v355.visuals.world_missmarker_clr:get(), 30, 0, 3);
                                            render.text(1, vector(v499.x, v499.y), color(255), "", "x   " .. v490.Reason);
                                        end;
                                    end;
                                end;
                            end;
                        end;
                        local v503 = {};
                        local function v508()
                            -- upvalues: v487 (ref), v503 (ref), v355 (ref)
                            local v504 = 0;
                            local v505 = v487.y * 1.3;
                            for v506, v507 in ipairs(v503) do
                                v507[2] = globals.curtime - v507[3] < 4 and (not (#v503 > 5) or v506 >= #v503 - 5) and math.lerp(v507[2], 255, 20) or math.lerp(v507[2], 0, 20);
                                v504 = v504 - 40 * (v507[2] / 255);
                                text_size = render.measure_text(1, "od", v507[1]);
                                if v355.misc.rage_logs_style:get() == 1 then
                                    render.shadow(vector(v487.x - text_size.x / 2, v505 - v504 + 6), vector(v487.x + text_size.x / 2, v505 - v504 + 6), color(v507[4].r, v507[4].g, v507[4].b, v507[2]), 30, 0, 0);
                                else
                                    render.shadow(vector(v487.x - text_size.x / 2 - 10, v505 - v504 - 5), vector(v487.x + text_size.x / 2 + 10, v505 - v504 + text_size.y + 5), color(v507[4].r, v507[4].g, v507[4].b, v507[2]), 30, 0, v355.misc.rage_logs_round:get());
                                    render.rect(vector(v487.x - text_size.x / 2 - 10, v505 - v504 - 5), vector(v487.x + text_size.x / 2 + 10, v505 - v504 + text_size.y + 5), color(20, 20, 20, v507[2]), v355.misc.rage_logs_round:get());
                                end;
                                render.text(1, vector(v487.x - text_size.x / 2, v505 - v504), color(255, 255, 255, v507[2] / 255 * 255), "od", v507[1]);
                                if v507[2] < 0.1 or not entity.get_local_player() then
                                    table.remove(v503, v506);
                                end;
                            end;
                        end;
                        render.notify = function(v509, v510)
                            -- upvalues: v503 (ref)
                            table.insert(v503, {
                                [1] = nil, 
                                [2] = 0, 
                                [1] = v509, 
                                [3] = globals.curtime, 
                                [4] = v510
                            });
                        end;
                        render.notify("\aBAC4F9F7" .. ui.get_icon("moon-stars") .. "\aFFFFFFFF Welcome back, \aBAC4F9F7" .. common.get_username(), color(v355.misc.rage_logs_hit:get().r, v355.misc.rage_logs_hit:get().g, v355.misc.rage_logs_hit:get().b, 255));
                        local v511 = {
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
                        events.aim_ack:set(function(v512)
                            -- upvalues: v488 (ref), v355 (ref), v511 (ref), v346 (ref)
                            local v513 = entity.get(v512.target);
                            if not v513 then
                                return;
                            else
                                v488[v512.id] = {
                                    FadeTime = 1, 
                                    WaitTime = 2, 
                                    Position = v512.aim, 
                                    Reason = v512.state
                                };
                                if v512.state == nil then
                                    local v514 = color(v355.misc.rage_logs_hit:get().r, v355.misc.rage_logs_hit:get().g, v355.misc.rage_logs_hit:get().b, 255);
                                    local v515 = v514:to_hex();
                                    local v516 = ("\aBAC4F9F7[genesis] \aBAC4F9F7\194\187\aFFFFFFFF Registered shot in \aBAC4F9F7%s\aFFFFFFFF %s for\aBAC4F9F7 %d damage\aFFFFFFFF (hitchance: %d%% | safety: 1 | history(\206\148): \aBAC4F9F7%d\aFFFFFFFF)"):format(v513:get_name(), v511[v512.hitgroup], v512.damage, v512.hitchance, v512.backtrack);
                                    local v517 = ("\a" .. v515 .. "" .. ui.get_icon("moon-stars") .. " \aFFFFFFFFHit \a" .. v515 .. "%s's \aFFFFFFFF%s (%d%%) for \a" .. v515 .. "%d \aFFFFFFFFdmg"):format(v513:get_name(), v511[v512.hitgroup], v512.hitchance, v512.damage);
                                    if v355.misc.rage_logs:get() and v355.misc.rage_logs_type:get("Screen") then
                                        render.notify(v517, v514);
                                    end;
                                    if v355.misc.rage_logs:get() and v355.misc.rage_logs_type:get("Event") then
                                        common.add_event(v516, "moon-stars");
                                    end;
                                    if v355.misc.rage_logs:get() and v355.misc.rage_logs_type:get("Console") then
                                        print_raw(v516);
                                    end;
                                    if v513.m_iHealth < 1 then
                                        v346[1] = v346[1] + 1;
                                    end;
                                else
                                    local v518 = color(v355.misc.rage_logs_miss:get().r, v355.misc.rage_logs_miss:get().g, v355.misc.rage_logs_miss:get().b, 255);
                                    local v519 = v518:to_hex();
                                    local v520 = ("\aBAC4F9F7[genesis] \aFFFFFFFF\194\187\aFFFFFFFF Missed shot at \aBA5A5AFF%s\aFFFFFFFF %s(%d%%) due to\aBA5A5AFF \aFFFFFFFF%s \aBA5A5AFFdmg: %d \aFFFFFFFFsafety: 1\aFFFFFFFF \aFFFFFFFF& history(\206\148):\aBA5A5AFF%d\aFFFFFFFF)"):format(v513:get_name(), v511[v512.wanted_hitgroup], v512.hitchance, v512.state, v512.wanted_damage, v512.backtrack);
                                    local v521 = ("\a" .. v519 .. "" .. ui.get_icon("moon-stars") .. " \aFFFFFFFFMissed \a" .. v519 .. "%s's \aFFFFFFFF%s (%d%%) due to \a" .. v519 .. "%s"):format(v513:get_name(), v511[v512.wanted_hitgroup], v512.hitchance, v512.state);
                                    if v355.misc.rage_logs:get() and v355.misc.rage_logs_type:get("Screen") then
                                        render.notify(v521, v518);
                                    end;
                                    if v355.misc.rage_logs:get() and v355.misc.rage_logs_type:get("Event") then
                                        common.add_event(v520, "moon-stars");
                                    end;
                                    if v355.misc.rage_logs:get() and v355.misc.rage_logs_type:get("Console") then
                                        print_raw(v520);
                                    end;
                                end;
                                return;
                            end;
                        end);
                        local v522 = 0;
                        local v523 = 0;
                        local function v531()
                            -- upvalues: v487 (ref), v355 (ref), l_v321_0 (ref), l_v315_0 (ref), l_v320_0 (ref), v522 (ref), v523 (ref)
                            local l_x_1 = v487.x;
                            local l_y_1 = v487.y;
                            local v526 = entity.get_local_player();
                            if not v526 then
                                return;
                            elseif not v526:is_alive() then
                                return;
                            else
                                local l_m_bIsScoped_0 = v526.m_bIsScoped;
                                local v528 = v355.visuals.custom_scope_offset:get();
                                l_v321_0.custom_scope_offset = l_v315_0.new(0.1, l_v320_0, {
                                    custom_scope_offset = l_m_bIsScoped_0 and 1 or 0
                                }, "linear");
                                v522 = v355.visuals.custom_scope_length:get() * l_v320_0.custom_scope_offset;
                                v523 = l_v320_0.custom_scope_offset * v355.visuals.custom_scope_color:get().a;
                                local v529 = v355.visuals.custom_scope_inverted:get() and color(v355.visuals.custom_scope_color:get().r, v355.visuals.custom_scope_color:get().g, v355.visuals.custom_scope_color:get().b, 1) or color(v355.visuals.custom_scope_color:get().r, v355.visuals.custom_scope_color:get().g, v355.visuals.custom_scope_color:get().b, v523);
                                local v530 = v355.visuals.custom_scope_inverted:get() and color(v355.visuals.custom_scope_color:get().r, v355.visuals.custom_scope_color:get().g, v355.visuals.custom_scope_color:get().b, v523) or color(v355.visuals.custom_scope_color:get().r, v355.visuals.custom_scope_color:get().g, v355.visuals.custom_scope_color:get().b, 1);
                                if v522 > 1 and l_m_bIsScoped_0 then
                                    render.gradient(vector(l_x_1, l_y_1 + v528), vector(l_x_1 + 1, l_y_1 + v522 + v528), v529, v529, v530, v530);
                                    render.gradient(vector(l_x_1 + v522 + v528, l_y_1), vector(l_x_1 + v528, l_y_1 + 1), v530, v529, v530, v529);
                                    if not v355.visuals.custom_scope_t:get() then
                                        render.gradient(vector(l_x_1, l_y_1 - (v528 - 1) - v522), vector(l_x_1 + 1, l_y_1 - (v528 - 1)), v530, v530, v529, v529);
                                    end;
                                    render.gradient(vector(l_x_1 - v522 - (v528 - 1), l_y_1), vector(l_x_1 - (v528 - 1), l_y_1 + 1), v530, v529, v530, v529);
                                end;
                                return;
                            end;
                        end;
                        render.defuse_bar = function(v532, v533)
                            local v534 = 0;
                            local l_y_2 = render.screen_size().y;
                            render.rect(vector(v534, 0), vector(18, l_y_2), color(0, 0, 0, 45));
                            render.rect(vector(v534, l_y_2 * (1 - v532)), vector(18, l_y_2), v533);
                        end;
                        render.indicator = function(v536, v537, v538, v539, v540, v541, v542)
                            -- upvalues: l_v323_0 (ref), l_v322_0 (ref)
                            local v543 = 30;
                            local v544 = render.screen_size().y - 325;
                            local v545 = nil;
                            if v539 then
                                v545 = render.measure_text(l_v323_0, "", v536);
                                v545.x = v545.x + 35;
                            else
                                v545 = render.measure_text(l_v323_0, "", v536);
                            end;
                            render.gradient(vector(v543 - 20, v544 + v538 - 8), vector(v543 + v545.x / 2, v544 + v538 + v545.y + 5), color(0, 0, 0, 0), color(0, 0, 0, 45), color(0, 0, 0, 0), color(0, 0, 0, 45));
                            render.gradient(vector(v543 + v545.x / 2, v544 + v538 - 8), vector(v543 + 20 + v545.x, v544 + v538 + v545.y + 5), color(0, 0, 0, 45), color(0, 0, 0, 0), color(0, 0, 0, 45), color(0, 0, 0, 0));
                            if v539 then
                                render.texture(l_v322_0, vector(v543, v544 + v538 - 6), vector(30, 30), v540);
                                render.text(l_v323_0, vector(v543 + 35, v544 + v538), v537, "", v536);
                            else
                                render.text(l_v323_0, vector(v543, v544 + v538), v537, "", v536);
                            end;
                            if v541 and v542 then
                                render.circle_outline(vector(v543 + v545.x + 18, v544 + v538 + v545.y / 2 - 2), color(0, 0, 0, 200), 10, 0, 360, 4);
                                render.circle_outline(vector(v543 + v545.x + 18, v544 + v538 + v545.y / 2 - 2), v541, 10, 0, v542, 4);
                            end;
                        end;
                        local v546 = {
                            damage = 0, 
                            defuse_time = 0, 
                            bomb_timer = 0, 
                            planting_site = "", 
                            fill = 0, 
                            on_plant_time = 0, 
                            killed = false, 
                            planting = false, 
                            can_defuse = false
                        };
                        reset_bomb = function()
                            -- upvalues: v546 (ref)
                            v546.can_defuse = false;
                            v546.planting = false;
                            v546.killed = false;
                            v546.on_plant_time = 0;
                            v546.fill = 0;
                            v546.planting_site = "";
                            v546.damage = 0;
                            v546.bomb_timer = 0;
                            v546.defuse_time = 0;
                        end;
                        render.window_bomb = function(v547, v548, v549, v550, v551, v552, v553, v554, v555, _, v557)
                            -- upvalues: v355 (ref), l_v324_0 (ref), v546 (ref), l_v322_0 (ref)
                            if not entity.get_local_player() then
                                return;
                            else
                                local v558 = v355.visuals.solus_ui_color:get();
                                local l_r_0 = v558.r;
                                local l_g_0 = v558.g;
                                local l_b_0 = v558.b;
                                local v562 = color(l_r_0, l_g_0, l_b_0, v551):to_hex();
                                local v563 = render.measure_text(l_v324_0, "a", "Bombsite: " .. v552);
                                render.shadow(vector(v547, v548), vector(v547 + v549 + 3, v548 + 19 + v550), color(l_r_0, l_g_0, l_b_0, v551), 20, 0, 3);
                                render.rect(vector(v547, v548), vector(v547 + v549 + 3, v548 + 19 + v550), color(20, 20, 20, v551), 3);
                                render.text(l_v324_0, vector(v547 + 40, v548 + 5), color(200, 200, 200, v551), "a", "Bombsite: \a" .. v562 .. v552);
                                render.text(l_v324_0, vector(v547 + 40, v548 + 10 + v563.y), color(200, 200, 200, v551), "a", v546.killed and "Damage: \aFF0000FF" .. v553 or "Damage: \a" .. v562 .. v553);
                                render.texture(l_v322_0, vector(v547 + 5, v548 + 5), vector(30, 30), color(l_r_0, l_g_0, l_b_0, v551));
                                render.circle_outline(vector(v547 + 131, v548 + 20), color(100, 100, 100, v551), 15, 0, 360, 2);
                                if v554 and v554 ~= 0 then
                                    local v564 = math.max(0, math.min(1, v554 / 40));
                                    local v565 = math.floor(v554 * 10);
                                    render.text(1, vector(v547 + 132, v548 + 19), color(200, 200, 200, v551), "cao", v565 / 10);
                                    render.circle_outline(vector(v547 + 131, v548 + 20), color(l_r_0, l_g_0, l_b_0, v551), 15, 270, v564, 2);
                                end;
                                if v555 and v555 ~= 0 then
                                    local v566 = math.max(0, math.min(1, v555 / 10));
                                    local v567 = math.floor(v555 * 10);
                                    render.text(1, vector(v547 + 132, v548 + 19), v546.can_defuse and color(138, 226, 92, v551) or color(255, 0, 0, v551), "cao", v567 / 10);
                                    render.circle_outline(vector(v547 + 131, v548 + 20), color(l_r_0, l_g_0, l_b_0, v551), 15, 270, v566, 2);
                                end;
                                if v557 and v557 ~= 0 then
                                    local v568 = math.max(0, math.min(1, v557 / 3.125));
                                    local v569 = math.floor(v557 * 10);
                                    render.text(1, vector(v547 + 132, v548 + 19), color(138, 226, 92, v551), "cao", v569 / 10);
                                    render.circle_outline(vector(v547 + 131, v548 + 20), color(l_r_0, l_g_0, l_b_0, v551), 15, 270, v568, 2);
                                end;
                                return;
                            end;
                        end;
                        local l_x_2 = render.screen_size().x;
                        local l_y_3 = render.screen_size().y;
                        local v572 = 0;
                        local v573 = 1;
                        local _ = 0;
                        local v575 = 0;
                        local v576 = {
                            [""] = {
                                alphak = 0
                            }
                        };
                        local _ = 1;
                        local v578 = 255;
                        local v579 = v354.selector:slider("winx", 0, l_x_2, 400);
                        local v580 = v354.selector:slider("winy", 0, l_y_3, 400);
                        local v581 = v354.selector:slider("winx1", 0, l_x_2, 300);
                        local v582 = v354.selector:slider("winy1", 0, l_y_3, 300);
                        local v583 = v354.selector:slider("winx2", 0, l_x_2, l_x_2 / 2 - 65);
                        local v584 = v354.selector:slider("winy2", 0, l_y_3, l_y_3 / 3);
                        local v585 = v354.selector:slider("velx", 0, l_x_2, l_x_2 / 2 - 50);
                        local v586 = v354.selector:slider("vely", 0, l_y_3, l_y_3 / 5);
                        local v587 = v354.selector:slider("defx", 0, l_x_2, l_x_2 / 2 - 50);
                        local v588 = v354.selector:slider("defy", 0, l_y_3, l_y_3 / 4);
                        local v589 = v354.selector:slider("dmgx", 0, l_x_2, l_x_2 / 2 + 5);
                        local v590 = v354.selector:slider("dmgy", 0, l_y_3, l_y_3 / 2 - 15);
                        v579:visibility(false);
                        v580:visibility(false);
                        v581:visibility(false);
                        v582:visibility(false);
                        v583:visibility(false);
                        v584:visibility(false);
                        v585:visibility(false);
                        v586:visibility(false);
                        v587:visibility(false);
                        v588:visibility(false);
                        v589:visibility(false);
                        v590:visibility(false);
                        render.solus = function(v591, v592, v593, v594, v595, v596)
                            -- upvalues: v355 (ref)
                            if not entity.get_local_player() then
                                return;
                            else
                                local v597 = render.measure_text(1, "", v595);
                                local v598 = render.measure_text(1, "", ui.get_icon("moon-stars") .. " " .. v595);
                                local v599 = v355.visuals.solus_ui_color:get();
                                local l_r_1 = v599.r;
                                local l_g_1 = v599.g;
                                local l_b_1 = v599.b;
                                if v355.visuals.solus_ui_type:get() == 1 then
                                    render.rect(vector(v591, v592), vector(v591 + v593 + 3, v592 + 19), color(0, 0, 0, v596 / 4));
                                    render.rect(vector(v591, v592), vector(v591 + v593 + 3, v592 + 2), color(l_r_1, l_g_1, l_b_1, v596));
                                    render.text(1, vector(v591 + 3 + v593 / 2 + 1 - v597.x / 2, v592 + 1 + v594 / 2 - v597.y / 2), color(255, 255, 255, v596), "", v595);
                                elseif v355.visuals.solus_ui_type:get() == 2 then
                                    render.rect(vector(v591, v592), vector(v591 + v593 + 3, v592 + 19), color(0, 0, 0, v596 / 4), 4);
                                    render.rect_outline(vector(v591, v592), vector(v591 + v593 + 3, v592 + 19), color(l_r_1, l_g_1, l_b_1, v596 / 2), 1, 4);
                                    render.text(1, vector(v591 + 3 + v593 / 2 + 1 - v597.x / 2, v592 + 1 + v594 / 2 - v597.y / 2), color(255, 255, 255, v596), "", v595);
                                elseif v355.visuals.solus_ui_type:get() == 3 then
                                    render.rect(vector(v591 - 5, v592 - 4), vector(v591 + v593 + 7, v592 + 21), color(40, 40, 40, v596), 0);
                                    render.rect_outline(vector(v591 - 4, v592 - 3), vector(v591 + v593 + 6, v592 + 20), color(0, 0, 0, v596 / 2), 0);
                                    render.rect(vector(v591, v592 + 1), vector(v591 + v593 + 3, v592 + 17), color(20, 20, 20, v596), 0);
                                    render.rect_outline(vector(v591 - 1, v592), vector(v591 + v593 + 3, v592 + 18), color(60, 60, 60, v596), 0);
                                    render.gradient(vector(v591, v592 + 1), vector(v591 + v593 / 2, v592 + 2), color(78, 169, 249, v596), color(254, 86, 217, v596), color(78, 169, 249, v596), color(254, 86, 217, v596));
                                    render.gradient(vector(v591 + v593 / 2, v592 + 1), vector(v591 + v593 + 2, v592 + 2), color(254, 86, 217, v596), color(214, 255, 108, v596), color(254, 86, 217, v596), color(214, 255, 108, v596));
                                    render.text(1, vector(v591 + 3 + v593 / 2 + 1 - v597.x / 2, v592 + 1 + v594 / 2 - v597.y / 2), color(255, 255, 255, v596), "", v595);
                                elseif v355.visuals.solus_ui_type:get() == 4 then
                                    render.shadow(vector(v591, v592), vector(v591 + v593 + 3, v592 + 19), color(l_r_1, l_g_1, l_b_1, v596), 20, 0, v355.visuals.solus_ui_round:get());
                                    render.rect(vector(v591, v592), vector(v591 + v593 + 3, v592 + 19), color(20, 20, 20, v596), v355.visuals.solus_ui_round:get());
                                    render.text(1, vector(v591 + 3 + v593 / 2 + 1 - v598.x / 2, v592 + 1 + v594 / 2 - v598.y / 2), color(255, 255, 255, v596), "", "\a" .. v599:to_hex() .. ui.get_icon("moon-stars") .. "\aFFFFFFFF " .. v595);
                                end;
                                return;
                            end;
                        end;
                        render.window = function(v603, v604, v605, v606, v607, v608, v609, v610, v611)
                            if v609 < 10 then
                                return;
                            else
                                local v612 = render.measure_text(1, nil, v610);
                                render.text(1, vector(v603 + 50 - v612.x / 2, v604 - 20), color(255, 255, 255, v609), nil, v610);
                                if v611 == "Default" then
                                    render.rect(vector(v603, v604), vector(v605 + 100, v606), color(0, 0, 0, v609));
                                    render.rect(vector(v603 + 1, v604 + 1), vector(v605 - 1 + v607, v606 - 1), color(v608.r, v608.g, v608.b, v609));
                                elseif v611 == "Modern" then
                                    render.gradient(vector(v603 - v607 / 2 + 50, v604), vector(v603 + 50, v604 + 2), color(v608.r, v608.g, v608.b, v609), color(v608.r, v608.g, v608.b, v609), color(v608.r, v608.g, v608.b, v609 / 4), color(v608.r, v608.g, v608.b, v609), true);
                                    render.gradient(vector(v603 + 50, v604), vector(v603 + 50 + v607 / 2, v604 + 2), color(v608.r, v608.g, v608.b, v609), color(v608.r, v608.g, v608.b, v609), color(v608.r, v608.g, v608.b, v609), color(v608.r, v608.g, v608.b, v609 / 4), true);
                                else
                                    render.rect(vector(v603 - v607 / 2 + 50, v604), vector(v605 + 50 + v607 / 2, v606 + 1), color(v608.r, v608.g, v608.b, v609), 5);
                                    render.shadow(vector(v603 - v607 / 2 + 50, v604), vector(v605 + 50 + v607 / 2, v606 + 1), color(255, 255, 255, v609), 30, 0, 5);
                                end;
                                return;
                            end;
                        end;
                        local v613 = 0;
                        local v614 = 0;
                        local v615 = 100;
                        local v616 = 100;
                        local v619 = l_system_0.register({
                            [1] = v587, 
                            [2] = v588
                        }, vector(100, 20), "Defensive", function(v617)
                            -- upvalues: v615 (ref), v613 (ref), v353 (ref), v355 (ref)
                            local v618 = entity.get_local_player();
                            if not v618 then
                                return;
                            elseif not v618:is_alive() then
                                return;
                            else
                                if ui.get_alpha() > 0 then
                                    v615 = globals.tickcount % 50 * 2;
                                elseif rage.exploit:get() == 1 and is_defensive_active(v618) then
                                    v615 = math.lerp(v615, 100, 20);
                                elseif rage.exploit:get() == 1 then
                                    v615 = math.lerp(v615, 50, 20);
                                else
                                    v615 = math.lerp(v615, 0, 20);
                                end;
                                if ui.get_alpha() == 1 then
                                    v613 = math.lerp(v613, 255, 20);
                                elseif v353.fakeduck:get() then
                                    v613 = math.lerp(v613, 0, 20);
                                else
                                    v613 = math.lerp(v613, ui.find("Aimbot", "Ragebot", "Main", "Double Tap"):get() and 255 or 0, 20);
                                end;
                                render.window(v617.position.x, v617.position.y + 20, v617.position.x, v617.position.y + 24, v615, v355.visuals.windows_defensive_clr:get(), v613, "- defensive -", v355.visuals.windows_defensive:get());
                                return;
                            end;
                        end);
                        local v622 = l_system_0.register({
                            [1] = v585, 
                            [2] = v586
                        }, vector(100, 20), "Velocity", function(v620)
                            -- upvalues: v616 (ref), v614 (ref), v355 (ref)
                            local v621 = entity.get_local_player();
                            if not v621 then
                                return;
                            elseif not v621:is_alive() then
                                return;
                            else
                                if ui.get_alpha() > 0 then
                                    v616 = globals.tickcount % 50 * 2;
                                else
                                    v616 = v621.m_flVelocityModifier * 100;
                                end;
                                v614 = math.lerp(v614, (not (v616 == 100) or ui.get_alpha() ~= 0) and 255 or 0, 20);
                                render.window(v620.position.x, v620.position.y + 20, v620.position.x, v620.position.y + 24, v616, v355.visuals.windows_slowed_clr:get(), v614, "- velocity -", v355.visuals.windows_slowed:get());
                                return;
                            end;
                        end);
                        local function v627()
                            -- upvalues: v355 (ref), l_x_2 (ref)
                            local v623 = common.get_date("%H:%M:%S");
                            local v624 = globals.is_in_game and " | " .. math.floor(utils.net_channel().avg_latency[0]) .. "ms" or "";
                            local v625 = "genesis | " .. v355.visuals.solus_ui_name:get() .. v624 .. " | " .. v623 .. " ";
                            local v626 = nil;
                            if v355.visuals.solus_ui_type:get() == 4 then
                                v626 = render.measure_text(1, "", ui.get_icon("moon-stars") .. " " .. v625).x;
                            else
                                v626 = render.measure_text(1, "", v625).x;
                            end;
                            render.solus(l_x_2 - v626 - 19, 10, v626 + 4, 16, v625, 400);
                        end;
                        lerpx = function(v628, v629, v630)
                            return v629 * (1 - v628) + v630 * v628;
                        end;
                        local v645 = l_system_0.register({
                            [1] = v579, 
                            [2] = v580
                        }, vector(130, 50), "Keybind", function(v631)
                            -- upvalues: v576 (ref), v575 (ref), v573 (ref), v572 (ref)
                            local v632 = 120;
                            local _ = globals.frametime * 16;
                            local v634 = 0;
                            local v635 = {};
                            local v636 = ui.get_binds();
                            for v637 = 1, #v636 do
                                local v638 = v636[v637];
                                local v639 = v638.mode == 1 and "hold" or v638.mode == 2 and "toggle" or "[?]";
                                local _ = v638.value;
                                local l_name_0 = v638.name;
                                local v642 = render.measure_text(1, "", v639);
                                local v643 = render.measure_text(1, "", l_name_0);
                                if v576[l_name_0] == nil then
                                    v576[l_name_0] = {
                                        alphak = 0
                                    };
                                end;
                                v576[l_name_0].alphak = math.lerp(v576[l_name_0].alphak, v638.active and 255 or 0, 20);
                                render.text(1, vector(v631.position.x + 3, v631.position.y + 22 + v634), color(255, v576[l_name_0].alphak), "", l_name_0);
                                render.text(1, vector(v631.position.x + (v575 - v642.x - 8), v631.position.y + 22 + v634), color(255, v576[l_name_0].alphak), "", "[" .. v639 .. "]");
                                v634 = v634 + 16 * v576[l_name_0].alphak / 255;
                                local v644 = v642.x + v643.x + 18;
                                if v644 > 119 and v632 < v644 then
                                    v632 = v644;
                                end;
                            end;
                            v573 = math.lerp(v573, (not (ui.get_alpha() <= 0) or v634 > 0) and 1 or 0, 20);
                            v575 = math.lerp(v575, math.max(v632, 119), 20);
                            if ui.get_alpha() > 0 or v634 > 6 then
                                v572 = math.lerp(v572, math.max(ui.get_alpha() * 255, v634 > 1 and 255 or 0), 20);
                            elseif v634 < 15.99 and ui.get_alpha() == 0 then
                                v572 = math.lerp(v572, 0, 20);
                            end;
                            if ui.get_alpha() or #v635 > 0 then
                                render.solus(v631.position.x, v631.position.y, v575, 16, "keybinds", v572);
                            end;
                        end);
                        local v655 = l_system_0.register({
                            [1] = v581, 
                            [2] = v582
                        }, vector(130, 50), "Spectator", function(v646)
                            -- upvalues: v578 (ref)
                            local v647 = 120;
                            local v648 = entity.get_local_player();
                            if v648 == nil then
                                return;
                            else
                                local v649 = v648:get_spectators();
                                if v649 == nil then
                                    return;
                                else
                                    for v650, v651 in pairs(v649) do
                                        local v652 = v651:get_name();
                                        local _ = render.measure_text(1, "", v652).x;
                                        local v654 = string.len(v652) > 20 and string.sub(v652, 0, 20) .. "..." or v652;
                                        render.text(1, vector(v646.position.x + 10, v646.position.y + 5 + v650 * 15), color(), "u", v654);
                                    end;
                                    v578 = math.lerp(v578, (not (#v648:get_spectators() <= 0) or ui.get_alpha() > 0) and 255 or 0, 20);
                                    if v578 > 10 then
                                        render.solus(v646.position.x, v646.position.y, v647, 16, "spectators", v578);
                                    end;
                                    return;
                                end;
                            end;
                        end);
                        local v658 = l_system_0.register({
                            [1] = v589, 
                            [2] = v590
                        }, vector(20, 20), "Min.Damage", function(v656)
                            -- upvalues: v355 (ref)
                            local v657 = entity.get_local_player();
                            if v657 == nil then
                                return;
                            elseif not v657:is_alive() then
                                return;
                            else
                                if v355.visuals.damage_indicator_font:get() == "Default" then
                                    dmg_font = 1;
                                elseif v355.visuals.damage_indicator_font:get() == "Small" then
                                    dmg_font = 2;
                                elseif v355.visuals.damage_indicator_font:get() == "Bold" then
                                    dmg_font = 4;
                                else
                                    dmg_font = 3;
                                end;
                                render.text(dmg_font, vector(v656.position.x, v656.position.y), color(255), "", ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"):get());
                                return;
                            end;
                        end);
                        render.spectators = function()
                            local v659 = entity.get_local_player();
                            if v659 == nil then
                                return;
                            else
                                local v660 = v659:get_spectators();
                                if v660 == nil then
                                    return;
                                else
                                    local v661 = 0;
                                    for _, v663 in pairs(v660) do
                                        local v664 = v663:get_name();
                                        local _ = render.measure_text(1, "", v664).x;
                                        local v666 = string.len(v664) > 20 and string.sub(v664, 0, 20) .. "..." or v664;
                                        local v667 = render.measure_text(1, "u", v666);
                                        render.text(1, vector(render.screen_size().x - 15 - v667.x, 15 + v661), color(220), "u", v666);
                                        v661 = v661 + v667.y;
                                    end;
                                    return;
                                end;
                            end;
                        end;
                        local function v686()
                            -- upvalues: v546 (ref)
                            local v668 = entity.get_local_player();
                            if v668 == nil then
                                return;
                            else
                                local _ = render.screen_size() / 2;
                                local v670 = entity.get_entities("CPlantedC4", true)[1];
                                local _ = "";
                                local v672 = 0;
                                local v673 = false;
                                local v674 = 0;
                                local v675 = 0;
                                if v670 ~= nil then
                                    v672 = v670.m_flC4Blow - globals.curtime;
                                    v673 = v670.m_bBombDefused;
                                    if v672 > 0 and not v673 then
                                        v546.planting = false;
                                        local v676 = v670.m_hBombDefuser ~= 4294967295;
                                        local l_m_flDefuseLength_0 = v670.m_flDefuseLength;
                                        local v678 = v676 and v670.m_flDefuseCountDown - globals.curtime or -1;
                                        v546.planting_site = v670.m_nBombSite == 0 and "A" or "B";
                                        local l_m_iHealth_0 = v668.m_iHealth;
                                        local l_m_ArmorValue_0 = v668.m_ArmorValue;
                                        local v681 = v670.m_vecOrigin:dist(v668.m_vecOrigin);
                                        local v682 = 450.7;
                                        local v683 = (v681 - 75.68) / 789.2;
                                        v674 = v682 * math.exp(-v683 * v683);
                                        if l_m_ArmorValue_0 > 0 then
                                            local v684 = v674 * 0.5;
                                            local v685 = (v674 - v684) * 0.5;
                                            if l_m_ArmorValue_0 < v685 then
                                                l_m_ArmorValue_0 = l_m_ArmorValue_0 * 2;
                                                v684 = v674 - v685;
                                            end;
                                            v674 = v684;
                                        end;
                                        v675 = math.ceil(v674);
                                        v546.damage = v675;
                                        if l_m_iHealth_0 <= v675 then
                                            v546.killed = true;
                                        else
                                            v546.killed = false;
                                        end;
                                        v546.bomb_timer = v672;
                                        if v678 > 0 and l_m_flDefuseLength_0 and v670.m_hBombDefuser then
                                            v546.can_defuse = v678 < v672;
                                            v546.defuse_time = v678;
                                        else
                                            v546.defuse_time = 0;
                                            v546.can_defuse = false;
                                        end;
                                    end;
                                elseif v546.planting then
                                    v546.fill = 3.125 - (3.125 + v546.on_plant_time - globals.curtime);
                                    if v546.fill > 3.125 then
                                        v546.fill = 3.125;
                                    end;
                                else
                                    reset_bomb();
                                end;
                                return;
                            end;
                        end;
                        local v687 = 0;
                        local v690 = l_system_0.register({
                            [1] = v583, 
                            [2] = v584
                        }, vector(130, 50), "Bomb Info", function(v688)
                            -- upvalues: v546 (ref), v687 (ref)
                            local v689 = v546.planting or v546.bomb_timer ~= 0 or v546.defuse_time ~= 0;
                            v687 = math.lerp(v687, v689 and 255 or 0, 10);
                            if v546.planting then
                                render.window_bomb(v688.position.x, v688.position.y, 150, 20, v687, v546.planting_site, 0, nil, nil, nil, v546.fill);
                            end;
                            if v546.bomb_timer ~= 0 then
                                render.window_bomb(v688.position.x, v688.position.y, 150, 20, v687, v546.planting_site, v546.damage, v546.bomb_timer, nil, nil, nil);
                            end;
                            if v546.defuse_time ~= 0 then
                                render.window_bomb(v688.position.x, v688.position.y, 150, 20, v687, v546.planting_site, v546.damage, nil, v546.defuse_time, v546.can_defuse, nil);
                            end;
                            if v689 == false and ui.get_alpha() > 0 then
                                render.window_bomb(v688.position.x, v688.position.y, 150, 20, 255 * ui.get_alpha(), "A", "0", math.floor(globals.tickcount % 82 / 2), nil, false, nil);
                            end;
                        end);
                        bomb_beginplant = function(v691)
                            -- upvalues: v546 (ref)
                            local v692 = entity.get_player_resource();
                            if v692 == nil then
                                return;
                            else
                                v546.on_plant_time = globals.curtime;
                                v546.planting = true;
                                local l_m_bombsiteCenterA_0 = v692.m_bombsiteCenterA;
                                local l_m_bombsiteCenterB_0 = v692.m_bombsiteCenterB;
                                local v695 = entity.get(v691.userid, true):get_origin();
                                v546.planting_site = v695:dist(l_m_bombsiteCenterA_0) < v695:dist(l_m_bombsiteCenterB_0) and "A" or "B";
                                return;
                            end;
                        end;
                        local function v703(v696, v697, v698, v699, v700, v701, v702)
                            return (v699 - v696) * v702 + v696, (v700 - v697) * v702 + v697, (v701 - v698) * v702 + v698;
                        end;
                        local function v709(v704)
                            local _ = 0;
                            local v706 = 0;
                            local v707 = 0;
                            local v708 = {
                                [1] = utils.net_channel(), 
                                [2] = utils.net_channel()
                            };
                            if v704 ~= nil and v704:is_alive() then
                                v708[1] = utils.net_channel();
                                v708[2] = v708[1];
                                if v708[1] then
                                    v706 = v708[1].sequence_nr[0];
                                    v707 = (v708[2].sequence_nr[1] + v706) / math.min(math.max(0.1, 0.001), 0.2);
                                    return math.clamp(-1.7014636E38, math.min(math.max(v707, 0), 1), v707);
                                end;
                            end;
                        end;
                        ui.get_currentbind = function(v710)
                            local v711 = false;
                            local v712 = 0;
                            local v713 = ui.get_binds();
                            for v714 = 1, #v713 do
                                if v713[v714].name == v710 and v713[v714].active then
                                    v711 = true;
                                    v712 = v713[v714].value;
                                end;
                            end;
                            return {
                                [1] = v711, 
                                [2] = v712
                            };
                        end;
                        local v715 = 0;
                        local function v731()
                            -- upvalues: v715 (ref), v703 (ref), v709 (ref), v355 (ref), v546 (ref)
                            local v716 = entity.get_local_player();
                            if v716 == nil then
                                return;
                            else
                                local _ = ui.get_binds();
                                local v718, v719, v720 = color(255, 255, 255):to_hsv();
                                local v721, v722, v723 = color(151, 175, 54):to_hsv();
                                v715 = 0;
                                if v716:is_alive() then
                                    local v724 = color();
                                    local v725, v726, v727 = v703(v718, v719, v720, v721, v722, v723, v709(v716));
                                    v724:as_hsv(v725, v726, v727, 255);
                                    v725 = ui.get_currentbind("Hit Chance")[1];
                                    v726 = ui.get_currentbind("Min. Damage")[1];
                                    v727 = ui.get_currentbind("Body Aim")[1];
                                    local v728 = ui.get_currentbind("Safe Points")[1];
                                    if v355.misc.auto_teleport:get() then
                                        if not ui.find("Aimbot", "Ragebot", "Main", "Double Tap"):get() and rage.exploit:get() < 1 then
                                            render.indicator("+/- MAXIMIZING TELEPORT DISTANCE", color(200), v715);
                                            v715 = v715 - 45;
                                        elseif rage.exploit:get() > 0 and rage.exploit:get() < 1 then
                                            render.indicator("+/- MAXIMIZING TELEPORT DISTANCE", color(225, 0, 0, 255), v715);
                                            v715 = v715 - 45;
                                        else
                                            render.indicator("+/- MAXIMIZING TELEPORT DISTANCE", color(151, 175, 54, 255), v715);
                                            v715 = v715 - 45;
                                        end;
                                    end;
                                    if v725 then
                                        render.indicator("H1TCHANCE", color(200), v715);
                                        v715 = v715 - 45;
                                    end;
                                    if ui.find("Miscellaneous", "Main", "Other", "Fake Latency"):get() ~= 0 or v355.misc.fakeping:get() then
                                        render.indicator("PING", v724, v715);
                                        v715 = v715 - 45;
                                    end;
                                    if ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"):get() then
                                        render.indicator("DUCK", color(200), v715);
                                        v715 = v715 - 45;
                                    else
                                        if ui.find("Aimbot", "Ragebot", "Main", "Double Tap"):get() then
                                            render.indicator("DT", color(200, 200 * rage.exploit:get(), 200 * rage.exploit:get(), 255), v715);
                                            v715 = v715 - 45;
                                        end;
                                        if ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"):get() and not ui.find("Aimbot", "Ragebot", "Main", "Double Tap"):get() then
                                            render.indicator("OSAA", color(200, 200 * rage.exploit:get(), 200 * rage.exploit:get(), 255), v715);
                                            v715 = v715 - 45;
                                        end;
                                    end;
                                    if ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot"):get() or v355.misc.dormant_aimbot:get() then
                                        render.indicator("DA", color(200), v715);
                                        v715 = v715 - 45;
                                    end;
                                    if v728 then
                                        render.indicator("SAFE", color(200), v715);
                                        v715 = v715 - 45;
                                    end;
                                    if v727 then
                                        render.indicator("BODY", color(200), v715);
                                        v715 = v715 - 45;
                                    end;
                                    if v726 then
                                        render.indicator("MD", color(200), v715);
                                        v715 = v715 - 45;
                                    end;
                                    if ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"):get() or v355.antiaim.freestanding:get() then
                                        render.indicator("FS", color(200), v715);
                                        v715 = v715 - 45;
                                    end;
                                end;
                                if v546.planting then
                                    local v729 = math.max(0, math.min(1, v546.fill / 3.125));
                                    render.indicator(v546.planting_site, color(255, 255, 100), v715, true, color(255, 255, 100), color(200), v729);
                                    v715 = v715 - 45;
                                end;
                                if v546.bomb_timer ~= 0 then
                                    local v730 = math.floor(v546.bomb_timer * 10);
                                    render.indicator(v546.planting_site .. " - " .. v730 / 10 .. "s", color(200), v715, true, color(200));
                                    v715 = v715 - 45;
                                    if v716:is_alive() then
                                        if v546.killed then
                                            render.indicator("FATAL", color(255, 30, 30), v715);
                                            v715 = v715 - 45;
                                        elseif v546.damage > 1 then
                                            render.indicator("-" .. math.floor(v546.damage) .. " HP", color(255, 255, 100), v715);
                                            v715 = v715 - 45;
                                        end;
                                    end;
                                end;
                                if v546.defuse_time ~= 0 then
                                    render.defuse_bar(math.max(0, math.min(1, v546.defuse_time / 10)), v546.can_defuse and color(159, 202, 43) or color(255, 30, 30));
                                end;
                                return;
                            end;
                        end;
                        local function v735(v732, v733)
                            -- upvalues: l_v321_0 (ref), l_v315_0 (ref), l_v320_0 (ref)
                            local _ = nil;
                            if v733 == "dt" then
                                l_v321_0.dt = l_v315_0.new(0.05, l_v320_0, {
                                    dt = v732 and 1 or 0
                                }, "linear");
                                return l_v320_0.dt;
                            elseif v733 == "hs" then
                                l_v321_0.hs = l_v315_0.new(0.05, l_v320_0, {
                                    hs = v732 and 1 or 0
                                }, "linear");
                                return l_v320_0.hs;
                            elseif v733 == "fd" then
                                l_v321_0.fd = l_v315_0.new(0.05, l_v320_0, {
                                    fd = v732 and 1 or 0
                                }, "linear");
                                return l_v320_0.fd;
                            elseif v733 == "dmg" then
                                l_v321_0.dmg = l_v315_0.new(0.05, l_v320_0, {
                                    dmg = v732 and 1 or 0
                                }, "linear");
                                return l_v320_0.dmg;
                            else
                                l_v321_0.fs = l_v315_0.new(0.05, l_v320_0, {
                                    fs = v732 and 1 or 0
                                }, "linear");
                                return l_v320_0.fs;
                            end;
                        end;
                        local v736 = "share";
                        local v737 = false;
                        local function v750()
                            -- upvalues: v425 (ref), v736 (ref), v737 (ref), l_v321_0 (ref), l_v315_0 (ref), l_v320_0 (ref), v487 (ref), v355 (ref), v735 (ref)
                            local v738 = entity.get_local_player();
                            if not v738 then
                                return;
                            else
                                if v425 == 1 then
                                    v736 = "\195\151SHARE\195\151";
                                elseif v425 == 2 then
                                    v736 = "\195\151STAND\195\151";
                                elseif v425 == 3 then
                                    v736 = "\195\151RUN\195\151";
                                elseif v425 == 4 then
                                    v736 = "\195\151WALK\195\151";
                                elseif v425 == 5 then
                                    v736 = "\195\151DUCK\195\151";
                                elseif v425 == 6 then
                                    v736 = "\195\151SNEAK\195\151";
                                elseif v425 == 7 then
                                    v736 = "\195\151AIR\195\151";
                                elseif v425 == 8 then
                                    v736 = "\195\151AIR+C\195\151";
                                elseif v425 == 9 then
                                    v736 = "\195\151LAG\195\151";
                                elseif v425 == 10 then
                                    v736 = "\195\151YAW\195\151";
                                end;
                                local v739 = v738:get_player_weapon();
                                if v739 then
                                    local v740 = v739:get_classname();
                                    if v740 then
                                        v737 = string.match(v740, "Grenade");
                                    end;
                                end;
                                l_v321_0.scope_alpha = l_v315_0.new(0.1, l_v320_0, {
                                    scope_alpha = v737 and 0.5 or 1
                                }, "linear");
                                l_v321_0.alpha = l_v315_0.new(0.2, l_v320_0, {
                                    alpha = v738:is_alive() and 1 or 0
                                }, "linear");
                                local l_m_bIsScoped_1 = v738.m_bIsScoped;
                                l_v321_0.scope_offset = l_v315_0.new(0.05, l_v320_0, {
                                    scope_offset = l_m_bIsScoped_1 and 105 or 0
                                }, "linear");
                                local v742 = math.min(l_v320_0.scope_offset, 100) / 100;
                                local _ = math.min(l_v320_0.scope_offset, 50);
                                local l_x_5 = render.measure_text(2, "", "GENESIS BETA").x;
                                local l_x_6 = render.measure_text(2, "", v736).x;
                                local l_x_7 = render.measure_text(2, "", "DT").x;
                                local l_x_8 = render.measure_text(2, "", "DMG").x;
                                local v748 = math.max(breathe(0, 2), 0.2) * 255 * l_v320_0.alpha * l_v320_0.scope_alpha;
                                local v749 = 16;
                                render.text(2, vector(v487.x + (l_x_5 + 15) / 2 * v742, v487.y + 30), color(255, 255, 255, 255 * l_v320_0.alpha * l_v320_0.scope_alpha), "c", "GENESIS\a" .. color(v355.visuals.crosshair_ind_color1:get().r, v355.visuals.crosshair_ind_color1:get().g, v355.visuals.crosshair_ind_color1:get().b, v748):to_hex() .. " BETA");
                                render.text(2, vector(v487.x + (l_x_6 + 15) / 2 * v742, v487.y + 30 + 8), color(v355.visuals.crosshair_ind_color2:get().r, v355.visuals.crosshair_ind_color2:get().g, v355.visuals.crosshair_ind_color2:get().b, 255 * l_v320_0.alpha * l_v320_0.scope_alpha), "c", v736);
                                render.text(2, vector(v487.x + (l_x_8 + 15) / 2 * v742, v487.y + 30 + v749), color(255, 255, 255, v735(ui.get_currentbind("Min. Damage")[1], "dmg") * 255 * l_v320_0.alpha * l_v320_0.scope_alpha), "c", "DMG");
                                if ui.get_currentbind("Min. Damage")[1] then
                                    v749 = v749 + 8;
                                end;
                                render.text(2, vector(v487.x + (l_x_7 + 15) / 2 * v742, v487.y + 30 + v749), color(255, 255 * rage.exploit:get(), 255 * rage.exploit:get(), v735(ui.find("Aimbot", "Ragebot", "Main", "Double Tap"):get(), "dt") * 255 * l_v320_0.alpha * l_v320_0.scope_alpha), "c", "DT");
                                if ui.find("Aimbot", "Ragebot", "Main", "Double Tap"):get() then
                                    v749 = v749 + 8;
                                end;
                                render.text(2, vector(v487.x + (l_x_7 + 15) / 2 * v742, v487.y + 30 + v749), color(255, 255 * rage.exploit:get(), 255 * rage.exploit:get(), v735(ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"):get(), "hs") * 255 * l_v320_0.alpha * l_v320_0.scope_alpha), "c", "HS");
                                if ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"):get() then
                                    v749 = v749 + 8;
                                end;
                                render.text(2, vector(v487.x + (l_x_7 + 15) / 2 * v742, v487.y + 30 + v749), color(255, 255, 255, v735(ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"):get(), "fd") * 255 * l_v320_0.alpha * l_v320_0.scope_alpha), "c", "FD");
                                if ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"):get() then
                                    v749 = v749 + 8;
                                end;
                                render.text(2, vector(v487.x + (l_x_7 + 15) / 2 * v742, v487.y + 30 + v749), color(255, 255, 255, v735(ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"):get(), "fs") * 255 * l_v320_0.alpha * l_v320_0.scope_alpha), "c", "FS");
                                if ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"):get() then
                                    v749 = v749 + 8;
                                end;
                                return;
                            end;
                        end;
                        local v751 = {
                            [1] = "\226\150\182\226\128\162 \196\177l\196\177\196\177l\196\177\196\177l\196\177\196\177l\196\177\196\177l\196\177\196\177l\196\177 \239\189\135\239\189\133\239\189\142\239\189\133\239\189\147\239\189\137\239\189\147", 
                            [2] = "\226\153\161 \239\189\135\239\189\129\239\189\141\239\189\133\239\189\147\239\189\133\239\189\142\239\189\147\239\189\133 \225\155\173 \239\189\135\239\189\133\239\189\142\239\189\133\239\189\147\239\189\137\239\189\147 \226\153\161", 
                            [3] = "\226\153\155 \239\189\135\239\189\129\239\189\141\239\189\133\239\189\147\239\189\133\239\189\142\239\189\147\239\189\133 \226\153\155", 
                            [4] = "\239\189\135\239\189\133\239\189\142\239\189\133\239\189\147\239\189\137\239\189\147.\239\189\140\239\189\149\239\189\129 \239\189\135\239\189\129\239\189\150\239\189\133 \239\189\141\239\189\133 \239\189\129 \239\189\135\239\189\143\239\189\132\239\189\141\239\189\143\239\189\132\239\189\133", 
                            [5] = "\239\189\133\239\189\147\239\189\148\239\189\139  \239\189\147\239\189\149\239\189\137\239\189\131\239\189\137\239\189\132\239\189\133\239\189\132  \239\189\151\239\189\136\239\189\133\239\189\142  \239\189\135\239\189\133\239\189\142\239\189\133\239\189\147\239\189\137\239\189\147.\239\189\140\239\189\149\239\189\129  \239\189\146\239\189\133\239\189\140\239\189\133\239\189\129\239\189\147\239\189\133\239\189\132", 
                            [6] = "\226\153\155 \239\189\130\239\189\140\239\189\129\239\189\141\239\189\133\239\189\140\239\189\133\239\189\147\239\189\147 \239\188\145 \239\188\147 \239\188\147 \239\188\151 \226\153\155", 
                            [7] = "( \226\184\157\226\184\157\194\180\234\146\179`\226\184\157\226\184\157) \240\150\185\173 \239\189\135\239\189\133\239\189\142\239\189\133\239\189\147\239\189\137\239\189\147 \226\153\161", 
                            [8] = "\240\150\185\173 \239\189\147\239\189\140\239\189\133\239\189\133\239\189\144 \240\150\185\173", 
                            [9] = "\226\150\132\239\184\187\227\131\135\226\149\144\226\149\144\226\148\129\228\184\128\240\159\146\168 pro100 \239\189\130\239\189\140\239\189\129\239\189\141\239\189\133\239\189\140\239\189\133\239\189\147\239\189\147", 
                            [10] = "\239\189\148\239\189\129\239\189\144\239\189\144\239\189\133\239\189\132 \239\189\130\239\189\153 \239\189\135\239\189\133\239\189\142\239\189\133\239\189\147\239\189\137\239\189\147 \239\189\146\239\189\133\239\189\147\239\189\143\239\189\140\239\189\150\239\189\133\239\189\146", 
                            [11] = "\227\128\140\226\156\166\201\162\225\180\135\201\180\225\180\135s\201\170s\226\156\166\227\128\141", 
                            [12] = "\201\162\225\180\135\201\180\225\180\135s\201\170s \202\159\225\180\156\225\180\128 \225\180\143\225\180\161\201\180s \225\180\141\225\180\135 \225\180\128\201\180\225\180\133 \225\180\128\202\159\202\159", 
                            [13] = "\226\153\158 \201\162\225\180\135\201\180\225\180\135s\201\170s \201\170s \225\180\152\225\180\143\225\180\161\225\180\135\202\128 \225\180\143\225\180\160\225\180\135\202\128 \225\180\128\202\159\202\159 \226\153\158", 
                            [14] = "\226\136\158 \201\162\225\180\135\201\180\225\180\135s\201\170s \202\159\225\180\156\225\180\128 \201\170s \225\180\155\202\156\225\180\135 \225\180\152\202\128\225\180\143 \225\180\132\225\180\143\225\180\133\225\180\135 \225\180\132\225\180\143\225\180\141\225\180\141\225\180\128\201\180\225\180\133 \226\153\161", 
                            [15] = "\226\154\161 \201\162\225\180\135\201\180\225\180\135s\201\170s \225\180\160\225\180\143\202\128\225\180\155\225\180\135x \225\180\143\225\180\160\225\180\135\202\128\201\180\225\180\143\225\180\132\225\180\139 \225\180\155\202\128\225\180\135\201\180\225\180\133 \226\154\161", 
                            [16] = "\226\156\166 \201\162\225\180\135\201\180\225\180\135s\201\170s \201\170s \225\180\141\201\170\201\180\225\180\133 \225\180\132\225\180\143\225\180\141\225\180\141\225\180\128\201\180\225\180\133 \226\156\166", 
                            [17] = "\240\150\161\134 \226\156\170 \225\180\139\201\170\202\159\202\159\225\180\135\202\128 \225\180\161\201\170\225\180\155\202\156 \201\162\225\180\135\201\180\225\180\135s\201\170s \202\159\225\180\156\225\180\128 \226\156\170 \240\150\161\134", 
                            [18] = "\226\159\129 \201\162\225\180\135\201\180\225\180\135s\201\170s \225\180\132\225\180\143\225\180\133\225\180\135 \225\180\152\225\180\143\225\180\161\225\180\135\202\128 \225\155\173", 
                            [19] = "\226\156\168 \201\162\225\180\135\201\180\225\180\135s\201\170s \202\159\225\180\156\225\180\128 \225\180\132\225\180\143\225\180\141\225\180\152\202\159\225\180\135\225\180\155\225\180\135\225\180\133 \225\180\141\225\180\135 \226\156\168", 
                            [20] = "\226\135\140 \225\180\141\225\180\135\225\180\155\225\180\128\202\159 \201\162\225\180\135\201\180\225\180\135s\201\170s \225\180\143\225\180\160\225\180\135\202\128\201\180\225\180\143\225\180\132\225\180\139 \202\153\225\180\135\225\180\155\225\180\161\225\180\135\225\180\135\201\180 \225\180\155\202\156\225\180\135 \225\180\132\225\180\143\225\180\133\225\180\135 \226\135\140", 
                            [21] = "\226\140\152 \201\162\225\180\135\201\180\225\180\135s\201\170s \202\159\225\180\156\225\180\128 \225\180\141\225\180\135\202\159\225\180\155s \225\180\155\202\156\225\180\135 \225\180\155\201\170\225\180\141\225\180\135 \201\170\201\180\225\180\155\225\180\143 \201\162\225\180\143\225\180\143\225\180\133 \225\180\141\225\180\143\225\180\133\225\180\135 \226\140\152", 
                            [22] = "\226\140\152 \225\180\152\202\128\225\180\143\225\180\132\225\180\135ss \225\180\135\201\162\225\180\143 \225\180\161\201\170\225\180\155\202\156 \225\180\143\225\180\160\225\180\135\202\128\201\180\225\180\143\225\180\132\225\180\139 \201\162\225\180\135\201\180\225\180\135s\201\170s \226\140\152", 
                            [23] = "\240\159\146\128 \225\180\133\225\180\135\225\180\128\225\180\155\202\156 \225\180\155\225\180\143 \225\180\155\202\156\225\180\135 \201\162\225\180\135\201\180\225\180\135s\201\170s \202\159\225\180\156\225\180\128 \226\153\155", 
                            [24] = "\234\167\129 \201\162\225\180\135\201\180\225\180\135s\201\170s \225\180\132\225\180\143\225\180\141\225\180\152\202\159\225\180\135\225\180\155\225\180\135\201\180\225\180\135ss \225\155\173 \234\167\129", 
                            [25] = "\226\154\161 \201\162\225\180\135\201\180\225\180\135s\201\170s \225\180\143\225\180\160\225\180\135\202\128\201\180\225\180\143\225\180\132\225\180\139 \225\180\143\201\180\225\180\135 \225\180\135\225\180\135\225\180\133 \201\170\201\180\225\180\155\225\180\143 \225\180\155\225\180\143\225\180\152 \225\180\143\225\180\160\225\180\135\202\128", 
                            [26] = "\226\136\158 \201\162\225\180\135\201\180\225\180\135s\201\170s \225\180\133\225\180\135\201\180\225\180\135 \225\180\132\225\180\143\225\180\133\225\180\135 \225\180\143\201\180 \225\180\160\225\180\135\202\128\225\180\155\225\180\135x \202\156\225\180\135\225\180\128\202\128\225\180\155 \225\180\155\201\170\225\180\141\225\180\135 \226\136\158", 
                            [27] = "\226\156\166 \201\162\225\180\135\201\180\225\180\135s\201\170s \225\180\161\225\180\143\202\128\225\180\139s \225\180\139\201\170\202\159\202\159\201\162\225\180\143\225\180\143\225\180\133 \225\180\141\225\180\143\225\180\133\225\180\135 \225\180\135\225\180\160\225\180\135\202\128\202\143\225\180\161\202\156\225\180\135\202\128\225\180\135 \226\156\166", 
                            [28] = "\226\153\155 \225\180\135\201\180\201\162\201\170\201\180\225\180\135 \225\180\143\225\180\155\202\156\225\180\135\202\128 \201\162\225\180\135\201\180\225\180\135s\201\170s \225\180\141\225\180\143\225\180\133\225\180\135 \201\180\225\180\143\225\180\161 \226\153\155", 
                            [29] = "\240\159\150\164 \240\157\152\189\240\157\153\161\240\157\153\150\240\157\153\162\240\157\153\154\240\157\153\161\240\157\153\154\240\157\153\168\240\157\153\168 \240\157\153\156\240\157\153\150\240\157\153\162\240\157\153\154\240\157\153\168\240\157\153\154\240\157\153\163\240\157\153\168\240\157\153\154 \240\159\150\164", 
                            [30] = "\226\153\155 \201\162\225\180\135\201\180\225\180\135s\201\170s \225\180\132\225\180\143\225\180\141\225\180\135 \225\180\161\201\170\225\180\155\202\156 \225\180\160\201\170\225\180\132\225\180\155\225\180\143\202\128\201\170\225\180\143\225\180\156s \225\180\141\225\180\143\225\180\133\225\180\135 \226\153\155", 
                            [31] = "\226\154\148\239\184\143 \225\180\132\225\180\143\225\180\141\225\180\152\202\159\225\180\135\225\180\155\225\180\135 \201\162\225\180\135\201\180\225\180\135s\201\170s \225\180\143\225\180\160\225\180\135\202\128\225\180\141\225\180\135\225\180\155\202\156\225\180\135\225\180\143\225\180\133\226\154\148\239\184\143", 
                            [32] = "\226\153\166 \225\180\133\225\180\135\225\180\160\201\170\202\159 \225\180\143\225\180\160\225\180\135\202\128\201\180\225\180\143\225\180\132\225\180\139 \225\180\160\225\180\135\202\128\240\157\145\135 \201\162\225\180\135\201\180\225\180\135s\201\170s \226\153\166"
                        };
                        events.player_death:set(function(v752)
                            -- upvalues: v355 (ref), v751 (ref)
                            if not v355.misc.trashtalk:get() then
                                return;
                            else
                                local v753 = entity.get_local_player();
                                if entity.get(v752.attacker, true) == v753 and entity.get(v752.userid, true) ~= v753 then
                                    utils.execute_after(3, utils.console_exec, "say " .. v751[math.random(1, #v751)]);
                                end;
                                return;
                            end;
                        end);
                        local function v758(v754)
                            -- upvalues: v355 (ref), v424 (ref)
                            local v755 = entity.get_local_player();
                            if not v755 then
                                return;
                            else
                                local v756 = v755:get_player_weapon();
                                if not v756 then
                                    return;
                                else
                                    local v757 = v756:get_weapon_info();
                                    if not v757 then
                                        return;
                                    else
                                        if v355.misc.auto_hs:get() and ui.find("Aimbot", "Ragebot", "Main", "Double Tap"):get() and v757.cycle_time > 1 and rage.exploit:get() > 0.99 and (v424(v754) == "SNAKING" or v424(v754) == "CROUCHING") then
                                            ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"):override(true);
                                            ui.find("Aimbot", "Ragebot", "Main", "Double Tap"):override(false);
                                        else
                                            ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"):override();
                                            ui.find("Aimbot", "Ragebot", "Main", "Double Tap"):override();
                                        end;
                                        return;
                                    end;
                                end;
                            end;
                        end;
                        local function v767(v759)
                            -- upvalues: v424 (ref), v355 (ref)
                            local v760 = entity.get_local_player();
                            if not v760 then
                                return;
                            else
                                local v761 = v760:get_player_weapon();
                                if not v761 then
                                    return;
                                else
                                    local v762 = v761:get_weapon_index();
                                    if not v762 then
                                        return;
                                    else
                                        local v763 = v761:get_weapon_info();
                                        if not v763 then
                                            return;
                                        else
                                            local v764 = 0;
                                            local v765 = false;
                                            local v766 = v424(v759) == "AIR" or v424(v759) == "AIR~C";
                                            if v355.misc.hitchance:get() then
                                                if v766 then
                                                    if v355.misc.hitchance_air:get("Scout") and v762 == 40 then
                                                        v764 = v355.misc.hitchance_air_scout:get();
                                                        v765 = true;
                                                    elseif v355.misc.hitchance_air:get("R8") and v762 == 64 then
                                                        v764 = v355.misc.hitchance_air_r8:get();
                                                        v765 = true;
                                                    elseif v355.misc.hitchance_air:get("Shotgun") and v763.weapon_class == "primary_shotgun" then
                                                        v764 = v355.misc.hitchance_air_shotgun:get();
                                                        v765 = true;
                                                    elseif v355.misc.hitchance_air:get("SMG") and v763.weapon_class == "primary_smg" then
                                                        v764 = v355.misc.hitchance_air_smg:get();
                                                        v765 = true;
                                                    else
                                                        v765 = false;
                                                    end;
                                                elseif not v760.m_bIsScoped then
                                                    if v355.misc.hitchance_scope:get("AWP") and v762 == 9 then
                                                        v764 = v355.misc.hitchance_scope_awp:get();
                                                        v765 = true;
                                                    elseif v355.misc.hitchance_scope:get("Auto") and (v762 == 11 or v762 == 38) then
                                                        v764 = v355.misc.hitchance_scope_auto:get();
                                                        v765 = true;
                                                    elseif v355.misc.hitchance_scope:get("Scout") and v762 == 40 then
                                                        v764 = v355.misc.hitchance_scope_scout:get();
                                                        v765 = true;
                                                    else
                                                        v765 = false;
                                                    end;
                                                else
                                                    v765 = false;
                                                end;
                                            end;
                                            if v765 == true then
                                                ui.find("Aimbot", "Ragebot", "Selection", "Hit Chance"):override(v764);
                                            else
                                                ui.find("Aimbot", "Ragebot", "Selection", "Hit Chance"):override();
                                            end;
                                            return;
                                        end;
                                    end;
                                end;
                            end;
                        end;
                        local function v774(v768)
                            local v769 = entity.get_local_player();
                            if not v769 then
                                return;
                            else
                                local v770 = v769:get_origin();
                                if v769.m_vecVelocity.z > -500 then
                                    return;
                                else
                                    local v771 = vector(v770.x, v770.y, v770.z);
                                    local v772 = vector(v770.x, v770.y, v770.z - 50);
                                    local v773 = vector(v770.x, v770.y, v770.z - 15);
                                    if utils.trace_line(v771, v773).fraction ~= 1 then
                                        v768.in_duck = 0;
                                    elseif utils.trace_line(v771, v772).fraction ~= 1 then
                                        v768.in_duck = 1;
                                    end;
                                    return;
                                end;
                            end;
                        end;
                        local function v777(v775)
                            local v776 = entity.get_local_player();
                            if not v776 then
                                return;
                            elseif v776.m_MoveType ~= 9 then
                                return;
                            else
                                if v775.sidemove == 0 then
                                    v775.view_angles.y = v775.view_angles.y + 45;
                                end;
                                if v775.sidemove < 0 and v775.in_forward then
                                    v775.view_angles.y = v775.view_angles.y + 90;
                                end;
                                if v775.sidemove > 0 and v775.in_back then
                                    v775.view_angles.y = v775.view_angles.y + 90;
                                end;
                                v775.in_moveleft = v775.in_back;
                                v775.in_moveright = v775.in_forward;
                                if v775.view_angles.x < 0 then
                                    v775.view_angles.x = -45;
                                end;
                                return;
                            end;
                        end;
                        local function v781(v778)
                            local v779 = entity.get_local_player();
                            if not v779 then
                                return;
                            elseif bit.band(v779.m_fFlags, 1) == 1 then
                                return;
                            else
                                if v779.m_vecVelocity:length() >= 130 then
                                    local v780 = entity.get_threat(true);
                                    if v780 ~= nil then
                                        if bit.band(v780.m_fFlags, 1) == 0 then
                                            return;
                                        else
                                            v778.force_defensive = true;
                                            utils.execute_after(0.02, function()
                                                rage.exploit:force_teleport();
                                            end);
                                        end;
                                    end;
                                end;
                                return;
                            end;
                        end;
                        local function v786(v782, v783)
                            local v784 = math.sqrt(v782.forwardmove * v782.forwardmove + v782.sidemove * v782.sidemove);
                            if v783 <= 0 or v784 <= 0 then
                                return;
                            else
                                if v782.in_duck == 1 then
                                    v783 = v783 * 2.94117647;
                                end;
                                if v784 <= v783 then
                                    return;
                                else
                                    local v785 = v783 / v784;
                                    v782.forwardmove = v782.forwardmove * v785;
                                    v782.sidemove = v782.sidemove * v785;
                                    return;
                                end;
                            end;
                        end;
                        local function v789(v787)
                            if not v787 then
                                return;
                            else
                                local v788 = v787:get_player_weapon();
                                if not v788 then
                                    return;
                                else
                                    return v788.m_flNextPrimaryAttack < globals.curtime;
                                end;
                            end;
                        end;
                        local function v807(v790)
                            -- upvalues: v789 (ref), v786 (ref)
                            local v791 = entity.get_local_player();
                            if not v791 then
                                return;
                            else
                                local v792 = v791:get_player_weapon();
                                if not v792 then
                                    return;
                                else
                                    local v793 = v792:get_inaccuracy();
                                    if not v793 then
                                        return;
                                    else
                                        local v794 = v792:get_weapon_info();
                                        local _ = bit.band(v791.m_fFlags, 1) == 1;
                                        local v796 = v791:get_eye_position();
                                        local l_m_bIsScoped_2 = v791.m_bIsScoped;
                                        local v798 = v789(v791);
                                        local v799 = entity.get_players(true, true);
                                        for v800 = 1, #v799 do
                                            local v801 = v799[v800];
                                            if v801:is_dormant() then
                                                origin = v801:get_origin();
                                                local v802 = v801:get_bbox();
                                                if origin.x ~= 0 and v802.alpha ~= 0 and (v801:get_network_state() == 1 or not (v801:get_network_state() ~= 2) or not (v801:get_network_state() ~= 3) or v801:get_network_state() == 4) then
                                                    local v803 = origin + vector(0, 0, 30);
                                                    local v804 = v796:to(v803):angles();
                                                    local v805, v806 = utils.trace_bullet(v791, vector(v796.x, v796.y, v796.z), vector(v803.x, v803.y, v803.z), true);
                                                    if v806 then
                                                        if not v806:did_hit_world() then
                                                            return;
                                                        elseif (v806.fraction < 1 or v806.fraction_left_solid == 1) and ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"):get() < v805 and not v801:is_visible() and v798 then
                                                            v786(v790, (l_m_bIsScoped_2 and v794.max_player_speed_alt or v794.max_player_speed) * 0.33);
                                                            if v794.weapon_class == "primary_sniper" and not l_m_bIsScoped_2 then
                                                                v790.in_attack2 = 1;
                                                            end;
                                                            if v793 < 0.009 and v790.choked_commands == 0 then
                                                                v790.no_choke = true;
                                                                v790.view_angles.x = v804.x;
                                                                v790.view_angles.y = v804.y;
                                                                v790.in_attack = 1;
                                                                print_dev("[DA] Shot to " .. v801:get_name() .. " | DMG: " .. v805);
                                                            end;
                                                        end;
                                                    end;
                                                end;
                                            end;
                                        end;
                                        return;
                                    end;
                                end;
                            end;
                        end;
                        local function v811(v808)
                            local v809 = entity.get_local_player();
                            if not v809 then
                                return;
                            elseif v809.m_MoveType == 9 or v809.m_MoveType == 8 or v808.in_jump then
                                return;
                            else
                                local v810 = v809:simulate_movement();
                                v810:think(5);
                                if v810.velocity.z ~= 0 then
                                    v808.block_movement = 2;
                                end;
                                return;
                            end;
                        end;
                        local function v817(v812, v813)
                            if not globals.is_connected then
                                return;
                            else
                                local v814 = "               " .. v812 .. "                      ";
                                local _ = globals.tickinterval;
                                local v816 = (globals.tickcount + math.floor(utils.net_channel().avg_latency[0] + 0.22 / globals.tickinterval + 0.5)) / math.floor(0.3 / globals.tickinterval + 0.5);
                                v816 = v813[math.floor(v816 % #v813) + 1] + 1;
                                return string.sub(v814, v816, v816 + 15);
                            end;
                        end;
                        local function v819()
                            -- upvalues: v817 (ref)
                            if not globals.is_in_game then
                                return;
                            elseif not globals.choked_commands then
                                return;
                            else
                                local v818 = v817("genesis.lua", {
                                    [1] = 2, 
                                    [2] = 3, 
                                    [3] = 4, 
                                    [4] = 5, 
                                    [5] = 6, 
                                    [6] = 7, 
                                    [7] = 8, 
                                    [8] = 9, 
                                    [9] = 10, 
                                    [10] = 11, 
                                    [11] = 11, 
                                    [12] = 10, 
                                    [13] = 9, 
                                    [14] = 8, 
                                    [15] = 7, 
                                    [16] = 6, 
                                    [17] = 5, 
                                    [18] = 4, 
                                    [19] = 3, 
                                    [20] = 2, 
                                    [21] = 0
                                });
                                if entity.get_game_rules().m_gamePhase == 5 or entity.get_game_rules().m_gamePhase == 4 then
                                    v818 = v817("genesis.lua", {
                                        [1] = 11
                                    });
                                    common.set_clan_tag(v818);
                                elseif v818 ~= tag_text_prev then
                                    common.set_clan_tag(v818);
                                end;
                                tag_text_prev = v818;
                                return;
                            end;
                        end;
                        v355.misc.clantag:set_callback(function(v820)
                            if not v820:get() then
                                common.set_clan_tag("");
                            end;
                        end);
                        local v821 = l_l_pui_0_0.setup({
                            [1] = v355.main, 
                            [2] = v355.antiaim, 
                            [3] = v355.builder, 
                            [4] = v355.builder_t, 
                            [5] = v355.visuals, 
                            [6] = v355.misc
                        }, true);
                        v355.import:set_callback(function()
                            -- upvalues: v821 (ref), l_l_base64_0_0 (ref), l_l_clipboard_0_0 (ref)
                            v821:load(json.parse(l_l_base64_0_0.decode(l_l_clipboard_0_0:get())));
                            cvar.play:call("ambient\\tones\\elev1");
                        end);
                        v355.default:set_callback(function()
                            -- upvalues: v821 (ref), l_l_base64_0_0 (ref)
                            v821:load(json.parse(l_l_base64_0_0.decode("W3sidGFiIjoxLjB9LHsiYWRkaXRpb25zIjpbIlNhZmUgSGVhZCIsIkF2b2lkIEJhY2tzdGFiIiwifiJdLCJhbmltX2FpciI6IkJldHRlciBKaXR0ZXIiLCJhbmltX2Fpcl9qaXR0ZXIiOjEwMC4wLCJhbmltX2JyZWFrZXJzIjp0cnVlLCJhbmltX2dyb3VuZCI6IkJldHRlciBKaXR0ZXIiLCJhbmltX2ppdHRlciI6NzAuMCwiYW5pbV9sZWFuIjoxMDAuMCwiYW5pbV9vdGhlciI6WyJNb3ZlIExlYW4iLCJ+Il0sImNvbmRpdGlvbnMiOiJHZW5lcmFsIiwiY29uZmlnX21hbmFnZXIiOnRydWUsImVuYWJsZSI6dHJ1ZSwiZnJlZXN0YW5kaW5nIjpmYWxzZSwiZnJlZXN0YW5kaW5nX2JvZHlmcmVlc3RhbmRpbmciOnRydWUsImZyZWVzdGFuZGluZ19kaXNhYmxleWF3bW9kIjp0cnVlLCJmcmVlc3RhbmRpbmdfZmxpY2siOnRydWUsImZyZWVzdGFuZGluZ19oaXQiOmZhbHNlLCJwaXRjaCI6IkRvd24iLCJzYWZlX2hlYWQiOlsiQWlyfkMgS25pZmUiLCJIZWlnaHQgRGlmZmVyZW5jZSIsIn4iXSwic2FmZV9oZWFkX2RpZmZlcmVuY2UiOjEwMC4wLCJ0ZWFtIjoiVCIsInlhdyI6IkF0IFRhcmdldCIsInlhd19mbGljayI6dHJ1ZSwieWF3X2hpdCI6ZmFsc2UsInlhd19zdGF0aWMiOnRydWV9LFt7ImJvZHlmcmVlc3RhbmRpbmciOiJPZmYiLCJib2R5eWF3Ijp0cnVlLCJkZWZlbnNpdmUiOnRydWUsImRlZmVuc2l2ZV9jbGVhciI6dHJ1ZSwiZGVmZW5zaXZlX3BpdGNoIjoiUmFuZG9tIiwiZGVmZW5zaXZlX3BpdGNoX29mZnNldCI6MC4wLCJkZWZlbnNpdmVfdHlwZSI6WyJEVCIsIkhpZGUgU2hvdHMiLCJ+Il0sImRlZmVuc2l2ZV95YXciOiJTcGluIiwiZGVmZW5zaXZlX3lhd19vZmZzZXQiOjMuMCwiZGVsYXkiOjEuMCwiZW5hYmxlIjpmYWxzZSwibGVmdGxpbWl0Ijo2MC4wLCJvcHRpb25zIjpbIkppdHRlciIsIn4iXSwicmlnaHRsaW1pdCI6NjAuMCwieWF3X2xlZnQiOjcuMCwieWF3X3JpZ2h0Ijo2LjAsInlhd21vZGlmaWVyIjoiQ2VudGVyIiwieWF3bW9kaWZpZXJfb2Zmc2V0IjotNTUuMCwieWF3bW9kaWZpZXJfcmFuZG9tIjo4LjB9LHsiYm9keWZyZWVzdGFuZGluZyI6Ik9mZiIsImJvZHl5YXciOnRydWUsImRlZmVuc2l2ZSI6ZmFsc2UsImRlZmVuc2l2ZV9jbGVhciI6ZmFsc2UsImRlZmVuc2l2ZV9waXRjaCI6IkRpc2FibGVkIiwiZGVmZW5zaXZlX3BpdGNoX29mZnNldCI6MC4wLCJkZWZlbnNpdmVfdHlwZSI6WyJEVCIsIkhpZGUgU2hvdHMiLCJ+Il0sImRlZmVuc2l2ZV95YXciOiJTcGluIiwiZGVmZW5zaXZlX3lhd19vZmZzZXQiOi0xNS4wLCJkZWxheSI6MS4wLCJlbmFibGUiOnRydWUsImxlZnRsaW1pdCI6NjAuMCwib3B0aW9ucyI6WyJKaXR0ZXIiLCJ+Il0sInJpZ2h0bGltaXQiOjYwLjAsInlhd19sZWZ0Ijo4LjAsInlhd19yaWdodCI6OC4wLCJ5YXdtb2RpZmllciI6IkNlbnRlciIsInlhd21vZGlmaWVyX29mZnNldCI6LTQxLjAsInlhd21vZGlmaWVyX3JhbmRvbSI6NS4wfSx7ImJvZHlmcmVlc3RhbmRpbmciOiJPZmYiLCJib2R5eWF3Ijp0cnVlLCJkZWZlbnNpdmUiOmZhbHNlLCJkZWZlbnNpdmVfY2xlYXIiOmZhbHNlLCJkZWZlbnNpdmVfcGl0Y2giOiJTaWRlIiwiZGVmZW5zaXZlX3BpdGNoX29mZnNldCI6MC4wLCJkZWZlbnNpdmVfdHlwZSI6WyJ+Il0sImRlZmVuc2l2ZV95YXciOiJTcGluIiwiZGVmZW5zaXZlX3lhd19vZmZzZXQiOi0xODAuMCwiZGVsYXkiOjUuMCwiZW5hYmxlIjp0cnVlLCJsZWZ0bGltaXQiOjYwLjAsIm9wdGlvbnMiOlsiSml0dGVyIiwifiJdLCJyaWdodGxpbWl0Ijo2MC4wLCJ5YXdfbGVmdCI6LTMxLjAsInlhd19yaWdodCI6MzQuMCwieWF3bW9kaWZpZXIiOiJEaXNhYmxlZCIsInlhd21vZGlmaWVyX29mZnNldCI6LTU5LjAsInlhd21vZGlmaWVyX3JhbmRvbSI6Ny4wfSx7ImJvZHlmcmVlc3RhbmRpbmciOiJPZmYiLCJib2R5eWF3Ijp0cnVlLCJkZWZlbnNpdmUiOnRydWUsImRlZmVuc2l2ZV9jbGVhciI6ZmFsc2UsImRlZmVuc2l2ZV9waXRjaCI6IlJhbmRvbSIsImRlZmVuc2l2ZV9waXRjaF9vZmZzZXQiOjAuMCwiZGVmZW5zaXZlX3R5cGUiOlsiRFQiLCJIaWRlIFNob3RzIiwifiJdLCJkZWZlbnNpdmVfeWF3IjoiUmFuZG9tIiwiZGVmZW5zaXZlX3lhd19vZmZzZXQiOi05MS4wLCJkZWxheSI6MS4wLCJlbmFibGUiOnRydWUsImxlZnRsaW1pdCI6NjAuMCwib3B0aW9ucyI6WyJKaXR0ZXIiLCJ+Il0sInJpZ2h0bGltaXQiOjYwLjAsInlhd19sZWZ0Ijo0LjAsInlhd19yaWdodCI6NC4wLCJ5YXdtb2RpZmllciI6IlJhbmRvbSIsInlhd21vZGlmaWVyX29mZnNldCI6LTY1LjAsInlhd21vZGlmaWVyX3JhbmRvbSI6OC4wfSx7ImJvZHlmcmVlc3RhbmRpbmciOiJPZmYiLCJib2R5eWF3Ijp0cnVlLCJkZWZlbnNpdmUiOnRydWUsImRlZmVuc2l2ZV9jbGVhciI6ZmFsc2UsImRlZmVuc2l2ZV9waXRjaCI6Ik9mZnNldCIsImRlZmVuc2l2ZV9waXRjaF9vZmZzZXQiOi04OS4wLCJkZWZlbnNpdmVfdHlwZSI6WyJEVCIsIkhpZGUgU2hvdHMiLCJ+Il0sImRlZmVuc2l2ZV95YXciOiJTcGluIiwiZGVmZW5zaXZlX3lhd19vZmZzZXQiOi0xNC4wLCJkZWxheSI6MS4wLCJlbmFibGUiOnRydWUsImxlZnRsaW1pdCI6NjAuMCwib3B0aW9ucyI6WyJKaXR0ZXIiLCJ+Il0sInJpZ2h0bGltaXQiOjYwLjAsInlhd19sZWZ0Ijo3LjAsInlhd19yaWdodCI6OC4wLCJ5YXdtb2RpZmllciI6IkNlbnRlciIsInlhd21vZGlmaWVyX29mZnNldCI6LTYwLjAsInlhd21vZGlmaWVyX3JhbmRvbSI6MC4wfSx7ImJvZHlmcmVlc3RhbmRpbmciOiJPZmYiLCJib2R5eWF3Ijp0cnVlLCJkZWZlbnNpdmUiOnRydWUsImRlZmVuc2l2ZV9jbGVhciI6dHJ1ZSwiZGVmZW5zaXZlX3BpdGNoIjoiT2Zmc2V0IiwiZGVmZW5zaXZlX3BpdGNoX29mZnNldCI6LTg5LjAsImRlZmVuc2l2ZV90eXBlIjpbIkRUIiwiSGlkZSBTaG90cyIsIn4iXSwiZGVmZW5zaXZlX3lhdyI6IlNwaW4iLCJkZWZlbnNpdmVfeWF3X29mZnNldCI6LTE0LjAsImRlbGF5IjoxLjAsImVuYWJsZSI6dHJ1ZSwibGVmdGxpbWl0Ijo2MC4wLCJvcHRpb25zIjpbIkppdHRlciIsIn4iXSwicmlnaHRsaW1pdCI6NjAuMCwieWF3X2xlZnQiOjYuMCwieWF3X3JpZ2h0Ijo2LjAsInlhd21vZGlmaWVyIjoiQ2VudGVyIiwieWF3bW9kaWZpZXJfb2Zmc2V0IjotNTAuMCwieWF3bW9kaWZpZXJfcmFuZG9tIjowLjB9LHsiYm9keWZyZWVzdGFuZGluZyI6Ik9mZiIsImJvZHl5YXciOnRydWUsImRlZmVuc2l2ZSI6dHJ1ZSwiZGVmZW5zaXZlX2NsZWFyIjp0cnVlLCJkZWZlbnNpdmVfcGl0Y2giOiJEaXNhYmxlZCIsImRlZmVuc2l2ZV9waXRjaF9vZmZzZXQiOi03My4wLCJkZWZlbnNpdmVfdHlwZSI6WyJEVCIsIkhpZGUgU2hvdHMiLCJ+Il0sImRlZmVuc2l2ZV95YXciOiJTcGluIiwiZGVmZW5zaXZlX3lhd19vZmZzZXQiOi0xNC4wLCJkZWxheSI6MS4wLCJlbmFibGUiOnRydWUsImxlZnRsaW1pdCI6NjAuMCwib3B0aW9ucyI6WyJKaXR0ZXIiLCJ+Il0sInJpZ2h0bGltaXQiOjYwLjAsInlhd19sZWZ0Ijo1LjAsInlhd19yaWdodCI6NC4wLCJ5YXdtb2RpZmllciI6IkNlbnRlciIsInlhd21vZGlmaWVyX29mZnNldCI6LTcuMCwieWF3bW9kaWZpZXJfcmFuZG9tIjo4LjB9LHsiYm9keWZyZWVzdGFuZGluZyI6Ik9mZiIsImJvZHl5YXciOnRydWUsImRlZmVuc2l2ZSI6dHJ1ZSwiZGVmZW5zaXZlX2NsZWFyIjp0cnVlLCJkZWZlbnNpdmVfcGl0Y2giOiJEaXNhYmxlZCIsImRlZmVuc2l2ZV9waXRjaF9vZmZzZXQiOjAuMCwiZGVmZW5zaXZlX3R5cGUiOlsiRFQiLCJIaWRlIFNob3RzIiwifiJdLCJkZWZlbnNpdmVfeWF3IjoiU3BpbiIsImRlZmVuc2l2ZV95YXdfb2Zmc2V0IjotMTQuMCwiZGVsYXkiOjEuMCwiZW5hYmxlIjp0cnVlLCJsZWZ0bGltaXQiOjYwLjAsIm9wdGlvbnMiOlsiSml0dGVyIiwifiJdLCJyaWdodGxpbWl0Ijo2MC4wLCJ5YXdfbGVmdCI6MTEuMCwieWF3X3JpZ2h0Ijo0LjAsInlhd21vZGlmaWVyIjoiQ2VudGVyIiwieWF3bW9kaWZpZXJfb2Zmc2V0IjotNTguMCwieWF3bW9kaWZpZXJfcmFuZG9tIjo1LjB9LHsiYm9keWZyZWVzdGFuZGluZyI6Ik9mZiIsImJvZHl5YXciOmZhbHNlLCJkZWZlbnNpdmUiOmZhbHNlLCJkZWZlbnNpdmVfY2xlYXIiOmZhbHNlLCJkZWZlbnNpdmVfcGl0Y2giOiJEaXNhYmxlZCIsImRlZmVuc2l2ZV9waXRjaF9vZmZzZXQiOjAuMCwiZGVmZW5zaXZlX3R5cGUiOlsifiJdLCJkZWZlbnNpdmVfeWF3IjoiRGlzYWJsZWQiLCJkZWZlbnNpdmVfeWF3X29mZnNldCI6MC4wLCJkZWxheSI6MS4wLCJlbmFibGUiOmZhbHNlLCJsZWZ0bGltaXQiOjYwLjAsIm9wdGlvbnMiOlsifiJdLCJyaWdodGxpbWl0Ijo2MC4wLCJ5YXdfbGVmdCI6MC4wLCJ5YXdfcmlnaHQiOjAuMCwieWF3bW9kaWZpZXIiOiJEaXNhYmxlZCIsInlhd21vZGlmaWVyX29mZnNldCI6MC4wLCJ5YXdtb2RpZmllcl9yYW5kb20iOjAuMH1dLFt7ImJvZHlmcmVlc3RhbmRpbmciOiJPZmYiLCJib2R5eWF3Ijp0cnVlLCJkZWZlbnNpdmUiOnRydWUsImRlZmVuc2l2ZV9jbGVhciI6ZmFsc2UsImRlZmVuc2l2ZV9waXRjaCI6IlJhbmRvbSIsImRlZmVuc2l2ZV9waXRjaF9vZmZzZXQiOjAuMCwiZGVmZW5zaXZlX3R5cGUiOlsiRFQiLCJIaWRlIFNob3RzIiwifiJdLCJkZWZlbnNpdmVfeWF3IjoiU3BpbiIsImRlZmVuc2l2ZV95YXdfb2Zmc2V0IjotMTI2LjAsImRlbGF5IjoxLjAsImVuYWJsZSI6ZmFsc2UsImxlZnRsaW1pdCI6NjAuMCwib3B0aW9ucyI6WyJKaXR0ZXIiLCJ+Il0sInJpZ2h0bGltaXQiOjYwLjAsInlhd19sZWZ0Ijo3LjAsInlhd19yaWdodCI6Ni4wLCJ5YXdtb2RpZmllciI6IkNlbnRlciIsInlhd21vZGlmaWVyX29mZnNldCI6LTU1LjAsInlhd21vZGlmaWVyX3JhbmRvbSI6OC4wfSx7ImJvZHlmcmVlc3RhbmRpbmciOiJPZmYiLCJib2R5eWF3Ijp0cnVlLCJkZWZlbnNpdmUiOmZhbHNlLCJkZWZlbnNpdmVfY2xlYXIiOmZhbHNlLCJkZWZlbnNpdmVfcGl0Y2giOiJEaXNhYmxlZCIsImRlZmVuc2l2ZV9waXRjaF9vZmZzZXQiOjAuMCwiZGVmZW5zaXZlX3R5cGUiOlsiRFQiLCJIaWRlIFNob3RzIiwifiJdLCJkZWZlbnNpdmVfeWF3IjoiU3BpbiIsImRlZmVuc2l2ZV95YXdfb2Zmc2V0IjotMTUuMCwiZGVsYXkiOjEuMCwiZW5hYmxlIjp0cnVlLCJsZWZ0bGltaXQiOjYwLjAsIm9wdGlvbnMiOlsiSml0dGVyIiwifiJdLCJyaWdodGxpbWl0Ijo2MC4wLCJ5YXdfbGVmdCI6OC4wLCJ5YXdfcmlnaHQiOjguMCwieWF3bW9kaWZpZXIiOiJDZW50ZXIiLCJ5YXdtb2RpZmllcl9vZmZzZXQiOi00MS4wLCJ5YXdtb2RpZmllcl9yYW5kb20iOjUuMH0seyJib2R5ZnJlZXN0YW5kaW5nIjoiT2ZmIiwiYm9keXlhdyI6dHJ1ZSwiZGVmZW5zaXZlIjpmYWxzZSwiZGVmZW5zaXZlX2NsZWFyIjpmYWxzZSwiZGVmZW5zaXZlX3BpdGNoIjoiU2lkZSIsImRlZmVuc2l2ZV9waXRjaF9vZmZzZXQiOjAuMCwiZGVmZW5zaXZlX3R5cGUiOlsifiJdLCJkZWZlbnNpdmVfeWF3IjoiU3BpbiIsImRlZmVuc2l2ZV95YXdfb2Zmc2V0IjotMTgwLjAsImRlbGF5Ijo1LjAsImVuYWJsZSI6dHJ1ZSwibGVmdGxpbWl0Ijo2MC4wLCJvcHRpb25zIjpbIkppdHRlciIsIn4iXSwicmlnaHRsaW1pdCI6NjAuMCwieWF3X2xlZnQiOi0zMS4wLCJ5YXdfcmlnaHQiOjM0LjAsInlhd21vZGlmaWVyIjoiRGlzYWJsZWQiLCJ5YXdtb2RpZmllcl9vZmZzZXQiOi01OS4wLCJ5YXdtb2RpZmllcl9yYW5kb20iOjcuMH0seyJib2R5ZnJlZXN0YW5kaW5nIjoiT2ZmIiwiYm9keXlhdyI6dHJ1ZSwiZGVmZW5zaXZlIjp0cnVlLCJkZWZlbnNpdmVfY2xlYXIiOmZhbHNlLCJkZWZlbnNpdmVfcGl0Y2giOiJSYW5kb20iLCJkZWZlbnNpdmVfcGl0Y2hfb2Zmc2V0IjowLjAsImRlZmVuc2l2ZV90eXBlIjpbIkRUIiwiSGlkZSBTaG90cyIsIn4iXSwiZGVmZW5zaXZlX3lhdyI6IlJhbmRvbSIsImRlZmVuc2l2ZV95YXdfb2Zmc2V0IjotOTEuMCwiZGVsYXkiOjEuMCwiZW5hYmxlIjp0cnVlLCJsZWZ0bGltaXQiOjYwLjAsIm9wdGlvbnMiOlsiSml0dGVyIiwifiJdLCJyaWdodGxpbWl0Ijo2MC4wLCJ5YXdfbGVmdCI6NC4wLCJ5YXdfcmlnaHQiOjQuMCwieWF3bW9kaWZpZXIiOiJSYW5kb20iLCJ5YXdtb2RpZmllcl9vZmZzZXQiOi02NS4wLCJ5YXdtb2RpZmllcl9yYW5kb20iOjguMH0seyJib2R5ZnJlZXN0YW5kaW5nIjoiT2ZmIiwiYm9keXlhdyI6dHJ1ZSwiZGVmZW5zaXZlIjp0cnVlLCJkZWZlbnNpdmVfY2xlYXIiOmZhbHNlLCJkZWZlbnNpdmVfcGl0Y2giOiJPZmZzZXQiLCJkZWZlbnNpdmVfcGl0Y2hfb2Zmc2V0IjotODkuMCwiZGVmZW5zaXZlX3R5cGUiOlsiRFQiLCJIaWRlIFNob3RzIiwifiJdLCJkZWZlbnNpdmVfeWF3IjoiU3BpbiIsImRlZmVuc2l2ZV95YXdfb2Zmc2V0IjotMTQuMCwiZGVsYXkiOjEuMCwiZW5hYmxlIjp0cnVlLCJsZWZ0bGltaXQiOjYwLjAsIm9wdGlvbnMiOlsiSml0dGVyIiwifiJdLCJyaWdodGxpbWl0Ijo2MC4wLCJ5YXdfbGVmdCI6Ny4wLCJ5YXdfcmlnaHQiOjguMCwieWF3bW9kaWZpZXIiOiJDZW50ZXIiLCJ5YXdtb2RpZmllcl9vZmZzZXQiOi02MC4wLCJ5YXdtb2RpZmllcl9yYW5kb20iOjAuMH0seyJib2R5ZnJlZXN0YW5kaW5nIjoiT2ZmIiwiYm9keXlhdyI6dHJ1ZSwiZGVmZW5zaXZlIjp0cnVlLCJkZWZlbnNpdmVfY2xlYXIiOmZhbHNlLCJkZWZlbnNpdmVfcGl0Y2giOiJPZmZzZXQiLCJkZWZlbnNpdmVfcGl0Y2hfb2Zmc2V0IjotODkuMCwiZGVmZW5zaXZlX3R5cGUiOlsiRFQiLCJIaWRlIFNob3RzIiwifiJdLCJkZWZlbnNpdmVfeWF3IjoiU3BpbiIsImRlZmVuc2l2ZV95YXdfb2Zmc2V0IjotMTQuMCwiZGVsYXkiOjEuMCwiZW5hYmxlIjp0cnVlLCJsZWZ0bGltaXQiOjYwLjAsIm9wdGlvbnMiOlsiSml0dGVyIiwifiJdLCJyaWdodGxpbWl0Ijo2MC4wLCJ5YXdfbGVmdCI6Ni4wLCJ5YXdfcmlnaHQiOjYuMCwieWF3bW9kaWZpZXIiOiJDZW50ZXIiLCJ5YXdtb2RpZmllcl9vZmZzZXQiOi01MC4wLCJ5YXdtb2RpZmllcl9yYW5kb20iOjE1LjB9LHsiYm9keWZyZWVzdGFuZGluZyI6Ik9mZiIsImJvZHl5YXciOnRydWUsImRlZmVuc2l2ZSI6dHJ1ZSwiZGVmZW5zaXZlX2NsZWFyIjp0cnVlLCJkZWZlbnNpdmVfcGl0Y2giOiJEaXNhYmxlZCIsImRlZmVuc2l2ZV9waXRjaF9vZmZzZXQiOi03My4wLCJkZWZlbnNpdmVfdHlwZSI6WyJEVCIsIkhpZGUgU2hvdHMiLCJ+Il0sImRlZmVuc2l2ZV95YXciOiJTcGluIiwiZGVmZW5zaXZlX3lhd19vZmZzZXQiOi0xNC4wLCJkZWxheSI6MS4wLCJlbmFibGUiOnRydWUsImxlZnRsaW1pdCI6NjAuMCwib3B0aW9ucyI6WyJKaXR0ZXIiLCJ+Il0sInJpZ2h0bGltaXQiOjYwLjAsInlhd19sZWZ0Ijo1LjAsInlhd19yaWdodCI6NC4wLCJ5YXdtb2RpZmllciI6IkNlbnRlciIsInlhd21vZGlmaWVyX29mZnNldCI6LTcuMCwieWF3bW9kaWZpZXJfcmFuZG9tIjo4LjB9LHsiYm9keWZyZWVzdGFuZGluZyI6Ik9mZiIsImJvZHl5YXciOnRydWUsImRlZmVuc2l2ZSI6dHJ1ZSwiZGVmZW5zaXZlX2NsZWFyIjp0cnVlLCJkZWZlbnNpdmVfcGl0Y2giOiJEaXNhYmxlZCIsImRlZmVuc2l2ZV9waXRjaF9vZmZzZXQiOjAuMCwiZGVmZW5zaXZlX3R5cGUiOlsiRFQiLCJIaWRlIFNob3RzIiwifiJdLCJkZWZlbnNpdmVfeWF3IjoiU3BpbiIsImRlZmVuc2l2ZV95YXdfb2Zmc2V0IjotMTQuMCwiZGVsYXkiOjEuMCwiZW5hYmxlIjp0cnVlLCJsZWZ0bGltaXQiOjYwLjAsIm9wdGlvbnMiOlsiSml0dGVyIiwifiJdLCJyaWdodGxpbWl0Ijo2MC4wLCJ5YXdfbGVmdCI6MTEuMCwieWF3X3JpZ2h0Ijo0LjAsInlhd21vZGlmaWVyIjoiQ2VudGVyIiwieWF3bW9kaWZpZXJfb2Zmc2V0IjotNTguMCwieWF3bW9kaWZpZXJfcmFuZG9tIjo1LjB9LHsiYm9keWZyZWVzdGFuZGluZyI6Ik9mZiIsImJvZHl5YXciOmZhbHNlLCJkZWZlbnNpdmUiOmZhbHNlLCJkZWZlbnNpdmVfY2xlYXIiOmZhbHNlLCJkZWZlbnNpdmVfcGl0Y2giOiJEaXNhYmxlZCIsImRlZmVuc2l2ZV9waXRjaF9vZmZzZXQiOjAuMCwiZGVmZW5zaXZlX3R5cGUiOlsifiJdLCJkZWZlbnNpdmVfeWF3IjoiRGlzYWJsZWQiLCJkZWZlbnNpdmVfeWF3X29mZnNldCI6MC4wLCJkZWxheSI6MS4wLCJlbmFibGUiOmZhbHNlLCJsZWZ0bGltaXQiOjYwLjAsIm9wdGlvbnMiOlsifiJdLCJyaWdodGxpbWl0Ijo2MC4wLCJ5YXdfbGVmdCI6MC4wLCJ5YXdfcmlnaHQiOjAuMCwieWF3bW9kaWZpZXIiOiJEaXNhYmxlZCIsInlhd21vZGlmaWVyX29mZnNldCI6MC4wLCJ5YXdtb2RpZmllcl9yYW5kb20iOjAuMH1dLHsiKndvcmxkX2hpdG1hcmtlciI6IiM4RUVBRENGRiIsIip3b3JsZF9taXNzbWFya2VyIjoiI0VBOEU4RUZGIiwiY3Jvc3NoYWlyX2luZCI6ZmFsc2UsImNyb3NzaGFpcl9pbmRfY29sb3IxIjoiI0M4QzhDOEZGIiwiY3Jvc3NoYWlyX2luZF9jb2xvcjIiOiIjOTY5Njk2RkYiLCJjcm9zc2hhaXJfaW5kX2NvbG9yMyI6IiM2NDY0NjRGRiIsImNyb3NzaGFpcl9pbmRfc3R5bGUiOjEuMCwiY3VzdG9tX3Njb3BlIjp0cnVlLCJjdXN0b21fc2NvcGVfYW5pbSI6MTUuMCwiY3VzdG9tX3Njb3BlX2NvbG9yIjoiI0ZGRkZGRjUzIiwiY3VzdG9tX3Njb3BlX2xlbmd0aCI6MjUwLjAsImN1c3RvbV9zY29wZV9vZmZzZXQiOjUuMCwiZGFtYWdlX2luZGljYXRvciI6dHJ1ZSwiZ3NfaW5kaWNhdG9ycyI6dHJ1ZSwiZ3Nfc3BlY3RhdG9ycyI6dHJ1ZSwic29sdXNfdWkiOnRydWUsInNvbHVzX3VpX2NvbG9yIjoiI0JBQzRGOUZGIiwic29sdXNfdWlfbGlzdCI6WyJ+Il0sInNvbHVzX3VpX25hbWUiOiJvZ195b3VuZyIsInNvbHVzX3VpX3JvdW5kIjozLjAsInNvbHVzX3VpX3R5cGUiOjEuMCwid2luZG93cyI6dHJ1ZSwid2luZG93c19kZWZlbnNpdmUiOiJEZWZhdWx0Iiwid2luZG93c19kZWZlbnNpdmVfY2xyIjoiI0RDRENEQ0ZGIiwid2luZG93c19zZWxlY3QiOlsxLjAsMi4wLCJ+Il0sIndpbmRvd3Nfc2xvd2VkIjoiRGVmYXVsdCIsIndpbmRvd3Nfc2xvd2VkX2NsciI6IiNEQ0RDRENGRiIsIndvcmxkX2hpdG1hcmtlciI6dHJ1ZSwid29ybGRfaGl0bWFya2VyX2NsciI6IiM4RUVBRENGRiIsIndvcmxkX21pc3NtYXJrZXIiOnRydWUsIndvcmxkX21pc3NtYXJrZXJfY2xyIjoiI0VBOEU4RUZGIn0seyJhc3BlY3RyYXRpbyI6dHJ1ZSwiYXNwZWN0cmF0aW9fYW1vdW50IjoxMzMuMCwiYXV0b19ncmVuYWRlIjpmYWxzZSwiYXV0b19ncmVuYWRlX2hlIjoyMC4wLCJhdXRvX2dyZW5hZGVfbW9sb3RvdiI6MTAwLjAsImF1dG9faHMiOnRydWUsImF1dG9fdGVsZXBvcnQiOmZhbHNlLCJjbGFudGFnIjpmYWxzZSwiZG9ybWFudF9haW1ib3QiOmZhbHNlLCJmYWtlcGluZyI6ZmFsc2UsImZha2VwaW5nX2Ftb3VudCI6MTU4LjAsImZhc3RsYWRkZXIiOnRydWUsImhpdGNoYW5jZSI6dHJ1ZSwiaGl0Y2hhbmNlX2FpciI6WyJTY291dCIsIlI4IiwifiJdLCJoaXRjaGFuY2VfYWlyX3I4IjozNS4wLCJoaXRjaGFuY2VfYWlyX3Njb3V0Ijo0MC4wLCJoaXRjaGFuY2VfYWlyX3Nob3RndW4iOjQwLjAsImhpdGNoYW5jZV9haXJfc21nIjo0MC4wLCJoaXRjaGFuY2Vfc2NvcGUiOlsifiJdLCJoaXRjaGFuY2Vfc2NvcGVfYXV0byI6NDAuMCwiaGl0Y2hhbmNlX3Njb3BlX2F3cCI6NDAuMCwiaGl0Y2hhbmNlX3Njb3BlX3Njb3V0Ijo0MC4wLCJub19mYWxsX2RhbWFnZSI6dHJ1ZSwicmFnZV9sb2dzIjp0cnVlLCJyYWdlX2xvZ3NfaGl0IjoiI0JBQzRGOUZGIiwicmFnZV9sb2dzX21pc3MiOiIjQkE1QTVBRkYiLCJyYWdlX2xvZ3Nfcm91bmQiOjMuMCwicmFnZV9sb2dzX3N0eWxlIjo4LjAsInJhZ2VfbG9nc190eXBlIjpbMS4wLDIuMCwzLjAsIn4iXSwidHJhc2h0YWxrIjpmYWxzZSwidmlld21vZGVsIjpmYWxzZSwidmlld21vZGVsX2ZvdiI6NjkuMCwidmlld21vZGVsX3giOjMuMCwidmlld21vZGVsX3kiOjAuMCwidmlld21vZGVsX3oiOi0yLjB9XQ==")));
                            cvar.play:call("ambient\\tones\\elev1");
                        end);
                        v355.export:set_callback(function()
                            -- upvalues: l_l_clipboard_0_0 (ref), l_l_base64_0_0 (ref), v821 (ref)
                            l_l_clipboard_0_0.set(l_l_base64_0_0.encode(json.stringify(v821:save())));
                            cvar.play:call("ambient\\tones\\elev1");
                        end);
                        local v822 = false;
                        local function v823()
                            -- upvalues: v822 (ref)
                            if v822 then
                                utils.console_exec("-attack");
                            end;
                        end;
                        local _ = render.camera_position();
                        events.grenade_prediction:set(function(v825)
                            -- upvalues: v355 (ref), v789 (ref), v823 (ref)
                            if not v355.misc.auto_grenade:get() then
                                return;
                            else
                                local v826 = entity.get_local_player();
                                if v826 == nil then
                                    return;
                                elseif not v826:is_alive() then
                                    return;
                                elseif not v789(v826) then
                                    return;
                                else
                                    if v825.damage ~= 0 then
                                        if v825.type == "Molly" then
                                            if v825.damage > v355.misc.auto_grenade_molotov:get() then
                                                v823();
                                            end;
                                        elseif v825.type == "Smoke" then
                                            if v825.damage ~= 0 then
                                                v823();
                                            end;
                                        elseif v825.type == "Frag" and (v825.fatal or v825.damage > v355.misc.auto_grenade_he:get()) then
                                            v823();
                                        end;
                                    end;
                                    return;
                                end;
                            end;
                        end);
                        local function v827()
                            -- upvalues: v355 (ref)
                            cvar.sv_competitive_minspec:int(0);
                            cvar.viewmodel_fov:int(v355.misc.viewmodel:get() and v355.misc.viewmodel_fov:get() or 68);
                            cvar.viewmodel_offset_x:float(v355.misc.viewmodel:get() and v355.misc.viewmodel_x:get() or 2.5);
                            cvar.viewmodel_offset_y:float(v355.misc.viewmodel:get() and v355.misc.viewmodel_y:get() or 0);
                            cvar.viewmodel_offset_z:float(v355.misc.viewmodel:get() and v355.misc.viewmodel_z:get() or -1.5);
                        end;
                        v827();
                        v355.misc.viewmodel:set_callback(function()
                            -- upvalues: v827 (ref)
                            v827();
                        end);
                        v355.misc.viewmodel_fov:set_callback(function()
                            -- upvalues: v827 (ref)
                            v827();
                        end);
                        v355.misc.viewmodel_x:set_callback(function()
                            -- upvalues: v827 (ref)
                            v827();
                        end);
                        v355.misc.viewmodel_y:set_callback(function()
                            -- upvalues: v827 (ref)
                            v827();
                        end);
                        v355.misc.viewmodel_z:set_callback(function()
                            -- upvalues: v827 (ref)
                            v827();
                        end);
                        local function v828()
                            -- upvalues: v355 (ref)
                            cvar.r_aspectratio:float(v355.misc.aspectratio:get() and v355.misc.aspectratio_amount:get() / 100 or 0);
                        end;
                        v828();
                        v355.misc.aspectratio:set_callback(function()
                            -- upvalues: v828 (ref)
                            v828();
                        end);
                        v355.misc.aspectratio_amount:set_callback(function()
                            -- upvalues: v828 (ref)
                            v828();
                        end);
                        events.render:set(function()
                            -- upvalues: l_v321_0 (ref), v486 (ref), v508 (ref), v355 (ref), v353 (ref), v531 (ref), v819 (ref), v627 (ref), v645 (ref), v655 (ref), v690 (ref), v731 (ref), v686 (ref), v502 (ref), v622 (ref), v619 (ref), v750 (ref), v658 (ref)
                            for _, v830 in pairs(l_v321_0) do
                                v830:update(globals.frametime);
                            end;
                            v486();
                            v508();
                            if v355.visuals.custom_scope:get() then
                                v353.scopeoverlay:override("Remove All");
                                v531();
                            else
                                v353.scopeoverlay:override();
                            end;
                            if v355.misc.clantag:get() then
                                v819();
                            end;
                            if v355.visuals.solus_ui:get() then
                                if v355.visuals.solus_ui_list:get(1) then
                                    v627();
                                end;
                                if v355.visuals.solus_ui_list:get(2) then
                                    v645:update();
                                end;
                                if v355.visuals.solus_ui_list:get(3) then
                                    v655:update();
                                end;
                                if v355.visuals.solus_ui_list:get(4) then
                                    v690:update();
                                end;
                            end;
                            if v355.visuals.gs_indicators:get() and v355.visuals.gs_features:get() then
                                v731();
                            end;
                            if v355.visuals.gs_indicators:get() or v355.visuals.solus_ui:get() and v355.visuals.solus_ui_list:get(4) then
                                v686();
                            end;
                            if v355.visuals.gs_spectators:get() and v355.visuals.gs_features:get() then
                                render.spectators();
                            end;
                            if v355.visuals.world_hitmarker:get() then
                                v502();
                            end;
                            if v355.visuals.windows:get() then
                                if v355.visuals.windows_select:get(1) then
                                    v622:update();
                                end;
                                if v355.visuals.windows_select:get(2) then
                                    v619:update();
                                end;
                            end;
                            if v355.visuals.crosshair_ind:get() then
                                v750();
                            end;
                            if v355.visuals.damage_indicator:get() then
                                v658:update();
                            end;
                        end);
                        local function v836(v831)
                            -- upvalues: v353 (ref)
                            local v832 = entity.get_local_player():get_player_weapon();
                            if not v832 then
                                return;
                            else
                                local v833 = v832:get_classname();
                                if not v833 then
                                    return;
                                else
                                    local v834 = string.match(v833, "Grenade");
                                    local l_m_fThrowTime_0 = v832.m_fThrowTime;
                                    if v834 then
                                        rage.exploit:allow_defensive(false);
                                        v831.force_defensive = false;
                                        if l_m_fThrowTime_0 ~= nil and l_m_fThrowTime_0 ~= 0 then
                                            v353.bodyyaw:override(false);
                                        end;
                                    end;
                                    return;
                                end;
                            end;
                        end;
                        events.createmove:set(function(v837)
                            -- upvalues: v822 (ref), v464 (ref), v355 (ref), v777 (ref), v774 (ref), v807 (ref), v781 (ref), v758 (ref), v767 (ref), v836 (ref), v811 (ref), v478 (ref), v432 (ref)
                            v822 = v837.in_attack;
                            v464(v837);
                            if v355.misc.fastladder:get() then
                                v777(v837);
                            end;
                            if v355.misc.no_fall_damage:get() then
                                v774(v837);
                            end;
                            if v355.misc.dormant_aimbot:get() then
                                v807(v837);
                            end;
                            if v355.misc.auto_teleport:get() then
                                v781(v837);
                            end;
                            v758(v837);
                            v767(v837);
                            v836(v837);
                            if v355.misc.fakeping:get() then
                                ui.find("Miscellaneous", "Main", "Other", "Fake Latency"):override(v355.misc.fakeping_amount:get());
                            else
                                ui.find("Miscellaneous", "Main", "Other", "Fake Latency"):override();
                            end;
                            if v355.misc.edge_stop:get() then
                                v811(v837);
                            end;
                            if v478 then
                                v837.jitter_move = true;
                            end;
                            me = entity.get_local_player();
                            if not me or not me:is_alive() then
                                return;
                            else
                                if rage.exploit:get() < 1 then
                                    v432.tickbase_check = false;
                                end;
                                v432.tickbase_check = globals.tickcount > entity.get_local_player().m_nTickBase;
                                return;
                            end;
                        end);
                        events.localplayer_transparency:set(function()
                            -- upvalues: v355 (ref)
                            if v355.visuals.gs_trans:get() then
                                me = entity.get_local_player();
                                if not me:is_alive() then
                                    return;
                                elseif me.m_bResumeZoom or me.m_bIsScoped then
                                    return 59;
                                else
                                    return;
                                end;
                            else
                                return;
                            end;
                        end);
                        events.level_init:set(function()
                            -- upvalues: v433 (ref), l_v325_0 (ref)
                            v433();
                            l_v325_0 = {};
                        end);
                        events.mouse_input:set(function()
                            return ui.get_alpha() <= 0;
                        end);
                        events.round_start:set(function()
                            -- upvalues: v503 (ref), v433 (ref), v488 (ref)
                            v503 = {};
                            v433();
                            reset_bomb();
                            v488 = {};
                        end);
                        events.shutdown:set(function()
                            -- upvalues: v347 (ref), v346 (ref)
                            local v838 = common.get_unixtime() - v347;
                            v346[3] = v346[3] + v838;
                            db.genesis_pidor = v346;
                            db.genesis_beta3 = configs_db;
                            common.set_clan_tag("");
                            cvar.viewmodel_offset_x:float(2.5);
                            cvar.viewmodel_offset_y:float(0);
                            cvar.viewmodel_offset_z:float(-1.5);
                            cvar.r_aspectratio:float(0);
                        end);
                        events.bomb_abortplant:set(reset_bomb);
                        events.bomb_exploded:set(reset_bomb);
                        events.bomb_defused:set(reset_bomb);
                        events.bomb_planted:set(reset_bomb);
                        events.bomb_beginplant:set(bomb_beginplant);
                        events.voice_message(function(v839)
                            -- upvalues: l_v325_0 (ref)
                            if not v839.entity then
                                return;
                            else
                                if v839.is_nl then
                                    l_v325_0[v839.entity:get_xuid()] = true;
                                end;
                                return;
                            end;
                        end);
                    end;
                else
                    common.add_event("The \vSubscription\r Is Over", "moon-stars");
                    print_dev("The \vSubscription \rIs Over");
                    print("genesis.lua discord - \vhttps://discord.gg/cyXNeBwATu");
                    print("genesis.lua - \vhttps://ru.neverlose.cc/market/item?id=5O16jT");
                    panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://ru.neverlose.cc/market/item?id=5O16jT");
                end;
                return;
            end;
        end;
    end;
end);