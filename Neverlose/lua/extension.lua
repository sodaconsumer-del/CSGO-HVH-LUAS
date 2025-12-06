local v0 = db.escape_from_samara_extension or {
    configs = {}, 
    drag_memory = {}, 
    viewmodel = {}
};
if v0.viewmodel == nil then
    v0.viewmodel = {};
end;
local v1 = _NAME:find("Trial") ~= nil;
if v1 and not v0.trial_cache_1 then
    v0.trial_cache_1 = common.get_unixtime() + 86401;
end;
events.shutdown:set(function()
    -- upvalues: v0 (ref)
    db.escape_from_samara_extension = v0;
end);
cvar.clear:call();
local function v9(...)
    local v2 = {
        ...
    };
    local v3 = {};
    for v4 = -#v2, -1 do
        local v5 = v2[-v4];
        if type(v5) == "table" then
            local l_v5_0 = v5;
            temp_array = {};
            for v7, v8 in pairs(l_v5_0) do
                table.insert(temp_array, v7 .. " = " .. tostring(v8));
            end;
            v5 = "\n{" .. table.concat(temp_array, ", \n") .. "}\n";
        end;
        table.insert(v3, 1, tostring(v5));
    end;
    print_raw(table.concat(v3, ", "));
end;
files.create_folder("csgo\\materials\\panorama\\images\\icons\\extension");
files.write("csgo/materials/panorama/images/icons/extension/shared_icon.png", "\137PNG\r\n\026\n\000\000\000\rIHDR\000\000\000\128\000\000\000\128\b\006\000\000\000\195>a\203\000\000\000\tpHYs\000\000\v\019\000\000\v\019\001\000\154\156\024\000\000\026\253IDATx\156\237}}\172]Wu\231o\173\181\207\179c\199(\173<!\180Uc\181\241@\019FmE\203GJ\220\150\bD\203G\160L5\130\137\t4\161\001\218\164!-\t\161!Q\002\165\t\161\225\195I\147\fa\218\144\168\149:\211a\194\199LU\228\130\fB$-\154\169D\140S\027\213\022\145 Q\212\166\196\207\196\239\236\181V\255\216{\159{\238}\247\249\158s\223G\158\253\238Oz\186\247\158\183\239=\251\236\245[\223\251\222C\238\142\0256.\248\217\158\192\f\207.f\004\216\224\152\017`\131cF\128\r\142\025\00168f\004\216\224\152\017`\131cF\128\r\142\025\00168f\004\216\224\152\017`\131#\244}\1955\239\190\023f\nw\135\153B\221\225nPS\168)\204\020f\006\213\bwC\204\175\211q\221jf?\233\238?\019M_\000\248\217\166v\166\186\254(\185\159a\240\173f\030\000?\205\221O\a@\238\238\134\212\175\1601}\139g\187\151AD\139\142y>\198 P\026\224Dt\020\160\0312Sd\208\188\019\253\171\144<\197\194\143\003t \176\236'\162#\204\252}fy\138Y\192\204\b, b\136\00403\152\005\146\255\136\024B\004f\001\017\129\136q\219]\239\2325\255\222\004h\v?\154\193\221\242\243,x\171a\218z\173\017f\250\211f\246\170h\250JS}\145\186\254\136\187\0053'w#u#r\023u#O\132b\000p\a\220\138\128\211\227\168\192\221\173\239%\172(\136x\228u!Dz$&\228C[\136\216\136\bB\236NdB\236\020\201\1529\214\196\158\b!\255\016X\254\134\153\2471\203\001\203\130w7\176\b\196\243\026\184\131Y\224\196\b\000\152\005@\255\181\232M\128\182\240\147\005HZ\175\170P\141P\141Y\248\n\213\184\195\204.\141\022_\0275\158m\166[\204l.\154\210\128H\006\183dE\220\r\234\006\192\145\136\144\132\189\148\005\024\167\252e\236j\129\177X\227G\141@\219\002\164\255S&\006\177\016\131\210\159\016\019\152\025\148\1818\176\156\206\198\255!\178\188\"H\248^\224\2407fz\183Hx\212\216\016\204\224\226\016\t\000\028\f\135\144 \002-\018\244\195T\022\160-\252\164\225\134\024kD\139\208\024\161\166\155\163\197w\168\234\238\168\245\243U\227V3\147L\nD\181\236\030\"\000G4\005\185gw\226 w\024\188\209~\207\164\024Z\228u\214\198^\236\n\168\177\014\196\004\006\1933\017\132\210\243\192\002\128\0168\128\136a\194$\01863\203f\213\184-J\248\241 \213.q{ \176|\2029\0285\f\020\195\221\129\172\248\133\004}\209\251=\141\207\247\162\241\n\213\026\170\138\1685T\227\vj\141\239\209\024_\019\173>KU%Y\133\b\211$\244\018\031h\182&\201\002h\163\245\214\186@\031g\250\215\153\240\027\180HP\bA\160\2309g\002D\"\016\t\"'\205W\170A\196\168UPI\005\022F\224\192f\182\205L\127.h\245\\\v\225g*\241\143;|?\t\0008D\170t\178L\002\029\019\143L\194\020.\160\t\232\178\143\175Q\199\b\181\136\024\235\vk\141\239\137Z_\016c\220\022-\146\197\026Q\021\181\214\173XAa\217rX#t\003\220\161n\003\205/>-[\132\225y\172/\018\140Z\000\0065\132 \f,\129\016\003D`\202\166\159\146\027`\t`\022\152)X\005&\134`\n\179\192&\254c\001\246_\220\253\199+\247\219\001\236-J\146\220\139\002\f\176\247O\234\250[\128,DUE\140I\243[\194\127\127\172\143\159\031M7\199X\163\214\b\1415j\173\aqA\172\161\150\178\006\184#\170\194a0\183l\001\000\140\152\185\182\240\199e\002\235\t\222\"\002\183\180\159\136\000M\001!\021\002\128\017D\000\"\136*\132\025\022\170\134\bf\021\196\029\226F\128?\af\023\002\216bp\204\005\236e%\000u>\027AI{\207w*\002\148\232>ZD\212\186-\252_\1705n\170\181F\172#j]\024r\015Qu\144.jL\218\158\003AC\246\253f\240B\128\150\176m\137,`\189\129Z\001\160\014\014&ME\210v\167\020\01903\162%\171\160\018Rzg\150H!\021\220\r\226\134\202\230\146r\132\185M\000^\006lz\127Dm\000\190\236\004 \166ldM\b`\166P\171\147\255\143\017\170\241\133\181\198\171c}\252\252Z\227\166\133\184\000\141I\2481F\212\177NnBc\178\030Z\231\186\1285\245\003\207\004X\202\002\f\157\127\138Tg-\193\024\159\022\230,``\001@ f\b\v\148\024l\154\242~\169\160&03H\182\000)\000\158\195B\250\200M\000\206\a\240\251D\2448\129\246s \168\213\139\178\145.\152\130\000\214\228\249j\250\156Z\227UQ\235\151G\211\205\181\214\208\024\177\016\143\163\214\136X/ \230\212\176\206\022 Z\132kv\an)\215/\150\000\217\255\143\164\127\000\150$\196z\195\176\192\019\154\212\145(g\004\201\255\1471\"E\b\165\002\015\137\192\204\147\005\200\193\176{\210jw\199\028PH\176\025\204\023\016\209\149D\244{d|\156\149a\180\006i`;\207\143\022\223\1611\190&\198\184-\198\129\217O\194?\142:\022\193'7Pb\128R@RW\184\182\181\191\176\189\020\129\134\181}\181s\252\149\194h\173\128\152\a\218\169\212\212\005\024\004\146$8\178\020\244QHY\150\185!\184\193\189\026|N\182\"u\202\026\1821\248uJ\252-f\189#\026\1314\246\158\235\148Y\128A5\238T\213\183D\171\207\140\022\169\214\129\217\143\245\194\144\240c\204\177B\142\252S\n\153b\137d\238\209\184\129\018\228\141M\255\134\230\177\190\200\208\214x\029=\174\n\202\164\240\150\2497\002`\004e\133\136\192]\160n\b\018\224^-q\141\201\138(\213\020\153\206b\147\183\177\198\207\019\241\017\1615\200\002\1625\197\159\223\141Z\191@U\217b\157\162{\173Q\199$\232\"\252\133\252\191\168Mu\0161W\0015\023\128\028\195\149?\180\210\191Q\1727\193\023\148Y\141\166\131\158\014\230WI@N\004\242\020\020:\017\196\147\207w6\136\132\236\022\029\134a\237'\138P\"(14U\0159r\253\031\003\203\165fz\131\217\154T\002\rf\1863Z\252u\213xZ\169\236\213\217\204\167\168?6\154_\132\031m\224\006\162f\193{\170\003\160\229\231\210\162\229\028\215\150\022\246z\227A\145\241\184i9\151z\1285\131\0191R\019\199\220s\250\152R^i\005\186)\149\172S\156@\132\154S\13315\139\"\152yk\148\248z6\254\140\186\029\234;\239\169\178\0003{E\212x\166\153Q\180l\250s\132_g\237o\167~E\248\170)\253K\130Ou\128R\237#\027\248\254f\225z\251\252\181\202\016\022\155\218\019\0182\251\004\135\131(\145\196\153\146\187#\130\230\202\160\186\195G\148\152\168\006Q\242\251\200E\163\200\002\214\026,\f\177\192Q\227\142\192\225Uf\186&\004xN4\25353\221\148*z\131\202`\201\243c\163\233\177\213(\202\185\191)\144\203\1900k\022n \236\165\205\255\250A\255|\187\152\b/\213:\205\215L\000\152\001r\232H\020\207`D-\229d\006sZ[\150\148MUZA9BDN\139\166\175\020\211\207\0008\218gZ\211\184\128\231\185\217\139rW/\021\131\154\n_\214zK\166\191\213\014\030\018\190\185\001:\136\248\001\027\017\248z\022\254\148pG\146v&\015\017\000N\135\213\000\002H\210\211\242o\205\149D\163\180\206\172\148\234\006\177\006\179\160\214\026A\004f6g\170/\138\162?\001\224@\159iM\211\014\222\017-\158\145Z\186\003\237/\229]3\131k\202\241\2135\187\006M\029\189E\194o\v~\t\161\175kK\208\001CA\161\143<\213\022\017r\182 \1289\193U\001\016\200\025d\fV\133\177 \198\152+\134\197\202\026\216\020\226\250\163s\142s\177\218\004P\183s\221\141\144\vBI\187\147`K\131h\208(\210A{\183\152\253\"|/ftD\192'\187\192G1z=\r!\188\245\160\000I\"A\014\138\2179eJ\170\016\146fM\157\a\165t\151\2084\231\242\238\171\023\244\157^\239\196\209\221\158o\230\\4\188\180\135=[\128\178\169#m\020\201V!w\250`\165\175_\130\181S\\\248\227\176\232\026\219\177O^\163\220\029m\250.^\170\166im\173\212b\220Se5\245P\004\240\179\251N\1677\001L\237,w\ve\a\015\204\146\249\207\229\220D\002\1925]\016\249 \199\031X\251\182\255\207\1757\130\240\v\022]\239\224u\169\001\020\203\t8\\S\176\172e\023\149\166\244\185h~\234\171\184\152\218s\251N\165?\001`g\168\027L=kx\233\232iK\208\165\188[\162{[\028\229\183\023c\163b\209\181\167\181\241\236\"=\175aZ\203deS\1834\183\206m\176\127\"[\2213\250N\161\127\237\208\236\fr\167b\001<\avV\246\243\1815>\147\003^\242|_\172\2533d\f\214fP\019\025\172a\217\023a\240f\189\221\a\0055r'r?\163\239Y\167\176\000~\186\186\1777\157<o\132NyG\143\193\154\t\015\151xG\175yF\132\165\214\160-\244\166S\234\003\151:P4\148\216\128\r~z\223\211\247'\128yh\179q0Id_\132\214V\238\209\235\180\209\0033\000#kaC/\1558\192\134\215\184\137\185\220Z\027k\188wV7\2057\1316\183\003\187\193.\213\193\006\206\198\148\205\132\220\019\173\253\015C\217\018\006A\"\006.t\208\030o\002\198\205}\2078\005\001|\155\193\02590A\214\248q\253|4\211<\197\171|+\137\177\029\208\2428\136\a\210\198\153t\f\000\146L\176\173\239\233\166\168\00387\190\031\217W\181\152\218\222\196\233\024\023\000\2060\025y\205|`U\023\237\138\2061\001\208r\189\222\127[\2404\004\176\2528\228\235G7q6\025\192\248\015\233{\218S\031'\n\006m\216\021\248\208:\015\201\160w;t\154,\000n\139\181\252d\217\181{2c\232\171r#\214\161-\147>X\214\215\195\139OZj\1623\172\028\022\239\142\030\020\221\150\131)\t0\220\193\179%\252\212\f+\143\197k<\161\155:\001\189\tPR\192I)\222\204%,\031\163\223\142^\n]e2\014\211|\161\244\132\1470\156 \248\027\131\203/\219\141\151_p\254JMc,\190\246\213\175\227\158{\239\031:v\206\206\029\184\241\250k;\189\255\a\255\2464~\231\202kz\159\183\207\181}\235[\251q\235G\239X\242\255\163\213\192\149\194\242\t\176\204\201\188\252\130\243q\241[\222\188\236iL\194(\001\014\029<\140\159\255\217\159\197y\231\157\219\233\253?\248\193\191\225\186\235\255\168\243\249\206\217\185\0037\127\240F\156\185}{\167\241\191|\225\171;\127v\131\021 \1942\131\192\019\155\249\193\255\151s\150\213\195\187\175\188\186\243\216\223\186\244\237\189>\251\198\235\175\237,\252\a\254\226/\177o\2237\134\142\r\138?\147\214vy\139;5\001\214\171P\251`\223\190o\224\129\191\248\203Nc\207\220\190\029\127\252\161?\2364\246\156\157;\240\198\139.\2344\246\137'\159\196M\031\186\181\211\216\165\176\028YLS\bZv\234\177\158p\211\135n\197\019O>\217i\236o]\250v\156\179s\199\196q7^\127-\182n\221\210\2333o\191\253\0198t\240p\167\177'\194R)\249$l\248\159\137;t\2400n\191\253\019\157\198\158\185}\251\196\192q\215\174\151v\142i\030z\248a\220z\219\158NcW\v\027\158\000\000p\235m{\240\200#\251;\141}\227E\023\157\208\n\220\240\254\247u\250\156\249\249c\184\230\186\027:\141]M\172!\001\214\183\219x\247\149Wc~\254\216\196q[\183nY\210\n\236\218\245R\\x\225\175t:\223g\031|pQ\2247\192\218\173\213\212i\224ZW\253\014\0319\130\249\163\243S\189\247\177\239>6q\204\190}\223\192g\031|\176\147\249NV\224\214E\190\251O?y{\167\249<\241\228\147\216}\201\187:\141\237\130\229\200b\197\nA\171\141[n\249\232\162\\~\165\177\251\146w\225U\175z\229\196\244\173X\129\182\016/\191lw\231\154\194\r\031\184iY\243\\I\204b\128\017t\021\206h,p\197\239v\211\232\135\030~x\213\137\220\a3\002\140\224\158{\239\199C\015?<q\\;\022\232\170\253\243\243\199p\241\219~{\217s\\I\204\b0\006\215\\wC\167\128\176X\129\183\191}w\167\207\189\2393\015\172H\206\191\146\152\017`\fJ@8\t[\183n\193\221{>\142\151\188\248\197\019\199\030>rd\170\134\210jcF\128%\176\251\146wu\170\016vM\251n\185\229\163\203\156\209\234`F\128\019`\165\162\245\189{\191\178\174\002\1916N\1544\240}\239\251\131\206\1456\000|\254\v_\236\213\190\029\135{\238\189\031\191\249\159\223\212Y\203\199a~\254\024\222y\197U\203\154\199j\226\164!\192\142\179\207\2385\254\255\253\227?\174\200y\223y\197U\248\255\127\255\245\206\205\157Q\236\185\227\206u\023\248\1811s\001\019p\232\224a\220\247\153\a\166z\239#\143\236_\182\021Zm\204\b\208\001\191s\22958|\228H\239\247\221x\243\135Wa6+\139\025\001:\226\238{\238\2375\254\161\135\031\198_\255\175/\172\210lV\0143\002t\196\027\223\240\186^\227_x\222\v;m\030y\1821#@\a\\~\217\238N\197\1586\182n\221\130\a\254\252\191\173\210\140V\0143\002L@\217\221;\r^\242\226\023\227\242\203\186\149\137\159-\1564i\224\222\189_\193\247\030\255^\231\241_\251\234\215W\228\188}v\247\142\195\205\031\188q\221\022\129\128\147\136\000\255\227\127\254\245\154/d\159\253}K\225\204\237\219q\255}w\173\232\006\144\149\196\204\005\156\000]w\248L\194\197oy3v\237z\233\138|\214JcF\128%p\237{\175\232\212\227\255\223\159\251|\167\207[)2\1734f\004\024\131sv\238\192\a\254\240\186\137\227\230\231\143\225\189\239\251\000\246\238\253\202\196\177\231\157w.\174}\239\021+0\187\149\197\140\000cp\219-\031\236T\251\255\236\131\015\226\208\193\195\184\249\195\183t\250\220\171\175\254\189uW\027\152\154\000\227n\162|*\224M\191\241Z\188\225\245\147\139>\243\243\199\154\175t\237\219\247\141NV\224\204\237\219q\219-\031\\\238\020\023a9\178XC\vpr\024\155\143~\164[\243\166h\127AW+\240\134\215\191\014o\250\141\215N\024\181vkurH\005\192\221w\237\129\215OM\253\215\165 s\231'?\210\169\237<\238\v\157]\173\000\000\220t\195\251;\141[\v\1564\004Xm\156\179s\a.y\235\197\157\198\254\247O\255\217\216\030\255;\175\184\170\211f\210\243\206;\023w~\242#}\167\184*\232\255\0191\148\238_s\170\225\238=\031\239\020\248=\241\228\147K\246\248\015\029<\220i3)\000\\\242\214\139W4 \164|7\242\190\152Z\146\211\220\167v\189\226\242\203vw\222\2465i\159\224M\031\186\181\243w\f\239\222\243\241N\231\156\132\229\200bY\170<\238>\185\227\255\191\156\179\172>\1866{\030yd\255\196r\244\161\131\135\177\231\142;;}\222\133\023\254\202\146\177IY\179\201k\187\188\197]\190-_\239\210\157\128\251\239\187\171s\179g\207\029wu\026w\221\245\127\212\249G'\166\2374\002X\145\181_1g\238\205\r\145\167\243E\207\006v\237zi\231\159r\233\187\181\187\207\143N\220\127\223db\181\215\214Wp}\251\255DL\022\244\164I\148\226\196z&\195G\254\248\230\206\187}\187\230\249\005}\127tb\\\179\168\172\221\164BOW\153\140\195\148\237`\026yL\152\166\"\181R}\251I\248\246?\029\028z}\206\206\0298x\232;8x\232;\019\223\251\216w\031;\193\1439,\141\027o\2540\222p\209k:\141}\217K~\017\251\190\250\208\196qe\141y\145\f\166S4\234\251\195B\175\248\213K\231\023\142\031\223\242\195\250\024\234\133\005\028\175\159\193\194\1943x&.@\235\005,\196:\2219\188\174\161\022\225\022\225\249\254\129\233^\129\179\159\141_\018D(\183\016%\"\144\b\136\003\132\003BU\161\146\ns\161\130Ts\216\028\23007\183\025\155\170\205\168\230\230pZ\181\005s\1556\029\251\187/\127zk\159SN\241\251\242\233\254\245\141\137\a\165\155\026\159\004&\255d\199\144K\160t\251\249\242\186-\147>\152\166\016\212\188\135\152\218\199\135\162R\226\019\004\1313\146,\198\t\210=b\030\026GC\235L\237\148p\245o\024ADF\004p\158\020\017\129F>f\212:8g\2116\195dd7\224<F\203\219\130oe[\169:\155d\211\247t\211\164\129O3\210\137\1368\185\172\204\194v\153x,\161g\154?\001m\001\167\155J\003\237ek\1733SZ{bd:\024@O\247=\227\020\004\160g\156\006\026\221\142F\v[\135\005\205\131\227y\220\f\221\209\1725\181\172*J\205e@\136\156\002>\211\247\243\251\251\f\166HD\016bHn@\164\199\228\022\136Jl0\156\151\166\167\195\190l\134\140Q\133\025\1794\201\202\014\214\152[$h\1583\197\190\167\158&\v8*\196FY\232%\248+,lW\172\218\f\029\139\025\tN\028\252\181\214\144\145\020\174\172qYs\202n@\136\141AG\251\158~\154J\224SN\228\212LF\192\196\233\015\139\133^\030\155@\176\229>fhc\1766M\000\1523\000j\t]\202Z\019\131Hr\027\152\225D\014\230\167\250\158\1817\001\132\228)!\006q6\253%\000\004'\243\196iB\f\002K\246\255$\1738`\228\148\027\217\n,\186\246\028\244\229\000\144@-s? \002s*\020\t\1675g\201\196\192\026\016\128\133\031'\"\149\028\2413\v\152\178\176\137 ,\201,I\138N\157\006\022a\248z[/6\026\tFj&CA\030\r\204\127\t\000I\146\187\149\"xb\b3\144\149-\255E\022\254~\223\169L\147\005\028af\0053\002\a\bQb!\r|T\n\016\005\204\220Lz\168\030@2\184\240%\023\229\020\197\162kl[F\002\152Se\149\210\2181\167\181\148,hai\172\172\0165\255c&#\226G\251Ng\138,\128\015\020\205/\236c\tY\208\130\192\210\252O\164\b\159\155X!]\255(\t\198\016\225T!\196\146\215\211\138\137H\210s)\150R\026\203)\146H\192\220z$\006KZg\022)\150\192\133\248\219}\167\215\187\027HD\251\133\228_\002\203V\019F\173i\"\194\140 \002u\006\137 \152\194]\224l\000\028\234\014%I\215\170\n\2476\tl\228\182w\237\251\167\159\002$h0\234\246xp\\\146\214#+\138HR\166F\251e`Q\165!D:\022X<px\138\136\254\185\239\140z\019 \176<\166\"\223d\227\2312\203\\\224\128\200\017\204\001\"\006QE`\131\179\128\221 \018\210].\179\172\213\146\220\221\rd\1651(\000\021\161[Z\144S\173cHmS\015\0202$\030\228\178.I2\251\018\146RIH\002\014U\234\bJ\149\b\016*\004\022\004\014\217\226\242\0021\127\147\153\187\127\127>\1637\001\152\229h`\249Rd\249U\1450'!\"X\128\005\131YD\b\161\185\179\181\195\225\014Hs/\193t:s\002\187&\161\187\003\150\132\222\144\161Y\159\190$X\171\027-\244\245\156\163\005\177\148\022\019\2189}1\237\001\"\146M\191 d2\004I\228\b\197\244\179\128\165\177\004\199\003\203\255e\150\222\165\224)\\\000\131\153\2556H\248m\213\248\159\002\a61\152),T\0167\152\a\152\027\212\003B\209\228\000\168*\136\000W\0059\r\2388N\154W\165uCj\000'jm\1407\0162\238\224\154\224D\158\202\185]\198-\r4\160\244\253\185\004\207Y\184\201\252W\b\"I\235EPI\133J\146\021\b,\168d\014\129\003\152\217\131\132\199\153\249\203\204\210\219lN\227\002`,\135\152\229s\"\225\167\204l[0E\180\128\202-\221\206\220\203\221\197\134\231\195`h\014~\220\029j\nv\135\131\135n?OE\147i\241\245x3f}b\\\213\147F\204\127\147\022\2314\185\228\245\1611\251Y\227C\133\016\178\233\151\000i\145!\b\231c\225\135\129\195\255a\150\127b\238\159\212M\225\002\146\217\t,\1596\t\191n\166?o\022\184\202\183\147\019w\184+\220\171E\139\0165_\188s\182\006\004\192aj\000\165[\159\164\219\162Jc\005FIT\150r\189\221\147x\226\246\237<s/\229]\030dD\204)\232+\169s(\154\158\133\159\004\030P\133*\145 T\224PAD,Hu\128\153\239\020I\241@_L\019\003@\196\224\030\142\004\179?7\182\231\153\248\243\196\141*\155\027+\024\"\130R\170l\025)\200Rn\171\174p5\024'k\193\238@#x\192\205\134T\189}o\156\245j\001\128\197{#\a\194\006\218-]\206E\030\201%\221\144\003\190\198\rd\225W! Ts\b!\160\146\185\228\n8x\224\234\t\017y@$\028\228\\\027\232\139\222\004\016\tp7\024\027D\228S\226\225\133\226\250\230\202\171\231\184;\170\145[\1546\023K1Y\001S\176*\204\020\236\f\207\194on\142l\003W`-\151\230\238\016\172?\205\031\197\184/l4\132\160\178u\171\148us\133\175\212UDr\180\159\204\188HH\214\160JB\175d\014\161\n\b\2015<-!|!p\1847[d\136\244\223\227;\157\v\016A0\131s8^\137\127\210\221\127\130\220/\004\176\185=\182&\002QL\005.\226\220/\1360\022DS\132\028\a\184YJ\021\221\225\f\000\131\248aT\224\182\206o?\199#\025\1940!\154\157;\141\027\144\\4\227\\\215/\169^\149}~\149\227\128J\230 !$w\192\242L\144\234k\149\132O\b\203\211!\023\132\214(\006\016\176;\152\rA\028\014\223/n\127\002\204\157\006\224\151\000l*\023\156L\127b\189R\ra\129\170 \170\"\176B\221 \030`\153\000\228\0143\203\233\227\240\238a[\"&Xo\024\187\151\191\021\2441s\019\a0\015\246S\148jjI\245J\244/R5\154\1593\129\227\161\218\244\245J\194\237\"\225[\018B\n\0069\185\142\190\232\239\002X\146\016B\005\192a\238\168\196\191\140\020\226^\015\224e\0006\213\185\149Y\211\002\136\024\145\005\028#\132\025\"\0065M)\163\026\\\f\150\239}\155\228;l\001\f\222$x\180\206\t\224#\166\127I\v\144-b\016Im\222\\\225\147\028\003\164T/\005|\149d\179\207\242L\022\254\135C\168\246V\146\nD\165`$k\018\004fs\229\206\016\025\138\244\247\166\a\186\218\137. \162mJ\017D\128q\000k\141\200\f\179\0001\133iL\154/\217\255{*\vjI%\001x1\247\153\004m\1727K0\154\005\148\173\219\000\154M\179\165\133^\154=\137\b\185\153V\210\191\\\228I\145\191\128C\149\002\190\016\158\014R}\181\146\240\177\016\170\189I\240\146\170\132\165l\188fY@*\239\141[\132\189J\241{Dt\149\146\18862?\151Y\184\230\026,\140\016\003\162E\152)\\\002\212==\183\146:\0222\f\180\127l:\184\206\132\223\160E\130v\250\215\184\133\161\214\184\164\128\144\005\165\181\158R\185\144\214*k\182\136h\224\234\251\018\194\023+\t\031\019\t\a\170\150{\224V_`m\178\000\"8K\170\186\142\144\128\140@\160\253D\244\251J|\128\141\255k\228\184\147\153\183\154\025+GT\022\016\213\224n\136\022\225nP7\144\167\134\145{\142\005\224\003K\224\169\161\212\198z\183\000@k\135t\254\210F\211\225\203\189\254\148\183\019\002\135\148\006\230\226Nn\242D\145p,H\245\168\136\220\0318|JX\158\145\144\191)\020\170\\?\bM\026)S4\206\166\178\000\001@\004\134H@D@\172\193\129@\198O3\235\237\172\252Efy\167Ixu\212\248<\017\217df\155\216\148\204\020\149%+\144,\1285d(1@\017r1\255\163\254\127\028\aV\251\158\198\227\190}3\186\238%\014h\127[\170\196\000\165\175Oy7U\234\247\167\205\029\129\197\153y\129Y\142\005\tG\002\135\2073\243\159\137\132\127n\167z\2172d\235\145{\006\217\018\244\1974\237\2244Y\f\147\128\200\000\"\152E\1762\1621\136\248Q6}\143\153\222\0198\236\138\166\1756\213_\016\2153\220\141\204,\184;\171\027Q~L\130\183\148\f:\026+\128%\178\128d\029\158=\140\154\221\129%\200\194\231\193N(\"\182\028\245\187\019\169\016;\017;39\017G!\249W\022\249f`\249\0183\255-\179|\167\233\b\230T/E\251<\180\239\162\b\127\154\175\229M\213\f\018\164\006G\000R\154g\004#\003\017\193\136`$ \141\016b\152\t\162\233\001w; \166\127\021E\207\n\238g\155\217\185\128?\223\212\206R\2153\200\253G\212m\171;\002\224\167\185\251\233\000\200\221})\v\000<\251\174`\220\162\183-\000\229z7\017\029\005\232\135\204\020\0254\239DO\t\201\191\176\240\019\000\029\014,\223&\162G\153\249\187\204r\180\213\235o\226\131\226\239K\186X\204~\017\2544\022\160\247\183\131g8\181p\234\253\220\215\f\1890#\192\006\199\140\000\027\0283\002lp\204\b\176\1931#\192\006\199\140\000\027\0283\002lp\204\b\176\1931#\192\006\199\140\000\027\028\255\014G\218\147J\243V \195\000\000\000\000IEND\174B`\130", true);
local l_insert_0 = table.insert;
local l_remove_0 = table.remove;
local l_band_0 = bit.band;
local l_lshift_0 = bit.lshift;
local l_pi_0 = math.pi;
local l_sin_0 = math.sin;
local l_cos_0 = math.cos;
local l_abs_0 = math.abs;
local l_floor_0 = math.floor;
local l_random_0 = math.random;
local l_atan2_0 = math.atan2;
local l_bor_0 = bit.bor;
local l_cast_0 = ffi.cast;
local l_pow_0 = math.pow;
local _ = math.sqrt;
local l_clamp_0 = math.clamp;
local _ = unpack;
local l_trace_line_0 = utils.trace_line;
local l_trace_hull_0 = utils.trace_hull;
local l_get_local_player_0 = entity.get_local_player;
local _ = entity.get_players;
local l_text_0 = render.text;
local l_gradient_0 = render.gradient;
local l_measure_text_0 = render.measure_text;
local l_shadow_0 = render.shadow;
local l_poly_0 = render.poly;
local _ = ui.get_icon;
local v37 = {};
local v38 = {};
local v39 = {};
local v40 = {};
v39.get_config_list = function()
    -- upvalues: v0 (ref)
    local v41 = {
        [1] = "Default"
    };
    for v42 = 1, #v0.configs do
        v41[#v41 + 1] = v0.configs[v42].name;
    end;
    return v41;
end;
v0.configs.Default = json.parse("{\"author\":\"Misnik\",\"data\":{\"antiaim\":{\"base_compensate\":false,\"base_pitch\":\"Down\",\"base_yaw\":\"At Target\",\"breaklc_always\":[\"Standing\",\"Slow Walking\",\"Crouching\",\"In Air\"],\"breaklc_extra\":[],\"breaklc_ping\":[],\"def_onetapspeed1\":10.0,\"def_onetapspeed2\":10.0,\"def_onetapspeed3\":10.0,\"def_onetapspeed4\":10.0,\"def_onetapspeed51\":10.0,\"def_onetapspeed52\":10.0,\"def_onetapspeed61\":10.0,\"def_onetapspeed62\":10.0,\"def_pitch1\":\"Disabled\",\"def_pitch2\":\"Disabled\",\"def_pitch3\":\"Disabled\",\"def_pitch4\":\"Disabled\",\"def_pitch51\":\"Disabled\",\"def_pitch52\":\"Disabled\",\"def_pitch61\":\"Disabled\",\"def_pitch62\":\"Disabled\",\"def_switch1\":false,\"def_switch2\":false,\"def_switch3\":false,\"def_switch4\":false,\"def_switch51\":false,\"def_switch52\":false,\"def_switch61\":false,\"def_switch62\":false,\"def_yaw1\":\"Default\",\"def_yaw2\":\"Default\",\"def_yaw3\":\"Default\",\"def_yaw4\":\"Default\",\"def_yaw51\":\"Default\",\"def_yaw52\":\"Default\",\"def_yaw61\":\"Default\",\"def_yaw62\":\"Default\",\"def_yaw_deg1\":0.0,\"def_yaw_deg2\":0.0,\"def_yaw_deg3\":0.0,\"def_yaw_deg4\":0.0,\"def_yaw_deg51\":0.0,\"def_yaw_deg52\":0.0,\"def_yaw_deg61\":0.0,\"def_yaw_deg62\":0.0,\"desync_freestand1\":\"Disabled\",\"desync_freestand2\":\"Disabled\",\"desync_freestand3\":\"Disabled\",\"desync_freestand4\":\"Disabled\",\"desync_freestand51\":\"Disabled\",\"desync_freestand52\":\"Disabled\",\"desync_freestand61\":\"Disabled\",\"desync_freestand62\":\"Disabled\",\"desync_l1\":60.0,\"desync_l2\":60.0,\"desync_l3\":60.0,\"desync_l4\":60.0,\"desync_l51\":60.0,\"desync_l52\":60.0,\"desync_l61\":60.0,\"desync_l62\":60.0,\"desync_mod1\":[],\"desync_mod2\":[],\"desync_mod3\":[],\"desync_mod4\":[],\"desync_mod51\":[],\"desync_mod52\":[],\"desync_mod61\":[],\"desync_mod62\":[],\"desync_r1\":60.0,\"desync_r2\":60.0,\"desync_r3\":60.0,\"desync_r4\":60.0,\"desync_r51\":60.0,\"desync_r52\":60.0,\"desync_r61\":60.0,\"desync_r62\":60.0,\"desync_switch1\":false,\"desync_switch2\":false,\"desync_switch3\":false,\"desync_switch4\":false,\"desync_switch51\":false,\"desync_switch52\":false,\"desync_switch61\":false,\"desync_switch62\":false,\"flick_delay1\":3.0,\"flick_delay2\":3.0,\"flick_delay3\":3.0,\"flick_delay4\":3.0,\"flick_delay51\":3.0,\"flick_delay52\":3.0,\"flick_delay61\":3.0,\"flick_delay62\":3.0,\"flick_yaw1\":0.0,\"flick_yaw2\":0.0,\"flick_yaw3\":0.0,\"flick_yaw4\":0.0,\"flick_yaw51\":0.0,\"flick_yaw52\":0.0,\"flick_yaw61\":0.0,\"flick_yaw62\":0.0,\"frees_dis_def\":true,\"frees_disable\":[],\"frees_pitch\":\"Disabled\",\"frees_pitch_custom\":0.0,\"frees_yaw\":\"Reversed\",\"frees_yaw_onetap\":0.0,\"legitaa_custom\":0.0,\"legitaa_desync\":true,\"legitaa_freestand\":\"Peek Fake\",\"legitaa_mod\":[\"Jitter\"],\"legitaa_pitch\":\"Camera Based\",\"legitaa_switch\":true,\"list\":2.0,\"manual_type\":\"Toggle\",\"manual_view\":\"Local View\",\"over_cond2\":true,\"over_cond3\":true,\"over_cond4\":true,\"over_cond51\":true,\"over_cond52\":true,\"over_cond61\":true,\"over_cond62\":true,\"pitch_custom1\":0.0,\"pitch_custom2\":0.0,\"pitch_custom3\":0.0,\"pitch_custom4\":0.0,\"pitch_custom51\":0.0,\"pitch_custom52\":0.0,\"pitch_custom61\":0.0,\"pitch_custom62\":0.0,\"pitch_deg1\":0.0,\"pitch_deg2\":0.0,\"pitch_deg3\":0.0,\"pitch_deg4\":0.0,\"pitch_deg51\":0.0,\"pitch_deg52\":0.0,\"pitch_deg61\":0.0,\"pitch_deg62\":0.0,\"predict_switch\":true,\"preset_list\":2.0,\"roll_def_deg1\":0.0,\"roll_def_deg2\":0.0,\"roll_def_deg3\":0.0,\"roll_def_deg4\":0.0,\"roll_def_deg51\":0.0,\"roll_def_deg52\":0.0,\"roll_def_deg61\":0.0,\"roll_def_deg62\":0.0,\"roll_ext_deg1\":0.0,\"roll_ext_deg2\":0.0,\"roll_ext_deg3\":0.0,\"roll_ext_deg4\":0.0,\"roll_ext_deg51\":0.0,\"roll_ext_deg52\":0.0,\"roll_ext_deg61\":0.0,\"roll_ext_deg62\":0.0,\"roll_ext_pit1\":0.0,\"roll_ext_pit2\":0.0,\"roll_ext_pit3\":0.0,\"roll_ext_pit4\":0.0,\"roll_ext_pit51\":0.0,\"roll_ext_pit52\":0.0,\"roll_ext_pit61\":0.0,\"roll_ext_pit62\":0.0,\"roll_switch1\":false,\"roll_switch2\":false,\"roll_switch3\":false,\"roll_switch4\":false,\"roll_switch51\":false,\"roll_switch52\":false,\"roll_switch61\":false,\"roll_switch62\":false,\"roll_type1\":\"Default\",\"roll_type2\":\"Default\",\"roll_type3\":\"Default\",\"roll_type4\":\"Default\",\"roll_type51\":\"Default\",\"roll_type52\":\"Default\",\"roll_type61\":\"Default\",\"roll_type62\":\"Default\",\"safe_def\":true,\"safe_switch\":true,\"xway_counter1\":3.0,\"xway_counter2\":3.0,\"xway_counter3\":3.0,\"xway_counter4\":3.0,\"xway_counter51\":3.0,\"xway_counter52\":3.0,\"xway_counter61\":3.0,\"xway_counter62\":3.0,\"xway_shuffle1\":false,\"xway_shuffle2\":false,\"xway_shuffle3\":false,\"xway_shuffle4\":false,\"xway_shuffle51\":false,\"xway_shuffle52\":false,\"xway_shuffle61\":false,\"xway_shuffle62\":false,\"xway_switch1\":false,\"xway_switch2\":false,\"xway_switch3\":false,\"xway_switch4\":false,\"xway_switch51\":false,\"xway_switch52\":false,\"xway_switch61\":false,\"xway_switch62\":false,\"xway_sync1\":false,\"xway_sync2\":false,\"xway_sync3\":false,\"xway_sync4\":false,\"xway_sync51\":false,\"xway_sync52\":false,\"xway_sync61\":false,\"xway_sync62\":false,\"xwayn_11\":0.0,\"xwayn_12\":0.0,\"xwayn_13\":0.0,\"xwayn_14\":0.0,\"xwayn_15\":0.0,\"xwayn_16\":0.0,\"xwayn_17\":0.0,\"xwayn_21\":0.0,\"xwayn_22\":0.0,\"xwayn_23\":0.0,\"xwayn_24\":0.0,\"xwayn_25\":0.0,\"xwayn_26\":0.0,\"xwayn_27\":0.0,\"xwayn_31\":0.0,\"xwayn_32\":0.0,\"xwayn_33\":0.0,\"xwayn_34\":0.0,\"xwayn_35\":0.0,\"xwayn_36\":0.0,\"xwayn_37\":0.0,\"xwayn_41\":0.0,\"xwayn_42\":0.0,\"xwayn_43\":0.0,\"xwayn_44\":0.0,\"xwayn_45\":0.0,\"xwayn_46\":0.0,\"xwayn_47\":0.0,\"xwayn_511\":0.0,\"xwayn_512\":0.0,\"xwayn_513\":0.0,\"xwayn_514\":0.0,\"xwayn_515\":0.0,\"xwayn_516\":0.0,\"xwayn_517\":0.0,\"xwayn_521\":0.0,\"xwayn_522\":0.0,\"xwayn_523\":0.0,\"xwayn_524\":0.0,\"xwayn_525\":0.0,\"xwayn_526\":0.0,\"xwayn_527\":0.0,\"xwayn_611\":0.0,\"xwayn_612\":0.0,\"xwayn_613\":0.0,\"xwayn_614\":0.0,\"xwayn_615\":0.0,\"xwayn_616\":0.0,\"xwayn_617\":0.0,\"xwayn_621\":0.0,\"xwayn_622\":0.0,\"xwayn_623\":0.0,\"xwayn_624\":0.0,\"xwayn_625\":0.0,\"xwayn_626\":0.0,\"xwayn_627\":0.0,\"yaw_deg1\":0.0,\"yaw_deg2\":0.0,\"yaw_deg3\":0.0,\"yaw_deg4\":0.0,\"yaw_deg51\":0.0,\"yaw_deg52\":0.0,\"yaw_deg61\":0.0,\"yaw_deg62\":0.0,\"yaw_delay1\":0.0,\"yaw_delay2\":0.0,\"yaw_delay3\":0.0,\"yaw_delay4\":0.0,\"yaw_delay51\":0.0,\"yaw_delay52\":0.0,\"yaw_delay61\":0.0,\"yaw_delay62\":0.0,\"yaw_l1\":0.0,\"yaw_l2\":0.0,\"yaw_l3\":0.0,\"yaw_l4\":0.0,\"yaw_l51\":0.0,\"yaw_l52\":0.0,\"yaw_l61\":0.0,\"yaw_l62\":0.0,\"yaw_mod_combo1\":\"Disabled\",\"yaw_mod_combo2\":\"Disabled\",\"yaw_mod_combo3\":\"Disabled\",\"yaw_mod_combo4\":\"Disabled\",\"yaw_mod_combo51\":\"Disabled\",\"yaw_mod_combo52\":\"Disabled\",\"yaw_mod_combo61\":\"Disabled\",\"yaw_mod_combo62\":\"Disabled\",\"yaw_o1\":0.0,\"yaw_o2\":0.0,\"yaw_o3\":0.0,\"yaw_o4\":0.0,\"yaw_o51\":0.0,\"yaw_o52\":0.0,\"yaw_o61\":0.0,\"yaw_o62\":0.0,\"yaw_r1\":0.0,\"yaw_r2\":0.0,\"yaw_r3\":0.0,\"yaw_r4\":0.0,\"yaw_r51\":0.0,\"yaw_r52\":0.0,\"yaw_r61\":0.0,\"yaw_r62\":0.0,\"yaw_randl1\":0.0,\"yaw_randl2\":0.0,\"yaw_randl3\":0.0,\"yaw_randl4\":0.0,\"yaw_randl51\":0.0,\"yaw_randl52\":0.0,\"yaw_randl61\":0.0,\"yaw_randl62\":0.0,\"yaw_rando1\":0.0,\"yaw_rando2\":0.0,\"yaw_rando3\":0.0,\"yaw_rando4\":0.0,\"yaw_rando51\":0.0,\"yaw_rando52\":0.0,\"yaw_rando61\":0.0,\"yaw_rando62\":0.0,\"yaw_randr1\":0.0,\"yaw_randr2\":0.0,\"yaw_randr3\":0.0,\"yaw_randr4\":0.0,\"yaw_randr51\":0.0,\"yaw_randr52\":0.0,\"yaw_randr61\":0.0,\"yaw_randr62\":0.0,\"yaw_switch1\":false,\"yaw_switch2\":false,\"yaw_switch3\":false,\"yaw_switch4\":false,\"yaw_switch51\":false,\"yaw_switch52\":false,\"yaw_switch61\":false,\"yaw_switch62\":false},\"misc\":{\"avoid_disable\":[],\"avoid_dist\":5.0,\"avoid_switch\":false,\"clantag_switch\":true,\"fall_switch\":true,\"fastladder_switch\":true,\"ping_slider\":200.0,\"ping_switch\":false,\"shared_switch\":true,\"trash_type\":[\"On Kill\",\"On Death\",\"Revenge\"],\"trashtalk_switch\":true},\"ragebot\":{\"aipeek_delay\":2.0,\"aipeek_dist\":30.0,\"aipeek_dt\":true,\"aipeek_keys\":true,\"aipeek_switch\":false,\"aipeek_vis\":false,\"air_1\":55.0,\"air_2\":-1.0,\"air_3\":-1.0,\"air_4\":-1.0,\"air_5\":-1.0,\"air_6\":-1.0,\"air_7\":-1.0,\"air_exploit\":false,\"airstop_cond\":[1.0,2.0],\"airstop_switch\":true,\"antidef_switch\":false,\"discharge_combo\":[],\"discharge_delay\":3.0,\"discharge_mode\":\"Default\",\"discharge_switch\":false,\"dormant_dmg\":5.0,\"dormant_dmgswitch\":true,\"dormant_switch\":true,\"grenade_damage\":100.0,\"grenade_switch\":false,\"jumpscout\":true,\"noscope_1\":-1.0,\"noscope_2\":50.0,\"noscope_3\":50.0,\"noscope_4\":-1.0,\"noscope_5\":-1.0,\"noscope_6\":-1.0,\"noscope_7\":-1.0,\"noscope_dist1\":0.0,\"noscope_dist2\":15.0,\"noscope_dist3\":30.0,\"noscope_dist4\":0.0,\"noscope_dist5\":0.0,\"noscope_dist6\":0.0,\"noscope_dist7\":0.0,\"roll_deg\":50.0,\"roll_pitch_deg\":89.0,\"roll_pitch_switch\":false,\"roll_resolver\":false,\"toss_switch\":false},\"visuals\":{\"anim_gym\":true,\"anim_speed\":10.0,\"anim_switch\":true,\"breaker_lean_value\":0.0,\"breaker_list\":[1.0,4.0,5.0],\"breaker_switch\":true,\"color_use_theme\":true,\"console_color\":{\"a\":255.0,\"b\":152.0,\"g\":114.0,\"r\":124.0},\"console_switch\":true,\"damage_font\":\"Pixel\",\"damage_is_active\":false,\"damage_switch\":true,\"dpi_scale\":\"Auto\",\"glow_alpha\":75.0,\"glow_thick\":25.0,\"hitlog_color_mode\":\"Per Reason\",\"hitlog_death\":{\"a\":255.0,\"b\":41.0,\"g\":41.0,\"r\":165.0},\"hitlog_duration\":30.0,\"hitlog_extra\":[\"Icons\",\"Glow\"],\"hitlog_hit\":{\"a\":255.0,\"b\":255.0,\"g\":129.0,\"r\":138.0},\"hitlog_miss\":{\"a\":255.0,\"b\":62.0,\"g\":62.0,\"r\":254.0},\"hitlog_pred\":{\"a\":255.0,\"b\":119.0,\"g\":66.0,\"r\":255.0},\"hitlog_resolver\":{\"a\":255.0,\"b\":62.0,\"g\":62.0,\"r\":254.0},\"hitlog_spread\":{\"a\":255.0,\"b\":57.0,\"g\":193.0,\"r\":255.0},\"hitlog_switch\":true,\"hitlog_theme_hit\":true,\"hitlog_vis_type\":[1.0,2.0,3.0],\"hitmarker_color_hitlog\":true,\"hitmarker_duration\":30.0,\"hitmarker_glow\":true,\"hitmarker_hit\":{\"a\":255.0,\"b\":255.0,\"g\":129.0,\"r\":138.0},\"hitmarker_lastshot\":true,\"hitmarker_miss\":{\"a\":255.0,\"b\":62.0,\"g\":62.0,\"r\":254.0},\"hitmarker_switch\":true,\"hitmarker_theme_hit\":true,\"indicator_glow\":true,\"indicator_style\":\"Old\",\"indicator_switch\":true,\"main_color\":{\"a\":255.0,\"b\":255.0,\"g\":129.0,\"r\":138.0},\"manual_switch\":false,\"molotov_switch\":false,\"nade_molotov\":true,\"nade_molotov_c\":{\"a\":150.0,\"b\":122.0,\"g\":122.0,\"r\":255.0},\"nade_molotov_cf\":{\"a\":0.0,\"b\":0.0,\"g\":0.0,\"r\":0.0},\"nade_smoke\":true,\"nade_smoke_c\":{\"a\":131.0,\"b\":131.0,\"g\":131.0,\"r\":131.0},\"nade_style\":\"Solid\",\"nade_switch\":true,\"scope_gap\":6.0,\"scope_size\":200.0,\"scope_switch\":false,\"scope_type\":[],\"second_color\":{\"a\":255.0,\"b\":255.0,\"g\":129.0,\"r\":138.0},\"spoofer_list\":1.0,\"spoofer_switch\":false,\"transparency_alpha\":100.0,\"transparency_keep\":false,\"transparency_nade\":50.0,\"transparency_scope\":50.0,\"transparency_switch\":false,\"widgets_list\":[]}},\"is_locked\":false,\"name\":\"2024 Default config\"}");
local v43 = {
    chams_color = ui.find("Visuals", "Players", "Self", "Chams", "Model", "Color"), 
    chams_material = ui.find("Visuals", "Players", "Self", "Chams", "Model", "Style"), 
    edge_jump = ui.find("Miscellaneous", "Main", "Movement", "Edge Jump"), 
    autostop = ui.find("Aimbot", "Ragebot", "Accuracy", "SSG-08", "Auto Stop", "Options"), 
    airstrafe = ui.find("Miscellaneous", "Main", "Movement", "Air Strafe"), 
    double_tap_fl = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Fake Lag Limit"), 
    ragebot = ui.find("Aimbot", "Ragebot", "Main", "Enabled"), 
    double_tap = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"), 
    defensive = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"), 
    hidden_yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden"), 
    hide_shots = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"), 
    hide_shots_defensive = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options"), 
    hitchance = ui.find("Aimbot", "Ragebot", "Selection", "Hit Chance"), 
    no_scope = ui.find("Aimbot", "Ragebot", "Accuracy", "Auto Scope"), 
    dmg = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"), 
    hitboxes = ui.find("Aimbot", "Ragebot", "Selection", "Hitboxes"), 
    legs_movement = ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"), 
    fakeduck = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"), 
    slowwalk = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"), 
    pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"), 
    peek_assist_return = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist", "Retreat Mode"), 
    yaw_base = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"), 
    yaw_offset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"), 
    yaw_at_targets = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"), 
    yaw_modifier = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"), 
    yaw_modifier_offset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"), 
    desync = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"), 
    inverter = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"), 
    left_limit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"), 
    right_limit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"), 
    fake_opt = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"), 
    desync_freestand = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding"), 
    exales = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles"), 
    exales_pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles", "Extended Pitch"), 
    exales_roll = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles", "Extended Roll"), 
    auto_peek = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist"), 
    auto_peek_color = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist", "Style"), 
    freestand = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"), 
    freestand_off_yaw_modifiers = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Disable Yaw Modifiers"), 
    world_hitmarker = ui.find("Visuals", "World", "Other", "Hit Marker"), 
    strafe_smooth = ui.find("Miscellaneous", "Main", "Movement", "Air Strafe", "Smoothing"), 
    body_rage = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim"), 
    safe_points = ui.find("Aimbot", "Ragebot", "Safety", "Safe Points"), 
    third_person = ui.find("Visuals", "World", "Main", "Force Thirdperson"), 
    clantag = ui.find("Miscellaneous", "Main", "In-Game", "Clan Tag"), 
    shared_esp = ui.find("Visuals", "Players", "Enemies", "ESP", "Shared ESP"), 
    fakelag_slider = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Limit"), 
    retreat_mode = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist", "Retreat Mode"), 
    peek_assist = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist"), 
    ping = ui.find("Miscellaneous", "Main", "Other", "Fake Latency")
};
local v44 = {};
local v45 = {};
for v46, v47 in pairs(v43) do
    local v48 = {
        ref = v47
    };
    do
        local l_v46_0 = v46;
        do
            local l_v48_0 = v48;
            v47:set_callback(function(v51)
                -- upvalues: v44 (ref), l_v46_0 (ref), l_v48_0 (ref)
                local v52 = v51:get();
                v44[l_v46_0] = v52;
                l_v48_0.value = v52;
                l_v48_0.override_value = v51:get_override();
            end, true);
            l_v48_0.set = function(v53, v54)
                if v53.value ~= v54 then
                    v53.value = v54;
                    v53.ref:set(v54);
                end;
            end;
            l_v48_0.override = function(v55, v56)
                if v55.override_value ~= v56 then
                    v55.override_value = v56;
                    v55.ref:override(v56);
                end;
            end;
            v45[l_v46_0] = l_v48_0;
        end;
    end;
end;
v38.flags = {
    IN_ATTACK = l_lshift_0(1, 0), 
    IN_JUMP = l_lshift_0(1, 1), 
    IN_DUCK = l_lshift_0(1, 2), 
    IN_FORWARD = l_lshift_0(1, 3), 
    IN_BACK = l_lshift_0(1, 4), 
    IN_USE = l_lshift_0(1, 5), 
    IN_CANCEL = l_lshift_0(1, 6), 
    IN_LEFT = l_lshift_0(1, 7), 
    IN_RIGHT = l_lshift_0(1, 8), 
    IN_MOVELEFT = l_lshift_0(1, 9), 
    IN_MOVERIGHT = l_lshift_0(1, 10), 
    IN_ATTACK2 = l_lshift_0(1, 11), 
    IN_RUN = l_lshift_0(1, 12), 
    IN_RELOAD = l_lshift_0(1, 13), 
    IN_ALT1 = l_lshift_0(1, 14), 
    IN_ALT2 = l_lshift_0(1, 15), 
    IN_SCORE = l_lshift_0(1, 16), 
    IN_SPEED = l_lshift_0(1, 17), 
    IN_WALK = l_lshift_0(1, 18), 
    IN_ZOOM = l_lshift_0(1, 19), 
    IN_WEAPON1 = l_lshift_0(1, 20), 
    IN_WEAPON2 = l_lshift_0(1, 21), 
    IN_BULLRUSH = l_lshift_0(1, 22), 
    FL_ONGROUND = l_lshift_0(1, 0), 
    FL_DUCKING = l_lshift_0(1, 1), 
    FL_WATERJUMP = l_lshift_0(1, 3), 
    FL_ONTRAIN = l_lshift_0(1, 4), 
    FL_INRAIN = l_lshift_0(1, 5), 
    FL_FROZEN = l_lshift_0(1, 6), 
    FL_ATCONTROLS = l_lshift_0(1, 7), 
    FL_CLIENT = l_lshift_0(1, 8), 
    FL_FAKECLIENT = l_lshift_0(1, 9), 
    FL_INWATER = l_lshift_0(1, 10)
};
local function v59(v57, v58)
    -- upvalues: l_floor_0 (ref)
    return l_floor_0(v57 / v58) * v58;
end;
local function v62(v60)
    -- upvalues: l_floor_0 (ref)
    v60 = tonumber(v60);
    local v61 = l_floor_0(v60);
    if v60 < 0 and v60 - v61 ~= 0 then
        v60 = v61 + 1;
    else
        v60 = v61;
    end;
    return v60;
end;
local v63 = {
    hp = 0, 
    ref = l_get_local_player_0(), 
    on_ground = true, 
    crouching = true, 
    velocity = 0, 
    ground_tickcount = 0, 
    eye_pos = vector(0, 0, 0)
};
v63.update = function()
    -- upvalues: l_get_local_player_0 (ref), v63 (ref), l_band_0 (ref), v38 (ref), v44 (ref), l_clamp_0 (ref)
    local v64 = l_get_local_player_0();
    local l_m_fFlags_0 = v64.m_fFlags;
    local l_m_hGroundEntity_0 = v64.m_hGroundEntity;
    v63.on_ground = l_m_hGroundEntity_0;
    v63.ref = v64;
    v63.crouching = l_band_0(l_m_fFlags_0, v38.flags.FL_DUCKING) ~= 0 or v44.fakeduck;
    v63.velocity = v64.m_vecVelocity:length2d();
    v63.ground_tickcount = l_m_hGroundEntity_0 and l_clamp_0(v63.ground_tickcount + 1, 0, 51) or 0;
    v63.eye_pos = v64:get_eye_position();
end;
events.createmove:set(v63.update);
local function v70(v67, v68)
    -- upvalues: l_atan2_0 (ref), l_pi_0 (ref)
    local v69 = vector(v68.x - v67.x, v68.y - v67.y, v68.z - v67.z);
    return (vector(l_atan2_0(-v69.z, v69:length2d()) * 180 / l_pi_0, l_atan2_0(v69.y, v69.x) * 180 / l_pi_0, 0));
end;
local function v89(v71, v72, v73, v74, v75, v76, v77)
    -- upvalues: l_band_0 (ref), v38 (ref), l_trace_line_0 (ref), l_insert_0 (ref)
    local v78 = v71:get_origin();
    if v76 then
        v78 = v76;
    end;
    if v74 then
        v78 = v71:get_hitbox_position(v74);
    end;
    if v75 then
        v78 = v71:get_eye_position();
    end;
    local l_m_vecVelocity_0 = v71.m_vecVelocity;
    local v80 = l_m_vecVelocity_0:length();
    local v81 = {};
    if v80 < 5 then
        for v82 = 1, v72 do
            v81[v82] = v78;
        end;
        return v78, v81;
    else
        if v80 < 30 then
            l_m_vecVelocity_0.x = l_m_vecVelocity_0.x * 2;
            l_m_vecVelocity_0.y = l_m_vecVelocity_0.y * 2;
        end;
        local l_tickinterval_0 = globals.tickinterval;
        local v84 = cvar.sv_gravity:float() * l_tickinterval_0;
        local v85 = cvar.sv_jump_impulse:float() * l_tickinterval_0;
        local v86 = l_band_0(v71.m_fFlags, v38.flags.FL_ONGROUND) ~= 0 and 0 or v84 - v85;
        if v73 then
            for _ = 0, v72 do
                l_m_vecVelocity_0.z = l_m_vecVelocity_0.z - v86;
                if l_trace_line_0(v78, v78 + l_m_vecVelocity_0 * l_tickinterval_0, v71, 1174421507).fraction == 1 or not v77 then
                    v78 = v78 + l_m_vecVelocity_0 * l_tickinterval_0;
                    l_insert_0(v81, v78);
                else
                    break;
                end;
            end;
        else
            l_m_vecVelocity_0.x = l_m_vecVelocity_0.x * v72;
            l_m_vecVelocity_0.y = l_m_vecVelocity_0.y * v72;
            l_m_vecVelocity_0.z = l_m_vecVelocity_0.z * v72 - v86 * v72;
            local v88 = l_trace_line_0(v78, v78 + l_m_vecVelocity_0 * l_tickinterval_0, v71, 1174421507, 3);
            v78 = v77 and v88.end_pos or v78 + l_m_vecVelocity_0 * l_tickinterval_0;
        end;
        return v78, v81;
    end;
end;
ffi.cdef("\n            typedef struct \n            {\n                int x;\n                int y;\n                int z;\n            } vector_t;\n\n            typedef void*(__thiscall* c_entity_list_get_client_entity_t)(void*, int);\n\n            typedef struct {\n\n                char  pad_0000[20];\n                int m_nOrder;\n                int m_nSequence; \n                float m_flPrevCycle; \n                float m_flWeight; \n                float m_flWeightDeltaRate; \n                float m_flPlaybackRate; \n                float m_flCycle; \n                void *m_pOwner; \n                char  pad_0038[4];\n            } CAnimationLayer_t;\n        ");
local v92 = {
    bind_argument = function(v90, v91)
        return function(...)
            -- upvalues: v90 (ref), v91 (ref)
            return v90(v91, ...);
        end;
    end, 
    interface_type = ffi.typeof("uintptr_t**")
};
v92.i_client_entity_list = l_cast_0(v92.interface_type, utils.create_interface("client.dll", "VClientEntityList003"));
v92.get_client_entity = v92.bind_argument(l_cast_0("c_entity_list_get_client_entity_t", v92.i_client_entity_list[0][3]), v92.i_client_entity_list);
v92.get_client_entity_from_handle = v92.bind_argument(l_cast_0("c_entity_list_get_client_entity_t", v92.i_client_entity_list[0][4]), v92.i_client_entity_list);
v92.vgui_system = l_cast_0(v92.interface_type, utils.create_interface("vgui2.dll", "VGUI_System010"));
v92.shell_execute = v92.bind_argument(l_cast_0("void(__thiscall*)(void*, const char*, const char*)", v92.vgui_system[0][3]), v92.vgui_system);
v92.get_clipboard_text_count = v92.bind_argument(l_cast_0("int(__thiscall*)(void*)", v92.vgui_system[0][7]), v92.vgui_system);
v92.set_clipboard_text = v92.bind_argument(l_cast_0("void(__thiscall*)(void*, const char*, int)", v92.vgui_system[0][9]), v92.vgui_system);
v92.get_clipboard_text_fn = v92.bind_argument(l_cast_0("void(__thiscall*)(void*, int, const char*, int)", v92.vgui_system[0][11]), v92.vgui_system);
v92.get_clipboard_text = function()
    -- upvalues: v92 (ref)
    local v93 = v92.get_clipboard_text_count();
    if v93 > 0 then
        local v94 = ffi.new("char[?]", v93);
        local v95 = v93 * ffi.sizeof("char[?]", v93);
        v92.get_clipboard_text_fn(0, v94, v95);
        return ffi.string(v94, v93 - 1);
    else
        return "";
    end;
end;
v92.m_eye_angle = utils.get_vfunc(170, "vector_t*(__thiscall*)(void*)");
v92.EngineClient = utils.create_interface("engine.dll", "VEngineClient014");
v92.EngineClient_class = l_cast_0("void***", v92.EngineClient);
v92.console_status = l_cast_0("bool(__thiscall*)(void*)", v92.EngineClient_class[0][11]);
v92.vgui_system = l_cast_0(v92.interface_type, utils.create_interface("vgui2.dll", "VGUI_System010"));
v92.shell_execute = v92.bind_argument(l_cast_0("void(__thiscall*)(void*, const char*, const char*)", v92.vgui_system[0][3]), v92.vgui_system);
local v96 = {
    default_alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/", 
    custom_alphabet = "ulJkLANdgIcnwO79yRz6VBS8ZXQKfPv3HYejMFtmoWpb0s2xq1GEhC5aTri4U=+/"
};
v96.encode = function(v97)
    -- upvalues: v96 (ref)
    local l_custom_alphabet_0 = v96.custom_alphabet;
    return (v97:gsub(".", function(v99)
        local v100 = "";
        local v101 = v99:byte();
        for v102 = 8, 1, -1 do
            v100 = v100 .. (v101 % 2 ^ v102 - v101 % 2 ^ (v102 - 1) > 0 and "1" or "0");
        end;
        return v100;
    end) .. "0000"):gsub("%d%d%d?%d?%d?%d?", function(v103)
        -- upvalues: l_custom_alphabet_0 (ref)
        if #v103 < 6 then
            return "";
        else
            local v104 = 0;
            for v105 = 1, 6 do
                v104 = v104 + (v103:sub(v105, v105) == "1" and 2 ^ (6 - v105) or 0);
            end;
            return l_custom_alphabet_0:sub(v104 + 1, v104 + 1);
        end;
    end) .. ({
        [1] = "", 
        [2] = "DD", 
        [3] = "D"
    })[#v97 % 3 + 1];
end;
v96.decode = function(v106)
    -- upvalues: v96 (ref)
    local l_custom_alphabet_1 = v96.custom_alphabet;
    return (string.gsub(v106, "[^" .. l_custom_alphabet_1 .. "D]", ""):gsub(".", function(v108)
        -- upvalues: l_custom_alphabet_1 (ref)
        if v108 == "D" then
            return "";
        else
            local v109 = "";
            local v110 = l_custom_alphabet_1:find(v108) - 1;
            for v111 = 6, 1, -1 do
                v109 = v109 .. (v110 % 2 ^ v111 - v110 % 2 ^ (v111 - 1) > 0 and "1" or "0");
            end;
            return v109;
        end;
    end):gsub("%d%d%d?%d?%d?%d?%d?%d?", function(v112)
        if #v112 ~= 8 then
            return "";
        else
            local v113 = 0;
            for v114 = 1, 8 do
                v113 = v113 + (v112:sub(v114, v114) == "1" and 2 ^ (8 - v114) or 0);
            end;
            return string.char(v113);
        end;
    end));
end;
v96.pcall_func = function(v115)
    -- upvalues: v96 (ref)
    return pcall(function()
        -- upvalues: v96 (ref), v115 (ref)
        return json.parse(v96.decode(v115));
    end);
end;
local v116 = {};
local v117 = {
    values = {}, 
    ui_tables = {}, 
    active_tab = nil, 
    is_loaded = false, 
    types = {
        [1] = "switch", 
        [2] = "slider", 
        [3] = "combo", 
        [4] = "selectable", 
        [5] = "color_picker", 
        [6] = "button", 
        [7] = "hotkey", 
        [8] = "text_box", 
        [9] = "list", 
        [10] = "listable", 
        [11] = "label"
    }
};
v117.get_default_ui_el_table = function(v118, v119, v120, v121, v122)
    -- upvalues: v117 (ref)
    local v123 = {
        ref = v121
    };
    if not v117.values[v119] then
        v117.values[v119] = {};
    end;
    if not v117.ui_tables[v119] then
        v117.ui_tables[v119] = {};
    end;
    v123.value_for_ref = v121:get();
    v123.value = nil;
    v123._vis_func = v122;
    v123._dis_func = nil;
    v123.group_table = v118;
    v123.visible = function(v124, v125)
        -- upvalues: v123 (ref)
        if v125 ~= nil and v123._vis_state ~= v125 then
            v124.ref:visibility(v125);
            v123._vis_state = v125;
        end;
        return v123._vis_state;
    end;
    v123._disabled = false;
    v123.disabled = function(v126, v127)
        -- upvalues: v123 (ref)
        if v127 == nil then
            return v126.ref:disabled();
        else
            if v123._disabled ~= v127 then
                v123._disabled = v127;
                v126.ref:disabled(v127);
            end;
            return;
        end;
    end;
    v123._callbacks_list = {};
    v123._callback_func = function(v128)
        -- upvalues: v121 (ref), v123 (ref), v117 (ref), v119 (ref), v120 (ref)
        local v129 = v121:get();
        v123.value = v129;
        v123.value_for_ref = v129;
        v117.values[v119][v120] = v129;
        local v130 = v123._vis_func();
        if v123.group_table._vis_func and v130 then
            v130 = v123.group_table._vis_func();
        end;
        if v128 then
            for v131 = 1, #v123._callbacks_list do
                v123._callbacks_list[v131]();
            end;
        end;
        if v128 and v117.is_loaded then
            v123.group_table:update();
        end;
        if v123._vis_state ~= v130 then
            v123._vis_state = v130;
            v123.ref:visibility(v123._vis_state);
        end;
        local v132 = v123._dis_func and v123._dis_func() or nil;
        if v123.group_table._dis_func and v132 then
            v132 = v123.group_table._dis_func();
        end;
        if v132 ~= nil and v123._disabled ~= v132 then
            v123._disabled = v132;
            v123.ref:disabled(v132);
        end;
    end;
    v123.ref:set_callback(v123._callback_func, true);
    v123.set_callback = function(v133, v134, v135)
        v133._callbacks_list[#v133._callbacks_list + 1] = v134;
        if v135 then
            v134();
        end;
        return v134;
    end;
    v123.unset_callback = function(v136, v137)
        for v138 = 1, #v136._callbacks_list do
            if v136._callbacks_list[v138] == v137 then
                table.remove(v136._callbacks_list, v138);
                break;
            end;
        end;
    end;
    v123.set_disable_function = function(v139, v140, v141)
        v139._dis_func = v140;
        if v141 then
            v140();
        end;
    end;
    v123.tooltip = function(v142, v143)
        if not v143 then
            return v142.ref:tooltip();
        else
            v142.ref:tooltip(v143);
            return;
        end;
    end;
    v123.name = function(v144, v145)
        if not v145 then
            return v144.ref:name();
        else
            v144.ref:name(v145);
            return;
        end;
    end;
    if v121:type() == "color_picker" then
        return v123;
    else
        v123.gear_ref = nil;
        v123.switch = function(v146, v147, v148, v149, v150, v151, v152, v153)
            -- upvalues: v117 (ref), v123 (ref), v119 (ref), v118 (ref)
            if not v146.gear_ref then
                v146.gear_ref = v146.ref:create();
            end;
            local v154 = v146.gear_ref:switch(v148, v149);
            local v155 = v150 and v150 or function()
                return true;
            end;
            local v156 = v117.get_default_gear_table(v123, v119, v147, v151, v154, v155, v146.group_table);
            v156.type = 1;
            v156.def_value = v149;
            v156.disabled_icon = v152 == nil and "" or v152;
            v156.enabled_icon = v153 == nil and "" or v153;
            v156.enabled_text = v156.enabled_icon .. v148;
            v156.disabled_text = v156.disabled_icon .. v148;
            v156:set_callback(function()
                -- upvalues: v154 (ref), v156 (ref)
                v154:name(v156.value and v156.enabled_text or v156.disabled_text);
            end, true);
            v156 = setmetatable(v156, {
                __call = function(v157)
                    return v157.ref;
                end
            });
            v117.ui_tables[v119][v147] = v156;
            v118.elements[#v118.elements + 1] = v156;
            return v156;
        end;
        v123.slider = function(v158, v159, v160, v161, v162, v163, v164, v165, v166, v167)
            -- upvalues: v117 (ref), v123 (ref), v119 (ref), v118 (ref)
            if not v158.gear_ref then
                v158.gear_ref = v158.ref:create();
            end;
            local v168 = v158.gear_ref:slider(v160, v161, v162, v163, v164, v165);
            local v169 = v166 and v166 or function()
                return true;
            end;
            local v170 = v117.get_default_gear_table(v123, v119, v159, v167, v168, v169, v158.group_table);
            v170.type = 2;
            v170.def_value = v163;
            v170 = setmetatable(v170, {
                __call = function(v171)
                    return v171.ref;
                end
            });
            v117.ui_tables[v119][v159] = v170;
            v118.elements[#v118.elements + 1] = v170;
            return v170;
        end;
        v123.combo = function(v172, v173, v174, v175, v176, v177, v178)
            -- upvalues: v117 (ref), v123 (ref), v119 (ref), v118 (ref)
            if not v172.gear_ref then
                v172.gear_ref = v172.ref:create();
            end;
            local v179 = v172.gear_ref:combo(v174, v175);
            local v180 = v177 and v177 or function()
                return true;
            end;
            local v181 = v117.get_default_gear_table(v123, v119, v173, v178, v179, v180, v172.group_table);
            v181.type = 3;
            v181.def_value = v176;
            v181.elements_array = v175;
            v181.list_by_name = {};
            for v182 = 1, #v175 do
                v181.list_by_name[v175[v182]] = v182;
            end;
            v181.str_value = v179:get();
            v181.value = v181.list_by_name[v181.str_value];
            v181.ref:unset_callback(v181._callback_func);
            v181._callback_func = function(v183)
                -- upvalues: v181 (ref), v117 (ref), v119 (ref), v173 (ref), v178 (ref)
                local v184 = v181.ref:get();
                v181.value = v181.list_by_name[v184];
                v181.str_value = v184;
                v181.value_for_ref = v184;
                v117.values[v119][v173] = v184;
                local v185 = v181._vis_func();
                if v181.group_table._vis_func and v185 then
                    v185 = v181.group_table._vis_func();
                end;
                if not v178 then
                    local l_value_0 = v181.parent_table.value;
                    if not l_value_0 then
                        v185 = l_value_0;
                    end;
                end;
                if v183 then
                    for v187 = 1, #v181._callbacks_list do
                        v181._callbacks_list[v187]();
                    end;
                end;
                if v183 and v117.is_loaded then
                    v181.group_table:update();
                end;
                local v188 = v181._dis_func and v181._dis_func() or nil;
                if v181.group_table._dis_func and not v188 then
                    v188 = v181.group_table._dis_func();
                end;
                if v188 ~= nil and v181._disabled ~= v188 then
                    v181._disabled = v188;
                    v181.ref:disabled(v188);
                end;
                if v181._vis_state ~= v185 then
                    v181._vis_state = v185;
                    v181.ref:visibility(v181._vis_state);
                end;
            end;
            v181.ref:set_callback(v181._callback_func, true);
            v181 = setmetatable(v181, {
                __call = function(v189)
                    return v189.ref;
                end
            });
            v117.ui_tables[v119][v173] = v181;
            v118.elements[#v118.elements + 1] = v181;
            return v181;
        end;
        v123.selectable = function(v190, v191, v192, v193, v194, v195, v196)
            -- upvalues: v117 (ref), v123 (ref), v119 (ref), v118 (ref)
            if not v190.gear_ref then
                v190.gear_ref = v190.ref:create();
            end;
            local v197 = v190.gear_ref:selectable(v192, v193);
            local v198 = v195 and v195 or function()
                return true;
            end;
            local v199 = v117.get_default_gear_table(v123, v119, v191, v196, v197, v198, v190.group_table);
            v199.type = 4;
            v199.def_value = v194;
            v199.elements_array = v193;
            v199.list_by_name = {};
            for v200 = 1, #v193 do
                v199.list_by_name[v193[v200]] = v200;
            end;
            v199.str_value = v197:get();
            v199.value = v197:get();
            v199.value_by_name = {};
            for v201 = 1, #v199.value do
                v199.value_by_name[v199.value[v201]] = true;
            end;
            v199.ref:unset_callback(v199._callback_func);
            v199._callback_func = function(v202)
                -- upvalues: v199 (ref), v117 (ref), v119 (ref), v191 (ref), v196 (ref)
                local v203 = v199.ref:get();
                v199.value = v203;
                v199.str_value = v203;
                v199.value_for_ref = v203;
                v199.value_by_name = {};
                for v204 = 1, #v199.value do
                    v199.value_by_name[v199.value[v204]] = true;
                end;
                v117.values[v119][v191] = v203;
                local v205 = v199._vis_func();
                if v199.group_table._vis_func and v205 then
                    v205 = v199.group_table._vis_func();
                end;
                if not v196 then
                    local l_value_1 = v199.parent_table.value;
                    if not l_value_1 then
                        v205 = l_value_1;
                    end;
                end;
                if v202 then
                    for v207 = 1, #v199._callbacks_list do
                        v199._callbacks_list[v207]();
                    end;
                end;
                if v202 and v117.is_loaded then
                    v199.group_table:update();
                end;
                local v208 = v199._dis_func and v199._dis_func() or nil;
                if v199.group_table._dis_func and not v208 then
                    v208 = v199.group_table._dis_func();
                end;
                if v208 ~= nil and v199._disabled ~= v208 then
                    v199._disabled = v208;
                    v199.ref:disabled(v208);
                end;
                if v199._vis_state ~= v205 then
                    v199._vis_state = v205;
                    v199.ref:visibility(v199._vis_state);
                end;
            end;
            v199.ref:set_callback(v199._callback_func, true);
            v199 = setmetatable(v199, {
                __call = function(v209)
                    return v209.ref;
                end
            });
            v117.ui_tables[v119][v191] = v199;
            v118.elements[#v118.elements + 1] = v199;
            return v199;
        end;
        v123.color_picker = function(v210, v211, v212, v213, v214, v215)
            -- upvalues: v117 (ref), v123 (ref), v119 (ref), v118 (ref)
            if not v210.gear_ref and v212 then
                v210.gear_ref = v210.ref:create();
            end;
            local v216 = v210.gear_ref and v210.gear_ref:color_picker(v212, v213) or v210.ref:color_picker(v213);
            local v217 = v214 and v214 or function()
                return true;
            end;
            local v218 = v117.get_default_gear_table(v123, v119, v211, v215, v216, v217, v210.group_table);
            v218.type = 5;
            v218.def_value = v213;
            v218 = setmetatable(v218, {
                __call = function(v219)
                    return v219.ref;
                end
            });
            v117.ui_tables[v119][v211] = v218;
            v118.elements[#v118.elements + 1] = v218;
            return v218;
        end;
        v123.button = function(v220, v221, v222, v223, v224, v225, v226)
            -- upvalues: v117 (ref), v123 (ref), v119 (ref), v118 (ref)
            if not v220.gear_ref then
                v220.gear_ref = v220.ref:create();
            end;
            local v227 = v220.gear_ref:button(v222, v223, v224 and v224 or false);
            local v228 = v225 and v225 or function()
                return true;
            end;
            local v229 = v117.get_default_gear_table(v123, v119, v221, v226, v227, v228, v220.group_table);
            v229.type = 6;
            v229.def_value = nil;
            v229 = setmetatable(v229, {
                __call = function(v230)
                    return v230.ref;
                end
            });
            v117.ui_tables[v119][v221] = v229;
            v118.elements[#v118.elements + 1] = v229;
            return v229;
        end;
        v123.hotkey = function(v231, v232, v233, v234, v235, v236, v237)
            -- upvalues: v117 (ref), v123 (ref), v119 (ref), v118 (ref)
            if not v231.gear_ref then
                v231.gear_ref = v231.ref:create();
            end;
            local v238 = v231.gear_ref:hotkey(v233, v234);
            local v239 = v236 and v236 or function()
                return true;
            end;
            local v240 = v117.get_default_gear_table(v123, v119, v232, v237, v238, v239, v231.group_table);
            v240.type = 7;
            v240.def_value = v234;
            v240.key = function(v241, v242)
                if not v242 then
                    return v241.ref:key();
                else
                    v241.ref:key(v242);
                    return;
                end;
            end;
            v240.ref:unset_callback(v240._callback_func);
            v240._holding = false;
            v240.mode = v235;
            if v235 == 1 then
                v240._createmove_func = function()
                    -- upvalues: v240 (ref)
                    v240._holding = v240.ref:get();
                    v240.value = v240._holding;
                    if v240._holding then
                        local l_callbacks_funcs_0 = v240.callbacks_funcs;
                        for v244 = 1, #l_callbacks_funcs_0 do
                            l_callbacks_funcs_0[v244]();
                        end;
                    end;
                end;
            else
                v240._prev_state = false;
                v240._createmove_func = function()
                    -- upvalues: v240 (ref)
                    v240._holding = v240.ref:get();
                    if not v240._holding and v240._prev_state then
                        v240.value = not v240.value;
                        local l_callbacks_funcs_1 = v240.callbacks_funcs;
                        for v246 = 1, #l_callbacks_funcs_1 do
                            l_callbacks_funcs_1[v246]();
                        end;
                    end;
                    v240._prev_state = v240._holding;
                end;
            end;
            events.createmove:set(v240._createmove_func);
            v240.callbacks_funcs = {};
            v240.set_callback = function(v247, v248, v249)
                v247.callbacks_funcs[#v247.callbacks_funcs + 1] = v248;
                if v249 then
                    v248();
                end;
            end;
            v240.unset_callback = function(v250, v251)
                for v252 = 1, #v250.callbacks_funcs do
                    if v250.callbacks_funcs[v252] == v251 then
                        table.remove(v250.callbacks_funcs, v252);
                        break;
                    end;
                end;
            end;
            v240 = setmetatable(v240, {
                __call = function(v253)
                    return v253.ref;
                end
            });
            v117.ui_tables[v119][v232] = v240;
            v118.elements[#v118.elements + 1] = v240;
            return v240;
        end;
        v123.text_box = function(v254, v255, v256, v257, v258, v259)
            -- upvalues: v117 (ref), v123 (ref), v119 (ref), v118 (ref)
            if not v254.gear_ref then
                v254.gear_ref = v254.ref:create();
            end;
            local v260 = v254.gear_ref:input(v256, v257);
            local v261 = v258 and v258 or function()
                return true;
            end;
            local v262 = v117.get_default_gear_table(v123, v119, v255, v259, v260, v261, v254.group_table);
            v262.type = 8;
            v262.def_value = v257;
            v262 = setmetatable(v262, {
                __call = function(v263)
                    return v263.ref;
                end
            });
            v117.ui_tables[v119][v255] = v262;
            v118.elements[#v118.elements + 1] = v262;
            return v262;
        end;
        v123.list = function(v264, v265, v266, v267, v268, v269, v270)
            -- upvalues: v117 (ref), v123 (ref), v119 (ref), v118 (ref)
            if not v264.gear_ref then
                v264.gear_ref = v264.ref:create();
            end;
            local v271 = v264.gear_ref:list(v266, v267);
            local v272 = v269 and v269 or function()
                return true;
            end;
            local v273 = v117.get_default_gear_table(v123, v119, v265, v270, v271, v272, v264.group_table);
            v273.type = 9;
            v273.def_value = v268;
            v273.elements_array = v267;
            v273.list_by_name = {};
            for v274 = 1, #v267 do
                v273.list_by_name[v267[v274]] = v274;
            end;
            v273.str_value = v271:get();
            v273.value = v273.list_by_name[v273.str_value];
            v273.ref:unset_callback(v273._callback_func);
            v273._callback_func = function(v275)
                -- upvalues: v273 (ref), v117 (ref), v119 (ref), v265 (ref), v270 (ref)
                local v276 = v273.ref:get();
                v273.value = v276;
                v273.str_value = v273.elements_array[v276];
                v273.value_for_ref = v276;
                v117.values[v119][v265] = v276;
                local v277 = v273._vis_func();
                if v273.group_table._vis_func and v277 then
                    v277 = v273.group_table._vis_func();
                end;
                if not v270 then
                    local l_value_2 = v273.parent_table.value;
                    if not l_value_2 then
                        v277 = l_value_2;
                    end;
                end;
                if v275 then
                    for v279 = 1, #v273._callbacks_list do
                        v273._callbacks_list[v279]();
                    end;
                end;
                if v275 and v117.is_loaded then
                    v273.group_table:update();
                end;
                local v280 = v273._dis_func and v273._dis_func() or nil;
                if v273.group_table._dis_func and not v280 then
                    v280 = v273.group_table._dis_func();
                end;
                if v280 ~= nil and v273._disabled ~= v280 then
                    v273._disabled = v280;
                    v273.ref:disabled(v280);
                end;
                if v273._vis_state ~= v277 then
                    v273._vis_state = v277;
                    v273.ref:visibility(v273._vis_state);
                end;
            end;
            v273.ref:set_callback(v273._callback_func, true);
            v273 = setmetatable(v273, {
                __call = function(v281)
                    return v281.ref;
                end
            });
            v117.ui_tables[v119][v265] = v273;
            v118.elements[#v118.elements + 1] = v273;
            return v273;
        end;
        v123.listable = function(v282, v283, v284, v285, v286, v287, v288)
            -- upvalues: v117 (ref), v123 (ref), v119 (ref), v118 (ref)
            if not v282.gear_ref then
                v282.gear_ref = v282.ref:create();
            end;
            local v289 = v282.gear_ref:listable(v284, v285);
            local v290 = v287 and v287 or function()
                return true;
            end;
            local v291 = v117.get_default_gear_table(v123, v119, v283, v288, v289, v290, v282.group_table);
            v291.type = 10;
            v291.def_value = v286;
            v291.elements_array = v285;
            v291.list_by_name = {};
            for v292 = 1, #v285 do
                v291.list_by_name[v285[v292]] = v292;
            end;
            v291.str_value = v289:get();
            v291.value = v289:get();
            v291.value_by_name = {};
            for v293 = 1, #v291.value do
                v291.value_by_name[v291.value[v293]] = true;
            end;
            v291.ref:unset_callback(v291._callback_func);
            v291._callback_func = function(v294)
                -- upvalues: v291 (ref), v117 (ref), v119 (ref), v283 (ref), v288 (ref)
                local v295 = v291.ref:get();
                v291.value = v295;
                v291.str_value = v295;
                v291.value_for_ref = v295;
                v291.value_by_name = {};
                for v296 = 1, #v291.value do
                    v291.value_by_name[v291.value[v296]] = true;
                end;
                v117.values[v119][v283] = v295;
                local v297 = v291._vis_func();
                if v291.group_table._vis_func and v297 then
                    v297 = v291.group_table._vis_func();
                end;
                if not v288 then
                    local l_value_3 = v291.parent_table.value;
                    if not l_value_3 then
                        v297 = l_value_3;
                    end;
                end;
                if v294 then
                    for v299 = 1, #v291._callbacks_list do
                        v291._callbacks_list[v299]();
                    end;
                end;
                if v294 and v117.is_loaded then
                    v291.group_table:update();
                end;
                local v300 = v291._dis_func and v291._dis_func() or nil;
                if v291.group_table._dis_func and not v300 then
                    v300 = v291.group_table._dis_func();
                end;
                if v300 ~= nil and v291._disabled ~= v300 then
                    v291._disabled = v300;
                    v291.ref:disabled(v300);
                end;
                if v291._vis_state ~= v297 then
                    v291._vis_state = v297;
                    v291.ref:visibility(v291._vis_state);
                end;
            end;
            v291.ref:set_callback(v291._callback_func, true);
            v291 = setmetatable(v291, {
                __call = function(v301)
                    return v301.ref;
                end
            });
            v117.ui_tables[v119][v283] = v291;
            v118.elements[#v118.elements + 1] = v291;
            return v291;
        end;
        v123.label = function(v302, v303, v304, v305, v306, v307)
            -- upvalues: v117 (ref), v123 (ref), v118 (ref)
            if not v302.gear_ref then
                v302.gear_ref = v302.ref:create();
            end;
            local v308 = v302.gear_ref:label(v304);
            local v309 = v306 and v306 or function()
                return true;
            end;
            local v310 = v117.get_default_gear_table(v123, "label", v303, v307, v308, v309, v302.group_table);
            v310.type = 11;
            v310.def_value = v305;
            v310 = setmetatable(v310, {
                __call = function(v311)
                    return v311.ref;
                end
            });
            v117.ui_tables.label[v303] = v310;
            v118.elements[#v118.elements + 1] = v310;
            return v310;
        end;
        return v123;
    end;
end;
v117.get_default_gear_table = function(v312, v313, v314, v315, v316, v317, v318)
    -- upvalues: v117 (ref)
    if not v117.values[v313] then
        v117.values[v313] = {};
    end;
    if not v117.ui_tables[v313] then
        v117.ui_tables[v313] = {};
    end;
    local v319 = {
        ref = v316, 
        value_for_ref = v316:get(), 
        value = nil, 
        _vis_func = v317
    };
    v319._vis_state = v319._vis_func();
    v319._dis_func = nil;
    v319.group_table = v318;
    v319.parent_table = v312;
    v319._callbacks_list = {};
    v319.visible = function(v320, v321)
        if v321 ~= nil and v320._vis_state ~= v321 then
            v320.ref:visibility(v321);
            v320._vis_state = v321;
        end;
        return v320._vis_state;
    end;
    v319._disabled = false;
    v319.disabled = function(v322, v323)
        -- upvalues: v319 (ref)
        if v323 == nil then
            return v322.ref:disabled();
        else
            if v319._disabled ~= v323 then
                v319._disabled = v323;
                v322.ref:disabled(v323);
            end;
            return;
        end;
    end;
    v319._callback_func = function(v324)
        -- upvalues: v319 (ref), v117 (ref), v313 (ref), v314 (ref), v315 (ref)
        local v325 = v319.ref:get();
        v319.value = v325;
        v319.value_for_ref = v325;
        v117.values[v313][v314] = v325;
        local v326 = v319._vis_func();
        if not v315 then
            local l_value_4 = v319.parent_table.value;
            if not l_value_4 then
                v326 = l_value_4;
            end;
        end;
        if v324 then
            for v328 = 1, #v319._callbacks_list do
                v319._callbacks_list[v328]();
            end;
        end;
        if v324 and v117.is_loaded then
            v319.group_table:update();
        end;
        if v319._vis_state ~= v326 then
            v319._vis_state = v326;
            v319.ref:visibility(v319._vis_state);
        end;
        local v329 = nil;
        if v319._dis_func then
            v329 = v319._dis_func();
        end;
        if v319.group_table._dis_func and not v329 then
            v329 = v319.group_table._dis_func();
        end;
        if v329 ~= nil and v319._disabled ~= v329 then
            v319._disabled = v329;
            v319.ref:disabled(v329);
        end;
    end;
    v319.ref:set_callback(v319._callback_func, true);
    v319.set_callback = function(v330, v331, v332)
        v330._callbacks_list[#v330._callbacks_list + 1] = v331;
        if v332 then
            v331();
        end;
        return v331;
    end;
    v319.unset_callback = function(v333, v334)
        for v335 = 1, #v333._callbacks_list do
            if v333._callbacks_list[v335] == v334 then
                table.remove(v333._callbacks_list, v335);
                break;
            end;
        end;
    end;
    v319.set_disable_function = function(v336, v337)
        v336._dis_func = v337;
    end;
    v319.tooltip = function(v338, v339)
        if not v339 then
            return v338.ref:tooltip();
        else
            v338.ref:tooltip(v339);
            return;
        end;
    end;
    v319.name = function(v340, v341)
        if not v341 then
            return v340.ref:name();
        else
            v340.ref:name(v341);
            return;
        end;
    end;
    v319.visible_condition = function(v342, ...)
        -- upvalues: v319 (ref)
        local v343 = {
            ...
        };
        v342._vis_func = function()
            -- upvalues: v343 (ref), v319 (ref)
            local v344 = true;
            if not v343[1].type then
                local v345 = v343[1];
                for v346 = 1, #v345 do
                    local v347 = v345[v346];
                    local l_type_0 = v347[1].type;
                    if l_type_0 == 3 or l_type_0 == 4 or l_type_0 == 9 or l_type_0 == 10 then
                        if type(v347[2]) == "string" then
                            if v347[1].str_value ~= v347[2] then
                                v344 = false;
                                break;
                            end;
                        elseif v347[1].value ~= v347[2] then
                            v344 = false;
                            break;
                        end;
                    elseif v347[1].value ~= v347[2] then
                        v344 = false;
                        break;
                    end;
                end;
            else
                local l_v343_0 = v343;
                local l_type_1 = l_v343_0[1].type;
                if l_type_1 == 3 or l_type_1 == 4 or l_type_1 == 9 or l_type_1 == 10 then
                    if type(l_v343_0[2]) == "string" then
                        if l_v343_0[1].str_value ~= l_v343_0[2] then
                            v344 = false;
                        end;
                    elseif l_v343_0[1].value ~= l_v343_0[2] then
                        v344 = false;
                    end;
                elseif l_v343_0[1].value ~= l_v343_0[2] then
                    v344 = false;
                end;
            end;
            v319:visible(v344);
        end;
    end;
    v319.color_picker = function(v351, v352, v353, v354, v355)
        -- upvalues: v117 (ref), v319 (ref), v313 (ref), v318 (ref)
        local v356 = v351.ref:color_picker(v353);
        local v357 = v354 and v354 or function()
            return true;
        end;
        local v358 = v117.get_default_gear_table(v319, v313, v352, v355, v356, v357, v351.group_table);
        v358.type = 5;
        v358.def_value = v353;
        v358 = setmetatable(v358, {
            __call = function(v359)
                return v359.ref;
            end
        });
        v117.ui_tables[v313][v352] = v358;
        v318.elements[#v318.elements + 1] = v358;
        return v358;
    end;
    return v319;
end;
v117.create_group = function(v360, v361)
    -- upvalues: v117 (ref), v116 (ref)
    local v380 = {
        tab_name = v117.active_tab, 
        elements = {}, 
        ref = ui.create(v117.active_tab, v360, v361), 
        _vis_func = nil, 
        _dis_func = nil, 
        update = function(v362)
            local l_elements_0 = v362.elements;
            local v364 = nil;
            local v365 = nil;
            if v362._vis_func then
                v364 = v362._vis_func();
            end;
            if v362._dis_func then
                v365 = v362._dis_func();
            end;
            for v366 = 1, #l_elements_0 do
                local v367 = l_elements_0[v366];
                if v364 ~= nil then
                    v367:visible(v364);
                end;
                if v365 ~= nil then
                    v367:disabled(v365);
                end;
                v367._callback_func();
            end;
            local l_callbacks_funcs_2 = v362.callbacks_funcs;
            for v369 = 1, #l_callbacks_funcs_2 do
                l_callbacks_funcs_2[v369]();
            end;
        end, 
        visible_condition = function(v370, v371)
            v370._vis_func = v371;
            return v371;
        end, 
        disabled_condition = function(v372, v373)
            v372._dis_func = v373;
            return v373;
        end, 
        callbacks_funcs = {}, 
        set_callback = function(v374, v375, v376)
            v374.callbacks_funcs[#v374.callbacks_funcs + 1] = v375;
            if v376 then
                v375();
            end;
        end, 
        unset_callback = function(v377, v378)
            for v379 = 1, #v377.callbacks_funcs do
                if v377.callbacks_funcs[v379] == v378 then
                    table.remove(v377.callbacks_funcs, v379);
                    break;
                end;
            end;
        end
    };
    v380.switch = function(v381, v382, v383, v384, v385, v386, v387, v388)
        -- upvalues: v117 (ref), v380 (ref)
        local v389 = v381.ref:switch(v384, v385);
        local v390 = v386 and v386 or function()
            return true;
        end;
        local v391 = v117.get_default_ui_el_table(v380, v382, v383, v389, v390);
        v391.value = v389:get();
        v391.type = 1;
        v391.def_value = v385;
        v391.def_name = v384;
        v391.disabled_icon = v387 == nil and "" or v387;
        v391.enabled_icon = v388 == nil and "" or v388;
        v391.enabled_text = v391.enabled_icon .. v384;
        v391.disabled_text = v391.disabled_icon .. v384;
        v391:set_callback(function()
            -- upvalues: v389 (ref), v391 (ref)
            v389:name(v391.value and v391.enabled_text or v391.disabled_text);
        end, true);
        v391 = setmetatable(v391, {
            __call = function(v392)
                return v392.ref;
            end
        });
        v117.ui_tables[v382][v383] = v391;
        v380.elements[#v380.elements + 1] = v391;
        return v391;
    end;
    v380.slider = function(v393, v394, v395, v396, v397, v398, v399, v400, v401, v402)
        -- upvalues: v117 (ref), v380 (ref)
        local v403 = v393.ref:slider(v396, v397, v398, v399, v400, v401);
        local v404 = v402 and v402 or function()
            return true;
        end;
        local v405 = v117.get_default_ui_el_table(v380, v394, v395, v403, v404);
        v405.type = 2;
        v405.def_value = v399;
        v405 = setmetatable(v405, {
            __call = function(v406)
                return v406.ref;
            end
        });
        v117.ui_tables[v394][v395] = v405;
        v380.elements[#v380.elements + 1] = v405;
        return v405;
    end;
    v380.combo = function(v407, v408, v409, v410, v411, v412, v413)
        -- upvalues: v117 (ref), v380 (ref)
        local v414 = v407.ref:combo(v410, v411);
        local v415 = v413 and v413 or function()
            return true;
        end;
        local v416 = v117.get_default_ui_el_table(v380, v408, v409, v414, v415);
        v416.type = 3;
        v416.def_value = v412;
        v416.elements_array = v411;
        v416.list_by_name = {};
        for v417 = 1, #v411 do
            v416.list_by_name[v411[v417]] = v417;
        end;
        v416.str_value = v414:get();
        v416.value = v416.list_by_name[v416.str_value];
        v416.ref:unset_callback(v416._callback_func);
        v416._callback_func = function(v418)
            -- upvalues: v416 (ref), v117 (ref), v408 (ref), v409 (ref)
            local v419 = v416.ref:get();
            v416.value = v416.list_by_name[v419];
            v416.str_value = v419;
            v416.value_for_ref = v419;
            v117.values[v408][v409] = v419;
            local v420 = v416._vis_func();
            if v416.group_table._vis_func and v420 then
                v420 = v416.group_table._vis_func();
            end;
            if v418 then
                for v421 = 1, #v416._callbacks_list do
                    v416._callbacks_list[v421]();
                end;
            end;
            if v418 and v117.is_loaded then
                v416.group_table:update();
            end;
            local v422 = v416._dis_func and v416._dis_func() or nil;
            if v416.group_table._dis_func and v422 then
                v422 = v416.group_table._dis_func();
            end;
            if v422 ~= nil and v416._disabled ~= v422 then
                v416._disabled = v422;
                v416.ref:disabled(v422);
            end;
            if v416._vis_state ~= v420 then
                v416._vis_state = v420;
                v416.ref:visibility(v416._vis_state);
            end;
        end;
        v416.ref:set_callback(v416._callback_func);
        v416 = setmetatable(v416, {
            __call = function(v423)
                return v423.ref;
            end
        });
        v117.ui_tables[v408][v409] = v416;
        v380.elements[#v380.elements + 1] = v416;
        return v416;
    end;
    v380.selectable = function(v424, v425, v426, v427, v428, v429, v430)
        -- upvalues: v117 (ref), v380 (ref)
        local v431 = v424.ref:selectable(v427, v428);
        local v432 = v430 and v430 or function()
            return true;
        end;
        local v433 = v117.get_default_ui_el_table(v380, v425, v426, v431, v432);
        v433.type = 4;
        v433.def_value = v429;
        v433.elements_array = v428;
        v433.list_by_name = {};
        for v434 = 1, #v428 do
            v433.list_by_name[v428[v434]] = v434;
        end;
        v433.value = v431:get();
        v433.value_by_name = {};
        for v435 = 1, #v433.value do
            v433.value_by_name[v433.value[v435]] = true;
        end;
        v433.ref:unset_callback(v433._callback_func);
        v433._callback_func = function(v436)
            -- upvalues: v433 (ref), v117 (ref), v425 (ref), v426 (ref)
            local v437 = v433.ref:get();
            v433.value = v437;
            v433.value_for_ref = v437;
            v433.value_by_name = {};
            for v438 = 1, #v437 do
                v433.value_by_name[v437[v438]] = true;
            end;
            v117.values[v425][v426] = v437;
            local v439 = v433._vis_func();
            if v433.group_table._vis_func and v439 then
                v439 = v433.group_table._vis_func();
            end;
            if v436 then
                for v440 = 1, #v433._callbacks_list do
                    v433._callbacks_list[v440]();
                end;
            end;
            if v436 and v117.is_loaded then
                v433.group_table:update();
            end;
            if v433._vis_state ~= v439 then
                v433._vis_state = v439;
                v433.ref:visibility(v433._vis_state);
            end;
        end;
        v433.ref:set_callback(v433._callback_func);
        v433 = setmetatable(v433, {
            __call = function(v441, v442)
                if v442 then
                    return v441.value_by_name[v442] and true or false;
                else
                    return v441.ref;
                end;
            end
        });
        v117.ui_tables[v425][v426] = v433;
        v380.elements[#v380.elements + 1] = v433;
        return v433;
    end;
    v380.color_picker = function(v443, v444, v445, v446, v447, v448)
        -- upvalues: v117 (ref), v380 (ref)
        local v449 = v443.ref:color_picker(v446, v447);
        local v450 = v448 and v448 or function()
            return true;
        end;
        local v451 = v117.get_default_ui_el_table(v380, v444, v445, v449, v450);
        v451.type = 5;
        v451.def_value = v447;
        v451.value = v449:get();
        v451 = setmetatable(v451, {
            __call = function(v452, v453)
                if v453 then
                    return v452.ref;
                else
                    return v452.ref;
                end;
            end
        });
        v117.ui_tables[v444][v445] = v451;
        v380.elements[#v380.elements + 1] = v451;
        return v451;
    end;
    v380.button = function(v454, v455, v456, v457, v458, v459, v460)
        -- upvalues: v117 (ref), v380 (ref)
        local v461 = v454.ref:button(v457, v458 and v458 or function()

        end, v459 and v459 or false);
        local v462 = v460 and v460 or function()
            return true;
        end;
        local v463 = v117.get_default_ui_el_table(v380, v455, v456, v461, v462);
        v463.type = 6;
        v463 = setmetatable(v463, {
            __call = function(v464, v465)
                if v465 then
                    return v464.ref;
                else
                    return v464.ref;
                end;
            end
        });
        v117.ui_tables[v455][v456] = v463;
        v380.elements[#v380.elements + 1] = v463;
        return v463;
    end;
    v380.hotkey = function(v466, v467, v468, v469, v470, v471, v472)
        -- upvalues: v117 (ref), v380 (ref)
        local v473 = v466.ref:hotkey(v469, v470);
        local v474 = v472 and v472 or function()
            return true;
        end;
        local v475 = v117.get_default_ui_el_table(v380, v467, v468, v473, v474);
        v475.type = 7;
        v475.def_value = v470;
        v475.key = function(v476, v477)
            if not v477 then
                return v476.ref:key();
            else
                v476.ref:key(v477);
                return;
            end;
        end;
        v475.ref:unset_callback(v475._callback_func);
        v475._holding = false;
        v475.mode = v471;
        if v471 == 1 then
            v475._createmove_func = function()
                -- upvalues: v475 (ref)
                v475._holding = v475.ref:get();
                v475.value = v475._holding;
                if v475._holding then
                    local l_callbacks_funcs_3 = v475.callbacks_funcs;
                    for v479 = 1, #l_callbacks_funcs_3 do
                        l_callbacks_funcs_3[v479]();
                    end;
                end;
            end;
        else
            v475._prev_state = false;
            v475._createmove_func = function()
                -- upvalues: v475 (ref)
                v475._holding = v475.ref:get();
                if not v475._holding and v475._prev_state then
                    v475.value = not v475.value;
                    local l_callbacks_funcs_4 = v475.callbacks_funcs;
                    for v481 = 1, #l_callbacks_funcs_4 do
                        l_callbacks_funcs_4[v481]();
                    end;
                end;
                v475._prev_state = v475._holding;
            end;
        end;
        events.createmove:set(v475._createmove_func);
        v475.callbacks_funcs = {};
        v475.set_callback = function(v482, v483, v484)
            v482.callbacks_funcs[#v482.callbacks_funcs + 1] = v483;
            if v484 then
                v483();
            end;
        end;
        v475.unset_callback = function(v485, v486)
            for v487 = 1, #v485.callbacks_funcs do
                if v485.callbacks_funcs[v487] == v486 then
                    table.remove(v485.callbacks_funcs, v487);
                    break;
                end;
            end;
        end;
        v475 = setmetatable(v475, {
            __call = function(v488, v489)
                if v489 then
                    return v488.ref;
                else
                    return v488.ref;
                end;
            end
        });
        v117.ui_tables[v467][v468] = v475;
        v380.elements[#v380.elements + 1] = v475;
        return v475;
    end;
    v380.text_box = function(v490, v491, v492, v493, v494, v495)
        -- upvalues: v117 (ref), v380 (ref)
        local v496 = v490.ref:input(v493, v494);
        local v497 = v495 and v495 or function()
            return true;
        end;
        local v498 = v117.get_default_ui_el_table(v380, v491, v492, v496, v497);
        v498.type = 8;
        v498.def_value = v494;
        v498.value = v496:get();
        v498 = setmetatable(v498, {
            __call = function(v499, v500)
                if v500 then
                    return v499.ref;
                else
                    return v499.ref;
                end;
            end
        });
        v117.ui_tables[v491][v492] = v498;
        v380.elements[#v380.elements + 1] = v498;
        return v498;
    end;
    v380.list = function(v501, v502, v503, v504, v505, v506, v507)
        -- upvalues: v117 (ref), v380 (ref)
        local v508 = v501.ref:list(v504, v505);
        local v509 = v507 and v507 or function()
            return true;
        end;
        local v510 = v117.get_default_ui_el_table(v380, v502, v503, v508, v509);
        v510.type = 9;
        v510.def_value = v506;
        v510.elements_array = v505;
        v510.list_by_name = {};
        for v511 = 1, #v505 do
            v510.list_by_name[v505[v511]] = v511;
        end;
        v510.value = v508:get();
        v510.str_value = v510.elements_array[v510.value];
        v510.ref:unset_callback(v510._callback_func);
        v510._callback_func = function(v512)
            -- upvalues: v510 (ref), v117 (ref), v502 (ref), v503 (ref)
            local v513 = v510.ref:get();
            v510.value = v513;
            v510.str_value = v510.elements_array[v513];
            v510.value_for_ref = v513;
            v117.values[v502][v503] = v513;
            local v514 = v510._vis_func();
            if v510.group_table._vis_func and v514 then
                v514 = v510.group_table._vis_func();
            end;
            if v512 then
                for v515 = 1, #v510._callbacks_list do
                    v510._callbacks_list[v515]();
                end;
            end;
            if v512 and v117.is_loaded then
                v510.group_table:update();
            end;
            if v510._vis_state ~= v514 then
                v510.ref:visibility(v510._vis_state);
            end;
        end;
        v510.ref:set_callback(v510._callback_func);
        v510.change_default_callback_function = function(v516, v517)
            -- upvalues: v510 (ref)
            v516.ref:unset_callback(v510._callback_func);
            v516.ref:set_callback(v517, true);
            return v517;
        end;
        v510.update = function(v518, v519)
            v518.elements_array = v519;
            v518.ref:update(v519);
        end;
        v510.visualize_update = function(v520)
            if v520.func_visualize then
                v520.func_visualize();
            end;
        end;
        v510 = setmetatable(v510, {
            __call = function(v521)
                return v521.ref;
            end
        });
        v117.ui_tables[v502][v503] = v510;
        v380.elements[#v380.elements + 1] = v510;
        return v510;
    end;
    v380.listable = function(v522, v523, v524, v525, v526, v527, v528)
        -- upvalues: v117 (ref), v380 (ref)
        local v529 = v522.ref:listable(v525, v526);
        local v530 = v528 and v528 or function()
            return true;
        end;
        local v531 = v117.get_default_ui_el_table(v380, v523, v524, v529, v530);
        v531.type = 4;
        v531.def_value = v527;
        v531.elements_array = v526;
        v531.list_by_name = {};
        for v532 = 1, #v526 do
            v531.list_by_name[v526[v532]] = v532;
        end;
        v531.value = v529:get();
        v531.value_by_name = {};
        for v533 = 1, #v531.value do
            v531.value_by_name[v531.value[v533]] = true;
        end;
        v531.ref:unset_callback(v531._callback_func);
        v531._callback_func = function(v534)
            -- upvalues: v531 (ref), v117 (ref), v523 (ref), v524 (ref)
            local v535 = v531.ref:get();
            v531.value = v535;
            v531.value_for_ref = v535;
            v531.value_by_name = {};
            for v536 = 1, #v535 do
                v531.value_by_name[v535[v536]] = true;
            end;
            v117.values[v523][v524] = v535;
            if v531._vis_func() ~= v531._vis_state then
                v531.ref:visibility(v531._vis_state);
            end;
            if v534 and v117.is_loaded then
                v531.group_table:update();
            end;
        end;
        v531.ref:set_callback(v531._callback_func);
        v531 = setmetatable(v531, {
            __call = function(v537, v538)
                if v538 then
                    return v537.value_by_name[v538] and true or false;
                else
                    return v537.ref;
                end;
            end
        });
        v117.ui_tables[v523][v524] = v531;
        v380.elements[#v380.elements + 1] = v531;
        return v531;
    end;
    v380.label = function(v539, v540, v541, v542, v543)
        -- upvalues: v117 (ref), v380 (ref)
        local v544 = v539.ref:label(v542);
        local v545 = v543 and v543 or function()
            return true;
        end;
        local v546 = v117.get_default_ui_el_table(v380, v540, v541, v544, v545);
        v546.type = 6;
        v546.ref:unset_callback(v546._callback_func);
        v546 = setmetatable(v546, {
            __call = function(v547, v548)
                if v548 then
                    return v547.ref;
                else
                    return v547.ref;
                end;
            end
        });
        v117.ui_tables[v540][v541] = v546;
        v380.elements[#v380.elements + 1] = v546;
        return v546;
    end;
    v116[#v116 + 1] = v380;
    return v380;
end;
v117.update_all_groups = function()
    -- upvalues: v116 (ref)
    for v549 = 1, #v116 do
        v116[v549]:update();
    end;
end;
v117.active_tab = "\a{Link Active}\239\158\138\aDEFAULT Home";
local v550 = {
    information = v117.create_group("Discord", 2)
};
v550.information:button("config", "discord_join", "          \a{Link Active}\239\142\146 \aDEFAULTServer           ", nil, true):set_callback(function()
    -- upvalues: v92 (ref)
    v92.shell_execute("open", "https://discord.gg/wA9ukZTyZz");
end);
v550.information:button("config", "discord_code", "          \a{Link Active}\239\138\187 \aDEFAULTCode            ", nil, true):set_callback(function()
    -- upvalues: v9 (ref), v96 (ref)
    local v551 = common.get_username();
    local v552 = "";
    local v553 = "extensioncheck";
    local _ = 1;
    local v555 = 0;
    local v556 = "ulJkLANdgIcnwO79yRz6VBS8ZXQKfPv3HYejMFtmoWpb0s2xq1GEhC5aTri4U=+/!@#$%^&*(){}~. ";
    for v557 = 1, #v553 do
        local v558 = v551:sub(v557, v557);
        v552 = v552 .. v558;
        local v559 = nil;
        for v560 = 1, #v556 do
            if v556:sub(v560, v560) == v558 then
                v559 = v560;
                break;
            end;
        end;
        if v557 <= #v551 and v559 then
            local v561 = v555 + v559;
            if v561 then
                v555 = v561;
            end;
        end;
        v558 = v553:sub(v557, v557);
        v552 = v552 .. v558;
        v559 = v556:find(v558);
        if v559 then
            local v562 = v555 + v559;
            if v562 then
                v555 = v562;
            end;
        end;
    end;
    v9("1.Create ticket in discord server");
    v9("2.Paste text below in ticket");
    v9("!verify " .. v96.encode(v552 .. "|" .. v555));
    common.add_notify("Extension", "Check instructions in console for discord verification");
end);
v117.ui_tables.config.discord_code:set_disable_function(function()
    -- upvalues: v1 (ref)
    return v1;
end);
v550.our_products = v117.create_group("Our Products", 2);
v550.our_products:label("products", "", "\a{Link Active}\238\132\163\t\aDEFAULTDeveloper Config");
v550.our_products:button("products", "misnik_config", "     \239\131\129     ", nil):set_callback(function()
    -- upvalues: v92 (ref)
    v92.shell_execute("open", "https://en.neverlose.cc/market/item?id=4jLkyO");
end);
v550.our_products:label("products", "", "\a{Link Active} \239\131\167\t\aDEFAULTDacota Config");
v550.our_products:button("products", "dacota_config", "     \239\131\129     ", nil):set_callback(function()
    -- upvalues: v92 (ref)
    v92.shell_execute("open", "https://neverlose.cc/market/item?id=hkSeFK");
end);
if v1 then
    v550.our_products:label("products", "", "\a{Link Active}\238\132\163\t\aDEFAULTExtension lua");
    v550.our_products:button("products", "misnik_config", "     \239\131\129     ", nil):set_callback(function()
        -- upvalues: v92 (ref)
        v92.shell_execute("open", "https://en.neverlose.cc/market/item?id=bkRCJa");
    end);
end;
v550.create_config = v117.create_group(" Configs \a{Switch}\239\131\154 \a{Link Active}Create", 1);
v550.create_config:disabled_condition(function()
    -- upvalues: v1 (ref), v0 (ref)
    return v1 and v0.trial_cache_1 - common.get_unixtime() < 0;
end);
v550.create_config:button("config", "create", "       \239\145\183       ", nil);
v117.ui_tables.config.create:tooltip("Create new config");
v117.ui_tables.config.create.is_creating = false;
v117.ui_tables.config.create.restore_to_default = function()
    -- upvalues: v117 (ref)
    v117.ui_tables.config.create:name("       \239\145\183       ");
    v117.ui_tables.config.create:tooltip("Create new Config");
end;
v550.create_config:button("config", "create_empty", "  \239\133\156  ", nil, true);
v117.ui_tables.config.create_empty:tooltip("  \239\133\156 - Creates config and saving current lua settings in new file.\n\n  \239\133\155 - Creates empty config.");
v117.ui_tables.config.create_empty:set_callback(function()
    -- upvalues: v117 (ref)
    v117.ui_tables.config.create_empty.is_empty = not v117.ui_tables.config.create_empty.is_empty;
    v117.ui_tables.config.create_empty:name(v117.ui_tables.config.create_empty.is_empty and "  \239\133\155  " or "  \239\133\156  ");
end);
v117.ui_tables.config.create_empty:disabled(true);
v550.create_config:button("config", "config_from_clipboard", " \239\149\175  ", nil, true):tooltip("Paste config from clipboard.");
v550.create_config:label("config", "text_box_name", "Enter Config Name", function()
    -- upvalues: v117 (ref)
    return v117.ui_tables.config.create.is_creating;
end);
v550.create_config:text_box("config", "new_config_name", "", "", function()
    -- upvalues: v117 (ref)
    return v117.ui_tables.config.create.is_creating;
end):tooltip("Config name can`t be empty.");
v550.create_config:text_box("config", "active_config", "", "", function()
    return false;
end);
v550.create_config:text_box("config", "activeaa_config", "", "", function()
    return false;
end);
v550.create_config:text_box("config", "antiaim_owner", "", "", function()
    return false;
end);
v117.ui_tables.config.config_from_clipboard.restore_to_default = function()
    -- upvalues: v117 (ref)
    v117.ui_tables.config.config_from_clipboard:name(" \239\149\175  ");
    v117.ui_tables.config.config_from_clipboard:tooltip("Paste config from clipboard.");
end;
v550.config = v117.create_group(" Configs \a{Switch}\239\131\154 \a{Link Active}List", 1);
v550.config:list("config", "list", "", v39.get_config_list());
v550.config:button("config", "load", "       \239\141\130       ", nil):tooltip("Load config");
v550.config:button("config", "load_aa", "  \239\132\178  ", nil, true):tooltip("Load only Anti Aim settings");
v550.config:button("config", "lock", "  \a68e35bFF\239\143\129  ", nil, true):tooltip("\adb6361FF  \239\140\141\aDEFAULT - Anti Aim settings is hidden for other users but you can change it.\n\n\adb6361FF  \239\128\163\aDEFAULT - Anti Aim settings is hidden for you. You can`t save Anti Aim in other config. \n\n\a68e35bFF  \239\143\130\aDEFAULT - Anti Aim settings is not hidden for other users but you can change it.\n\n\a68e35bFF  \239\143\129\aDEFAULT - Anti Aim settings is not hidden for you.");
v550.config:button("config", "save", "  \239\131\135  ", nil, true):tooltip("Save config");
v550.config:button("config", "share", "  \239\149\174 ", nil, true):tooltip("Copy config to clipboard");
v550.config:button("config", "delete", "  \adb6361FF\239\135\184  ", nil, true):tooltip("Delete config");
if common.get_username() == "Misnik" then
    v550.config:button("config", "make_preset", "       \239\145\183       ", nil, true):tooltip("Make Preset");
    v550.config:button("config", "get_config_deobf", "       \239\149\130       ", nil, true):tooltip("Get Config deobf");
end;
v117.ui_tables.config.load_aa.restore_to_default = function()
    -- upvalues: v117 (ref)
    v117.ui_tables.config.load_aa:name("  \239\132\178  ");
    v117.ui_tables.config.load_aa:tooltip("Load only Anti Aim settings");
end;
v117.ui_tables.config.load.restore_to_default = function()
    -- upvalues: v117 (ref)
    v117.ui_tables.config.load:name("       \239\141\130       ");
    v117.ui_tables.config.load:tooltip("Load config");
end;
v117.ui_tables.config.save.restore_to_default = function()
    -- upvalues: v117 (ref)
    v117.ui_tables.config.save:name("  \239\131\135  ");
    v117.ui_tables.config.save:tooltip("Save config");
end;
v117.ui_tables.config.delete.restore_to_default = function()
    -- upvalues: v117 (ref)
    v117.ui_tables.config.delete:name("  \adb6361FF\239\135\184  ");
    v117.ui_tables.config.delete:tooltip("Delete config");
end;
v117.ui_tables.config.share.restore_to_default = function()
    -- upvalues: v117 (ref)
    v117.ui_tables.config.share:name("  \239\149\174 ");
    v117.ui_tables.config.share:tooltip("Copy config to clipboard");
end;
v117.ui_tables.config.list.update_active_config = function()
    -- upvalues: v117 (ref)
    local l_list_0 = v117.ui_tables.config.list;
    local v564 = {};
    for v565 = 1, #l_list_0.elements_array do
        local v566 = "     \a4f4f4fFF" .. l_list_0.elements_array[v565];
        if v565 == l_list_0.value then
            v566 = "     \a919191FF" .. l_list_0.elements_array[v565];
        end;
        if v117.ui_tables.config.active_config.ref:get() == l_list_0.elements_array[v565] then
            v566 = "\a{Link Active}\226\128\162   \aDEFAULT" .. l_list_0.elements_array[v565];
        end;
        if v117.ui_tables.config.activeaa_config.ref:get() == l_list_0.elements_array[v565] then
            v566 = "\aFBCEB1FF\226\128\162   \aDEFAULT" .. l_list_0.elements_array[v565];
        end;
        v564[#v564 + 1] = v566;
    end;
    l_list_0.ref:update(v564);
end;
v117.ui_tables.config.list:set_callback(function()
    -- upvalues: v117 (ref), v0 (ref)
    v117.ui_tables.config.list.update_active_config();
    local v567 = v117.ui_tables.config.list.str_value == "Default";
    if v0.configs[v117.ui_tables.config.list.value - 1] then
        local v568 = v0.configs[v117.ui_tables.config.list.value - 1].author == common.get_username();
        local v569 = v568 and "  \adb6361FF\239\140\141  " or "  \adb6361FF\239\128\163  ";
        local v570 = v568 and "  \a68e35bFF\239\143\130 " or "  \a68e35bFF\239\143\129 ";
        v117.ui_tables.config.lock:name(v0.configs[v117.ui_tables.config.list.value - 1].is_locked and v569 or v570);
        v117.ui_tables.config.lock:tooltip("\adb6361FF  \239\140\141\aDEFAULT - Anti Aim settings is hidden for other users but you can change it.\n\n\adb6361FF  \239\128\163\aDEFAULT - Anti Aim settings is hidden for you. You can`t save Anti Aim in other config. \n\n\a68e35bFF  \239\143\130\aDEFAULT - Anti Aim settings is not hidden for other users but you can change it.\n\n\a68e35bFF  \239\143\129\aDEFAULT - Anti Aim settings is not hidden for you." .. "\n\n Config Author - " .. v0.configs[v117.ui_tables.config.list.value - 1].author);
    else
        v117.ui_tables.config.lock:name("  \a68e35bFF\239\143\129 ");
    end;
    v117.ui_tables.config.lock:disabled(v567);
    v117.ui_tables.config.save:disabled(v567);
    v117.ui_tables.config.share:disabled(v567);
    v117.ui_tables.config.delete:disabled(v567);
end, true);
v117.ui_tables.config.lock:set_callback(function()
    -- upvalues: v117 (ref), v0 (ref)
    local l_value_5 = v117.ui_tables.config.list.value;
    if l_value_5 ~= 1 and v0.configs[v117.ui_tables.config.list.value - 1].author == common.get_username() then
        v0.configs[l_value_5 - 1].is_locked = not v0.configs[l_value_5 - 1].is_locked;
        v117.ui_tables.config.lock:name(v0.configs[l_value_5 - 1].is_locked and "  \adb6361FF\239\140\141  " or "  \a68e35bFF\239\143\130 ");
        db.escape_from_samara_extension = v0;
    end;
end);
v117.ui_tables.config.load:set_callback(function()
    -- upvalues: v117 (ref)
    if v117.ui_tables.config.load:name() == "       \a82ff88FF\238\150\160     " or v117.ui_tables.config.load:name() == "       \adb6361FF\238\150\160     " then
        return;
    else
        v117.ui_tables.config.active_config.ref:set(v117.ui_tables.config.list.str_value);
        v117.ui_tables.config.activeaa_config.ref:set("");
        v117.ui_tables.config.list.update_active_config();
        return;
    end;
end);
v39.add_config = function()
    -- upvalues: v117 (ref), v0 (ref), v39 (ref)
    local v572 = v117.ui_tables.config.new_config_name.ref:get();
    if #v572 == 0 or v572 == "Default" then
        return false, "Config name must be filled.";
    else
        for v573 = 1, #v0.configs do
            if v0.configs[v573].name == v572 then
                return false, "Config name is already used.";
            end;
        end;
        local v574 = false;
        if v117.ui_tables.config.antiaim_owner.value ~= "" then
            v574 = not v117.ui_tables.config.create_empty.is_empty;
        end;
        table.insert(v0.configs, 1, {
            name = v572, 
            author = common.get_username(), 
            is_locked = v574, 
            data = v117.ui_tables.config.create_empty.is_empty and {} or v39.parse_data()
        });
        db.escape_from_samara_extension = v0;
        return true;
    end;
end;
v117.ui_tables.config.create:set_callback(function()
    -- upvalues: v117 (ref), v39 (ref)
    if v117.ui_tables.config.create:name() == "       \a82ff88FF\238\150\160     " or v117.ui_tables.config.create:name() == "       \affb0b0FF\239\140\154       " then
        return;
    else
        v117.ui_tables.config.create.is_creating = not v117.ui_tables.config.create.is_creating;
        local l_is_creating_0 = v117.ui_tables.config.create.is_creating;
        v117.ui_tables.config.create:name(l_is_creating_0 and "       \239\140\156     " or "       \239\145\183       ");
        v117.ui_tables.config.create_empty:disabled(not l_is_creating_0);
        if not l_is_creating_0 then
            local v576, v577 = v39.add_config();
            if v576 then
                v117.ui_tables.config.create:name("       \a82ff88FF\238\150\160     ");
                v117.ui_tables.config.create:tooltip("\a82ff88FFConfig Successfully created.");
                utils.execute_after(2, function()
                    -- upvalues: v117 (ref)
                    v117.ui_tables.config.create.restore_to_default();
                end);
                v117.ui_tables.config.list:update(v39.get_config_list());
                v117.ui_tables.config.list.update_active_config();
                v117.ui_tables.config.list._callback_func(v117.ui_tables.config.list.ref);
            else
                v117.ui_tables.config.create:name("       \affb0b0FF\239\140\154       ");
                v117.ui_tables.config.create:tooltip("\affb0b0FF" .. v577);
                utils.execute_after(2, function()
                    -- upvalues: v117 (ref)
                    v117.ui_tables.config.create.restore_to_default();
                end);
            end;
            v117.ui_tables.config.new_config_name.ref:set("");
        end;
        v117.ui_tables.config.config_from_clipboard:disabled(l_is_creating_0);
        return;
    end;
end);
v39.remove_config = function()
    -- upvalues: v117 (ref), v0 (ref)
    local v578 = v117.ui_tables.config.list.ref:get();
    if v578 == 1 then
        return false;
    else
        if v117.ui_tables.config.active_config.ref:get() == v0.configs[v578 - 1].name then
            v117.ui_tables.config.active_config.ref:set("");
        end;
        if v117.ui_tables.config.activeaa_config.ref:get() == v0.configs[v578 - 1].name then
            v117.ui_tables.config.activeaa_config.ref:set("");
        end;
        table.remove(v0.configs, v578 - 1);
        db.escape_from_samara_extension = v0;
        return true;
    end;
end;
v39.parse_data = function(v579)
    -- upvalues: v117 (ref)
    local v580 = {};
    local v581 = false;
    if v117.ui_tables.config.antiaim_owner.value == "" or v117.ui_tables.config.antiaim_owner.value == common.get_username() then
        v581 = true;
    end;
    local v582 = {
        ragebot = true, 
        visuals = true, 
        misc = true, 
        antiaim = v581
    };
    local v583 = {
        [1] = nil, 
        [2] = nil, 
        [3] = nil, 
        [4] = nil, 
        [5] = nil, 
        [6] = true, 
        [7] = true, 
        [8] = true, 
        [11] = true
    };
    for v584, v585 in pairs(v117.ui_tables) do
        if v582[v584] then
            local v586 = {};
            for v587, v588 in pairs(v585) do
                if not v583[v588.type] then
                    if v588.type == 5 then
                        if type(v588.value_for_ref) ~= "string" then
                            local v589 = {
                                v588.value_for_ref:unpack()
                            };
                            v586[v587] = {
                                r = v589[1], 
                                g = v589[2], 
                                b = v589[3], 
                                a = v589[4]
                            };
                        else
                            v586[v587] = value;
                        end;
                    elseif v579 then
                        if v587:find("def_pitch") then
                            v586[v587] = v588.str_value;
                        else
                            v586[v587] = v588.value;
                        end;
                    else
                        v586[v587] = v588.value_for_ref;
                    end;
                end;
            end;
            v580[v584] = v586;
        end;
    end;
    return v580;
end;
v117.ui_tables.config.load:set_callback(function()
    -- upvalues: v117 (ref), v0 (ref)
    if v117.ui_tables.config.load:name() == "       \a82ff88FF\238\150\160     " or v117.ui_tables.config.load:name() == "       \adb6361FF\238\150\160     " then
        return;
    else
        local l_value_6 = v117.ui_tables.config.list.value;
        local v591 = l_value_6 == 1 and v0.configs.Default or v0.configs[l_value_6 - 1];
        if not v591 or not v591.data then
            v117.ui_tables.config.load:name("       \adb6361FF\239\140\154     ");
            v117.ui_tables.config.load:tooltip("\adb6361FFConfig loading failed.");
            utils.execute_after(2, function()
                -- upvalues: v117 (ref)
                v117.ui_tables.config.load.restore_to_default();
            end);
            return;
        else
            local v592 = {
                [1] = "ragebot", 
                [2] = "visuals", 
                [3] = "misc", 
                [4] = "antiaim"
            };
            local v593 = 0;
            for _, _ in pairs(v591.data) do
                v593 = v593 + 1;
            end;
            if v593 ~= 0 then
                for v596, v597 in pairs(v591.data) do
                    for v598, v599 in pairs(v597) do
                        if v117.ui_tables[v596][v598] then
                            if v117.ui_tables[v596][v598].type == 5 then
                                if type(v599) ~= "string" then
                                    v117.ui_tables[v596][v598].ref:set(color(v599.r, v599.g, v599.b, v599.a));
                                else
                                    v117.ui_tables[v596][v598].ref:set(v599);
                                end;
                            else
                                v117.ui_tables[v596][v598].ref:set(v599);
                            end;
                        end;
                    end;
                end;
                if not v591.data.antiaim then
                    for _, v601 in pairs(v117.ui_tables.antiaim) do
                        v601.ref:reset();
                        v601._callback_func();
                    end;
                end;
            else
                for v602 = 1, #v592 do
                    local v603 = v592[v602];
                    for _, v605 in pairs(v117.ui_tables[v603]) do
                        v605.ref:reset();
                        v605._callback_func();
                    end;
                end;
            end;
            v117.ui_tables.config.load:name("       \a82ff88FF\238\150\160     ");
            v117.ui_tables.config.load:tooltip("\a82ff88FFConfig Successfully loaded.");
            if v591.is_locked then
                v117.ui_tables.config.antiaim_owner.ref:set(v591.author);
            else
                v117.ui_tables.config.antiaim_owner.ref:set("");
            end;
            v117.update_all_groups();
            utils.execute_after(2, function()
                -- upvalues: v117 (ref)
                v117.ui_tables.config.load.restore_to_default();
            end);
            return;
        end;
    end;
end);
v117.ui_tables.config.load_aa:set_callback(function()
    -- upvalues: v117 (ref), v0 (ref)
    if v117.ui_tables.config.load:name() == "  \adb6361FF\238\137\140  " or v117.ui_tables.config.load:name() == "  \a82ff88FF\239\139\183  " then
        return;
    else
        local l_value_7 = v117.ui_tables.config.list.value;
        local v607 = l_value_7 == 1 and v0.configs.Default or v0.configs[l_value_7 - 1];
        if not v607 or not v607.data then
            v117.ui_tables.config.load_aa:name("  \adb6361FF\238\137\140  ");
            v117.ui_tables.config.load_aa:tooltip("\adb6361FFConfig Antiaim loading failed.");
            utils.execute_after(2, function()
                -- upvalues: v117 (ref)
                v117.ui_tables.config.load_aa.restore_to_default();
            end);
            return;
        else
            if v607.data.antiaim then
                for v608, v609 in pairs(v607.data.antiaim) do
                    if v117.ui_tables.antiaim[v608] then
                        if v117.ui_tables.antiaim[v608].type == 5 then
                            if type(v609) ~= "string" then
                                v117.ui_tables.antiaim[v608].ref:set(color(v609.r, v609.g, v609.b, v609.a));
                            else
                                v117.ui_tables.antiaim[v608].ref:set(v609);
                            end;
                        else
                            v117.ui_tables.antiaim[v608].ref:set(v609);
                        end;
                    end;
                end;
            else
                for _, v611 in pairs(v117.ui_tables.antiaim) do
                    v611.ref:reset();
                    v611._callback_func();
                end;
            end;
            v117.ui_tables.config.load_aa:name("  \a82ff88FF\239\139\183  ");
            v117.ui_tables.config.load_aa:tooltip("\a82ff88FFConfig Antiaim loading successfully.");
            if v117.ui_tables.config.active_config.ref:get() ~= v607.name then
                v117.ui_tables.config.activeaa_config.ref:set(v117.ui_tables.config.list.str_value);
            else
                v117.ui_tables.config.activeaa_config.ref:set("");
            end;
            v117.ui_tables.config.list.update_active_config();
            if v607.is_locked then
                v117.ui_tables.config.antiaim_owner.ref:set(v0.configs[v117.ui_tables.config.list.value - 1].author);
            else
                v117.ui_tables.config.antiaim_owner.ref:set("");
            end;
            v117.update_all_groups();
            utils.execute_after(2, function()
                -- upvalues: v117 (ref)
                v117.ui_tables.config.load_aa.restore_to_default();
            end);
            return;
        end;
    end;
end);
v117.ui_tables.config.save:set_callback(function()
    -- upvalues: v117 (ref), v0 (ref), v39 (ref)
    if v117.ui_tables.config.save:name() == "  \a82ff88FF\238\134\130 " then
        return;
    else
        local v612 = v117.ui_tables.config.list.ref:get();
        if v612 == 1 then
            return false;
        else
            v0.configs[v612 - 1].data = v39.parse_data();
            db.escape_from_samara_extension = v0;
            v117.ui_tables.config.save:name("  \a82ff88FF\238\134\130 ");
            v117.ui_tables.config.save:tooltip("\a82ff88FFConfig Successfully saved.");
            utils.execute_after(2, function()
                -- upvalues: v117 (ref)
                v117.ui_tables.config.save.restore_to_default();
            end);
            return true;
        end;
    end;
end);
if v117.ui_tables.config.make_preset then
    v117.ui_tables.config.make_preset:set_callback(function()
        -- upvalues: v117 (ref), v39 (ref), v9 (ref)
        if v117.ui_tables.config.save:name() == "  \a82ff88FF\238\134\130 " then
            return;
        elseif v117.ui_tables.config.list.ref:get() == 1 then
            return false;
        else
            local v613 = v39.parse_data(true);
            v9(json.stringify(v613.antiaim));
            return true;
        end;
    end);
end;
v117.ui_tables.config.delete:set_callback(function()
    -- upvalues: v117 (ref), v39 (ref)
    if v117.ui_tables.config.delete:name() == "  \adb6361FF\238\138\180\aDEFAULT ?" then
        if v39.remove_config() then
            v117.ui_tables.config.delete.restore_to_default();
            v117.ui_tables.config.list:update(v39.get_config_list());
            v117.ui_tables.config.list.update_active_config();
            v117.ui_tables.config.list._callback_func(v117.ui_tables.config.list.ref);
            v117.ui_tables.config.list.ref:set(v117.ui_tables.config.list.ref:get() - 1);
        end;
        v117.ui_tables.config.delete:name("  \adb6361FF\238\138\175  ");
        utils.execute_after(2, function()
            -- upvalues: v117 (ref)
            if v117.ui_tables.config.delete:name() ~= "  \adb6361FF\238\138\175  " then
                return;
            else
                v117.ui_tables.config.delete.restore_to_default();
                return;
            end;
        end);
        return;
    else
        utils.execute_after(2, function()
            -- upvalues: v117 (ref)
            if v117.ui_tables.config.delete:name() ~= "  \adb6361FF\238\138\180\aDEFAULT ?" then
                return;
            else
                v117.ui_tables.config.delete.restore_to_default();
                return;
            end;
        end);
        v117.ui_tables.config.delete:name("  \adb6361FF\238\138\180\aDEFAULT ?");
        return;
    end;
end);
v117.ui_tables.config.share:set_callback(function()
    -- upvalues: v117 (ref), v96 (ref), v0 (ref), v92 (ref)
    if v117.ui_tables.config.share:name() == "  \a82ff88FF\238\150\160  " then
        return;
    else
        local l_value_8 = v117.ui_tables.config.list.value;
        local v615 = "ext.config = " .. v96.encode(json.stringify(v0.configs[l_value_8 - 1] or not v0.configs[l_value_8 - 1])) .. "<end>";
        v92.set_clipboard_text(v615, #v615);
        v117.ui_tables.config.share:name("  \a82ff88FF\238\150\160  ");
        v117.ui_tables.config.share:tooltip("\a82ff88FFConfig successfully copied to clipboard.");
        utils.execute_after(2, function()
            -- upvalues: v117 (ref)
            v117.ui_tables.config.share.restore_to_default();
        end);
        return;
    end;
end);
if v117.ui_tables.config.get_config_deobf then
    v117.ui_tables.config.get_config_deobf:set_callback(function()
        -- upvalues: v117 (ref), v0 (ref), v92 (ref)
        local l_value_9 = v117.ui_tables.config.list.value;
        local v617 = json.stringify(v0.configs[l_value_9 - 1] or not v0.configs[l_value_9 - 1]);
        v92.set_clipboard_text(v617, #v617);
    end);
end;
v117.ui_tables.config.config_from_clipboard:set_callback(function()
    -- upvalues: v117 (ref), v92 (ref), v96 (ref), v0 (ref), v39 (ref)
    if v117.ui_tables.config.config_from_clipboard:name() == "  \adb6361FF\239\140\154  " then
        return;
    else
        local v618 = v92.get_clipboard_text();
        v618 = string.match(v618, "(ext%.config%s=%s.-<end>)");
        if not v618 or #v618 == 0 then
            v117.ui_tables.config.config_from_clipboard:name("  \adb6361FF\239\140\154  ");
            v117.ui_tables.config.config_from_clipboard:tooltip("\adb6361FFConfig loading failed.");
            utils.execute_after(2, function()
                -- upvalues: v117 (ref)
                v117.ui_tables.config.config_from_clipboard.restore_to_default();
            end);
            return;
        else
            local _, v620 = v618:find("ext.config = ");
            if not v620 then
                v117.ui_tables.config.config_from_clipboard:name("  \adb6361FF\239\140\154  ");
                v117.ui_tables.config.config_from_clipboard:tooltip("\adb6361FFMissing config start point.");
                utils.execute_after(2, function()
                    -- upvalues: v117 (ref)
                    v117.ui_tables.config.config_from_clipboard.restore_to_default();
                end);
                return;
            else
                local v621 = v618:find("<end>");
                if not v621 then
                    v117.ui_tables.config.config_from_clipboard:name("  \adb6361FF\239\140\154  ");
                    v117.ui_tables.config.config_from_clipboard:tooltip("\adb6361FFMissing config end point.");
                    utils.execute_after(2, function()
                        -- upvalues: v117 (ref)
                        v117.ui_tables.config.config_from_clipboard.restore_to_default();
                    end);
                    return;
                else
                    v618 = v618:sub(v620, v621 - 1);
                    local v622, v623 = v96.pcall_func(v618);
                    if not v622 then
                        v117.ui_tables.config.config_from_clipboard:name("  \adb6361FF\239\140\154  ");
                        v117.ui_tables.config.config_from_clipboard:tooltip("\adb6361FFConfig decode failed.");
                        utils.execute_after(2, function()
                            -- upvalues: v117 (ref)
                            v117.ui_tables.config.config_from_clipboard.restore_to_default();
                        end);
                        return;
                    else
                        local l_name_0 = v623.name;
                        for v625 = 1, #v0.configs do
                            if v0.configs[v625].name == v623.name then
                                local v626 = 1;
                                repeat
                                    local v627 = true;
                                    local v628 = l_name_0 .. " #" .. v626;
                                    v626 = v626 + 1;
                                    for v629 = 1, #v0.configs do
                                        if v628 == v0.configs[v629].name then
                                            v627 = false;
                                            break;
                                        end;
                                    end;
                                    if v627 then
                                        l_name_0 = v628;
                                    end;
                                until v627;
                            end;
                        end;
                        v623.name = l_name_0;
                        table.insert(v0.configs, 1, v623);
                        db.escape_from_samara_extension = v0;
                        v117.ui_tables.config.config_from_clipboard:name("  \a82ff88FF\238\150\160  ");
                        v117.ui_tables.config.config_from_clipboard:tooltip("\a82ff88FFConfig successfully copied to clipboard.");
                        v117.ui_tables.config.list:update(v39.get_config_list());
                        v117.ui_tables.config.list.update_active_config();
                        v117.ui_tables.config.list._callback_func(v117.ui_tables.config.list.ref);
                        utils.execute_after(2, function()
                            -- upvalues: v117 (ref)
                            v117.ui_tables.config.config_from_clipboard.restore_to_default();
                        end);
                        return;
                    end;
                end;
            end;
        end;
    end;
end);
if v1 then
    v550.trial_time = v117.create_group(" Trial \a{Switch}\239\131\154 \a{Link Active}Timer", 2);
    v550.trial_time:label("config", "time_label", "Remaining time");
    v550.trial_time:button("config", "time_button", "expired", nil, true);
    if v0.trial_cache_1 - common.get_unixtime() < 0 then
        v9("trial access is expired", "Paid lua:", "https://en.neverlose.cc/market/item?id=bkRCJa");
        v117.update_all_groups();
        return;
    else
        events.render:set(function()
            -- upvalues: v0 (ref), l_floor_0 (ref), v117 (ref)
            local v630 = v0.trial_cache_1 - common.get_unixtime();
            local v631 = l_floor_0(v630 / 60 / 60);
            local v632 = l_floor_0(l_floor_0(v630 - v631 * 60 * 60) / 60);
            local v633 = l_floor_0(l_floor_0(v630 - v631 * 60 * 60 - v632 * 60));
            if v630 < -1 then
                common.reload_script();
                return;
            else
                if v630 <= 0 then
                    v117.ui_tables.config.time_button.ref:name("expired");
                else
                    v117.ui_tables.config.time_button.ref:name(v631 .. "h:" .. v632 .. "m" .. ":" .. v633 .. "s");
                end;
                return;
            end;
        end);
    end;
end;
v117.active_tab = "\a{Link Active}\239\132\178\aDEFAULT Anti Aim";
local v634 = {
    navigation = v117.create_group("Anti Aim", 1)
};
v634.navigation:list("antiaim", "list", "", {
    [1] = "Disable", 
    [2] = "Presets", 
    [3] = "Builder"
});
v117.ui_tables.antiaim.list.update_active_tab = function()
    -- upvalues: v117 (ref), v634 (ref)
    local l_list_1 = v117.ui_tables.antiaim.list;
    local v636 = {};
    local v637 = {
        [1] = "\238\137\139", 
        [2] = " \239\151\155", 
        [3] = " \239\135\158"
    };
    for v638 = 1, #l_list_1.elements_array do
        v636[#v636 + 1] = l_list_1.value == v638 and "\a{Link Active}" .. v637[v638] .. "   \aDEFAULT" .. l_list_1.elements_array[v638] or "\a{Switch}" .. v637[v638] .. "   \a4a4a4aFF" .. l_list_1.elements_array[v638];
    end;
    l_list_1.ref:update(v636);
    if v634.presets then
        v634.presets:update();
    end;
    if v634.enable then
        v634.enable:update();
    end;
    if v634.builder then
        v634.builder:update();
    end;
    if v634.additional then
        v634.additional:update();
    end;
end;
v117.ui_tables.antiaim.list:set_callback(function()
    -- upvalues: v117 (ref)
    v117.ui_tables.antiaim.list.update_active_tab();
end, true);
v634.presets = v117.create_group(" Anti Aim \a{Switch}\239\131\154 \a{Link Active}Presets", 2);
v634.presets:visible_condition(function()
    -- upvalues: v117 (ref)
    return v117.ui_tables.antiaim.list.value == 2;
end);
v634.presets:list("antiaim", "preset_list", "", {
    [1] = "Mixed", 
    [2] = "Skitter", 
    [3] = "Way", 
    [4] = "Delay", 
    [5] = "Roll"
});
v634.presets:label("antiaim", "preset_label", "\a{Link Active}\239\129\181 \aDEFAULT Preset for default gameplay");
v117.ui_tables.antiaim.preset_list.update_active_config = function()
    -- upvalues: v117 (ref)
    local l_preset_list_0 = v117.ui_tables.antiaim.preset_list;
    local v640 = {};
    for v641 = 1, #l_preset_list_0.elements_array do
        local v642 = "     \a4f4f4fFF" .. l_preset_list_0.elements_array[v641];
        if v641 == l_preset_list_0.value then
            v642 = "\a{Link Active}\226\128\162   \aDEFAULT" .. l_preset_list_0.elements_array[v641];
        end;
        v640[#v640 + 1] = v642;
        if v641 == 2 or v641 == 5 then
            v640[#v640] = v640[#v640] .. " \a4f4f4fFF- \a{Link Active}New \239\162\144";
        end;
    end;
    l_preset_list_0.ref:update(v640);
    v117.ui_tables.antiaim.preset_label.ref:name(l_preset_list_0.value == 5 and "\aff3636FF\239\129\177\aDEFAULT This anti aim can be blocked on some servers - \aff3636FFRoll Fix\aDEFAULT in server name. If your \a{Link Active}movement is broken\aDEFAULT dont use this preset or change server" or "\a{Link Active}\239\129\181 \aDEFAULT Preset for default gameplay");
end;
v117.presets = {};
v117.parse_preset = function(v643)
    local v644 = json.parse(v643);
    local v645 = {};
    for v646, v647 in pairs(v644) do
        local v648 = {};
        if type(v647) == "table" then
            v648.value_by_name = {};
            local v649 = 0;
            for _, _ in pairs(v647) do
                v649 = v649 + 1;
            end;
            if v649 ~= 0 then
                for v652 = 1, #v647 do
                    v648.value_by_name[v647[v652]] = true;
                end;
            else
                v648.value = v647;
            end;
        else
            if v647 ~= 0 then

            end;
            if v646:find("def_pitch") then
                v648.str_value = v647;
            else
                v648.value = v647;
            end;
        end;
        v645[v646] = v648;
    end;
    return v645;
end;
v117.presets.Mixed = v117.parse_preset("{\"base_compensate\":false,\"base_pitch\":1.0,\"base_yaw\":1.0,\"breaklc_always\":[],\"breaklc_extra\":[\"Condition Change\",\"Weapon Change\",\"Reloading\"],\"breaklc_ping\":[],\"def_onetapspeed1\":10.0,\"def_onetapspeed2\":20.0,\"def_onetapspeed3\":20.0,\"def_onetapspeed4\":10.0,\"def_onetapspeed51\":20.0,\"def_onetapspeed52\":20.0,\"def_onetapspeed61\":10.0,\"def_onetapspeed62\":20.0,\"def_pitch1\":\"Up\",\"def_pitch2\":\"Up\",\"def_pitch3\":\"Up\",\"def_pitch4\":\"Up\",\"def_pitch51\":\"Up\",\"def_pitch52\":\"Up\",\"def_pitch61\":\"Up\",\"def_pitch62\":\"Up\",\"def_switch1\":true,\"def_switch2\":true,\"def_switch3\":true,\"def_switch4\":false,\"def_switch51\":true,\"def_switch52\":true,\"def_switch61\":true,\"def_switch62\":true,\"def_yaw1\":3.0,\"def_yaw2\":3.0,\"def_yaw3\":3.0,\"def_yaw4\":3.0,\"def_yaw51\":3.0,\"def_yaw52\":3.0,\"def_yaw61\":3.0,\"def_yaw62\":3.0,\"def_yaw_deg1\":0.0,\"def_yaw_deg2\":0.0,\"def_yaw_deg3\":0.0,\"def_yaw_deg4\":0.0,\"def_yaw_deg51\":-112.0,\"def_yaw_deg52\":0.0,\"def_yaw_deg61\":0.0,\"def_yaw_deg62\":0.0,\"desync_freestand1\":1.0,\"desync_freestand2\":1.0,\"desync_freestand3\":1.0,\"desync_freestand4\":1.0,\"desync_freestand51\":1.0,\"desync_freestand52\":1.0,\"desync_freestand61\":1.0,\"desync_freestand62\":1.0,\"desync_l1\":0.0,\"desync_l2\":60.0,\"desync_l3\":0.0,\"desync_l4\":60.0,\"desync_l51\":0.0,\"desync_l52\":60.0,\"desync_l61\":60.0,\"desync_l62\":60.0,\"desync_mod1\":[],\"desync_mod2\":[\"Jitter\"],\"desync_mod3\":[],\"desync_mod4\":[\"Jitter\"],\"desync_mod51\":[],\"desync_mod52\":[\"Jitter\"],\"desync_mod61\":[\"Jitter\"],\"desync_mod62\":[\"Jitter\"],\"desync_r1\":0.0,\"desync_r2\":60.0,\"desync_r3\":0.0,\"desync_r4\":60.0,\"desync_r51\":0.0,\"desync_r52\":60.0,\"desync_r61\":60.0,\"desync_r62\":60.0,\"desync_switch1\":true,\"desync_switch2\":true,\"desync_switch3\":true,\"desync_switch4\":true,\"desync_switch51\":true,\"desync_switch52\":true,\"desync_switch61\":true,\"desync_switch62\":true,\"flick_delay1\":3.0,\"flick_delay2\":3.0,\"flick_delay3\":3.0,\"flick_delay4\":3.0,\"flick_delay51\":3.0,\"flick_delay52\":3.0,\"flick_delay61\":3.0,\"flick_delay62\":3.0,\"flick_yaw1\":0.0,\"flick_yaw2\":0.0,\"flick_yaw3\":0.0,\"flick_yaw4\":0.0,\"flick_yaw51\":0.0,\"flick_yaw52\":0.0,\"flick_yaw61\":0.0,\"flick_yaw62\":0.0,\"frees_dis_def\":false,\"frees_disable\":[\"In Air\"],\"frees_pitch\":2.0,\"frees_pitch_custom\":0.0,\"frees_yaw\":1.0,\"frees_yaw_onetap\":0.0,\"legitaa_custom\":0.0,\"legitaa_desync\":true,\"legitaa_freestand\":2.0,\"legitaa_mod\":[\"Jitter\"],\"legitaa_pitch\":1.0,\"legitaa_switch\":true,\"list\":3.0,\"manual_type\":1.0,\"manual_view\":1.0,\"over_cond2\":false,\"over_cond3\":false,\"over_cond4\":false,\"over_cond51\":false,\"over_cond52\":false,\"over_cond61\":false,\"over_cond62\":false,\"pitch_custom1\":0.0,\"pitch_custom2\":0.0,\"pitch_custom3\":0.0,\"pitch_custom4\":0.0,\"pitch_custom51\":0.0,\"pitch_custom52\":0.0,\"pitch_custom61\":0.0,\"pitch_custom62\":0.0,\"pitch_deg1\":0.0,\"pitch_deg2\":0.0,\"pitch_deg3\":0.0,\"pitch_deg4\":0.0,\"pitch_deg51\":0.0,\"pitch_deg52\":0.0,\"pitch_deg61\":0.0,\"pitch_deg62\":0.0,\"predict_switch\":false,\"preset_list\":4.0,\"roll_def_deg1\":0.0,\"roll_def_deg2\":0.0,\"roll_def_deg3\":0.0,\"roll_def_deg4\":0.0,\"roll_def_deg51\":0.0,\"roll_def_deg52\":0.0,\"roll_def_deg61\":0.0,\"roll_def_deg62\":0.0,\"roll_ext_deg1\":0.0,\"roll_ext_deg2\":0.0,\"roll_ext_deg3\":0.0,\"roll_ext_deg4\":0.0,\"roll_ext_deg51\":0.0,\"roll_ext_deg52\":0.0,\"roll_ext_deg61\":0.0,\"roll_ext_deg62\":0.0,\"roll_ext_pit1\":0.0,\"roll_ext_pit2\":0.0,\"roll_ext_pit3\":0.0,\"roll_ext_pit4\":0.0,\"roll_ext_pit51\":0.0,\"roll_ext_pit52\":0.0,\"roll_ext_pit61\":0.0,\"roll_ext_pit62\":0.0,\"roll_switch1\":false,\"roll_switch2\":false,\"roll_switch3\":false,\"roll_switch4\":false,\"roll_switch51\":false,\"roll_switch52\":false,\"roll_switch61\":false,\"roll_switch62\":false,\"roll_type1\":1.0,\"roll_type2\":1.0,\"roll_type3\":1.0,\"roll_type4\":1.0,\"roll_type51\":1.0,\"roll_type52\":1.0,\"roll_type61\":1.0,\"roll_type62\":1.0,\"safe_def\":true,\"safe_switch\":false,\"xway_counter1\":3.0,\"xway_counter2\":3.0,\"xway_counter3\":3.0,\"xway_counter4\":3.0,\"xway_counter51\":3.0,\"xway_counter52\":3.0,\"xway_counter61\":3.0,\"xway_counter62\":4.0,\"xway_shuffle1\":false,\"xway_shuffle2\":true,\"xway_shuffle3\":false,\"xway_shuffle4\":false,\"xway_shuffle51\":true,\"xway_shuffle52\":false,\"xway_shuffle61\":true,\"xway_shuffle62\":true,\"xway_switch1\":false,\"xway_switch2\":true,\"xway_switch3\":false,\"xway_switch4\":false,\"xway_switch51\":false,\"xway_switch52\":false,\"xway_switch61\":true,\"xway_switch62\":true,\"xway_sync1\":false,\"xway_sync2\":false,\"xway_sync3\":false,\"xway_sync4\":false,\"xway_sync51\":false,\"xway_sync52\":false,\"xway_sync61\":false,\"xway_sync62\":true,\"xwayn_11\":0.0,\"xwayn_12\":0.0,\"xwayn_13\":0.0,\"xwayn_14\":0.0,\"xwayn_15\":0.0,\"xwayn_16\":0.0,\"xwayn_17\":0.0,\"xwayn_21\":-36.0,\"xwayn_22\":33.0,\"xwayn_23\":-16.0,\"xwayn_24\":0.0,\"xwayn_25\":0.0,\"xwayn_26\":0.0,\"xwayn_27\":0.0,\"xwayn_31\":0.0,\"xwayn_32\":0.0,\"xwayn_33\":0.0,\"xwayn_34\":0.0,\"xwayn_35\":0.0,\"xwayn_36\":0.0,\"xwayn_37\":0.0,\"xwayn_41\":0.0,\"xwayn_42\":0.0,\"xwayn_43\":0.0,\"xwayn_44\":0.0,\"xwayn_45\":0.0,\"xwayn_46\":0.0,\"xwayn_47\":0.0,\"xwayn_511\":0.0,\"xwayn_512\":0.0,\"xwayn_513\":0.0,\"xwayn_514\":0.0,\"xwayn_515\":0.0,\"xwayn_516\":0.0,\"xwayn_517\":0.0,\"xwayn_521\":0.0,\"xwayn_522\":0.0,\"xwayn_523\":0.0,\"xwayn_524\":0.0,\"xwayn_525\":0.0,\"xwayn_526\":0.0,\"xwayn_527\":0.0,\"xwayn_611\":-29.0,\"xwayn_612\":24.0,\"xwayn_613\":-16.0,\"xwayn_614\":0.0,\"xwayn_615\":0.0,\"xwayn_616\":0.0,\"xwayn_617\":0.0,\"xwayn_621\":-33.0,\"xwayn_622\":32.0,\"xwayn_623\":-27.0,\"xwayn_624\":39.0,\"xwayn_625\":0.0,\"xwayn_626\":0.0,\"xwayn_627\":0.0,\"yaw_deg1\":-35.0,\"yaw_deg2\":-60.0,\"yaw_deg3\":-50.0,\"yaw_deg4\":-47.0,\"yaw_deg51\":-58.0,\"yaw_deg52\":-67.0,\"yaw_deg61\":-57.0,\"yaw_deg62\":-47.0,\"yaw_delay1\":0.0,\"yaw_delay2\":1.0,\"yaw_delay3\":1.0,\"yaw_delay4\":0.0,\"yaw_delay51\":0.0,\"yaw_delay52\":1.0,\"yaw_delay61\":0.0,\"yaw_delay62\":1.0,\"yaw_l1\":0.0,\"yaw_l2\":0.0,\"yaw_l3\":0.0,\"yaw_l4\":0.0,\"yaw_l51\":0.0,\"yaw_l52\":0.0,\"yaw_l61\":0.0,\"yaw_l62\":0.0,\"yaw_mod_combo1\":2.0,\"yaw_mod_combo2\":3.0,\"yaw_mod_combo3\":2.0,\"yaw_mod_combo4\":2.0,\"yaw_mod_combo51\":3.0,\"yaw_mod_combo52\":2.0,\"yaw_mod_combo61\":2.0,\"yaw_mod_combo62\":3.0,\"yaw_o1\":0.0,\"yaw_o2\":0.0,\"yaw_o3\":0.0,\"yaw_o4\":5.0,\"yaw_o51\":10.0,\"yaw_o52\":0.0,\"yaw_o61\":0.0,\"yaw_o62\":0.0,\"yaw_r1\":0.0,\"yaw_r2\":0.0,\"yaw_r3\":0.0,\"yaw_r4\":0.0,\"yaw_r51\":0.0,\"yaw_r52\":0.0,\"yaw_r61\":0.0,\"yaw_r62\":0.0,\"yaw_randl1\":0.0,\"yaw_randl2\":-15.0,\"yaw_randl3\":20.0,\"yaw_randl4\":-15.0,\"yaw_randl51\":0.0,\"yaw_randl52\":0.0,\"yaw_randl61\":0.0,\"yaw_randl62\":0.0,\"yaw_rando1\":0.0,\"yaw_rando2\":0.0,\"yaw_rando3\":0.0,\"yaw_rando4\":5.0,\"yaw_rando51\":20.0,\"yaw_rando52\":-5.0,\"yaw_rando61\":0.0,\"yaw_rando62\":5.0,\"yaw_randr1\":0.0,\"yaw_randr2\":15.0,\"yaw_randr3\":-20.0,\"yaw_randr4\":15.0,\"yaw_randr51\":0.0,\"yaw_randr52\":0.0,\"yaw_randr61\":0.0,\"yaw_randr62\":0.0,\"yaw_switch1\":true,\"yaw_switch2\":true,\"yaw_switch3\":true,\"yaw_switch4\":true,\"yaw_switch51\":true,\"yaw_switch52\":true,\"yaw_switch61\":true,\"yaw_switch62\":true}");
v117.presets.Classic = v117.parse_preset("{\"base_compensate\":true,\"base_pitch\":1.0,\"base_yaw\":1.0,\"breaklc_always\":[\"Standing\",\"Slow Walking\",\"Crouching\",\"In Air\",\"Safe Head\"],\"breaklc_extra\":[\"Condition Change\",\"Weapon Change\",\"Reloading\"],\"breaklc_ping\":[],\"def_onetapspeed1\":10.0,\"def_onetapspeed2\":20.0,\"def_onetapspeed3\":20.0,\"def_onetapspeed4\":20.0,\"def_onetapspeed51\":20.0,\"def_onetapspeed52\":20.0,\"def_onetapspeed61\":10.0,\"def_onetapspeed62\":20.0,\"def_pitch1\":\"Up\",\"def_pitch2\":\"Up\",\"def_pitch3\":\"Up\",\"def_pitch4\":\"Up\",\"def_pitch51\":\"Up\",\"def_pitch52\":\"Up\",\"def_pitch61\":\"Up\",\"def_pitch62\":\"Up\",\"def_switch1\":true,\"def_switch2\":false,\"def_switch3\":true,\"def_switch4\":false,\"def_switch51\":true,\"def_switch52\":true,\"def_switch61\":true,\"def_switch62\":true,\"def_yaw1\":3.0,\"def_yaw2\":3.0,\"def_yaw3\":3.0,\"def_yaw4\":3.0,\"def_yaw51\":3.0,\"def_yaw52\":3.0,\"def_yaw61\":3.0,\"def_yaw62\":3.0,\"def_yaw_deg1\":0.0,\"def_yaw_deg2\":0.0,\"def_yaw_deg3\":0.0,\"def_yaw_deg4\":0.0,\"def_yaw_deg51\":0.0,\"def_yaw_deg52\":0.0,\"def_yaw_deg61\":0.0,\"def_yaw_deg62\":0.0,\"desync_freestand1\":1.0,\"desync_freestand2\":1.0,\"desync_freestand3\":1.0,\"desync_freestand4\":1.0,\"desync_freestand51\":1.0,\"desync_freestand52\":1.0,\"desync_freestand61\":1.0,\"desync_freestand62\":1.0,\"desync_l1\":0.0,\"desync_l2\":60.0,\"desync_l3\":60.0,\"desync_l4\":60.0,\"desync_l51\":60.0,\"desync_l52\":60.0,\"desync_l61\":60.0,\"desync_l62\":60.0,\"desync_mod1\":[],\"desync_mod2\":[\"Jitter\"],\"desync_mod3\":[\"Jitter\"],\"desync_mod4\":[\"Jitter\"],\"desync_mod51\":[\"Jitter\"],\"desync_mod52\":[\"Jitter\"],\"desync_mod61\":[\"Jitter\"],\"desync_mod62\":[\"Jitter\"],\"desync_r1\":0.0,\"desync_r2\":60.0,\"desync_r3\":60.0,\"desync_r4\":60.0,\"desync_r51\":60.0,\"desync_r52\":60.0,\"desync_r61\":60.0,\"desync_r62\":60.0,\"desync_switch1\":true,\"desync_switch2\":true,\"desync_switch3\":true,\"desync_switch4\":true,\"desync_switch51\":true,\"desync_switch52\":true,\"desync_switch61\":true,\"desync_switch62\":true,\"flick_delay1\":3.0,\"flick_delay2\":3.0,\"flick_delay3\":3.0,\"flick_delay4\":3.0,\"flick_delay51\":3.0,\"flick_delay52\":3.0,\"flick_delay61\":3.0,\"flick_delay62\":3.0,\"flick_yaw1\":0.0,\"flick_yaw2\":0.0,\"flick_yaw3\":0.0,\"flick_yaw4\":0.0,\"flick_yaw51\":0.0,\"flick_yaw52\":0.0,\"flick_yaw61\":0.0,\"flick_yaw62\":0.0,\"frees_dis_def\":false,\"frees_disable\":[\"In Air\"],\"frees_pitch\":2.0,\"frees_pitch_custom\":0.0,\"frees_yaw\":1.0,\"frees_yaw_onetap\":0.0,\"legitaa_custom\":0.0,\"legitaa_desync\":true,\"legitaa_freestand\":2.0,\"legitaa_mod\":[\"Jitter\"],\"legitaa_pitch\":1.0,\"legitaa_switch\":true,\"list\":3.0,\"manual_type\":1.0,\"manual_view\":1.0,\"over_cond2\":false,\"over_cond3\":false,\"over_cond4\":false,\"over_cond51\":false,\"over_cond52\":false,\"over_cond61\":false,\"over_cond62\":false,\"pitch_custom1\":0.0,\"pitch_custom2\":0.0,\"pitch_custom3\":0.0,\"pitch_custom4\":0.0,\"pitch_custom51\":0.0,\"pitch_custom52\":0.0,\"pitch_custom61\":0.0,\"pitch_custom62\":0.0,\"pitch_deg1\":0.0,\"pitch_deg2\":0.0,\"pitch_deg3\":0.0,\"pitch_deg4\":0.0,\"pitch_deg51\":0.0,\"pitch_deg52\":0.0,\"pitch_deg61\":0.0,\"pitch_deg62\":0.0,\"predict_switch\":true,\"preset_list\":1.0,\"roll_def_deg1\":0.0,\"roll_def_deg2\":0.0,\"roll_def_deg3\":0.0,\"roll_def_deg4\":0.0,\"roll_def_deg51\":0.0,\"roll_def_deg52\":0.0,\"roll_def_deg61\":0.0,\"roll_def_deg62\":0.0,\"roll_ext_deg1\":0.0,\"roll_ext_deg2\":0.0,\"roll_ext_deg3\":0.0,\"roll_ext_deg4\":0.0,\"roll_ext_deg51\":0.0,\"roll_ext_deg52\":0.0,\"roll_ext_deg61\":0.0,\"roll_ext_deg62\":0.0,\"roll_ext_pit1\":0.0,\"roll_ext_pit2\":0.0,\"roll_ext_pit3\":0.0,\"roll_ext_pit4\":0.0,\"roll_ext_pit51\":0.0,\"roll_ext_pit52\":0.0,\"roll_ext_pit61\":0.0,\"roll_ext_pit62\":0.0,\"roll_switch1\":false,\"roll_switch2\":false,\"roll_switch3\":false,\"roll_switch4\":false,\"roll_switch51\":false,\"roll_switch52\":false,\"roll_switch61\":false,\"roll_switch62\":false,\"roll_type1\":1.0,\"roll_type2\":1.0,\"roll_type3\":1.0,\"roll_type4\":1.0,\"roll_type51\":1.0,\"roll_type52\":1.0,\"roll_type61\":1.0,\"roll_type62\":1.0,\"safe_def\":true,\"safe_switch\":true,\"xway_counter1\":3.0,\"xway_counter2\":3.0,\"xway_counter3\":3.0,\"xway_counter4\":3.0,\"xway_counter51\":3.0,\"xway_counter52\":3.0,\"xway_counter61\":3.0,\"xway_counter62\":3.0,\"xway_shuffle1\":false,\"xway_shuffle2\":false,\"xway_shuffle3\":false,\"xway_shuffle4\":false,\"xway_shuffle51\":false,\"xway_shuffle52\":false,\"xway_shuffle61\":false,\"xway_shuffle62\":false,\"xway_switch1\":false,\"xway_switch2\":false,\"xway_switch3\":false,\"xway_switch4\":false,\"xway_switch51\":false,\"xway_switch52\":false,\"xway_switch61\":false,\"xway_switch62\":false,\"xway_sync1\":false,\"xway_sync2\":false,\"xway_sync3\":false,\"xway_sync4\":false,\"xway_sync51\":false,\"xway_sync52\":false,\"xway_sync61\":false,\"xway_sync62\":false,\"xwayn_11\":0.0,\"xwayn_12\":0.0,\"xwayn_13\":0.0,\"xwayn_14\":0.0,\"xwayn_15\":0.0,\"xwayn_16\":0.0,\"xwayn_17\":0.0,\"xwayn_21\":0.0,\"xwayn_22\":0.0,\"xwayn_23\":0.0,\"xwayn_24\":0.0,\"xwayn_25\":0.0,\"xwayn_26\":0.0,\"xwayn_27\":0.0,\"xwayn_31\":0.0,\"xwayn_32\":0.0,\"xwayn_33\":0.0,\"xwayn_34\":0.0,\"xwayn_35\":0.0,\"xwayn_36\":0.0,\"xwayn_37\":0.0,\"xwayn_41\":0.0,\"xwayn_42\":0.0,\"xwayn_43\":0.0,\"xwayn_44\":0.0,\"xwayn_45\":0.0,\"xwayn_46\":0.0,\"xwayn_47\":0.0,\"xwayn_511\":0.0,\"xwayn_512\":0.0,\"xwayn_513\":0.0,\"xwayn_514\":0.0,\"xwayn_515\":0.0,\"xwayn_516\":0.0,\"xwayn_517\":0.0,\"xwayn_521\":0.0,\"xwayn_522\":0.0,\"xwayn_523\":0.0,\"xwayn_524\":0.0,\"xwayn_525\":0.0,\"xwayn_526\":0.0,\"xwayn_527\":0.0,\"xwayn_611\":0.0,\"xwayn_612\":0.0,\"xwayn_613\":0.0,\"xwayn_614\":0.0,\"xwayn_615\":0.0,\"xwayn_616\":0.0,\"xwayn_617\":0.0,\"xwayn_621\":0.0,\"xwayn_622\":0.0,\"xwayn_623\":0.0,\"xwayn_624\":0.0,\"xwayn_625\":0.0,\"xwayn_626\":0.0,\"xwayn_627\":0.0,\"yaw_deg1\":-35.0,\"yaw_deg2\":-70.0,\"yaw_deg3\":-89.0,\"yaw_deg4\":-75.0,\"yaw_deg51\":-63.0,\"yaw_deg52\":-63.0,\"yaw_deg61\":-75.0,\"yaw_deg62\":-70.0,\"yaw_delay1\":0.0,\"yaw_delay2\":0.0,\"yaw_delay3\":0.0,\"yaw_delay4\":0.0,\"yaw_delay51\":0.0,\"yaw_delay52\":0.0,\"yaw_delay61\":0.0,\"yaw_delay62\":0.0,\"yaw_l1\":0.0,\"yaw_l2\":0.0,\"yaw_l3\":0.0,\"yaw_l4\":0.0,\"yaw_l51\":0.0,\"yaw_l52\":0.0,\"yaw_l61\":0.0,\"yaw_l62\":0.0,\"yaw_mod_combo1\":2.0,\"yaw_mod_combo2\":2.0,\"yaw_mod_combo3\":2.0,\"yaw_mod_combo4\":2.0,\"yaw_mod_combo51\":2.0,\"yaw_mod_combo52\":2.0,\"yaw_mod_combo61\":2.0,\"yaw_mod_combo62\":2.0,\"yaw_o1\":0.0,\"yaw_o2\":0.0,\"yaw_o3\":0.0,\"yaw_o4\":0.0,\"yaw_o51\":0.0,\"yaw_o52\":0.0,\"yaw_o61\":0.0,\"yaw_o62\":0.0,\"yaw_r1\":0.0,\"yaw_r2\":0.0,\"yaw_r3\":0.0,\"yaw_r4\":0.0,\"yaw_r51\":0.0,\"yaw_r52\":0.0,\"yaw_r61\":0.0,\"yaw_r62\":0.0,\"yaw_randl1\":0.0,\"yaw_randl2\":0.0,\"yaw_randl3\":0.0,\"yaw_randl4\":0.0,\"yaw_randl51\":0.0,\"yaw_randl52\":0.0,\"yaw_randl61\":0.0,\"yaw_randl62\":0.0,\"yaw_rando1\":0.0,\"yaw_rando2\":-5.0,\"yaw_rando3\":-5.0,\"yaw_rando4\":-5.0,\"yaw_rando51\":-5.0,\"yaw_rando52\":-5.0,\"yaw_rando61\":5.0,\"yaw_rando62\":0.0,\"yaw_randr1\":0.0,\"yaw_randr2\":0.0,\"yaw_randr3\":0.0,\"yaw_randr4\":0.0,\"yaw_randr51\":0.0,\"yaw_randr52\":0.0,\"yaw_randr61\":0.0,\"yaw_randr62\":0.0,\"yaw_switch1\":true,\"yaw_switch2\":true,\"yaw_switch3\":true,\"yaw_switch4\":true,\"yaw_switch51\":true,\"yaw_switch52\":true,\"yaw_switch61\":true,\"yaw_switch62\":true}");
v117.presets.Way = v117.parse_preset("{\"base_compensate\":false,\"base_pitch\":1.0,\"base_yaw\":2.0,\"breaklc_always\":[],\"breaklc_extra\":[],\"breaklc_ping\":[],\"def_onetapspeed1\":10.0,\"def_onetapspeed2\":20.0,\"def_onetapspeed3\":20.0,\"def_onetapspeed4\":20.0,\"def_onetapspeed51\":20.0,\"def_onetapspeed52\":20.0,\"def_onetapspeed61\":20.0,\"def_onetapspeed62\":20.0,\"def_pitch1\":\"Disabled\",\"def_pitch2\":\"Up\",\"def_pitch3\":\"Up\",\"def_pitch4\":\"Up\",\"def_pitch51\":\"Up\",\"def_pitch52\":\"Up\",\"def_pitch61\":\"Up\",\"def_pitch62\":\"Up\",\"def_switch1\":false,\"def_switch2\":true,\"def_switch3\":true,\"def_switch4\":true,\"def_switch51\":true,\"def_switch52\":true,\"def_switch61\":true,\"def_switch62\":true,\"def_yaw1\":1.0,\"def_yaw2\":3.0,\"def_yaw3\":3.0,\"def_yaw4\":3.0,\"def_yaw51\":3.0,\"def_yaw52\":3.0,\"def_yaw61\":3.0,\"def_yaw62\":3.0,\"def_yaw_deg1\":0.0,\"def_yaw_deg2\":0.0,\"def_yaw_deg3\":0.0,\"def_yaw_deg4\":0.0,\"def_yaw_deg51\":0.0,\"def_yaw_deg52\":0.0,\"def_yaw_deg61\":0.0,\"def_yaw_deg62\":0.0,\"desync_freestand1\":1.0,\"desync_freestand2\":1.0,\"desync_freestand3\":1.0,\"desync_freestand4\":1.0,\"desync_freestand51\":1.0,\"desync_freestand52\":1.0,\"desync_freestand61\":1.0,\"desync_freestand62\":1.0,\"desync_l1\":60.0,\"desync_l2\":60.0,\"desync_l3\":60.0,\"desync_l4\":60.0,\"desync_l51\":60.0,\"desync_l52\":60.0,\"desync_l61\":60.0,\"desync_l62\":60.0,\"desync_mod1\":[],\"desync_mod2\":[],\"desync_mod3\":[],\"desync_mod4\":[],\"desync_mod51\":[],\"desync_mod52\":[],\"desync_mod61\":[],\"desync_mod62\":[],\"desync_r1\":60.0,\"desync_r2\":60.0,\"desync_r3\":60.0,\"desync_r4\":60.0,\"desync_r51\":60.0,\"desync_r52\":60.0,\"desync_r61\":60.0,\"desync_r62\":60.0,\"desync_switch1\":false,\"desync_switch2\":true,\"desync_switch3\":true,\"desync_switch4\":true,\"desync_switch51\":true,\"desync_switch52\":true,\"desync_switch61\":true,\"desync_switch62\":true,\"flick_delay1\":3.0,\"flick_delay2\":3.0,\"flick_delay3\":3.0,\"flick_delay4\":3.0,\"flick_delay51\":3.0,\"flick_delay52\":3.0,\"flick_delay61\":3.0,\"flick_delay62\":3.0,\"flick_yaw1\":0.0,\"flick_yaw2\":0.0,\"flick_yaw3\":0.0,\"flick_yaw4\":0.0,\"flick_yaw51\":0.0,\"flick_yaw52\":0.0,\"flick_yaw61\":0.0,\"flick_yaw62\":0.0,\"frees_dis_def\":true,\"frees_disable\":[],\"frees_pitch\":1.0,\"frees_pitch_custom\":0.0,\"frees_yaw\":1.0,\"frees_yaw_onetap\":0.0,\"legitaa_custom\":0.0,\"legitaa_desync\":false,\"legitaa_freestand\":1.0,\"legitaa_mod\":[],\"legitaa_pitch\":1.0,\"legitaa_switch\":false,\"list\":3.0,\"manual_type\":1.0,\"manual_view\":1.0,\"over_cond2\":false,\"over_cond3\":false,\"over_cond4\":false,\"over_cond51\":false,\"over_cond52\":false,\"over_cond61\":false,\"over_cond62\":false,\"pitch_custom1\":0.0,\"pitch_custom2\":0.0,\"pitch_custom3\":0.0,\"pitch_custom4\":0.0,\"pitch_custom51\":0.0,\"pitch_custom52\":0.0,\"pitch_custom61\":0.0,\"pitch_custom62\":0.0,\"pitch_deg1\":0.0,\"pitch_deg2\":0.0,\"pitch_deg3\":0.0,\"pitch_deg4\":0.0,\"pitch_deg51\":0.0,\"pitch_deg52\":0.0,\"pitch_deg61\":0.0,\"pitch_deg62\":0.0,\"predict_switch\":false,\"preset_list\":1.0,\"roll_def_deg1\":0.0,\"roll_def_deg2\":0.0,\"roll_def_deg3\":0.0,\"roll_def_deg4\":0.0,\"roll_def_deg51\":0.0,\"roll_def_deg52\":0.0,\"roll_def_deg61\":0.0,\"roll_def_deg62\":0.0,\"roll_ext_deg1\":0.0,\"roll_ext_deg2\":0.0,\"roll_ext_deg3\":0.0,\"roll_ext_deg4\":0.0,\"roll_ext_deg51\":0.0,\"roll_ext_deg52\":0.0,\"roll_ext_deg61\":0.0,\"roll_ext_deg62\":0.0,\"roll_ext_pit1\":0.0,\"roll_ext_pit2\":0.0,\"roll_ext_pit3\":0.0,\"roll_ext_pit4\":0.0,\"roll_ext_pit51\":0.0,\"roll_ext_pit52\":0.0,\"roll_ext_pit61\":0.0,\"roll_ext_pit62\":0.0,\"roll_switch1\":false,\"roll_switch2\":false,\"roll_switch3\":false,\"roll_switch4\":false,\"roll_switch51\":false,\"roll_switch52\":false,\"roll_switch61\":false,\"roll_switch62\":false,\"roll_type1\":1.0,\"roll_type2\":1.0,\"roll_type3\":1.0,\"roll_type4\":1.0,\"roll_type51\":1.0,\"roll_type52\":1.0,\"roll_type61\":1.0,\"roll_type62\":1.0,\"safe_def\":false,\"safe_switch\":false,\"xway_counter1\":3.0,\"xway_counter2\":3.0,\"xway_counter3\":4.0,\"xway_counter4\":3.0,\"xway_counter51\":4.0,\"xway_counter52\":3.0,\"xway_counter61\":3.0,\"xway_counter62\":3.0,\"xway_shuffle1\":false,\"xway_shuffle2\":true,\"xway_shuffle3\":true,\"xway_shuffle4\":true,\"xway_shuffle51\":true,\"xway_shuffle52\":true,\"xway_shuffle61\":false,\"xway_shuffle62\":true,\"xway_switch1\":false,\"xway_switch2\":true,\"xway_switch3\":true,\"xway_switch4\":true,\"xway_switch51\":true,\"xway_switch52\":true,\"xway_switch61\":true,\"xway_switch62\":true,\"xway_sync1\":false,\"xway_sync2\":true,\"xway_sync3\":true,\"xway_sync4\":true,\"xway_sync51\":true,\"xway_sync52\":true,\"xway_sync61\":true,\"xway_sync62\":true,\"xwayn_11\":0.0,\"xwayn_12\":0.0,\"xwayn_13\":0.0,\"xwayn_14\":0.0,\"xwayn_15\":0.0,\"xwayn_16\":0.0,\"xwayn_17\":0.0,\"xwayn_21\":-28.0,\"xwayn_22\":46.0,\"xwayn_23\":7.0,\"xwayn_24\":0.0,\"xwayn_25\":0.0,\"xwayn_26\":0.0,\"xwayn_27\":0.0,\"xwayn_31\":-51.0,\"xwayn_32\":37.0,\"xwayn_33\":-37.0,\"xwayn_34\":21.0,\"xwayn_35\":0.0,\"xwayn_36\":0.0,\"xwayn_37\":0.0,\"xwayn_41\":-28.0,\"xwayn_42\":46.0,\"xwayn_43\":-19.0,\"xwayn_44\":0.0,\"xwayn_45\":0.0,\"xwayn_46\":0.0,\"xwayn_47\":0.0,\"xwayn_511\":-42.0,\"xwayn_512\":45.0,\"xwayn_513\":-33.0,\"xwayn_514\":33.0,\"xwayn_515\":0.0,\"xwayn_516\":0.0,\"xwayn_517\":0.0,\"xwayn_521\":-30.0,\"xwayn_522\":45.0,\"xwayn_523\":17.0,\"xwayn_524\":33.0,\"xwayn_525\":0.0,\"xwayn_526\":0.0,\"xwayn_527\":0.0,\"xwayn_611\":-31.0,\"xwayn_612\":46.0,\"xwayn_613\":20.0,\"xwayn_614\":0.0,\"xwayn_615\":0.0,\"xwayn_616\":0.0,\"xwayn_617\":0.0,\"xwayn_621\":-36.0,\"xwayn_622\":38.0,\"xwayn_623\":13.0,\"xwayn_624\":0.0,\"xwayn_625\":0.0,\"xwayn_626\":0.0,\"xwayn_627\":0.0,\"yaw_deg1\":0.0,\"yaw_deg2\":-78.0,\"yaw_deg3\":-78.0,\"yaw_deg4\":-78.0,\"yaw_deg51\":-78.0,\"yaw_deg52\":-78.0,\"yaw_deg61\":-78.0,\"yaw_deg62\":-78.0,\"yaw_delay1\":0.0,\"yaw_delay2\":0.0,\"yaw_delay3\":0.0,\"yaw_delay4\":0.0,\"yaw_delay51\":0.0,\"yaw_delay52\":0.0,\"yaw_delay61\":0.0,\"yaw_delay62\":0.0,\"yaw_l1\":0.0,\"yaw_l2\":0.0,\"yaw_l3\":0.0,\"yaw_l4\":0.0,\"yaw_l51\":0.0,\"yaw_l52\":0.0,\"yaw_l61\":0.0,\"yaw_l62\":0.0,\"yaw_mod_combo1\":1.0,\"yaw_mod_combo2\":3.0,\"yaw_mod_combo3\":3.0,\"yaw_mod_combo4\":3.0,\"yaw_mod_combo51\":3.0,\"yaw_mod_combo52\":3.0,\"yaw_mod_combo61\":3.0,\"yaw_mod_combo62\":3.0,\"yaw_o1\":0.0,\"yaw_o2\":0.0,\"yaw_o3\":17.0,\"yaw_o4\":0.0,\"yaw_o51\":17.0,\"yaw_o52\":17.0,\"yaw_o61\":0.0,\"yaw_o62\":17.0,\"yaw_r1\":0.0,\"yaw_r2\":0.0,\"yaw_r3\":0.0,\"yaw_r4\":0.0,\"yaw_r51\":0.0,\"yaw_r52\":0.0,\"yaw_r61\":0.0,\"yaw_r62\":0.0,\"yaw_randl1\":0.0,\"yaw_randl2\":0.0,\"yaw_randl3\":0.0,\"yaw_randl4\":0.0,\"yaw_randl51\":0.0,\"yaw_randl52\":0.0,\"yaw_randl61\":0.0,\"yaw_randl62\":0.0,\"yaw_rando1\":0.0,\"yaw_rando2\":10.0,\"yaw_rando3\":5.0,\"yaw_rando4\":-10.0,\"yaw_rando51\":-5.0,\"yaw_rando52\":-5.0,\"yaw_rando61\":10.0,\"yaw_rando62\":-5.0,\"yaw_randr1\":0.0,\"yaw_randr2\":0.0,\"yaw_randr3\":0.0,\"yaw_randr4\":0.0,\"yaw_randr51\":0.0,\"yaw_randr52\":0.0,\"yaw_randr61\":0.0,\"yaw_randr62\":0.0,\"yaw_switch1\":false,\"yaw_switch2\":true,\"yaw_switch3\":true,\"yaw_switch4\":true,\"yaw_switch51\":true,\"yaw_switch52\":true,\"yaw_switch61\":true,\"yaw_switch62\":true}");
v117.presets.Delay = v117.parse_preset("{\"base_compensate\":false,\"base_pitch\":1.0,\"base_yaw\":1.0,\"breaklc_always\":[],\"breaklc_extra\":[],\"breaklc_ping\":[],\"def_onetapspeed1\":10.0,\"def_onetapspeed2\":20.0,\"def_onetapspeed3\":20.0,\"def_onetapspeed4\":20.0,\"def_onetapspeed51\":20.0,\"def_onetapspeed52\":20.0,\"def_onetapspeed61\":10.0,\"def_onetapspeed62\":20.0,\"def_pitch1\":\"Disabled\",\"def_pitch2\":\"Up\",\"def_pitch3\":\"Up\",\"def_pitch4\":\"Up\",\"def_pitch51\":\"Up\",\"def_pitch52\":\"Up\",\"def_pitch61\":\"Disabled\",\"def_pitch62\":\"Up\",\"def_switch1\":false,\"def_switch2\":true,\"def_switch3\":true,\"def_switch4\":true,\"def_switch51\":true,\"def_switch52\":true,\"def_switch61\":false,\"def_switch62\":true,\"def_yaw1\":1.0,\"def_yaw2\":3.0,\"def_yaw3\":3.0,\"def_yaw4\":3.0,\"def_yaw51\":3.0,\"def_yaw52\":3.0,\"def_yaw61\":1.0,\"def_yaw62\":3.0,\"def_yaw_deg1\":0.0,\"def_yaw_deg2\":0.0,\"def_yaw_deg3\":0.0,\"def_yaw_deg4\":0.0,\"def_yaw_deg51\":0.0,\"def_yaw_deg52\":0.0,\"def_yaw_deg61\":0.0,\"def_yaw_deg62\":0.0,\"desync_freestand1\":1.0,\"desync_freestand2\":1.0,\"desync_freestand3\":1.0,\"desync_freestand4\":1.0,\"desync_freestand51\":1.0,\"desync_freestand52\":1.0,\"desync_freestand61\":1.0,\"desync_freestand62\":1.0,\"desync_l1\":60.0,\"desync_l2\":60.0,\"desync_l3\":60.0,\"desync_l4\":60.0,\"desync_l51\":60.0,\"desync_l52\":60.0,\"desync_l61\":60.0,\"desync_l62\":60.0,\"desync_mod1\":[],\"desync_mod2\":[\"Jitter\"],\"desync_mod3\":[],\"desync_mod4\":[],\"desync_mod51\":[\"Jitter\"],\"desync_mod52\":[\"Jitter\"],\"desync_mod61\":[\"Jitter\"],\"desync_mod62\":[\"Jitter\"],\"desync_r1\":60.0,\"desync_r2\":60.0,\"desync_r3\":60.0,\"desync_r4\":60.0,\"desync_r51\":60.0,\"desync_r52\":60.0,\"desync_r61\":60.0,\"desync_r62\":60.0,\"desync_switch1\":false,\"desync_switch2\":true,\"desync_switch3\":false,\"desync_switch4\":true,\"desync_switch51\":true,\"desync_switch52\":true,\"desync_switch61\":true,\"desync_switch62\":true,\"flick_delay1\":3.0,\"flick_delay2\":3.0,\"flick_delay3\":3.0,\"flick_delay4\":3.0,\"flick_delay51\":3.0,\"flick_delay52\":3.0,\"flick_delay61\":3.0,\"flick_delay62\":3.0,\"flick_yaw1\":0.0,\"flick_yaw2\":0.0,\"flick_yaw3\":0.0,\"flick_yaw4\":0.0,\"flick_yaw51\":0.0,\"flick_yaw52\":0.0,\"flick_yaw61\":0.0,\"flick_yaw62\":0.0,\"frees_dis_def\":true,\"frees_disable\":[],\"frees_pitch\":1.0,\"frees_pitch_custom\":0.0,\"frees_yaw\":1.0,\"frees_yaw_onetap\":0.0,\"legitaa_custom\":0.0,\"legitaa_desync\":false,\"legitaa_freestand\":1.0,\"legitaa_mod\":[],\"legitaa_pitch\":1.0,\"legitaa_switch\":false,\"list\":3.0,\"manual_type\":1.0,\"manual_view\":1.0,\"over_cond2\":false,\"over_cond3\":false,\"over_cond4\":false,\"over_cond51\":false,\"over_cond52\":false,\"over_cond61\":false,\"over_cond62\":false,\"pitch_custom1\":0.0,\"pitch_custom2\":0.0,\"pitch_custom3\":0.0,\"pitch_custom4\":0.0,\"pitch_custom51\":0.0,\"pitch_custom52\":0.0,\"pitch_custom61\":0.0,\"pitch_custom62\":0.0,\"pitch_deg1\":0.0,\"pitch_deg2\":0.0,\"pitch_deg3\":0.0,\"pitch_deg4\":0.0,\"pitch_deg51\":0.0,\"pitch_deg52\":0.0,\"pitch_deg61\":0.0,\"pitch_deg62\":0.0,\"predict_switch\":false,\"preset_list\":4.0,\"roll_def_deg1\":0.0,\"roll_def_deg2\":0.0,\"roll_def_deg3\":0.0,\"roll_def_deg4\":0.0,\"roll_def_deg51\":0.0,\"roll_def_deg52\":0.0,\"roll_def_deg61\":0.0,\"roll_def_deg62\":0.0,\"roll_ext_deg1\":0.0,\"roll_ext_deg2\":0.0,\"roll_ext_deg3\":0.0,\"roll_ext_deg4\":0.0,\"roll_ext_deg51\":0.0,\"roll_ext_deg52\":0.0,\"roll_ext_deg61\":0.0,\"roll_ext_deg62\":0.0,\"roll_ext_pit1\":0.0,\"roll_ext_pit2\":0.0,\"roll_ext_pit3\":0.0,\"roll_ext_pit4\":0.0,\"roll_ext_pit51\":0.0,\"roll_ext_pit52\":0.0,\"roll_ext_pit61\":0.0,\"roll_ext_pit62\":0.0,\"roll_switch1\":false,\"roll_switch2\":false,\"roll_switch3\":false,\"roll_switch4\":false,\"roll_switch51\":false,\"roll_switch52\":false,\"roll_switch61\":false,\"roll_switch62\":false,\"roll_type1\":1.0,\"roll_type2\":1.0,\"roll_type3\":1.0,\"roll_type4\":1.0,\"roll_type51\":1.0,\"roll_type52\":1.0,\"roll_type61\":1.0,\"roll_type62\":1.0,\"safe_def\":false,\"safe_switch\":false,\"xway_counter1\":3.0,\"xway_counter2\":4.0,\"xway_counter3\":5.0,\"xway_counter4\":4.0,\"xway_counter51\":4.0,\"xway_counter52\":4.0,\"xway_counter61\":3.0,\"xway_counter62\":4.0,\"xway_shuffle1\":false,\"xway_shuffle2\":true,\"xway_shuffle3\":true,\"xway_shuffle4\":true,\"xway_shuffle51\":true,\"xway_shuffle52\":true,\"xway_shuffle61\":false,\"xway_shuffle62\":true,\"xway_switch1\":false,\"xway_switch2\":true,\"xway_switch3\":true,\"xway_switch4\":true,\"xway_switch51\":true,\"xway_switch52\":true,\"xway_switch61\":false,\"xway_switch62\":true,\"xway_sync1\":false,\"xway_sync2\":true,\"xway_sync3\":true,\"xway_sync4\":true,\"xway_sync51\":true,\"xway_sync52\":true,\"xway_sync61\":false,\"xway_sync62\":true,\"xwayn_11\":0.0,\"xwayn_12\":0.0,\"xwayn_13\":0.0,\"xwayn_14\":0.0,\"xwayn_15\":0.0,\"xwayn_16\":0.0,\"xwayn_17\":0.0,\"xwayn_21\":-39.0,\"xwayn_22\":26.0,\"xwayn_23\":-32.0,\"xwayn_24\":32.0,\"xwayn_25\":0.0,\"xwayn_26\":0.0,\"xwayn_27\":0.0,\"xwayn_31\":-35.0,\"xwayn_32\":38.0,\"xwayn_33\":-27.0,\"xwayn_34\":45.0,\"xwayn_35\":0.0,\"xwayn_36\":0.0,\"xwayn_37\":0.0,\"xwayn_41\":-35.0,\"xwayn_42\":38.0,\"xwayn_43\":-27.0,\"xwayn_44\":45.0,\"xwayn_45\":0.0,\"xwayn_46\":0.0,\"xwayn_47\":0.0,\"xwayn_511\":-31.0,\"xwayn_512\":44.0,\"xwayn_513\":55.0,\"xwayn_514\":-21.0,\"xwayn_515\":0.0,\"xwayn_516\":0.0,\"xwayn_517\":0.0,\"xwayn_521\":-25.0,\"xwayn_522\":41.0,\"xwayn_523\":53.0,\"xwayn_524\":-29.0,\"xwayn_525\":0.0,\"xwayn_526\":0.0,\"xwayn_527\":0.0,\"xwayn_611\":0.0,\"xwayn_612\":0.0,\"xwayn_613\":0.0,\"xwayn_614\":0.0,\"xwayn_615\":0.0,\"xwayn_616\":0.0,\"xwayn_617\":0.0,\"xwayn_621\":-35.0,\"xwayn_622\":38.0,\"xwayn_623\":-27.0,\"xwayn_624\":45.0,\"xwayn_625\":0.0,\"xwayn_626\":0.0,\"xwayn_627\":0.0,\"yaw_deg1\":0.0,\"yaw_deg2\":0.0,\"yaw_deg3\":0.0,\"yaw_deg4\":0.0,\"yaw_deg51\":0.0,\"yaw_deg52\":0.0,\"yaw_deg61\":-51.0,\"yaw_deg62\":-63.0,\"yaw_delay1\":0.0,\"yaw_delay2\":1.0,\"yaw_delay3\":3.0,\"yaw_delay4\":1.0,\"yaw_delay51\":1.0,\"yaw_delay52\":1.0,\"yaw_delay61\":0.0,\"yaw_delay62\":1.0,\"yaw_l1\":0.0,\"yaw_l2\":0.0,\"yaw_l3\":0.0,\"yaw_l4\":0.0,\"yaw_l51\":0.0,\"yaw_l52\":0.0,\"yaw_l61\":0.0,\"yaw_l62\":0.0,\"yaw_mod_combo1\":1.0,\"yaw_mod_combo2\":3.0,\"yaw_mod_combo3\":3.0,\"yaw_mod_combo4\":3.0,\"yaw_mod_combo51\":3.0,\"yaw_mod_combo52\":3.0,\"yaw_mod_combo61\":2.0,\"yaw_mod_combo62\":2.0,\"yaw_o1\":0.0,\"yaw_o2\":0.0,\"yaw_o3\":0.0,\"yaw_o4\":0.0,\"yaw_o51\":0.0,\"yaw_o52\":0.0,\"yaw_o61\":0.0,\"yaw_o62\":10.0,\"yaw_r1\":0.0,\"yaw_r2\":0.0,\"yaw_r3\":0.0,\"yaw_r4\":0.0,\"yaw_r51\":0.0,\"yaw_r52\":0.0,\"yaw_r61\":0.0,\"yaw_r62\":0.0,\"yaw_randl1\":0.0,\"yaw_randl2\":0.0,\"yaw_randl3\":0.0,\"yaw_randl4\":0.0,\"yaw_randl51\":0.0,\"yaw_randl52\":0.0,\"yaw_randl61\":0.0,\"yaw_randl62\":0.0,\"yaw_rando1\":0.0,\"yaw_rando2\":10.0,\"yaw_rando3\":-10.0,\"yaw_rando4\":-10.0,\"yaw_rando51\":5.0,\"yaw_rando52\":-5.0,\"yaw_rando61\":5.0,\"yaw_rando62\":-10.0,\"yaw_randr1\":0.0,\"yaw_randr2\":0.0,\"yaw_randr3\":0.0,\"yaw_randr4\":0.0,\"yaw_randr51\":0.0,\"yaw_randr52\":0.0,\"yaw_randr61\":0.0,\"yaw_randr62\":0.0,\"yaw_switch1\":false,\"yaw_switch2\":true,\"yaw_switch3\":true,\"yaw_switch4\":true,\"yaw_switch51\":true,\"yaw_switch52\":true,\"yaw_switch61\":true,\"yaw_switch62\":true}");
v117.presets.Roll = v117.parse_preset("{\"base_compensate\":false,\"base_pitch\":1.0,\"base_yaw\":1.0,\"breaklc_always\":[],\"breaklc_extra\":[],\"breaklc_ping\":[],\"def_onetapspeed1\":10.0,\"def_onetapspeed2\":10.0,\"def_onetapspeed3\":10.0,\"def_onetapspeed4\":10.0,\"def_onetapspeed51\":10.0,\"def_onetapspeed52\":10.0,\"def_onetapspeed61\":10.0,\"def_onetapspeed62\":10.0,\"def_pitch1\":\"Random\",\"def_pitch2\":\"Disabled\",\"def_pitch3\":\"Disabled\",\"def_pitch4\":\"Random\",\"def_pitch51\":\"Sway\",\"def_pitch52\":\"Custom\",\"def_pitch61\":\"Disabled\",\"def_pitch62\":\"Up\",\"def_switch1\":false,\"def_switch2\":false,\"def_switch3\":false,\"def_switch4\":false,\"def_switch51\":false,\"def_switch52\":false,\"def_switch61\":false,\"def_switch62\":false,\"def_yaw1\":1.0,\"def_yaw2\":1.0,\"def_yaw3\":1.0,\"def_yaw4\":1.0,\"def_yaw51\":1.0,\"def_yaw52\":1.0,\"def_yaw61\":1.0,\"def_yaw62\":1.0,\"def_yaw_deg1\":89.0,\"def_yaw_deg2\":0.0,\"def_yaw_deg3\":0.0,\"def_yaw_deg4\":89.0,\"def_yaw_deg51\":0.0,\"def_yaw_deg52\":-65.0,\"def_yaw_deg61\":0.0,\"def_yaw_deg62\":0.0,\"desync_freestand1\":1.0,\"desync_freestand2\":1.0,\"desync_freestand3\":1.0,\"desync_freestand4\":1.0,\"desync_freestand51\":1.0,\"desync_freestand52\":1.0,\"desync_freestand61\":1.0,\"desync_freestand62\":1.0,\"desync_l1\":60.0,\"desync_l2\":60.0,\"desync_l3\":60.0,\"desync_l4\":60.0,\"desync_l51\":60.0,\"desync_l52\":60.0,\"desync_l61\":60.0,\"desync_l62\":60.0,\"desync_mod1\":[],\"desync_mod2\":[],\"desync_mod3\":[],\"desync_mod4\":[\"Jitter\"],\"desync_mod51\":[],\"desync_mod52\":[],\"desync_mod61\":[],\"desync_mod62\":[],\"desync_r1\":60.0,\"desync_r2\":60.0,\"desync_r3\":60.0,\"desync_r4\":60.0,\"desync_r51\":60.0,\"desync_r52\":60.0,\"desync_r61\":60.0,\"desync_r62\":60.0,\"desync_switch1\":true,\"desync_switch2\":true,\"desync_switch3\":true,\"desync_switch4\":false,\"desync_switch51\":true,\"desync_switch52\":true,\"desync_switch61\":true,\"desync_switch62\":true,\"flick_delay1\":3.0,\"flick_delay2\":3.0,\"flick_delay3\":3.0,\"flick_delay4\":3.0,\"flick_delay51\":3.0,\"flick_delay52\":3.0,\"flick_delay61\":3.0,\"flick_delay62\":3.0,\"flick_yaw1\":0.0,\"flick_yaw2\":0.0,\"flick_yaw3\":0.0,\"flick_yaw4\":0.0,\"flick_yaw51\":0.0,\"flick_yaw52\":0.0,\"flick_yaw61\":0.0,\"flick_yaw62\":0.0,\"frees_dis_def\":true,\"frees_disable\":[],\"frees_pitch\":2.0,\"frees_pitch_custom\":0.0,\"frees_yaw\":1.0,\"frees_yaw_onetap\":0.0,\"legitaa_custom\":0.0,\"legitaa_desync\":true,\"legitaa_freestand\":2.0,\"legitaa_mod\":[\"Jitter\"],\"legitaa_pitch\":1.0,\"legitaa_switch\":true,\"list\":3.0,\"manual_type\":1.0,\"manual_view\":1.0,\"over_cond2\":false,\"over_cond3\":false,\"over_cond4\":false,\"over_cond51\":false,\"over_cond52\":false,\"over_cond61\":false,\"over_cond62\":false,\"pitch_custom1\":0.0,\"pitch_custom2\":0.0,\"pitch_custom3\":0.0,\"pitch_custom4\":0.0,\"pitch_custom51\":0.0,\"pitch_custom52\":-65.0,\"pitch_custom61\":0.0,\"pitch_custom62\":0.0,\"pitch_deg1\":89.0,\"pitch_deg2\":0.0,\"pitch_deg3\":0.0,\"pitch_deg4\":89.0,\"pitch_deg51\":89.0,\"pitch_deg52\":0.0,\"pitch_deg61\":0.0,\"pitch_deg62\":0.0,\"predict_switch\":false,\"preset_list\":5.0,\"roll_def_deg1\":60.0,\"roll_def_deg2\":65.0,\"roll_def_deg3\":80.0,\"roll_def_deg4\":89.0,\"roll_def_deg51\":115.0,\"roll_def_deg52\":80.0,\"roll_def_deg61\":45.0,\"roll_def_deg62\":45.0,\"roll_ext_deg1\":0.0,\"roll_ext_deg2\":0.0,\"roll_ext_deg3\":0.0,\"roll_ext_deg4\":0.0,\"roll_ext_deg51\":0.0,\"roll_ext_deg52\":0.0,\"roll_ext_deg61\":0.0,\"roll_ext_deg62\":0.0,\"roll_ext_pit1\":0.0,\"roll_ext_pit2\":0.0,\"roll_ext_pit3\":0.0,\"roll_ext_pit4\":0.0,\"roll_ext_pit51\":0.0,\"roll_ext_pit52\":0.0,\"roll_ext_pit61\":0.0,\"roll_ext_pit62\":0.0,\"roll_switch1\":true,\"roll_switch2\":true,\"roll_switch3\":true,\"roll_switch4\":false,\"roll_switch51\":true,\"roll_switch52\":true,\"roll_switch61\":true,\"roll_switch62\":true,\"roll_type1\":1.0,\"roll_type2\":1.0,\"roll_type3\":1.0,\"roll_type4\":1.0,\"roll_type51\":1.0,\"roll_type52\":1.0,\"roll_type61\":1.0,\"roll_type62\":1.0,\"safe_def\":true,\"safe_switch\":false,\"xway_counter1\":3.0,\"xway_counter2\":3.0,\"xway_counter3\":3.0,\"xway_counter4\":3.0,\"xway_counter51\":3.0,\"xway_counter52\":3.0,\"xway_counter61\":3.0,\"xway_counter62\":3.0,\"xway_shuffle1\":false,\"xway_shuffle2\":false,\"xway_shuffle3\":false,\"xway_shuffle4\":false,\"xway_shuffle51\":false,\"xway_shuffle52\":false,\"xway_shuffle61\":false,\"xway_shuffle62\":false,\"xway_switch1\":false,\"xway_switch2\":false,\"xway_switch3\":false,\"xway_switch4\":false,\"xway_switch51\":false,\"xway_switch52\":false,\"xway_switch61\":false,\"xway_switch62\":false,\"xway_sync1\":false,\"xway_sync2\":false,\"xway_sync3\":false,\"xway_sync4\":false,\"xway_sync51\":false,\"xway_sync52\":false,\"xway_sync61\":false,\"xway_sync62\":false,\"xwayn_11\":0.0,\"xwayn_12\":0.0,\"xwayn_13\":0.0,\"xwayn_14\":0.0,\"xwayn_15\":0.0,\"xwayn_16\":0.0,\"xwayn_17\":0.0,\"xwayn_21\":0.0,\"xwayn_22\":0.0,\"xwayn_23\":0.0,\"xwayn_24\":0.0,\"xwayn_25\":0.0,\"xwayn_26\":0.0,\"xwayn_27\":0.0,\"xwayn_31\":0.0,\"xwayn_32\":0.0,\"xwayn_33\":0.0,\"xwayn_34\":0.0,\"xwayn_35\":0.0,\"xwayn_36\":0.0,\"xwayn_37\":0.0,\"xwayn_41\":0.0,\"xwayn_42\":0.0,\"xwayn_43\":0.0,\"xwayn_44\":0.0,\"xwayn_45\":0.0,\"xwayn_46\":0.0,\"xwayn_47\":0.0,\"xwayn_511\":0.0,\"xwayn_512\":0.0,\"xwayn_513\":0.0,\"xwayn_514\":0.0,\"xwayn_515\":0.0,\"xwayn_516\":0.0,\"xwayn_517\":0.0,\"xwayn_521\":0.0,\"xwayn_522\":0.0,\"xwayn_523\":0.0,\"xwayn_524\":0.0,\"xwayn_525\":0.0,\"xwayn_526\":0.0,\"xwayn_527\":0.0,\"xwayn_611\":0.0,\"xwayn_612\":0.0,\"xwayn_613\":0.0,\"xwayn_614\":0.0,\"xwayn_615\":0.0,\"xwayn_616\":0.0,\"xwayn_617\":0.0,\"xwayn_621\":0.0,\"xwayn_622\":0.0,\"xwayn_623\":0.0,\"xwayn_624\":0.0,\"xwayn_625\":0.0,\"xwayn_626\":0.0,\"xwayn_627\":0.0,\"yaw_deg1\":-16.0,\"yaw_deg2\":0.0,\"yaw_deg3\":0.0,\"yaw_deg4\":-80.0,\"yaw_deg51\":-40.0,\"yaw_deg52\":-59.0,\"yaw_deg61\":0.0,\"yaw_deg62\":-62.0,\"yaw_delay1\":0.0,\"yaw_delay2\":0.0,\"yaw_delay3\":0.0,\"yaw_delay4\":1.0,\"yaw_delay51\":0.0,\"yaw_delay52\":0.0,\"yaw_delay61\":0.0,\"yaw_delay62\":0.0,\"yaw_l1\":0.0,\"yaw_l2\":0.0,\"yaw_l3\":0.0,\"yaw_l4\":0.0,\"yaw_l51\":0.0,\"yaw_l52\":0.0,\"yaw_l61\":0.0,\"yaw_l62\":0.0,\"yaw_mod_combo1\":1.0,\"yaw_mod_combo2\":1.0,\"yaw_mod_combo3\":1.0,\"yaw_mod_combo4\":2.0,\"yaw_mod_combo51\":1.0,\"yaw_mod_combo52\":1.0,\"yaw_mod_combo61\":1.0,\"yaw_mod_combo62\":1.0,\"yaw_o1\":29.0,\"yaw_o2\":14.0,\"yaw_o3\":38.0,\"yaw_o4\":-27.0,\"yaw_o51\":50.0,\"yaw_o52\":32.0,\"yaw_o61\":24.0,\"yaw_o62\":24.0,\"yaw_r1\":0.0,\"yaw_r2\":0.0,\"yaw_r3\":0.0,\"yaw_r4\":0.0,\"yaw_r51\":0.0,\"yaw_r52\":0.0,\"yaw_r61\":0.0,\"yaw_r62\":0.0,\"yaw_randl1\":0.0,\"yaw_randl2\":0.0,\"yaw_randl3\":0.0,\"yaw_randl4\":0.0,\"yaw_randl51\":0.0,\"yaw_randl52\":0.0,\"yaw_randl61\":0.0,\"yaw_randl62\":0.0,\"yaw_rando1\":0.0,\"yaw_rando2\":0.0,\"yaw_rando3\":0.0,\"yaw_rando4\":39.0,\"yaw_rando51\":0.0,\"yaw_rando52\":0.0,\"yaw_rando61\":0.0,\"yaw_rando62\":0.0,\"yaw_randr1\":0.0,\"yaw_randr2\":0.0,\"yaw_randr3\":0.0,\"yaw_randr4\":0.0,\"yaw_randr51\":0.0,\"yaw_randr52\":0.0,\"yaw_randr61\":0.0,\"yaw_randr62\":0.0,\"yaw_switch1\":true,\"yaw_switch2\":true,\"yaw_switch3\":true,\"yaw_switch4\":true,\"yaw_switch51\":true,\"yaw_switch52\":true,\"yaw_switch61\":true,\"yaw_switch62\":true}");
v117.presets.Skitter = v117.parse_preset("{\"base_compensate\":false,\"base_pitch\":1.0,\"base_yaw\":1.0,\"breaklc_always\":[\"Standing\",\"Slow Walking\",\"Crouching\",\"In Air\"],\"breaklc_extra\":[],\"breaklc_ping\":[],\"def_onetapspeed1\":10.0,\"def_onetapspeed2\":10.0,\"def_onetapspeed3\":10.0,\"def_onetapspeed4\":10.0,\"def_onetapspeed51\":10.0,\"def_onetapspeed52\":10.0,\"def_onetapspeed61\":10.0,\"def_onetapspeed62\":10.0,\"def_pitch1\":\"Random\",\"def_pitch2\":\"Disabled\",\"def_pitch3\":\"Disabled\",\"def_pitch4\":\"Random\",\"def_pitch51\":\"Sway\",\"def_pitch52\":\"Custom\",\"def_pitch61\":\"Disabled\",\"def_pitch62\":\"Up\",\"def_switch1\":true,\"def_switch2\":false,\"def_switch3\":false,\"def_switch4\":true,\"def_switch51\":true,\"def_switch52\":true,\"def_switch61\":false,\"def_switch62\":true,\"def_yaw1\":1.0,\"def_yaw2\":1.0,\"def_yaw3\":1.0,\"def_yaw4\":1.0,\"def_yaw51\":1.0,\"def_yaw52\":1.0,\"def_yaw61\":1.0,\"def_yaw62\":1.0,\"def_yaw_deg1\":89.0,\"def_yaw_deg2\":0.0,\"def_yaw_deg3\":0.0,\"def_yaw_deg4\":89.0,\"def_yaw_deg51\":0.0,\"def_yaw_deg52\":-65.0,\"def_yaw_deg61\":0.0,\"def_yaw_deg62\":0.0,\"desync_freestand1\":1.0,\"desync_freestand2\":1.0,\"desync_freestand3\":1.0,\"desync_freestand4\":1.0,\"desync_freestand51\":1.0,\"desync_freestand52\":1.0,\"desync_freestand61\":1.0,\"desync_freestand62\":1.0,\"desync_l1\":60.0,\"desync_l2\":60.0,\"desync_l3\":60.0,\"desync_l4\":60.0,\"desync_l51\":60.0,\"desync_l52\":60.0,\"desync_l61\":60.0,\"desync_l62\":60.0,\"desync_mod1\":[\"Randomize Jitter\"],\"desync_mod2\":[],\"desync_mod3\":[],\"desync_mod4\":[\"Jitter\"],\"desync_mod51\":[\"Jitter\"],\"desync_mod52\":[],\"desync_mod61\":[],\"desync_mod62\":[],\"desync_r1\":60.0,\"desync_r2\":60.0,\"desync_r3\":60.0,\"desync_r4\":60.0,\"desync_r51\":60.0,\"desync_r52\":60.0,\"desync_r61\":60.0,\"desync_r62\":60.0,\"desync_switch1\":true,\"desync_switch2\":false,\"desync_switch3\":false,\"desync_switch4\":false,\"desync_switch51\":true,\"desync_switch52\":false,\"desync_switch61\":false,\"desync_switch62\":false,\"flick_delay1\":3.0,\"flick_delay2\":3.0,\"flick_delay3\":3.0,\"flick_delay4\":3.0,\"flick_delay51\":3.0,\"flick_delay52\":3.0,\"flick_delay61\":3.0,\"flick_delay62\":3.0,\"flick_yaw1\":0.0,\"flick_yaw2\":0.0,\"flick_yaw3\":0.0,\"flick_yaw4\":0.0,\"flick_yaw51\":0.0,\"flick_yaw52\":0.0,\"flick_yaw61\":0.0,\"flick_yaw62\":0.0,\"frees_dis_def\":true,\"frees_disable\":[],\"frees_pitch\":2.0,\"frees_pitch_custom\":0.0,\"frees_yaw\":1.0,\"frees_yaw_onetap\":0.0,\"legitaa_custom\":0.0,\"legitaa_desync\":true,\"legitaa_freestand\":2.0,\"legitaa_mod\":[\"Jitter\"],\"legitaa_pitch\":1.0,\"legitaa_switch\":true,\"list\":3.0,\"manual_type\":1.0,\"manual_view\":1.0,\"over_cond2\":true,\"over_cond3\":true,\"over_cond4\":false,\"over_cond51\":false,\"over_cond52\":false,\"over_cond61\":true,\"over_cond62\":true,\"pitch_custom1\":0.0,\"pitch_custom2\":0.0,\"pitch_custom3\":0.0,\"pitch_custom4\":0.0,\"pitch_custom51\":0.0,\"pitch_custom52\":-65.0,\"pitch_custom61\":0.0,\"pitch_custom62\":0.0,\"pitch_deg1\":89.0,\"pitch_deg2\":0.0,\"pitch_deg3\":0.0,\"pitch_deg4\":89.0,\"pitch_deg51\":89.0,\"pitch_deg52\":0.0,\"pitch_deg61\":0.0,\"pitch_deg62\":0.0,\"predict_switch\":true,\"preset_list\":3.0,\"roll_def_deg1\":0.0,\"roll_def_deg2\":0.0,\"roll_def_deg3\":0.0,\"roll_def_deg4\":0.0,\"roll_def_deg51\":0.0,\"roll_def_deg52\":0.0,\"roll_def_deg61\":0.0,\"roll_def_deg62\":0.0,\"roll_ext_deg1\":0.0,\"roll_ext_deg2\":0.0,\"roll_ext_deg3\":0.0,\"roll_ext_deg4\":0.0,\"roll_ext_deg51\":0.0,\"roll_ext_deg52\":0.0,\"roll_ext_deg61\":0.0,\"roll_ext_deg62\":0.0,\"roll_ext_pit1\":0.0,\"roll_ext_pit2\":0.0,\"roll_ext_pit3\":0.0,\"roll_ext_pit4\":0.0,\"roll_ext_pit51\":0.0,\"roll_ext_pit52\":0.0,\"roll_ext_pit61\":0.0,\"roll_ext_pit62\":0.0,\"roll_switch1\":false,\"roll_switch2\":false,\"roll_switch3\":false,\"roll_switch4\":false,\"roll_switch51\":false,\"roll_switch52\":false,\"roll_switch61\":false,\"roll_switch62\":false,\"roll_type1\":1.0,\"roll_type2\":1.0,\"roll_type3\":1.0,\"roll_type4\":1.0,\"roll_type51\":1.0,\"roll_type52\":1.0,\"roll_type61\":1.0,\"roll_type62\":1.0,\"safe_def\":true,\"safe_switch\":true,\"xway_counter1\":3.0,\"xway_counter2\":3.0,\"xway_counter3\":3.0,\"xway_counter4\":3.0,\"xway_counter51\":3.0,\"xway_counter52\":3.0,\"xway_counter61\":3.0,\"xway_counter62\":3.0,\"xway_shuffle1\":false,\"xway_shuffle2\":false,\"xway_shuffle3\":false,\"xway_shuffle4\":false,\"xway_shuffle51\":false,\"xway_shuffle52\":false,\"xway_shuffle61\":false,\"xway_shuffle62\":false,\"xway_switch1\":false,\"xway_switch2\":false,\"xway_switch3\":false,\"xway_switch4\":false,\"xway_switch51\":false,\"xway_switch52\":false,\"xway_switch61\":false,\"xway_switch62\":false,\"xway_sync1\":false,\"xway_sync2\":false,\"xway_sync3\":false,\"xway_sync4\":false,\"xway_sync51\":false,\"xway_sync52\":false,\"xway_sync61\":false,\"xway_sync62\":false,\"xwayn_11\":0.0,\"xwayn_12\":0.0,\"xwayn_13\":0.0,\"xwayn_14\":0.0,\"xwayn_15\":0.0,\"xwayn_16\":0.0,\"xwayn_17\":0.0,\"xwayn_21\":0.0,\"xwayn_22\":0.0,\"xwayn_23\":0.0,\"xwayn_24\":0.0,\"xwayn_25\":0.0,\"xwayn_26\":0.0,\"xwayn_27\":0.0,\"xwayn_31\":0.0,\"xwayn_32\":0.0,\"xwayn_33\":0.0,\"xwayn_34\":0.0,\"xwayn_35\":0.0,\"xwayn_36\":0.0,\"xwayn_37\":0.0,\"xwayn_41\":0.0,\"xwayn_42\":0.0,\"xwayn_43\":0.0,\"xwayn_44\":0.0,\"xwayn_45\":0.0,\"xwayn_46\":0.0,\"xwayn_47\":0.0,\"xwayn_511\":0.0,\"xwayn_512\":0.0,\"xwayn_513\":0.0,\"xwayn_514\":0.0,\"xwayn_515\":0.0,\"xwayn_516\":0.0,\"xwayn_517\":0.0,\"xwayn_521\":0.0,\"xwayn_522\":0.0,\"xwayn_523\":0.0,\"xwayn_524\":0.0,\"xwayn_525\":0.0,\"xwayn_526\":0.0,\"xwayn_527\":0.0,\"xwayn_611\":0.0,\"xwayn_612\":0.0,\"xwayn_613\":0.0,\"xwayn_614\":0.0,\"xwayn_615\":0.0,\"xwayn_616\":0.0,\"xwayn_617\":0.0,\"xwayn_621\":0.0,\"xwayn_622\":0.0,\"xwayn_623\":0.0,\"xwayn_624\":0.0,\"xwayn_625\":0.0,\"xwayn_626\":0.0,\"xwayn_627\":0.0,\"yaw_deg1\":-16.0,\"yaw_deg2\":0.0,\"yaw_deg3\":0.0,\"yaw_deg4\":-80.0,\"yaw_deg51\":-40.0,\"yaw_deg52\":-59.0,\"yaw_deg61\":0.0,\"yaw_deg62\":-62.0,\"yaw_delay1\":1.0,\"yaw_delay2\":0.0,\"yaw_delay3\":0.0,\"yaw_delay4\":2.0,\"yaw_delay51\":1.0,\"yaw_delay52\":2.0,\"yaw_delay61\":0.0,\"yaw_delay62\":0.0,\"yaw_l1\":0.0,\"yaw_l2\":0.0,\"yaw_l3\":0.0,\"yaw_l4\":0.0,\"yaw_l51\":0.0,\"yaw_l52\":0.0,\"yaw_l61\":0.0,\"yaw_l62\":0.0,\"yaw_mod_combo1\":7.0,\"yaw_mod_combo2\":1.0,\"yaw_mod_combo3\":1.0,\"yaw_mod_combo4\":2.0,\"yaw_mod_combo51\":2.0,\"yaw_mod_combo52\":2.0,\"yaw_mod_combo61\":1.0,\"yaw_mod_combo62\":3.0,\"yaw_o1\":0.0,\"yaw_o2\":0.0,\"yaw_o3\":0.0,\"yaw_o4\":22.0,\"yaw_o51\":0.0,\"yaw_o52\":0.0,\"yaw_o61\":0.0,\"yaw_o62\":0.0,\"yaw_r1\":0.0,\"yaw_r2\":0.0,\"yaw_r3\":0.0,\"yaw_r4\":0.0,\"yaw_r51\":0.0,\"yaw_r52\":0.0,\"yaw_r61\":0.0,\"yaw_r62\":0.0,\"yaw_randl1\":0.0,\"yaw_randl2\":0.0,\"yaw_randl3\":0.0,\"yaw_randl4\":0.0,\"yaw_randl51\":0.0,\"yaw_randl52\":0.0,\"yaw_randl61\":0.0,\"yaw_randl62\":0.0,\"yaw_rando1\":-24.0,\"yaw_rando2\":0.0,\"yaw_rando3\":0.0,\"yaw_rando4\":-24.0,\"yaw_rando51\":0.0,\"yaw_rando52\":0.0,\"yaw_rando61\":0.0,\"yaw_rando62\":0.0,\"yaw_randr1\":0.0,\"yaw_randr2\":0.0,\"yaw_randr3\":0.0,\"yaw_randr4\":0.0,\"yaw_randr51\":0.0,\"yaw_randr52\":0.0,\"yaw_randr61\":0.0,\"yaw_randr62\":0.0,\"yaw_switch1\":true,\"yaw_switch2\":false,\"yaw_switch3\":false,\"yaw_switch4\":true,\"yaw_switch51\":true,\"yaw_switch52\":true,\"yaw_switch61\":false,\"yaw_switch62\":true}");
v117.ui_tables.antiaim.preset_list:set_callback(function()
    -- upvalues: v117 (ref)
    v117.ui_tables.antiaim.preset_list:update_active_config();
end, true);
v634.builder = v117.create_group(" Anti Aim \a{Switch}\239\131\154 \a{Link Active}Builder", 2);
v634.builder:visible_condition(function()
    -- upvalues: v117 (ref)
    return v117.ui_tables.antiaim.list.value == 3;
end);
v634.builder:disabled_condition(function()
    -- upvalues: v117 (ref)
    return v117.ui_tables.config.antiaim_owner.value ~= "" and v117.ui_tables.config.antiaim_owner.value ~= common.get_username();
end);
v634.builder:combo("unused", "condition_list", "\a{Link Active}\239\134\131\t\aDEFAULTCondition", {
    [1] = "Default", 
    [2] = "Standing", 
    [3] = "Slow Walking", 
    [4] = "Moving", 
    [5] = "Crouching", 
    [6] = "In Air"
});
v117.ui_tables.unused.condition_list.table_to_copy = {
    [1] = "yaw_switch", 
    [2] = "yaw_delay", 
    [3] = "yaw_o", 
    [4] = "yaw_l", 
    [5] = "yaw_r", 
    [6] = "yaw_rando", 
    [7] = "yaw_randl", 
    [8] = "yaw_randr", 
    [9] = "yaw_mod_combo", 
    [10] = "yaw_deg", 
    [11] = "xway_counter", 
    [12] = "xway_shuffle", 
    [13] = "xway_sync", 
    [14] = "xway_switch", 
    [15] = "xwayn_", 
    [16] = "flick_delay", 
    [17] = "flick_yaw", 
    [18] = "desync_switch", 
    [19] = "desync_freestand", 
    [20] = "desync_l", 
    [21] = "desync_r", 
    [22] = "desync_mod", 
    [23] = "def_switch", 
    [24] = "def_pitch", 
    [25] = "pitch_deg", 
    [26] = "pitch_custom", 
    [27] = "def_yaw", 
    [28] = "def_yaw_deg", 
    [29] = "def_onetapspeed", 
    [30] = "roll_switch", 
    [31] = "roll_type", 
    [32] = "roll_def_deg", 
    [33] = "roll_ext_pit", 
    [34] = "roll_ext_deg"
};
v117.ui_tables.unused.condition_list:button("copy_cond", "      \239\161\191      ", function()
    -- upvalues: v117 (ref), v96 (ref), v92 (ref)
    local v653 = {};
    local l_value_10 = v117.ui_tables.unused.condition_list.value;
    local l_table_to_copy_0 = v117.ui_tables.unused.condition_list.table_to_copy;
    if l_value_10 > 4 then
        l_value_10 = l_value_10 .. v117.ui_tables.unused["condition_add" .. l_value_10].value;
    end;
    for v656 = 1, #l_table_to_copy_0 do
        local v657 = l_table_to_copy_0[v656];
        if v657 == "xwayn_" then
            for v658 = 1, 7 do
                v653[v657 .. v658] = v117.ui_tables.antiaim[v657 .. l_value_10 .. v658].value_for_ref;
            end;
        else
            v653[v657] = v117.ui_tables.antiaim[v657 .. l_value_10].value_for_ref;
        end;
    end;
    local v659 = "ext.condition = " .. v96.encode(json.stringify(v653)) .. "<end>";
    v92.set_clipboard_text(v659, #v659);
    common.add_notify("Extension", "Condition copied");
end):tooltip("Copy to clipboard current condition settings.");
v117.ui_tables.unused.condition_list:button("paste_cond", "      \239\161\150      ", function()
    -- upvalues: v92 (ref), v96 (ref), v117 (ref)
    local v660 = v92.get_clipboard_text();
    v660 = string.match(v660, "(ext%.condition%s=%s.-<end>)");
    if not v660 or #v660 == 0 then
        common.add_notify("Extension", "Condition read failed");
        return;
    else
        local _, v662 = v660:find("ext.condition = ");
        if not v662 then
            common.add_notify("Extension", "Condition read failed");
            return;
        else
            local v663 = v660:find("<end>");
            if not v663 then
                common.add_notify("Extension", "Condition read failed");
                return;
            else
                v660 = v660:sub(v662, v663 - 1);
                local v664, v665 = v96.pcall_func(v660);
                if not v664 then
                    common.add_notify("Extension", "Condition decode failed");
                    return;
                else
                    local l_value_11 = v117.ui_tables.unused.condition_list.value;
                    if l_value_11 > 4 then
                        l_value_11 = l_value_11 .. v117.ui_tables.unused["condition_add" .. l_value_11].value;
                    end;
                    for v667, v668 in pairs(v665) do
                        local v669, v670 = v667:find("xwayn_");
                        v662 = v670;
                        v663 = v669;
                        if v662 then
                            v669 = v667:sub(#v667, #v667);
                            v117.ui_tables.antiaim[v667:sub(0, #v667 - 1) .. l_value_11 .. v669].ref:set(v668);
                        else
                            v117.ui_tables.antiaim[v667 .. l_value_11].ref:set(v668);
                        end;
                    end;
                    return;
                end;
            end;
        end;
    end;
end, true):tooltip("Paste condition settings from clipboard.");
v634.builder.create_ui_condition = function(v671, v672)
    -- upvalues: v634 (ref), v117 (ref)
    if v672 ~= 1 then
        v634.builder:switch("antiaim", "over_cond" .. v672, "Use Default Condition", true, function()
            -- upvalues: v117 (ref), v672 (ref)
            return v117.ui_tables.unused.condition_list.value == v672;
        end);
    else
        v634.builder:label("antiaim", "over_label" .. v672, "    ", function()
            -- upvalues: v117 (ref), v672 (ref)
            return v117.ui_tables.unused.condition_list.value == v672;
        end);
    end;
    local v673 = v117.create_group(v671, 2);
    v673:visible_condition(function()
        -- upvalues: v117 (ref), v672 (ref)
        return v117.ui_tables.unused.condition_list.value == v672 and v117.ui_tables.antiaim.list.value == 3;
    end);
    v117.ui_tables.antiaim.list:set_callback(function()
        -- upvalues: v673 (ref)
        v673:update();
    end);
    if v672 ~= 1 then
        v673:disabled_condition(function()
            -- upvalues: v117 (ref), v672 (ref)
            return v117.ui_tables.antiaim["over_cond" .. v672].value or v117.ui_tables.config.antiaim_owner.value ~= "" and v117.ui_tables.config.antiaim_owner.value ~= common.get_username();
        end);
        v117.ui_tables.antiaim["over_cond" .. v672]:set_callback(function()
            -- upvalues: v673 (ref)
            v673:update();
        end);
    else
        v673:disabled_condition(function()
            -- upvalues: v117 (ref)
            return v117.ui_tables.config.antiaim_owner.value ~= "" and v117.ui_tables.config.antiaim_owner.value ~= common.get_username();
        end);
    end;
    v117.ui_tables.unused.condition_list:set_callback(function()
        -- upvalues: v673 (ref)
        v673:update();
    end, true);
    local v674 = v673:switch("antiaim", "yaw_switch" .. v672, "Yaw", false, nil, " \a{Switch}\238\149\145\t\aDEFAULT", " \a{Link Active}\238\149\145\t\aDEFAULT");
    v674:slider("yaw_delay" .. v672, "\226\128\138\226\128\138 \a{Link Active}\238\138\158\t\226\128\138\aDEFAULTDelay Tick", 0, 13, 0, nil, function(v675)
        if v675 == 0 then
            return "Off";
        else
            return v675 .. "t";
        end;
    end);
    v674:label("-", " \a{Link Active}\226\128\138\239\137\142\t\aDEFAULTAdd");
    v674:slider("yaw_o" .. v672, "\226\128\138\226\128\138\226\128\138\a4a4a4aFF\239\135\160\t  \aDEFAULTShared", -180, 180, 0);
    v674:slider("yaw_l" .. v672, "\226\128\138  \a4a4a4aFF\239\132\133\t \226\128\138\226\128\138 \aDEFAULTLeft", -180, 180, 0);
    v674:slider("yaw_r" .. v672, "\226\128\138  \a4a4a4aFF\239\132\133\t \226\128\138\226\128\138 \aDEFAULTRight", -180, 180, 0);
    v674:label("-", " \a{Link Active}\238\143\142\t\aDEFAULTRandom");
    v674:slider("yaw_rando" .. v672, "\226\128\138\226\128\138\226\128\138\a4a4a4aFF\239\135\160\t \aDEFAULTShared", -180, 180, 0);
    v674:slider("yaw_randl" .. v672, "\226\128\138  \a4a4a4aFF\239\132\133\t \226\128\138\226\128\138\aDEFAULTLeft", -180, 180, 0);
    v674:slider("yaw_randr" .. v672, "\226\128\138  \a4a4a4aFF\239\132\133\t \226\128\138\226\128\138\aDEFAULTRight", -180, 180, 0);
    local v676 = v673:combo("antiaim", "yaw_mod_combo" .. v672, " \a4a4a4aFF  \238\143\150  \226\128\138\226\128\138\aDEFAULTModifier", {
        [1] = "Disabled", 
        [2] = "Center", 
        [3] = "Way", 
        [4] = "Random", 
        [5] = "Spin", 
        [6] = "Fake Flick", 
        [7] = "Skitter"
    }, "Disabled", function()
        -- upvalues: v674 (ref)
        return v674.value;
    end);
    v676:slider("yaw_deg" .. v672, " \a{Link Active}\238\137\146\t\aDEFAULTDegree", -180, 180, 0, nil, nil, function()
        -- upvalues: v676 (ref)
        return v676.str_value ~= "Disabled" and v676.str_value ~= "Fake Flick";
    end):set_disable_function(function()
        -- upvalues: v676 (ref), v117 (ref), v672 (ref)
        return v676.str_value == "Way" and v117.ui_tables.antiaim["xway_switch" .. v672] and v117.ui_tables.antiaim["xway_switch" .. v672].value;
    end);
    v676:slider("xway_counter" .. v672, " \a{Link Active}\238\137\148\t\aDEFAULTWay", 3, 7, 3, nil, function(v677)
        return v677 .. "-Way";
    end, function()
        -- upvalues: v676 (ref)
        return v676.str_value == "Way";
    end);
    v676:switch("xway_shuffle" .. v672, "Shuffle", false, function()
        -- upvalues: v676 (ref)
        return v676.str_value == "Way";
    end, nil, " \a{Switch}\239\129\180\t\aDEFAULT", " \a{Link Active}\239\129\180\t\aDEFAULT");
    v676:switch("xway_sync" .. v672, "Sync Desync", false, function()
        -- upvalues: v676 (ref)
        return v676.str_value == "Way" or v676.str_value == "Skitter";
    end, nil, " \a{Switch}\239\139\177\t\aDEFAULT", " \a{Link Active}\239\139\177\t\aDEFAULT");
    v676:switch("xway_switch" .. v672, "Custom", false, function()
        -- upvalues: v676 (ref)
        return v676.str_value == "Way";
    end, nil, " \a{Switch}\239\151\189\t\aDEFAULT", " \a{Link Active}\239\151\189\t\aDEFAULT");
    for v678 = 1, 7 do
        do
            local l_v678_0 = v678;
            v676:slider("xwayn_" .. v672 .. l_v678_0, "\a4a4a4aFF\239\132\132\t\a{Link Active}" .. l_v678_0 .. "\t\a4a4a4aFF\239\132\133\t\aDEFAULT", -180, 180, 0, nil, nil, function()
                -- upvalues: v117 (ref), v672 (ref), v676 (ref), l_v678_0 (ref)
                return v117.ui_tables.antiaim["xway_switch" .. v672].value and v676.str_value == "Way" and v117.ui_tables.antiaim["xway_counter" .. v672].value >= l_v678_0;
            end);
        end;
    end;
    v676:slider("flick_delay" .. v672, " \a{Link Active}\238\138\158\t\aDEFAULTDelay", 1, 10, 3, 0.1, function(v680)
        return v680 / 10 .. "s";
    end, function()
        -- upvalues: v676 (ref)
        return v676.str_value == "Fake Flick";
    end);
    v676:slider("flick_yaw" .. v672, " \a{Link Active}\239\128\158\t\aDEFAULTYaw", -180, 180, 0, nil, nil, function()
        -- upvalues: v676 (ref)
        return v676.str_value == "Fake Flick";
    end);
    local v681 = v673:switch("antiaim", "desync_switch" .. v672, "Desync", false, nil, "  \a{Switch}\238\149\136\t  \aDEFAULT", "  \a{Link Active}\238\149\136\t  \aDEFAULT");
    v681:combo("desync_freestand" .. v672, "\a{Link Active}\226\128\138\238\147\182\t\aDEFAULTFreestand", {
        [1] = "Disabled", 
        [2] = "Peek Fake", 
        [3] = "Peek Real"
    }, "Disabled");
    v681:label("-", "\a{Link Active}\226\128\138\238\137\147\t\aDEFAULTLimits");
    v681:slider("desync_l" .. v672, "  \a4a4a4aFF\239\132\133\t \226\128\138\aDEFAULTLeft", 0, 60, 60);
    v681:slider("desync_r" .. v672, "  \a4a4a4aFF\239\132\133\t \226\128\138\aDEFAULTRight", 0, 60, 60);
    v673:selectable("antiaim", "desync_mod" .. v672, " \a4a4a4aFF  \238\143\150  \226\128\138\226\128\138\aDEFAULTModifier", {
        [1] = "Jitter", 
        [2] = "Randomize Jitter"
    }, "", function()
        -- upvalues: v681 (ref)
        return v681.value;
    end);
    local v682 = v673:switch("antiaim", "def_switch" .. v672, "Defensive AA", false, nil, " \a{Switch}\238\128\162\t\226\128\138\226\128\138\aDEFAULT", " \a{Link Active}\238\128\162\t\226\128\138\226\128\138\aDEFAULT");
    v682:combo("def_pitch" .. v672, "\a4a4a4aFF\239\132\133\t\aDEFAULTPitch", {
        [1] = "Disabled", 
        [2] = "Down", 
        [3] = "Up", 
        [4] = "Random", 
        [5] = "Sway", 
        [6] = "Custom"
    }, "Disabled");
    v682:slider("pitch_deg" .. v672, " \a{Link Active}\238\137\146\t\aDEFAULTDegree", 0, 89, 0, nil, nil, function()
        -- upvalues: v117 (ref), v672 (ref)
        return v117.ui_tables.antiaim["def_pitch" .. v672].value == 4;
    end);
    v682:slider("pitch_custom" .. v672, " \a{Link Active}\238\137\146\t\aDEFAULTDegree ", -89, 89, 0, nil, nil, function()
        -- upvalues: v117 (ref), v672 (ref)
        return v117.ui_tables.antiaim["def_pitch" .. v672].value == 6;
    end);
    v682:combo("def_yaw" .. v672, "\a4a4a4aFF\239\132\133\t\aDEFAULTYaw", {
        [1] = "Default", 
        [2] = "Sideways", 
        [3] = "Extension", 
        [4] = "Random", 
        [5] = "Spin", 
        [6] = "Custom"
    }, "Disabled");
    v682:slider("def_yaw_deg" .. v672, " \a{Link Active}\238\137\146\t\aDEFAULTDegree", -180, 180, 0, nil, nil, function()
        -- upvalues: v117 (ref), v672 (ref)
        return v117.ui_tables.antiaim["def_yaw" .. v672].value >= 4;
    end);
    v682:slider("def_onetapspeed" .. v672, " \a{Link Active}\238\137\146\t\aDEFAULTSpeed", 0, 20, 10, nil, nil, function()
        -- upvalues: v117 (ref), v672 (ref)
        return v117.ui_tables.antiaim["def_yaw" .. v672].value == 3;
    end);
    local v683 = v673:switch("antiaim", "roll_switch" .. v672, "Roll", false, nil, " \a{Switch}\239\156\140\t\226\128\138\226\128\138\226\128\138\aDEFAULT", " \a{Link Active}\239\156\140\t\226\128\138\226\128\138\226\128\138\aDEFAULT");
    local v684 = v683:combo("roll_type" .. v672, " \a{Link Active} \239\131\137\t\aDEFAULTType", {
        [1] = "Default", 
        [2] = "Pitch Extended"
    }, "Default");
    v683:slider("roll_def_deg" .. v672, "   \a4a4a4aFF\239\132\133\t \226\128\138\aDEFAULTDegree", -180, 180, 0, nil, nil, function()
        -- upvalues: v684 (ref)
        return v684.value == 1;
    end);
    v683:slider("roll_ext_pit" .. v672, "   \a4a4a4aFF\239\132\133\t \226\128\138\aDEFAULTPitch", -180, 180, 0, nil, nil, function()
        -- upvalues: v684 (ref)
        return v684.value == 2;
    end);
    v683:slider("roll_ext_deg" .. v672, "   \a4a4a4aFF\239\132\133\t \226\128\138\aDEFAULTDegree", -180, 180, 0, nil, nil, function()
        -- upvalues: v684 (ref)
        return v684.value == 2;
    end);
end;
v634.builder.create_additional_ui_condition = function(v685, v686, v687)
    -- upvalues: v634 (ref), v117 (ref)
    v634.builder:switch("antiaim", "over_cond" .. v686 .. v687, "Use Default Condition", true, function()
        -- upvalues: v117 (ref), v686 (ref), v687 (ref)
        return v117.ui_tables.unused.condition_list.value == v686 and v117.ui_tables.unused["condition_add" .. v686].value == v687;
    end);
    if v686 == 1 then
        v117.ui_tables.antiaim["over_cond" .. v686 .. v687]:set_callback(function()
            -- upvalues: v117 (ref), v686 (ref), v687 (ref)
            v117.ui_tables.antiaim["over_cond" .. v686 .. v687]:disabled(true);
        end, true);
    end;
    local v688 = v117.create_group(v685, 2);
    v688:visible_condition(function()
        -- upvalues: v117 (ref), v686 (ref), v687 (ref)
        return v117.ui_tables.antiaim.list.value == 3 and v117.ui_tables.unused.condition_list.value == v686 and v117.ui_tables.unused["condition_add" .. v686].value == v687;
    end);
    v688:disabled_condition(function()
        -- upvalues: v117 (ref)
        return v117.ui_tables.config.antiaim_owner.value ~= "" and v117.ui_tables.config.antiaim_owner.value ~= common.get_username();
    end);
    v117.ui_tables.antiaim.list:set_callback(function()
        -- upvalues: v688 (ref)
        v688:update();
    end);
    v117.ui_tables.unused["condition_add" .. v686]:set_callback(function()
        -- upvalues: v688 (ref)
        v688:update();
    end);
    if v686 ~= 1 then
        v688:disabled_condition(function()
            -- upvalues: v117 (ref), v686 (ref), v687 (ref)
            return v117.ui_tables.antiaim["over_cond" .. v686 .. v687].value or v117.ui_tables.config.antiaim_owner.value ~= "" and v117.ui_tables.config.antiaim_owner.value ~= common.get_username();
        end);
        v117.ui_tables.antiaim["over_cond" .. v686 .. v687]:set_callback(function()
            -- upvalues: v688 (ref)
            v688:update();
        end);
    end;
    v117.ui_tables.unused.condition_list:set_callback(function()
        -- upvalues: v688 (ref)
        v688:update();
    end, true);
    local v689 = v688:switch("antiaim", "yaw_switch" .. v686 .. v687, "Yaw", false, nil, " \a{Switch}\238\149\145\t\aDEFAULT", " \a{Link Active}\238\149\145\t\aDEFAULT");
    v689:slider("yaw_delay" .. v686 .. v687, "\226\128\138\226\128\138 \a{Link Active}\238\138\158\t\226\128\138\aDEFAULTDelay Tick", 0, 13, 0, nil, function(v690)
        if v690 == 0 then
            return "Off";
        else
            return v690 .. "t";
        end;
    end);
    v689:label("-", " \a{Link Active}\226\128\138\239\137\142\t\aDEFAULTAdd");
    v689:slider("yaw_o" .. v686 .. v687, "\226\128\138\226\128\138\226\128\138\a4a4a4aFF\239\135\160\t  \aDEFAULTShared", -180, 180, 0);
    v689:slider("yaw_l" .. v686 .. v687, "\226\128\138  \a4a4a4aFF\239\132\133\t \226\128\138\226\128\138 \aDEFAULTLeft", -180, 180, 0);
    v689:slider("yaw_r" .. v686 .. v687, "\226\128\138  \a4a4a4aFF\239\132\133\t \226\128\138\226\128\138 \aDEFAULTRight", -180, 180, 0);
    v689:label("-", " \a{Link Active}\238\143\142\t\aDEFAULTRandom");
    v689:slider("yaw_rando" .. v686 .. v687, "\226\128\138\226\128\138\226\128\138\a4a4a4aFF\239\135\160\t \aDEFAULTShared", -180, 180, 0);
    v689:slider("yaw_randl" .. v686 .. v687, "\226\128\138  \a4a4a4aFF\239\132\133\t \226\128\138\226\128\138\aDEFAULTLeft", -180, 180, 0);
    v689:slider("yaw_randr" .. v686 .. v687, "\226\128\138  \a4a4a4aFF\239\132\133\t \226\128\138\226\128\138\aDEFAULTRight", -180, 180, 0);
    local v691 = v688:combo("antiaim", "yaw_mod_combo" .. v686 .. v687, " \a4a4a4aFF  \238\143\150  \226\128\138\226\128\138\aDEFAULTModifier", {
        [1] = "Disabled", 
        [2] = "Center", 
        [3] = "Way", 
        [4] = "Random", 
        [5] = "Spin", 
        [6] = "Fake Flick"
    }, "Disabled", function()
        -- upvalues: v689 (ref)
        return v689.value;
    end);
    v691:slider("yaw_deg" .. v686 .. v687, " \a{Link Active}\238\137\146\t\aDEFAULTDegree", -180, 180, 0, nil, nil, function()
        -- upvalues: v691 (ref)
        return v691.str_value ~= "Disabled" and v691.str_value ~= "Fake Flick";
    end):set_disable_function(function()
        -- upvalues: v691 (ref), v117 (ref), v686 (ref), v687 (ref)
        return v691.str_value == "Way" and v117.ui_tables.antiaim["xway_switch" .. v686 .. v687] and v117.ui_tables.antiaim["xway_switch" .. v686 .. v687].value;
    end);
    v691:slider("xway_counter" .. v686 .. v687, " \a{Link Active}\238\137\148\t\aDEFAULTWay", 3, 7, 3, nil, function(v692)
        return v692 .. "-Way";
    end, function()
        -- upvalues: v691 (ref)
        return v691.str_value == "Way";
    end);
    v691:switch("xway_shuffle" .. v686 .. v687, "Shuffle", false, function()
        -- upvalues: v691 (ref)
        return v691.str_value == "Way";
    end, nil, " \a{Switch}\239\129\180\t\aDEFAULT", " \a{Link Active}\239\129\180\t\aDEFAULT");
    v691:switch("xway_sync" .. v686 .. v687, "Sync Desync", false, function()
        -- upvalues: v691 (ref)
        return v691.str_value == "Way" or v691.str_value == "Skitter";
    end, nil, " \a{Switch}\239\139\177\t\aDEFAULT", " \a{Link Active}\239\139\177\t\aDEFAULT");
    v691:switch("xway_switch" .. v686 .. v687, "Custom", false, function()
        -- upvalues: v691 (ref)
        return v691.str_value == "Way";
    end, nil, " \a{Switch}\239\151\189\t\aDEFAULT", " \a{Link Active}\239\151\189\t\aDEFAULT");
    for v693 = 1, 7 do
        do
            local l_v693_0 = v693;
            v691:slider("xwayn_" .. v686 .. v687 .. l_v693_0, "\a4a4a4aFF\239\132\132\t\a{Link Active}" .. l_v693_0 .. "\t\a4a4a4aFF\239\132\133\t\aDEFAULT", -180, 180, 0, nil, nil, function()
                -- upvalues: v117 (ref), v686 (ref), v687 (ref), v691 (ref), l_v693_0 (ref)
                return v117.ui_tables.antiaim["xway_switch" .. v686 .. v687].value and v691.str_value == "Way" and v117.ui_tables.antiaim["xway_counter" .. v686 .. v687].value >= l_v693_0;
            end);
        end;
    end;
    v691:slider("flick_delay" .. v686 .. v687, " \a{Link Active}\238\138\158\t\aDEFAULTDelay", 1, 10, 3, 0.1, function(v695)
        return v695 / 10 .. "s";
    end, function()
        -- upvalues: v691 (ref)
        return v691.str_value == "Fake Flick";
    end);
    v691:slider("flick_yaw" .. v686 .. v687, " \a{Link Active}\239\128\158\t\aDEFAULTYaw", -180, 180, 0, nil, nil, function()
        -- upvalues: v691 (ref)
        return v691.str_value == "Fake Flick";
    end);
    local v696 = v688:switch("antiaim", "desync_switch" .. v686 .. v687, "Desync", false, nil, "  \a{Switch}\238\149\136\t  \aDEFAULT", "  \a{Link Active}\238\149\136\t  \aDEFAULT");
    v696:combo("desync_freestand" .. v686 .. v687, "\a{Link Active}\226\128\138\238\147\182\t\aDEFAULTFreestand", {
        [1] = "Disabled", 
        [2] = "Peek Fake", 
        [3] = "Peek Real"
    }, "Disabled");
    v696:label("-", "\a{Link Active}\226\128\138\238\137\147\t\aDEFAULTLimits");
    v696:slider("desync_l" .. v686 .. v687, "  \a4a4a4aFF\239\132\133\t \226\128\138\aDEFAULTLeft", 0, 60, 60);
    v696:slider("desync_r" .. v686 .. v687, "  \a4a4a4aFF\239\132\133\t \226\128\138\aDEFAULTRight", 0, 60, 60);
    v688:selectable("antiaim", "desync_mod" .. v686 .. v687, " \a4a4a4aFF  \238\143\150  \226\128\138\226\128\138\aDEFAULTModifier", {
        [1] = "Jitter", 
        [2] = "Randomize Jitter"
    }, "", function()
        -- upvalues: v696 (ref)
        return v696.value;
    end);
    local v697 = v688:switch("antiaim", "def_switch" .. v686 .. v687, "Defensive AA", false, nil, " \a{Switch}\238\128\162\t\226\128\138\226\128\138\aDEFAULT", " \a{Link Active}\238\128\162\t\226\128\138\226\128\138\aDEFAULT");
    v697:combo("def_pitch" .. v686 .. v687, "\a4a4a4aFF\239\132\133\t\aDEFAULTPitch", {
        [1] = "Disabled", 
        [2] = "Down", 
        [3] = "Up", 
        [4] = "Random", 
        [5] = "Sway", 
        [6] = "Custom"
    }, "Disabled");
    v697:slider("pitch_deg" .. v686 .. v687, " \a{Link Active}\238\137\146\t\aDEFAULTDegree ", 0, 89, 0, nil, nil, function()
        -- upvalues: v117 (ref), v686 (ref), v687 (ref)
        return v117.ui_tables.antiaim["def_pitch" .. v686 .. v687].value == 4;
    end);
    v697:slider("pitch_custom" .. v686 .. v687, " \a{Link Active}\238\137\146\t\aDEFAULTDegree", -89, 89, 0, nil, nil, function()
        -- upvalues: v117 (ref), v686 (ref), v687 (ref)
        return v117.ui_tables.antiaim["def_pitch" .. v686 .. v687].value == 6;
    end);
    v697:combo("def_yaw" .. v686 .. v687, "\a4a4a4aFF\239\132\133\t\aDEFAULTYaw", {
        [1] = "Default", 
        [2] = "Sideways", 
        [3] = "Extension", 
        [4] = "Random", 
        [5] = "Custom"
    }, "Disabled");
    v697:slider("def_yaw_deg" .. v686 .. v687, " \a{Link Active}\238\137\146\t\aDEFAULTDegree", -180, 180, 0, nil, nil, function()
        -- upvalues: v117 (ref), v686 (ref), v687 (ref)
        return v117.ui_tables.antiaim["def_yaw" .. v686 .. v687].value >= 4;
    end);
    v697:slider("def_onetapspeed" .. v686 .. v687, " \a{Link Active}\238\137\146\t\aDEFAULTSpeed", 0, 20, 10, nil, nil, function()
        -- upvalues: v117 (ref), v686 (ref), v687 (ref)
        return v117.ui_tables.antiaim["def_yaw" .. v686 .. v687].value == 3;
    end);
    local v698 = v688:switch("antiaim", "roll_switch" .. v686 .. v687, "Roll", false, nil, " \a{Switch}\239\156\140\t\226\128\138\226\128\138\226\128\138\aDEFAULT", " \a{Link Active}\239\156\140\t\226\128\138\226\128\138\226\128\138\aDEFAULT");
    local v699 = v698:combo("roll_type" .. v686 .. v687, " \a{Link Active} \239\131\137\t\aDEFAULTType", {
        [1] = "Default", 
        [2] = "Pitch Extended"
    }, "Default");
    v698:slider("roll_def_deg" .. v686 .. v687, "   \a4a4a4aFF\239\132\133\t \226\128\138\aDEFAULTDegree", -180, 180, 0, nil, nil, function()
        -- upvalues: v699 (ref)
        return v699.value == 1;
    end);
    v698:slider("roll_ext_pit" .. v686 .. v687, "   \a4a4a4aFF\239\132\133\t \226\128\138\aDEFAULTPitch", -180, 180, 0, nil, nil, function()
        -- upvalues: v699 (ref)
        return v699.value == 2;
    end);
    v698:slider("roll_ext_deg" .. v686 .. v687, "   \a4a4a4aFF\239\132\133\t \226\128\138\aDEFAULTDegree", -180, 180, 0, nil, nil, function()
        -- upvalues: v699 (ref)
        return v699.value == 2;
    end);
end;
for v700 = 1, #v117.ui_tables.unused.condition_list.elements_array do
    local v701 = v117.ui_tables.unused.condition_list.elements_array[v700];
    do
        local l_v700_0 = v700;
        do
            local l_v701_0 = v701;
            v634.builder:label("unused", "empty", "", function()
                -- upvalues: v117 (ref), l_v700_0 (ref), l_v701_0 (ref)
                return v117.ui_tables.unused.condition_list.value == l_v700_0 and l_v701_0 ~= "Crouching" and l_v701_0 ~= "In Air";
            end);
            if l_v701_0 == "Crouching" then
                v634.builder:combo("unused", "condition_add" .. l_v700_0, "\a4a4a4aFF  \238\143\150  \226\128\138\226\128\138\aDEFAULTAdditional", {
                    [1] = "Default", 
                    [2] = "Sneaking"
                }, "Default", function()
                    -- upvalues: v117 (ref)
                    return v117.ui_tables.unused.condition_list.str_value == "Crouching";
                end);
            end;
            if l_v701_0 == "In Air" then
                v634.builder:combo("unused", "condition_add" .. l_v700_0, "\a4a4a4aFF  \238\143\150  \226\128\138\226\128\138\aDEFAULTAdditional", {
                    [1] = "Default", 
                    [2] = "Crouching"
                }, "Default", function()
                    -- upvalues: v117 (ref)
                    return v117.ui_tables.unused.condition_list.str_value == "In Air";
                end);
            end;
            if l_v700_0 <= 4 then
                v634.builder.create_ui_condition(" Builder \a{Switch}\239\131\154 \a{Link Active}" .. l_v701_0, l_v700_0);
            else
                local v704 = {
                    Crouching = {
                        [1] = "Default", 
                        [2] = "Sneaking"
                    }, 
                    ["In Air"] = {
                        [1] = "Default", 
                        [2] = "Crouching"
                    }
                };
                for v705 = 1, 2 do
                    v634.builder.create_additional_ui_condition(" Builder \a{Switch}\239\131\154\aDEFAULT " .. l_v701_0 .. "\a{Switch} \239\131\154 \a{Link Active}" .. v704[l_v701_0][v705], l_v700_0, v705);
                end;
            end;
        end;
    end;
end;
v634.additional = v117.create_group(" Anti Aim \a{Switch}\239\131\154 \a{Link Active}Extra", 1);
v634.additional:disabled_condition(function()
    -- upvalues: v117 (ref)
    return v117.ui_tables.antiaim.list.value == 1;
end);
v634.additional:label("antiaim", "base_label", "\a{Link Active}\239\128\149\t\aDEFAULTBase Settings");
v117.ui_tables.antiaim.base_label:combo("base_pitch", "\a{Link Active}\239\141\161   \aDEFAULTPitch", {
    [1] = "Down", 
    [2] = "Disabled", 
    [3] = "Fake Down", 
    [4] = "Fake Up"
}, "Down");
v117.ui_tables.antiaim.base_label:combo("base_yaw", "Yaw Base", {
    [1] = "At Target", 
    [2] = "Local View"
}, "At Target");
v117.ui_tables.antiaim.base_label:switch("base_compensate", "Disabled", false, nil, nil, "\a{Switch} \238\130\141\t\226\128\138\226\128\138\aDEFAULT", "\a{Link Active} \238\130\141\t\226\128\138\226\128\138\aDEFAULT"):set_disable_function(function()
    return true;
end);
v117.ui_tables.antiaim.base_label:switch("predict_switch", "Predictive At Target", false, nil, nil, " \a{Switch}\238\130\140\t\226\128\138\226\128\138\aDEFAULT", " \a{Link Active}\238\130\140\t\226\128\138\226\128\138\aDEFAULT");
v634.additional:label("antiaim", "manual_label", "\a{Link Active}\239\129\135\t\226\128\138\aDEFAULTManual Base");
v117.ui_tables.antiaim.manual_label:combo("manual_type", "Type", {
    [1] = "Toggle", 
    [2] = "Hold"
});
v117.ui_tables.antiaim.manual_label:combo("manual_view", "Yaw Base", {
    [1] = "Local View", 
    [2] = "At Target"
});
v117.ui_tables.antiaim.manual_label:label("-", "\a{Link Active} \238\135\130\t\aDEFAULTKeybinds");
v117.ui_tables.antiaim.manual_label:hotkey("back_key", " \a4a4a4aFF \239\132\133\t  \aDEFAULTBackward", 0, 1);
v117.ui_tables.antiaim.manual_label:hotkey("left_key", " \a4a4a4aFF \239\132\133\t  \aDEFAULTLeft", 0, 1);
v117.ui_tables.antiaim.manual_label:hotkey("right_key", " \a4a4a4aFF \239\132\133\t  \aDEFAULTRight", 0, 1);
v117.ui_tables.antiaim.manual_label:hotkey("forward_key", " \a4a4a4aFF \239\132\133\t  \aDEFAULTForward", 0, 1);
v634.additional:label("antiaim", "frees_label", "\a{Link Active}\239\129\190\t\226\128\138\aDEFAULTFreestanding Options");
v117.ui_tables.antiaim.frees_label:selectable("frees_disable", "\a{Link Active}\239\136\132\t\226\128\138\aDEFAULTDisablers", {
    [1] = "Standing", 
    [2] = "Moving", 
    [3] = "Slow Walking", 
    [4] = "Crouching", 
    [5] = "In Air"
}, "");
v117.ui_tables.antiaim.frees_label:switch("frees_dis_def", "Disable Defensive AA", true, nil, nil, "\a{Switch}\238\137\139\t\aDEFAULT", "\a{Link Active}\238\137\139\t\aDEFAULT");
v117.ui_tables.antiaim.frees_label:combo("frees_pitch", " \226\128\138\a4a4a4aFF\239\132\133\t  \aDEFAULTPitch", {
    [1] = "Disabled", 
    [2] = "Down", 
    [3] = "Up", 
    [4] = "Sway", 
    [5] = "Random", 
    [6] = "Custom"
}, "Disabled"):set_disable_function(function()
    -- upvalues: v117 (ref)
    return v117.ui_tables.antiaim.frees_dis_def.value;
end);
v117.ui_tables.antiaim.frees_label:slider("frees_pitch_custom", " \a{Link Active}\238\137\146\t\aDEFAULTCustom", -89, 89, 0, nil, nil, function()
    -- upvalues: v117 (ref)
    if v117.ui_tables.antiaim.frees_pitch_custom then
        v117.ui_tables.antiaim.frees_pitch_custom:visible(true);
    end;
    return v117.ui_tables.antiaim.frees_pitch.str_value == "Custom";
end):set_disable_function(function()
    -- upvalues: v117 (ref)
    return v117.ui_tables.antiaim.frees_dis_def.value;
end);
v117.ui_tables.antiaim.frees_label:combo("frees_yaw", " \226\128\138\a4a4a4aFF\239\132\133\t  \aDEFAULTYaw", {
    [1] = "Reversed", 
    [2] = "Default", 
    [3] = "Sideways", 
    [4] = "Extension", 
    [5] = "Random"
}, "Reversed"):set_disable_function(function()
    -- upvalues: v117 (ref)
    return v117.ui_tables.antiaim.frees_dis_def.value;
end);
v117.ui_tables.antiaim.frees_label:slider("frees_yaw_onetap", " \a{Link Active}\238\138\158\t\aDEFAULTSpeed", 0, 20, 0, nil, nil, function()
    -- upvalues: v117 (ref)
    if v117.ui_tables.antiaim.frees_yaw_onetap then
        v117.ui_tables.antiaim.frees_yaw_onetap:visible(true);
    end;
    return v117.ui_tables.antiaim.frees_yaw.str_value == "Extension";
end):set_disable_function(function()
    -- upvalues: v117 (ref)
    return v117.ui_tables.antiaim.frees_dis_def.value;
end);
v634.additional:label("antiaim", "breaklc_label", "\a{Link Active}\238\132\133\t\226\128\138\aDEFAULTBreak LC");
v117.ui_tables.antiaim.breaklc_label:selectable("breaklc_always", "\a{Link Active}\238\146\187\t\aDEFAULTAlways On", {
    [1] = "Standing", 
    [2] = "Moving", 
    [3] = "Slow Walking", 
    [4] = "Crouching", 
    [5] = "In Air", 
    [6] = "Safe Head"
});
v117.ui_tables.antiaim.breaklc_label:selectable("breaklc_ping", "\a{Link Active}\239\159\128\t\aDEFAULTPing Based", {
    [1] = "Standing", 
    [2] = "Moving", 
    [3] = "Slow Walking", 
    [4] = "Crouching", 
    [5] = "In Air"
});
v117.ui_tables.antiaim.breaklc_label:selectable("breaklc_extra", "\a{Link Active}\239\130\176\t\aDEFAULTExtra", {
    [1] = "Condition Change", 
    [2] = "Weapon Change", 
    [3] = "Reloading"
});
v634.additional:switch("antiaim", "legitaa_switch", "Legit AA", false, nil, "\a{Switch} \239\149\148\t\aDEFAULT\226\128\138\226\128\138", "\a{Link Active} \239\149\148\t\aDEFAULT\226\128\138\226\128\138");
v117.ui_tables.antiaim.legitaa_switch:combo("legitaa_pitch", "\a{Link Active}\226\128\138\239\141\161   \226\128\138\226\128\138\226\128\138\aDEFAULTPitch", {
    [1] = "Camera Based", 
    [2] = "Locked", 
    [3] = "Custom"
}, "Camera Based");
v117.ui_tables.antiaim.legitaa_switch:slider("legitaa_custom", "\a{Link Active} \238\137\146\t\226\128\138\226\128\138\aDEFAULTCustom", -89, 89, 0, nil, nil, function()
    -- upvalues: v117 (ref)
    if v117.ui_tables.antiaim.legitaa_custom then
        v117.ui_tables.antiaim.legitaa_custom:visible(true);
    end;
    return v117.ui_tables.antiaim.legitaa_pitch.str_value == "Custom";
end);
v117.ui_tables.antiaim.legitaa_switch:switch("legitaa_desync", "Desync", false, nil, nil, "  \a{Switch}\238\149\136\t  \226\128\138\aDEFAULT", "  \a{Link Active}\238\149\136\t  \226\128\138\aDEFAULT");
v117.ui_tables.antiaim.legitaa_switch:combo("legitaa_freestand", " \a4a4a4aFF  \238\143\150\t\aDEFAULTFreestand", {
    [1] = "Disabled", 
    [2] = "Peek Fake", 
    [3] = "Peek Real"
}, "Disabled", function()
    -- upvalues: v117 (ref)
    if v117.ui_tables.antiaim.legitaa_freestand then
        v117.ui_tables.antiaim.legitaa_freestand:visible(true);
    end;
    return v117.ui_tables.antiaim.legitaa_desync.value;
end);
v117.ui_tables.antiaim.legitaa_switch:selectable("legitaa_mod", " \a4a4a4aFF  \238\143\150\t\aDEFAULTModifier", {
    [1] = "Jitter", 
    [2] = "Randomize Jitter"
}, "", function()
    -- upvalues: v117 (ref)
    if v117.ui_tables.antiaim.legitaa_mod then
        v117.ui_tables.antiaim.legitaa_mod:visible(true);
    end;
    return v117.ui_tables.antiaim.legitaa_desync.value;
end);
v634.additional:switch("antiaim", "safe_switch", "Safe Head", false, nil, "\a{Switch}\239\160\135\t\aDEFAULT", "\a{Link Active}\239\160\135\t\aDEFAULT");
v117.ui_tables.antiaim.safe_switch:switch("safe_def", "Disable Defensive AA", false, nil, nil, "\a{Switch}\238\137\139\t\aDEFAULT", "\a{Link Active}\238\137\139\t\aDEFAULT");
v117.ui_tables.antiaim.list.update_active_tab();
v117.active_tab = "\a{Link Active}\239\131\137\aDEFAULT Other";
local v706 = {
    navigation = v117.create_group("Other", 1)
};
v706.navigation:list("navigation", "list", "", {
    [1] = "Ragebot", 
    [2] = "Visuals", 
    [3] = "Misc"
});
v117.ui_tables.navigation.list.update_active_tab = function()
    -- upvalues: v117 (ref)
    local l_list_2 = v117.ui_tables.navigation.list;
    local v708 = {};
    local v709 = {
        [1] = "\239\129\155", 
        [2] = "\239\162\144", 
        [3] = "\239\159\153"
    };
    for v710 = 1, #l_list_2.elements_array do
        v708[#v708 + 1] = l_list_2.value == v710 and "\a{Link Active}" .. v709[v710] .. "   \aDEFAULT" .. l_list_2.elements_array[v710] or "\a{Switch}" .. v709[v710] .. "   \a4a4a4aFF" .. l_list_2.elements_array[v710];
    end;
    l_list_2.ref:update(v708);
end;
v117.ui_tables.navigation.list:set_callback(function()
    -- upvalues: v117 (ref), v706 (ref)
    v117.ui_tables.navigation.list.update_active_tab();
    if v706.ragebot then
        v706.ragebot:update();
    end;
    if v706.ragebot_hitchance then
        v706.ragebot_hitchance:update();
    end;
    if v706.visuals_main_settings then
        v706.visuals_main_settings:update();
    end;
    if v706.visuals_localplayer then
        v706.visuals_localplayer:update();
    end;
    if v706.visuals_indicators then
        v706.visuals_indicators:update();
    end;
    if v706.visuals_extra then
        v706.visuals_extra:update();
    end;
    if v706.visuals_world then
        v706.visuals_world:update();
    end;
    if v706.misc then
        v706.misc:update();
    end;
end, true);
v706.ragebot = v117.create_group(" Other \a{Switch}\239\131\154 \a{Link Active}Ragebot", 2);
v706.ragebot:visible_condition(function()
    -- upvalues: v117 (ref)
    return v117.ui_tables.navigation.list.value == 1;
end);
v706.ragebot:switch("ragebot", "dormant_switch", "Dormant Aimbot", false, nil, "\a{Switch}\226\128\138\239\138\168\t\aDEFAULT", "\a{Link Active}\226\128\138\239\138\168\t\aDEFAULT");
v117.ui_tables.ragebot.dormant_switch:switch("dormant_dmgswitch", "\a{Link Active} \239\129\155\t \aDEFAULTDamage from Ragebot", true);
v117.ui_tables.ragebot.dormant_switch:slider("dormant_dmg", "\a{Link Active}\226\128\138\238\134\189\t\aDEFAULTDamage", 1, 100, 5):set_disable_function(function()
    -- upvalues: v117 (ref)
    return v117.ui_tables.ragebot.dormant_dmgswitch.value;
end);
v706.ragebot:switch("ragebot", "aipeek_switch", "AI Peek", false, nil, "\a{Switch}\226\128\138\239\149\132\t\aDEFAULT", "\a{Link Active}\226\128\138\239\149\132\t\aDEFAULT");
v117.ui_tables.ragebot.aipeek_switch:label("ai_peek_label", "Recommended to Use with Min. Damage", nil, nil, true);
v117.ui_tables.ragebot.aipeek_switch:slider("aipeek_dist", "Peek Distance", 0, 100, 30, nil, nil, nil, true);
v117.ui_tables.ragebot.aipeek_switch:slider("aipeek_delay", "Peek Delay", 0, 5, 1, nil, function(v711)
    return v711 .. "t";
end, nil, true);
v117.ui_tables.ragebot.aipeek_switch:switch("aipeek_keys", "Disable if Move. Keys Pressed", true, nil, true);
v117.ui_tables.ragebot.aipeek_switch:switch("aipeek_dt", "Waiting for DT Charge", true, nil, true);
v117.ui_tables.ragebot.aipeek_switch:switch("aipeek_vis", "Visualize", false, nil, true);
v706.ragebot:switch("ragebot", "discharge_switch", "Auto Discharge", false, nil, "\a{Switch}\226\128\138\238\149\147\t\aDEFAULT", "\a{Link Active}\226\128\138\238\149\147\t\aDEFAULT");
v117.ui_tables.ragebot.discharge_switch:selectable("discharge_combo", "\a{Link Active}\226\128\138\238\134\157\t\aDEFAULTWeapons", {
    [1] = "SSG-08", 
    [2] = "AWP", 
    [3] = "AutoSnipers", 
    [4] = "Shotguns", 
    [5] = "SMGs", 
    [6] = "R8 Revolver", 
    [7] = "Desert Eagle", 
    [8] = "Pistols", 
    [9] = "Knife", 
    [10] = "Zeus"
});
v117.ui_tables.ragebot.discharge_switch:combo("discharge_mode", "\a{Link Active}\238\150\162\t\aDEFAULTMode", {
    [1] = "Default", 
    [2] = "Fast Fall", 
    [3] = "After LC"
});
v117.ui_tables.ragebot.discharge_switch:slider("discharge_delay", "\a{Link Active}\226\128\138\238\138\158  \226\128\138\226\128\138\226\128\138\226\128\138\aDEFAULTDelay", 3, 11, 0, 0.1, function(v712)
    if v712 == 11 then
        return "-";
    else
        return v712 / 10 .. "s";
    end;
end):set_disable_function(function()
    -- upvalues: v117 (ref)
    return #v117.ui_tables.ragebot.discharge_combo.value == 0;
end);
v706.ragebot:switch("ragebot", "air_exploit", "Air Break LC Exploit", false, nil, "\a{Switch}\226\128\138\238\148\171\t\aDEFAULT", "\a{Link Active}\226\128\138\238\148\171\t\aDEFAULT");
v706.ragebot:switch("ragebot", "airstop_switch", "Airstop", false, nil, "\a{Switch} \226\128\138\239\156\174\t\aDEFAULT", "\a{Link Active} \226\128\138\239\156\174\t\aDEFAULT");
v117.ui_tables.ragebot.airstop_switch:listable("airstop_cond", "Conditions", {
    [1] = "Press Shift", 
    [2] = "Enemy Close"
});
v706.ragebot:switch("ragebot", "grenade_switch", "Grenade Release", false, nil, "\a{Switch} \226\128\138\239\135\162\t\aDEFAULT", "\a{Link Active} \226\128\138\239\135\162\t\aDEFAULT");
v117.ui_tables.ragebot.grenade_switch:slider("grenade_damage", "Damage", 1, 100, 100, nil, function(v713)
    return v713 .. "%";
end);
v706.ragebot:switch("ragebot", "toss_switch", "Disabled", false, nil, "\a{Switch}\226\128\138\239\162\153\t\aDEFAULT", "\a{Link Active}\226\128\138\239\162\153\t\aDEFAULT"):disabled(true);
v706.ragebot:switch("ragebot", "roll_resolver", "Roll Resolver", false, nil, "\a{Switch}\226\128\138\226\128\138\238\134\157   \226\128\138\aDEFAULT", "\a{Link Active}\226\128\138\226\128\138\238\134\157   \226\128\138\aDEFAULT");
v117.ui_tables.ragebot.roll_resolver:label("roll_label", "\aff3636FF\239\129\177\aDEFAULT Don't use if you don't know what you are doing");
v117.ui_tables.ragebot.roll_resolver:slider("roll_deg", "\a{Link Active}\238\137\146\t\aDEFAULTDegree", -100, 100, 50);
v117.ui_tables.ragebot.roll_resolver:switch("roll_pitch_switch", "Override Pitch", false, nil, nil, "\a{Switch}\239\141\161   \aDEFAULT", "\a{Link Active}\239\141\161   \aDEFAULT");
v117.ui_tables.ragebot.roll_resolver:slider("roll_pitch_deg", "\a{Link Active}\238\137\146\t\aDEFAULTDegree", 0, 180, 89, nil, nil, function()
    -- upvalues: v117 (ref)
    return v117.ui_tables.ragebot.roll_pitch_switch.value;
end);
v706.ragebot:switch("ragebot", "antidef_switch", "Anti Defensive", false, nil, "\a{Switch}\226\128\138\238\137\139\t\aDEFAULT", "\a{Link Active}\226\128\138\238\137\139\t\aDEFAULT");
v706.ragebot_hitchance = v117.create_group(" Other \a{Switch}\239\131\154\aDEFAULT Ragebot\a{Switch} \239\131\154 \a{Link Active}Hitchance", 1);
v706.ragebot_hitchance:visible_condition(function()
    -- upvalues: v117 (ref)
    return v117.ui_tables.navigation.list.value == 1;
end);
v706.ragebot_hitchance:list("unused", "hitchance_list", "", {
    [1] = "Scout", 
    [2] = "AWP", 
    [3] = "Auto", 
    [4] = "Revolver", 
    [5] = "Desert Eagle", 
    [6] = "Shotguns", 
    [7] = "SMG"
});
for v714 = 1, #v117.ui_tables.unused.hitchance_list.elements_array do
    do
        local l_v714_0 = v714;
        if l_v714_0 == 1 then
            v706.ragebot_hitchance:switch("ragebot", "jumpscout", "Jumpscout", false, function()
                -- upvalues: v117 (ref), l_v714_0 (ref)
                return v117.ui_tables.unused.hitchance_list.value == l_v714_0;
            end, "\a{Switch}  \239\157\182  \226\128\138\226\128\138\aDEFAULT", "\a{Link Active}  \239\157\182  \226\128\138\226\128\138\aDEFAULT");
        end;
        v706.ragebot_hitchance:slider("ragebot", "air_" .. l_v714_0, "\a{Link Active}  \226\128\138\238\136\173\t \aDEFAULTIn Air          ", -1, 100, -1, nil, function(v716)
            if v716 < 0 then
                return "Off";
            elseif v716 == 0 then
                return "Auto";
            else
                return v716 .. " %";
            end;
        end, function()
            -- upvalues: v117 (ref), l_v714_0 (ref)
            return v117.ui_tables.unused.hitchance_list.value == l_v714_0;
        end);
        v117.ui_tables.ragebot["air_" .. l_v714_0]:set_callback(function()
            -- upvalues: v117 (ref)
            v117.ui_tables.unused.hitchance_list.update_active_tab();
        end);
        v706.ragebot_hitchance:slider("ragebot", "noscope_" .. l_v714_0, "\a{Link Active}  \239\152\131    \aDEFAULTNo Scope", -1, 100, -1, nil, function(v717)
            if v717 < 0 then
                return "Off";
            elseif v717 == 0 then
                return "Auto";
            else
                return v717 .. " %";
            end;
        end, function()
            -- upvalues: v117 (ref), l_v714_0 (ref)
            return v117.ui_tables.unused.hitchance_list.value == l_v714_0;
        end):set_disable_function(function()
            -- upvalues: l_v714_0 (ref)
            return l_v714_0 > 3;
        end);
        v117.ui_tables.ragebot["noscope_" .. l_v714_0]:set_callback(function()
            -- upvalues: v117 (ref)
            v117.ui_tables.unused.hitchance_list.update_active_tab();
        end);
        v706.ragebot_hitchance:slider("ragebot", "noscope_dist" .. l_v714_0, "\a4a4a4aFF    \226\128\138\238\143\150 \226\128\138\226\128\138\aDEFAULTDistance", 0, 101, 0, nil, function(v718)
            local v719 = v718 / 10;
            if v718 > 100 then
                return "inf.";
            else
                return v719 .. "m";
            end;
        end, function()
            -- upvalues: v117 (ref), l_v714_0 (ref)
            return v117.ui_tables.unused.hitchance_list.value == l_v714_0 and v117.ui_tables.ragebot["noscope_" .. l_v714_0].value >= 0;
        end);
    end;
end;
v117.ui_tables.unused.hitchance_list.update_active_tab = function()
    -- upvalues: v117 (ref)
    local l_hitchance_list_0 = v117.ui_tables.unused.hitchance_list;
    local v721 = {};
    for v722 = 1, #l_hitchance_list_0.elements_array do
        local v723 = "  ";
        if v117.ui_tables.ragebot["noscope_" .. v722].value >= 0 then
            v723 = "\aFBCEB1FF\226\128\162\aDEFAULT";
        end;
        if v117.ui_tables.ragebot["air_" .. v722].value >= 0 then
            v723 = "\a{Link Active}\226\128\162\aDEFAULT" .. v723;
        else
            v723 = "  " .. v723;
        end;
        if v722 == l_hitchance_list_0.value then
            v723 = v723 .. "   \aDEFAULT" .. l_hitchance_list_0.elements_array[v722];
        else
            v723 = v723 .. "   \a4f4f4fFF" .. l_hitchance_list_0.elements_array[v722];
        end;
        v721[#v721 + 1] = v723;
    end;
    l_hitchance_list_0.ref:update(v721);
end;
v117.ui_tables.unused.hitchance_list:set_callback(function()
    -- upvalues: v117 (ref)
    v117.ui_tables.unused.hitchance_list.update_active_tab();
end, true);
v706.visuals_main_settings = v117.create_group(" Other \a{Switch}\239\131\154\aDEFAULT Visuals\a{Switch} \239\131\154 \a{Link Active}Settings", 2);
v706.visuals_main_settings:visible_condition(function()
    -- upvalues: v117 (ref)
    return v117.ui_tables.navigation.list.value == 2;
end);
v706.visuals_main_settings:label("visuals", "color_label", "\a{Link Active}\239\151\131\t\aDEFAULTColor Settings");
v117.ui_tables.visuals.color_label:switch("color_use_theme", "Theme Colors", true, nil, nil, "\a{Switch}\239\130\172\t\aDEFAULT", "\a{Link Active}\239\130\172\t\aDEFAULT");
v117.ui_tables.visuals.color_label:color_picker("main_color", "Main Color", ui.get_style("Link Active")):set_disable_function(function()
    -- upvalues: v117 (ref)
    return v117.ui_tables.visuals.color_use_theme.value;
end);
v117.ui_tables.visuals.color_label:color_picker("second_color", "Second Color", ui.get_style("Link Active")):set_disable_function(function()
    -- upvalues: v117 (ref)
    return v117.ui_tables.visuals.color_use_theme.value;
end);
v706.visuals_main_settings:label("visuals", "settings_label", "\a{Link Active}\239\152\159\t\aDEFAULTDisabled"):disabled(true);
v117.ui_tables.visuals.settings_label:combo("dpi_scale", "\a{Link Active}\239\137\135\t\aDEFAULTDPI Scale", {
    [1] = "Auto", 
    [2] = "100%", 
    [3] = "125%", 
    [4] = "150%", 
    [5] = "175%", 
    [6] = "200%"
});
v117.ui_tables.visuals.settings_label:slider("anim_speed", "\a{Link Active}\239\152\170\t \aDEFAULTAnim. Speed", 1, 20, 10, 0.1, function(v724)
    if #tostring(v724 / 10) ~= 1 then
        return v724 / 10 .. "";
    else
        return v724 / 10 .. ".0";
    end;
end);
v706.visuals_main_settings:label("visuals", "widgets_label", "\a{Link Active}\239\144\142\t\aDEFAULTDisabled"):disabled(true);
v117.ui_tables.visuals.widgets_label:listable("widgets_list", "", {
    [1] = "Watermark", 
    [2] = "Keybind List", 
    [3] = "Spectator List", 
    [4] = "Slowdown Bar"
}, nil, nil);
v706.visuals_localplayer = v117.create_group(" Other \a{Switch}\239\131\154\aDEFAULT Visuals\a{Switch} \239\131\154 \a{Link Active}Localplayer", 1);
v706.visuals_localplayer:visible_condition(function()
    -- upvalues: v117 (ref)
    return v117.ui_tables.navigation.list.value == 2;
end);
v706.visuals_localplayer:switch("visuals", "breaker_switch", "Anim. Breakers", false, nil, "\a{Switch}\239\136\157\t \226\128\138\aDEFAULT", "\a{Link Active}\239\136\157\t \226\128\138\aDEFAULT");
v117.ui_tables.visuals.breaker_switch:listable("breaker_list", "                        Animations", {
    [1] = "Backward Legs", 
    [2] = "Moon Walk", 
    [3] = "Air Walk", 
    [4] = "Static Legs in Air", 
    [5] = "Adjust Move Lean"
});
v117.ui_tables.visuals.breaker_switch:slider("breaker_lean_value", "Lean Value", -1, 10, -1, 0.1, function(v725)
    if v725 == -1 then
        return "def.";
    elseif #tostring(v725 / 10) ~= 1 then
        return v725 / 10 .. "";
    else
        return v725 / 10 .. ".0";
    end;
end, function()
    -- upvalues: v117 (ref)
    return v117.ui_tables.visuals.breaker_list.value_by_name[5] == true;
end);
v706.visuals_localplayer:switch("visuals", "transparency_switch", "Transparency", false, nil, "\a{Switch}\239\145\176\t\226\128\138\aDEFAULT", "\a{Link Active}\239\145\176\t\226\128\138\aDEFAULT");
v117.ui_tables.visuals.transparency_switch:switch("transparency_keep", "Keep in Scope", false);
v117.ui_tables.visuals.transparency_switch:slider("transparency_alpha", "Default", 0, 100, 100, 0.01);
v117.ui_tables.visuals.transparency_switch:slider("transparency_scope", "Scoped", 0, 100, 50, 0.01);
v117.ui_tables.visuals.transparency_switch:slider("transparency_nade", "Nade", 0, 100, 50, 0.01);
v706.visuals_localplayer:switch("visuals", "anim_switch", "Animations", false, nil, "\a{Switch}\238\129\152\t\aDEFAULT", "\a{Link Active}\238\129\152\t\aDEFAULT");
v117.ui_tables.visuals.anim_switch:label("anim_label", "More will be added later.");
v117.ui_tables.visuals.anim_switch:switch("anim_gym", "Gym on Freezetime", false, nil, nil, "\a{Switch}\239\145\139\t \aDEFAULT", "\a{Link Active}\239\145\139\t \aDEFAULT");
v706.visuals_localplayer:switch("visuals", "spoofer_switch", "Cheat Spoofer", false, nil, "\a{Switch} \239\136\155\t \aDEFAULT", "\a{Link Active} \239\136\155\t \aDEFAULT");
v117.ui_tables.visuals.spoofer_switch:label("spoofer_label", "Imitates other cheat Shared ESP data.\n\n\af07171FFDont use cheats revealer with spoofer, they share your real cheat!");
v117.ui_tables.visuals.spoofer_switch:list("spoofer_list", "                            Cheats", {
    [1] = "Pandora", 
    [2] = "Fatality", 
    [3] = "Nixware", 
    [4] = "Airflow"
});
v706.visuals_indicators = v117.create_group(" Other \a{Switch}\239\131\154\aDEFAULT Visuals\a{Switch} \239\131\154 \a{Link Active}Indicators", 2);
v706.visuals_indicators:visible_condition(function()
    -- upvalues: v117 (ref)
    return v117.ui_tables.navigation.list.value == 2;
end);
v706.visuals_indicators:label("visuals", "additional_label", "\a{Link Active} \238\143\129\t \aDEFAULTAdditional Elements");
v117.ui_tables.visuals.additional_label:switch("damage_switch", "Damage Indicator", false, nil, nil, "\a{Switch}\238\134\189\t\aDEFAULT", "\a{Link Active}\238\134\189\t\aDEFAULT");
v117.ui_tables.visuals.additional_label:switch("damage_is_active", "\a4a4a4aFF  \238\143\150   \aDEFAULT Only is Active", false, function()
    -- upvalues: v117 (ref)
    return v117.ui_tables.visuals.damage_switch.value;
end);
v117.ui_tables.visuals.additional_label:combo("damage_font", "\a4a4a4aFF  \238\143\150    \aDEFAULTFont", {
    [1] = "Pixel", 
    [2] = "Verdana"
}, nil, function()
    -- upvalues: v117 (ref)
    return v117.ui_tables.visuals.damage_switch.value;
end);
v117.ui_tables.visuals.additional_label:switch("manual_switch", "Manual Arrows", false, nil, nil, "\a{Switch}\226\128\138\239\132\164\t \aDEFAULT", "\a{Link Active}\226\128\138\239\132\164\t \aDEFAULT");
v706.visuals_indicators:switch("visuals", "indicator_switch", "Crosshair Indicator", false, nil, "\a{Switch}\226\128\138\239\152\129\t\226\128\138\aDEFAULT", "\a{Link Active}\226\128\138\239\152\129\t\226\128\138\aDEFAULT");
v117.ui_tables.visuals.indicator_switch:combo("indicator_style", "Style", {
    [1] = "Old", 
    [2] = "Restyle", 
    [3] = "Classic"
}):disabled(true);
v117.ui_tables.visuals.indicator_switch:switch("indicator_glow", "Glow", true);
v117.ui_tables.visuals.indicator_switch:slider("glow_thick", "Thickness", 0, 50, 25, nil, nil, function()
    -- upvalues: v117 (ref)
    return v117.ui_tables.visuals.indicator_switch.value and v117.ui_tables.visuals.indicator_glow.value;
end);
v117.ui_tables.visuals.indicator_switch:slider("glow_alpha", "Alpha", 0, 100, 75, 0.01, nil, function()
    -- upvalues: v117 (ref)
    return v117.ui_tables.visuals.indicator_switch.value and v117.ui_tables.visuals.indicator_glow.value;
end);
v706.visuals_indicators:switch("visuals", "scope_switch", "Scope Lines", false, nil, "\a{Switch}\226\128\138\238\150\159\t\226\128\138\aDEFAULT", "\a{Link Active}\226\128\138\238\150\159\t\226\128\138\aDEFAULT");
local v726 = ui.get_style("Link Active");
v117.ui_tables.visuals.scope_switch:selectable("scope_type", "Type", {
    [1] = "Reversed", 
    [2] = "T Style"
}):color_picker("scope_color", {
    Fade = {
        [1] = v726
    }, 
    Gradient = {
        v726, 
        color(v726.r, v726.g, v726.b, 0)
    }
});
v117.ui_tables.visuals.scope_switch:slider("scope_size", "Size", 10, 500, 200, nil, function(v727)
    return v727 .. "px";
end);
v117.ui_tables.visuals.scope_switch:slider("scope_gap", "Gap", 0, 100, 6, nil, function(v728)
    return v728 .. "px";
end);
v706.visuals_indicators:switch("visuals", "hitlog_switch", "Hitlogs", false, nil, "\a{Switch}\226\128\138\239\153\136\t\226\128\138\aDEFAULT", "\a{Link Active}\226\128\138\239\153\136\t\226\128\138\aDEFAULT");
v117.ui_tables.visuals.hitlog_switch:listable("hitlog_vis_type", "                            Output", {
    [1] = "Console", 
    [2] = "Screen", 
    [3] = "Notification"
});
v117.ui_tables.visuals.hitlog_switch:slider("hitlog_duration", "Duration", 10, 50, 30, 0.1, function(v729)
    if #tostring(v729 / 10) ~= 1 then
        return v729 / 10 .. "";
    else
        return v729 / 10 .. ".0";
    end;
end, function()
    -- upvalues: v117 (ref)
    return v117.ui_tables.visuals.hitlog_vis_type.value_by_name[2] ~= nil;
end);
v117.ui_tables.visuals.hitlog_switch:selectable("hitlog_extra", "Extra", {
    [1] = "Icons", 
    [2] = "Glow"
}, {
    [1] = "Icons", 
    [2] = "Glow"
}, function()
    -- upvalues: v117 (ref)
    return v117.ui_tables.visuals.hitlog_vis_type.value_by_name[2] ~= nil;
end);
v117.ui_tables.visuals.hitlog_switch:combo("hitlog_color_mode", "Color Mode", {
    [1] = "Group", 
    [2] = "Per Reason"
});
v117.ui_tables.visuals.hitlog_switch:switch("hitlog_theme_hit", "Hit Theme Color", true):color_picker("hitlog_hit", ui.get_style("Link Active"), function()
    -- upvalues: v117 (ref)
    return not v117.ui_tables.visuals.hitlog_theme_hit.value;
end, true);
v117.ui_tables.visuals.hitlog_switch:color_picker("hitlog_miss", "Miss", color(254, 62, 62), function()
    -- upvalues: v117 (ref)
    return v117.ui_tables.visuals.hitlog_color_mode.value == 1;
end);
v117.ui_tables.visuals.hitlog_switch:color_picker("hitlog_resolver", "Resolver", color(254, 62, 62), function()
    -- upvalues: v117 (ref)
    return v117.ui_tables.visuals.hitlog_color_mode.value == 2;
end);
v117.ui_tables.visuals.hitlog_switch:color_picker("hitlog_spread", "Spread", color(255, 193, 57), function()
    -- upvalues: v117 (ref)
    return v117.ui_tables.visuals.hitlog_color_mode.value == 2;
end);
v117.ui_tables.visuals.hitlog_switch:color_picker("hitlog_pred", "Prediction Error", color(255, 66, 119), function()
    -- upvalues: v117 (ref)
    return v117.ui_tables.visuals.hitlog_color_mode.value == 2;
end);
v117.ui_tables.visuals.hitlog_switch:color_picker("hitlog_death", "Death", color(165, 41, 41), function()
    -- upvalues: v117 (ref)
    return v117.ui_tables.visuals.hitlog_color_mode.value == 2;
end);
v706.visuals_extra = v117.create_group(" Other \a{Switch}\239\131\154\aDEFAULT Visuals\a{Switch} \239\131\154 \a{Link Active}Extra", 1);
v706.visuals_extra:visible_condition(function()
    -- upvalues: v117 (ref)
    return v117.ui_tables.navigation.list.value == 2;
end);
v706.visuals_extra:switch("viewmodel", "aspect_switch", "Aspect Ratio", v0.viewmodel.aspect_ratio_switch ~= nil and (v0.viewmodel.aspect_ratio_switch or false), nil, "\a{Switch}\226\128\138\238\131\154\t \aDEFAULT", "\a{Link Active}\226\128\138\238\131\154\t \aDEFAULT");
v117.ui_tables.viewmodel.aspect_switch:slider("aspect_value", "Value", 0, 20, v0.viewmodel.aspect_ratio ~= nil and v0.viewmodel.aspect_ratio or 0, 0.1);
v706.visuals_extra:switch("visuals", "console_switch", "Console Color", false, nil, "\a{Switch} \238\140\170\t \aDEFAULT", "\a{Link Active} \238\140\170\t \aDEFAULT"):color_picker("console_color", nil, color(255));
v706.visuals_extra:switch("viewmodel", "viewmodel_switch", "Viewmodel", v0.viewmodel.switch ~= nil and (v0.viewmodel.switch or false), nil, "\a{Switch}\238\129\157\t\aDEFAULT", "\a{Link Active}\238\129\157\t\aDEFAULT");
v117.ui_tables.viewmodel.viewmodel_switch:slider("viewmodel_fov", "FOV", 0, 150, v0.viewmodel.fov ~= nil and v0.viewmodel.fov or 0);
v117.ui_tables.viewmodel.viewmodel_switch:slider("viewmodel_x", "  \226\128\138X", -1000, 1000, v0.viewmodel.x ~= nil and v0.viewmodel.x or 0, 0.01);
v117.ui_tables.viewmodel.viewmodel_switch:slider("viewmodel_y", "  \226\128\138Y", -1000, 1000, v0.viewmodel.y ~= nil and v0.viewmodel.y or 0, 0.01);
v117.ui_tables.viewmodel.viewmodel_switch:slider("viewmodel_z", "  \226\128\138Z", -1000, 1000, v0.viewmodel.z ~= nil and v0.viewmodel.z or 0, 0.01);
v117.ui_tables.viewmodel.viewmodel_switch:button("viewmodel_undo", "Undo");
v706.visuals_world = v117.create_group(" Other \a{Switch}\239\131\154\aDEFAULT Visuals\a{Switch} \239\131\154 \a{Link Active}World", 2);
v706.visuals_world:visible_condition(function()
    -- upvalues: v117 (ref)
    return v117.ui_tables.navigation.list.value == 2;
end);
v706.visuals_world:switch("visuals", "hitmarker_switch", "Hitmarkers", false, nil, "\a{Switch}\226\128\138\238\150\155\t\226\128\138\aDEFAULT", "\a{Link Active}\226\128\138\238\150\155\t\226\128\138\aDEFAULT");
v117.ui_tables.visuals.hitmarker_switch:slider("hitmarker_duration", "Duration", 10, 50, 30, 0.1, function(v730)
    if #tostring(v730 / 10) ~= 1 then
        return v730 / 10 .. "";
    else
        return v730 / 10 .. ".0";
    end;
end);
v117.ui_tables.visuals.hitmarker_switch:switch("hitmarker_lastshot", "Last Shot Only", true);
v117.ui_tables.visuals.hitmarker_switch:switch("hitmarker_color_hitlog", "Colors from Hitlogs", true);
v117.ui_tables.visuals.hitmarker_switch:switch("hitmarker_theme_hit", "Hit Theme Color", true, function()
    -- upvalues: v117 (ref)
    return not v117.ui_tables.visuals.hitmarker_color_hitlog.value;
end):color_picker("hitmarker_hit", ui.get_style("Link Active"), function()
    -- upvalues: v117 (ref)
    return not v117.ui_tables.visuals.hitmarker_theme_hit.value;
end, true);
v117.ui_tables.visuals.hitmarker_switch:color_picker("hitmarker_miss", "Miss", color(254, 62, 62), function()
    -- upvalues: v117 (ref)
    return not v117.ui_tables.visuals.hitmarker_color_hitlog.value;
end);
v117.ui_tables.visuals.hitmarker_switch:switch("hitmarker_glow", "Glow", false);
v706.visuals_world:switch("visuals", "nade_switch", "Grenade Radius", false, nil, "\a{Switch}\239\132\145\t\226\128\138\aDEFAULT", "\a{Link Active}\239\132\145\t\226\128\138\aDEFAULT");
v117.ui_tables.visuals.nade_switch:combo("nade_style", "Style", {
    [1] = "Solid", 
    [2] = "Gradient"
});
v117.ui_tables.visuals.nade_switch:switch("nade_molotov", "Molotov", true):color_picker("nade_molotov_c", color(255, 122, 122, 150), function()
    -- upvalues: v117 (ref)
    return v117.ui_tables.visuals.nade_molotov.value;
end, true);
v117.ui_tables.visuals.nade_switch:color_picker("nade_molotov_cf", "Ally Molotov", color(0, 0), function()
    -- upvalues: v117 (ref)
    return v117.ui_tables.visuals.nade_molotov.value;
end);
v117.ui_tables.visuals.nade_switch:switch("nade_smoke", "Smoke", true):color_picker("nade_smoke_c", color(131, 131), function()
    -- upvalues: v117 (ref)
    return v117.ui_tables.visuals.nade_smoke.value;
end, true);
v706.visuals_world:switch("visuals", "molotov_switch", "Disabled", false, nil, "\a{Switch}\226\128\138\239\129\173\t \aDEFAULT", "\a{Link Active}\226\128\138\239\129\173\t \aDEFAULT"):disabled(true);
v706.misc = v117.create_group(" Other \a{Switch}\239\131\154\a{Link Active} Misc", 2);
v706.misc:visible_condition(function()
    -- upvalues: v117 (ref)
    return v117.ui_tables.navigation.list.value == 3;
end);
v706.misc:switch("misc", "avoid_switch", "Avoid Collisions", false, nil, "\a{Switch}\239\151\161\t\226\128\138\aDEFAULT", "\a{Link Active}\239\151\161\t\226\128\138\aDEFAULT");
v117.ui_tables.misc.avoid_switch:slider("avoid_dist", "Distance", 1, 10, 5, 0.1);
v117.ui_tables.misc.avoid_switch:listable("avoid_disable", "Disablers", {
    [1] = "Crouching", 
    [2] = "Edge Jump"
}, {
    [1] = "Crouching", 
    [2] = "Edge Jump"
});
v706.misc:switch("misc", "fastladder_switch", "Fast Ladder", false, nil, "\a{Switch}\226\128\138\239\151\133\t\226\128\138\aDEFAULT", "\a{Link Active}\226\128\138\239\151\133\t\226\128\138\aDEFAULT");
v706.misc:switch("misc", "fall_switch", "No Fall Damage", false, nil, "\a{Switch}\226\128\138\238\149\135\t\aDEFAULT", "\a{Link Active}\226\128\138\238\149\135\t\aDEFAULT");
v706.misc:switch("misc", "trashtalk_switch", " AI Trashtalk", false, nil, "\a{Switch}  \239\163\175\t\aDEFAULT", "\a{Link Active}  \239\163\175\t\aDEFAULT");
v117.ui_tables.misc.trashtalk_switch:selectable("trash_type", "Type", {
    [1] = "On Kill", 
    [2] = "On Death", 
    [3] = "Revenge"
}, {
    [1] = "On Kill", 
    [2] = "On Death", 
    [3] = "Revenge"
});
v706.misc:switch("misc", "clantag_switch", "Clantag", false, nil, "\a{Switch} \226\128\138\239\153\144\t\aDEFAULT", "\a{Link Active} \226\128\138\239\153\144\t\aDEFAULT");
v706.misc:switch("misc", "shared_switch", "Shared Logo", false, nil, "\a{Switch}\226\128\138\226\128\138\239\148\153\t\aDEFAULT", "\a{Link Active}\226\128\138\226\128\138\239\148\153\t\aDEFAULT");
v706.misc:switch("misc", "ping_switch", "Extended Ping", false, nil, "\a{Switch}\226\128\138\226\128\138\238\150\133\t\aDEFAULT", "\a{Link Active}\226\128\138\226\128\138\238\150\133\t\aDEFAULT");
v117.ui_tables.misc.ping_switch:slider("ping_slider", "\a{Link Active}\226\128\138\226\128\138\239\128\146\t\aDEFAULTPing", 0, 200, 200);
v117.is_loaded = true;
v117.update_all_groups();
local v737 = {
    active_condition = "", 
    tick_switch = false, 
    spin_cache = 0, 
    conds_path = {}, 
    yaw_counter = 1, 
    ways = {
        [1] = {}, 
        [2] = {}, 
        [3] = {
            [1] = -2, 
            [2] = 180, 
            [3] = 2
        }, 
        [4] = {
            [1] = -2, 
            [2] = -4, 
            [3] = 4, 
            [4] = 2
        }, 
        [5] = {
            [1] = -2, 
            [2] = -4, 
            [3] = 180, 
            [4] = 4, 
            [5] = 2
        }, 
        [6] = {
            [1] = -2, 
            [2] = -4, 
            [3] = -6, 
            [4] = 6, 
            [5] = 4, 
            [6] = 2
        }, 
        [7] = {
            [1] = -2, 
            [2] = -4, 
            [3] = -6, 
            [4] = 180, 
            [5] = 6, 
            [6] = 4, 
            [7] = 2
        }
    }, 
    pitch_table = {
        Up = -89, 
        Down = 89, 
        Disabled = 0
    }, 
    shuffle_array = {}, 
    flick_delay = 0, 
    switch_delay = 0, 
    onetap_defensive_value = 0, 
    onetap_speed_value = 0, 
    lc_tickbase = globals.tickcount, 
    lc_timer = 0, 
    last_weapon = nil, 
    break_lc_tick_switch = false, 
    legitaa_list = {
        CPropDoorRotating = true, 
        CHostage = true, 
        CFuncBrush = true, 
        CBaseButton = true
    }, 
    safe_head = false, 
    predict_yaw = 0, 
    cache_charge = 0, 
    generate_shuffle_array = function(v731)
        local v732 = {};
        for v733 = 1, v731 do
            v732[v733] = v733;
        end;
        for v734 = 1, #v732 do
            local v735 = utils.random_int(1, v731);
            local v736 = v732[v734];
            v732[v734] = v732[v735];
            v732[v735] = v736;
        end;
        return v732;
    end
};
v737.legit_aa = function(v738)
    -- upvalues: v63 (ref), v737 (ref), v117 (ref), v45 (ref), v43 (ref), v40 (ref), l_band_0 (ref)
    local l_ref_0 = v63.ref;
    local l_crouching_0 = v63.crouching;
    local l_m_iTeamNum_0 = l_ref_0.m_iTeamNum;
    local v742 = entity.get_entities("CPlantedC4");
    local v743 = #v742 > 0;
    local l_eye_pos_0 = v63.eye_pos;
    local v745 = render.camera_angles();
    local v746 = utils.trace_line(l_eye_pos_0, l_eye_pos_0 + vector():angles(v745.x, v745.y, 0) * 130, l_ref_0, 1073741825, 3);
    if v746.entity then
        local v747 = false;
        if v746.entity:is_weapon() then
            local l_weapon_name_0 = v746.entity:get_weapon_info().weapon_name;
            v747 = v737.legitaa_list[l_weapon_name_0] or l_weapon_name_0:find("weapon");
        else
            local v749 = v746.entity:get_classname();
            v747 = v737.legitaa_list[v749];
        end;
        if v747 then
            v737.active_condition = l_crouching_0 and 61 or 2;
            return;
        end;
    end;
    if v743 and l_ref_0:get_origin():dist(v742[#v742]:get_origin()) < 62 and l_m_iTeamNum_0 == 3 then
        v737.active_condition = l_crouching_0 and 61 or 2;
        return;
    else
        local l_value_12 = v117.ui_tables.antiaim.legitaa_pitch.value;
        v45.pitch:override("Disabled");
        if not v738.in_attack then
            if l_value_12 == 2 then
                v738.view_angles.x = 0;
            end;
            if l_value_12 == 3 then
                v738.view_angles.x = v117.ui_tables.antiaim.legitaa_custom.value;
            end;
        end;
        v45.yaw_offset:override(180);
        v45.yaw_at_targets:override("Local View");
        v43.desync:set(v117.ui_tables.antiaim.legitaa_desync.value);
        local v751 = nil;
        if v117.ui_tables.antiaim.legitaa_desync.value then
            local l_value_by_name_0 = v117.ui_tables.antiaim.legitaa_mod.value_by_name;
            if l_value_by_name_0.Jitter then
                v751 = v737.break_lc_tick_switch;
            end;
            if l_value_by_name_0["Randomize Jitter"] then
                v751 = utils.random_int(0, 1) == 1;
            end;
        end;
        local v753 = entity.get_threat();
        local l_value_13 = v117.ui_tables.antiaim.legitaa_freestand.value;
        if v753 and l_value_13 ~= 1 then
            local v755 = rage.antiaim:get_target();
            local l_eye_pos_1 = v63.eye_pos;
            l_eye_pos_1.z = l_ref_0:get_hitbox_position(0).z;
            local v757 = l_ref_0:get_origin();
            local v758 = v753:get_origin();
            v758.z = v758.z + 64;
            local l_m_vecMins_0 = l_ref_0.m_vecMins;
            local l_m_vecMaxs_0 = l_ref_0.m_vecMaxs;
            local v761 = nil;
            local v762 = nil;
            local v763 = nil;
            for v764 = 1, 3 do
                local v765 = vector():angles(0, v755 - 90, 0) * 20 * v764;
                local v766 = utils.trace_hull(v757, v757 + v765, l_m_vecMins_0, l_m_vecMaxs_0, l_ref_0, 33636363, 3);
                v766.end_pos.z = l_eye_pos_1.z;
                v766 = v766.end_pos;
                if utils.trace_bullet(v753, v758, v766) > 0 then
                    v761 = true;
                    break;
                end;
            end;
            for v767 = 1, 3 do
                local v768 = vector():angles(0, v755 + 90, 0) * 20 * v767;
                local v769 = utils.trace_hull(v757, v757 + v768, l_m_vecMins_0, l_m_vecMaxs_0, l_ref_0, 33636363, 3);
                v769.end_pos.z = l_eye_pos_1.z;
                v769 = v769.end_pos;
                if utils.trace_bullet(v753, v758, v769) > 0 then
                    v762 = true;
                    break;
                end;
            end;
            v763 = utils.trace_bullet(v753, v758, l_eye_pos_1) > 0;
            if (not v761 or not v762) and not v763 then
                if v761 then
                    v751 = not (l_value_13 == 2);
                elseif v762 then
                    v751 = not (l_value_13 == 3);
                end;
            end;
        end;
        v737.desync_side = v751;
        v45.inverter:override(v751);
        v45.defensive:override(nil);
        v45.hide_shots_defensive:override(nil);
        v45.freestand:override(false);
        v45.hidden_yaw:override(false);
        v45.left_limit:override(60);
        v45.right_limit:override(60);
        v40.legit_aa = true;
        v738.buttons = l_band_0(v738.buttons, bit.bnot(32));
        return;
    end;
end;
v737.last_button = nil;
v737.manual_state = 0;
v737.manual_function = function()
    -- upvalues: v117 (ref), v737 (ref)
    local l_antiaim_0 = v117.ui_tables.antiaim;
    if l_antiaim_0.forward_key.value then
        if v737.last_button ~= 3 then
            v737.manual_state = v737.manual_state == 3 and 0 or 3;
            v737.last_button = 3;
        end;
        return;
    elseif l_antiaim_0.left_key.value then
        if v737.last_button ~= 1 then
            v737.manual_state = v737.manual_state == 1 and 0 or 1;
            v737.last_button = 1;
        end;
        return;
    elseif l_antiaim_0.right_key.value then
        if v737.last_button ~= 2 then
            v737.manual_state = v737.manual_state == 2 and 0 or 2;
            v737.last_button = 2;
        end;
        return;
    elseif l_antiaim_0.back_key.value then
        if v737.last_button ~= 4 then
            v737.manual_state = 0;
            v737.last_button = 4;
        end;
        return;
    else
        if l_antiaim_0.manual_type.str_value == "Hold" then
            v737.manual_state = 0;
        end;
        v737.last_button = nil;
        return;
    end;
end;
v737.main_aa = function(v771)
    -- upvalues: v63 (ref), v44 (ref), v117 (ref), v737 (ref), l_abs_0 (ref), l_band_0 (ref), v38 (ref), v45 (ref), v40 (ref), v43 (ref), l_random_0 (ref), l_floor_0 (ref)
    local l_ref_1 = v63.ref;
    local v773 = 1;
    local v774 = 1;
    local l_velocity_0 = v63.velocity;
    local v776 = v63.ground_tickcount > 1;
    local l_crouching_1 = v63.crouching;
    local v778 = rage.exploit:get();
    if v776 then
        if l_crouching_1 then
            v773 = l_velocity_0 <= 2 and 51 or 52;
        else
            v773 = l_velocity_0 <= 2 and 2 or v44.slowwalk and 3 or 4;
        end;
    else
        v773 = l_crouching_1 and 62 or 61;
    end;
    local l_antiaim_1 = v117.ui_tables.antiaim;
    v774 = v773;
    if v117.ui_tables.antiaim.list.value == 2 then
        l_antiaim_1 = v117.presets[v117.ui_tables.antiaim.preset_list.str_value];
    end;
    if l_antiaim_1["over_cond" .. v773].value then
        v773 = 1;
    end;
    if v771.choked_commands == 0 then
        v737.switch_delay = v737.switch_delay + 1;
        if l_antiaim_1["yaw_delay" .. v773].value < v737.switch_delay or v778 == 0 then
            if l_abs_0(v737.lc_timer - globals.tickcount) >= 12 or not l_antiaim_1["def_switch" .. v773].value then
                v737.tick_switch = not v737.tick_switch;
                v737.yaw_counter = v737.yaw_counter + 1;
            end;
            v737.break_lc_tick_switch = not v737.break_lc_tick_switch;
            v737.switch_delay = 0;
        end;
        if l_band_0(v771.buttons, v38.flags.IN_USE) ~= 0 and v117.ui_tables.antiaim.legitaa_switch.value then
            v737.legit_aa(v771);
            return;
        else
            if v40.legit_aa then
                v45.pitch:override();
                v45.freestand:override();
                v45.yaw_at_targets:override();
                v45.hidden_yaw:override();
                v40.legit_aa = nil;
            end;
            local v780 = entity.get_threat();
            local l_inverter_0 = v44.inverter;
            v43.desync:override(l_antiaim_1["desync_switch" .. v773].value);
            if l_antiaim_1["desync_switch" .. v773].value then
                v45.left_limit:override(l_antiaim_1["desync_l" .. v773].value);
                v45.right_limit:override(l_antiaim_1["desync_r" .. v773].value);
                local l_value_by_name_1 = l_antiaim_1["desync_mod" .. v773].value_by_name;
                if l_value_by_name_1.Jitter then
                    l_inverter_0 = v737.tick_switch;
                end;
                if l_value_by_name_1["Randomize Jitter"] then
                    l_inverter_0 = l_random_0(0, 1) == 1;
                end;
                local l_value_14 = l_antiaim_1["desync_freestand" .. v773].value;
                if v780 and l_value_14 ~= 1 then
                    local v784 = rage.antiaim:get_target();
                    local l_eye_pos_2 = v63.eye_pos;
                    l_eye_pos_2.z = l_ref_1:get_hitbox_position(0).z;
                    local v786 = l_ref_1:get_origin();
                    local v787 = v780:get_origin();
                    v787.z = v787.z + 64;
                    local l_m_vecMins_1 = l_ref_1.m_vecMins;
                    local l_m_vecMaxs_1 = l_ref_1.m_vecMaxs;
                    local v790 = nil;
                    local v791 = nil;
                    local v792 = nil;
                    for v793 = 1, 3 do
                        local v794 = vector():angles(0, v784 - 90, 0) * 20 * v793;
                        local v795 = utils.trace_hull(v786, v786 + v794, l_m_vecMins_1, l_m_vecMaxs_1, l_ref_1, 33636363, 3);
                        v795.end_pos.z = l_eye_pos_2.z;
                        v795 = v795.end_pos;
                        if utils.trace_bullet(v780, v787, v795) > 0 then
                            v790 = true;
                            break;
                        end;
                    end;
                    for v796 = 1, 3 do
                        local v797 = vector():angles(0, v784 + 90, 0) * 20 * v796;
                        local v798 = utils.trace_hull(v786, v786 + v797, l_m_vecMins_1, l_m_vecMaxs_1, l_ref_1, 33636363, 3);
                        v798.end_pos.z = l_eye_pos_2.z;
                        v798 = v798.end_pos;
                        if utils.trace_bullet(v780, v787, v798) > 0 then
                            v791 = true;
                            break;
                        end;
                    end;
                    v792 = utils.trace_bullet(v780, v787, l_eye_pos_2) > 0;
                    if (not v790 or not v791) and not v792 then
                        if v790 then
                            l_inverter_0 = l_value_14 == 2;
                            if v773 == 9 then
                                l_inverter_0 = not l_inverter_0;
                            end;
                        elseif v791 then
                            l_inverter_0 = l_value_14 == 3;
                            if v773 == 9 then
                                l_inverter_0 = not l_inverter_0;
                            end;
                        end;
                    end;
                end;
            end;
            local v799 = 0;
            if l_antiaim_1["yaw_switch" .. v773].value then
                v45.yaw_base:override("Backward");
                v45.yaw_modifier:override("Disabled");
                if l_antiaim_1["desync_switch" .. v773].value then
                    v799 = (l_inverter_0 and l_antiaim_1["yaw_l" .. v773].value or l_antiaim_1["yaw_r" .. v773].value) + (l_inverter_0 and utils.random_int(0, l_antiaim_1["yaw_randl" .. v773].value) or utils.random_int(0, l_antiaim_1["yaw_randr" .. v773].value));
                else
                    v799 = (v737.tick_switch and l_antiaim_1["yaw_l" .. v773].value or l_antiaim_1["yaw_r" .. v773].value) + (v737.tick_switch and utils.random_int(0, l_antiaim_1["yaw_randl" .. v773].value) or utils.random_int(0, l_antiaim_1["yaw_randr" .. v773].value));
                end;
                v799 = v799 + l_antiaim_1["yaw_o" .. v773].value + utils.random_int(0, l_antiaim_1["yaw_rando" .. v773].value);
                local l_value_15 = l_antiaim_1["yaw_mod_combo" .. v773].value;
                if l_value_15 ~= 1 then
                    local l_value_16 = l_antiaim_1["yaw_deg" .. v773].value;
                    if l_value_15 == 2 then
                        l_value_16 = l_floor_0(l_value_16 / 2);
                        v799 = v737.tick_switch and l_value_16 + v799 or -l_value_16 + v799;
                    end;
                    if l_value_15 == 4 then
                        l_value_16 = utils.random_float(-1, 1) * l_value_16;
                        v799 = v737.tick_switch and l_value_16 + v799 or -l_value_16 + v799;
                    end;
                    if l_value_15 == 5 then
                        local l_spin_cache_0 = v737.spin_cache;
                        v737.spin_cache = l_spin_cache_0 < math.abs(l_value_16) and l_spin_cache_0 + 2 or 0;
                        if l_value_16 > 0 then
                            v799 = l_inverter_0 and -l_spin_cache_0 + v799 or -l_spin_cache_0 + v799;
                        else
                            v799 = l_inverter_0 and l_spin_cache_0 + v799 or l_spin_cache_0 + v799;
                        end;
                    end;
                    if l_value_15 == 3 then
                        local l_value_17 = l_antiaim_1["xway_counter" .. v773].value;
                        if l_value_17 < v737.yaw_counter then
                            v737.yaw_counter = 1;
                            if l_antiaim_1["xway_shuffle" .. v773].value then
                                v737.shuffle_array = v737.generate_shuffle_array(l_value_17);
                            end;
                        end;
                        local v804 = v737.ways[l_value_17];
                        local l_yaw_counter_0 = v737.yaw_counter;
                        l_value_16 = l_antiaim_1["xway_switch" .. v773].value and l_antiaim_1["xwayn_" .. v773 .. l_yaw_counter_0].value or l_floor_0(l_value_16 / v804[l_yaw_counter_0]);
                        if not v737.shuffle_array or l_value_17 ~= #v737.shuffle_array then
                            v737.shuffle_array = v737.generate_shuffle_array(l_value_17);
                        end;
                        l_value_16 = l_antiaim_1["xway_switch" .. v773].value and l_antiaim_1["xwayn_" .. v773 .. v737.shuffle_array[l_yaw_counter_0]].value or l_floor_0(l_antiaim_1["yaw_deg" .. v773].value / v804[v737.shuffle_array[l_yaw_counter_0]]);
                        if l_antiaim_1["xway_sync" .. v773].value then
                            l_inverter_0 = l_value_16 < 0;
                        end;
                        v799 = l_value_16 + v799;
                    end;
                    if l_value_15 == 6 and l_abs_0(v737.flick_delay - globals.curtime) > l_antiaim_1["flick_delay" .. v773].value / 10 then
                        v799 = v799 + l_antiaim_1["flick_yaw" .. v773].value;
                        v45.desync:override(false);
                        v771.no_choke = true;
                        v737.flick_delay = globals.curtime;
                    end;
                    if l_value_15 == 7 then
                        if v737.yaw_counter > 3 then
                            v737.yaw_counter = 1;
                            v737.shuffle_array = v737.generate_shuffle_array(3);
                        end;
                        local l_yaw_counter_1 = v737.yaw_counter;
                        local v807 = v737.ways[3];
                        if not v737.shuffle_array or #v737.shuffle_array ~= 3 then
                            v737.shuffle_array = v737.generate_shuffle_array(3);
                        end;
                        v799 = v799 + l_floor_0(l_value_16 * 4 / v807[v737.shuffle_array[l_yaw_counter_1]]);
                        if l_antiaim_1["xway_sync" .. v773].value then
                            l_inverter_0 = l_value_16 < 0;
                        end;
                    end;
                end;
            end;
            v45.hidden_yaw:override(l_antiaim_1["def_switch" .. v773].value);
            local v808 = nil;
            local v809 = nil;
            if l_antiaim_1["def_switch" .. v773].value and v778 == 1 then
                local l_value_18 = l_antiaim_1["def_yaw" .. v773].value;
                v809 = 0;
                if l_value_18 == 1 then
                    v809 = nil;
                end;
                if l_value_18 == 2 then
                    v809 = v737.break_lc_tick_switch and -90 or 90;
                end;
                if l_value_18 == 3 then
                    v737.onetap_speed_value = l_floor_0(math.sin(globals.curtime) * l_antiaim_1["def_onetapspeed" .. v773].value);
                    v737.onetap_defensive_value = v737.onetap_defensive_value + v737.onetap_speed_value;
                    if l_abs_0(v737.onetap_defensive_value) > 100000 then
                        v737.onetap_defensive_value = 0;
                    end;
                    v809 = v737.onetap_defensive_value + 180;
                end;
                if l_value_18 == 4 then
                    v809 = utils.random_float(-1, 1) * l_antiaim_1["def_yaw_deg" .. v773].value;
                end;
                if l_value_18 == 5 then
                    v809 = l_antiaim_1["def_yaw_deg" .. v773].value;
                end;
                local l_str_value_0 = l_antiaim_1["def_pitch" .. v773].str_value;
                v808 = v737.pitch_table[l_str_value_0];
                if l_str_value_0 == "Sway" then
                    v808 = math.sin(globals.curtime) * 89;
                end;
                if l_str_value_0 == "Random" then
                    v808 = l_floor_0(utils.random_float(-1, 1) * l_antiaim_1["pitch_deg" .. v773].value);
                end;
                if l_str_value_0 == "Custom" then
                    v808 = l_antiaim_1["pitch_custom" .. v773].value;
                end;
            end;
            local l_v774_0 = v774;
            if l_v774_0 > 10 then
                l_v774_0 = tonumber(tostring(l_v774_0):sub(0, 1));
            end;
            local v813 = nil;
            local v814 = v117.ui_tables.unused.condition_list.elements_array[l_v774_0];
            if v117.ui_tables.antiaim.breaklc_ping.value_by_name[v814] and v780 and entity.get_player_resource().m_iPing[v780:get_index()] > 50 then
                v813 = true;
            end;
            if v117.ui_tables.antiaim.breaklc_always.value_by_name[v814] then
                v813 = true;
            end;
            if v117.ui_tables.antiaim.breaklc_extra.value_by_name["Condition Change"] then
                if v40.cond_change ~= v774 then
                    v40.lc_active = globals.tickcount;
                end;
                v40.cond_change = v774;
            end;
            local v815 = l_ref_1:get_player_weapon();
            if v815 then
                if v117.ui_tables.antiaim.breaklc_extra.value_by_name["Weapon Change"] then
                    local v816 = v815:get_weapon_index();
                    if v40.last_weapon ~= v816 then
                        v40.lc_active = globals.tickcount;
                    end;
                    v40.last_weapon = v816;
                end;
                if v117.ui_tables.antiaim.breaklc_extra.value_by_name.Reloading and v815:get_weapon_reload() ~= -1 then
                    v813 = true;
                end;
            end;
            v40.lc_active = v40.lc_active == nil and 0 or v40.lc_active;
            if l_abs_0(v40.lc_active - globals.tickcount) < 16 then
                v813 = true;
            end;
            local l_inverter_1 = v45.inverter;
            local l_l_inverter_1_0 = l_inverter_1;
            l_inverter_1 = l_inverter_1.override;
            local v819;
            if v117.ui_tables.antiaim.preset_list.str_value == "Roll" or not l_inverter_0 then
                v819 = false;
            else
                v819 = l_inverter_0;
            end;
            l_inverter_1(l_l_inverter_1_0, v819);
            v45.fake_opt:override("");
            l_inverter_1 = l_ref_1.m_nTickBase;
            if l_inverter_1 - 3 > v737.lc_tickbase and v778 == 1 then
                v737.lc_timer = globals.tickcount;
            end;
            v737.lc_tickbase = l_inverter_1;
            l_l_inverter_1_0 = 0;
            v819 = 0;
            local v820 = rage.antiaim:get_target(true);
            if v117.ui_tables.antiaim.base_compensate.value and l_crouching_1 and v776 and v771.forwardmove ~= 0 and v771.sidemove == 450 then
                local v821 = l_inverter_0 and v45.left_limit.override_value or v45.right_limit.override_value;
                v819 = l_inverter_0 and 0 or 65;
                if not l_inverter_0 then
                    v821 = math.min(0.1, v821 / 60);
                    if (v45.desync.override_value ~= nil or not v45.desync.value) and not v45.desync.override_value or not v821 then
                        v821 = 0.6;
                    end;
                    v819 = (l_inverter_0 and 0 or 65) * math.min(l_velocity_0 / 80, 1) * v821;
                end;
                v799 = v819 + v799;
            end;
            if v117.ui_tables.antiaim.base_yaw.str_value == "At Target" and v117.ui_tables.antiaim.predict_switch.value and v780 and not entity.get_threat(true) and not v820 then
                local v822 = l_ref_1:get_hitbox_position(3);
                local v823 = rage.antiaim:get_target();
                local v824 = v780:get_eye_position();
                local v825 = nil;
                for v826 = 1, 10 do
                    local v827 = v824 + vector():angles(0, v823 - 90, 0) * 20 * v826;
                    local v828, v829 = utils.trace_bullet(v780, v827, v822);
                    if v828 > 0 and v829.entity == l_ref_1 then
                        v825 = v827;
                        break;
                    end;
                end;
                local v830 = nil;
                for v831 = 1, 10 do
                    local v832 = v824 + vector():angles(0, v823 + 90, 0) * 20 * v831;
                    local v833, v834 = utils.trace_bullet(v780, v832, v822);
                    if v833 > 0 and v834.entity == l_ref_1 then
                        if not v825 then
                            v825 = v832;
                            break;
                        else
                            v830 = v832;
                            break;
                        end;
                    end;
                end;
                if v825 then
                    v825.z = 0;
                    v822.z = 0;
                    v825 = (v822 - v825):angles();
                    local v835 = v823 - l_floor_0(v825.y);
                    l_l_inverter_1_0 = -math.normalize_yaw(v835);
                    if v830 and v825 then
                        l_l_inverter_1_0 = 0;
                    end;
                end;
            end;
            v737.predict_yaw = l_l_inverter_1_0;
            v45.yaw_offset:override(not (l_abs_0(v737.lc_timer - globals.tickcount) < 12 and l_antiaim_1["def_switch" .. v773].value) and v799 + l_l_inverter_1_0 or 0);
            if l_antiaim_1["roll_switch" .. v773].value then
                if l_antiaim_1["roll_type" .. v773].value == 1 then
                    v771.view_angles.z = l_antiaim_1["roll_def_deg" .. v773].value;
                    v771.jitter_move = false;
                    v45.exales:override();
                    v45.exales_pitch:override();
                    v45.exales_roll:override();
                else
                    v45.exales:override(true);
                    v45.exales_pitch:override(l_antiaim_1["roll_ext_pit" .. v773].value);
                    v45.exales_roll:override(l_antiaim_1["roll_ext_deg" .. v773].value);
                end;
            else
                v45.exales:override();
                v45.exales_pitch:override();
                v45.exales_roll:override();
            end;
            if v815 and v815:get_weapon_info().weapon_type == 9 and v815.m_bPinPulled then
                v813 = nil;
            end;
            if v45.freestand.value then
                local v836 = rage.antiaim:get_target(true);
                if v117.ui_tables.antiaim.frees_dis_def.value then
                    if v836 then
                        v808 = nil;
                        v809 = nil;
                        v813 = nil;
                        v45.hidden_yaw:override(false);
                    end;
                elseif v778 == 1 and v836 then
                    local l_value_19 = v117.ui_tables.antiaim.frees_yaw.value;
                    v809 = 0;
                    if l_value_19 == 1 then
                        local v838 = rage.antiaim:get_target();
                        v809 = l_abs_0(v836 - math.normalize_yaw(v838 - 90)) < l_abs_0(v836 - math.normalize_yaw(v838 + 90)) and v836 - math.normalize_yaw(v838 + 90) or v836 - math.normalize_yaw(v838 - 90);
                    end;
                    if l_value_19 == 2 then
                        v809 = nil;
                    end;
                    if l_value_19 == 3 then
                        v809 = v737.break_lc_tick_switch and -90 or 90;
                    end;
                    if l_value_19 == 4 then
                        v737.onetap_speed_value = l_floor_0(math.sin(globals.curtime) * v117.ui_tables.antiaim.frees_yaw_onetap.value);
                        v737.onetap_defensive_value = v737.onetap_defensive_value + v737.onetap_speed_value;
                        if l_abs_0(v737.onetap_defensive_value) > 100000 then
                            v737.onetap_defensive_value = 0;
                        end;
                        v809 = v737.onetap_defensive_value + 180;
                    end;
                    if l_value_19 == 5 then
                        v809 = utils.random_float(-1, 1) * 180;
                    end;
                    local l_str_value_1 = v117.ui_tables.antiaim.frees_pitch.str_value;
                    v808 = v737.pitch_table[l_str_value_1];
                    if l_str_value_1 == "Sway" then
                        v808 = math.sin(globals.curtime) * 89;
                    end;
                    if l_str_value_1 == "Random" then
                        v808 = l_floor_0(utils.random_float(-1, 1) * 89);
                    end;
                    if l_str_value_1 == "Custom" then
                        v808 = v117.ui_tables.antiaim.frees_pitch_custom.value;
                    end;
                    if v774 ~= 2 then
                        v813 = nil;
                    else
                        v813 = true;
                        v45.hidden_yaw:override(true);
                    end;
                end;
            end;
            v737.safe_head = false;
            if v117.ui_tables.antiaim.safe_switch.value and v780 and v737.manual_state == 0 and not rage.antiaim:get_target(true) then
                local l_z_0 = l_ref_1:get_hitbox_position(0).z;
                local l_eye_pos_3 = v63.eye_pos;
                local v842 = v780:get_eye_position();
                local v843 = rage.antiaim:get_target();
                local v844 = l_eye_pos_3 + vector():angles(0, v843, 0) * 10;
                v844.z = l_z_0 + 4.5;
                local v845 = nil;
                local v846 = nil;
                local v847 = (l_eye_pos_3 + (v842 - l_eye_pos_3):normalized() * 30):closest_ray_point(v842, v844);
                local v848, v849 = utils.trace_bullet(v780, v847, v844, entity.get(0));
                v846 = v849;
                v845 = v848;
                if v846 and v846.entity == l_ref_1 and v846.hitbox ~= 0 then
                    v45.left_limit:override(0);
                    v45.right_limit:override(0);
                    if v774 == 51 then
                        v45.yaw_offset:override(12 + l_l_inverter_1_0);
                    else
                        v45.yaw_offset:override(0 + l_l_inverter_1_0 + v819);
                    end;
                    if v117.ui_tables.antiaim.safe_def.value then
                        v808 = nil;
                        v809 = 0;
                    end;
                    if not v117.ui_tables.antiaim.breaklc_always.value_by_name["Safe Head"] then
                        v813 = nil;
                    end;
                    v737.safe_head = true;
                end;
            end;
            if v808 ~= nil then
                rage.antiaim:override_hidden_pitch(v808);
            end;
            if v809 ~= nil then
                rage.antiaim:override_hidden_yaw_offset(v809);
            end;
            v45.yaw_at_targets:override(v117.ui_tables.antiaim.base_yaw.str_value);
            if v737.manual_state ~= 0 then
                if v737.manual_state == 1 then
                    v813 = nil;
                    v45.yaw_offset:override(-90);
                    v43.inverter:set(true);
                end;
                if v737.manual_state == 2 then
                    v813 = nil;
                    v45.yaw_offset:override(90);
                    v43.inverter:set(true);
                end;
                if v737.manual_state == 3 then
                    v813 = nil;
                    v45.yaw_offset:override(180);
                    v43.inverter:set(true);
                end;
                v45.yaw_at_targets:override(v117.ui_tables.antiaim.manual_view.str_value);
            end;
            local v850 = nil;
            if v117.ui_tables.antiaim.frees_disable.value_by_name[v814] then
                v850 = false;
            end;
            if entity.get_game_rules().m_fRoundStartTime > globals.curtime then
                v813 = nil;
            end;
            v737.desync_side = l_inverter_0;
            v45.freestand:override(v850);
            v45.defensive:override(v813 and "Always On" or v813);
            v45.hide_shots_defensive:override(v813 and "Break LC" or v813);
            v45.pitch:override(v117.ui_tables.antiaim.base_pitch.str_value);
            return;
        end;
    else
        if l_band_0(v771.buttons, v38.flags.IN_USE) ~= 0 and v117.ui_tables.antiaim.legitaa_switch.value then
            v737.legit_aa(v771);
        end;
        if l_antiaim_1["roll_switch" .. v773].value then
            if l_antiaim_1["roll_type" .. v773].value == 1 then
                v771.view_angles.z = l_antiaim_1["roll_def_deg" .. v773].value;
                v771.jitter_move = false;
                v45.exales:override();
                v45.exales_pitch:override();
                v45.exales_roll:override();
            else
                v45.exales:override(true);
                v45.exales_pitch:override(l_antiaim_1["roll_ext_pit" .. v773].value);
                v45.exales_roll:override(l_antiaim_1["roll_ext_deg" .. v773].value);
            end;
        else
            v45.exales:override();
            v45.exales_pitch:override();
            v45.exales_roll:override();
        end;
        return;
    end;
end;
v737.restore_menu = function()
    -- upvalues: v45 (ref), v43 (ref), v737 (ref)
    v45.pitch:override();
    v45.yaw_base:override();
    v45.yaw_at_targets:override();
    v45.yaw_offset:override();
    v45.yaw_modifier:override();
    v45.yaw_modifier_offset:override();
    v45.desync:override();
    v43.desync:override();
    v45.inverter:override();
    v45.fake_opt:override();
    v45.left_limit:override();
    v45.right_limit:override();
    v45.desync_freestand:override();
    v45.exales:override();
    v45.exales_pitch:override();
    v45.exales_roll:override();
    v45.freestand:override();
    v45.defensive:override();
    v45.fakelag_slider:override();
    v45.double_tap_fl:override();
    v45.hidden_yaw:override();
    v737.manual_state = 0;
    v737.safe_head = false;
    v737.predict_yaw = 0;
end;
v117.ui_tables.antiaim.list:set_callback(function()
    -- upvalues: v117 (ref), v737 (ref)
    if v117.ui_tables.antiaim.list.value == 1 then
        v737.restore_menu();
        events.createmove:unset(v737.manual_function);
        events.createmove:unset(v737.main_aa);
    else
        events.createmove:set(v737.manual_function);
        events.createmove:set(v737.main_aa);
    end;
end, true);
events.shutdown:set(function()
    -- upvalues: v737 (ref)
    v737.restore_menu();
end);
local v853 = {
    hitgroup_str = {
        [0] = "generic", 
        [1] = "head", 
        [2] = "chest", 
        [3] = "stomach", 
        [4] = "left arm", 
        [5] = "right arm", 
        [6] = "left leg", 
        [7] = "right leg", 
        [8] = "neck", 
        [9] = "generic", 
        [10] = "dormant"
    }, 
    last_bullet_impact = {}, 
    shot_array = {}, 
    dormant_memory = {}, 
    spread_check = function(v851)
        -- upvalues: v70 (ref), l_abs_0 (ref)
        if not v851 or not v851.shot_info or not v851.bullet_impact_info then
            return 0;
        else
            local v852 = v70(v851.shot_info.l_pos, v851.bullet_impact_info.vector);
            return l_abs_0(v852.y - v851.shot_info.viewangles.y) + l_abs_0(v852.x - v851.shot_info.viewangles.x);
        end;
    end
};
v853.dormant_shot = function(v854)
    -- upvalues: v853 (ref)
    if not v853.shot_array[#v853.shot_array] or v853.shot_array[#v853.shot_array].tickcount ~= globals.tickcount then
        v853.shot_array[#v853.shot_array + 1] = {
            tickcount = globals.tickcount, 
            shot_info = v854
        };
    end;
end;
v853.dormant_bullet_impact = function(v855)
    -- upvalues: v853 (ref), v63 (ref)
    if #v853.shot_array == 0 then
        return;
    elseif entity.get(v855.userid, true) ~= v63.ref then
        return;
    else
        local v856 = vector(v855.x, v855.y, v855.z);
        if not v853.last_bullet_impact.tickcount or v853.last_bullet_impact.tickcount ~= globals.tickcount then
            v853.last_bullet_impact = {
                tickcount = globals.tickcount, 
                vector = v856
            };
            v853.shot_array[1].bullet_impact_info = v853.last_bullet_impact;
            v853.shot_array[1].bullet_impact_tickcount = globals.tickcount;
        end;
        return;
    end;
end;
v853.dormant_player_hurt = function(v857)
    -- upvalues: v853 (ref), v63 (ref)
    if #v853.shot_array == 0 then
        return;
    else
        local v858 = entity.get(v857.userid, true);
        if not v858 or v858 == v63.ref then
            return;
        elseif entity.get(v857.attacker, true) ~= v63.ref then
            return;
        else
            v853.shot_array[1].player_hurt_info = {
                damage = v857.dmg_health, 
                hitgroup = v857.hitgroup
            };
            return;
        end;
    end;
end;
v853.dormant_registered_shot = function()
    -- upvalues: v853 (ref), l_remove_0 (ref), v37 (ref), v117 (ref), l_insert_0 (ref)
    if #v853.shot_array == 0 then
        return;
    else
        local v859 = utils.net_channel();
        for v860 = 1, #v853.shot_array do
            if v853.shot_array[v860] then
                local v861 = v853.shot_array[v860];
                local v862 = (v859.latency[0] + v859.latency[1]) / globals.tickinterval + 20;
                local v863 = entity.get(v861.shot_info.index);
                if v861.tickcount + v862 < globals.tickcount then
                    l_remove_0(v853.shot_array, v860);
                elseif v861.bullet_impact_tickcount then
                    if v861.player_hurt_info then
                        local v864 = {
                            wanted_hitgroup = 10, 
                            backtrack = 0, 
                            target = v863, 
                            damage = v861.player_hurt_info.damage, 
                            hitchance = v861.shot_info.hitchance, 
                            hitgroup = v861.player_hurt_info.hitgroup, 
                            wanted_damage = v861.shot_info.damage
                        };
                        v37.register_hitlog(v864);
                        if v117.ui_tables.visuals.hitmarker_switch.value then
                            l_insert_0(v37.hitmarkers_list, #v37.hitmarkers_list, {
                                color = "hit", 
                                alpha = 0.1, 
                                pos = v861.shot_info.shooting_pos, 
                                reason = v861.player_hurt_info.damage, 
                                curtime = globals.curtime
                            });
                        end;
                    else
                        local v865 = v853.spread_check(v861);
                        if v865 < 2.5 or v865 > 50 then
                            v853.dormant_memory[v861.shot_info.index].miss_pos = entity.get(v861.shot_info.index):get_origin();
                            local v866 = {
                                state = "dormancy", 
                                wanted_hitgroup = 10, 
                                wanted_damage = 0, 
                                hitgroup = 3, 
                                damage = 0, 
                                backtrack = 0, 
                                target = v863, 
                                hitchance = v861.shot_info.hitchance
                            };
                            v37.register_hitlog(v866);
                            if v117.ui_tables.visuals.hitmarker_switch.value then
                                l_insert_0(v37.hitmarkers_list, #v37.hitmarkers_list, {
                                    color = "dormancy", 
                                    alpha = 0.1, 
                                    reason = "DORMANCY", 
                                    pos = v861.shot_info.shooting_pos, 
                                    curtime = globals.curtime
                                });
                            end;
                        else
                            local v867 = {
                                state = "spread", 
                                wanted_hitgroup = 10, 
                                wanted_damage = 0, 
                                hitgroup = 3, 
                                damage = 0, 
                                backtrack = 0, 
                                target = v863, 
                                hitchance = v861.shot_info.hitchance
                            };
                            v37.register_hitlog(v867);
                            if v117.ui_tables.visuals.hitmarker_switch.value then
                                l_insert_0(v37.hitmarkers_list, #v37.hitmarkers_list, {
                                    color = "spread", 
                                    alpha = 0.1, 
                                    reason = "SPREAD", 
                                    pos = v861.shot_info.shooting_pos, 
                                    curtime = globals.curtime
                                });
                            end;
                        end;
                    end;
                    l_remove_0(v853.shot_array, v860);
                end;
            end;
        end;
        return;
    end;
end;
v853.hitchance_calc = function(v868, v869, v870)
    -- upvalues: l_get_local_player_0 (ref), v70 (ref)
    local v871 = 0;
    local v872 = l_get_local_player_0();
    local v873 = v872:get_eye_position();
    local v874 = v872:get_player_weapon();
    local v875 = (v874:get_inaccuracy() + v874:get_spread()) * 1;
    local v876 = v70(v873, v870);
    for _ = 0, 128 do
        local v878 = v873 + (v868 + vector(utils.random_float(-v875, v875), utils.random_float(-v875, v875), utils.random_float(-v875, v875))) * #v869;
        local _, v880 = utils.trace_bullet(v872, v873, v878);
        local v881 = v876 - v70(v873, v880.end_pos);
        if math.abs(v881.x) + math.abs(v881.y) < 2 then
            v871 = v871 + 1;
        end;
    end;
    return v871 / 128 * 100;
end;
v853.save_pos_on_death = function(v882)
    -- upvalues: v853 (ref)
    local v883 = entity.get(v882.userid, true);
    local v884 = v883:get_index();
    local v885 = v853.dormant_memory[v884];
    if v883:is_enemy() then
        if not v885 then
            v853.dormant_memory[v884] = {};
            v853.dormant_memory[v884].miss_pos = v883:get_origin();
            v853.dormant_memory[v884].last_pos = vector(0, 0, 0);
            v853.dormant_memory[v884].last_update = globals.tickcount;
            v853.dormant_memory[v884].last_alpha = 0;
            v885 = v853.dormant_memory[v884];
        else
            v853.dormant_memory[v884].miss_pos = v883:get_origin();
        end;
    end;
end;
events.player_death:set(v853.save_pos_on_death);
events.player_connect_full:set(v853.save_pos_on_death);
events.player_team:set(v853.save_pos_on_death);
events.round_start:set(function()
    -- upvalues: v853 (ref)
    local v886 = entity.get_players(true, true);
    for v887 = 1, #v886 do
        local v888 = v886[v887];
        if v888 then
            local v889 = v888:get_index();
            local v890 = v853.dormant_memory[v889];
            if v888:is_enemy() then
                if not v890 then
                    v853.dormant_memory[v889] = {};
                    v853.dormant_memory[v889].miss_pos = v888:get_origin();
                    v853.dormant_memory[v889].last_pos = vector(0, 0, 0);
                    v853.dormant_memory[v889].last_update = globals.tickcount;
                    v853.dormant_memory[v889].last_alpha = 0;
                    v890 = v853.dormant_memory[v889];
                else
                    v853.dormant_memory[v889].miss_pos = v888:get_origin();
                end;
            end;
        end;
    end;
end);
v853.dormant_weapons = {
    [38] = true, 
    [40] = true, 
    [64] = true, 
    [11] = true, 
    [9] = true
};
local v891 = 0;
v853.dormant_aimbot_func = function(v892)
    -- upvalues: v63 (ref), v43 (ref), v117 (ref), v853 (ref), v891 (ref), l_bor_0 (ref), v38 (ref), v70 (ref), l_floor_0 (ref)
    if entity.get_game_rules().m_fRoundStartTime + 1 > globals.curtime then
        return;
    else
        local l_ref_2 = v63.ref;
        local v894 = l_ref_2:get_eye_position();
        local _ = v63.velocity;
        local v896 = v63.ground_tickcount > 1;
        local _ = v63.crouching;
        local _ = rage.exploit:get();
        local v899 = v43.dmg:get();
        if not v117.ui_tables.ragebot.dormant_dmgswitch.value or not v899 then
            v899 = v117.ui_tables.ragebot.dormant_dmg.value;
        end;
        local v900 = l_ref_2:get_player_weapon();
        if not v900 then
            return;
        else
            local v901 = v900:get_weapon_index();
            if not v853.dormant_weapons[v901] then
                return;
            else
                if v900.m_flNextSecondaryAttack and v900.m_flNextSecondaryAttack - globals.curtime > 0 and v891 < 17 then
                    v891 = v891 + 1;
                else
                    v891 = 0;
                end;
                local v902 = v43.hide_shots:get() and 0.05 or 0;
                if v43.double_tap:get() then
                    v902 = 0;
                end;
                if v900.m_iClip1 == 0 then
                    return;
                elseif v900.m_flNextPrimaryAttack + v902 > globals.curtime then
                    return;
                else
                    local l_m_flDuckAmount_0 = l_ref_2.m_flDuckAmount;
                    local v904 = not v43.fakeduck:get() or not (l_m_flDuckAmount_0 <= 0.8) or true;
                    local v905 = v43.double_tap:get() and 1 or 0;
                    local v906 = entity.get_players(true, true);
                    for v907 = 1, #v906 do
                        local v908 = v906[v907];
                        if v908 then
                            local v909 = v908:get_index();
                            local v910 = v853.dormant_memory[v909];
                            if not v910 then
                                v853.dormant_memory[v909] = {};
                                v853.dormant_memory[v909].miss_pos = vector(0, 0, 0);
                                v853.dormant_memory[v909].last_pos = vector(0, 0, 0);
                                v853.dormant_memory[v909].last_update = globals.tickcount;
                                v853.dormant_memory[v909].last_alpha = 0;
                                v910 = v853.dormant_memory[v909];
                            end;
                            if v908:is_alive() then
                                local v911 = v908:get_network_state();
                                if v911 == 0 or v911 == 1 then
                                    v910.miss_pos = vector(0, 0, 0);
                                    v853.dormant_memory[v909].last_update = globals.tickcount;
                                else
                                    local v912 = v908:get_bbox();
                                    if v853.dormant_memory[v909].last_alpha ~= 1 and v912.alpha == 1 then
                                        v910.miss_pos = vector(0, 0, 0);
                                        v853.dormant_memory[v909].last_update = globals.tickcount;
                                    end;
                                    v853.dormant_memory[v909].last_alpha = v912.alpha;
                                    local v913 = v908:get_origin();
                                    local l_m_vecMaxs_2 = v908.m_vecMaxs;
                                    local l_m_vecMins_2 = v908.m_vecMins;
                                    if l_m_vecMaxs_2 == vector(0, 0, 0) then
                                        local v916 = vector(16, 16, 72);
                                        if v916 then
                                            l_m_vecMaxs_2 = v916;
                                        end;
                                    end;
                                    if l_m_vecMins_2 == vector(0, 0, 0) then
                                        local v917 = vector(-16, -16, 0);
                                        if v917 then
                                            l_m_vecMins_2 = v917;
                                        end;
                                    end;
                                    local v918 = v913 + vector((l_m_vecMins_2.x + l_m_vecMaxs_2.x) / 4, (l_m_vecMins_2.y + l_m_vecMaxs_2.y) / 16, l_m_vecMins_2.z);
                                    if v913:dist(v910.miss_pos) >= 5 then
                                        local v919 = {
                                            [1] = {
                                                damage = 0, 
                                                pos = vector(0, 0, 0), 
                                                scale = vector(0, 0, l_m_vecMaxs_2.z / 1.8)
                                            }, 
                                            [2] = {
                                                damage = 0, 
                                                pos = vector(0, 0, 0), 
                                                scale = vector(0, 0, l_m_vecMaxs_2.z / 1.35)
                                            }
                                        };
                                        for v920 = 1, 2 do
                                            local v921 = v919[v920];
                                            local v922, v923 = utils.trace_bullet(l_ref_2, v894, v918 + v921.scale);
                                            v919[v920].pos = v918 + v921.scale;
                                            local v924 = v919[v920];
                                            local v925;
                                            if v923.entity ~= entity.get(0) then
                                                v925 = v923.entity == v908 and v922 or 0;
                                            else
                                                v925 = v922;
                                            end;
                                            v924.damage = v925;
                                        end;
                                        local v926 = 0;
                                        local v927 = {
                                            index = v908:get_index(), 
                                            l_pos = v894, 
                                            player_pos = v918
                                        };
                                        if v919[2].damage > v919[1].damage then
                                            v918 = v919[2].pos;
                                            v926 = v919[2].damage;
                                        else
                                            v918 = v919[1].pos;
                                            v926 = v919[1].damage;
                                        end;
                                        if v926 > 0 and v926 >= v899 then
                                            if v901 ~= 64 and not l_ref_2.m_bIsScoped then
                                                v892.buttons = l_bor_0(v892.buttons, v38.flags.IN_ZOOM);
                                                return;
                                            else
                                                v853.player_pos_visual = v918;
                                                local v928 = v70(v894, v918);
                                                local v929 = l_floor_0(v853.hitchance_calc(vector():angles(v928), v894 - v918, v918));
                                                v892.block_movement = 1;
                                                if (v896 and 70 or 40) <= v929 and v904 then
                                                    v892.view_angles.x = v928.x;
                                                    v892.view_angles.y = v928.y;
                                                    v892.view_angles.z = 0;
                                                    v927.viewangles = v892.view_angles;
                                                    v927.hitchance = v929;
                                                    v927.shooting_pos = v918;
                                                    v927.damage = v926;
                                                    if v901 ~= 64 or v891 > 16 - v905 and v891 < 18 - v905 then
                                                        v892.buttons = l_bor_0(v892.buttons, 1);
                                                        if v901 ~= 64 or v891 == 17 - v905 then
                                                            v853.dormant_shot(v927);
                                                            break;
                                                        else
                                                            break;
                                                        end;
                                                    else
                                                        break;
                                                    end;
                                                else
                                                    return;
                                                end;
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
end;
v117.ui_tables.ragebot.dormant_switch:set_callback(function()
    -- upvalues: v117 (ref), v853 (ref)
    if v117.ui_tables.ragebot.dormant_switch.value then
        events.createmove:set(v853.dormant_aimbot_func);
        events.bullet_impact:set(v853.dormant_bullet_impact);
        events.player_hurt:set(v853.dormant_player_hurt);
        events.render:set(v853.dormant_registered_shot);
        ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot"):override(false);
    else
        events.createmove:unset(v853.dormant_aimbot_func);
        events.bullet_impact:unset(v853.dormant_bullet_impact);
        events.player_hurt:unset(v853.dormant_player_hurt);
        events.render:unset(v853.dormant_registered_shot);
        ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot"):override();
    end;
end, true);
events.shutdown:set(function()
    ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot"):override();
end);
v853.ai_cache = {};
v853.go_to_pos = function(v930, v931)
    -- upvalues: v63 (ref), l_cos_0 (ref), l_pi_0 (ref), l_sin_0 (ref)
    local v932 = v63.ref:get_origin();
    local v933 = v932.x - v931.x;
    local v934 = v932.y - v931.y;
    local l_y_0 = render.camera_angles().y;
    v930.forwardmove = -22 * (v933 * l_cos_0(l_y_0 / 180 * l_pi_0) + v934 * l_sin_0(l_y_0 / 180 * l_pi_0));
    v930.sidemove = 22 * (v934 * l_cos_0(l_y_0 / 180 * l_pi_0) - v933 * l_sin_0(l_y_0 / 180 * l_pi_0));
end;
local v936 = {};
v853.ai_peek_start_pos = nil;
v853.ai_peek_side = nil;
v853.ai_peek_ent_idx = nil;
v853.ai_peek_cache_tickcount = 0;
v853.ai_peek_cache_dt = nil;
v853.ai_peek_damage_tick_cache = 0;
v853.ai_peek_shoot_points = nil;
v853.ai_peek_func = function(v937)
    -- upvalues: v63 (ref), v853 (ref), v936 (ref), v117 (ref), l_trace_line_0 (ref), l_insert_0 (ref), v45 (ref), v43 (ref), l_abs_0 (ref), l_remove_0 (ref)
    local l_ref_3 = v63.ref;
    local v939 = l_ref_3:get_origin();
    if not v853.ai_peek_start_pos then
        v853.ai_peek_start_pos = v939;
    end;
    if not entity.get_threat() or v63.ground_tickcount <= 1 then
        v936 = {};
        return;
    else
        local v940 = l_ref_3:get_player_weapon();
        if not v940 then
            return;
        else
            local _ = l_ref_3.m_vecMins;
            local _ = l_ref_3.m_vecMaxs;
            local v943 = rage.antiaim:get_target();
            local v944 = l_ref_3:get_eye_position();
            v936 = {};
            for v945 = 0, 1 do
                local v946 = nil;
                local l_ai_peek_start_pos_0 = v853.ai_peek_start_pos;
                local v948 = v853.ai_peek_side ~= nil and 5 or v117.ui_tables.ragebot.aipeek_dist.value;
                if v853.ai_peek_side ~= nil then
                    if v853.ai_peek_side == 0 then
                        v946 = vector():angles(0, v943 - 90, 0);
                        l_ai_peek_start_pos_0 = l_trace_line_0(l_ai_peek_start_pos_0, l_ai_peek_start_pos_0 + v946 * v948 / 2, l_ref_3, nil, 1).end_pos;
                    else
                        v946 = vector():angles(0, v943 + 90, 0);
                        l_ai_peek_start_pos_0 = l_trace_line_0(l_ai_peek_start_pos_0, l_ai_peek_start_pos_0 + v946 * v948 / 2, l_ref_3, nil, 1).end_pos;
                    end;
                elseif v945 == 0 then
                    v946 = vector():angles(0, v943 - 90, 0);
                    l_ai_peek_start_pos_0 = l_trace_line_0(l_ai_peek_start_pos_0, l_ai_peek_start_pos_0 + v946 * v948, l_ref_3, nil, 1).end_pos;
                else
                    v946 = vector():angles(0, v943 + 90, 0);
                    l_ai_peek_start_pos_0 = l_trace_line_0(l_ai_peek_start_pos_0, l_ai_peek_start_pos_0 + v946 * v948, l_ref_3, nil, 1).end_pos;
                end;
                local l_l_ai_peek_start_pos_0_0 = l_ai_peek_start_pos_0;
                local v950 = l_ref_3:simulate_movement(v853.ai_peek_start_pos, vector(0, 0, 0));
                v950:think(1);
                local l_view_offset_0 = v950.view_offset;
                l_l_ai_peek_start_pos_0_0.z = l_l_ai_peek_start_pos_0_0.z + l_view_offset_0;
                local v952 = 0;
                local v953 = v853.ai_peek_side ~= nil and 6 or 0;
                for _ = v952, v953 do
                    local v955 = v853.ai_peek_side ~= nil and l_l_ai_peek_start_pos_0_0 + v946 * v117.ui_tables.ragebot.aipeek_dist.value / 7 or l_l_ai_peek_start_pos_0_0;
                    local v956 = l_trace_line_0(l_l_ai_peek_start_pos_0_0, v955, l_ref_3, nil, 1);
                    local _ = l_trace_line_0(v956.end_pos, v956.end_pos - vector(0, 0, l_view_offset_0 + 50), l_ref_3, nil, 0);
                    local l_end_pos_0 = v956.end_pos;
                    l_l_ai_peek_start_pos_0_0 = l_end_pos_0;
                    l_end_pos_0.z = v944.z;
                    l_insert_0(v936, {
                        pos = l_end_pos_0, 
                        side = v853.ai_peek_side ~= nil and v853.ai_peek_side or v945
                    });
                    if v853.ai_peek_side ~= nil and v956.fraction ~= 1 then
                        break;
                    end;
                end;
                if v853.ai_peek_side then
                    break;
                end;
            end;
            weap_type = v940:get_weapon_info().weapon_type;
            weap_type = weap_type ~= 0 and weap_type ~= 9 and weap_type ~= 7 and weap_type ~= 11;
            if v117.ui_tables.ragebot.aipeek_keys.value and (v937.sidemove ~= 0 or v937.forwardmove ~= 0) then
                return;
            elseif v117.ui_tables.ragebot.aipeek_dt.value and v45.double_tap.value and rage.exploit:get() ~= 1 then
                return;
            elseif v940.m_iIronSightMode == 2 or v940.m_flNextPrimaryAttack > globals.curtime or not weap_type or v940.m_iClip1 == 0 then
                v853.ai_cache = {};
                v853.ai_peek_damage_tick_cache = 0;
                v853.ai_peek_shoot_points = nil;
                return;
            else
                local v959 = entity.get_players(true);
                local v960 = nil;
                local l_tickcount_0 = globals.tickcount;
                local v962 = math.max(v43.dmg:get() - 5, 5);
                local v963 = {};
                local v964 = entity.get_players();
                for v965 = 1, #v964 do
                    if not v964[v965]:is_enemy() then
                        l_insert_0(v963, v964[v965]);
                    end;
                end;
                local v966 = v43.hitboxes:get(1);
                local v967 = v43.hitboxes:get(2);
                local v968 = v43.hitboxes:get(3);
                local l_value_20 = v117.ui_tables.ragebot.aipeek_delay.value;
                if v853.ai_peek_ent_idx then
                    local v970 = entity.get(v853.ai_peek_ent_idx);
                    local l_ai_peek_ent_idx_0 = v853.ai_peek_ent_idx;
                    if v970 and v970:is_alive() and not v970:is_dormant() then
                        local v972 = v970:get_simulation_time();
                        local v973 = v972.current - v972.old;
                        if not v853.ai_cache[l_ai_peek_ent_idx_0] then
                            v853.ai_cache[l_ai_peek_ent_idx_0] = {
                                tickcount = 0, 
                                backtrack = {}
                            };
                        end;
                        if v973 <= -0.01 then
                            v853.ai_cache[l_ai_peek_ent_idx_0].tickcount = l_tickcount_0 + 12;
                        end;
                        local v974;
                        if not v853.ai_cache[l_ai_peek_ent_idx_0].tickcount or l_tickcount_0 >= v853.ai_cache[l_ai_peek_ent_idx_0].tickcount then
                            v974 = false;
                        else
                            v974 = true;
                        end;
                        if v974 and v970.m_hGroundEntity then
                            local v975 = {};
                            if v967 then
                                v975[#v975 + 1] = v970:get_hitbox_position(5);
                            end;
                            if v968 then
                                v975[#v975 + 1] = v970:get_hitbox_position(2);
                            end;
                            if #v975 == 0 then
                                return;
                            else
                                for v976 = 1, #v936 do
                                    for v977 = 1, #v975 do
                                        local v978, v979 = utils.trace_bullet(l_ref_3, v936[v976].pos, v975[v977], l_ref_3);
                                        if v979.entity and v979.entity == v970 and math.min(v962, v970.m_iHealth) <= v978 then
                                            v960 = {
                                                pos = v936[v976].pos, 
                                                hitbox_pos = v975[v977], 
                                                side = v936[v976].side
                                            };
                                            break;
                                        end;
                                    end;
                                    if v960 then
                                        break;
                                    end;
                                end;
                            end;
                        else
                            v853.ai_cache[l_ai_peek_ent_idx_0].hitbox_def = nil;
                            local v980 = {};
                            if v966 then
                                local v981 = v970:get_hitbox_position(0);
                                v981.z = v981.z + 2;
                                v980[#v980 + 1] = v981;
                            end;
                            if v967 then
                                v980[#v980 + 1] = v970:get_hitbox_position(5);
                            end;
                            if v968 then
                                v980[#v980 + 1] = v970:get_hitbox_position(2);
                            end;
                            if #v980 == 0 then
                                return;
                            else
                                if v973 ~= 0 and v970.m_vecVelocity:length2d() < 300 then
                                    local v982 = {};
                                    if v967 then
                                        v982[#v982 + 1] = v970:get_hitbox_position(5);
                                    end;
                                    if v968 then
                                        v982[#v982 + 1] = v970:get_hitbox_position(2);
                                    end;
                                    l_insert_0(v853.ai_cache[l_ai_peek_ent_idx_0].backtrack, 1, {
                                        hitboxes = v982, 
                                        tickcount = l_tickcount_0
                                    });
                                end;
                                local l_backtrack_0 = v853.ai_cache[l_ai_peek_ent_idx_0].backtrack;
                                for v984 = 1, #l_backtrack_0 do
                                    if l_abs_0(l_backtrack_0[v984].tickcount) - l_tickcount_0 > 20 then
                                        l_remove_0(v853.ai_cache[l_ai_peek_ent_idx_0].backtrack, v984);
                                    end;
                                end;
                                for v985 = 1, #v936 do
                                    for v986 = 1, #v980 do
                                        local v987, v988 = utils.trace_bullet(l_ref_3, v936[v985].pos, v980[v986], l_ref_3);
                                        if v988.entity and v988.entity == v970 and math.min(v962, v970.m_iHealth) <= v987 then
                                            v960 = {
                                                pos = v936[v985].pos, 
                                                hitbox_pos = v980[v986], 
                                                side = v936[v985].side
                                            };
                                            break;
                                        end;
                                    end;
                                    if v960 then
                                        break;
                                    end;
                                end;
                            end;
                        end;
                    end;
                    local v989 = v970 and v970:is_alive();
                    local v990 = v970 and v970:is_dormant();
                    if v960 and v989 and not v990 then
                        v853.ai_peek_damage_tick_cache = v853.ai_peek_damage_tick_cache + 1;
                        if l_value_20 <= v853.ai_peek_damage_tick_cache then
                            v853.ai_peek_side = v960.side;
                            v853.ai_peek_ent_idx = l_ai_peek_ent_idx_0;
                            v853.ai_peek_cache_tickcount = l_tickcount_0;
                        else
                            v960 = nil;
                        end;
                    else
                        if l_abs_0(v853.ai_peek_cache_tickcount - l_tickcount_0) > 25 or not v989 or v990 then
                            v853.ai_peek_side = nil;
                            v853.ai_peek_ent_idx = nil;
                        end;
                        v853.ai_peek_damage_tick_cache = 0;
                    end;
                else
                    for v991 = 1, #v959 do
                        local v992 = v959[v991];
                        if v992 and v992:is_alive() and not v992:is_dormant() then
                            local v993 = v992:get_index();
                            local v994 = v992:get_simulation_time();
                            local v995 = v994.current - v994.old;
                            if not v853.ai_cache[v993] then
                                v853.ai_cache[v993] = {
                                    trigger_tickcount = 0, 
                                    tickcount = 0, 
                                    backtrack = {}
                                };
                            end;
                            if v995 <= -0.01 then
                                v853.ai_cache[v993].tickcount = l_tickcount_0 + 12;
                            end;
                            if l_tickcount_0 < v853.ai_cache[v993].tickcount and v992.m_hGroundEntity then
                                local v996 = {};
                                if v967 then
                                    v996[#v996 + 1] = v992:get_hitbox_position(5);
                                end;
                                if v968 then
                                    v996[#v996 + 1] = v992:get_hitbox_position(2);
                                end;
                                if #v996 == 0 then
                                    return;
                                else
                                    for v997 = 1, #v936 do
                                        for v998 = 1, #v996 do
                                            local v999, v1000 = utils.trace_bullet(l_ref_3, v936[v997].pos, v996[v998], l_ref_3);
                                            if v1000.entity and v1000.entity == v992 and math.min(v962, v992.m_iHealth) <= v999 then
                                                v960 = {
                                                    pos = v936[v997].pos, 
                                                    hitbox_pos = v996[v998], 
                                                    side = v936[v997].side
                                                };
                                                break;
                                            end;
                                        end;
                                        if v960 then
                                            break;
                                        end;
                                    end;
                                end;
                            else
                                v853.ai_cache[v993].hitbox_def = nil;
                                local v1001 = {};
                                if v966 then
                                    local v1002 = v992:get_hitbox_position(0);
                                    v1002.z = v1002.z + 2;
                                    v1001[#v1001 + 1] = v1002;
                                end;
                                if v967 then
                                    v1001[#v1001 + 1] = v992:get_hitbox_position(5);
                                end;
                                if v968 then
                                    v1001[#v1001 + 1] = v992:get_hitbox_position(2);
                                end;
                                if #v1001 == 0 then
                                    return;
                                else
                                    if v995 ~= 0 and v992.m_vecVelocity:length2d() < 300 then
                                        local v1003 = {};
                                        if v967 then
                                            v1003[#v1003 + 1] = v992:get_hitbox_position(5);
                                        end;
                                        if v968 then
                                            v1003[#v1003 + 1] = v992:get_hitbox_position(2);
                                        end;
                                        l_insert_0(v853.ai_cache[v993].backtrack, 1, {
                                            hitboxes = v1003, 
                                            tickcount = l_tickcount_0
                                        });
                                    end;
                                    local l_backtrack_1 = v853.ai_cache[v993].backtrack;
                                    for v1005 = 1, #l_backtrack_1 do
                                        if l_abs_0(l_backtrack_1[v1005].tickcount) - l_tickcount_0 > 20 then
                                            l_remove_0(v853.ai_cache[v993].backtrack, v1005);
                                        end;
                                    end;
                                    for v1006 = 1, #v936 do
                                        for v1007 = 1, #v1001 do
                                            local v1008, v1009 = utils.trace_bullet(l_ref_3, v936[v1006].pos, v1001[v1007], l_ref_3);
                                            if v1009.entity and v1009.entity == v992 and math.min(v962, v992.m_iHealth) <= v1008 then
                                                v960 = {
                                                    pos = v936[v1006].pos, 
                                                    hitbox_pos = v1001[v1007], 
                                                    side = v936[v1006].side
                                                };
                                                break;
                                            end;
                                        end;
                                        if v960 then
                                            break;
                                        end;
                                    end;
                                end;
                            end;
                            local v1010 = v992:is_alive();
                            local v1011 = v992:is_dormant();
                            if v960 and v1010 and not v1011 then
                                v853.ai_peek_side = v960.side;
                                v853.ai_peek_ent_idx = v993;
                                v853.ai_peek_cache_tickcount = l_tickcount_0;
                                v960 = nil;
                                break;
                            elseif l_abs_0(v853.ai_peek_cache_tickcount - l_tickcount_0) > 25 or not v1010 or v1011 then
                                v853.ai_peek_side = nil;
                                v853.ai_peek_ent_idx = nil;
                            end;
                        end;
                    end;
                end;
                if v960 then
                    v853.go_to_pos(v937, v960.pos);
                elseif v853.ai_peek_start_pos:dist(v939) > 3 then
                    v853.go_to_pos(v937, v853.ai_peek_start_pos);
                    if v960 ~= v853.ai_peek_cache_dt and rage.exploit:get() == 1 then
                        rage.exploit:force_teleport();
                    end;
                end;
                v853.ai_peek_shoot_points = v960;
                v853.ai_peek_cache_dt = v960;
                return;
            end;
        end;
    end;
end;
v853.ai_peek_visualize = function(_)
    -- upvalues: v936 (ref), v853 (ref), v117 (ref)
    if #v936 <= 1 then
        return;
    else
        local _ = (v936[1].pos - v936[2].pos):normalized() + vector():angles(0, -90, 0);
        local _ = v853.ai_peek_ent_idx;
        if v853.ai_peek_shoot_points and v853.ai_peek_shoot_points.hitbox_pos and v853.ai_peek_shoot_points.pos then
            local v1015 = v853.ai_peek_shoot_points.pos:to_screen();
            local v1016 = v853.ai_peek_shoot_points.hitbox_pos:to_screen();
            render.circle_3d(v853.ai_peek_shoot_points.hitbox_pos, color(255, 0, 0), 2, 0, 1);
            render.circle_3d(v853.ai_peek_shoot_points.pos, color(0, 255, 0), 2, 0, 1);
            if v1015 and v1016 then
                render.line(v1015, v1016, color(0, 255, 0));
            end;
        end;
        if v117.ui_tables.ragebot.aipeek_vis.value then
            for v1017 = 1, #v936 do
                render.circle_3d(v936[v1017].pos, color(255), 2, 0, 1);
            end;
        end;
        return;
    end;
end;
v853.ai_peek_on_death = function(v1018)
    -- upvalues: v853 (ref)
    local v1019 = entity.get(v1018.userid, true);
    local v1020 = v1019:get_index();
    local v1021 = v853.ai_cache[v1020];
    if v1019:is_enemy() then
        if not v1021 then
            v853.ai_cache[v1020] = {
                tickcount = 0, 
                backtrack = {}
            };
        else
            v853.ai_cache[v1020].backtrack = {};
        end;
    end;
end;
events.player_death:set(v853.save_pos_on_death);
v117.ui_tables.ragebot.aipeek_switch:set_callback(function()
    -- upvalues: v853 (ref), v117 (ref), v45 (ref)
    v853.ai_peek_start_pos = nil;
    if v117.ui_tables.ragebot.aipeek_switch.value then
        events.createmove:set(v853.ai_peek_func);
        events.render:set(v853.ai_peek_visualize);
        v45.peek_assist:override(true);
        v45.peek_assist_return:override({
            [1] = "On Shot"
        });
    else
        v853.ai_peek_damage_tick_cache = 0;
        events.createmove:unset(v853.ai_peek_func);
        events.render:unset(v853.ai_peek_visualize);
        v853.ai_cache = {};
        v45.retreat_mode:override();
        v45.peek_assist:override();
        v853.enemy_point = nil;
        v853.ai_peek_side = nil;
        v853.ai_peek_ent_idx = nil;
        v853.ai_peek_cache_tickcount = 0;
        v45.peek_assist_return:override();
    end;
end, true);
v853.telep_array = v117.ui_tables.ragebot.discharge_combo.elements_array;
v853.telep_func_array = {
    [1] = 7, 
    [2] = 8, 
    [3] = 8, 
    [4] = 8, 
    [5] = nil, 
    [6] = nil, 
    [7] = nil, 
    [8] = nil, 
    [9] = 2, 
    [10] = nil, 
    [11] = 3, 
    [12] = nil, 
    [13] = nil, 
    [14] = nil, 
    [15] = nil, 
    [16] = nil, 
    [17] = 5, 
    [18] = nil, 
    [19] = nil, 
    [20] = nil, 
    [21] = nil, 
    [22] = nil, 
    [23] = 5, 
    [24] = 5, 
    [25] = 4, 
    [26] = 5, 
    [27] = 4, 
    [28] = nil, 
    [29] = 4, 
    [30] = 8, 
    [31] = 10, 
    [32] = 8, 
    [33] = 5, 
    [34] = 5, 
    [35] = 4, 
    [36] = 8, 
    [37] = nil, 
    [38] = 3, 
    [39] = nil, 
    [40] = 1, 
    [41] = nil, 
    [42] = nil, 
    [43] = nil, 
    [44] = nil, 
    [45] = nil, 
    [46] = nil, 
    [47] = nil, 
    [48] = nil, 
    [49] = nil, 
    [50] = nil, 
    [51] = nil, 
    [52] = nil, 
    [53] = nil, 
    [54] = nil, 
    [55] = nil, 
    [56] = nil, 
    [57] = nil, 
    [58] = nil, 
    [59] = nil, 
    [60] = nil, 
    [61] = 8, 
    [62] = nil, 
    [63] = 8, 
    [64] = 6, 
    knife = 9
};
v853.telep_delay_cache = 0;
v853.lc_timer = 0;
v853.lc_tickbase = 999999;
v853.discharge_func = function(v1022)
    -- upvalues: v43 (ref), v63 (ref), v117 (ref), v853 (ref), l_abs_0 (ref)
    if not v43.double_tap:get() and v43.hide_shots:get() then
        return;
    else
        local l_ref_4 = v63.ref;
        local l_on_ground_0 = v63.on_ground;
        if v117.ui_tables.ragebot.discharge_mode.value == 3 then
            local l_m_nTickBase_0 = l_ref_4.m_nTickBase;
            if l_m_nTickBase_0 - 3 > v853.lc_tickbase then
                v853.lc_timer = globals.tickcount + 11;
            end;
            v853.lc_tickbase = l_m_nTickBase_0;
        end;
        if l_on_ground_0 then
            return;
        elseif l_abs_0(v853.telep_delay_cache - globals.curtime) < v117.ui_tables.ragebot.discharge_delay.value / 10 then
            return;
        else
            if rage.exploit:get() == 0 and v117.ui_tables.ragebot.discharge_delay.value ~= 11 and l_abs_0(v853.telep_delay_cache - globals.curtime) < 1.5 then
                rage.exploit:force_charge();
            end;
            if rage.exploit:get() ~= 1 then
                return;
            elseif not entity.get_threat(true) then
                return;
            else
                local v1026 = l_ref_4:get_player_weapon();
                if not v1026 then
                    return;
                else
                    local v1027 = v1026:get_weapon_index();
                    if v1026:get_classname() == "CKnife" then
                        v1027 = "knife";
                    end;
                    local v1028 = v853.telep_func_array[v1027];
                    if not v1028 or not v117.ui_tables.ragebot.discharge_combo.ref:get(v1028) then
                        return;
                    else
                        if v117.ui_tables.ragebot.discharge_mode.value == 2 then
                            local v1029 = l_ref_4:simulate_movement();
                            v1029:think(13);
                            if v1029.velocity.z ~= 0 then
                                return;
                            else
                                v1022.in_jump = false;
                            end;
                        end;
                        if v117.ui_tables.ragebot.discharge_mode.value == 3 then
                            if v853.lc_timer - globals.tickcount > 0 then
                                return;
                            elseif v853.lc_timer - globals.tickcount < -5 then
                                return;
                            end;
                        end;
                        rage.exploit:force_teleport();
                        v853.telep_delay_cache = globals.curtime - 0.02;
                        return;
                    end;
                end;
            end;
        end;
    end;
end;
v117.ui_tables.ragebot.discharge_switch:set_callback(function()
    -- upvalues: v117 (ref), v853 (ref)
    if v117.ui_tables.ragebot.discharge_switch.value then
        events.createmove:set(v853.discharge_func);
    else
        events.createmove:unset(v853.discharge_func);
    end;
end, true);
v853.anti_def_curtime = 1;
v853.anti_def_cache_team = 0;
v853.need_join_team = false;
v853.anti_def_func = function()
    -- upvalues: v117 (ref), v59 (ref), l_get_local_player_0 (ref), v853 (ref)
    local l_value_21 = v117.ui_tables.ragebot.antidef_switch.value;
    local l_cl_lagcompensation_0 = cvar.cl_lagcompensation;
    local v1032 = v59(globals.curtime % 0.4, 0.1);
    local v1033 = l_get_local_player_0();
    local l_v1033_0 = v1033;
    if not v1033 then
        return;
    else
        if v1032 == 0 then
            if v1032 == v853.anti_def_curtime then
                return;
            else
                local v1035 = nil;
                if l_v1033_0 then
                    v1035 = v1033.m_iTeamNum;
                end;
                v853.anti_def_curtime = v1032;
                if l_value_21 and l_cl_lagcompensation_0:int() ~= 0 then
                    if not l_v1033_0 then
                        l_cl_lagcompensation_0:int(0);
                        return;
                    elseif v1035 ~= 1 then
                        v853.anti_def_cache_team = v1033.m_iTeamNum;
                        utils.console_exec("jointeam 1");
                    else
                        l_cl_lagcompensation_0:int(0);
                        v853.need_join_team = true;
                    end;
                else
                    if v853.need_join_team then
                        utils.console_exec("jointeam " .. v853.anti_def_cache_team .. " 2");
                        v853.need_join_team = false;
                    end;
                    if not l_value_21 and l_cl_lagcompensation_0:int() ~= 1 then
                        if not l_v1033_0 then
                            l_cl_lagcompensation_0:int(1);
                            return;
                        elseif v1035 ~= 1 then
                            v853.anti_def_cache_team = v1035;
                            utils.console_exec("jointeam 1");
                        else
                            l_cl_lagcompensation_0:int(1);
                            v853.need_join_team = true;
                        end;
                    end;
                end;
            end;
        else
            v853.anti_def_curtime = 1;
        end;
        return;
    end;
end;
events.render:set(v853.anti_def_func);
v853.delay = 0;
v853.air_breaklc_func = function(_)
    -- upvalues: v43 (ref), v63 (ref), v853 (ref)
    if not v43.double_tap:get() then
        return;
    elseif v63.on_ground then
        return;
    else
        if math.abs(v853.delay - globals.tickcount) > 17 then
            rage.exploit:force_teleport();
        end;
        if rage.exploit:get() == 0 then
            rage.exploit:force_charge();
        end;
        if rage.exploit:get() < 0.08 then
            v853.delay = globals.tickcount;
        end;
        return;
    end;
end;
v117.ui_tables.ragebot.air_exploit:set_callback(function()
    -- upvalues: v117 (ref), v853 (ref)
    if v117.ui_tables.ragebot.air_exploit.value then
        events.createmove:set(v853.air_breaklc_func);
    else
        events.createmove:unset(v853.air_breaklc_func);
    end;
end, true);
v853.rollres_func = function()
    -- upvalues: v92 (ref), v117 (ref)
    for v1037 = 1, 64 do
        local v1038 = entity.get(v1037);
        if v1038 and v1038:is_enemy() and v1038:is_alive() and not v1038:is_dormant() then
            local v1039 = v92.m_eye_angle(v1038[0]);
            v1039.z = v117.ui_tables.ragebot.roll_deg.value;
            v1039.x = v117.ui_tables.ragebot.roll_pitch_switch.value and v117.ui_tables.ragebot.roll_pitch_deg.value or v1039.x;
        end;
    end;
end;
v117.ui_tables.ragebot.roll_resolver:set_callback(function()
    -- upvalues: v117 (ref), v853 (ref)
    if v117.ui_tables.ragebot.roll_resolver.value then
        events.net_update_end:set(v853.rollres_func);
    else
        events.net_update_end:unset(v853.rollres_func);
    end;
end, true);
v853.jumpscout_func = function(v1040)
    -- upvalues: v63 (ref), v45 (ref)
    local l_ref_5 = v63.ref;
    local l_velocity_2 = v63.velocity;
    local v1043 = v1040.forwardmove ~= 0 or not (v1040.sidemove == 0) or l_velocity_2 > 100;
    local v1044 = l_ref_5:get_player_weapon();
    if not v1044 or v1044:get_weapon_index() ~= 40 then
        v1043 = true;
    end;
    if not v1043 then
        v45.autostop:override("In Air");
    else
        v45.autostop:override();
    end;
    v45.airstrafe:override(v1043);
end;
v117.ui_tables.ragebot.jumpscout:set_callback(function()
    -- upvalues: v117 (ref), v853 (ref), v45 (ref)
    if v117.ui_tables.ragebot.jumpscout.value then
        utils.execute_after(0.5, function()
            -- upvalues: v853 (ref)
            events.createmove:set(v853.jumpscout_func);
        end);
    else
        events.createmove:unset(v853.jumpscout_func);
        v45.airstrafe:override();
    end;
    v45.airstrafe:override();
end, true);
v853.hc_func_array = {
    [1] = 7, 
    [2] = 8, 
    [3] = 8, 
    [4] = 8, 
    [5] = nil, 
    [6] = nil, 
    [7] = nil, 
    [8] = nil, 
    [9] = 2, 
    [10] = nil, 
    [11] = 3, 
    [12] = nil, 
    [13] = nil, 
    [14] = nil, 
    [15] = nil, 
    [16] = nil, 
    [17] = 5, 
    [18] = nil, 
    [19] = nil, 
    [20] = nil, 
    [21] = nil, 
    [22] = nil, 
    [23] = 5, 
    [24] = 5, 
    [25] = 4, 
    [26] = 5, 
    [27] = 4, 
    [28] = nil, 
    [29] = 4, 
    [30] = 8, 
    [31] = nil, 
    [32] = 8, 
    [33] = 5, 
    [34] = 5, 
    [35] = 4, 
    [36] = 8, 
    [37] = nil, 
    [38] = 3, 
    [39] = nil, 
    [40] = 1, 
    [41] = nil, 
    [42] = nil, 
    [43] = nil, 
    [44] = nil, 
    [45] = nil, 
    [46] = nil, 
    [47] = nil, 
    [48] = nil, 
    [49] = nil, 
    [50] = nil, 
    [51] = nil, 
    [52] = nil, 
    [53] = nil, 
    [54] = nil, 
    [55] = nil, 
    [56] = nil, 
    [57] = nil, 
    [58] = nil, 
    [59] = nil, 
    [60] = nil, 
    [61] = 8, 
    [62] = nil, 
    [63] = 8, 
    [64] = 6
};
v853.hc_isoverriden = false;
v853.hitchance_func = function()
    -- upvalues: v63 (ref), v853 (ref), v45 (ref), v43 (ref), v117 (ref)
    local l_ref_6 = v63.ref;
    local l_on_ground_1 = v63.on_ground;
    if l_on_ground_1 then
        if v853.hc_isoverriden then
            v45.hitchance:override();
            v853.hc_isoverriden = false;
        end;
        return;
    else
        local v1047 = l_ref_6:get_player_weapon();
        if not v1047 then
            return;
        else
            local v1048 = v1047:get_weapon_index();
            local v1049 = v853.hc_func_array[v1048];
            if not v1049 then
                if v853.hc_isoverriden then
                    v43.hitchance:override();
                    v853.hc_isoverriden = false;
                end;
                return;
            else
                local v1050 = v117.ui_tables.ragebot["air_" .. v1049];
                if not v1050 or v1050.value <= 0 or l_on_ground_1 then
                    if v853.hc_isoverriden then
                        v43.hitchance:override();
                        v853.hc_isoverriden = false;
                    end;
                    return;
                else
                    v45.hitchance:override(v1050.value);
                    v853.hc_isoverriden = true;
                    return;
                end;
            end;
        end;
    end;
end;
events.createmove:set(v853.hitchance_func);
events.shutdown:set(function()
    -- upvalues: v853 (ref)
    if v853.hc_isoverriden then
        for v1051 = 1, #v853.refs_hc do
            v853.refs_hc[v1051]:override();
        end;
        v853.hc_isoverriden = false;
    end;
end);
v853.nshc_array = {
    [1] = "SSG-08", 
    [2] = "AWP", 
    [3] = "AutoSnipers"
};
v853.refs_nshc = {
    ui.find("Aimbot", "Ragebot", "Selection", "AutoSnipers", "Hit Chance"), 
    ui.find("Aimbot", "Ragebot", "Selection", "AWP", "Hit Chance"), 
    ui.find("Aimbot", "Ragebot", "Selection", "SSG-08", "Hit Chance")
};
v853.refs_s_nshc = {
    ui.find("Aimbot", "Ragebot", "Accuracy", "AutoSnipers", "Auto Scope"), 
    ui.find("Aimbot", "Ragebot", "Accuracy", "AWP", "Auto Scope"), 
    ui.find("Aimbot", "Ragebot", "Accuracy", "SSG-08", "Auto Scope")
};
v853.hc_func_array = {
    [38] = 3, 
    [40] = 1, 
    [9] = 2, 
    [11] = 3
};
v853.nshc_isoverriden = false;
v853.no_scope_func = function()
    -- upvalues: v63 (ref), v853 (ref), v43 (ref), v117 (ref)
    local l_ref_7 = v63.ref;
    local _ = v63.on_ground;
    local v1054 = entity.get_threat();
    local v1055 = 0;
    if v1054 and l_ref_7 then
        v1055 = (l_ref_7:get_origin() - v1054:get_origin()):length() / 100;
    end;
    local v1056 = l_ref_7:get_player_weapon();
    if not v1056 then
        return;
    else
        local v1057 = v1056:get_weapon_index();
        local v1058 = v853.hc_func_array[v1057];
        if not v1058 then
            if v853.nshc_isoverriden then
                v43.hitchance:override();
                v43.no_scope:override();
                v853.nshc_isoverriden = false;
            end;
            return;
        else
            local v1059 = v117.ui_tables.ragebot["noscope_" .. v1058];
            if not v1054 or not v1059 or v1059.value <= -1 then
                if v853.nshc_isoverriden then
                    v43.hitchance:override();
                    v43.no_scope:override();
                    v853.nshc_isoverriden = false;
                end;
                return;
            elseif l_ref_7.m_bIsScoped or v117.ui_tables.ragebot["noscope_dist" .. v1058].value / 10 < v1055 and v117.ui_tables.ragebot["noscope_dist" .. v1058].value / 10 < 10.1 then
                if v853.nshc_isoverriden then
                    v43.hitchance:override();
                    v43.no_scope:override();
                    v853.nshc_isoverriden = false;
                end;
                return;
            else
                v43.hitchance:override(v1059.value);
                v43.no_scope:override(false);
                v853.nshc_isoverriden = true;
                return;
            end;
        end;
    end;
end;
events.createmove:set(v853.no_scope_func);
v853.airstop_cache = nil;
v853.airstop_func = function()
    -- upvalues: v63 (ref), v853 (ref), v43 (ref), v117 (ref), v44 (ref)
    local l_ref_8 = v63.ref;
    if v63.on_ground then
        if v853.airstop_cache then
            v43.autostop:override();
            v853.airstop_cache = nil;
        end;
        return;
    else
        local l_value_by_name_2 = v117.ui_tables.ragebot.airstop_cond.value_by_name;
        if l_value_by_name_2[1] and v44.slowwalk then
            local v1062 = v43.autostop:get();
            v1062[#v1062] = "In Air";
            v43.autostop:override(v1062);
            v853.airstop_cache = true;
            return;
        else
            if l_value_by_name_2[2] then
                local v1063 = entity.get_threat();
                if v1063 and not v1063:is_dormant() and v1063:get_origin():dist(l_ref_8:get_origin()) < 300 then
                    local v1064 = v43.autostop:get();
                    v1064[#v1064] = "In Air";
                    v43.autostop:override(v1064);
                    v853.airstop_cache = true;
                    return;
                end;
            end;
            if v853.airstop_cache then
                v43.autostop:override();
                v853.airstop_cache = nil;
            end;
            return;
        end;
    end;
end;
v117.ui_tables.ragebot.airstop_switch:set_callback(function()
    -- upvalues: v117 (ref), v853 (ref), v43 (ref)
    if v117.ui_tables.ragebot.airstop_switch.value then
        events.createmove:set(v853.airstop_func);
    else
        events.createmove:unset(v853.airstop_func);
    end;
    v43.autostop:override();
    v853.airstop_cache = nil;
end, true);
v853.need_throw = false;
v853.grenade_release_func_nade = function(v1065)
    -- upvalues: v853 (ref), v117 (ref)
    v853.need_throw = false;
    if v1065.type == "Frag" and v1065.target then
        local v1066 = v1065.target.m_ArmorValue > 0 and 50 or 100;
        if v1065.damage / v1066 >= v117.ui_tables.ragebot.grenade_damage.value / 100 or v1065.fatal then
            v853.need_throw = true;
        end;
    end;
end;
v853.grenade_release_func_createmove = function(v1067)
    -- upvalues: v853 (ref)
    if v853.need_throw then
        v1067.in_attack = true;
    end;
end;
v117.ui_tables.ragebot.grenade_switch:set_callback(function()
    -- upvalues: v117 (ref), v853 (ref)
    if v117.ui_tables.ragebot.grenade_switch.value then
        events.grenade_prediction:set(v853.grenade_release_func_nade);
        events.createmove:set(v853.grenade_release_func_createmove);
    else
        events.grenade_prediction:unset(v853.grenade_release_func_nade);
        events.createmove:unset(v853.grenade_release_func_createmove);
    end;
    v853.need_throw = false;
end, true);
v37.screen_size = render.screen_size();
v37.animation_value = 6.666666666666667 * globals.frametime * 100 / 200;
v37.global_alpha = 0;
v37.update_consts = function()
    -- upvalues: v37 (ref), l_get_local_player_0 (ref)
    v37.screen_size = render.screen_size();
    v37.animation_value = 6.666666666666667 * globals.frametime * 100 / 200;
    local v1068 = l_get_local_player_0();
    v37.global_alpha = v37.calculate_value("global_alpha", v1068 and v1068:is_alive(), 2);
end;
events.render:set(v37.update_consts);
v37.easings = {
    out_quart = function(v1069)
        -- upvalues: l_pow_0 (ref)
        return 1 - l_pow_0(1 - v1069, 4);
    end, 
    in_quart = function(v1070)
        return v1070 * v1070 * v1070 * v1070;
    end, 
    in_out_quart = function(v1071)
        -- upvalues: l_pow_0 (ref)
        return v1071 < 0.5 and 8 * v1071 * v1071 * v1071 * v1071 or 1 - l_pow_0(-2 * v1071 + 2, 4) / 2;
    end
};
v37.anim_values = {};
v37.calculate_color = function(v1072, v1073, v1074)
    -- upvalues: l_clamp_0 (ref)
    v1074 = math.min(1, v1074);
    local v1075, v1076, v1077, v1078 = v1073:unpack();
    s_a = v1078;
    s_b = v1077;
    s_g = v1076;
    s_r = v1075;
    v1075, v1076, v1077, v1078 = v1072:unpack();
    s2_a = v1078;
    s2_b = v1077;
    s2_g = v1076;
    s2_r = v1075;
    v1075 = 0;
    v1076 = 0;
    v1077 = 0;
    v1078 = 0;
    if s2_r < s_r then
        local v1079 = s_r - s2_r;
        v1075 = l_clamp_0(s_r - v1079 * v1074, s2_r, s_r);
    else
        local v1080 = s2_r - s_r;
        v1075 = l_clamp_0(s_r + v1080 * v1074, s_r, s2_r);
    end;
    if s2_g < s_g then
        local v1081 = s_g - s2_g;
        v1076 = l_clamp_0(s_g - v1081 * v1074, s2_g, s_g);
    else
        local v1082 = s2_g - s_g;
        v1076 = l_clamp_0(s_g + v1082 * v1074, s_g, s2_g);
    end;
    if s2_b < s_b then
        local v1083 = s_b - s2_b;
        v1077 = l_clamp_0(s_b - v1083 * v1074, s2_b, s_b);
    else
        local v1084 = s2_b - s_b;
        v1077 = l_clamp_0(s_b + v1084 * v1074, s_b, s2_b);
    end;
    if s2_a < s_a then
        local v1085 = s_a - s2_a;
        v1078 = l_clamp_0(s_a - v1085 * v1074, s2_a, s_a);
    else
        local v1086 = s2_a - s_a;
        v1078 = l_clamp_0(s_a + v1086 * v1074, s_a, s2_a);
    end;
    return color(v1075, v1076, v1077, v1078);
end;
v37.print_color_text = function(v1087, v1088)
    -- upvalues: l_insert_0 (ref), v9 (ref)
    local v1089 = {};
    for v1090 = 1, #v1087 do
        local v1091 = v1090 % 2 == 1 and v1088:to_hex() or "\aedededFF";
        l_insert_0(v1089, "\a" .. v1091);
        l_insert_0(v1089, v1087[v1090]);
        l_insert_0(v1089, "\aedededFF");
    end;
    v9(table.concat(v1089));
end;
v37.calculate_gradient = function(v1092, v1093, v1094)
    -- upvalues: v37 (ref)
    local v1095 = #v1092;
    local v1096 = {};
    for v1097 = 1, v1095 do
        local v1098 = (v1097 + 1) / v1095;
        v1096[v1097] = "\a" .. v37.calculate_color(v1093, v1094, v1098):to_hex():sub(1, 6) .. v1092:sub(v1097, v1097);
    end;
    return table.concat(v1096);
end;
v37.calculate_value = function(v1099, v1100, v1101, v1102, v1103)
    -- upvalues: v37 (ref), l_clamp_0 (ref)
    local v1104 = v37.anim_values[v1099];
    if not v1104 then
        v37.anim_values[v1099] = 0;
        v1104 = v37.anim_values[v1099];
    end;
    if not v1101 or not v1101 then
        v1101 = 1;
    end;
    if not v1102 or not v1102 then
        v1102 = 0;
    end;
    if not v1103 or not v1103 then
        v1103 = 1;
    end;
    if v1100 then
        v37.anim_values[v1099] = l_clamp_0(v1104 + v37.animation_value * v1101, v1102, v1103);
    else
        v37.anim_values[v1099] = l_clamp_0(v1104 - v37.animation_value * v1101, v1102, v1103);
    end;
    return v37.anim_values[v1099];
end;
drag_system = {};
drag_system.list_names = {};
drag_system.list = {};
drag_system.in_bounds = function(v1105, v1106, v1107)
    if v1107.x > v1105.x and v1107.y > v1105.y and v1107.x < v1106.x and v1107.y < v1106.y then
        return true;
    else
        return false;
    end;
end;
drag_system.add_drag = function(v1108, v1109, v1110, v1111, v1112, v1113)
    -- upvalues: v0 (ref), l_insert_0 (ref)
    if drag_system.list[v1108] then
        error("drag system " .. v1108 .. " already exists");
    end;
    v0.drag_memory[v1108 .. "_x"] = v0.drag_memory[v1108 .. "_x"] == nil and v1111.x or v0.drag_memory[v1108 .. "_x"];
    v0.drag_memory[v1108 .. "_y"] = v0.drag_memory[v1108 .. "_y"] == nil and v1111.y or v0.drag_memory[v1108 .. "_y"];
    if v1113 == nil then
        v1113 = function()
            return true;
        end;
    end;
    drag_system.list[v1108] = {
        drag = false, 
        tab = tab, 
        adjust_start_point = v1109, 
        adjust_finish_point = v1110, 
        name = v1108, 
        diff = vector(0, 0), 
        lock_x = v1112, 
        state = v1113
    };
    l_insert_0(drag_system.list_names, v1108);
end;
drag_system.last_element = nil;
drag_system.active_element = nil;
drag_system.check_drags = function()
    -- upvalues: v37 (ref), v0 (ref)
    if ui.get_alpha() == 0 then
        return;
    else
        local l_screen_size_0 = v37.screen_size;
        local v1115 = common.is_button_down(1);
        if not v1115 then
            drag_system.last_element = nil;
            drag_system.active_element = nil;
        end;
        local v1116 = ui.get_mouse_position();
        for v1117 = 1, #drag_system.list_names do
            if not drag_system.last_element or drag_system.last_element == v1117 then
                local v1118 = drag_system.list[drag_system.list_names[v1117]];
                if v1118.state() then
                    if not v1115 then
                        v1118.drag = false;
                        v1118.diff = vector(0, 0);
                    else
                        local l_name_1 = v1118.name;
                        local _ = v1118.tab;
                        local v1121 = vector(v1118.lock_x and l_screen_size_0.x / 2 or v0.drag_memory[l_name_1 .. "_x"], v0.drag_memory[l_name_1 .. "_y"]) + v1118.adjust_start_point;
                        local v1122 = v1121 + v1118.adjust_finish_point;
                        if drag_system.in_bounds(v1121, v1122, v1116) or v1118.drag then
                            if not v1118.drag then
                                v1118.diff = v1116 - v1121;
                                v1118.drag = true;
                            end;
                            local v1123 = v1116 - v1118.diff;
                            v1123 = vector(math.max(0, v1123.x), math.max(0, v1123.y)) - v1118.adjust_start_point;
                            if v1123.x + v1118.adjust_finish_point.x / 2 > l_screen_size_0.x then
                                v1123.x = l_screen_size_0.x - v1118.adjust_finish_point.x / 2;
                            end;
                            if v1123.y + v1118.adjust_finish_point.y > l_screen_size_0.y then
                                v1123.y = l_screen_size_0.y - v1118.adjust_finish_point.y;
                            end;
                            v1121 = v1123;
                            v0.drag_memory[l_name_1 .. "_x"] = v1118.lock_x and v37.screen_size.x / 2 or v1121.x;
                            v0.drag_memory[l_name_1 .. "_y"] = v1121.y;
                            drag_system.active_element = l_name_1;
                            drag_system.last_element = v1117;
                        end;
                    end;
                end;
            end;
        end;
        return;
    end;
end;
events.render:set(drag_system.check_drags);
events.createmove:set(function(v1124)
    if drag_system.last_element then
        v1124.in_attack = 0;
    end;
end);
v37.smoke_array = {};
v37.molotov_array = {};
v37.grenade_smoke_func = function()
    -- upvalues: l_get_local_player_0 (ref), v117 (ref), v37 (ref), l_clamp_0 (ref)
    local v1125 = l_get_local_player_0();
    if not v1125 then
        return;
    else
        local v1126 = v1125:get_origin();
        local v1127 = 600;
        local v1128 = entity.get_entities("CSmokeGrenadeProjectile");
        local l_value_22 = v117.ui_tables.visuals.nade_smoke_c.value;
        local l_value_23 = v117.ui_tables.visuals.nade_style.value;
        for v1131 = #v1128, 0, -1 do
            local v1132 = v1128[v1131];
            if v1132 and v1132.m_bDidSmokeEffect then
                local v1133 = v1132:get_index();
                if not v37.smoke_array[v1133] then
                    v37.smoke_array[v1133] = {
                        alpha = 0, 
                        anim = 0
                    };
                end;
                local v1134 = v37.smoke_array[v1133];
                local v1135 = 1 - (globals.tickcount - v1132.m_nSmokeEffectTickBegin) / 1155;
                local l_m_vecOrigin_0 = v1132.m_vecOrigin;
                v1134.anim = l_clamp_0(v1134.anim + v37.animation_value, 0, 1);
                v1134.alpha = v1135 > 0.02 and l_clamp_0(v1134.alpha + v37.animation_value, 0, 1) or l_clamp_0(v1134.alpha - v37.animation_value, 0, 1);
                if v1135 == 0 then
                    v37.smoke_array[v1133] = nil;
                else
                    local v1137 = v1126:dist2d(l_m_vecOrigin_0) - v1127;
                    v1137 = v1137 > 0 and 1 - v1137 / 80 or 1;
                    local v1138 = v37.easings.out_quart(v1134.alpha) * v1137;
                    local v1139 = v37.easings.out_quart(v1134.anim);
                    if v1138 ~= 0 then
                        local v1140 = l_value_22:clone();
                        v1140.a = v1140.a * v1138;
                        local v1141 = v1140:clone();
                        v1141.a = 0;
                        render.circle_3d_outline(l_m_vecOrigin_0, v1140, 125 * v1139, 90, l_value_23 == 2 and v1135 or 1, l_value_23 == 2 and 2 or 1);
                        v1140.a = v1140.a - 20;
                        if l_value_23 == 2 then
                            render.circle_3d_gradient(l_m_vecOrigin_0, v1140, v1141, 125 * v1139, 0, 1, 1);
                        end;
                    end;
                end;
            end;
        end;
        return;
    end;
end;
v37.grenade_molotov_func = function()
    -- upvalues: l_get_local_player_0 (ref), v117 (ref), v37 (ref), l_clamp_0 (ref)
    local v1142 = l_get_local_player_0();
    if not v1142 then
        return;
    else
        local v1143 = v1142:get_origin();
        local v1144 = 525;
        local l_value_24 = v117.ui_tables.visuals.nade_molotov_c.value;
        local l_value_25 = v117.ui_tables.visuals.nade_molotov_cf.value;
        local v1147 = entity.get_entities("CInferno");
        local l_value_26 = v117.ui_tables.visuals.nade_style.value;
        for v1149 = #v1147, 0, -1 do
            local v1150 = v1147[v1149];
            if v1150 then
                local v1151 = v1150:get_index();
                if not v37.molotov_array[v1151] then
                    v37.molotov_array[v1151] = {
                        alpha = 0, 
                        anim = 0
                    };
                end;
                local v1152 = v37.molotov_array[v1151];
                local v1153 = 1 - (globals.tickcount - v1150.m_nFireEffectTickBegin) / 449;
                local l_m_vecOrigin_1 = v1150.m_vecOrigin;
                v1152.alpha = v1153 > 0.06 and l_clamp_0(v1152.alpha + v37.animation_value / 2, 0, 1) or l_clamp_0(v1152.alpha - v37.animation_value, 0, 1);
                local v1155 = v1143:dist2d(l_m_vecOrigin_1) - v1144;
                v1155 = v1155 > 0 and 1 - v1155 / 80 or 1;
                local v1156 = v37.easings.out_quart(v1152.alpha) * v1155;
                if v1156 ~= 0 then
                    local l_m_hOwnerEntity_0 = v1150.m_hOwnerEntity;
                    local v1158 = false;
                    if l_m_hOwnerEntity_0 then
                        v1158 = l_m_hOwnerEntity_0.m_iTeamNum == v1142.m_iTeamNum and l_m_hOwnerEntity_0 ~= v1142;
                    end;
                    local v1159 = v1158 and l_value_25:clone() or l_value_24:clone();
                    v1159.a = v1159.a * v1156;
                    local v1160 = v1159:clone();
                    v1160.a = 0;
                    local v1161 = {};
                    for v1162 = 1, 20 do
                        v1161[v1162] = l_m_vecOrigin_1 + vector(v1150.m_fireXDelta[v1162], v1150.m_fireYDelta[v1162], v1150.m_fireZDelta[v1162]);
                    end;
                    local v1163 = 0;
                    local v1164 = vector(0, 0, 0);
                    local v1165 = vector(0, 0, 0);
                    for v1166 = 1, #v1161 do
                        for v1167 = 1, #v1161 do
                            local v1168 = v1161[v1166]:dist2d(v1161[v1167]);
                            if v1163 < v1168 then
                                v1164 = v1161[v1166];
                                v1165 = v1161[v1167];
                                v1163 = v1168;
                            end;
                        end;
                    end;
                    local v1169 = (v1164 + v1165) / 2;
                    v1169.z = l_m_vecOrigin_1.z;
                    local v1170 = v1163 / 2;
                    v1152.anim = v1170 > 50 and l_clamp_0(v1152.anim + v37.animation_value / 3, 0, 1) or v1152.anim;
                    local v1171 = v37.easings.out_quart(v1152.anim);
                    if v1153 <= 0.018 then
                        v37.molotov_array[v1151] = nil;
                    else
                        render.circle_3d_outline(v1169, v1159, v1170 * v1171, 90, l_value_26 == 2 and v1153 or 1, l_value_26 == 2 and 2 or 1);
                        v1159.a = v1159.a - 20;
                        if l_value_26 == 2 then
                            render.circle_3d_gradient(v1169, v1159, v1160, v1170 * v1171, 0, 1, 1);
                        end;
                    end;
                end;
            end;
        end;
        return;
    end;
end;
v117.ui_tables.visuals.nade_switch:set_callback(function()
    -- upvalues: v117 (ref), v37 (ref)
    if v117.ui_tables.visuals.nade_switch.value then
        events.round_start:unset(function()
            -- upvalues: v37 (ref)
            v37.smoke_array = {};
            v37.molotov_array = {};
        end);
    else
        events.round_start:unset(function()
            -- upvalues: v37 (ref)
            v37.smoke_array = {};
            v37.molotov_array = {};
        end);
    end;
    if v117.ui_tables.visuals.nade_switch.value and v117.ui_tables.visuals.nade_smoke.value then
        events.render:set(v37.grenade_smoke_func);
    else
        events.render:unset(v37.grenade_smoke_func);
    end;
    if v117.ui_tables.visuals.nade_switch.value and v117.ui_tables.visuals.nade_molotov.value then
        events.render:set(v37.grenade_molotov_func);
    else
        events.render:unset(v37.grenade_molotov_func);
    end;
end, true);
v117.ui_tables.visuals.nade_molotov:set_callback(function()
    -- upvalues: v117 (ref), v37 (ref)
    if v117.ui_tables.visuals.nade_switch.value and v117.ui_tables.visuals.nade_molotov.value then
        events.render:set(v37.grenade_molotov_func);
    else
        events.render:unset(v37.grenade_molotov_func);
    end;
end, true);
v117.ui_tables.visuals.nade_smoke:set_callback(function()
    -- upvalues: v117 (ref), v37 (ref)
    if v117.ui_tables.visuals.nade_switch.value and v117.ui_tables.visuals.nade_smoke.value then
        events.render:set(v37.grenade_smoke_func);
    else
        events.render:unset(v37.grenade_smoke_func);
    end;
end);
v37.hitmarkers_list = {};
v37.png_hex = "\137PNG\r\n\026\n\000\000\000\rIHDR\000\000\000\r\000\000\000\r\b\006\000\000\000r\235\228|\000\000\000\tpHYs\000\000\v\019\000\000\v\019\001\000\154\156\024\000\000\000\142IDAT(\145\157\146\205\021\0020\b\131\211\021z`\133\f\192:]YV\138\a\141\175V\252y\230\b|PB\135$\000\192\024#q\211\1971\171\203M\000\139\164\"B\000\018\000$\225^\144\017!\146\002\176\220(IJ\146\170j\a\167\129\170\146$\131\1373\177\129\235M<\031\211\206\002\146\031\129\022\180\154'\195\203Z\203\251Y\155\001\243\t\218]\2506I\018Z\224\151\157\254r\239\221\157^\026\238wj\127\196\233\234\249#\166\147\221\029\186\220\021!\165\253\250\195\218X:\000\000\000\000IEND\174B`\130";
v37.loaded_image = render.load_image(v37.png_hex, vector(13, 13));
v37.hitmarker_register = function(v1172)
    -- upvalues: l_insert_0 (ref), v37 (ref)
    local l_state_0 = v1172.state;
    if l_state_0 == "correction" then
        l_state_0 = "resolver";
    end;
    if l_state_0 == "misprediction" then
        l_state_0 = "jitter resolver";
    end;
    if not l_state_0 then
        l_state_0 = "hit";
    end;
    l_insert_0(v37.hitmarkers_list, #v37.hitmarkers_list, {
        alpha = 0.1, 
        pos = v1172.aim, 
        reason = v1172.state and string.upper(l_state_0) or v1172.damage, 
        curtime = globals.curtime, 
        color = l_state_0
    });
end;
v37.hitmarker_func = function()
    -- upvalues: v117 (ref), v853 (ref), v37 (ref), l_abs_0 (ref), l_clamp_0 (ref), l_text_0 (ref)
    local v1174 = v117.ui_tables.visuals.hitmarker_duration.value / 10;
    local v1175 = v117.ui_tables.visuals.hitmarker_miss.value:clone();
    local v1176 = v117.ui_tables.visuals.hitmarker_theme_hit.value and (v117.ui_tables.visuals.color_use_theme.value and ui.get_style("Link Active") or v117.ui_tables.visuals.main_color.value) or v117.ui_tables.visuals.hitmarker_hit.value:clone();
    local l_value_27 = v117.ui_tables.visuals.hitmarker_lastshot.value;
    local l_value_28 = v117.ui_tables.visuals.hitmarker_color_hitlog.value;
    local l_value_29 = v117.ui_tables.visuals.hitmarker_glow.value;
    local v1180 = 25;
    local v1181 = 0.75;
    if l_value_28 then
        if v117.ui_tables.visuals.hitlog_color_mode.value == 1 then
            v853.log_colors = {
                hit = v117.ui_tables.visuals.hitlog_theme_hit.value and ui.get_style("Link Active") or v117.ui_tables.visuals.hitlog_hit.value, 
                ["lagcomp failure"] = v117.ui_tables.visuals.hitlog_miss.value, 
                ["prediction error"] = v117.ui_tables.visuals.hitlog_miss.value, 
                ["jitter resolver"] = v117.ui_tables.visuals.hitlog_miss.value, 
                resolver = v117.ui_tables.visuals.hitlog_miss.value, 
                spread = v117.ui_tables.visuals.hitlog_miss.value, 
                ["unregistered shot"] = v117.ui_tables.visuals.hitlog_miss.value, 
                ["player death"] = v117.ui_tables.visuals.hitlog_miss.value, 
                death = v117.ui_tables.visuals.hitlog_miss.value, 
                dormancy = v117.ui_tables.visuals.hitlog_miss.value, 
                error = v117.ui_tables.visuals.hitlog_miss.value, 
                ["damage rejection"] = v117.ui_tables.visuals.hitlog_miss.value, 
                ["backtrack failure"] = v117.ui_tables.visuals.hitlog_miss.value
            };
        else
            v853.log_colors = {
                hit = v117.ui_tables.visuals.hitlog_theme_hit.value and ui.get_style("Link Active") or v117.ui_tables.visuals.hitlog_hit.value, 
                ["lagcomp failure"] = v117.ui_tables.visuals.hitlog_pred.value, 
                ["prediction error"] = v117.ui_tables.visuals.hitlog_pred.value, 
                ["jitter resolver"] = v117.ui_tables.visuals.hitlog_resolver.value, 
                resolver = v117.ui_tables.visuals.hitlog_resolver.value, 
                spread = v117.ui_tables.visuals.hitlog_spread.value, 
                ["unregistered shot"] = v117.ui_tables.visuals.hitlog_death.value, 
                ["player death"] = v117.ui_tables.visuals.hitlog_death.value, 
                death = v117.ui_tables.visuals.hitlog_death.value, 
                dormancy = v117.ui_tables.visuals.hitlog_resolver.value, 
                error = v117.ui_tables.visuals.hitlog_resolver.value, 
                ["damage rejection"] = v117.ui_tables.visuals.hitlog_death.value, 
                ["backtrack failure"] = v117.ui_tables.visuals.hitlog_resolver.value
            };
        end;
    else
        v853.log_colors = {
            hit = v117.ui_tables.visuals.hitmarker_theme_hit.value and ui.get_style("Link Active") or v117.ui_tables.visuals.hitmarker_hit.value, 
            ["lagcomp failure"] = v117.ui_tables.visuals.hitmarker_miss.value, 
            ["prediction error"] = v117.ui_tables.visuals.hitmarker_miss.value, 
            ["jitter resolver"] = v117.ui_tables.visuals.hitmarker_miss.value, 
            resolver = v117.ui_tables.visuals.hitmarker_miss.value, 
            spread = v117.ui_tables.visuals.hitmarker_miss.value, 
            ["unregistered shot"] = v117.ui_tables.visuals.hitmarker_miss.value, 
            ["player death"] = v117.ui_tables.visuals.hitmarker_miss.value, 
            death = v117.ui_tables.visuals.hitmarker_miss.value, 
            dormancy = v117.ui_tables.visuals.hitmarker_miss.value, 
            error = v117.ui_tables.visuals.hitmarker_miss.value, 
            ["damage rejection"] = v117.ui_tables.visuals.hitmarker_miss.value, 
            ["backtrack failure"] = v117.ui_tables.visuals.hitmarker_miss.value
        };
    end;
    for v1182 = #v37.hitmarkers_list, 0, -1 do
        local v1183 = v37.hitmarkers_list[v1182];
        if v1183 then
            if v1183.alpha == 0 then
                table.remove(v37.hitmarkers_list, v1182);
            else
                if v1174 < l_abs_0(v1183.curtime - globals.curtime) or l_value_27 and v1182 > 0 then
                    v1183.alpha = l_clamp_0(v1183.alpha - v37.animation_value * 2, 0, 1);
                else
                    v1183.alpha = l_clamp_0(v1183.alpha + v37.animation_value * 2, 0, 1);
                end;
                local l_alpha_0 = v1183.alpha;
                local v1185 = v1183.pos:to_screen();
                if v1185 then
                    v1185 = v1185 - vector(6.5, 6.5);
                    local v1186 = v1183.color == "hit" and v1176 or v1175;
                    if l_value_28 then
                        local v1187 = v853.log_colors[v1183.color];
                        if v1187 then
                            v1186 = v1187;
                        end;
                    end;
                    local v1188 = color(v1186.r, v1186.g, v1186.b, v1186.a * l_alpha_0);
                    if l_value_29 then
                        local v1189 = v1188:clone();
                        v1189.a = 255 * v1181 * l_alpha_0;
                        render.shadow(v1185 + vector(4, 5), v1185 + vector(5, 7), v1189, v1180 * 2);
                    end;
                    render.texture(v37.loaded_image, v1185, vector(13, 13), v1188);
                    local v1190 = v1183.color ~= "hit" and v1188 or color(255, 255 * l_alpha_0);
                    if l_value_29 then
                        local v1191 = render.measure_text(2, nil, v1183.reason);
                        local v1192 = v1190:clone();
                        v1192.a = 255 * v1181 * l_alpha_0;
                        render.shadow(v1185 + vector(18, 4), v1185 + vector(16, 1) + v1191 / 1.6, v1192, v1180);
                    end;
                    l_text_0(2, v1185 + vector(15, 1), v1190, nil, v1183.reason);
                end;
            end;
        end;
    end;
end;
v117.ui_tables.visuals.hitmarker_switch:set_callback(function()
    -- upvalues: v117 (ref), v37 (ref), v43 (ref)
    if v117.ui_tables.visuals.hitmarker_switch.value then
        events.aim_ack:set(v37.hitmarker_register);
        events.render:set(v37.hitmarker_func);
        v43.world_hitmarker:override(false);
    else
        events.aim_ack:unset(v37.hitmarker_register);
        events.render:unset(v37.hitmarker_func);
        v43.world_hitmarker:override();
    end;
end, true);
events.shutdown:set(function()
    -- upvalues: v43 (ref)
    v43.world_hitmarker:override();
end);
v37.logs_array = {};
v37.register_hitlog = function(v1193)
    -- upvalues: v117 (ref), v853 (ref), l_insert_0 (ref), v37 (ref)
    local l_value_by_name_3 = v117.ui_tables.visuals.hitlog_vis_type.value_by_name;
    local v1195 = l_value_by_name_3[2];
    local v1196 = l_value_by_name_3[3];
    local v1197 = l_value_by_name_3[1];
    local _ = v1193.id;
    local v1199 = tostring(v1193.target:get_name());
    local v1200 = tostring(v1193.damage);
    local v1201 = tostring(v1193.hitchance);
    local v1202 = tostring(v853.hitgroup_str[v1193.hitgroup]);
    local v1203 = tostring(v1193.backtrack);
    local v1204 = tostring(v1193.wanted_damage);
    local v1205 = tostring(v853.hitgroup_str[v1193.wanted_hitgroup]);
    local l_state_1 = v1193.state;
    if l_state_1 == "correction" then
        l_state_1 = "resolver";
    end;
    if l_state_1 == "misprediction" then
        l_state_1 = "jitter resolver";
    end;
    if not v1200 then
        return;
    else
        if v117.ui_tables.visuals.hitlog_color_mode.value == 1 then
            v853.log_colors = {
                hit = v117.ui_tables.visuals.hitlog_theme_hit.value and ui.get_style("Link Active") or v117.ui_tables.visuals.hitlog_hit.value, 
                ["lagcomp failure"] = v117.ui_tables.visuals.hitlog_miss.value, 
                ["prediction error"] = v117.ui_tables.visuals.hitlog_miss.value, 
                ["jitter resolver"] = v117.ui_tables.visuals.hitlog_miss.value, 
                resolver = v117.ui_tables.visuals.hitlog_miss.value, 
                spread = v117.ui_tables.visuals.hitlog_miss.value, 
                ["unregistered shot"] = v117.ui_tables.visuals.hitlog_miss.value, 
                ["player death"] = v117.ui_tables.visuals.hitlog_miss.value, 
                death = v117.ui_tables.visuals.hitlog_miss.value, 
                dormancy = v117.ui_tables.visuals.hitlog_miss.value, 
                error = v117.ui_tables.visuals.hitlog_miss.value, 
                ["damage rejection"] = v117.ui_tables.visuals.hitlog_miss.value, 
                ["backtrack failure"] = v117.ui_tables.visuals.hitlog_miss.value
            };
        else
            v853.log_colors = {
                hit = v117.ui_tables.visuals.hitlog_theme_hit.value and ui.get_style("Link Active") or v117.ui_tables.visuals.hitlog_hit.value, 
                ["lagcomp failure"] = v117.ui_tables.visuals.hitlog_pred.value, 
                ["prediction error"] = v117.ui_tables.visuals.hitlog_pred.value, 
                ["jitter resolver"] = v117.ui_tables.visuals.hitlog_resolver.value, 
                resolver = v117.ui_tables.visuals.hitlog_resolver.value, 
                spread = v117.ui_tables.visuals.hitlog_spread.value, 
                ["unregistered shot"] = v117.ui_tables.visuals.hitlog_death.value, 
                ["player death"] = v117.ui_tables.visuals.hitlog_death.value, 
                death = v117.ui_tables.visuals.hitlog_death.value, 
                dormancy = v117.ui_tables.visuals.hitlog_resolver.value, 
                error = v117.ui_tables.visuals.hitlog_resolver.value, 
                ["damage rejection"] = v117.ui_tables.visuals.hitlog_death.value, 
                ["backtrack failure"] = v117.ui_tables.visuals.hitlog_resolver.value
            };
        end;
        if not l_state_1 and v1202 then
            if v1195 then
                local v1207 = {
                    anim_value = 0.01, 
                    color = v853.log_colors.hit, 
                    text_array = {
                        [1] = "", 
                        [2] = nil, 
                        [3] = nil, 
                        [4] = nil, 
                        [5] = " in the ", 
                        [2] = v117.ui_tables.visuals.hitlog_extra.value_by_name.Icons and "\239\129\155 " or "", 
                        [3] = v1193.target.m_iHealth ~= 0 and "Hit " or "Killed ", 
                        [4] = v1193.target.m_iHealth ~= 0 and v1199 or v1199 .. "`s", 
                        [6] = v1202 == v1205 and v1202 or v1202 .. "(" .. v1205 .. ")", 
                        [7] = v1193.target.m_iHealth ~= 0 and " for " or "", 
                        [8] = v1193.target.m_iHealth ~= 0 and (v1200 == v1204 and v1200 or v1200 .. "(" .. v1204 .. ")") or "", 
                        [9] = v1193.target.m_iHealth ~= 0 and " (" or "", 
                        [10] = v1193.target.m_iHealth ~= 0 and v1193.target.m_iHealth or "", 
                        [11] = v1193.target.m_iHealth ~= 0 and " hp remaining)" or ""
                    }, 
                    curtime = globals.curtime
                };
                l_insert_0(v37.logs_array, v1207);
            end;
            local v1208 = ("Hit %s %s for %s (%s hp remaining) bt: %s hc: %s"):format(v1199, v1202 ~= v1205 and v1202 .. "(" .. v1205 .. ")" or v1202, v1200, v1193.target.m_iHealth, v1203, v1201);
            if v1197 then
                local l_print_color_text_0 = v37.print_color_text;
                local v1210 = {
                    [1] = "", 
                    [2] = nil, 
                    [3] = "", 
                    [4] = nil, 
                    [5] = nil, 
                    [6] = " in the ", 
                    [7] = nil, 
                    [8] = nil, 
                    [9] = "", 
                    [10] = nil, 
                    [11] = nil, 
                    [12] = nil, 
                    [13] = "", 
                    [2] = "\a" .. v853.log_colors.hit:to_hex() .. table.concat({
                        [1] = "extension ", 
                        [2] = "\194\187", 
                        [3] = " "
                    }), 
                    [4] = v1193.target.m_iHealth ~= 0 and "Hit    " or "Killed ", 
                    [5] = v1193.target.m_iHealth ~= 0 and v1199 .. "  " or v1199 .. "`s", 
                    [7] = v1202, 
                    [8] = v1202 ~= v1205 and "(" .. v1205 .. ")" or "", 
                    [10] = v1193.target.m_iHealth ~= 0 and " for " or "", 
                    [11] = v1193.target.m_iHealth ~= 0 and v1200 or ""
                };
                local v1211;
                if v1193.target.m_iHealth ~= 0 then
                    v1211 = v1200 ~= v1204 and "(" .. v1204 .. ")" or "";
                else
                    v1211 = "";
                end;
                v1210[12] = v1211;
                v1210[14] = (v1193.target.m_iHealth > 0 and " (" .. v1193.target.m_iHealth .. " hp remaining)" or "") .. (v1203 ~= "0" and " bt: " or "");
                v1210[15] = v1203 ~= "0" and v1203 or "";
                v1210[16] = v1201 ~= "100" and " hc: " or "";
                v1210[17] = v1201 ~= "100" and v1201 or "";
                l_print_color_text_0(v1210, v853.log_colors.hit);
            end;
            if v1196 then
                print_dev(v1208);
            end;
            return;
        else
            if v1195 then
                local v1212 = {
                    anim_value = 0.01, 
                    color = v853.log_colors[l_state_1], 
                    text_array = {
                        [1] = "", 
                        [2] = nil, 
                        [3] = "Missed ", 
                        [4] = nil, 
                        [5] = " in the ", 
                        [6] = nil, 
                        [7] = " due to ", 
                        [2] = v117.ui_tables.visuals.hitlog_extra.value_by_name.Icons and "\238\137\140 " or "", 
                        [4] = v1199 .. "`s", 
                        [6] = v1205, 
                        [8] = l_state_1
                    }, 
                    curtime = globals.curtime
                };
                l_insert_0(v37.logs_array, v1212);
            end;
            if v1197 then
                v37.print_color_text({
                    [1] = "", 
                    [2] = nil, 
                    [3] = "", 
                    [4] = "Missed ", 
                    [5] = nil, 
                    [6] = " in the ", 
                    [7] = nil, 
                    [8] = " due to ", 
                    [2] = "\a" .. v853.log_colors[l_state_1]:to_hex() .. "extension " .. "\194\187" .. " ", 
                    [5] = v1199 .. "`s", 
                    [7] = v1205, 
                    [9] = "\a" .. v853.log_colors[l_state_1]:to_hex() .. l_state_1, 
                    [10] = v1203 ~= "0" and " bt: " or "", 
                    [11] = v1203 ~= "0" and v1203 or "", 
                    [12] = v1201 ~= "100" and " hc: " or "", 
                    [13] = v1201 ~= "100" and v1201 or ""
                }, v853.log_colors[l_state_1]);
            end;
            local v1213 = ("Miss %s %s due to %s bt: %s hc: %s"):format(v1199, v1205, l_state_1, v1203, v1201);
            if v1196 then
                print_dev(v1213);
            end;
            return;
        end;
    end;
end;
v37.player_hurt_hitlogs = function(v1214)
    -- upvalues: l_get_local_player_0 (ref), v853 (ref), v117 (ref), v37 (ref), l_insert_0 (ref)
    local v1215 = entity.get(v1214.userid, true);
    if not v1215 or v1215 == l_get_local_player_0() then
        return;
    elseif entity.get(v1214.attacker, true) ~= l_get_local_player_0() then
        return;
    elseif not v1214.weapon:find("grenade") and v1214.weapon ~= "inferno" and v1214.weapon ~= "knife" then
        return;
    else
        v853.log_colors = {
            hit = v117.ui_tables.visuals.hitlog_theme_hit.value and ui.get_style("Link Active") or v117.ui_tables.visuals.hitlog_hit.value
        };
        local v1216 = v1215:get_name();
        local l_dmg_health_0 = v1214.dmg_health;
        local l_health_0 = v1214.health;
        local v1219 = v117.ui_tables.visuals.hitlog_vis_type.value_by_name[3];
        local v1220 = v117.ui_tables.visuals.hitlog_vis_type.value_by_name[2];
        if v1214.weapon:find("grenade") or v1214.weapon == "inferno" then
            v37.print_color_text({
                [1] = "", 
                [2] = nil, 
                [3] = "", 
                [2] = "\a" .. v853.log_colors.hit:to_hex() .. table.concat({
                    [1] = "extension ", 
                    [2] = "\194\187", 
                    [3] = " "
                }), 
                [4] = v1214.weapon:find("grenade") and "Naded  " or "Burned ", 
                [5] = v1216 .. "`s", 
                [6] = v1215.m_iHealth - l_dmg_health_0 > 0 and " for " or " ", 
                [7] = v1215.m_iHealth - l_dmg_health_0 > 0 and l_dmg_health_0 or " ", 
                [8] = v1215.m_iHealth - l_dmg_health_0 > 0 and " (" .. l_health_0 .. " hp remaining)" or " "
            }, v853.log_colors.hit);
            if v1219 then
                local v1221 = ("%s %s for %s (%s hp remaining) "):format(v1214.weapon:find("grenade") and "Naded" or "Burned", v1216, l_dmg_health_0, l_health_0);
                print_dev(v1221);
            end;
            if v1220 then
                local v1222 = nil;
                for v1223 = 1, #v37.logs_array do
                    local v1224 = v37.logs_array[v1223];
                    if v1224 then
                        local l_text_array_0 = v1224.text_array;
                        if (l_text_array_0[3] == "Burned " or l_text_array_0[3] == "Naded ") and l_text_array_0[4] == v1216 .. "`s" then
                            v1222 = v1223;
                            break;
                        end;
                    end;
                end;
                if not v1222 then
                    local v1226 = {
                        anim_value = 0.01, 
                        color = v853.log_colors.hit
                    };
                    local v1227 = {
                        [1] = "", 
                        [2] = nil, 
                        [3] = nil, 
                        [4] = nil, 
                        [5] = " for ", 
                        [6] = nil, 
                        [7] = " (", 
                        [8] = nil, 
                        [9] = " hp remaining)"
                    };
                    local v1228;
                    if v117.ui_tables.visuals.hitlog_extra.value_by_name.Icons then
                        v1228 = v1214.weapon:find("grenade") and "\238\147\156 " or "\239\129\173 ";
                    else
                        v1228 = "";
                    end;
                    v1227[2] = v1228;
                    v1227[3] = v1214.weapon:find("grenade") and "Naded " or "Burned ";
                    v1227[4] = v1216 .. "`s";
                    v1227[6] = l_dmg_health_0;
                    v1227[8] = l_health_0;
                    v1226.text_array = v1227;
                    v1226.curtime = globals.curtime;
                    l_insert_0(v37.logs_array, v1226);
                else
                    local v1229 = v37.logs_array[v1222].text_array[6];
                    v37.logs_array[v1222].text_array[3] = v1214.weapon:find("grenade") and "Naded " or "Burned ";
                    v37.logs_array[v1222].text_array[6] = v1229 + l_dmg_health_0;
                    v37.logs_array[v1222].text_array[8] = l_health_0;
                    v37.logs_array[v1222].curtime = globals.curtime;
                end;
            end;
            return;
        else
            v37.print_color_text({
                [1] = "", 
                [2] = nil, 
                [3] = "", 
                [4] = "Knifed ", 
                [2] = "\a" .. v853.log_colors.hit:to_hex() .. table.concat({
                    [1] = "extension ", 
                    [2] = "\194\187", 
                    [3] = " "
                }), 
                [5] = v1216 .. "`s", 
                [6] = v1215.m_iHealth - l_dmg_health_0 > 0 and " for " or " ", 
                [7] = v1215.m_iHealth - l_dmg_health_0 > 0 and l_dmg_health_0 or " ", 
                [8] = v1215.m_iHealth - l_dmg_health_0 > 0 and " (" .. l_health_0 .. " hp remaining)" or " "
            }, v853.log_colors.hit);
            if v1219 then
                local v1230 = ("Knifed %s for %s (%s hp remaining) "):format(v1216, l_dmg_health_0, l_health_0);
                print_dev(v1230);
            end;
            if v1220 then
                local v1231 = nil;
                for v1232 = 1, #v37.logs_array do
                    local v1233 = v37.logs_array[v1232];
                    if v1233 then
                        local l_text_array_1 = v1233.text_array;
                        if l_text_array_1[1] == "Knifed " and l_text_array_1[2] == v1216 then
                            v1231 = v1232;
                            break;
                        end;
                    end;
                end;
                if not v1231 then
                    local v1235 = {
                        anim_value = 0.01, 
                        color = v853.log_colors.hit, 
                        text_array = {
                            [1] = "Knifed ", 
                            [2] = nil, 
                            [3] = " for ", 
                            [4] = nil, 
                            [5] = " (", 
                            [6] = nil, 
                            [7] = " hp remaining)", 
                            [2] = v1216, 
                            [4] = l_dmg_health_0, 
                            [6] = l_health_0
                        }, 
                        curtime = globals.curtime
                    };
                    l_insert_0(v37.logs_array, v1235);
                else
                    local v1236 = v37.logs_array[v1231].text_array[4];
                    v37.logs_array[v1231].text_array[4] = v1236 + l_dmg_health_0;
                    v37.logs_array[v1231].text_array[6] = l_health_0;
                    v37.logs_array[v1231].curtime = globals.curtime;
                end;
            end;
            return;
        end;
    end;
end;
v37.render_gradient_log = function(v1237, v1238, v1239, v1240)
    -- upvalues: l_measure_text_0 (ref), v117 (ref), l_shadow_0 (ref), l_text_0 (ref)
    local v1241 = l_measure_text_0(1, "", table.concat(v1238));
    local v1242 = vector((v1241.x / 1.95 + 20) * v1240, v1241.y + 2 + 20);
    render.push_clip_rect(v1237 - v1242, v1237 + v1242, false);
    v1241.y = 0;
    v1237 = v1237 - v1241 / 2;
    local v1243 = 0;
    if v117.ui_tables.visuals.hitlog_extra.value_by_name.Glow then
        local v1244 = vector(0, 0);
        for v1245 = 1, #v1238 do
            local v1246 = l_measure_text_0(1, "", v1238[v1245]);
            v1246.y = 0;
            v1244 = v1244 + v1246;
        end;
        l_shadow_0(v1237 + vector(0, 7), v1237 + v1244 + vector(-3, 7), v1239, 30);
    end;
    for v1247 = 1, #v1238 do
        local v1248 = v1247 % 2 == 0 and v1239 or color(255, v1239.a);
        local v1249 = l_measure_text_0(1, "", v1238[v1247]);
        v1249.y = 0;
        l_text_0(1, v1237 + v1243, v1248, "", v1238[v1247]);
        v1243 = v1243 + v1249;
    end;
    render.pop_clip_rect();
end;
v37.logs_menu_cache = 0;
drag_system.add_drag("logs", vector(-190, 0), vector(399, 90), vector(v37.screen_size.x / 2, v37.screen_size.y / 1.5), true, function()
    -- upvalues: v117 (ref)
    return v117.ui_tables.visuals.hitlog_switch.value and v117.ui_tables.visuals.hitlog_vis_type.value_by_name[2] and ui.get_alpha() > 0;
end);
v37.logs_render = function()
    -- upvalues: v117 (ref), v853 (ref), v37 (ref), v0 (ref), l_abs_0 (ref), l_clamp_0 (ref)
    if not v117.ui_tables.visuals.hitlog_vis_type.value_by_name[2] then
        return;
    else
        if v117.ui_tables.visuals.hitlog_color_mode.value == 1 then
            v853.log_colors = {
                hit = v117.ui_tables.visuals.hitlog_theme_hit.value and (v117.ui_tables.visuals.color_use_theme.value and ui.get_style("Link Active") or v117.ui_tables.visuals.main_color.value) or v117.ui_tables.visuals.hitlog_hit.value, 
                ["lagcomp failure"] = v117.ui_tables.visuals.hitlog_miss.value, 
                ["prediction error"] = v117.ui_tables.visuals.hitlog_miss.value, 
                ["jitter resolver"] = v117.ui_tables.visuals.hitlog_miss.value, 
                resolver = v117.ui_tables.visuals.hitlog_miss.value, 
                spread = v117.ui_tables.visuals.hitlog_miss.value, 
                ["unregistered shot"] = v117.ui_tables.visuals.hitlog_miss.value, 
                ["player death"] = v117.ui_tables.visuals.hitlog_miss.value, 
                death = v117.ui_tables.visuals.hitlog_miss.value, 
                dormancy = v117.ui_tables.visuals.hitlog_miss.value, 
                error = v117.ui_tables.visuals.hitlog_miss.value, 
                ["damage rejection"] = v117.ui_tables.visuals.hitlog_miss.value, 
                ["backtrack failure"] = v117.ui_tables.visuals.hitlog_miss.value
            };
        else
            v853.log_colors = {
                hit = v117.ui_tables.visuals.hitlog_theme_hit.value and (v117.ui_tables.visuals.color_use_theme.value and ui.get_style("Link Active") or v117.ui_tables.visuals.main_color.value) or v117.ui_tables.visuals.hitlog_hit.value, 
                ["lagcomp failure"] = v117.ui_tables.visuals.hitlog_pred.value, 
                ["prediction error"] = v117.ui_tables.visuals.hitlog_pred.value, 
                ["jitter resolver"] = v117.ui_tables.visuals.hitlog_resolver.value, 
                resolver = v117.ui_tables.visuals.hitlog_resolver.value, 
                spread = v117.ui_tables.visuals.hitlog_spread.value, 
                ["unregistered shot"] = v117.ui_tables.visuals.hitlog_death.value, 
                ["player death"] = v117.ui_tables.visuals.hitlog_death.value, 
                death = v117.ui_tables.visuals.hitlog_death.value, 
                dormancy = v117.ui_tables.visuals.hitlog_resolver.value, 
                error = v117.ui_tables.visuals.hitlog_resolver.value, 
                ["damage rejection"] = v117.ui_tables.visuals.hitlog_death.value, 
                ["backtrack failure"] = v117.ui_tables.visuals.hitlog_resolver.value
            };
        end;
        local v1250 = 0;
        local v1251 = ui.get_alpha();
        local v1252 = vector(v37.screen_size.x / 2, v0.drag_memory.logs_y);
        if v1251 > 0 then
            render.rect_outline(v1252 + vector(-190, 0), v1252 + vector(190, 90), color(200, 150 * v1251), 1, 5);
            local v1253 = {
                [1] = "", 
                [2] = nil, 
                [3] = "Hit ", 
                [4] = "Misnik", 
                [5] = " in the ", 
                [6] = "head(chest)", 
                [7] = " for ", 
                [8] = "134(100)", 
                [9] = " (", 
                [10] = "0", 
                [11] = " hp remaining)", 
                [2] = v117.ui_tables.visuals.hitlog_extra.value_by_name.Icons and "\239\129\155 " or ""
            };
            v37.render_gradient_log(v1252 + vector(0, v1250), v1253, v853.log_colors.hit, v1251);
            v1250 = v1250 + 12 * v1251;
            v1253 = {
                [1] = "", 
                [2] = nil, 
                [3] = "Missed ", 
                [4] = "Misnik`s", 
                [5] = " in the ", 
                [6] = "stomach", 
                [7] = " due to ", 
                [8] = "resolver", 
                [2] = v117.ui_tables.visuals.hitlog_extra.value_by_name.Icons and "\238\137\140 " or ""
            };
            v37.render_gradient_log(v1252 + vector(0, v1250), v1253, v853.log_colors.resolver, v1251);
            v1250 = v1250 + 12 * v1251;
            v1253[6] = "right leg";
            v1253[8] = "spread";
            v37.render_gradient_log(v1252 + vector(0, v1250), v1253, v853.log_colors.spread, v1251);
            v1250 = v1250 + 12 * v1251;
            v1253[8] = "death";
            v1253[6] = "neck";
            v37.render_gradient_log(v1252 + vector(0, v1250), v1253, v853.log_colors.death, v1251);
            v1250 = v1250 + 12 * v1251;
        end;
        local v1254 = v117.ui_tables.visuals.hitlog_duration.value / 10;
        for v1255 = #v37.logs_array, 0, -1 do
            local v1256 = v37.logs_array[v1255];
            if v1256 then
                if v1256.anim_value == 0 then
                    table.remove(v37.logs_array, v1255);
                else
                    if v1254 < l_abs_0(v1256.curtime - globals.curtime) then
                        v1256.anim_value = l_clamp_0(v1256.anim_value - v37.animation_value * 0.8, 0, 0.9);
                    else
                        v1256.anim_value = l_clamp_0(v1256.anim_value + v37.animation_value * 0.8, 0, 0.9);
                    end;
                    local v1257 = v37.easings.in_out_quart(v1256.anim_value);
                    local v1258 = color(v1256.color.r, v1256.color.g, v1256.color.b, v1256.color.a);
                    v37.render_gradient_log(v1252 + vector(0, v1250), v1256.text_array, v1258, v1257);
                    v1250 = v1250 + 12 * v1257;
                end;
            end;
        end;
        return;
    end;
end;
v117.ui_tables.visuals.hitlog_vis_type:set_callback(function()
    -- upvalues: v117 (ref)
    local l_value_by_name_4 = v117.ui_tables.visuals.hitlog_vis_type.value_by_name;
    local v1260 = ui.find("Miscellaneous", "Main", "Other", "Log Events");
    if l_value_by_name_4[1] then
        if v1260:get(2) then
            ui.find("Miscellaneous", "Main", "Other", "Log Events"):override({
                [1] = "Purchases"
            });
        else
            ui.find("Miscellaneous", "Main", "Other", "Log Events"):override({});
        end;
    else
        ui.find("Miscellaneous", "Main", "Other", "Log Events"):override();
    end;
end, true);
v117.ui_tables.visuals.hitlog_switch:set_callback(function()
    -- upvalues: v117 (ref), v37 (ref)
    local l_value_by_name_5 = v117.ui_tables.visuals.hitlog_vis_type.value_by_name;
    local v1262 = ui.find("Miscellaneous", "Main", "Other", "Log Events");
    if v117.ui_tables.visuals.hitlog_switch.value then
        events.aim_ack:set(v37.register_hitlog);
        events.player_hurt:set(v37.player_hurt_hitlogs);
        events.render:set(v37.logs_render);
    else
        events.aim_ack:unset(v37.register_hitlog);
        events.player_hurt:unset(v37.player_hurt_hitlogs);
        events.render:unset(v37.logs_render);
    end;
    if l_value_by_name_5[1] and v117.ui_tables.visuals.hitlog_switch.value then
        if v1262:get(2) then
            ui.find("Miscellaneous", "Main", "Other", "Log Events"):override({
                [1] = "Purchases"
            });
        else
            ui.find("Miscellaneous", "Main", "Other", "Log Events"):override({});
        end;
    else
        ui.find("Miscellaneous", "Main", "Other", "Log Events"):override();
    end;
end, true);
events.shutdown:set(function()
    ui.find("Miscellaneous", "Main", "Other", "Log Events"):override();
end);
v37.ind_names = {
    ["Peek Assist"] = "PA", 
    ["Hide Shots"] = "HS", 
    ["Double Tap"] = "DT", 
    ["Fake Duck"] = "FD"
};
v37.auto_peek = true;
v37.render_ind = function(v1263, v1264, v1265, v1266)
    -- upvalues: v37 (ref)
    local l_v1263_0 = v1263;
    if type(v1263) == "boolean" then
        l_v1263_0 = v37.ind_names[ref_name];
        v1265 = v1263;
    end;
    if type(v1263) ~= "string" then
        ref_name = v1263:name();
        l_v1263_0 = v37.ind_names[ref_name];
        v1265 = v1263:get();
    end;
    local v1268 = v37.easings.out_quart(v37.calculate_value(l_v1263_0, v1265, 1.5, 0, 0.9));
    v1264 = v1264 + vector(0, 8 * v1268);
    local l_nade_alpha_0 = v37.anim_values.nade_alpha;
    local v1270 = 1;
    if l_v1263_0 == "DT" then
        local v1271 = rage.exploit:get();
        local v1272 = 255 * v1268 * v1266 * (l_nade_alpha_0 ~= 1 and v1271 == 1 and 0 or l_nade_alpha_0 ~= 1 and v1271 == 0 and l_nade_alpha_0 or 1);
        render.text(2, v1264, color(255, 0, 0, v1272), "c", l_v1263_0);
        local v1273 = render.measure_text(2, nil, l_v1263_0);
        local v1274 = vector(v1264.x - v1273.x / 2, v1264.y - v1273.y / 2);
        render.push_clip_rect(v1274, v1274 + vector(v1273.x * v1271, v1273.y), true);
    end;
    local v1275 = 255 * v1268 * v1266 * l_nade_alpha_0;
    local v1276 = color(255, v1275);
    if l_v1263_0 == "PA" then
        v1270 = v37.easings.out_quart(v37.calculate_value("autopeek", v37.auto_peek, 1, 0, 1));
        local v1277, v1278 = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist", "Style");
        ref2 = v1278;
        ref1 = v1277;
        ref_color = ref2:get();
        ref_color.a = v1275;
        v1276 = v37.calculate_color(ref_color, color(255, 0, 0, v1275), v1270);
    end;
    render.text(2, v1264, v1276, "c", l_v1263_0);
    if l_v1263_0 == "DT" then
        render.pop_clip_rect();
    end;
    return v1264;
end;
v37.render_keybinds_for_indicator = function(v1279, v1280)
    -- upvalues: v37 (ref), v43 (ref)
    v1279 = v37.render_ind(v43.double_tap, v1279, nil, v1280);
    v1279 = v37.render_ind(v43.hide_shots, v1279, nil, v1280);
    v1279 = v37.render_ind(v43.fakeduck, v1279, nil, v1280);
    local v1281 = ui.get_binds();
    local v1282 = false;
    for v1283 = 1, #v1281 do
        if v1281[v1283].name == "Body Aim" then
            v1282 = v1281[v1283].active and v1281[v1283].value == "Force";
            break;
        end;
    end;
    v1279 = v37.render_ind("BODY", v1279, v1282, v1280);
    local v1284 = false;
    for v1285 = 1, #v1281 do
        if v1281[v1285].name == "Safe Points" then
            v1284 = v1281[v1285].active and v1281[v1285].value == "Force";
            break;
        end;
    end;
    v1279 = v37.render_ind(v43.auto_peek, v1279, nil, v1280);
    local v1286 = false;
    for v1287 = 1, #v1281 do
        if v1281[v1287].name == "Min. Damage" then
            v1286 = v1281[v1287].active;
            break;
        end;
    end;
    v1279 = v37.render_ind("DMG", v1279, v1286, v1280);
    local v1288 = false;
    for v1289 = 1, #v1281 do
        if v1281[v1289].name == "Fake Latency" then
            v1288 = v1281[v1289].active;
            break;
        end;
    end;
    v1279 = v37.render_ind("PING", v1279, v1288, v1280);
end;
v37.render_gradient_indicator = function(v1290, v1291, v1292, v1293, v1294, v1295)
    -- upvalues: l_measure_text_0 (ref), v117 (ref), v37 (ref), l_shadow_0 (ref), l_text_0 (ref)
    local v1296 = l_measure_text_0(v1290, nil, v1291) / 2;
    v1296.y = 0;
    local v1297 = -v1296;
    v1297.x = v1297.x - 1;
    local v1298 = #v1292;
    local l_value_30 = v117.ui_tables.visuals.indicator_glow.value;
    local l_value_31 = v117.ui_tables.visuals.glow_thick.value;
    local l_value_32 = v117.ui_tables.visuals.glow_alpha.value;
    local v1302 = v37.calculate_value("inddrag", drag_system.active_element == "inddrag", -1.3, 0.7, 1);
    for v1303 = 1, #v1291 do
        local v1304 = v1292[v1303];
        if not v1304 then
            v1298 = v1298 - 1;
            if v1298 < 1 then
                v1298 = #v1292;
            end;
            v1304 = v1292[v1298];
        end;
        local v1305 = string.sub(v1291, v1303, v1303);
        local v1306 = l_measure_text_0(v1290, nil, v1305);
        local v1307 = v1295 and v1294 * v1295 or v37.global_alpha * v1294;
        local v1308 = v37.anim_values.nade_alpha and v37.anim_values.nade_alpha or 1;
        v1307 = v1307 * v1302 * v1308;
        if l_value_30 then
            local v1309 = color(v1304.r, v1304.g, v1304.b, v1304.a * l_value_32 / 100 * v1307);
            l_shadow_0(v1293 + v1297 + vector(0, v1306.y / 2 + 1), v1293 + v1297 + v1306 / 1.25, v1309, l_value_31);
        end;
        local v1310 = color(v1304.r, v1304.g, v1304.b, v1304.a * v1307);
        l_text_0(v1290, v1293 + v1297, v1310, nil, v1305);
        v1297 = v1297 + vector(v1306.x, 0);
    end;
end;
v37.logo_font = render.load_font("Verdana", vector(11, 11, 0.7), "abd");
drag_system.add_drag("inddrag", vector(-30, 20), vector(60, 15), v37.screen_size / 2, true, function()
    -- upvalues: v117 (ref)
    return v117.ui_tables.visuals.indicator_switch.value and ui.get_alpha() > 0;
end);
v37.anim_values.nade_alpha = 1;
v37.indicators_func = function()
    -- upvalues: v117 (ref), v37 (ref), v0 (ref), l_get_local_player_0 (ref)
    if not v117.ui_tables.visuals.indicator_switch.value then
        return;
    else
        local v1311 = {};
        local v1312 = vector(v37.screen_size.x / 2, v0.drag_memory.inddrag_y);
        local v1313 = nil;
        local v1314 = nil;
        local v1315 = nil;
        if v117.ui_tables.visuals.color_use_theme.value then
            local v1316 = {
                ui.get_style("Link Active"):to_hsv()
            };
            v1313 = color(255):as_hsv(v1316[1], 0.51, 1);
            v1314 = color(255):as_hsv(v1316[1], 0.43, 1);
            v1315 = v1314;
        else
            v1313 = v117.ui_tables.visuals.main_color.value;
            v1314 = v117.ui_tables.visuals.second_color.value;
            v1315 = v1314;
        end;
        local v1317 = globals.curtime * 6 % 23 - 2;
        for v1318 = 1, 9 do
            local v1319 = v1318 < v1317 and v1317 - v1318 or v1318 - v1317;
            if v1318 < v1317 then
                if v1319 <= 5 then
                    v1311[v1318] = v1314;
                elseif v1319 <= 8 then
                    v1319 = (v1319 - 5) / 3;
                    v1311[v1318] = v37.calculate_color(v1315, v1314, v1319);
                else
                    v1319 = (v1319 - 8) / 4;
                    v1311[v1318] = v37.calculate_color(v1313, v1315, v1319);
                end;
            else
                v1319 = v1319 / 3;
                v1311[v1318] = v37.calculate_color(v1313, v1314, v1319);
            end;
        end;
        if ui.get_alpha() ~= 0 and v37.global_alpha == 0 then
            v37.render_gradient_indicator(v37.logo_font, "extension", v1311, v1312 + vector(0, 20), 1, ui.get_alpha());
        end;
        if v37.global_alpha == 0 then
            return;
        else
            local v1320 = 0;
            local _ = 0;
            local v1322 = l_get_local_player_0();
            if v1322 then
                local l_m_bIsScoped_0 = v1322.m_bIsScoped;
                v37.calculate_value("scope_ind", v1322 and v1322:is_alive() and l_m_bIsScoped_0, 0.7);
            end;
            v1320 = v37.easings.in_out_quart(v37.anim_values.scope_ind, 1, 0, 0.99);
            local v1324 = nil;
            if v1322 then
                v1324 = v1322:get_player_weapon();
            end;
            local l_calculate_value_0 = v37.calculate_value;
            local v1326 = "nade_alpha";
            local v1327;
            if v1324 then
                v1327 = v1324.get_weapon_info(v1324).weapon_type ~= 9;
            else
                v1327 = v1324;
            end;
            l_calculate_value_0(v1326, v1327, 0.5, 0.5, 1);
            if v1320 < 0.99 then
                l_calculate_value_0 = v1312 + vector(-50, 0);
                v1326 = l_calculate_value_0 + vector(100 * (1 - v1320), 80);
                render.push_clip_rect(l_calculate_value_0, v1326);
                v37.render_keybinds_for_indicator(v1312 + vector(10 * v1320, 29), 1 - v1320);
                v37.render_gradient_indicator(v37.logo_font, "extension", v1311, v1312 + vector(10 * v1320, 20), 1 - v1320);
                render.pop_clip_rect();
            end;
            if v1320 ~= 0 then
                l_calculate_value_0 = v1312 + vector(100, 0) + vector(-100 * v1320, 0);
                v1326 = v1312 + vector(100, 80);
                render.push_clip_rect(l_calculate_value_0, v1326);
                v37.render_keybinds_for_indicator(v1312 + vector(40 * v1320, 29), v1320);
                v37.render_gradient_indicator(v37.logo_font, "extension", v1311, v1312 + vector(40 * v1320, 20), v1320);
                render.pop_clip_rect();
            end;
            return;
        end;
    end;
end;
events.render:set(v37.indicators_func);
v37.lc_tickbase = 999999;
v37.lc_timer = 0;
v37.defensive_for_ind = function()
    -- upvalues: v117 (ref), l_get_local_player_0 (ref), v37 (ref)
    if not v117.ui_tables.visuals.indicator_switch.value then
        return;
    else
        local v1328 = l_get_local_player_0();
        if not v1328 or rage.exploit:get() ~= 1 then
            return;
        else
            local l_m_nTickBase_1 = v1328.m_nTickBase;
            if l_m_nTickBase_1 - 3 > v37.lc_tickbase then
                v37.lc_timer = globals.tickcount + (cvar.sv_maxusrcmdprocessticks:int() - 1);
            end;
            v37.lc_tickbase = l_m_nTickBase_1;
            v37.lc_timer = v37.lc_timer - globals.tickcount > cvar.sv_maxusrcmdprocessticks:int() + 1 and 0 or v37.lc_timer;
            return;
        end;
    end;
end;
drag_system.add_drag("dmgdrag", vector(1, 3), vector(10, 10), vector(v37.screen_size.x / 1.98, v37.screen_size.y / 2.05), false, function()
    -- upvalues: v117 (ref)
    return v117.ui_tables.visuals.damage_switch.value and ui.get_alpha() > 0;
end);
v37.dmg_font = render.load_font("Verdana", 10, "ad");
v37.render_dmg_indicator = function()
    -- upvalues: v0 (ref), l_get_local_player_0 (ref), v37 (ref), v43 (ref), v117 (ref), l_clamp_0 (ref), l_text_0 (ref)
    local v1330 = vector(v0.drag_memory.dmgdrag_x, v0.drag_memory.dmgdrag_y);
    local v1331 = l_get_local_player_0();
    local v1332 = 101;
    local v1333 = 1;
    local v1334 = v37.calculate_value("dmg_drag", drag_system.active_element == "dmgdrag", -1.5, 0.7, 1);
    if v1331 then
        local v1335 = v1331:get_player_weapon();
        if v1335 then
            v1333 = v1335:get_weapon_info().weapon_type;
            v1332 = v43.dmg:get();
        end;
    end;
    v1333 = v1333 ~= 0 and v1333 ~= 9 and v1333 ~= 7 and v1333 ~= 11;
    if not v37.anim_values.dmg_a then
        v37.anim_values.dmg_a = 0;
        v37.anim_values.dmg = 0;
    end;
    local l_dmg_a_0 = v37.anim_values.dmg_a;
    local v1337 = v37.animation_value * 2;
    local v1338 = false;
    local v1339 = ui.get_binds();
    for v1340 = 1, #v1339 do
        if v1339[v1340].name == "Min. Damage" then
            v1338 = v1339[v1340].active;
            break;
        end;
    end;
    local l_value_33 = v117.ui_tables.visuals.damage_is_active.value;
    v37.anim_values.dmg_a = not (not v1333 or not v1338 and l_value_33) and l_clamp_0(l_dmg_a_0 + v1337, 0, 1) or l_clamp_0(l_dmg_a_0 - v1337, 0, 1);
    l_dmg_a_0 = l_clamp_0(l_dmg_a_0 * v37.global_alpha + ui.get_alpha(), 0, 1) * v1334;
    if v1332 == 0 then
        v1332 = "auto";
    elseif v1332 > 100 then
        local v1342 = "hp+" .. v1332 - 100;
        if v1342 then
            v1332 = v1342;
        end;
    end;
    if v1333 and (v1338 or not l_value_33) then
        v37.anim_values.dmg = v1332;
    end;
    local v1343 = v117.ui_tables.visuals.damage_font.value == 1 and 2 or v37.dmg_font;
    l_text_0(v1343, v1330, color(255, 255 * l_dmg_a_0), nil, string.upper(v37.anim_values.dmg));
end;
v117.ui_tables.visuals.damage_switch:set_callback(function()
    -- upvalues: v117 (ref), v37 (ref)
    if v117.ui_tables.visuals.damage_switch.value then
        events.render:set(v37.render_dmg_indicator);
    else
        events.render:unset(v37.render_dmg_indicator);
    end;
end, true);
v37.is_scoped = false;
v37.render_manual_arrows = function()
    -- upvalues: v37 (ref), l_get_local_player_0 (ref), v117 (ref), l_floor_0 (ref), v737 (ref), l_poly_0 (ref)
    if v37.global_alpha == 0 then
        return;
    else
        local l_screen_size_1 = v37.screen_size;
        local v1345 = l_get_local_player_0();
        local v1346 = false;
        if v1345 then
            v1346 = v1345.m_bIsScoped;
        end;
        local v1347 = v37.calculate_value("manual_scope", not v1346, 1, 0.6, 1) * v37.global_alpha;
        local v1348 = nil;
        local v1349 = nil;
        if v117.ui_tables.visuals.color_use_theme.value then
            local v1350 = ui.get_style("Link Active");
            v1348 = v1350:clone();
            v1348.a = v1348.a * v1347 * v37.anim_values.nade_alpha;
            v1349 = v1350:clone();
            v1349.a = v1349.a * v1347 * v37.anim_values.nade_alpha;
        else
            v1348 = v117.ui_tables.visuals.second_color.value:clone();
            v1348.a = v1348.a * v1347 * v37.anim_values.nade_alpha;
            v1349 = v117.ui_tables.visuals.main_color.value:clone();
            v1349.a = v1349.a * v1347 * v37.anim_values.nade_alpha;
        end;
        local v1351 = color(50, 130 * v1347 * v37.anim_values.nade_alpha);
        local v1352 = l_floor_0(l_screen_size_1.x / 2);
        local v1353 = l_floor_0(l_screen_size_1.y / 2) + 1;
        local v1354 = 40;
        local v1355 = vector(v1352 - v1354 + 2, v1353 - 9);
        local v1356 = vector(v1352 - v1354 + 4, v1353 + 9);
        select_color = v37.calculate_color(v1349, v1351, v37.calculate_value("desync_left", v737.desync_side, 100));
        render.rect(v1355, v1356, select_color);
        v1355 = vector(v1352 - v1354, v1353 + 9);
        v1356 = vector(v1352 - v1354, v1353 - 9);
        local v1357 = vector(v1352 - v1354 - 15, v1353);
        select_color = v37.calculate_color(v1348, v1351, v37.calculate_value("manual_left", v737.manual_state == 1, 1.7));
        l_poly_0(select_color, v1355, v1356, v1357);
        local v1358 = vector(v1352 + v1354 - 4, v1353 - 9);
        local v1359 = vector(v1352 + v1354 - 2, v1353 + 9);
        select_color = v37.calculate_color(v1349, v1351, v37.calculate_value("desync_right", not v737.desync_side, 100));
        render.rect(v1358, v1359, select_color);
        v1358 = vector(v1352 + v1354, v1353 + 9);
        v1359 = vector(v1352 + v1354, v1353 - 9);
        v1357 = vector(v1352 + v1354 + 15, v1353);
        select_color = v37.calculate_color(v1348, v1351, v37.calculate_value("manual_right", v737.manual_state == 2, 1.7));
        l_poly_0(select_color, v1358, v1359, v1357);
        return;
    end;
end;
v117.ui_tables.visuals.manual_switch:set_callback(function()
    -- upvalues: v117 (ref), v37 (ref)
    if v117.ui_tables.visuals.manual_switch.value then
        events.render:set(v37.render_manual_arrows);
    else
        events.render:unset(v37.render_manual_arrows);
    end;
end, true);
v37.scope_value = 0;
v37.scope_lines = function()
    -- upvalues: l_get_local_player_0 (ref), v37 (ref), v117 (ref), l_gradient_0 (ref)
    local v1360 = l_get_local_player_0();
    local v1361 = v1360 and v1360.m_bIsScoped;
    v37.is_scoped = v1361;
    v37.scope_value = v37.calculate_value("scope", v1360 and v1360:is_alive() and v1361);
    local v1362 = v37.easings.in_out_quart(v37.scope_value);
    if v1362 == 0 then
        return;
    else
        local l_screen_size_2 = v37.screen_size;
        local l_value_34 = v117.ui_tables.visuals.scope_size.value;
        local v1365 = v117.ui_tables.visuals.scope_gap.value - 1;
        local v1366 = nil;
        local v1367 = nil;
        local l_value_35 = v117.ui_tables.visuals.scope_color.value;
        if l_value_35 == "Gradient" then
            local v1369 = v117.ui_tables.visuals.scope_color.ref:get(l_value_35);
            v1366 = v1369[1];
            v1367 = v1369[2];
        else
            v1366 = v117.ui_tables.visuals.scope_color.ref:get(l_value_35)[1];
            v1367 = v1366:clone();
            v1367.a = 0;
        end;
        local v1370 = color(v1366.r, v1366.g, v1366.b, v1366.a * v37.global_alpha * v1362);
        local v1371 = color(v1367.r, v1367.g, v1367.b, v1367.a * v37.global_alpha * v1362);
        local l_v1370_0 = v1370;
        local l_v1371_0 = v1371;
        local v1374 = l_value_34 - l_value_34 * v1362;
        local l_scope_type_0 = v117.ui_tables.visuals.scope_type;
        if l_scope_type_0.value_by_name.Reversed then
            local l_v1370_1 = v1370;
            v1370 = v1371;
            l_v1370_0 = v1371;
            v1371 = l_v1370_1;
            l_v1371_0 = l_v1370_1;
        end;
        local v1377 = vector(l_screen_size_2.x / 2 + v1365 + 1 + v1374, l_screen_size_2.y / 2);
        local v1378 = vector(l_screen_size_2.x / 2 + v1365 + l_value_34, l_screen_size_2.y / 2 + 1);
        l_gradient_0(v1377, v1378, v1370, v1371, l_v1370_0, l_v1371_0);
        v1377 = vector(l_screen_size_2.x / 2 - v1365 - v1374, l_screen_size_2.y / 2);
        v1378 = vector(l_screen_size_2.x / 2 - v1365 - l_value_34, l_screen_size_2.y / 2 + 1);
        l_gradient_0(v1377, v1378, v1370, v1371, l_v1370_0, l_v1371_0);
        if not l_scope_type_0.value_by_name["T Style"] then
            v1377 = vector(l_screen_size_2.x / 2, l_screen_size_2.y / 2 - v1365 - v1374);
            v1378 = vector(l_screen_size_2.x / 2 + 1, l_screen_size_2.y / 2 - v1365 - l_value_34);
            l_gradient_0(v1377, v1378, v1370, l_v1370_0, v1371, l_v1371_0);
        end;
        v1377 = vector(l_screen_size_2.x / 2, l_screen_size_2.y / 2 + v1365 + 1 + v1374);
        v1378 = vector(l_screen_size_2.x / 2 + 1, l_screen_size_2.y / 2 + v1365 + l_value_34);
        l_gradient_0(v1377, v1378, v1370, l_v1370_0, v1371, l_v1371_0);
        return;
    end;
end;
v117.ui_tables.visuals.scope_switch:set_callback(function()
    -- upvalues: v117 (ref), v37 (ref)
    ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay"):override(v117.ui_tables.visuals.scope_switch.value and "Remove All" or nil, true);
    if v117.ui_tables.visuals.scope_switch.value then
        events.render:set(v37.scope_lines);
    else
        events.render:unset(v37.scope_lines);
    end;
    v37.anim_values.scope = 0;
    v37.is_scoped = false;
end, true);
events.shutdown:set(function()
    -- upvalues: v117 (ref)
    if v117.ui_tables.visuals.scope_switch.value then
        ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay"):override();
    end;
end);
v37.orig_func = nil;
v37.backward = false;
v37.static = false;
v37.lean = false;
v37.last_update = 0;
v37.gym_value = 0.65;
v37.reverse = true;
v37.height = 64;
v37.height_animation = 0;
v37.animation_value = 0;
v37.breaker_function = function(v1379)
    -- upvalues: v63 (ref), l_cast_0 (ref), v37 (ref), v117 (ref), l_clamp_0 (ref)
    local l_ref_9 = v63.ref;
    local l_velocity_3 = v63.velocity;
    local l_on_ground_3 = v63.on_ground;
    if v1379 ~= l_ref_9 then
        return;
    else
        local v1383 = l_cast_0("CAnimationLayer_t**", l_cast_0("uintptr_t", v1379[0]) + 10640)[0];
        if v37.backward then
            l_ref_9.m_flPoseParameter[0] = -180;
        end;
        if v37.moon then
            l_ref_9.m_flPoseParameter[7] = 180;
        end;
        if v37.static then
            l_ref_9.m_flPoseParameter[6] = 1;
        end;
        if v37.air_walk and not l_on_ground_3 then
            v1383[6].m_flWeight = 1;
        end;
        if v37.lean and v117.ui_tables.visuals.breaker_lean_value.value ~= -1 then
            v1383[12].m_flWeight = l_velocity_3 > 20 and v117.ui_tables.visuals.breaker_lean_value.value / 10 or 0;
        end;
        if v117.ui_tables.visuals.anim_switch.value and v117.ui_tables.visuals.anim_gym.value then
            if not v37.lean then
                v1383[12].m_flWeight = 0;
            end;
            if entity.get_game_rules().m_fRoundStartTime - 0.7 > globals.curtime then
                v1383[11].m_flCycle = v37.gym_value;
                v1383[11].m_nSequence = 232;
                v1383[12].m_flWeight = 0;
            end;
            if v37.last_update ~= globals.tickcount then
                if v37.reverse then
                    v37.gym_value = l_clamp_0(v37.gym_value + 0.005, 0.648, 0.75);
                elseif v37.reverse ~= nil then
                    v37.gym_value = l_clamp_0(v37.gym_value - 0.005, 0.648, 0.75);
                else
                    v37.gym_value = l_clamp_0(v37.gym_value + 0.01, 0, 0.648);
                end;
                if v37.gym_value >= 0.75 then
                    v37.reverse = false;
                end;
                if v37.gym_value <= 0.649 and v37.gym_value > 0.64 then
                    v37.reverse = true;
                end;
                if v37.gym_value < 0.64 then
                    v37.reverse = nil;
                end;
            end;
            v37.last_update = globals.tickcount;
        end;
        return;
    end;
end;
events.round_start:set(function()
    -- upvalues: v37 (ref)
    v37.reverse = nil;
    v37.gym_value = 0;
end);
v117.ui_tables.visuals.breaker_switch:set_callback(function()
    -- upvalues: v117 (ref), v37 (ref)
    if v117.ui_tables.visuals.breaker_switch.value then
        events.post_update_clientside_animation:set(v37.breaker_function);
    else
        events.post_update_clientside_animation:unset(v37.breaker_function);
    end;
end, true);
v117.ui_tables.visuals.breaker_list:set_callback(function()
    -- upvalues: v117 (ref), v37 (ref), v43 (ref)
    local l_value_by_name_6 = v117.ui_tables.visuals.breaker_list.value_by_name;
    local v1385 = nil;
    if l_value_by_name_6[1] then
        v37.backward = true;
        v1385 = "Sliding";
    else
        v37.backward = false;
    end;
    if l_value_by_name_6[2] then
        v1385 = "Walking";
    end;
    v43.legs_movement:override(v1385, true);
    v37.moon = l_value_by_name_6[2];
    v37.air_walk = l_value_by_name_6[3];
    v37.static = l_value_by_name_6[4];
    v37.lean = l_value_by_name_6[5];
end, true);
events.createmove:set(function(v1386)
    -- upvalues: v37 (ref)
    if v37.lean then
        v1386.animate_move_lean = true;
    end;
end);
events.shutdown:set(function()
    -- upvalues: v43 (ref)
    v43.legs_movement:override();
end);
v37.transperancy_weapon = nil;
v37.need_scope_transperancy = false;
v37.transperancy_func = function(_)
    -- upvalues: v45 (ref), v63 (ref), v37 (ref), v117 (ref), v43 (ref), l_floor_0 (ref)
    local v1388 = v45.chams_material.value == "Material";
    local l_ref_10 = v63.ref;
    if not l_ref_10 then
        return;
    else
        local v1390 = l_ref_10:get_player_weapon();
        if not v1390 then
            return;
        else
            local v1391 = v1390:get_index();
            local v1392 = v1390.m_flNextPrimaryAttack - globals.curtime;
            if v1390 and v1392 <= -0.5 then
                v37.need_scope_transperancy = false;
            end;
            if l_ref_10.m_bIsScoped or v37.need_scope_transperancy then
                if v117.ui_tables.visuals.transparency_keep.value and v1390 and v37.transperancy_weapon == v1391 then
                    if l_ref_10.m_bIsScoped then
                        v37.need_scope_transperancy = true;
                    end;
                else
                    v37.need_scope_transperancy = false;
                end;
                v37.transperancy_weapon = v1391;
                if v1388 then
                    local l_value_36 = v45.chams_color.value;
                    v43.chams_color:override(color(l_value_36.r, l_value_36.g, l_value_36.b, math.floor(v117.ui_tables.visuals.transparency_scope.value * 2.55)));
                end;
                return l_floor_0(255 * v117.ui_tables.visuals.transparency_scope.value / 100);
            else
                if v1388 then
                    v43.chams_color:override();
                end;
                if not common.is_in_thirdperson() then
                    return;
                elseif v1390 and v1390:get_weapon_info().weapon_type == 9 then
                    if v1388 then
                        local l_value_37 = v45.chams_color.value;
                        v43.chams_color:override(color(l_value_37.r, l_value_37.g, l_value_37.b, l_floor_0(v117.ui_tables.visuals.transparency_nade.value * 2.55)));
                    end;
                    return l_floor_0(255 * v117.ui_tables.visuals.transparency_nade.value / 100);
                else
                    if v1388 then
                        local l_value_38 = v45.chams_color.value;
                        v43.chams_color:override(color(l_value_38.r, l_value_38.g, l_value_38.b, l_floor_0(v117.ui_tables.visuals.transparency_alpha.value * 2.55) + 1));
                    end;
                    return l_floor_0(255 * v117.ui_tables.visuals.transparency_alpha.value / 100);
                end;
            end;
        end;
    end;
end;
v117.ui_tables.visuals.transparency_switch:set_callback(function()
    -- upvalues: v117 (ref), v37 (ref), v45 (ref)
    if v117.ui_tables.visuals.transparency_switch.value then
        events.localplayer_transparency:set(v37.transperancy_func);
    else
        events.localplayer_transparency:unset(v37.transperancy_func);
    end;
    v45.chams_color:override();
end, true);
events.shutdown:set(function()
    -- upvalues: v45 (ref)
    v45.chams_color:override();
end);
ffi.cdef("\n                typedef void VOID;\n                typedef int INT;\n                typedef long LONG;\n                typedef float FLOAT;\n                typedef char CHAR;\n                typedef bool BOOL;\n            \n                typedef VOID* PVOID;\n                typedef PVOID HANDLE;\n                typedef const PVOID* LPCVOID;\n                typedef unsigned int SIZE_T;\n                typedef INT* FARPROC;\n                typedef unsigned long DWORD;\n                typedef DWORD ULONG_PTR;\n                typedef const CHAR* LPCSTR;\n                typedef unsigned char BYTE;\n            \n                typedef BYTE uint8;\n                typedef uint16_t uint16;\n                typedef uint32_t uint32;\n                typedef uint64_t uint64;\n                typedef signed char int8;\n                typedef int16_t int16;\n                typedef int32_t int32;\n                typedef int64_t int64;\n\n                typedef struct\n                {\n                    uint32_t xuid_low;\n                    uint32_t xuid_high;\n                    int32_t sequence_bytes;\n                    uint32_t section_number;\n                    uint32_t uncompressed_sample_offset;\n                \n                } VoiceDataCustom_t;\n\n                typedef struct\n                {\n                    uint32_t xuid_low;\n                    uint32_t xuid_high;\n                \n                } VoiceDataCustomreal_t;\n            \n                typedef struct \n                {\n                  char pad_0000[8]; //0x0000\n                    int32_t client; //0x0008\n                    int32_t audible_mask; //0x000C\n                    uint32_t xuid_low;\n                    uint32_t xuid_high;\n                    void* voide_data_; //0x0018\n                    int32_t proximity; //0x001C\n                    //int32_t caster; //0x0020\n                    int32_t format; //0x0020\n                    int32_t sequence_bytes; //0x0024\n                    uint32_t section_number; //0x0028\n                    uint32_t uncompressed_sample_offset; //0x002C\n                \n                } CSVCMsg_VoiceData_Legacy_t;\n            \n                typedef struct \n                {\n                    uint32_t INetMessage_Vtable; //0x0000\n                    char pad_0004[4]; //0x0004\n                    uint32_t CCLCMsg_VoiceData_Vtable; //0x0008\n                    char pad_000C[8]; //0x000C\n                    void* data; //0x0014\n                    uint32_t xuid_low;\n                    uint32_t xuid_high;\n                    int32_t format; //0x0020\n                    int32_t sequence_bytes; //0x0024\n                    uint32_t section_number; //0x0028\n                    uint32_t uncompressed_sample_offset; //0x002C\n                    int32_t cached_size; //0x0030\n                    uint32_t flags; //0x0034\n                    uint8_t no_stack_overflow[0xFF];\n                \n                } CCLCMsg_VoiceData_Legacy_t;\n\n                typedef struct\n                {   \n                    int16_t tickcount;\n                    char name[3];\n                    int16_t tickcount1;\n                } ext_t;\n\n                typedef struct\n                {\n                    //char pad_0000[8];\n                    int32_t pandora_id;\n                    int entity_id;\n                    vector_t pos;\n\n                } pandora_data_t;\n\n                typedef struct\n                {\n                    int64_t value;\n                } convert_t;\n\n                typedef struct {\n      \n                    char pad_0000[156];\n                    uint32_t net_channel;\n                    uint32_t challenge_count;\n                    double reconnect_time;\n                    int32_t retry_count;\n                    char pad_00A8[88];\n                    int32_t signon_state_count;\n                    char pad_0104[8];\n                    float next_cmd_time;\n                    int32_t server_count;\n                    uint32_t current_sequence;\n                    char pad_0118[8];\n                    char pad_0120[0x4C];\n                    int32_t delta_tick;\n                    bool is_paused;\n                    char pad_0171[3];\n                    int32_t view_entity;\n                    int32_t player_slot;\n                    char pad_017C[4];\n                    char level_name[260];\n                    char level_name_short[40];\n                    char pad_02AC[92];\n                    int32_t max_clients;\n                    char pad_030C[4083];\n                    uint32_t string_table_container;\n                    char pad_1303[14737];\n                    float last_server_tick_time;\n                    bool is_in_simulation;\n                    char pad_4C99[3];\n                    uint32_t old_tick_count;\n                    float tick_remainder;\n                    float frame_time;\n                    int32_t last_outgoing_command;\n                    int32_t choked_commands;\n                    int32_t last_command_ack;\n                    int32_t command_ack;\n                    int32_t sound_sequence;\n                    char pad_4CBC[80];\n                    vector_t view_angles;\n                   \n                } ClientState_t;\n            ");
v37.engine = utils.create_interface("engine.dll", "VEngineClient014");
v37.cclientstate = ffi.cast("ClientState_t***", ffi.cast("uintptr_t**", v37.engine)[0][12] + 16)[0][0];
v37.hclientstate = ffi.cast("DWORD**", ffi.cast("DWORD", v37.cclientstate) + 8);
v37.send_net_msg = utils.get_vfunc(40, "bool(__thiscall*)(void*, void*, bool, bool)");
v37.construct_message = ffi.cast("uint32_t(__fastcall*)(void*, void*)", ffi.cast("DWORD", utils.opcode_scan("engine.dll", "56 57 8B F9 8D 4F 08 C7 07 ? ? ? ? E8 ? ? ? ? C7")));
v37.voice_message = function(v1396)
    -- upvalues: v37 (ref)
    if v37.cclientstate.net_channel == 0 then
        return;
    else
        local v1397 = ffi.new("CCLCMsg_VoiceData_Legacy_t");
        ffi.fill(ffi.cast("void*", v1397), ffi.sizeof(v1397), 0);
        v37.construct_message(v1397, nil);
        v1397.xuid_low = v1396.xuid_low;
        v1397.xuid_high = v1396.xuid_high;
        v1397.sequence_bytes = v1396.sequence_bytes;
        v1397.section_number = v1396.section_number;
        v1397.uncompressed_sample_offset = v1396.uncompressed_sample_offset;
        v1397.format = 0;
        v1397.flags = 63;
        v37.send_net_msg(ffi.cast("DWORD**", v37.cclientstate.net_channel), ffi.cast("void*", v1397), false, true);
        return;
    end;
end;
v37.counter = 0;
v37.tick_delay = 0;
v37.packet_counter = 1;
v37.spoof_tickcount = 0;
v37.calculate_fatality_value = function(v1398)
    -- upvalues: l_floor_0 (ref)
    local v1399 = 0;
    local v1400 = 1;
    local v1401 = 8388608;
    local v1402 = 1065353216;
    local v1403 = 0;
    local l_v1398_0 = v1398;
    if v1398 < 0 then
        v1402 = 1082130432;
        v1398 = -v1398;
    end;
    if v1398 >= 1 then
        v1399 = -1;
        while v1400 < v1398 do
            v1400 = v1400 * 2;
            v1399 = v1399 + 1;
        end;
        v1403 = v1402 + v1401 * v1399 + (v1398 - 2 ^ v1399) * v1401 / 2 ^ v1399;
    end;
    if v1398 < 1 and v1398 > 0 then
        v1400 = 1;
        v1399 = 0;
        while v1398 < v1400 do
            v1400 = v1400 / 2;
            v1399 = v1399 + 1;
        end;
        v1403 = v1402 - v1401 * v1399 + (v1398 - 0.5 ^ v1399) * v1401 * 2 ^ v1399;
    end;
    if v1403 - l_floor_0(v1403) > 0 and v1403 - l_floor_0(v1403) <= 0.5 then
        v1403 = l_floor_0(v1403);
    end;
    if v1403 - l_floor_0(v1403) > 0.5 then
        v1403 = l_floor_0(v1403) + 1;
    end;
    if l_v1398_0 <= 0 then
        if l_v1398_0 < 0 then
            v1403 = v1403 - 2 * v1402;
        else
            v1403 = 0;
        end;
    end;
    return v1403;
end;
v37.cheats_data = {
    Gamesense = {
        uncompressed_sample_offset = 2792467861, 
        section_number = 3436095644, 
        sequence_bytes = 100022743, 
        xuid_high = 145270966, 
        xuid_low = 145270966
    }, 
    Pandora = {
        uncompressed_sample_offset = 3279943680, 
        section_number = 1150525622, 
        sequence_bytes = 1149312298, 
        xuid_high = 86401, 
        xuid_low = 683442170, 
        tickcount = 86404
    }, 
    Fatality = {
        uncompressed_sample_offset = 3279943680, 
        section_number = 3292561686, 
        sequence_bytes = -1003061738, 
        xuid_high = 64165, 
        xuid_low = 683835386, 
        tickcount = 64168
    }, 
    Primordial = {
        uncompressed_sample_offset = 1992818854, 
        section_number = 145227821, 
        sequence_bytes = -1148877286, 
        xuid_high = 17825793, 
        xuid_low = 875522969
    }, 
    Disabled = {
        uncompressed_sample_offset = 1603282686, 
        section_number = 1904262895, 
        sequence_bytes = -2086932461, 
        xuid_high = 0, 
        xuid_low = 3355443602
    }, 
    Onetap = {
        uncompressed_sample_offset = 16843009, 
        section_number = 16843009, 
        sequence_bytes = -922432482, 
        xuid_high = 348244372, 
        xuid_low = 1384339450
    }, 
    Airflow = {
        uncompressed_sample_offset = 100, 
        section_number = 100, 
        sequence_bytes = 2818113, 
        xuid_high = 4272171521, 
        xuid_low = 3735943921
    }, 
    Nixware = {
        uncompressed_sample_offset = 65121, 
        section_number = 228, 
        sequence_bytes = 0, 
        xuid_high = 7630437, 
        xuid_low = 1819636069
    }, 
    Plaguecheat = {
        uncompressed_sample_offset = 204521781, 
        section_number = 16, 
        sequence_bytes = -16909332, 
        xuid_high = 64250896, 
        xuid_low = 907415600, 
        tickcount = 3459028
    }, 
    Rifk7 = {
        uncompressed_sample_offset = 1189786112, 
        section_number = 1124925440, 
        sequence_bytes = -1000783872, 
        xuid_high = 3290578944, 
        xuid_low = 636, 
        tickcount = 20532
    }
};
v37.packets = {
    Pandora = {
        [1] = {
            uncompressed_sample_offset = 4294967121, 
            section_number = 4294965803, 
            sequence_bytes = 88, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 104940
        }, 
        [2] = {
            uncompressed_sample_offset = 4294967129, 
            section_number = 4294965778, 
            sequence_bytes = -62, 
            xuid_high = 1, 
            xuid_low = 420187, 
            tickcount = 104944
        }, 
        [3] = {
            uncompressed_sample_offset = 4294967121, 
            section_number = 4294965812, 
            sequence_bytes = 81, 
            xuid_high = 7, 
            xuid_low = 420187, 
            tickcount = 104944
        }, 
        [4] = {
            uncompressed_sample_offset = 4294967121, 
            section_number = 4294965810, 
            sequence_bytes = 83, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 104944
        }, 
        [5] = {
            uncompressed_sample_offset = 4294967129, 
            section_number = 4294965781, 
            sequence_bytes = -63, 
            xuid_high = 1, 
            xuid_low = 420187, 
            tickcount = 104948
        }, 
        [6] = {
            uncompressed_sample_offset = 4294967121, 
            section_number = 4294965821, 
            sequence_bytes = 74, 
            xuid_high = 7, 
            xuid_low = 420187, 
            tickcount = 104948
        }, 
        [7] = {
            uncompressed_sample_offset = 4294967121, 
            section_number = 4294965819, 
            sequence_bytes = 76, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 104948
        }, 
        [8] = {
            uncompressed_sample_offset = 4294967129, 
            section_number = 4294965788, 
            sequence_bytes = -66, 
            xuid_high = 1, 
            xuid_low = 420187, 
            tickcount = 104952
        }, 
        [9] = {
            uncompressed_sample_offset = 4294967121, 
            section_number = 4294965828, 
            sequence_bytes = 68, 
            xuid_high = 7, 
            xuid_low = 420187, 
            tickcount = 104952
        }, 
        [10] = {
            uncompressed_sample_offset = 4294967121, 
            section_number = 4294965827, 
            sequence_bytes = 69, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 104952
        }, 
        [11] = {
            uncompressed_sample_offset = 4294967129, 
            section_number = 4294965793, 
            sequence_bytes = -68, 
            xuid_high = 1, 
            xuid_low = 420187, 
            tickcount = 104956
        }, 
        [12] = {
            uncompressed_sample_offset = 4294967121, 
            section_number = 4294965830, 
            sequence_bytes = 67, 
            xuid_high = 7, 
            xuid_low = 420187, 
            tickcount = 104956
        }, 
        [13] = {
            uncompressed_sample_offset = 4294967121, 
            section_number = 4294965830, 
            sequence_bytes = 67, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 104956
        }, 
        [14] = {
            uncompressed_sample_offset = 4294967121, 
            section_number = 4294965828, 
            sequence_bytes = 69, 
            xuid_high = 7, 
            xuid_low = 420187, 
            tickcount = 104960
        }, 
        [15] = {
            uncompressed_sample_offset = 4294967121, 
            section_number = 4294965828, 
            sequence_bytes = 69, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 104960
        }, 
        [16] = {
            uncompressed_sample_offset = 4294967056, 
            section_number = 4294965655, 
            sequence_bytes = 477, 
            xuid_high = 13, 
            xuid_low = 420187, 
            tickcount = 104960
        }, 
        [17] = {
            uncompressed_sample_offset = 4294967129, 
            section_number = 4294965801, 
            sequence_bytes = -71, 
            xuid_high = 1, 
            xuid_low = 420187, 
            tickcount = 104964
        }, 
        [18] = {
            uncompressed_sample_offset = 4294967121, 
            section_number = 4294965823, 
            sequence_bytes = 73, 
            xuid_high = 7, 
            xuid_low = 420187, 
            tickcount = 104964
        }, 
        [19] = {
            uncompressed_sample_offset = 4294967121, 
            section_number = 4294965824, 
            sequence_bytes = 72, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 104964
        }, 
        [20] = {
            uncompressed_sample_offset = 4294967129, 
            section_number = 4294965803, 
            sequence_bytes = -72, 
            xuid_high = 1, 
            xuid_low = 420187, 
            tickcount = 104968
        }, 
        [21] = {
            uncompressed_sample_offset = 4294967121, 
            section_number = 4294965816, 
            sequence_bytes = 78, 
            xuid_high = 7, 
            xuid_low = 420187, 
            tickcount = 104968
        }, 
        [22] = {
            uncompressed_sample_offset = 4294967121, 
            section_number = 4294965818, 
            sequence_bytes = 77, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 104968
        }, 
        [23] = {
            uncompressed_sample_offset = 4294967121, 
            section_number = 4294965808, 
            sequence_bytes = 85, 
            xuid_high = 7, 
            xuid_low = 420187, 
            tickcount = 104972
        }, 
        [24] = {
            uncompressed_sample_offset = 4294967121, 
            section_number = 4294965810, 
            sequence_bytes = 83, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 104972
        }, 
        [25] = {
            uncompressed_sample_offset = 4294967077, 
            section_number = 4294965685, 
            sequence_bytes = 429, 
            xuid_high = 13, 
            xuid_low = 420187, 
            tickcount = 104972
        }, 
        [26] = {
            uncompressed_sample_offset = 4294967121, 
            section_number = 4294965799, 
            sequence_bytes = 92, 
            xuid_high = 7, 
            xuid_low = 420187, 
            tickcount = 104976
        }, 
        [27] = {
            uncompressed_sample_offset = 4294967121, 
            section_number = 4294965801, 
            sequence_bytes = 90, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 104976
        }, 
        [28] = {
            uncompressed_sample_offset = 4294967078, 
            section_number = 4294965695, 
            sequence_bytes = 413, 
            xuid_high = 13, 
            xuid_low = 420187, 
            tickcount = 104976
        }, 
        [29] = {
            uncompressed_sample_offset = 4294967121, 
            section_number = 4294965790, 
            sequence_bytes = 99, 
            xuid_high = 7, 
            xuid_low = 420187, 
            tickcount = 104980
        }, 
        [30] = {
            uncompressed_sample_offset = 4294967121, 
            section_number = 4294965792, 
            sequence_bytes = 98, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 104980
        }, 
        [31] = {
            uncompressed_sample_offset = 4294967082, 
            section_number = 4294965702, 
            sequence_bytes = 404, 
            xuid_high = 13, 
            xuid_low = 420187, 
            tickcount = 104980
        }, 
        [32] = {
            uncompressed_sample_offset = 4294967121, 
            section_number = 4294965787, 
            sequence_bytes = 101, 
            xuid_high = 7, 
            xuid_low = 420187, 
            tickcount = 104985
        }, 
        [33] = {
            uncompressed_sample_offset = 4294967121, 
            section_number = 4294965787, 
            sequence_bytes = 101, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 104985
        }, 
        [34] = {
            uncompressed_sample_offset = 4294967087, 
            section_number = 4294965710, 
            sequence_bytes = 394, 
            xuid_high = 13, 
            xuid_low = 420187, 
            tickcount = 104985
        }, 
        [35] = {
            uncompressed_sample_offset = 4294967129, 
            section_number = 4294965811, 
            sequence_bytes = -75, 
            xuid_high = 1, 
            xuid_low = 420187, 
            tickcount = 104988
        }, 
        [36] = {
            uncompressed_sample_offset = 4294967121, 
            section_number = 4294965788, 
            sequence_bytes = 100, 
            xuid_high = 7, 
            xuid_low = 420187, 
            tickcount = 104988
        }, 
        [37] = {
            uncompressed_sample_offset = 4294967121, 
            section_number = 4294965788, 
            sequence_bytes = 101, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 104988
        }, 
        [38] = {
            uncompressed_sample_offset = 4294967121, 
            section_number = 4294965791, 
            sequence_bytes = 98, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 104994
        }, 
        [39] = {
            uncompressed_sample_offset = 4294967062, 
            section_number = 4294966189, 
            sequence_bytes = 1199, 
            xuid_high = 18, 
            xuid_low = 420187, 
            tickcount = 104994
        }, 
        [40] = {
            uncompressed_sample_offset = 4294967121, 
            section_number = 4294965792, 
            sequence_bytes = 97, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 104994
        }, 
        [41] = {
            uncompressed_sample_offset = 4294967121, 
            section_number = 4294965798, 
            sequence_bytes = 93, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 104996
        }, 
        [42] = {
            uncompressed_sample_offset = 4294967129, 
            section_number = 4294965809, 
            sequence_bytes = -74, 
            xuid_high = 1, 
            xuid_low = 420187, 
            tickcount = 104998
        }, 
        [43] = {
            uncompressed_sample_offset = 4294967121, 
            section_number = 4294965800, 
            sequence_bytes = 91, 
            xuid_high = 7, 
            xuid_low = 420187, 
            tickcount = 104998
        }, 
        [44] = {
            uncompressed_sample_offset = 4294967121, 
            section_number = 4294965801, 
            sequence_bytes = 90, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 104998
        }, 
        [45] = {
            uncompressed_sample_offset = 4294967129, 
            section_number = 4294965802, 
            sequence_bytes = -71, 
            xuid_high = 1, 
            xuid_low = 420187, 
            tickcount = 105003
        }, 
        [46] = {
            uncompressed_sample_offset = 4294967121, 
            section_number = 4294965818, 
            sequence_bytes = 77, 
            xuid_high = 7, 
            xuid_low = 420187, 
            tickcount = 105003
        }, 
        [47] = {
            uncompressed_sample_offset = 4294967121, 
            section_number = 4294965815, 
            sequence_bytes = 80, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105003
        }, 
        [48] = {
            uncompressed_sample_offset = 4294967121, 
            section_number = 4294965823, 
            sequence_bytes = 73, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105007
        }, 
        [49] = {
            uncompressed_sample_offset = 4294967119, 
            section_number = 4294965748, 
            sequence_bytes = 331, 
            xuid_high = 13, 
            xuid_low = 420187, 
            tickcount = 105007
        }, 
        [50] = {
            uncompressed_sample_offset = 4294967107, 
            section_number = 4294966138, 
            sequence_bytes = 1192, 
            xuid_high = 18, 
            xuid_low = 420187, 
            tickcount = 105007
        }, 
        [51] = {
            uncompressed_sample_offset = 4294967121, 
            section_number = 4294965830, 
            sequence_bytes = 67, 
            xuid_high = 7, 
            xuid_low = 420187, 
            tickcount = 105008
        }, 
        [52] = {
            uncompressed_sample_offset = 4294967121, 
            section_number = 4294965825, 
            sequence_bytes = 71, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105008
        }, 
        [53] = {
            uncompressed_sample_offset = 4294967121, 
            section_number = 4294965753, 
            sequence_bytes = 323, 
            xuid_high = 13, 
            xuid_low = 420187, 
            tickcount = 105008
        }, 
        [54] = {
            uncompressed_sample_offset = 4294967121, 
            section_number = 4294965817, 
            sequence_bytes = 78, 
            xuid_high = 7, 
            xuid_low = 420187, 
            tickcount = 105012
        }, 
        [55] = {
            uncompressed_sample_offset = 4294967121, 
            section_number = 4294965830, 
            sequence_bytes = 67, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105012
        }, 
        [56] = {
            uncompressed_sample_offset = 4294967121, 
            section_number = 4294965759, 
            sequence_bytes = 311, 
            xuid_high = 13, 
            xuid_low = 420187, 
            tickcount = 105012
        }, 
        [57] = {
            uncompressed_sample_offset = 112, 
            section_number = 253, 
            sequence_bytes = 157, 
            xuid_high = 5, 
            xuid_low = 420187, 
            tickcount = 105016
        }, 
        [58] = {
            uncompressed_sample_offset = 4294967121, 
            section_number = 4294965814, 
            sequence_bytes = 80, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105016
        }, 
        [59] = {
            uncompressed_sample_offset = 4294967128, 
            section_number = 4294966111, 
            sequence_bytes = 1189, 
            xuid_high = 18, 
            xuid_low = 420187, 
            tickcount = 105016
        }, 
        [60] = {
            uncompressed_sample_offset = 4294967121, 
            section_number = 4294965804, 
            sequence_bytes = 88, 
            xuid_high = 7, 
            xuid_low = 420187, 
            tickcount = 105019
        }, 
        [61] = {
            uncompressed_sample_offset = 4294967121, 
            section_number = 4294965806, 
            sequence_bytes = 86, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105019
        }, 
        [62] = {
            uncompressed_sample_offset = 4294967121, 
            section_number = 4294965772, 
            sequence_bytes = 286, 
            xuid_high = 13, 
            xuid_low = 420187, 
            tickcount = 105019
        }, 
        [63] = {
            uncompressed_sample_offset = 4294967129, 
            section_number = 4294965800, 
            sequence_bytes = -70, 
            xuid_high = 1, 
            xuid_low = 420187, 
            tickcount = 105023
        }, 
        [64] = {
            uncompressed_sample_offset = 4294967121, 
            section_number = 4294965795, 
            sequence_bytes = 95, 
            xuid_high = 7, 
            xuid_low = 420187, 
            tickcount = 105023
        }, 
        [65] = {
            uncompressed_sample_offset = 4294967121, 
            section_number = 4294965798, 
            sequence_bytes = 92, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105023
        }, 
        [66] = {
            uncompressed_sample_offset = 4294967121, 
            section_number = 4294965796, 
            sequence_bytes = 94, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105023
        }, 
        [67] = {
            uncompressed_sample_offset = 4294967070, 
            section_number = 4294965780, 
            sequence_bytes = 621, 
            xuid_high = 20, 
            xuid_low = 420187, 
            tickcount = 105023
        }, 
        [68] = {
            uncompressed_sample_offset = 4294967121, 
            section_number = 4294965795, 
            sequence_bytes = 94, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105023
        }, 
        [69] = {
            uncompressed_sample_offset = 4294967129, 
            section_number = 4294965791, 
            sequence_bytes = -67, 
            xuid_high = 1, 
            xuid_low = 420187, 
            tickcount = 105026
        }, 
        [70] = {
            uncompressed_sample_offset = 4294967121, 
            section_number = 4294965789, 
            sequence_bytes = 99, 
            xuid_high = 7, 
            xuid_low = 420187, 
            tickcount = 105026
        }, 
        [71] = {
            uncompressed_sample_offset = 4294967121, 
            section_number = 4294965791, 
            sequence_bytes = 98, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105026
        }, 
        [72] = {
            uncompressed_sample_offset = 4294967121, 
            section_number = 4294965790, 
            sequence_bytes = 99, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105027
        }, 
        [73] = {
            uncompressed_sample_offset = 4294967121, 
            section_number = 4294965790, 
            sequence_bytes = 99, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105027
        }, 
        [74] = {
            uncompressed_sample_offset = 4294967121, 
            section_number = 4294965789, 
            sequence_bytes = 99, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105027
        }, 
        [75] = {
            uncompressed_sample_offset = 4294967129, 
            section_number = 4294965785, 
            sequence_bytes = -64, 
            xuid_high = 1, 
            xuid_low = 420187, 
            tickcount = 105031
        }, 
        [76] = {
            uncompressed_sample_offset = 4294967121, 
            section_number = 4294965789, 
            sequence_bytes = 100, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105031
        }, 
        [77] = {
            uncompressed_sample_offset = 4294967121, 
            section_number = 4294965781, 
            sequence_bytes = 246, 
            xuid_high = 13, 
            xuid_low = 420187, 
            tickcount = 105031
        }, 
        [78] = {
            uncompressed_sample_offset = 4294967054, 
            section_number = 4294965747, 
            sequence_bytes = 608, 
            xuid_high = 20, 
            xuid_low = 420187, 
            tickcount = 105033
        }, 
        [79] = {
            uncompressed_sample_offset = 4294967104, 
            section_number = 4294966756, 
            sequence_bytes = 1170, 
            xuid_high = 25, 
            xuid_low = 420187, 
            tickcount = 105033
        }, 
        [80] = {
            uncompressed_sample_offset = 4294967104, 
            section_number = 4294966756, 
            sequence_bytes = 1170, 
            xuid_high = 25, 
            xuid_low = 420187, 
            tickcount = 105033
        }, 
        [81] = {
            uncompressed_sample_offset = 4294967104, 
            section_number = 4294966756, 
            sequence_bytes = 1170, 
            xuid_high = 25, 
            xuid_low = 420187, 
            tickcount = 105035
        }, 
        [82] = {
            uncompressed_sample_offset = 4294967104, 
            section_number = 4294966756, 
            sequence_bytes = 1170, 
            xuid_high = 25, 
            xuid_low = 420187, 
            tickcount = 105035
        }, 
        [83] = {
            uncompressed_sample_offset = 4294967040, 
            section_number = 4294965718, 
            sequence_bytes = 591, 
            xuid_high = 20, 
            xuid_low = 420187, 
            tickcount = 105039
        }, 
        [84] = {
            uncompressed_sample_offset = 4294967104, 
            section_number = 4294966756, 
            sequence_bytes = 1170, 
            xuid_high = 25, 
            xuid_low = 420187, 
            tickcount = 105039
        }, 
        [85] = {
            uncompressed_sample_offset = 4294967104, 
            section_number = 4294966756, 
            sequence_bytes = 1170, 
            xuid_high = 25, 
            xuid_low = 420187, 
            tickcount = 105039
        }, 
        [86] = {
            uncompressed_sample_offset = 4294967121, 
            section_number = 4294965775, 
            sequence_bytes = 213, 
            xuid_high = 13, 
            xuid_low = 420187, 
            tickcount = 105043
        }, 
        [87] = {
            uncompressed_sample_offset = 4294967121, 
            section_number = 4294965775, 
            sequence_bytes = 213, 
            xuid_high = 13, 
            xuid_low = 420187, 
            tickcount = 105043
        }, 
        [88] = {
            uncompressed_sample_offset = 4294967121, 
            section_number = 4294965789, 
            sequence_bytes = 99, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105048
        }, 
        [89] = {
            uncompressed_sample_offset = 4294967064, 
            section_number = 4294965690, 
            sequence_bytes = 570, 
            xuid_high = 20, 
            xuid_low = 420187, 
            tickcount = 105048
        }, 
        [90] = {
            uncompressed_sample_offset = 95, 
            section_number = 4294966602, 
            sequence_bytes = 301, 
            xuid_high = 22, 
            xuid_low = 420187, 
            tickcount = 105048
        }, 
        [91] = {
            uncompressed_sample_offset = 4294967129, 
            section_number = 4294965781, 
            sequence_bytes = -63, 
            xuid_high = 1, 
            xuid_low = 420187, 
            tickcount = 105052
        }, 
        [92] = {
            uncompressed_sample_offset = 4294967121, 
            section_number = 4294965792, 
            sequence_bytes = 94, 
            xuid_high = 7, 
            xuid_low = 420187, 
            tickcount = 105052
        }, 
        [93] = {
            uncompressed_sample_offset = 4294967121, 
            section_number = 4294965791, 
            sequence_bytes = 97, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105052
        }, 
        [94] = {
            uncompressed_sample_offset = 4294967121, 
            section_number = 4294965792, 
            sequence_bytes = 91, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105056
        }, 
        [95] = {
            uncompressed_sample_offset = 4294967129, 
            section_number = 4294965779, 
            sequence_bytes = -62, 
            xuid_high = 1, 
            xuid_low = 420187, 
            tickcount = 105057
        }, 
        [96] = {
            uncompressed_sample_offset = 4294967121, 
            section_number = 4294965791, 
            sequence_bytes = 87, 
            xuid_high = 7, 
            xuid_low = 420187, 
            tickcount = 105057
        }, 
        [97] = {
            uncompressed_sample_offset = 4294967121, 
            section_number = 4294965792, 
            sequence_bytes = 90, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105057
        }, 
        [98] = {
            uncompressed_sample_offset = 4294967129, 
            section_number = 4294965778, 
            sequence_bytes = -62, 
            xuid_high = 1, 
            xuid_low = 420187, 
            tickcount = 105060
        }, 
        [99] = {
            uncompressed_sample_offset = 4294967121, 
            section_number = 4294965791, 
            sequence_bytes = 78, 
            xuid_high = 7, 
            xuid_low = 420187, 
            tickcount = 105060
        }, 
        [100] = {
            uncompressed_sample_offset = 4294967121, 
            section_number = 4294965791, 
            sequence_bytes = 83, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105060
        }, 
        [101] = {
            uncompressed_sample_offset = 4294967129, 
            section_number = 4294965771, 
            sequence_bytes = -59, 
            xuid_high = 1, 
            xuid_low = 420187, 
            tickcount = 105064
        }, 
        [102] = {
            uncompressed_sample_offset = 4294967121, 
            section_number = 4294965790, 
            sequence_bytes = 67, 
            xuid_high = 7, 
            xuid_low = 420187, 
            tickcount = 105064
        }, 
        [103] = {
            uncompressed_sample_offset = 4294967121, 
            section_number = 4294965791, 
            sequence_bytes = 74, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105064
        }, 
        [104] = {
            uncompressed_sample_offset = 4294967128, 
            section_number = 4294965758, 
            sequence_bytes = -55, 
            xuid_high = 1, 
            xuid_low = 420187, 
            tickcount = 105068
        }, 
        [105] = {
            uncompressed_sample_offset = 4294967121, 
            section_number = 4294965790, 
            sequence_bytes = 60, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105068
        }, 
        [106] = {
            uncompressed_sample_offset = 4294967121, 
            section_number = 4294965768, 
            sequence_bytes = 122, 
            xuid_high = 13, 
            xuid_low = 420187, 
            tickcount = 105068
        }, 
        [107] = {
            uncompressed_sample_offset = 4294967129, 
            section_number = 4294965740, 
            sequence_bytes = -57, 
            xuid_high = 1, 
            xuid_low = 420187, 
            tickcount = 105075
        }, 
        [108] = {
            uncompressed_sample_offset = 4294967121, 
            section_number = 4294965783, 
            sequence_bytes = 29, 
            xuid_high = 7, 
            xuid_low = 420187, 
            tickcount = 105075
        }, 
        [109] = {
            uncompressed_sample_offset = 4294967121, 
            section_number = 4294965785, 
            sequence_bytes = 34, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105075
        }, 
        [110] = {
            uncompressed_sample_offset = 4294967129, 
            section_number = 4294965731, 
            sequence_bytes = -60, 
            xuid_high = 1, 
            xuid_low = 420187, 
            tickcount = 105080
        }, 
        [111] = {
            uncompressed_sample_offset = 4294967121, 
            section_number = 4294965778, 
            sequence_bytes = 16, 
            xuid_high = 7, 
            xuid_low = 420187, 
            tickcount = 105080
        }, 
        [112] = {
            uncompressed_sample_offset = 4294967121, 
            section_number = 4294965781, 
            sequence_bytes = 22, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105080
        }, 
        [113] = {
            uncompressed_sample_offset = 4294967122, 
            section_number = 4294965775, 
            sequence_bytes = 9, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105085
        }, 
        [114] = {
            uncompressed_sample_offset = 4294967085, 
            section_number = 4294965675, 
            sequence_bytes = 433, 
            xuid_high = 20, 
            xuid_low = 420187, 
            tickcount = 105085
        }, 
        [115] = {
            uncompressed_sample_offset = 4294967181, 
            section_number = 4294967092, 
            sequence_bytes = 1398, 
            xuid_high = 22, 
            xuid_low = 420187, 
            tickcount = 105085
        }, 
        [116] = {
            uncompressed_sample_offset = 4294967129, 
            section_number = 4294965709, 
            sequence_bytes = -70, 
            xuid_high = 1, 
            xuid_low = 420187, 
            tickcount = 105087
        }, 
        [117] = {
            uncompressed_sample_offset = 4294967139, 
            section_number = 4294965764, 
            sequence_bytes = -7, 
            xuid_high = 7, 
            xuid_low = 420187, 
            tickcount = 105087
        }, 
        [118] = {
            uncompressed_sample_offset = 4294967128, 
            section_number = 4294965770, 
            sequence_bytes = 0, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105087
        }, 
        [119] = {
            uncompressed_sample_offset = 4294967148, 
            section_number = 4294965758, 
            sequence_bytes = -14, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105092
        }, 
        [120] = {
            uncompressed_sample_offset = 4294967121, 
            section_number = 4294965779, 
            sequence_bytes = 46, 
            xuid_high = 13, 
            xuid_low = 420187, 
            tickcount = 105092
        }, 
        [121] = {
            uncompressed_sample_offset = 4294967167, 
            section_number = 4294967093, 
            sequence_bytes = 1419, 
            xuid_high = 22, 
            xuid_low = 420187, 
            tickcount = 105092
        }, 
        [122] = {
            uncompressed_sample_offset = 4294967168, 
            section_number = 4294965732, 
            sequence_bytes = -24, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105100
        }, 
        [123] = {
            uncompressed_sample_offset = 4294967130, 
            section_number = 4294965769, 
            sequence_bytes = 13, 
            xuid_high = 13, 
            xuid_low = 420187, 
            tickcount = 105100
        }, 
        [124] = {
            uncompressed_sample_offset = 69, 
            section_number = 238, 
            sequence_bytes = 482, 
            xuid_high = 14, 
            xuid_low = 420187, 
            tickcount = 105100
        }, 
        [125] = {
            uncompressed_sample_offset = 4294967129, 
            section_number = 4294965665, 
            sequence_bytes = -98, 
            xuid_high = 1, 
            xuid_low = 420187, 
            tickcount = 105104
        }, 
        [126] = {
            uncompressed_sample_offset = 4294967176, 
            section_number = 4294965708, 
            sequence_bytes = -24, 
            xuid_high = 7, 
            xuid_low = 420187, 
            tickcount = 105104
        }, 
        [127] = {
            uncompressed_sample_offset = 4294967175, 
            section_number = 4294965714, 
            sequence_bytes = -25, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105104
        }, 
        [128] = {
            uncompressed_sample_offset = 4294967129, 
            section_number = 4294965653, 
            sequence_bytes = -109, 
            xuid_high = 1, 
            xuid_low = 420187, 
            tickcount = 105108
        }, 
        [129] = {
            uncompressed_sample_offset = 4294967177, 
            section_number = 4294965692, 
            sequence_bytes = -29, 
            xuid_high = 7, 
            xuid_low = 420187, 
            tickcount = 105108
        }, 
        [130] = {
            uncompressed_sample_offset = 4294967177, 
            section_number = 4294965699, 
            sequence_bytes = -26, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105108
        }, 
        [131] = {
            uncompressed_sample_offset = 4294967129, 
            section_number = 4294965646, 
            sequence_bytes = -116, 
            xuid_high = 1, 
            xuid_low = 420187, 
            tickcount = 105112
        }, 
        [132] = {
            uncompressed_sample_offset = 4294967175, 
            section_number = 4294965679, 
            sequence_bytes = -39, 
            xuid_high = 7, 
            xuid_low = 420187, 
            tickcount = 105112
        }, 
        [133] = {
            uncompressed_sample_offset = 4294967177, 
            section_number = 4294965684, 
            sequence_bytes = -34, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105112
        }, 
        [134] = {
            uncompressed_sample_offset = 4294967129, 
            section_number = 4294965635, 
            sequence_bytes = -128, 
            xuid_high = 1, 
            xuid_low = 420187, 
            tickcount = 105116
        }, 
        [135] = {
            uncompressed_sample_offset = 4294967169, 
            section_number = 4294965663, 
            sequence_bytes = -54, 
            xuid_high = 7, 
            xuid_low = 420187, 
            tickcount = 105116
        }, 
        [136] = {
            uncompressed_sample_offset = 4294967173, 
            section_number = 4294965673, 
            sequence_bytes = -44, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105116
        }, 
        [137] = {
            uncompressed_sample_offset = 4294967129, 
            section_number = 4294965630, 
            sequence_bytes = -136, 
            xuid_high = 1, 
            xuid_low = 420187, 
            tickcount = 105119
        }, 
        [138] = {
            uncompressed_sample_offset = 4294967167, 
            section_number = 4294965660, 
            sequence_bytes = -57, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105119
        }, 
        [139] = {
            uncompressed_sample_offset = 4294967175, 
            section_number = 4294965720, 
            sequence_bytes = -44, 
            xuid_high = 13, 
            xuid_low = 420187, 
            tickcount = 105119
        }, 
        [140] = {
            uncompressed_sample_offset = 4294967129, 
            section_number = 4294965622, 
            sequence_bytes = -147, 
            xuid_high = 1, 
            xuid_low = 420187, 
            tickcount = 105123
        }, 
        [141] = {
            uncompressed_sample_offset = 4294967148, 
            section_number = 4294965644, 
            sequence_bytes = -84, 
            xuid_high = 7, 
            xuid_low = 420187, 
            tickcount = 105123
        }, 
        [142] = {
            uncompressed_sample_offset = 4294967159, 
            section_number = 4294965652, 
            sequence_bytes = -70, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105123
        }, 
        [143] = {
            uncompressed_sample_offset = 4294967156, 
            section_number = 4294965649, 
            sequence_bytes = -74, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105124
        }, 
        [144] = {
            uncompressed_sample_offset = 4294967228, 
            section_number = 4294966192, 
            sequence_bytes = 990, 
            xuid_high = 18, 
            xuid_low = 420187, 
            tickcount = 105124
        }, 
        [145] = {
            uncompressed_sample_offset = 4294967129, 
            section_number = 4294965604, 
            sequence_bytes = -169, 
            xuid_high = 1, 
            xuid_low = 420187, 
            tickcount = 105131
        }, 
        [146] = {
            uncompressed_sample_offset = 4294967140, 
            section_number = 4294965632, 
            sequence_bytes = -119, 
            xuid_high = 7, 
            xuid_low = 420187, 
            tickcount = 105131
        }, 
        [147] = {
            uncompressed_sample_offset = 4294967132, 
            section_number = 4294965636, 
            sequence_bytes = -107, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105131
        }, 
        [148] = {
            uncompressed_sample_offset = 4294967144, 
            section_number = 4294965631, 
            sequence_bytes = -125, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105136
        }, 
        [149] = {
            uncompressed_sample_offset = 4294967156, 
            section_number = 4294965685, 
            sequence_bytes = -100, 
            xuid_high = 13, 
            xuid_low = 420187, 
            tickcount = 105136
        }, 
        [150] = {
            uncompressed_sample_offset = 96, 
            section_number = 203, 
            sequence_bytes = 399, 
            xuid_high = 14, 
            xuid_low = 420187, 
            tickcount = 105136
        }, 
        [151] = {
            uncompressed_sample_offset = 4294967129, 
            section_number = 4294965589, 
            sequence_bytes = -204, 
            xuid_high = 1, 
            xuid_low = 420187, 
            tickcount = 105144
        }, 
        [152] = {
            uncompressed_sample_offset = 4294967167, 
            section_number = 4294965626, 
            sequence_bytes = -175, 
            xuid_high = 7, 
            xuid_low = 420187, 
            tickcount = 105144
        }, 
        [153] = {
            uncompressed_sample_offset = 4294967164, 
            section_number = 4294965626, 
            sequence_bytes = -163, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105144
        }, 
        [154] = {
            uncompressed_sample_offset = 4294967170, 
            section_number = 4294965625, 
            sequence_bytes = -194, 
            xuid_high = 7, 
            xuid_low = 420187, 
            tickcount = 105148
        }, 
        [155] = {
            uncompressed_sample_offset = 4294967169, 
            section_number = 4294965625, 
            sequence_bytes = -181, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105148
        }, 
        [156] = {
            uncompressed_sample_offset = 4294967129, 
            section_number = 4294965651, 
            sequence_bytes = -128, 
            xuid_high = 13, 
            xuid_low = 420187, 
            tickcount = 105148
        }, 
        [157] = {
            uncompressed_sample_offset = 4294967129, 
            section_number = 4294965584, 
            sequence_bytes = -230, 
            xuid_high = 1, 
            xuid_low = 420187, 
            tickcount = 105152
        }, 
        [158] = {
            uncompressed_sample_offset = 4294967171, 
            section_number = 4294965625, 
            sequence_bytes = -201, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105152
        }, 
        [159] = {
            uncompressed_sample_offset = 4294967129, 
            section_number = 4294965646, 
            sequence_bytes = -132, 
            xuid_high = 13, 
            xuid_low = 420187, 
            tickcount = 105152
        }, 
        [160] = {
            uncompressed_sample_offset = 4294967129, 
            section_number = 4294965582, 
            sequence_bytes = -240, 
            xuid_high = 1, 
            xuid_low = 420187, 
            tickcount = 105156
        }, 
        [161] = {
            uncompressed_sample_offset = 4294967167, 
            section_number = 4294965626, 
            sequence_bytes = -234, 
            xuid_high = 7, 
            xuid_low = 420187, 
            tickcount = 105156
        }, 
        [162] = {
            uncompressed_sample_offset = 4294967169, 
            section_number = 4294965625, 
            sequence_bytes = -219, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105156
        }, 
        [163] = {
            uncompressed_sample_offset = 4294967129, 
            section_number = 4294965581, 
            sequence_bytes = -250, 
            xuid_high = 1, 
            xuid_low = 420187, 
            tickcount = 105160
        }, 
        [164] = {
            uncompressed_sample_offset = 4294967160, 
            section_number = 4294965627, 
            sequence_bytes = -254, 
            xuid_high = 7, 
            xuid_low = 420187, 
            tickcount = 105160
        }, 
        [165] = {
            uncompressed_sample_offset = 4294967165, 
            section_number = 4294965626, 
            sequence_bytes = -241, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105160
        }, 
        [166] = {
            uncompressed_sample_offset = 4294967129, 
            section_number = 4294965581, 
            sequence_bytes = -253, 
            xuid_high = 1, 
            xuid_low = 420187, 
            tickcount = 105164
        }, 
        [167] = {
            uncompressed_sample_offset = 4294967151, 
            section_number = 4294965628, 
            sequence_bytes = -275, 
            xuid_high = 7, 
            xuid_low = 420187, 
            tickcount = 105164
        }, 
        [168] = {
            uncompressed_sample_offset = 4294967159, 
            section_number = 4294965627, 
            sequence_bytes = -257, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105164
        }, 
        [169] = {
            uncompressed_sample_offset = 4294967156, 
            section_number = 4294965627, 
            sequence_bytes = -264, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105164
        }, 
        [170] = {
            uncompressed_sample_offset = 4294967167, 
            section_number = 4294965786, 
            sequence_bytes = 114, 
            xuid_high = 20, 
            xuid_low = 420187, 
            tickcount = 105164
        }, 
        [171] = {
            uncompressed_sample_offset = 4294967129, 
            section_number = 4294967096, 
            sequence_bytes = 1365, 
            xuid_high = 22, 
            xuid_low = 420187, 
            tickcount = 105164
        }, 
        [172] = {
            uncompressed_sample_offset = 4294967129, 
            section_number = 4294965591, 
            sequence_bytes = -266, 
            xuid_high = 1, 
            xuid_low = 420187, 
            tickcount = 105168
        }, 
        [173] = {
            uncompressed_sample_offset = 4294967147, 
            section_number = 4294965629, 
            sequence_bytes = -281, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105168
        }, 
        [174] = {
            uncompressed_sample_offset = 4294967137, 
            section_number = 4294967096, 
            sequence_bytes = 1359, 
            xuid_high = 22, 
            xuid_low = 420187, 
            tickcount = 105168
        }, 
        [175] = {
            uncompressed_sample_offset = 4294967129, 
            section_number = 4294965592, 
            sequence_bytes = -267, 
            xuid_high = 1, 
            xuid_low = 420187, 
            tickcount = 105170
        }, 
        [176] = {
            uncompressed_sample_offset = 4294967138, 
            section_number = 4294965628, 
            sequence_bytes = -296, 
            xuid_high = 7, 
            xuid_low = 420187, 
            tickcount = 105170
        }, 
        [177] = {
            uncompressed_sample_offset = 4294967143, 
            section_number = 4294965629, 
            sequence_bytes = -288, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105170
        }, 
        [178] = {
            uncompressed_sample_offset = 4294967129, 
            section_number = 4294965594, 
            sequence_bytes = -270, 
            xuid_high = 1, 
            xuid_low = 420187, 
            tickcount = 105172
        }, 
        [179] = {
            uncompressed_sample_offset = 4294967133, 
            section_number = 4294965628, 
            sequence_bytes = -303, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105172
        }, 
        [180] = {
            uncompressed_sample_offset = 4294967129, 
            section_number = 4294965628, 
            sequence_bytes = -147, 
            xuid_high = 13, 
            xuid_low = 420187, 
            tickcount = 105172
        }, 
        [181] = {
            uncompressed_sample_offset = 4294967129, 
            section_number = 4294965597, 
            sequence_bytes = -273, 
            xuid_high = 1, 
            xuid_low = 420187, 
            tickcount = 105176
        }, 
        [182] = {
            uncompressed_sample_offset = 4294967147, 
            section_number = 4294965629, 
            sequence_bytes = -335, 
            xuid_high = 7, 
            xuid_low = 420187, 
            tickcount = 105176
        }, 
        [183] = {
            uncompressed_sample_offset = 4294967137, 
            section_number = 4294965629, 
            sequence_bytes = -320, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105176
        }, 
        [184] = {
            uncompressed_sample_offset = 4294967129, 
            section_number = 4294965599, 
            sequence_bytes = -278, 
            xuid_high = 1, 
            xuid_low = 420187, 
            tickcount = 105180
        }, 
        [185] = {
            uncompressed_sample_offset = 4294967157, 
            section_number = 4294965623, 
            sequence_bytes = -352, 
            xuid_high = 7, 
            xuid_low = 420187, 
            tickcount = 105180
        }, 
        [186] = {
            uncompressed_sample_offset = 4294967151, 
            section_number = 4294965628, 
            sequence_bytes = -341, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105180
        }, 
        [187] = {
            uncompressed_sample_offset = 4294967165, 
            section_number = 4294965612, 
            sequence_bytes = -367, 
            xuid_high = 7, 
            xuid_low = 420187, 
            tickcount = 105184
        }, 
        [188] = {
            uncompressed_sample_offset = 4294967160, 
            section_number = 4294965619, 
            sequence_bytes = -357, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105184
        }, 
        [189] = {
            uncompressed_sample_offset = 4294967129, 
            section_number = 4294965617, 
            sequence_bytes = -156, 
            xuid_high = 13, 
            xuid_low = 420187, 
            tickcount = 105184
        }, 
        [190] = {
            uncompressed_sample_offset = 4294967170, 
            section_number = 4294965603, 
            sequence_bytes = -384, 
            xuid_high = 7, 
            xuid_low = 420187, 
            tickcount = 105188
        }, 
        [191] = {
            uncompressed_sample_offset = 4294967167, 
            section_number = 4294965609, 
            sequence_bytes = -372, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105188
        }, 
        [192] = {
            uncompressed_sample_offset = 4294967129, 
            section_number = 4294965613, 
            sequence_bytes = -158, 
            xuid_high = 13, 
            xuid_low = 420187, 
            tickcount = 105188
        }, 
        [193] = {
            uncompressed_sample_offset = 4294967129, 
            section_number = 4294965600, 
            sequence_bytes = -282, 
            xuid_high = 1, 
            xuid_low = 420187, 
            tickcount = 105192
        }, 
        [194] = {
            uncompressed_sample_offset = 4294967171, 
            section_number = 4294965597, 
            sequence_bytes = -403, 
            xuid_high = 7, 
            xuid_low = 420187, 
            tickcount = 105192
        }, 
        [195] = {
            uncompressed_sample_offset = 4294967171, 
            section_number = 4294965600, 
            sequence_bytes = -391, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105192
        }, 
        [196] = {
            uncompressed_sample_offset = 4294967170, 
            section_number = 4294965596, 
            sequence_bytes = -423, 
            xuid_high = 7, 
            xuid_low = 420187, 
            tickcount = 105198
        }, 
        [197] = {
            uncompressed_sample_offset = 4294967171, 
            section_number = 4294965596, 
            sequence_bytes = -409, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105198
        }, 
        [198] = {
            uncompressed_sample_offset = 4294967129, 
            section_number = 4294965604, 
            sequence_bytes = -162, 
            xuid_high = 13, 
            xuid_low = 420187, 
            tickcount = 105198
        }, 
        [199] = {
            uncompressed_sample_offset = 4294967153, 
            section_number = 4294965604, 
            sequence_bytes = -472, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105209
        }, 
        [200] = {
            uncompressed_sample_offset = 4294967143, 
            section_number = 4294965609, 
            sequence_bytes = -488, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105213
        }, 
        [201] = {
            uncompressed_sample_offset = 4294967129, 
            section_number = 4294965590, 
            sequence_bytes = -167, 
            xuid_high = 13, 
            xuid_low = 420187, 
            tickcount = 105213
        }, 
        [202] = {
            uncompressed_sample_offset = 4294967134, 
            section_number = 4294967140, 
            sequence_bytes = 1346, 
            xuid_high = 22, 
            xuid_low = 420187, 
            tickcount = 105213
        }, 
        [203] = {
            uncompressed_sample_offset = 4294967126, 
            section_number = 4294965616, 
            sequence_bytes = -511, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105217
        }, 
        [204] = {
            uncompressed_sample_offset = 4294967149, 
            section_number = 4294965681, 
            sequence_bytes = -95, 
            xuid_high = 20, 
            xuid_low = 420187, 
            tickcount = 105217
        }, 
        [205] = {
            uncompressed_sample_offset = 4294967128, 
            section_number = 4294967150, 
            sequence_bytes = 1347, 
            xuid_high = 22, 
            xuid_low = 420187, 
            tickcount = 105217
        }, 
        [206] = {
            uncompressed_sample_offset = 4294967119, 
            section_number = 4294965621, 
            sequence_bytes = -525, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105219
        }, 
        [207] = {
            uncompressed_sample_offset = 4294967129, 
            section_number = 4294967152, 
            sequence_bytes = 1347, 
            xuid_high = 22, 
            xuid_low = 420187, 
            tickcount = 105219
        }, 
        [208] = {
            uncompressed_sample_offset = 4294967120, 
            section_number = 4294965623, 
            sequence_bytes = -535, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105224
        }, 
        [209] = {
            uncompressed_sample_offset = 4294967129, 
            section_number = 4294965577, 
            sequence_bytes = -172, 
            xuid_high = 13, 
            xuid_low = 420187, 
            tickcount = 105224
        }, 
        [210] = {
            uncompressed_sample_offset = 4294967133, 
            section_number = 4294965647, 
            sequence_bytes = -119, 
            xuid_high = 20, 
            xuid_low = 420187, 
            tickcount = 105224
        }, 
        [211] = {
            uncompressed_sample_offset = 4294967120, 
            section_number = 4294965626, 
            sequence_bytes = -548, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105228
        }, 
        [212] = {
            uncompressed_sample_offset = 4294967120, 
            section_number = 4294965626, 
            sequence_bytes = -550, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105228
        }, 
        [213] = {
            uncompressed_sample_offset = 4294967129, 
            section_number = 4294965579, 
            sequence_bytes = -357, 
            xuid_high = 1, 
            xuid_low = 420187, 
            tickcount = 105232
        }, 
        [214] = {
            uncompressed_sample_offset = 4294967120, 
            section_number = 4294965630, 
            sequence_bytes = -570, 
            xuid_high = 7, 
            xuid_low = 420187, 
            tickcount = 105232
        }, 
        [215] = {
            uncompressed_sample_offset = 4294967120, 
            section_number = 4294965628, 
            sequence_bytes = -561, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105232
        }, 
        [216] = {
            uncompressed_sample_offset = 4294967120, 
            section_number = 4294965631, 
            sequence_bytes = -571, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105235
        }, 
        [217] = {
            uncompressed_sample_offset = 4294967129, 
            section_number = 4294965552, 
            sequence_bytes = -182, 
            xuid_high = 13, 
            xuid_low = 420187, 
            tickcount = 105235
        }, 
        [218] = {
            uncompressed_sample_offset = 32, 
            section_number = 4294966362, 
            sequence_bytes = 781, 
            xuid_high = 18, 
            xuid_low = 420187, 
            tickcount = 105235
        }, 
        [219] = {
            uncompressed_sample_offset = 4294967121, 
            section_number = 4294965632, 
            sequence_bytes = -574, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105236
        }, 
        [220] = {
            uncompressed_sample_offset = 4294967122, 
            section_number = 4294965643, 
            sequence_bytes = -594, 
            xuid_high = 7, 
            xuid_low = 420187, 
            tickcount = 105239
        }, 
        [221] = {
            uncompressed_sample_offset = 4294967121, 
            section_number = 4294965637, 
            sequence_bytes = -584, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105239
        }, 
        [222] = {
            uncompressed_sample_offset = 4294967129, 
            section_number = 4294965541, 
            sequence_bytes = -186, 
            xuid_high = 13, 
            xuid_low = 420187, 
            tickcount = 105239
        }, 
        [223] = {
            uncompressed_sample_offset = 4294967123, 
            section_number = 4294965652, 
            sequence_bytes = -609, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105248
        }, 
        [224] = {
            uncompressed_sample_offset = 4294967129, 
            section_number = 4294965516, 
            sequence_bytes = -196, 
            xuid_high = 13, 
            xuid_low = 420187, 
            tickcount = 105248
        }, 
        [225] = {
            uncompressed_sample_offset = 47, 
            section_number = 4294966347, 
            sequence_bytes = 745, 
            xuid_high = 18, 
            xuid_low = 420187, 
            tickcount = 105248
        }, 
        [226] = {
            uncompressed_sample_offset = 4294967124, 
            section_number = 4294965544, 
            sequence_bytes = -397, 
            xuid_high = 1, 
            xuid_low = 420187, 
            tickcount = 105251
        }, 
        [227] = {
            uncompressed_sample_offset = 4294967136, 
            section_number = 4294965662, 
            sequence_bytes = -630, 
            xuid_high = 7, 
            xuid_low = 420187, 
            tickcount = 105251
        }, 
        [228] = {
            uncompressed_sample_offset = 4294967123, 
            section_number = 4294965657, 
            sequence_bytes = -619, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105251
        }, 
        [229] = {
            uncompressed_sample_offset = 4294967123, 
            section_number = 4294965529, 
            sequence_bytes = -400, 
            xuid_high = 1, 
            xuid_low = 420187, 
            tickcount = 105255
        }, 
        [230] = {
            uncompressed_sample_offset = 4294967151, 
            section_number = 4294965669, 
            sequence_bytes = -642, 
            xuid_high = 7, 
            xuid_low = 420187, 
            tickcount = 105255
        }, 
        [231] = {
            uncompressed_sample_offset = 4294967138, 
            section_number = 4294965662, 
            sequence_bytes = -631, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105255
        }, 
        [232] = {
            uncompressed_sample_offset = 4294967122, 
            section_number = 4294965517, 
            sequence_bytes = -401, 
            xuid_high = 1, 
            xuid_low = 420187, 
            tickcount = 105259
        }, 
        [233] = {
            uncompressed_sample_offset = 4294967162, 
            section_number = 4294965676, 
            sequence_bytes = -655, 
            xuid_high = 7, 
            xuid_low = 420187, 
            tickcount = 105259
        }, 
        [234] = {
            uncompressed_sample_offset = 4294967152, 
            section_number = 4294965670, 
            sequence_bytes = -643, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105259
        }, 
        [235] = {
            uncompressed_sample_offset = 4294967171, 
            section_number = 4294965684, 
            sequence_bytes = -668, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105267
        }, 
        [236] = {
            uncompressed_sample_offset = 64, 
            section_number = 4294966325, 
            sequence_bytes = 682, 
            xuid_high = 18, 
            xuid_low = 420187, 
            tickcount = 105267
        }, 
        [237] = {
            uncompressed_sample_offset = 4294967133, 
            section_number = 4294965460, 
            sequence_bytes = -188, 
            xuid_high = 20, 
            xuid_low = 420187, 
            tickcount = 105267
        }, 
        [238] = {
            uncompressed_sample_offset = 4294967120, 
            section_number = 4294965482, 
            sequence_bytes = -409, 
            xuid_high = 1, 
            xuid_low = 420187, 
            tickcount = 105271
        }, 
        [239] = {
            uncompressed_sample_offset = 4294967176, 
            section_number = 4294965692, 
            sequence_bytes = -683, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105271
        }, 
        [240] = {
            uncompressed_sample_offset = 4294967159, 
            section_number = 4294965437, 
            sequence_bytes = -199, 
            xuid_high = 13, 
            xuid_low = 420187, 
            tickcount = 105271
        }, 
        [241] = {
            uncompressed_sample_offset = 4294967176, 
            section_number = 4294965710, 
            sequence_bytes = -714, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105281
        }, 
        [242] = {
            uncompressed_sample_offset = 4294967104, 
            section_number = 4294966756, 
            sequence_bytes = 1170, 
            xuid_high = 25, 
            xuid_low = 420187, 
            tickcount = 105281
        }, 
        [243] = {
            uncompressed_sample_offset = 4294967175, 
            section_number = 4294965711, 
            sequence_bytes = -717, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105281
        }, 
        [244] = {
            uncompressed_sample_offset = 4294967117, 
            section_number = 4294965461, 
            sequence_bytes = -434, 
            xuid_high = 1, 
            xuid_low = 420187, 
            tickcount = 105283
        }, 
        [245] = {
            uncompressed_sample_offset = 4294967172, 
            section_number = 4294965717, 
            sequence_bytes = -726, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105283
        }, 
        [246] = {
            uncompressed_sample_offset = 4294967182, 
            section_number = 4294965394, 
            sequence_bytes = -207, 
            xuid_high = 13, 
            xuid_low = 420187, 
            tickcount = 105283
        }, 
        [247] = {
            uncompressed_sample_offset = 4294967170, 
            section_number = 4294965718, 
            sequence_bytes = -730, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105285
        }, 
        [248] = {
            uncompressed_sample_offset = 4294967170, 
            section_number = 4294965388, 
            sequence_bytes = -208, 
            xuid_high = 20, 
            xuid_low = 420187, 
            tickcount = 105285
        }, 
        [249] = {
            uncompressed_sample_offset = 4294967162, 
            section_number = 4294965725, 
            sequence_bytes = -745, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105287
        }, 
        [250] = {
            uncompressed_sample_offset = 4294967151, 
            section_number = 4294965732, 
            sequence_bytes = -761, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105293
        }, 
        [251] = {
            uncompressed_sample_offset = 4294967169, 
            section_number = 4294965355, 
            sequence_bytes = -230, 
            xuid_high = 20, 
            xuid_low = 420187, 
            tickcount = 105293
        }, 
        [252] = {
            uncompressed_sample_offset = 4294967149, 
            section_number = 4294965733, 
            sequence_bytes = -764, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105293
        }, 
        [253] = {
            uncompressed_sample_offset = 4294967135, 
            section_number = 4294965740, 
            sequence_bytes = -778, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105295
        }, 
        [254] = {
            uncompressed_sample_offset = 4294967180, 
            section_number = 4294965372, 
            sequence_bytes = -235, 
            xuid_high = 13, 
            xuid_low = 420187, 
            tickcount = 105295
        }, 
        [255] = {
            uncompressed_sample_offset = 4294967136, 
            section_number = 4294965747, 
            sequence_bytes = -794, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105300
        }, 
        [256] = {
            uncompressed_sample_offset = 4294967153, 
            section_number = 4294965321, 
            sequence_bytes = -253, 
            xuid_high = 20, 
            xuid_low = 420187, 
            tickcount = 105300
        }, 
        [257] = {
            uncompressed_sample_offset = 4294967140, 
            section_number = 4294965748, 
            sequence_bytes = -796, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105300
        }, 
        [258] = {
            uncompressed_sample_offset = 4294967117, 
            section_number = 4294965470, 
            sequence_bytes = -497, 
            xuid_high = 1, 
            xuid_low = 420187, 
            tickcount = 105304
        }, 
        [259] = {
            uncompressed_sample_offset = 112, 
            section_number = 253, 
            sequence_bytes = 157, 
            xuid_high = 5, 
            xuid_low = 420187, 
            tickcount = 105304
        }, 
        [260] = {
            uncompressed_sample_offset = 4294967151, 
            section_number = 4294965754, 
            sequence_bytes = -812, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105304
        }, 
        [261] = {
            uncompressed_sample_offset = 4294967117, 
            section_number = 4294965473, 
            sequence_bytes = -506, 
            xuid_high = 1, 
            xuid_low = 420187, 
            tickcount = 105308
        }, 
        [262] = {
            uncompressed_sample_offset = 4294967165, 
            section_number = 4294965766, 
            sequence_bytes = -840, 
            xuid_high = 7, 
            xuid_low = 420187, 
            tickcount = 105308
        }, 
        [263] = {
            uncompressed_sample_offset = 4294967160, 
            section_number = 4294965761, 
            sequence_bytes = -828, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105308
        }, 
        [264] = {
            uncompressed_sample_offset = 4294967117, 
            section_number = 4294965478, 
            sequence_bytes = -518, 
            xuid_high = 1, 
            xuid_low = 420187, 
            tickcount = 105312
        }, 
        [265] = {
            uncompressed_sample_offset = 4294967170, 
            section_number = 4294965774, 
            sequence_bytes = -858, 
            xuid_high = 7, 
            xuid_low = 420187, 
            tickcount = 105312
        }, 
        [266] = {
            uncompressed_sample_offset = 4294967167, 
            section_number = 4294965768, 
            sequence_bytes = -844, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105312
        }, 
        [267] = {
            uncompressed_sample_offset = 4294967117, 
            section_number = 4294965481, 
            sequence_bytes = -527, 
            xuid_high = 1, 
            xuid_low = 420187, 
            tickcount = 105315
        }, 
        [268] = {
            uncompressed_sample_offset = 4294967171, 
            section_number = 4294965783, 
            sequence_bytes = -875, 
            xuid_high = 7, 
            xuid_low = 420187, 
            tickcount = 105315
        }, 
        [269] = {
            uncompressed_sample_offset = 4294967170, 
            section_number = 4294965777, 
            sequence_bytes = -863, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105315
        }, 
        [270] = {
            uncompressed_sample_offset = 4294967171, 
            section_number = 4294965785, 
            sequence_bytes = -879, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105320
        }, 
        [271] = {
            uncompressed_sample_offset = 4294967139, 
            section_number = 4294965333, 
            sequence_bytes = -332, 
            xuid_high = 13, 
            xuid_low = 420187, 
            tickcount = 105320
        }, 
        [272] = {
            uncompressed_sample_offset = 4294967171, 
            section_number = 4294965787, 
            sequence_bytes = -882, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105320
        }, 
        [273] = {
            uncompressed_sample_offset = 4294967117, 
            section_number = 4294965487, 
            sequence_bytes = -553, 
            xuid_high = 1, 
            xuid_low = 420187, 
            tickcount = 105324
        }, 
        [274] = {
            uncompressed_sample_offset = 4294967164, 
            section_number = 4294965802, 
            sequence_bytes = -910, 
            xuid_high = 7, 
            xuid_low = 420187, 
            tickcount = 105324
        }, 
        [275] = {
            uncompressed_sample_offset = 4294967168, 
            section_number = 4294965796, 
            sequence_bytes = -898, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105324
        }, 
        [276] = {
            uncompressed_sample_offset = 4294967162, 
            section_number = 4294965805, 
            sequence_bytes = -915, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105329
        }, 
        [277] = {
            uncompressed_sample_offset = 4294967161, 
            section_number = 4294965807, 
            sequence_bytes = -918, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105329
        }, 
        [278] = {
            uncompressed_sample_offset = 4294967117, 
            section_number = 4294965486, 
            sequence_bytes = -574, 
            xuid_high = 1, 
            xuid_low = 420187, 
            tickcount = 105333
        }, 
        [279] = {
            uncompressed_sample_offset = 4294967154, 
            section_number = 4294965815, 
            sequence_bytes = -933, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105333
        }, 
        [280] = {
            uncompressed_sample_offset = 4294967162, 
            section_number = 4294965296, 
            sequence_bytes = -384, 
            xuid_high = 13, 
            xuid_low = 420187, 
            tickcount = 105333
        }, 
        [281] = {
            uncompressed_sample_offset = 4294967142, 
            section_number = 4294965825, 
            sequence_bytes = -951, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105337
        }, 
        [282] = {
            uncompressed_sample_offset = 4294967139, 
            section_number = 4294965826, 
            sequence_bytes = -955, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105337
        }, 
        [283] = {
            uncompressed_sample_offset = 4294967132, 
            section_number = 4294965836, 
            sequence_bytes = -972, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105339
        }, 
        [284] = {
            uncompressed_sample_offset = 4294967156, 
            section_number = 4294965215, 
            sequence_bytes = -402, 
            xuid_high = 20, 
            xuid_low = 420187, 
            tickcount = 105339
        }, 
        [285] = {
            uncompressed_sample_offset = 4294967144, 
            section_number = 4294965844, 
            sequence_bytes = -987, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105344
        }, 
        [286] = {
            uncompressed_sample_offset = 4294967156, 
            section_number = 4294965253, 
            sequence_bytes = -400, 
            xuid_high = 13, 
            xuid_low = 420187, 
            tickcount = 105344
        }, 
        [287] = {
            uncompressed_sample_offset = 4294967146, 
            section_number = 4294965846, 
            sequence_bytes = -989, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105344
        }, 
        [288] = {
            uncompressed_sample_offset = 4294967155, 
            section_number = 4294965853, 
            sequence_bytes = -1002, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105349
        }, 
        [289] = {
            uncompressed_sample_offset = 4294967134, 
            section_number = 4294965175, 
            sequence_bytes = -396, 
            xuid_high = 20, 
            xuid_low = 420187, 
            tickcount = 105349
        }, 
        [290] = {
            uncompressed_sample_offset = 4294967157, 
            section_number = 4294965854, 
            sequence_bytes = -1006, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105349
        }, 
        [291] = {
            uncompressed_sample_offset = 4294967164, 
            section_number = 4294965861, 
            sequence_bytes = -1019, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105353
        }, 
        [292] = {
            uncompressed_sample_offset = 4294967165, 
            section_number = 4294965863, 
            sequence_bytes = -1022, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105353
        }, 
        [293] = {
            uncompressed_sample_offset = 4294967169, 
            section_number = 4294965870, 
            sequence_bytes = -1036, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105356
        }, 
        [294] = {
            uncompressed_sample_offset = 4294967122, 
            section_number = 4294965194, 
            sequence_bytes = -403, 
            xuid_high = 13, 
            xuid_low = 420187, 
            tickcount = 105356
        }, 
        [295] = {
            uncompressed_sample_offset = 4294967132, 
            section_number = 4294965137, 
            sequence_bytes = -401, 
            xuid_high = 20, 
            xuid_low = 420187, 
            tickcount = 105356
        }, 
        [296] = {
            uncompressed_sample_offset = 4294967171, 
            section_number = 4294965880, 
            sequence_bytes = -1053, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105360
        }, 
        [297] = {
            uncompressed_sample_offset = 4294967141, 
            section_number = 4294965120, 
            sequence_bytes = -410, 
            xuid_high = 20, 
            xuid_low = 420187, 
            tickcount = 105360
        }, 
        [298] = {
            uncompressed_sample_offset = 4294967171, 
            section_number = 4294965881, 
            sequence_bytes = -1056, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105360
        }, 
        [299] = {
            uncompressed_sample_offset = 4294967171, 
            section_number = 4294965890, 
            sequence_bytes = -1070, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105363
        }, 
        [300] = {
            uncompressed_sample_offset = 4294967170, 
            section_number = 4294965892, 
            sequence_bytes = -1073, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105363
        }, 
        [301] = {
            uncompressed_sample_offset = 4294967166, 
            section_number = 4294965902, 
            sequence_bytes = -1087, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105368
        }, 
        [302] = {
            uncompressed_sample_offset = 4294967149, 
            section_number = 4294965138, 
            sequence_bytes = -394, 
            xuid_high = 13, 
            xuid_low = 420187, 
            tickcount = 105368
        }, 
        [303] = {
            uncompressed_sample_offset = 4294967158, 
            section_number = 4294965090, 
            sequence_bytes = -433, 
            xuid_high = 20, 
            xuid_low = 420187, 
            tickcount = 105368
        }, 
        [304] = {
            uncompressed_sample_offset = 4294967117, 
            section_number = 4294965400, 
            sequence_bytes = -598, 
            xuid_high = 1, 
            xuid_low = 420187, 
            tickcount = 105371
        }, 
        [305] = {
            uncompressed_sample_offset = 4294967152, 
            section_number = 4294965922, 
            sequence_bytes = -1116, 
            xuid_high = 7, 
            xuid_low = 420187, 
            tickcount = 105371
        }, 
        [306] = {
            uncompressed_sample_offset = 4294967161, 
            section_number = 4294965911, 
            sequence_bytes = -1101, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105371
        }, 
        [307] = {
            uncompressed_sample_offset = 4294967117, 
            section_number = 4294965398, 
            sequence_bytes = -592, 
            xuid_high = 1, 
            xuid_low = 420187, 
            tickcount = 105376
        }, 
        [308] = {
            uncompressed_sample_offset = 4294967140, 
            section_number = 4294965935, 
            sequence_bytes = -1132, 
            xuid_high = 7, 
            xuid_low = 420187, 
            tickcount = 105376
        }, 
        [309] = {
            uncompressed_sample_offset = 4294967151, 
            section_number = 4294965924, 
            sequence_bytes = -1118, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105376
        }, 
        [310] = {
            uncompressed_sample_offset = 4294967117, 
            section_number = 4294965397, 
            sequence_bytes = -589, 
            xuid_high = 1, 
            xuid_low = 420187, 
            tickcount = 105380
        }, 
        [311] = {
            uncompressed_sample_offset = 4294967133, 
            section_number = 4294965949, 
            sequence_bytes = -1147, 
            xuid_high = 7, 
            xuid_low = 420187, 
            tickcount = 105380
        }, 
        [312] = {
            uncompressed_sample_offset = 4294967136, 
            section_number = 4294965939, 
            sequence_bytes = -1137, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105380
        }, 
        [313] = {
            uncompressed_sample_offset = 4294967117, 
            section_number = 4294965394, 
            sequence_bytes = -581, 
            xuid_high = 1, 
            xuid_low = 420187, 
            tickcount = 105384
        }, 
        [314] = {
            uncompressed_sample_offset = 4294967147, 
            section_number = 4294965964, 
            sequence_bytes = -1158, 
            xuid_high = 7, 
            xuid_low = 420187, 
            tickcount = 105384
        }, 
        [315] = {
            uncompressed_sample_offset = 4294967137, 
            section_number = 4294965954, 
            sequence_bytes = -1151, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105384
        }, 
        [316] = {
            uncompressed_sample_offset = 4294967117, 
            section_number = 4294965390, 
            sequence_bytes = -573, 
            xuid_high = 1, 
            xuid_low = 420187, 
            tickcount = 105387
        }, 
        [317] = {
            uncompressed_sample_offset = 4294967158, 
            section_number = 4294965979, 
            sequence_bytes = -1168, 
            xuid_high = 7, 
            xuid_low = 420187, 
            tickcount = 105387
        }, 
        [318] = {
            uncompressed_sample_offset = 4294967150, 
            section_number = 4294965968, 
            sequence_bytes = -1161, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105387
        }, 
        [319] = {
            uncompressed_sample_offset = 4294967165, 
            section_number = 4294965996, 
            sequence_bytes = -1177, 
            xuid_high = 7, 
            xuid_low = 420187, 
            tickcount = 105393
        }, 
        [320] = {
            uncompressed_sample_offset = 4294967160, 
            section_number = 4294965985, 
            sequence_bytes = -1171, 
            xuid_high = 8, 
            xuid_low = 420187, 
            tickcount = 105393
        }, 
        [321] = {
            uncompressed_sample_offset = 4294967134, 
            section_number = 4294965062, 
            sequence_bytes = -451, 
            xuid_high = 13, 
            xuid_low = 420187, 
            tickcount = 105393
        }
    }, 
    Fatality = {
        [1] = {
            uncompressed_sample_offset = 1115688960, 
            section_number = 3263291604, 
            sequence_bytes = -1000118690, 
            xuid_high = 95495, 
            xuid_low = 682524666, 
            tickcount = 95499
        }, 
        [2] = {
            uncompressed_sample_offset = 1120607216, 
            section_number = 1116114317, 
            sequence_bytes = -1000603354, 
            xuid_high = 95495, 
            xuid_low = 682000378, 
            tickcount = 95499
        }, 
        [3] = {
            uncompressed_sample_offset = 3279943680, 
            section_number = 3297470449, 
            sequence_bytes = -998113024, 
            xuid_high = 95496, 
            xuid_low = 683442170, 
            tickcount = 95500
        }, 
        [4] = {
            uncompressed_sample_offset = 1115688960, 
            section_number = 3263291604, 
            sequence_bytes = -1000118690, 
            xuid_high = 95496, 
            xuid_low = 682524666, 
            tickcount = 95500
        }, 
        [5] = {
            uncompressed_sample_offset = 1120190520, 
            section_number = 1116144958, 
            sequence_bytes = -1000603354, 
            xuid_high = 95496, 
            xuid_low = 682000378, 
            tickcount = 95500
        }
    }, 
    Nixware = {
        [1] = {
            uncompressed_sample_offset = 2974822910, 
            section_number = 3650207471, 
            sequence_bytes = 59832833, 
            xuid_high = 0, 
            xuid_low = 3355443654, 
            tickcount = 58204
        }, 
        [2] = {
            uncompressed_sample_offset = 900759678, 
            section_number = 814923503, 
            sequence_bytes = -66743538, 
            xuid_high = 0, 
            xuid_low = 104857614, 
            tickcount = 58208
        }, 
        [3] = {
            uncompressed_sample_offset = 2998929883, 
            section_number = 2878652143, 
            sequence_bytes = -2102494713, 
            xuid_high = 0, 
            xuid_low = 3355443656, 
            tickcount = 58461
        }, 
        [4] = {
            uncompressed_sample_offset = 3227519130, 
            section_number = 3449274095, 
            sequence_bytes = 1091269901, 
            xuid_high = 0, 
            xuid_low = 3355443656, 
            tickcount = 58467
        }, 
        [5] = {
            uncompressed_sample_offset = 3455074232, 
            section_number = 3348676335, 
            sequence_bytes = -1023970560, 
            xuid_high = 0, 
            xuid_low = 3355443656, 
            tickcount = 58473
        }, 
        [6] = {
            uncompressed_sample_offset = 3656400824, 
            section_number = 429506287, 
            sequence_bytes = 1123614219, 
            xuid_high = 0, 
            xuid_low = 3355443656, 
            tickcount = 58480
        }, 
        [7] = {
            uncompressed_sample_offset = 3816817503, 
            section_number = 731561711, 
            sequence_bytes = -1023380729, 
            xuid_high = 0, 
            xuid_low = 3355443656, 
            tickcount = 58486
        }, 
        [8] = {
            uncompressed_sample_offset = 4126162877, 
            section_number = 964738799, 
            sequence_bytes = 1146156805, 
            xuid_high = 0, 
            xuid_low = 3355443656, 
            tickcount = 58494
        }, 
        [9] = {
            uncompressed_sample_offset = 1528837560, 
            section_number = 3078733551, 
            sequence_bytes = -2116065527, 
            xuid_high = 0, 
            xuid_low = 3355443657, 
            tickcount = 58547
        }, 
        [10] = {
            uncompressed_sample_offset = 1777352635, 
            section_number = 2105851631, 
            sequence_bytes = -1026986489, 
            xuid_high = 0, 
            xuid_low = 3355443657, 
            tickcount = 58553
        }, 
        [11] = {
            uncompressed_sample_offset = 1923097788, 
            section_number = 1837547247, 
            sequence_bytes = -2091881964, 
            xuid_high = 0, 
            xuid_low = 3355443657, 
            tickcount = 58557
        }, 
        [12] = {
            uncompressed_sample_offset = 1275068616, 
            section_number = 1065860847, 
            sequence_bytes = -1071914746, 
            xuid_high = 0, 
            xuid_low = 104857614, 
            tickcount = 58563
        }, 
        [13] = {
            uncompressed_sample_offset = 119943255, 
            section_number = 1166589679, 
            sequence_bytes = -1016173303, 
            xuid_high = 0, 
            xuid_low = 204800, 
            tickcount = 58569
        }, 
        [14] = {
            uncompressed_sample_offset = 119953495, 
            section_number = 1233764079, 
            sequence_bytes = 1080653569, 
            xuid_high = 0, 
            xuid_low = 204800, 
            tickcount = 58576
        }, 
        [15] = {
            uncompressed_sample_offset = 119963733, 
            section_number = 2106244847, 
            sequence_bytes = -2100267264, 
            xuid_high = 0, 
            xuid_low = 204800, 
            tickcount = 58582
        }, 
        [16] = {
            uncompressed_sample_offset = 2886733791, 
            section_number = 3180117743, 
            sequence_bytes = 1079764749, 
            xuid_high = 0, 
            xuid_low = 3355443657, 
            tickcount = 58588
        }, 
        [17] = {
            uncompressed_sample_offset = 119988305, 
            section_number = 2978922223, 
            sequence_bytes = -1037010939, 
            xuid_high = 0, 
            xuid_low = 106496, 
            tickcount = 58594
        }, 
        [18] = {
            uncompressed_sample_offset = 1311736317, 
            section_number = 1217380079, 
            sequence_bytes = -937972981, 
            xuid_high = 0, 
            xuid_low = 104857614, 
            tickcount = 58600
        }, 
        [19] = {
            uncompressed_sample_offset = 3524267992, 
            section_number = 764591855, 
            sequence_bytes = -2135720178, 
            xuid_high = 0, 
            xuid_low = 3355443657, 
            tickcount = 58607
        }, 
        [20] = {
            uncompressed_sample_offset = 3719300507, 
            section_number = 3180642031, 
            sequence_bytes = -1039900415, 
            xuid_high = 0, 
            xuid_low = 905970121, 
            tickcount = 58611
        }, 
        [21] = {
            uncompressed_sample_offset = 1331693451, 
            section_number = 1905770223, 
            sequence_bytes = -2111146489, 
            xuid_high = 0, 
            xuid_low = 104857614, 
            tickcount = 58618
        }, 
        [22] = {
            uncompressed_sample_offset = 1337164215, 
            section_number = 1771618031, 
            sequence_bytes = -1027000317, 
            xuid_high = 0, 
            xuid_low = 104857614, 
            tickcount = 58623
        }, 
        [23] = {
            uncompressed_sample_offset = 99631032, 
            section_number = 429506287, 
            sequence_bytes = -2097611509, 
            xuid_high = 0, 
            xuid_low = 3355443658, 
            tickcount = 58630
        }, 
        [24] = {
            uncompressed_sample_offset = 120078419, 
            section_number = 1603976943, 
            sequence_bytes = -2097191929, 
            xuid_high = 0, 
            xuid_low = 204800, 
            tickcount = 58636
        }, 
        [25] = {
            uncompressed_sample_offset = 468729785, 
            section_number = 1031847663, 
            sequence_bytes = -2078744315, 
            xuid_high = 0, 
            xuid_low = 3355443658, 
            tickcount = 58641
        }, 
        [26] = {
            uncompressed_sample_offset = 701512511, 
            section_number = 931249903, 
            sequence_bytes = -2105644285, 
            xuid_high = 0, 
            xuid_low = 3355443658, 
            tickcount = 58648
        }, 
        [27] = {
            uncompressed_sample_offset = 837828542, 
            section_number = 965000943, 
            sequence_bytes = 34955783, 
            xuid_high = 0, 
            xuid_low = 3355443658, 
            tickcount = 58653
        }, 
        [28] = {
            uncompressed_sample_offset = 1077938203, 
            section_number = 3515268847, 
            sequence_bytes = 33846803, 
            xuid_high = 0, 
            xuid_low = 3355443658, 
            tickcount = 58660
        }, 
        [29] = {
            uncompressed_sample_offset = 120135762, 
            section_number = 3750215407, 
            sequence_bytes = -2145616892, 
            xuid_high = 0, 
            xuid_low = 204800, 
            tickcount = 58666
        }, 
        [30] = {
            uncompressed_sample_offset = 120148054, 
            section_number = 3179855599, 
            sequence_bytes = 59076870, 
            xuid_high = 0, 
            xuid_low = 73728, 
            tickcount = 58672
        }, 
        [31] = {
            uncompressed_sample_offset = 120160343, 
            section_number = 462012143, 
            sequence_bytes = -1053589759, 
            xuid_high = 0, 
            xuid_low = 204800, 
            tickcount = 58678
        }, 
        [32] = {
            uncompressed_sample_offset = 120172631, 
            section_number = 696958703, 
            sequence_bytes = -2093449983, 
            xuid_high = 0, 
            xuid_low = 204800, 
            tickcount = 58684
        }, 
        [33] = {
            uncompressed_sample_offset = 1405094671, 
            section_number = 3582770927, 
            sequence_bytes = -2131629555, 
            xuid_high = 0, 
            xuid_low = 104857614, 
            tickcount = 58690
        }, 
        [34] = {
            uncompressed_sample_offset = 1412399613, 
            section_number = 1217380079, 
            sequence_bytes = -937972981, 
            xuid_high = 0, 
            xuid_low = 104857614, 
            tickcount = 58696
        }, 
        [35] = {
            uncompressed_sample_offset = 2450526168, 
            section_number = 764591855, 
            sequence_bytes = -2135720178, 
            xuid_high = 0, 
            xuid_low = 3355443658, 
            tickcount = 58701
        }, 
        [36] = {
            uncompressed_sample_offset = 120223826, 
            section_number = 3616980719, 
            sequence_bytes = 1099817216, 
            xuid_high = 0, 
            xuid_low = 204800, 
            tickcount = 58707
        }, 
        [37] = {
            uncompressed_sample_offset = 120236115, 
            section_number = 228048623, 
            sequence_bytes = -2108723193, 
            xuid_high = 0, 
            xuid_low = 204800, 
            tickcount = 58714
        }, 
        [38] = {
            uncompressed_sample_offset = 3085975487, 
            section_number = 1100529391, 
            sequence_bytes = -1028162298, 
            xuid_high = 0, 
            xuid_low = 3355443658, 
            tickcount = 58719
        }, 
        [39] = {
            uncompressed_sample_offset = 3320856504, 
            section_number = 429506287, 
            sequence_bytes = -2097611253, 
            xuid_high = 0, 
            xuid_low = 3355443658, 
            tickcount = 58726
        }, 
        [40] = {
            uncompressed_sample_offset = 120270930, 
            section_number = 1603976943, 
            sequence_bytes = -1023450105, 
            xuid_high = 0, 
            xuid_low = 204800, 
            tickcount = 58731
        }, 
        [41] = {
            uncompressed_sample_offset = 3689955262, 
            section_number = 3850419951, 
            sequence_bytes = -1001132539, 
            xuid_high = 0, 
            xuid_low = 1711276490, 
            tickcount = 58737
        }, 
        [42] = {
            uncompressed_sample_offset = 3924836287, 
            section_number = 495042287, 
            sequence_bytes = 1108566274, 
            xuid_high = 0, 
            xuid_low = 3355443658, 
            tickcount = 58743
        }, 
        [43] = {
            uncompressed_sample_offset = 4092608442, 
            section_number = 3582246639, 
            sequence_bytes = 86303244, 
            xuid_high = 0, 
            xuid_low = 3355443658, 
            tickcount = 58749
        }, 
        [44] = {
            uncompressed_sample_offset = 4289726878, 
            section_number = 2709962479, 
            sequence_bytes = 1108309006, 
            xuid_high = 0, 
            xuid_low = 3355443658, 
            tickcount = 58755
        }, 
        [45] = {
            uncompressed_sample_offset = 120334417, 
            section_number = 4018650863, 
            sequence_bytes = -2146571519, 
            xuid_high = 0, 
            xuid_low = 204800, 
            tickcount = 58761
        }, 
        [46] = {
            uncompressed_sample_offset = 376443482, 
            section_number = 562609903, 
            sequence_bytes = -1060372722, 
            xuid_high = 0, 
            xuid_low = 3355443659, 
            tickcount = 58767
        }, 
        [47] = {
            uncompressed_sample_offset = 120361046, 
            section_number = 2844442351, 
            sequence_bytes = -1017678847, 
            xuid_high = 0, 
            xuid_low = 204800, 
            tickcount = 58773
        }, 
        [48] = {
            uncompressed_sample_offset = 120373333, 
            section_number = 160218863, 
            sequence_bytes = 1096285196, 
            xuid_high = 0, 
            xuid_low = 204800, 
            tickcount = 58780
        }, 
        [49] = {
            uncompressed_sample_offset = 1274036158, 
            section_number = 4186947311, 
            sequence_bytes = 49576714, 
            xuid_high = 0, 
            xuid_low = 3355443659, 
            tickcount = 58794
        }, 
        [50] = {
            uncompressed_sample_offset = 1519419518, 
            section_number = 814923503, 
            sequence_bytes = -1039820018, 
            xuid_high = 0, 
            xuid_low = 104857614, 
            tickcount = 58798
        }, 
        [51] = {
            uncompressed_sample_offset = 120416343, 
            section_number = 93765359, 
            sequence_bytes = -1066338560, 
            xuid_high = 0, 
            xuid_low = 204800, 
            tickcount = 58800
        }, 
        [52] = {
            uncompressed_sample_offset = 1808794143, 
            section_number = 3449274095, 
            sequence_bytes = -2107807740, 
            xuid_high = 0, 
            xuid_low = 3355443659, 
            tickcount = 58810
        }, 
        [53] = {
            uncompressed_sample_offset = 2146451391, 
            section_number = 2509815535, 
            sequence_bytes = -2100073211, 
            xuid_high = 0, 
            xuid_low = 3355443659, 
            tickcount = 58818
        }, 
        [54] = {
            uncompressed_sample_offset = 2213560248, 
            section_number = 429506287, 
            sequence_bytes = 1123614219, 
            xuid_high = 0, 
            xuid_low = 3355443659, 
            tickcount = 58822
        }, 
        [55] = {
            uncompressed_sample_offset = 3195013592, 
            section_number = 3147480815, 
            sequence_bytes = -2106758908, 
            xuid_high = 0, 
            xuid_low = 3355443660, 
            tickcount = 58983
        }, 
        [56] = {
            uncompressed_sample_offset = 1719599605, 
            section_number = 1937817327, 
            sequence_bytes = -999441660, 
            xuid_high = 0, 
            xuid_low = 53477390, 
            tickcount = 58989
        }, 
        [57] = {
            uncompressed_sample_offset = 3815782778, 
            section_number = 2776743663, 
            sequence_bytes = -1027966200, 
            xuid_high = 0, 
            xuid_low = 3355443660, 
            tickcount = 58999
        }, 
        [58] = {
            uncompressed_sample_offset = 4154470969, 
            section_number = 1770307311, 
            sequence_bytes = -995295997, 
            xuid_high = 0, 
            xuid_low = 3355443660, 
            tickcount = 59007
        }, 
        [59] = {
            uncompressed_sample_offset = 1888358, 
            section_number = 2407907055, 
            sequence_bytes = -2130122742, 
            xuid_high = 0, 
            xuid_low = 3200, 
            tickcount = 59016
        }, 
        [60] = {
            uncompressed_sample_offset = 120875094, 
            section_number = 1904656111, 
            sequence_bytes = 1125147405, 
            xuid_high = 0, 
            xuid_low = 61440, 
            tickcount = 59026
        }, 
        [61] = {
            uncompressed_sample_offset = 676333279, 
            section_number = 2911354607, 
            sequence_bytes = -2113701630, 
            xuid_high = 0, 
            xuid_low = 3355443661, 
            tickcount = 59035
        }, 
        [62] = {
            uncompressed_sample_offset = 120914007, 
            section_number = 965263087, 
            sequence_bytes = 1109778697, 
            xuid_high = 0, 
            xuid_low = 204800, 
            tickcount = 59043
        }, 
        [63] = {
            uncompressed_sample_offset = 1344286908, 
            section_number = 294239983, 
            sequence_bytes = 1102146572, 
            xuid_high = 0, 
            xuid_low = 3355443661, 
            tickcount = 59052
        }, 
        [64] = {
            uncompressed_sample_offset = 1676689339, 
            section_number = 1804254959, 
            sequence_bytes = 78409743, 
            xuid_high = 0, 
            xuid_low = 3355443661, 
            tickcount = 59061
        }, 
        [65] = {
            uncompressed_sample_offset = 1807712765, 
            section_number = 1653325551, 
            sequence_bytes = -434238702, 
            xuid_high = 0, 
            xuid_low = 104857614, 
            tickcount = 59070
        }, 
        [66] = {
            uncompressed_sample_offset = 2280654781, 
            section_number = 3649879791, 
            sequence_bytes = -1050578662, 
            xuid_high = 0, 
            xuid_low = 3355443661, 
            tickcount = 59079
        }, 
        [67] = {
            uncompressed_sample_offset = 2566915387, 
            section_number = 193838831, 
            sequence_bytes = -2122224359, 
            xuid_high = 0, 
            xuid_low = 3355443661, 
            tickcount = 59088
        }, 
        [68] = {
            uncompressed_sample_offset = 2884648892, 
            section_number = 3381640943, 
            sequence_bytes = 1148610056, 
            xuid_high = 0, 
            xuid_low = 3355443661, 
            tickcount = 59097
        }, 
        [69] = {
            uncompressed_sample_offset = 1843429502, 
            section_number = 814923503, 
            sequence_bytes = -1039820018, 
            xuid_high = 0, 
            xuid_low = 104857614, 
            tickcount = 59107
        }, 
        [70] = {
            uncompressed_sample_offset = 121059413, 
            section_number = 496418543, 
            sequence_bytes = -2143722492, 
            xuid_high = 0, 
            xuid_low = 204800, 
            tickcount = 59115
        }, 
        [71] = {
            uncompressed_sample_offset = 3788520060, 
            section_number = 228048623, 
            sequence_bytes = 1078686471, 
            xuid_high = 0, 
            xuid_low = 3355443661, 
            tickcount = 59125
        }, 
        [72] = {
            uncompressed_sample_offset = 4025499576, 
            section_number = 429506287, 
            sequence_bytes = 1123614219, 
            xuid_high = 0, 
            xuid_low = 3355443661, 
            tickcount = 59133
        }, 
        [73] = {
            uncompressed_sample_offset = 69208796, 
            section_number = 161136367, 
            sequence_bytes = 42105605, 
            xuid_high = 0, 
            xuid_low = 3355443662, 
            tickcount = 59142
        }, 
        [74] = {
            uncompressed_sample_offset = 1891172839, 
            section_number = 713080559, 
            sequence_bytes = -400212209, 
            xuid_high = 0, 
            xuid_low = 53477390, 
            tickcount = 59151
        }, 
        [75] = {
            uncompressed_sample_offset = 703610812, 
            section_number = 2072297199, 
            sequence_bytes = -2069758205, 
            xuid_high = 0, 
            xuid_low = 3355443662, 
            tickcount = 59160
        }, 
        [76] = {
            uncompressed_sample_offset = 948963933, 
            section_number = 3146104559, 
            sequence_bytes = -1073579770, 
            xuid_high = 0, 
            xuid_low = 3355443662, 
            tickcount = 59170
        }, 
        [77] = {
            uncompressed_sample_offset = 121190485, 
            section_number = 2508701423, 
            sequence_bytes = 1117616133, 
            xuid_high = 0, 
            xuid_low = 204800, 
            tickcount = 59178
        }, 
        [78] = {
            uncompressed_sample_offset = 1609566136, 
            section_number = 3448291055, 
            sequence_bytes = -1047597028, 
            xuid_high = 0, 
            xuid_low = 3355443662, 
            tickcount = 59187
        }, 
        [79] = {
            uncompressed_sample_offset = 1913666619, 
            section_number = 629784303, 
            sequence_bytes = 1121349639, 
            xuid_high = 0, 
            xuid_low = 3355443662, 
            tickcount = 59196
        }, 
        [80] = {
            uncompressed_sample_offset = 2485135228, 
            section_number = 4220174063, 
            sequence_bytes = 55934224, 
            xuid_high = 0, 
            xuid_low = 3355443665, 
            tickcount = 59598
        }, 
        [81] = {
            uncompressed_sample_offset = 2369749501, 
            section_number = 1653325551, 
            sequence_bytes = -434238702, 
            xuid_high = 0, 
            xuid_low = 104857614, 
            tickcount = 59607
        }, 
        [82] = {
            uncompressed_sample_offset = 122177621, 
            section_number = 864927471, 
            sequence_bytes = 1103066382, 
            xuid_high = 0, 
            xuid_low = 204800, 
            tickcount = 59661
        }
    }, 
    Airflow = {
        [1] = {
            uncompressed_sample_offset = 100, 
            section_number = 100, 
            sequence_bytes = -9897583, 
            xuid_high = 4287703555, 
            xuid_low = 3735943921, 
            tickcount = 26015
        }, 
        [2] = {
            uncompressed_sample_offset = 511, 
            section_number = 511, 
            sequence_bytes = -1, 
            xuid_high = 4294965507, 
            xuid_low = 3735924721, 
            tickcount = 26015
        }, 
        [3] = {
            uncompressed_sample_offset = 100, 
            section_number = 100, 
            sequence_bytes = -13632949, 
            xuid_high = 4191516677, 
            xuid_low = 3735943921, 
            tickcount = 26015
        }, 
        [4] = {
            uncompressed_sample_offset = 100, 
            section_number = 100, 
            sequence_bytes = -10880636, 
            xuid_high = 4286917123, 
            xuid_low = 3735943921, 
            tickcount = 26019
        }, 
        [5] = {
            uncompressed_sample_offset = 511, 
            section_number = 511, 
            sequence_bytes = -1, 
            xuid_high = 4294965507, 
            xuid_low = 3735924721, 
            tickcount = 26019
        }, 
        [6] = {
            uncompressed_sample_offset = 100, 
            section_number = 100, 
            sequence_bytes = -7472743, 
            xuid_high = 4289327620, 
            xuid_low = 3735943921, 
            tickcount = 26019
        }, 
        [7] = {
            uncompressed_sample_offset = 100, 
            section_number = 100, 
            sequence_bytes = -9963142, 
            xuid_high = 4285934083, 
            xuid_low = 3735943921, 
            tickcount = 26023
        }, 
        [8] = {
            uncompressed_sample_offset = 511, 
            section_number = 511, 
            sequence_bytes = -1, 
            xuid_high = 4294965507, 
            xuid_low = 3735924721, 
            tickcount = 26023
        }, 
        [9] = {
            uncompressed_sample_offset = 100, 
            section_number = 100, 
            sequence_bytes = -13895119, 
            xuid_high = 4192596485, 
            xuid_low = 3735943921, 
            tickcount = 26023
        }, 
        [10] = {
            uncompressed_sample_offset = 100, 
            section_number = 100, 
            sequence_bytes = -9176717, 
            xuid_high = 4284819971, 
            xuid_low = 3735943921, 
            tickcount = 26025
        }, 
        [11] = {
            uncompressed_sample_offset = 511, 
            section_number = 511, 
            sequence_bytes = -1, 
            xuid_high = 4294965507, 
            xuid_low = 3735924721, 
            tickcount = 26025
        }, 
        [12] = {
            uncompressed_sample_offset = 100, 
            section_number = 100, 
            sequence_bytes = -14288348, 
            xuid_high = 4193147141, 
            xuid_low = 3735943921, 
            tickcount = 26025
        }, 
        [13] = {
            uncompressed_sample_offset = 100, 
            section_number = 100, 
            sequence_bytes = -8914575, 
            xuid_high = 4284295683, 
            xuid_low = 3735943921, 
            tickcount = 26030
        }, 
        [14] = {
            uncompressed_sample_offset = 511, 
            section_number = 511, 
            sequence_bytes = -1, 
            xuid_high = 4294965507, 
            xuid_low = 3735924721, 
            tickcount = 26030
        }, 
        [15] = {
            uncompressed_sample_offset = 100, 
            section_number = 100, 
            sequence_bytes = -14616034, 
            xuid_high = 4193528069, 
            xuid_low = 3735943921, 
            tickcount = 26030
        }, 
        [16] = {
            uncompressed_sample_offset = 100, 
            section_number = 100, 
            sequence_bytes = 9632980, 
            xuid_high = 4187171330, 
            xuid_low = 3735943921, 
            tickcount = 26034
        }, 
        [17] = {
            uncompressed_sample_offset = 511, 
            section_number = 511, 
            sequence_bytes = -1, 
            xuid_high = 4294966274, 
            xuid_low = 3735924721, 
            tickcount = 26034
        }, 
        [18] = {
            uncompressed_sample_offset = 100, 
            section_number = 100, 
            sequence_bytes = -8783521, 
            xuid_high = 4287585284, 
            xuid_low = 3735943921, 
            tickcount = 26034
        }, 
        [19] = {
            uncompressed_sample_offset = 100, 
            section_number = 100, 
            sequence_bytes = 3800089, 
            xuid_high = 47458817, 
            xuid_low = 3735943921, 
            tickcount = 26038
        }, 
        [20] = {
            uncompressed_sample_offset = 511, 
            section_number = 511, 
            sequence_bytes = -1, 
            xuid_high = 4294966273, 
            xuid_low = 3735924721, 
            tickcount = 26038
        }, 
        [21] = {
            uncompressed_sample_offset = 100, 
            section_number = 100, 
            sequence_bytes = 10026196, 
            xuid_high = 4188416514, 
            xuid_low = 3735943921, 
            tickcount = 26038
        }, 
        [22] = {
            uncompressed_sample_offset = 100, 
            section_number = 100, 
            sequence_bytes = 10222803, 
            xuid_high = 4189596162, 
            xuid_low = 3735943921, 
            tickcount = 26040
        }, 
        [23] = {
            uncompressed_sample_offset = 511, 
            section_number = 511, 
            sequence_bytes = -1, 
            xuid_high = 4294966274, 
            xuid_low = 3735924721, 
            tickcount = 26040
        }, 
        [24] = {
            uncompressed_sample_offset = 100, 
            section_number = 100, 
            sequence_bytes = -10879380, 
            xuid_high = 84303368, 
            xuid_low = 3735943921, 
            tickcount = 26040
        }, 
        [25] = {
            uncompressed_sample_offset = 100, 
            section_number = 100, 
            sequence_bytes = 10288338, 
            xuid_high = 4190185986, 
            xuid_low = 3735943921, 
            tickcount = 26045
        }, 
        [26] = {
            uncompressed_sample_offset = 511, 
            section_number = 511, 
            sequence_bytes = -1, 
            xuid_high = 4294966274, 
            xuid_low = 3735924721, 
            tickcount = 26045
        }, 
        [27] = {
            uncompressed_sample_offset = 100, 
            section_number = 100, 
            sequence_bytes = -10879381, 
            xuid_high = 84303368, 
            xuid_low = 3735943921, 
            tickcount = 26045
        }, 
        [28] = {
            uncompressed_sample_offset = 100, 
            section_number = 100, 
            sequence_bytes = -8717982, 
            xuid_high = 4278135299, 
            xuid_low = 3735943921, 
            tickcount = 26049
        }, 
        [29] = {
            uncompressed_sample_offset = 511, 
            section_number = 511, 
            sequence_bytes = -1, 
            xuid_high = 4294965507, 
            xuid_low = 3735924721, 
            tickcount = 26049
        }, 
        [30] = {
            uncompressed_sample_offset = 100, 
            section_number = 100, 
            sequence_bytes = -15271473, 
            xuid_high = 4193221637, 
            xuid_low = 3735943921, 
            tickcount = 26049
        }, 
        [31] = {
            uncompressed_sample_offset = 100, 
            section_number = 100, 
            sequence_bytes = -9307809, 
            xuid_high = 4276824579, 
            xuid_low = 3735943921, 
            tickcount = 26053
        }, 
        [32] = {
            uncompressed_sample_offset = 511, 
            section_number = 511, 
            sequence_bytes = -1, 
            xuid_high = 4294965507, 
            xuid_low = 3735924721, 
            tickcount = 26053
        }, 
        [33] = {
            uncompressed_sample_offset = 100, 
            section_number = 100, 
            sequence_bytes = -14747201, 
            xuid_high = 4192603909, 
            xuid_low = 3735943921, 
            tickcount = 26053
        }, 
        [34] = {
            uncompressed_sample_offset = 100, 
            section_number = 100, 
            sequence_bytes = -10094244, 
            xuid_high = 4275579395, 
            xuid_low = 3735943921, 
            tickcount = 26055
        }, 
        [35] = {
            uncompressed_sample_offset = 511, 
            section_number = 511, 
            sequence_bytes = -1, 
            xuid_high = 4294965507, 
            xuid_low = 3735924721, 
            tickcount = 26055
        }, 
        [36] = {
            uncompressed_sample_offset = 100, 
            section_number = 100, 
            sequence_bytes = -14485073, 
            xuid_high = 4192073221, 
            xuid_low = 3735943921, 
            tickcount = 26055
        }, 
        [37] = {
            uncompressed_sample_offset = 100, 
            section_number = 100, 
            sequence_bytes = -10552997, 
            xuid_high = 4274924035, 
            xuid_low = 3735943921, 
            tickcount = 26060
        }, 
        [38] = {
            uncompressed_sample_offset = 511, 
            section_number = 511, 
            sequence_bytes = -1, 
            xuid_high = 4294965507, 
            xuid_low = 3735924721, 
            tickcount = 26060
        }, 
        [39] = {
            uncompressed_sample_offset = 100, 
            section_number = 100, 
            sequence_bytes = -14419545, 
            xuid_high = 4191772677, 
            xuid_low = 3735943921, 
            tickcount = 26060
        }
    }
};
v37.delta_packet = 0;
v37.cheat_spoof = function()
    -- upvalues: v37 (ref), v117 (ref), l_abs_0 (ref), v43 (ref), l_insert_0 (ref), l_random_0 (ref), v62 (ref), l_floor_0 (ref)
    if v37.spoof_tickcount == globals.tickcount then
        return;
    else
        v37.spoof_tickcount = globals.tickcount;
        local l_str_value_2 = v117.ui_tables.visuals.spoofer_list.str_value;
        if not l_str_value_2 or v37.cclientstate.net_channel == 0 then
            return;
        else
            if l_abs_0(v37.tick_delay - globals.tickcount) > v37.delta_packet then
                local l_l_str_value_2_0 = l_str_value_2;
                local v1407 = v37.cheats_data[l_l_str_value_2_0];
                if not v1407 then
                    return;
                else
                    if v37.packets[l_l_str_value_2_0] then
                        if #v37.packets[l_l_str_value_2_0] < v37.packet_counter then
                            v37.packet_counter = 1;
                        end;
                        v1407 = v37.packets[l_l_str_value_2_0][v37.packet_counter];
                    end;
                    if l_l_str_value_2_0 ~= "Disabled" then
                        v43.shared_esp:override(false);
                    else
                        v43.shared_esp:override();
                    end;
                    v37.packet_counter = v37.packet_counter + 1;
                    if v37.packets[l_l_str_value_2_0] and v37.packet_counter > #v37.packets[l_l_str_value_2_0] then
                        v37.packet_counter = 1;
                    end;
                    if l_l_str_value_2_0 == "Pandora" then
                        local v1408 = entity.get_players();
                        local v1409 = {};
                        for v1410 = 1, #v1408 do
                            if v1408[v1410]:is_alive() then
                                l_insert_0(v1409, 1, v1408[v1410]);
                            end;
                        end;
                        local v1411 = entity.get(v1409[math.random(1, #v1409)]);
                        if not v1411 or not v1411:is_alive() then
                            return;
                        else
                            local v1412 = ffi.new("pandora_data_t");
                            v1412.pandora_id = 420187;
                            v1412.entity_id = v1411:get_index();
                            local v1413 = ffi.new("vector_t");
                            local v1414 = l_random_0(-2000, 2000);
                            local v1415 = l_random_0(-2000, 2000);
                            v1413.z = l_random_0(-2000, 2000);
                            v1413.y = v1415;
                            v1413.x = v1414;
                            v1412.pos = v1413;
                            v1414 = ffi.new("VoiceDataCustom_t");
                            ffi.copy(v1414, v1412, ffi.sizeof(v1412));
                            v1415 = v37.packets[l_l_str_value_2_0][v37.packet_counter];
                            v1407.xuid_low = v1415.xuid_low;
                            v1407.xuid_high = v1411:get_index();
                            v1407.sequence_bytes = v1415.sequence_bytes;
                            v1407.section_number = v1415.section_number;
                            v1407.uncompressed_sample_offset = v1415.uncompressed_sample_offset;
                            if v37.packet_counter > 1 then
                                v37.tick_delay = globals.tickcount;
                                v37.delta_packet = v37.packets[l_l_str_value_2_0][v37.packet_counter].tickcount - v37.packets[l_l_str_value_2_0][v37.packet_counter - 1].tickcount;
                            end;
                            v37.voice_message(v1407);
                            return;
                        end;
                    else
                        local v1416 = v37.packets[l_l_str_value_2_0][v37.packet_counter];
                        if l_l_str_value_2_0 == "Nixware" then
                            v1416.xuid_low = 3355443200 + globals.curtime / 2;
                            v37.voice_message(v1416);
                            v37.tick_delay = globals.tickcount;
                            v37.delta_packet = 2;
                            return;
                        elseif l_l_str_value_2_0 == "Fatality" then
                            local v1417 = entity.get_players();
                            local v1418 = 0;
                            for v1419 = 1, #v1417 do
                                local v1420 = v1417[v1419];
                                if v1420:is_alive() and not v1420:is_dormant() then
                                    local l_m_vecOrigin_2 = v1420.m_vecOrigin;
                                    local v1422 = v37.calculate_fatality_value(l_m_vecOrigin_2.x);
                                    local v1423 = v37.calculate_fatality_value(l_m_vecOrigin_2.y);
                                    local v1424 = v37.calculate_fatality_value(l_m_vecOrigin_2.z);
                                    if v1423 < 0 then
                                        local v1425 = 4294967296 + v1423;
                                        if v1425 then
                                            v1423 = v1425;
                                        end;
                                    end;
                                    if v1424 < 0 then
                                        local v1426 = 4294967296 + v1424;
                                        if v1426 then
                                            v1424 = v1426;
                                        end;
                                    end;
                                    v1416.xuid_low = v1420:get_player_info().userid * 65536 + 704675834;
                                    v1416.xuid_high = globals.tickcount;
                                    v1416.sequence_bytes = v1422;
                                    v1416.section_number = v1423;
                                    v1416.uncompressed_sample_offset = v1424;
                                    v37.voice_message(v1416);
                                    v1418 = v1418 + 1;
                                    if v1418 >= 3 then
                                        break;
                                    end;
                                end;
                            end;
                            if v37.packet_counter > 1 then
                                v37.tick_delay = globals.tickcount;
                                v37.delta_packet = 3;
                            end;
                            return;
                        elseif l_l_str_value_2_0 == "Airflow" then
                            local v1427 = entity.get_players();
                            local v1428 = 0;
                            for v1429 = 1, #v1427 do
                                local v1430 = v1427[v1429];
                                if v1430:is_alive() then
                                    local l_m_vecOrigin_3 = v1430.m_vecOrigin;
                                    local v1432 = v62(l_m_vecOrigin_3.x);
                                    local v1433 = v62(l_m_vecOrigin_3.y);
                                    local v1434 = v62(l_m_vecOrigin_3.z);
                                    v1416.xuid_low = 3735943921;
                                    v1416.xuid_high = (v1432 % 65536 + v1433 % 256 * 65536) * 256 + v1429;
                                    v1416.sequence_bytes = v1433 >= 0 and v1434 % 65536 * 256 + 1677721600 + l_floor_0(v1433 / 256) or v1434 % 65536 * 256 + 1677721600 + 256 + l_floor_0(v1433 / 256);
                                    v1416.section_number = globals.tickcount % 65535;
                                    v1416.uncompressed_sample_offset = math.random(0, 1) == 1 and 16515072 or 0;
                                    v37.voice_message(v1416);
                                    v1428 = v1428 + 1;
                                    if v1428 >= 3 then
                                        break;
                                    end;
                                end;
                            end;
                            if v37.packet_counter > 1 then
                                v37.tick_delay = globals.tickcount;
                                v37.delta_packet = 2;
                            end;
                            return;
                        else
                            v37.voice_message(v1416);
                        end;
                    end;
                end;
            end;
            return;
        end;
    end;
end;
v117.ui_tables.visuals.spoofer_switch:set_callback(function()
    -- upvalues: v117 (ref), v37 (ref)
    if v117.ui_tables.visuals.spoofer_switch.value then
        events.render:set(v37.cheat_spoof);
    else
        events.render:unset(v37.cheat_spoof);
    end;
end, true);
events.shutdown:set(function()
    -- upvalues: v43 (ref)
    v43.shared_esp:override();
end);
v37.con_color = nil;
local v1435 = materials.get_materials("");
v37.console_materials = {};
for v1436 = 1, #v1435 do
    local v1437 = {
        [1] = "vgui/hud/800corner1", 
        [2] = "vgui/hud/800corner2", 
        [3] = "vgui/hud/800corner3", 
        [4] = "vgui/hud/800corner4", 
        [5] = "vgui_white"
    };
    for v1438 = 1, #v1437 do
        if v1435[v1436]:get_name():find(v1437[v1438]) then
            table.insert(v37.console_materials, v1435[v1436]);
        end;
    end;
end;
v37.modulate_console = function(v1439)
    -- upvalues: v37 (ref)
    for v1440 = 1, 5 do
        local v1441 = v37.console_materials[v1440];
        v1441:color_modulate(v1439);
        v1441:alpha_modulate(v1439.a / 255);
    end;
    v37.con_color = v1439:to_hex();
end;
v37.console_modulation = function()
    -- upvalues: v92 (ref), v117 (ref), v37 (ref)
    local v1442 = v92.console_status(v92.EngineClient_class);
    local v1443 = color(255);
    if v1442 then
        v1443 = v117.ui_tables.visuals.console_color.value;
    end;
    if v1443.to_hex(v1443) ~= v37.con_color then
        v37.modulate_console(v1443);
    end;
end;
v117.ui_tables.visuals.console_switch:set_callback(function()
    -- upvalues: v117 (ref), v37 (ref)
    if v117.ui_tables.visuals.console_switch.value then
        events.render:set(v37.console_modulation);
    else
        events.render:unset(v37.console_modulation);
        v37.modulate_console(color(255, 255, 255, 255));
    end;
end, true);
events.shutdown:set(function()
    -- upvalues: v37 (ref)
    v37.modulate_console(color(255, 255, 255, 255));
end);
v37.cache_viewmodel = {
    fov = cvar.viewmodel_fov:int(), 
    x = cvar.viewmodel_offset_x:float(), 
    y = cvar.viewmodel_offset_y:float(), 
    z = cvar.viewmodel_offset_z:float()
};
v37.set_viewmodel = function()
    -- upvalues: v117 (ref), v0 (ref)
    cvar.viewmodel_fov:int(v117.ui_tables.viewmodel.viewmodel_fov.value);
    cvar.viewmodel_offset_x:float(v117.ui_tables.viewmodel.viewmodel_x.value / 100);
    cvar.viewmodel_offset_y:float(v117.ui_tables.viewmodel.viewmodel_y.value / 100);
    cvar.viewmodel_offset_z:float(v117.ui_tables.viewmodel.viewmodel_z.value / 100);
    v0.viewmodel.fov = v117.ui_tables.viewmodel.viewmodel_fov.value;
    v0.viewmodel.x = v117.ui_tables.viewmodel.viewmodel_x.value;
    v0.viewmodel.y = v117.ui_tables.viewmodel.viewmodel_y.value;
    v0.viewmodel.z = v117.ui_tables.viewmodel.viewmodel_z.value;
end;
v117.ui_tables.viewmodel.viewmodel_switch:set_callback(function()
    -- upvalues: v117 (ref), v37 (ref), v0 (ref)
    if v117.ui_tables.viewmodel.viewmodel_switch.value then
        v37.cache_viewmodel.fov = cvar.viewmodel_fov:int();
        v37.cache_viewmodel.x = cvar.viewmodel_offset_x:float();
        v37.cache_viewmodel.y = cvar.viewmodel_offset_y:float();
        v37.cache_viewmodel.z = cvar.viewmodel_offset_z:float();
        if v117.ui_tables.viewmodel.viewmodel_fov.value == 0 then
            v117.ui_tables.viewmodel.viewmodel_fov.ref:set(cvar.viewmodel_fov:int());
        end;
        if v117.ui_tables.viewmodel.viewmodel_x == 0 then
            v117.ui_tables.viewmodel.viewmodel_x.ref:set(cvar.viewmodel_offset_x:float() * 100);
        end;
        if v117.ui_tables.viewmodel.viewmodel_y == 0 then
            v117.ui_tables.viewmodel.viewmodel_y.ref:set(cvar.viewmodel_offset_y:float() * 100);
        end;
        if v117.ui_tables.viewmodel.viewmodel_z == 0 then
            v117.ui_tables.viewmodel.viewmodel_z.ref:set(cvar.viewmodel_offset_z:float() * 100);
        end;
        cvar.sv_competitive_minspec:int(0);
        v37.set_viewmodel();
    else
        cvar.viewmodel_fov:int(v37.cache_viewmodel.fov);
        cvar.viewmodel_offset_x:float(v37.cache_viewmodel.x);
        cvar.viewmodel_offset_y:float(v37.cache_viewmodel.y);
        cvar.viewmodel_offset_z:float(v37.cache_viewmodel.z);
        cvar.sv_competitive_minspec:int(1);
    end;
    v0.viewmodel.switch = v117.ui_tables.viewmodel.viewmodel_switch.value;
end, true);
v117.ui_tables.viewmodel.viewmodel_fov.ref:set_callback(function()
    -- upvalues: v37 (ref)
    v37.set_viewmodel();
end);
v117.ui_tables.viewmodel.viewmodel_x.ref:set_callback(function()
    -- upvalues: v37 (ref)
    v37.set_viewmodel();
end);
v117.ui_tables.viewmodel.viewmodel_y.ref:set_callback(function()
    -- upvalues: v37 (ref)
    v37.set_viewmodel();
end);
v117.ui_tables.viewmodel.viewmodel_z.ref:set_callback(function()
    -- upvalues: v37 (ref)
    v37.set_viewmodel();
end);
v117.ui_tables.viewmodel.viewmodel_undo.ref:set_callback(function()
    -- upvalues: v117 (ref), v37 (ref)
    v117.ui_tables.viewmodel.viewmodel_fov.ref:set(v37.cache_viewmodel.fov);
    v117.ui_tables.viewmodel.viewmodel_x.ref:set(v37.cache_viewmodel.x * 100);
    v117.ui_tables.viewmodel.viewmodel_y.ref:set(v37.cache_viewmodel.y * 100);
    v117.ui_tables.viewmodel.viewmodel_z.ref:set(v37.cache_viewmodel.z * 100);
end);
events.player_connect_full:set(function()
    -- upvalues: v117 (ref), v37 (ref)
    if v117.ui_tables.viewmodel.viewmodel_switch.value then
        cvar.sv_competitive_minspec:int(0);
        v37.set_viewmodel();
    end;
end);
events.shutdown:set(function()
    -- upvalues: v37 (ref)
    cvar.viewmodel_fov:int(v37.cache_viewmodel.fov);
    cvar.viewmodel_offset_x:float(v37.cache_viewmodel.x);
    cvar.viewmodel_offset_y:float(v37.cache_viewmodel.y);
    cvar.viewmodel_offset_z:float(v37.cache_viewmodel.z);
    cvar.sv_competitive_minspec:int(1);
end);
v37.set_aspect_ratio = function()
    -- upvalues: v117 (ref), v0 (ref)
    cvar.r_aspectratio:float(v117.ui_tables.viewmodel.aspect_value.value / 10);
    v0.viewmodel.aspect_ratio = v117.ui_tables.viewmodel.aspect_value.value;
end;
v37.cache_aspect_ratio = cvar.r_aspectratio:float();
v117.ui_tables.viewmodel.aspect_switch:set_callback(function()
    -- upvalues: v117 (ref), v37 (ref), v59 (ref), v0 (ref)
    if v117.ui_tables.viewmodel.aspect_switch.value then
        v37.cache_aspect_ratio = cvar.r_aspectratio:float();
        if v117.ui_tables.viewmodel.aspect_value.value == 0 then
            v117.ui_tables.viewmodel.aspect_value.ref:set(v59(v37.cache_aspect_ratio * 10, 0.01));
        end;
        v37.set_aspect_ratio();
    else
        cvar.r_aspectratio:float(v37.cache_aspect_ratio);
    end;
    v0.viewmodel.aspect_ratio_switch = v117.ui_tables.viewmodel.aspect_switch.value;
end, true);
v117.ui_tables.viewmodel.aspect_value:set_callback(function()
    -- upvalues: v37 (ref)
    v37.set_aspect_ratio();
end);
events.shutdown:set(function()
    -- upvalues: v37 (ref)
    cvar.r_aspectratio:float(v37.cache_aspect_ratio);
end);
local v1454 = {
    move_yaw = 0, 
    wall_yaw = 0, 
    final_yaw = 0, 
    correct_move_yaw = function(v1444)
        -- upvalues: l_clamp_0 (ref), l_abs_0 (ref)
        local v1445 = render.camera_angles();
        local l_move_yaw_0 = v1444.move_yaw;
        local v1447 = v1444.forwardmove > 0;
        local v1448 = v1444.forwardmove < 0;
        local v1449 = v1444.forwardmove == 0;
        local v1450 = v1444.sidemove < 0;
        local v1451 = v1444.sidemove > 0;
        if v1447 then
            local v1452 = l_clamp_0(90 * l_abs_0(v1445.x / 89), 45, 90);
            if v1450 then
                return math.normalize_yaw(l_move_yaw_0 + v1452), v1452;
            elseif v1451 then
                return math.normalize_yaw(l_move_yaw_0 - v1452), -v1452;
            else
                return l_move_yaw_0, 0;
            end;
        elseif v1448 then
            local v1453 = 180 - l_clamp_0(90 * l_abs_0(v1445.x / 89), 45, 90);
            if v1450 then
                return math.normalize_yaw(l_move_yaw_0 + v1453), v1453;
            elseif v1451 then
                return math.normalize_yaw(l_move_yaw_0 - v1453), -v1453;
            else
                return math.normalize_yaw(l_move_yaw_0 - 180), -180;
            end;
        else
            if v1449 then
                if v1450 then
                    return math.normalize_yaw(l_move_yaw_0 + 90), 90;
                elseif v1451 then
                    return math.normalize_yaw(l_move_yaw_0 - 90), -90;
                end;
            end;
            return l_move_yaw_0, 0;
        end;
    end
};
v1454.avoid_collision_detect = function(v1455)
    -- upvalues: v63 (ref), v117 (ref), v43 (ref), v1454 (ref), l_trace_hull_0 (ref), l_abs_0 (ref)
    local l_ref_11 = v63.ref;
    local _ = v63.ref:get_origin();
    if v63.on_ground or not l_ref_11 or v117.ui_tables.misc.avoid_disable.value_by_name[1] and v63.crouching then
        return;
    elseif v43.edge_jump:get() and v117.ui_tables.misc.avoid_disable.value_by_name[2] then
        return;
    elseif l_ref_11:get_anim_state().on_ladder then
        return;
    else
        local l_m_vecMins_4 = l_ref_11.m_vecMins;
        local l_m_vecMaxs_4 = l_ref_11.m_vecMaxs;
        l_m_vecMins_4.z = 20;
        l_m_vecMaxs_4.z = l_m_vecMaxs_4.z - 10;
        local l_m_vecVelocity_1 = l_ref_11.m_vecVelocity;
        l_m_vecVelocity_1.z = 0;
        l_m_vecVelocity_1 = l_m_vecVelocity_1:length();
        local v1461, v1462 = v1454.correct_move_yaw(v1455);
        l_ref_11.m_vecVelocity:normalized():angles().z = 0;
        v1454.move_yaw = v1461;
        v1454.wall_yaw = nil;
        local v1463 = vector():angles(0, v1461 - 25, 0) * 4 * v117.ui_tables.misc.avoid_dist.value;
        local v1464 = vector():angles(0, v1461 + 25, 0) * 4 * v117.ui_tables.misc.avoid_dist.value;
        local v1465 = l_ref_11:simulate_movement();
        v1465:think();
        local l_origin_0 = v1465.origin;
        local v1467 = l_trace_hull_0(l_origin_0, l_origin_0 + v1463, l_m_vecMins_4, l_m_vecMaxs_4, entity.get_players(false, false), 33636363, 3);
        if v1467.fraction ~= 1 then
            local v1468 = l_trace_hull_0(l_origin_0, l_origin_0 + v1463, l_m_vecMins_4, l_m_vecMaxs_4, entity.get_players(false, false), 536870912, 3);
            if v1467.entity == entity.get(0) and v1468.fraction == 1 then
                local v1469, _ = v1467.plane.normal:vectors();
                local l_end_pos_1 = v1467.end_pos;
                local v1472 = (l_end_pos_1 + v1469 * 8 - l_end_pos_1):normalized();
                if l_abs_0(math.normalize_yaw(v1472:angles().y - v1461)) > 110 then
                    v1472 = v1472 * -1;
                end;
                v1455.move_yaw = math.normalize_yaw(v1472.angles(v1472).y - v1462);
                v1454.wall_yaw = v1472.angles(v1472).y;
                return;
            end;
        end;
        local v1473 = l_trace_hull_0(l_origin_0, l_origin_0 + v1464, l_m_vecMins_4, l_m_vecMaxs_4, entity.get_players(false, false), 33636363, 3);
        if v1473.fraction ~= 1 then
            local v1474 = l_trace_hull_0(l_origin_0, l_origin_0 + v1464, l_m_vecMins_4, l_m_vecMaxs_4, entity.get_players(false, false), 536870912, 3);
            if v1473.entity == entity.get(0) and v1474.fraction == 1 then
                local v1475, _ = v1473.plane.normal:vectors();
                local l_end_pos_2 = v1473.end_pos;
                local v1478 = (l_end_pos_2 + v1475 * 8 - l_end_pos_2):normalized();
                if l_abs_0(math.normalize_yaw(v1478:angles().y - v1461)) > 70 then
                    v1478 = v1478 * -1;
                end;
                v1455.move_yaw = math.normalize_yaw(v1478.angles(v1478).y - v1462);
                v1454.wall_yaw = v1478.angles(v1478).y;
            end;
        end;
        return;
    end;
end;
v117.ui_tables.misc.avoid_switch:set_callback(function()
    -- upvalues: v117 (ref), v1454 (ref)
    if v117.ui_tables.misc.avoid_switch.value then
        events.createmove:set(v1454.avoid_collision_detect);
    else
        events.createmove:unset(v1454.avoid_collision_detect);
    end;
end, true);
v1454.fast_ladder_func = function(v1479)
    -- upvalues: v63 (ref)
    local l_ref_12 = v63.ref;
    if not l_ref_12 then
        return;
    elseif not l_ref_12:get_anim_state().on_ladder then
        return;
    elseif v1479.forwardmove == 0 then
        return;
    else
        local v1481 = render.camera_angles();
        v1479.view_angles.x = 89;
        v1479.view_angles.z = 0;
        if v1481.x < 45 then
            v1479.in_moveright = v1479.forwardmove > 0;
            v1479.in_moveleft = v1479.forwardmove < 0;
            v1479.in_forward = v1479.forwardmove < 0;
            v1479.in_back = v1479.forwardmove > 0;
            if v1479.sidemove == 0 then
                v1479.view_angles.y = v1479.view_angles.y + 90;
                return;
            else
                v1479.view_angles.y = v1479.sidemove < 0 and v1479.view_angles.y + 150 or v1479.view_angles.y + 30;
            end;
        end;
        return;
    end;
end;
v117.ui_tables.misc.fastladder_switch:set_callback(function()
    -- upvalues: v117 (ref), v1454 (ref)
    if v117.ui_tables.misc.fastladder_switch.value then
        events.createmove:set(v1454.fast_ladder_func);
    else
        events.createmove:unset(v1454.fast_ladder_func);
    end;
end, true);
v1454.no_fall_func = function(v1482)
    -- upvalues: v63 (ref), v38 (ref), v89 (ref)
    local l_ref_13 = v63.ref;
    if l_ref_13:get_anim_state().on_ladder then
        return;
    else
        local l_m_fFlags_1 = l_ref_13.m_fFlags;
        local v1485 = bit.band(l_m_fFlags_1, v38.flags.FL_ONGROUND) ~= 0;
        local v1486 = v89(l_ref_13, 1, false, nil, nil, nil, false);
        local v1487 = v89(l_ref_13, 7, false, nil, nil, nil, false);
        local v1488 = l_ref_13:get_origin();
        local v1489 = utils.trace_hull(v1488, vector(v1488.x, v1488.y, v1486.z - 4), l_ref_13.m_vecMins, l_ref_13.m_vecMaxs, l_ref_13, 33636363, 3);
        if not v1485 and v1489.fraction ~= 1 then
            v1482.in_duck = false;
            v1482.in_jump = true;
        elseif l_ref_13.m_vecVelocity.z < -550 and utils.trace_hull(v1488, vector(v1488.x, v1488.y, v1487.z - 4), l_ref_13.m_vecMins, l_ref_13.m_vecMaxs, l_ref_13, 33636363, 3).fraction ~= 1 then
            v1482.in_duck = true;
        end;
        return;
    end;
end;
v117.ui_tables.misc.fall_switch:set_callback(function()
    -- upvalues: v117 (ref), v1454 (ref)
    if v117.ui_tables.misc.fall_switch.value then
        events.createmove:set(v1454.no_fall_func);
    else
        events.createmove:unset(v1454.no_fall_func);
    end;
end, true);
v1454.cache_clantag = "";
v1454.side_switch = true;
v1454.sync_array = {
    [1] = "             ex", 
    [2] = "            ext", 
    [3] = "           exte", 
    [4] = "          exten", 
    [5] = "         extens", 
    [6] = "        extensi", 
    [7] = "       extensio", 
    [8] = "      extension", 
    [9] = "     extension ", 
    [10] = "   extension  ", 
    [11] = "   extension   ", 
    [12] = "  extension    ", 
    [13] = " extension     ", 
    [14] = "extension      ", 
    [15] = "extension      ", 
    [16] = "extension      ", 
    [17] = "extension      ", 
    [18] = "extension      ", 
    [19] = "extension      ", 
    [20] = "extension      ", 
    [21] = "extension      ", 
    [22] = "xtension       ", 
    [23] = "tension        ", 
    [24] = "ension         ", 
    [25] = "nsion          ", 
    [26] = "sion           ", 
    [27] = "ion            ", 
    [28] = "on             ", 
    [29] = "n              ", 
    [30] = "               "
};
v1454.syncg_array = {
    [1] = "             ga", 
    [2] = "            gam", 
    [3] = "           game", 
    [4] = "          games", 
    [5] = "         gamese", 
    [6] = "        gamesen", 
    [7] = "       gamesens", 
    [8] = "      gamesense", 
    [9] = "     gamesense ", 
    [10] = "    gamesense  ", 
    [11] = "   gamesense   ", 
    [12] = "  gamesense    ", 
    [13] = " gamesense     ", 
    [14] = "gamesense      ", 
    [15] = "gamesense      ", 
    [16] = "gamesense      ", 
    [17] = "gamesense      ", 
    [18] = "gamesense      ", 
    [19] = "gamesense      ", 
    [20] = "gamesense      ", 
    [21] = "gamesense      ", 
    [22] = "anesense       ", 
    [23] = "nesense        ", 
    [24] = "esense         ", 
    [25] = "sense          ", 
    [26] = "ense           ", 
    [27] = "nse            ", 
    [28] = "se             ", 
    [29] = "e              ", 
    [30] = "               "
};
v1454.clantag_func = function()
    -- upvalues: v59 (ref), l_floor_0 (ref), v1454 (ref)
    if not utils.net_channel() then
        return;
    else
        local v1490 = (globals.client_tick + globals.clock_offset) / v59(0.6 / globals.tickinterval / 2, 1);
        v1490 = l_floor_0(v1490 % 30 + 1);
        if not v1454.side_switch then
            v1490 = 14;
        end;
        local v1491 = v1454.sync_array[v1490];
        if v1454.cache_clantag ~= v1491 then
            common.set_clan_tag(v1491);
            v1454.cache_clantag = v1491;
        end;
        return;
    end;
end;
events.cs_win_panel_match:set(function()
    -- upvalues: v117 (ref), v1454 (ref)
    if not v117.ui_tables.misc.clantag_switch.value then
        return;
    else
        v1454.side_switch = false;
        return;
    end;
end);
events.round_start:set(function()
    -- upvalues: v1454 (ref)
    v1454.side_switch = true;
end);
events.announce_phase_end:set(function()
    -- upvalues: v1454 (ref)
    v1454.side_switch = false;
end);
events.cs_game_disconnected:set(function()
    -- upvalues: v1454 (ref)
    v1454.side_switch = true;
end);
v117.ui_tables.misc.clantag_switch:set_callback(function()
    -- upvalues: v117 (ref), v1454 (ref), v43 (ref)
    if not v117.ui_tables.misc.clantag_switch.value then
        events.render:unset(v1454.clantag_func);
        v43.clantag:override();
        common.set_clan_tag("");
    else
        events.render:set(v1454.clantag_func);
        v43.clantag:override(false);
    end;
end, true);
events.shutdown:set(function()
    -- upvalues: v43 (ref)
    common.set_clan_tag("");
    v43.clantag:override();
end);
v1454.shared_player_data = {};
ffi.cdef("\n                typedef struct\n                {\n                    int64_t value;\n                } convert_t;\n            ");
v1454.shared_recieve_data = function(v1492)
    -- upvalues: v62 (ref), l_get_local_player_0 (ref), v1454 (ref)
    local v1493 = ffi.new("VoiceDataCustom_t");
    local v1494 = ffi.new("convert_t");
    v1494.value = v1492.xuid;
    ffi.copy(v1493, v1494, ffi.sizeof(v1494));
    v1493.sequence_bytes = v1492.sequence_bytes;
    v1493.section_number = v1492.section_number;
    v1493.uncompressed_sample_offset = v1492.uncompressed_sample_offset;
    local l_entity_0 = v1492.entity;
    id1 = l_entity_0:get_index();
    id2 = l_entity_0:get_player_info().userid;
    id2_string = tostring(id2);
    id3 = l_entity_0:get_xuid();
    id3_string = tostring(id3);
    shifr1 = v1493.section_number - 1;
    shifr2 = v1493.xuid_high - 3;
    shifr3 = v1493.sequence_bytes - id1 - 2 + 2147483648;
    p1 = 0;
    p2 = 1;
    p3 = id2_string:sub(1, 1) + id3_string:sub(#id3_string - 2, #id3_string - 2);
    for v1496 = 1, #id3_string do
        p1 = v62(id3_string:sub(v1496, v1496)) + p1;
        if v62(id3_string:sub(v1496, v1496)) > 0 then
            p2 = v62(id3_string:sub(v1496, v1496)) * p2;
        end;
    end;
    sh1 = (p1 + id2 % p1) % 256;
    sh2 = (v62(p3) + v62(id3_string:sub(3, 3))) % 256;
    sh3 = (p2 + 17) % 4096;
    if l_entity_0 == l_get_local_player_0() and shifr2 % sh2 == 0 or shifr1 % sh1 == 0 and shifr2 % sh2 == 0 and shifr3 % sh3 == 0 then
        v1454.shared_player_data[l_entity_0:get_index()] = true;
    end;
end;
v1454.share_cooldown = 0;
v1454.start_share = function()
    -- upvalues: v1454 (ref)
    events.render:set(v1454.shared_send_data);
    utils.execute_after(1.5, function()
        -- upvalues: v1454 (ref)
        events.render:unset(v1454.shared_send_data);
    end);
end;
v1454.shared_send_data = function()
    -- upvalues: v37 (ref), l_abs_0 (ref), v1454 (ref), l_get_local_player_0 (ref), v62 (ref)
    if v37.cclientstate.net_channel == 0 then
        return;
    else
        if l_abs_0(v1454.share_cooldown - globals.tickcount) > 15 then
            local v1497 = l_get_local_player_0();
            local v1498 = v1497:get_index();
            local l_userid_0 = v1497:get_player_info().userid;
            local v1500 = tostring(l_userid_0);
            local v1501 = v1497:get_xuid();
            local v1502 = tostring(v1501);
            local v1503 = math.random(1, 16777216);
            local v1504 = math.random(1, 16777216);
            local v1505 = v1500:sub(1, 1) + v1502:sub(#v1502 - 2, #v1502 - 2);
            local v1506 = 1;
            local v1507 = 0;
            local v1508 = math.random(1, 1048576);
            for v1509 = 1, #v1502 do
                v1507 = v62(v1502:sub(v1509, v1509)) + v1507;
                if v62(v1502:sub(v1509, v1509)) > 0 then
                    v1506 = v62(v1502:sub(v1509, v1509)) * v1506;
                end;
            end;
            v1506 = (v1506 + 17) % 4096;
            local v1510 = ffi.new("VoiceDataCustom_t");
            v1510.xuid_low = math.random(1, 4294967296);
            v1510.xuid_high = (v62(v1505) + v62(v1502:sub(3, 3))) % 256 * v1504 + 3;
            v1510.sequence_bytes = v1506 * v1508 + v1498 + 2 - 2147483648;
            v1510.section_number = (v1507 + l_userid_0 % v1507) % 256 * v1503 + 1;
            v1510.uncompressed_sample_offset = math.random(1, 4294967296);
            v37.voice_message(v1510);
            v1454.share_cooldown = globals.tickcount;
        end;
        return;
    end;
end;
v1454.shared_controller = function()
    -- upvalues: v1454 (ref)
    v1454.shared_player_data = {};
    events.voice_message:set(v1454.shared_recieve_data);
    utils.execute_after(1, function()
        -- upvalues: v1454 (ref)
        events.voice_message:unset(v1454.shared_recieve_data);
        v1454.render_shared_icon();
    end);
end;
v1454.render_shared_icon = function()
    -- upvalues: v1454 (ref)
    local v1511 = entity.get_players(nil, true);
    for v1512 = 1, #v1511 do
        local v1513 = v1511[v1512];
        if v1513 then
            local v1514 = v1513:get_index();
            if v1454.shared_player_data[v1514] then
                v1513:set_icon("file://{images}/icons/extension/shared_icon.png");
            else
                v1513:set_icon();
            end;
        end;
    end;
end;
events.player_connect_full:set(function()
    -- upvalues: v1454 (ref)
    v1454.start_share();
end, true);
events.round_start:set(function()
    -- upvalues: v1454 (ref)
    v1454.start_share();
end, true);
v117.ui_tables.misc.shared_switch:set_callback(function()
    -- upvalues: v117 (ref), v1454 (ref)
    if v117.ui_tables.misc.shared_switch.value then
        events.player_connect_full:set(v1454.shared_controller);
        events.round_start:set(v1454.shared_controller);
        v1454.shared_controller();
        v1454.start_share();
    else
        events.player_connect_full:unset(v1454.shared_controller);
        events.round_start:unset(v1454.shared_controller);
        local v1515 = entity.get_players(nil, true);
        for v1516 = 1, #v1515 do
            local v1517 = v1515[v1516];
            if v1517 then
                v1517:set_icon();
            end;
        end;
    end;
end, true);
events.shutdown:set(function()
    local v1518 = entity.get_players(nil, true);
    for v1519 = 1, #v1518 do
        local v1520 = v1518[v1519];
        if v1520 then
            v1520:set_icon();
        end;
    end;
end);
v117.ui_tables.misc.ping_switch:set_callback(function()
    -- upvalues: v117 (ref), v43 (ref)
    if v117.ui_tables.misc.ping_switch.value then
        cvar.sv_maxunlag:float(0.4);
        v43.ping:override(v117.ui_tables.misc.ping_slider.value);
        v43.ping:disabled(true);
    else
        cvar.sv_maxunlag:float(0.2);
        v43.ping:override();
        v43.ping:disabled(false);
    end;
end, true);
v117.ui_tables.misc.ping_slider:set_callback(function()
    -- upvalues: v117 (ref), v43 (ref)
    if v117.ui_tables.misc.ping_switch.value then
        v43.ping:override(v117.ui_tables.misc.ping_slider.value);
    end;
end);
v1454.trash_enemy_head = {
    counter = 1, 
    phrase = {
        [1] = "\209\133\209\131\208\187\208\184 \209\130\209\139 \208\178\209\139\208\187\209\131\208\191\208\184\208\187\209\129\209\143 \208\177\208\181\208\182\208\176\209\130\209\140 \208\189\208\176\208\180\208\190 \208\177\209\139\208\187\208\190", 
        [2] = "\208\165\209\131\208\185 \209\130\208\181 \208\178 \209\128\208\190\209\130", 
        [3] = "\208\188\208\181\208\189\209\143\208\185 \208\187\209\131\208\176\209\133\209\131 \208\178 \209\130\208\181\208\177\209\143 \208\191\208\190\208\191\208\176\208\187\208\184", 
        [4] = "\208\181\208\177\208\176\209\130\209\140 \209\130\209\139 \208\189\208\190\209\129\208\190\208\188 \208\191\209\128\208\190\208\191\208\176\209\133\208\176\208\187", 
        [5] = "\208\149\208\177\208\176\209\130\209\140 \208\161\208\176\208\188@\209\128\209\129\208\186\208\184\208\185 \208\191\209\128\208\190\208\180\209\131\208\186\209\130 \208\191\208\181\209\128\208\181\208\183\208\176\208\179\209\128\209\131\208\183\208\184\208\187 \209\128\208\181c\208\190\208\187\209\140\208\178\208\181\209\128", 
        [6] = "\209\141\209\130\208\190\209\130 \208\154\208\144\208\157\208\147\208\144\208\155 \208\191\209\128\208\181\209\129\208\181\209\130 \209\130\208\178\208\190\208\181 \209\133\209\128\209\142\209\135\208\181\208\178\208\190 \208\186\208\184\208\187\208\190\208\188\208\181\209\130\209\128 \208\189\208\176 \208\186\208\184\208\187\208\190\208\188\208\181\209\130\209\128 \209\128\208\176\209\129\209\130\209\143\208\189\209\131\208\187\208\190", 
        [7] = nil, 
        [8] = "\208\164\209\128\208\184\209\129\209\130\209\141\208\189\208\180 \208\191\208\176\209\133\208\190\208\180\209\131 \208\189\208\181 \209\129\208\191\208\176\209\129", 
        [9] = "\208\181\208\177\208\176\209\130\209\140 \208\186\209\131\208\191\208\184 \208\161\208\144\208\156\208\158\208\146\208\144\208\160 \208\187\209\131\209\135\209\136\208\181 \208\190\209\130\209\139\208\179\209\128\209\139\208\178\208\176\209\130\209\140 \208\177\209\131\208\180\208\181\209\136\209\140 \209\129\208\187\208\176\208\177\209\139\208\185", 
        [10] = "\208\155\208\190\208\178\208\184 \208\178 \208\180\209\139\208\189\209\142", 
        [11] = nil, 
        [12] = "\209\131\209\133 \209\130\209\139 \209\128\208\176\209\129\209\130\208\181\208\189\208\184\208\181 \208\181\208\191\209\130", 
        [13] = nil, 
        [14] = "\209\137\208\176 \208\181\208\177\209\131 \209\130\209\143", 
        [15] = "\208\190\209\135\208\186\208\184 \208\186\209\131\208\191\208\184 \209\135\208\188\209\139\209\128\209\140 \209\130\209\131\208\191\208\190\208\179\208\190\208\187\208\190\208\178\209\139\208\185", 
        [16] = "1 \209\129\209\139\208\189 \208\180\208\178\208\190\209\128\208\189\209\143\208\179\208\184", 
        [17] = "\209\131\209\136\208\184 \208\189\208\176\208\183\208\176\208\180 \208\191\209\128\208\184\208\186\209\128\209\131\209\130\208\184\209\130\209\140 \208\189\208\181 \208\183\208\176\208\177\209\131\208\180\209\140", 
        [18] = "\208\183\208\176\208\191\208\190\208\188\208\189\208\184 Extension \209\141\209\130\208\190 \208\178\208\181\209\128\209\133 \209\129\208\190\208\178\208\181\209\128\209\136\208\181\208\189\209\129\209\130\208\178\208\176", 
        [19] = nil, 
        [20] = "\208\156\208\190\208\187\209\135\208\176 \208\184\208\179\209\128\208\176\208\185 \208\180\208\190\208\187\208\177\208\176\208\181\208\177", 
        [21] = "\208\159\208\190 \208\181\208\177\208\187\209\131 \209\130\208\181\208\177\208\181 \209\136\208\176\208\187\208\176\209\136\208\190\208\178\208\186\208\176 \208\181\208\177\208\176\208\189\208\176\209\143", 
        [22] = "\208\181\208\177\208\176\209\130\209\140 \209\130\209\139 \208\186\208\176\208\186 \209\130\208\176\208\186\208\190\208\185 \209\133\209\131\208\181\208\178\209\139\208\185 \208\189\208\184\208\186 \208\178\209\139\208\180\209\131\208\188\208\176\208\187", 
        [23] = "\209\130\208\181\208\177\209\143 \208\191\208\181\209\128\208\181\208\184\208\179\209\128\208\176\209\130\209\140 \208\180\208\176\208\182\208\181 \209\129 \208\178\209\139\208\186\208\187\209\142\209\135\208\181\208\189\209\139\208\188 \208\188\208\190\208\189\208\184\208\186\208\190\208\188 \208\188\208\190\208\182\208\189\208\190", 
        [24] = "\208\188\208\180\208\176 \209\130\208\176\208\186\208\190\208\185 \209\129\208\187\208\176\208\177\208\190\209\129\209\130\208\184 \209\143 \208\181\209\137\208\181 \208\189\208\181 \208\178\208\184\208\180\208\181\208\187", 
        [25] = nil, 
        [26] = nil, 
        [27] = nil, 
        [28] = "\208\176\208\187\208\190 \208\177\208\176\209\128\208\176\208\177\208\176\208\189 \208\184\208\179\209\128\208\176\209\130\209\140 \208\177\209\131\208\180\208\181\208\188?", 
        [29] = "\208\184\208\183\208\184 \208\186\208\180 \208\189\208\190\209\128\208\188 \208\181\208\177\209\131 \208\177\208\190\209\130\208\176 \208\189\208\176 \208\188\208\181\208\180\208\184\209\142", 
        [30] = nil, 
        [31] = "\208\189\208\184\209\133\209\131\209\143 \209\143 \209\130\208\181\208\177\208\181 \208\179\208\187\208\176\208\183\208\176 \208\178\208\180\208\176\208\178\208\184\208\187 \208\178 \209\135\208\181\209\128\208\181\208\191", 
        [32] = "\209\130\209\139 \208\191\208\190\209\133\208\190\208\180\209\131 \208\186\208\190\208\189\208\180\208\184\209\134\208\184\209\142 \208\191\208\181\209\128\208\181\208\179\209\128\208\181\208\187", 
        [33] = nil, 
        [34] = "\209\129\209\130\209\128\208\176\209\136\208\189\208\190 \208\191\208\190\208\180\209\131\208\188\208\176\209\130\209\140 \209\129 \208\186\208\176\208\186\208\184\208\188 \208\179\208\190\208\178\208\189\208\190\208\188 \209\130\209\139 \209\130\208\176\208\188 \208\184\208\179\209\128\208\176\208\181\209\136\209\140", 
        [35] = nil, 
        [36] = "\209\133\209\141\208\185 \208\179\208\176\208\185\209\129 \209\131 \208\177\208\184\209\135\208\176 \208\178\209\129\208\181 \208\189\208\176\208\185\209\129", 
        [37] = "???", 
        [38] = nil, 
        [39] = nil, 
        [40] = nil, 
        [41] = "\208\157\209\131 \208\189\208\184\209\135\208\181 \208\178 \208\189\208\181\208\186\209\129\209\130 \209\128\208\176\209\131\208\189\208\180\208\181 \208\191\208\190\208\191\209\139\209\130\208\176\208\181\209\136\209\140\209\129\209\143", 
        [42] = nil, 
        [43] = "\209\130\209\139 \208\191\209\128\208\190\209\129\209\130\208\190 \209\130\209\128\208\176\209\130\208\184\209\136\209\140 \208\178\209\128\208\181\208\188\209\143", 
        [44] = "\208\183\208\176\209\135\208\181\208\188 \209\130\209\139 \208\178\208\190\208\190\208\177\209\137\208\181 \209\129\209\131\209\137\208\181\209\129\209\130\208\178\209\131\208\181\209\136\209\140?", 
        [45] = "\208\162\209\139 \208\178\208\190\208\190\208\177\209\137\208\181 \208\191\208\190\208\189\208\184\208\188\208\176\208\181\209\136\209\140 \209\135\209\130\208\190 \209\130\208\176\208\186\208\190\208\181 \208\184\208\179\209\128\208\176 \208\184\208\187\208\184 \208\191\209\128\208\190\209\129\209\130\208\190 \208\186\208\189\208\190\208\191\208\186\208\184 \208\182\208\188\208\181\209\136\209\140?", 
        [46] = "\208\161\208\187\208\181\208\180\209\131\209\142\209\137\208\184\208\185 \208\176\208\176 \208\191\209\128\208\181\209\129\208\181\209\130 \208\178 \209\129\209\130\209\131\208\180\208\184\209\142 !", 
        [7] = {
            [1] = "log", 
            [2] = "\208\181\208\177\208\176\209\130\209\140 \208\178 \209\130\208\181\208\177\209\143 \208\178\209\139\208\177\208\184\208\178\208\176\208\181\209\130"
        }, 
        [11] = {
            [1] = "\208\163 \209\130\208\181\208\177\209\143 \208\186\208\190\208\187\208\181\208\189\208\184 \208\191\208\190\208\180\208\186\208\190\209\129\208\184\208\187\208\184\209\129\209\140", 
            [2] = "\208\167\208\181 \208\189\208\190\208\179\208\184 \208\189\208\181 \208\180\208\181\209\128\208\182\209\131\209\130?"
        }, 
        [13] = {
            [1] = "\209\132\208\187\208\184\208\191\209\131 \208\183\208\176\208\180\208\190\208\189\208\184\208\187 \208\184 \209\136\208\176\209\128\209\139 \208\178\209\139\208\187\209\131\208\191\208\184\208\187 \208\189\208\176 \209\128\209\131\208\187\208\181\209\130\208\186\209\131", 
            [2] = "\209\130\209\139 \208\182\208\176\208\187\208\190\208\186"
        }, 
        [19] = {
            [1] = "\208\181\208\177\208\176\208\189\209\131\209\130\208\176\209\143 \208\187\209\131\208\176", 
            [2] = "\208\189\208\181 \208\180\209\131\208\188\208\176\208\187 \209\135\209\130\208\190 \208\190\208\189\208\176 \209\130\208\176\208\186 \208\177\209\131\209\129\209\130\208\184\209\130"
        }, 
        [25] = {
            [1] = "death", 
            [2] = "\208\152\208\183 \208\180\208\181\208\180\208\176 \208\191\208\190\208\178\209\139\208\191\208\184\209\129\209\139\208\178\208\176\208\185 \208\188\208\189\208\181 \208\181\209\137\208\181", 
            [3] = "\209\132\209\128\208\184\208\177\208\181\209\130 \209\133\208\190\208\180\209\143\209\135\208\184\208\185"
        }, 
        [26] = {
            [1] = "\208\146\209\128\208\181\208\188\209\143 \208\178\208\184\208\180\208\181\208\187?", 
            [2] = "\208\158\209\130\208\177\208\190\208\185 \208\191\208\184\208\180\208\190\209\128\208\176\209\129"
        }, 
        [27] = {
            [1] = "\209\130\209\131\208\191\208\190\208\185 \209\131\208\178\208\190\208\187\208\181\208\189\209\140", 
            [2] = "1.         "
        }, 
        [30] = {
            [1] = "\208\180\208\176\208\178\208\176\208\185 \209\129\208\186\208\176\208\182\208\184 \208\186\208\176\208\186\208\190\208\185 \209\135\208\184\209\130 \209\133\209\131\208\181\208\178\209\139\208\185", 
            [2] = "\208\188\208\177 \208\191\208\190\208\178\208\181\209\128\209\142"
        }, 
        [33] = {
            [1] = "CHERNOBYL.LUA | New Defensive Exploit", 
            [2] = "\209\130\209\139 \209\129 \209\141\209\130\208\190\208\185 \209\133\209\131\208\185\208\189\208\181\208\185 \208\188\208\189\208\181 \208\190\209\130\209\129\208\176\209\129\209\139\208\178\208\176\208\181\209\136\209\140 ?"
        }, 
        [35] = {
            [1] = "\209\135\208\181 \209\141\209\130\208\190 \208\177\209\139\208\187\208\190", 
            [2] = "\208\190\208\191\209\143\209\130\209\140 \209\133\209\131\208\181\208\178\208\176\209\143 \208\191\208\190\208\191\209\139\209\130\208\186\208\176 \209\131\208\177\208\184\209\130\209\140 \208\188\208\181\208\189\209\143"
        }, 
        [38] = {
            [1] = "\209\130\209\139 \208\176\209\132\208\186 \208\184\208\187\208\184 \209\135\208\181?", 
            [2] = "\208\176 \209\130\208\190 \209\133\209\131\208\185 \208\191\208\190\208\185\208\188\208\181\209\136\209\140 \209\130\208\190 \208\188\209\131\208\178\208\176\208\181\209\130\209\129\209\143 \209\130\208\190 \209\135\208\181\209\130 \209\129\208\184\208\180\208\184\209\130 \208\180\209\128\208\190\209\135\208\184\209\130.", 
            [3] = "\208\186\208\190\209\128\208\190\209\135\208\181 \208\191\208\190\209\129\208\191\208\190\209\128\209\130\208\184\208\178\208\189\208\181\208\185 \208\191\208\190 \208\191\208\176\208\177\208\187\208\190\209\129\209\131 \208\191\208\181\209\128\208\181\208\180\208\178\208\184\208\179\208\176\208\185\209\129\209\143"
        }, 
        [39] = {
            [1] = "\209\143 \209\133\209\131\208\185 \208\191\208\190\208\185\208\188\209\131 \209\130\209\139 \209\135\208\181 \209\129 \208\180\208\182\208\190\209\129\209\130\208\184\208\186\208\176 \209\135\209\130\208\190 \208\187\208\184 \208\191\208\187\208\181\208\184\209\136\209\140 ?", 
            [2] = "\209\135\208\181 \209\130\208\190 \209\130\208\176\208\188 \208\189\208\176\208\184\209\129\208\186\208\190\209\129\208\190\208\186 \209\130\209\131\208\180\208\176 \209\129\209\142\208\180\208\176 \208\191\209\128\209\139\208\179\208\176\208\181\209\130"
        }, 
        [40] = {
            [1] = "neverlose.cc\\market\\item?id=bkRCJa", 
            [2] = "\208\191\209\128\208\184\208\186\209\131\208\191\208\184 \208\188\208\177 \208\191\208\190\208\187\208\181\208\179\209\135\208\181 \209\129\209\130\208\176\208\189\208\181\209\130"
        }, 
        [42] = {
            [1] = "\209\130\209\139 \209\130\208\184\208\191\208\190 \208\189\208\176 \208\176\208\178\208\191 \208\186\208\190\208\191\208\184\209\136\209\140 \208\184\208\187\208\184 \208\178 \209\135\208\181\208\188 \208\191\209\128\208\181\208\186 ?", 
            [2] = "\209\132\208\184\208\189\208\176\208\189\209\129\208\184\209\129\209\130 \209\133\209\128\208\181\208\189\208\190\208\178"
        }
    }
};
v1454.trash_enemy_head.counter = utils.random_int(1, #v1454.trash_enemy_head.phrase);
v1454.trash_enemy_body = {
    counter = 1, 
    phrase = {
        [1] = "\209\133\208\190\209\143\209\132 \209\133\209\131\208\185\208\191\208\176\209\135\208\181\208\187\208\184\209\143\208\173\208\187\208\184\209\130 \208\188\208\190\208\185\208\186\209\128\208\176\208\185 \208\186\208\176\208\186\208\184\208\181 \208\181\209\137\208\181 \208\187\209\131\208\176 \209\130\208\181\208\177\208\181 \208\189\208\176\208\180\208\190 \208\186\209\131\208\191\208\184\209\130\209\140 \209\135\209\130\208\190\208\177 \208\178 \209\130\208\181\208\177\209\143 \208\189\208\181 \208\191\208\190\208\191\208\176\208\180\208\176\208\187\208\184", 
        [2] = nil, 
        [3] = "\208\149\208\177\208\176\209\130\209\140 \209\130\209\139 \209\128\208\176\209\129\209\129\209\139\208\191\208\176\208\187\209\129\209\143", 
        [4] = "1.", 
        [5] = "\208\191\209\128\208\190\209\129\208\186\209\131\208\187\208\184 \208\178 \209\135\208\176\209\130 \208\186\208\176\208\186 \208\182\208\181 \209\130\208\181\208\177\208\181 \208\191\208\187\208\190\209\133\208\190 \208\184\208\179\209\128\208\176\209\130\209\140 \209\129 \209\141\209\130\208\184\208\188 \209\135\208\184\209\130\208\190\208\188", 
        [6] = "-_HS_-", 
        [7] = nil, 
        [8] = "\208\189\208\176 \208\189\208\176\209\133\209\131\208\185 \208\191\208\184\208\180\208\190\209\128 \208\180\209\139\209\128\209\143\208\178\209\139\208\185", 
        [9] = "\208\146 \209\129\208\187\208\181\208\180\209\131\209\137\208\184\208\185 \209\128\208\176\208\183 \208\184\209\129\208\191\208\190\208\187\209\140\208\183\209\131\208\185 wasd", 
        [10] = nil, 
        [11] = nil, 
        [12] = "\208\157\208\176 \208\189\208\176\209\133\209\131\208\185", 
        [13] = nil, 
        [14] = "\208\157\208\176\209\133\209\131\208\185 \209\130\209\139 \208\178\208\190\208\190\208\177\209\137\208\181 \209\129\209\142\208\180\208\176 \208\183\208\176\209\136\208\181\208\187", 
        [15] = nil, 
        [16] = "\208\167\208\181 \209\129\208\191\208\184\208\189\209\131 \208\191\209\128\208\184\209\133\208\178\208\176\209\130\208\184\208\187\208\190?", 
        [17] = nil, 
        [18] = nil, 
        [19] = nil, 
        [20] = "\208\184\208\183\208\184 \209\129\208\178\208\184\208\189 \209\132\208\176\209\128\209\136\208\184\209\128\208\190\208\178\208\176\208\189\208\189\209\139\208\185", 
        [21] = nil, 
        [22] = "\208\157\208\176 \208\191\208\190 \208\191\208\190\209\135\208\186\208\176\208\188", 
        [23] = nil, 
        [24] = "\208\181\208\177\208\176\209\130\209\140 \209\130\209\139 \208\184\208\183 \209\130\209\128\209\131\209\129\208\190\208\178 \208\178\209\139\208\191\209\128\209\139\208\179\208\189\209\131\208\187", 
        [25] = "\209\130\209\139 \208\191\209\128\208\190\209\129\209\130\208\190 \209\130\209\128\208\176\209\130\208\184\209\136\209\140 \208\178\209\128\208\181\208\188\209\143", 
        [26] = nil, 
        [27] = "\209\143 \209\133\208\183 \209\135\208\190 \208\178 \208\177\208\190\208\180\208\184 \208\191\208\176\208\187\209\140\208\189\209\131\208\187\208\190", 
        [28] = nil, 
        [29] = "\208\183\208\176\209\135\208\181\208\188 \209\130\209\139 \208\178\208\190\208\190\208\177\209\137\208\181 \209\129\209\131\209\137\208\181\209\129\209\130\208\178\209\131\208\181\209\136\209\140?", 
        [30] = "\209\130\209\139 \209\135\208\181 \209\129\209\130\208\190\208\191 \208\186\209\128\208\176\208\189 \208\189\208\176\208\182\208\176\208\187?", 
        [31] = nil, 
        [32] = "\208\184\208\183\209\128\208\181\209\136\208\184\209\130\208\184\208\187 \209\133\209\131\208\181\209\129\208\190\209\129\208\176", 
        [33] = "\208\189\208\176\208\177\208\187\209\142\208\180\208\176\208\185 \208\183\208\176 \208\188\208\190\208\181\208\185 \208\184\208\179\209\128\208\190\208\185 \209\133\209\131\208\181\209\129\208\190\209\129 \208\189\208\181\208\188\208\190\209\137\208\189\209\139\208\185", 
        [34] = "\209\141\209\130\208\190 \209\130\208\184\208\191\208\190 \208\178\208\176\208\189\208\178\208\181\208\185 \208\184\208\187\208\184 \209\135\208\181", 
        [35] = "???", 
        [36] = nil, 
        [37] = "\208\157\209\131 \208\189\208\184\209\135\208\181 \208\178 \208\189\208\181\208\186\209\129\209\130 \209\128\208\176\209\131\208\189\208\180\208\181 \208\191\208\190\208\191\209\139\209\130\208\176\208\181\209\136\209\140\209\129\209\143", 
        [38] = nil, 
        [39] = "\208\162\209\139 \208\178\208\190\208\190\208\177\209\137\208\181 \208\191\208\190\208\189\208\184\208\188\208\176\208\181\209\136\209\140 \209\135\209\130\208\190 \209\130\208\176\208\186\208\190\208\181 \208\184\208\179\209\128\208\176 \208\184\208\187\208\184 \208\191\209\128\208\190\209\129\209\130\208\190 \208\186\208\189\208\190\208\191\208\186\208\184 \208\182\208\188\208\181\209\136\209\140?", 
        [2] = {
            [1] = "\208\181\208\177\208\176\209\130\209\140 \209\143 \208\180\208\176\208\177\208\187\209\130\208\176\208\191 \208\189\208\176 \208\191\208\181\208\180\208\176\208\187\208\184 \208\183\208\176\208\177\208\184\208\189\208\180\208\184\208\187", 
            [2] = "\208\184\208\188\208\177\208\176 \208\189\208\176\209\133\209\131\208\185"
        }, 
        [7] = {
            [1] = "death", 
            [2] = "\208\152\208\183 \208\180\208\181\208\180\208\176 \208\191\208\190\208\178\209\139\208\191\208\184\209\129\209\139\208\178\208\176\208\185 \208\188\208\189\208\181 \208\181\209\137\208\181", 
            [3] = "\209\132\209\128\208\184\208\177\208\181\209\130 \209\133\208\190\208\180\209\143\209\135\208\184\208\185"
        }, 
        [10] = {
            [1] = "\209\135\208\181", 
            [2] = "\208\181\208\177\208\176\209\130\209\140 \209\130\209\139 \209\130\209\142\208\177\208\184\208\186"
        }, 
        [11] = {
            [1] = "CHERNOBYL.LUA | New Defensive Exploit", 
            [2] = "\209\130\209\139 \209\129 \209\141\209\130\208\190\208\185 \209\133\209\131\208\185\208\189\208\181\208\185 \208\188\208\189\208\181 \208\190\209\130\209\129\208\176\209\129\209\139\208\178\208\176\208\181\209\136\209\140 ?"
        }, 
        [13] = {
            [1] = "\209\143 \209\133\209\131\208\185 \208\191\208\190\208\185\208\188\209\131 \209\130\209\139 \209\135\208\181 \209\129 \208\180\208\182\208\190\209\129\209\130\208\184\208\186\208\176 \209\135\209\130\208\190 \208\187\208\184 \208\191\208\187\208\181\208\184\209\136\209\140 ?", 
            [2] = "\209\135\208\181 \209\130\208\190 \209\130\208\176\208\188 \208\189\208\176\208\184\209\129\208\186\208\190\209\129\208\190\208\186 \209\130\209\131\208\180\208\176 \209\129\209\142\208\180\208\176 \208\191\209\128\209\139\208\179\208\176\208\181\209\130"
        }, 
        [15] = {
            [1] = "\208\148\208\187\209\143 \209\130\208\181\208\177\209\143 \208\188\208\176\209\128\209\136\209\128\209\131\209\130 \208\191\208\190\209\129\209\130\209\128\208\190\208\181\208\189", 
            [2] = "\209\129\209\138\208\181\208\177\208\176\208\187 \209\129 \208\179\208\187\208\176\208\183 \208\188\208\190\208\184\209\133"
        }, 
        [17] = {
            [1] = "neverlose.cc\\market\\item?id=bkRCJa", 
            [2] = "\208\191\208\190\208\186\208\176 \208\178 \208\180\208\181\208\180\208\181 \208\178\208\190\209\130 \208\191\208\190\209\135\208\181\208\186\208\176\208\185"
        }, 
        [18] = {
            [1] = "\208\181\208\177\208\176\208\189\209\131\209\130\208\176\209\143 \208\187\209\131\208\176", 
            [2] = "\208\189\208\181 \208\180\209\131\208\188\208\176\208\187 \209\135\209\130\208\190 \208\190\208\189\208\176 \209\130\208\176\208\186 \208\177\209\131\209\129\209\130\208\184\209\130"
        }, 
        [19] = {
            [1] = "\208\161\208\177\208\184\209\130 \208\189\208\176\209\133\209\131\208\185", 
            [2] = "\208\162\209\139 \208\191\209\128\209\143\208\188 \208\186\208\176\208\186 \208\177\208\181\209\129\208\191\208\184\208\187\208\190\209\130\208\189\208\184\208\186"
        }, 
        [21] = {
            [1] = "\208\156\208\190\208\186\209\128\209\139\208\185 \208\186\209\128\208\190\209\129\208\190\208\178\208\190\208\186?", 
            [2] = "\208\152\208\187\208\184 \208\191\209\128\208\190\209\129\209\130\208\190 \208\181\208\177\208\187\208\176\208\189 \209\129 \208\189\208\190\209\128\209\130\208\190\208\189"
        }, 
        [23] = {
            [1] = "\209\130\209\139 \208\176\209\132\208\186 \208\184\208\187\208\184 \209\135\208\181?", 
            [2] = "\208\176 \209\130\208\190 \209\133\209\131\208\185 \208\191\208\190\208\185\208\188\208\181\209\136\209\140 \209\130\208\190 \208\188\209\131\208\178\208\176\208\181\209\130\209\129\209\143 \209\130\208\190 \209\135\208\181\209\130 \209\129\208\184\208\180\208\184\209\130 \208\180\209\128\208\190\209\135\208\184\209\130.", 
            [3] = "\208\186\208\190\209\128\208\190\209\135\208\181 \208\191\208\190\209\129\208\191\208\190\209\128\209\130\208\184\208\178\208\189\208\181\208\185 \208\191\208\190 \208\191\208\176\208\177\208\187\208\190\209\129\209\131 \208\191\208\181\209\128\208\181\208\180\208\178\208\184\208\179\208\176\208\185\209\129\209\143."
        }, 
        [26] = {
            [1] = "\208\155\208\177\209\131 \208\178\208\186\208\187\209\142\209\135\208\184 \209\131\209\136\208\176\209\129\209\130\209\139\208\185", 
            [2] = " \208\176 \209\130\208\190 \208\189\208\181 \208\190\209\137\209\131\209\137\208\176\209\142"
        }, 
        [28] = {
            [1] = "\208\184\209\137\208\184 \209\129\208\181\208\177\209\143 \208\178 ", 
            [2] = "\209\133\208\190\209\130\209\143 \208\186\208\190\208\188\209\131 \209\130\209\139 \208\189\209\131\208\182\208\181\208\189"
        }, 
        [31] = {
            [1] = "\208\187\208\184\208\178\208\176\208\185 \209\129\209\139\208\189 \209\136\208\187\209\142\209\133\208\184 \209\143 \208\189\208\176 \208\191\208\176\208\177\208\181", 
            [2] = "\209\133\208\176\208\189\208\176 \208\178\209\129\208\181\208\188 \208\189\208\176\209\133\209\131\208\185"
        }, 
        [36] = {
            [1] = "neverlose.cc\\market\\item?id=bkRCJa", 
            [2] = "\208\191\209\128\208\184\208\186\209\131\208\191\208\184 \208\188\208\177 \208\191\208\190\208\187\208\181\208\179\209\135\208\181 \209\129\209\130\208\176\208\189\208\181\209\130"
        }, 
        [38] = {
            [1] = "\209\130\209\139 \209\130\208\184\208\191\208\190 \208\189\208\176 \208\176\208\178\208\191 \208\186\208\190\208\191\208\184\209\136\209\140 \208\184\208\187\208\184 \208\178 \209\135\208\181\208\188 \208\191\209\128\208\181\208\186 ?", 
            [2] = "\209\132\208\184\208\189\208\176\208\189\209\129\208\184\209\129\209\130 \209\133\209\128\208\181\208\189\208\190\208\178"
        }
    }
};
v1454.trash_enemy_body.counter = utils.random_int(1, #v1454.trash_enemy_body.phrase);
v1454.trash_local_head = {
    counter = 1, 
    phrase = {
        [1] = "\209\143 \208\178 \208\176\209\133\209\131\208\181 \208\178\209\139\208\187\209\131\208\191\208\184\208\187\209\129\209\143 \209\131\208\181\208\177\208\176\208\189 \209\131\208\182\208\181 \208\191\208\190 \208\186\208\187\208\176\208\178\208\184\208\176\209\130\209\131\209\128\208\181 \209\130\209\139\209\128\208\186\208\176\208\181\209\130", 
        [2] = nil, 
        [3] = "\208\146\208\181\208\183\209\131\209\135\208\184\208\185 \209\133\209\131\208\181\208\179\208\187\208\190\209\130", 
        [4] = nil, 
        [5] = "\208\179\208\180\208\181 \209\130\208\176\208\186\208\184\208\181 \208\189\208\184\208\186\208\184 \209\136\209\130\208\176\208\188\208\191\209\131\209\142\209\130 \208\190\209\130 \209\130\208\181\208\177\209\143 \209\128\208\181\208\176\208\187\209\140\208\189\208\190 \209\129\208\188\208\181\209\136\208\189\208\190 \209\131\208\188\208\184\209\128\208\176\209\130\209\140", 
        [6] = nil, 
        [7] = "\209\135\209\130\208\190 \209\130\209\139 \208\180\208\181\208\187\208\176\208\181\209\136\209\140", 
        [8] = "\208\177\209\131\209\128\208\188\208\176\208\187\208\180\208\176 \208\181\208\177\208\176\208\189\208\176\209\143", 
        [9] = nil, 
        [10] = "\208\189\209\131 \209\143 \208\188\208\176\209\130\209\140 \209\130\208\178\208\190\209\142 \209\128\208\181\208\183\208\176\208\187", 
        [11] = nil, 
        [12] = nil, 
        [13] = nil, 
        [14] = nil, 
        [15] = "))", 
        [16] = "\208\189\208\176\208\186\208\190\208\189\208\181\209\134 \209\130\208\190 \209\131 \208\189\208\181\208\179\208\190 \208\191\208\190\208\187\209\131\209\135\208\184\208\187\208\190\209\129\209\140", 
        [2] = {
            [1] = "\208\167\209\130\208\190\208\177 \209\130\208\178\208\190\209\143 \208\188\208\176\209\130\209\140 \209\130\208\181\208\177\208\181 \209\130\208\176\208\186 \208\191\208\190\208\187\208\190\208\178\208\189\208\184\208\186\208\190\208\188 \209\131\208\181\208\177\208\176\208\187\208\176", 
            [2] = "\209\129\209\139\208\189 \209\130\208\178\208\176\209\128\208\184 \208\190\208\180\208\189\208\190\208\189\208\190\208\179\208\190\208\185                  "
        }, 
        [4] = {
            [1] = "\208\191\208\190\209\133\209\131\208\185", 
            [2] = "\208\181\208\177\208\176\208\189\209\139\208\185 \209\137\208\181\208\179\208\190\208\187 \208\178\209\139\208\187\209\131\208\191\208\184\208\187\209\129\209\143 \208\184\208\183 \208\191\208\184\208\183\208\180\209\139 \209\129\208\178\208\190\208\181\208\185 \208\188\208\176\209\130\208\181\209\128\208\184 \209\136\208\178\208\176\208\177\209\128\209\139 \208\184 \208\190\208\189\208\176 \208\181\208\188\209\131 \208\189\208\176 \209\130\209\128\208\176\209\129\209\129\208\181 \208\189\208\176\209\129\208\190\209\129\208\176\208\187\208\176 \209\131 \208\190\209\130\209\134\208\176 \208\180\208\176\208\187\209\140\208\189\208\190\208\177\208\190\208\185\209\137\208\184\208\186\208\176 \208\189\208\176 \208\191\208\190\208\180\208\191\208\184\209\129\208\186\209\131    "
        }, 
        [6] = {
            [1] = "ye fkj [etcjc", 
            [2] = "\208\177\208\187\209\143\209\130\209\140 \208\191\208\190\209\136\208\181\208\187 \208\189\208\176\209\133\209\131\208\185", 
            [3] = "\208\178\209\139\209\129\208\181\209\128 \208\178 \208\191\208\190\208\191\209\139\209\130\208\186\208\176\209\133 \208\188\208\181\208\189\209\143 \209\131\208\177\208\184\209\130\209\140 \209\130\208\176\208\188 \208\186\208\187\208\176\208\178\209\131 \209\135\209\131\209\130\209\140 \208\189\208\181 \208\191\208\181\209\128\208\181\208\178\208\181\209\128\208\189\209\131\208\187     "
        }, 
        [9] = {
            [1] = "\208\180\208\181\209\128\208\181\208\178\209\143\208\189\208\189\208\176\209\143 \209\130\209\139 \209\133\209\131\208\185\208\189\209\143", 
            [2] = "\208\186\209\131\208\180\208\176 \209\130\209\139 \209\129\209\131\208\186\208\176 \208\191\208\190\208\191\208\176\208\180\208\176\208\181\209\136\209\140 \208\178 \208\188\208\181\208\189\209\143            "
        }, 
        [11] = {
            [1] = "\208\177\208\187\209\143", 
            [2] = "\209\130\209\139 \208\178\208\190\208\190\208\177\209\137\208\181 \208\181\208\177\208\187\208\176\208\189 \208\189\208\176\209\133\209\131\208\185      ", 
            [3] = "\209\130\209\131\208\191\208\190\209\128\209\139\208\187\208\176\209\143 \209\133\209\131\208\181\209\130\208\176     ", 
            [4] = "\208\190\208\189\208\190 \208\182\208\181 \208\184\208\179\209\128\208\190\208\186\208\190\208\188 \209\129\208\181\208\177\209\143 \209\129\209\135\208\184\209\130\208\176\208\181\209\130       "
        }, 
        [12] = {
            [1] = "\208\189\209\131 \209\143 \208\181\208\177\208\176\208\187 \209\135\209\130\208\190 \209\130\209\139 \209\130\208\178\208\190\209\128\208\184\209\136\209\140", 
            [2] = "\209\129\208\176\208\188\208\190\209\128\208\190\208\180\208\190\208\186 2024"
        }, 
        [13] = {
            [1] = "\208\177\208\187\209\143\209\130\209\140 \209\129\209\131\208\186\208\176 \208\176\208\189\209\128\208\181\208\179     ", 
            [2] = "\208\186\208\176\208\186 \208\182\208\181 \208\181\208\188\209\131 \208\191\208\190\208\178\208\181\208\183\208\187\208\190        ", 
            [3] = "\209\129\208\188\208\190\209\130\209\128\208\184\209\130\208\181 \208\189\208\176 \209\141\209\130\209\131 \208\189\208\181\208\180\208\190\208\189\208\190\209\136\208\181\208\189\208\189\209\131\209\142 \209\133\209\131\208\181\209\130\209\131            "
        }, 
        [14] = {
            [1] = "\208\177\208\187\209\143 \208\189\209\131 \208\190\208\189\208\190 \208\182\208\181 \209\133\209\131\208\181\208\179\208\187\208\190\209\130\208\190\208\178 \208\191\208\190 \209\130\208\184\208\191\209\131 \209\130\209\128\209\142\208\186\208\176\209\135\208\176 \208\189\208\176\209\129\208\188\208\190\209\130\209\128\208\181\208\187\208\190\209\129\209\140", 
            [2] = "\209\130\208\181\208\191\208\181\209\128\209\140 \208\191\208\190 \208\191\208\176\208\177\208\187\209\131 \208\191\209\139\209\130\208\176\208\181\209\130\209\129\209\143 \209\130\209\131\209\130 \208\188\208\190\208\183\208\179 \208\178\209\139\209\129\209\128\208\176\209\130\209\140 \209\135\208\181\209\128\208\181\208\183 \208\179\208\187\208\176\208\183"
        }, 
        [17] = {
            [1] = "\208\189\208\184\209\133\209\131\209\143", 
            [2] = "\209\143 \208\180\209\131\208\188\208\176\208\187 \209\131 \209\130\208\181\208\177\209\143 \209\128\208\181\208\185\208\180\208\182\208\177\208\190\209\130 \208\178\209\139\208\186\208\187\209\142\209\135\208\181\208\189"
        }
    }
};
v1454.trash_local_head.counter = utils.random_int(1, #v1454.trash_local_head.phrase);
v1454.trash_local_body = {
    counter = 1, 
    phrase = {
        [1] = nil, 
        [2] = nil, 
        [3] = "\208\157\208\176\208\185\209\129 \208\191\208\190\208\180\208\186\209\128\209\131\209\130\208\186\208\176 \208\176\208\180\208\188\208\184\208\189\209\129\208\186\208\176\209\143", 
        [4] = "\209\135\208\181 \209\141\209\130\208\190", 
        [5] = nil, 
        [6] = nil, 
        [7] = "\208\189\208\181 \209\128\208\176\209\129\209\129\208\187\208\176\208\177\208\187\209\143\208\185\209\129\209\143 \208\178 \208\189\208\181\208\186\209\129\209\130 \209\128\208\176\209\131\208\189\208\180\208\181 \209\143 \209\130\208\181\208\177\208\181 \208\189\208\176\209\129\209\130\209\131\209\135\209\131 \208\191\208\190 \208\181\208\177\208\187\209\131", 
        [8] = "\208\177\208\187\209\143 \208\191\208\190\208\185\208\180\209\131 \208\186\208\176\208\187\208\184\208\186 \209\128\208\176\208\183\208\180\209\131\209\142 \208\189\208\176\209\133\209\131\208\185 \209\141\209\130\209\131 \208\184\208\179\209\128\209\131", 
        [9] = nil, 
        [10] = "\208\180\208\176 \209\143 \208\181\208\177\208\176\208\187 \208\188\208\181\208\189\209\143 \209\130\208\181\208\191\208\189\209\131\208\187\208\190 \208\189\208\176\209\133\209\131\208\185", 
        [11] = "))", 
        [12] = "\208\189\208\176\208\186\208\190\208\189\208\181\209\134 \209\130\208\190 \209\131 \208\189\208\181\208\179\208\190 \208\191\208\190\208\187\209\131\209\135\208\184\208\187\208\190\209\129\209\140", 
        [1] = {
            [1] = "\208\144 \208\178 \208\179\208\190\208\187\208\190\208\178\209\131 \209\129\208\187\208\176\208\177\208\190 \209\135\208\184\209\133\208\191\209\139\209\133 \208\181\208\177\208\176\208\189\209\139\208\185", 
            [2] = "\208\189\208\181\208\188\208\190\209\137\209\140"
        }, 
        [2] = {
            [1] = "\208\146 \208\189\208\181\208\186\209\129\209\130 \209\128\208\176\209\131\208\189\208\180\208\181 \208\178\209\139\208\181\208\177\209\131 \209\130\209\143", 
            [2] = "\209\130\209\131\209\130\208\186\208\176\209\135\208\190\208\189\208\190\208\186"
        }, 
        [5] = {
            [1] = "\209\135\208\181 \208\183\208\176 \209\133\209\131\208\181\209\129\208\190\209\129 \208\189\208\176 \208\188\208\181\209\129\209\130\208\181 \209\129\209\130\208\190\208\184\209\130", 
            [2] = "\209\136\208\187\209\142\209\133\208\176 \208\189\208\176\209\133\209\131\208\185 \208\180\208\190\209\128\208\190\208\182\208\189\208\176\209\143"
        }, 
        [6] = {
            [1] = "\208\184 \208\190\208\189\208\190 \208\189\208\176\208\183\209\139\208\178\208\176\208\181\209\130 \209\129\208\181\208\177\209\143 \208\152\208\179\209\128\208\190\208\186\208\190\208\188", 
            [2] = "\208\188\208\176\208\186\209\129\208\184\208\188\209\131\208\188 \209\130\209\139 \209\133\209\131\208\181\208\179\208\187\208\190\209\130 \208\184\208\183 \209\130\209\128\209\131\209\137\208\190\208\177"
        }, 
        [9] = {
            [1] = "\209\143 \208\177\208\181\208\183 \208\190\209\128\209\131\208\182\208\184\209\143 \208\177\209\139\208\187 \209\129\209\131\208\186\208\176      ", 
            [2] = "\208\191\208\176\208\180\208\187\208\176 \208\189\208\181\208\178\209\139\208\189\208\190\209\129\208\184\208\188\208\176\209\143"
        }, 
        [13] = {
            [1] = "\208\189\208\184\209\133\209\131\209\143", 
            [2] = "\209\143 \208\180\209\131\208\188\208\176\208\187 \209\131 \209\130\208\181\208\177\209\143 \209\128\208\181\208\185\208\180\208\182\208\177\208\190\209\130 \208\178\209\139\208\186\208\187\209\142\209\135\208\181\208\189"
        }, 
        [14] = {
            [1] = "\209\141\209\130\208\190 \208\182\208\181 \208\186\208\176\208\186 \208\180\208\190\208\187\208\182\208\189\208\190 \208\177\209\139\208\187\208\190 \208\191\208\190\208\178\208\181\209\129\209\130\208\184 \209\135\209\130\208\190\208\177\209\139 \209\130\209\139 \209\129\208\188\208\190\208\179 \208\188\208\181\208\189\209\143 \209\131\208\177\208\184\209\130\209\140", 
            [2] = "\209\135\209\130\208\190 \209\130\208\190 \208\189\208\176 \209\131\209\128\208\190\208\178\208\189\208\181 \209\132\208\176\208\189\209\130\208\176\209\129\209\130\208\184\208\186\208\184"
        }
    }
};
v1454.trash_local_body.counter = utils.random_int(1, #v1454.trash_local_body.phrase);
v1454.trash_enemy_molotov = {
    counter = 1, 
    phrase = {
        [1] = nil, 
        [2] = "\208\162\209\139 \208\178\208\190\208\190\208\177\209\137\208\181 \208\178 \208\186\209\131\209\128\209\129\208\176\209\133 \209\135\209\130\208\190 \209\129\208\188\208\190\208\186 \209\131 \209\130\208\181\208\177\209\143 \208\177\209\139\208\187", 
        [3] = "\208\157\208\176\209\129\209\129\208\176\208\187 \208\177\209\139 \209\131\208\182\208\181 \208\191\208\190\208\180 \209\129\208\181\208\177\209\143 \209\135\208\181\208\188 \209\130\208\176\208\186 \209\131\208\188\208\184\209\128\208\176\209\130\209\140", 
        [1] = {
            [1] = "\208\144 \208\189\208\176\209\133\209\131\208\185 \209\130\209\139 \209\129\208\179\208\190\209\128\208\181\208\187?", 
            [2] = "\208\163\208\188\209\139\208\187\209\129\209\143 \208\178 \209\129\208\190\208\191\208\187\209\143\209\133"
        }, 
        [4] = {
            [1] = "\208\159\208\190\208\180\208\186\209\131\209\128 \208\191\208\190\209\136\208\181\208\187", 
            [2] = "\208\146\208\184\208\189\209\129\209\130\208\176\208\186 \208\184\208\187\208\184 \208\188\208\176\208\187\209\140\208\177\208\190\209\128\208\190"
        }
    }
};
v1454.trash_enemy_molotov.counter = utils.random_int(1, #v1454.trash_enemy_molotov.phrase);
v1454.trash_enemy_hegrenade = {
    counter = 1, 
    phrase = {
        [1] = "\208\145\208\176\208\177\208\176\209\133 \209\131\208\181\208\177\208\184\209\137\208\181", 
        [2] = "\208\162\209\139 \209\135\208\181 \208\178\208\190\208\190\208\177\209\137\208\181 \208\189\208\184\209\133\209\131\209\143 \208\189\208\181 \208\178\208\184\208\180\208\184\209\136\209\140", 
        [3] = "\209\133\209\141\208\185 \208\179\208\176\208\185\209\129 \209\131 \208\177\208\184\209\135\208\176 \208\178\209\129\208\181 \208\189\208\176\208\185\209\129", 
        [4] = "TNT\209\136\208\189\209\131\209\130"
    }
};
v1454.trash_enemy_hegrenade.counter = utils.random_int(1, #v1454.trash_enemy_hegrenade.phrase);
v1454.trash_revenge = {
    counter = 1, 
    phrase = {
        [1] = "1.", 
        [2] = "\208\167\208\181 \208\180\209\131\208\188\208\176\208\187 \209\130\208\181\208\177\208\181 \208\181\209\137\208\181 \209\128\208\176\208\183 \208\191\208\190\208\178\208\181\208\183\208\181\209\130?", 
        [3] = "\209\129\208\178\208\176\208\187\208\184\208\187\209\129\209\143 \209\131\208\181\208\177\208\176\208\189 \209\129\208\187\208\176\208\177\208\181\208\185\209\136\208\184\208\185", 
        [4] = nil, 
        [5] = "\209\130\209\131\209\136\208\184 \209\129\208\178\208\181\209\130 \208\178\209\139\208\177\208\187\209\143\208\180\208\190\208\186 \209\129\208\187\208\176\208\177\209\139\208\185", 
        [6] = "1 \209\129\209\139\208\189 \209\136\208\176\209\133\208\181\209\130\209\128\208\176 \208\181\208\177\208\187\208\184\208\178\209\139\208\185", 
        [7] = "\208\159\208\181\209\128\208\181\208\184\208\179\209\128\208\176\208\189 \208\186\208\190\208\177\209\139\208\187\208\176 \208\181\208\177\208\176\208\189\208\176\209\143", 
        [4] = {
            [1] = "\209\130\209\139 \208\187\208\190\209\131", 
            [2] = "\208\180\209\143\208\180\209\143                     "
        }, 
        [8] = {
            [1] = "\208\152\208\183\208\184 \209\133\209\131\208\181\209\129\208\190\209\129", 
            [2] = "\208\148\209\131\208\188\208\176\208\187\208\186\209\131 \208\178\208\186\208\187\209\142\209\135\208\176\208\185 \209\133\208\190\209\130\209\140 \208\184\208\189\208\190\208\179\208\180\208\176"
        }
    }
};
v1454.trash_revenge.counter = utils.random_int(1, #v1454.trash_revenge.phrase);
v1454.trash_enemy_zeus = {
    counter = 1, 
    phrase = {
        [1] = "\208\157\208\176\209\141\208\187\208\181\208\186\209\130\209\128\208\184\208\183\208\190\208\178\208\176\208\189 \208\191\208\184\208\180\208\190\209\128\208\176\209\129", 
        [2] = nil, 
        [3] = "\208\189\208\176 \208\183\208\181\208\178\209\129\208\181 \208\177\208\190\209\130\209\143\209\128\208\176 \208\181\208\177\208\176\208\189\208\176\209\143", 
        [4] = "\208\163\208\178\208\176\209\128\208\190\209\130 \208\189\208\176\208\182\208\184\208\188\208\176\208\185 \209\133\208\190\209\130\209\140 \208\184\208\189\208\190\208\179\208\180\208\176", 
        [2] = {
            [1] = "\208\157\209\131 \208\176 \209\133\209\131\208\187\208\184 \209\130\209\139 \208\180\209\131\208\188\208\176\208\187 220 \208\178\208\190\208\187\209\140\209\130 \209\130\209\131\209\130", 
            [2] = "\208\146\208\186\208\187\209\142\209\135\208\176\208\185 \208\176\208\189\209\130\208\184\208\183\208\181\208\178\209\129\208\184\208\187\208\186\209\131"
        }
    }
};
v1454.trash_enemy_zeus.counter = utils.random_int(1, #v1454.trash_enemy_zeus.phrase);
v1454.trash_enemy_knife = {
    counter = 1, 
    phrase = {
        [1] = nil, 
        [2] = "\208\157\208\176 \208\189\208\190\208\182\208\181 \209\130\208\181\209\128\208\191\208\184\208\187\208\176", 
        [3] = "\208\163\209\136\208\184 \209\130\208\181\208\177\208\181 \208\190\209\130\209\128\208\181\208\183\208\176\208\187", 
        [4] = "\208\161\208\191\208\190\208\186\208\190\208\185\208\189\208\190\208\185 \208\189\208\190\209\135\208\184 \208\180\208\190\208\187\208\177\208\176\208\181\208\177", 
        [1] = {
            [1] = "\208\157\208\176 \208\188\209\143\209\129\208\181", 
            [2] = "\208\154\208\190\208\187\208\177\208\176\209\129\208\176 \208\181\208\177\208\176\208\189\208\176\209\143"
        }
    }
};
v1454.trash_enemy_knife.counter = utils.random_int(1, #v1454.trash_enemy_knife.phrase);
v1454.trash_revenge_id = nil;
v1454.last_kill = nil;
v1454.trashtalk_list = {};
events.player_death:set(function(v1521)
    -- upvalues: v117 (ref), l_get_local_player_0 (ref), v1454 (ref)
    if not v117.ui_tables.misc.trashtalk_switch.value then
        return;
    else
        local v1522 = entity.get(v1521.userid, true);
        if not v1522 then
            return;
        else
            local v1523 = entity.get(v1521.attacker, true);
            if v1523 == entity.get(0) then
                return;
            else
                local l_headshot_0 = v1521.headshot;
                local v1525 = v1521.weapon == "taser";
                local v1526 = v1521.weapon == "hegrenade";
                local v1527 = v1521.weapon == "inferno";
                local v1528 = v1521.weapon:find("knife");
                local v1529 = nil;
                local v1530 = false;
                local v1531 = l_get_local_player_0();
                if v1522 == v1531 and v1523 ~= v1531 and v1523:is_enemy() then
                    v1529 = false;
                    v1454.last_kill = v1523;
                end;
                if v1522 ~= v1531 and v1523 == v1531 and v1522:is_enemy() then
                    v1529 = true;
                end;
                if v1454.last_kill == v1522 then
                    v1530 = true;
                end;
                if v1529 == nil and not v1530 then
                    return;
                else
                    local v1532 = nil;
                    local v1533 = 0;
                    local l_ref_14 = v117.ui_tables.misc.trash_type.ref;
                    if v1529 then
                        if not l_ref_14:get(1) then
                            return;
                        elseif l_headshot_0 then
                            v1533 = "enemy_head";
                            v1532 = v1454.trash_enemy_head;
                        else
                            local v1535 = true;
                            if v1526 then
                                v1532 = v1454.trash_enemy_hegrenade;
                                v1533 = "he";
                                v1535 = false;
                            end;
                            if v1527 then
                                v1532 = v1454.trash_enemy_molotov;
                                v1533 = "molotov";
                                v1535 = false;
                            end;
                            if v1525 then
                                v1532 = v1454.trash_enemy_zeus;
                                v1533 = "zeus";
                                v1535 = false;
                            end;
                            if v1528 then
                                v1532 = v1454.trash_enemy_knife;
                                v1533 = "knife";
                                v1535 = false;
                            end;
                            if v1535 then
                                v1533 = "enemy_body";
                                v1532 = v1454.trash_enemy_body;
                            end;
                        end;
                    elseif v1530 then
                        if not l_ref_14:get(3) then
                            return;
                        else
                            v1533 = "revenge";
                            v1532 = v1454.trash_revenge;
                            v1454.last_kill = nil;
                        end;
                    elseif not l_ref_14:get(2) then
                        return;
                    elseif l_headshot_0 then
                        v1533 = "local_head";
                        v1532 = v1454.trash_local_head;
                    else
                        v1533 = "local_body";
                        v1532 = v1454.trash_local_body;
                    end;
                    local l_counter_0 = v1532.counter;
                    local v1537 = v1522:get_name();
                    if not v117.ui_tables.misc.trashtalk_switch.value then
                        return;
                    else
                        local v1538 = v1532.phrase[l_counter_0];
                        v1532.counter = v1532.counter + 1;
                        if #v1532.phrase < v1532.counter then
                            v1532.counter = 1;
                        end;
                        if type(v1538) == "table" then
                            if v1538[1] == "log" then
                                v1538[1] = string.format("extension Hit %s head for %s(%s) (0 hp remaining) backtrack: %s hitchance: %s", v1537, 100 + utils.random_int(0, 100), utils.random_int(1, 10), utils.random_int(30, 40), utils.random_int(1, 30));
                            end;
                            if v1538[1] == "death" then
                                v1538[1] = string.format("*\208\156\208\149\208\160\208\162\208\146* %s", v1537);
                            end;
                            for v1539 = 1, #v1538 do
                                table.insert(v1454.trashtalk_list, {
                                    time = #v1538[v1539] * 0.034, 
                                    text = v1538[v1539]
                                });
                            end;
                            return;
                        else
                            table.insert(v1454.trashtalk_list, {
                                time = #v1538 * 0.032, 
                                text = v1538
                            });
                            return;
                        end;
                    end;
                end;
            end;
        end;
    end;
end);
v1454.trashtalk_curtime = 0;
events.render:set(function()
    -- upvalues: v117 (ref), v1454 (ref), l_abs_0 (ref)
    if not v117.ui_tables.misc.trashtalk_switch.value then
        v1454.trashtalk_list = {};
        return;
    else
        if l_abs_0(v1454.trashtalk_curtime - globals.curtime) > 10 then
            v1454.trashtalk_curtime = globals.curtime;
            v1454.trashtalk_list = {};
        end;
        if v1454.trashtalk_curtime - globals.curtime > 0 then
            return;
        else
            for v1540 = 1, #v1454.trashtalk_list do
                local v1541 = v1454.trashtalk_list[v1540];
                if v1541.time < 0.8 then
                    v1541.time = 0.8;
                end;
                do
                    local l_v1541_0 = v1541;
                    utils.execute_after(l_v1541_0.time, function()
                        -- upvalues: l_v1541_0 (ref)
                        utils.console_exec("say \"" .. l_v1541_0.text .. "\"");
                    end);
                    v1454.trashtalk_curtime = globals.curtime + l_v1541_0.time;
                    table.remove(v1454.trashtalk_list, v1540);
                end;
                break;
            end;
            return;
        end;
    end;
end);
events.round_start:set(function()
    -- upvalues: v1454 (ref)
    v1454.last_kill = nil;
end);
events.render:set(function()
    -- upvalues: v37 (ref)
    local v1543 = {
        ui.get_style("Link Active"):to_hsv()
    };
    local v1544 = ui.get_style("Link Active");
    local v1545 = color(255):as_hsv(v1543[1], math.max(v1543[2] - 0.2, 0), math.max(v1543[3] - 0.5, 0));
    local v1546 = ui.get_style("Link Active");
    local v1547 = globals.curtime * 6 % 23 - 2;
    local v1548 = {};
    for v1549 = 1, 9 do
        local v1550 = v1549 < v1547 and v1547 - v1549 or v1549 - v1547;
        if v1549 < v1547 then
            if v1550 <= 5 then
                v1548[v1549] = v1545;
            elseif v1550 <= 8 then
                v1550 = (v1550 - 5) / 3;
                v1548[v1549] = v37.calculate_color(v1546, v1545, v1550);
            else
                v1550 = (v1550 - 8) / 4;
                v1548[v1549] = v37.calculate_color(v1544, v1546, v1550);
            end;
        else
            v1550 = v1550 / 3;
            v1548[v1549] = v37.calculate_color(v1544, v1545, v1550);
        end;
    end;
    local v1551 = "Extension";
    local v1552 = "";
    for v1553 = 1, #v1551 do
        v1552 = v1552 .. "\a" .. v1548[v1553]:to_hex() .. v1551:sub(v1553, v1553);
    end;
    ui.sidebar(v1552 .. " ", "\a" .. v1548[1]:to_hex() .. "\238\140\187");
end);
utils.execute_after(0.5, function()
    -- upvalues: v9 (ref)
    v9("\aFFFFFFFFext - " .. "\a{Link Active}" .. common.get_username() .. "\n");
end);