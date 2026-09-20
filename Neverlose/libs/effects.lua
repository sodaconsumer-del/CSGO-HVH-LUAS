ffi.cdef[[
    typedef struct {float x, y, z;} Vector3_t;
]]
local function thiscallHelper(...)
    local args = {...}
    local vTbl
    if #args == 1 and (type(args[1]) == "userdata" or type(args[1]) == "cdata" or type(args[1]) == "number") then
        vTbl = args[1]
    elseif #args == 2 then
        if type(args[1]) == "string" and type(args[2]) == "number" then
            local ct = ffi.typeof(args[1])
            return function(class, ...)
                local ok, ret = pcall(ffi.cast, ct, ffi.cast("void***", class)[0][args[2]])
                return ok and ret(class, ...) or nil
            end
        end 
        vTbl = utils.create_interface(args[1], args[2])
    else
        return error("Class not found.")
    end
    if ffi.cast("void*", vTbl) == ffi.new("void*") then return error("Class not found.") end
    return {this = ffi.cast("void***", vTbl), getVFunc = function(self, name, arguments, index, ...)
        if not index then return error("Please give class member subscript.") end
        local this = self.this
        local args = {...}
        local type = "void"
        if args[1] then type = args[1] end
        arguments = arguments:len() == 0 and "void*" or "void*, "..arguments
        local ok, ct = pcall(ffi.typeof, type.."(__thiscall*)("..arguments..")")
        if not ok then
            error(ct, 2)
        end
        local func = ffi.cast(ct, this[0][index])
        self[(not name or #name > 0) and name or index] = function(...)
            return func(this, ...)
        end
    end}
end

local IEffects = thiscallHelper("client.dll", "IEffects001")
IEffects.vec1 = ffi.new("Vector3_t")
IEffects.vec2 = ffi.new("Vector3_t")
IEffects:getVFunc("Smoke", "const Vector3_t&, int, float, float", 2)
IEffects:getVFunc("Sparks", "const Vector3_t&, int, int", 3)
IEffects:getVFunc("Dust", "const Vector3_t&, const Vector3_t&, float, float", 4)
IEffects:getVFunc("MuzzleFlash", "const Vector3_t&, const Vector3_t&, float, int", 5)
IEffects:getVFunc("MetalSparks", "const Vector3_t&, const Vector3_t&", 6)
IEffects:getVFunc("EnergySplash", "const Vector3_t&, const Vector3_t&, bool", 7)
IEffects:getVFunc("Ricochet", "const Vector3_t&, const Vector3_t&", 8)
local mat_spark = materials.get("effects/spark") or error "invalid material"
local effects = {}

function effects.smoke(origin, model_index, scale, framerate)
    IEffects.vec1.x = origin.x
    IEffects.vec1.y = origin.y
    IEffects.vec1.z = origin.z
    IEffects.Smoke(IEffects.vec1, model_index or 0, scale or 10, framerate or 30)
end

function effects.sparks(position, magnitude, trail_length, clr)
    local clr = clr or color()
    mat_spark:color_modulate(clr)
    IEffects.vec1.x = position.x
    IEffects.vec1.y = position.y
    IEffects.vec1.z = position.z
    IEffects.Sparks(IEffects.vec1, magnitude or 1, trail_length or 1)
end

function effects.dust(position, direction, size, speed)
    IEffects.vec1.x = position.x
    IEffects.vec1.y = position.y
    IEffects.vec1.z = position.z
    IEffects.vec2.x = direction and direction.x or 0
    IEffects.vec2.y = direction and direction.y or 0
    IEffects.vec2.z = direction and direction.z or 0
    IEffects.Dust(IEffects.vec1, IEffects.vec2, size or 10, speed or 1)
end

function effects.muzzle_flash(origin, direction, scale, i_type, clr)
    local clr = clr or color()
    mat_spark:color_modulate(clr)
    IEffects.vec1.x = origin.x
    IEffects.vec1.y = origin.y
    IEffects.vec1.z = origin.z
    IEffects.vec2.x = direction and direction.x or 0
    IEffects.vec2.y = direction and direction.y or 0
    IEffects.vec2.z = direction and direction.z or 0
    IEffects.MuzzleFlash(IEffects.vec1, IEffects.vec2, scale or 1, i_type or 1)
end

function effects.meta_sparks(position, direction, clr)
    local clr = clr or color()
    mat_spark:color_modulate(clr)
    IEffects.vec1.x = position.x
    IEffects.vec1.y = position.y
    IEffects.vec1.z = position.z
    IEffects.vec2.x = direction and direction.x or 0
    IEffects.vec2.y = direction and direction.y or 0
    IEffects.vec2.z = direction and direction.z or 0
    IEffects.MetalSparks(IEffects.vec1, IEffects.vec2)
end

function effects.energy_splash(position, direction, explosive, clr)
    local clr = clr or color()
    mat_spark:color_modulate(clr)
    IEffects.vec1.x = position.x
    IEffects.vec1.y = position.y
    IEffects.vec1.z = position.z
    IEffects.vec2.x = direction and direction.x or 0
    IEffects.vec2.y = direction and direction.y or 0
    IEffects.vec2.z = direction and direction.z or 0
    IEffects.EnergySplash(IEffects.vec1, IEffects.vec2, explosive or false)
end

function effects.ricochet(position, direction, clr)
    local clr = clr or color()
    mat_spark:color_modulate(clr)
    IEffects.vec1.x = position.x
    IEffects.vec1.y = position.y
    IEffects.vec1.z = position.z
    IEffects.vec2.x = direction and direction.x or 0
    IEffects.vec2.y = direction and direction.y or 0
    IEffects.vec2.z = direction and direction.z or 0
    IEffects.Ricochet(IEffects.vec1, IEffects.vec2)
end

-- local group = ui.create("test")
-- local clr = group:color_picker("color")
-- events.createmove:set(function ()
--     local lp = entity.get_local_player()
--     local rad = math.rad(globals.tickcount * 5 * (64 / (1 / globals.tickinterval)))
--     local origin = lp.m_vecOrigin + vector(math.cos(rad) * 30, math.sin(rad) * 30, 0)
--     effects.energy_splash(origin, nil, nil, clr:get())
-- end)

return effects