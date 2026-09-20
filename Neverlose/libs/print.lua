local reloaded_0_0 = require("neverlose/inspect")
local reloaded_0_1 = {
	object = {
		inspect = true,
		prefix = "\a4A69FFFF[neverlose]\aDEFAULT ",
		between = ", "
	}
}

function reloaded_0_1.executer(...)
	local reloaded_1_0 = ({
		...
	})[1]

	if type(reloaded_1_0) == "table" and (reloaded_1_0.Prefix ~= nil or reloaded_1_0.prefix ~= nil or reloaded_1_0.Inspect ~= nil or reloaded_1_0.inspect ~= nil or reloaded_1_0.Between ~= nil or reloaded_1_0.between ~= nil) then
		if reloaded_1_0.Prefix ~= nil or reloaded_1_0.prefix ~= nil then
			reloaded_0_1.object.prefix = reloaded_1_0.Prefix or reloaded_1_0.prefix
		end

		if reloaded_1_0.Inspect ~= nil or reloaded_1_0.inspect ~= nil then
			reloaded_0_1.object.inspect = reloaded_1_0.Inspect or reloaded_1_0.inspect
		end

		if reloaded_1_0.Between ~= nil or reloaded_1_0.between ~= nil then
			reloaded_0_1.object.between = reloaded_1_0.Between or reloaded_1_0.between
		end

		return
	end

	local reloaded_1_1 = {
		result = "",
		args = {
			length = select("#", ...),
			...
		}
	}

	for iter_1_0 = 1, reloaded_1_1.args.length do
		local reloaded_1_2 = reloaded_1_1.args[iter_1_0]

		if type(reloaded_1_2) == "table" and reloaded_0_1.object.inspect then
			reloaded_1_1.result = ("%s%s%s"):format(reloaded_1_1.result, reloaded_0_1.object.between, reloaded_0_0(reloaded_1_2))
		else
			reloaded_1_1.result = ("%s%s%s"):format(reloaded_1_1.result, reloaded_0_1.object.between, tostring(reloaded_1_2))
		end
	end

	print_raw(reloaded_0_1.object.prefix .. reloaded_1_1.result:sub(string.len(reloaded_0_1.object.between) + 1))
end

return reloaded_0_1.executer
