--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol 

slot_0_0_0 = gui.checkbox(gui.control_id("swoop>invert_screen>enabled"))
slot_0_1_0 = gui.checkbox(gui.control_id("swoop>rgbpuke>enabled"))
slot_0_2_0 = gui.checkbox(gui.control_id("swoop>bloom>enabled"))
slot_0_3_0 = gui.ctx:find("lua>elements a")

slot_0_3_0:add(gui.make_control("Invert screen", slot_0_0_0))
slot_0_3_0:add(gui.make_control("RGBPuke", slot_0_1_0))
slot_0_3_0:add(gui.make_control("Paki bloom", slot_0_2_0))
slot_0_3_0:reset()
print(string.format("Hi %s are you ready to dominate?", gui.ctx.user.username))

slot_0_4_0 = draw.shader("cbuffer cb : register(b0) {\n    float4x4 mvp;\n    float2 tex;\n    float time;\n    float alpha;\n};\n\nstruct PS_INPUT {\n    float4 pos : SV_POSITION;\n    float4 col : COLOR0;\n    float2 uv : TEXCOORD0;\n};\n\nSamplerState sampler0 : register(s0) {\n    Filter = MIN_MAG_MIP_LINEAR;\n    AddressU = Wrap;\n    AddressV = Wrap;\n};\nTexture2D texture0;\n\nfloat4 main(PS_INPUT inp) : SV_Target {\n    float4 color = texture0.Sample(sampler0, inp.uv);\n    float luminance = dot(color.rgb, float3(0.299, 0.587, 0.114));\n    float4 bloom = saturate((luminance - 0.8) * 5.0) * color;\n    return saturate(color + bloom * alpha);\n    return color;\n}\n\n")
slot_0_5_0 = draw.shader("cbuffer cb : register(b0) {\n    float4x4 mvp;\n    float2 tex;\n    float time;\n    float alpha;\n};\n\nstruct PS_INPUT {\n    float4 pos : SV_POSITION;\n    float4 col : COLOR0;\n    float2 uv : TEXCOORD0;\n};\n\nSamplerState sampler0 : register(s0);\nTexture2D texture0;\n\nfloat4 main(PS_INPUT inp) : SV_Target {\n    float2 invertedUV = float2(inp.uv.x, 1.0 - inp.uv.y);\n    float4 texColor = texture0.Sample(sampler0, invertedUV);\n    return texColor;\n}\n\n")
slot_0_6_0 = draw.shader("cbuffer cb : register(b0) {\n    float4x4 mvp;\n    float2 tex;\n    float time;\n    float alpha;\n};\n\nstruct PS_INPUT {\n    float4 pos : SV_POSITION;\n    float4 col : COLOR0;\n    float2 uv : TEXCOORD0;\n};\n\nSamplerState sampler0 : register(s0);\nTexture2D texture0;\n\nfloat3 HueShift(float3 color, float shift) {\n    const float3 k = float3(0.57735, 0.57735, 0.57735);\n    float cosAngle = cos(shift);\n    float sinAngle = sin(shift);\n    return color * cosAngle + cross(k, color) * sinAngle + k * dot(k, color) * (1.0 - cosAngle);\n}\n\nfloat4 main(PS_INPUT inp) : SV_Target {\n    float wave = sin(inp.uv.x * 10 + time * 5) * 0.05;\n    float2 distortedUV = inp.uv + float2(wave, wave);\n    \n    float4 texColor = texture0.Sample(sampler0, distortedUV);\n    \n    float3 shiftedColor = HueShift(texColor.rgb, (time + sin((distortedUV.x * distortedUV.y))) * 5);\n    \n    return float4(shiftedColor, 1);\n}\n\n\n")

function draw_invert_screen(arg_1_0)
        if slot_0_0_0:get_value():get() then
                local var_1_0 = arg_1_0.g
                local var_1_1, var_1_2 = game.engine:get_screen_size()

                slot_0_5_0:create()

                var_1_0.texture = draw.adapter:get_back_buffer(), var_1_0:set_shader(slot_0_5_0)

                for iter_1_0 = 1, var_1_1, 5 do
                        local var_1_3 = iter_1_0 / var_1_1
                        local var_1_4 = (iter_1_0 + 1) / var_1_1

                        var_1_0.uv_rect = draw.rect(var_1_3, 0, var_1_4, 1)

                        arg_1_0:add_rect_filled(draw.rect(iter_1_0, 0, iter_1_0 + 2.5, var_1_2), draw.color(0, 0, 0, 255))
                end

                var_1_0:set_shader(nil)
                var_1_0:set_texture(nil)
        end
end

function draw_rgbpuke_effect(arg_2_0)
        if slot_0_1_0:get_value():get() then
                local var_2_0 = arg_2_0.g
                local var_2_1, var_2_2 = game.engine:get_screen_size()

                slot_0_6_0:create()

                var_2_0.texture = draw.adapter:get_back_buffer(), var_2_0:set_shader(slot_0_6_0)
                var_2_0.uv_rect = draw.rect(0, 0, 1, 1)

                arg_2_0:add_rect_filled(draw.rect(0, 0, var_2_1, var_2_2), draw.color(0, 0, 0, 255))
                var_2_0:set_shader(nil)
                var_2_0:set_texture(nil)
        end
end

function draw_bloom(arg_3_0)
        if slot_0_2_0:get_value():get() then
                local var_3_0 = arg_3_0.g
                local var_3_1, var_3_2 = game.engine:get_screen_size()

                slot_0_4_0:create()

                var_3_0.texture = draw.adapter:get_back_buffer(), var_3_0:set_shader(slot_0_4_0)
                var_3_0.uv_rect = draw.rect(0, 0, 1, 1)

                arg_3_0:add_rect_filled(draw.rect(0, 0, var_3_1, var_3_2), draw.color(0, 0, 0, 255))
                var_3_0:set_shader(nil)
                var_3_0:set_texture(nil)
        end
end

events.present_queue:add(function()
        local var_4_0 = draw.surface

        draw_invert_screen(var_4_0)
        draw_rgbpuke_effect(var_4_0)
        draw_bloom(var_4_0)
end)
