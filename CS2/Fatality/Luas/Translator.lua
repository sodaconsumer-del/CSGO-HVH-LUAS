--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0 = {
        apiKey = "",
        show_api_controls = true,
        enabled = false,
        x = 0,
        y = 0,
        width = 400,
        height = 300,
        cornerRadius = 6,
        bgOpacity = 230,
        visible = true,
        hideInactivity = 0,
        apiKeyWorking = false
}
slot_0_1_0 = "Rcnhbh3iC16VM9c9rb1oAS"
slot_0_2_0 = {}
slot_0_3_0 = {}
slot_0_4_0 = 100
slot_0_5_0 = {}
slot_0_6_0 = 50
slot_0_7_0 = {}
slot_0_8_0 = game.engine:InGame()
slot_0_9_0 = false
slot_0_10_0 = nil
slot_0_11_0 = "snoop_translator_cfg"
slot_0_12_0 = {
        vi = "Vietnamese",
        tr = "Turkish",
        th = "Thai",
        ar = "Arabic",
        ko = "Korean",
        ja = "Japanese",
        zh = "Chinese",
        ru = "Russian",
        uk = "Ukrainian",
        en = "English",
        nl = "Dutch",
        pt = "Portuguese",
        it = "Italian",
        es = "Spanish",
        de = "German",
        fr = "French",
        pl = "Polish",
        hi = "Hindi"
}

function slot_0_13_0(arg_1_0, arg_1_1)
        gui.notify:Add(gui.notification(arg_1_0, arg_1_1))
end

function slot_0_14_0()
        local var_2_0 = {
                enabled = slot_0_0_0.enabled,
                show_api_controls = slot_0_0_0.show_api_controls,
                apiKey = slot_0_0_0.apiKey,
                apiKeyWorking = slot_0_0_0.apiKeyWorking,
                hideInactivity = slot_0_0_0.hideInactivity,
                visible = slot_0_0_0.visible,
                x = slot_0_0_0.x,
                y = slot_0_0_0.y,
                width = slot_0_0_0.width,
                height = slot_0_0_0.height,
                bgOpacity = slot_0_0_0.bgOpacity,
                cornerRadius = slot_0_0_0.cornerRadius
        }

        if not utils.DbSave(var_2_0, slot_0_11_0) then
                print("[Translator] Failed to save settings")
        end
end

;(function()
        local var_3_0 = utils.DbLoad(slot_0_11_0)

        if var_3_0 then
                slot_0_0_0.enabled = var_3_0.enabled == true
                slot_0_0_0.show_api_controls = var_3_0.show_api_controls == true
                slot_0_0_0.apiKey = var_3_0.apiKey or slot_0_0_0.apiKey
                slot_0_0_0.apiKeyWorking = var_3_0.apiKeyWorking == true
                slot_0_0_0.hideInactivity = var_3_0.hideInactivity or slot_0_0_0.hideInactivity
                slot_0_0_0.visible = var_3_0.visible == true
                slot_0_0_0.x = var_3_0.x or slot_0_0_0.x
                slot_0_0_0.y = var_3_0.y or slot_0_0_0.y
                slot_0_0_0.width = var_3_0.width or slot_0_0_0.width
                slot_0_0_0.height = var_3_0.height or slot_0_0_0.height
                slot_0_0_0.bgOpacity = var_3_0.bgOpacity or slot_0_0_0.bgOpacity
                slot_0_0_0.cornerRadius = var_3_0.cornerRadius or slot_0_0_0.cornerRadius

                print("[Translator] Settings loaded successfully")

                return true
        else
                print("[Translator] No saved settings found, using defaults")

                return false
        end
end)()

slot_0_16_0, slot_0_17_0 = game.engine:GetScreenSize()

if slot_0_0_0.x == 0 and slot_0_0_0.y == 0 then
        slot_0_0_0.x = slot_0_16_0 - slot_0_0_0.width - 20
        slot_0_0_0.y = slot_0_17_0 / 2 - slot_0_0_0.height / 2
end

slot_0_18_0 = gui.ctx:find("lua>groups")

if not slot_0_18_0 then
        print("[Translator] Could not find lua>groups")

        return
end

slot_0_19_0 = gui.Group("translator_chat_group", "Translator", 370, gui.GroupWidthMode.DEFAULT)

slot_0_18_0:Add(slot_0_19_0)

slot_0_20_0, slot_0_21_0 = gui.MakeControlEasy("enable_translations", "Enable", "checkbox")
slot_0_22_0, slot_0_23_0 = gui.MakeControlEasy("show_api_controls", "Show API Controls", "checkbox")
slot_0_21_0.tooltip = "!!UNSAFE LOCAL SCRIPTS MUST BE ENABLED!!"
slot_0_24_0, slot_0_25_0 = gui.MakeControlEasy("translator_chat_api_key", "API Key", "TextInput")
slot_0_26_0, slot_0_27_0 = gui.MakeControlEasy("translator_chat_api_key_paste_button", "Paste Clipboard", "Button", "Paste")
slot_0_28_0, slot_0_29_0 = gui.MakeControlEasy("translator_chat_api_key_paste_button", "Save API Key", "Button", "Save")
slot_0_30_0, slot_0_31_0 = gui.MakeControlEasy("translator_chat_test_api_key_button", "Test API Key", "Button", "Test")
slot_0_32_0, slot_0_33_0 = gui.MakeControlEasy("translator_chat_api_key_button", "Get Free Key", "Button", "Visit")
slot_0_33_0.tooltip = "Create a free account with langby.com to get an api key."
slot_0_34_0, slot_0_35_0 = gui.MakeControlEasy("translator_chat_width", "Width", "slider", 100, slot_0_16_0)
slot_0_36_0, slot_0_37_0 = gui.MakeControlEasy("translator_chat_height", "Height", "slider", 50, slot_0_17_0)
slot_0_38_0, slot_0_39_0 = gui.MakeControlEasy("translator_chat_x", "X Position", "slider", -slot_0_16_0, slot_0_16_0)
slot_0_40_0, slot_0_41_0 = gui.MakeControlEasy("translator_chat_y", "Y Position", "slider", -slot_0_17_0, slot_0_17_0)
slot_0_42_0, slot_0_43_0 = gui.MakeControlEasy("translator_chat_opacity", "Background Opacity", "slider", 0, 255)

slot_0_20_0:GetValue():Set(slot_0_0_0.enabled)
slot_0_22_0:GetValue():Set(slot_0_0_0.show_api_controls)
slot_0_24_0:SetValue(slot_0_0_0.apiKey)
slot_0_34_0:GetValue():Set(slot_0_0_0.width)
slot_0_36_0:GetValue():Set(slot_0_0_0.height)
slot_0_38_0:GetValue():Set(slot_0_0_0.x)
slot_0_40_0:GetValue():Set(slot_0_0_0.y)
slot_0_42_0:GetValue():Set(slot_0_0_0.bgOpacity)
slot_0_19_0:Add(slot_0_21_0)
slot_0_19_0:Add(slot_0_23_0)
slot_0_19_0:Add(slot_0_25_0)
slot_0_19_0:Add(slot_0_27_0)
slot_0_19_0:Add(slot_0_29_0)
slot_0_19_0:Add(slot_0_33_0)
slot_0_19_0:Add(slot_0_31_0)
slot_0_19_0:Add(slot_0_35_0)
slot_0_19_0:Add(slot_0_37_0)
slot_0_19_0:Add(slot_0_39_0)
slot_0_19_0:Add(slot_0_41_0)
slot_0_19_0:Add(slot_0_43_0)
slot_0_19_0:Reset()
slot_0_18_0:Reset()

function slot_0_44_0(arg_4_0, arg_4_1, arg_4_2)
        if not arg_4_1 then
                return {
                        arg_4_0
                }
        end

        local var_4_0 = {}
        local var_4_1 = {}

        for iter_4_0 in string.gmatch(arg_4_0, "%S+") do
                table.insert(var_4_1, iter_4_0)
        end

        local var_4_2 = ""

        for iter_4_1, iter_4_2 in ipairs(var_4_1) do
                local var_4_3 = var_4_2

                if var_4_3 == "" then
                        var_4_3 = iter_4_2
                else
                        var_4_3 = var_4_3 .. " " .. iter_4_2
                end

                if arg_4_2 >= arg_4_1:GetTextSize(var_4_3).x then
                        var_4_2 = var_4_3
                else
                        if var_4_2 ~= "" then
                                table.insert(var_4_0, var_4_2)
                        end

                        var_4_2 = iter_4_2
                end
        end

        if var_4_2 ~= "" then
                table.insert(var_4_0, var_4_2)
        end

        return var_4_0
end

function slot_0_45_0(arg_5_0, arg_5_1, arg_5_2)
        local var_5_0, var_5_1, var_5_2, var_5_3 = string.match(arg_5_0, "^%[([^%]]+)%]%s*%[([^%]]+)%]%s*([^:]+):%s*(.+)$")

        if not var_5_0 then
                var_5_1, var_5_2, var_5_3 = string.match(arg_5_0, "^%[([^%]]+)%]%s*([^:]+):%s*(.+)$")

                if not var_5_1 or not var_5_2 or not var_5_3 then
                        return {
                                arg_5_0
                        }, nil, nil, nil, nil
                end

                var_5_0 = nil
        end

        local var_5_4

        if var_5_0 then
                var_5_4 = string.format("[%s] [%s] %s: ", var_5_0, var_5_1, var_5_2)
        else
                var_5_4 = string.format("[%s] %s: ", var_5_1, var_5_2)
        end

        local var_5_5 = arg_5_2 - arg_5_1:GetTextSize(var_5_4).x

        if var_5_5 < 50 then
                var_5_5 = 50
        end

        local var_5_6 = slot_0_44_0(var_5_3, arg_5_1, var_5_5)
        local var_5_7 = {}

        if #var_5_6 > 0 then
                var_5_7[1] = var_5_4 .. var_5_6[1]

                for iter_5_0 = 2, #var_5_6 do
                        var_5_7[iter_5_0] = var_5_6[iter_5_0]
                end
        end

        return var_5_7, var_5_1, var_5_2, var_5_3, var_5_0, var_5_4
end

function slot_0_46_0()
        if not slot_0_0_0.enabled or not slot_0_8_0 then
                return
        end

        slot_0_0_0.width = slot_0_34_0:GetValue():Get()
        slot_0_0_0.height = slot_0_36_0:GetValue():Get()
        slot_0_0_0.x = slot_0_38_0:GetValue():Get()
        slot_0_0_0.y = slot_0_40_0:GetValue():Get()
        slot_0_0_0.bgOpacity = slot_0_42_0:GetValue():Get()
        slot_6_0_0 = draw.surface
        slot_6_1_0 = draw.fonts.gui_main

        if not slot_6_1_0 then
                return
        end

        slot_6_0_0.font = slot_6_1_0
        slot_6_2_0 = draw.Color(30, 30, 35, slot_0_0_0.bgOpacity)

        slot_6_0_0:AddRectFilledRounded(draw.Rect(slot_0_0_0.x, slot_0_0_0.y, slot_0_0_0.x + slot_0_0_0.width, slot_0_0_0.y + slot_0_0_0.height), slot_6_2_0, slot_0_0_0.cornerRadius, draw.Rounding.ALL)

        slot_6_3_0 = draw.Vec2(slot_0_0_0.x + 8, slot_0_0_0.y + 6)

        slot_6_0_0:AddText(slot_6_3_0, "Translations", draw.Color(194, 23, 80, 255))

        slot_6_4_0 = slot_0_0_0.y + 20

        slot_6_0_0:AddRectFilled(draw.Rect(slot_0_0_0.x + 8, slot_6_4_0, slot_0_0_0.x + slot_0_0_0.width - 8, slot_6_4_0 + 1), draw.Color(194, 23, 80, 100))

        slot_6_5_0 = slot_0_0_0.width - 16
        slot_6_6_0 = slot_6_4_0 + 6
        slot_6_7_0 = slot_6_1_0.height + 1
        slot_6_8_0 = draw.Color(254, 79, 94, 255)
        slot_6_9_0 = draw.Color(220, 220, 220, 255)
        slot_6_10_0 = draw.Color(255, 200, 100, 255)

        for iter_6_0, iter_6_1 in pairs(slot_0_7_0) do
                if slot_6_6_0 + slot_6_7_0 > slot_0_0_0.y + slot_0_0_0.height - 0 then
                        break
                end

                slot_6_16_1 = string.format("[%s] %s: Translating...", iter_6_1.channel, iter_6_1.player)
                slot_6_17_1 = draw.Vec2(slot_0_0_0.x + 8, slot_6_6_0)

                slot_6_0_0:AddText(slot_6_17_1, slot_6_16_1, slot_6_10_0)

                slot_6_6_0 = slot_6_6_0 + slot_6_7_0 + 1
        end

        for iter_6_2, iter_6_3 in ipairs(slot_0_2_0) do
                if slot_6_6_0 + slot_6_7_0 > slot_0_0_0.y + slot_0_0_0.height - 0 then
                        break
                end

                slot_6_16_0, slot_6_17_0, slot_6_18_0, slot_6_19_0, slot_6_20_0, slot_6_21_0 = slot_0_45_0(iter_6_3, slot_6_1_0, slot_6_5_0)

                for iter_6_4, iter_6_5 in ipairs(slot_6_16_0) do
                        if slot_6_6_0 + slot_6_7_0 <= slot_0_0_0.y + slot_0_0_0.height - 0 then
                                if slot_6_20_0 and slot_6_20_0 ~= "" and iter_6_4 == 1 then
                                        slot_6_27_1 = "[" .. slot_6_20_0 .. "]"
                                        slot_6_28_0 = iter_6_5:sub(#slot_6_27_1 + 1)
                                        slot_6_29_0 = draw.Vec2(slot_0_0_0.x + 8, slot_6_6_0)

                                        slot_6_0_0:AddText(slot_6_29_0, slot_6_27_1, slot_6_8_0)

                                        slot_6_30_0 = draw.Vec2(slot_0_0_0.x + 8 + slot_6_1_0:GetTextSize(slot_6_27_1).x, slot_6_6_0)

                                        slot_6_0_0:AddText(slot_6_30_0, slot_6_28_0, slot_6_9_0)
                                else
                                        slot_6_27_0 = draw.Vec2(slot_0_0_0.x + 8, slot_6_6_0)

                                        slot_6_0_0:AddText(slot_6_27_0, iter_6_5, slot_6_9_0)
                                end

                                slot_6_6_0 = slot_6_6_0 + slot_6_7_0
                        else
                                break
                        end
                end

                slot_6_6_0 = slot_6_6_0 + 1
        end
end

events.presentQueue:Add(slot_0_46_0)

function slot_0_47_0(arg_7_0)
        if not arg_7_0 or arg_7_0 == "" then
                return "Unknown"
        end

        arg_7_0 = arg_7_0:gsub("@[%w_]+$", "")
        arg_7_0 = arg_7_0:gsub("@[%w_]+%s", "")
        arg_7_0 = arg_7_0:gsub("^%s*(.-)%s*$", "%1")

        if arg_7_0 == "" then
                return "Unknown"
        end

        return arg_7_0
end

function slot_0_48_0(arg_8_0, arg_8_1)
        local var_8_0 = utils.JsonEncode({
                target = "en",
                q = arg_8_0
        })
        local var_8_1 = slot_0_0_0.apiKey

        http.Post("https://api.langbly.com/language/translate/v2", {
                contentType = "application/json",
                asTable = false,
                headers = {
                        ["Content-Type"] = "application/json",
                        ["X-API-Key"] = var_8_1
                },
                data = var_8_0
        }, function(arg_9_0, arg_9_1, arg_9_2)
                if arg_9_0 ~= 200 then
                        local var_9_0 = {
                                success = false,
                                status = arg_9_0,
                                error = {
                                        code = "HTTP_" .. tostring(arg_9_0),
                                        message = "HTTP request failed with status " .. tostring(arg_9_0)
                                },
                                rawData = arg_9_1
                        }

                        if arg_9_1 and arg_9_1 ~= "" then
                                local var_9_1 = utils.JsonDecode(arg_9_1)

                                if var_9_1 then
                                        if var_9_1.error then
                                                var_9_0.error.code = var_9_1.error.code or var_9_0.error.code
                                                var_9_0.error.message = var_9_1.error.message or var_9_0.error.message
                                        elseif var_9_1.message then
                                                var_9_0.error.message = var_9_1.message
                                        end

                                        var_9_0.parsedError = var_9_1
                                end
                        end

                        arg_8_1(false, var_9_0)

                        return
                end

                if not arg_9_1 or arg_9_1 == "" then
                        arg_8_1(false, {
                                success = false,
                                status = arg_9_0,
                                error = {
                                        code = "EMPTY_RESPONSE",
                                        message = "Received empty response from API"
                                }
                        })

                        return
                end

                local var_9_2 = utils.JsonDecode(arg_9_1)

                if not var_9_2 then
                        arg_8_1(false, {
                                success = false,
                                status = arg_9_0,
                                error = {
                                        code = "INVALID_JSON",
                                        message = "Failed to parse API response as JSON"
                                },
                                rawData = arg_9_1
                        })

                        return
                end

                if var_9_2 and var_9_2.data and var_9_2.data.translations then
                        local var_9_3 = var_9_2.data.translations

                        if #var_9_3 > 0 then
                                local var_9_4 = var_9_3[1].translatedText
                                local var_9_5 = var_9_3[1].detectedSourceLanguage

                                arg_8_1(true, var_9_4, var_9_5)

                                return
                        else
                                arg_8_1(false, {
                                        success = false,
                                        status = arg_9_0,
                                        error = {
                                                code = "NO_TRANSLATIONS",
                                                message = "API returned no translations"
                                        },
                                        parsedData = var_9_2
                                })

                                return
                        end
                else
                        arg_8_1(false, {
                                success = false,
                                status = arg_9_0,
                                error = {
                                        code = "INVALID_RESPONSE_STRUCTURE",
                                        message = "API response missing expected structure"
                                },
                                parsedData = var_9_2
                        })

                        return
                end
        end)
end

slot_0_49_0 = {
        "the",
        "be",
        "to",
        "of",
        "and",
        "a",
        "in",
        "that",
        "have",
        "i",
        "it",
        "for",
        "not",
        "on",
        "with",
        "he",
        "as",
        "you",
        "do",
        "at",
        "this",
        "but",
        "his",
        "by",
        "from",
        "they",
        "we",
        "say",
        "her",
        "she",
        "or",
        "an",
        "will",
        "my",
        "one",
        "all",
        "would",
        "there",
        "their",
        "what",
        "so",
        "up",
        "out",
        "if",
        "about",
        "who",
        "get",
        "which",
        "go",
        "me",
        "when",
        "make",
        "can",
        "like",
        "time",
        "no",
        "just",
        "him",
        "know",
        "take",
        "people",
        "into",
        "year",
        "your",
        "good",
        "some",
        "could",
        "them",
        "see",
        "other",
        "than",
        "then",
        "now",
        "look",
        "only",
        "come",
        "its",
        "over",
        "think",
        "rush",
        "mid",
        "site",
        "bomb",
        "plant",
        "rotate",
        "short",
        "long",
        "help",
        "behind",
        "left",
        "right",
        "dead",
        "one",
        "two",
        "three",
        "go",
        "come",
        "here",
        "there",
        "fast",
        "slow",
        "nice",
        "good",
        "bad",
        "wait",
        "peek",
        "holding"
}
slot_0_50_0 = {}

for iter_0_0, iter_0_1 in ipairs(slot_0_49_0) do
        slot_0_50_0[iter_0_1] = true
end

function slot_0_51_0(arg_10_0)
        if not arg_10_0 or arg_10_0 == "" then
                return true
        end

        arg_10_0 = arg_10_0:lower()

        for iter_10_0 = 1, #arg_10_0 do
                if arg_10_0:byte(iter_10_0) > 127 then
                        return false
                end
        end

        local var_10_0 = {}

        for iter_10_1 in arg_10_0:gmatch("%a+") do
                table.insert(var_10_0, iter_10_1)
        end

        if #var_10_0 == 0 then
                return true
        end

        for iter_10_2, iter_10_3 in ipairs(var_10_0) do
                if not slot_0_50_0[iter_10_3] then
                        return false
                end
        end

        return true
end

function slot_0_52_0(arg_11_0)
        if arg_11_0:match("[А-Яа-яЁё]") then
                if arg_11_0:match("[ІіЇїЄєҐґ]") then
                        return "uk"
                end

                return "ru"
        end

        if arg_11_0:match("[\xE4-\xE9]") then
                return "zh"
        end

        if arg_11_0:match("[ぁ-んァ-ン]") then
                return "ja"
        end

        if arg_11_0:match("[가-힣]") then
                return "ko"
        end

        if arg_11_0:match("[؀-ۿ]") then
                return "ar"
        end

        if arg_11_0:match("[ก-๙]") then
                return "th"
        end

        if arg_11_0:match("[ऀ-ॿ]") then
                return "hi"
        end

        if arg_11_0:match("[ăâđêôơưĂÂĐÊÔƠƯ]") then
                return "vi"
        end

        if arg_11_0:match("[çğıöşüÇĞİÖŞÜ]") then
                return "tr"
        end

        if arg_11_0:match("[ąćęłńóśźżĄĆĘŁŃÓŚŹŻ]") then
                return "pl"
        end

        if arg_11_0:match("[éèêëàâîïôûùç]") then
                return "fr"
        end

        if arg_11_0:match("[äöüßÄÖÜ]") then
                return "de"
        end

        if arg_11_0:match("[ñ¿¡]") then
                return "es"
        end

        if arg_11_0:match("[ãõç]") then
                return "pt"
        end

        return "en"
end

function slot_0_53_0()
        if not slot_0_8_0 then
                return {}
        end

        local var_12_0 = panorama.Eval("        (function() {\n            var chatHistory = $.GetContextPanel().FindChildTraverse(\"ChatHistoryText\");\n            if (!chatHistory) {\n                return [];\n            }\n\n            var text = chatHistory.text || \"\";\n            var lines = text.split(\"\\n\");\n            var messages = [];\n\n            for (var i = 0; i < lines.length; i++) {\n                var line = lines[i];\n                if (line && line.length > 0) {\n                    messages.push(line);\n                }\n            }\n\n            return messages;\n        })()\n    ")
        local var_12_1 = {}

        if var_12_0 then
                local var_12_2 = #var_12_0

                for iter_12_0 = 1, var_12_2 do
                        local var_12_3 = var_12_0[iter_12_0]

                        if var_12_3 then
                                table.insert(var_12_1, tostring(var_12_3))
                        end
                end
        end

        return var_12_1
end

function slot_0_54_0(arg_13_0, arg_13_1)
        local var_13_0 = tostring(arg_13_0):gsub("%s+", "")

        if not slot_0_3_0[var_13_0] then
                slot_0_3_0[var_13_0] = true

                if arg_13_1 then
                        table.insert(slot_0_2_0, 1, arg_13_0)

                        if #slot_0_2_0 > 20 then
                                table.remove(slot_0_2_0)
                        end
                else
                        table.insert(slot_0_5_0, 1, arg_13_0)

                        if #slot_0_5_0 > slot_0_6_0 then
                                table.remove(slot_0_5_0)
                        end
                end

                local var_13_1 = 0

                for iter_13_0, iter_13_1 in pairs(slot_0_3_0) do
                        var_13_1 = var_13_1 + 1

                        if var_13_1 > slot_0_4_0 then
                                slot_0_3_0[iter_13_0] = nil
                        end
                end
        end
end

function slot_0_55_0()
        slot_0_2_0 = {}
        slot_0_5_0 = {}
        slot_0_3_0 = {}
        slot_0_7_0 = {}
end

function slot_0_56_0(arg_15_0, arg_15_1, arg_15_2, arg_15_3, arg_15_4)
        if (not arg_15_1 or arg_15_1 == "Unknown" or arg_15_1 == "") and (not arg_15_2 or arg_15_2 == "Unknown" or arg_15_2 == "") then
                print("[Translator] Skipping message with unknown channel and player: " .. arg_15_3)

                return
        end

        local var_15_0 = tostring(arg_15_0):gsub("%s+", "")

        if slot_0_3_0[var_15_0] then
                return
        end

        print("[Translator] Message needs translation to English")
        print("[Translator] Original: " .. arg_15_3)

        local var_15_1 = var_15_0

        slot_0_7_0[var_15_1] = {
                channel = arg_15_1 or "Unknown",
                player = arg_15_2 or "Unknown",
                original = arg_15_3
        }

        slot_0_54_0(arg_15_0, false)
        slot_0_48_0(arg_15_3, function(arg_16_0, arg_16_1, arg_16_2)
                slot_0_7_0[var_15_1] = nil

                if arg_16_0 then
                        if arg_16_2 and arg_16_2 == "en" then
                                -- block empty
                        else
                                local var_16_0 = slot_0_12_0[arg_16_2] or arg_16_2:upper()

                                print("[Translator] Translated from " .. var_16_0 .. ": " .. arg_16_1)

                                local var_16_1 = string.format("[%s] [%s] %s: %s", var_16_0, arg_15_1, arg_15_2, arg_16_1)

                                slot_0_54_0(var_16_1, true)
                        end
                else
                        local var_16_2 = arg_16_1

                        slot_0_13_0("Translator", "HTTP request failed (" .. tostring(var_16_2.error.code) .. "): " .. tostring(var_16_2.error.message))
                end
        end)
end

function slot_0_57_0()
        slot_0_8_0 = game.engine:InGame()

        if slot_0_8_0 then
                local var_17_0 = slot_0_53_0()

                if var_17_0 and #var_17_0 > 0 then
                        for iter_17_0, iter_17_1 in ipairs(var_17_0) do
                                local var_17_1, var_17_2, var_17_3 = string.match(iter_17_1, "^%[([^%]]+)%]%s*([^:]+):%s*(.+)$")

                                if not var_17_3 then
                                        var_17_3 = iter_17_1
                                        var_17_1 = nil
                                        var_17_2 = nil
                                end

                                if var_17_2 then
                                        var_17_2 = slot_0_47_0(var_17_2)
                                else
                                        var_17_2 = "Unknown"
                                end

                                var_17_1 = var_17_1 or "Unknown"

                                if var_17_3 and not slot_0_51_0(var_17_3) then
                                        slot_0_56_0(iter_17_1, var_17_1, var_17_2, var_17_3, "detectedLang")
                                end
                        end
                end
        else
                if slot_0_10_0 then
                        slot_0_10_0:Stop()

                        slot_0_10_0 = nil
                end

                slot_0_9_0 = false

                slot_0_55_0()
                print("[Translator] Not in game, monitoring stopped")

                return
        end

        if slot_0_9_0 and slot_0_0_0.enabled then
                slot_0_10_0 = Delay(1, slot_0_57_0)
        end
end

function slot_0_58_0()
        if slot_0_0_0.enabled and not slot_0_9_0 then
                slot_0_8_0 = game.engine:InGame()

                if slot_0_8_0 then
                        slot_0_9_0 = true

                        print("[Translator] Started game state monitoring")
                        slot_0_57_0()
                else
                        print("[Translator] Not in game, waiting for map load...")
                end
        elseif not slot_0_0_0.enabled and slot_0_9_0 then
                if slot_0_10_0 then
                        slot_0_10_0:Stop()

                        slot_0_10_0 = nil
                end

                slot_0_9_0 = false

                slot_0_55_0()
                print("[Translator] Stopped game state monitoring")
        end
end

slot_0_20_0:AddCallback(function()
        slot_0_0_0.enabled = slot_0_20_0:GetValue():Get()

        if slot_0_0_0.enabled then
                if slot_0_0_0.apiKeyWorking then
                        slot_0_58_0()
                else
                        slot_0_13_0("Translator", "You must add a working API key and test it before enabling.")

                        slot_0_0_0.enabled = false

                        slot_0_20_0:SetValue(false)
                end
        end

        slot_0_14_0()
end)
slot_0_30_0:AddCallback(function()
        slot_0_0_0.apiKey = slot_0_24_0.value

        slot_0_48_0("Hi", function(arg_21_0, arg_21_1, arg_21_2)
                if arg_21_0 then
                        slot_0_13_0("Translator", "API Key is valid, you can now enable the script")

                        slot_0_0_0.apiKeyWorking = true

                        slot_0_22_0:SetValue(false)
                        slot_0_25_0:SetVisible(false)
                        slot_0_27_0:SetVisible(false)
                        slot_0_33_0:SetVisible(false)
                        slot_0_29_0:SetVisible(false)
                        slot_0_31_0:SetVisible(false)
                        slot_0_19_0:SetDimensions(slot_0_19_0.pos, draw.Vec2(slot_0_19_0.size.x, 220))
                else
                        local var_21_0 = arg_21_1

                        if var_21_0.error.code == 401 then
                                slot_0_13_0("Translator", "API Key is not valid")
                        else
                                slot_0_13_0("Translator", "HTTP request failed (" .. tostring(var_21_0.error.code) .. "): " .. tostring(var_21_0.error.message))
                        end

                        slot_0_0_0.apiKeyWorking = false
                end
        end)
        slot_0_14_0()
end)
slot_0_22_0:AddCallback(function()
        slot_0_0_0.show_api_controls = slot_0_22_0:GetValue():Get()

        slot_0_14_0()

        if slot_0_0_0.show_api_controls then
                slot_0_25_0:SetVisible(true)
                slot_0_27_0:SetVisible(true)
                slot_0_33_0:SetVisible(true)
                slot_0_29_0:SetVisible(true)
                slot_0_31_0:SetVisible(true)
                slot_0_19_0:SetDimensions(slot_0_19_0.pos, draw.Vec2(slot_0_19_0.size.x, 370))
        else
                slot_0_25_0:SetVisible(false)
                slot_0_27_0:SetVisible(false)
                slot_0_33_0:SetVisible(false)
                slot_0_29_0:SetVisible(false)
                slot_0_31_0:SetVisible(false)
                slot_0_19_0:SetDimensions(slot_0_19_0.pos, draw.Vec2(slot_0_19_0.size.x, 220))
        end
end)
slot_0_24_0:AddCallback(function()
        slot_0_0_0.apiKey = slot_0_24_0.value

        slot_0_14_0()
end)
slot_0_28_0:AddCallback(function()
        slot_0_0_0.apiKey = slot_0_24_0.value

        slot_0_14_0()
end)
slot_0_26_0:AddCallback(function()
        local var_25_0 = utils.ClipboardGet()

        slot_0_24_0:SetValue(var_25_0 or "Data Invalid")
end)
slot_0_32_0:AddCallback(function()
        panorama.Eval("SteamOverlayAPI.OpenExternalBrowserURL(\"https://langbly.com/signup\")")
end)
slot_0_34_0:AddCallback(function()
        slot_0_0_0.width = slot_0_34_0:GetValue():Get()

        slot_0_14_0()
end)
slot_0_36_0:AddCallback(function()
        slot_0_0_0.height = slot_0_36_0:GetValue():Get()

        slot_0_14_0()
end)
slot_0_38_0:AddCallback(function()
        slot_0_0_0.x = slot_0_38_0:GetValue():Get()

        slot_0_14_0()
end)
slot_0_40_0:AddCallback(function()
        slot_0_0_0.y = slot_0_40_0:GetValue():Get()

        slot_0_14_0()
end)
slot_0_42_0:AddCallback(function()
        slot_0_0_0.bgOpacity = slot_0_42_0:GetValue():Get()

        slot_0_14_0()
end)
events.event:add(function(arg_32_0)
        if not slot_0_0_0.enabled then
                return
        end

        local var_32_0 = arg_32_0:get_name()

        if var_32_0 == "map_shutdown" then
                print("[Translator] Map shutting down, stopping monitoring...")

                if slot_0_10_0 then
                        slot_0_10_0:Stop()

                        slot_0_10_0 = nil
                end

                slot_0_9_0 = false
                slot_0_8_0 = false

                slot_0_55_0()
        elseif var_32_0 == "player_connect_full" then
                print("[Translator] Player connected, starting monitoring...")
                Delay(2, function()
                        if slot_0_0_0.enabled then
                                slot_0_8_0 = game.engine:InGame()

                                if slot_0_8_0 and not slot_0_9_0 then
                                        slot_0_58_0()
                                end
                        end
                end)
        end
end)

if slot_0_0_0.enabled then
        slot_0_58_0()
end

function __shutdown()
        slot_0_14_0()
end

print("[Translator] Script loaded - Will show automatically when in game")
