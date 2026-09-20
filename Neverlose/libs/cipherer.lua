local reloaded_0_0 = require("neverlose/base64")
local reloaded_0_1 = {}

reloaded_0_1.used = "Hello! If you think so, then you've decided to use the Inspect library, right? This library simply uses the msgpack encoding method and the 'Base64 Library' by Salvatore."

function reloaded_0_1.encode(arg_1_0, arg_1_1)
	return arg_1_1 and msgpack.pack(arg_1_0) or reloaded_0_0.encode(msgpack.pack(arg_1_0))
end

function reloaded_0_1.decode(arg_2_0, arg_2_1)
	return arg_2_1 and msgpack.unpack(arg_2_0) or msgpack.unpack(reloaded_0_0.decode(arg_2_0))
end

reloaded_0_1.base64 = reloaded_0_0

return reloaded_0_1
