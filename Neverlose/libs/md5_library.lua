local md5 = {}
local little_endian_to_string = function(id)
    local convert = function(word)
        return string.char(bit.band(bit.rshift(id, word), 255))
    end
    return convert(0) .. convert(8) .. convert(16) .. convert(24)
end

local string_to_big_endian = function(word)
    local counter = 0
    for id = 1, #word do
        counter = counter * 256 + string.byte(word, id)
    end

    return counter
end

local string_to_little_endian = function(word)
    local counter = 0
    for id = #word, 1, -1 do
        counter = counter * 256 + string.byte(word, id)
    end

    return counter
end

local string_to_endian_array = function(word, ...)
    local cache = {}
    local counter = 1
    local arguments = {...}

	for id = 1, #arguments do
		table.insert(cache, string_to_little_endian(string.sub(word, counter, counter + arguments[id] - 1)))
		counter = counter + arguments[id]
	end
    
	return cache
end

local const_data = {
	0xd76aa478, 0xe8c7b756, 0x242070db, 0xc1bdceee,
	0xf57c0faf, 0x4787c62a, 0xa8304613, 0xfd469501,
	0x698098d8, 0x8b44f7af, 0xffff5bb1, 0x895cd7be,
	0x6b901122, 0xfd987193, 0xa679438e, 0x49b40821,
	0xf61e2562, 0xc040b340, 0x265e5a51, 0xe9b6c7aa,
	0xd62f105d, 0x02441453, 0xd8a1e681, 0xe7d3fbc8,
	0x21e1cde6, 0xc33707d6, 0xf4d50d87, 0x455a14ed,
	0xa9e3e905, 0xfcefa3f8, 0x676f02d9, 0x8d2a4c8a,
	0xfffa3942, 0x8771f681, 0x6d9d6122, 0xfde5380c,
	0xa4beea44, 0x4bdecfa9, 0xf6bb4b60, 0xbebfbc70,
	0x289b7ec6, 0xeaa127fa, 0xd4ef3085, 0x04881d05,
	0xd9d4d039, 0xe6db99e5, 0x1fa27cf8, 0xc4ac5665,
	0xf4292244, 0x432aff97, 0xab9423a7, 0xfc93a039,
	0x655b59c3, 0x8f0ccc92, 0xffeff47d, 0x85845dd1,
	0x6fa87e4f, 0xfe2ce6e0, 0xa3014314, 0x4e0811a1,
	0xf7537e82, 0xbd3af235, 0x2ad7d2bb, 0xeb86d391,
	0x67452301, 0xefcdab89, 0x98badcfe, 0x10325476
}

local transform_functions = {
    [1] = function(x, y, z)
        return bit.bor(bit.band(x, y), bit.band(-x - 1, z))
    end,

    [2] = function(x, y, z)
        return bit.bor(bit.band(x, z), bit.band(y, -z - 1)) 
    end,

    [3] = function(x, y, z)
        return bit.bxor(x, bit.bxor(y, z))
    end,

    [4] = function(x, y, z)
        return bit.bxor(y, bit.bor(x, -z - 1))
    end,

    [5] = function(fn, a, b, c, d, x, word, id)
        a = bit.band(a + fn(b, c, d) + x + id, 0xFFFFFFFF)
        return bit.bor(bit.lshift(bit.band(a, bit.rshift(0xFFFFFFFF, word)), word), bit.rshift(a, 32 - word)) + b
    end
}

local function transform(a, b, c, d, x)
	local A, B, C, D = a, b, c, d

	A = transform_functions[5](transform_functions[1], A, B, C, D, x[0], 7, const_data[1])
	D = transform_functions[5](transform_functions[1], D, A, B, C, x[1], 12, const_data[2])
	C = transform_functions[5](transform_functions[1], C, D, A, B, x[2], 17, const_data[3])
	B = transform_functions[5](transform_functions[1], B, C, D, A, x[3], 22, const_data[4])
	A = transform_functions[5](transform_functions[1], A, B, C, D, x[4], 7, const_data[5])
	D = transform_functions[5](transform_functions[1], D, A, B, C, x[5], 12, const_data[6])
	C = transform_functions[5](transform_functions[1], C, D, A, B, x[6], 17, const_data[7])
	B = transform_functions[5](transform_functions[1], B, C, D, A, x[7], 22, const_data[8])
	A = transform_functions[5](transform_functions[1], A, B, C, D, x[8], 7, const_data[9])
	D = transform_functions[5](transform_functions[1], D, A, B, C, x[9], 12, const_data[10])
	C = transform_functions[5](transform_functions[1], C, D, A, B, x[10], 17, const_data[11])
	B = transform_functions[5](transform_functions[1], B, C, D, A, x[11], 22, const_data[12])
	A = transform_functions[5](transform_functions[1], A, B, C, D, x[12], 7, const_data[13])
	D = transform_functions[5](transform_functions[1], D, A, B, C, x[13], 12, const_data[14])
	C = transform_functions[5](transform_functions[1], C, D, A, B, x[14], 17, const_data[15])
	B = transform_functions[5](transform_functions[1], B, C, D, A, x[15], 22, const_data[16])

	A = transform_functions[5](transform_functions[2], A, B, C, D, x[1], 5, const_data[17])
	D = transform_functions[5](transform_functions[2], D, A, B, C, x[6], 9, const_data[18])
	C = transform_functions[5](transform_functions[2], C, D, A, B, x[11], 14, const_data[19])
	B = transform_functions[5](transform_functions[2], B, C, D, A, x[0], 20, const_data[20])
	A = transform_functions[5](transform_functions[2], A, B, C, D, x[5], 5, const_data[21])
	D = transform_functions[5](transform_functions[2], D, A, B, C, x[10], 9, const_data[22])
	C = transform_functions[5](transform_functions[2], C, D, A, B, x[15], 14, const_data[23])
	B = transform_functions[5](transform_functions[2], B, C, D, A, x[4], 20, const_data[24])
	A = transform_functions[5](transform_functions[2], A, B, C, D, x[9], 5, const_data[25])
	D = transform_functions[5](transform_functions[2], D, A, B, C, x[14], 9, const_data[26])
	C = transform_functions[5](transform_functions[2], C, D, A, B, x[3], 14, const_data[27])
	B = transform_functions[5](transform_functions[2], B, C, D, A, x[8], 20, const_data[28])
	A = transform_functions[5](transform_functions[2], A, B, C, D, x[13], 5, const_data[29])
	D = transform_functions[5](transform_functions[2], D, A, B, C, x[2], 9, const_data[30])
	C = transform_functions[5](transform_functions[2], C, D, A, B, x[7], 14, const_data[31])
	B = transform_functions[5](transform_functions[2], B, C, D, A, x[12], 20, const_data[32])

	A = transform_functions[5](transform_functions[3], A, B, C, D, x[5], 4, const_data[33])
	D = transform_functions[5](transform_functions[3], D, A, B, C, x[8], 11, const_data[34])
	C = transform_functions[5](transform_functions[3], C, D, A, B, x[11], 16, const_data[35])
	B = transform_functions[5](transform_functions[3], B, C, D, A, x[14], 23, const_data[36])
	A = transform_functions[5](transform_functions[3], A, B, C, D, x[1], 4, const_data[37])
	D = transform_functions[5](transform_functions[3], D, A, B, C, x[4], 11, const_data[38])
	C = transform_functions[5](transform_functions[3], C, D, A, B, x[7], 16, const_data[39])
	B = transform_functions[5](transform_functions[3], B, C, D, A, x[10], 23, const_data[40])
	A = transform_functions[5](transform_functions[3], A, B, C, D, x[13], 4, const_data[41])
	D = transform_functions[5](transform_functions[3], D, A, B, C, x[0], 11, const_data[42])
	C = transform_functions[5](transform_functions[3], C, D, A, B, x[3], 16, const_data[43])
	B = transform_functions[5](transform_functions[3], B, C, D, A, x[6], 23, const_data[44])
	A = transform_functions[5](transform_functions[3], A, B, C, D, x[9], 4, const_data[45])
	D = transform_functions[5](transform_functions[3], D, A, B, C, x[12], 11, const_data[46])
	C = transform_functions[5](transform_functions[3], C, D, A, B, x[15], 16, const_data[47])
	B = transform_functions[5](transform_functions[3], B, C, D, A, x[2], 23, const_data[48])

	A = transform_functions[5](transform_functions[4], A, B, C, D, x[0], 6, const_data[49])
	D = transform_functions[5](transform_functions[4], D, A, B, C, x[7], 10, const_data[50])
	C = transform_functions[5](transform_functions[4], C, D, A, B, x[14], 15, const_data[51])
	B = transform_functions[5](transform_functions[4], B, C, D, A, x[5], 21, const_data[52])
	A = transform_functions[5](transform_functions[4], A, B, C, D, x[12], 6, const_data[53])
	D = transform_functions[5](transform_functions[4], D, A, B, C, x[3], 10, const_data[54])
	C = transform_functions[5](transform_functions[4], C, D, A, B, x[10], 15, const_data[55])
	B = transform_functions[5](transform_functions[4], B, C, D, A, x[1], 21, const_data[56])
	A = transform_functions[5](transform_functions[4], A, B, C, D, x[8], 6, const_data[57])
	D = transform_functions[5](transform_functions[4], D, A, B, C, x[15], 10, const_data[58])
	C = transform_functions[5](transform_functions[4], C, D, A, B, x[6], 15, const_data[59])
	B = transform_functions[5](transform_functions[4], B, C, D, A, x[13], 21, const_data[60])
	A = transform_functions[5](transform_functions[4], A, B, C, D, x[4], 6, const_data[61])
	D = transform_functions[5](transform_functions[4], D, A, B, C, x[11], 10, const_data[62])
	C = transform_functions[5](transform_functions[4], C, D, A, B, x[2], 15, const_data[63])
	B = transform_functions[5](transform_functions[4], B, C, D, A, x[9], 21, const_data[64])

    return bit.band(a + A, 0xFFFFFFFF), bit.band(b + B, 0xFFFFFFFF), bit.band(c + C, 0xFFFFFFFF), bit.band(d + D, 0xFFFFFFFF)
end

local update_m5 = function(self, word)
	self.position = self.position + #word
	word = self.buffer .. word
	
	for id = 1, #word - 63, 64 do
		local x = string_to_endian_array(string.sub(word, id, id + 63), 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4)
		assert(#x == 16)

		x[0] = table.remove(x, 1)
		self.a, self.b, self.c, self.d = transform(self.a, self.b, self.c, self.d, x)
	end

	self.buffer = string.sub(word, math.floor(#word / 64) * 64 + 1, #word)
	return self
end

local finish_mp5 = function(self)
	local length = self.position
	local padding = 56 - length % 64

	if length % 64 > 56 then 
        padding = padding + 64 
    end

	if padding == 0 then 
        padding = 64
    end

	local word = string.char(128) .. string.rep(string.char(0), padding - 1) .. little_endian_to_string(bit.band(8 * length, 0xFFFFFFFF)) .. little_endian_to_string(math.floor(length / 0x20000000))
	update_m5(self, word)

	assert(self.position % 64 == 0)
	return little_endian_to_string(self.a) .. little_endian_to_string(self.b) .. little_endian_to_string(self.c) .. little_endian_to_string(self.d)
end

md5.new = function()
	return {
        a = const_data[65],
        b = const_data[66], 
        c = const_data[67], 
        d = const_data[68],

        buffer = "",
        position = 0,

		update = update_m5,
		finish = finish_mp5
    }
end

md5.to_hex = function(word)
	return string.format("%08x%08x%08x%08x", string_to_big_endian(string.sub(word, 1, 4)), string_to_big_endian(string.sub(word, 5, 8)), string_to_big_endian(string.sub(word, 9, 12)), string_to_big_endian(string.sub(word, 13, 16)))
end

md5.sum = function(word)
	return md5.new():update(word):finish()
end

md5.sum_hex = function(word)
	return md5.to_hex(md5.sum(word))
end

return md5