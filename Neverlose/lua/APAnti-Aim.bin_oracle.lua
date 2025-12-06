local function v3(v0)
    local l_status_0, l_result_0 = pcall(require, v0);
    if not l_status_0 then
        print_raw("\aff0000C8Error cant be automatically sent!");
        print_raw("\aff0000C8Error CONTACT SUPPORT OR OWNER/CODER FAST AND PROVIDE SCREENSHOT!");
        error("Error: Failed to require '" .. v0 .. "' - Module not found!", 2);
    end;
    return l_result_0;
end;
local _ = v3("neverlose/get_defensive");
local v5 = v3("neverlose/discord_webhooks");
local v6 = v3("neverlose/lerp");
local v7 = v3("neverlose/mtools");
local v8 = v3("neverlose/clipboard");
local _ = v3("neverlose/base64");
local _ = v3("neverlose/websockets");
local _ = v3("neverlose/edge_yaw");
local v12 = false;
local v13 = 120;
local v14 = 0;
local v15 = 0;
local l_voice_message_0 = events.voice_message;
local l_voice_modenable_0 = cvar.voice_modenable;
local l_cl_mute_enemy_team_0 = cvar.cl_mute_enemy_team;
local l_cl_mute_all_but_friends_and_party_0 = cvar.cl_mute_all_but_friends_and_party;
local l_cl_mute_player_after_reporting_abuse_0 = cvar.cl_mute_player_after_reporting_abuse;
local v21 = 0;
local _ = 1;
cvar.voice_buffer_debug:set_callback(function(v23, v24, v25)
    -- upvalues: v15 (ref)
    local v26 = tonumber(v25);
    local v27 = tonumber(v24);
    v15 = 0;
    if v26 > 1 then
        v23:int(v27);
        v15 = math.clamp(v26 - 1, 0, 2);
    end;
end);
local v28 = {
    FATALITY = "FT", 
    SPIRT = "SPRT", 
    PRIMORDIAL = "PRMD", 
    GAMESENSE = "GS", 
    NEVERLOSE = "NL", 
    EVOLVE = "EVO", 
    NIXWARE = "NW", 
    PANDORA = "PD", 
    ONETAP = "OT"
};
local v29 = {
    [v28.NEVERLOSE] = "https://raw.githubusercontent.com/tickcount/.p2c-icons/main/neverlose.png", 
    [v28.GAMESENSE] = "https://raw.githubusercontent.com/tickcount/.p2c-icons/main/gamesense.png", 
    [v28.PRIMORDIAL] = "https://raw.githubusercontent.com/tickcount/.p2c-icons/main/primordial.png", 
    [v28.FATALITY] = "https://raw.githubusercontent.com/tickcount/.p2c-icons/main/fatality.png", 
    [v28.ONETAP] = "https://raw.githubusercontent.com/tickcount/.p2c-icons/main/onetap.png", 
    [v28.PANDORA] = "https://raw.githubusercontent.com/tickcount/.p2c-icons/main/pandora.png", 
    [v28.NIXWARE] = "https://raw.githubusercontent.com/tickcount/.p2c-icons/main/nixware.png", 
    [v28.EVOLVE] = "https://raw.githubusercontent.com/tickcount/.p2c-icons/main/ev0.png", 
    [v28.SPIRT] = "https://raw.githubusercontent.com/tickcount/.p2c-icons/main/spirthack.png"
};
local l_base64_0 = require("neverlose/base64");
local function v38(...)
    local v31 = table.concat({
        ...
    });
    local v32 = "64 0e 87 3c e5 b1 4f c8 05 9a";
    local v33 = #v31;
    local v34 = #v32;
    local v35 = ffi.new("char[?]", v33 + 1);
    local v36 = ffi.new("char[?]", v34 + 1);
    ffi.copy(v35, v31);
    ffi.copy(v36, v32);
    for v37 = 0, v33 - 1 do
        v35[v37] = bit.bxor(v35[v37], v36[v37 % v34]);
    end;
    return ffi.string(v35, v33);
end;
local v39 = nil;
local v40 = nil;
v40 = "@vclistener";
local l_status_1, l_result_1 = pcall(function(v41)
    -- upvalues: v38 (ref), l_base64_0 (ref)
    return json.parse(v38(l_base64_0.decode(v41)));
end, db[v40]);
v39 = l_status_1 == true and l_result_1 or {};
db[v40] = nil;
local _ = (function()
    local v44 = ffi.new("const uint32_t[16]", {
        [1] = 0, 
        [2] = 498536548, 
        [3] = 997073096, 
        [4] = 651767980, 
        [5] = 1994146192, 
        [6] = 1802195444, 
        [7] = 1303535960, 
        [8] = 1342533948, 
        [9] = 3988292384, 
        [10] = 4027552580, 
        [11] = 3604390888, 
        [12] = 3412177804, 
        [13] = 2607071920, 
        [14] = 2262029012, 
        [15] = 2685067896, 
        [16] = 3183342108
    });
    mz_crc32 = function(v45, v46, v47)
        -- upvalues: v44 (ref)
        if not v47 then
            v47 = 0;
        end;
        local l_v47_0 = v47;
        local v49 = ffi.cast("const uint8_t*", v45);
        if v49 == nil then
            return 0;
        else
            l_v47_0 = bit.bnot(l_v47_0);
            while v46 > 0 do
                local v50 = v49[0];
                l_v47_0 = bit.bxor(bit.rshift(l_v47_0, 4), v44[bit.bxor(bit.band(l_v47_0, 15), bit.band(v50, 15))]);
                l_v47_0 = bit.bxor(bit.rshift(l_v47_0, 4), v44[bit.bxor(bit.band(l_v47_0, 15), bit.rshift(v50, 4))]);
                v49 = v49 + 1;
                v46 = v46 - 1;
            end;
            return bit.bnot(l_v47_0);
        end;
    end;
    return function(v51, v52)
        if not v52 then
            if type(v51) == "string" then
                v52 = #v51;
            elseif type(v51) == "cdata" then
                v52 = ffi.sizeof(v51);
            end;
        end;
        if not v52 then
            return nil;
        else
            return mz_crc32(v51, v52);
        end;
    end;
end)();
l_status_1 = function(v54, v55)
    return v54.is_reliable and v54.amount > v55.amount;
end;
l_result_1 = function()
    return globals.realtime;
end;
local v56 = nil;
local v57 = nil;
ffi.cdef("        void* VirtualAlloc(void* lpAddress, size_t dwSize, uint32_t flAllocationType, uint32_t flProtect);\n        int VirtualFree(void* lpAddress, size_t dwSize, uint32_t dwFreeType);\n    ");
local function v62(v58)
    assert(type(v58) == "table", "invalid shellcode");
    local v59 = #v58;
    local v60 = ffi.C.VirtualAlloc(nil, v59, 4096, 64);
    assert(v60 ~= nil, "allocation failed");
    ffi.gc(v60, function(v61)
        -- upvalues: v59 (ref)
        ffi.C.VirtualFree(v61, v59, 32768);
    end);
    ffi.copy(v60, ffi.new("char[?]", v59, v58), v59);
    return v60;
end;
local v63 = ffi.typeof("        struct {\n            uint64_t version;\n            uint32_t xuid_low;\n            uint32_t xuid_high;\n            char name[128];\n            int userid;\n            char guid[33];\n            uint32_t friendsid;\n            char friendsname[128];\n            bool isbot;\n            bool ishltv;\n            uint32_t customfiles[4];\n            uint8_t filesdownloaded;\n        }\n    ");
local v64 = utils.get_vfunc("engine.dll", "VEngineClient014", 8, "bool(__thiscall*)(void*, int, $*)", v63);
do
    local l_v63_0, l_v64_0 = v63, v64;
    v57 = function(v67)
        -- upvalues: l_v63_0 (ref), l_v64_0 (ref)
        if type(v67) ~= "number" then
            return;
        else
            local v68 = l_v63_0();
            v68.version = 18446744073709547522ULL;
            if l_v64_0(v67, v68) then
                return v68;
            else
                return;
            end;
        end;
    end;
    v56 = ffi.cast("bool(__fastcall*)(void*, uint32_t)", v62({
        [1] = 129, 
        [2] = 236, 
        [3] = 76, 
        [4] = 1, 
        [5] = 0, 
        [6] = 0, 
        [7] = 83, 
        [8] = 85, 
        [9] = 86, 
        [10] = 139, 
        [11] = 241, 
        [12] = 137, 
        [13] = 84, 
        [14] = 36, 
        [15] = 84, 
        [16] = 51, 
        [17] = 219, 
        [18] = 199, 
        [19] = 68, 
        [20] = 36, 
        [21] = 16, 
        [22] = 104, 
        [23] = 51, 
        [24] = 5, 
        [25] = 151, 
        [26] = 87, 
        [27] = 199, 
        [28] = 68, 
        [29] = 36, 
        [30] = 24, 
        [31] = 54, 
        [32] = 6, 
        [33] = 212, 
        [34] = 234, 
        [35] = 191, 
        [36] = 0, 
        [37] = 1, 
        [38] = 0, 
        [39] = 0, 
        [40] = 139, 
        [41] = 70, 
        [42] = 16, 
        [43] = 139, 
        [44] = 78, 
        [45] = 20, 
        [46] = 137, 
        [47] = 68, 
        [48] = 36, 
        [49] = 48, 
        [50] = 139, 
        [51] = 70, 
        [52] = 40, 
        [53] = 137, 
        [54] = 68, 
        [55] = 36, 
        [56] = 56, 
        [57] = 139, 
        [58] = 70, 
        [59] = 36, 
        [60] = 137, 
        [61] = 68, 
        [62] = 36, 
        [63] = 60, 
        [64] = 139, 
        [65] = 70, 
        [66] = 44, 
        [67] = 137, 
        [68] = 68, 
        [69] = 36, 
        [70] = 64, 
        [71] = 139, 
        [72] = 195, 
        [73] = 199, 
        [74] = 68, 
        [75] = 36, 
        [76] = 28, 
        [77] = 79, 
        [78] = 196, 
        [79] = 164, 
        [80] = 62, 
        [81] = 199, 
        [82] = 68, 
        [83] = 36, 
        [84] = 32, 
        [85] = 133, 
        [86] = 178, 
        [87] = 172, 
        [88] = 15, 
        [89] = 137, 
        [90] = 76, 
        [91] = 36, 
        [92] = 52, 
        [93] = 137, 
        [94] = 92, 
        [95] = 36, 
        [96] = 40, 
        [97] = 136, 
        [98] = 68, 
        [99] = 4, 
        [100] = 92, 
        [101] = 64, 
        [102] = 59, 
        [103] = 199, 
        [104] = 114, 
        [105] = 247, 
        [106] = 138, 
        [107] = 243, 
        [108] = 139, 
        [109] = 243, 
        [110] = 138, 
        [111] = 84, 
        [112] = 52, 
        [113] = 92, 
        [114] = 139, 
        [115] = 198, 
        [116] = 131, 
        [117] = 224, 
        [118] = 15, 
        [119] = 138, 
        [120] = 68, 
        [121] = 4, 
        [122] = 20, 
        [123] = 2, 
        [124] = 194, 
        [125] = 2, 
        [126] = 240, 
        [127] = 15, 
        [128] = 182, 
        [129] = 206, 
        [130] = 138, 
        [131] = 68, 
        [132] = 12, 
        [133] = 92, 
        [134] = 136, 
        [135] = 68, 
        [136] = 52, 
        [137] = 92, 
        [138] = 70, 
        [139] = 136, 
        [140] = 84, 
        [141] = 12, 
        [142] = 92, 
        [143] = 59, 
        [144] = 247, 
        [145] = 114, 
        [146] = 219, 
        [147] = 138, 
        [148] = 227, 
        [149] = 139, 
        [150] = 251, 
        [151] = 189, 
        [152] = 128, 
        [153] = 0, 
        [154] = 0, 
        [155] = 0, 
        [156] = 138, 
        [157] = 244, 
        [158] = 254, 
        [159] = 198, 
        [160] = 15, 
        [161] = 182, 
        [162] = 246, 
        [163] = 138, 
        [164] = 84, 
        [165] = 52, 
        [166] = 92, 
        [167] = 2, 
        [168] = 226, 
        [169] = 15, 
        [170] = 182, 
        [171] = 204, 
        [172] = 138, 
        [173] = 68, 
        [174] = 12, 
        [175] = 92, 
        [176] = 136, 
        [177] = 68, 
        [178] = 52, 
        [179] = 92, 
        [180] = 136, 
        [181] = 84, 
        [182] = 12, 
        [183] = 92, 
        [184] = 131, 
        [185] = 237, 
        [186] = 1, 
        [187] = 117, 
        [188] = 225, 
        [189] = 254, 
        [190] = 198, 
        [191] = 15, 
        [192] = 182, 
        [193] = 246, 
        [194] = 138, 
        [195] = 84, 
        [196] = 52, 
        [197] = 92, 
        [198] = 138, 
        [199] = 218, 
        [200] = 2, 
        [201] = 220, 
        [202] = 15, 
        [203] = 182, 
        [204] = 203, 
        [205] = 138, 
        [206] = 68, 
        [207] = 12, 
        [208] = 92, 
        [209] = 136, 
        [210] = 68, 
        [211] = 52, 
        [212] = 92, 
        [213] = 136, 
        [214] = 84, 
        [215] = 12, 
        [216] = 92, 
        [217] = 138, 
        [218] = 68, 
        [219] = 52, 
        [220] = 92, 
        [221] = 2, 
        [222] = 194, 
        [223] = 15, 
        [224] = 182, 
        [225] = 192, 
        [226] = 138, 
        [227] = 68, 
        [228] = 4, 
        [229] = 92, 
        [230] = 138, 
        [231] = 227, 
        [232] = 48, 
        [233] = 68, 
        [234] = 60, 
        [235] = 48, 
        [236] = 71, 
        [237] = 131, 
        [238] = 255, 
        [239] = 20, 
        [240] = 114, 
        [241] = 203, 
        [242] = 51, 
        [243] = 255, 
        [244] = 137, 
        [245] = 124, 
        [246] = 36, 
        [247] = 44, 
        [248] = 139, 
        [249] = 239, 
        [250] = 199, 
        [251] = 68, 
        [252] = 36, 
        [253] = 36, 
        [254] = 15, 
        [255] = 0, 
        [256] = 0, 
        [257] = 0, 
        [258] = 139, 
        [259] = 124, 
        [260] = 36, 
        [261] = 36, 
        [262] = 209, 
        [263] = 237, 
        [264] = 137, 
        [265] = 108, 
        [266] = 36, 
        [267] = 72, 
        [268] = 15, 
        [269] = 183, 
        [270] = 76, 
        [271] = 172, 
        [272] = 50, 
        [273] = 139, 
        [274] = 193, 
        [275] = 15, 
        [276] = 191, 
        [277] = 201, 
        [278] = 137, 
        [279] = 68, 
        [280] = 36, 
        [281] = 84, 
        [282] = 15, 
        [283] = 183, 
        [284] = 68, 
        [285] = 172, 
        [286] = 52, 
        [287] = 189, 
        [288] = 133, 
        [289] = 142, 
        [290] = 213, 
        [291] = 145, 
        [292] = 139, 
        [293] = 208, 
        [294] = 137, 
        [295] = 76, 
        [296] = 36, 
        [297] = 68, 
        [298] = 139, 
        [299] = 216, 
        [300] = 137, 
        [301] = 84, 
        [302] = 36, 
        [303] = 76, 
        [304] = 139, 
        [305] = 193, 
        [306] = 15, 
        [307] = 183, 
        [308] = 240, 
        [309] = 43, 
        [310] = 221, 
        [311] = 36, 
        [312] = 15, 
        [313] = 139, 
        [314] = 213, 
        [315] = 138, 
        [316] = 200, 
        [317] = 209, 
        [318] = 194, 
        [319] = 102, 
        [320] = 211, 
        [321] = 203, 
        [322] = 139, 
        [323] = 234, 
        [324] = 102, 
        [325] = 139, 
        [326] = 195, 
        [327] = 209, 
        [328] = 197, 
        [329] = 102, 
        [330] = 51, 
        [331] = 198, 
        [332] = 43, 
        [333] = 242, 
        [334] = 15, 
        [335] = 183, 
        [336] = 216, 
        [337] = 138, 
        [338] = 203, 
        [339] = 128, 
        [340] = 225, 
        [341] = 15, 
        [342] = 102, 
        [343] = 211, 
        [344] = 206, 
        [345] = 102, 
        [346] = 51, 
        [347] = 240, 
        [348] = 15, 
        [349] = 183, 
        [350] = 206, 
        [351] = 15, 
        [352] = 183, 
        [353] = 198, 
        [354] = 131, 
        [355] = 239, 
        [356] = 1, 
        [357] = 117, 
        [358] = 203, 
        [359] = 139, 
        [360] = 124, 
        [361] = 36, 
        [362] = 40, 
        [363] = 139, 
        [364] = 197, 
        [365] = 43, 
        [366] = 216, 
        [367] = 137, 
        [368] = 108, 
        [369] = 36, 
        [370] = 36, 
        [371] = 51, 
        [372] = 92, 
        [373] = 36, 
        [374] = 80, 
        [375] = 131, 
        [376] = 199, 
        [377] = 2, 
        [378] = 139, 
        [379] = 108, 
        [380] = 36, 
        [381] = 72, 
        [382] = 209, 
        [383] = 192, 
        [384] = 43, 
        [385] = 200, 
        [386] = 137, 
        [387] = 124, 
        [388] = 36, 
        [389] = 40, 
        [390] = 139, 
        [391] = 68, 
        [392] = 36, 
        [393] = 76, 
        [394] = 51, 
        [395] = 76, 
        [396] = 36, 
        [397] = 44, 
        [398] = 15, 
        [399] = 183, 
        [400] = 192, 
        [401] = 137, 
        [402] = 68, 
        [403] = 36, 
        [404] = 80, 
        [405] = 139, 
        [406] = 68, 
        [407] = 36, 
        [408] = 84, 
        [409] = 15, 
        [410] = 183, 
        [411] = 192, 
        [412] = 102, 
        [413] = 137, 
        [414] = 92, 
        [415] = 172, 
        [416] = 52, 
        [417] = 102, 
        [418] = 137, 
        [419] = 76, 
        [420] = 172, 
        [421] = 50, 
        [422] = 137, 
        [423] = 68, 
        [424] = 36, 
        [425] = 44, 
        [426] = 131, 
        [427] = 255, 
        [428] = 9, 
        [429] = 15, 
        [430] = 130, 
        [431] = 69, 
        [432] = 255, 
        [433] = 255, 
        [434] = 255, 
        [435] = 139, 
        [436] = 68, 
        [437] = 36, 
        [438] = 48, 
        [439] = 139, 
        [440] = 76, 
        [441] = 36, 
        [442] = 88, 
        [443] = 193, 
        [444] = 248, 
        [445] = 16, 
        [446] = 193, 
        [447] = 249, 
        [448] = 16, 
        [449] = 51, 
        [450] = 193, 
        [451] = 185, 
        [452] = 36, 
        [453] = 36, 
        [454] = 0, 
        [455] = 0, 
        [456] = 95, 
        [457] = 94, 
        [458] = 102, 
        [459] = 59, 
        [460] = 193, 
        [461] = 93, 
        [462] = 15, 
        [463] = 148, 
        [464] = 192, 
        [465] = 91, 
        [466] = 129, 
        [467] = 196, 
        [468] = 76, 
        [469] = 1, 
        [470] = 0, 
        [471] = 0, 
        [472] = 195
    }));
end;
v62 = function(v69)
    local v70 = ffi.cast("uintptr_t*", v69[0]);
    if bit.band(bit.rshift(v70[13], 4), 1) == 1 and ffi.cast("uintptr_t*", v70[6] + 16)[0] ~= 0 then
        return false;
    elseif bit.band(bit.rshift(v70[13], 6), 1) == 0 then
        return false;
    elseif v70[8] ~= 0 then
        return false;
    elseif bit.band(v70[13], 389) ~= 389 then
        return false;
    else
        return true;
    end;
end;
v63 = function(v71)
    -- upvalues: v62 (ref), v57 (ref), v28 (ref), v56 (ref), v15 (ref)
    if type(v71) ~= "userdata" or v71.entity == nil then
        return nil;
    elseif v71.entity == entity.get_local_player() then
        return nil;
    else
        local v72 = v62(v71);
        local v73 = ffi.cast("uint16_t*", ffi.cast("uint32_t", v71[0]) + 16)[0];
        local v74 = v57(v71.entity:get_index());
        if v74 == nil or v71.sequence_bytes == 0 and v71.section_number == 0 and v71.uncompressed_sample_offset == 0 then
            return;
        else
            local v75 = bit.lshift(v71.sequence_bytes + v71.section_number + v71.uncompressed_sample_offset, 4) % 4294967296;
            if v72 == true then
                if v71.is_nl then
                    return v28.NEVERLOSE, v75;
                elseif v56(v71[0], v74.xuid_low) then
                    return v28.GAMESENSE, v75;
                else
                    local l_buffer_0 = v71.buffer;
                    local v77 = l_buffer_0:read_bits(16);
                    local v78 = l_buffer_0:read_bits(7) + 1;
                    local _ = vector(l_buffer_0:read_coord(), l_buffer_0:read_coord(), l_buffer_0:read_coord());
                    local v80 = l_buffer_0:read_bits(32);
                    local v81 = l_buffer_0:read_bits(7);
                    local _ = l_buffer_0:read_bits(32);
                    l_buffer_0:reset();
                    local v83 = entity.get(v78);
                    local v84 = globals.server_tick - v80;
                    if v83 and v83:is_alive() and v81 >= 0 and v81 <= 127 and v84 > 0 and v84 * globals.tickinterval < 1 then
                        if math.abs(globals.curtime * 0.5 - v73) <= 2 then
                            if v77 == 48879 then
                                return v28.NIXWARE, v75;
                            elseif v77 == 53456 then
                                return v28.SPIRT, v75;
                            end;
                        end;
                        return nil;
                    elseif v73 == 32762 then
                        return v28.FATALITY, v75;
                    elseif v73 == 22522 then
                        return v28.ONETAP, v75;
                    elseif v73 == 32764 or v73 == 32765 then
                        return v28.EVOLVE, v75;
                    elseif v73 == 26971 or v73 == 45041 or v73 == 6969 then
                        return v28.PANDORA, v75;
                    end;
                end;
            else
                local l_sequence_bytes_0 = v71.sequence_bytes;
                local l_uncompressed_sample_offset_0 = v71.uncompressed_sample_offset;
                local v87 = bit.bxor(bit.band(l_sequence_bytes_0, 255), bit.band(bit.rshift(l_uncompressed_sample_offset_0, 16), 255)) - bit.rshift(l_sequence_bytes_0, 16);
                if v72 == false and bit.band(v87, 255) == 77 then
                    local v88 = bit.band(bit.bxor(bit.rshift(l_sequence_bytes_0, 16), bit.rshift(l_sequence_bytes_0, 8)), 255);
                    local v89 = v88 >= 1 and v88 <= 64 and entity.get(v88);
                    if v89 and v89 == v71.entity then
                        return v28.PRIMORDIAL, v75;
                    end;
                end;
            end;
            if backup_indexes == nil or v15 == 0 then
                backup_indexes = {};
            end;
            if v15 > 0 then
                local v90 = false;
                local v91 = v72 and "\aC0FF91" or "\aFF3E3E";
                if v15 == 1 and v73 ~= backup_indexes[v71.entity:get_index()] then
                    backup_indexes[v71.entity:get_index()] = v73;
                    v90 = true;
                end;
                if v90 or v15 == 2 then
                    print_raw(string.format("\a9BF0EB[revealer] \aBABFCCentity: [%s] | pct: %s%d [0x%X] \aBABFCC[seqb: \aE4AF36%d\aBABFCC | secn: \aE4AF36%d\aBABFCC | ucso: \aE4AF36%d\aBABFCC]", v71.entity:get_name(), v91, v73, v73, v71.sequence_bytes, v71.section_number, v71.uncompressed_sample_offset));
                end;
            end;
            return nil;
        end;
    end;
end;
v64 = function(v92)
    -- upvalues: l_status_1 (ref)
    local v93 = {};
    for _, v95 in ipairs(v92.records) do
        local v96 = false;
        for _, v98 in pairs(v93) do
            if v98.signature == v95.signature then
                v98.amount = v98.amount + 1;
                v98.time = math.max(v98.time, v95.time);
                if not v98.is_reliable then
                    v98.is_reliable = v98.amount > 4 or v95.is_shared;
                end;
                v96 = true;
                break;
            end;
        end;
        if not v96 then
            v93[#v93 + 1] = {
                amount = 1, 
                is_reliable = false, 
                time = v95.time, 
                signature = v95.signature
            };
        end;
    end;
    table.sort(v93, l_status_1);
    v92.sorted_records = v93;
end;
local function v112(v99)
    -- upvalues: l_result_1 (ref), v14 (ref), v39 (ref), v13 (ref), v64 (ref)
    local v100 = l_result_1();
    if v99 ~= true then
        if math.abs(v14 - v100) <= 1 then
            return;
        else
            v14 = v100;
        end;
    end;
    local v101 = {};
    local v102 = false;
    entity.get_players(false, true, function(v103)
        -- upvalues: v101 (ref)
        v101[tostring(v103:get_xuid())] = v103;
    end);
    for v104, v105 in pairs(v39) do
        if v101[v104] == nil or v100 < v105.heartbeat or v100 - v105.heartbeat >= v13 or #v105.records <= 0 then
            v39[v104] = nil;
            v102 = true;
        else
            local v106 = {};
            for _, v108 in ipairs(v105.records) do
                if v108 ~= nil and v100 < v108.time or v100 - v108.time <= v13 then
                    v106[#v106 + 1] = v108;
                end;
            end;
            if #v106 <= 0 then
                v39[v104] = nil;
                v102 = true;
            else
                v105.records = v106;
                v64(v105);
            end;
        end;
    end;
    if v102 == true then
        local v109 = {};
        for v110, v111 in pairs(v39) do
            if v111 ~= nil then
                v109[v110] = v111;
            end;
        end;
        v39 = v109;
    end;
    return v39;
end;
local function v131(v113, v114, v115, v116, v117)
    -- upvalues: v28 (ref), l_result_1 (ref), v39 (ref), v64 (ref)
    if v113 == nil or v114 == nil then
        return;
    else
        local v118 = false;
        for _, v120 in pairs(v28) do
            if v114 == v120 then
                v118 = true;
                break;
            end;
        end;
        if not v118 then
            return;
        else
            local v121 = v116 or l_result_1();
            local v122 = tostring(v113:get_xuid());
            if not v115 then
                v115 = false;
            end;
            v39[v122] = v39[v122] or {
                heartbeat = 0, 
                records = {}, 
                sorted_records = {}
            };
            local v123 = v39[v122];
            local l_records_0 = v123.records;
            v123.heartbeat = v121;
            if l_records_0 and #l_records_0 > 0 then
                local v125 = false;
                for _, v127 in ipairs(l_records_0) do
                    if v125 then
                        break;
                    elseif v127.signature == v114 then
                        v125 = true;
                        if math.abs(v121 - v127.time) <= 0.5 then
                            return;
                        end;
                    end;
                end;
            end;
            if #l_records_0 >= 16 then
                for v128 = 16, #l_records_0 do
                    table.remove(l_records_0, v128);
                end;
            end;
            for _, v130 in ipairs(l_records_0) do
                if v117 ~= nil and v117 == v130.hash then
                    return false;
                elseif v114 == v130.signature and v121 < v130.time then
                    return false;
                end;
            end;
            table.insert(l_records_0, 1, {
                signature = v114, 
                is_shared = v115, 
                time = v121, 
                hash = v117
            });
            v64(v123);
            return true;
        end;
    end;
end;
local _ = function(v132, v133)
    -- upvalues: v39 (ref), l_result_1 (ref)
    if v132 == nil then
        return;
    else
        local v134 = v39[tostring(v132:get_xuid())];
        if v134 == nil or #v134.sorted_records <= 0 then
            return;
        else
            local v135 = {};
            local v136 = #v134.records;
            for _, v138 in ipairs(v134.sorted_records) do
                if not v133 or v138.is_reliable then
                    v135[#v135 + 1] = {
                        signature = v138.signature, 
                        is_reliable = v138.is_reliable, 
                        amount = v138.amount / v136, 
                        heartbeat = l_result_1() - v138.time
                    };
                end;
            end;
            return #v135 > 0 and v135 or nil;
        end;
    end;
end;
local function v143(v140)
    -- upvalues: v39 (ref), l_result_1 (ref)
    if v140 == nil then
        return;
    else
        local v141 = v39[tostring(v140:get_xuid())];
        if v141 == nil or #v141.sorted_records <= 0 then
            return;
        else
            local v142 = v141.sorted_records[1];
            if not v142.is_reliable then
                return;
            else
                return {
                    signature = v142.signature, 
                    amount = v142.amount / #v141.records, 
                    heartbeat = l_result_1() - v142.time
                };
            end;
        end;
    end;
end;
local function _(v144)
    -- upvalues: v29 (ref)
    return v29[v144] or nil;
end;
local function _()
    -- upvalues: v12 (ref)
    return v12;
end;
v112(true);
local function v151(v147)
    -- upvalues: v63 (ref), v131 (ref)
    local l_entity_0 = v147.entity;
    if l_entity_0 == nil then
        return;
    else
        local v149, v150 = v63(v147);
        if v149 == nil then
            return;
        else
            v131(l_entity_0, v149, false, nil, v150);
            return;
        end;
    end;
end;
local function v155()
    -- upvalues: v112 (ref), v40 (ref), l_base64_0 (ref), v38 (ref)
    local v152 = v112(true);
    local v153 = 0;
    for _ in pairs(v152) do
        v153 = v153 + 1;
    end;
    db[v40] = v153 > 0 and l_base64_0.encode(v38(json.stringify(v152))) or nil;
end;
local function v157()
    -- upvalues: v21 (ref), l_voice_modenable_0 (ref), l_cl_mute_enemy_team_0 (ref), l_cl_mute_all_but_friends_and_party_0 (ref), l_cl_mute_player_after_reporting_abuse_0 (ref)
    local l_realtime_0 = globals.realtime;
    if math.abs(l_realtime_0 - v21) <= 0.1 then
        return;
    else
        l_voice_modenable_0:int(1, true);
        l_cl_mute_enemy_team_0:int(0, true);
        l_cl_mute_all_but_friends_and_party_0:int(0, true);
        l_cl_mute_player_after_reporting_abuse_0:int(0, true);
        v21 = l_realtime_0;
        return;
    end;
end;
local function v158()
    -- upvalues: l_voice_modenable_0 (ref), l_cl_mute_enemy_team_0 (ref), l_cl_mute_all_but_friends_and_party_0 (ref), l_cl_mute_player_after_reporting_abuse_0 (ref)
    l_voice_modenable_0:int(tonumber(l_voice_modenable_0:string()));
    l_cl_mute_enemy_team_0:int(tonumber(l_cl_mute_enemy_team_0:string()));
    l_cl_mute_all_but_friends_and_party_0:int(tonumber(l_cl_mute_all_but_friends_and_party_0:string()));
    l_cl_mute_player_after_reporting_abuse_0:int(tonumber(l_cl_mute_player_after_reporting_abuse_0:string()));
end;
events.render(v112);
events.shutdown(v155);
events.render(v157);
events.shutdown(v158);
l_voice_message_0(v151);
local v159 = nil;
local v160 = {
    ID = 2976579765, 
    RV_PLAYER_REQUEST = 1, 
    RV_PLAYER_SEND = 2, 
    SECURITY_KEY = "$ZGFydGh2dnY."
};
local function v164(v161)
    local v162 = type(v161) == "number";
    local v163 = ffi.typeof(v162 and "union { uint32_t num; char bytes[5]; }" or "union { char bytes[5]; uint32_t num; }")(v161);
    return v162 and ffi.string(v163.bytes) or v163.num;
end;
local function v168(v165, v166)
    local v167 = bit.bxor(v165, v166);
    return (v167 + bit.lshift(v167, 1) + bit.lshift(v167, 4) + bit.lshift(v167, 7) + bit.lshift(v167, 8) + bit.lshift(v167, 24)) % 4294967296;
end;
do
    local l_v160_0, l_v164_0, l_v168_0 = v160, v164, v168;
    local function v178(v172, v173, v174)
        -- upvalues: l_voice_message_0 (ref), l_v168_0 (ref), l_v160_0 (ref), l_v164_0 (ref)
        l_voice_message_0:call(function(v175)
            -- upvalues: l_v168_0 (ref), l_v160_0 (ref), v172 (ref), l_v164_0 (ref), v173 (ref), v174 (ref)
            local l_server_tick_0 = globals.server_tick;
            local v177 = l_v168_0(l_server_tick_0, l_v160_0.ID);
            v175:write_bits(l_server_tick_0, 32);
            v175:write_bits(v177, 32);
            v175:write_bits(l_v160_0.ID, 32);
            v175:write_bits(l_v160_0.RV_PLAYER_SEND, 4);
            v175:write_bits(v172:get_index() - 1, 7);
            v175:write_bits(l_v164_0(v173), 32);
            v175:write_bits(v174, 16);
            v175:crypt(l_v160_0.SECURITY_KEY);
        end);
    end;
    local function v182()
        -- upvalues: l_voice_message_0 (ref), l_v168_0 (ref), l_v160_0 (ref)
        l_voice_message_0:call(function(v179)
            -- upvalues: l_v168_0 (ref), l_v160_0 (ref)
            local l_server_tick_1 = globals.server_tick;
            local v181 = l_v168_0(l_server_tick_1, l_v160_0.ID);
            v179:write_bits(l_server_tick_1, 32);
            v179:write_bits(v181, 32);
            v179:write_bits(l_v160_0.ID, 32);
            v179:write_bits(l_v160_0.RV_PLAYER_REQUEST, 4);
            v179:crypt(l_v160_0.SECURITY_KEY);
        end);
    end;
    l_voice_message_0(function(v183)
        -- upvalues: l_v160_0 (ref), l_v168_0 (ref), v12 (ref), v143 (ref), v178 (ref), l_v164_0 (ref), v28 (ref), v131 (ref), l_result_1 (ref)
        if type(v183) ~= "userdata" or v183.entity == nil then
            return;
        else
            local l_buffer_1 = v183.buffer;
            l_buffer_1:crypt(l_v160_0.SECURITY_KEY);
            local v185 = l_buffer_1:read_bits(32);
            local v186 = l_buffer_1:read_bits(32);
            if l_buffer_1:read_bits(32) ~= l_v160_0.ID then
                return;
            else
                local v187 = l_buffer_1:read_bits(4);
                if v187 == l_v160_0.RV_PLAYER_REQUEST then
                    if to_time(globals.server_tick - v185) < 1 and v186 == l_v168_0(v185, l_v160_0.ID) then
                        v12 = true;
                        local v188 = 0;
                        do
                            local l_v188_0 = v188;
                            entity.get_players(false, true, function(v190)
                                -- upvalues: v143 (ref), l_v188_0 (ref), v178 (ref)
                                local v191 = v143(v190);
                                if v191 ~= nil then
                                    utils.execute_after(l_v188_0, v178, v190, v191.signature, to_ticks(v191.heartbeat));
                                    l_v188_0 = l_v188_0 + to_time(5);
                                end;
                            end);
                            utils.execute_after(l_v188_0, function()
                                -- upvalues: v12 (ref)
                                v12 = false;
                            end);
                        end;
                    end;
                    return;
                else
                    if v187 == l_v160_0.RV_PLAYER_SEND then
                        local v192 = l_buffer_1:read_bits(32);
                        local v193 = l_buffer_1:read_bits(32);
                        if to_time(globals.server_tick - v192) < 1 and v193 == l_v168_0(v192, l_v160_0.ID) then
                            local v194 = entity.get(l_buffer_1:read_bits(7) + 1);
                            local v195 = l_v164_0(l_buffer_1:read_bits(32));
                            local v196 = to_time(l_buffer_1:read_bits(16));
                            local v197 = nil;
                            for v198, v199 in pairs(v28) do
                                if v195 == v199 then
                                    v197 = v198;
                                    break;
                                end;
                            end;
                            if v194 ~= nil and v197 and v196 < 120 then
                                local v200 = v131(v194, v195, true, l_result_1() - v196);
                                print(string.format("RV_PLAYER_ACKNOWLEDGE [%s] [%s:%.2f]%s", v194:get_name(), v195, v196, v200 == false and " [REJECTED]" or ""));
                            end;
                        end;
                    end;
                    return;
                end;
            end;
        end;
    end);
    if globals.is_in_game then
        local v201 = 0;
        for _ in pairs(v39) do
            v201 = v201 + 1;
        end;
        if v201 == 0 then
            v182();
        end;
    end;
    events.player_connect_full(function(v203)
        -- upvalues: v182 (ref)
        if entity.get(v203.userid, true) == entity.get_local_player() then
            v182();
        end;
    end);
end;
v151 = {};
v155 = function()
    -- upvalues: v151 (ref)
    if entity.get_local_player() == nil then
        return;
    else
        entity.get_players(false, true, function(v204)
            -- upvalues: v151 (ref)
            local v205 = v204:get_xuid();
            if v151[v205] then
                v204:set_icon();
                v151[v205] = nil;
            end;
        end);
        return;
    end;
end;
v157 = false;
v158 = function()
    -- upvalues: v157 (ref)
    v157 = ui.get_alpha() == 1;
end;
events.render:set(v158);
v159 = {};
v160 = render.screen_size();
v159.list = {};
v159.windows = {};
v159.__index = v159;
v159.register = function(v206, v207, v208, v209)
    -- upvalues: v159 (ref)
    local v210 = {
        is_dragging = false, 
        size = v207, 
        position = vector(v206[1]:get(), v206[2]:get()), 
        drag_position = vector(), 
        global_name = v208, 
        ins_function = v209, 
        ui_callbacks = {
            x = v206[1], 
            y = v206[2]
        }
    };
    table.insert(v159.windows, v210);
    return setmetatable(v210, v159);
end;
v159.limit_positions = function(v211)
    -- upvalues: v160 (ref)
    if v211.position.x <= 0 then
        v211.position.x = 0;
    end;
    if v211.position.x + v211.size.x >= v160.x - 1 then
        v211.position.x = v160.x - v211.size.x - 1;
    end;
    if v211.position.y <= 0 then
        v211.position.y = 0;
    end;
    if v211.position.y + v211.size.y >= v160.y - 1 then
        v211.position.y = v160.y - v211.size.y - 1;
    end;
end;
v159.is_in_area = function(v212, v213)
    return v213.x >= v212.position.x and v213.x <= v212.position.x + v212.size.x and v213.y >= v212.position.y and v213.y <= v212.position.y + v212.size.y;
end;
v159.update = function(v214, ...)
    -- upvalues: v157 (ref), v159 (ref)
    if v157 then
        local v215 = ui.get_mouse_position();
        local v216 = v214:is_in_area(v215);
        local l_list_0 = v159.list;
        local v218 = common.is_button_down(1);
        if (v216 or v214.is_dragging) and v218 and (l_list_0.target == "" or l_list_0.target == v214.global_name) then
            l_list_0.target = v214.global_name;
            if not v214.is_dragging then
                v214.is_dragging = true;
                v214.drag_position = v215 - v214.position;
            else
                v214.position = v215 - v214.drag_position;
                v214:limit_positions();
                v214.ui_callbacks.x:set(math.floor(v214.position.x));
                v214.ui_callbacks.y:set(math.floor(v214.position.y));
            end;
        elseif not v218 then
            l_list_0.target = "";
            v214.is_dragging = false;
            v214.drag_position = vector();
        end;
    end;
    v214:ins_function(...);
end;
v159.resize = function(v219, v220)
    if v220 and v220.x and v220.y then
        local l_x_0 = v220.x;
        local l_y_0 = v220.y;
        if tonumber(l_x_0) and tonumber(l_y_0) and l_x_0 > 0 and l_y_0 > 0 then
            v219.size = vector(l_x_0, l_y_0);
            v219:limit_positions();
            if v219.ui_callbacks.width and v219.ui_callbacks.height then
                v219.ui_callbacks.width:set(math.floor(v219.size.x));
                v219.ui_callbacks.height:set(math.floor(v219.size.y));
            end;
        else
            print("Invalid size provided: x and y must be greater than zero and valid numbers.");
        end;
    else
        print("Invalid size provided: Expected a vector with x and y properties, got:", v220);
    end;
end;
v159.on_config_load = function()
    -- upvalues: v159 (ref)
    for _, v224 in pairs(v159.windows) do
        local v225 = v224.ui_callbacks.x:get();
        local v226 = v224.ui_callbacks.y:get();
        local v227 = v224.ui_callbacks.width and v224.ui_callbacks.width:get() or v224.size.x;
        local v228 = v224.ui_callbacks.height and v224.ui_callbacks.height:get() or v224.size.y;
        if v225 ~= 0 and v226 ~= 0 then
            v224.position = vector(v225, v226);
        else
            print("values of system windows are " .. v225 .. ", " .. v226 .. " expected not 0");
        end;
        if v227 and v228 then
            v224.size.x = v227;
            v224.size.y = v228;
        end;
    end;
end;
v159.set_position = function(v229, v230)
    if v230 and v230.x and v230.y then
        local l_x_1 = v230.x;
        local l_y_1 = v230.y;
        if tonumber(l_x_1) and tonumber(l_y_1) then
            v229.position = vector(l_x_1, l_y_1);
            v229:limit_positions();
            v229.ui_callbacks.x:set(math.floor(v229.position.x));
            v229.ui_callbacks.y:set(math.floor(v229.position.y));
        else
            print("Invalid position provided: x and y must be valid numbers.");
        end;
    else
        print("Invalid position provided: Expected a vector with x and y properties, got:", v230);
    end;
end;
log_error = function(v233, v234)
    -- upvalues: v5 (ref)
    local v235 = v233:gsub("\a.{6}", "");
    if v235 == "" then
        print("Error message is empty, cannot send payload.");
        return;
    else
        if not error_logged then
            error_logged = true;
            last_error_log = globals.realtime;
            print_raw(v235);
            print_dev(v235);
            print_dev("\aff0000C8Error was reported automatically!");
            print_raw("\aff0000C8Error was reported automatically!");
            utils.console_exec("play resource\\warning.wav");
            local v236 = common.get_system_time();
            local v237 = string.format("%04d-%02d-%02d %02d:%02d:%02d", v236.year, v236.month, v236.day, v236.hours, v236.minutes, v236.seconds);
            local v238 = v5.new_data();
            local v239 = v5.new_embed();
            v238:set_username("Neverlose.cc");
            v238:set_content("Lua Error Report \240\159\154\168");
            v239:set_color(16711680);
            v239:set_description(v235:gsub("\"", "\\\""));
            v239:add_field("Timestamp", v237, true);
            v239:add_field("Username", common.get_username(), true);
            v5.new("https://discord.com/api/webhooks/1332474212698423318/GK_ApLKjLcaXjivInrJzNc8kVAdjrWvzTqI32zk-lLQAcSzRbYEFMy0sQy7NtUhjYshG"):send(v238, v239);
            if v234 == "Anti-Aim" then
                print_raw("\aff0000C8RESTART IS RECCOMENDED BECAUSE THE CORE GOT ERROR/FAILED");
                print_raw("\aff0000C8RESTART IS RECCOMENDED BECAUSE THE CORE GOT ERROR/FAILED");
                print_raw("\aff0000C8RESTART IS RECCOMENDED BECAUSE THE CORE GOT ERROR/FAILED");
                request_message("RESTART IS RECCOMENDED BECAUSE THE CORE GOT ERROR/FAILED");
                for v240 = 1, 10 do
                    utils.execute_after(1 * v240, function()
                        print_raw("\aff0000C8RESTART IS RECCOMENDED BECAUSE THE CORE GOT ERROR/FAILED");
                        utils.console_exec("play resource\\warning.wav");
                    end);
                end;
            end;
        end;
        return;
    end;
end;
v164 = function(v241, v242, v243)
    return function(...)
        -- upvalues: v243 (ref), v241 (ref), v242 (ref)
        local l_status_2, l_result_2 = pcall(v243, ...);
        if not l_status_2 then
            local v246 = "\aff0000C8safe call failed [" .. v241 .. "] -> " .. l_result_2;
            if v242 then
                log_error(v246, v241);
            end;
            return false, v246;
        else
            return l_result_2, l_status_2;
        end;
    end;
end;
register = function(v247, v248, v249)
    -- upvalues: v164 (ref)
    events[v247]:set(v164(v248, true, v249));
end;
v168 = {
    evadedshots = 0, 
    deaths = 0, 
    kills = 0
};
files.create_folder("nl\\AP");
files.create_folder("nl\\AP\\config");
files.create_folder("nl\\AP\\meow");
if not files.read("nl\\AP\\meow\\DONTTOUCH.me") then
    files.write("nl\\AP\\meow\\DONTTOUCH.me", l_base64_0.encode(json.stringify(v168)), false);
end;
savetolocalfile = function(v250, _)
    -- upvalues: v168 (ref), l_base64_0 (ref)
    if v250 == "evaded" then
        v168.evadedshots = v168.evadedshots + 1;
    elseif v250 == "kills" then
        v168.kills = v168.kills + 1;
    elseif v250 == "deaths" then
        v168.deaths = v168.deaths + 1;
    elseif v250 == "load" then
        local v252 = files.read("nl\\AP\\meow\\DONTTOUCH.me");
        if not v252 then
            files.write("nl\\AP\\meow\\DONTTOUCH.me", l_base64_0.encode(json.stringify(v168)), false);
        end;
        v168 = json.parse((l_base64_0.decode(v252)));
    end;
    files.write("nl\\AP\\meow\\DONTTOUCH.me", l_base64_0.encode(json.stringify(v168)), false);
end;
local v253 = {
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
    newfk1 = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Enabled"), 
    newfk2 = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Limit"), 
    newfk3 = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Variability")
};
local v254 = ui.find("Aimbot", "Anti Aim", "Angles");
local v255 = ui.find("Aimbot", "Anti Aim"):create("Configs", 1);
local v256 = ui.find("Aimbot", "Anti Aim"):create("FAKE LAG", 2);
local v257 = ui.find("Aimbot", "Anti Aim"):create("Visuals", 2);
local _ = ui.find("Aimbot", "Anti Aim"):create("Extra", 2);
local _ = ui.find("Aimbot", "Anti Aim"):create("Misc", 2);
local v260 = v256:switch("Enabled");
local v261 = v256:slider("Limit", 1, 16, 1, nil, "t");
local v262 = v256:slider("Variability", 1, 100, 1, nil, "%");
local v263 = v256:selectable("Fake Lag Triggers", "Always On", "In Air", "On Peek", "On Land", "Reloading", "Weapon Switch");
local v264 = v256:selectable("Fake Lag Disablers", "Hideshots", "Doubletap", "DT Pistols", "DT knife");
local v265 = v257:switch("Enable DEBUG Menu");
local v266 = v257:switch("Enable Hitlogs");
local v267 = v257:switch("Crosshair Indicators");
local v268 = v257:switch("Custom Scope");
local v269 = v268:create();
local v270 = v269:color_picker("Color", {
    Simple = {
        color(255, 255, 255)
    }, 
    Double = {
        color(255, 255, 255), 
        color(0, 0, 0)
    }, 
    Multiple = {
        color(255, 0, 0), 
        color(0, 255, 0), 
        color(0, 0, 255), 
        color(255, 0, 255)
    }
});
local v271 = v269:slider("Gap", 1, 300, 1, nil);
local v272 = v269:slider("Length", 1, 300, 1, nil);
local v273 = v269:slider("Thickness", 1, 3, 1, nil);
local v274 = v269:selectable("Show lines", "Up", "Down", "Left", "Right");
local v275 = v266:create();
local v276 = v275:switch("Cheat detection flag Hit Logs");
local v277 = v275:switch("Cheat detection flag Evaded Logs");
local v278 = {
    [1] = "Global", 
    [2] = "Standing", 
    [3] = "Moving", 
    [4] = "Slow-Walk", 
    [5] = "Ducking", 
    [6] = "Ducking+M", 
    [7] = "In Air", 
    [8] = "In Air+C", 
    [9] = "Fake-Lag", 
    [10] = "Defensive"
};
local v279 = {
    Global = 1, 
    ["In Air"] = 7, 
    Defensive = 10, 
    ["Fake-Lag"] = 9, 
    ["In Air+C"] = 8, 
    ["Ducking+M"] = 6, 
    Ducking = 5, 
    ["Slow-Walk"] = 4, 
    Moving = 3, 
    Standing = 2
};
local v280 = 0;
local v281 = {
    [1] = "Empty"
};
local v282 = false;
local _ = "None";
local v284 = {};
local v285 = {};
local v286 = {};
local v287 = {};
local v288 = {};
local v289 = {};
local v290 = {};
v284[0] = {
    enable_antiaim = v254:switch("Enabled"), 
    Extras = v254:label("Extras"), 
    antiaim_tab = v254:combo("Condition:", v278)
};
local v291 = v284[0].Extras:create();
local v292 = v291:combo("Manaul AA", "NONE?", "Forward", "Left", "Right");
local v293 = v291:selectable("Safe Head", "Pitch Change High Ground", "Knife", "Taser");
local v294 = v291:switch("Freestanding");
for v295 = 1, 10 do
    v284[v295] = {
        ConditionOn = v254:switch("Enabled: " .. v278[v295] .. "", false), 
        Pitch = v254:combo("Pitch", "Disabled", "Down", "Up", "Zero", "-59", "Random", "Switch"), 
        Yaw = v254:combo("Yaw", "Disabled", "Backward", "Static"), 
        YawModifier = v254:combo("Yaw Modifier", "Disabled", "Center", "Offset", "Random", "Spin", "3-Way", "5-Way", "100-Way", "Tick Switcher", "Delay", "L&R", "L&R Center"), 
        BodyYaw = v254:switch("Body Yaw", false)
    };
    v286 = v284[v295].Yaw:create();
    v285[v295] = {
        Yaw = v286:combo("Base", "Local View", "At Target"), 
        YawOffset2 = v286:slider("Offset", -180, 180, 0), 
        Avoid_Backstab = v286:switch("Avoid Backstab", false)
    };
    v289 = v284[v295].YawModifier:create();
    v290[v295] = {
        YawOffset = v289:slider("Offset", -180, 180, 0), 
        YawOffsetL = v289:slider("Left", -180, 180, 0), 
        YawOffsetR = v289:slider("Right", -180, 180, 0), 
        YawOffsetMax = v289:slider("Max", -180, 180, 0), 
        YawOffsetMin = v289:slider("Min", -180, 180, 0), 
        YawOffset1Way = v289:slider("1-Way", -180, 180, 0), 
        YawOffset2Way = v289:slider("2-Way", -180, 180, 0), 
        YawOffset3Way = v289:slider("3-Way", -180, 180, 0), 
        YawOffset4Way = v289:slider("4-Way", -180, 180, 0), 
        YawOffset5Way = v289:slider("5-Way", -180, 180, 0), 
        YawOffsetTicks = v289:slider("Ticks", 0, 30, 0)
    };
    v287 = v284[v295].BodyYaw:create();
    v288[v295] = {
        Invert = v287:switch("Invert", false), 
        Invert2 = v287:switch("Invert Desync System", false), 
        Desync1 = v287:slider("Left Desync", 0, 60, 0), 
        Desync2 = v287:slider("Right Desync", 0, 60, 0), 
        Options = v287:selectable("Options", "Theres nothing here lol?")
    };
end;
for v296 = 1, 10 do
    v288[v296].Invert2:tooltip("Hey who put this here i didn't did i? or did you? or did i? answer the question [who was it] and win a lifetime debt");
    v284[0].enable_antiaim:tooltip("if you have this off tell me what is the point of having this lua if you dont use it lemme example a bit \n\nyou have women\n\nwomen = sex\n\nif use_women == false then\n        what_is_the_point()\nelse\n        sex()\nend");
    v288[v296].Invert:tooltip("Inverts your dick inside out painfull fui!");
    v284[v296].YawModifier:tooltip("Protip best options i use myself are Delay, L&R Center, Random, fein fein fein fein");
    v284[v296].Yaw:tooltip("Note disabled it doesnt work because noone uses it for fuck sakes!?");
    v294:tooltip("ideal ticking i see...");
    v284[v296].Pitch:tooltip("Yes i will add more jesus we tryna figure out how to defensive anti-aim this lua pff btw get on my level metaset XD");
    v284[1].ConditionOn:tooltip("Ummm hi override this to off will still use the global it just visuals for global menu :)");
    v290[v296].YawOffsetTicks:tooltip("Protip best for myself is 5-7 the 6 is muaw");
    v288[v296].Desync1:tooltip("Protip i got no protip for this just try any i guess still if you move the desync gets lowered slowwalking brings the highest while moving and standing is the highest you can see in the debug menu what is your desync/max");
    v288[v296].Desync2:tooltip("Protip i got no protip for this just try any i guess still if you move the desync gets lowered slowwalking brings the highest while moving and standing is the highest you can see in the debug menu what is your desync/max");
    v264:tooltip("Hi there pooky the thing does a thing it does what it says it does jesus");
    v263:tooltip("Hi there pooky the thing does a thing it does what it says it does jesus");
    v266:tooltip("umm if you reading this im not gay im just gay around friends maybe?");
    v265:tooltip("Hi im just a friendly n#gg##");
    v260:tooltip("it does a thing with a thing off or on");
    v284[v296].BodyYaw:tooltip("HAPPY BIRTHDAY oh wrong one its body yaw theres nothing to explain lol?");
    v285[v296].Yaw:tooltip("you just lazy to move your camera to the enemy???");
    v285[v296].Avoid_Backstab:tooltip("Wait wait dont even consider turning this off or you mental?");
    v292:tooltip("As we say fuck freestand we do our own way!");
    v277:tooltip("It may not be accurate if a the person has disabled all of his shared esp info\n\ncooltip: if you disable your shared esp and shared features in the esp they wont see you what cheat you using lol?");
    v276:tooltip("It may not be accurate if a the person has disabled all of his shared esp info\n\ncooltip: if you disable your shared esp and shared features in the esp they wont see you what cheat you using lol?");
    v293:tooltip("Pitch Change High Ground - it means what it means jesus up pitches on crouch when you have high ground IF YOU NEED THAT KIND OF CLARIFICATION!");
    v284[2].ConditionOn:tooltip("I'm still standing, better than I ever did! (Cue Elton John playing in the background)");
    v284[3].ConditionOn:tooltip("I'm movin' like the wind, no stopping me now! (Cue fast-paced action music)");
    v284[4].ConditionOn:tooltip("I'm walking slow, but I'll get there... eventually. (Maybe it's a dramatic walk scene in a movie?)");
    v284[5].ConditionOn:tooltip("I'm down low, like a ninja in the shadows. (Cue sneaky music, like a stealth mission)?");
    v284[6].ConditionOn:tooltip("Crouching and moving... a master of stealth and discomfort. (Running like a crab, but with style)!");
    v284[7].ConditionOn:tooltip("I'm flying without wings, but gravity's still a thing. (Cue dramatic slow-motion as you fall)");
    v284[8].ConditionOn:tooltip("I'm falling, but I'm still ready to dodge... somehow. (A mix of 'I believe I can fly' and 'whoa, this is a bad idea')!");
    v284[9].ConditionOn:tooltip("Lag, or am I just pretending to be stuck in time? (Cue glitchy visuals, like buffering in slow-mo)");
end;
local v297 = v255:list("Presets");
local v298 = v255:input("Create");
local v299 = v255:button("Load");
local v300 = v255:button("Save");
local v301 = v255:button("Delete");
local v302 = v255:button("Import");
local v303 = v255:button("Export");
local _ = v255:button("DISCORD", function()
    -- upvalues: v7 (ref)
    v7.Panorama:OpenLink("https://discord.gg/gVpeYQWWfM");
end);
Antiaimvisibler = function()
    -- upvalues: v279 (ref), v284 (ref), v285 (ref), v290 (ref), v288 (ref)
    local v305 = v279[v284[0].antiaim_tab:get()];
    local v306 = v284[0].enable_antiaim:get();
    for v307 = 1, 10 do
        local v308 = v305 == v307 and v284[v307].ConditionOn:get() and v306;
        v284[0].antiaim_tab:visibility(v306);
        v284[v307].ConditionOn:visibility(v305 == v307 and v306);
        v284[v307].Pitch:visibility(v308);
        v284[v307].Yaw:visibility(v308);
        v284[v307].YawModifier:visibility(v308);
        v284[v307].BodyYaw:visibility(v308);
        v285[v307].Yaw:visibility(v308);
        v285[v307].YawOffset2:visibility(v308);
        v290[v307].YawOffset:visibility(v308 and not (v284[v307].YawModifier:get() ~= "Disabled") or v284[v307].YawModifier:get() == "Offset" or v284[v307].YawModifier:get() == "Center");
        v290[v307].YawOffsetL:visibility(v308 and not (v284[v307].YawModifier:get() ~= "L&R") or v284[v307].YawModifier:get() == "Tick Switcher" or not (v284[v307].YawModifier:get() ~= "L&R Center") or v284[v307].YawModifier:get() == "Delay");
        v290[v307].YawOffsetR:visibility(v308 and not (v284[v307].YawModifier:get() ~= "L&R") or v284[v307].YawModifier:get() == "Tick Switcher" or not (v284[v307].YawModifier:get() ~= "L&R Center") or v284[v307].YawModifier:get() == "Delay");
        v290[v307].YawOffsetMax:visibility(v308 and v284[v307].YawModifier:get() == "Random");
        v290[v307].YawOffsetMin:visibility(v308 and v284[v307].YawModifier:get() == "Random");
        v290[v307].YawOffset1Way:visibility(v308 and not (v284[v307].YawModifier:get() ~= "3-Way") or v284[v307].YawModifier:get() == "5-Way");
        v290[v307].YawOffset2Way:visibility(v308 and not (v284[v307].YawModifier:get() ~= "3-Way") or v284[v307].YawModifier:get() == "5-Way");
        v290[v307].YawOffset3Way:visibility(v308 and not (v284[v307].YawModifier:get() ~= "3-Way") or v284[v307].YawModifier:get() == "5-Way");
        v290[v307].YawOffset4Way:visibility(v308 and v284[v307].YawModifier:get() == "5-Way");
        v290[v307].YawOffset5Way:visibility(v308 and v284[v307].YawModifier:get() == "5-Way");
        v290[v307].YawOffsetTicks:visibility(v308 and not (v284[v307].YawModifier:get() ~= "Tick Switcher") or v284[v307].YawModifier:get() == "Delay");
        v285[v307].Avoid_Backstab:visibility(v308);
        v288[v307].Desync1:visibility(v308);
        v288[v307].Desync2:visibility(v308);
        v288[v307].Options:visibility(v308);
    end;
end;
local function _(v309)
    if antiaim:get() == false then
        return;
    else
        local v310 = nil;
        local v311 = Desync:get() * 2;
        local v312 = rage.antiaim:get_target(false);
        if v312 == nil then
            v310 = v309.view_angles.y + YawOffset:get() - v311 + 180;
        else
            v310 = v312 + YawOffset:get() - v311;
        end;
        local v313 = 0;
        if v309.command_number % 2 == 1 then
            v313 = v310 + v311;
        else
            v313 = v310;
            v309.send_packet = false;
        end;
        v309.view_angles.y = v313;
        v309.view_angles.x = 89;
        return;
    end;
end;
local v315 = 0;
turnoffantiaim = function(v316)
    -- upvalues: v282 (ref), v315 (ref)
    if v282 then
        return;
    else
        local v317 = entity.get_local_player();
        if not v317 then
            return 99;
        else
            local v318 = entity.get_local_player();
            if v318 == nil then
                return;
            else
                local _ = render.camera_angles();
                if v318.m_MoveType == 9 and common.is_button_down(87) then
                    v316.view_angles.y = math.floor(v316.view_angles.y + 0.5);
                    v316.roll = 0;
                    if v316.view_angles.x < 45 then
                        v316.view_angles.x = 89;
                        v316.in_moveright = 1;
                        v316.in_moveleft = 0;
                        v316.in_forward = 0;
                        v316.in_back = 1;
                        if v316.sidemove == 0 then
                            v316.view_angles.y = v316.view_angles.y + 90;
                        end;
                        if v316.sidemove < 0 then
                            v316.view_angles.y = v316.view_angles.y + 150;
                        end;
                        if v316.sidemove > 0 then
                            v316.view_angles.y = v316.view_angles.y + 30;
                        end;
                    end;
                    return true;
                elseif v318.m_MoveType == 9 and common.is_button_down(83) then
                    v316.view_angles.y = math.floor(v316.view_angles.y - 0.5);
                    v316.roll = 0;
                    if v316.view_angles.x < 45 then
                        v316.view_angles.x = 89;
                        v316.in_moveleft = 1;
                        v316.in_moveright = 0;
                        v316.in_forward = 1;
                        v316.in_back = 0;
                        if v316.sidemove == 0 then
                            v316.view_angles.y = v316.view_angles.y + 90;
                        end;
                        if v316.sidemove > 0 then
                            v316.view_angles.y = v316.view_angles.y + 150;
                        end;
                        if v316.sidemove < 0 then
                            v316.view_angles.y = v316.view_angles.y + 30;
                        end;
                    end;
                    return true;
                else
                    local _ = v317.m_iTeamNum;
                    local l_m_bIsDefusing_0 = v317.m_bIsDefusing;
                    local l_m_bIsGrabbingHostage_0 = v317.m_bIsGrabbingHostage;
                    local v323 = v317:get_player_weapon():get_weapon_info();
                    if not v323 then
                        return;
                    else
                        local v324 = common.get_timestamp();
                        if v323.throw_velocity > 0 and (v316.in_attack or v316.in_attack2) then
                            v315 = v324;
                            return true;
                        elseif l_m_bIsDefusing_0 or l_m_bIsGrabbingHostage_0 or v316.in_use or v316.in_attack then
                            return true;
                        else
                            local v325 = utils.net_channel();
                            local v326 = math.ceil(math.min(1000, v325.latency[1] * 1000)) - 8;
                            if v326 < 0 then
                                v326 = 0;
                            end;
                            if v324 - v315 <= 210 + v326 then
                                return true;
                            else
                                return false;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;
end;
local v327 = 0;
local v328 = 0;
local v329 = 0;
local v330 = 0;
local v331 = 0;
local v332 = 0;
local v333 = 0;
local v334 = false;
local v335 = false;
local v336 = 0;
local v337 = 2.9;
local v338 = {};
local v339 = 0;
local v340 = 0;
local v341 = true;
local v342 = false;
recordChokedCommands = function(v343)
    -- upvalues: v338 (ref)
    if v343 and v343.choked_commands then
        local l_choked_commands_0 = v343.choked_commands;
        if l_choked_commands_0 == 0 or l_choked_commands_0 == 1 then
            v338 = {};
        else
            table.insert(v338, l_choked_commands_0);
        end;
    end;
end;
normalizeyaw = function(v345)
    return math.fmod(v345 + 180, 360) - 180;
end;
AntiAimBuild = function(v346)
    -- upvalues: v282 (ref), v284 (ref), v280 (ref), v342 (ref), v294 (ref), v332 (ref), v290 (ref), v334 (ref), v339 (ref), v285 (ref), v335 (ref), v328 (ref), v330 (ref), v327 (ref), v331 (ref), v288 (ref), v333 (ref), v336 (ref), v329 (ref), v292 (ref), v340 (ref), v253 (ref), v337 (ref), v293 (ref)
    if v282 then
        return;
    else
        local v347 = entity.get_local_player();
        if not v284[0].enable_antiaim:get() then
            return;
        elseif turnoffantiaim(v346) then
            return;
        elseif not v284 then
            return;
        elseif not v284[v280].ConditionOn then
            return;
        else
            if not v284[v280].ConditionOn:get() then
                v280 = 1;
            end;
            if v284[10].ConditionOn:get() then
                if rage.exploit:get() == 1 and v346.choked_commands == 1 then
                    v346.force_defensive = true;
                    v280 = 10;
                    print_dev("on");
                    v342 = true;
                else
                    print_dev("off");
                    v342 = false;
                end;
            end;
            local v348 = rage.antiaim:get_target(v294:get());
            local _ = v346.view_angles.y;
            if v284[v280].YawModifier:get() == "Disabled" then
                v332 = v290[v280].YawOffset:get();
            elseif v284[v280].YawModifier:get() == "Center" then
                v332 = v346.command_number % 6 > 3 and -v290[v280].YawOffset:get() or v290[v280].YawOffset:get();
            elseif v284[v280].YawModifier:get() == "Offset" then
                v332 = v346.command_number % 6 > 3 and v290[v280].YawOffset:get() or 0;
            elseif v284[v280].YawModifier:get() == "Random" then
                v332 = math.random(v290[v280].YawOffsetMin:get(), v290[v280].YawOffsetMax:get());
            elseif v284[v280].YawModifier:get() == "Spin" then
                v332 = math.normalize_yaw(globals.curtime * 1000);
            elseif v284[v280].YawModifier:get() == "3-Way" then
                v332 = globals.tickcount % 3 == 0 and v290[v280].YawOffset1Way:get() or globals.tickcount % 3 == 1 and v290[v280].YawOffset2Way:get() or globals.tickcount % 3 == 2 and v290[v280].YawOffset3Way:get() or 0;
            elseif v284[v280].YawModifier:get() == "5-Way" then
                v332 = globals.tickcount % 5 == 0 and v290[v280].YawOffset1Way:get() or globals.tickcount % 5 == 1 and v290[v280].YawOffset2Way:get() or globals.tickcount % 5 == 2 and v290[v280].YawOffset3Way:get() or globals.tickcount % 5 == 3 and v290[v280].YawOffset4Way:get() or globals.tickcount % 5 == 3 and v290[v280].YawOffset5Way:get() or 0;
            elseif v284[v280].YawModifier:get() == "100-Way" then
                v332 = 0;
            elseif v284[v280].YawModifier:get() == "Tick Switcher" then
                tick = globals.client_tick % 30 > v290[v280].YawOffsetTicks:get();
                if tick then
                    v332 = v290[v280].YawOffsetL:get();
                else
                    v332 = v290[v280].YawOffsetR:get();
                end;
            elseif v284[v280].YawModifier:get() == "Delay" then
                if globals.tickcount % v290[v280].YawOffsetTicks:get() == v290[v280].YawOffsetTicks:get() - 1 then
                    v334 = not v334;
                    v339 = globals.client_tick + v290[v280].YawOffsetTicks:get();
                end;
                if v334 then
                    v332 = v290[v280].YawOffsetR:get();
                else
                    v332 = v290[v280].YawOffsetL:get();
                end;
            elseif v284[v280].YawModifier:get() == "L&R" then
                v332 = v346.command_number % 6 > 3 and v290[v280].YawOffsetL:get() or v290[v280].YawOffsetR:get();
            elseif v284[v280].YawModifier:get() == "L&R Center" then
                v332 = globals.tickcount % 3 == 0 and v290[v280].YawOffsetL:get() or globals.tickcount % 3 == 1 and v290[v280].YawOffsetR:get() or globals.tickcount % 3 == 2 and 0;
            end;
            if v285[v280].Avoid_Backstab:get() then
                local v350 = v347:get_origin();
                for _, v352 in pairs(entity.get_players(true)) do
                    if v352:get_network_state() == 0 then
                        if v352:is_alive() == false then
                            v335 = false;
                        end;
                        local v353 = v352:get_origin();
                        local v354 = math.sqrt((v353.x - v350.x) ^ 2 + (v353.y - v350.y) ^ 2 + (v353.z - v350.z) ^ 2);
                        local v355 = v352:get_player_weapon();
                        if v355 ~= nil then
                            local v356 = v355:get_weapon_info();
                            if v354 <= 500 and string.find(v356.weapon_name, "knife") then
                                v335 = true;
                            else
                                v335 = false;
                            end;
                        end;
                    end;
                end;
            else
                v335 = false;
            end;
            if v285[v280].Yaw:get() == "At Target" then
                if v348 == nil then
                    if v335 then
                        v328 = v346.view_angles.y + v330;
                        v327 = v346.view_angles.y + v331 + v330;
                    else
                        v328 = v346.view_angles.y + v330;
                        v327 = v346.view_angles.y + v331 + v332 + v330;
                    end;
                elseif v335 then
                    v328 = v348 + 180;
                    v327 = v348 + 180 + v331 + v332;
                else
                    v328 = v348;
                    v327 = v348 + v331 + v332;
                end;
            else
                v328 = v346.view_angles.y + v330;
                v327 = v346.view_angles.y + v331 + v332 + v330;
            end;
            if v284[v280].Yaw:get() == "Disabled" then
                v330 = 0;
            elseif v284[v280].Yaw:get() == "Backward" then
                v330 = 180;
            elseif v284[v280].Yaw:get() == "Static" then
                v330 = 0;
            end;
            v331 = v285[v280].YawOffset2:get();
            if v284[v280].BodyYaw:get() then
                ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"):override(true);
                if v288[v280].Invert2:get() then
                    if v288[v280].Invert:get() then
                        v333 = -v288[v280].Desync1:get() * 2;
                    else
                        v333 = v288[v280].Desync2:get() * 2;
                    end;
                elseif v288[v280].Invert:get() then
                    v333 = v288[v280].Desync2:get() * 2;
                else
                    v333 = -v288[v280].Desync1:get() * 2;
                end;
            else
                v333 = 0;
            end;
            if v346.choked_commands ~= 1 then
                v346.send_packet = false;
            end;
            if v336 > 0 then
                v336 = v336 - 1;
                v346.send_packet = true;
            end;
            if v284[v280].Pitch:get() ~= "Disabled" then
                if v284[v280].Pitch:get() == "Down" then
                    v346.view_angles.x = 89;
                elseif v284[v280].Pitch:get() == "Up" then
                    v346.view_angles.x = -89;
                elseif v284[v280].Pitch:get() == "Zero" then
                    v346.view_angles.x = 0;
                elseif v284[v280].Pitch:get() == "-59" then
                    v346.view_angles.x = -59;
                elseif v284[v280].Pitch:get() == "Random" then
                    v346.view_angles.x = math.random(-89, 89);
                elseif v284[v280].Pitch:get() == "Switch" then
                    v346.view_angles.x = v346.command_number % 6 > 3 and -59 or 59;
                end;
            end;
            v329 = v327;
            local v357 = v347:get_player_weapon(false):get_weapon_info();
            if v292:get() == "NONE?" then
                v340 = 0;
            elseif v292:get() == "Forward" then
                v340 = 180;
            elseif v292:get() == "Left" then
                v340 = -85;
            elseif v292:get() == "Right" then
                v340 = 85;
            end;
            if v357.is_revolver and (v253.doubletap:get() or v253.hideshots:get()) then
                if v346.command_number % 2 > 1 then
                    if v347.m_vecVelocity:length() < 4 then
                        v346.sidemove = v337;
                    end;
                    v346.view_angles.y = normalizeyaw(v327) + normalizeyaw(v333) - 60;
                else
                    v346.view_angles.y = normalizeyaw(v329) - 15 + v340;
                    v337 = v337 * -1;
                end;
            elseif v346.choked_commands == 0 then
                if v347.m_vecVelocity:length() < 4 then
                    v346.sidemove = v337;
                end;
                v346.view_angles.y = normalizeyaw(v327) + normalizeyaw(v333);
            else
                v346.view_angles.y = normalizeyaw(v329) + v340;
                v337 = v337 * -1;
            end;
            if v293:get(1) and (v280 == 5 or v280 == 6) then
                local v358 = entity.get_threat(true);
                if v358 then
                    local v359 = v358:get_origin();
                    local v360 = v347:get_origin();
                    local v361 = v360:dist(v359);
                    if v360.z - v359.z > 110 and v361 > 200 then
                        v346.view_angles.x = 0;
                    end;
                end;
            end;
            if (v293:get(2) and string.find(v357.weapon_name, "knife") or v293:get(3) and string.find(v357.weapon_name, "taser")) and (v280 == 7 or v280 == 8) then
                if v346.choked_commands == 0 then
                    v346.view_angles.y = normalizeyaw(v328) + normalizeyaw(v333);
                else
                    v346.view_angles.y = normalizeyaw(v328);
                end;
            end;
            return;
        end;
    end;
end;
text_line = function(v362, v363, v364, v365, v366, v367)
    v364 = vector(v364.x + math.cos(math.rad(v366)) * v363, v364.y + math.sin(math.rad(v366)) * v363, v364.z);
    local v368 = render.world_to_screen(v364);
    if v368 == nil then
        return;
    else
        render.line(v365, v368, v367);
        render.text(2, v368 - vector(5, 5), v367, nil, v362);
        return;
    end;
end;
player_angles = function()
    local v369 = entity.get_local_player();
    if not v369 then
        return;
    elseif not v369:is_alive() then
        return;
    elseif not common.is_in_thirdperson() then
        return;
    else
        local v370 = {
            fake = v369.m_angEyeAngles.y, 
            real = rage.antiaim:get_rotation() + v369.m_flPoseParameter[11] * 120 - 60
        };
        local v371 = v369:get_origin();
        v371.z = v371.z + 1;
        local v372 = render.world_to_screen(v371);
        text_line("-FAKE-", 30, v371, v372, v370.fake, color(255, 0, 0, 255));
        text_line("-REAL-", 30, v371, v372, v370.real, color(0, 255, 0, 255));
        return;
    end;
end;
events.aim_fire:set(function(_)
    -- upvalues: v336 (ref)
    v336 = 2;
end);
get_conditions = function()
    -- upvalues: v253 (ref), v341 (ref), v280 (ref)
    local v374 = entity.get_local_player();
    if not v374 then
        return 99;
    else
        local l_m_vecVelocity_0 = v374.m_vecVelocity;
        local v376 = math.sqrt(l_m_vecVelocity_0.x * l_m_vecVelocity_0.x + l_m_vecVelocity_0.y * l_m_vecVelocity_0.y);
        if not v253.hideshots:get() and not v253.doubletap:get() and not v253.fd:get() and v341 and v376 >= 3 then
            v280 = 9;
        elseif v374.m_fFlags == 262 and v374.m_flDuckAmount > 0.8 then
            v280 = 8;
        elseif v374.m_fFlags == 256 then
            v280 = 7;
        elseif v374.m_flDuckAmount > 0.8 and v374.m_vecVelocity:length() > 2 then
            v280 = 6;
        elseif v374.m_flDuckAmount > 0.8 then
            v280 = 5;
        elseif v253.sw:get() then
            v280 = 4;
        elseif v376 <= 2 then
            v280 = 2;
        elseif v376 >= 3 then
            v280 = 3;
        end;
        return;
    end;
end;
local v377 = 1;
end_time = 0;
ground_ticks = v377;
v377 = function()
    if not entity.get_local_player() == nil then
        return;
    else
        if bit.band(entity.get_local_player().m_fFlags, 1) == 1 then
            ground_ticks = ground_ticks + 1;
        else
            ground_ticks = 0;
            end_time = globals.curtime + 1;
        end;
        return ground_ticks > 1 and end_time > globals.curtime;
    end;
end;
fakelagdisablerlol = function()
    -- upvalues: v282 (ref), v264 (ref), v253 (ref)
    if v282 then
        return;
    else
        local v378 = entity.get_local_player();
        if not v378 then
            return false;
        elseif v264:get(1) and v253.hideshots:get() then
            return true;
        elseif v264:get(2) and v253.doubletap:get() then
            return true;
        elseif v264:get(3) and v253.doubletap:get() and v378:get_player_weapon(false):get_weapon_info().weapon_type == 1 then
            return true;
        elseif v264:get(4) and v253.doubletap:get() and v378:get_player_weapon(false):get_weapon_info().weapon_type == 0 then
            return true;
        else
            return;
        end;
    end;
end;
local v379 = 0;
local v380 = nil;
local v381 = 0;
FakeLag = function(_)
    -- upvalues: v282 (ref), v263 (ref), v377 (ref), v380 (ref), v381 (ref), v379 (ref)
    if v282 then
        return;
    else
        local v383 = entity.get_local_player();
        if not v383 then
            return false;
        else
            if delayActive == nil then
                delayActive = false;
            end;
            if v263:get(2) and (v383.m_fFlags == 256 or v383.m_fFlags == 262) then
                return true;
            elseif v263:get(4) and v377() then
                return true;
            else
                if v263:get(5) then
                    local _ = common.get_timestamp();
                    local v385 = v383:get_player_weapon(false);
                    if math.ceil(v385:get_weapon_reload()) == 1 and v385:get_weapon_reload() ~= nil then
                        return true;
                    end;
                end;
                if v263:get(6) then
                    local v386 = v383:get_player_weapon(false);
                    local v387 = common.get_timestamp();
                    if v386 == nil or v386 ~= v380 then
                        if v387 - v381 > 330 then
                            v380 = v386;
                            v381 = v387;
                        end;
                        return true;
                    end;
                end;
                if v263:get(3) then
                    local v388 = entity.get_threat(true);
                    local v389 = entity.get_threat(false);
                    local v390 = common.get_timestamp();
                    if v390 - v379 <= 330 and not delayActive then
                        delayActive = true;
                    elseif v388 == v389 and v388 ~= nil then
                        v379 = v390;
                    end;
                    if delayActive and v389 ~= v388 then
                        delayActive = false;
                    end;
                    return delayActive;
                else
                    return false;
                end;
            end;
        end;
    end;
end;
fakelagmainswitch = function(v391)
    -- upvalues: v282 (ref), v260 (ref), v263 (ref), v253 (ref), v341 (ref), v261 (ref), v262 (ref)
    if v282 then
        return;
    else
        if v260:get() then
            if v263:get(1) then
                if fakelagdisablerlol() then
                    v253.newfk1:override(false);
                    v341 = false;
                else
                    v253.newfk1:override(true);
                    v341 = true;
                end;
            else
                v253.newfk1:override(FakeLag(v391));
                v341 = FakeLag(v391);
            end;
            v253.newfk2:override(v261:get());
            v253.newfk3:override(v262:get());
        else
            v341 = false;
            v253.newfk1:override(false);
            v253.newfk2:override();
            v253.newfk3:override();
        end;
        return;
    end;
end;
register("createmove", "Get Condition", get_conditions);
register("createmove", "Anti-Aim", AntiAimBuild);
register("createmove", "ChokedCMDS Recorder", recordChokedCommands);
register("createmove", "Fake-Lag", fakelagmainswitch);
ui.find("Aimbot", "Anti Aim", "Angles", "Enabled"):visibility(false);
ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"):visibility(false);
ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"):visibility(false);
ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"):visibility(false);
ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"):visibility(false);
ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"):visibility(false);
ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles"):visibility(false);
ui.find("Aimbot", "Anti Aim", "Fake Lag", "Enabled"):visibility(false);
ui.find("Aimbot", "Anti Aim", "Fake Lag", "Limit"):visibility(false);
ui.find("Aimbot", "Anti Aim", "Fake Lag", "Variability"):visibility(false);
ui.find("Aimbot", "Anti Aim", "Angles", "Enabled"):override(false);
ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"):override(true);
v261:tooltip("Limits the fake lag to the set amount of ticks.");
v262:tooltip("Varies the amount of choked ticks, in an attempt to make the fake lag more unpredictable.");
local v392 = render.screen_size();
local v393 = ui.find("Aimbot", "Anti Aim", "Angles");
local v394 = v393:slider("Position X3", 0, v392.x, 1288);
local v395 = v393:slider("Position Y3", 0, v392.y, 555);
v394:visibility(false);
v395:visibility(false);
calculatePercentage = function(v396, v397)
    return v396 / v397 * 100;
end;
new_drag_object2 = v159.register({
    [1] = v394, 
    [2] = v395
}, vector(220, 200), "Test2", function(v398)
    -- upvalues: v282 (ref), v6 (ref), v333 (ref), v338 (ref)
    if v282 then
        return;
    else
        render.rect(vector(v398.position.x, v398.position.y), vector(v398.position.x, v398.position.y) + vector(220, 200), color(0, 0, 0, 200), 5);
        render.rect_outline(vector(v398.position.x, v398.position.y), vector(v398.position.x, v398.position.y) + vector(220, 200), color(255, 255, 255, 200), 2, 4);
        render.line(vector(v398.position.x, v398.position.y) + vector(0, 29), vector(v398.position.x, v398.position.y) + vector(220, 29), color(255, 255, 255, 255));
        render.text(3, vector(v398.position.x, v398.position.y) + vector(74, 7), color(255, 255, 255, 255), nil, "AP Anti-Aim");
        render.text(3, vector(v398.position.x, v398.position.y) + vector(8, 47), color(255, 255, 255, 255), nil, "Tickbase Charge");
        render.rect(vector(v398.position.x, v398.position.y) + vector(8, 67), vector(v398.position.x, v398.position.y) + vector(210, 83), color(0, 0, 0, 200), 5);
        local v399 = math.min(rage.exploit:get() * 100, 100);
        v6.lerp("tickcharge", v399, 10);
        render.rect(vector(v398.position.x, v398.position.y) + vector(8, 67), vector(v398.position.x, v398.position.y) + vector(8 + v6.get("tickcharge") * 2, 83), color(0, 0, 255, 200), 6);
        render.rect_outline(vector(v398.position.x, v398.position.y) + vector(8, 67), vector(v398.position.x, v398.position.y) + vector(210, 83), color(255, 255, 255, 200), 2, 4);
        render.text(3, vector(v398.position.x, v398.position.y) + vector(8, 87), color(255, 255, 255, 255), nil, "Desync");
        render.rect(vector(v398.position.x, v398.position.y) + vector(8, 107), vector(v398.position.x, v398.position.y) + vector(210, 123), color(0, 0, 0, 200), 5);
        local v400 = calculatePercentage(math.ceil(rage.antiaim:get_max_desync()) + 2, -v333 / 2);
        local v401 = math.min(-v333, v400);
        if v401 > 0 then
            render.rect(vector(v398.position.x, v398.position.y) + vector(109 + -v401, 107), vector(v398.position.x, v398.position.y) + vector(109, 123), color(0, 0, 255, 200), 6);
        end;
        local v402 = math.min(v333, -v400);
        v6.lerp("desync2", v402, 5);
        render.rect(vector(v398.position.x, v398.position.y) + vector(107, 107), vector(v398.position.x, v398.position.y) + vector(109 + v6.get("desync2"), 123), color(0, 0, 255, 200), 6);
        render.line(vector(v398.position.x, v398.position.y) + vector(107, 107), vector(v398.position.x, v398.position.y) + vector(107, 123), color(255, 255, 255, 150));
        render.rect_outline(vector(v398.position.x, v398.position.y) + vector(8, 107), vector(v398.position.x, v398.position.y) + vector(210, 123), color(255, 255, 255, 200), 2, 4);
        render.text(3, vector(v398.position.x, v398.position.y) + vector(8, 127), color(255, 255, 255, 255), nil, "Fakelag");
        render.rect(vector(v398.position.x, v398.position.y) + vector(8, 159), vector(v398.position.x, v398.position.y) + vector(210, 175), color(0, 0, 0, 200), 5);
        local v403 = 0;
        for _, v405 in ipairs(v338) do
            v403 = math.min(v405 / 16 * 100, 100);
        end;
        render.rect(vector(v398.position.x, v398.position.y) + vector(8, 159), vector(v398.position.x, v398.position.y) + vector(13 + v403 * 2, 175), color(0, 0, 255, 200), 6);
        for v406 = 0, 16 do
            if v406 == 10 then
                render.text(2, vector(v398.position.x, v398.position.y) + vector(10 + v406 * 11.8, 142), color(255, 255, 255, 255), nil, "" .. v406 .. "");
            elseif v406 == 11 then
                render.text(2, vector(v398.position.x, v398.position.y) + vector(10 + v406 * 11.95, 142), color(255, 255, 255, 255), nil, "" .. v406 .. "");
            elseif v406 == 12 then
                render.text(2, vector(v398.position.x, v398.position.y) + vector(10 + v406 * 11.95, 142), color(255, 255, 255, 255), nil, "" .. v406 .. "");
            else
                render.text(2, vector(v398.position.x, v398.position.y) + vector(10 + v406 * 12, 142), color(255, 255, 255, 255), nil, "" .. v406 .. "");
            end;
            render.line(vector(v398.position.x, v398.position.y) + vector(0 + v406 * 12.5, 159), vector(v398.position.x, v398.position.y) + vector(0 + v406 * 12.5, 175), color(255, 255, 255, 150));
        end;
        render.rect_outline(vector(v398.position.x, v398.position.y) + vector(8, 159), vector(v398.position.x, v398.position.y) + vector(210, 175), color(255, 255, 255, 200), 2, 4);
        return;
    end;
end);
local v407 = false;
local _ = -100;
local _ = -95;
showgay = function()
    -- upvalues: v407 (ref), v6 (ref)
    if ui.get_alpha() == 1 then
        v407 = true;
        v6.lerp("no1", -100, 3);
        v6.lerp("no2", -95, 3);
        v6.lerp("no3", 255, 3);
    elseif ui.get_alpha() ~= 1 then
        v6.lerp("no1", 0, 22);
        v6.lerp("no2", 0, 22);
        v6.lerp("no3", 0, 22);
        v407 = false;
    end;
    local v410 = ui.get_position();
    local v411 = ui.get_style("Sidebar Background");
    local v412 = ui.get_style("Shadows");
    render.rect_outline(vector(v410.x, v410.y) + vector(v6.get("no1"), 123), vector(v410.x, v410.y) + vector(10, 154), color(v411.r, v411.g, v411.b, math.min(v6.get("no3"), v411.a)), 2, 4);
    render.rect(vector(v410.x, v410.y) + vector(v6.get("no1"), 123), vector(v410.x, v410.y) + vector(10, 154), color(v411.r, v411.g, v411.b, math.min(v6.get("no3"), v411.a)), 4);
    render.text(3, vector(v410.x, v410.y) + vector(v6.get("no2"), 131), color(255, 255, 255, math.min(v6.get("no3"), v411.a)), nil, "AP Anti-Aim -->");
    render.shadow(vector(v410.x, v410.y) + vector(v6.get("no1"), 123), vector(v410.x, v410.y) + vector(10, 154), color(v412.r, v412.g, v412.b, math.min(v6.get("no3"), v412.a)), 30, 0, 4);
end;
showgay2 = function()
    -- upvalues: v407 (ref), v6 (ref), v168 (ref)
    if ui.get_alpha() == 1 then
        v407 = true;
        v6.lerp("no4", -20, 3);
        v6.lerp("no5", -5, 3);
        v6.lerp("no6", 255, 3);
    elseif ui.get_alpha() ~= 1 then
        v6.lerp("no4", 0, 22);
        v6.lerp("no5", 0, 22);
        v6.lerp("no6", 0, 22);
        v407 = false;
    end;
    local v413 = ui.get_position();
    local v414 = ui.get_style("Sidebar Background");
    local v415 = ui.get_style("Shadows");
    local v416 = {
        [1] = {
            separator = true, 
            label = "AP Anti-Aim"
        }, 
        [2] = {
            separator = true, 
            label = "Version: Dev"
        }, 
        [3] = {
            separator = true, 
            label = "User: " .. common.get_username()
        }, 
        [4] = {
            separator = true, 
            label = "Shots Evaded: " .. v168.evadedshots .. ""
        }, 
        [5] = {
            separator = true, 
            label = "Kills: " .. v168.kills .. ""
        }, 
        [6] = {
            separator = true, 
            label = "Deaths: " .. v168.deaths .. ""
        }
    };
    local v417 = 0;
    render.rect_outline(vector(v413.x, v413.y) + vector(0, v6.get("no4")), vector(v413.x, v413.y) + vector(835, v6.get("no5")), color(v414.r, v414.g, v414.b, math.min(v6.get("no6"), v414.a)), 2, 4);
    render.rect(vector(v413.x, v413.y) + vector(0, v6.get("no4")), vector(v413.x, v413.y) + vector(835, v6.get("no5")), color(v414.r, v414.g, v414.b, math.min(v6.get("no6"), v414.a)), 4);
    for _, v419 in ipairs(v416) do
        local v420 = render.measure_text(3, nil, v419.label);
        render.text(3, vector(v413.x, v413.y) + vector(v417, v6.get("no4")), color(255, 255, 255, math.min(v6.get("no6"), v414.a)), nil, v419.label);
        v417 = v417 + v420.x + 5;
        if v419.separator then
            render.text(3, vector(v413.x, v413.y) + vector(v417, v6.get("no4")), color(255, 255, 255, math.min(v6.get("no6"), v414.a)), nil, "|");
            v417 = v417 + 10;
        end;
    end;
    render.shadow(vector(v413.x, v413.y) + vector(0, v6.get("no4")), vector(v413.x, v413.y) + vector(835, v6.get("no5")), color(v415.r, v415.g, v415.b, math.min(v6.get("no6"), v415.a)), 30, 0, 4);
end;
local _ = "Thinking";
local v422 = {
    [1] = "Thinking...", 
    [2] = "Thinking..", 
    [3] = "Thinking.", 
    [4] = "Thinking..", 
    [5] = "Thinking..."
};
local v423 = 1;
local v424 = 2500;
local v425 = 500;
local v426 = common.get_timestamp();
local l_v426_0 = v426;
local v428 = "This is the final message!";
local v429 = false;
local v430 = 0;
request_message = function(v431)
    -- upvalues: v428 (ref), v430 (ref), v426 (ref), v429 (ref)
    v428 = v431;
    v430 = common.get_timestamp();
    v426 = common.get_timestamp();
    v429 = true;
end;
showgay3 = function()
    -- upvalues: v282 (ref), v426 (ref), v424 (ref), v422 (ref), v423 (ref), v428 (ref), v430 (ref), v6 (ref), v429 (ref), l_v426_0 (ref), v425 (ref)
    if v282 then
        return;
    else
        local v432 = render.screen_size();
        local v433 = common.get_timestamp();
        local v434 = v433 - v426 < v424 and v422[v423] or v428;
        local v435 = render.measure_text(1, nil, v434);
        if v433 - v430 >= 3000 + v424 then
            v6.lerp("showuimsg", 0, 2);
            v6.lerp("showuimsgalpha", 0, 2);
            v6.lerp("showuimsgalpha2", 0, 10);
            if v6.get("showuimsgalpha2") < 10 then
                v429 = false;
            end;
        else
            v6.lerp("showuimsg", v435.x + 40, 5);
            v6.lerp("showuimsgalpha", 255, 2);
            v6.lerp("showuimsgalpha2", 255, 10);
        end;
        local v436 = 50;
        local v437 = 120;
        local v438 = v432.x / 2 - v6.get("showuimsg") / 2;
        local v439 = 10;
        local v440 = ui.get_style("Sidebar Background");
        local v441 = ui.get_style("Shadows");
        render.rect_outline(vector(v438, v439 + v437), vector(v438 + v6.get("showuimsg"), v439 + v436 + v437), color(v440.r, v440.g, v440.b, math.min(v6.get("showuimsgalpha"), v440.a)), 2, 4);
        render.rect(vector(v438, v439 + v437), vector(v438 + v6.get("showuimsg"), v439 + v436 + v437), color(v440.r, v440.g, v440.b, math.min(v6.get("showuimsgalpha"), v440.a)), 4);
        render.shadow(vector(v438, v439 + v437), vector(v438 + v6.get("showuimsg"), v439 + v436 + v437), color(v441.r, v441.g, v441.b, math.min(v6.get("showuimsgalpha"), v440.a)), 30, 0, 4);
        render.text(1, vector(v438 + v6.get("showuimsg") / 2 - 15, v439 + v437), color(255, 255, 255, math.min(v6.get("showuimsgalpha2"), 255)), nil, "AP LUA");
        render.text(1, vector(v438 + v6.get("showuimsg") / 2 - v435.x / 2, v439 + v437 + 15 + 5), color(255, 255, 255, math.min(v6.get("showuimsgalpha2"), 255)), nil, v434);
        if v433 - v426 < v424 and v433 - l_v426_0 >= v425 then
            v423 = v423 % #v422 + 1;
            l_v426_0 = v433;
        end;
        return;
    end;
end;
showgay4 = function()
    -- upvalues: v282 (ref), v6 (ref)
    if v282 then
        return;
    else
        local v442 = entity.get_local_player();
        if v442 == nil then
            return;
        else
            local v443 = render.screen_size() * 0.5;
            local v444 = rage.exploit:get();
            local v445 = {
                DT = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"), 
                OS = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"), 
                BAIM = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim"), 
                SP = ui.find("Aimbot", "Ragebot", "Safety", "Global", "Safe Points"), 
                FT = ui.find("Aimbot", "Anti Aim", "Angles", "Extras", "Freestanding"), 
                DMG = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"), 
                HC = ui.find("Aimbot", "Ragebot", "Selection", "Hit Chance"), 
                PING = ui.find("Miscellaneous", "Main", "Other", "Fake Latency"), 
                FD = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck")
            };
            local v446 = v445.OS:get() and v445.FD:get() or v445.DT:get() and v445.FD:get() or v445.OS:get() and v445.DT:get();
            local v447;
            if v442.m_bIsScoped then
                v447 = v446 and 60 or 55;
            else
                v447 = 4;
            end;
            v6.lerp("SCOPED", v447, 5);
            v6.lerp("MINDMG", v445.DMG:get(), 5);
            v6.lerp("HC", v445.HC:get(), 5);
            render.text(2, vector(v443.x - v6.get("SCOPED"), v443.y + 10), color(255, 255, 255, 255), nil, "AP");
            local function v452(_, v449, v450, v451)
                -- upvalues: v443 (ref)
                if v449 and v449 > 0 then
                    render.text(2, vector(v443.x + 3.5 + v450, v443.y + v451), color(255, 255, 255, 255), nil, tostring(math.floor(v449 + 0.5)));
                end;
            end;
            v452("DMG", v6.get("MINDMG"), 8, -15);
            v452("HC", v6.get("HC"), -25, -15);
            local v453 = 0;
            for v454, v455 in pairs(v445) do
                local v456 = v455:get();
                if v454 ~= "DMG" and v454 ~= "HC" and (v454 ~= "BAIM" and v454 ~= "SP" or v456 == "Force") and (v454 ~= "PING" or v456 > 0) then
                    if v456 then
                        v453 = v453 + 9;
                        v6.lerp(v454, v453, 10);
                        v6.lerp("alpha" .. v454, 255, 10);
                        local v457 = v6.get("alpha" .. v454);
                        render.text(2, vector(v443.x - v6.get("SCOPED"), v443.y + 10 + v6.get(v454)), color(255, 255, 255, v457), nil, v454);
                        if v454 == "DT" then
                            local v458 = v445.FD:get() and "DT [BLOCKED]" or v444 >= 1 and "DT [READY]" or "DT [CHARGING]";
                            local v459 = v445.FD:get() and color(255, 100, 100, v457) or color(255 * (1 - v444), 255 * v444, 0, v457);
                            render.text(2, vector(v443.x - v6.get("SCOPED"), v443.y + 10 + v6.get(v454)), v459, nil, v458);
                        elseif v454 == "OS" then
                            local v460 = (not not v445.FD:get() or v445.DT:get()) and v454 .. " [BLOCKED]" or v454;
                            render.text(2, vector(v443.x - v6.get("SCOPED"), v443.y + 10 + v6.get(v454)), color(255, 255, 255, (not not v445.FD:get() or v445.DT:get()) and 100 or v457), nil, v460);
                        elseif v454 == "PING" then
                            render.text(2, vector(v443.x - v6.get("SCOPED"), v443.y + 10 + v6.get(v454)), color(255, 255, 255, v457), nil, "PING: " .. math.floor(v456 + 0.5));
                        end;
                    else
                        v6.lerp(v454, 0, 10);
                        v6.lerp("alpha" .. v454, 0, 10);
                    end;
                end;
            end;
            return;
        end;
    end;
end;
showgay5 = function()
    local v461 = render.screen_size() * 0.5 + vector(-130, -300);
    render.rect_outline(vector(v461.x, v461.y), vector(v461.x, v461.y) + vector(300, 105), color(0, 0, 0, 255), 2, 4);
    render.rect(vector(v461.x, v461.y), vector(v461.x, v461.y) + vector(300, 105), color(0, 0, 0, 190), 4);
    render.text(4, vector(v461.x, v461.y), color(255, 255, 255, 255), nil, "AP-AntiAim Developer:");
    render.text(4, vector(v461.x, v461.y) + vector(0, 10), color(255, 255, 255, 255), nil, "Well thank you for using this lua script we created for");
    render.text(4, vector(v461.x, v461.y) + vector(0, 20), color(255, 255, 255, 255), nil, "the community. If you wanna use this lua script you need");
    render.text(4, vector(v461.x, v461.y) + vector(0, 30), color(255, 255, 255, 255), nil, "to buy or wait until we reset time for everyone!");
    render.text(4, vector(v461.x, v461.y) + vector(0, 40), color(255, 255, 255, 255), nil, "ANTI-AIM, FAKELAG, INDICATORS, HITLOGS, DEBUG MENU");
    render.text(4, vector(v461.x, v461.y) + vector(0, 50), color(255, 0, 0, 255), nil, "ARE DISABLED PLEASE WAIT UNTIL TIMER IS RESETED");
    render.text(4, vector(v461.x, v461.y) + vector(0, 60), color(255, 0, 0, 255), nil, "ARE DISABLED PLEASE WAIT UNTIL TIMER IS RESETED");
    render.text(4, vector(v461.x, v461.y) + vector(0, 70), color(255, 0, 0, 255), nil, "ARE DISABLED PLEASE WAIT UNTIL TIMER IS RESETED");
    render.text(4, vector(v461.x, v461.y) + vector(0, 80), color(255, 0, 0, 255), nil, "OR BUY THE LAU SCRIPT AND HAVE FULL ACCESS");
    render.text(4, vector(v461.x, v461.y) + vector(0, 90), color(255, 0, 0, 255), nil, "OR BUY THE LAU SCRIPT AND HAVE FULL ACCESS");
end;
showgay6 = function()
    -- upvalues: v282 (ref), v6 (ref), v270 (ref), v274 (ref), v271 (ref), v272 (ref), v273 (ref)
    if v282 then
        return;
    else
        local v462 = entity.get_local_player();
        if v462 == nil then
            return;
        else
            ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay"):override("Remove All");
            local v463 = 0;
            local v464 = v462.m_bIsScoped and 255 or 0;
            v6.lerp("scope", v464, 10);
            local v465 = v6.get("scope");
            local v466, v467 = v270:get();
            if not v467 then
                v467 = {
                    color(255, 255, 255, 255)
                };
            end;
            local function v470(v468)
                -- upvalues: v465 (ref)
                local v469 = math.min(v468.a, v465);
                return color(v468.r, v468.g, v468.b, v469);
            end;
            local v471 = nil;
            local v472 = nil;
            local v473 = nil;
            local v474 = nil;
            if v466 == "Simple" then
                local v475 = v470(v467[1] or color(255, 255, 255, 255));
                local l_v475_0 = v475;
                local l_v475_1 = v475;
                local l_v475_2 = v475;
                v474 = v475;
                v473 = l_v475_2;
                v472 = l_v475_1;
                v471 = l_v475_0;
            elseif v466 == "Double" then
                local v479 = v470(v467[1] or color(255, 255, 255, 255));
                local v480 = v470(v467[2] or v479);
                local l_v479_0 = v479;
                v472 = v479;
                v471 = l_v479_0;
                l_v479_0 = v480;
                v474 = v480;
                v473 = l_v479_0;
            elseif v466 == "Multiple" then
                local v482 = v470(v467[1] or color(255, 255, 255, 255));
                local v483 = v470(v467[2] or v482);
                local v484 = v470(v467[3] or v482);
                local v485 = v470(v467[4] or v483);
                local l_v482_0 = v482;
                local l_v483_0 = v483;
                local l_v484_0 = v484;
                v474 = v485;
                v473 = l_v484_0;
                v472 = l_v483_0;
                v471 = l_v482_0;
            else
                v471 = v470(color(255, 255, 255, 255));
                v472 = v470(color(255, 255, 255, 255));
                v473 = v470(color(255, 255, 255, 255));
                v474 = v470(color(255, 255, 255, 255));
            end;
            local v489 = render.screen_size() * 0.5;
            if v274:get(4) then
                render.gradient(vector(v489.x + v271:get() + v463, v489.y), vector(v489.x + v272:get() + 20 + v271:get() + v463, v489.y + v273:get()), v471, v474, v472, v473);
            end;
            if v274:get(3) then
                render.gradient(vector(v489.x - v271:get() - v463, v489.y), vector(v489.x - v272:get() - 20 - v271:get() - v463, v489.y + v273:get()), v471, v474, v472, v473);
            end;
            if v274:get(1) then
                render.gradient(vector(v489.x, v489.y - v271:get() - v463), vector(v489.x + v273:get(), v489.y - v272:get() - 20 - v271:get() - v463), v471, v472, v473, v474);
            end;
            if v274:get(2) then
                render.gradient(vector(v489.x, v489.y + v271:get() + v463), vector(v489.x + v273:get(), v489.y + v272:get() + 20 + v271:get() + v463), v471, v472, v473, v474);
            end;
            return;
        end;
    end;
end;
events.render:set(function()
    -- upvalues: v268 (ref), v267 (ref), v282 (ref), v429 (ref), v284 (ref), v265 (ref)
    Antiaimvisibler();
    showgay();
    showgay2();
    if v268:get() then
        showgay6();
    end;
    if v267:get() then
        showgay4();
    end;
    if v282 then
        showgay5();
    end;
    if v429 then
        showgay3();
    end;
    if not v284[0].enable_antiaim:get() then
        return;
    else
        if v265:get() then
            new_drag_object2:update();
        end;
        return;
    end;
end);
local l_realtime_1 = globals.realtime;
local v491 = {};
events.player_death:set(function(v492)
    -- upvalues: v282 (ref)
    if v282 then
        return;
    else
        local v493 = entity.get_local_player();
        local v494 = entity.get(v492.userid, true);
        local v495 = entity.get(v492.attacker, true);
        if v493 == v494 then
            savetolocalfile("deaths");
        elseif v493 == v495 and v493 ~= v494 then
            savetolocalfile("kills");
        end;
        return;
    end;
end);
events.round_end:set(function(v496)
    -- upvalues: v282 (ref), v266 (ref)
    if v282 then
        return;
    elseif not v266:get() then
        return;
    else
        local v497 = entity.get(v496.winner, true);
        if v497 == nil then
            print_raw("-------\aff9300C8AP Logs:\aDEFAULT Round Ended -ERROR- -------");
            return;
        else
            local l_m_iTeamNum_1 = v497.m_iTeamNum;
            local v499 = nil;
            if l_m_iTeamNum_1 == 2 then
                v499 = "CT";
            elseif l_m_iTeamNum_1 == 3 then
                v499 = "T";
            end;
            if v499 == nil then
                print_raw("-------\aff9300C8AP Logs:\aDEFAULT Round Ended -------");
                return;
            else
                if not ({
                    [1] = "Target Successfully Bombed!", 
                    [2] = nil, 
                    [3] = nil, 
                    [4] = "The terrorists have escaped!", 
                    [5] = "The CTs have prevented most of the terrorists from escaping!", 
                    [6] = "Escaping terrorists have all been neutralized!", 
                    [7] = "The bomb has been defused!", 
                    [8] = "Counter-Terrorists Win!", 
                    [9] = "Terrorists Win!", 
                    [10] = "Round Draw!", 
                    [11] = "All Hostages have been rescued!", 
                    [12] = "Target has been saved!", 
                    [13] = "Hostages have not been rescued!", 
                    [14] = "Terrorists have not escaped!", 
                    [15] = nil, 
                    [16] = "Game Commencing!", 
                    [17] = "Terrorists Surrender", 
                    [18] = "CTs Surrender", 
                    [19] = "Terrorists Planted the Bomb", 
                    [20] = "CTs Reached the Hostage"
                })[v496.reason] then
                    local _ = "Unknown Reason";
                end;
                utils.execute_after(1, function()
                    -- upvalues: v499 (ref)
                    print_raw("-------\aff9300C8AP Logs:\aDEFAULT Round Ended: [Won: " .. v499 .. "] -------");
                end);
                return;
            end;
        end;
    end;
end);
events.round_start:set(function(_)
    -- upvalues: v282 (ref), v266 (ref)
    if v282 then
        return;
    elseif not v266:get() then
        return;
    else
        print_raw("-------\aff9300C8AP Logs:\aDEFAULT Round Started -------");
        return;
    end;
end);
local v502 = {
    [1] = "Sad that he missed", 
    [2] = "How bad is he", 
    [3] = "Damn, thank God you're using AP Lua", 
    [4] = "Feels like a fail", 
    [5] = "Such a disappointment", 
    [6] = "Well he missed that something atleast?", 
    [7] = "That's just unfortunate that we broke his resolver", 
    [8] = "Not a good move for him But hey, Lua makes it easier!"
};
events.bullet_impact:set(function(v503)
    -- upvalues: v282 (ref), v266 (ref), v491 (ref), l_realtime_1 (ref), v502 (ref), v277 (ref), v143 (ref)
    if v282 then
        return;
    elseif not v266:get() then
        return;
    elseif entity.get_local_player() == nil or not entity.get_local_player():is_alive() then
        return;
    else
        lp = entity.get_local_player();
        if lp == nil then
            return;
        elseif not lp:is_alive() then
            return;
        else
            local v504 = entity.get(v503.userid, true);
            if v504 == nil then
                return;
            elseif not v504:is_enemy() then
                return;
            elseif entity.get_threat(true) == nil then
                return;
            elseif entity.get_threat(true):get_index() ~= v504:get_index() then
                return;
            else
                local v505 = v503.userid .. "_" .. v503.x .. "_" .. v503.y .. "_" .. v503.z;
                if v491[v505] then
                    return;
                else
                    local v506 = (vector(v503.x, v503.y, v503.z) - v504:get_hitbox_position(0)):angles();
                    local v507 = (lp:get_hitbox_position(3) - v504:get_hitbox_position(0)):angles() - v506;
                    v507.y = math.clamp(v507.y, -180, 180);
                    if math.sqrt(v507.y * v507.y + v507.x * v507.x) < 10 and l_realtime_1 + 0.1 < globals.realtime then
                        local _ = v504:get_steam_avatar();
                        local v509 = v502[math.random(1, 8)];
                        if v277:get() then
                            local _ = v504:get_xuid();
                            local v511 = v143(TARGETLOL) or "Unknown";
                            print_raw("\aff9300C8AP Logs:[DEBUG]\aDEFAULT " .. v504:get_name() .. " [Cheat: " .. tostring(v511.signature or "Unknown") .. "] missed a shot at you -[" .. v509 .. "]");
                        else
                            print_raw("\aff9300C8AP Logs:[DEBUG]\aDEFAULT " .. v504:get_name() .. " missed a shot at you -[" .. v509 .. "]");
                        end;
                        request_message(v509);
                        savetolocalfile("evaded");
                    end;
                    l_realtime_1 = globals.realtime;
                    v491[v505] = globals.realtime;
                    return;
                end;
            end;
        end;
    end;
end);
local v512 = {
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
local v513 = {
    [1] = "God damn", 
    [2] = "How?", 
    [3] = "At this point you are gay?!", 
    [4] = "Stop destroying lol", 
    [5] = "Hi!", 
    [6] = "Bye!"
};
local v514 = {
    [1] = "Gotta say neverlose does it thing", 
    [2] = "Hmmm idk dont look at me", 
    [3] = "Ragebot go brrr", 
    [4] = "Well well we missed thats something aint it?", 
    [5] = "waffles niam niam"
};
events.aim_ack:set(function(v515)
    -- upvalues: v282 (ref), v266 (ref), v512 (ref), v514 (ref), v513 (ref), v276 (ref), v143 (ref)
    if v282 then
        return;
    elseif not v266:get() then
        return;
    else
        local v516 = v515.target:get_name();
        if v515.state then
            print_raw("\aff9300C8AP Logs:\aDEFAULT shot[" .. v515.id .. "] missed at: " .. v516 .. " reason: \aff0000c8" .. v515.state .. "\aDEFAULT for: " .. v515.wanted_damage .. " in: " .. v512[v515.wanted_hitgroup] .. " hc: " .. v515.hitchance .. " bt: " .. v515.backtrack .. "");
            common.add_event("\aff9300C8AP Logs:\aDEFAULT shot[" .. v515.id .. "] missed at: " .. v516 .. " reason: \aff0000c8" .. v515.state .. "\aDEFAULT for: " .. v515.wanted_damage .. " in: " .. v512[v515.wanted_hitgroup] .. " hc: " .. v515.hitchance .. " bt: " .. v515.backtrack .. "");
        else
            if v515.damage ~= v515.wanted_damage then
                print_raw("\aff9300C8AP Logs:\aDEFAULT shot[" .. v515.id .. "] at: " .. v516 .. " for: \aff0000c8" .. v515.damage .. "\aDEFAULT[\a00ff1bc8" .. v515.wanted_damage .. "\aDEFAULT] in: " .. v512[v515.hitgroup] .. " hc: " .. v515.hitchance .. " bt: " .. v515.backtrack .. "");
                common.add_event("\aff9300C8AP Logs:\aDEFAULT shot[" .. v515.id .. "] at: " .. v516 .. " for: \aff0000c8" .. v515.damage .. "\aDEFAULT[\a00ff1bc8" .. v515.wanted_damage .. "\aDEFAULT] in: " .. v512[v515.hitgroup] .. " hc: " .. v515.hitchance .. " bt: " .. v515.backtrack .. "");
            elseif v515.hitgroup ~= v515.wanted_hitgroup then
                print_raw("\aff9300C8AP Logs:\aDEFAULT shot[" .. v515.id .. "] at: " .. v516 .. " for: " .. v515.damage .. " in: \aff0000c8" .. v512[v515.hitgroup] .. "\aDEFAULT[\a00ff1bc8" .. v512[v515.wanted_hitgroup] .. "\aDEFAULT] hc: " .. v515.hitchance .. " bt: " .. v515.backtrack .. "");
                common.add_event("\aff9300C8AP Logs:\aDEFAULT shot[" .. v515.id .. "] at: " .. v516 .. " for: " .. v515.damage .. " in: \aff0000c8" .. v512[v515.hitgroup] .. "\aDEFAULT[\a00ff1bc8" .. v512[v515.wanted_hitgroup] .. "\aDEFAULT] hc: " .. v515.hitchance .. " bt: " .. v515.backtrack .. "");
            elseif v515.damage ~= v515.wanted_damage and v515.hitgroup ~= v515.wanted_hitgroup then
                print_raw("\aff9300C8AP Logs:\aDEFAULT shot[" .. v515.id .. "] at: " .. v516 .. " for: \aff0000c8" .. v515.damage .. "\aDEFAULT[\a00ff1bc8" .. v515.wanted_damage .. "] in: \aff0000c8" .. v512[v515.hitgroup] .. "\aDEFAULT[\a00ff1bc8" .. v512[v515.wanted_hitgroup] .. "\aDEFAULT] hc: " .. v515.hitchance .. " bt: " .. v515.backtrack .. "");
                common.add_event("\aff9300C8AP Logs:\aDEFAULT shot[" .. v515.id .. "] at: " .. v516 .. " for: \aff0000c8" .. v515.damage .. "\aDEFAULT[\a00ff1bc8" .. v515.wanted_damage .. "] in: \aff0000c8" .. v512[v515.hitgroup] .. "\aDEFAULT[\a00ff1bc8" .. v512[v515.wanted_hitgroup] .. "\aDEFAULT] hc: " .. v515.hitchance .. " bt: " .. v515.backtrack .. "");
            else
                print_raw("\aff9300C8AP Logs:\aDEFAULT shot[" .. v515.id .. "] at: " .. v516 .. " for: \a00ff1bc8" .. v515.damage .. "\aDEFAULT in: \a00ff1bc8" .. v512[v515.hitgroup] .. "\aDEFAULT hc: " .. v515.hitchance .. " bt: " .. v515.backtrack .. "");
                common.add_event("\aff9300C8AP Logs:\aDEFAULT shot[" .. v515.id .. "] at: " .. v516 .. " for: \a00ff1bc8" .. v515.damage .. "\aDEFAULT in: \a00ff1bc8" .. v512[v515.hitgroup] .. "\aDEFAULT hc: " .. v515.hitchance .. " bt: " .. v515.backtrack .. "");
            end;
            if v515.state then
                local v517 = v514[math.random(1, 5)];
                print_raw("\aff9300C8AP Notes:\aDEFAULT " .. v517 .. "");
                request_message(v517);
            elseif v512[v515.hitgroup] == "generic" then
                print_raw("\aff9300C8AP Notes:\aDEFAULT ZUESEDDDD!!!");
                request_message("ZUESEDDDD!!!");
            elseif v512[v515.wanted_hitgroup] == "generic" and v515.state then
                print_raw("\aff9300C8AP Notes:\aDEFAULT thats something i guess?");
                request_message("thats something i guess?");
            elseif math.random(1, 3) == 1 then
                local v518 = v513[math.random(1, 6)];
                print_raw("\aff9300C8AP Notes:\aDEFAULT " .. v518 .. "");
                request_message(v518);
            end;
        end;
        if v276:get() then
            local v519 = entity.get(v515.target, true);
            local _ = v519:get_xuid();
            local v521 = v143(v519) or "Unknown";
            print_raw("\aff9300C8AP Logs FLAGS:\aDEFAULT Cheat: " .. tostring(v521.signature or "Unknown") .. "");
        end;
        return;
    end;
end);
local v522 = {
    elements = {
        [1] = v284[0].enable_antiaim, 
        [2] = v294, 
        [3] = v284[0].antiaim_tab, 
        [4] = v284[1].ConditionOn, 
        [5] = v284[1].Pitch, 
        [6] = v284[1].Yaw, 
        [7] = v284[1].YawModifier, 
        [8] = v284[1].BodyYaw, 
        [9] = v285[1].Yaw, 
        [10] = v285[1].YawOffset2, 
        [11] = v285[1].Avoid_Backstab, 
        [12] = v290[1].YawOffset, 
        [13] = v290[1].YawOffsetL, 
        [14] = v290[1].YawOffsetR, 
        [15] = v290[1].YawOffsetMax, 
        [16] = v290[1].YawOffsetMin, 
        [17] = v290[1].YawOffset1Way, 
        [18] = v290[1].YawOffset2Way, 
        [19] = v290[1].YawOffset3Way, 
        [20] = v290[1].YawOffset4Way, 
        [21] = v290[1].YawOffset5Way, 
        [22] = v290[1].YawOffsetTicks, 
        [23] = v288[1].Invert, 
        [24] = v288[1].Invert2, 
        [25] = v288[1].Desync1, 
        [26] = v288[1].Desync2, 
        [27] = v288[1].Options, 
        [28] = v284[2].ConditionOn, 
        [29] = v284[2].Pitch, 
        [30] = v284[2].Yaw, 
        [31] = v284[2].YawModifier, 
        [32] = v284[2].BodyYaw, 
        [33] = v285[2].Yaw, 
        [34] = v285[2].YawOffset2, 
        [35] = v285[2].Avoid_Backstab, 
        [36] = v290[2].YawOffset, 
        [37] = v290[2].YawOffsetL, 
        [38] = v290[2].YawOffsetR, 
        [39] = v290[2].YawOffsetMax, 
        [40] = v290[2].YawOffsetMin, 
        [41] = v290[2].YawOffset1Way, 
        [42] = v290[2].YawOffset2Way, 
        [43] = v290[2].YawOffset3Way, 
        [44] = v290[2].YawOffset4Way, 
        [45] = v290[2].YawOffset5Way, 
        [46] = v290[2].YawOffsetTicks, 
        [47] = v288[2].Invert, 
        [48] = v288[2].Invert2, 
        [49] = v288[2].Desync1, 
        [50] = v288[2].Desync2, 
        [51] = v288[2].Options, 
        [52] = v284[3].ConditionOn, 
        [53] = v284[3].Pitch, 
        [54] = v284[3].Yaw, 
        [55] = v284[3].YawModifier, 
        [56] = v284[3].BodyYaw, 
        [57] = v285[3].Yaw, 
        [58] = v285[3].YawOffset2, 
        [59] = v285[3].Avoid_Backstab, 
        [60] = v290[3].YawOffset, 
        [61] = v290[3].YawOffsetL, 
        [62] = v290[3].YawOffsetR, 
        [63] = v290[3].YawOffsetMax, 
        [64] = v290[3].YawOffsetMin, 
        [65] = v290[3].YawOffset1Way, 
        [66] = v290[3].YawOffset2Way, 
        [67] = v290[3].YawOffset3Way, 
        [68] = v290[3].YawOffset4Way, 
        [69] = v290[3].YawOffset5Way, 
        [70] = v290[3].YawOffsetTicks, 
        [71] = v288[3].Invert, 
        [72] = v288[3].Invert2, 
        [73] = v288[3].Desync1, 
        [74] = v288[3].Desync2, 
        [75] = v288[3].Options, 
        [76] = v284[4].ConditionOn, 
        [77] = v284[4].Pitch, 
        [78] = v284[4].Yaw, 
        [79] = v284[4].YawModifier, 
        [80] = v284[4].BodyYaw, 
        [81] = v285[4].Yaw, 
        [82] = v285[4].YawOffset2, 
        [83] = v285[4].Avoid_Backstab, 
        [84] = v290[4].YawOffset, 
        [85] = v290[4].YawOffsetL, 
        [86] = v290[4].YawOffsetR, 
        [87] = v290[4].YawOffsetMax, 
        [88] = v290[4].YawOffsetMin, 
        [89] = v290[4].YawOffset1Way, 
        [90] = v290[4].YawOffset2Way, 
        [91] = v290[4].YawOffset3Way, 
        [92] = v290[4].YawOffset4Way, 
        [93] = v290[4].YawOffset5Way, 
        [94] = v290[4].YawOffsetTicks, 
        [95] = v288[4].Invert, 
        [96] = v288[4].Invert2, 
        [97] = v288[4].Desync1, 
        [98] = v288[4].Desync2, 
        [99] = v288[4].Options, 
        [100] = v284[5].ConditionOn, 
        [101] = v284[5].Pitch, 
        [102] = v284[5].Yaw, 
        [103] = v284[5].YawModifier, 
        [104] = v284[5].BodyYaw, 
        [105] = v285[5].Yaw, 
        [106] = v285[5].YawOffset2, 
        [107] = v285[5].Avoid_Backstab, 
        [108] = v290[5].YawOffset, 
        [109] = v290[5].YawOffsetL, 
        [110] = v290[5].YawOffsetR, 
        [111] = v290[5].YawOffsetMax, 
        [112] = v290[5].YawOffsetMin, 
        [113] = v290[5].YawOffset1Way, 
        [114] = v290[5].YawOffset2Way, 
        [115] = v290[5].YawOffset3Way, 
        [116] = v290[5].YawOffset4Way, 
        [117] = v290[5].YawOffset5Way, 
        [118] = v290[5].YawOffsetTicks, 
        [119] = v288[5].Invert, 
        [120] = v288[5].Invert2, 
        [121] = v288[5].Desync1, 
        [122] = v288[5].Desync2, 
        [123] = v288[5].Options, 
        [124] = v284[6].ConditionOn, 
        [125] = v284[6].Pitch, 
        [126] = v284[6].Yaw, 
        [127] = v284[6].YawModifier, 
        [128] = v284[6].BodyYaw, 
        [129] = v285[6].Yaw, 
        [130] = v285[6].YawOffset2, 
        [131] = v285[6].Avoid_Backstab, 
        [132] = v290[6].YawOffset, 
        [133] = v290[6].YawOffsetL, 
        [134] = v290[6].YawOffsetR, 
        [135] = v290[6].YawOffsetMax, 
        [136] = v290[6].YawOffsetMin, 
        [137] = v290[6].YawOffset1Way, 
        [138] = v290[6].YawOffset2Way, 
        [139] = v290[6].YawOffset3Way, 
        [140] = v290[6].YawOffset4Way, 
        [141] = v290[6].YawOffset5Way, 
        [142] = v290[6].YawOffsetTicks, 
        [143] = v288[6].Invert, 
        [144] = v288[6].Invert2, 
        [145] = v288[6].Desync1, 
        [146] = v288[6].Desync2, 
        [147] = v288[6].Options, 
        [148] = v284[7].ConditionOn, 
        [149] = v284[7].Pitch, 
        [150] = v284[7].Yaw, 
        [151] = v284[7].YawModifier, 
        [152] = v284[7].BodyYaw, 
        [153] = v285[7].Yaw, 
        [154] = v285[7].YawOffset2, 
        [155] = v285[7].Avoid_Backstab, 
        [156] = v290[7].YawOffset, 
        [157] = v290[7].YawOffsetL, 
        [158] = v290[7].YawOffsetR, 
        [159] = v290[7].YawOffsetMax, 
        [160] = v290[7].YawOffsetMin, 
        [161] = v290[7].YawOffset1Way, 
        [162] = v290[7].YawOffset2Way, 
        [163] = v290[7].YawOffset3Way, 
        [164] = v290[7].YawOffset4Way, 
        [165] = v290[7].YawOffset5Way, 
        [166] = v290[7].YawOffsetTicks, 
        [167] = v288[7].Invert, 
        [168] = v288[7].Invert2, 
        [169] = v288[7].Desync1, 
        [170] = v288[7].Desync2, 
        [171] = v288[7].Options, 
        [172] = v284[8].ConditionOn, 
        [173] = v284[8].Pitch, 
        [174] = v284[8].Yaw, 
        [175] = v284[8].YawModifier, 
        [176] = v284[8].BodyYaw, 
        [177] = v285[8].Yaw, 
        [178] = v285[8].YawOffset2, 
        [179] = v285[8].Avoid_Backstab, 
        [180] = v290[8].YawOffset, 
        [181] = v290[8].YawOffsetL, 
        [182] = v290[8].YawOffsetR, 
        [183] = v290[8].YawOffsetMax, 
        [184] = v290[8].YawOffsetMin, 
        [185] = v290[8].YawOffset1Way, 
        [186] = v290[8].YawOffset2Way, 
        [187] = v290[8].YawOffset3Way, 
        [188] = v290[8].YawOffset4Way, 
        [189] = v290[8].YawOffset5Way, 
        [190] = v290[8].YawOffsetTicks, 
        [191] = v288[8].Invert, 
        [192] = v288[8].Invert2, 
        [193] = v288[8].Desync1, 
        [194] = v288[8].Desync2, 
        [195] = v288[8].Options, 
        [196] = v284[9].ConditionOn, 
        [197] = v284[9].Pitch, 
        [198] = v284[9].Yaw, 
        [199] = v284[9].YawModifier, 
        [200] = v284[9].BodyYaw, 
        [201] = v285[9].Yaw, 
        [202] = v285[9].YawOffset2, 
        [203] = v285[9].Avoid_Backstab, 
        [204] = v290[9].YawOffset, 
        [205] = v290[9].YawOffsetL, 
        [206] = v290[9].YawOffsetR, 
        [207] = v290[9].YawOffsetMax, 
        [208] = v290[9].YawOffsetMin, 
        [209] = v290[9].YawOffset1Way, 
        [210] = v290[9].YawOffset2Way, 
        [211] = v290[9].YawOffset3Way, 
        [212] = v290[9].YawOffset4Way, 
        [213] = v290[9].YawOffset5Way, 
        [214] = v290[9].YawOffsetTicks, 
        [215] = v288[9].Invert, 
        [216] = v288[9].Invert2, 
        [217] = v288[9].Desync1, 
        [218] = v288[9].Desync2, 
        [219] = v288[9].Options, 
        [220] = v284[10].ConditionOn, 
        [221] = v284[10].Pitch, 
        [222] = v284[10].Yaw, 
        [223] = v284[10].YawModifier, 
        [224] = v284[10].BodyYaw, 
        [225] = v285[10].Yaw, 
        [226] = v285[10].YawOffset2, 
        [227] = v285[10].Avoid_Backstab, 
        [228] = v290[10].YawOffset, 
        [229] = v290[10].YawOffsetL, 
        [230] = v290[10].YawOffsetR, 
        [231] = v290[10].YawOffsetMax, 
        [232] = v290[10].YawOffsetMin, 
        [233] = v290[10].YawOffset1Way, 
        [234] = v290[10].YawOffset2Way, 
        [235] = v290[10].YawOffset3Way, 
        [236] = v290[10].YawOffset4Way, 
        [237] = v290[10].YawOffset5Way, 
        [238] = v290[10].YawOffsetTicks, 
        [239] = v288[10].Invert, 
        [240] = v288[10].Invert2, 
        [241] = v288[10].Desync1, 
        [242] = v288[10].Desync2, 
        [243] = v288[10].Options, 
        [244] = v261, 
        [245] = v260, 
        [246] = v264, 
        [247] = v260, 
        [248] = v262, 
        [249] = v266, 
        [250] = v265, 
        [251] = v292, 
        [252] = v293, 
        [253] = v276, 
        [254] = v277, 
        [255] = v267
    }
};
cfg = function(v523)
    -- upvalues: l_base64_0 (ref), v522 (ref)
    realstuff = function(v524)
        -- upvalues: l_base64_0 (ref), v522 (ref)
        if v524 then
            local v525 = v524:gsub("<AP>_", "");
            local v526 = json.parse(l_base64_0.decode(v525));
            for v527, v528 in pairs(v526) do
                v527 = ({
                    [1] = "elements"
                })[v527];
                if not v522[v527] then
                    v522[v527] = {};
                end;
                for v529, v530 in pairs(v528) do
                    if v527 == "elements" then
                        if v522[v527][v529] then
                            v522[v527][v529]:set(v530);
                        else
                            print("Warning: Missing element for ftype2:", v529);
                        end;
                    end;
                end;
            end;
        end;
    end;
    local l_status_3, l_result_3 = pcall(realstuff, v523);
    if not l_status_3 then
        print("Something went wrong with the config hmm? " .. l_result_3 .. "");
    else
        print("Config loaded!");
        utils.console_exec("playvol  buttons/bell1.wav 1");
    end;
end;
getallconfigsfromfolder = function()
    -- upvalues: v7 (ref), v281 (ref), v297 (ref)
    local v533 = {};
    local v534 = 0;
    for _, v536 in pairs(v7.FileSystem:ReadFolder("nl\\AP\\config", true)) do
        if files.read("nl\\AP\\config\\" .. v536) then
            if v536:sub(-4) == ".cfg" then
                v534 = v534 + 1;
                v536 = v536:sub(1, -5);
                table.insert(v533, v536);
            else
                print("Found not supported config file [" .. v536 .. "]");
            end;
        end;
    end;
    if v534 == 0 then
        table.insert(v533, "Empty");
    end;
    v281 = v533;
    v297:update(v281);
end;
local function v546()
    -- upvalues: v522 (ref), v297 (ref), v281 (ref), l_base64_0 (ref), v298 (ref)
    local v537 = {
        [1] = {}
    };
    for _, v539 in pairs(v522.elements) do
        table.insert(v537[1], v539:get());
    end;
    local v540 = v297:get();
    if v540 >= 1 and v540 <= #v281 then
        local v541 = v281[v540];
        local v542 = "nl/AP/config/" .. v541 .. ".cfg";
        local v543 = "<AP>_" .. l_base64_0.encode(json.stringify(v537));
        local v544 = v298:get();
        local v545 = "nl/AP/config/" .. v544 .. ".cfg";
        if not files.read(v545) then
            files.write(v545, "", false);
            getallconfigsfromfolder();
            utils.console_exec("playvol  buttons/bell1.wav 1");
            print("Created new config file:", v544);
            return;
        else
            files.write(v542, v543, false);
            print("Saved config at index:", v540, "Config name:", v541);
            v297:update(v281);
            utils.console_exec("playvol  buttons/bell1.wav 1");
        end;
    else
        print("Invalid config index selected:", v540);
    end;
end;
local function v551()
    -- upvalues: v297 (ref), v281 (ref)
    local v547 = v297:get();
    if v547 >= 1 and v547 <= #v281 then
        local v548 = v281[v547];
        local v549 = "nl/AP/config/" .. v548 .. ".cfg";
        if not files.read(v549) then
            print("Config file doesn't exist or is corrupted: " .. v549);
            getallconfigsfromfolder();
            return;
        else
            local v550 = files.read(v549);
            v297:update(v281);
            print("Reading config file: " .. v549);
            if v550 == " " then
                print("Config file is empty: " .. v549);
                return;
            else
                cfg(v550);
                print("Config has been loaded successfully: " .. v548);
            end;
        end;
    else
        print("Invalid config index selected: " .. v547);
    end;
end;
local function v555()
    -- upvalues: v297 (ref), v281 (ref), v7 (ref)
    local v552 = v297:get();
    if v552 >= 1 and v552 <= #v281 then
        local v553 = v281[v552];
        local v554 = "" .. v553 .. ".cfg";
        v7.FileSystem:DeleteFile("nl/AP/config/", v554, false);
        getallconfigsfromfolder();
        utils.console_exec("playvol  buttons/bell1.wav 1");
        print("Deleted config at index " .. v552 .. ": " .. v553);
    else
        print("Invalid index: " .. v552);
    end;
end;
local function v559()
    -- upvalues: v522 (ref), v8 (ref), l_base64_0 (ref)
    print("Config has been Exported");
    local v556 = {
        [1] = {}
    };
    for _, v558 in pairs(v522.elements) do
        table.insert(v556[1], v558:get());
    end;
    v8.set("<AP>_" .. l_base64_0.encode(json.stringify(v556)));
    utils.console_exec("playvol  buttons/bell1.wav 1");
end;
local function v560()
    -- upvalues: v8 (ref)
    print("Config has been imported");
    cfg(v8.get());
    print("Config has been loaded successfully");
end;
v301:set_callback(v555);
v303:set_callback(v559);
v302:set_callback(v560);
v299:set_callback(v551);
v300:set_callback(v546);
v297:set_callback(function()
    -- upvalues: v298 (ref), v281 (ref), v297 (ref)
    v298:set(v281[v297:get()]);
end);
getallconfigsfromfolder();
savetolocalfile("load");
events.player_say:set(function(v561)
    local v562 = entity.get_local_player();
    local v563 = entity.get(v561.userid, true);
    local _ = v563:get_xuid();
    if v563 == v562 then
        return;
    else
        if string.find(string.lower(v561.text), "hi ap lua") or string.find(string.lower(v561.text), "hello ap lua") then
            local v565 = "AP Chat: Hi " .. v563:get_name() .. "";
            do
                local l_v565_0 = v565;
                utils.execute_after(1.5, function()
                    -- upvalues: l_v565_0 (ref)
                    utils.console_exec("say " .. l_v565_0 .. "");
                end);
            end;
        end;
        return;
    end;
end);
request_message("Hello there welcome back to the best anti-aim lol?");