function encode(message)
    local encoded = ""
    for i = 1, #message do
        local char = message:sub(i, i)
        local charCode = string.byte(char)
        local shiftedCode = charCode + 12
        local encodedChar = string.char(shiftedCode)
        encoded = encoded .. encodedChar
    end
    return encoded
end

function decode(encoded)
    local decoded = ""
    for i = 1, #encoded do
        local char = encoded:sub(i, i)
        local charCode = string.byte(char)
        local shiftedCode = charCode - 12
        local decodedChar = string.char(shiftedCode)
        decoded = decoded .. decodedChar
    end
    
    return decoded
end

return {
	encode = encode,
	decode = decode
}