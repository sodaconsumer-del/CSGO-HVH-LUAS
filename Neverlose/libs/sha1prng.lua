local shalib = require("neverlose/sha1")
local sha1 = shalib.sha1
local SHA1PRNG = {}
SHA1PRNG.__index = SHA1PRNG


function SHA1PRNG.new(seed)
    local instance = setmetatable({}, SHA1PRNG)
    instance.seed = seed
    instance.state = sha1(seed) 
    instance.counter = 0
    return instance
end

function SHA1PRNG:nextInt()
    self.counter = self.counter + 1                                   
    local inputData = self.seed .. string.format("%08x", self.counter) 
    local hashValue = sha1(inputData)
    local randomInt = 0

    for i = 1, 8 do
        randomInt = randomInt * 16 + tonumber(hashValue:sub(i, i), 16)
    end
    return randomInt
end


function SHA1PRNG:nextByte(numBytes)
    self.state = sha1(self.state)     
    return self.state:sub(1, numBytes) 
end

return SHA1PRNG
