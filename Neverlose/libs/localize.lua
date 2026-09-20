local reloaded_0_0 = panorama.loadstring("\treturn {\n\t\tlocalize: (str, params) => {\n\t\t\tif(params == null)\n\t\t\t\treturn $.Localize(str)\n\n\t\t\tlet panel = $.CreatePanel(\"Panel\", $.GetContextPanel(), \"\")\n\t\t\tfor(key in params) {\n\t\t\t\tpanel.SetDialogVariable(key, params[key])\n\t\t\t}\n\n\t\t\tlet result = $.Localize(str, panel)\n\n\t\t\tpanel.DeleteAsync(0.0)\n\t\t\treturn result\n\t\t},\n\t\tlanguage: $.Language\n\t}\n")()
local reloaded_0_1 = {}

local function reloaded_0_2(arg_1_0, arg_1_1)
	if arg_1_0 == nil then
		return ""
	end

	if reloaded_0_1[arg_1_0] == nil then
		reloaded_0_1[arg_1_0] = {}
	end

	local reloaded_1_0 = arg_1_1 ~= nil and json.stringify(arg_1_1) or true

	if reloaded_0_1[arg_1_0][reloaded_1_0] == nil then
		reloaded_0_1[arg_1_0][reloaded_1_0] = reloaded_0_0.localize(arg_1_0, arg_1_1)
	end

	return reloaded_0_1[arg_1_0][reloaded_1_0]
end

return setmetatable({
	localize = reloaded_0_2,
	language = reloaded_0_0.language
}, {
	__call = function(arg_2_0, ...)
		return reloaded_0_2(...)
	end
})
