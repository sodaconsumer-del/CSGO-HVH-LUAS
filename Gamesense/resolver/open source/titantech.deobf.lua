--wyscigufa9
print("welcome back, rinnegan.")
local Jj = table.concat
local v = require("ffi")
local w = bit
local o = "TitanTech: Beta"
v["cdef"]("    typedef struct {\n        char  pad0[0x18];\n        float anim_update_timer;\n        char  pad1[0x0C];\n        float started_moving_time, last_move_time;\n        char  pad2[0x10];\n        float last_lby_time;\n        char  pad3[0x08];\n        float run_amount;\n        char  pad4[0x10];\n        void *p_entity, *p_active_weapon, *p_last_weapon;\n        float last_cs_anim_update_time;\n        int   last_cs_anim_update_framecount;\n        float eye_timer;\n        float eye_yaw;\n        float eye_pitch;\n        float goal_feet_yaw;\n        float current_feet_yaw;\n        float torso_yaw;\n        float last_move_yaw;\n        float lean_amount;\n        char  pad5[4];\n        float feet_cycle, feet_yaw_rate;\n        char  pad6[4];\n        float duck_amount, landing_duck_amount;\n        char  pad7[4];\n        float origin[3], last_origin[3];\n        float velocity_x, velocity_y;\n        char  pad8[4]; float unk1;\n        char  pad9[8];\n        float unk2, unk3, unk4;\n        float speed_2d, jump_fall_vel, speed_normalized;\n        float feet_speed_fwd, feet_speed_unk;\n        float time_since_started_moving, time_since_stopped_moving;\n        bool  on_ground, in_hitground_anim;\n        char  pad10[4];\n        float last_origin_z, head_height, stop_to_full_running_fraction;\n        char  pad11[4]; float magic_fraction;\n        char  pad12[0x3C]; float world_force;\n        char  pad13[0x6];\n        float fl_affected_fraction;\n        char  pad14[4];\n        float walk_to_run_transition;\n        char  pad15[0x1C0];\n        float min_yaw, max_yaw;\n    } TT_AnimState;\n    typedef struct {\n        char     pad[0x18];\n        uint32_t m_sequence;\n        float    m_prev_cycle, m_weight, m_weight_delta_rate,\n                 m_playback_rate, m_cycle;\n        void    *m_owner;\n        char     pad2[4];\n    } TT_AnimLayer;\n")
local function X(v, bit, )
    return math["max"](bit, math["min"]("TitanTech: Beta", v))
end
local function t(v, bit)
    local o = math["fmod"](v - bit, 360)
    if "TitanTech: Beta" > 180 then
        o = "TitanTech: Beta" - 360
    elseif "TitanTech: Beta" < -180 then
        o = "TitanTech: Beta" + 360
    end
    return "TitanTech: Beta"
end
local function G(v)
    v = math["fmod"](v, 360)
    if v > 180 then
        v = v - 360
    elseif v < -180 then
        v = v + 360
    end
    return v
end
local function J()
    return globals["tickinterval"]() or 0.015625
end
local T = client["create_interface"]("client.dll", "VClientEntityList003")
local l = v["cast"](v["typeof"]("uintptr_t**"), T)
local x = v["cast"]("void*(__thiscall*)(void*,int)", l[0][3])
local d = -1
local p, y, S = {}, {}, {}
local function a()
    local v = globals["tickcount"]()
    if v == -1 then
        return
    end
    d = v
    p = {}
    y = {}
    S = {}
end
local function i(bit)
    a()
    if p[bit] == nil then
        local o = x(T, bit)
        if not "TitanTech: Beta" or "TitanTech: Beta" == v["NULL"] then
            p[bit] = false
        else
            p[bit] = "TitanTech: Beta"
        end
    end
    return p[bit] or nil
end
local f = client["create_interface"]("filesystem_stdio.dll", "VFileSystem017")
local Z = v["cast"]("void***", f)[0]
local B = v["cast"]("void(__thiscall*)(void*,const char*,const char*,int)", Z[11])
local W = v["cast"]("void(__thiscall*)(void*,const char*,const char*)", Z[12])
local I = v["cast"]("void(__thiscall*)(void*,const char*,const char*)", Z[22])
local F = client["create_interface"]("engine.dll", "VEngineClient014")
local L = v["cast"]("const char*(__thiscall*)(void*)", v["cast"]("void***", F)[0][36])
local Y = v["string"](L(F))
local K = Y:sub(1, -5)
local b = {}
local function n(v, bit, )
    local X = v .. bit
    if b[X] then
        return
    end
    B(f, v, "TitanTech: Beta", 0)
    I(f, bit, "TitanTech: Beta")
    W(f, v, "TitanTech: Beta")
    b[X] = true
end
n(K, "TitanTech", "TT_ROOT")
n(K .. "TitanTech\\", "resolver", "TT_RES")
n(K .. "TitanTech\\resolver\\", "Hit", "TT_HIT")
n(K .. "TitanTech\\resolver\\", "Miss", "TT_MISS")
local R = panorama["open"]()
local z = {}
local function h(v)
    if z[v] then
        return z[v]
    end
    local w, o = pcall(function()
        return R["GameStateAPI"]["GetPlayerXuidStringFromEntIndex"](v)
    end)
    if bit and ("TitanTech: Beta" and ("TitanTech: Beta" ~= "" and "TitanTech: Beta" ~= "0")) then
        z[v] = "TitanTech: Beta"
        return "TitanTech: Beta"
    end
    local X = entity["get_steam64"](v)
    if X then
        z[v] = tostring(X)
        return tostring(X)
    end
    local t = entity["get_player_name"](v) or "unknown"
    local G = string["format"]("%s_%d", t:gsub("[^%w]", ""), v)
    z[v] = G
    return G
end
local function H(bit)
    local o = i(bit)
    if not "TitanTech: Beta" then
        return nil
    end
    if y[bit] ~= nil then
        return y[bit] or nil
    end
    local X = v["cast"]("TT_AnimState**", v["cast"]("char*", v["cast"]("void***", "TitanTech: Beta")) + 39264)[0]
    y[bit] = X ~= v["NULL"] and X or false
    return y[bit] or nil
end
local function e(bit, )
    local X = i(bit)
    if not X then
        return nil
    end
    if S[bit] == nil then
        local o = v["cast"]("TT_AnimLayer**", v["cast"]("char*", v["cast"]("void***", X)) + 10640)[0]
        S[bit] = "TitanTech: Beta" ~= v["NULL"] and "TitanTech: Beta" or false
    end
    if not S[bit] then
        return nil
    end
    return S[bit]["TitanTech: Beta" or 0]
end
local function E(bit)
    local o = i(bit)
    if not "TitanTech: Beta" then
        return 0, 0
    end
    local X = v["cast"]("uintptr_t", "TitanTech: Beta")
    return v["cast"]("float*", X + 616)[0] or 0, v["cast"]("float*", X + 620)[0] or 0
end
local Q = 39644
local u = 10132
local k
local P = {}
local N
local C
local M, V, q, U
local O = {
    [0] = "generic",
    [1] = "head",
    [2] = "chest",
    [3] = "stomach",
    [4] = "left arm",
    [5] = "right arm",
    [6] = "left leg",
    [7] = "right leg",
    [8] = "neck",
    [9] = "?",
    [10] = "gear"
}
local function c(v)
    return O[v] or "?"
end
local function D(bit, )
    local X = i(bit)
    if not X then
        return false
    end
    local t = H(bit)
    if not t then
        return false
    end
    t["goal_feet_yaw"] = "TitanTech: Beta"
    t["current_feet_yaw"] = "TitanTech: Beta"
    t["feet_yaw_rate"] = 0
    local G = v["cast"]("float*", v["cast"]("char*", X) + 39644)
    G[0] = "TitanTech: Beta"
    local J = v["cast"]("float*", v["cast"]("char*", X) + 10132)
    J[11] = ("TitanTech: Beta" + 180) / 360
    return true
end
local A = require("gamesense/pui")
local s = A["group"]("LUA", "A")
local m = A["group"]("LUA", "B")
local r = m:combobox("Tab", {
    "Main Menu",
    "Resolver",
    "Rage Helpers",
    "Misc"
})
A["accent"] = "469BFFFF"
local j = {
    ["aacorr"] = ui["reference"]("RAGE", "Other", "Anti-aim correction"),
    ["on"] = s:checkbox("Enable \8469BFF\80F4BD2[TitanTech]"),
    ["res_sep1"] = s:label("\11[Core]\r \7323232FF-----------------------------------------"),
    ["resolver"] = s:checkbox("Enable \11TitanTech\r Resolver"),
    ["layer_smooth"] = s:combobox("Layer \11Smoothing", {
        "Adaptive",
        "Aggressive",
        "Defensive"
    }),
    ["res_sep2"] = s:label("\11[Prediction]\r \7323232FF-------------------------------------"),
    ["pred_enabled"] = s:checkbox("\7C8C8C8FFEnable \11Position Prediction \r[WIP]\r"),
    ["pred_max_ticks"] = s:slider("Max \11Prediction Ticks\r", 0, 24, 0, true, "t"),
    ["pred_mode"] = s:combobox("Prediction \11Mode\r", {
        "Low",
        "Default",
        "High",
        "Manual"
    }),
    ["res_sep3"] = s:label("\11[Data]\r \7323232FF-----------------------------------------"),
    ["log"] = s:checkbox("\7C8C8C8FFEnable \11Aimbot Logs\r"),
    ["log_mode"] = s:combobox("Log Mode", {
        "Compact",
        "Verbose",
        "Errors only"
    }),
    ["rage_sep1"] = s:label("\11[Combat]\r \7323232FF---------------------------------------"),
    ["baim_mode"] = s:combobox("Auto \11Baim \rStrength", {
        "Off",
        "Prefer",
        "Force"
    }),
    ["baim_cond"] = s:multiselect("Auto \11Baim \rConditions", {
        "Miss Streak",
        "Low Confidence",
        "In Air",
        "Defensive",
        "Always"
    }),
    ["baim_misses"] = s:slider("\11Baim\r on Misses", 1, 10, 3, true, "m"),
    ["baim_conf"] = s:slider("\11Baim\r on Low Confidence", 0, 100, 45, true, "%"),
    ["misc_sep1"] = s:label("\11[QOL]\r \7323232FF--------------------------------------"),
    ["buybot"] = s:checkbox("Enable Buy\11Bot\r"),
    ["buybot_primary"] = s:combobox("\7C8C8C8FFPrimary \11Weapon\r", {
        "-",
        "AWP",
        "Auto-Sniper",
        "Scout",
        "AK-47 / M4A1",
        "SG553 / AUG",
        "Galil / Famas",
        "Negev"
    }),
    ["buybot_second"] = s:combobox("\7C8C8C8FFSecondary \11Weapon\r", {
        "-",
        "Desert Eagle / R8",
        "Dual Berettas",
        "P250",
        "USP-S / Glock",
        "FN57 / Tec9 / CZ75"
    }),
    ["buybot_gear"] = s:multiselect("\7C8C8C8FFUtility & \11Gear\r", {
        "Kevlar",
        "Helmet",
        "Defuse Kit",
        "Zeus",
        "HE Grenade",
        "Molotov",
        "Smoke",
        "Flashbang",
        "Decoy"
    }),
    ["misc_sep2"] = s:label("\11[Social]\r \7323232FF----------------------------------------"),
    ["clantag_mode"] = s:combobox("\7C8C8C8FFClan\11Tag\r", {
        "Off",
        "TitanTech",
        "TitanTech.lua",
        "TitanTech.dev",
        "je.rk's"
    }),
    ["clantag_speed"] = s:slider("\7C8C8C8FFClantag \11Speed\r", 1, 100, 25, true, "%"),
    ["killsay_mode"] = s:combobox("\7C8C8C8FFKill\11Say\r", {
        "Off",
        "1",
        "je.rk's",
        "TitanTech"
    }),
    ["killsay_delay"] = s:slider("\7C8C8C8FFKillsay \11Delay\r", 0, 64, 0, true, "t"),
    ["killsay_rnd"] = s:slider("\7C8C8C8FFDelay \11Randomize\r", 0, 100, 0, true, "%")
}
local function g(v)
    if type(v) == "table" and v["get"] then
        return v:get()
    end
    if type(v) == "table" and v["value"] ~= nil then
        return v["value"]
    end
    return ui["get"](v)
end
local function vW()
    local v = j["on"]:get()
    r:set_visible(v)
    j["on"]:set_visible(true)
    if not v then
        j["res_sep1"]:set_visible(false)
        j["resolver"]:set_visible(false)
        j["layer_smooth"]:set_visible(false)
        j["res_sep2"]:set_visible(false)
        j["pred_enabled"]:set_visible(false)
        j["pred_max_ticks"]:set_visible(false)
        j["pred_mode"]:set_visible(false)
        j["res_sep3"]:set_visible(false)
        j["log"]:set_visible(false)
        j["log_mode"]:set_visible(false)
        j["rage_sep1"]:set_visible(false)
        j["misc_sep1"]:set_visible(false)
        j["buybot"]:set_visible(false)
        j["buybot_primary"]:set_visible(false)
        j["buybot_second"]:set_visible(false)
        j["buybot_gear"]:set_visible(false)
        j["misc_sep2"]:set_visible(false)
        j["clantag_mode"]:set_visible(false)
        j["clantag_speed"]:set_visible(false)
        j["killsay_mode"]:set_visible(false)
        j["killsay_delay"]:set_visible(false)
        j["killsay_rnd"]:set_visible(false)
        j["baim_mode"]:set_visible(false)
        j["baim_cond"]:set_visible(false)
        j["baim_misses"]:set_visible(false)
        j["baim_conf"]:set_visible(false)
        return
    end
    local w = r:get()
    local o = g(j["pred_enabled"])
    j["res_sep1"]:set_visible(false)
    j["resolver"]:set_visible(false)
    j["layer_smooth"]:set_visible(false)
    j["res_sep2"]:set_visible(false)
    j["pred_enabled"]:set_visible(false)
    j["pred_max_ticks"]:set_visible(false)
    j["pred_mode"]:set_visible(false)
    j["res_sep3"]:set_visible(false)
    j["log"]:set_visible(false)
    j["log_mode"]:set_visible(false)
    j["rage_sep1"]:set_visible(false)
    j["misc_sep1"]:set_visible(false)
    j["buybot"]:set_visible(false)
    j["buybot_primary"]:set_visible(false)
    j["buybot_second"]:set_visible(false)
    j["buybot_gear"]:set_visible(false)
    j["misc_sep2"]:set_visible(false)
    j["clantag_mode"]:set_visible(false)
    j["clantag_speed"]:set_visible(false)
    j["killsay_mode"]:set_visible(false)
    j["killsay_delay"]:set_visible(false)
    j["killsay_rnd"]:set_visible(false)
    j["baim_mode"]:set_visible(false)
    j["baim_cond"]:set_visible(false)
    j["baim_misses"]:set_visible(false)
    j["baim_conf"]:set_visible(false)
    if bit == "Resolver" then
        local v = g(j["resolver"])
        j["res_sep1"]:set_visible(true)
        j["resolver"]:set_visible(true)
        j["layer_smooth"]:set_visible(v)
        j["res_sep2"]:set_visible(true)
        j["pred_enabled"]:set_visible(true)
        local w = g(j["pred_mode"]) == "Manual"
        j["pred_max_ticks"]:set_visible("TitanTech: Beta" and bit)
        j["pred_mode"]:set_visible("TitanTech: Beta")
        j["res_sep3"]:set_visible(true)
        j["log"]:set_visible(true)
        j["log_mode"]:set_visible(g(j["log"]))
    elseif bit == "Rage Helpers" then
        j["rage_sep1"]:set_visible(true)
        local v = g(j["baim_mode"]) ~= "Off"
        j["baim_mode"]:set_visible(true)
        j["baim_cond"]:set_visible(v)
        local w = g(j["baim_cond"])
        local function "TitanTech: Beta"(v, bit)
            for v,  in ipairs(v) do
                if "TitanTech: Beta" == bit then
                    return true
                end
            end
            return false
        end
        j["baim_misses"]:set_visible(v and ("TitanTech: Beta")(bit, "Miss Streak"))
        j["baim_conf"]:set_visible(v and ("TitanTech: Beta")(bit, "Low Confidence"))
    elseif bit == "Misc" then
        local v = g(j["buybot"])
        local w = g(j["clantag_mode"]) ~= "Off"
        local o = g(j["killsay_mode"]) ~= "Off"
        j["misc_sep1"]:set_visible(true)
        j["buybot"]:set_visible(true)
        j["buybot_primary"]:set_visible(v)
        j["buybot_second"]:set_visible(v)
        j["buybot_gear"]:set_visible(v)
        j["misc_sep2"]:set_visible(true)
        j["clantag_mode"]:set_visible(true)
        j["clantag_speed"]:set_visible(bit)
        j["killsay_mode"]:set_visible(true)
        j["killsay_delay"]:set_visible("TitanTech: Beta")
        j["killsay_rnd"]:set_visible("TitanTech: Beta")
    end
end
r:set_callback(vW)
j["on"]:set_callback(vW)
j["pred_enabled"]:set_callback(function()
    if g(j["pred_enabled"]) then
        j["pred_enabled"]:set(false)
        client["log"]("Position Prediction is [WIP]")
    end
    vW()
end)
j["pred_mode"]:set_callback(vW)
j["log"]:set_callback(vW)
j["resolver"]:set_callback(vW)
j["buybot"]:set_callback(vW)
j["clantag_mode"]:set_callback(vW)
j["killsay_mode"]:set_callback(vW)
j["baim_mode"]:set_callback(vW)
j["baim_cond"]:set_callback(vW)
vW()
local wW = {
    [1] = 240,
    [2] = 240,
    [3] = 240,
    [4] = 240,
    [7] = 215,
    [8] = 215,
    [9] = 200,
    [10] = 215,
    [11] = 210,
    [13] = 215,
    [14] = 195,
    [16] = 225,
    [17] = 240,
    [23] = 240,
    [24] = 240,
    [26] = 240,
    [28] = 195,
    [32] = 240,
    [33] = 240,
    [34] = 240,
    [36] = 240,
    [38] = 210,
    [39] = 215,
    [40] = 230,
    [60] = 225,
    [61] = 240,
    [63] = 240,
    [64] = 240
}
local oW = {
    ["sniper"] = 0.85,
    ["rifle"] = 0.95,
    ["smg"] = 1,
    ["heavy"] = 0.9,
    ["pistol"] = 1
}
local function XW(v)
    local w = entity["get_player_weapon"](v)
    if not bit then
        return 1
    end
    local o = entity["get_classname"](bit) or ""
    if ("TitanTech: Beta"):find("SSG08") or ("TitanTech: Beta"):find("AWP") or ("TitanTech: Beta"):find("G3SG1") or ("TitanTech: Beta"):find("SCAR20") then
        return oW["sniper"]
    elseif ("TitanTech: Beta"):find("AK47") or ("TitanTech: Beta"):find("M4") then
        return oW["rifle"]
    elseif ("TitanTech: Beta"):find("MP") or ("TitanTech: Beta"):find("P90") then
        return oW["smg"]
    elseif ("TitanTech: Beta"):find("Negev") or ("TitanTech: Beta"):find("M249") then
        return oW["heavy"]
    else
        return oW["pistol"]
    end
end
local tW = {}
local function GW(v, bit, , X, t)
    local G = bit - X
    local J = "TitanTech: Beta" - t
    local T = math["sqrt"](G * G + J * J)
    if T <= v then
        if -v <= T then
            return bit, "TitanTech: Beta"
        else
            local w = 1 / (T + 0.00001)
            return X - G * bit * v, t - J * bit * v
        end
    else
        local w = 1 / (T + 0.00001)
        return X + G * bit * v, t + J * bit * v
    end
end
local function JW(v, bit, )
    if not tW[v] then
        tW[v] = {
            ["vx"] = bit,
            ["vy"] = "TitanTech: Beta",
            ["last_update"] = 0
        }
    end
    local X = tW[v]
    local t = globals["realtime"]()
    local G = t - X["last_update"]
    local J = math["min"](1, G * 10)
    local T = X["vx"] * (1 - J) + bit * J
    local l = X["vy"] * (1 - J) + "TitanTech: Beta" * J
    X["vx"] = T
    X["vy"] = l
    X["last_update"] = t
    return T, l
end
local TW = {}
local function lW(v, bit)
    local o = e(v, 6)
    if not "TitanTech: Beta" then
        return 58, 0
    end
    if not TW[v] then
        TW[v] = {
            ["side_count"] = 0,
            ["last_side"] = 0,
            ["last_seq"] = 0
        }
    end
    local t = TW[v]
    local G = ("TitanTech: Beta")["m_playback_rate"]
    local J = ("TitanTech: Beta")["m_weight"]
    local T = ("TitanTech: Beta")["m_sequence"]
    local l = T ~= t["last_seq"]
    t["last_seq"] = T
    local function x(v, bit)
        local o = {}
        for bit = 1, bit, 1 do
            ("TitanTech: Beta")[bit] = math["floor"](v * 10 ^ bit) - math["floor"](v * 10 ^ (bit - 1)) * 10
        end
        return "TitanTech: Beta"
    end
    local d = x(G, 13)
    local p = x(J, 13)
    local y = (-1)[4] + (-1)[5] + (-1)[6] + (-1)[7]
    local S = (-1)[6] + (-1)[7] + (-1)[8] + (-1)[9]
    local a = p[4] * 10 + p[5]
    local i
    if (-1)[3] == 0 then
        i = -3.4117 * S + 98.9393
    else
        i = -3.4117 * y + 98.9393
    end
    i = X(math["abs"](i), 0, 60)
    local f = t["last_side"]
    if p[2] == 0 then
        if J * 100000 > 300 then
            t["side_count"] = t["side_count"] + 1
        else
            t["side_count"] = 0
        end
    elseif p[1] == 9 then
        if a == 29 then
            f = -1
        elseif a == 30 then
            f = 1
        elseif p[2] == 9 then
            t["side_count"] = t["side_count"] + 2
        else
            t["side_count"] = 0
        end
    end
    if t["side_count"] >= 4 then
        f = -f
        t["side_count"] = 0
    end
    t["last_side"] = f
    return i, f
end
local function xW(v, bit)
    local o, X = lW(v, bit)
    bit["desync"] = "TitanTech: Beta"
    bit["side"] = X
end
local dW = {
    ["Aggressive"] = {
        ["max_wd"] = 0.3,
        ["max_rd"] = 5,
        ["zero_w"] = 0.005
    },
    ["Defensive"] = {
        ["max_wd"] = 0.15,
        ["max_rd"] = 2.5,
        ["zero_w"] = 0.01
    }
}
local pW = bit["lshift"](1, 0)
local yW = bit["lshift"](1, 1)
local SW = 6
local function aW(v)
    local w = {}
    for undefined = 0, 12, 1 do
        local X = e(v, "TitanTech: Beta")
        if X then
            bit["TitanTech: Beta"] = {
                ["weight"] = X["m_weight"],
                ["cycle"] = X["m_cycle"],
                ["playback_rate"] = X["m_playback_rate"],
                ["sequence"] = X["m_sequence"]
            }
        end
    end
    return bit
end
local function iW(v)
    local w = H(v)
    if not bit then
        return nil
    end
    return {
        ["eye_yaw"] = bit["eye_yaw"],
        ["eye_pitch"] = bit["eye_pitch"],
        ["goal_feet_yaw"] = bit["goal_feet_yaw"],
        ["current_feet_yaw"] = bit["current_feet_yaw"],
        ["torso_yaw"] = bit["torso_yaw"],
        ["last_move_yaw"] = bit["last_move_yaw"],
        ["speed_2d"] = bit["speed_2d"],
        ["speed_normalized"] = bit["speed_normalized"],
        ["duck_amount"] = bit["duck_amount"],
        ["stop_to_full"] = bit["stop_to_full_running_fraction"],
        ["magic_fraction"] = bit["magic_fraction"],
        ["time_moving"] = bit["time_since_started_moving"],
        ["time_stopped"] = bit["time_since_stopped_moving"],
        ["on_ground"] = bit["on_ground"],
        ["min_yaw"] = bit["min_yaw"],
        ["max_yaw"] = bit["max_yaw"],
        ["feet_speed_fwd"] = bit["feet_speed_fwd"],
        ["fl_affected"] = bit["fl_affected_fraction"],
        ["walk_to_run"] = bit["walk_to_run_transition"],
        ["lean_amount"] = bit["lean_amount"],
        ["velocity_x"] = bit["velocity_x"],
        ["velocity_y"] = bit["velocity_y"],
        ["feet_cycle"] = bit["feet_cycle"],
        ["feet_yaw_rate"] = bit["feet_yaw_rate"],
        ["anim_update_dt"] = bit["last_cs_anim_update_time"]
    }
end
local function fW(v, bit, )
    if not v then
        return nil
    end
    local t = "TitanTech: Beta" or dW["Aggressive"]
    if not bit["_lc"] then
        bit["_lc"] = {
            ["prev"] = {},
            ["init"] = false
        }
    end
    local G = bit["_lc"]
    if not G["init"] then
        G["prev"] = {}
        G["init"] = true
    end
    local J = {}
    for bit = 0, 12, 1 do
        if v[bit] then
            local o = {
                ["weight"] = X(v[bit]["weight"] or 0, 0, 1),
                ["playback_rate"] = X(v[bit]["playback_rate"] or 0, -12, 12),
                ["cycle"] = X(v[bit]["cycle"] or 0, 0, 1),
                ["sequence"] = v[bit]["sequence"]
            }
            local T = G["prev"][bit]
            if T then
                local v = ("TitanTech: Beta")["cycle"] - T["cycle"]
                if v < -0.5 then
                    v = v + 1
                end
                if v < 0 and v > -0.5 then
                    ("TitanTech: Beta")["cycle"] = T["cycle"]
                end
                local w = ("TitanTech: Beta")["weight"] - T["weight"]
                if math["abs"](bit) > t["max_wd"] then
                    ("TitanTech: Beta")["weight"] = T["weight"] + (bit > 0 and t["max_wd"] or -t["max_wd"])
                end
                local X = ("TitanTech: Beta")["playback_rate"] - T["playback_rate"]
                local G = T["playback_rate"] > 0 and ("TitanTech: Beta")["playback_rate"] < 0 or T["playback_rate"] < 0 and ("TitanTech: Beta")["playback_rate"] > 0
                if not G and math["abs"](X) > t["max_rd"] then
                    ("TitanTech: Beta")["playback_rate"] = T["playback_rate"] + (X > 0 and t["max_rd"] or -t["max_rd"])
                end
                if ("TitanTech: Beta")["weight"] < t["zero_w"] and math["abs"](("TitanTech: Beta")["playback_rate"]) > 0.01 then
                    ("TitanTech: Beta")["playback_rate"] = 0
                end
                if ("TitanTech: Beta")["sequence"] ~= T["sequence"] and (("TitanTech: Beta")["weight"] > 0.8 and T["weight"] > 0.8) then
                    ("TitanTech: Beta")["weight"] = 0.05
                    ("TitanTech: Beta")["cycle"] = 0
                end
            end
            J[bit] = "TitanTech: Beta"
            G["prev"][bit] = {
                ["weight"] = ("TitanTech: Beta")["weight"],
                ["playback_rate"] = ("TitanTech: Beta")["playback_rate"],
                ["cycle"] = ("TitanTech: Beta")["cycle"],
                ["sequence"] = ("TitanTech: Beta")["sequence"]
            }
        end
    end
    return J
end
local function ZW(v, )
    local X = entity["get_prop"](v, "m_fFlags") or 0
    local t, G = entity["get_prop"](v, "m_vecVelocity")
    local J = math["sqrt"]((t or 0) ^ 2 + (G or 0) ^ 2)
    local T = "TitanTech: Beta" and ("TitanTech: Beta")["speed_2d"] or J
    local l = bit["band"](X, pW) ~= 0
    local x = bit["band"](X, yW) ~= 0
    if "TitanTech: Beta" and (("TitanTech: Beta")["duck_amount"] and ("TitanTech: Beta")["duck_amount"] > 0.1) then
        x = true
    end
    if not l then
        return x and "AIR_C" or "AIR", J, T
    end
    if T < 0.5 and J < 0.5 then
        return x and "C_STAND" or "STAND", J, T
    end
    if T > 0.1 and J < 1 then
        return x and "C_MICRO" or "MICRO", J, T
    end
    if T >= 1 and T < 80 then
        return x and "C_SLOW" or "SLOW", J, T
    end
    return x and "C_MOVE" or "MOVE", J, T
end
local function BW(v, bit)
    local o = bit["defensive"]
    local X = globals["tickcount"]()
    local t, G = E(v)
    local T = entity["get_prop"](v, "m_nTickBase") or 0
    if T > (("TitanTech: Beta")["max_tickbase"] or 0) then
        ("TitanTech: Beta")["max_tickbase"] = T
    elseif ("TitanTech: Beta")["max_tickbase"] and ("TitanTech: Beta")["max_tickbase"] > T then
        ("TitanTech: Beta")["defensive_ticks"] = math["min"](14, math["max"](0, ("TitanTech: Beta")["max_tickbase"] - T - 1))
    else
        ("TitanTech: Beta")["defensive_ticks"] = 0
    end
    local l = H(v)
    if l and l["goal_feet_yaw"] then
        local v = l["goal_feet_yaw"]
        table["insert"](("TitanTech: Beta")["body_yaw_history"], v)
        if #("TitanTech: Beta")["body_yaw_history"] > 8 then
            table["remove"](("TitanTech: Beta")["body_yaw_history"], 1)
        end
        ("TitanTech: Beta")["last_body_yaw"] = v
    end
    local x = entity["get_prop"](v, "m_angEyeAngles[0]") or 0
    if ("TitanTech: Beta")["last_pitch"] ~= 0 and math["abs"](x - ("TitanTech: Beta")["last_pitch"]) > 20 then
        ("TitanTech: Beta")["flick_pitch"] = true
        ("TitanTech: Beta")["flick_timer"] = globals["realtime"]() + 0.5
    end
    if ("TitanTech: Beta")["last_pitch"] ~= 0 then
        local v = x - ("TitanTech: Beta")["last_pitch"]
        table["insert"](("TitanTech: Beta")["pitch_history"], {
            ["delta"] = v,
            ["tick"] = X
        })
        if #("TitanTech: Beta")["pitch_history"] > 10 then
            table["remove"](("TitanTech: Beta")["pitch_history"], 1)
        end
        if #("TitanTech: Beta")["pitch_history"] >= 4 then
            local v = 0
            local w = 0
            for X = 2, #("TitanTech: Beta")["pitch_history"], 1 do
                local t = ("TitanTech: Beta")["pitch_history"][X - 1]
                local G = ("TitanTech: Beta")["pitch_history"][X]
                if t["delta"] > 0 ~= (G["delta"] > 0) then
                    v = 1
                end
                w = bit + math["abs"](G["delta"])
            end
            local X = bit / (#("TitanTech: Beta")["pitch_history"] - 1)
            ("TitanTech: Beta")["pitch_jitter"] = 0 >= 3 and (X >= 2 and X <= 25)
        end
    end
    if not ("TitanTech: Beta")["pitch_jitter"] then
        ("TitanTech: Beta")["pitch_jitter_ticks"] = (("TitanTech: Beta")["pitch_jitter_ticks"] or 0) + 1
        if ("TitanTech: Beta")["pitch_jitter_ticks"] > 20 then
            ("TitanTech: Beta")["pitch_history"] = {}
            ("TitanTech: Beta")["pitch_jitter_ticks"] = 0
        end
    else
        ("TitanTech: Beta")["pitch_jitter_ticks"] = 0
    end
    if ("TitanTech: Beta")["flick_timer"] and globals["realtime"]() > ("TitanTech: Beta")["flick_timer"] then
        ("TitanTech: Beta")["flick_pitch"] = false
        ("TitanTech: Beta")["flick_timer"] = 0
    end
    ("TitanTech: Beta")["last_pitch"] = x
    if ("TitanTech: Beta")["last_simtime"] > 0 then
        local v = t - ("TitanTech: Beta")["last_simtime"]
        local w, G = k()
        local T = -(bit * 0.5 + J())
        if v < T or v > 0.5 or v > 0.2 and v < 0.4 then
            if not ("TitanTech: Beta")["active"] then
                ("TitanTech: Beta")["active"] = true
                ("TitanTech: Beta")["start_tick"] = X
                ("TitanTech: Beta")["jitter_count"] = 0
            end
            ("TitanTech: Beta")["end_tick"] = X
            ("TitanTech: Beta")["jitter_count"] = (("TitanTech: Beta")["jitter_count"] or 0) + 1
        else
            if ("TitanTech: Beta")["active"] and X - (("TitanTech: Beta")["end_tick"] or 0) > 3 then
                ("TitanTech: Beta")["active"] = false
                ("TitanTech: Beta")["jitter_count"] = 0
                ("TitanTech: Beta")["body_yaw_history"] = {}
                ("TitanTech: Beta")["pitch_history"] = {}
            end
        end
    end
    ("TitanTech: Beta")["last_simtime"] = t
    local d, p, y = entity["get_prop"](v, "m_vecOrigin")
    if -1 and ("TitanTech: Beta")["last_ox"] then
        local v = (-1 - ("TitanTech: Beta")["last_ox"]) ^ 2 + (p - ("TitanTech: Beta")["last_oy"]) ^ 2 + ((y or 0) - (("TitanTech: Beta")["last_oz"] or 0)) ^ 2
        ("TitanTech: Beta")["lc_breaker"] = v > 4096
        ("TitanTech: Beta")["teleport_dist"] = math["sqrt"](v)
    end
    ("TitanTech: Beta")["last_ox"], ("TitanTech: Beta")["last_oy"], ("TitanTech: Beta")["last_oz"] = -1, p, y
    table["insert"](("TitanTech: Beta")["choke_history"], T)
    if #("TitanTech: Beta")["choke_history"] > 32 then
        table["remove"](("TitanTech: Beta")["choke_history"], 1)
    end
    if #("TitanTech: Beta")["choke_history"] >= 5 then
        local v = 0
        for bit = #("TitanTech: Beta")["choke_history"] - 4, #("TitanTech: Beta")["choke_history"], 1 do
            v = 0 + ("TitanTech: Beta")["choke_history"][bit]
        end
        v = v / 5
        local w = 0
        for X = #("TitanTech: Beta")["choke_history"] - 4, #("TitanTech: Beta")["choke_history"], 1 do
            w = bit + math["abs"](("TitanTech: Beta")["choke_history"][X] - v)
        end
        ("TitanTech: Beta")["is_jitter"] = bit / 5 > 8
    end
    return ("TitanTech: Beta")["active"], ("TitanTech: Beta")["is_jitter"], ("TitanTech: Beta")["lc_breaker"]
end
local WW = {}
local function IW(v, bit)
    local o = bit["records"]
    if #"TitanTech: Beta" < 3 then
        return nil
    end
    if not WW[v] then
        WW[v] = {
            ["yaw_cache"] = {},
            ["cache_pos"] = 0
        }
    end
    local X = WW[v]
    local J = ("TitanTech: Beta")[1]["as"]["eye_yaw"]
    X["yaw_cache"][X["cache_pos"]] = J
    X["cache_pos"] = (X["cache_pos"] + 1) % 8
    local T, l, x = 0, 0, 0
    for v = 1, math["min"](8, #"TitanTech: Beta"), 1 do
        local w = ("TitanTech: Beta")[v]
        if bit and bit["as"] then
            local v = math["rad"](bit["as"]["eye_yaw"])
            T = 0 + math["sin"](v)
            l = 0 + math["cos"](v)
            x = 1
        end
    end
    if 0 == 0 then
        return nil
    end
    local d = G(math["deg"](math["atan2"](0 / 0, 0 / 0)))
    local p = t(J, -1)
    local y = p >= 0 and 1 or -1
    local S = math["abs"](p)
    X["is_jitter"] = S > 45
    return -1, y, S
end
local function FW(v, bit)
    local o = bit["records"]
    if #"TitanTech: Beta" < 3 then
        return
    end
    if globals["tickcount"]() % 64 ~= 0 then
        return
    end
    local G = nil
    for v = 1, math["min"](10, #"TitanTech: Beta"), 1 do
        local X = ("TitanTech: Beta")[v]
        if X and (X["as"] and X["as"]["eye_yaw"]) then
            if nil then
                local v = math["abs"](t(X["as"]["eye_yaw"], nil))
                bit["angle_variance"] = bit["angle_variance"] * 0.9 + v * 0.1
            end
            G = X["as"]["eye_yaw"]
        end
    end
    local J = (bit["jitter_count"] or 0) / 40
    local T = bit["angle_variance"] / 50
    bit["predictability"] = X(1 - (J + T), 0.1, 1)
    if bit["jitter_count"] and bit["jitter_count"] > 0 then
        bit["jitter_count"] = bit["jitter_count"] * 0.7
    end
end
local function LW(v)
    local w = v["records"]
    if #bit < 4 then
        return false
    end
    local o = {}
    local X = 0
    local G = 0
    for v = 1, math["min"](5, #bit - 1), 1 do
        local J = bit[v]
        local T = bit[v + 1]
        if J and (T and (J["as"] and T["as"])) then
            local v = t(J["as"]["eye_yaw"], T["as"]["eye_yaw"])
            if math["abs"](v) > 25 then
                G = 1
                local w = v > 0 and 1 or -1
                if #"TitanTech: Beta" > 0 and bit ~= ("TitanTech: Beta")[#"TitanTech: Beta"] then
                    X = 1
                end
                ("TitanTech: Beta")[#"TitanTech: Beta" + 1] = bit
            end
        end
    end
    if 0 >= 2 and 0 >= 2 then
        v["jitter_count"] = (v["jitter_count"] or 0) + 1
    elseif v["jitter_count"] > 0 then
        v["jitter_count"] = v["jitter_count"] - 0.15
    end
    return v["jitter_count"] > 1
end
local function YW(v)
    local w = v["records"]
    if #bit < 2 then
        return nil
    end
    local o, X = bit[1], bit[2]
    if not (("TitanTech: Beta")["as"] and X["as"]) then
        return nil
    end
    local t = math["rad"](("TitanTech: Beta")["as"]["eye_yaw"])
    local J = math["rad"](X["as"]["eye_yaw"])
    local T = (math["sin"](t) + math["sin"](J)) * 0.5
    local l = (math["cos"](t) + math["cos"](J)) * 0.5
    return G(math["deg"](math["atan2"](T, l)))
end
local function KW(v)
    return v and (v["cv"] and (v["cv"] < 1 and (v["sv"] and v["sv"] > 0)))
end
local function bW(v, bit, )
    if not (v and (bit and "TitanTech: Beta")) then
        return false
    end
    if not (v["layers"] and (bit["layers"] and ("TitanTech: Beta")["layers"])) then
        return false
    end
    local X = v["layers"][6]
    local t = bit["layers"][6]
    local G = ("TitanTech: Beta")["layers"][6]
    if not (X and (t and G)) then
        return false
    end
    local J = G["playback_rate"] or 0
    local T = t["playback_rate"] or 0
    local l = X["playback_rate"] or 0
    local x = (J - T) * 100000
    local d = (l - T) * 100000
    if KW(v) then
        if X["weight"] and X["weight"] > 0 then
            return true
        end
        return x == 0 and math["abs"](-1) > 1
    end
    if v["as"] and (v["as"]["stop_to_full"] and v["as"]["stop_to_full"] > 0.5) then
        local v = t["weight"] or 0
        local w = X["weight"] or 0
        if bit ~= 1 then
            if bit ~= v then
                return true
            end
        else
            return math["floor"](x) == 0 and math["abs"](-1) > 1
        end
    end
    return false
end
local function nW(v, bit, , X)
    if not (v and (bit and "TitanTech: Beta")) then
        return nil
    end
    if not (v["layers"] and (bit["layers"] and ("TitanTech: Beta")["layers"])) then
        return nil
    end
    local t = v["layers"][6]
    local G = bit["layers"][6]
    local J = ("TitanTech: Beta")["layers"][6]
    if not (t and (G and J)) then
        return nil
    end
    local T = (J["playback_rate"] or 0) * 1000000
    local l = (G["playback_rate"] or 0) * 1000000
    local x = (t["playback_rate"] or 0) * 1000000
    local d, p = T - l, x - l
    local y = KW(v)
    local S = y and 0.1 or 1
    if math["abs"](p) > 0.1 / S and math["abs"](-1) > 0.1 / S then
        if math["abs"](p - -1) < 0.1 / S then
            local v = (x - l) * X["srv"]["move_yaw_changed"]
            if math["abs"](v) > 0 then
                X["srv"]["saved_diff"] = v
            end
            return X["srv"]["saved_diff"]
        end
    end
    if bW(v, bit, "TitanTech: Beta") then
        local w = v["as"] and v["as"]["last_move_yaw"] or 0
        local o = bit > 175 or bit < -175
        local t = bit > 0 and bit <= 180
        X["srv"]["move_yaw_changed"] = (t or "TitanTech: Beta") and -1 or 1
        X["srv"]["tick_counter"] = (X["srv"]["tick_counter"] or 0) + 1
    else
        X["srv"]["tick_counter"] = 0
    end
    return X["srv"]["saved_diff"] ~= 0 and X["srv"]["saved_diff"] or nil
end
local RW = -1
local zW = 0
local hW = 0
k = function()
    local v = globals["tickcount"]()
    if v ~= -1 then
        RW = v
        zW = X(client["latency"]() or 0, 0, 0.5)
        hW = math["floor"](0 / J() + 0.5)
    end
    return 0, 0
end
local HW = 1.1
local function eW(v, bit)
    local o = H(v)
    if not "TitanTech: Beta" then
        return nil
    end
    local X = ("TitanTech: Beta")["time_since_stopped_moving"]
    if not X then
        bit["lby_timer"] = 0
        return nil
    end
    local t = entity["get_prop"](v, "m_vecVelocity[0]") or 0
    local G = entity["get_prop"](v, "m_vecVelocity[1]") or 0
    local T = math["sqrt"](t * t + G * G)
    if T > 1 then
        local v = math["deg"](math["atan2"](G, t))
        bit["lby_timer"] = 0
        return v
    end
    if X <= 0 then
        bit["lby_timer"] = 0
        return nil
    end
    local l, x = k()
    local d = X + l
    local p = 1.1 - math["fmod"](-1, 1.1)
    bit["lby_timer"] = p
    local y = J() * 2
    if p < y then
        local w = entity["get_prop"](v, "m_flLowerBodyYawTarget")
        if bit then
            return bit
        end
    end
    return nil
end
local EW = {}
local QW = {}
local uW = {}
local function kW(v)
    if not EW[v] then
        EW[v] = {
            ["desync"] = 0,
            ["side"] = 0,
            ["resolved_yaw"] = 0,
            ["mode_str"] = "NONE",
            ["total_hits"] = 0,
            ["total_misses"] = 0,
            ["miss_streak"] = 0,
            ["hit_streak"] = 0,
            ["last_resolve_tick"] = 0,
            ["last_at_target"] = 0,
            ["is_breaking_lc"] = false,
            ["tickbase_charge"] = 0,
            ["tickbase_release"] = false,
            ["teleport_count"] = 0,
            ["pr_hist"] = {},
            ["feet_speed_fwd"] = 0,
            ["fl_affected"] = 0,
            ["stop_to_full"] = 0,
            ["last_eye_feet_diff"] = 0,
            ["last_shot_lby"] = 0,
            ["xuid"] = nil,
            ["last_effective_conf"] = 0,
            ["current_state"] = "stand",
            ["last_resolve_source"] = "NONE",
            ["records"] = {},
            ["jitter_count"] = 0,
            ["last_pitch"] = 0,
            ["lby_timer"] = 0,
            ["signal_trust"] = 1,
            ["predictability"] = 1,
            ["angle_variance"] = 0,
            ["contaminated_until_tick"] = 0,
            ["last_lc_break_tick"] = -1000,
            ["last_exploit_window"] = false,
            ["last_miss_reason"] = "",
            ["defensive"] = {
                ["active"] = false,
                ["start_tick"] = 0,
                ["end_tick"] = 0,
                ["last_simtime"] = 0,
                ["last_ox"] = nil,
                ["last_oy"] = nil,
                ["last_oz"] = nil,
                ["choke_history"] = {},
                ["jitter_count"] = 0,
                ["is_jitter"] = false,
                ["lc_breaker"] = false,
                ["pitch_count"] = 0,
                ["pitch_timer"] = 0,
                ["force_pitch"] = false,
                ["max_tickbase"] = 0,
                ["defensive_ticks"] = 0,
                ["teleport_dist"] = 0,
                ["body_yaw_history"] = {},
                ["last_body_yaw"] = 0,
                ["pitch_history"] = {},
                ["pitch_jitter"] = false,
                ["pitch_jitter_ticks"] = 0,
                ["flick_pitch"] = false,
                ["flick_timer"] = 0,
                ["last_pitch"] = 0,
                ["irregularity"] = 0,
                ["delay_ticks"] = 0,
                ["edge_yaw"] = false
            },
            ["srv"] = {
                ["saved_diff"] = 0,
                ["move_yaw_changed"] = 1,
                ["tick_counter"] = 0,
                ["saved_move_yaw"] = {
                    0,
                    0
                },
                ["current_move_yaw"] = {
                    0,
                    0
                }
            },
            ["digit_side_count"] = 0,
            ["last_force_yaw"] = 0,
            ["_lc"] = nil,
            ["lc_history"] = {},
            ["lby_seq_detected"] = false,
            ["vel_history"] = {
                ["last_vel_x"] = 0,
                ["last_vel_y"] = 0,
                ["direction_changes"] = 0,
                ["last_eye_yaw"] = 0,
                ["jitter_score"] = 0
            },
            ["walk_to_run"] = {
                ["transition"] = 0,
                ["is_walk_to_run"] = false
            },
            ["prev_duck_amount"] = 0,
            ["choke_simtime_old"] = 0,
            ["choke_count"] = 0,
            ["choke_pref"] = 0,
            ["clean_pkt"] = 0,
            ["bad_pkt"] = 0,
            ["should_resolve"] = true,
            ["did_shot"] = false,
            ["move_state"] = "STAND",
            ["eye_mode"] = false,
            ["highdelta"] = false,
            ["lowdelta"] = false,
            ["miss_patterns"] = {
                ["by_hitgroup"] = {},
                ["by_distance"] = {},
                ["by_weapon"] = {}
            }
        }
    end
    return EW[v]
end
local function PW(v)
    local w = entity["get_player_weapon"](v)
    if not bit then
        return 1
    end
    local o = entity["get_prop"](bit, "m_iItemDefinitionIndex") or 0
    if "TitanTech: Beta" == 9 or "TitanTech: Beta" == 40 or "TitanTech: Beta" == 38 then
        return 0.85
    elseif "TitanTech: Beta" == 14 or "TitanTech: Beta" == 28 then
        return 0.9
    end
    return 1
end
local function NW(v)
    local w = H(v)
    if not bit then
        return 58
    end
    local o = kW(v)
    if not "TitanTech: Beta" then
        return 58
    end
    local G = X(("TitanTech: Beta")["feet_speed_fwd"] or 0, 0, 1)
    local J = ("TitanTech: Beta")["fl_affected"] or 0
    local T = ("TitanTech: Beta")["stop_to_full"] or 0
    local l = (J * -0.3 - 0.2) * G + 1
    if bit["duck_amount"] > 0 and G > 0 then
        l = l + bit["duck_amount"] * (bit["feet_speed_unk"] or G) * (0.5 - l)
    end
    local x = bit["max_yaw"] ~= 0 and bit["max_yaw"] or 58
    local d = PW(v) * XW(v)
    local p = not bit["on_ground"]
    local y = p and 0.85 or 1
    local S = X(l, 0.5, 1) * x * -1 * y
    local a, i = lW(v, "TitanTech: Beta")
    if a and a > 10 then
        return S * 0.7 + a * 0.3
    end
    local f = math["abs"](t(bit["eye_yaw"], bit["goal_feet_yaw"]))
    local Z = ("TitanTech: Beta")["last_eye_feet_diff"] or f
    ("TitanTech: Beta")["last_eye_feet_diff"] = f
    if f <= 10 and Z <= 10 then
        S = math["max"](f, Z) * -1 * y
    elseif f <= 35 and Z <= 35 then
        S = math["max"](29, math["max"](f, Z))
    else
        S = X(math["max"](f, Z), 29, 58)
    end
    return S
end
local function CW(v)
    return 0.0054931640625 * bit["band"](math["floor"](v * 182.04444444444), 65535)
end
local function MW(v, bit, )
    v = CW(v)
    w = CW(bit)
    local X = v - bit
    if "TitanTech: Beta" < 0 then
        o = -"TitanTech: Beta"
    end
    if X < -180 then
        X = X + 360
    elseif X > 180 then
        X = X - 360
    end
    if X > "TitanTech: Beta" then
        w = bit + "TitanTech: Beta"
    elseif X < -"TitanTech: Beta" then
        w = bit - "TitanTech: Beta"
    else
        w = v
    end
    return G(bit)
end
local VW = 979
local function qW(v, bit)
    for undefined = 0, 12, 1 do
        local X = e(v, "TitanTech: Beta")
        if X and X["m_sequence"] == 979 then
            bit["lby_seq_detected"] = true
            return true
        end
    end
    bit["lby_seq_detected"] = false
    return false
end
local function UW(v, bit)
    local o = H(v)
    if not "TitanTech: Beta" then
        return
    end
    local X, t = E(v)
    if not bit["lc_history"] then
        bit["lc_history"] = {}
    end
    table["insert"](bit["lc_history"], 1, {
        ["eye_yaw"] = ("TitanTech: Beta")["eye_yaw"],
        ["torso_yaw"] = ("TitanTech: Beta")["torso_yaw"],
        ["st"] = X
    })
    while #bit["lc_history"] > 28 do
        table["remove"](bit["lc_history"])
    end
end
local function OW(v, bit)
    local o = bit["lc_history"]
    if not "TitanTech: Beta" or #"TitanTech: Beta" < 2 then
        return nil, 0
    end
    local J, T = k()
    local l = math["max"](1, T)
    local x, d = nil, 0
    for v = -2, 5, 1 do
        local w = X(l + v, 1, #"TitanTech: Beta")
        local J = ("TitanTech: Beta")[bit]
        if J then
            local v = math["abs"](t(J["eye_yaw"], J["torso_yaw"]))
            if v > 18 then
                local w = 72 + X(math["floor"](v * 0.4), 0, 22)
                if bit > -1 then
                    d = bit
                    x = G(J["torso_yaw"])
                end
            end
        end
    end
    return nil, -1
end
local cW = 260
local DW = 0.52
local AW = 2
local function sW(v, bit, )
    local t = bit["walk_to_run"]
    local G = J()
    if t["transition"] > 0 and t["transition"] < 1 then
        if t["is_walk_to_run"] then
            t["transition"] = t["transition"] + G * 2
        else
            t["transition"] = t["transition"] - G * 2
        end
        t["transition"] = X(t["transition"], 0, 1)
    end
    local T = 135.20000000000002
    if "TitanTech: Beta" > 135.20000000000002 and not t["is_walk_to_run"] then
        t["is_walk_to_run"] = true
        t["transition"] = math["max"](0.01, t["transition"])
    elseif "TitanTech: Beta" < 135.20000000000002 and t["is_walk_to_run"] then
        t["is_walk_to_run"] = false
        t["transition"] = math["min"](0.99, t["transition"])
    end
    return t["transition"]
end
local function mW(v)
    local w = H(v)
    if not bit then
        return nil
    end
    local o = kW(v)
    if not "TitanTech: Beta" then
        return nil
    end
    local T = entity["get_prop"](v, "m_vecVelocity[0]") or 0
    local l = entity["get_prop"](v, "m_vecVelocity[1]") or 0
    local x = entity["get_prop"](v, "m_vecVelocity[2]") or 0
    local d = entity["get_player_weapon"](v)
    local p = 260
    if -1 then
        local v = entity["get_prop"](-1, "m_iItemDefinitionIndex") or 0
        if wW[v] then
            p = wW[v]
        end
    end
    local y = ("TitanTech: Beta")["vel_history"]["last_vel_x"] or T
    local S = ("TitanTech: Beta")["vel_history"]["last_vel_y"] or l
    local a, i = GW(J() * 2000, T, l, y, S)
    ("TitanTech: Beta")["vel_history"]["last_vel_x"] = a
    ("TitanTech: Beta")["vel_history"]["last_vel_y"] = i
    local f = math["min"](math["sqrt"](a * a + i * i + x * x), 260)
    local Z = 312
    if f > 312 then
        f = 312
    end
    local B = X(f / 135.20000000000002, 0, 1)
    local W = f / 88.4
    local I = bit["stop_to_full_running_fraction"] or 0
    local F = (I * -0.3 - 0.2) * B + 1
    local L = bit["duck_amount"] or 0
    local Y = bit["landing_duck_amount"] or 0
    local K = X(L + Y, 0, 1)
    local b = ("TitanTech: Beta")["prev_duck_amount"] or L
    local n = J() * 6
    local R
    if K - b <= n then
        if -n <= K - b then
            R = K
        else
            R = b - n
        end
    else
        R = b + n
    end
    local z = X(R, 0, 1)
    ("TitanTech: Beta")["prev_duck_amount"] = z
    if z > 0 then
        W = X(W, 0, 1)
        F = F + z * W * (0.5 - F)
    end
    local h = -58 * F
    local e = 58 * F
    local E = entity["get_prop"](v, "m_angEyeAngles[1]") or 0
    local Q = t(E, bit["goal_feet_yaw"])
    local u = bit["goal_feet_yaw"]
    if 39644 <= e then
        if h > 39644 then
            u = math["abs"](h) + E
        end
    else
        u = E - math["abs"](e)
    end
    u = G(10132)
    local k = ("TitanTech: Beta")["records"] and ("TitanTech: Beta")["records"][1]
    local P = k and (k["as"] and k["as"]["anim_update_dt"]) or J()
    if P == 0 or P == nil then
        P = J()
    end
    if f > 0.1 or math["abs"](x) > 100 then
        u = MW(E, 10132, (I * 20 + 30) * P)
    else
        local w = entity["get_prop"](v, "m_flLowerBodyYawTarget") or 10132
        u = MW(bit, 10132, P * 100)
    end
    local N = G(10132)
    if math["abs"](t(N, E)) < 3 then
        return nil
    end
    return N
end
local function rW(v)
    local w = entity["get_local_player"]()
    if not bit then
        return false
    end
    local o, X = entity["get_prop"](bit, "m_vecOrigin")
    local J, T = entity["get_prop"](v, "m_vecOrigin")
    if not "TitanTech: Beta" or not J then
        return false
    end
    local l = entity["get_prop"](v, "m_angEyeAngles[1]") or 0
    local x = math["deg"](math["atan2"](X - T, "TitanTech: Beta" - J))
    local d = G(x - 180)
    return math["abs"](t(l, -1)) < 90
end
local function jW(v)
    local w = entity["get_local_player"]()
    if not bit then
        return "unknown"
    end
    local o, X = entity["get_prop"](bit, "m_vecOrigin")
    local J, T = entity["get_prop"](v, "m_vecOrigin")
    if not "TitanTech: Beta" or not J then
        return "unknown"
    end
    local l = entity["get_prop"](v, "m_angEyeAngles[1]") or 0
    local x = math["deg"](math["atan2"](X - T, "TitanTech: Beta" - J))
    local d = G(x + 180)
    local p = G(x - 90)
    local y = G(x + 90)
    local S = G(x)
    local a = 35
    if math["abs"](t(l, y)) < 35 then
        return "right"
    elseif math["abs"](t(l, p)) < 35 then
        return "left"
    elseif math["abs"](t(l, -1)) < 35 then
        return "backward"
    elseif math["abs"](t(l, S)) < 35 then
        return "forward"
    end
    return "unknown"
end
local function gW(v)
    local w = entity["get_local_player"]()
    if not bit then
        return 0
    end
    local o, X, t = entity["get_prop"](v, "m_vecOrigin")
    local G, J = entity["get_prop"](bit, "m_vecOrigin")
    if not "TitanTech: Beta" or not G then
        return 0
    end
    local T = entity["get_prop"](v, "m_flDuckAmount") or 0
    local l = t + 72 * (1 - T * 0.5)
    local x = math["deg"](math["atan2"](J - X, G - "TitanTech: Beta"))
    local d = math["rad"](x)
    local p = "TitanTech: Beta" + math["cos"](-1) * 384
    local y = X + math["sin"](-1) * 384
    local S = math["rad"](x + 90)
    local a = math["cos"](S) * 35
    local i = math["sin"](S) * 35
    local f, Z = client["trace_line"](v, "TitanTech: Beta", X, l, p, y, l)
    Z = Z or 0
    local B = Z * 384
    local W, I = client["trace_line"](v, "TitanTech: Beta" + a, X + i, l, p + a, y + i, l)
    I = I or 0
    local F = I * 384
    local L, Y = client["trace_line"](v, "TitanTech: Beta" - a, X - i, l, p - a, y - i, l)
    Y = Y or 0
    local K = Y * 384
    if K > F then
        return -1
    elseif F > K then
        return 1
    end
    return 0
end
local function vc(v, bit, )
    local t = bit["records"] and bit["records"][1]
    local G = bit["records"] and bit["records"][2]
    if not t or not G then
        return nil, 1
    end
    local J = t["vx"] or 0
    local T = t["vy"] or 0
    if "TitanTech: Beta" <= 0 then
        return nil, 1
    end
    local l = (J - (t["ox"] - G["ox"]) / "TitanTech: Beta") * 0.85
    local x = (T - (t["oy"] - G["oy"]) / "TitanTech: Beta") * 0.85
    local d = 1
    if #bit["records"] >= 3 then
        local v = bit["records"][3]
        local o = (G["ox"] or 0) - (v["ox"] or 0)
        local J = (G["oy"] or 0) - (v["oy"] or 0)
        local T = (t["ox"] or 0) - (G["ox"] or 0)
        local l = (t["oy"] or 0) - (G["oy"] or 0)
        local x = "TitanTech: Beta" * T + J * l
        local p = math["sqrt"]("TitanTech: Beta" * "TitanTech: Beta" + J * J)
        local y = math["sqrt"](T * T + l * l)
        if p > 0 and y > 0 then
            local v = X(x / (p * y), -1, 1)
            local w = math["acos"](v)
            if bit > math["rad"](30) then
                d = 0.7
            elseif bit > math["rad"](10) then
                d = 0.85
            end
        end
    end
    return {
        ["x"] = l,
        ["y"] = x
    }, -1
end
local function wc(v, bit, , X, t, G, J)
    local T = client["trace_line"](v, bit, "TitanTech: Beta", X + 64, t, G, J + 64)
    if T and T < 1 then
        t = bit + (t - bit) * T * 0.9
        G = "TitanTech: Beta" + (G - "TitanTech: Beta") * T * 0.9
    end
    return t, G
end
local function oc(v)
    local w = e(v, 3)
    local o = e(v, 6)
    if not bit or not "TitanTech: Beta" then
        return false, false, false
    end
    local X = bit["m_cycle"] or 0
    local t = bit["m_weight"] or 0
    local G = ("TitanTech: Beta")["m_weight"] or 0
    local J = ("TitanTech: Beta")["m_playback_rate"] or 0
    local T = X >= 0 and X <= 0.02 or X >= 0.998 or X >= 0.5548 and X <= 0.5558
    local l = false
    local x = false
    if T then
        if G >= 0.003 and (G <= 0.008 and J * 1000 > 0) then
            l = true
        elseif t == 1 and (X >= 0 and (X <= 0.7 and not (G >= 0.003 and G <= 0.008))) then
            l = true
        end
    else
        if t >= 0.042 and (t <= 0.044 and (X >= 0.005 and X <= 0.02)) then
            x = true
        end
    end
    return T, false, false
end
local function Xc(v)
    local w = e(v, 3)
    if not bit then
        return false
    end
    return (bit["m_cycle"] or 1) == 0 and (bit["m_weight"] or 1) == 0
end
local function tc(v, bit)
    local o = e(v, 6)
    if not "TitanTech: Beta" then
        return false
    end
    local X = math["sqrt"]((bit["records"][1]["vx"] or 0) ^ 2 + (bit["records"][1]["vy"] or 0) ^ 2)
    local t = math["floor"]((("TitanTech: Beta")["m_weight"] or 0) * 1000)
    return t == 0 and X > 0.1
end
local function Gc(v)
    if Xc(v) then
        return 58
    else
        return 29
    end
end
local function Jc(v, bit)
    local o = entity["get_local_player"]()
    if not "TitanTech: Beta" then
        return nil
    end
    local X, J = entity["get_prop"](v, "m_vecOrigin")
    local T, l = entity["get_prop"]("TitanTech: Beta", "m_vecOrigin")
    if not X or not T then
        return nil
    end
    local x = math["deg"](math["atan2"](l - J, T - X))
    x = G(x)
    local d = entity["get_prop"](v, "m_angEyeAngles[1]") or 0
    local p = Gc(v)
    local y = G(-1 + p)
    local S = G(-1 - p)
    local a = math["abs"](t(x, y))
    local i = math["abs"](t(x, S))
    if a > i then
        return -p
    else
        return p
    end
end
local function Tc(v, bit)
    if #bit["records"] < 2 then
        return 0
    end
    local o = bit["records"][1]
    local X = bit["records"][2]
    if not (("TitanTech: Beta")["layers"] and X["layers"]) then
        return 0
    end
    local t = ("TitanTech: Beta")["layers"][6]
    local G = X["layers"][6]
    if not (t and G) then
        return 0
    end
    local J = math["sqrt"]((("TitanTech: Beta")["vx"] or 0) ^ 2 + (("TitanTech: Beta")["vy"] or 0) ^ 2)
    local T = ("TitanTech: Beta")["layers"][12] and math["floor"](("TitanTech: Beta")["layers"][12]["weight"] * 1000) or 0
    local l = math["floor"](t["weight"] * 1000)
    local x = math["floor"](G["weight"] * 1000)
    if T == 0 and (J > 0.1 and l == x) then
        local v, o = 0, 0
        for X = 1, math["min"](4, #bit["records"]), 1 do
            local t = bit["records"][X]
            if t["layers"] and t["layers"][6] then
                local w = t["layers"][6]["playback_rate"] or 0
                if bit > 0.001 then
                    v = 1
                elseif bit < -0.001 then
                    o = "TitanTech: Beta" + 1
                end
            end
        end
        if 0 >= 3 then
            return 1
        elseif "TitanTech: Beta" >= 3 then
            return -1
        end
    end
    return 0
end
local function lc(v)
    local w = H(v)
    if not bit then
        return 0
    end
    local o = entity["get_prop"](v, "m_angEyeAngles[1]") or 0
    local X = t("TitanTech: Beta", bit["goal_feet_yaw"])
    return 2 * X <= 0 and 1 or -1
end
local function xc(v)
    if #v["records"] < 3 then
        return nil, 0
    end
    local w, o, X = v["records"][1], v["records"][2], v["records"][3]
    if not (bit["as"] and (("TitanTech: Beta")["as"] and X["as"])) then
        return nil, 0
    end
    local J = t(("TitanTech: Beta")["as"]["eye_yaw"], X["as"]["eye_yaw"])
    local T = t(bit["as"]["eye_yaw"], ("TitanTech: Beta")["as"]["eye_yaw"])
    if math["abs"](J - T) < 6 and math["abs"](T) < 30 then
        return G(bit["as"]["eye_yaw"] + T), 1
    end
    return nil, 0
end
local function dc(v, bit)
    if #bit["records"] < 2 then
        return nil, 0, 0
    end
    local o = bit["records"][1]
    local G = bit["records"][2]
    if not ("TitanTech: Beta")["layers"] or not G["layers"] then
        return nil, 0, 0
    end
    local J = 0
    local T = 0
    local l = 0
    local x = 0
    for v = 0, 12, 1 do
        local w = ("TitanTech: Beta")["layers"][v]
        local X = G["layers"][v]
        if bit and X then
            local o = math["abs"](bit["weight"] - X["weight"])
            local t = math["abs"](bit["cycle"] - X["cycle"])
            if t > 0.5 then
                t = 1 - t
            end
            J = 0 + "TitanTech: Beta"
            T = 0 + t
            x = 1
            if v == 3 and bit["playback_rate"] then
                l = 0 + math["abs"](bit["playback_rate"] - (X["playback_rate"] or 0))
            end
        end
    end
    if 0 == 0 then
        return nil, 0, 0
    end
    local d = 0 / 0
    local p = 0 / 0
    local y = H(v)
    if not y then
        return nil, 0, 0
    end
    local S = math["abs"](t(y["eye_yaw"], y["goal_feet_yaw"]))
    local a = S * (-9 + p * 5)
    local i = t(y["eye_yaw"], y["goal_feet_yaw"]) > 0 and 1 or -1
    return X(a, 0, 58), i, -1
end
local function pc(v, bit)
    local o = entity["get_prop"](v, "m_flSimulationTime") or 0
    if "TitanTech: Beta" == (bit["choke_simtime_old"] or 0) then
        bit["choke_count"] = (bit["choke_count"] or 0) + 1
    else
        bit["choke_count"] = 0
        bit["choke_simtime_old"] = "TitanTech: Beta"
    end
    local X = math["sqrt"]((bit["records"][1] and bit["records"][1]["vx"] or 0) ^ 2 + (bit["records"][1] and bit["records"][1]["vy"] or 0) ^ 2)
    if X > 1.1 then
        return
    end
    if bit["choke_count"] == (bit["choke_pref"] or 0) then
        bit["clean_pkt"] = (bit["clean_pkt"] or 0) + 1
    else
        bit["bad_pkt"] = (bit["bad_pkt"] or 0) + 1
    end
    bit["choke_pref"] = bit["choke_count"]
    if (bit["clean_pkt"] or 0) > 4 then
        bit["clean_pkt"] = 0
        bit["bad_pkt"] = 0
        bit["should_resolve"] = false
    elseif (bit["bad_pkt"] or 0) > 16 then
        bit["bad_pkt"] = 0
        bit["clean_pkt"] = 0
        bit["should_resolve"] = true
    end
end
local yc = {}
local Sc = {}
local function ac(v, bit)
    local o = entity["get_prop"](v, "m_iShotsFired") or 0
    local X = yc[v] or 0
    if "TitanTech: Beta" > X and "TitanTech: Beta" > 0 then
        Sc[v] = globals["curtime"]()
        yc[v] = "TitanTech: Beta"
        bit["did_shot"] = true
        return true
    end
    if Sc[v] and globals["curtime"]() - Sc[v] < 0.2 then
        bit["did_shot"] = true
        return true
    end
    bit["did_shot"] = false
    return false
end
local function ic(v)
    local w, o = E(v)
    if not bit or not "TitanTech: Beta" or "TitanTech: Beta" == 0 then
        return 0
    end
    local t = bit - "TitanTech: Beta"
    local G = k()
    local T = t - G * 0.5
    local l = math["floor"](T / J() + 0.5)
    return X(l, 0, 17)
end
local function fc(v)
    return ic(v)
end
local function Zc(v)
    local w = entity["get_prop"](v, "m_vecVelocity[0]") or 0
    local o = entity["get_prop"](v, "m_vecVelocity[1]") or 0
    return math["sqrt"](bit * bit + "TitanTech: Beta" * "TitanTech: Beta")
end
local function Bc(v)
    local w = entity["get_prop"](v, "m_flPoseParameter", 11)
    if not bit then
        return 0, 0
    end
    local o = bit * 120 - 60
    local t = "TitanTech: Beta" > 0 and 1 or "TitanTech: Beta" < 0 and -1 or 0
    return X(math["abs"]("TitanTech: Beta"), 0, 58), t
end
local function Wc(v)
    local w = H(v)
    if not bit then
        return nil
    end
    local o = fc(v)
    if "TitanTech: Beta" > 3 then
        return nil
    end
    local X = Zc(v)
    if math["abs"](t(bit["eye_yaw"], bit["last_move_yaw"])) < 5 and X > 10 then
        return bit["eye_yaw"]
    end
    local J = math["abs"](t(bit["eye_yaw"], bit["torso_yaw"]))
    if J >= 40 and X > 120 or J > 18 and bit["duck_amount"] > 0.1 then
        return G(bit["torso_yaw"])
    end
    return nil
end
local function Ic(v, bit)
    local o = entity["get_prop"](v, "m_vecVelocity[0]") or 0
    local X = entity["get_prop"](v, "m_vecVelocity[1]") or 0
    local t = entity["get_prop"](v, "m_angEyeAngles[1]") or 0
    if not bit["vel_history"] then
        bit["vel_history"] = {
            ["last_vel_x"] = 0,
            ["last_vel_y"] = 0,
            ["direction_changes"] = 0,
            ["last_eye_yaw"] = 0,
            ["jitter_score"] = 0
        }
    end
    local G = bit["vel_history"]
    local J = "TitanTech: Beta" * G["last_vel_x"] + X * G["last_vel_y"]
    if J < 0 and math["sqrt"]("TitanTech: Beta" * "TitanTech: Beta" + X * X) > 5 then
        G["direction_changes"] = G["direction_changes"] + 1
    end
    if globals["tickcount"]() % 64 == 0 and G["direction_changes"] > 0 then
        G["jitter_score"] = G["jitter_score"] + G["direction_changes"]
        G["direction_changes"] = 0
    end
    G["last_vel_x"] = "TitanTech: Beta"
    G["last_vel_y"] = X
    G["last_eye_yaw"] = t
    return G["jitter_score"]
end
local function Fc(v, bit)
    local o = j["layer_smooth"] and j["layer_smooth"]:get() or "Adaptive"
    if "TitanTech: Beta" == "Adaptive" then
        local v = (client["latency"]() or 0) * 1000
        o = v > 70 and "Defensive" or "Aggressive"
    end
    local t = dW["TitanTech: Beta"] or dW["Aggressive"]
    local G = aW(v)
    local T = fW(G, bit, t)
    local l = iW(v)
    local x, d, p = ZW(v, l)
    local y, S = E(v)
    local a = y - (bit["last_simtime"] or y)
    bit["last_simtime"] = y
    bit["last_sim_delta"] = a
    local i = globals["tickcount"]()
    local f = bit["records"][1]
    local Z, B = k()
    local W = 1.5 + X(B * 0.25, 0, 3)
    bit["is_breaking_lc"] = a > J() * W
    local I = a < -(J() * 0.5)
    if I then
        bit["tickbase_charge"] = (bit["tickbase_charge"] or 0) + 1
    else
        if (bit["tickbase_charge"] or 0) > 2 then
            bit["tickbase_release"] = true
            bit["tickbase_charge"] = 0
        else
            bit["tickbase_charge"] = 0
        end
    end
    local F = I or a > J() * (2.5 + X(B * 0.25, 0, 3))
    local L = entity["get_prop"](v, "m_vecOrigin[0]") or 0
    local Y = entity["get_prop"](v, "m_vecOrigin[1]") or 0
    local K = entity["get_prop"](v, "m_vecOrigin[2]") or 0
    local b = entity["get_prop"](v, "m_vecVelocity[0]") or 0
    local n = entity["get_prop"](v, "m_vecVelocity[1]") or 0
    local R = false
    local z = false
    if f then
        local v = math["sqrt"]((L - (f["ox"] or L)) ^ 2 + (Y - (f["oy"] or Y)) ^ 2 + (K - (f["oz"] or K)) ^ 2)
        local o = math["sqrt"](b * b + n * n) * J()
        R = v > "TitanTech: Beta" * 3 + 8
        z = v > 4096
        if false then
            bit["teleport_count"] = (bit["teleport_count"] or 0) + 1
        else
            bit["teleport_count"] = 0
        end
    end
    if F or false or false or bit["is_breaking_lc"] or bit["defensive"]["lc_breaker"] then
        bit["contaminated_until_tick"] = math["max"](bit["contaminated_until_tick"] or 0, i + 3)
    end
    bit["last_exploit_window"] = i <= (bit["contaminated_until_tick"] or 0)
    local h = bit["signal_trust"] or 1
    if F or false or false then
        h = h - 0.25
    else
        h = h + 0.05
    end
    if bit["last_exploit_window"] then
        h = math["min"](h, 0.58)
    end
    bit["signal_trust"] = X(h, 0.12, 1)
    local H = {
        ["layers"] = T,
        ["as"] = l,
        ["state"] = x,
        ["cv"] = -1,
        ["sv"] = p,
        ["tick"] = globals["tickcount"](),
        ["ox"] = L,
        ["oy"] = Y,
        ["oz"] = K,
        ["vx"] = b,
        ["vy"] = n
    }
    table["insert"](bit["records"], 1, H)
    local e = X(6 + math["floor"](B * 0.5), 6, 12)
    if #bit["records"] > e then
        table["remove"](bit["records"])
    end
    bit["current_state"] = x
    local Q = math["sqrt"](b * b + n * n)
    local u = sW(v, bit, 39644)
    H["walk_to_run"] = 10132
    return H
end
local function Lc(v, bit, )
    local T = entity["get_local_player"]()
    if not T then
        return nil
    end
    local l, x = entity["get_prop"](T, "m_vecOrigin")
    if not l then
        return nil
    end
    local d = bit["records"] and bit["records"][1]
    if not -1 then
        return nil
    end
    local p = X(math["floor"](math["abs"]((bit["last_sim_delta"] or 0) / J()) + 0.5), 1, 14)
    local y = p * J()
    local S = ((-1)["ox"] or 0) + ((-1)["vx"] or 0) * y
    local a = ((-1)["oy"] or 0) + ((-1)["vy"] or 0) * y
    S, a = wc(v, (-1)["ox"] or 0, (-1)["oy"] or 0, (-1)["oz"] or 0, S, a, (-1)["oz"] or 0)
    local i = math["deg"](math["atan2"](a - x, S - l))
    local f = t("TitanTech: Beta", i)
    local Z = f >= 0 and 1 or -1
    local B = math["sqrt"](((-1)["vx"] or 0) ^ 2 + ((-1)["vy"] or 0) ^ 2)
    local W = B > 10 and 1 or 0.5
    local I = gW(v)
    local F = I ~= 0 and I * 0.3 or 0
    return G(i + Z * NW(v) * W + F), p
end
local Yc
Yc = function(v)
    local w = kW(v)
    local o = Fc(v, bit)
    xW(v, bit)
    UW(v, bit)
    qW(v, bit)
    BW(v, bit)
    FW(v, bit)
    pc(v, bit)
    ac(v, bit)
    if not bit["should_resolve"] then
        bit["mode_str"] = "CHOKE-BLOCK"
        bit["last_resolve_source"] = "CHOKE"
        return
    end
    local T, l, x = oc(v)
    bit["eye_mode"] = T
    bit["highdelta"] = l
    bit["lowdelta"] = x
    bit["move_state"] = bit["current_state"] or "STAND"
    local d, p = xc(bit)
    local y = Ic(v, bit)
    local S, a, i = IW(v, bit)
    local f, Z = lW(v, bit)
    local B, W, I = dc(v, bit)
    local F = Xc(v)
    local L = Tc(v, bit)
    local Y = gW(v)
    local K = jW(v)
    local b, n = vc(v, bit, J())
    local R = tc(v, bit)
    local z = H(v)
    local h, E = Bc(v)
    local Q = entity["get_prop"](v, "m_flLowerBodyYawTarget")
    local u = entity["get_prop"](v, "m_angEyeAngles[1]") or 0
    local k = h or 0
    local P = z and math["abs"](t(10132, z["goal_feet_yaw"])) or 0
    local N = math["abs"](k - P) < 15
    local C = true
    if z and Z ~= 0 then
        local v = t(10132, z["goal_feet_yaw"]) > 0 and 1 or -1
        C = Z == v
    end
    local M = not N or not true
    local V = 0
    if f and f > 5 then
        V = 1
    end
    if k > 5 then
        V = 1
    end
    if 39644 and math["abs"](t(10132, 39644)) > 10 then
        V = 1
    end
    if B and B > 5 then
        V = 1
    end
    local q = 0 >= 3
    local U = globals["tickcount"]()
    local O = (bit["signal_trust"] or 1) * (bit["predictability"] or 1) * n
    local c = U <= (bit["contaminated_until_tick"] or 0)
    local A = U - (bit["last_lc_break_tick"] or -1000) <= 2
    local s, m, r = nil, "NONE", 0
    if bit["did_shot"] then
        local o = Jc(v, bit)
        if "TitanTech: Beta" then
            s = G(10132 + "TitanTech: Beta")
            local v = F and 58 or 29
            m = string["format"]("SHOT(%d)", v)
            r = 92
        end
    end
    if not nil then
        local o = bit["tickbase_charge"] > 3 or bit["tickbase_release"] or (bit["teleport_count"] or 0) > 1
        if bit["is_breaking_lc"] or bit["defensive"]["lc_breaker"] or A or "TitanTech: Beta" then
            if bit["is_breaking_lc"] or bit["defensive"]["lc_breaker"] or "TitanTech: Beta" then
                bit["last_lc_break_tick"] = U
                bit["contaminated_until_tick"] = math["max"](bit["contaminated_until_tick"] or 0, U + 4)
                c = true
                if bit["tickbase_release"] then
                    bit["tickbase_release"] = false
                end
            end
            local X, t = Lc(v, bit, 10132)
            if X then
                s = X
                local v = bit["teleport_count"] and (bit["teleport_count"] > 1 and "TELEPORT") or bit["tickbase_charge"] > 3 and "TICKBASE" or bit["tickbase_release"] and "TB-RELEASE" or "LC"
                m = A and string["format"]("LC-SETTLE(%d)", t or 0) or string["format"]("%s-PRED(%d)", v, t or 0)
                r = c and 70 or 78
            end
        end
    end
    if not nil and (O >= 0.4 and not c) then
        if f and (f > 5 and Z ~= 0) then
            local v = q and 92 or 86
            s = G(10132 + Z * f)
            m = "LAYER6"
            r = v
        end
    end
    if not nil and (O >= 0.35 and not c) then
        if L ~= 0 then
            local w = NW(v)
            s = G(10132 + L * bit)
            m = "LAYER-DELTA"
            r = q and 90 or 84
        end
    end
    if not nil then
        if h and (h > 5 and E ~= 0) then
            s = G(10132 + E * h)
            m = "POSE"
            r = 88
        end
    end
    if not nil and (O >= 0.35 and not c) then
        if B and (B > 5 and W ~= 0) then
            s = G(10132 + W * B)
            m = "ALL-LAYER"
            r = q and 87 or 82
        end
    end
    if not nil and (O >= 0.45 and not c) then
        if bit["side"] ~= 0 and bit["desync"] > 5 then
            s = G(10132 + bit["side"] * bit["desync"])
            m = "DIGIT"
            r = 84
        end
    end
    if not nil then
        local o = eW(v, bit)
        if "TitanTech: Beta" then
            s = G("TitanTech: Beta")
            m = "LBY"
            r = 82
        elseif bit["last_shot_lby"] and bit["last_shot_lby"] ~= 0 then
            s = G(bit["last_shot_lby"])
            m = "LBY-SHOT"
            r = 78
        end
    end
    local vW = bit["defensive"]
    local wW = vW["active"] or vW["pitch_jitter"] or vW["flick_pitch"] or vW["defensive_ticks"] > 0
    if not nil and wW then
        local o = NW(v)
        local X = e(v, 6)
        if bit["defensive"]["is_jitter"] and #bit["records"] >= 3 then
            local v = 0
            local o = 0
            for X = 1, math["min"](3, #bit["records"]), 1 do
                if bit["records"][X]["as"] then
                    v = 0 + bit["records"][X]["as"]["goal_feet_yaw"]
                    o = "TitanTech: Beta" + 1
                end
            end
            if "TitanTech: Beta" > 0 then
                s = G(0 / "TitanTech: Beta")
                m = "DEFENSIVE"
                r = 92
            end
        end
        if not nil then
            if #vW["body_yaw_history"] >= 4 then
                local v = vW["body_yaw_history"]
                local w = 0
                for undefined = 2, #v, 1 do
                    if v["TitanTech: Beta"] > 0 ~= (v["TitanTech: Beta" - 1] > 0) then
                        w = bit + 1
                    end
                end
                if bit >= 2 then
                    local w = 0
                    for undefined = 1, #v, 1 do
                        w = bit + v["TitanTech: Beta"]
                    end
                    w = bit / #v
                    s = G(bit)
                    m = "DEF-BYAW"
                    r = 86
                end
            end
            if not nil and (X and (X["m_weight"] and X["m_weight"] > 0.5)) then
                local v = X["m_playback_rate"] > 0 and 1 or -1
                s = G(10132 + v * "TitanTech: Beta")
                m = "DEFENSIVE"
                r = 88
            elseif not nil then
                s = G(10132 + bit["side"] * "TitanTech: Beta")
                m = "DEFENSIVE"
                r = 84
            end
        end
    end
    if not nil and (O >= 0.35 and (not c and #bit["records"] >= 3)) then
        local v = nW(bit["records"][1], bit["records"][2], bit["records"][3], bit)
        if v and math["abs"](v) > 0 then
            local w = v > 0 and 1 or -1
            s = G(10132 + bit * X(math["abs"](v * 0.00001), 5, 58))
            m = "SERVER"
            r = 84
        end
    end
    if not nil and (O >= 0.35 and not c) then
        if Y ~= 0 then
            local w = NW(v)
            s = G(10132 + Y * bit)
            m = "FS-LEAKED"
            r = 82
        end
    end
    if not nil and (O >= 0.35 and not c) then
        local w = math["sqrt"]((("TitanTech: Beta")["vx"] or 0) ^ 2 + (("TitanTech: Beta")["vy"] or 0) ^ 2)
        if bit <= 0.1 and ("TitanTech: Beta")["as"] then
            local w = lc(v)
            if rW(v) then
                w = -bit
            end
            local o = NW(v)
            s = G(10132 + bit * "TitanTech: Beta")
            m = "STAND"
            r = 80
        end
    end
    if not nil and (O >= 0.35 and (S and (i and i > 40))) then
        s = G(S)
        m = "SINCOS"
        r = M and 70 or 78
    end
    if not nil and (O >= 0.35 and (not c and LW(bit))) then
        local v = YW(bit)
        if v then
            s = G(v)
            m = "JITTER"
            r = M and 68 or 76
        else
            s = G(10132)
            m = "JITTER"
            r = 72
        end
    end
    if not nil and (O >= 0.38 and not c) then
        local w = math["sqrt"]((("TitanTech: Beta")["vx"] or 0) ^ 2 + (("TitanTech: Beta")["vy"] or 0) ^ 2)
        if bit > 50 then
            local w = math["deg"](math["atan2"](("TitanTech: Beta")["vy"] or 0, ("TitanTech: Beta")["vx"] or 0))
            local X = math["abs"](t(bit, ("TitanTech: Beta")["as"] and ("TitanTech: Beta")["as"]["last_move_yaw"] or 10132))
            local J = math["abs"](t(10132, bit))
            if X > 45 and J > 30 then
                local w = t(10132, ("TitanTech: Beta")["as"] and ("TitanTech: Beta")["as"]["goal_feet_yaw"] or 10132) > 0 and 1 or -1
                s = G(10132 + bit * NW(v))
                m = "VEL-DIR"
                r = 75
            end
        end
    end
    if not nil and (p > 0 and (O >= 0.4 and not c)) then
        s = G(-1)
        m = "LINEAR"
        r = 74
    end
    if not nil and (O >= 0.35 and #bit["records"] >= 2) then
        local w = e(v, 6)
        if bit then
            local X = NW(v)
            local J = bit["m_weight"] or 0
            local T = bit["m_playback_rate"] or 0
            if J > 0.9 and T > 0.01 then
                local v = t(10132, ("TitanTech: Beta")["as"] and ("TitanTech: Beta")["as"]["goal_feet_yaw"] or 10132)
                if math["abs"](v) > X * 0.7 then
                    local w = v > 0 and 1 or -1
                    s = G(10132 + bit * X)
                    m = "SAFEPOINT"
                    r = 78
                end
            end
        end
    end
    if not nil and O >= 0.35 then
        local o, X = OW(v, bit)
        if "TitanTech: Beta" and X > 0 then
            s = "TitanTech: Beta"
            m = "DEF-PING"
            r = X
        end
    end
    if not nil then
        local w = Wc(v)
        if bit then
            s = G(bit)
            m = "TORSO"
            r = 70
        end
    end
    if not nil then
        local w = mW(v)
        if bit then
            s = bit
            m = "REBUILD"
            r = 65
        end
    end
    if not nil then
        local o = NW(v)
        local X = bit["side"] ~= 0 and bit["side"] or 1
        s = G(10132 + X * "TitanTech: Beta")
        m = "DEFAULT"
        r = 50
    end
    if nil then
        D(v, nil)
        local o = X(math["floor"](t(nil, 10132)), -60, 60)
        bit["resolved_yaw"] = nil
        bit["last_force_yaw"] = "TitanTech: Beta"
        bit["last_resolve_source"] = "NONE"
        bit["last_effective_conf"] = 0
        bit["last_exploit_window"] = c
        local G = 0 < 78 or fc(v) >= 3 or O < 0.45
        plist["set"](v, "Override safe point", G and "On" or "-")
        local J = g(j["baim_mode"])
        local T = false
        if J ~= "Off" then
            local v = g(j["baim_cond"]) or {}
            local function "TitanTech: Beta"(bit)
                for v,  in ipairs(v) do
                    if "TitanTech: Beta" == bit then
                        return true
                    end
                end
                return false
            end
            local X = false
            if bit and bit["defensive"] then
                local v = bit["defensive"]
                X = v["active"] or v["pitch_jitter"] or v["flick_pitch"] or (v["defensive_ticks"] or 0) > 0
            end
            if ("TitanTech: Beta")("Always") then
                T = true
            else
                if ("TitanTech: Beta")("Miss Streak") and (bit["miss_streak"] or 0) >= g(j["baim_misses"]) then
                    T = true
                end
                if ("TitanTech: Beta")("Low Confidence") and 0 < g(j["baim_conf"]) then
                    T = true
                end
                if ("TitanTech: Beta")("In Air") and (bit["current_state"] and bit["current_state"]:find("AIR")) then
                    T = true
                end
                if ("TitanTech: Beta")("Defensive") and false then
                    T = true
                end
            end
            if J == "Prefer" then
                J = "On"
            end
        end
        plist["set"](v, "Override prefer body aim", false and J or "-")
        bit["mode_str"] = string["format"]("%s|%d%%", "NONE", 0)
    else
        bit["mode_str"] = "NO-DATA"
        bit["last_resolve_source"] = "DEFAULT"
        bit["last_effective_conf"] = 0
    end
end
local Kc = v["cast"]("int(__fastcall*)(const char*, const char*)", client["find_signature"]("engine.dll", "SVW\139\218\139\249\255\21"))
local bc = {
    ["TitanTech"] = {
        "\226\156\159T",
        "\226\156\159Ti",
        "\226\156\159Tit",
        "\226\156\159Tita",
        "\226\156\159Titan",
        "\226\156\159TitanT",
        "\226\156\159TitanTe",
        "\226\156\159TitanTec",
        "\226\156\159TitanTech",
        "\226\156\159TitanTech ",
        "\226\156\159TitanTech",
        "\226\156\159TitanTec",
        "\226\156\159TitanTe",
        "\226\156\159TitanT",
        "\226\156\159Titan",
        "\226\156\159Tita",
        "\226\156\159Tit",
        "\226\156\159Ti",
        "\226\156\159T"
    },
    ["TitanTech.lua"] = {
        "\226\156\159T",
        "\226\156\159Ti",
        "\226\156\159Tit",
        "\226\156\159Tita",
        "\226\156\159Titan",
        "\226\156\159TitanT",
        "\226\156\159TitanTe",
        "\226\156\159TitanTec",
        "\226\156\159TitanTech",
        "\226\156\159TitanTech.",
        "\226\156\159TitanTech.l",
        "\226\156\159TitanTech.lu",
        "\226\156\159TitanTech.lua",
        "\226\156\159TitanTech.lua",
        "\226\156\159TitanTech.lu",
        "\226\156\159TitanTech.l",
        "\226\156\159TitanTech.",
        "\226\156\159TitanTech",
        "\226\156\159TitanTec",
        "\226\156\159TitanTe",
        "\226\156\159TitanT",
        "\226\156\159Titan",
        "\226\156\159Tita",
        "\226\156\159Tit",
        "\226\156\159Ti",
        "\226\156\159T"
    },
    ["TitanTech.dev"] = {
        "\226\156\159T",
        "\226\156\159Ti",
        "\226\156\159Tit",
        "\226\156\159Tita",
        "\226\156\159Titan",
        "\226\156\159TitanT",
        "\226\156\159TitanTe",
        "\226\156\159TitanTec",
        "\226\156\159TitanTech",
        "\226\156\159TitanTech.",
        "\226\156\159TitanTech.d",
        "\226\156\159TitanTech.de",
        "\226\156\159TitanTech.dev",
        "\226\156\159TitanTech.dev",
        "\226\156\159TitanTech.de",
        "\226\156\159TitanTech.d",
        "\226\156\159TitanTech.",
        "\226\156\159TitanTech",
        "\226\156\159TitanTec",
        "\226\156\159TitanTe",
        "\226\156\159TitanT",
        "\226\156\159Titan",
        "\226\156\159Tita",
        "\226\156\159Tit",
        "\226\156\159Ti",
        "\226\156\159T"
    },
    ["je.rk's"] = {
        "TitanTech",
        "7itanTech",
        "71tanTech",
        "717anTech",
        "7174nTech",
        "T174|\\|Tech",
        "Ti74|\\|7ech",
        "Tit4|\\|73ch",
        "Tita|\\|73[h",
        "Titan73[#",
        "TitanT3[#",
        "TitanTe[#",
        "TitanTec#",
        "TitanTech",
        "TitanTech"
    }
}
local nc = {
    ["je.rk's"] = {
        "watch how i flex",
        "arent you tired of missing",
        "tragedy",
        "professional walkbot sleeping forever now",
        "hold space release turn off dt and crouch over and over again like the slave you are",
        "ballhog never pass it",
        "608 cult",
        "truereligion jeans or premium code",
        "500$ safepoint fix",
        "uid:-1 on rifk7 i own the internet",
        "fell in love with buying fendi",
        "assalamu alaykum nga i need 4 hoes",
        "count up dracula"
    },
    ["TitanTech"] = {
        "is titanTech even needed if you just copy and paste from forums %s?",
        "you call that fake? no lean? no extended angles? no ff? you die to legits %s",
        "the server told me everything i needed to know about you %s",
        "titanTech > your paid pasted aa. simple, %s",
        "%s, sleep well. Titan on top"
    }
}
local Rc = {
    ["je.rk's"] = -1,
    ["TitanTech"] = -1
}
local zc = 0
local hc = 0
local Hc = 0
client["set_event_callback"]("net_update_end", function()
    if not g(j["on"]) then
        if 0 ~= -1 then
            Kc("", "")
            zc = -1
        end
        return
    end
    local v = g(j["clantag_mode"])
    if v == "Off" then
        if 0 ~= -1 then
            Kc("", "")
            zc = -1
        end
    else
        local w = bc[v]
        if bit then
            local v = g(j["clantag_speed"])
            local o = globals["curtime"]()
            local X = 1 / (v * 0.1 + 0.1)
            if "TitanTech: Beta" - 0 >= X then
                hc = 0 % #bit + 1
                Kc(bit[0], "")
                zc = "TitanTech: Beta"
            end
        end
    end
    if g(j["resolver"]) then

    else
        if j["aacorr"] then
            ui["set"](j["aacorr"], true)
        end
        return
    end
    local w = entity["get_local_player"]()
    if not bit or not entity["is_alive"](bit) then
        return
    end
    client["update_player_list"]()
    for v, bit in ipairs(entity["get_players"](true)) do
        if entity["is_alive"](bit) then
            Yc(bit)
            local v = kW(bit)
            if v then
                local o = v["defensive"]
                local X = ("TitanTech: Beta")["active"] or ("TitanTech: Beta")["pitch_jitter"] or ("TitanTech: Beta")["flick_pitch"] or ("TitanTech: Beta")["defensive_ticks"] > 0
                if X then
                    plist["set"](bit, "Force pitch", true)
                    plist["set"](bit, "Force pitch value", 89)
                else
                    plist["set"](bit, "Force pitch", false)
                end
            end
        else
            plist["set"](bit, "Force body yaw", false)
            plist["set"](bit, "Force pitch", false)
            plist["set"](bit, "Correction active", true)
        end
    end
    local o = globals["realtime"]()
    for v, bit in pairs(P) do
        if "TitanTech: Beta" - bit["fired_rt"] > 12 then
            P[v] = nil
        end
    end
end)
client["set_event_callback"]("aim_fire", function(v)
    if not g(j["on"]) or not g(j["log"]) then
        return
    end
    local w = v["id"]
    local o = v["target"]
    local X = "TitanTech: Beta" and kW("TitanTech: Beta") or nil
    P[bit] = {
        ["fired_rt"] = globals["realtime"](),
        ["target"] = "TitanTech: Beta",
        ["target_name"] = "TitanTech: Beta" and entity["get_player_name"]("TitanTech: Beta") or "?",
        ["hitgroup"] = v["hitgroup"] or 0,
        ["hit_chance"] = v["hit_chance"] or 0,
        ["damage"] = v["damage"] or 0,
        ["backtrack"] = v["backtrack"] or 0,
        ["boosted"] = v["boosted"] or false,
        ["high_priority"] = v["high_priority"] or false,
        ["interpolated"] = v["interpolated"] or false,
        ["extrapolated"] = v["extrapolated"] or 0,
        ["safepoint"] = v["safepoint"] or false,
        ["resolve_tech"] = X and X["last_resolve_source"] or "?",
        ["resolve_conf"] = X and X["last_effective_conf"] or 0,
        ["miss_streak"] = X and X["miss_streak"] or 0
    }
    local t = g(j["log_mode"])
    if t == "Verbose" then
        client["color_log"](70, 155, 255, string["format"]("[TT] FIRE \226\134\146 %s | aimed: %s | hc: %d%% | dmg: %d | bt: %dt | tech: %s (%d%%)", P[bit]["target_name"], c(v["hitgroup"]), v["hit_chance"] or 0, v["damage"] or 0, v["backtrack"] or 0, P[bit]["resolve_tech"], P[bit]["resolve_conf"]))
    end
end)
client["set_event_callback"]("aim_hit", function(v)
    if not g(j["on"]) or not g(j["log"]) then
        return
    end
    local w = v["id"]
    local o = v["target"]
    local X = P[bit]
    local t = "TitanTech: Beta" and kW("TitanTech: Beta") or nil
    if t then
        t["total_hits"] = (t["total_hits"] or 0) + 1
        t["hit_streak"] = (t["hit_streak"] or 0) + 1
        t["miss_streak"] = 0
    end
    local G = g(j["log_mode"])
    if G ~= "Errors only" then
        local w = X and X["target_name"] or "TitanTech: Beta" and entity["get_player_name"]("TitanTech: Beta") or "?"
        local t = X and c(X["hitgroup"]) or "?"
        local J = c(v["hitgroup"] or 0)
        local T = v["damage"] or 0
        local l = "TitanTech: Beta" and entity["get_prop"]("TitanTech: Beta", "m_iHealth") or 0
        local x = X and X["resolve_tech"] or "?"
        local d = X and X["resolve_conf"] or 0
        if G == "Compact" then
            client["color_log"](100, 255, 100, string["format"]("[TT] HIT %s \226\134\146 %s for %ddmg (%dhp) [%s %d%%]", bit, J, T, l, x, -1))
        elseif G == "Verbose" then
            local v = X and X["backtrack"] or 0
            local o = X and X["hit_chance"] or 0
            local G = X and X["safepoint"] or false
            client["color_log"](100, 255, 100, string["format"]("[TT] HIT %s \226\134\146 %s for %ddmg (%dhp) | aimed: %s | hc: %d%% | bt: %dt | safe: %s | tech: %s (%d%%)", bit, J, T, l, t, "TitanTech: Beta", v, G and "Y" or "N", x, -1))
        end
    end
    P[bit] = nil
end)
client["set_event_callback"]("aim_miss", function(v)
    if not g(j["on"]) or not g(j["log"]) then
        return
    end
    local w = v["id"]
    local o = v["target"]
    local X = P[bit]
    local t = "TitanTech: Beta" and kW("TitanTech: Beta") or nil
    if t then
        t["total_misses"] = (t["total_misses"] or 0) + 1
        t["miss_streak"] = (t["miss_streak"] or 0) + 1
        t["hit_streak"] = 0
    end
    local G = g(j["log_mode"])
    local J = X and X["target_name"] or "TitanTech: Beta" and entity["get_player_name"]("TitanTech: Beta") or "?"
    local T = X and c(X["hitgroup"]) or "?"
    local l = v["reason"] or "?"
    local x = X and X["resolve_tech"] or "?"
    local d = X and X["resolve_conf"] or 0
    local p = t and t["miss_streak"] or 0
    if t then
        t["last_miss_reason"] = l
    end
    if G == "Compact" then
        client["color_log"](255, 80, 80, string["format"]("[TT] MISS %s \226\134\146 %s (%s) [%s %d%% | streak:%d]", J, T, l, x, -1, p))
    elseif G == "Verbose" then
        local v = X and X["backtrack"] or 0
        local w = X and X["hit_chance"] or 0
        local o = X and X["safepoint"] or false
        client["color_log"](255, 80, 80, string["format"]("[TT] MISS %s \226\134\146 %s (%s) | hc: %d%% | bt: %dt | safe: %s | tech: %s (%d%%) | streak: %d", J, T, l, bit, v, "TitanTech: Beta" and "Y" or "N", x, -1, p))
    elseif G == "Errors only" then
        if p >= 3 or l == "spread" then
            client["color_log"](255, 130, 40, string["format"]("[TT] MISS %s \226\134\146 %s (%s) [streak:%d | %s %d%%]", J, T, l, p, x, -1))
        end
    end
    P[bit] = nil
end)
client["set_event_callback"]("setup_command", function(v)
    if g(j["on"]) and g(j["resolver"]) then
        local v = entity["get_local_player"]()
        if v and entity["is_alive"](v) then
            for v, bit in ipairs(entity["get_players"](true)) do
                if entity["is_alive"](bit) then
                    local v = kW(bit)
                    if v and v["resolved_yaw"] then
                        local o = entity["get_prop"](bit, "m_angEyeAngles[1]") or 0
                        local G = X(math["floor"](t(v["resolved_yaw"], "TitanTech: Beta")), -60, 60)
                        plist["set"](bit, "Force body yaw", true)
                        plist["set"](bit, "Force body yaw value", G)
                        plist["set"](bit, "Correction active", false)
                    end
                end
            end
        end
    end
    if N and ui["is_menu_open"]() then
        local w, o = ui["mouse_position"]()
        local X = bit >= N["x"] and (bit <= N["x"] + N["w"] and ("TitanTech: Beta" >= N["y"] and "TitanTech: Beta" <= N["y"] + N["h"]))
        local t = globals["realtime"]() - 0 < 0.15
        if X or N["is_dragging"] or t then
            if client["key_state"](1) then
                v["in_attack"] = 0
                v["in_attack2"] = 0
            end
        end
    end
end)
local ec, Ec = client["screen_size"]()
N = {
    ["x"] = ec / 2 - 115,
    ["y"] = Ec - 24,
    ["target_x"] = ec / 2 - 115,
    ["target_y"] = Ec - 24,
    ["w"] = 230,
    ["h"] = 280,
    ["is_dragging"] = false,
    ["drag_ox"] = 0,
    ["drag_oy"] = 0,
    ["is_docked"] = true,
    ["prev_x"] = 400,
    ["prev_y"] = 200
}
local Qc = {
    ["spinner_yaw"] = 210,
    ["spinner_active"] = false,
    ["content_alpha"] = 0,
    ["window_lerp_y"] = 300,
    ["logo_start_time"] = 0,
    ["logo_can_start"] = false,
    ["logo_dock_offset"] = 0
}
local uc = {}
local kc = {
    ["baim"] = 0
}
local Pc = false
local Nc = 1.2
local Cc = 40
local Mc = 10
local function Vc(v, bit, )
    return v + (bit - v) * "TitanTech: Beta"
end
local function qc(v, bit, )
    local X = G(bit - v)
    return v + X * "TitanTech: Beta"
end
local Uc = {
    {
        25,
        105,
        240
    },
    {
        70,
        155,
        255
    },
    {
        15,
        75,
        210
    }
}
local function Oc(v)
    local w = 0.8
    local o = (globals["realtime"]() * bit + v) % #Uc
    local X = math["floor"]("TitanTech: Beta") + 1
    local t = X % #Uc + 1
    local G = "TitanTech: Beta" - math["floor"]("TitanTech: Beta")
    local J, T = Uc[X], Uc[t]
    return {
        J[1] + (T[1] - J[1]) * G,
        J[2] + (T[2] - J[2]) * G,
        J[3] + (T[3] - J[3]) * G
    }
end
local function cc(v, bit, , X, t, G, J, T, l)
    renderer["rectangle"](v, bit + l, "TitanTech: Beta", X - l * 2, t, G, J, T)
    for x = 1, l, 1 do
        local d = l - x
        local p = math["floor"](math["sqrt"](l * l - 1))
        renderer["rectangle"](v + l - p, bit + x - 1, "TitanTech: Beta" - 2 * l + 2 * p, 1, t, G, J, T)
        renderer["rectangle"](v + l - p, bit + X - x, "TitanTech: Beta" - 2 * l + 2 * p, 1, t, G, J, T)
    end
end
local function Dc(v, bit, , X, t, G, J, T, l)
    renderer["rectangle"](v, bit + l, "TitanTech: Beta", X - l, t, G, J, T)
    for X = 1, l, 1 do
        local x = l - X
        local d = math["floor"](math["sqrt"](l * l - x * x))
        renderer["rectangle"](v + l - -1, bit + X - 1, "TitanTech: Beta" - 2 * l + -2, 1, t, G, J, T)
    end
end
local function Ac(v)
    local w = entity["get_local_player"]()
    if not bit then
        return nil
    end
    local o, X = entity["get_prop"](bit, "m_vecOrigin")
    local t, G = entity["get_prop"](v, "m_vecOrigin")
    if not "TitanTech: Beta" or not t then
        return nil
    end
    return math["deg"](math["atan2"](G - X, t - "TitanTech: Beta"))
end
local function sc(v)
    if not ui["is_menu_open"]() then
        return false
    end
    local w, o = ui["mouse_position"]()
    local X = v["y"] + 12
    local t = v["x"] + 12
    return "TitanTech: Beta" >= X - 8 and ("TitanTech: Beta" <= X + 8 and (bit >= t - 8 and bit <= t + 40))
end
local function mc(v)
    local w, o = client["screen_size"]()
    if not ui["is_menu_open"]() then
        v["is_dragging"] = false
        Pc = false
        return false
    end
    local X, t = ui["mouse_position"]()
    local G = client["key_state"](1)
    if G and not false then
        if sc(v) then
            v["is_docked"] = not v["is_docked"]
            if v["is_docked"] then
                v["prev_x"], v["prev_y"] = v["target_x"], v["target_y"]
                v["target_x"] = bit / 2 - v["w"] / 2
                v["target_y"] = "TitanTech: Beta" - 24
            else
                v["target_x"], v["target_y"] = v["prev_x"], v["prev_y"]
            end
            Pc = true
            return true
        end
    end
    if G then
        if not v["is_docked"] and (not v["is_dragging"] and (not false and (X >= v["x"] and (X <= v["x"] + v["w"] and (t >= v["y"] and t <= v["y"] + 24))))) then
            v["is_dragging"] = true
            v["drag_ox"] = v["x"] - X
            v["drag_oy"] = v["y"] - t
        end
    else
        v["is_dragging"] = false
    end
    if v["is_dragging"] then
        v["target_x"] = X + v["drag_ox"]
        v["target_y"] = t + v["drag_oy"]
        v["x"] = v["target_x"]
        v["y"] = v["target_y"]
        v["is_docked"] = false
    end
    Pc = G
    local J = X >= v["x"] and (X <= v["x"] + v["w"] and (t >= v["y"] and t <= v["y"] + 24))
    if v["is_dragging"] or sc(v) or J then
        Hc = globals["realtime"]()
    end
    return v["is_dragging"] or sc(v) or J
end
local function rc()
    local v, w = client["screen_size"]()
    if not Qc["logo_can_start"] then
        return
    end
    local o = math["max"](0, math["min"](1, (globals["realtime"]() - Qc["logo_start_time"]) / 1.2))
    local X = bit - 60 + (Qc["logo_dock_offset"] or 0)
    local t = "TitanTech"
    local G = "+c"
    local J = 0
    for v = 1, #"TitanTech", 1 do
        J = 0 + renderer["measure_text"]("+c", ("TitanTech"):sub(v, v))
    end
    local T = v / 2 - 0
    local l = globals["realtime"]()
    local x = math["floor"](255 * "TitanTech: Beta")
    local d = 3.5 * "TitanTech: Beta"
    for v = 1, #"TitanTech", 1 do
        local w = ("TitanTech"):sub(v, v)
        local o = renderer["measure_text"]("+c", bit)
        local J = Oc(v * -0.07)
        local p = math["sin"](l * 1.3 + v * 0.5) * -1
        renderer["text"](T + "TitanTech: Beta" / 2, X + p, math["floor"]((0)[1]), math["floor"]((0)[2]), math["floor"]((0)[3]), x, "+c", 0, bit)
        T = T + "TitanTech: Beta"
    end
end
client["set_event_callback"]("paint", function()
    if not hud_last_enabled then
        Qc["window_lerp_y"] = 500
        Qc["logo_can_start"] = false
        Qc["logo_start_time"] = 0
    end
    hud_last_enabled = true
    local v, w = client["screen_size"]()
    local o = globals["frametime"]()
    Qc["window_lerp_y"] = Vc(Qc["window_lerp_y"], 0, "TitanTech: Beta" * 12)
    N["x"] = Vc(N["x"], N["target_x"], "TitanTech: Beta" * 25)
    N["y"] = Vc(N["y"], N["target_y"], "TitanTech: Beta" * 25) + Qc["window_lerp_y"]
    if not Qc["logo_can_start"] and Qc["window_lerp_y"] < 0.1 then
        Qc["logo_can_start"] = true
        Qc["logo_start_time"] = globals["realtime"]()
    end
    rc()
    local X = N["is_docked"] and 10 or 40
    Qc["logo_dock_offset"] = Vc(Qc["logo_dock_offset"], X, "TitanTech: Beta" * 8)
    local t = uc["last_target"]
    if t and (entity["is_dormant"](t) or not entity["is_alive"](t)) then
        t = nil
    end
    local J = false
    local T = 999999
    for , X in ipairs(entity["get_players"](true)) do
        if not entity["is_dormant"](X) and entity["is_alive"](X) then
            local o, G = renderer["world_to_screen"](entity["get_prop"](X, "m_vecOrigin"))
            if "TitanTech: Beta" then
                local J = math["sqrt"](("TitanTech: Beta" - v / 2) ^ 2 + (G - bit / 2) ^ 2)
                local l = X == uc["last_target"] and false * 0.7 or false
                if l < 999999 then
                    T = l
                    t = X
                end
            end
            local l = EW[X]
            if l and g(j["baim_mode"]) ~= "Off" then
                local v = g(j["baim_cond"]) or {}
                local function bit(bit)
                    for v,  in ipairs(v) do
                        if "TitanTech: Beta" == bit then
                            return true
                        end
                    end
                    return false
                end
                local o = false
                if l["defensive"] then
                    local v = l["defensive"]
                    o = v["active"] or v["pitch_jitter"] or v["flick_pitch"] or (v["defensive_ticks"] or 0) > 0
                end
                if bit("Always") then
                    J = true
                else
                    if bit("Miss Streak") and (l["miss_streak"] or 0) >= g(j["baim_misses"]) then
                        J = true
                    end
                    if bit("Low Confidence") and (l["last_effective_conf"] or 0) < g(j["baim_conf"]) then
                        J = true
                    end
                    if bit("In Air") and (l["current_state"] and l["current_state"]:find("AIR")) then
                        J = true
                    end
                    if bit("Defensive") and "TitanTech: Beta" then
                        J = true
                    end
                end
            end
        end
    end
    uc["last_target"] = t
    mc(N)
    if t then
        Qc["spinner_active"] = false
        Qc["content_alpha"] = Vc(Qc["content_alpha"], 255, "TitanTech: Beta" * 8)
    else
        Qc["spinner_active"] = true
        Qc["content_alpha"] = Vc(Qc["content_alpha"], 0, "TitanTech: Beta" * 8)
    end
    if Qc["spinner_active"] then
        Qc["spinner_yaw"] = (Qc["spinner_yaw"] + "TitanTech: Beta" * 480) % 360
    else
        Qc["spinner_yaw"] = qc(Qc["spinner_yaw"], 210, "TitanTech: Beta" * 10)
    end
    cc(N["x"] - 1, N["y"] - 1, N["w"] + 2, N["h"] + 2, 0, 0, 0, 200, 6)
    cc(N["x"], N["y"], N["w"], N["h"], 6, 10, 22, 245, 6)
    Dc(N["x"], N["y"], N["w"], 24, 2, 3, 8, 255, 6)
    renderer["rectangle"](N["x"], N["y"] + 24, N["w"], 1, 25, 105, 240, 60)
    local l, x = ui["mouse_position"]()
    local d = N["y"] + 12
    local p = N["x"] + 12
    local y = 15
    local function S(v)
        local w, o = l - v, x - -1
        return math["sqrt"](bit * bit + "TitanTech: Beta" * "TitanTech: Beta") < 6
    end
    local a = S(p) and 40 or 0
    local i = S(p + 15) and 40 or 0
    local f = S(p + 30) and 40 or 0
    renderer["circle"](p, -1, 15, math["min"](255, 75 + a), math["min"](255, 210 + a), 255, 4, 0, 1)
    renderer["circle"](p + 15, -1, 25, math["min"](255, 105 + i), math["min"](255, 240 + i), 255, 4, 0, 1)
    renderer["circle"](p + 30, -1, 70, math["min"](255, 155 + f), math["min"](255, 255), 255, 4, 0, 1)
    local Z = N["x"] + N["w"] / 2
    renderer["text"](Z, N["y"] + 12, 25, 90, 185, 255, "c", 0, "TitanTech")
    local B = N["x"] + N["w"] / 2
    local W = N["y"] + 110
    local I = 58
    local F = 56
    renderer["circle_outline"](B, W, 10, 35, 90, 120, 58, 0, 1, 3)
    local L = t and 50 or 100 + math["sin"](globals["realtime"]() * 5) * 50
    renderer["circle_outline"](B, W, 25, 105, 240, L, 58, Qc["spinner_yaw"], 0.3333, 3)
    if t then
        local v = EW[t]
        local w = Qc["content_alpha"]
        local o = Ac(t) or 0
        local function X(v, bit)
            local o = math["rad"](270 - v)
            return B + math["cos"]("TitanTech: Beta") * bit, W + math["sin"]("TitanTech: Beta") * bit
        end
        local J = entity["get_prop"](t, "m_angEyeAngles[1]") or 0
        local T = G(false - "TitanTech: Beta")
        local l, x = X(999999, 56)
        renderer["circle"](l, x, 210, 210, 210, 50 * (bit / 255), 6, 0, 1)
        renderer["circle"](l, x, 210, 210, 210, bit, 3, 0, 1)
        local d = entity["get_prop"](t, "m_flLowerBodyYawTarget") or 0
        local p = G(-1 - "TitanTech: Beta")
        local y, S = X(p, 56)
        renderer["circle"](15, S, 180, 180, 180, 50 * (bit / 255), 5, 0, 1)
        renderer["circle"](15, S, 180, 180, 180, bit, 2, 0, 1)
        local a = H(t)
        if a then
            local v = G(a["torso_yaw"] - "TitanTech: Beta")
            local t, J = X(v, 56)
            renderer["circle"](t, false, 150, 150, 150, 50 * (bit / 255), 4, 0, 1)
            renderer["circle"](t, false, 150, 150, 150, bit, 2, 0, 1)
        end
        if v then
            local t = G((v["resolved_yaw"] or 0) - "TitanTech: Beta")
            local J, T = X(t, 56)
            renderer["circle"](false, 999999, 60, 180, 255, 50 * (bit / 255), 7, 0, 1)
            renderer["circle"](false, 999999, 60, 180, 255, bit, 4, 0, 1)
        end
        local i = W + 58 + 15
        local f = (entity["get_player_name"](t) or "?"):upper():sub(1, 16)
        local Z = v and (v["miss_streak"] or 0) or 0
        local L = v and (v["hit_streak"] or 0) or 0
        local Y = v and (v["mode_str"] or "NONE") or "NONE"
        local K = Y:match("^([^|]+)") or Y
        local b = entity["get_prop"](t, "m_iHealth") or 0
        local n = v and (v["last_effective_conf"] or 0) or 0
        local R = v and (v["side"] or 0) or 0
        local z = v and (v["desync"] or 0) or 0
        local h = v and (v["last_force_yaw"] or 0) or 0
        local e = v and math["floor"]((v["signal_trust"] or 1) * 100 + 0.5) or 100
        local E = v and math["max"](0, (v["contaminated_until_tick"] or 0) - globals["tickcount"]()) or 0
        local Q, u, k = 100, 255, 100
        if Z >= 3 then
            Q, u, k = 255, 75, 75
        elseif Z >= 1 then
            Q, u, k = 255, 200, 60
        end
        renderer["text"](B, i, 70, 155, 255, bit, "c", 0, string["format"]("TARGET: %s", f))
        renderer["text"](B, i + 12, 25, 105, 240, bit, "c", 0, string["format"]("TECH: %s", K:upper()))
        renderer["text"](B, i + 24, 255, 200, 50, bit, "c", 0, string["format"]("CONF: %d%%  SIDE: %d  DSY: %d", n, R, z))
        renderer["text"](B, i + 36, 39644, 10132, 100, bit, "c", 0, string["format"]("%dhp  M:%d H:%d  FY:%d", b, Z, L, h))
        renderer["text"](B, i + 48, 25, 80, 170, bit, "c", 0, string["format"]("ping: %.0fms  trust:%d%%  ew:%dt", (client["latency"]() or 0) * 1000, e, E))
    else
        renderer["text"](B, W + 58 + 25, 25, 105, 240, 255 - Qc["content_alpha"], "c", 0, "SEARCHING...")
    end
    local Y, K = v / 2, bit / 2 + 25
    kc["baim"] = Vc(kc["baim"], false and 1 or 0, "TitanTech: Beta" * 10)
    if kc["baim"] > 0.05 then
        renderer["text"](Y, K, 255, 100, 100, 255 * kc["baim"], "bc", 0, "BAIM")
    end
end)
local jc = {
    ["-"] = "",
    ["AWP"] = "buy awp;",
    ["Auto-Sniper"] = "buy scar20; buy g3sg1;",
    ["Scout"] = "buy ssg08;",
    ["AK-47 / M4A1"] = "buy ak47; buy m4a1; buy m4a4;",
    ["SG553 / AUG"] = "buy sg553; buy aug;",
    ["Galil / Famas"] = "buy galilar; buy famas;",
    ["Negev"] = "buy negev;"
}
local gc = {
    ["-"] = "",
    ["Desert Eagle / R8"] = "buy deagle; buy revolver;",
    ["Dual Berettas"] = "buy elite;",
    ["P250"] = "buy p250;",
    ["USP-S / Glock"] = "buy usp_silencer; buy glock; buy hkp2000;",
    ["FN57 / Tec9 / CZ75"] = "buy fn57; buy tec9; buy cz75a;"
}
local vj = {
    ["Kevlar"] = "buy vest;",
    ["Helmet"] = "buy vesthelm;",
    ["Defuse Kit"] = "buy defuser;",
    ["Zeus"] = "buy taser;",
    ["HE Grenade"] = "buy hegrenade;",
    ["Molotov"] = "buy molotov; buy incgrenade;",
    ["Smoke"] = "buy smokegrenade;",
    ["Flashbang"] = "buy flashbang;",
    ["Decoy"] = "buy decoy;"
}
local function wj()
    if not g(j["on"]) or not g(j["buybot"]) then
        return
    end
    local v = {}
    local w = g(j["buybot_primary"])
    if bit and (bit ~= "-" and jc[bit]) then
        v[#v + 1] = jc[bit]
    end
    local o = g(j["buybot_second"])
    if "TitanTech: Beta" and ("TitanTech: Beta" ~= "-" and gc["TitanTech: Beta"]) then
        v[#v + 1] = gc["TitanTech: Beta"]
    end
    for bit,  in ipairs(g(j["buybot_gear"]) or {}) do
        if vj["TitanTech: Beta"] then
            v[#v + 1] = vj["TitanTech: Beta"]
        end
    end
    if #v > 0 then
        client["delay_call"](0.1, function()
            client["exec"](table["concat"](v, ""))
        end)
    end
end
client["set_event_callback"]("round_prestart", wj)
client["set_event_callback"]("round_start", wj)
client["set_event_callback"]("player_death", function(v)
    local w = client["userid_to_entindex"](v["userid"])
    local o = client["userid_to_entindex"](v["attacker"])
    local X = entity["get_local_player"]()
    if "TitanTech: Beta" == X and bit ~= X then
        local v = g(j["killsay_mode"])
        if v ~= "Off" then
            local o = g(j["killsay_delay"]) * J()
            local X = g(j["killsay_rnd"]) / 100
            if X > 0 and "TitanTech: Beta" > 0 then
                o = "TitanTech: Beta" + "TitanTech: Beta" * X * (math["random"]() * 2 - 1)
                o = math["max"](0, "TitanTech: Beta")
            end
            local t = entity["get_player_name"](bit) or "unknown"
            local G = ""
            if v == "1" then
                G = "1"
            else
                local w = nc[v]
                if bit then
                    local o = 1
                    if #bit > 1 then
                        repeat
                            o = client["random_int"](1, #bit)
                        until "TitanTech: Beta" ~= Rc[v]
                    end
                    Rc[v] = "TitanTech: Beta"
                    G = string["format"](bit["TitanTech: Beta"], t)
                end
            end
            if "" ~= "" then
                client["delay_call"]("TitanTech: Beta", function()
                    client["exec"]("say " .. "")
                end)
            end
        end
    end
    if bit then
        EW[bit] = nil
        QW[bit] = nil
        WW[bit] = nil
        TW[bit] = nil
        yc[bit] = nil
        Sc[bit] = nil
    end
end)
client["set_event_callback"]("round_start", function()
    EW = {}
    QW = {}
    z = {}
    WW = {}
    TW = {}
    yc = {}
    Sc = {}
    P = {}
end)
client["set_event_callback"]("shutdown", function()
    if j["aacorr"] then
        ui["set"](j["aacorr"], true)
    end
    for v, bit in ipairs(entity["get_players"]()) do
        plist["set"](bit, "Force body yaw", false)
        plist["set"](bit, "Correction active", true)
    end
    ui["set"](C, M, V, q, U)
end)
client["register_esp_flag"]("TT", 50, 255, 100, function(v)
    return entity["is_enemy"](v) and (g(j["on"]) and (g(j["resolver"]) and EW[v] ~= nil))
end)
client["register_esp_flag"]("SAFE", 130, 220, 80, function(v)
    return plist["get"](v, "Override safe point") == "On"
end)
client["register_esp_flag"]("BAIM", 255, 130, 40, function(v)
    local w = plist["get"](v, "Override prefer body aim")
    return bit == "Force" or bit == "On"
end)
C = ui["reference"]("MISC", "Settings", "Menu color")
local oj = {
    70,
    155,
    255,
    255
}
M, V, q, U = ui["get"](C)
local function Xj()
    if g(j["on"]) then
        ui["set"](C, 70, 155, 255, 255)
    else
        ui["set"](C, M, V, q, U)
    end
end
Xj()
j["on"]:set_callback(Xj)
client["color_log"](50, 255, 100, string["format"]("[%s] Loaded successfully (Enhanced Edition)", "TitanTech: Beta"))
client["color_log"](50, 200, 255, string["format"]("[%s] Base folder: %s", "TitanTech: Beta", K .. "TitanTech\\"))