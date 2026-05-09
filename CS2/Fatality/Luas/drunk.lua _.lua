--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0 = draw.shader("\ncbuffer cb : register(b0) {\n    float4x4 mvp;\n    float2 tex;\n    float time;\n    float alpha;\n};\n\nstruct PS_INPUT {\n    float4 pos : SV_POSITION;\n    float4 col : COLOR0;\n    float2 uv : TEXCOORD0;\n};\n\nsampler sampler0;\nTexture2D texture0;\n\nfloat4 main(PS_INPUT inp) : SV_Target {\n    float2 uv = inp.uv;\n\n    float2 dist = uv - float2(0.5, 0.5);\n\n    // swirling effect\n    float angle = sin(time + length(dist) * 10.0) * 0.5;  // angle changes over time\n    float2 new_uv = uv + float2(angle, angle) * 0.1;\n\n    float4 color = texture0.Sample(sampler0, new_uv);\n\n    return color;\n}\n\n\n")

slot_0_0_0:create()

slot_0_1_0 = draw.shader("\ncbuffer cb : register(b0) {\n    float4x4 mvp;\n    float2 tex;\n    float time;\n    float alpha;\n};\n\nstruct PS_INPUT {\n    float4 pos : SV_POSITION;\n    float4 col : COLOR0;\n    float2 uv : TEXCOORD0;\n};\n\nsampler sampler0;\nTexture2D texture0;\n\nfloat4 main(PS_INPUT inp) : SV_Target {\n    float2 uv = inp.uv;\n\n    // wave effect\n    float angle = sin(uv.x * 10.0 + time * 2) * 0.05;\n    float2 new_uv = uv + float2(angle, angle);\n\n    float4 color = texture0.Sample(sampler0, new_uv);\n\n    return color;\n}\n\n\n")

slot_0_1_0:create()

slot_0_2_0 = draw.shader("cbuffer cb : register(b0) {\n    float4x4 mvp;     \n    float2 tex;       \n    float time;       \n    float alpha;      \n    float2 resolution;\n};\n\nstruct PS_INPUT {\n    float4 pos : SV_POSITION;\n    float4 col : COLOR0;\n    float2 uv : TEXCOORD0;\n};\n\nsampler sampler0;\nTexture2D texture0;\n\nfloat4 main(PS_INPUT inp) : SV_Target {\n    float2 uv = inp.uv;\n\n    // shake parameters\n    float shakeStrength = 0.05;  // shake strength\n    float shakeSpeed = 10.0;     // shake speed\n    float shakeTime = time * shakeSpeed;\n    \n    // random shake effect using a sine wave\n    float2 shakeOffset = float2(sin(shakeTime), cos(shakeTime)) * shakeStrength;\n\n    uv = uv + shakeOffset;\n\n    float4 color = texture0.Sample(sampler0, uv);\n\n    return color;\n}\n")

slot_0_2_0:create()

slot_0_3_0 = draw.shader("    cbuffer cb : register(b0) {\n        float4x4 mvp;\n        float2 tex;\n        float alpha;\n        float time;\n    };\n\n    struct PS_INPUT {\n        float4 pos : SV_POSITION;\n        float4 col : COLOR0;\n        float2 uv : TEXCOORD0;\n    };\n\n    sampler sampler0;\n    Texture2D texture0;\n\n    float4 main(PS_INPUT inp) : SV_Target {\n        float strength = 0.05;\n        float wave = 5.0;\n\n        float distortion = sin(inp.uv.x * 10.0 + time * wave) * cos(inp.uv.y * 10.0 + time * wave) * strength;\n\n        float2 new_uv = inp.uv + float2(distortion, distortion);\n\n        float4 color = texture0.Sample(sampler0, new_uv);\n\n        return color;\n    }\n\n")

slot_0_3_0:create()

slot_0_4_0 = draw.shader("    cbuffer cb : register(b0) {\n        float4x4 mvp;\n        float2 tex;\n        float alpha;\n        float time;\n    };\n\n    struct PS_INPUT {\n        float4 pos : SV_POSITION;\n        float4 col : COLOR0;\n        float2 uv : TEXCOORD0;\n    };\n\n    sampler sampler0;\n    Texture2D texture0;\n\n    float4 main(PS_INPUT inp) : SV_Target {\n        float2 center = float2(0.5, 0.5);\n        float2 uv = inp.uv;\n\n        float dist = length(uv - center);\n\n        float ripple = sin(dist * 20.0 * 4.0) * 0.015 / (dist + 0.3);\n\n        float2 rippleUV = uv + normalize(uv - center) * ripple * (0.1);\n\n        float4 color = texture0.Sample(sampler0, rippleUV);\n\n        return color;\n    }\n")

slot_0_4_0:create()

slot_0_5_0 = draw.shader("\ncbuffer cb : register(b0) {\n    float4x4 mvp;\n    float2 tex;\n    float time;\n    float alpha;\n};\n\nstruct PS_INPUT {\n    float4 pos : SV_POSITION;\n    float4 col : COLOR0;\n    float2 uv : TEXCOORD0;\n};\n\nsampler sampler0;\nTexture2D texture0;\n\nfloat4 main(PS_INPUT inp) : SV_Target {\n    float2 center = float2(0.5, 0.5);\n    float2 uv = inp.uv;\n    \n    float dist = length(uv - center);\n\n    float ripple = sin(dist * 30.0 - time * 5.0) * 0.015 / (dist + 0.2);\n    \n    float2 rippleUV = uv + normalize(uv - center) * ripple;\n\n    float4 color = texture0.Sample(sampler0, rippleUV);\n    \n    return color;\n}\n\n\n")

slot_0_5_0:create()

slot_0_6_0 = draw.shader("cbuffer cb : register(b0) {\n    float4x4 mvp;\n    float2 tex;\n    float time;\n    float alpha;\n};\n\nstruct PS_INPUT {\n    float4 pos : SV_POSITION;\n    float4 col : COLOR0;\n    float2 uv : TEXCOORD0;\n};\n\nSamplerState sampler0 : register(s0);\nTexture2D texture0;\n\n// Credits to ref on the fatality lua discord for the bloom code\nfloat4 applyBloom(float4 color) {\n    float luminance = dot(color.rgb, float3(0.359, 0.587, 0.2)); // Luminance weight\n    float4 bloom = saturate((luminance - 0.8) * 10) * color;\n    return saturate(color + bloom * alpha);\n}\n\nfloat4 main(PS_INPUT inp) : SV_Target {\n    float radius = 5.0;\n    float2 inv_size = 1.0 / tex.xy;\n    float4 base_color = texture0.Sample(sampler0, inp.uv);\n\n    // edge blur intensity\n    float edge_dist_x = min(inp.uv.x, 1.0 - inp.uv.x) * tex.x;\n    float edge_dist_y = min(inp.uv.y, 1.0 - inp.uv.y) * tex.y;\n    float edge_dist = min(edge_dist_x, edge_dist_y);\n    float edge_factor = smoothstep(50.0, 0.0, edge_dist);\n\n    // apply the bloom before the blur\n    float4 base_bloomed = applyBloom(base_color);\n\n    // skip blur if outside of the distance\n    if (edge_dist > 50.0) {\n        return base_bloomed;\n    }\n\n    float4 blurred_color = 0.0;\n    float weight = 0.0;\n    for (float x = -radius; x <= radius; x += 1.0) {\n        for (float y = -radius; y <= radius; y += 1.0) {\n            float2 offset = float2(x, y) * inv_size;\n            float4 sample_color = texture0.Sample(sampler0, inp.uv + offset);\n            blurred_color += applyBloom(sample_color);\n            weight += 1.0;\n        }\n    }\n    blurred_color /= weight;\n\n    return lerp(base_bloomed, blurred_color, edge_factor);\n}\n\n\n\n")

slot_0_6_0:create()

slot_0_7_0 = draw.shader("cbuffer cb : register(b0) {\n    float4x4 mvp;\n    float2 tex;\n    float time;\n    float alpha;\n};\n\nstruct PS_INPUT {\n    float4 pos : SV_POSITION;\n    float4 col : COLOR0;\n    float2 uv : TEXCOORD0;\n};\n\nSamplerState sampler0 : register(s0);\nTexture2D texture0;\n\nfloat4 main(PS_INPUT inp) : SV_Target {\n    float minPixels = 64;\n    float maxPixels = 512;\n    float t = (sin(time * 3) * 0.5 + 0.5);\n    float pixelSize = lerp(minPixels, maxPixels, t);\n\n    float2 pixelatedUV = floor(inp.uv * pixelSize) / pixelSize;\n\n    float4 color = texture0.Sample(sampler0, pixelatedUV);\n    return color;\n}\n\n")

slot_0_7_0:create()

slot_0_8_0 = draw.shader("cbuffer cb : register(b0) {\n    float4x4 mvp;\n    float2 tex;\n    float time;\n    float alpha;\n};\n\nstruct PS_INPUT {\n    float4 pos : SV_POSITION;\n    float4 col : COLOR0;\n    float2 uv : TEXCOORD0;\n};\n\nSamplerState sampler0 : register(s0);\nTexture2D texture0;\n\nfloat4 main(PS_INPUT inp) : SV_Target {\n    float4 color = texture0.Sample(sampler0, inp.uv);\n\n    float luminance = dot(color.rgb, float3(0.299, 0.587, 0.114));\n    float4 bloom = saturate((luminance - 0.6) * 4.0) * color;\n\n    float2 texelSize = 1.0 / tex.xy;\n    float4 blurredBloom = (\n        texture0.Sample(sampler0, inp.uv + texelSize * float2(-1, -1)) +\n        texture0.Sample(sampler0, inp.uv + texelSize * float2(1, -1)) +\n        texture0.Sample(sampler0, inp.uv + texelSize * float2(-1, 1)) +\n        texture0.Sample(sampler0, inp.uv + texelSize * float2(1, 1))\n    ) * 0.25;\n\n    return saturate(color + blurredBloom * alpha);\n}\n\n")

slot_0_8_0:create()

slot_0_9_0 = draw.shader("    cbuffer cb : register(b0) {\n        float4x4 mvp;\n        float2 tex;\n        float time;\n        float alpha;\n    };\n\n    struct PS_INPUT {\n        float4 pos : SV_POSITION;\n        float4 col : COLOR0;\n        float2 uv : TEXCOORD0;\n    };\n\n    sampler sampler0;\n    Texture2D texture0;\n\n    float4 main(PS_INPUT inp) : SV_Target {\n        float2 uv = inp.uv;\n\n        float wave = sin(uv.x * 10.0 + time * 3.0) * cos(uv.y * 10.0 + time * 3.0) * 0.05;\n        uv += wave;\n\n        float3 colorShift = float3(0.5 + 0.5 * sin(time * 2.0), 0.5 + 0.5 * cos(time * 2.0), 0.5 + 0.5 * sin(time * 1.5));\n        \n        float4 color = texture0.Sample(sampler0, uv);\n        color.rgb *= colorShift;\n\n        return float4(color.rgb, color.a * inp.col.a);\n    }\n")

slot_0_9_0:create()

slot_0_10_0 = draw.shader("cbuffer cb : register(b0) {\n    float4x4 mvp;\n    float2 tex;\n    float time;\n    float alpha;\n};\n\nstruct PS_INPUT {\n    float4 pos : SV_POSITION;\n    float4 col : COLOR0;\n    float2 uv : TEXCOORD0;\n};\n\nsampler sampler0;\nTexture2D texture0;\n\nfloat4 main(PS_INPUT inp) : SV_Target {\n    float2 glitchOffset = float2(sin(time * 3.0), cos(time * 4.0)) * 0.05;\n    \n    float2 uvWithGlitch = inp.uv + glitchOffset;\n\n    float4 color = texture0.Sample(sampler0, uvWithGlitch);\n    \n    color.rgb += sin(time * 5.0) * 0.1;\n    \n    return color;\n}\n\n")

slot_0_10_0:create()

slot_0_11_0 = draw.shader("cbuffer cb : register(b0) {\n    float4x4 mvp;\n    float2 tex;\n    float time;\n    float alpha;\n};\n\nstruct PS_INPUT {\n    float4 pos : SV_POSITION;\n    float4 col : COLOR0;\n    float2 uv : TEXCOORD0;\n};\n\nsampler sampler0;\nTexture2D texture0;\n\nfloat4 main(PS_INPUT inp) : SV_Target {\n    float2 uv = inp.uv;\n\n    float distortX = sin(uv.x * 20.0 + time * 5.0) * 0.05;\n    float distortY = cos(uv.y * 20.0 + time * 5.0) * 0.05;\n\n    uv += float2(distortX, distortY);\n\n    float4 color = texture0.Sample(sampler0, uv);\n\n    float flickerEffect = 0.8 + 0.2 * sin(time * 3.0);\n    color.rgb *= flickerEffect;\n\n    return color;\n}\n\n\n")

slot_0_11_0:create()

slot_0_12_0 = slot_0_0_0
slot_0_13_0 = gui.ctx:find("lua>elements b")

slot_0_13_0:reset()

slot_0_14_0 = gui.label(gui.control_id("spacer"))

slot_0_13_0:add(gui.make_control("", slot_0_14_0))

slot_0_15_0 = gui.label(gui.control_id("label"), "Drunk.lua is loaded", draw.color(230, 230, 230, 255), true)

slot_0_13_0:add(gui.make_control("", slot_0_15_0))

slot_0_16_0 = gui.label(gui.control_id("label"), "Enable/disable lua to toggle shader(s).", draw.color(230, 230, 230, 255), true)

slot_0_13_0:add(gui.make_control("", slot_0_16_0))

slot_0_17_0 = gui.label(gui.control_id("spacer"))

slot_0_13_0:add(gui.make_control("", slot_0_17_0))

slot_0_18_0 = gui.label(gui.control_id("spacer"))

slot_0_13_0:add(gui.make_control("", slot_0_18_0))

slot_0_19_0 = gui.label(gui.control_id("label"), "Shader Options", draw.color(230, 230, 230, 255), true)

slot_0_13_0:add(gui.make_control("", slot_0_19_0))

slot_0_20_0 = gui.label(gui.control_id("spacer"))

slot_0_13_0:add(gui.make_control("", slot_0_20_0))

slot_0_21_0 = gui.combo_box(gui.control_id("shaders"))
slot_0_22_0 = {
        {
                name = "Drunk Shader",
                id = "drunkShader",
                shader = slot_0_0_0
        },
        {
                name = "Wave Shader",
                id = "waveShader",
                shader = slot_0_1_0
        },
        {
                name = "Shake Shader",
                id = "shakeShader",
                shader = slot_0_2_0
        },
        {
                name = "Weird Static Distortion",
                id = "weirdStaticDistortion",
                shader = slot_0_3_0
        },
        {
                name = "Slight Deform",
                id = "slightDeform",
                shader = slot_0_4_0
        },
        {
                name = "Ripple Shader",
                id = "rippleShader",
                shader = slot_0_5_0
        },
        {
                name = "Dream Shader",
                id = "dreamShader",
                shader = slot_0_6_0
        },
        {
                name = "Dream Shader 2",
                id = "dreamShader2",
                shader = slot_0_8_0
        },
        {
                name = "Pixelation Shader",
                id = "pixelationShader",
                shader = slot_0_7_0
        },
        {
                name = "Psychedelic Waves",
                id = "psychedelicWaves",
                shader = slot_0_9_0
        },
        {
                name = "Panic Attack",
                id = "panicAttack",
                shader = slot_0_10_0
        },
        {
                name = "Nightmare Shader",
                id = "nightmareShader",
                shader = slot_0_11_0
        }
}

for iter_0_0, iter_0_1 in ipairs(slot_0_22_0) do
        slot_0_28_0 = gui.selectable(gui.control_id(iter_0_1.id), iter_0_1.name)

        slot_0_21_0:add(slot_0_28_0)
end

slot_0_13_0:add(gui.make_control("Shader Selection", slot_0_21_0))
slot_0_21_0:add_callback(function()
        local var_1_0 = slot_0_21_0:get_value():get():get_raw()

        for iter_1_0, iter_1_1 in ipairs(slot_0_22_0) do
                if bit32.band(var_1_0, 2^(iter_1_0 - 1)) ~= 0 then
                        slot_0_12_0 = iter_1_1.shader

                        break
                end
        end
end)

function draw_my_shader(arg_2_0, arg_2_1, arg_2_2)
        local var_2_0 = draw.rect(0, 0, 1, 1)
        local var_2_1 = draw.adapter:get_back_buffer()

        arg_2_0.g:set_shader(slot_0_12_0)

        arg_2_0.g.texture = var_2_1
        arg_2_0.g.uv_rect = var_2_0
        arg_2_0.g.chained_call = true

        arg_2_0:add_rect_filled(arg_2_1, arg_2_2)
        arg_2_0.g:set_shader(nil)

        arg_2_0.g.texture = nil
        arg_2_0.g.uv_rect = nil
        arg_2_0.g.chained_call = false
end

events.present_queue:add(function()
        local var_3_0 = draw.surface
        local var_3_1, var_3_2 = game.engine:get_screen_size()

        draw_my_shader(var_3_0, draw.rect(0, 0, var_3_1, var_3_2), draw.color(255, 255, 255, 255))
end)
print("    \n     _                  _      _             \n    | |                | |    | |            \n  __| |_ __ _   _ _ __ | | __ | |_   _  __ _ \n / _` | '__| | | | '_ \\| |/ / | | | | |/ _` |\n| (_| | |  | |_| | | | |   < _| | |_| | (_| |\n \\__,_|_|   \\__,_|_| |_|_|\\_(_)_|\\__,_|\\__,_|\n                                   \n            has somehow managed to load! (hopefully)\n\n    i might add more shaders if my dumbass can make some shit up\n")
