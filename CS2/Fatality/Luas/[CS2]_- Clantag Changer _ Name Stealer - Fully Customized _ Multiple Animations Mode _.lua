--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

if not ffi or not ws.test_capability("ffi") then
        game.engine:client_cmd("showconsole")
        gui.notify:add(gui.notification("[ Clantag Changer ] Error !", "Error: make sure \"allow insecure is open\""))
        assert(ffi, "Clantag: ffi is invalid, please open \"allow insecure\"")
end

ffi.cdef("    typedef struct { } IMemAlloc;\n    typedef struct { } INetChannel;\n    typedef struct { } CEngineClient;\n    typedef struct {\n        void* pVftable;\n        uint32_t nUses;\n        uint32_t nWeaks;\n    } RefCountBase;\n\n    typedef struct {\n        void* pPtr;\n        RefCountBase* pRefCount;\n    } StandardSharedPtr;\n\n    typedef struct {\n        union {\n            char* pPtr;\n            char arrBuf[0x10];\n        };\n\n        uint64_t nSize;\n        uint64_t nCapacity;\n    } StandardString;\n\n    typedef struct {\n        StandardSharedPtr pAvatar;\n        StandardString szUserName;\n    } CUserContext;\n    \n    typedef struct {\n        uint16_t nYears;\n        uint16_t nMonths;\n        uint16_t nDayOfWeek;\n        uint16_t nDays;\n        uint16_t nHours;\n        uint16_t nMinutes;\n        uint16_t nSeconds;\n        uint16_t nMilliseconds;\n    } SystemTime;\n\n    typedef struct {\n        void* pBaseVtable;\n        char pad_0x8[0x28];\n        void* pVtable;\n        uint64_t nHasBits;\n        uint64_t nCachedSize;\n        void* pConvars;\n    } CNetMsgSetConvar;\n")

slot_0_0_0 = 65001
slot_0_1_0 = 13
slot_0_2_0 = false
slot_0_3_0 = false
slot_0_4_0 = {}
slot_0_5_0 = false
slot_0_6_0 = ""
slot_0_7_0 = ""
slot_0_8_0 = {}
slot_0_9_0 = 0
slot_0_10_0 = 0
slot_0_11_0 = ""
slot_0_12_0 = false
slot_0_13_0 = false
slot_0_14_0 = 0
slot_0_15_0 = ""
slot_0_16_0 = false
slot_0_17_0 = 0
slot_0_18_0 = 0
slot_0_19_0 = 0
slot_0_20_0 = false
slot_0_21_0 = {}
slot_0_22_0 = ffi.cast("void*", 0)
slot_0_23_0 = false
slot_0_24_0 = false
slot_0_25_0 = 0
slot_0_26_0 = 0
slot_0_27_0 = ""
slot_0_28_0 = 0
slot_0_29_0 = ""
slot_0_30_0 = gui.ctx.user.username
slot_0_31_0 = ffi.cast("void*", -1)
slot_0_32_0 = {
        "None",
        "Enemies",
        "Teammates"
}
slot_0_33_0 = {
        "Clantag",
        "Name Stealer"
}
slot_0_34_0 = "clantag + name_stealer.txt"
slot_0_35_0 = {
        "Normally",
        "Sequence"
}
slot_0_36_0 = "custom clantag anim sequence.json"
slot_0_37_0 = {
        "Manually",
        "Automatic",
        "Customize Name"
}
slot_0_38_0 = {
        "Customize",
        "From Clipboard Import",
        "From Local Json Array",
        "Preset - Time [X:X:X]",
        "Preset - Star [...*]",
        "Preset - Flower"
}
slot_0_39_0 = {
        "Static",
        "Rotation - L -> R",
        "Rotation - R -> L",
        "Progressive",
        "Retractable",
        "Retractable - Front",
        "Scroll Progressive",
        "Per Time Percent"
}
slot_0_40_0 = {
        "a",
        "b",
        "c",
        "d",
        "e",
        "f",
        "g",
        "h",
        "i",
        "j",
        "k",
        "l",
        "m",
        "n",
        "o",
        "p",
        "q",
        "r",
        "s",
        "t",
        "u",
        "v",
        "w",
        "x",
        "y",
        "z",
        "A",
        "B",
        "C",
        "D",
        "E",
        "F",
        "G",
        "H",
        "I",
        "J",
        "K",
        "L",
        "M",
        "N",
        "O",
        "P",
        "Q",
        "R",
        "S",
        "T",
        "U",
        "V",
        "W",
        "X",
        "Y",
        "Z"
}
slot_0_41_0 = {
        "𝓪",
        "𝓫",
        "𝓬",
        "𝓭",
        "𝓮",
        "𝓯",
        "𝓰",
        "𝓱",
        "𝓲",
        "𝓳",
        "𝓴",
        "𝓵",
        "𝓶",
        "𝓷",
        "𝓸",
        "𝓹",
        "𝓺",
        "𝓻",
        "𝓼",
        "𝓽",
        "𝓾",
        "𝓿",
        "𝔀",
        "𝔁",
        "𝔂",
        "𝔃",
        "𝓐",
        "𝓑",
        "𝓒",
        "𝓓",
        "𝓔",
        "𝓕",
        "𝓖",
        "𝓗",
        "𝓘",
        "𝓙",
        "𝓚",
        "𝓛",
        "𝓜",
        "𝓝",
        "𝓞",
        "𝓟",
        "𝓠",
        "𝓡",
        "𝓢",
        "𝓣",
        "𝓤",
        "𝓥",
        "𝓦",
        "𝓧",
        "𝓨",
        "𝓩"
}
slot_0_42_0 = {
        BUF_VOICE = 2,
        BUF_UNRELIABLE = 0,
        BUF_DEFAULT = -1,
        BUF_RELIABLE = 1
}
slot_0_43_0 = gui.ctx:find("lua>elements a")
slot_0_44_0 = gui.label(gui.control_id("MAIN - SPACE LINE"), "")
slot_0_45_0 = gui.checkbox(gui.control_id("CLAN: ENABLED"))
slot_0_46_0 = gui.combo_box(gui.control_id("CLAN: SETTING"))
slot_0_47_0 = gui.text_input(gui.control_id("CLAN: TEXT"))
slot_0_48_0 = gui.button(gui.control_id("CLAN: IMPORT"), "Import")
slot_0_49_0 = gui.button(gui.control_id("CLAN: EDIT"), "Edit")
slot_0_50_0 = gui.combo_box(gui.control_id("CLAN: SEQUENCE MODE"))
slot_0_51_0 = gui.checkbox(gui.control_id("CLAN: LOCALTION TIME PREFIX"))
slot_0_52_0 = gui.combo_box(gui.control_id("CLAN: STYLE"))
slot_0_53_0 = gui.slider(gui.control_id("CLAN REFRESH TIME"), 0.1, 5, {
        "%.2f /s"
}, 0.01)
slot_0_54_0 = gui.checkbox(gui.control_id("CLAN: COPPERPLATED"))
slot_0_55_0 = gui.label(gui.control_id("CLAN - SPACE LINE"), "")
slot_0_56_0 = gui.checkbox(gui.control_id("NAME STEALER: ENABLED"))
slot_0_57_0 = gui.combo_box(gui.control_id("NAME STEALER: STYLE"))
slot_0_58_0 = gui.button(gui.control_id("NAME STEALER: SWITCH"), "> [ Stealer ] <")
slot_0_59_0 = gui.slider(gui.control_id("NAME STEALER REFRESH TIME"), 0.1, 10, {
        "%.2f /s"
}, 0.01)
slot_0_60_0 = gui.checkbox(gui.control_id("NAME STEALER: IGNORE BOT"))
slot_0_61_0 = gui.combo_box(gui.control_id("NAME STEALER: IGNORE TEAMS"))
slot_0_62_0 = gui.checkbox(gui.control_id("NAME STEALER: APPEND SPACE"))
slot_0_63_0 = gui.text_input(gui.control_id("NAME STEALER: CUSTOMIZE"))
slot_0_64_0 = gui.label(gui.control_id("NAME - SPACE LINE"), "")
slot_0_65_0 = gui.combo_box(gui.control_id("PREVIEW: OPTIONS"))
slot_0_65_0.allow_multiple = true
slot_0_60_0.tooltip = "avoid steal the bot player's name"
slot_0_57_0.tooltip = "name stealer mode, you can choose you wanted mode"
slot_0_65_0.tooltip = "preview options ( preview in fatality's menu username )"
slot_0_61_0.tooltip = "choose what team's players you want avoid steal name"
slot_0_51_0.tooltip = "add the \"TIME\" text prefix before your time clantag"
slot_0_58_0.tooltip = "click this button to random steal the next player's name"
slot_0_49_0.tooltip = "click to edit clantag json array sequence animation contents"
slot_0_52_0.tooltip = "clantag scroll style, if you turn on the time clantag is will be static and not scroll"
slot_0_46_0.tooltip = "clantag the text from setting ( clipboard supported more character, not just english )"
slot_0_59_0.tooltip = "steal the next random player's name delta time, i recommend dont use too low value !"
slot_0_62_0.tooltip = "apply the space with your name's end and avoid the game add like [x] with your name end"
slot_0_50_0.tooltip = "sequence refresh time mode, Normally = delta time refresh, Sequence = time % count sequence refresh"
slot_0_48_0.tooltip = "import text from clipboard and apply your clantag, this can be use all characters and it will be auto save to local"
slot_0_54_0.tooltip = "replace clantag letters (a - Z) to copperplate text, WARNING !: game only support <= 5 copperplated text visible"
slot_0_53_0.tooltip = "clantag scroll reset delta time, you can custom it make your clantag scroll speed, i recommend dont use too low value !"
slot_0_47_0.tooltip = "clantag text, you can use command like: \"\\n\" make your clantag switch line or use like \"\\x43\\x44\\x45\" the hexdecimal command, and custom name will show in other players's esp"
slot_0_63_0.tooltip = "customize your player name, and will be visibility in other player's esp, also you can use like \"\\n\" or \"\\x34\\x44\" the hexdecimal.. etc, more command make you name dynamic"

for iter_0_0, iter_0_1 in pairs(slot_0_38_0) do
        slot_0_46_0:add(gui.selectable(gui.control_id(("CLAN - %s"):format(iter_0_1)), iter_0_1))
end

for iter_0_2, iter_0_3 in pairs(slot_0_39_0) do
        slot_0_52_0:add(gui.selectable(gui.control_id(("CLAN STYLE - %s"):format(iter_0_3)), iter_0_3))
end

for iter_0_4, iter_0_5 in pairs(slot_0_35_0) do
        slot_0_50_0:add(gui.selectable(gui.control_id(("SEQUENCE - %s"):format(iter_0_5)), iter_0_5))
end

for iter_0_6, iter_0_7 in pairs(slot_0_37_0) do
        slot_0_57_0:add(gui.selectable(gui.control_id(("NAME STEALER - %s"):format(iter_0_7)), iter_0_7))
end

for iter_0_8, iter_0_9 in pairs(slot_0_33_0) do
        slot_0_65_0:add(gui.selectable(gui.control_id(("PREVIEW OPTION - %s"):format(iter_0_9)), iter_0_9))
end

for iter_0_10, iter_0_11 in pairs(slot_0_32_0) do
        slot_0_61_0:add(gui.selectable(gui.control_id(("SKIP TEAM FOR - %s"):format(iter_0_11)), iter_0_11))
end

slot_0_66_0 = gui.make_control("[ Clantag ] From / Preset", slot_0_46_0)
slot_0_67_0 = gui.make_control("[ Clantag ] Text", slot_0_47_0)
slot_0_68_0 = gui.make_control("[ Clantag ] Clipboard", slot_0_48_0)
slot_0_69_0 = gui.make_control("[ Clantag ] Sequence", slot_0_50_0)
slot_0_70_0 = gui.make_control("[ Clantag ] Json Array", slot_0_49_0)
slot_0_71_0 = gui.make_control("[ Clantag ] Time Clantag Prefix", slot_0_51_0)
slot_0_72_0 = gui.make_control("[ Clantag ] Style", slot_0_52_0)
slot_0_73_0 = gui.make_control("[ Clantag ] Refresh", slot_0_53_0)
slot_0_74_0 = gui.make_control("[ Clantag ] Copperplated Letter Text", slot_0_54_0)
slot_0_75_0 = gui.make_control("[ Name Stealer ] Style", slot_0_57_0)
slot_0_76_0 = gui.make_control("[ Name Stealer ] Refresh", slot_0_59_0)
slot_0_77_0 = gui.make_control("[ Name Stealer ] Ignore Steal Bot", slot_0_60_0)
slot_0_78_0 = gui.make_control("[ Name Stealer ] Ignore", slot_0_61_0)
slot_0_79_0 = gui.make_control("[ Name ] Custom", slot_0_63_0)
slot_0_80_0 = gui.make_control("[ Name Stealer ] Append Space", slot_0_62_0)
slot_0_81_0 = gui.make_control("[ Name Stealer ] Manually", slot_0_58_0)
slot_0_82_0 = gui.make_control("[ Preview ] Options", slot_0_65_0)

if slot_0_47_0.value == "" then
        slot_0_47_0:set_value("fatality.win")
        slot_0_47_0:reset()
end

if slot_0_53_0:get_value():get() <= 0 then
        slot_0_53_0:get_value():set(0.5)
        slot_0_53_0:reset()
end

if slot_0_63_0.value == "" then
        slot_0_63_0:set_value("no name")
        slot_0_63_0:reset()
end

if slot_0_59_0:get_value():get() <= 0 then
        slot_0_59_0:get_value():set(1)
        slot_0_59_0:reset()
end

slot_0_43_0:add(gui.make_control("-----------------  [ Clantag ]  ------------------", slot_0_44_0))
slot_0_43_0:add(gui.make_control("[ Clantag ] Enabled", slot_0_45_0))
slot_0_43_0:add(slot_0_66_0)
slot_0_43_0:add(slot_0_67_0)
slot_0_43_0:add(slot_0_68_0)
slot_0_43_0:add(slot_0_70_0)
slot_0_43_0:add(slot_0_69_0)
slot_0_43_0:add(slot_0_71_0)
slot_0_43_0:add(slot_0_72_0)
slot_0_43_0:add(slot_0_73_0)
slot_0_43_0:add(slot_0_74_0)
slot_0_43_0:add(gui.make_control("--------------  [ Name Stealer ]  --------------", slot_0_55_0))
slot_0_43_0:add(gui.make_control("[ Name Stealer ] Enabled", slot_0_56_0))
slot_0_43_0:add(slot_0_75_0)
slot_0_43_0:add(slot_0_76_0)
slot_0_43_0:add(slot_0_79_0)
slot_0_43_0:add(slot_0_80_0)
slot_0_43_0:add(slot_0_77_0)
slot_0_43_0:add(slot_0_78_0)
slot_0_43_0:add(slot_0_81_0)
slot_0_43_0:add(gui.make_control("-----------------  [ Options ]  ------------------", slot_0_64_0))
slot_0_43_0:add(slot_0_82_0)
slot_0_43_0:reset()

function slot_0_83_0()
        slot_0_20_0 = true
end

function slot_0_84_0(arg_2_0)
        table.insert(slot_0_8_0, arg_2_0)
end

function slot_0_85_0()
        slot_0_66_0:set_visible(slot_0_45_0:get_value():get())
        slot_0_75_0:set_visible(slot_0_56_0:get_value():get())
        slot_0_67_0:set_visible(slot_0_45_0:get_value():get() and slot_0_46_0:get_value():get():get_raw() == 1)
        slot_0_72_0:set_visible(slot_0_45_0:get_value():get() and slot_0_46_0:get_value():get():get_raw() <= 2)
        slot_0_68_0:set_visible(slot_0_45_0:get_value():get() and slot_0_46_0:get_value():get():get_raw() == 2)
        slot_0_74_0:set_visible(slot_0_45_0:get_value():get() and slot_0_46_0:get_value():get():get_raw() == 1)
        slot_0_69_0:set_visible(slot_0_45_0:get_value():get() and slot_0_46_0:get_value():get():get_raw() == 4)
        slot_0_70_0:set_visible(slot_0_45_0:get_value():get() and slot_0_46_0:get_value():get():get_raw() == 4)
        slot_0_77_0:set_visible(slot_0_56_0:get_value():get() and slot_0_57_0:get_value():get():get_raw() <= 2)
        slot_0_78_0:set_visible(slot_0_56_0:get_value():get() and slot_0_57_0:get_value():get():get_raw() <= 2)
        slot_0_76_0:set_visible(slot_0_56_0:get_value():get() and slot_0_57_0:get_value():get():get_raw() == 2)
        slot_0_80_0:set_visible(slot_0_56_0:get_value():get() and slot_0_57_0:get_value():get():get_raw() == 2)
        slot_0_79_0:set_visible(slot_0_56_0:get_value():get() and slot_0_57_0:get_value():get():get_raw() > 2)
        slot_0_81_0:set_visible(slot_0_56_0:get_value():get() and slot_0_57_0:get_value():get():get_raw() == 1)
        slot_0_71_0:set_visible(slot_0_45_0:get_value():get() and bit.band(slot_0_46_0:get_value():get():get_raw(), bit.lshift(1, 3)) > 0)
        slot_0_73_0:set_visible(slot_0_45_0:get_value():get() and slot_0_46_0:get_value():get():get_raw() <= 4 and slot_0_52_0:get_value():get():get_raw() ~= 1)

        if slot_0_53_0:get_value():get() <= 0 then
                slot_0_53_0:get_value():set(0.5)
                slot_0_53_0:reset()
        end

        if slot_0_59_0:get_value():get() <= 0 then
                slot_0_59_0:get_value():set(1)
                slot_0_59_0:reset()
        end
end

function slot_0_86_0(arg_4_0)
        return function(arg_5_0, ...)
                return arg_4_0(arg_5_0, ...)
        end
end

function slot_0_87_0(arg_6_0, arg_6_1)
        for iter_6_0 = 0, arg_6_0 - 1 do
                if bit.lshift(1, iter_6_0) == arg_6_1 then
                        return iter_6_0 + 1
                end
        end

        return 0
end

function slot_0_88_0(arg_7_0, arg_7_1, arg_7_2)
        local var_7_0 = ffi.cast("void*", utils.find_export(arg_7_0, "CreateInterface"))

        assert(var_7_0 ~= slot_0_22_0, ("[Clantag] error: interface of module %s not found"):format(arg_7_0))

        local var_7_1 = ffi.cast("void*(__cdecl*)(const char*, void*)", var_7_0)(arg_7_1, nil)

        assert(var_7_1 ~= slot_0_22_0, ("[Clantag] error: interface of module %s not found"):format(arg_7_0))

        return ffi.cast(arg_7_2 or "void*", var_7_1)
end

function slot_0_89_0(arg_8_0, arg_8_1, arg_8_2)
        local var_8_0 = ffi.cast("void*", utils.find_pattern(arg_8_0, arg_8_1))

        if var_8_0 == slot_0_22_0 or var_8_0 == ffi.NULL then
                gui.notify:add(gui.notification("[ Clantag Changer ] Error !", "script outdated, please wait dev update !"))
                assert(false, "[Clantag] error: outdated pattern, please wait dev update.")

                return nil
        end

        return ffi.cast(arg_8_2 or "void*", var_8_0)
end

function slot_0_90_0(arg_9_0, arg_9_1, arg_9_2, arg_9_3)
        if arg_9_0 == slot_0_22_0 then
                gui.notify:add(gui.notification("[ Clantag Changer ] Error !", "script outdated, please wait dev update !"))
        end

        assert(arg_9_0 ~= slot_0_22_0, "error: clantag script outdated, please wait developer update.")

        arg_9_0 = ffi.cast("uintptr_t", arg_9_0)
        arg_9_0 = arg_9_0 + (arg_9_1 or 1)
        arg_9_0 = arg_9_0 + ffi.sizeof("int") + ffi.cast("int64_t", ffi.cast("int*", arg_9_0)[0])
        arg_9_0 = arg_9_0 + (arg_9_2 or 0)

        if arg_9_3 then
                return ffi.cast(arg_9_3, arg_9_0)
        end

        return arg_9_0
end

function slot_0_91_0(arg_10_0, arg_10_1, arg_10_2)
        local var_10_0 = utils.find_export(arg_10_0:lower(), arg_10_1)

        if not var_10_0 or var_10_0 == slot_0_22_0 then
                assert(false, ("[Clantag] error: %s -> %s not found"):format(arg_10_0, arg_10_1))

                return false
        end

        return ffi.cast(arg_10_2 or "void*", var_10_0)
end

function slot_0_92_0(arg_11_0, arg_11_1, arg_11_2, ...)
        local var_11_0 = slot_0_91_0(arg_11_0, arg_11_1, arg_11_2)

        if not var_11_0 then
                return nil
        end

        return var_11_0(...)
end

function slot_0_93_0(arg_12_0, arg_12_1, arg_12_2, ...)
        if arg_12_0 == slot_0_22_0 then
                return nil
        end

        local var_12_0 = ffi.cast("void***", arg_12_0)[0][arg_12_1]
        local var_12_1 = ("VFuncOf: %02X"):format(ffi.cast("uintptr_t", var_12_0))

        if not slot_0_4_0[var_12_1] then
                slot_0_4_0[var_12_1] = ffi.cast(arg_12_2, var_12_0)
        end

        return slot_0_4_0[var_12_1](arg_12_0, ...)
end

function slot_0_94_0(arg_13_0, arg_13_1)
        return function(arg_14_0, ...)
                return slot_0_93_0(arg_14_0, arg_13_0, arg_13_1, ...)
        end
end

slot_0_95_0 = slot_0_90_0(assert(slot_0_89_0("engine2.dll", "E8 ? ? ? ? 48 8D 4D A7 E8 ? ? ? ? 48 8B 9C 24"), "error: clantag script outdated, plase wait update"), 1, 0, "void(__fastcall*)(CNetMsgSetConvar*)")
slot_0_96_0 = assert(slot_0_89_0("engine2.dll", "48 89 5C 24 ? 48 89 6C 24 ? 48 89 74 24 ? 57 41 56 41 57 48 83 EC ? 83 49", "void(__fastcall*)(CNetMsgSetConvar*, const char*, const char*)"), "error: clantag script outdated, plase wait update")

function __shutdown()
        for iter_15_0, iter_15_1 in pairs(slot_0_8_0) do
                xpcall(iter_15_1, print)
        end
end

ffi.metatype("IMemAlloc", {
        __index = {
                Free = slot_0_94_0(3, "void(__thiscall*)(void*, void*)")
        }
})
ffi.metatype("INetChannel", {
        __index = {
                SendNetMessage = slot_0_94_0(39, "void(__thiscall*)(void*, void*, int)")
        }
})
ffi.metatype("CEngineClient", {
        __index = {
                GetNetChannel = slot_0_94_0(40, "INetChannel*(__thiscall*)(void*, int)")
        }
})
ffi.metatype("CNetMsgSetConvar", {
        __index = {
                SetConvarValue = slot_0_86_0(slot_0_96_0),
                Deallocate = slot_0_86_0(slot_0_95_0),
                Invoke = function(arg_16_0, arg_16_1, arg_16_2)
                        arg_16_1:SendNetMessage(arg_16_0, arg_16_2 or slot_0_42_0.BUF_RELIABLE)
                end
        }
})
ffi.metatype("CUserContext", {
        __index = {
                SetUserName = function(arg_17_0, arg_17_1)
                        arg_17_0.szUserName:set(arg_17_1)
                end,
                SetUserAvatar = function(arg_18_0, arg_18_1)
                        arg_18_0.pAvatar:set(ffi.cast("void**", arg_18_1)[0])
                end
        }
})
ffi.metatype("StandardSharedPtr", {
        __index = {
                get = function(arg_19_0)
                        return arg_19_0.pPtr
                end,
                set = function(arg_20_0, arg_20_1)
                        arg_20_0.pPtr = arg_20_1
                end,
                incremental = function(arg_21_0)
                        if arg_21_0.pRefCount == slot_0_22_0 then
                                return
                        end

                        arg_21_0.pRefCount.nUses = arg_21_0.pRefCount.nUses + 1
                end,
                decremental = function(arg_22_0)
                        if arg_22_0.pRefCount == slot_0_22_0 then
                                return
                        end

                        arg_22_0.pRefCount.nUses = arg_22_0.pRefCount.nUses - 1
                end
        }
})
ffi.metatype("StandardString", {
        __index = {
                size = function(arg_23_0)
                        return arg_23_0.nSize
                end,
                empty = function(arg_24_0)
                        return arg_24_0.nSize == 0
                end,
                capacity = function(arg_25_0)
                        return arg_25_0.nCapacity
                end,
                large_mode_engaged = function(arg_26_0)
                        return arg_26_0:capacity() > 15
                end,
                data = function(arg_27_0)
                        return arg_27_0:large_mode_engaged() and arg_27_0.pPtr or arg_27_0.arrBuf
                end,
                string = function(arg_28_0)
                        if arg_28_0:empty() then
                                return ""
                        end

                        return ffi.string(arg_28_0:data(), arg_28_0:size())
                end,
                set = function(arg_29_0, arg_29_1)
                        local var_29_0 = arg_29_1:len()
                        local var_29_1 = ffi.cast("const char*", arg_29_1)

                        if var_29_0 <= 15 then
                                arg_29_0.nSize = var_29_0

                                local var_29_2 = arg_29_0:data()

                                ffi.copy(var_29_2, var_29_1, var_29_0)

                                var_29_2[15] = 0

                                return
                        end

                        local var_29_3 = arg_29_0:capacity()

                        if var_29_3 < var_29_0 then
                                local var_29_4 = var_29_0 * 2
                                local var_29_5 = slot_0_92_0("msvcrt.dll", "malloc", "void*(__cdecl*)(uint64_t)", var_29_4)

                                if var_29_5 == slot_0_22_0 then
                                        return
                                end

                                if arg_29_0.pPtr ~= slot_0_22_0 and arg_29_0:large_mode_engaged() then
                                        slot_0_92_0("msvcrt.dll", "free", "void(__cdecl*)(void*)", arg_29_0.pPtr)
                                end

                                slot_0_92_0("msvcrt.dll", "memset", "void*(__cdecl*)(void*, int, uint64_t)", var_29_5, 0, var_29_4)
                                ffi.copy(var_29_5, var_29_1, var_29_0)

                                arg_29_0.nCapacity = var_29_4
                                arg_29_0.nSize = var_29_0
                                arg_29_0.pPtr = var_29_5
                        else
                                arg_29_0.nSize = var_29_0

                                slot_0_92_0("msvcrt.dll", "memset", "void*(__cdecl*)(void*, int, uint64_t)", arg_29_0.pPtr, 0, var_29_3)
                                ffi.copy(arg_29_0.pPtr, var_29_1, var_29_0)

                                arg_29_0.pPtr[var_29_3 + 1] = 0
                        end
                end
        }
})

slot_0_97_0 = ffi.cast("CUserContext**", gui.ctx.user)[0]
slot_0_98_0 = slot_0_91_0("tier0.dll", "g_pMemAlloc", "IMemAlloc**")[0]
slot_0_99_0 = slot_0_88_0("engine2.dll", "Source2EngineToClient001", "CEngineClient*")
slot_0_100_0 = slot_0_89_0("engine2.dll", "40 53 48 83 EC 20 48 8B 05 ? ? 40 ? BA 50 ? ? ? 33 DB 48 8B 08 48 8B 01 FF 50 08 48 85 C0 74 55 66 89 58 15 33 C9", "CNetMsgSetConvar*(__fastcall*)()")

function slot_0_101_0()
        game.engine:client_cmd("play sounds/ui/weapon_cant_buy.vsnd")
end

function slot_0_102_0()
        local var_31_0 = ffi.new("char[260]")

        slot_0_92_0("Kernel32.dll", "GetCurrentDirectoryA", "int(__stdcall*)(uint32_t, char*)", ffi.sizeof(var_31_0), var_31_0)

        local var_31_1 = ffi.string(var_31_0)

        return var_31_1:sub(0, var_31_1:len() - 10)
end

function slot_0_103_0()
        local var_32_0 = ffi.new("SystemTime")

        slot_0_92_0("Kernel32.dll", "GetLocalTime", "void(__stdcall*)(SystemTime*)", var_32_0)

        return var_32_0
end

function slot_0_104_0(arg_33_0)
        local var_33_0 = 0
        local var_33_1 = ffi.cast("const wchar_t*", arg_33_0)

        while var_33_1[var_33_0] ~= 0 do
                var_33_0 = var_33_0 + 1
        end

        return var_33_0
end

function slot_0_105_0(arg_34_0)
        local var_34_0 = slot_0_104_0(arg_34_0)
        local var_34_1 = slot_0_92_0("Kernel32.dll", "WideCharToMultiByte", "int(__stdcall*)(uint32_t, uint32_t, const wchar_t*, int, char*, int, const char*, bool*)", slot_0_0_0, 0, arg_34_0, var_34_0, nil, 0, nil, nil)
        local var_34_2 = ffi.new("char[?]", var_34_1 + 1)

        slot_0_92_0("Kernel32.dll", "WideCharToMultiByte", "int(__stdcall*)(uint32_t, uint32_t, const wchar_t*, int, char*, int, const char*, bool*)", slot_0_0_0, 0, arg_34_0, var_34_0, var_34_2, var_34_1, nil, nil)

        return var_34_2, var_34_1
end

function slot_0_106_0(arg_35_0)
        if arg_35_0:len() < 4 then
                return arg_35_0
        end

        local var_35_0 = arg_35_0:lower()
        local var_35_1 = var_35_0:find(".lua")

        if var_35_0:find(".lua") then
                arg_35_0 = ("%s%s"):format(arg_35_0:sub(0, var_35_1 - 1), arg_35_0:sub(var_35_1 + 4, arg_35_0:len()))
        end

        return arg_35_0
end

function slot_0_107_0(arg_36_0)
        for iter_36_0, iter_36_1 in pairs(slot_0_40_0) do
                local var_36_0 = slot_0_41_0[iter_36_0]

                if var_36_0 then
                        arg_36_0 = arg_36_0:gsub(iter_36_1, var_36_0)
                end
        end

        return arg_36_0
end

function slot_0_108_0(arg_37_0)
        if not arg_37_0 or type(arg_37_0) ~= "string" then
                return ""
        end

        local var_37_0 = ""

        for iter_37_0 = 1, arg_37_0:len() do
                local var_37_1 = arg_37_0:sub(iter_37_0, iter_37_0):byte()

                if var_37_1 < 32 or var_37_1 > 126 then
                        -- block empty
                else
                        local var_37_2 = string.char(var_37_1)

                        if not var_37_2 then
                                -- block empty
                        else
                                var_37_0 = ("%s%s"):format(var_37_0, var_37_2)
                        end
                end
        end

        return var_37_0
end

function slot_0_109_0(arg_38_0)
        for iter_38_0 = 1, arg_38_0:len() do
                local var_38_0 = arg_38_0:sub(iter_38_0, iter_38_0):byte()

                if var_38_0 < 32 or var_38_0 > 126 then
                        return false
                end
        end

        return true
end

function slot_0_110_0(arg_39_0, arg_39_1)
        if type(arg_39_1) ~= "string" or arg_39_1:len() <= 0 or arg_39_1:len() > 255 then
                return
        end

        local var_39_0 = utils.string_to_array(arg_39_1)

        if not var_39_0 or #var_39_0 <= 0 then
                return
        end

        utils.file_write(arg_39_0, var_39_0)
end

function slot_0_111_0(arg_40_0)
        if not utils.file_exists(arg_40_0) then
                return false
        end

        local var_40_0 = utils.file_read(arg_40_0)

        if not var_40_0 or #var_40_0 <= 0 then
                return false
        end

        return utils.array_to_string(var_40_0)
end

function slot_0_112_0(arg_41_0)
        if not utils.file_exists(arg_41_0) then
                local var_41_0 = utils.json_encode({
                        "f",
                        "fa",
                        "fat",
                        "fata",
                        "fatal",
                        "fatali",
                        "fatalit",
                        "fatality",
                        "fatality.",
                        "fatality.w",
                        "fatality.wi",
                        "fatality.win"
                })

                utils.file_write(arg_41_0, utils.string_to_array(var_41_0))

                return var_41_0
        end

        local var_41_1 = utils.file_read(arg_41_0)

        if not var_41_1 or #var_41_1 <= 0 then
                return false
        end

        return utils.array_to_string(var_41_1)
end

function slot_0_113_0(arg_42_0, arg_42_1)
        local var_42_0 = 1
        local var_42_1 = arg_42_0:byte(arg_42_1)

        if not var_42_1 then
                var_42_0 = 1
        elseif var_42_1 > 0 and var_42_1 <= 127 then
                var_42_0 = 1
        elseif var_42_1 >= 192 and var_42_1 <= 223 then
                var_42_0 = 2
        elseif var_42_1 >= 224 and var_42_1 <= 239 then
                var_42_0 = 3
        elseif var_42_1 >= 240 and var_42_1 <= 247 then
                var_42_0 = 4
        end

        return var_42_0
end

function slot_0_114_0(arg_43_0)
        local var_43_0 = {
                nCurrentPosition = 0,
                nLength = 0,
                arrText = {}
        }
        local var_43_1 = arg_43_0:len()

        for iter_43_0 = 1, var_43_1 do
                local var_43_2 = slot_0_113_0(arg_43_0, var_43_0.nCurrentPosition + 1)

                table.insert(var_43_0.arrText, arg_43_0:sub(var_43_0.nCurrentPosition + 1, var_43_0.nCurrentPosition + var_43_2))

                var_43_0.nCurrentPosition = var_43_0.nCurrentPosition + var_43_2

                if var_43_1 < var_43_0.nCurrentPosition then
                        break
                end

                var_43_0.nLength = var_43_0.nLength + 1
        end

        return {
                arrText = var_43_0.arrText,
                nLength = var_43_0.nLength
        }
end

function slot_0_115_0()
        local var_44_0 = slot_0_102_0()
        local var_44_1 = ("%s\\csgo\\fatality\\%s"):format(var_44_0, slot_0_36_0)

        if not utils.file_exists(var_44_1) then
                return
        end

        slot_0_92_0("Shell32.dll", "ShellExecuteA", "void*(__stdcall*)(void*, const char*, const char*, const char*, const char*, int)", slot_0_22_0, "open", "cmd.exe", ("/c notepad.exe %s"):format(var_44_1), slot_0_22_0, 0)
end

function slot_0_116_0()
        local var_45_0 = slot_0_53_0:get_value():get()

        if slot_0_19_0 ~= var_45_0 then
                slot_0_19_0 = var_45_0

                if var_45_0 <= 0.25 then
                        slot_0_101_0()
                        gui.notify:add(gui.notification("[ Clantag Changer ] Warning !", "your clantag refresh time are too low, this maybe make your FPS to drop and is unsafe !"))
                end
        end
end

function slot_0_117_0()
        local var_46_0 = slot_0_59_0:get_value():get()

        if slot_0_25_0 ~= var_46_0 then
                slot_0_25_0 = var_46_0

                if var_46_0 <= 0.25 then
                        slot_0_101_0()
                        gui.notify:add(gui.notification("[ Clantag Changer ] Warning !", "your name stealer update time are too low, this may make your FPS to drop and is unsafe !"))
                end
        end
end

function slot_0_118_0()
        local var_47_0 = slot_0_102_0()
        local var_47_1 = slot_0_112_0(("%s\\csgo\\fatality\\%s"):format(var_47_0, slot_0_36_0))

        if not var_47_1 then
                return
        end

        local var_47_2, var_47_3 = xpcall(function()
                return utils.json_decode(var_47_1)
        end, function()
                error("Clantag/Name Stealer lua error: failed load json array sequence, invalid json formatter, skip load !")
        end)

        if not var_47_2 then
                slot_0_101_0()
                gui.notify:add(gui.notification("[ Clantag Changer ] Error !", "failed load json array sequence, the json data are incorrect formatter, skip load !"))

                return
        end

        slot_0_21_0 = {}

        for iter_47_0 = 1, #var_47_3 do
                local var_47_4 = var_47_3[iter_47_0]

                if type(var_47_4) == "string" then
                        table.insert(slot_0_21_0, slot_0_106_0(var_47_4))
                else
                        gui.notify:add(gui.notification("[ Clantag Changer ] Warning !", ("json array index: %s are invalid string value, continue this value !"):format(iter_47_0 - 1)))
                end

                if iter_47_0 > 256 then
                        slot_0_101_0()
                        gui.notify:add(gui.notification("[ Clantag Changer ] Warning !", "load json array warning - your json sequence is too many and over > 256 limitation, skip load !"))

                        break
                end
        end
end

function slot_0_119_0()
        local var_50_0 = slot_0_102_0()
        local var_50_1 = slot_0_111_0(("%s\\csgo\\fatality\\%s"):format(var_50_0, slot_0_34_0))

        if not var_50_1 then
                return
        end

        local var_50_2, var_50_3 = xpcall(function()
                return utils.base64_decode(var_50_1)
        end, function()
                error("Clantag/Name Stealer lua error: invalid local settings formatter, skip load !")
        end)

        if not var_50_2 then
                slot_0_101_0()
                gui.notify:add(gui.notification("[ Clantag Changer ] Error !", "failed load local lua settings, this maybe are settings incorrect formatter, skip load !"))

                return
        end

        local var_50_4, var_50_5 = xpcall(function()
                return utils.json_decode(var_50_3)
        end, function()
                error("Clantag/Name Stealer lua error: invalid locate settings formatter, skip load")
        end)

        if not var_50_4 then
                slot_0_101_0()
                gui.notify:add(gui.notification("[ Clantag Changer ] Error !", "failed load local lua settings, this maybe are settings incorrect formatter, skip load !"))

                return
        end

        local var_50_6 = false
        local var_50_7 = var_50_5.Clantag
        local var_50_8 = var_50_5["Custom Name"]
        local var_50_9 = var_50_5["Clipboard Imported Clantag"]

        if type(var_50_7) == "string" and var_50_7:len() > 0 and var_50_7:len() <= 255 and slot_0_109_0(var_50_7) then
                var_50_6 = true

                slot_0_47_0:set_value(var_50_7)
        end

        if type(var_50_8) == "string" and var_50_8:len() > 0 and var_50_8:len() <= 255 and slot_0_109_0(var_50_8) then
                var_50_6 = true

                slot_0_63_0:set_value(var_50_8)
        end

        if type(var_50_9) == "string" and var_50_9:len() > 1 then
                local var_50_10, var_50_11 = xpcall(utils.base64_decode, print, var_50_9)

                if var_50_10 and type(var_50_11) == "string" and var_50_11:len() > 0 then
                        local var_50_12 = slot_0_114_0(var_50_11)

                        if var_50_12.nLength > 0 and var_50_12.nLength <= 255 then
                                var_50_6 = true
                                slot_0_15_0 = var_50_11
                        else
                                slot_0_101_0()
                                gui.notify:add(gui.notification("[ Clantag Changer ] Warning !", "load local clipboard import saved storage, but the characters are > 255 - overload, skipping load !"))
                        end
                end
        end

        if var_50_6 then
                gui.notify:add(gui.notification("[ Clantag Changer ] Successfully !", "load database / import clantag successfully !"))
        end
end

function slot_0_120_0()
        local var_55_0 = slot_0_47_0.value
        local var_55_1 = slot_0_102_0()
        local var_55_2 = slot_0_63_0.value
        local var_55_3 = {
                Clantag = var_55_0,
                ["Custom Name"] = var_55_2,
                ["Clipboard Imported Clantag"] = slot_0_15_0:len() > 0 and utils.base64_encode(slot_0_15_0) or ""
        }

        gui.notify:add(gui.notification("[ Clantag Changer ] Successfully !", "save database / imported clantag text successfully !"))
        slot_0_110_0(("%s\\csgo\\fatality\\%s"):format(var_55_1, slot_0_34_0), utils.base64_encode(utils.json_encode(var_55_3)))
end

function slot_0_121_0()
        if not slot_0_92_0("user32.dll", "OpenClipboard", "bool(__stdcall*)(void*)", nil) or not slot_0_92_0("user32.dll", "IsClipboardFormatAvailable", "bool(__stdcall*)(uint32_t)", slot_0_1_0) then
                return nil
        end

        local var_56_0 = slot_0_92_0("user32.dll", "GetClipboardData", "void*(__stdcall*)(uint32_t)", slot_0_1_0)

        if not var_56_0 or var_56_0 == slot_0_31_0 then
                slot_0_92_0("user32.dll", "CloseClipboard", "bool(__stdcall*)()")

                return nil
        end

        local var_56_1 = slot_0_92_0("Kernel32.dll", "GlobalLock", "void*(__stdcall*)(void*)", var_56_0)

        if var_56_1 and var_56_1 ~= ffi.NULL and var_56_1 ~= slot_0_22_0 then
                local var_56_2, var_56_3 = slot_0_105_0(ffi.cast("const wchar_t*", var_56_1))

                if var_56_2 then
                        local var_56_4 = ffi.string(var_56_2, var_56_3)

                        slot_0_92_0("Kernel32.dll", "GlobalUnlock", "bool(__stdcall*)(void*)", var_56_0)
                        slot_0_92_0("user32.dll", "CloseClipboard", "bool(__stdcall*)()")

                        return var_56_4
                end
        end

        slot_0_92_0("Kernel32.dll", "GlobalUnlock", "bool(__stdcall*)(void*)", var_56_0)
        slot_0_92_0("user32.dll", "CloseClipboard", "bool(__stdcall*)()")

        return nil
end

function slot_0_122_0()
        local var_57_0 = slot_0_121_0()

        if not var_57_0 or var_57_0:len() <= 0 or var_57_0:len() > 255 then
                slot_0_101_0()
                gui.notify:add(gui.notification("[ Clantag Changer ] Error !", "failed import from clipboard, your import characters are too long and overload > 255 limitation !"))

                return
        end

        slot_0_15_0 = var_57_0

        gui.notify:add(gui.notification("[ Clantag Changer ] Notify !", "import clipboard text and apply clantag successfully !"))
        slot_0_120_0()
end

function slot_0_123_0(arg_58_0, arg_58_1, arg_58_2, arg_58_3, arg_58_4, arg_58_5)
        local var_58_0 = entities.get_local_controller()

        if not var_58_0 then
                return {}
        end

        local var_58_1 = {}

        entities.controllers:for_each(function(arg_59_0)
                local var_59_0 = arg_59_0.entity:get_name()
                local var_59_1 = arg_59_0.entity:is_enemy()
                local var_59_2 = not arg_58_0 or var_59_1
                local var_59_3 = not arg_58_1 or not var_59_1
                local var_59_4 = not arg_58_2 or arg_59_0.entity:is_alive()
                local var_59_5 = not arg_58_5 or arg_59_0.entity.m_steamID:get() > 0
                local var_59_6 = not arg_58_3 or arg_59_0.entity ~= var_58_0

                if type(arg_58_4) == "string" and var_59_0 == arg_58_4 then
                        return
                end

                if var_59_5 and var_59_4 and var_59_2 and var_59_3 and var_59_6 then
                        table.insert(var_58_1, arg_59_0.entity)
                end
        end)

        return var_58_1
end

function slot_0_124_0(arg_60_0)
        local var_60_0 = arg_60_0:find("\\n")

        while var_60_0 do
                arg_60_0 = ("%s\n%s"):format(arg_60_0:sub(0, var_60_0 - 1), arg_60_0:sub(var_60_0 + 2, arg_60_0:len()))
                var_60_0 = arg_60_0:find("\\n")
        end

        for iter_60_0 in arg_60_0:gmatch(("%s%s"):format("\\x", "%x%x")) do
                local var_60_1 = arg_60_0:find(iter_60_0)

                if var_60_1 then
                        local var_60_2 = tonumber(iter_60_0:sub(3, 4), 16)

                        arg_60_0 = ("%s%s"):format(arg_60_0:sub(0, var_60_1 - 1), arg_60_0:sub(var_60_1 + iter_60_0:len(), arg_60_0:len()))

                        if var_60_2 then
                                arg_60_0 = ("%s%s"):format(arg_60_0, string.char(var_60_2))
                        end
                end
        end

        return arg_60_0
end

function slot_0_125_0(arg_61_0, arg_61_1, arg_61_2, arg_61_3)
        if not game.engine:in_game() or not slot_0_100_0 then
                return
        end

        local var_61_0 = slot_0_99_0:GetNetChannel(0)

        if var_61_0 == slot_0_22_0 then
                return
        end

        local var_61_1 = slot_0_100_0()

        if var_61_1 == slot_0_22_0 then
                return
        end

        if not slot_0_2_0 then
                local var_61_2 = entities.get_local_controller()

                if not var_61_2 then
                        return
                end

                slot_0_2_0 = true
                slot_0_7_0 = var_61_2:get_name()
        end

        local var_61_3 = arg_61_2 and slot_0_2_0
        local var_61_4 = slot_0_3_0 and "  " or "   "
        local var_61_5 = arg_61_1 and var_61_4 or ("%s%s"):format(slot_0_7_0, var_61_4)

        if var_61_3 then
                var_61_5 = slot_0_7_0
        elseif type(arg_61_3) == "string" then
                var_61_5 = arg_61_3
        end

        var_61_1:SetConvarValue("name", var_61_3 and var_61_5 or ("%s%s"):format(arg_61_0 and arg_61_0 ~= "" and ("%s "):format(arg_61_0) or "", var_61_5))
        var_61_1:Invoke(var_61_0, slot_0_42_0.BUF_DEFAULT)
        var_61_1:Deallocate()
        slot_0_98_0:Free(var_61_1)

        slot_0_3_0 = not slot_0_3_0
end

function slot_0_126_0()
        slot_0_125_0("", false, true, "")
        slot_0_97_0:SetUserName(slot_0_30_0)
end

function slot_0_127_0(arg_63_0)
        local var_63_0 = ""
        local var_63_1 = slot_0_114_0(arg_63_0)

        for iter_63_0 = 0, var_63_1.nLength - 1 do
                var_63_0 = ("%s%s"):format(var_63_0, var_63_1.arrText[var_63_1.nLength - iter_63_0])
        end

        return var_63_0
end

function slot_0_128_0(arg_64_0, arg_64_1, arg_64_2)
        if arg_64_2 <= 0 then
                return ""
        end

        local var_64_0 = ""
        local var_64_1 = math.max(1, arg_64_1)
        local var_64_2 = math.clamp(arg_64_2, 1, #arg_64_0)

        while var_64_1 <= var_64_2 do
                var_64_0 = ("%s%s"):format(var_64_0, arg_64_0[var_64_1])
                var_64_1 = var_64_1 + 1
        end

        return var_64_0
end

function slot_0_129_0()
        slot_65_0_0 = slot_0_65_0:get_value():get():get_raw()

        if slot_65_0_0 <= 0 and not game.engine:in_game() then
                if slot_0_5_0 then
                        slot_0_126_0()

                        slot_0_5_0 = false
                        slot_0_6_0 = ""
                        slot_0_9_0 = 0
                        slot_0_10_0 = 0
                        slot_0_11_0 = ""
                        slot_0_12_0 = false
                        slot_0_13_0 = false
                        slot_0_14_0 = 0
                        slot_0_16_0 = false
                        slot_0_18_0 = 0
                        slot_0_17_0 = 0
                        slot_0_20_0 = false
                        slot_0_24_0 = false
                        slot_0_23_0 = false
                        slot_0_26_0 = 0
                        slot_0_28_0 = 0
                end

                return
        end

        slot_65_1_0 = slot_0_45_0:get_value():get()
        slot_65_2_0 = slot_0_56_0:get_value():get()

        if not slot_65_1_0 and not slot_65_2_0 then
                if slot_0_5_0 then
                        slot_0_126_0()

                        slot_0_5_0 = false
                        slot_0_6_0 = ""
                        slot_0_9_0 = 0
                        slot_0_10_0 = 0
                        slot_0_11_0 = ""
                        slot_0_12_0 = false
                        slot_0_13_0 = false
                        slot_0_14_0 = 0
                        slot_0_16_0 = false
                        slot_0_18_0 = 0
                        slot_0_17_0 = 0
                        slot_0_20_0 = false
                        slot_0_24_0 = false
                        slot_0_23_0 = false
                        slot_0_26_0 = 0
                        slot_0_28_0 = 0
                end

                return
        end

        slot_65_3_0 = false
        slot_65_4_0 = ""
        slot_65_5_0 = false
        slot_65_6_0 = false
        slot_65_7_0 = nil
        slot_65_8_0 = game.global_vars.cur_time

        if slot_0_17_0 == 0 then
                slot_0_17_0 = slot_65_8_0
        end

        slot_65_9_0 = slot_0_54_0:get_value():get()
        slot_65_10_0 = slot_0_53_0:get_value():get()
        slot_65_11_0 = slot_0_57_0:get_value():get():get_raw()
        slot_65_12_0 = math.abs(slot_65_8_0 - slot_0_17_0)
        slot_65_13_0 = slot_0_59_0:get_value():get()
        slot_65_14_0 = math.abs(slot_65_8_0 - slot_0_26_0)

        if slot_65_1_0 then
                slot_65_15_1 = false
                slot_65_16_1 = {}
                slot_65_17_2 = slot_0_106_0(slot_0_47_0.value)
                slot_65_18_2 = slot_0_46_0:get_value():get():get_raw()
                slot_65_19_1 = slot_65_17_2:len()

                if bit.band(slot_65_18_2, bit.lshift(1, 0)) > 0 and slot_65_9_0 then
                        slot_65_15_1 = true
                        slot_65_20_1 = slot_0_107_0(slot_65_17_2)
                        slot_65_21_5 = slot_0_114_0(slot_65_20_1)
                        slot_65_16_1 = slot_65_21_5.arrText
                        slot_65_19_1 = slot_65_21_5.nLength
                        slot_65_17_2 = slot_65_20_1
                end

                slot_65_20_0 = slot_0_87_0(#slot_0_39_0, slot_0_52_0:get_value():get():get_raw())

                if slot_0_27_0 ~= slot_65_17_2 then
                        if slot_0_27_0 ~= "" then
                                slot_65_5_0 = true
                        end

                        slot_0_27_0 = slot_65_17_2
                end

                if bit.band(slot_65_18_2, bit.lshift(1, 2)) > 0 then
                        slot_65_21_4 = #slot_0_21_0

                        if slot_65_21_4 == 0 then
                                slot_65_17_2 = ""
                                slot_65_20_0 = 1
                        else
                                slot_65_20_0 = 1

                                if slot_0_50_0:get_value():get():get_raw() == 1 then
                                        if slot_65_10_0 < slot_65_12_0 then
                                                slot_0_17_0 = slot_65_8_0
                                                slot_0_28_0 = slot_0_28_0 + 1
                                        end

                                        if slot_65_21_4 < slot_0_28_0 then
                                                slot_0_28_0 = 1
                                        end

                                        slot_65_17_2 = slot_0_21_0[math.clamp(slot_0_28_0, 1, slot_65_21_4)]
                                else
                                        slot_65_23_3 = math.floor(slot_65_8_0 / slot_65_10_0)
                                        slot_65_24_2 = math.clamp(slot_65_23_3 % (slot_65_21_4 + 1), 1, slot_65_21_4)
                                        slot_65_17_2 = slot_0_21_0[slot_65_24_2]
                                end
                        end
                elseif bit.band(slot_65_18_2, bit.lshift(1, 4)) > 0 then
                        slot_65_20_0 = 1
                        slot_65_17_2 = "⋆.*･｡⛧"
                elseif bit.band(slot_65_18_2, bit.lshift(1, 3)) > 0 then
                        slot_65_20_0 = 1
                        slot_65_21_3 = slot_0_103_0()
                        slot_65_17_2 = ("%s%s:%s:%s"):format(slot_0_51_0:get_value():get() and "TIME: " or "", slot_65_21_3.nHours, slot_65_21_3.nMinutes, slot_65_21_3.nSeconds)
                elseif bit.band(slot_65_18_2, bit.lshift(1, 5)) > 0 then
                        slot_65_20_0 = 1
                        slot_65_17_2 = "✿❤❀"
                        slot_65_21_2 = 4

                        if slot_65_12_0 > 1 then
                                slot_0_17_0 = slot_65_8_0
                                slot_0_9_0 = slot_0_9_0 + 1
                        end

                        if slot_65_21_2 < slot_0_9_0 then
                                slot_0_9_0 = 0
                        end

                        if slot_0_9_0 > 0 then
                                for iter_65_0 = 1, slot_0_9_0 do
                                        slot_65_17_2 = ("%s%s%s"):format(iter_65_0 % 2 == 0 and "✿" or "❀", slot_65_17_2, iter_65_0 % 2 == 0 and "❀" or "✿")
                                end
                        end
                elseif bit.band(slot_65_18_2, bit.lshift(1, 1)) > 0 then
                        slot_65_15_1 = true
                        slot_65_21_1 = slot_0_106_0(slot_0_15_0)
                        slot_65_22_5 = slot_0_114_0(slot_65_21_1)
                        slot_65_16_1 = slot_65_22_5.arrText
                        slot_65_19_1 = slot_65_22_5.nLength
                        slot_65_17_2 = slot_65_21_1
                end

                slot_65_21_0 = slot_0_18_0 ~= slot_65_20_0

                if slot_65_21_0 then
                        slot_0_10_0 = 0
                        slot_0_9_0 = 0
                        slot_0_14_0 = 0
                        slot_0_24_0 = false
                        slot_0_28_0 = 0
                        slot_0_18_0 = slot_65_20_0
                end

                if slot_65_20_0 == 1 then
                        slot_65_17_2 = slot_0_106_0(slot_0_124_0(slot_65_17_2))
                elseif slot_65_20_0 == 2 or slot_65_20_0 == 3 then
                        slot_0_10_0 = 0
                        slot_0_24_0 = false

                        if slot_65_10_0 < slot_65_12_0 then
                                slot_0_17_0 = slot_65_8_0
                                slot_0_14_0 = slot_0_14_0 + 1
                        end

                        if slot_65_19_1 < slot_0_14_0 then
                                slot_0_14_0 = 1
                        end

                        slot_65_22_4 = slot_65_19_1 - slot_0_14_0
                        slot_65_23_2 = slot_65_15_1 and slot_0_128_0(slot_65_16_1, 1, slot_65_22_4) or slot_65_17_2:sub(1, slot_65_22_4)
                        slot_65_24_1 = slot_65_15_1 and slot_0_128_0(slot_65_16_1, slot_65_22_4, slot_65_19_1) or slot_65_17_2:sub(slot_65_22_4, slot_65_19_1)

                        if slot_65_20_0 == 2 then
                                slot_65_17_2 = ("%s %s"):format(slot_65_24_1, slot_65_23_2)
                        else
                                slot_65_17_2 = ("%s %s"):format(slot_65_23_2, slot_65_15_1 and slot_0_127_0(slot_65_24_1) or slot_65_24_1:reverse())
                        end
                elseif slot_65_20_0 == 4 then
                        slot_0_24_0 = false

                        if slot_65_10_0 < slot_65_12_0 then
                                slot_0_17_0 = slot_65_8_0
                                slot_0_10_0 = slot_0_10_0 + 1
                        end

                        if slot_65_19_1 < slot_0_10_0 then
                                slot_0_10_0 = 1
                        end

                        slot_65_17_2 = slot_65_15_1 and slot_0_128_0(slot_65_16_1, 1, slot_0_10_0) or slot_65_17_2:sub(1, slot_0_10_0)
                elseif slot_65_20_0 == 5 then
                        if slot_65_10_0 < slot_65_12_0 then
                                slot_0_17_0 = slot_65_8_0
                                slot_65_22_3 = slot_0_24_0 and -1 or 1
                                slot_0_10_0 = slot_0_10_0 + slot_65_22_3
                        end

                        if slot_65_19_1 <= slot_0_10_0 then
                                slot_0_24_0 = true
                        elseif slot_0_10_0 <= 1 then
                                slot_0_24_0 = false
                        end

                        slot_65_17_2 = slot_65_15_1 and slot_0_128_0(slot_65_16_1, 1, slot_0_10_0) or slot_65_17_2:sub(1, slot_0_10_0)
                elseif slot_65_20_0 == 6 then
                        if slot_65_10_0 < slot_65_12_0 then
                                slot_0_17_0 = slot_65_8_0
                                slot_65_22_2 = slot_0_24_0 and -1 or 1
                                slot_0_10_0 = slot_0_10_0 + slot_65_22_2
                        end

                        if slot_65_19_1 <= slot_0_10_0 then
                                slot_0_24_0 = true
                        elseif slot_0_10_0 <= 0 then
                                slot_0_24_0 = false
                        end

                        slot_65_17_2 = slot_65_15_1 and slot_0_128_0(slot_65_16_1, slot_0_24_0 and slot_65_19_1 - slot_0_10_0 + 1 or 1, slot_0_24_0 and slot_65_19_1 or slot_0_10_0) or slot_65_17_2:sub(slot_0_24_0 and slot_65_19_1 - slot_0_10_0 + 1 or 1, slot_0_24_0 and slot_65_19_1 or slot_0_10_0)
                elseif slot_65_20_0 == 7 then
                        if not slot_0_24_0 then
                                slot_0_14_0 = 1

                                if slot_65_10_0 < slot_65_12_0 then
                                        slot_0_17_0 = slot_65_8_0
                                        slot_0_10_0 = slot_0_10_0 + 1
                                end

                                if slot_65_19_1 < slot_0_10_0 then
                                        slot_0_24_0 = true
                                end

                                slot_65_17_2 = slot_65_15_1 and slot_0_128_0(slot_65_16_1, 1, slot_0_10_0) or slot_65_17_2:sub(1, slot_0_10_0)
                        else
                                if slot_65_10_0 < slot_65_12_0 then
                                        slot_0_17_0 = slot_65_8_0
                                        slot_0_14_0 = slot_0_14_0 + 1
                                end

                                if slot_65_19_1 < slot_0_14_0 then
                                        slot_0_10_0 = 1
                                        slot_0_24_0 = false
                                end

                                slot_65_22_1 = slot_65_19_1 - slot_0_14_0
                                slot_65_23_1 = slot_65_15_1 and slot_0_128_0(slot_65_16_1, 1, slot_65_22_1) or slot_65_17_2:sub(1, slot_65_22_1)
                                slot_65_24_0 = slot_65_15_1 and slot_0_128_0(slot_65_16_1, slot_65_22_1, slot_65_19_1) or slot_65_17_2:sub(slot_65_22_1, slot_65_19_1)
                                slot_65_17_2 = ("%s %s"):format(slot_65_24_0, slot_65_23_1)
                        end
                elseif slot_65_20_0 == 8 then
                        slot_65_22_0 = slot_65_8_0 * (5 - slot_65_10_0)
                        slot_65_23_0 = math.floor(slot_65_22_0) % slot_65_19_1
                        slot_65_17_2 = slot_65_15_1 and slot_0_128_0(slot_65_16_1, 1, math.clamp(slot_65_23_0, 1, slot_65_19_1)) or slot_65_17_2:sub(1, math.clamp(slot_65_23_0, 1, slot_65_19_1))
                end

                if slot_65_21_0 or slot_0_11_0 ~= slot_65_17_2 then
                        slot_65_3_0 = true
                        slot_65_6_0 = true
                        slot_65_4_0 = slot_65_17_2
                        slot_0_11_0 = slot_65_17_2
                        slot_0_18_0 = slot_65_20_0
                end

                slot_0_16_0 = true
        elseif slot_0_16_0 then
                slot_65_3_0 = true
                slot_65_4_0 = ""
                slot_65_6_0 = true
                slot_0_10_0 = 0
                slot_0_11_0 = ""
                slot_0_14_0 = 0
                slot_0_16_0 = false
        end

        slot_65_15_0 = slot_0_124_0(slot_0_63_0.value)
        slot_65_16_0 = slot_65_11_0 == 1 and (slot_65_6_0 or slot_0_20_0) or slot_65_11_0 == 2 and (slot_65_6_0 or slot_65_13_0 <= slot_65_14_0) or slot_65_11_0 == 4 and (slot_65_6_0 or not slot_0_13_0 or slot_0_29_0 ~= slot_65_15_0)

        if slot_65_2_0 and slot_65_16_0 then
                slot_65_17_1 = slot_0_61_0:get_value():get():get_raw()
                slot_65_18_1 = slot_65_11_0 == 1 and slot_65_6_0 and not slot_0_20_0
                slot_65_19_0 = slot_0_123_0(bit.band(slot_65_17_1, bit.lshift(1, 2)) > 0, bit.band(slot_65_17_1, bit.lshift(1, 1)) > 0, false, true, slot_0_6_0, slot_0_60_0:get_value():get())

                if slot_65_18_1 then
                        slot_0_13_0 = false
                        slot_0_26_0 = slot_65_8_0

                        if slot_0_6_0 ~= "" then
                                slot_65_3_0 = true
                                slot_65_7_0 = ("%s%s"):format(slot_0_6_0, slot_0_3_0 and "  " or "   ")
                        end
                elseif slot_65_11_0 == 4 then
                        slot_65_3_0 = true
                        slot_0_13_0 = true
                        slot_65_7_0 = slot_65_15_0
                        slot_65_4_0 = slot_0_11_0

                        if slot_0_29_0 ~= "" and slot_0_29_0 ~= slot_65_15_0 then
                                slot_65_5_0 = true
                        end

                        slot_0_29_0 = slot_65_15_0
                elseif slot_65_6_0 and slot_65_14_0 < slot_65_13_0 and slot_0_6_0 ~= "" then
                        slot_65_3_0 = true
                        slot_0_13_0 = false
                        slot_65_7_0 = slot_0_6_0
                elseif #slot_65_19_0 > 0 then
                        slot_65_3_0 = true
                        slot_0_13_0 = false
                        slot_65_4_0 = slot_0_11_0
                        slot_0_26_0 = slot_65_8_0
                        slot_0_6_0 = slot_65_19_0[math.random(1, #slot_65_19_0)]:get_name()

                        if slot_65_11_0 == 1 and slot_0_20_0 then
                                slot_0_20_0 = false

                                gui.notify:add(gui.notification("[ Name Stealer ] Notify !", ("-> Steal Player Name: %s"):format(slot_0_6_0)))
                        end

                        slot_65_7_0 = slot_0_6_0

                        if slot_0_62_0:get_value():get() then
                                slot_65_7_0 = ("%s "):format(slot_0_6_0)
                        end
                end

                slot_0_12_0 = true
        elseif not slot_65_2_0 and slot_0_12_0 then
                slot_65_3_0 = true
                slot_0_12_0 = false
                slot_0_13_0 = false
                slot_0_6_0 = ("%s "):format(slot_0_7_0)

                if slot_65_1_0 then
                        slot_65_4_0 = slot_0_11_0
                end

                slot_65_7_0 = slot_0_6_0
        end

        if slot_65_5_0 then
                slot_0_120_0()
        end

        if slot_65_3_0 then
                slot_0_5_0 = true
                slot_65_17_0 = ""

                slot_0_125_0(slot_65_4_0, slot_65_2_0 and slot_0_6_0 ~= "", false, slot_65_7_0)

                if slot_65_0_0 > 0 then
                        if not slot_0_2_0 then
                                slot_65_18_0 = entities.get_local_controller()

                                if slot_65_18_0 then
                                        slot_0_2_0 = true
                                        slot_0_7_0 = slot_65_18_0:get_name()
                                end
                        end

                        if bit.band(slot_65_0_0, bit.lshift(1, 0)) > 0 and slot_65_4_0 ~= "" then
                                slot_65_17_0 = slot_65_4_0
                        end

                        if bit.band(slot_65_0_0, bit.lshift(1, 1)) > 0 then
                                slot_65_17_0 = ("%s %s"):format(slot_65_17_0, slot_65_2_0 and (slot_65_7_0 or slot_0_7_0) or slot_0_7_0)
                        elseif slot_65_17_0 ~= "" then
                                slot_65_17_0 = ("%s %s"):format(slot_65_17_0, slot_0_30_0)
                        end

                        if slot_65_17_0 ~= "" then
                                slot_0_23_0 = true

                                slot_0_97_0:SetUserName(slot_0_108_0(slot_65_17_0))
                        end
                elseif slot_0_23_0 then
                        slot_0_23_0 = false

                        slot_0_97_0:SetUserName(slot_0_30_0)
                end
        end
end

slot_0_118_0()
slot_0_119_0()
slot_0_85_0()
slot_0_84_0(slot_0_126_0)
slot_0_116_0()
slot_0_117_0()
events.present_queue:add(slot_0_129_0)
slot_0_45_0:add_callback(slot_0_85_0)
slot_0_56_0:add_callback(slot_0_85_0)
slot_0_52_0:add_callback(slot_0_85_0)
slot_0_46_0:add_callback(slot_0_85_0)
slot_0_57_0:add_callback(slot_0_85_0)
slot_0_48_0:add_callback(slot_0_122_0)
slot_0_49_0:add_callback(slot_0_115_0)
slot_0_53_0:add_callback(slot_0_116_0)
slot_0_58_0:add_callback(slot_0_83_0)
slot_0_59_0:add_callback(slot_0_117_0)
