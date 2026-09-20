-- [[ Vector - functions
vec4d = {x=0,y=0,w=0,h=0,type="vector4d"}
vec4d_hookpos = nil

vector_meta = {
    __add = function(v1, v2)
        return vector(v1.x + v2.x, v1.y + v2.y)
    end,

    __sub = function(v1, v2)
        return vector(v1.x - v2.x, v1.y - v2.y)
    end,

    __mul = function(v1, v2)
        return vector(v1.x * v2.x, v1.y * v2.y)
    end,

    __div = function(v1, v2)
        return vector(v1.x / v2.x, v1.y / v2.y)
    end,
     
    __tostring = function(v)
        return string.format("x = %s, y = %s, w = %s, h = %s", v.x, v.y, v.w, v.h)
    end
}

function vec4d:new(x,y,w,h)
    self.__index = self

    if type(vector) == "vector" then 
        v4d = {x=x.x,y=x.y,w=y.x,h=y.y,type="vector4d"}
    else
        v4d = {x=x,y=y,w=w,h=h,type="vector4d"}
    end

    if x == nil then 
        v4d.x = self.x ~= nil and self.x or 0 
    end
    
    if y == nil then 
        v4d.y = self.y ~= nil and self.y or 0 
    end
    
    if w == nil then 
        v4d.w = self.w ~= nil and self.w or 0 
    end
    
    if h == nil then 
        v4d.h = self.h ~= nil and self.h or 0 
    end

    if vec4d_hookpos ~= nil then 
        v4d.x = vec4d_hookpos.x 
        v4d.y = vec4d_hookpos.y
    end

    setmetatable(v4d, vector_meta)
    return v4d 
end

function vec4d:pos(Vector)
    return Vector ~= nil and {x=Vector.x,y=Vector.y} or {x=self.x,y=self.y}
end

function vec4d:size(Vector)
    return Vector ~= nil and {x=Vector.x,y=Vector.y} or {x=self.w,y=self.h}
end

function vec4d:hookpos(x,y) 
    vec4d_hookpos = vector(x,y)
end

function vec4d:endhook(x,y) 
    vec4d_hookpos = nil
end
-- ]]

Circuit = {
    Math = { 
        Clamp = function(value, minimum, maximum)
            return math.min(math.max(value, minimum), maximum)
        end,

        Resolve = function()
            if val % 1 < 0.0001 then
                return math.floor(val)
            else
                return math.ceil(val)
            end
        end,
    },

    Easing = {
        linear = function(time, beginValue, endValue, duration)
            return (endValue - beginValue) * time / duration + beginValue
        end,
        
        quad_in = function(time, beginValue, endValue, duration)
            time = time / duration
            return (endValue - beginValue) * time * time + beginValue
        end,
        
        quad_out = function(time, beginValue, endValue, duration)
            time = time / duration
            return -(endValue - beginValue) * time * (time - 2) + beginValue
        end,
        
        quad_in_out = function(time, beginValue, endValue, duration)
            time = time / (duration / 2)
            if time < 1 then
                return (endValue - beginValue) / 2 * time * time + beginValue
            else
                time = time - 1
                return -(endValue - beginValue) / 2 * (time * (time - 2) - 1) + beginValue
            end
        end,
        
        quad_out_in = function(time, beginValue, endValue, duration)
            if time < duration / 2 then
                return Circuit.Easing.quad_out(time * 2, beginValue, endValue, duration) 
            else
                return Circuit.Easing.quad_in((time * 2) - duration, beginValue + (endValue - beginValue) / 2, endValue, duration) 
            end
        end,
        
        cubic_in = function(time, beginValue, endValue, duration)
            time = time / duration
            return (endValue - beginValue) * time * time * time + beginValue
        end,
        
        cubic_out = function(time, beginValue, endValue, duration)
            time = time / duration - 1
            return (endValue - beginValue) * (time * time * time + 1) + beginValue
        end,
        
        cubic_in_out = function(time, beginValue, endValue, duration)
            time = time / (duration / 2)
            if time < 1 then
                return (endValue - beginValue) / 2 * time * time * time + beginValue
            else
                time = time - 2
                return (endValue - beginValue) / 2 * (time * time * time + 2) + beginValue
            end
        end,
        
        cubic_out_in = function(time, beginValue, endValue, duration)
            if time < duration / 2 then
                return Circuit.Easing.cubic_out(time * 2, beginValue, endValue, duration) 
            else
                return Circuit.Easing.cubic_in((time * 2) - duration, beginValue + (endValue - beginValue) / 2, endValue, duration) 
            end
        end,
        
        quart_in = function(time, beginValue, endValue, duration)
            time = time / duration
            return (endValue - beginValue) * time * time * time * time + beginValue
        end,
        
        quart_out = function(time, beginValue, endValue, duration)
            time = time / duration - 1
            return -(endValue - beginValue) * (time * time * time * time - 1) + beginValue
        end,
        
        quart_in_out = function(time, beginValue, endValue, duration)
            time = time / (duration / 2)
            if time < 1 then
                return (endValue - beginValue) / 2 * time * time * time * time + beginValue
            else
                time = time - 2
                return -(endValue - beginValue) / 2 * (time * time * time * time - 2) + beginValue
            end
        end,
        
        quart_out_in = function(time, beginValue, endValue, duration)
            if time < duration / 2 then
                return Circuit.Easing.quart_out(time * 2, beginValue, endValue, duration) 
            else
                return Circuit.Easing.quart_in((time * 2) - duration, beginValue + (endValue - beginValue) / 2, endValue, duration) 
            end
        end,
        
        quint_in = function(time, beginValue, endValue, duration)
            time = time / duration
            return (endValue - beginValue) * time * time * time * time * time + beginValue
        end,
        
        quint_out = function(time, beginValue, endValue, duration)
            time = time / duration - 1
            return (endValue - beginValue) * (time * time * time * time * time + 1) + beginValue
        end,
        
        quint_in_out = function(time, beginValue, endValue, duration)
            time = time / (duration / 2)
            if time < 1 then
                return (endValue - beginValue) / 2 * time * time * time * time * time + beginValue
            else
                time = time - 2
                return (endValue - beginValue) / 2 * (time * time * time * time * time + 2) + beginValue
            end
        end,
        
        quint_out_in = function(time, beginValue, endValue, duration)
            if time < duration / 2 then
                return Circuit.Easing.quint_out(time * 2, beginValue, endValue, duration) 
            else
                return Circuit.Easing.quint_in((time * 2) - duration, beginValue + (endValue - beginValue) / 2, endValue, duration) 
            end
        end,
        
        sine_in = function(time, beginValue, endValue, duration)
            return -(endValue - beginValue) * math.cos(time / duration * (math.pi / 2)) + (endValue - beginValue) + beginValue
        end,
        
        sine_out = function(time, beginValue, endValue, duration)
            return (endValue - beginValue) * math.sin(time / duration * (math.pi / 2)) + beginValue
        end,
        
        sine_in_out = function(time, beginValue, endValue, duration)
            return -(endValue - beginValue) / 2 * (math.cos(math.pi * time / duration) - 1) + beginValue
        end,
        
        sine_out_in = function(time, beginValue, endValue, duration)
            if time < duration / 2 then
                return Circuit.Easing.sine_out(time * 2, beginValue, endValue, duration) 
            else
                return Circuit.Easing.sine_in((time * 2) - duration, beginValue + (endValue - beginValue) / 2, endValue, duration) 
            end
        end,
        
        expo_in = function(time, beginValue, endValue, duration)
            return (endValue - beginValue) * math.pow(2, 10 * (time / duration - 1)) + beginValue
        end,
        
        expo_out = function(time, beginValue, endValue, duration)
            return (endValue - beginValue) * (-math.pow(2, -10 * time / duration) + 1) + beginValue
        end,
        
        expo_in_out = function(time, beginValue, endValue, duration)
            time = time / (duration / 2)
            if time < 1 then
                return (endValue - beginValue) / 2 * math.pow(2, 10 * (time - 1)) + beginValue
            else
                time = time - 1
                return (endValue - beginValue) / 2 * (-math.pow(2, -10 * time) + 2) + beginValue
            end
        end,
        
        expo_out_in = function(time, beginValue, endValue, duration)
            if time < duration / 2 then
                return Circuit.Easing.expo_out(time * 2, beginValue, endValue, duration) 
            else
                return Circuit.Easing.expo_in((time * 2) - duration, beginValue + (endValue - beginValue) / 2, endValue, duration) 
            end
        end,
        
        circ_in = function(time, beginValue, endValue, duration)
            time = time / duration
            return -(endValue - beginValue) * (math.sqrt(1 - time * time) - 1) + beginValue
        end,
        
        circ_out = function(time, beginValue, endValue, duration)
            time = time / duration - 1
            return (endValue - beginValue) * math.sqrt(1 - time * time) + beginValue
        end,
        
        circ_in_out = function(time, beginValue, endValue, duration)
            time = time / (duration / 2)
            if time < 1 then
                return -(endValue - beginValue) / 2 * (math.sqrt(1 - time * time) - 1) + beginValue
            else
                time = time - 2
                return (endValue - beginValue) / 2 * (math.sqrt(1 - time * time) + 1) + beginValue
            end
        end,
        
        circ_out_in = function(time, beginValue, endValue, duration)
            if time < duration / 2 then
                return Circuit.Easing.circ_out(time * 2, beginValue, endValue, duration) 
            else
                return Circuit.Easing.circ_in((time * 2) - duration, beginValue + (endValue - beginValue) / 2, endValue, duration) 
            end
        end,
        
        elastic_in = function(time, beginValue, endValue, duration)
            local s = 1.70158
            local p = 0
            local a = (endValue - beginValue)
            if time == 0 then return beginValue end
            time = time / duration
            if time == 1 then return beginValue + a end
            if not p then p = duration * 0.3 end
            if not a or a < math.abs(a) then
                a = endValue - beginValue
                s = p / 4
            else
                s = p / (2 * math.pi) * math.asin(a / (endValue - beginValue))
            end
            time = time - 1
            return -(a * math.pow(2, 10 * time) * math.sin((time * duration - s) * (2 * math.pi) / p)) + beginValue
        end,
        
        elastic_out = function(time, beginValue, endValue, duration)
            local s = 1.70158
            local p = 0
            local a = (endValue - beginValue)
            if time == 0 then return beginValue end
            time = time / duration
            if time == 1 then return beginValue + a end
            if not p then p = duration * 0.3 end
            if not a or a < math.abs(a) then
                a = endValue - beginValue
                s = p / 4
            else
                s = p / (2 * math.pi) * math.asin(a / (endValue - beginValue))
            end
            return a * math.pow(2, -10 * time) * math.sin((time * duration - s) * (2 * math.pi) / p) + (endValue - beginValue) + beginValue
        end,
        
        elastic_in_out = function(time, beginValue, endValue, duration)
            local s = 1.70158
            local p = 0
            local a = (endValue - beginValue)
            if time == 0 then return beginValue end
            time = time / (duration / 2)
            if time == 2 then return beginValue + a end
            if not p then p = duration * (0.3 * 1.5) end
            if not a or a < math.abs(a) then
                a = endValue - beginValue
                s = p / 4
            else
                s = p / (2 * math.pi) * math.asin(a / (endValue - beginValue))
            end
            if time < 1 then
                time = time - 1
                return -0.5 * (a * math.pow(2, 10 * time) * math.sin((time * duration - s) * (2 * math.pi) / p)) + beginValue
            else
                time = time - 1
                return a * math.pow(2, -10 * time) * math.sin((time * duration - s) * (2 * math.pi) / p) * 0.5 + (endValue - beginValue) + beginValue
            end
        end,
        
        elastic_out_in = function(time, beginValue, endValue, duration)
            if time < duration / 2 then
                return Circuit.Easing.elastic_out(time * 2, beginValue, endValue, duration) 
            else
                return Circuit.Easing.elastic_in((time * 2) - duration, beginValue + (endValue - beginValue) / 2, endValue, duration) 
            end
        end,
        
        back_in = function(time, beginValue, endValue, duration)
            local s = 1.70158
            local a = (endValue - beginValue)
            time = time / duration
            return a * time * time * ((s + 1) * time - s) + beginValue
        end,
        
        back_out = function(time, beginValue, endValue, duration)
            local s = 1.70158
            local a = (endValue - beginValue)
            time = time / duration - 1
            return a * (time * time * ((s + 1) * time + s) + 1) + beginValue
        end,
        
        back_in_out = function(time, beginValue, endValue, duration)
            local s = 1.70158
            local a = (endValue - beginValue)
            time = time / (duration / 2)
            if time < 1 then
                s = s * (1.525)
                return a / 2 * (time * time * (((s) + 1) * time - s)) + beginValue
            else
                time = time - 2
                s = s * (1.525)
                return a / 2 * (time * time * (((s) + 1) * time + s) + 2) + beginValue
            end
        end,
        
        back_out_in = function(time, beginValue, endValue, duration)
            if time < duration / 2 then
                return Circuit.Easing.back_out(time * 2, beginValue, endValue, duration) 
            else
                return Circuit.Easing.back_in((time * 2) - duration, beginValue + (endValue - beginValue) / 2, endValue, duration) 
            end
        end,
        
        bounce_out = function(time, beginValue, endValue, duration)
            time = time / duration
            if time < 1 / 2.75 then
                return (endValue - beginValue) * (7.5625 * time * time) + beginValue
            elseif time < 2 / 2.75 then
                time = time - (1.5 / 2.75)
                return (endValue - beginValue) * (7.5625 * time * time + 0.75) + beginValue
            elseif time < 2.5 / 2.75 then
                time = time - (2.25 / 2.75)
                return (endValue - beginValue) * (7.5625 * time * time + 0.9375) + beginValue
            else
                time = time - (2.625 / 2.75)
                return (endValue - beginValue) * (7.5625 * time * time + 0.984375) + beginValue
            end
        end,
        
        bounce_in = function(time, beginValue, endValue, duration)
            return (endValue - beginValue) - Circuit.Easing.bounce_out(duration - time, 0, endValue - beginValue, duration) + beginValue
        end,
        
        bounce_in_out = function(time, beginValue, endValue, duration)
            if time < duration / 2 then
                return Circuit.Easing.bounce_in(time * 2, 0, endValue - beginValue, duration) * 0.5 + beginValue
            else
                return Circuit.Easing.bounce_out(time * 2 - duration, 0, endValue - beginValue, duration) * 0.5 + (endValue - beginValue) * 0.5 + beginValue
            end
        end,
        
        bounce_out_in = function(time, beginValue, endValue, duration)
            if time < duration / 2 then
                return Circuit.Easing.bounce_out(time * 2, beginValue, (endValue - beginValue) / 2, duration) 
            else
                return Circuit.Easing.bounce_in((time * 2) - duration, beginValue + (endValue - beginValue) / 2, endValue, duration) 
            end
        end,
    },

    Table = {
        tostring = function(tbl)
            local string = ""

            for i = 1, #tbl do 
                if i ~= #tbl then 
                    string = string..tbl[i]..","
                else
                    string = string..tbl[i]
                end
            end

            return string
        end,

        contains = function(tbl,val)
            local found = false 

            for i = 1, #tbl do 
                if tbl[i] == val then found = true end
            end

            return found
        end,

        withdraw = function(items,value)
            local stuff = {}
            for i = 1, #items do 
                table.insert(stuff, items[i].value)
            end
        end,

        show = function(items)
            local string = ""

            for i = 1, #items do 
                string = string..","..items[1]
            end
        end,

        search = function(items, search_string) 
            local results = {} 

            for i, v in pairs(items) do 
                if string.find(string.lower(v), string.lower(search_string), 1, true) then 
                    table.insert(results, {value = v})
                end
            end
            return results
        end,
    },

    String = {
        toTable = function(text)
            local _text = {}
            for i = 1, #text do
                _text[i] = text:sub(i, i)
            end
            return _text
        end,

        toSub = function(i, s)
            local text = {}
            for string in string.gmatch(i, "([^" .. s .. "]+)") do
                text[#text + 1] = string.gsub(string, "\n", "")
            end
            return text
        end,

        toInt = function(n)
            local s = tostring(n)
            local i, j = s:find('%.')
            if i then
                return tonumber(s:sub(1, i-1))
            else
                return n
            end
        end,

        toBool = function(value)
            return value == "true"
        end,

        KEY_CODES = {
            LBUTTON = 0x01,
            RBUTTON = 0x02,
            CANCEL = 0x03,
            MBUTTON = 0x04,
            XBUTTON1 = 0x05,
            XBUTTON2 = 0x06,
            BACKSPACE = 0x08,
            TAB = 0x09,
            CLEAR = 0x0C,
            RETURN = 0x0D,
            SHIFT = 0x10,
            CONTROL = 0x11,
            ALT = 0x12,
            PAUSE = 0x13,
            CAPITAL = 0x14,
            ESCAPE = 0x1B,
            SPACE = 0x20,
            PAGE_UP = 0x21,
            PAGE_DOWN = 0x22,
            END = 0x23,
            HOME = 0x24,
            LEFT = 0x25,
            UP = 0x26,
            RIGHT = 0x27,
            DOWN = 0x28,
            SELECT = 0x29,
            EXECUTE = 0x2B,
            INSERT = 0x2D,
            DELETE = 0x2E,
            HELP = 0x2F,
            _0 = 0x30,
            _1 = 0x31,
            _2 = 0x32,
            _3 = 0x33,
            _4 = 0x34,
            _5 = 0x35,
            _6 = 0x36,
            _7 = 0x37,
            _8 = 0x38,
            _9 = 0x39,
            _A = 0x41,
            _B = 0x42,
            _C = 0x43,
            _D = 0x44,
            _E = 0x45,
            _F = 0x46,
            _G = 0x47,
            _H = 0x48,
            _I = 0x49,
            _J = 0x4A,
            _K = 0x4B,
            _L = 0x4C,
            _M = 0x4D,
            _N = 0x4E,
            _O = 0x4F,
            _P = 0x50,
            _Q = 0x51,
            _R = 0x52,
            _S = 0x53,
            _T = 0x54,
            _U = 0x55,
            _V = 0x56,
            _W = 0x57,
            _X = 0x58,
            _Y = 0x59,
            _Z = 0x5A,
            LWIN = 0x5B,
            RWIN = 0x5C,
            APPS = 0x5D,
            N0 = 0x60,
            N1 = 0x61,
            N2 = 0x62,
            N3 = 0x63,
            N4 = 0x64,
            N5 = 0x65,
            N6 = 0x66,
            N7 = 0x67,
            N8 = 0x68,
            N9 = 0x69,
            MULTIPLY = 0x6A,
            ADD = 0x6B,
            SEPARATOR = 0x6C,
            SUBTRACT = 0x6D,
            DECIMAL = 0x6E,
            DIVIDE = 0x6F,
            F1 = 0x70,
            F2 = 0x71,
            F3 = 0x72,
            F4 = 0x73,
            F5 = 0x74, 
            F6 = 0x75,
            F7 = 0x76,
            F8 = 0x77,
            F9 = 0x78,
            F10 = 0x79,
            F11 = 0x7A,
            F12 = 0x7B,
            F13 = 0x7C,
            F14 = 0x7D,
            F15 = 0x7E,
            F16 = 0x7F,
            F17 = 0x80,
            F18 = 0x81,
            F19 = 0x82,
            F20 = 0x83,
            F21 = 0x84,
            F22 = 0x85,
            F23 = 0x86,
            F24 = 0x87,
            NUMLOCK = 0x90,
            SCROLL = 0x91,
            LSHIFT = 0xA0,
            RSHIFT = 0xA1,
            LCONTROL = 0xA2,
            RCONTROL = 0xA3,
            LMENU = 0xA4,
            RMENU = 0xA5
        },

        toKeyCode = function(value)
            return KEY_CODES[value]
        end,
    },

    Animation = {
        Data = {},
        New = function(name,beginValue,endValue,time,duration,method)
            if Animation.Data[name] == nil then Animation.Data[name] = 0 end 
            
            if method == "linear" then 
                Animation.Data[name] = Circuit.Easing.linear(time, beginValue, endValue, duration)
            elseif method == "quad_in" then
                Animation.Data[name] = Circuit.Easing.quad_in(time, beginValue, endValue, duration)
            elseif method == "quad_out" then
                Animation.Data[name] = Circuit.Easing.quad_out(time, beginValue, endValue, duration)
            elseif method == "quad_in_out" then
                Animation.Data[name] = Circuit.Easing.quad_in_out(time, beginValue, endValue, duration)
            elseif method == "quad_out_in" then
                Animation.Data[name] = Circuit.Easing.quad_out_in(time, beginValue, endValue, duration)
            elseif method == "cubic_in" then
                Animation.Data[name] = Circuit.Easing.cubic_in(time, beginValue, endValue, duration)
            elseif method == "cubic_out" then
                Animation.Data[name] = Circuit.Easing.cubic_out(time, beginValue, endValue, duration)
            elseif method == "cubic_in_out" then
                Animation.Data[name] = Circuit.Easing.cubic_in_out(time, beginValue, endValue, duration)
            elseif method == "cubic_out_in" then
                Animation.Data[name] = Circuit.Easing.cubic_out_in(time, beginValue, endValue, duration)
            elseif method == "quart_in" then
                Animation.Data[name] = Circuit.Easing.quart_in(time, beginValue, endValue, duration)
            elseif method == "quart_out" then
                Animation.Data[name] = Circuit.Easing.quart_out(time, beginValue, endValue, duration)
            elseif method == "quart_in_out" then
                Animation.Data[name] = Circuit.Easing.quart_in_out(time, beginValue, endValue, duration)
            elseif method == "quart_out_in" then
                Animation.Data[name] = Circuit.Easing.quart_out_in(time, beginValue, endValue, duration)
            elseif method == "quint_in" then
                Animation.Data[name] = Circuit.Easing.quint_in(time, beginValue, endValue, duration)
            elseif method == "quint_out" then
                Animation.Data[name] = Circuit.Easing.quint_out(time, beginValue, endValue, duration)
            elseif method == "quint_in_out" then
                Animation.Data[name] = Circuit.Easing.quint_in_out(time, beginValue, endValue, duration)
            elseif method == "quint_out_in" then
                Animation.Data[name] = Circuit.Easing.quint_out_in(time, beginValue, endValue, duration)
            elseif method == "sine_in" then
                Animation.Data[name] = Circuit.Easing.sine_in(time, beginValue, endValue, duration)
            elseif method == "sine_out" then
                Animation.Data[name] = Circuit.Easing.sine_out(time, beginValue, endValue, duration)
            elseif method == "sine_in_out" then
                Animation.Data[name] = Circuit.Easing.sine_in_out(time, beginValue, endValue, duration)
            elseif method == "sine_out_in" then
                Animation.Data[name] = Circuit.Easing.sine_out_in(time, beginValue, endValue, duration)
            elseif method == "expo_in" then
                Animation.Data[name] = Circuit.Easing.expo_in(time, beginValue, endValue, duration)
            elseif method == "expo_out" then
                Animation.Data[name] = Circuit.Easing.expo_out(time, beginValue, endValue, duration)
            elseif method == "expo_in_out" then
                Animation.Data[name] = Circuit.Easing.expo_in_out(time, beginValue, endValue, duration)
            elseif method == "expo_out_in" then
                Animation.Data[name] = Circuit.Easing.expo_out_in(time, beginValue, endValue, duration)
            elseif method == "circ_in" then
                Animation.Data[name] = Circuit.Easing.circ_in(time, beginValue, endValue, duration)
            elseif method == "circ_out" then
                Animation.Data[name] = Circuit.Easing.circ_out(time, beginValue, endValue, duration)
            elseif method == "circ_in_out" then
                Animation.Data[name] = Circuit.Easing.circ_in_out(time, beginValue, endValue, duration)
            elseif method == "circ_out_in" then
                Animation.Data[name] = Circuit.Easing.circ_out_in(time, beginValue, endValue, duration)
            elseif method == "elastic_in" then
                Animation.Data[name] = Circuit.Easing.elastic_in(time, beginValue, endValue, duration)
            elseif method == "elastic_out" then
                Animation.Data[name] = Circuit.Easing.elastic_out(time, beginValue, endValue, duration)
            elseif method == "elastic_in_out" then
                Animation.Data[name] = Circuit.Easing.elastic_in_out(time, beginValue, endValue, duration)
            elseif method == "elastic_out_in" then
                Animation.Data[name] = Circuit.Easing.elastic_out_in(time, beginValue, endValue, duration)
            elseif method == "back_in" then
                Animation.Data[name] = Circuit.Easing.back_in(time, beginValue, endValue, duration)
            elseif method == "back_out" then
                Animation.Data[name] = Circuit.Easing.back_out(time, beginValue, endValue, duration)
            elseif method == "back_in_out" then
                Animation.Data[name] = Circuit.Easing.back_in_out(time, beginValue, endValue, duration)
            elseif method == "back_out_in" then
                Animation.Data[name] = Circuit.Easing.back_out_in(time, beginValue, endValue, duration)
            elseif method == "bounce_out" then
                Animation.Data[name] = Circuit.Easing.bounce_out(time, beginValue, endValue, duration)
            elseif method == "bounce_in" then
                Animation.Data[name] = Circuit.Easing.bounce_in(time, beginValue, endValue, duration)
            elseif method == "bounce_in_out" then
                Animation.Data[name] = Circuit.Easing.bounce_in_out(time, beginValue, endValue, duration)
            elseif method == "bounce_out_in" then
                Animation.Data[name] = Circuit.Easing.bounce_out_in(time, beginValue, endValue, duration)
            else
                Animation.Data[name] = Circuit.Easing.linear(time, beginValue, endValue, duration)
            end 

            return Animation.Data[name]
        end,
    },

    Render_pos_hook = nil,
    Input = {},
}

Circuit.Input.hovered = function(Vec4d,y,w,h)
m = Circuit.Input.get_mouse_position()
if type(Vec4d) == "table" then 
    return m.x > Vec4d.x and m.x < Vec4d.x + Vec4d.w and m.y > Vec4d.y and m.y < Vec4d.y + Vec4d.h
else
    return m.x > Vec4d and m.x < Vec4d + w and m.y > y and m.y < y+h
end
end

Circuit.Input.toggles = {} 
Circuit.Input.toggled = function(key,pos) 
Key = key or 0x01
if Circuit.Input.toggles[Key] == nil then Circuit.Input.toggles[Key] = {toggled=false,can=true} end 

if common.is_button_down(Key) and Circuit.Input.toggles[Key].can then 
    if pos ~= nil then 
        if Circuit.Input.hovered(pos) then 
            Circuit.Input.toggles[Key].toggled = not Circuit.Input.toggles[Key] 
            Circuit.Input.toggles[Key].can = false
        end   
    else
        Circuit.Input.toggles[Key].toggled = not Circuit.Input.toggles[Key] 
        Circuit.Input.toggles[Key].can = false
    end
end

if common.is_button_released(Key) and not Circuit.Input.toggles[Key].can then 
    Circuit.Input.toggles[Key].can = true
end

return Circuit.Input.toggles[Key].toggled 
end 

Circuit.Input.drags = {} 
Circuit.Input.drags_data = {} 
Circuit.Input.new_drag = function(name,vec4d,can)
local data = Table.once_insert(Circuit.Input.drags, {name=name,vec4d=vec4d,can=can})
data.can = can 
return data
end

Circuit.Input.realize_drags = function()
m = Circuit.Input.get_mouse_position()
for i, v in pairs(Circuit.Input.drags) do 
    if Circuit.Input.drags_data[v.name] == nil then Circuit.Input.drags_data[v.name] = {is=false,drag_vec2d=nil} end 

    if Circuit.Input.hovered(v.vec4d) and common.is_button_down(0x01) and v.can and not Circuit.Input.drags_data[v.name].is then 
        Circuit.Input.drags_data[v.name].drag_vec2d = {
            x = v.vec4d.x - m.x,
            y = v.vec4d.y - m.y 
        }
        Circuit.Input.drags_data[v.name].is = true 
    end

    if Circuit.Input.drags_data[v.name].is and v.can then 
        v.vec4d.x = m.x + Circuit.Input.drags_data[v.name].drag_vec2d.x 
        v.vec4d.y = m.y + Circuit.Input.drags_data[v.name].drag_vec2d.y
    end
end
end

Circuit.Render = {
Rect = function(position,size,...)
    if Circuit.Render_pos_hook ~= nil then
        position = Circuit.Render_pos_hook
    end

    render.rect_outline(vector(position.x,position.y), vector(position.x+size.x,position.y+size.y),...)
    
    local data = {
        hovered = function()
            return Circuit.Input.hovered(position.x,position.y,size.x,size.y)
        end,

        V4D = vec4d:new(position.x,position.y,size.x,size.y),
    } 

    return data
end,

RectFilled = function(position,size,...)
    if Circuit.Render_pos_hook ~= nil then
        position = Circuit.Render_pos_hook
    end

    render.rect(vector(position.x,position.y), vector(position.x+size.x,position.y+size.y),...)
    
    local data = {
        hovered = function()
            return Circuit.Input.hovered(position.x,position.y,size.x,size.y)
        end,

        V4D = vec4d:new(position.x,position.y,size.x,size.y),
    } 

    return data
end,

Gradient = function(position,size,...)
    if Circuit.Render_pos_hook ~= nil then
        position = Circuit.Render_pos_hook
    end

    render.gradient(vector(position.x,position.y), vector(position.x+size.x,position.y+size.y),...)
    
    local data = {
        hovered = function()
            return Circuit.Input.hovered(position.x,position.y,size.x,size.y)
        end,

        V4D = vec4d:new(position.x,position.y,size.x,size.y),
    } 

    return data
end,

Shadow = function(position,size,...)
    if Circuit.Render_pos_hook ~= nil then
        position = Circuit.Render_pos_hook
    end

    render.shadow(vector(position.x,position.y), vector(position.x+size.x,position.y+size.y),...)
    
    local data = {
        hovered = function()
            return Circuit.Input.hovered(position.x,position.y,size.x,size.y)
        end,

        V4D = vec4d:new(position.x,position.y,size.x,size.y),
    } 

    return data
end,

Image = function(text,position,...)
    if Circuit.Render_pos_hook ~= nil then
        position = Circuit.Render_pos_hook
    end

    render.texture(text, vector(position.x,position.y),...)

    local data = {
        hovered = Circuit.Input.hovered(position.x,position.y,size.x,size.y),
        V4D = vec4d:new(position.x,position.y,size.x,size.y)
    } 

    return data
end,

Blur = function(text,position,...)
    if Circuit.Render_pos_hook ~= nil then
        position = Circuit.Render_pos_hook
    end

    render.blur(text, vector(position.x,position.y),...)

    local data = {
        hovered = Circuit.Input.hovered(position.x,position.y,size.x,size.y),
        V4D = vec4d:new(position.x,position.y,size.x,size.y)
    } 

    return data
end,

Clip = function(position,size)
    if Circuit.Render_pos_hook ~= nil then
        position = Circuit.Render_pos_hook
    end

    render.push_clip_rect(vector(position.x,position.y), vector(position.x+size.x,position.y+size.y))
end,

EndClip = function()
    render.pop_clip_rect()
end,

Text = function(font,pos,color,flags,text,centerx,centery)
    if Circuit.Render_pos_hook ~= nil then
        pos = Circuit.Render_pos_hook.x
    end

    Position = vector(0,0)
    Position.x = centerx and pos.x-render.measure_text(font,flags,text).x/2 or pos.x
    Position.y = centery and pos.y-render.measure_text(font,flags,text).x/2 or pos.y

    render.text(font,Pos,color,flags,text)

    w = render.measure_text(font,flags,text).x <= 1 and font.width
    h = render.measure_text(font,flags,text).y <= 1 and font.height

    local data = {
        hovered = Circuit.Input.hovered(Position.x,Position.y,w,h),
        V4D = vec4d:new(Position.x,Position.y,w,h)
    } 

    return data
end,

HookPos = function(vec4d) 
    if vec4d.type == "vector4d" then 
        Circuit.Render_pos_hook = vec4d
    end
end,

EndHook = function()
    Circuit.Render_pos_hook = nil
end,
}

-- a = vec4d:new(0,0,0,0)
-- print(a)

return Circuit