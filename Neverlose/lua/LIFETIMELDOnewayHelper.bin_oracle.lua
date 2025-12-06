local v0 = {
    visuals_cat = ui.get_icon("eye"), 
    customizations = ui.get_icon("paintbrush"), 
    colors = ui.get_icon("palette"), 
    home_cat = ui.get_icon("house"), 
    helper_cat = ui.get_icon("gear"), 
    config = ui.get_icon("server"), 
    build = ui.get_icon("bars-staggered"), 
    last_upd = ui.get_icon("tag"), 
    username = ui.get_icon("person-walking"), 
    loc_cat = ui.get_icon("screwdriver-wrench")
};
local v1 = common.get_username();
local v2 = ui.create(v0.home_cat, v0.home_cat .. " Main");
local _ = ui.create(v0.home_cat, "");
local v4 = ui.create(v0.helper_cat, v0.helper_cat .. " Helper");
local v5 = ui.create(v0.visuals_cat .. " & " .. v0.loc_cat, v0.customizations .. " Customizations");
local v6 = ui.create(v0.visuals_cat .. " & " .. v0.loc_cat, v0.colors .. " Colors", 2);
local v7 = "Stable";
local v8 = "23.03.23";
local v9 = pcall(function()
    -- upvalues: v1 (ref)
    render.load_image(network.get("https://neverlose.cc/static/avatars/" .. v1 .. ".png"));
end) and render.load_image(network.get("https://neverlose.cc/static/avatars/" .. v1 .. ".png")) or render.load_image("\255\216\255\224\000\016JFIF\000\001\001\000\000\001\000\001\000\000\255\254\000;CREATOR: gd-jpeg v1.0 (using IJG JPEG v62), quality = 80\n\255\219\000C\000\006\004\005\006\005\004\006\006\005\006\a\a\006\b\n\016\n\n\t\t\n\020\014\015\f\016\023\020\024\024\023\020\022\022\026\029%\031\026\027#\028\022\022 , #&')*)\025\031-0-(0%()(\255\219\000C\001\a\a\a\n\b\n\019\n\n\019(\026\022\026((((((((((((((((((((((((((((((((((((((((((((((((((\255\192\000\017\b\000@\000@\003\001\"\000\002\017\001\003\017\001\255\196\000\031\000\000\001\005\001\001\001\001\001\001\000\000\000\000\000\000\000\000\001\002\003\004\005\006\a\b\t\n\v\255\196\000\181\016\000\002\001\003\003\002\004\003\005\005\004\004\000\000\001}\001\002\003\000\004\017\005\018!1A\006\019Qa\a\"q\0202\129\145\161\b#B\177\193\021R\209\240$3br\130\t\n\022\023\024\025\026%&'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz\131\132\133\134\135\136\137\138\146\147\148\149\150\151\152\153\154\162\163\164\165\166\167\168\169\170\178\179\180\181\182\183\184\185\186\194\195\196\197\198\199\200\201\202\210\211\212\213\214\215\216\217\218\225\226\227\228\229\230\231\232\233\234\241\242\243\244\245\246\247\248\249\250\255\196\000\031\001\000\003\001\001\001\001\001\001\001\001\001\000\000\000\000\000\000\001\002\003\004\005\006\a\b\t\n\v\255\196\000\181\017\000\002\001\002\004\004\003\004\a\005\004\004\000\001\002w\000\001\002\003\017\004\005!1\006\018AQ\aaq\019\"2\129\b\020B\145\161\177\193\t#3R\240\021br\209\n\022$4\225%\241\023\024\025\026&'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz\130\131\132\133\134\135\136\137\138\146\147\148\149\150\151\152\153\154\162\163\164\165\166\167\168\169\170\178\179\180\181\182\183\184\185\186\194\195\196\197\198\199\200\201\202\210\211\212\213\214\215\216\217\218\226\227\228\229\230\231\232\233\234\242\243\244\245\246\247\248\249\250\255\218\000\f\003\001\000\002\017\003\017\000?\000\240\137\230\147\207\147\247\143\247\143\241\031Zg\157'\252\244\127\251\232\209?\250\249?\222?\206\153@\015\243\164\255\000\158\143\255\000}\026<\233?\231\163\255\000\223F\153Z:.\135\170\235\1474Z>\157uz\235\247\132\017\023\219\245#\167\227@\020|\233?\231\163\255\000\223F\143:O\249\232\255\000\247\209\173\029o\195\186\206\134W\251cK\188\178\015\194\180\209\021V\250\030\134\178\232\001\254t\159\243\209\255\000\239\163O\130i<\248\255\000x\255\000x\127\017\245\168i\240\127\175\143\253\225\252\232\000\159\253|\159\239\031\231L\167\207\254\190O\247\143\243\166P\005\221\019O}[Y\176\211\162`\178]\207\028\nOb\204\020\031\214\190\168\241w\136t\143\132^\018\211\2374\221<J\210\019\028\016\006\217\188\1287H\237\142\188\140\250\147_'[\207-\181\196s\219\200\241M\019\aI\017\138\178\1769\004\017\208\131V\245MgS\213\252\191\237]F\242\247\203\206\207\180L\210m\207\\d\156t\020\001\245\023\195\239\028\233\159\020t\221GK\213t\196\138TL\205l\237\230$\136N7)\192 \131\249q\131_4\248\219D\030\028\241f\169\164\171\023KY\202#\030\165\015+\159|\017_B|\022\240\164^\006\240\157\223\136\188@\226\218\230\230\017,\158g\030D#\144\015\251G\169\031A\214\190z\241\174\183\255\000\t\031\138\245MX!D\186\152\186)\234\019\162\131\239\128(\003\022\159\a\250\248\255\000\222\031\206\153O\131\253|\127\239\015\231@\004\255\000\235\228\255\000x\255\000:e>\127\245\242\127\188\127\1572\128\n\237\254\vi\150\218\191\196\173\030\218\2461$\n\2071F\025\fQ\025\134}\178\005q\021\211\2526\211uM_\198\022vZ\014\160t\237BE\144\199r\025\151h\bI\229y\228\002?\026\000\245\031\218o\196\247b\254\207\195p1\142\207\202[\169\241\214F,\193A\246\027s\245>\213\224\245\216\252V\209\245\173\019\196\233k\226=P\234\151\166\221\028N]\155\bKar\220\245\a\243\174:\128\n|\031\235\227\255\000x\127:e>\015\245\241\255\000\188?\157\000\019\255\000\175\147\253\227\252\233\1494\240\201\231\201\251\183\251\199\248O\1733\201\147\254y\191\253\242h\001\149{C\213\239\244-J-CI\184kk\200\193\t\"\128H\200 \245\004t&\170y2\127\2077\255\000\190M\030L\159\243\205\255\000\239\147@\026\030!\215\181?\017_\139\221j\237\174\238\130\b\196\140\160\029\160\146\a\000z\154\204\167\2492\127\2077\255\000\190M\030L\159\243\205\255\000\239\147@\f\167\193\254\190?\247\135\243\163\201\147\254y\191\253\242i\240C'\159\031\238\223\239\015\225>\180\001\255\217");
local _ = v2:label(v0.username .. " Username: \n" .. "    " .. v1);
local _ = v2:texture(v9, vector(28, 28), 20);
local _ = v2:label(v0.build .. " Current Build: \n" .. "     " .. v7);
local _ = v2:label(v0.last_upd .. " Last Update: \n" .. "     " .. v8);
local v14 = v4:switch("Oneway helper", false);
local v15 = v4:switch("Move Bind", false);
local v16 = v4:slider("Magnet FOV", 50, 150, 50);
local v17 = v6:color_picker("Text Color", color(255, 255, 255, 255));
local v18 = v6:color_picker("Background Color", color(0, 0, 0, 150));
local v19 = v6:color_picker("Icon Color", color(255, 255, 255, 255));
local v20 = v6:color_picker("Circle Color", color(255, 255, 255, 255));
local v21 = v6:color_picker("Separation Color", color(255, 255, 255, 255));
local v22 = v5:switch("Only visible", false);
local v23 = v5:selectable("Extra visuals", {
    [1] = "Aim-Line", 
    [2] = "Description line"
});
local v24 = v23:create();
local v25 = v24:color_picker("Aim-Line Color", color(255, 255, 255, 255));
local v26 = v24:color_picker("Description Line Color", color(255, 255, 255, 255));
local _ = v5:label("More coming soon...");
local l_gradient_0 = require("neverlose/gradient");
local l_weapons_0 = require("neverlose/csgo_weapons");
local v30 = l_gradient_0.text("Oneway [V1.8]", false, {
    color(99, 191, 238), 
    color(110, 255, 178), 
    color(145, 255, 171)
});
ui.sidebar(v30, "user-secret");
local v31 = {
    [1] = {
        description = "Fake duck + E", 
        map = "de_mirage", 
        name = "Palace Entrance", 
        position = {
            [1] = -33.596546, 
            [2] = -1742.375, 
            [3] = -121.96875
        }, 
        angle = {
            [1] = -13.562880516052246, 
            [2] = -80.47711944580078
        }
    }, 
    [2] = {
        description = "Crouch + E", 
        map = "de_mirage", 
        name = "Palace Entrance", 
        position = {
            [1] = 115.993324, 
            [2] = -2071.726318, 
            [3] = 28.03125
        }, 
        angle = {
            [1] = 1.650751, 
            [2] = -21.238913
        }
    }, 
    [3] = {
        description = "Stand", 
        map = "de_mirage", 
        name = "Cat Box", 
        position = {
            [1] = -695.164978, 
            [2] = -867.308411, 
            [3] = -186.318604
        }, 
        angle = {
            [1] = -1.4627931118011475, 
            [2] = 102.77088165283203
        }
    }, 
    [4] = {
        description = "Stand", 
        map = "de_mirage", 
        name = "Connector", 
        position = {
            [1] = -758.4989013671875, 
            [2] = -1321.30224609375, 
            [3] = -108.56095123291016
        }, 
        angle = {
            [1] = 10.404932975769043, 
            [2] = 82.45069122314453
        }
    }, 
    [5] = {
        description = "Fake duck", 
        map = "de_mirage", 
        name = "Apartments", 
        position = {
            [1] = -2336.7314453125, 
            [2] = 766.5013427734375, 
            [3] = -79.1664810180664
        }, 
        angle = {
            [1] = -5.943861484527588, 
            [2] = -2.0283021926879883
        }
    }, 
    [6] = {
        description = "Fake duck", 
        map = "de_mirage", 
        name = "Cat", 
        position = {
            [1] = -669.016357, 
            [2] = -739.79248, 
            [3] = -198.082092
        }, 
        angle = {
            [1] = -5.072679, 
            [2] = 100.462761
        }
    }, 
    [7] = {
        description = "Stand", 
        map = "de_mirage", 
        name = "T Stairs", 
        position = {
            [1] = 275.092529296875, 
            [2] = 316.94354248046875, 
            [3] = -201.4618377685547
        }, 
        angle = {
            [1] = 0.7233693599700928, 
            [2] = 11.497645378112793
        }
    }, 
    [8] = {
        description = "Stand", 
        map = "de_mirage", 
        name = "Top Mid", 
        position = {
            [1] = 219.89126586914062, 
            [2] = 877.2789306640625, 
            [3] = -76.8647232055664
        }, 
        angle = {
            [1] = 2.8979110717773438, 
            [2] = -90.38306427001953
        }
    }, 
    [9] = {
        [1] = 32, 
        description = "Fake duck", 
        map = "de_mirage", 
        name = "House Stairs / Top Mid Connector", 
        position = {
            [1] = 454.9155578613281, 
            [2] = 852.4118041992188, 
            [3] = -53.246543884277344
        }, 
        angle = {
            [1] = 16.369403839111328, 
            [2] = -44.87099838256836
        }
    }, 
    [10] = {
        description = "Fake duck", 
        map = "de_mirage", 
        name = "Underpass Stairs", 
        position = {
            [1] = -1264.1064453125, 
            [2] = 218.20901489257812, 
            [3] = -120.45449829101562
        }, 
        angle = {
            [1] = 12.757319450378418, 
            [2] = 27.84868621826172
        }
    }, 
    [11] = {
        [1] = "Wallbang", 
        description = "Stand", 
        map = "de_mirage", 
        name = "Underpass Stairs", 
        position = {
            [1] = -1124.922119140625, 
            [2] = 310.01190185546875, 
            [3] = -100.71343994140625
        }, 
        angle = {
            [1] = 29.21480369567871, 
            [2] = 42.90019226074219
        }
    }, 
    [12] = {
        description = "Fake duck", 
        map = "de_mirage", 
        name = "Market Entrace", 
        position = {
            [1] = -1705.237548828125, 
            [2] = -1220.2938232421875, 
            [3] = -207.29591369628906
        }, 
        angle = {
            [1] = -7.482339859008789, 
            [2] = 79.5807113647461
        }
    }, 
    [13] = {
        description = "Stand", 
        map = "de_mirage", 
        name = "Apartment Entrance", 
        position = {
            [1] = -374.2903137207031, 
            [2] = 779.552978515625, 
            [3] = -20.803316116333008
        }, 
        angle = {
            [1] = 1.6386109590530396, 
            [2] = -161.68849182128906
        }
    }, 
    [14] = {
        description = "Crouch", 
        map = "de_mirage", 
        name = "Underpass Stairs", 
        position = {
            [1] = -1101.185791015625, 
            [2] = 522.3583984375, 
            [3] = -38.548126220703125
        }, 
        angle = {
            [1] = 80.03816223144531, 
            [2] = -51.8855094909668
        }
    }, 
    [15] = {
        description = "Stand", 
        map = "de_mirage", 
        name = "Right Side Connector", 
        position = {
            [1] = -842.7730102539062, 
            [2] = 32.43463134765625, 
            [3] = -108.64161682128906
        }, 
        angle = {
            [1] = 1.2841607332229614, 
            [2] = -85.02303314208984
        }
    }, 
    [16] = {
        description = "Fake duck", 
        map = "de_mirage", 
        name = "Palace Entrance", 
        position = {
            [1] = -811.739013671875, 
            [2] = -1145.87060546875, 
            [3] = -72.66464233398438
        }, 
        angle = {
            [1] = -2.2234721183776855, 
            [2] = -50.907833099365234
        }
    }, 
    [17] = {
        description = "Stand", 
        map = "de_mirage", 
        name = "CT Stairs", 
        position = {
            [1] = -1495.1767578125, 
            [2] = -1588.8564453125, 
            [3] = -201.6099395751953
        }, 
        angle = {
            [1] = -0.707923412322998, 
            [2] = -79.56673431396484
        }
    }, 
    [18] = {
        [1] = "Wallbang", 
        description = "Stand", 
        map = "de_mirage", 
        name = "CT Spawn", 
        position = {
            [1] = -1722.5516357421875, 
            [2] = -680.75244140625, 
            [3] = -108.86699676513672
        }, 
        angle = {
            [1] = 3.074936866760254, 
            [2] = -86.70063781738281
        }
    }, 
    [19] = {
        [1] = "Wallbang", 
        description = "Stand (AWP)", 
        map = "de_mirage", 
        name = "Market Entrace", 
        position = {
            [1] = -2231.71142578125, 
            [2] = 32.56330490112305, 
            [3] = -108.5659408569336
        }, 
        angle = {
            [1] = -0.22803455591201782, 
            [2] = -47.783348083496094
        }
    }, 
    [20] = {
        description = "Fake duck", 
        map = "de_mirage", 
        name = "A Ramp", 
        position = {
            [1] = -291.80877685546875, 
            [2] = -2112.17333984375, 
            [3] = -53.190345764160156
        }, 
        angle = {
            [1] = 7.508554935455322, 
            [2] = 48.7481803894043
        }
    }, 
    [21] = {
        [1] = "ESP Oneway", 
        description = "Fake duck + E", 
        map = "de_mirage", 
        name = "Palace/A Ramp Connector", 
        position = {
            [1] = 1127.9307861328125, 
            [2] = 228.2334747314453, 
            [3] = -185.51644897460938
        }, 
        angle = {
            [1] = -1.6344425678253174, 
            [2] = -89.02660369873047
        }
    }, 
    [22] = {
        description = "Fake duck + E", 
        map = "de_mirage", 
        name = "Apartments + House", 
        position = {
            [1] = -477.98028564453125, 
            [2] = 492.88311767578125, 
            [3] = -99.00080871582031
        }, 
        angle = {
            [1] = -0.6445350646972656, 
            [2] = 89.8587417602539
        }
    }, 
    [23] = {
        description = "Crouch", 
        map = "de_mirage", 
        name = "Ramp", 
        position = {
            [1] = 780.37841796875, 
            [2] = -1550.7978515625, 
            [3] = -60.35479736328125
        }, 
        angle = {
            [1] = 18.644933700561523, 
            [2] = -176.00025939941406
        }
    }, 
    [24] = {
        description = "Stand", 
        map = "de_mirage", 
        name = "House exit", 
        position = {
            [1] = -859.4331665039062, 
            [2] = 614.7947387695312, 
            [3] = -14.041431427001953
        }, 
        angle = {
            [1] = 2.2666337490081787, 
            [2] = 7.958107948303223
        }
    }, 
    [25] = {
        description = "Stand (AWP)", 
        map = "de_mirage", 
        name = "Apartment entrance", 
        position = {
            [1] = -1843.001220703125, 
            [2] = 488.68048095703125, 
            [3] = -101.81539916992188
        }, 
        angle = {
            [1] = -2.849693775177002, 
            [2] = 3.4349939823150635
        }
    }, 
    [26] = {
        description = "Fake duck", 
        map = "de_mirage", 
        name = "B Van", 
        position = {
            [1] = -2259.607421875, 
            [2] = 677.5836791992188, 
            [3] = 7.429899215698242
        }, 
        angle = {
            [1] = 5.68641996383667, 
            [2] = -71.17919158935547
        }
    }, 
    [27] = {
        [1] = "Wallbang", 
        description = "Stand (manual shoot/ESP) ", 
        map = "de_mirage", 
        name = "Palace", 
        position = {
            [1] = -1506.1005859375, 
            [2] = -990.6868896484375, 
            [3] = -149.39236450195312
        }, 
        angle = {
            [1] = -3.874444007873535, 
            [2] = -38.0708122253418
        }
    }, 
    [28] = {
        description = "Stand", 
        map = "de_mirage", 
        name = "Top Mid", 
        position = {
            [1] = -266.930573, 
            [2] = -366.495056, 
            [3] = -103.172424
        }, 
        angle = {
            [1] = 1.882086, 
            [2] = 19.124743
        }
    }, 
    [29] = {
        [1] = "Wallbang", 
        description = "Stand", 
        map = "de_mirage", 
        name = "Balcony", 
        position = {
            [1] = 462.96588134765625, 
            [2] = -2084.01904296875, 
            [3] = 18.9892520904541
        }, 
        angle = {
            [1] = 1.6673067808151245, 
            [2] = 177.59693908691406
        }
    }, 
    [30] = {
        description = "Fake duck", 
        map = "de_dust2", 
        name = "T Spawn", 
        position = {
            [1] = -1828.306884765625, 
            [2] = -455.19976806640625, 
            [3] = 141.17587280273438
        }, 
        angle = {
            [1] = -2.199988603591919, 
            [2] = -17.8001766204834
        }
    }, 
    [31] = {
        description = "Fake duck + E", 
        map = "de_dust2", 
        name = "Tunnels", 
        position = {
            [1] = -2071.30908203125, 
            [2] = 2895.8076171875, 
            [3] = 82.59713745117188
        }, 
        angle = {
            [1] = 0.7149654626846313, 
            [2] = -83.99018859863281
        }
    }, 
    [32] = {
        description = "Fake duck", 
        map = "de_dust2", 
        name = "Mid/Cat", 
        position = {
            [1] = -210.51968383789062, 
            [2] = 542.5650634765625, 
            [3] = 47.2431755065918
        }, 
        angle = {
            [1] = 5.387450218200684, 
            [2] = 100.62740325927734
        }
    }, 
    [33] = {
        description = "Fake duck", 
        map = "de_dust2", 
        name = "Long Doors / Blue", 
        position = {
            [1] = 1299.95654296875, 
            [2] = 620.3975219726562, 
            [3] = -3.8381288051605225
        }, 
        angle = {
            [1] = 1.5557122230529785, 
            [2] = 150.635986328125
        }
    }, 
    [34] = {
        description = "Fake duck", 
        map = "de_dust2", 
        name = "A Site / Long", 
        position = {
            [1] = 1528.8955078125, 
            [2] = 505.183837890625, 
            [3] = -49.267723083496094
        }, 
        angle = {
            [1] = -3.854454517364502, 
            [2] = 99.73228454589844
        }
    }, 
    [35] = {
        description = "Fake duck (Long Plant)", 
        map = "de_dust2", 
        name = "A Site", 
        position = {
            [1] = 1570.482421875, 
            [2] = 461.5287170410156, 
            [3] = -63.220176696777344
        }, 
        angle = {
            [1] = -5.327244758605957, 
            [2] = 99.6102294921875
        }
    }, 
    [36] = {
        [1] = "Wallbang", 
        description = "Crouch", 
        map = "de_dust2", 
        name = "B Doors", 
        position = {
            [1] = 16.597061157226562, 
            [2] = 2311.9716796875, 
            [3] = 17.10267448425293
        }, 
        angle = {
            [1] = -0.5667411088943481, 
            [2] = -177.3401641845703
        }
    }, 
    [37] = {
        description = "Fake duck", 
        map = "de_dust2", 
        name = "Long Cross / Ramp", 
        position = {
            [1] = 493.2771911621094, 
            [2] = 2613.61572265625, 
            [3] = 143.1537322998047
        }, 
        angle = {
            [1] = 5.055543422698975, 
            [2] = -37.76759338378906
        }
    }, 
    [38] = {
        [1] = "Wallbang", 
        description = "Stand ", 
        map = "de_dust2", 
        name = "Long Doors", 
        position = {
            [1] = 1372.70068359375, 
            [2] = 1358.381103515625, 
            [3] = 50.24076843261719
        }, 
        angle = {
            [1] = -0.30388620495796204, 
            [2] = -139.5752716064453
        }
    }, 
    [39] = {
        [1] = "Wallbang", 
        description = "Stand", 
        map = "de_dust2", 
        name = "Long Doors Box", 
        position = {
            [1] = 530.4532470703125, 
            [2] = 826.2880249023438, 
            [3] = 62.459720611572266
        }, 
        angle = {
            [1] = 0.7473396062850952, 
            [2] = -50.05582046508789
        }
    }, 
    [40] = {
        description = "Stand", 
        map = "de_dust2", 
        name = "Outside Long House", 
        position = {
            [1] = 554.1951293945312, 
            [2] = 353.6593017578125, 
            [3] = 69.35932159423828
        }, 
        angle = {
            [1] = 2.23449444770813, 
            [2] = -145.07130432128906
        }
    }, 
    [41] = {
        description = "Stand ", 
        map = "de_dust2", 
        name = "Top Mid", 
        position = {
            [1] = 654.1134033203125, 
            [2] = 297.8545227050781, 
            [3] = 59.560081481933594
        }, 
        angle = {
            [1] = 0.6505045294761658, 
            [2] = -179.7573699951172
        }
    }, 
    [42] = {
        [1] = "Wallbang", 
        description = "Stand", 
        map = "de_dust2", 
        name = "Lower Tunnels", 
        position = {
            [1] = -216.03515625, 
            [2] = 1160.060791015625, 
            [3] = 89.53584289550781
        }, 
        angle = {
            [1] = 11.780013084411621, 
            [2] = 153.25389099121094
        }
    }, 
    [43] = {
        description = "Stand", 
        map = "de_dust2", 
        name = "Cat", 
        position = {
            [1] = -874.2039794921875, 
            [2] = 1464.575927734375, 
            [3] = -53.34953308105469
        }, 
        angle = {
            [1] = -10.956621170043945, 
            [2] = -24.002500534057617
        }
    }, 
    [44] = {
        description = "Stand", 
        map = "de_inferno", 
        name = "library | risk", 
        position = {
            [1] = 2491.488974609375, 
            [2] = 1232.55009765625, 
            [3] = 215.03000000000625
        }, 
        angle = {
            [1] = 12.100088271331787, 
            [2] = -170.5400896270752
        }
    }, 
    [45] = {
        description = "Crouch", 
        map = "de_inferno", 
        name = "barrels | risk", 
        position = {
            [1] = 2477.968974609375, 
            [2] = -130.53009765625, 
            [3] = 135.65000000000626
        }, 
        angle = {
            [1] = 2.090088271331787, 
            [2] = 168.6500896270752
        }
    }, 
    [46] = {
        description = "Fake duck", 
        map = "de_inferno", 
        name = "box", 
        position = {
            [1] = 1999.968974609375, 
            [2] = 480.60009765625, 
            [3] = 206.65000000000626
        }, 
        angle = {
            [1] = -10.090088271331787, 
            [2] = -100.65008962707519
        }
    }, 
    [47] = {
        description = "Fake duck", 
        map = "de_inferno", 
        name = "box2", 
        position = {
            [1] = 2013.97, 
            [2] = 701.99, 
            [3] = 210.61
        }, 
        angle = {
            [1] = -0.28, 
            [2] = 1.18
        }
    }, 
    [48] = {
        description = "Fake duck", 
        map = "de_inferno", 
        name = "BigBox", 
        position = {
            [1] = 2083.79, 
            [2] = 182.85, 
            [3] = 210.18
        }, 
        angle = {
            [1] = 0.21, 
            [2] = 76.14
        }
    }, 
    [49] = {
        description = "Fake duck+min dmg ", 
        map = "de_inferno", 
        name = "Barrels2 | risk", 
        position = {
            [1] = 63.91, 
            [2] = 2603.67, 
            [3] = 206.03
        }, 
        angle = {
            [1] = 2.33, 
            [2] = 4.84
        }
    }, 
    [50] = {
        description = "Fake duck+min dmg ", 
        map = "de_inferno", 
        name = "Docs", 
        position = {
            [1] = 753.09, 
            [2] = 1871.93, 
            [3] = 177.94
        }, 
        angle = {
            [1] = -2.13, 
            [2] = 174.72
        }
    }, 
    [51] = {
        description = "Fake duck", 
        map = "de_inferno", 
        name = "Window", 
        position = {
            [1] = -5.32, 
            [2] = 383.99, 
            [3] = 230.03
        }, 
        angle = {
            [1] = 3.58, 
            [2] = 79.43
        }
    }, 
    [52] = {
        [1] = "Fake duck+min dmg (AWP)", 
        name = "BigBox2", 
        map = "de_inferno", 
        position = {
            [1] = 2148.63, 
            [2] = 301.6, 
            [3] = 206.03
        }, 
        angle = {
            [1] = -13.03, 
            [2] = -110.59
        }
    }, 
    [53] = {
        description = "Fake duck", 
        map = "de_inferno", 
        name = "Fakeduck", 
        position = {
            [1] = 2495.96875, 
            [2] = 262.423798, 
            [3] = 210.663162
        }, 
        angle = {
            [1] = 3.849996, 
            [2] = 176.455307
        }
    }, 
    [54] = {
        description = "Fake duck", 
        map = "de_inferno", 
        name = "Fakeduck", 
        position = {
            [1] = 2080.958008, 
            [2] = -220.847656, 
            [3] = 126.535568
        }, 
        angle = {
            [1] = -2.147031, 
            [2] = 79.263046
        }
    }, 
    [55] = {
        description = "Stand", 
        map = "de_overpass", 
        name = "Barrels", 
        position = {
            [1] = -806.963745, 
            [2] = 392.496246, 
            [3] = 160.03125
        }, 
        angle = {
            [1] = 4.701077, 
            [2] = -69.066948
        }
    }, 
    [56] = {
        description = "Fake duck", 
        map = "de_overpass", 
        name = "Water", 
        position = {
            [1] = -1169.75, 
            [2] = 256, 
            [3] = 76.78
        }, 
        angle = {
            [1] = 0.97, 
            [2] = -78.36
        }
    }, 
    [57] = {
        description = "Stand", 
        map = "de_overpass", 
        name = "Window", 
        position = {
            [1] = -1674.027466, 
            [2] = 456.827881, 
            [3] = 360.03125
        }, 
        angle = {
            [1] = 4.535279, 
            [2] = -53.20763
        }
    }, 
    [58] = {
        description = "Stand", 
        map = "de_overpass", 
        name = "Heaven | risk", 
        position = {
            [1] = -416.027924, 
            [2] = -2427.723633, 
            [3] = 248.001068
        }, 
        angle = {
            [1] = -0.163388271331787, 
            [2] = 113.53928962707519
        }
    }, 
    [59] = {
        description = "Fake duck", 
        map = "de_overpass", 
        name = "Stairs", 
        position = {
            [1] = -623.588989, 
            [2] = -1152.03418, 
            [3] = 135.189392
        }, 
        angle = {
            [1] = -0.34, 
            [2] = 114.22
        }
    }, 
    [60] = {
        [1] = "Shooting", 
        description = "Stand | unsafe ", 
        map = "de_overpass", 
        name = "Wooden", 
        position = {
            [1] = -1056.056641, 
            [2] = -289.614227, 
            [3] = 162.03125
        }, 
        angle = {
            [1] = -0.14, 
            [2] = -63.299999
        }
    }, 
    [61] = {
        description = "Fake duck", 
        map = "de_overpass", 
        name = "Cement", 
        position = {
            [1] = -1167.162109, 
            [2] = 168.910522, 
            [3] = 162.03125
        }, 
        angle = {
            [1] = -16.612616, 
            [2] = 151.762833
        }
    }, 
    [62] = {
        description = "Min dmg | risk (Scar) ", 
        map = "de_cbble", 
        name = "Outside", 
        position = {
            [1] = 73.81, 
            [2] = -1292.57, 
            [3] = -70.09
        }, 
        angle = {
            [1] = -5.55, 
            [2] = 77.47
        }
    }, 
    [63] = {
        description = "Min dmg", 
        map = "de_cbble", 
        name = "Stairs", 
        position = {
            [1] = 668.03, 
            [2] = -466.79, 
            [3] = -0.86
        }, 
        angle = {
            [1] = -0.15, 
            [2] = 147.68
        }
    }, 
    [64] = {
        description = "Min dmg", 
        map = "de_cbble", 
        name = "Fakeduck", 
        position = {
            [1] = -443.9552, 
            [2] = -775.729736, 
            [3] = -51.767044
        }, 
        angle = {
            [1] = -6.425131, 
            [2] = 34.361931
        }
    }, 
    [65] = {
        description = "Min dmg", 
        map = "de_cbble", 
        name = "Fakeduck", 
        position = {
            [1] = 585.081177, 
            [2] = -233.838181, 
            [3] = 46.03125
        }, 
        angle = {
            [1] = 1.549892, 
            [2] = -157.202545
        }
    }, 
    [66] = {
        description = "Fake duck", 
        map = "de_shortdust", 
        name = "Car", 
        position = {
            [1] = 70.52, 
            [2] = 494.88, 
            [3] = 46.3
        }, 
        angle = {
            [1] = -0.37, 
            [2] = 98.23
        }
    }, 
    [67] = {
        description = "Fake Duck | risk", 
        map = "de_vertigo", 
        name = "3D", 
        position = {
            [1] = -2107.3, 
            [2] = 954.03, 
            [3] = 11790.03
        }, 
        angle = {
            [1] = 5.45, 
            [2] = -110.75
        }
    }, 
    [68] = {
        description = "Fake duck", 
        map = "de_vertigo", 
        name = "Barrels", 
        position = {
            [1] = -1435.92, 
            [2] = 660.21, 
            [3] = 11921.28
        }, 
        angle = {
            [1] = 5.45, 
            [2] = -110.75
        }
    }, 
    [69] = {
        description = "Stand | risk", 
        map = "de_vertigo", 
        name = "3D", 
        position = {
            [1] = -2113.13, 
            [2] = 879.35, 
            [3] = 11893.03
        }, 
        angle = {
            [1] = 2.03, 
            [2] = -67.31
        }
    }, 
    [70] = {
        description = "Min dmg | Autopeek", 
        map = "de_vertigo", 
        name = "Vents (Electronic)", 
        position = {
            [1] = -1900.03, 
            [2] = 684.36, 
            [3] = 11840.03
        }, 
        angle = {
            [1] = -10.17, 
            [2] = -19.12
        }
    }, 
    [71] = {
        description = "Fake duck", 
        map = "de_vertigo", 
        name = "2D", 
        position = {
            [1] = -2342.9, 
            [2] = 741.01, 
            [3] = 11843.03
        }, 
        angle = {
            [1] = 5.04, 
            [2] = -95.87
        }
    }, 
    [72] = {
        description = "Fake duck", 
        map = "de_stmarc", 
        name = "Bomb site", 
        position = {
            [1] = -7918.297363, 
            [2] = 6919.025879, 
            [3] = 98.03125
        }, 
        angle = {
            [1] = 0.161362, 
            [2] = 0.903998
        }
    }, 
    [73] = {
        description = "Fake duck", 
        map = "de_stmarc", 
        name = "CT-Start", 
        position = {
            [1] = -6840.3720703125, 
            [2] = 6924.4267578125, 
            [3] = 136.4663543701172
        }, 
        angle = {
            [1] = 1.393323, 
            [2] = -179.350723
        }
    }, 
    [74] = {
        description = "Fake duck", 
        map = "de_stmarc", 
        name = "Wallbang", 
        position = {
            [1] = -7536.03125, 
            [2] = 7608.307129, 
            [3] = 96.03125
        }, 
        angle = {
            [1] = -0.48401, 
            [2] = -36.291946
        }
    }, 
    [75] = {
        description = "Fake duck", 
        map = "de_stmarc", 
        name = "CT-Start", 
        position = {
            [1] = -6117.963379, 
            [2] = 6421.532715, 
            [3] = 221.126678
        }, 
        angle = {
            [1] = 3.212008, 
            [2] = 164.714813
        }
    }, 
    [76] = {
        description = "Fake duck", 
        map = "de_lake", 
        name = "Garage", 
        position = {
            [1] = 4917.955566, 
            [2] = -3268.020508, 
            [3] = -98.08493
        }, 
        angle = {
            [1] = -0.696654, 
            [2] = 177.950745
        }
    }, 
    [77] = {
        description = "Fake duck", 
        map = "de_lake", 
        name = "T-Spawn", 
        position = {
            [1] = 2650.328125, 
            [2] = -3725.591553, 
            [3] = -46.599533
        }, 
        angle = {
            [1] = 2.405347, 
            [2] = 5.010656
        }
    }, 
    [78] = {
        description = "Fake duck", 
        map = "de_lake", 
        name = "Bomb-site", 
        position = {
            [1] = 1652.807129, 
            [2] = -4422.253418, 
            [3] = -143.955399
        }, 
        angle = {
            [1] = -3.593326, 
            [2] = 10.921947
        }
    }, 
    [79] = {
        description = "Fake duck", 
        map = "cs_italy", 
        name = "Tunnel", 
        position = {
            [1] = 144.0148468017578, 
            [2] = 348.98297119140625, 
            [3] = -88.96875
        }, 
        angle = {
            [1] = 0.1613140106201172, 
            [2] = -55.74931716918945
        }
    }, 
    [80] = {
        description = "Fake duck", 
        map = "cs_italy", 
        name = "Right Alley", 
        position = {
            [1] = -431.9709167480469, 
            [2] = -112.07582092285156, 
            [3] = -88.96875
        }, 
        angle = {
            [1] = 2.903980255126953, 
            [2] = -52.03858947753906
        }
    }, 
    [81] = {
        description = "Fake duck", 
        map = "cs_italy", 
        name = "Long Hall", 
        position = {
            [1] = 18.86300277709961, 
            [2] = 2416.03125, 
            [3] = 20.98790740966797
        }, 
        angle = {
            [1] = -0.806647777557373, 
            [2] = -40.530582427978516
        }
    }, 
    [82] = {
        description = "Fake duck", 
        map = "de_nuke", 
        name = "Outside", 
        position = {
            [1] = 3.446795701980591, 
            [2] = -1662.1339111328125, 
            [3] = 43.0312614440918
        }, 
        angle = {
            [1] = 15.810659408569336, 
            [2] = 1.4775171279907227
        }
    }, 
    [83] = {
        description = "Fake duck", 
        map = "de_nuke", 
        name = "Ramp", 
        position = {
            [1] = 1356.9029541015625, 
            [2] = -742.7432861328125, 
            [3] = -602.7978515625
        }, 
        angle = {
            [1] = -0.9680168628692627, 
            [2] = 144.7721710205078
        }
    }, 
    [84] = {
        description = "Fake duck", 
        map = "de_nuke", 
        name = "Outside", 
        position = {
            [1] = 1413.1536865234375, 
            [2] = -2430.9287109375, 
            [3] = -417.742919921875
        }, 
        angle = {
            [1] = -1.129349708557129, 
            [2] = 171.13609313964844
        }
    }, 
    [85] = {
        description = "Fake duck", 
        map = "de_train", 
        name = "T Spawn", 
        position = {
            [1] = 1288.0654296875, 
            [2] = 1706.8900146484375, 
            [3] = -159.4558868408203
        }, 
        angle = {
            [1] = 0.16135096549987793, 
            [2] = -173.07870483398438
        }
    }, 
    [86] = {
        description = "Fake duck", 
        map = "de_train", 
        name = "T Main", 
        position = {
            [1] = -262.8990478515625, 
            [2] = 487.631591796875, 
            [3] = 35.01689910888672
        }, 
        angle = {
            [1] = 20.65067481994629, 
            [2] = 172.34555053710938
        }
    }, 
    [87] = {
        description = "Fake duck", 
        map = "de_train", 
        name = "Ivy Tunnel", 
        position = {
            [1] = 653.9949951171875, 
            [2] = 493.5329284667969, 
            [3] = 34.03125190734863
        }, 
        angle = {
            [1] = 15.48801040649414, 
            [2] = 2.9309511184692383
        }
    }, 
    [88] = {
        description = "Fake duck", 
        map = "de_train", 
        name = "Bombsite", 
        position = {
            [1] = 806.224609375, 
            [2] = -463.09716796875, 
            [3] = 103.03125
        }, 
        angle = {
            [1] = 15.165338516235352, 
            [2] = 118.57878112792969
        }
    }, 
    [89] = {
        description = "Fake duck", 
        map = "de_train", 
        name = "Tunnel Two", 
        position = {
            [1] = 1969.5577392578125, 
            [2] = -779.9430541992188, 
            [3] = -214.94512939453125
        }, 
        angle = {
            [1] = -2.2586476802825928, 
            [2] = 96.63731384277344
        }
    }, 
    [90] = {
        description = "Fake duck", 
        map = "de_anubis", 
        name = "CT Side", 
        position = {
            [1] = -582.8221435546875, 
            [2] = 2328.042236328125, 
            [3] = 31.949859619140625
        }, 
        angle = {
            [1] = -2.097200870513916, 
            [2] = -91.29068756103516
        }
    }, 
    [91] = {
        description = "Fake duck", 
        map = "de_anubis", 
        name = "Middle", 
        position = {
            [1] = 374.30450439453125, 
            [2] = 1477.012451171875, 
            [3] = 57.668325424194336
        }, 
        angle = {
            [1] = 1.9360682964324951, 
            [2] = -99.35801696777344
        }
    }, 
    [92] = {
        description = "Stand", 
        map = "cs_office", 
        name = "Back Way", 
        position = {
            [1] = 784.108521, 
            [2] = -572.548218, 
            [3] = -95.96875
        }, 
        angle = {
            [1] = 0.384951, 
            [2] = -38.210506
        }
    }, 
    [93] = {
        description = "Fake duck", 
        map = "cs_office", 
        name = "Main Hall", 
        position = {
            [1] = 1138.356567, 
            [2] = 288.285889, 
            [3] = -113.96875
        }, 
        angle = {
            [1] = -0.935009, 
            [2] = -105.88517
        }
    }, 
    [94] = {
        description = "Stand", 
        map = "cs_office", 
        name = "T Start", 
        position = {
            [1] = 1398.548584, 
            [2] = 386.956451, 
            [3] = -95.96875
        }, 
        angle = {
            [1] = 0.660015, 
            [2] = -131.760223
        }
    }, 
    [95] = {
        description = "Fake duck", 
        map = "cs_office", 
        name = "Main Hall", 
        position = {
            [1] = -863.953979, 
            [2] = -445.684265, 
            [3] = -192.2648
        }, 
        angle = {
            [1] = 2.392247, 
            [2] = -0.454077
        }
    }, 
    [96] = {
        description = "Manual Right+Hide Shots", 
        map = "cs_office", 
        name = "Main Hall", 
        position = {
            [1] = -1520.450317, 
            [2] = -694.307007, 
            [3] = -175.96875
        }, 
        angle = {
            [1] = -2.694817, 
            [2] = 5.766976
        }
    }, 
    [97] = {
        description = "Fake duck", 
        map = "cs_office", 
        name = "Main Hall+Back Way", 
        position = {
            [1] = 1049.272705, 
            [2] = -1288.350098, 
            [3] = -175.697723
        }, 
        angle = {
            [1] = -1.704685, 
            [2] = 93.352333
        }
    }
};
local v32 = {};
local v33 = {
    [1202739637] = "cs_insertion2", 
    [1014664118] = "cs_office", 
    [-923663825] = "dz_frostbite", 
    [1463756432] = "cs_assault", 
    [-1621571143] = "de_dust", 
    [371013699] = "de_stmarc", 
    [-1890957714] = "ar_shoots", 
    [-2011174878] = "de_train", 
    [-222265935] = "ar_baggage", 
    [405708653] = "de_overpass", 
    [790893427] = "dz_sirocco", 
    [-542128589] = "ar_monastery", 
    [878725495] = "de_bank", 
    [-1218081885] = "de_guard", 
    [1900771637] = "de_cache", 
    [2056138930] = "gd_rialto", 
    [1507960924] = "cs_agency", 
    [2041417734] = "de_cbble", 
    [-450700380] = "de_ravine", 
    [1445192006] = "de_engage", 
    [1476824995] = "de_vertigo", 
    [-768791216] = "de_dust2", 
    [899765791] = "de_safehouse", 
    [1364328969] = "cs_militia", 
    [-182586077] = "de_aztec", 
    [-1411074561] = "de_tulip", 
    [-1752602089] = "de_inferno", 
    [2019001288] = "de_basalt", 
    [1722587796] = "de_dust2_old", 
    [792319475] = "de_ancient", 
    [1563115098] = "de_nuke", 
    [-1768287648] = "dz_blacksite", 
    [-1541779215] = "de_sugarcane", 
    [1238495690] = "ar_dizzy", 
    [959481521] = "de_extraction", 
    [1850283081] = "de_anubis", 
    [-1348292803] = "cs_apollo", 
    [549370830] = "de_lake", 
    [-1439577949] = "de_canals", 
    [1964982021] = "de_elysion", 
    [-1639993233] = "de_mirage", 
    [-692592072] = "cs_italy"
};
local function v42(v34, v35)
    if not v35 then
        v35 = {};
    end;
    local v36 = nil;
    local v37 = nil;
    local v38 = nil;
    if not v35[1] then
        for v39 = 1, 256 do
            v37 = v39 - 1;
            for _ = 1, 8 do
                v38 = -bit.band(v37, 1);
                v37 = bit.bxor(bit.rshift(v37, 1), bit.band(3988292384, v38));
            end;
            v35[v39] = v37;
        end;
    end;
    v37 = 4294967295;
    for v41 = 1, #v34 do
        v36 = string.byte(v34, v41);
        v37 = bit.bxor(bit.rshift(v37, 8), v35[bit.band(bit.bxor(v37, v36), 255) + 1]);
    end;
    return bit.band(bit.bnot(v37), 4294967295);
end;
local function v47()
    -- upvalues: v42 (ref)
    if not globals.is_in_game or not globals.is_connected then
        return;
    else
        local v43 = entity.get(0);
        if v43 == nil then
            return;
        else
            local l_m_WorldMins_0 = v43.m_WorldMins;
            local l_m_WorldMaxs_0 = v43.m_WorldMaxs;
            local v46 = nil;
            if l_m_WorldMins_0 ~= vector(0, 0, 0) or l_m_WorldMaxs_0 ~= vector(0, 0, 0) then
                v46 = string.format("bomb_%.2f_%.2f_%.2f %.2f_%.2f_%.2f", l_m_WorldMins_0.x, l_m_WorldMins_0.y, l_m_WorldMins_0.z, l_m_WorldMaxs_0.x, l_m_WorldMaxs_0.y, l_m_WorldMaxs_0.z);
            end;
            if v46 ~= nil then
                return v42(v46);
            else
                return nil;
            end;
        end;
    end;
end;
local v48 = {
    de_shortnuke = "de_nuke"
};
local v49 = {};
local function v55()
    -- upvalues: v49 (ref), v48 (ref), v33 (ref), v47 (ref)
    if not globals.is_in_game or not globals.is_connected then
        return;
    else
        local l_shortname_0 = common.get_map_data().shortname;
        if l_shortname_0 == nil then
            return;
        else
            if v49[l_shortname_0] == nil then
                if v48[l_shortname_0] ~= nil then
                    l_shortname_0 = v48[l_shortname_0];
                else
                    local v51 = false;
                    for _, v53 in pairs(v33) do
                        if v53 == l_shortname_0 then
                            v51 = true;
                            break;
                        end;
                    end;
                    if not v51 then
                        local v54 = v47();
                        if v33[v54] ~= nil then
                            l_shortname_0 = v33[v54];
                        end;
                    end;
                end;
                v49[l_shortname_0] = l_shortname_0;
            end;
            return v49[l_shortname_0];
        end;
    end;
end;
local v56 = render.load_image("<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"600\" height=\"600\"> <g transform=\"translate(0.000000,512.000000) scale(0.100000,-0.100000)\" fill=\"#000000\" stroke=\"none\"> <path style=\"fill:#ffffff; stroke:none;\" d=\"M1500 4801 c-575 -174 -1053 -320 -1063 -324 -18 -7 -18 -42 -14 -904 4 -979 3 -953 66 -1213 119 -490 420 -1000 856 -1448 331 -341 676 -607 1098 -846 l117 -66 118 66 c1004 570 1746 1442 1953 2294 63 260 62 234 66 1209 3 491 1 897 -4 901 -8 9 -2127 651 -2140 649 -5 -1 -478 -144 -1053 -318z m1060 -2227 l0 -2206 -37 23 c-341 207 -558 370 -832 627 -438 411 -768 933 -886 1402 -54 216 -55 238 -55 1057 l0 760 893 270 c490 149 898 271 905 272 9 1 12 -446 12 -2205z\"/> </g> </svg>", vector(25, 25));
local function v60(v57, v58, v59)
    return v57 + (v58 - v57) * v59;
end;
local v61 = true;
local function v95()
    -- upvalues: v14 (ref), l_weapons_0 (ref), v32 (ref), v31 (ref), v55 (ref), v22 (ref), v61 (ref), v56 (ref), v19 (ref), v18 (ref), v60 (ref), v25 (ref), v20 (ref), v17 (ref), v21 (ref), v26 (ref), v23 (ref)
    if not v14:get() or not globals.is_in_game or not globals.is_connected then
        return;
    else
        local v62 = entity.get_local_player();
        if v62 == nil or not v62:is_alive() then
            return;
        else
            local v63 = v62:get_player_weapon();
            local v64 = l_weapons_0(v63);
            if v63 == nil or v64.type == "knife" or v64.type == "grenade" then
                return;
            else
                if #v32 == 0 then
                    for v65 = 1, #v31 do
                        local v66 = v31[v65];
                        if v55() == v66.map then
                            v32[#v32 + 1] = v66;
                        end;
                    end;
                else
                    for v67 = 1, #v32 do
                        local v68 = v32[v67];
                        if v55() ~= v68.map then
                            v32 = {};
                            return;
                        else
                            local v69 = v62:get_eye_position();
                            local _ = vector(v69.x, v69.y, v69.z):dist2d(vector(v68.position[1], v68.position[2], v68.position[3]));
                            local v71 = utils.trace_line(vector(v69.x, v69.y, v69.z), vector(v68.position[1], v68.position[2], v68.position[3]), v62, 33570827);
                            if v22:get() then
                                v61 = v71.fraction > 0.96;
                            else
                                v61 = true;
                            end;
                            if v61 then
                                if v68.alpha == nil then
                                    v68.alpha = 0;
                                end;
                                if v68.alpha_text == nil then
                                    v68.alpha_text = 0;
                                end;
                                if v68.alpha_bc == nil then
                                    v68.alpha_bc = 0;
                                end;
                                local v72 = v62:get_origin();
                                local v73 = vector(v72.x, v72.y, v72.z):dist2d(vector(v68.position[1], v68.position[2], v68.position[3]));
                                if v73 > 67 then
                                    local v74 = vector(v68.position[1], v68.position[2], v68.position[3] - 40):to_screen();
                                    if v74 ~= nil then
                                        local l_width_0 = v56.width;
                                        local l_height_0 = v56.height;
                                        local v77 = v19:get();
                                        local v78 = v18:get();
                                        if v68.alpha > 0 then
                                            v68.alpha = v60(v68.alpha, 0, globals.frametime * 6);
                                        end;
                                        if v68.alpha_bc > 0 then
                                            v68.alpha_bc = v60(v68.alpha_bc, 0, globals.frametime * 6);
                                        end;
                                        if v68.alpha_text < 255 then
                                            v68.alpha_text = v60(v68.alpha_text, 255, globals.frametime * 6);
                                        end;
                                        render.rect(vector(v74.x - 3, v74.y), vector(v74.x + l_width_0 - 1, v74.y + l_height_0 + 1), color(v78.r, v78.g, v78.b, v68.alpha_text));
                                        render.texture(v56, vector(v74.x, v74.y + 2), vector(v56.width, v56.height), color(v77.r, v77.g, v77.b, v68.alpha_text));
                                    end;
                                else
                                    local v79 = vector(v68.position[1], v68.position[2], v68.position[3] - 40):to_screen();
                                    local v80 = nil;
                                    local v81 = v25:get();
                                    local v82 = v20:get();
                                    local v83 = v17:get();
                                    local v84 = v18:get();
                                    local v85 = v21:get();
                                    local v86, v87 = v26:get();
                                    if v68.alpha < 255 then
                                        v68.alpha = v60(v68.alpha, 255, globals.frametime * 6);
                                    end;
                                    if v68.alpha_bc < 255 then
                                        v68.alpha_bc = v60(v68.alpha_bc, v84.a, globals.frametime * 6);
                                    end;
                                    if v68.alpha_text > 0 then
                                        v68.alpha_text = v60(v68.alpha_text, 0, globals.frametime * 6);
                                    end;
                                    if v79 ~= nil then
                                        v80 = render.measure_text(1, nil, v68.name);
                                        v87 = v19:get();
                                        render.rect(vector(v79.x - v80.x / 2 - 4, v79.y - 5), vector(v79.x + v80.x / 2 + 4 + v56.width, v79.y + v80.y + 7), color(v84.r, v84.g, v84.b, v68.alpha));
                                        render.texture(v56, vector(v79.x - v80.x / 2, v79.y - 2), vector(v56.width - 5, v56.height - 5), color(v87.r, v87.g, v87.b, v68.alpha));
                                        render.rect(vector(v79.x - v80.x / 2 + (v56.width + 5) / 2 + 5, v79.y - 2), vector(v79.x - v80.x / 2 + (v56.width + 5) / 2 + 6, v79.y + v80.y + 4), color(v85.r, v85.g, v85.b, v68.alpha));
                                        render.text(1, vector(v79.x - v80.x / 2 + v56.width, v79.y + 1), color(v83.r, v83.g, v83.b, v68.alpha), nil, v68.name);
                                    end;
                                    local v88 = render.screen_size();
                                    local v89 = vector():angles(v68.angle[1], v68.angle[2], 0);
                                    if v89 ~= nil and v73 <= 40 then
                                        local l_position_0 = v68.position;
                                        local v91 = vector(l_position_0[1] + v89.x * 70, l_position_0[2] + v89.y * 70, l_position_0[3] + v89.z * 70):to_screen();
                                        if v91 ~= nil then
                                            local v92 = render.measure_text(2, nil, v68.description:upper());
                                            local v93 = render.measure_text(1, nil, v68.name);
                                            local v94 = v93.x > v92.x and v93 or v92;
                                            render.rect(vector(v91.x - 10, v91.y - v94.y - 5), vector(v91.x + v94.x + 16, v91.y + 15), color(v84.r, v84.g, v84.b, v68.alpha_bc));
                                            if v23:get("Description line") then
                                                render.rect(vector(v91.x - 10, v91.y - v94.y - 6), vector(v91.x + v94.x + 16, v91.y - v94.y - 5), color(v86.r, v86.g, v86.b, v68.alpha));
                                            end;
                                            render.rect_outline(vector(v91.x - 10, v91.y - v94.y - 5), vector(v91.x + v94.x + 16, v91.y + 15), color(v84.r, v84.g, v84.b, v68.alpha_bc / 1.8));
                                            render.circle(vector(v91.x - 1, v91.y - 1), color(v82.r, v82.g, v82.b, v68.alpha), v93.y / 2 - 1, 0, 1);
                                            render.circle_outline(vector(v91.x - 1, v91.y - 1), color(0, 0, 0, 122), v93.y / 2, 0, 1);
                                            render.rect(vector(v91.x + 6, v91.y - v93.y - 1), vector(v91.x + 7, v91.y + 11), color(v85.r, v85.g, v85.b, v68.alpha));
                                            if v23:get("Aim-Line") then
                                                render.line(vector(v88.x / 2, v88.y / 2), vector(v91.x - 1, v91.y - 1), color(v81.r, v81.g, v81.b, v68.alpha));
                                            end;
                                            render.text(1, vector(v91.x + 10, v91.y - 12), color(v83.r, v83.g, v83.b, v68.alpha), nil, v68.name);
                                            render.text(2, vector(v91.x + 10, v91.y - 12 + v93.y), color(v83.r, v83.g, v83.b, v68.alpha), nil, v68.description:upper());
                                        end;
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
                return;
            end;
        end;
    end;
end;
local function v99(v96, v97, v98)
    if v98 < v96 then
        v96 = v98;
    elseif v96 < v97 then
        v96 = v97;
    end;
    return v96;
end;
local v100 = false;
local function v121(v101)
    -- upvalues: v14 (ref), v15 (ref), v100 (ref), v32 (ref), v55 (ref), v16 (ref), v99 (ref)
    if not v14:get() or not v15:get() or not globals.is_in_game or not globals.is_connected then
        v100 = false;
        return;
    else
        local v102 = entity.get_local_player();
        if v102 == nil or not v102:is_alive() then
            return;
        elseif v102:get_player_weapon() == nil or #v32 == 0 or #v32 == nil then
            return;
        else
            for v103 = 1, #v32 do
                local v104 = v32[v103];
                if v55() ~= v104.map then
                    v32 = {};
                    for v105 = 1, #locations do
                        local v106 = locations[v105];
                        if v55() == v106.map then
                            v32[#v32 + 1] = v106;
                        end;
                    end;
                end;
                local v107 = v102:get_eye_position();
                local v108 = vector(v107.x, v107.y, v107.z);
                do
                    local l_v108_0 = v108;
                    if l_v108_0:dist(vector(v104.position[1], v104.position[2], v104.position[3])) < v16:get() then
                        if not v100 then
                            table.sort(v32, function(v110, v111)
                                -- upvalues: l_v108_0 (ref)
                                return l_v108_0:dist(vector(v110.position[1], v110.position[2], v110.position[3])) < l_v108_0:dist(vector(v111.position[1], v111.position[2], v111.position[3]));
                            end);
                            v100 = true;
                        else
                            local v112 = v32[1];
                            local v113 = v102:get_eye_position();
                            local v114 = vector(v113.x, v113.y, v113.z):dist(vector(v112.position[1], v112.position[2], v112.position[3]));
                            local v115 = bit.band(v102.m_fFlags, 1) == 1;
                            if v114 > 0.1 and v114 < v16:get() and v115 then
                                local v116 = render.camera_angles();
                                local v117 = vector(v112.position[1], v112.position[2], v112.position[3]) - v113;
                                local v118 = #v117;
                                local v119 = v117:angles();
                                v119.y = v116.y - v119.y;
                                local v120 = vector():angles(v119);
                                v101.forwardmove = v120.x * (450 * math.exp(v99(v118, 0, 5) - 5) + 1);
                                v101.sidemove = v120.y * (450 * math.exp(v99(v118, 0, 5) - 5) + 1);
                            else
                                v100 = false;
                            end;
                        end;
                    end;
                end;
            end;
            return;
        end;
    end;
end;
local function v122()
    -- upvalues: v15 (ref), v14 (ref), v16 (ref)
    v15:visibility(v14:get());
    v16:visibility(v14:get());
end;
v122();
v14:set_callback(v122);
events.render:set(v95);
events.createmove:set(v121);