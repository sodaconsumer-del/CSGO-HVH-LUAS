local _ = beta;
local _ = require("neverlose/pui");
local _ = require("neverlose/clipboard");
local _ = require("neverlose/base64");
local l_pui_1 = require("neverlose/pui");
local l_clipboard_1 = require("neverlose/clipboard");
local l_base64_1 = require("neverlose/base64");
local l_gradient_0 = require("neverlose/gradient");
local _ = require("neverlose/smoothy");
local _ = require("neverlose/bomb");
local _ = require("neverlose/vmt_hook");
local v11 = {
    build = "beta", 
    name = common.get_username()
};
local v12 = l_gradient_0.text_animate("EclipseHook ", -5, {
    color(255, 255, 255), 
    color(192, 192, 192), 
    color(128, 128, 128)
});
events.render:set(function(_)
    -- upvalues: v12 (ref)
    sidebar = ui.sidebar(v12:get_animated_text(), "credit-card");
    v12:animate();
end);
local function _(v14, v15)
    return function(...)
        -- upvalues: v14 (ref), v15 (ref)
        return v14(v15, ...);
    end;
end;
local _ = ffi.cast(ffi.typeof("uintptr_t**"), utils.create_interface("client.dll", "VClientEntityList003"));
local v23 = {
    lerp = function(v18, v19, v20)
        return v18 + (v19 - v18) * v20;
    end, 
    breath = function(v21)
        v21 = v21 % 2;
        if v21 > 1 then
            v21 = 2 - v21;
        end;
        return v21;
    end, 
    u8 = function(v22)
        return string.gsub(v22, "[\128-\191]", "");
    end
};
v23.gradient = function(v24, v25, v26, v27)
    -- upvalues: v23 (ref)
    local v28 = {};
    local v29 = 1 / (#v23.u8(v24) - 1);
    local v30 = v27.r - v26.r;
    local v31 = v27.g - v26.g;
    local v32 = v27.b - v26.b;
    local v33 = v27.a - v26.a;
    for v34 in string.gmatch(v24, ".[\128-\191]*") do
        local v35 = v23.breath(v25);
        local v36 = v26.r + v30 * v35;
        local v37 = v26.g + v31 * v35;
        local v38 = v26.b + v32 * v35;
        local v39 = v26.a + v33 * v35;
        v28[#v28 + 1] = "\a";
        v28[#v28 + 1] = color(v36, v37, v38, v39):to_hex();
        v28[#v28 + 1] = v34;
        v25 = v25 - v29;
    end;
    return table.concat(v28);
end;
v23.extrapolate = function(v40, v41, v42)
    local l_tickinterval_0 = globals.tickinterval;
    local v44 = cvar.sv_gravity:float() * l_tickinterval_0;
    local v45 = cvar.sv_jump_impulse:float() * l_tickinterval_0;
    local l_v41_0 = v41;
    local l_v41_1 = v41;
    local v48 = vector(v40.m_vecVelocity);
    local v49 = v48.z > 0 and -v44 or v45;
    for _ = 1, v42 do
        l_v41_1 = l_v41_0;
        l_v41_0 = vector(l_v41_0.x + v48.x * l_tickinterval_0, l_v41_0.y + v48.y * l_tickinterval_0, l_v41_0.z + (v48.z + v49) * l_tickinterval_0);
        if utils.trace_line(l_v41_1, l_v41_0, nil, 2).fraction <= 0.99 then
            return l_v41_1;
        end;
    end;
    return l_v41_0;
end;
local v51 = nil;
v51 = {};
local v52 = utils.get_vfunc("engine.dll", "VEngineClient014", 91, "float(__thiscall*)(void*)");
local function v60(v53, v54, v55, v56, v57)
    local v58 = v53(v56, v54, v55 - v54, v57);
    if type(v58) == "number" then
        if math.abs(v55 - v58) <= 0.01 then
            return v55;
        else
            local v59 = v58 % 1;
            if v59 < 0.001 then
                return math.floor(v58);
            elseif v59 > 0.999 then
                return math.ceil(v58);
            end;
        end;
    end;
    return v58;
end;
local v61 = {};
do
    local l_v52_0, l_v60_0, l_v61_0 = v52, v60, v61;
    local function v73(v65, v66, v67, v68)
        -- upvalues: l_v52_0 (ref), l_v60_0 (ref)
        local v69 = type(v65.value);
        local v70 = type(v67);
        if v70 == "boolean" then
            v67 = v67 and 1 or 0;
            v70 = "number";
        end;
        assert(v69 == v70, string.format("type mismatch, expected %s (received %s)", v69, v70));
        if v67 ~= v65.to then
            v65.clock = 0;
            v65.from = v65.value;
            v65.to = v67;
        end;
        local v71 = globals.frametime / l_v52_0();
        local v72 = v66 or 0.15;
        if v65.clock == v72 then
            return v67;
        elseif v71 <= 0 and v72 <= v71 then
            v65.clock = 0;
            v65.from = v67;
            v65.to = v67;
            v65.value = v67;
            return v67;
        else
            v65.clock = math.min(v65.clock + v71, v72);
            v65.value = l_v60_0(v68 or v65.easings, v65.from, v65.to, v65.clock, v72);
            return v65.value;
        end;
    end;
    l_v61_0.__metatable = false;
    l_v61_0.__call = v73;
    l_v61_0.__index = l_v61_0;
    v51.new = function(v74, v75)
        -- upvalues: l_v61_0 (ref)
        if type(v74) == "boolean" then
            v74 = v74 and 1 or 0;
        end;
        local v80 = {
            clock = 0, 
            value = not v74 and 0 or v74, 
            easings = v75 or function(v76, v77, v78, v79)
                return v78 * v76 / v79 + v77;
            end
        };
        return setmetatable(v80, l_v61_0);
    end;
end;
v52 = {
    render = {}
};
v52.render.screen = render.screen_size();
v52.render.menu = render.load_image(network.get("https://raw.githubusercontent.com/th3bloor4/eclipse-hook/refs/heads/main/eclipsehook.png", {}), vector(125, 150));
v52.render.watermark = render.load_image(network.get("https://raw.githubusercontent.com/th3bloor4/eclipse-hook/refs/heads/main/eclipsehook.png", {}), vector(36, 50));
v52.render.defensive = render.load_image(network.get("https://raw.githubusercontent.com/th3bloor4/eclipse-hook/refs/heads/main/shield.png", {}), vector(20, 20));
v52.render.velocity = render.load_image(network.get("https://raw.githubusercontent.com/th3bloor4/eclipse-hook/refs/heads/main/man.png", {}), vector(25, 25));
v52.render.bomb = render.load_image("\137PNG\r\n\026\n\000\000\000\rIHDR\000\000\000d\000\000\000\\\b\003\000\000\000\175\021\224\166\000\000\000\001sRGB\001\217\201,\127\000\000\000\tpHYs\000\000\v\019\000\000\v\019\001\000\154\156\024\000\000\002\223PLTE\000\000\000\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255v\153it\000\000\000\245tRNS\000\001C\147X\006Z\251\255\253\150\004\213\249\002\014\227\024\022\234+\027\2396)sr\030\242?uk \235\2442!\246G/\231\2267^\183\015#\248Q\b\179\154}\247c\000pz\193%n-\224b\252\194(v\174\136\v\201]~\250\233'\\\223\0181\132\216\140\207\151:\138\003\172\218\028l.B\143{\161K\149\016\202\019U=\0263\nNi\130\187A\199\128\135\145\158\166\170\134\127_&\220\254I\232\023\195F\137\146\186,\192\184\163\159\168\175\177\181\188\212|\243\157$\r\142[\005\217\209\153\241\204\203\155O\020\206\197\205\0250\245\a\222\021\164\029\017\229\131*\160q\214\208\198\185\169mR5\221\f\228d\237\191\196\141w\133\139\144\238\230\165x\236\t`\031\129\171\156\1528aJ\1784L\219\167\210E9S\176\240\189\148M\180DT>\162\"Yj\225\215\173@H;\190et4r\001\212\000\000\anIDATx\156\237\154\249[\212F\024\199\179\"2+\139\138X\208B\229\016T(B\017p\017\017\016\149\"(V,\136\020\005\228\180\028\197 `E\188Q\001\161\136\136\162\162xq\021\021\v\136x\v\021T\020\207\nx\182\181\213Z\219\218\235\015hf&\187\155\132\221%\134\165\207\211>\190\191d\231\155\247}?9f\146w&K\016\002L4@k\160\182\144\1927\177A:@<\184\159\025\186\018\000\128\222\144\254\133\f\029FA\128~\255B\134\027@\200\136\254\133\188c\b!F\154K8r\212\187=\014\217\216\004B\222\227\168\162\145\163M\205\0041\244\205\001\176\024\195\017-\173 d,G\0297\030\000k\027!\144\247a:\219\tl\209\206\030\170\031\176E\135\137Pt\020\002\177\019\195P'\142\232\f\197I,M\234\162\003\197\201B \132+\f\021\179o\203\020=(\186\177\180\169\227\161\230n&\b\226\225\t\131\167905/\164MgJ\1863\160\004f\nb\016\222\031\162h\031\1666\002I\179\024\138\212\195\023J~\179\133A\1369(\163\255\\\134\244\017\146\2301\020\203\000$\205\023\252\168\249\024\197\a2\226\131\144\178@!\004/DJ\200'B\025D(\186\003\022\139\020\202b\1482L!\140E\002\b\023\204\144\221\149\b\133\178\004\t\145\242v\020\246\136\142\017\014!\198\196B\139S\bK\145\240\169\188\029\159\144\232\150\228\248Yr\031\024o\237\127cR\227P\219e\131D\178f\130\169\155\019I\146)\203#\177\005\166\166\165\243\180\136@\024\160\181\226s\151\149\025l\134\254tw\170W\219{\225\150\003i\0154a\171\024}|\200\148\249\1712\145\186\026\vnb\1410\168'\181\183\140a\182`\r\173\025\172\197\202:\r1\128\243z\156\208{\131\191L\178ZBc\253\213\005\190\145\133\162|\027\205\229B\214&\217\185\025\240\203\016\176yKv\142\194\"\178\211r\211\023n\205\155\152\191%\235\139\002\236\178\r\229\147Gx\146Q\242\155T\200\aa\161\246m\020\139\157R\152\016\207\237E\f\015^}\203z\a\015H1\003\226\183s\023\211\131W\231*\217\1654;\027\162%\135\024jq\ne>\f \017)\201\205\133\004\162\006\245\138\2032\210\229x\240\130\236V\199\144A\246\160\198\222\210\213\\\004O\200>>\144\253\168Qv@\137\a/\200A>\144\237\170=xA\014\241\129\164\246\017\018\r=c\226\014\031\017\137\202+f\014%*\195K\141\2275\r)\128\158\185\133:U\213\195\253\128\213rbR\166x\141bBACr\250\b\145H)\207/\0010\1699z\f\150u\199\169\159\181\\\200\137\190B\2248\177\252*+\214Adc\016\184\150\152\189\160\196g\130\166!uj\139\\\rA\002\130\255\005H\136\218E\014\026\130\v\217\241\195\170J\n\234\2475\184\158\156\145\222\184g\222\169\166\211KE\252 g\028x@\178U\028\180\161\027?\136\251Y\030\1444UWf\149J\1369\170y\246\226\198\185(\030\144tU\016\019U\144\204\243(D\130[\023\212.\164\244\006\137V\005\1858\129\t\017_\202kn\025\205\176\150\201\219f\145I_\167l\184\220\220\186\209\150\003\017[\180]q/\145H\014\187\230_m\189f\218\020\163\002\210nD\\/R@xY#\130\028\245V\210\221\149\a\180JE\2257\004A\148\154\204\197j\243\172\184\142\202\168Q\168QeF\148_\024\203\128\024\238'o\230\154P\221\172\153$\179\157\169n\1775)\233\150\0145J\195H\242\182/_H\189\017~\141\215\192\134\175\135\148\184\003\2382 \247\224>\018\1282\184\r\003zA\212F\186\005\180u\192\246I\236\147\219\027\164t(nI\191\129\173\251\193Dg;X\196\128\160\197\173.\000:\241\214\031\213\189\129\160\027=\t\"\177\207\131^ z\176\160\220q\249\161D\210N\181*:\b\221\019xiN\006\129gE<\002\000M>\031\211\213\203m\176\170\018n\181\248A\242\168\031\218\247\233\132\153\205T\030g6\228\017tm\002\224\t\220.\161\235\176[t\209\151\141}\210z\129\192K~O\214\005\252k\b\"\021\176!\167j)s\002 \220L\191\186\166\017T\148\r\175^Zt\b\152\aA\157\158\024\\\237\005r\154\186\027\r2\200dj\134\225*\145H\236\168\189y\018\019\021\029\182\167\225\a\228\001eo\005\180\127\0285;\170\163}\205\217\207\169\193\188!\248Q\223\176\220X\005\004\206_\002i\223\167\236\2537\145\168S%\t\248\150\218zvKJ,\160` \169k\1636\206%\146\238\n:\016\215]V\160\221\173Gy\142\246\195\005\178\140v\236\219\016K\027\236\213F\177\223!\1779FZi3\r\000\199\179\196\245\228n\000\190\175\021\233\006\237\005\190\231\227\137\029\207\218p ^\127\132\135\240\195]e\144h\216%\203\031Z\177N\031\222\248\131\244o8\248\136\213\000\160:(\020\248\161Zt\006\176F\195+\021\251\224\021\029<\169\n\235\232\t\017\255\b\127\206\029\240<6\150\005\145\202z\215c\184?\025\128\169p\251\002\004\160\154z?=N\232\219\134\215\166\134\225FHS0\023\002\206X\210M\017\251Ld\144\197p_\023=^d\1311\130\030\249?a\159\021(A\183,<\253\165\148\003\001u\003\241\027\214L9\164\v\238\243\001\224g\184}\005\174\160\213\194<p\f\245Dz\020\135\163\004\151\229\243\195\170\004.\004\000\251\137\197$\025\246\vPj\005\023)+\001\224\215\173\2179\233\212\173\v\137\200y\144o\b|/A\221\016\251\188\194\t-\159\202\186\027(\158\203\133\244\213<\159\208\025w%\148f\210Z>=\r\180\214\020d\141\151\252\234T'\214\209SQzy\239t\183\250X\222\214\200,e\143\\\195\a/\251@0\213\189O\185\197\021\021\021\133\006~U\191\217\177F\006a\214\178\207\1760W>k\030\017\219\023kJ~\253\250\197\166\145Jf\138\218\157q\241=\213\183\246_1o\023\146$\157|\024\139\253/Ih\191+\132?\160\v9]mU\174\222\018\209w$\2413\133\242\002\245\221\249\n\2259\238\205\166\194!\165(\193no\133b\131\148\020\133\160\189\f)\209jg1\234l\016\138\247e~\186,GR\018C\233D\175*O7n0O\187\142\015\210\145\185\022\213\243s\211\144\227H\170W\182x\195\195n\160;r\193\146\169y\161\167_\vS\138\169G\020\015a\144?Q\240$)S\203@e\188\v\203\2399\002\175\019\244W\128\181\232Dl\217k\005Eh\2212\145\165iG@\205\190K\bd%\f=W\203\022\241\183_\206\165\233@\175\140@!\1442\0249\135#v\160\242n'G\253\139\186`:\161B \186\145V\134N\220\133\149\0264\241\230|`&\028\254\014(\189\167\185\191g\028A%\227z\141\229Sj\213~\016\162\193\127\022(3\252G\f\203\222\029\251b\186p\150\225\171v\209[\003VLA\166\2453\131\136iM\191\147\209\187\155\220\254\001Q\1440+D^\186l\000\000\000\000IEND\174B`\130", vector(32, 24));
v52.render.gamesense = render.load_font("Calibri Bold", vector(23, 23.5, 0), "da");
v52.render.arrows = render.load_font("Calibri Bold", vector(23, 23.5, 0), "a");
v60 = v52.render;
v61 = v52.render;
local v81 = 28;
v61.y = v52.render.screen.y - 350;
v60.x = v81;
v52.render.shot = 0;
v52.render.hit = 0;
v52.render.planting = false;
v52.render.abort_defuse = false;
v52.render.defused = false;
v52.render.planting_site = "";
v52.render.fill = 0;
v52.render.plant_time = 0;
v52.render.render_indicator = function(v82, v83, v84, v85)
    -- upvalues: v52 (ref)
    local v86 = render.measure_text(v52.render.gamesense, nil, v82);
    if v85 then
        render.gradient(vector(5, v52.render.y + 3 - v84), vector(v52.render.x + (v85.width + v86.x) / 2 + 3, v52.render.y + 37 - v84), color(0, 0), color(0, 50), color(0, 0), color(0, 50));
        render.gradient(vector(v52.render.x + (v85.width + v86.x) / 2 + 3, v52.render.y + 3 - v84), vector(v52.render.x + v86.x + v85.width + 34, v52.render.y + 37 - v84), color(0, 50), color(0, 0), color(0, 50), color(0, 0));
        render.texture(v85, vector(v52.render.x, v52.render.y + 7 - v84), v83);
        render.text(v52.render.gamesense, vector(v52.render.x + v85.width + 6, v52.render.y + 9 - v84), v83, "d", v82);
    else
        render.gradient(vector(5, v52.render.y + 3 - v84), vector(v52.render.x + v86.x / 2, v52.render.y + 37 - v84), color(0, 0), color(0, 50), color(0, 0), color(0, 50));
        render.gradient(vector(v52.render.x + v86.x / 2, v52.render.y + 3 - v84), vector(v52.render.x + v86.x + 28, v52.render.y + 37 - v84), color(0, 50), color(0, 0), color(0, 50), color(0, 0));
        render.text(v52.render.gamesense, vector(v52.render.x, v52.render.y + 9 - v84), v83, "d", v82);
    end;
end;
v52.damage_apply_armor = function(v87, v88)
    local v89 = 0.5;
    local v90 = 0.5;
    if v88 > 0 then
        local v91 = v87 * v89;
        if v88 < (v87 - v91) * v90 then
            v91 = v87 - v88 * (1 / v90);
        end;
        v87 = v91;
    end;
    return v87;
end;
v52.calculate_damage = function(v92, v93, v94)
    -- upvalues: v52 (ref)
    local v95 = v92:get_eye_position():dist(v93:get_origin());
    local v96 = 500;
    local v97 = v96 * 3.5;
    v96 = v96 * math.exp(-(v95 * v95 / (v97 * 2 / 3 * (v97 / 3))));
    return (math.floor(v52.damage_apply_armor(math.max(v96, 0), v94)));
end;
v52.shot = 0;
v52.hit = 0;
v52.aim_ack = function(v98)
    -- upvalues: v52 (ref)
    if v98.damage ~= nil then
        v52.render.hit = v52.render.hit + 1;
    end;
    v52.render.shot = v52.render.shot + 1;
end;
v52.reset = function()
    -- upvalues: v52 (ref)
    v52.abort_defuse = false;
    v52.defused = false;
    v52.planting = false;
    v52.planting_site = "";
    v52.fill = 0;
    v52.plant_time = 0;
end;
v52.e_abort_defuse = function()
    -- upvalues: v52 (ref)
    v52.abort_defuse = true;
    v52.defused = false;
    v52.planting = false;
    v52.planting_site = "";
    v52.fill = 0;
    v52.plant_time = 0;
end;
v52.e_defused = function()
    -- upvalues: v52 (ref)
    v52.abort_defuse = false;
    v52.defused = true;
    v52.planting = false;
    v52.planting_site = "";
    v52.fill = 0;
    v52.plant_time = 0;
end;
v52.begin_plant = function(v99)
    -- upvalues: v52 (ref)
    v52.abort_defuse = false;
    v52.defused = false;
    v52.planting = true;
    local v100 = entity.get_player_resource();
    if not v100 then
        return;
    else
        local l_m_bombsiteCenterA_0 = v100.m_bombsiteCenterA;
        local l_m_bombsiteCenterB_0 = v100.m_bombsiteCenterB;
        local v103 = entity.get(v99.site);
        if not v103 then
            return;
        else
            local v104 = v103.m_vecMins:lerp(v103.m_vecMaxs, 0.5);
            v52.planting_site = v104:dist(l_m_bombsiteCenterA_0) < v104:dist(l_m_bombsiteCenterB_0) and "A" or "B";
            v52.plant_time = globals.curtime;
            return;
        end;
    end;
end;
events.aim_ack:set(function(v105)
    -- upvalues: v52 (ref)
    v52.aim_ack(v105);
end);
events.bomb_beginplant:set(function(v106)
    -- upvalues: v52 (ref)
    v52.begin_plant(v106);
end);
events.bomb_abortplant:set(function()
    -- upvalues: v52 (ref)
    v52.reset();
end);
events.bomb_planted:set(function()
    -- upvalues: v52 (ref)
    v52.reset();
end);
events.bomb_begindefuse:set(function()
    -- upvalues: v52 (ref)
    v52.reset();
end);
events.bomb_abortdefuse:set(function()
    -- upvalues: v52 (ref)
    v52.e_abort_defuse();
end);
events.bomb_defused:set(function()
    -- upvalues: v52 (ref)
    v52.e_defused();
end);
events.round_start:set(function()
    -- upvalues: v52 (ref)
    v52.e_defused();
end);
v52.state = {};
v52.state.global = {
    [1] = "global", 
    [2] = "standing", 
    [3] = "running", 
    [4] = "walking", 
    [5] = "crouching", 
    [6] = "crouching-move", 
    [7] = "air", 
    [8] = "air-crouching"
};
v60 = {
    data = {}, 
    new = function(v107, v108, v109, v110, v111, v112)
        v107.data[v108] = v107.data[v108] or {
            method = "lerp", 
            increasing = v109, 
            speed = v110 or 4, 
            modifier = v111 or 0, 
            value = v112 or 0
        };
        return v107.data[v108];
    end, 
    spin = function(v113, v114, v115, v116, v117, v118, v119)
        v113.data[v114] = v113.data[v114] or {
            active = 0, 
            method = "spin", 
            start = math.min(v115, v116), 
            target = math.max(v115, v116), 
            speed = v117 or 4, 
            iterations = v118 or 1, 
            value = v119 or v115
        };
        local v120 = v113.data[v114];
        local v121 = math.min(v115, v116);
        v120.target = math.max(v115, v116);
        v120.start = v121;
        v121 = v117;
        v120.iterations = v118;
        v120.speed = v121;
        return v120;
    end, 
    tick = function(v122, v123)
        for _, v125 in pairs(v122.data) do
            if v125.method == "spin" then
                local v126 = v123 - v125.active;
                if v125.speed < v126 or math.abs(v126) > 64 then
                    for _ = 1, v125.iterations do
                        if v125.value < v125.target then
                            v125.value = v125.value + 1;
                        else
                            v125.value = v125.start;
                        end;
                    end;
                    v125.active = v123;
                end;
            end;
        end;
    end
};
v61 = {
    refs = {}
};
v61.refs.pitch = l_pui_1.find("Aimbot", "Anti Aim", "Angles", "Pitch");
v61.refs.yawbase = l_pui_1.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base");
v61.refs.yaw = l_pui_1.find("Aimbot", "Anti Aim", "Angles", "Yaw");
v61.refs.base = l_pui_1.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base");
v61.refs.yawoffset = l_pui_1.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset");
v61.refs.avoidbackstab = l_pui_1.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab");
v61.refs.hidden = l_pui_1.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden");
v61.refs.yawmodifier = l_pui_1.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier");
v61.refs.yawmodifieroffset = l_pui_1.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset");
v61.refs.bodyyaw = l_pui_1.find("Aimbot", "Anti Aim", "Angles", "Body Yaw");
v61.refs.bodyyaw_invert = l_pui_1.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter");
v61.refs.bodyyaw_leftlimit = l_pui_1.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit");
v61.refs.bodyyaw_rightlimit = l_pui_1.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit");
v61.refs.bodyyaw_options = l_pui_1.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options");
v61.refs.bodyyaw_freestanding = l_pui_1.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding");
v61.refs.freestanding = l_pui_1.find("Aimbot", "Anti Aim", "Angles", "Freestanding");
v61.refs.dormant_aimbot = l_pui_1.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot");
v61.refs.antiuntrusted = l_pui_1.find("Miscellaneous", "Main", "Other", "Anti Untrusted");
v61.refs.lagoptions = l_pui_1.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options");
v61.refs.hideshotsoptions = l_pui_1.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options");
v61.refs.doubletap = l_pui_1.find("Aimbot", "Ragebot", "Main", "Double Tap");
v61.refs.hideshots = l_pui_1.find("Aimbot", "Ragebot", "Main", "Hide Shots");
v61.refs.immediateteleport = l_pui_1.find("Aimbot", "Ragebot", "Main", "Double Tap", "Immediate Teleport");
v61.refs.fakeduck = l_pui_1.find("Aimbot", "Anti Aim", "Misc", "Fake Duck");
v61.refs.mindamage = l_pui_1.find("Aimbot", "Ragebot", "Selection", "Min. Damage");
v61.refs.fakeping = l_pui_1.find("Miscellaneous", "Main", "Other", "Fake Latency");
v61.refs.dormant = l_pui_1.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot");
v61.refs.safepoint = l_pui_1.find("Aimbot", "Ragebot", "Safety", "Safe Points");
v61.refs.bodyaim = l_pui_1.find("Aimbot", "Ragebot", "Safety", "Body Aim");
v61.refs.bodyaim_disablers = l_pui_1.find("Aimbot", "Ragebot", "Safety", "Body Aim", "Disablers");
v61.refs.force_on_peek = l_pui_1.find("Aimbot", "Ragebot", "Safety", "SSG-08", "Body Aim", "Force on Peek");
v61.refs.slowwalk = l_pui_1.find("Aimbot", "Anti Aim", "Misc", "Slow Walk");
v61.refs.fakelag = l_pui_1.find("Aimbot", "Anti Aim", "Fake Lag", "Enabled");
v61.refs.limit = l_pui_1.find("Aimbot", "Anti Aim", "Fake Lag", "Limit");
v61.refs.variability = l_pui_1.find("Aimbot", "Anti Aim", "Fake Lag", "Variability");
v61.refs.leg = l_pui_1.find("Aimbot", "Anti Aim", "Misc", "Leg Movement");
v61.refs.hc = l_pui_1.find("Aimbot", "Ragebot", "Selection", "Hit Chance");
v61.refs.lat = l_pui_1.find("Miscellaneous", "Main", "Other", "Fake Latency");
v61.refs.peek = l_pui_1.find("Aimbot", "Ragebot", "Main", "Peek Assist");
v61.refs.peekstop = l_pui_1.find("Aimbot", "Ragebot", "Main", "Peek Assist", "Auto Stop");
v61.refs.scope = l_pui_1.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay");
v61.groups = {};
v61.groups.navigation = l_pui_1.create("\239\128\135 global", "eclipsehook");
v61.groups.global = l_pui_1.create("\239\128\135 global", "welcome");
v61.groups.config = l_pui_1.create("\239\128\135 global", "config");
v61.groups.links = l_pui_1.create("\239\128\135 global", "links");
v61.groups.theme = l_pui_1.create("\239\128\135 global", "theme");
v61.groups.visuals = l_pui_1.create("\239\128\135 global", "visuals");
v61.groups.other = l_pui_1.create("\239\128\135 global", "other");
v61.groups.antiaim = l_pui_1.create("\238\147\162 anti-aim", "anti-aim", 1);
v61.groups.state = l_pui_1.create("\238\147\162 anti-aim", "settings");
v61.groups.antiaim_other = l_pui_1.create("\238\147\162 anti-aim", "other");
v61.groups.rage = l_pui_1.create("\239\131\134 additions", "rage");
v61.groups.additions = l_pui_1.create("\239\131\134 additions", "additions");
l_pui_1.colors.attention = color("#DADE6B");
v61.elements = {};
v61.elements.navigation = v61.groups.navigation:list("", {
    [1] = "\239\128\135 global", 
    [2] = "\239\134\152 visuals"
});
v61.elements.global = {};
v61.groups.global:label(string.format("\abdbdbdc8welcome back, \aFFFFFFFF%s!\n\abdbdbdc8current build: \aFFFFFFFF%s\nmade by eclipsehook team with love//", v11.name, v11.build)):depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v61.elements.navigation
});
v61.elements.global.icon = v61.groups.global:texture(v52.render.menu, nil, nil, nil, 6):depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v61.elements.navigation
});
v61.elements.additions = {};
v61.elements.additions.idealtick = v61.groups.rage:switch("\v\f<moon>\r eclipsehook peek assist", false, "this is reworked ideal tick\nmay help you in peek baits / tracking people");
v61.elements.additions.fastladder = v61.groups.rage:switch("\v\f<water-ladder>\r fast ladder");
v61.elements.additions.unlock = v61.groups.additions:switch("\v\f<wrench>\r unlock fake latency", false, function(v128)
    return {
        amount = v128:slider("amount", 0, 200, 0, 1)
    }, true;
end);
v61.elements.additions.super_toss = v61.groups.additions:switch("\v\f<fan>\r super toss");
v61.elements.additions.nofalldamage = v61.groups.additions:switch("\v\f<person-falling-burst>\r no fall damage");
v61.elements.additions.fakelag = v61.groups.additions:switch("\v\f<timer>\r fakelag", false, function(v129)
    return {
        mode = v129:combo("mode", {
            [1] = "cycle", 
            [2] = "randomized"
        }), 
        limit = v129:slider("limit", 1, 14, 14, 1, "t")
    }, true;
end);
v61.elements.additions.animation = v61.groups.additions:switch("\v\f<square-rss>\r animation breakers", false, function(v130)
    return {
        ground = v130:combo("ground", {
            [1] = "-", 
            [2] = "static", 
            [3] = "jitter", 
            [4] = "forward walking", 
            [5] = "kangaroo"
        }), 
        air = v130:combo("air", {
            [1] = "-", 
            [2] = "static", 
            [3] = "jitter", 
            [4] = "walking", 
            [5] = "kangaroo"
        }), 
        lean = v130:slider("lean amount", 0, 100, 75, 1, "%"), 
        pitch = v130:switch("zero pitch on land")
    }, true;
end);
v61.elements.additions.tag = v61.groups.additions:switch("\v\f<tag>\r tag");
v61.elements.additions.killsay = v61.groups.additions:switch("\f<trash>\r kill say");
v61.elements.additions.force_lethal = v61.groups.rage:switch("\v\f<face-hand-peeking>\r force bodyaim if lethal");
v61.elements.additions.hitchance = v61.groups.rage:switch("\v\f<raygun>\r custom hitchance", false, function(v131)
    local v132 = {
        conditions = v131:selectable("hitchance conditions", {
            [1] = "in-air", 
            [2] = "noscope", 
            [3] = "predict"
        })
    };
    v132.air = v131:slider("in-air", 0, 100, 35, 1, "%"):depend({
        [1] = nil, 
        [2] = "in-air", 
        [1] = v132.conditions
    });
    v132.noscope = v131:slider("noscope", 0, 100, 35, 1, "%"):depend({
        [1] = nil, 
        [2] = "noscope", 
        [1] = v132.conditions
    });
    v132.predict = v131:slider("predict", 0, 100, 35, 1, "%"):depend({
        [1] = nil, 
        [2] = "predict", 
        [1] = v132.conditions
    });
    return v132, true;
end);
v61.elements.additions.fastladder = function(v133)
    local v134 = entity.get_local_player();
    if not v134 then
        return;
    else
        if lua.pui.ui.additive.other:get(1) and v134.m_MoveType == 9 then
            if v133.sidemove == 0 then
                v133.view_angles.y = v133.view_angles.y + 45;
            end;
            if v133.sidemove < 0 and v133.in_forward then
                v133.view_angles.y = v133.view_angles.y + 90;
            end;
            if v133.sidemove > 0 and v133.in_back then
                v133.view_angles.y = v133.view_angles.y + 90;
            end;
            v133.in_moveleft = v133.in_back;
            v133.in_moveright = v133.in_forward;
            if v133.view_angles.x < 0 or v133.view_angles.x > 0 then
                v133.view_angles.x = -45;
            end;
        end;
        return;
    end;
end;
v61.elements.additions.nofalldamage = function(v135)
    local v136 = entity.get_local_player();
    if not v136 then
        return;
    else
        local v137 = v136:simulate_movement();
        v137:think(5);
        if v137.velocity.z > -500 then
            return;
        else
            if v137.velocity.z < -200 then
                v135.in_duck = 1;
            end;
            return;
        end;
    end;
end;
v61.elements.config = {};
v61.groups.config:label(" Config System"):depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v61.elements.navigation
});
v61.elements.config.import = v61.groups.config:button("\v\f<file-import>", function()

end):depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v61.elements.navigation
});
v61.elements.config.import:tooltip("import config");
v61.elements.config.export = v61.groups.config:button("\v\f<file-export>", function()
    -- upvalues: l_clipboard_1 (ref), l_base64_1 (ref), l_pui_1 (ref)
    l_clipboard_1.set(l_base64_1.encode(json.stringify(l_pui_1.save())));
end):depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v61.elements.navigation
});
v61.elements.config.export:tooltip("export config");
v61.elements.config.Default = v61.groups.config:button("\v\f<file-check>"):depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v61.elements.navigation
});
v61.elements.config.Default:tooltip("Default setts\n best to game all");
v61.elements.config.Agressive = v61.groups.config:button("\f<file-exclamation>"):depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v61.elements.navigation
});
v61.elements.config.Agressive:tooltip("Agressive setts\n best to game all");
v61.groups.config:label("                   PAID CONFIGS BLOORA"):depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v61.elements.navigation
});
v61.groups.config:label(" Bloora [MAIN] config"):depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v61.elements.navigation
});
v61.elements.config.bloora_main = v61.groups.config:button("\f<crosshairs>", function()
    panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://neverlose.cc/market/item?id=arrXIZ");
end, true):depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v61.elements.navigation
});
v61.elements.config.bloora_main:tooltip("bloora main");
v61.groups.config:label(" Bloora [BETA] config"):depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v61.elements.navigation
});
v61.elements.config.bloora_beta = v61.groups.config:button("\v\f<code>\r", function()
    panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://neverlose.cc/market/item?id=HNyz21");
end, true):depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v61.elements.navigation
});
v61.elements.config.bloora_beta:tooltip("bloora beta");
v61.groups.config:label(" Bloora [STABLE] config"):depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v61.elements.navigation
});
v61.elements.config.bloora_stable = v61.groups.config:button("\239\134\133", function()
    panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://neverlose.cc/market/item?id=p61KbS");
end, true):depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v61.elements.navigation
});
v61.elements.config.bloora_stable:tooltip("bloora stable");
v61.elements.links = {};
v61.groups.links:label("discord"):depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v61.elements.navigation
});
v61.elements.links = v61.groups.links:button("\f<discord>\n", function()
    panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://dsc.gg/eclipse-hook");
end, true):depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v61.elements.navigation
});
v61.elements.links:tooltip("eclipsehook discord");
v61.groups.links:label("youtube"):depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v61.elements.navigation
});
v61.elements.links = v61.groups.links:button("\f<youtube>\n", function()
    panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://www.youtube.com/@th3bloor4");
end, true):depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v61.elements.navigation
});
v61.elements.links:tooltip("owner youtube");
v61.groups.links:label("telegram channel"):depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v61.elements.navigation
});
v61.elements.links = v61.groups.links:button("\f<telegram>\n", function()
    panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://t.me/cfgbybloor4");
end, true):depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v61.elements.navigation
});
v61.elements.links:tooltip("telegram channel");
v61.elements.theme = {};
v61.groups.theme:label("Gamesense"):depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v61.elements.navigation
});
v61.elements.theme = v61.groups.theme:button("\rG\a7DA519FFS", function()
    panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://neverlose.cc/getitem?c=dBP8UlEK1SyAhzNy-dvfsqP3By0");
end, true):depend({
    [1] = nil, 
    [2] = 1, 
    [1] = v61.elements.navigation
});
v61.elements.theme:tooltip("GAMESENSE THEME");
v61.elements.visuals = {};
v61.elements.visuals.master = v61.groups.visuals:switch("\v\f<toggle-on>\r master switch"):depend({
    [1] = nil, 
    [2] = 2, 
    [1] = v61.elements.navigation
});
v61.elements.visuals.accent = v61.groups.other:color_picker("\v\f<block-brick-fire>\r accent color"):depend({
    [1] = nil, 
    [2] = true, 
    [1] = v61.elements.visuals.master
}, {
    [1] = nil, 
    [2] = 2, 
    [1] = v61.elements.navigation
});
v61.elements.visuals.watermark = v61.groups.visuals:combo("\v\f<panorama>\r watermark", {
    [1] = "basic", 
    [2] = "modern", 
    [3] = "gradient"
}):depend({
    [1] = nil, 
    [2] = true, 
    [1] = v61.elements.visuals.master
}, {
    [1] = nil, 
    [2] = 2, 
    [1] = v61.elements.navigation
});
v61.elements.visuals.indicators = v61.groups.visuals:label("\v\f<sparkles>\r under crosshair indicators", function(v138)
    local v139 = {
        damage = v138:switch("damage indicator"), 
        enable = v138:switch("\v\f<toggle-on>\r enable")
    };
    v139.font = v138:combo("font", {
        [1] = "default", 
        [2] = "pixel"
    }):depend({
        [1] = nil, 
        [2] = true, 
        [1] = v139.enable
    });
    v139.y_add = v138:slider("y add", -150, 170, 25, 1):depend({
        [1] = nil, 
        [2] = true, 
        [1] = v139.enable
    });
    v139.shadow = v138:switch("glow");
    return v139;
end):depend({
    [1] = nil, 
    [2] = true, 
    [1] = v61.elements.visuals.master
}, {
    [1] = nil, 
    [2] = 2, 
    [1] = v61.elements.navigation
});
v61.elements.visuals.arrows = v61.groups.visuals:combo("\v\f<comet>\r manual arrows", {
    [1] = "off", 
    [2] = "default", 
    [3] = "minimalistic"
}):depend({
    [1] = nil, 
    [2] = true, 
    [1] = v61.elements.visuals.master
}, {
    [1] = nil, 
    [2] = 2, 
    [1] = v61.elements.navigation
});
v61.elements.visuals.logs = v61.groups.visuals:switch("\v\f<code-branch>\r hit logs"):depend({
    [1] = nil, 
    [2] = true, 
    [1] = v61.elements.visuals.master
}, {
    [1] = nil, 
    [2] = 2, 
    [1] = v61.elements.navigation
});
v61.elements.visuals.gamesense = v61.groups.visuals:switch("\v\f<gamepad>\r gamesense indicators", false, function(v140)
    return {
        indicators = v140:selectable("gamesense indicators", {
            [1] = "double tap", 
            [2] = "on shot anti-aim", 
            [3] = "dormant aimbot", 
            [4] = "hit/miss rate", 
            [5] = "lag Compensation", 
            [6] = "fake duck", 
            [7] = "force safepoint", 
            [8] = "force body aim", 
            [9] = "damage override", 
            [10] = "peek assist", 
            [11] = "bomb info"
        })
    };
end):depend({
    [1] = nil, 
    [2] = true, 
    [1] = v61.elements.visuals.master
}, {
    [1] = nil, 
    [2] = 2, 
    [1] = v61.elements.navigation
});
v61.elements.visuals.defensive = v61.groups.visuals:switch("\v\f<location-crosshairs>\r defensive warning"):depend({
    [1] = nil, 
    [2] = true, 
    [1] = v61.elements.visuals.master
}, {
    [1] = nil, 
    [2] = 2, 
    [1] = v61.elements.navigation
});
v61.elements.visuals.velocity = v61.groups.visuals:switch("\v\f<bomb>\r velocity warning"):depend({
    [1] = nil, 
    [2] = true, 
    [1] = v61.elements.visuals.master
}, {
    [1] = nil, 
    [2] = 2, 
    [1] = v61.elements.navigation
});
v61.elements.visuals.aspect = v61.groups.other:switch("\v\f<earth-europe>\r aspect ratio", false, function(v141)
    return {
        width = v141:slider("value", 0, 200, cvar.r_aspectratio:float(), 0.01)
    };
end):depend({
    [1] = nil, 
    [2] = true, 
    [1] = v61.elements.visuals.master
}, {
    [1] = nil, 
    [2] = 2, 
    [1] = v61.elements.navigation
});
v61.elements.visuals.viewmodel = v61.groups.other:switch("\v\f<hands>\r viewmodel", false, function(v142)
    return {
        x = v142:slider("x", -100, 100, cvar.viewmodel_offset_x:int() * 10, 0.1), 
        y = v142:slider("y", -100, 100, cvar.viewmodel_offset_y:int() * 10, 0.1), 
        z = v142:slider("z", -100, 100, cvar.viewmodel_offset_z:int() * 10, 0.1), 
        fov = v142:slider("fov", 0, 1800, cvar.viewmodel_fov:int() * 10, 0.1)
    };
end):depend({
    [1] = nil, 
    [2] = true, 
    [1] = v61.elements.visuals.master
}, {
    [1] = nil, 
    [2] = 2, 
    [1] = v61.elements.navigation
});
v61.elements.visuals.scope = v61.groups.other:switch("\v\f<plus-minus>\a\r custom scope", false, function(v143)
    return {
        colorpicker = v143:color_picker("color"), 
        offset = v143:slider("offset", 0, 500), 
        width = v143:slider("width", 0, 500), 
        removals = v143:selectable("remove", {
            [1] = "top", 
            [2] = "bottom", 
            [3] = "left", 
            [4] = "right"
        })
    }, true;
end):depend({
    [1] = nil, 
    [2] = true, 
    [1] = v61.elements.visuals.master
}, {
    [1] = nil, 
    [2] = 2, 
    [1] = v61.elements.navigation
});
v61.elements.antiaim = {};
v61.elements.antiaim.master = v61.groups.antiaim:switch("\v\f<toggle-on>\r enable");
v61.elements.antiaim.manuals = v61.groups.antiaim_other:combo("manuals", {
    [1] = "at target", 
    [2] = "left", 
    [3] = "right", 
    [4] = "forward"
}, function(v144)
    return {
        disablers = v144:selectable("disable:", {
            [1] = " yaw modifiers", 
            [2] = "fake modifiers"
        }), 
        ebait = v144:switch("e bait")
    };
end):depend({
    [1] = nil, 
    [2] = true, 
    [1] = v61.elements.antiaim.master
});
v61.elements.antiaim.freestand = v61.groups.antiaim_other:switch("\v\f<circle-nodes>\r freestand", false, function(v145)
    return {
        disablers = v145:selectable("disable:", {
            [1] = "yaw modifiers", 
            [2] = "fake modifiers"
        }), 
        ebait = v145:switch("e bait")
    };
end):depend({
    [1] = nil, 
    [2] = true, 
    [1] = v61.elements.antiaim.master
});
v61.elements.antiaim.flick = v61.groups.antiaim_other:switch("\v\f<eye-slash>\r \a[attention]flick exploit"):depend({
    [1] = nil, 
    [2] = true, 
    [1] = v61.elements.antiaim.master
});
v61.elements.antiaim.airlag = v61.groups.antiaim_other:switch("\v\f<signal-stream>\r \a[attention]air lag"):depend({
    [1] = nil, 
    [2] = true, 
    [1] = v61.elements.antiaim.master
});
v61.elements.antiaim.antibackstaab = v61.groups.antiaim_other:switch("\v\f<sword>\r anti backstab", false, function(v146)
    return {
        antiback = v146:slider("\v\f<people-arrows>\r Distance", 100, 400, 300)
    }, true;
end):depend({
    [1] = nil, 
    [2] = true, 
    [1] = v61.elements.antiaim.master
});
v61.elements.antiaim.safehead = v61.groups.antiaim_other:selectable("\v\f<shield>\r safe head", {
    [1] = "air-knife", 
    [2] = "air-taser", 
    [3] = "height difference"
}, function(v147)
    return {
        ebait = v147:switch("e bait")
    };
end):depend({
    [1] = nil, 
    [2] = true, 
    [1] = v61.elements.antiaim.master
});
v61.elements.antiaim.defensive = v61.groups.antiaim_other:switch("\v\f<bars-progress>\r defensive additions", false, function(v148)
    return {
        condition = v148:selectable("on condition", {
            [1] = "peek", 
            [2] = "velocity break"
        })
    }, true;
end):depend({
    [1] = nil, 
    [2] = true, 
    [1] = v61.elements.antiaim.master
});
v61.elements.antiaim.state = v61.groups.state:combo("", v52.state.global):depend({
    [1] = nil, 
    [2] = true, 
    [1] = v61.elements.antiaim.master
});
v61.elements.antiaim.type = v61.groups.state:list("", {
    [1] = "basic", 
    [2] = "defensive"
}):depend({
    [1] = nil, 
    [2] = true, 
    [1] = v61.elements.antiaim.master
});
v61.elements.builder = {
    base = {}, 
    tab = {}, 
    def_tab = {}, 
    defensive = {}
};
for v149, v150 in ipairs(v52.state.global) do
    v61.elements.builder.tab[v150] = {};
    v61.elements.builder.def_tab[v150] = {};
    v61.elements.builder.base[v150] = {};
    v61.elements.builder.defensive[v150] = {};
    local v151 = v61.elements.builder.base[v150];
    local v152 = v61.elements.builder.tab[v150];
    local v153 = v61.elements.builder.defensive[v150];
    local v154 = v61.elements.builder.def_tab[v150];
    v152.tab = l_pui_1.create("\238\147\162 anti-aim", v150);
    v154.tab = l_pui_1.create("\238\147\162 anti-aim", "\a[attention]defensive\aDEFAULT " .. v150);
    if v149 > 1 then
        v151.enable = v61.groups.state:switch("\v\f<toggle-on>\r enable " .. v150):depend({
            [1] = v61.elements.antiaim.state, 
            [2] = v150
        }, {
            [1] = nil, 
            [2] = true, 
            [1] = v61.elements.antiaim.master
        }, {
            [1] = nil, 
            [2] = 1, 
            [1] = v61.elements.antiaim.type
        });
    end;
    v151.yaw = v152.tab:label("\v\f<eye>\r yaw", function(v155)
        local v156 = {
            mode = v155:combo("mode", {
                [1] = "static", 
                [2] = "sided", 
                [3] = "x-way"
            })
        };
        v156.static = v155:slider("static", -180, 180, 0, 1):depend({
            [1] = nil, 
            [2] = "static", 
            [1] = v156.mode
        });
        v156.left = v155:slider("left", -180, 180, 0, 1):depend({
            [1] = nil, 
            [2] = "sided", 
            [1] = v156.mode
        });
        v156.right = v155:slider("right", -180, 180, 0, 1):depend({
            [1] = nil, 
            [2] = "sided", 
            [1] = v156.mode
        });
        v156.way = v155:slider("way", 3, 7, 3, 1):depend({
            [1] = nil, 
            [2] = "x-way", 
            [1] = v156.mode
        });
        v156.way1 = v155:slider("way 1", -180, 180, 0, 1):depend({
            [1] = nil, 
            [2] = "x-way", 
            [1] = v156.mode
        }, {
            [1] = v156.way, 
            [2] = function()
                -- upvalues: v156 (ref)
                return v156.way.value >= 3;
            end
        });
        v156.way2 = v155:slider("way 2", -180, 180, 0, 1):depend({
            [1] = nil, 
            [2] = "x-way", 
            [1] = v156.mode
        }, {
            [1] = v156.way, 
            [2] = function()
                -- upvalues: v156 (ref)
                return v156.way.value >= 3;
            end
        });
        v156.way3 = v155:slider("way 3", -180, 180, 0, 1):depend({
            [1] = nil, 
            [2] = "x-way", 
            [1] = v156.mode
        }, {
            [1] = v156.way, 
            [2] = function()
                -- upvalues: v156 (ref)
                return v156.way.value >= 3;
            end
        });
        v156.way4 = v155:slider("way 4", -180, 180, 0, 1):depend({
            [1] = nil, 
            [2] = "x-way", 
            [1] = v156.mode
        }, {
            [1] = v156.way, 
            [2] = function()
                -- upvalues: v156 (ref)
                return v156.way.value >= 4;
            end
        });
        v156.way5 = v155:slider("way 5", -180, 180, 0, 1):depend({
            [1] = nil, 
            [2] = "x-way", 
            [1] = v156.mode
        }, {
            [1] = v156.way, 
            [2] = function()
                -- upvalues: v156 (ref)
                return v156.way.value >= 5;
            end
        });
        v156.way6 = v155:slider("way 6", -180, 180, 0, 1):depend({
            [1] = nil, 
            [2] = "x-way", 
            [1] = v156.mode
        }, {
            [1] = v156.way, 
            [2] = function()
                -- upvalues: v156 (ref)
                return v156.way.value >= 6;
            end
        });
        v156.way7 = v155:slider("way 7", -180, 180, 0, 1):depend({
            [1] = nil, 
            [2] = "x-way", 
            [1] = v156.mode
        }, {
            [1] = v156.way, 
            [2] = function()
                -- upvalues: v156 (ref)
                return v156.way.value >= 7;
            end
        });
        return v156;
    end):depend({
        [1] = v61.elements.antiaim.state, 
        [2] = v150
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v61.elements.antiaim.master
    }, {
        [1] = nil, 
        [2] = 1, 
        [1] = v61.elements.antiaim.type
    }, v149 > 1 and v151.enable);
    v151.modifier = v152.tab:combo("\v\f<user-bounty-hunter>\r yaw modifier", {
        [1] = "off", 
        [2] = "center", 
        [3] = "offset"
    }, function(v157, _)
        return {
            offset = v157:slider("offset", -180, 180, 0, 1), 
            randomization = v157:slider("randomization", 0, 180, 0, 1)
        };
    end):depend({
        [1] = v61.elements.antiaim.state, 
        [2] = v150
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v61.elements.antiaim.master
    }, {
        [1] = nil, 
        [2] = 1, 
        [1] = v61.elements.antiaim.type
    }, v149 > 1 and v151.enable);
    v151.spin = v152.tab:switch("\226\134\187 spin", false, function(v159)
        return {
            range = v159:slider("range", -180, 180, 0, 1), 
            speed = v159:slider("speed", 0, 360, 0, 1)
        }, true;
    end):depend({
        [1] = v61.elements.antiaim.state, 
        [2] = v150
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v61.elements.antiaim.master
    }, {
        [1] = nil, 
        [2] = 1, 
        [1] = v61.elements.antiaim.type
    }, v149 > 1 and v151.enable);
    v151.fake = v152.tab:switch("\v\f<eye-low-vision>\r body yaw", false, function(v160)
        local v161 = {
            mode = v160:combo("mode", {
                [1] = "static", 
                [2] = "jitter", 
                [3] = "automatic"
            })
        };
        v161.inverter = v160:switch("inverter"):depend({
            [1] = nil, 
            [2] = "static", 
            [1] = v161.mode
        });
        v161.left = v160:slider("left limit", 0, 60, 60, 1):depend({
            [1] = v161.mode, 
            [2] = function()
                -- upvalues: v161 (ref)
                return v161.mode.value ~= "automatic";
            end
        });
        v161.right = v160:slider("right limit", 0, 60, 60, 1):depend({
            [1] = v161.mode, 
            [2] = function()
                -- upvalues: v161 (ref)
                return v161.mode.value ~= "automatic";
            end
        });
        return v161, true;
    end):depend({
        [1] = v61.elements.antiaim.state, 
        [2] = v150
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v61.elements.antiaim.master
    }, {
        [1] = nil, 
        [2] = 1, 
        [1] = v61.elements.antiaim.type
    }, v149 > 1 and v151.enable);
    v151.delay = v152.tab:slider("\v\f<clock-rotate-left>\r delay", 1, 9, 1, nil, function(v162)
        if v162 == 1 then
            return "off";
        else
            return v162 - 1 .. "t";
        end;
    end):depend({
        [1] = v61.elements.antiaim.state, 
        [2] = v150
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v61.elements.antiaim.master
    }, {
        [1] = nil, 
        [2] = 1, 
        [1] = v61.elements.antiaim.type
    }, v149 > 1 and v151.enable);
    v151.randomize_delay = v152.tab:switch("\v\f<clock-rotate-left>\r randomize delay"):depend({
        [1] = v61.elements.antiaim.state, 
        [2] = v150
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v61.elements.antiaim.master
    }, {
        [1] = nil, 
        [2] = 1, 
        [1] = v61.elements.antiaim.type
    }, v149 > 1 and v151.enable);
    v153.enable = v61.groups.state:switch("\a[attention]enable\aDEFAULT " .. v150 .. "\000"):depend({
        [1] = v61.elements.antiaim.state, 
        [2] = v150
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v61.elements.antiaim.master
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v61.elements.antiaim.type
    });
    v153.force = v154.tab:selectable("\v\f<toggle-on>\r force on", {
        [1] = "doubletap", 
        [2] = "hideshots"
    }):depend({
        [1] = v61.elements.antiaim.state, 
        [2] = v150
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v61.elements.antiaim.master
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v61.elements.antiaim.type
    });
    v153.mode = v154.tab:combo("\v\f<magnifying-glass>\r mode", {
        [1] = "default", 
        [2] = "safe"
    }):depend({
        [1] = v61.elements.antiaim.state, 
        [2] = v150
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v61.elements.antiaim.master
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v61.elements.antiaim.type
    }, v153.enable);
    v153.pitch = v154.tab:label("\v\f<microscope>\r pitch", function(v163)
        local v164 = {
            mode = v163:combo("mode", {
                [1] = "custom", 
                [2] = "jitter", 
                [3] = "randomized", 
                [4] = "\226\134\187 spinable"
            })
        };
        v164.custom = v163:slider("custom", -89, 89, 0, 1):depend({
            [1] = nil, 
            [2] = "custom", 
            [1] = v164.mode
        });
        v164.from = v163:slider("from", -89, 89, 0, 1):depend({
            [1] = v164.mode, 
            [2] = function()
                -- upvalues: v164 (ref)
                return v164.mode.value ~= "custom";
            end
        });
        v164.to = v163:slider("to", -89, 89, 0, 1):depend({
            [1] = v164.mode, 
            [2] = function()
                -- upvalues: v164 (ref)
                return v164.mode.value ~= "custom";
            end
        });
        v164.speed = v163:slider("speed", 0, 360, 0, 1):depend({
            [1] = nil, 
            [2] = "\226\134\187 spinable", 
            [1] = v164.mode
        });
        return v164;
    end):depend({
        [1] = v61.elements.antiaim.state, 
        [2] = v150
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v61.elements.antiaim.master
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v61.elements.antiaim.type
    }, v153.enable);
    v153.yaw = v154.tab:label("\v\f<eye>\r yaw", function(v165)
        local v166 = {
            mode = v165:combo("mode", {
                [1] = "static", 
                [2] = "sided", 
                [3] = "x-way"
            })
        };
        v166.static = v165:slider("static", -180, 180, 0, 1):depend({
            [1] = nil, 
            [2] = "static", 
            [1] = v166.mode
        });
        v166.left = v165:slider("left", -180, 180, 0, 1):depend({
            [1] = nil, 
            [2] = "sided", 
            [1] = v166.mode
        });
        v166.right = v165:slider("right", -180, 180, 0, 1):depend({
            [1] = nil, 
            [2] = "sided", 
            [1] = v166.mode
        });
        v166.way = v165:slider("way", 3, 7, 3, 1):depend({
            [1] = nil, 
            [2] = "x-way", 
            [1] = v166.mode
        });
        v166.way1 = v165:slider("way 1", -180, 180, 0, 1):depend({
            [1] = nil, 
            [2] = "x-way", 
            [1] = v166.mode
        }, {
            [1] = v166.way, 
            [2] = function()
                -- upvalues: v166 (ref)
                return v166.way.value >= 3;
            end
        });
        v166.way2 = v165:slider("way 2", -180, 180, 0, 1):depend({
            [1] = nil, 
            [2] = "x-way", 
            [1] = v166.mode
        }, {
            [1] = v166.way, 
            [2] = function()
                -- upvalues: v166 (ref)
                return v166.way.value >= 3;
            end
        });
        v166.way3 = v165:slider("way 3", -180, 180, 0, 1):depend({
            [1] = nil, 
            [2] = "x-way", 
            [1] = v166.mode
        }, {
            [1] = v166.way, 
            [2] = function()
                -- upvalues: v166 (ref)
                return v166.way.value >= 3;
            end
        });
        v166.way4 = v165:slider("way 4", -180, 180, 0, 1):depend({
            [1] = nil, 
            [2] = "x-way", 
            [1] = v166.mode
        }, {
            [1] = v166.way, 
            [2] = function()
                -- upvalues: v166 (ref)
                return v166.way.value >= 4;
            end
        });
        v166.way5 = v165:slider("way 5", -180, 180, 0, 1):depend({
            [1] = nil, 
            [2] = "x-way", 
            [1] = v166.mode
        }, {
            [1] = v166.way, 
            [2] = function()
                -- upvalues: v166 (ref)
                return v166.way.value >= 5;
            end
        });
        v166.way6 = v165:slider("way 6", -180, 180, 0, 1):depend({
            [1] = nil, 
            [2] = "x-way", 
            [1] = v166.mode
        }, {
            [1] = v166.way, 
            [2] = function()
                -- upvalues: v166 (ref)
                return v166.way.value >= 6;
            end
        });
        v166.way7 = v165:slider("way 7", -180, 180, 0, 1):depend({
            [1] = nil, 
            [2] = "x-way", 
            [1] = v166.mode
        }, {
            [1] = v166.way, 
            [2] = function()
                -- upvalues: v166 (ref)
                return v166.way.value >= 7;
            end
        });
        return v166;
    end):depend({
        [1] = v61.elements.antiaim.state, 
        [2] = v150
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v61.elements.antiaim.master
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v61.elements.antiaim.type
    }, v153.enable);
    v153.modifier = v154.tab:combo("\v\f<user-bounty-hunter>\r yaw modifier", {
        [1] = "off", 
        [2] = "center", 
        [3] = "offset"
    }, function(v167, _)
        return {
            offset = v167:slider("offset", -180, 180, 0, 1), 
            randomization = v167:slider("randomization", 0, 180, 0, 1)
        };
    end):depend({
        [1] = v61.elements.antiaim.state, 
        [2] = v150
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v61.elements.antiaim.master
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v61.elements.antiaim.type
    }, v153.enable);
    v153.spin = v154.tab:switch("\226\134\187 spin", false, function(v169)
        return {
            range = v169:slider("range", -180, 180, 0, 1), 
            speed = v169:slider("speed", 0, 360, 0, 1)
        }, true;
    end):depend({
        [1] = v61.elements.antiaim.state, 
        [2] = v150
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v61.elements.antiaim.master
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v61.elements.antiaim.type
    }, v153.enable);
    v153.fake = v154.tab:switch("\v\f<eye-low-vision>\r body yaw", false, function(v170)
        local v171 = {
            mode = v170:combo("mode", {
                [1] = "static", 
                [2] = "jitter", 
                [3] = "automatic"
            })
        };
        v171.inverter = v170:switch("inverter"):depend({
            [1] = nil, 
            [2] = "static", 
            [1] = v171.mode
        });
        v171.left = v170:slider("left limit", 0, 60, 60, 1):depend({
            [1] = v171.mode, 
            [2] = function()
                -- upvalues: v171 (ref)
                return v171.mode.value ~= "automatic";
            end
        });
        v171.right = v170:slider("right limit", 0, 60, 60, 1):depend({
            [1] = v171.mode, 
            [2] = function()
                -- upvalues: v171 (ref)
                return v171.mode.value ~= "automatic";
            end
        });
        return v171, true;
    end):depend({
        [1] = v61.elements.antiaim.state, 
        [2] = v150
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v61.elements.antiaim.master
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v61.elements.antiaim.type
    }, v153.enable);
    v153.delay = v154.tab:slider("\v\f<clock-rotate-left>\r delay", 1, 9, 1, nil, function(v172)
        if v172 == 1 then
            return "off";
        else
            return v172 - 1 .. "t";
        end;
    end):depend({
        [1] = v61.elements.antiaim.state, 
        [2] = v150
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v61.elements.antiaim.master
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v61.elements.antiaim.type
    }, v153.enable);
    v153.randomize_delay = v154.tab:switch("\v\f<clock-rotate-left>\r randomize delay"):depend({
        [1] = v61.elements.antiaim.state, 
        [2] = v150
    }, {
        [1] = nil, 
        [2] = true, 
        [1] = v61.elements.antiaim.master
    }, {
        [1] = nil, 
        [2] = 2, 
        [1] = v61.elements.antiaim.type
    }, v153.enable);
end;
v61.elements.config.export:set_callback(function(_)
    -- upvalues: l_pui_1 (ref), l_base64_1 (ref), l_clipboard_1 (ref)
    local v174 = l_pui_1.save();
    local v175 = l_base64_1.encode(json.stringify(v174));
    l_clipboard_1.set(v175);
    print_raw("\nconfig exported!");
end);
v61.elements.config.import:set_callback(function(_)
    -- upvalues: l_pui_1 (ref), l_base64_1 (ref), l_clipboard_1 (ref)
    l_pui_1.load(json.parse(l_base64_1.decode(l_clipboard_1.get())));
    print_raw("\nconfig imported!");
end);
v61.elements.config.Agressive:set_callback(function(_)
    -- upvalues: l_pui_1 (ref), l_base64_1 (ref)
    local v178 = network.get("https://raw.githubusercontent.com/th3bloor4/eclipse-hook/refs/heads/main/nl_agressive", {});
    l_pui_1.load(json.parse(l_base64_1.decode(v178)));
    print_raw("\nAgressive setts loaded!");
end);
v61.elements.config.Default:set_callback(function(_)
    -- upvalues: l_pui_1 (ref), l_base64_1 (ref)
    local v180 = network.get("https://raw.githubusercontent.com/th3bloor4/eclipse-hook/refs/heads/main/bloor44_nl", {});
    l_pui_1.load(json.parse(l_base64_1.decode(v180)));
    print_raw("\nDefault setts loaded!");
end);
events.render:set(function()
    -- upvalues: v23 (ref), v11 (ref), v61 (ref)
    local v181 = ui.get_style("Link Active");
    local v182 = ui.get_style("Sidebar Text");
    local v183 = v23.gradient("eclipsehook", globals.realtime, v182, v181);
    ui.sidebar(string.format("%s\a%s %s", v183, v181:to_hex(), v11.build), ui.get_icon("credit-card"));
    v61.elements.global.icon:set(v181);
end);
l_pui_1.setup(v61);
v81 = {
    normalize = function(v184)
        while v184 > 180 do
            v184 = v184 - 360;
        end;
        while v184 < -180 do
            v184 = v184 + 360;
        end;
        return v184;
    end, 
    in_air = false, 
    ticks = 0, 
    max_tickbase = 0, 
    choking = false, 
    packets = 0, 
    last_flick = 0, 
    exploit = 1
};
events.createmove:set(function(v185)
    -- upvalues: v81 (ref)
    if not entity.get_local_player() then
        return;
    else
        if v185.choked_commands == 0 then
            v81.packets = v81.packets + 1;
            v81.choking = not v81.choking;
        end;
        return;
    end;
end);
v81.get_state = function()
    -- upvalues: v81 (ref), v61 (ref)
    local v186 = entity.get_local_player();
    if not v186 then
        return;
    else
        local v187 = v186.m_vecVelocity:length();
        local l_m_fFlags_0 = v186.m_fFlags;
        local l_m_bDucked_0 = v186.m_bDucked;
        if l_m_fFlags_0 == 256 or l_m_fFlags_0 == 262 then
            v81.in_air = true;
            v81.ticks = globals.tickcount + 3;
        else
            v81.in_air = v81.ticks > globals.tickcount;
        end;
        if v81.in_air then
            if l_m_bDucked_0 and v61.elements.builder.base["air-crouching"].enable:get() then
                return "air-crouching";
            else
                return "air";
            end;
        elseif l_m_bDucked_0 then
            if v187 > 15 and v61.elements.builder.base["crouching-move"].enable:get() then
                return "crouching-move";
            else
                return "crouching";
            end;
        elseif v187 < 5 then
            return "standing";
        elseif v61.refs.slowwalk:get() then
            return "walking";
        else
            return "running";
        end;
    end;
end;
v81.get_height_diff = function()
    if entity.get_threat() == nil then
        return 0;
    else
        local l_m_vecOrigin_0 = entity.get_local_player().m_vecOrigin;
        local l_m_vecOrigin_1 = entity.get_threat().m_vecOrigin;
        return l_m_vecOrigin_0.z - l_m_vecOrigin_1.z or 0;
    end;
end;
v81.get_defensive = function(v192)
    -- upvalues: v81 (ref), v61 (ref)
    local v193 = entity.get_local_player();
    if not v193 then
        return;
    else
        local v194 = v81.get_state();
        v194 = v61.elements.builder.defensive[v194].enable:get() and v61.elements.builder.defensive[v194] or v61.elements.builder.defensive.global;
        local l_m_nTickBase_0 = v193.m_nTickBase;
        if math.abs(l_m_nTickBase_0 - v81.max_tickbase) > 64 then
            v81.max_tickbase = 0;
        end;
        local v196 = 0;
        if v81.max_tickbase < l_m_nTickBase_0 then
            v81.max_tickbase = l_m_nTickBase_0;
        elseif l_m_nTickBase_0 < v81.max_tickbase then
            v196 = math.min(14, math.max(0, v81.max_tickbase - l_m_nTickBase_0 - 1));
        end;
        return v192 == "safe" and not (v196 <= 2) or v196 > 0;
    end;
end;
v81.force_defensive = function(v197, v198)
    -- upvalues: v61 (ref)
    if v197 == 1 then
        v61.refs.hideshotsoptions:override(v198 and "Break LC" or nil);
    end;
    if v197 == 2 then
        v61.refs.lagoptions:override(v198 and "Always On" or nil);
    end;
end;
v81.builder = {};
v81.builder.side = -1;
v81.builder.inverted = false;
v81.builder.way = 1;
v81.builder.jitter = 0;
v81.builder.spin = {
    pitch = -89, 
    yaw = -180
};
v81.builder.manual = {
    forward = 180, 
    right = 90, 
    left = -115
};
v81.builder.get_yaw = function()
    -- upvalues: v81 (ref), v61 (ref)
    local v199 = v81.get_state();
    local v200 = v61.elements.builder.defensive[v199].enable:get() and v61.elements.builder.defensive[v199] or v61.elements.builder.defensive.global;
    local v201 = v61.elements.builder.base[v199].enable:get() and v61.elements.builder.base[v199] or v61.elements.builder.base.global;
    local v202 = v81.get_defensive(v200.mode:get()) and v200.enable:get() and v200 or v201;
    if v202.yaw.mode:get() == "static" then
        return v202.yaw.static:get();
    elseif v202.yaw.mode:get() == "sided" then
        return v81.builder.inverted and v202.yaw.left:get() or v202.yaw.right:get();
    else
        if v202.yaw.mode:get() == "x-way" then
            if v81.builder.way == 1 then
                return v202.yaw.way1:get();
            elseif v81.builder.way == 2 then
                return v202.yaw.way2:get();
            elseif v81.builder.way == 3 then
                return v202.yaw.way3:get();
            elseif v81.builder.way == 4 then
                return v202.yaw.way4:get();
            elseif v81.builder.way == 5 then
                return v202.yaw.way5:get();
            elseif v81.builder.way == 6 then
                return v202.yaw.way6:get();
            elseif v81.builder.way == 7 then
                return v202.yaw.way7:get();
            end;
        end;
        return;
    end;
end;
v81.builder.get_jitter = function()
    -- upvalues: v81 (ref), v61 (ref)
    local v203 = v81.get_state();
    local v204 = v61.elements.builder.defensive[v203].enable:get() and v61.elements.builder.defensive[v203] or v61.elements.builder.defensive.global;
    local v205 = v61.elements.builder.base[v203].enable:get() and v61.elements.builder.base[v203] or v61.elements.builder.base.global;
    local v206 = v81.get_defensive(v204.mode:get()) and v204.enable:get() and v204 or v205;
    if v206.modifier:get() == "center" then
        return (v81.builder.inverted and -v206.modifier.offset:get() / 2 or v206.modifier.offset:get() / 2) + utils.random_int(-v206.modifier.randomization:get(), v206.modifier.randomization:get());
    elseif v206.modifier:get() == "offset" then
        return (v81.builder.inverted and 0 or v206.modifier.offset:get() / 2) + utils.random_int(-v206.modifier.randomization:get(), v206.modifier.randomization:get());
    else
        return 0;
    end;
end;
v81.builder.get_pitch = function()
    -- upvalues: v81 (ref), v61 (ref), v60 (ref)
    local v207 = v81.get_state();
    local v208 = v61.elements.builder.defensive[v207].enable:get() and v61.elements.builder.defensive[v207] or v61.elements.builder.defensive.global;
    if v81.get_defensive(v208.mode:get()) and v208.enable:get() then
        if v208.pitch.mode:get() == "custom" then
            rage.antiaim:override_hidden_pitch(v208.pitch.custom:get());
        end;
        if v208.pitch.mode:get() == "jitter" then
            rage.antiaim:override_hidden_pitch(v81.builder.inverted and v208.pitch.from:get() or v208.pitch.to:get());
        end;
        if v208.pitch.mode:get() == "randomized" then
            rage.antiaim:override_hidden_pitch(utils.random_int(v208.pitch.from:get(), v208.pitch.to:get()));
        end;
        if v208.pitch.mode:get() == "spinable" then
            v81.builder.spin.pitch = -v60:spin("pitch spin " .. v207, v208.pitch.from:get(), v208.pitch.to:get(), 0.01, v208.pitch.speed:get() / 10).value * (v208.pitch.from:get() <= 0 and -1 or 1);
            if v81.builder.spin.pitch >= -89 then
                v81.builder.spin.pitch = v60:spin("pitch spin " .. v207, v208.pitch.from:get(), v208.pitch.to:get(), 0.01, v208.pitch.speed:get() / 10).value * (v208.pitch.from:get() <= 0 and 1 or -1);
            end;
            rage.antiaim:override_hidden_pitch(v81.builder.spin.pitch);
        end;
    else
        v61.refs.pitch:override("Down");
    end;
end;
v81.builder.get_fake = function(v209)
    -- upvalues: v81 (ref), v61 (ref)
    local v210 = v81.get_state();
    local v211 = v61.elements.builder.defensive[v210].enable:get() and v61.elements.builder.defensive[v210] or v61.elements.builder.defensive.global;
    local v212 = v61.elements.builder.base[v210].enable:get() and v61.elements.builder.base[v210] or v61.elements.builder.base.global;
    local v213 = v81.get_defensive(v211.mode:get()) and v211.enable:get() and v211 or v212;
    if v213.fake.mode:get() == "static" then
        v61.refs.bodyyaw_leftlimit:override(v213.fake.left:get());
        v61.refs.bodyyaw_rightlimit:override(v213.fake.right:get());
        rage.antiaim:inverter(v213.fake.inverter:get());
    end;
    if v213.fake.mode:get() == "jitter" then
        v61.refs.bodyyaw_leftlimit:override(v213.fake.left:get());
        v61.refs.bodyyaw_rightlimit:override(v213.fake.right:get());
        rage.antiaim:inverter(v81.builder.inverted);
    end;
    if v213.fake.mode:get() == "automatic" then
        v61.refs.bodyyaw_leftlimit:override(v209 == 0 and 0 or v213.fake.left:get());
        v61.refs.bodyyaw_rightlimit:override(v209 == 0 and 0 or v213.fake.right:get());
        rage.antiaim:inverter(v209 < 0);
    end;
end;
v81.builder.calculate_flick = function(v214)
    local v215 = entity.get_local_player().m_nTickBase % 6 > 2 and 1 or -1;
    local v216 = {
        [v214.in_moveleft or v214.in_left] = 90, 
        [v214.in_moveright or v214.in_right] = -90, 
        [v214.in_forward] = 90 * v215, 
        [v214.in_back] = -90 * v215
    };
    for v217, v218 in pairs(v216) do
        if v217 then
            return v218;
        end;
    end;
    return 90 * v215;
end;
v81.builder.handle = function(v219)
    -- upvalues: v81 (ref), v61 (ref), v60 (ref)
    local v220 = entity.get_local_player();
    local v221 = v220:get_player_weapon();
    if v221 == nil then
        return;
    else
        local v222 = v221:get_classname();
        local v223 = v81.get_state();
        local v224 = v61.elements.builder.defensive[v223].enable:get() and v61.elements.builder.defensive[v223] or v61.elements.builder.defensive.global;
        local v225 = v61.elements.builder.base[v223].enable:get() and v61.elements.builder.base[v223] or v61.elements.builder.base.global;
        v61.refs.hidden:override(v81.get_defensive(v224.mode:get()) and v224.enable:get() or v61.elements.antiaim.flick:get());
        local v226 = v81.get_defensive(v224.mode:get()) and v224.enable:get() and v224 or v225;
        if v226.spin:get() then
            v81.builder.spin.yaw = -v60:spin("yaw spin " .. v223, -v226.spin.range:get(), v226.spin.range:get(), 0.01, v226.spin.speed:get() / 10).value * (v226.spin.range:get() <= 0 and 1 or -1);
            if v81.builder.spin.yaw >= 180 then
                v81.builder.spin.yaw = -180;
            end;
        else
            v81.builder.spin.yaw = 0;
        end;
        if v219.choked_commands == 0 then
            v81.builder.way = v81.builder.way + 1;
            v81.builder.randomized = utils.random_int(1, v226.delay:get());
        end;
        if v81.builder.way > v226.yaw.way:get() then
            v81.builder.way = 1;
        end;
        if v81.packets - v81.last_flick >= (v226.randomize_delay:get() and v81.builder.randomized or v226.delay:get()) then
            v81.builder.inverted = not v81.builder.inverted;
            v81.last_flick = v81.packets;
        end;
        v81.force_defensive(1, v61.elements.builder.defensive[v223].force:get(2) and v61.refs.hideshots:get());
        v81.force_defensive(2, v61.elements.builder.defensive[v223].force:get(1) and v61.refs.doubletap:get());
        local v227 = {
            ["at target"] = {
                [1] = 0, 
                [2] = "At Target"
            }, 
            left = {
                [1] = -90, 
                [2] = "Local View"
            }, 
            right = {
                [1] = 115, 
                [2] = "Local View"
            }, 
            forward = {
                [1] = 180, 
                [2] = "Local View"
            }
        };
        v81.builder.yaw = v81.normalize(v81.builder.get_yaw() + v81.builder.get_jitter() + v81.builder.spin.yaw + v227[v61.elements.antiaim.manuals:get()][1]);
        if v61.elements.antiaim.freestand:get() and v61.elements.antiaim.freestand.disablers:get("\v\f<user-bounty-hunter>\r yaw modifiers") then
            v81.builder.yaw = 0;
            v81.force_defensive(1, v61.elements.antiaim.freestand.ebait:get());
            v81.force_defensive(2, v61.elements.antiaim.freestand.ebait:get());
            if v61.elements.antiaim.freestand.ebait:get() then
                rage.antiaim:override_hidden_pitch(utils.random_int(-25, 25));
                rage.antiaim:override_hidden_yaw_offset(180 - v227[v61.elements.antiaim.manuals:get()][1]);
            else
                rage.antiaim:override_hidden_pitch(89);
                rage.antiaim:override_hidden_yaw_offset(0);
            end;
        end;
        if v61.elements.antiaim.manuals:get() ~= "at target" and v61.elements.antiaim.manuals.disablers:get("\v\f<user-bounty-hunter>\r yaw modifiers") then
            v61.refs.freestanding:override(false);
            v81.builder.yaw = v227[v61.elements.antiaim.manuals:get()][1];
            v81.force_defensive(1, v61.elements.antiaim.manuals.ebait:get());
            v81.force_defensive(2, v61.elements.antiaim.manuals.ebait:get());
            if v61.elements.antiaim.manuals.ebait:get() then
                rage.antiaim:override_hidden_pitch(utils.random_int(-25, 25));
                rage.antiaim:override_hidden_yaw_offset(180);
            else
                rage.antiaim:override_hidden_pitch(89);
                rage.antiaim:override_hidden_yaw_offset(0);
            end;
        end;
        v61.refs.yawmodifier:override("Disabled");
        v61.refs.bodyyaw:override(v226.fake:get());
        v61.refs.yawoffset:override(v81.builder.yaw);
        v81.builder.get_fake(v81.builder.yaw);
        v61.refs.yawbase:override(v227[v61.elements.antiaim.manuals:get()][2]);
        if v61.elements.antiaim.manuals:get() ~= "at target" and v61.elements.antiaim.manuals.disablers:get("fake modifiers") then
            rage.antiaim:inverter(false);
        end;
        if v61.elements.antiaim.freestand:get() and v61.elements.antiaim.freestand.disablers:get("\v\f<user-bounty-hunter>\r yaw modifiers") then
            rage.antiaim:inverter(false);
        end;
        if v224.enable:get() and v81.get_defensive(v224.mode:get()) then
            v61.refs.yawoffset:override(0);
            rage.antiaim:override_hidden_yaw_offset(v81.builder.yaw);
        end;
        v61.refs.freestanding:override(v61.elements.antiaim.freestand:get());
        local v228 = {
            [1] = v222 == "CKnife" and v223:find("air") and v61.elements.antiaim.safehead:get("air-knife"), 
            [2] = v222 == "CWeaponTaser" and v223:find("air") and v61.elements.antiaim.safehead:get("air-taser"), 
            [3] = v81.get_height_diff() >= 65 and v61.elements.antiaim.safehead:get("height difference") and v223 ~= "running"
        };
        for _, v230 in pairs(v228) do
            if v230 then
                v61.refs.bodyyaw:override(true);
                v61.refs.yawoffset:override(25);
                v61.refs.bodyyaw_leftlimit:override(60);
                v61.refs.bodyyaw_rightlimit:override(60);
                rage.antiaim:inverter(false);
                v81.force_defensive(1, true);
                v81.force_defensive(2, true);
                if v61.elements.antiaim.safehead.ebait:get() then
                    rage.antiaim:override_hidden_pitch(utils.random_int(-25, 25));
                    rage.antiaim:override_hidden_yaw_offset(-145);
                else
                    rage.antiaim:override_hidden_pitch(89);
                    rage.antiaim:override_hidden_yaw_offset(0);
                end;
            end;
        end;
        if v61.elements.antiaim.flick:get() then
            rage.antiaim:override_hidden_pitch(v219.send_packet and 0 or -90);
            rage.antiaim:override_hidden_yaw_offset(v81.builder.calculate_flick(v219));
            if v219.command_number % 8 == 0 then
                v219.force_defensive = true;
            end;
        end;
        if v61.elements.antiaim.defensive:get() and (v61.elements.antiaim.defensive.condition:get("peek") and entity.get_threat() ~= nil and entity.get_threat(true) or v61.elements.antiaim.defensive.condition:get("velocity break") and v220.m_flVelocityModifier ~= 1) then
            v81.force_defensive(1, true);
            v81.force_defensive(2, true);
        end;
        return;
    end;
end;
v81.air_lag = function(v231)
    -- upvalues: v61 (ref), v81 (ref)
    if v61.elements.antiaim.airlag:get() then
        if not v81.in_air then
            return;
        else
            if globals.tickcount % 2 == 0 then
                v81.exploit = v81.exploit + 1;
            end;
            if v81.exploit > 2 then
                v231.force_defensive = true;
                v61.refs.yawoffset:override(0);
                rage.exploit:force_teleport();
                v81.exploit = 1;
            elseif entity.get_threat(false) ~= nil then
                rage.exploit:force_charge();
            end;
        end;
    end;
end;
events.createmove:set(function(v232)
    -- upvalues: v61 (ref), v81 (ref), v60 (ref)
    if not v61.elements.antiaim.master:get() then
        return;
    else
        v81.builder.get_pitch();
        v81.builder.handle(v232);
        v81.air_lag(v232);
        v60:tick(globals.tickcount);
        return;
    end;
end);
local v233 = {};
local v234 = v52.render.screen.x / 2;
local v235 = v52.render.screen.y / 2;
do
    local l_v234_0, l_v235_0 = v234, v235;
    v233.watermark = function()
        -- upvalues: v61 (ref), l_v234_0 (ref), v52 (ref), v23 (ref), v11 (ref), l_v235_0 (ref)
        local v238 = v61.elements.visuals.accent:get();
        if v61.elements.visuals.watermark:get() == "basic" then
            render.text(4, vector(l_v234_0, v52.render.screen.y - 20), color(255, 255, 255, 200), "c", "eclipsehook");
        end;
        if v61.elements.visuals.watermark:get() == "modern" then
            local v239 = v23.gradient(v11.build, globals.realtime, v238, color(155));
            render.texture(v52.render.watermark, vector(6, l_v235_0 + 2), 10000, 10000, 10000, 20);
            render.text(2, vector(45, l_v235_0 + 20), color(255), nil, string.format("Eclipsehook [%s\aFFFFFFFF]", v239):upper());
            render.text(2, vector(45, l_v235_0 + 28), color(255), nil, string.format("user: %s", v11.name):upper());
        end;
        if v61.elements.visuals.watermark:get() == "gradient" then
            local v240 = v23.gradient("E C L I P S E", globals.realtime, color(255), color(155));
            render.text(1, vector(15, l_v235_0 + 5), color(255), "", string.format("%s \a%s[%s]", v240, v238:to_hex(), "HOOK"):upper());
        end;
    end;
end;
v234 = v51.new(0);
v235 = v51.new(0);
local v241 = v51.new(0);
v233.crosshair = {};
v233.crosshair.legacy = {
    [1] = {
        name = "doubletap", 
        active = function()
            -- upvalues: v61 (ref)
            return v61.refs.doubletap:get();
        end, 
        animation = v51.new(0), 
        alpha = function()
            return math.clamp(rage.exploit:get(), 0.3, 1);
        end
    }, 
    [2] = {
        name = "hideshot", 
        active = function()
            -- upvalues: v61 (ref)
            return v61.refs.hideshots:get() and not v61.refs.doubletap:get();
        end, 
        animation = v51.new(0), 
        alpha = function()
            return 1;
        end
    }, 
    [3] = {
        name = "damage", 
        active = function()
            for v242 in pairs(ui.get_binds()) do
                if ui.get_binds()[v242].name == "Min. Damage" then
                    return ui.get_binds()[v242].active;
                end;
            end;
        end, 
        animation = v51.new(0), 
        alpha = function()
            return 1;
        end
    }, 
    [4] = {
        name = "hitchance", 
        active = function()
            for v243 in pairs(ui.get_binds()) do
                if ui.get_binds()[v243].name == "Hit Chance" then
                    return ui.get_binds()[v243].active;
                end;
            end;
        end, 
        animation = v51.new(0), 
        alpha = function()
            return 1;
        end
    }, 
    [5] = {
        name = "bodyaim", 
        active = function()
            for v244 in pairs(ui.get_binds()) do
                if ui.get_binds()[v244].name == "Body Aim" then
                    return ui.get_binds()[v244].active;
                end;
            end;
        end, 
        animation = v51.new(0), 
        alpha = function()
            return 1;
        end
    }
};
v233.legacy_indicators = function()
    -- upvalues: v234 (ref), v61 (ref), v241 (ref), v233 (ref)
    local v245 = entity.get_local_player();
    if not v245 or not v245:is_alive() then
        return;
    else
        v234(0.07, v61.elements.visuals.indicators.enable:get() and v61.elements.visuals.master:get());
        if v234.value < 0.01 then
            return;
        else
            local v246 = v61.elements.visuals.indicators.font:get() == "default" and 1 or 2;
            local v247 = v61.elements.visuals.indicators.y_add:get();
            local function v250(v248, v249)
                if v248 == 2 then
                    return (v249:upper());
                else
                    return v249;
                end;
            end;
            local v251 = v61.elements.visuals.accent:get();
            v241(0.07, v245.m_bIsScoped);
            if v61.elements.visuals.indicators.shadow:get() then
                render.shadow(vector(x - render.measure_text(v246, nil, "night.project").x / 2 + 35 * v241.value, y + v247), vector(x + render.measure_text(v246, nil, "night.project").x / 2 + 35 * v241.value, y + v247), v61.elements.visuals.accent:get(), 40);
            end;
            render.text(v246, vector(x + 35 * v241.value, y + v247), v251:alpha_modulate(255 * v234.value), "c", v250(v246, "night.project"));
            local v252 = 0;
            for _, v254 in ipairs(v233.crosshair.legacy) do
                v254.animation(0.07, ({
                    v254.active()
                })[1] == true);
                v254.sub = string.sub(v250(v246, v254.name), 1, #v254.name * v254.animation.value);
                v254.scope = (render.measure_text(v246, nil, v254.sub).x / 2 + (v246 == 2 and 6 or 4)) * v241.value * v234.value;
                local v255 = v246 == 1 and 10 or 9;
                render.text(v246, vector(x + v254.scope, y + v247 + v255 + v252 + (v247 < 0 and -20 or 0)), v251:alpha_modulate(255 * v234.value * v254.animation.value * v254.alpha()), "c", v254.sub);
                v252 = v252 + (v247 < 0 and -v255 or v255) * v234.value * v254.animation.value;
            end;
            return;
        end;
    end;
end;
v233.arrow_anim = v51.new(0);
v233.arrows = function()
    -- upvalues: v233 (ref), v61 (ref), v52 (ref)
    local v256 = entity.get_local_player();
    if not v256 or not v256:is_alive() then
        return;
    else
        v233.arrow_anim(0.07, v61.elements.antiaim.manuals:get() ~= "at target");
        local l_value_0 = v233.arrow_anim.value;
        if v61.elements.visuals.arrows:get() == "minimalistic" then
            local v258 = v61.elements.antiaim.manuals:get() == "left" and v61.elements.visuals.accent:get():alpha_modulate(200 * l_value_0) or color(25, 155);
            local v259 = v61.elements.antiaim.manuals:get() == "right" and v61.elements.visuals.accent:get():alpha_modulate(200 * l_value_0) or color(25, 155);
            render.text(v52.render.arrows, vector(x - 40, y - 0), v258, "c", "\226\175\135");
            render.text(v52.render.arrows, vector(x + 40, y - 0), v259, "c", "\226\175\136");
        end;
        if v61.elements.visuals.arrows:get() == "default" then
            if v61.elements.antiaim.manuals:get() == "left" then
                render.text(v52.render.gamesense, vector(x - 55, y - 0), v61.elements.visuals.accent:get():alpha_modulate(200 * l_value_0), "c", "<");
            end;
            if v61.elements.antiaim.manuals:get() == "right" then
                render.text(v52.render.gamesense, vector(x + 55, y - 0), v61.elements.visuals.accent:get():alpha_modulate(200 * l_value_0), "c", ">");
            end;
        end;
        return;
    end;
end;
v233.gamesense = function()
    -- upvalues: v61 (ref), v52 (ref)
    if not v61.elements.visuals.gamesense:get() then
        return;
    else
        local v260 = nil;
        local v261 = nil;
        local v262 = nil;
        local v263 = 0;
        local l_screen_0 = v52.render.screen;
        local v265 = entity.get_local_player();
        if v265 == nil then
            return;
        else
            local v267 = (function()
                for v266 in pairs(ui.get_binds()) do
                    if ui.get_binds()[v266].name == "Body Aim" then
                        return ui.get_binds()[v266].active;
                    end;
                end;
            end)();
            local v269 = (function()
                for v268 in pairs(ui.get_binds()) do
                    if ui.get_binds()[v268].name == "Safe Points" then
                        return ui.get_binds()[v268].active;
                    end;
                end;
            end)();
            local v271 = (function()
                for v270 in pairs(ui.get_binds()) do
                    if ui.get_binds()[v270].name == "Min. Damage" then
                        return ui.get_binds()[v270].active;
                    end;
                end;
            end)();
            if not v265 then
                return;
            else
                if not v265:is_alive() then
                    local l_render_0 = v52.render;
                    local l_render_1 = v52.render;
                    local v274 = 0;
                    l_render_1.hit = 0;
                    l_render_0.shot = v274;
                else
                    v260 = rage.exploit:get() == 1 and color(200) or color(255, 0, 50);
                    if not v61.elements.visuals.gamesense.indicators:get(1) or not v61.refs.doubletap:get() or not v61.elements.visuals.gamesense.indicators:get(5) or not v61.refs.fakeduck:get() then
                        if v61.elements.visuals.gamesense.indicators:get(1) and v61.refs.doubletap:get() then
                            v52.render.render_indicator("DT", v260, v263);
                            v263 = v263 + 41;
                        end;
                        if (not v61.elements.visuals.gamesense.indicators:get("on shot anti-aim") or not v61.refs.hideshots:get() or not v61.elements.visuals.gamesense.indicators:get("double tap") or not v61.refs.doubletap:get()) and (not v61.elements.visuals.gamesense.indicators:get("fake Duck") or not v61.refs.fakeduck:get()) and v61.elements.visuals.gamesense.indicators:get("on shot anti-aim") and v61.refs.hideshots:get() then
                            v52.render.render_indicator("OSAA", color(200), v263);
                            v263 = v263 + 41;
                        end;
                    end;
                    v260 = entity.get_threat() ~= nil and entity.get_threat():is_dormant() and color(200) or color(255, 0, 50);
                    if v61.elements.visuals.gamesense.indicators:get("dormant aimbot") and v61.refs.dormant:get() then
                        v52.render.render_indicator("DA", v260, v263);
                        v263 = v263 + 41;
                    end;
                    v261 = string.format("%d/%d (%.1f)", v52.render.hit, v52.render.shot, v52.render.hit > 0 and v52.render.shot > 0 and v52.render.hit / v52.render.shot * 100 or 0);
                    if v61.elements.visuals.gamesense.indicators:get("hit/miss rate") then
                        v52.render.render_indicator(v261, color(200), v263);
                        v263 = v263 + 41;
                    end;
                    v262 = vector(v265["m_vecVelocity[0]"], v265["m_vecVelocity[1]"], v265["m_vecVelocity[2]"]);
                    v260 = (not (v262:length2d() <= 250) or v262.z > 250) and rage.exploit:get() ~= 1 and color(143, 194, 21) or color(255, 0, 50);
                    if v61.elements.visuals.gamesense.indicators:get("lag compensation") and bit.band(v265.m_fFlags, 1) == 0 then
                        v52.render.render_indicator("LC", v260, v263);
                        v263 = v263 + 41;
                    end;
                    if v61.elements.visuals.gamesense.indicators:get("fake duck") and v61.refs.fakeduck:get() then
                        v52.render.render_indicator("DUCK", color(200), v263);
                        v263 = v263 + 41;
                    end;
                    if v61.elements.visuals.gamesense.indicators:get("force safepoint") and v269 then
                        v52.render.render_indicator("SAFE", color(200), v263);
                        v263 = v263 + 41;
                    end;
                    if v61.elements.visuals.gamesense.indicators:get("force body aim") and v267 then
                        v52.render.render_indicator("BODY", color(200), v263);
                        v263 = v263 + 41;
                    end;
                    if v61.elements.visuals.gamesense.indicators:get("damage override") and v271 then
                        v52.render.render_indicator("MD", color(200), v263);
                        v263 = v263 + 41;
                    end;
                    if v61.elements.visuals.gamesense.indicators:get("peek assist") and v61.elements.antiaim.freestand:get() then
                        v52.render.render_indicator("FS", color(200), v263);
                        v263 = v263 + 41;
                    end;
                end;
                if v61.elements.visuals.gamesense.indicators:get("bomb info") then
                    entity.get_entities("CPlantedC4", true, function(v275)
                        -- upvalues: v52 (ref), l_screen_0 (ref), v265 (ref), v263 (ref)
                        if v275.m_bBombDefused then
                            return;
                        else
                            local v276 = v275.m_flC4Blow - globals.curtime;
                            local l_m_bBombDefused_0 = v275.m_bBombDefused;
                            if v276 >= -1 and not l_m_bBombDefused_0 and not v52.render.defused then
                                local v278 = v275.m_hBombDefuser ~= nil;
                                local l_m_flDefuseLength_0 = v275.m_flDefuseLength;
                                local v280 = v278 and math.floor((v275.m_flDefuseCountDown - globals.curtime) * 10) / 10 or -1;
                                if v280 > 0 and not v52.render.abort_defuse then
                                    local v281 = v280 < math.floor(v276) and color(58, 191, 54, 160) or color(252, 18, 19, 125);
                                    local v282 = (l_screen_0.y - (l_m_flDefuseLength_0 > 5 and 50 or l_screen_0.y * 0.5)) / l_m_flDefuseLength_0 * v280;
                                    render.rect(vector(), vector(21, l_screen_0.y), color(25, 160));
                                    render.rect(vector(1, l_screen_0.y - v282), vector(20, l_screen_0.y - 1), v281);
                                end;
                                local v283 = v275.m_nBombSite == 0 and "A" or "B";
                                local l_m_iHealth_0 = v265.m_iHealth;
                                local l_m_ArmorValue_0 = v265.m_ArmorValue;
                                local v286 = v52.calculate_damage(v265, v275, l_m_ArmorValue_0);
                                local v287 = l_m_iHealth_0 <= v286;
                                v52.render.render_indicator(string.format("%s - %.1fs", v283, v276 >= 0 and v276 or 0), color(200), v263, v52.render.bomb);
                                v263 = v263 + 41;
                                if v265:is_alive() and v286 >= 1 then
                                    if v287 then
                                        v52.render.render_indicator("FATAL", color(255, 0, 50), v263);
                                        v263 = v263 + 41;
                                    else
                                        v52.render.render_indicator(string.format("-%d HP", v286), color(252, 243, 105), v263);
                                        v263 = v263 + 41;
                                    end;
                                end;
                            end;
                            return;
                        end;
                    end);
                    if v52.render.planting then
                        v52.render.render_indicator(v52.render.planting_site, color(252, 243, 105), v263, v52.render.bomb);
                        v52.render.fill = 3 - (3 + v52.plant_time - globals.curtime);
                        if v52.render.fill > 3 then
                            v52.render.fill = 3;
                        end;
                        render.circle_outline(vector(95, v52.render.y - v263 + 20), color(0), 7, 0, 1, 4);
                        render.circle_outline(vector(95, v52.render.y - v263 + 20), color(200), 7, 0, v52.render.fill / 3, 3);
                        v263 = v263 + 41;
                    end;
                end;
                return;
            end;
        end;
    end;
end;
v233.damage = function()
    -- upvalues: v61 (ref)
    if not v61.elements.visuals.indicators.damage:get() then
        return;
    else
        local v288 = entity.get_local_player();
        if not v288 or not v288:is_alive() then
            return;
        else
            render.text(1, vector(x + 5, y - 15), color(255, 200), nil, v61.refs.mindamage:get());
            return;
        end;
    end;
end;
v233.defensive_anim = v51.new(0);
v233.defensive = function()
    -- upvalues: v81 (ref), v233 (ref), v61 (ref), v52 (ref)
    if not entity.get_local_player() then
        return;
    else
        local v289 = v81.get_defensive("");
        v233.defensive_anim(0.07, v289 and v61.elements.visuals.defensive:get());
        local l_value_1 = v233.defensive_anim.value;
        if l_value_1 > 0.01 then
            render.texture(v52.render.defensive, vector(v52.render.screen.x / 2 - 9, 80), v61.elements.visuals.accent:get():alpha_modulate(200 * l_value_1), nil, nil, nil);
            render.rect(vector(v52.render.screen.x / 2 - 74, 104), vector(v52.render.screen.x / 2 + 74, 109), color(0, 200 * l_value_1), 4);
            render.rect(vector(v52.render.screen.x / 2 - 72 * l_value_1, 105), vector(v52.render.screen.x / 2 + 72 * l_value_1, 108), v61.elements.visuals.accent:get():alpha_modulate(200 * l_value_1), 4);
        end;
        return;
    end;
end;
v233.velocity_anim = v51.new(0);
v233.velocity = function()
    -- upvalues: v233 (ref), v61 (ref), v52 (ref)
    local v291 = entity.get_local_player();
    if not v291 then
        return;
    else
        local l_m_flVelocityModifier_0 = v291.m_flVelocityModifier;
        v233.velocity_anim(0.07, l_m_flVelocityModifier_0 ~= 1 and v61.elements.visuals.velocity:get());
        local l_value_2 = v233.velocity_anim.value;
        if l_value_2 > 0.01 then
            local v294 = 1 - l_m_flVelocityModifier_0;
            render.texture(v52.render.velocity, vector(v52.render.screen.x / 2 - 12, 110), v61.elements.visuals.accent:get():alpha_modulate(200 * l_value_2), nil, nil, nil);
            render.rect(vector(v52.render.screen.x / 2 - 74, 134), vector(v52.render.screen.x / 2 + 74, 139), color(0, 200 * l_value_2), 4);
            render.rect(vector(v52.render.screen.x / 2 - 72 * v294, 135), vector(v52.render.screen.x / 2 + 72 * v294, 138), v61.elements.visuals.accent:get():alpha_modulate(200 * l_value_2), 4);
        end;
        return;
    end;
end;
v233.scope_enable = v51.new(0);
v233.scope_scoped = v51.new(0);
v233.scope = function()
    -- upvalues: v233 (ref), v61 (ref)
    local v295 = entity.get_local_player();
    if not v295 then
        return;
    else
        v233.scope_enable(0.1, v61.elements.visuals.scope:get());
        v61.refs.scope:override(v61.elements.visuals.scope:get() and "Remove All" or nil);
        if v233.scope_enable.value < 0.01 then
            return;
        else
            local l_m_bIsScoped_0 = v295.m_bIsScoped;
            v233.scope_scoped(0.1, l_m_bIsScoped_0);
            if v233.scope_scoped.value < 0.01 then
                return;
            else
                local v297 = v295:get_player_weapon();
                if v297 == nil then
                    return;
                elseif v297:get_weapon_info().weapon_type ~= 5 then
                    return;
                else
                    local v298 = v61.elements.visuals.scope.colorpicker:get();
                    local v299 = v61.elements.visuals.scope.width:get();
                    local v300 = v61.elements.visuals.scope.offset:get();
                    if not v61.elements.visuals.scope.removals:get("top") then
                        render.gradient(vector(x, y - v300 + 1), vector(x + 1, y - v299), v298:alpha_modulate(v298.a * v233.scope_enable.value * v233.scope_scoped.value), v298:alpha_modulate(v298.a * v233.scope_enable.value * v233.scope_scoped.value), v298:alpha_modulate(0), v298:alpha_modulate(0));
                    end;
                    if not v61.elements.visuals.scope.removals:get("bottom") then
                        render.gradient(vector(x, y + v300), vector(x + 1, y + v299), v298:alpha_modulate(v298.a * v233.scope_enable.value * v233.scope_scoped.value), v298:alpha_modulate(v298.a * v233.scope_enable.value * v233.scope_scoped.value), v298:alpha_modulate(0), v298:alpha_modulate(0));
                    end;
                    if not v61.elements.visuals.scope.removals:get("left") then
                        render.gradient(vector(x + v300, y), vector(x + v299, y + 1), v298:alpha_modulate(v298.a * v233.scope_enable.value * v233.scope_scoped.value), v298:alpha_modulate(0), v298:alpha_modulate(v298.a * v233.scope_enable.value * v233.scope_scoped.value), v298:alpha_modulate(0));
                    end;
                    if not v61.elements.visuals.scope.removals:get("right") then
                        render.gradient(vector(x - v300 + 1, y), vector(x - v299, y + 1), v298:alpha_modulate(v298.a * v233.scope_enable.value * v233.scope_scoped.value), v298:alpha_modulate(0), v298:alpha_modulate(v298.a * v233.scope_enable.value * v233.scope_scoped.value), v298:alpha_modulate(0));
                    end;
                    return;
                end;
            end;
        end;
    end;
end;
events.render:set(function()
    -- upvalues: v233 (ref)
    v233.watermark();
    v233.legacy_indicators();
    v233.arrows();
    v233.damage();
    v233.gamesense();
    v233.defensive();
    v233.velocity();
    v233.scope();
end);
local v301 = {
    choking = false, 
    last_choke = 0, 
    choke_count = 0, 
    tick = 0
};
v301.fakelag = function(v302)
    -- upvalues: v61 (ref), v301 (ref)
    local _ = 14;
    local v304 = v61.refs.fakeduck:get();
    local _ = v61.refs.hideshots:get();
    local _ = v61.refs.doubletap:get();
    local v307 = v61.elements.additions.fakelag.mode:get();
    local v308 = v61.elements.additions.fakelag.limit:get();
    if v302.choked_commands < v308 then
        v301.tick = v301.tick + 1;
    end;
    if v307 == "cycle" then
        v308 = math.clamp(v308 - v301.tick % 6, 1, 14);
    elseif v307 == "randomized" then
        v308 = math.clamp(v308 - math.random(0, 6), 1, 14);
    end;
    if entity.get_threat(true) then
        v308 = 14;
    end;
    if v304 then
        v308 = 14;
    end;
    v61.refs.fakelag:override(v61.elements.additions.fakelag:get() and true or nil);
    local l_limit_0 = v61.refs.limit;
    local l_l_limit_0_0 = l_limit_0;
    l_limit_0 = l_limit_0.override;
    local v311;
    if not v61.elements.additions.fakelag:get() or not v308 then
        v311 = nil;
    else
        v311 = v308;
    end;
    l_limit_0(l_l_limit_0_0, v311);
    v61.refs.variability:override(v61.elements.additions.fakelag:get() and 100 or nil);
end;
v301.should_body = false;
esp.enemy:new_text("Body aim on lethal", "BODYAIMED", function(v312)
    -- upvalues: v301 (ref)
    if v312 ~= entity.get_threat() then
        return;
    elseif not v301.should_body then
        return;
    else
        return "BODY";
    end;
end);
v301.force_body = function(_)
    -- upvalues: v301 (ref), v61 (ref)
    local v314 = entity.get_local_player();
    if not v314 then
        return;
    else
        local v315 = entity.get_threat();
        if not v315 then
            return;
        else
            local v316 = v314:get_player_weapon():get_weapon_info();
            if not v316 then
                return;
            else
                local l_m_ArmorValue_1 = v315.m_ArmorValue;
                v301.lethal = {
                    weapon_deagle = 45, 
                    weapon_awp = 100, 
                    weapon_ssg08 = l_m_ArmorValue_1 > 0 and 93 or 100
                };
                local v318 = v315.m_iHealth <= (v301.lethal[v316.weapon_name] ~= nil and v301.lethal[v316.weapon_name] or 0) and v61.elements.additions.force_lethal:get();
                v301.should_body = v318;
                v61.refs.bodyaim:override(v318 and v301.lethal[v316.weapon_name] ~= nil and "Force" or nil);
                v61.refs.force_on_peek:override(v318 and v301.lethal[v316.weapon_name] ~= nil or nil);
                return;
            end;
        end;
    end;
end;
v301.WEAPONTYPE_GRENADE = 9;
v301.GRENADE_SECONDARY_DAMPENING = 0.5;
v301.super_toss_get = function(v319, v320, v321, v322)
    -- upvalues: v23 (ref), v301 (ref)
    local v323 = math.clamp(v320, 15, 750);
    local v324 = math.clamp(v321, 0, 1);
    v323 = v323 * v23.lerp(v301.GRENADE_SECONDARY_DAMPENING, 1, v324);
    return (vector():angles(v319) * v323 - v322):angles();
end;
v301.super_toss = function(v325)
    -- upvalues: v61 (ref), v301 (ref)
    if not v61.elements.additions.super_toss:get() then
        return;
    elseif render.camera_angles() ~= v325.view_angles:clone() then
        return;
    else
        local v326 = entity.get_local_player();
        if v326 == nil then
            return;
        else
            local v327 = v326:get_player_weapon();
            if v327 == nil then
                return;
            else
                local v328 = v327:get_weapon_info();
                if v328 == nil then
                    return;
                else
                    if v328.weapon_type == v301.WEAPONTYPE_GRENADE and globals.curtime - to_time(globals.clock_offset) < v327.m_fThrowTime then
                        v325.in_speed = true;
                        v325.view_angles = v301.super_toss_get(render.camera_angles(), v328.throw_velocity, v327.m_flThrowStrength, v326.m_vecVelocity);
                    end;
                    return;
                end;
            end;
        end;
    end;
end;
events.grenade_override_view:set(function(v329)
    -- upvalues: v61 (ref), v301 (ref)
    if not v61.elements.additions.super_toss:get() then
        return;
    else
        local v330 = entity.get_local_player();
        if v330 == nil then
            return;
        else
            local v331 = v330:get_player_weapon();
            if v331 == nil then
                return;
            else
                local v332 = v331:get_weapon_info();
                if v332 == nil then
                    return;
                else
                    v329.angles = v301.super_toss_get(v329.angles, v332.throw_velocity, v331.m_flThrowStrength, v329.velocity);
                    return;
                end;
            end;
        end;
    end;
end);
events.createmove:set(function(v333)
    -- upvalues: v301 (ref)
    v301.fakelag(v333);
    v301.force_body(v333);
    v301.super_toss(v333);
end);
v301.ground_tick = 1;
v301.end_time = 0;
local function _(v334, v335)
    return function(...)
        -- upvalues: v334 (ref), v335 (ref)
        return v334(v335, ...);
    end;
end;
local _ = ffi.cast(ffi.typeof("uintptr_t**"), utils.create_interface("client.dll", "VClientEntityList003"));
entity.get_anim_layer = function(v338, v339)
    if not v339 then
        v339 = 1;
    end;
    v338 = ffi.cast(ffi.typeof("void***"), v338);
    return ffi.cast("c_animlayers**", ffi.cast("char*", v338) + 10640)[0][v339];
end;
v301.animbreaker = function()
    -- upvalues: v61 (ref), v301 (ref)
    if not v61.elements.additions.animation:get() then
        return;
    else
        local v340 = entity.get_local_player();
        local l_m_vecVelocity_0 = v340.m_vecVelocity;
        local v342 = bit.band(v340.m_fFlags, bit.lshift(1, 0)) ~= 0;
        local l_curtime_0 = globals.curtime;
        if v342 == true then
            v301.ground_tick = v301.ground_tick + 1;
        else
            v301.ground_tick = 0;
            v301.end_time = l_curtime_0 + 1;
        end;
        if v61.elements.additions.animation.ground:get() == "static" then
            v340.m_flPoseParameter[0] = 1;
            v61.refs.leg:override("Sliding");
        end;
        if v61.elements.additions.animation.ground:get() == "jitter" then
            if globals.tickcount % 4 > 1 then
                v340.m_flPoseParameter[0] = 1;
            end;
            v61.refs.leg:override("Sliding");
        end;
        if v61.elements.additions.animation.ground:get() == "forward walking" then
            v340.m_flPoseParameter[7] = 1;
            v61.refs.leg:override("Walking");
        end;
        if v61.elements.additions.animation.ground:get() == "kangaroo" then
            v340.m_flPoseParameter[3] = utils.random_int(0, 10) / 10;
            v340.m_flPoseParameter[9] = utils.random_int(0, 10) / 10;
            v340.m_flPoseParameter[10] = utils.random_int(0, 10) / 10;
            v61.refs.leg:override("Walking");
        end;
        if v61.elements.additions.animation.air:get() == "static" then
            v340.m_flPoseParameter[6] = 1;
        end;
        if v61.elements.additions.animation.air:get() == "jitter" and globals.tickcount % 4 > 1 then
            v340.m_flPoseParameter[6] = 1;
        end;
        if v61.elements.additions.animation.air:get() == "walking" and math.abs(l_m_vecVelocity_0.z) > 2 then
            entity.get_anim_layer(get_entity_address(entity.get_local_player():get_index()), 12).m_flWeight = 1;
        end;
        if v61.elements.additions.animation.air:get() == "kangaroo" then
            v340.m_flPoseParameter[6] = utils.random_int(0, 10) / 10;
        end;
        if v61.elements.additions.animation.pitch:get() and v301.ground_tick > 1 and l_curtime_0 < v301.end_time and v342 then
            v340.m_flPoseParameter[12] = 0.5;
        end;
        return;
    end;
end;
events.post_update_clientside_animation:set(function()
    -- upvalues: v301 (ref)
    v301.animbreaker();
end);
v301.hitchance = function()
    -- upvalues: v61 (ref), v81 (ref)
    if not v61.elements.additions.hitchance:get() then
        v61.refs.hc:override();
        return;
    else
        local v344 = entity.get_local_player();
        if v344 == nil then
            v61.refs.hc:override();
            return;
        else
            local v345 = v344:get_player_weapon();
            if v345 == nil then
                v61.refs.hc:override();
                return;
            else
                local l_weapon_class_0 = v345:get_weapon_info().weapon_class;
                local l_m_bIsScoped_1 = v344.m_bIsScoped;
                local l_m_bDucked_1 = v344.m_bDucked;
                local l_in_air_0 = v81.in_air;
                if not l_m_bIsScoped_1 and l_weapon_class_0 == "primary_sniper" and v61.elements.additions.hitchance.conditions:get("noscope") then
                    v61.refs.hc:override(v61.elements.additions.hitchance.noscope:get());
                elseif l_m_bDucked_1 and v61.elements.additions.hitchance.conditions:get("predict") then
                    v61.refs.hc:override(v61.elements.additions.hitchance.predict:get());
                elseif l_in_air_0 and v61.elements.additions.hitchance.conditions:get("in-air") then
                    v61.refs.hc:override(v61.elements.additions.hitchance.air:get());
                else
                    v61.refs.hc:override(nil);
                end;
                return;
            end;
        end;
    end;
end;
v301.latency = function()
    -- upvalues: v61 (ref)
    if v61.elements.additions.unlock:get() then
        cvar.sv_maxunlag:float(0.8);
        v61.refs.lat:override(v61.elements.additions.unlock.amount:get());
    else
        cvar.sv_maxunlag:float(0.2);
        v61.refs.lat:override();
    end;
end;
v301.sv_maxusrcmdprocessticks = cvar.sv_maxusrcmdprocessticks:int();
v301.idealtick = function()
    -- upvalues: v61 (ref), v301 (ref)
    if v61.elements.additions.idealtick:get() then
        v61.refs.peek:override(true);
        v61.refs.peekstop:override({
            [1] = "Early"
        });
        v61.refs.immediateteleport:override(true);
        cvar.sv_maxusrcmdprocessticks:int(19);
    else
        v61.refs.peek:override();
        v61.refs.peekstop:override();
        v61.refs.immediateteleport:override();
        cvar.sv_maxusrcmdprocessticks:int(v301.sv_maxusrcmdprocessticks);
    end;
end;
v301.phrases = {
    [1] = "B L O O R 4", 
    [2] = "11111111", 
    [3] = "1", 
    [4] = "\208\184\208\183\208\184 by night lua", 
    [5] = "\209\133\208\190\209\135\208\181\209\136\209\140 \208\184\208\179\209\128\208\176\209\130\209\140 \209\130\208\176\208\186 \208\182\208\181? \208\186\209\131\208\191\208\184 night.lua", 
    [6] = "\208\189\208\181 \208\188\208\190\208\182\208\181\209\136\209\140 \209\131\208\177\208\184\209\130\209\140 \208\188\208\181\208\189\209\143:( \208\186\209\131\208\191\208\184 night.lua", 
    [7] = "ez", 
    [8] = "\209\132\209\131,\208\182\208\184\209\128\208\189\209\139\208\185 \208\178\209\139\208\177\208\187\209\143\208\180\208\190\208\186", 
    [9] = "\208\176\208\187\208\187\208\176\209\133 \208\177\208\176\208\177\208\176\209\133 \209\135\209\131\209\128\208\186\208\184", 
    [10] = "\208\184\208\183\208\184 \208\178\209\139\208\177\208\187\209\143\208\180\208\190\208\186", 
    [11] = "iq?", 
    [12] = "1 \209\136\208\187\209\142\209\133\208\176 \208\188\208\176\209\130\209\140 \209\130\208\178\208\190\209\142 \208\181\208\177\208\176\208\187", 
    [13] = "\208\186\208\187\208\176\209\129\209\129\208\189\208\190 \208\184\208\179\209\128\208\176\208\181\209\136\209\140", 
    [14] = "\208\180\208\176\208\182\208\181 \209\130\208\178\208\190\209\143 \208\188\208\176\209\130\209\140 \209\129 night.lua \208\184\208\179\209\128\208\176\208\181\209\130", 
    [15] = "\209\130\209\139 \209\129\209\130\208\176\209\128\208\176\208\187\209\129\209\143", 
    [16] = "\208\177\209\128\208\190 \208\191\208\190\209\135\208\181\208\188\209\131 \209\129\208\190\209\129\208\176\208\187? \208\191\208\190\209\130\208\190\208\188\209\131 \209\135\209\130\208\190 \208\189\208\181\209\130 night.lua", 
    [17] = "\209\129\208\191\208\176\209\129\208\184\208\177\208\190 \208\183\208\176 \208\186\208\184\208\187\208\187", 
    [18] = "\208\181\208\177\208\176\209\130\209\140 \209\143 \209\130\208\181\208\177\209\143 \209\130\208\176\208\191\208\189\209\131\208\187 \209\131\209\137\208\181\209\128\208\177", 
    [19] = "l2p \208\180\208\190\208\187\208\177\208\176\208\181\208\177", 
    [20] = "\208\176\209\133\208\176\209\133\208\176\209\133\208\176 \208\189\208\176\208\185\209\129 \208\176\208\176 \208\180\208\190\208\180\208\184\208\186"
};
v301.clantag = {
    [1] = "night.lua", 
    [2] = "night.lu", 
    [3] = "night.l", 
    [4] = "night.", 
    [5] = "night", 
    [6] = "nigh", 
    [7] = "nig", 
    [8] = "ni", 
    [9] = "n", 
    [10] = "", 
    [11] = "n", 
    [12] = "ni", 
    [13] = "nig", 
    [14] = "nigh", 
    [15] = "night", 
    [16] = "night.", 
    [17] = "night.l", 
    [18] = "night.lu", 
    [19] = "night.lua"
};
events.aim_ack:set(function(_)
    -- upvalues: v61 (ref)
    if v61.elements.additions.idealtick:get() then
        v61.refs.immediateteleport:override(false);
        rage.exploit:force_teleport();
    end;
end);
events.player_death:set(function(v351)
    -- upvalues: v61 (ref), v301 (ref)
    if not v61.elements.additions.killsay:get() then
        return;
    else
        local v352 = entity.get_local_player();
        if v352 == nil then
            return;
        else
            local v353 = entity.get(v351.userid, true);
            local v354 = entity.get(v351.attacker, true);
            if v352 ~= v353 and v352 == v354 then
                utils.console_exec("say " .. v301.phrases[math.random(#v301.phrases)]);
            end;
            return;
        end;
    end;
end);
v301.tag = ui.find("Miscellaneous", "Main", "In-Game", "Clan Tag");
events.pre_render:set(function()
    -- upvalues: v61 (ref), v301 (ref)
    if not entity.get_local_player() then
        return;
    else
        local v355 = true;
        if v61.elements.additions.tag:get() then
            v355 = false;
            local v356 = math.floor(globals.curtime * 2.5);
            if old_time ~= v356 then
                common.set_clan_tag(v301.clantag[v356 % #v301.clantag + 1]);
                old_time = v356;
                v301.tag:override(false);
            end;
        else
            v355 = true;
            local v357 = math.floor(globals.curtime * 0);
            if old_time ~= v357 and v355 then
                old_time = v357;
                v301.tag:override();
                common.set_clan_tag("");
                v355 = false;
            end;
        end;
        return;
    end;
end);
v301.aspect = cvar.r_aspectratio:float();
events.render:set(function()
    -- upvalues: v61 (ref)
    if v61.elements.visuals.aspect:get() then
        cvar.r_aspectratio:float(v61.elements.visuals.aspect.width:get() * 0.01);
    else
        cvar.r_aspectratio:float(0);
    end;
end);
v301.x = cvar.viewmodel_offset_x:float();
v301.y = cvar.viewmodel_offset_y:float();
v301.z = cvar.viewmodel_offset_z:float();
v301.fov = cvar.viewmodel_fov:float();
events.render:set(function()
    -- upvalues: v61 (ref)
    if v61.elements.visuals.aspect:get() then
        cvar.r_aspectratio:float(v61.elements.visuals.aspect.width:get() * 0.01);
    else
        cvar.r_aspectratio:float(0);
    end;
end);
events.shutdown:set(function()
    cvar.r_aspectratio:float(0);
end);
events.render:set(function()
    -- upvalues: v61 (ref), v301 (ref)
    if v61.elements.visuals.viewmodel:get() then
        cvar.viewmodel_offset_x:float(v61.elements.visuals.viewmodel.x:get() * 0.1, true);
        cvar.viewmodel_offset_y:float(v61.elements.visuals.viewmodel.y:get() * 0.1, true);
        cvar.viewmodel_offset_z:float(v61.elements.visuals.viewmodel.z:get() * 0.1, true);
        cvar.viewmodel_fov:float(v61.elements.visuals.viewmodel.fov:get() * 0.1, true);
    else
        cvar.viewmodel_offset_x:float(v301.x);
        cvar.viewmodel_offset_y:float(v301.y);
        cvar.viewmodel_offset_z:float(v301.z);
        cvar.viewmodel_fov:float(v301.fov);
    end;
end);
events.shutdown:set(function()
    -- upvalues: v301 (ref)
    cvar.viewmodel_offset_x:float(v301.x);
    cvar.viewmodel_offset_y:float(v301.y);
    cvar.viewmodel_offset_z:float(v301.z);
    cvar.viewmodel_fov:float(v301.fov);
end);
events.render:set(function()
    -- upvalues: v301 (ref)
    v301.hitchance();
    v301.latency();
    v301.idealtick();
end);
local v358 = {
    [0] = "generic", 
    [1] = "head", 
    [2] = "chest", 
    [3] = "stomach", 
    [4] = "chest", 
    [5] = "chest", 
    [6] = "legs", 
    [7] = "legs", 
    [8] = "head", 
    [9] = nil, 
    [10] = "gear"
};
do
    local l_v358_0 = v358;
    events.aim_ack:set(function(v360)
        -- upvalues: v61 (ref), l_v358_0 (ref)
        if not v61.elements.visuals.logs:get() then
            return;
        else
            local l_target_0 = v360.target;
            local v362 = v360.damage or 0;
            local v363 = l_target_0.m_iHealth - v362 > 0 and l_target_0.m_iHealth - v362 or 0;
            local l_backtrack_0 = v360.backtrack;
            local l_hitchance_0 = v360.hitchance;
            local v366 = l_target_0:get_name();
            local v367 = l_v358_0[v360.hitgroup];
            if v360.state == nil then
                local v368 = string.format("hit %s in %s for %s (%s remaining, %s hc, %s bt)", tostring(v366), tostring(v367), tostring(v362), tostring(v363), l_hitchance_0, l_backtrack_0);
                common.add_notify("night.lua", v368);
                print_raw(string.format("night.lua - %s", v368));
            else
                local v369 = string.format("missed %s %s due to %s (%s hc, %s bt)", tostring(v366), tostring(l_v358_0[v360.wanted_hitgroup]), tostring(v360.state), l_hitchance_0, l_backtrack_0);
                common.add_notify("night.lua", v369);
                print_raw(string.format("\aFF0000FFnight.lua \aDEFAULT- %s", v369));
            end;
            return;
        end;
    end);
end;