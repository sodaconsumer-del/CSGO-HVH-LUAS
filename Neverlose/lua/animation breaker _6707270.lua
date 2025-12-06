--[[
    Enhanced Animation Breaker by ShadowMod (final corrigido)
    Modos: Jitter Ground, Spin Air, Adaptive Lean, Randomize Layers
    Open source – copy, learn, improve.
]]--

local ffi = require("ffi")
local ui  = ui

-- Definição da estrutura AnimationLayer
ffi.cdef([[
    typedef struct {
        char pad[0x18];
        uint32_t sequence;
        float prev_cycle;
        float weight;
        float weight_delta_rate;
        float playback_rate;
        float cycle;
        void* entity;
        char pad2[0x4];
    } AnimationLayer;
]])

-- Cria a interface
local grp = ui.create("Animation Breaker")
local sw  = grp:switch("Enable Animation Breaker", false)

-- Ground modes
local gmodes     = {"default", "static", "moonwalk", "jitter"}
local ground_m   = grp:combo("On Ground", gmodes)
local g_jit_amt  = grp:slider("Ground Jitter Strength", 0, 10, 3, 0.1)
local g_jit_freq = grp:slider("Ground Jitter Frequency", 1, 30, 10, 1)

-- Air modes
local amodes     = {"default", "static", "walking", "spin", "jitter"}
local air_m      = grp:combo("In Air", amodes)
local a_jit_amt  = grp:slider("Air Jitter Strength", 0, 10, 5, 0.1)
local spin_rate  = grp:slider("Air Spin Speed (deg/frame)", 1, 180, 45, 1)

-- Lean modes
local lean_sw    = grp:switch("Enable Move Lean", false)
local lmodes     = {"default", "static", "dynamic", "adaptive"}
local lean_m     = grp:combo("Lean Mode", lmodes)
local lean_amt   = grp:slider("Lean Amount", 0, 10, 5, 0.1)

-- Randomize Layers
local rnd_sw     = grp:switch("Randomize Layers", false)
local rnd_freq   = grp:slider("Randomize Frequency (ms)", 50, 1000, 200, 50)

-- Atualiza visibilidade dos controles
local function update_vis()
    local on = sw:get()
    ground_m:visibility(on)
    g_jit_amt:visibility(on and ground_m:get() == "jitter")
    g_jit_freq:visibility(on and ground_m:get() == "jitter")
    air_m:visibility(on)
    a_jit_amt:visibility(on and air_m:get() == "jitter")
    spin_rate:visibility(on and air_m:get() == "spin")
    lean_sw:visibility(on)
    lean_m:visibility(on and lean_sw:get())
    lean_amt:visibility(on and lean_sw:get())
    rnd_sw:visibility(on)
    rnd_freq:visibility(on and rnd_sw:get())
end

sw:set_callback(update_vis, true)
ground_m:set_callback(update_vis)
air_m:set_callback(update_vis)
lean_sw:set_callback(update_vis)
rnd_sw:set_callback(update_vis)

-- Inicializa RNG e timer
math.randomseed(globals.tickcount)
local last_rnd = globals.tickcount

-- Hook na atualização de animações
events.post_update_clientside_animation(function()
    if not sw:get() then
        -- Restaura a configuração padrão de leg movement
        ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement")
          :override(ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"):get())
        return
    end

    local lp = entity.get_local_player()
    if not lp then return end

    -- Ponteiro das layers
    local ptr    = ffi.cast("void***", lp[0])
    local layers = ffi.cast("AnimationLayer**", ffi.cast("char*", ptr) + 0x2990)[0]
    if not layers then return end

    local st = lp:get_anim_state()
    if not st then return end

    -- Ground jitter
    if st.on_ground and ground_m:get() == "jitter" then
        local t = globals.curtime * g_jit_freq:get()
        for _, idx in ipairs({3, 6, 12}) do
            layers[idx].weight = (math.sin(t) * 0.5 + 0.5) * (g_jit_amt:get() / 10)
        end
    end

    -- Spin e jitter no ar
    if not st.on_ground then
        local am = air_m:get()
        if am == "spin" then
            local rot = (globals.tickcount * spin_rate:get()) % 360
            lp.m_angAbsRotation.y = rot
        elseif am == "jitter" then
            local rand = (math.random() - 0.5) * 2 * (a_jit_amt:get() / 10)
            for _, idx in ipairs({3, 6, 12}) do
                layers[idx].weight = math.min(math.max(rand, 0), 1)
            end
        elseif am == "walking" then
            layers[6].weight = 1
        elseif am == "static" then
            lp.m_flPoseParameter[6] = 1
        end
    end

    -- Lean behavior
    if lean_sw:get() then
        local vel   = lp.m_vecVelocity
        local speed = math.sqrt(vel.x * vel.x + vel.y * vel.y)
        local amt   = lean_amt:get() / 10
        local mode  = lean_m:get()

        if mode == "static" then
            layers[12].weight = amt
        elseif mode == "dynamic" then
            layers[12].weight = math.min(speed / 200, 1) * amt
        elseif mode == "adaptive" then
            local phase = (globals.curtime % 5) / 5
            layers[12].weight = math.min(speed / 200, 1) * amt * phase
        end
    end

    -- Randomize layers
    if rnd_sw:get() then
        local now = globals.tickcount
        if now - last_rnd > rnd_freq:get() then
            for i = 0, 13 do
                layers[i].weight = math.random()
            end
            last_rnd = now
        end
    end
end)

-- Hook no evento de desenho para reforçar visuais (substitui callbacks.register)
events.draw(function()
    -- Aqui você pode adicionar qualquer overlay ou debug visual,
    -- mas não é estritamente necessário para o breaker funcionar.
end)
