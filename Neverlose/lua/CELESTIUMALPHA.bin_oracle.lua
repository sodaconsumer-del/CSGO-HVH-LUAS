if not LPH_NO_VIRTUALIZE then
    LPH_NO_VIRTUALIZE = function(...)
        return ...;
    end;
end;
ui.sidebar("Celestium", ui.get_icon("star-shooting"));
LPH_NO_VIRTUALIZE(function(v0, v1, v2, v3, v4, v5)
    local v6 = {};
    local v7 = {};
    local v8 = {};
    local v9 = v5();
    local l_clipboard_0 = v9.clipboard;
    local l_drag_system_0 = v9.drag_system;
    local l_pui_0 = v9.pui;
    local l_defensivetick_0 = v9.defensivetick;
    local l_mtools_0 = v9.mtools;
    local l_edgeyaw_0 = v9.edgeyaw;
    local _ = v9.inspect;
    local l_math_0 = math;
    local l_cvar_0 = cvar;
    local l_globals_0 = globals;
    local l_table_0 = table;
    local l_string_0 = string;
    local l_entity_0 = entity;
    local l_rage_0 = rage;
    local l_common_0 = common;
    local l_bit_0 = bit;
    local l_utils_0 = utils;
    local l_ui_0 = ui;
    local function v28(...)
        -- upvalues: l_math_0 (ref), l_defensivetick_0 (ref)
        return l_math_0.abs(l_defensivetick_0(...));
    end;
    local _ = "https://i.ibb.co/0hZqFWq/resim.png";
    ffi.cdef("\t\ttypedef struct {\n\t\t\tfloat x, y, z;\n\t\t} Vector;\n\t");
    local l_status_0, l_result_0 = pcall(function()
        -- upvalues: l_common_0 (ref)
        return render.load_image(network.get("https://neverlose.cc/static/avatars/" .. l_common_0.get_username() .. ".png"));
    end);
    v1.calibri = render.load_font("Calibri Bold", vector(25, 22, -1), "a, d");
    v1.comfortaa = v0.run(function()
        -- upvalues: l_common_0 (ref), v1 (ref)
        local l_status_1, l_result_1 = pcall(function()
            return render.load_font("Comfortaa", vector(13, 10, 0), "a, d");
        end);
        if l_status_1 then
            return l_result_1;
        else
            l_common_0.add_notify("Celestium", "font not found. please download and install the font from 'home > files'");
            return v1.calibri;
        end;
    end);
    local v34 = nil;
    local v48 = {
        __index = {
            names = {}, 
            new = function(v35, v36, v37, v38)
                -- upvalues: l_table_0 (ref)
                if type(v37) ~= "function" and v37 then
                    v38 = v37;
                end;
                v35.names[v38] = v35.names[v38] or {};
                l_table_0.insert(v35.names[v38], {
                    event_type = type(v36) ~= "table" and "run" or "set", 
                    event = v36, 
                    value = v37, 
                    name = v38
                });
                local v39 = v35.names[v38][1];
                if v39.event_type == "run" then
                    events[v39.event](function(...)
                        -- upvalues: v39 (ref)
                        v39.value(...);
                    end);
                elseif v39.event_type == "set" then
                    local v40 = v39.event[1];
                    local v41 = v39.event[2];
                    local v42 = v39.event[3];
                    do
                        local l_v41_0, l_v42_0 = v41, v42;
                        v40:set_callback(function(_)
                            -- upvalues: l_v42_0 (ref), l_v41_0 (ref)
                            if not l_v42_0 then
                                if type(l_v41_0) == "table" then
                                    for _, v47 in next, l_v41_0 do
                                        v47:override();
                                    end;
                                elseif type(l_v41_0) == "function" then
                                    l_v41_0();
                                else
                                    l_v41_0:override();
                                end;
                            end;
                        end);
                    end;
                end;
            end
        }
    };
    v34 = setmetatable({}, v48);
    v48 = {
        [1] = 2, 
        [2] = 16
    };
    v6.__index = v6;
    v6.isdefensive = function(_)
        -- upvalues: v28 (ref), l_entity_0 (ref), v48 (ref), v8 (ref)
        local v50 = v28(l_entity_0.get_local_player(), true) > v48[1] and v28(l_entity_0.get_local_player(), true) < v48[2];
        if v8.pstat.defensive_session:get() == "Dynamic" then
            v48[1] = v50 == false and 2 or 2;
            v48[2] = v50 == false and 14 or 16;
        elseif v8.pstat.defensive_session:get() == "Default" then
            v48[1] = 1;
            v48[2] = 15;
        end;
        return v50, {
            v48, 
            v28(l_entity_0.get_local_player(), true)
        };
    end;
    v6.new = function(_, v52)
        -- upvalues: v6 (ref)
        local v53 = {
            value = v52
        };
        return setmetatable(v53, v6);
    end;
    v6.lerp = function(v54, v55, v56)
        -- upvalues: l_globals_0 (ref)
        v54.value = v54.value + (v55 - v54.value) * l_globals_0.frametime * v56;
        return v54.value;
    end;
    v6.unpack = function(v57)
        return v57.value;
    end;
    v6.ready = function(_, v59)
        return not not v59:get() or v59:get_override() and true or false;
    end;
    v6.unpack = function(_, v61, v62)
        if not v62 then
            return {
                [1] = nil, 
                [2] = true, 
                [1] = v61
            };
        elseif v61 and v62 then
            return v61[v62];
        else
            return;
        end;
    end;
    v6.cmp = function(_, v64, v65)
        -- upvalues: l_table_0 (ref)
        if not v65[2] then
            error("database failure, >> [ code: " .. l_table_0.concat(v64, ",") .. " ] : cmp >> " .. v65, 10);
        end;
        return {
            [1] = v65[1], 
            [2] = v64
        };
    end;
    v6.create = function(_, v67)
        return v67:create();
    end;
    v6.tolevel = function(_, v69)
        -- upvalues: v4 (ref)
        return ("0x%X"):format(v4(v69));
    end;
    v6.dump_value = function(_, v71, v72)
        if type(v71) ~= "table" then
            return;
        elseif type(v72) ~= "table" then
            return;
        else
            if not v72 then
                v72 = {};
            end;
            for v73, v74 in next, v71 do
                v72[v73] = v74;
            end;
            return v72;
        end;
    end;
    v6.set_param = function(_, v76, v77)
        -- upvalues: l_entity_0 (ref)
        l_entity_0.get_local_player().m_flPoseParameter[v76] = v77;
    end;
    v6.format = function(_, v79, ...)
        -- upvalues: v2 (ref), l_string_0 (ref)
        local v81 = v79:gsub("%[([a-z]+)%]", function(v80)
            -- upvalues: v2 (ref)
            return v2[v80] or " ";
        end);
        return l_string_0.format(v81, ...);
    end;
    v6.procces_tick = function(_, v83)
        -- upvalues: l_cvar_0 (ref)
        if not v83 then
            v83 = 16;
        end;
        l_cvar_0.sv_maxusrcmdprocessticks:int(v83);
    end;
    v6.new_tooltip = function(_, v85, v86, v87)
        -- upvalues: l_ui_0 (ref), l_string_0 (ref)
        if not v87 then
            v87 = 1;
        end;
        local v88 = {
            [1] = " \v" .. l_ui_0.get_icon("circle-small") .. "\aDEFAULT  ", 
            [2] = "\v" .. l_ui_0.get_icon("hexagon-exclamation") .. "\aDEFAULT  ", 
            [3] = "\v" .. l_ui_0.get_icon("circle-exclamation") .. "\aDEFAULT  ", 
            [4] = "\aD24242FF" .. l_ui_0.get_icon("triangle-exclamation") .. "\aDEFAULT  "
        };
        v85:tooltip(l_string_0.format("\n%s%s\n", v88[v87], v86));
    end;
    v6.position = function(_, v90, v91)
        local l_x_0 = render.screen_size().x;
        local l_y_0 = render.screen_size().y;
        local v94 = l_x_0 / 2;
        local v95 = l_y_0 / 2;
        local v96 = l_x_0 / render.screen_size().x;
        local v97 = l_y_0 / render.screen_size().y;
        local v98 = {
            [1] = v90[1] * v97, 
            [2] = v90[2] * v96
        };
        local v99 = {
            [1] = v91[1] * v97, 
            [2] = v91[2] * v96
        };
        return {
            vector(v94 + v98[2], v95 + v98[1]), 
            vector(v94 + v99[2], v95 + v99[1])
        };
    end;
    v6.item = function(_, v101, ...)
        if not v101 then
            v101 = "";
        end;
        return v101 .. ...;
    end;
    v6.create_tab = function(_, ...)
        -- upvalues: l_pui_0 (ref)
        return l_pui_0.create(...);
    end;
    v6.string_ext = function(_, v104)
        -- upvalues: v6 (ref)
        return "\a{Link Active}" .. v6.cde.get_icon(v104) .. "\r";
    end;
    v6.contain = function(_, v106, v107, ...)
        if type(v106) == "table" then
            if type(v107) == "table" then
                for _, v109 in pairs(v107) do
                    return v106[v109];
                end;
            else
                return v106[v107];
            end;
        end;
    end;
    v6.extern = {};
    v6.antiaim = {};
    v6.our = {};
    v6.misc = {};
    v6.menu = {};
    v6.events = {};
    v6.menu.items = {};
    v6.antiaim.settings = {};
    v6.antiaim.builder = {};
    v6.antiaim.builder.builder = {};
    v6.antiaim.defensive = {};
    v6.misc.rage = {};
    v6.misc.misc = {};
    v6.misc.visual = {};
    v6.misc.animation = {};
    v6.misc.accent = {};
    v6.cde = {};
    v6.our.thirdperson = 15;
    v6.our.auto_os_c = 0;
    v6.our.auto_os_s = 0;
    v6.our.last_num = 0;
    v6.our.def_mod = 0;
    v6.our.op_jitter = 0;
    v6.our.ticks = 0;
    v6.our.delay_ticks = 0;
    v6.our.spin_yaw = 0;
    v6.our.aspect = 0;
    v6.our.fakeflick_yaw = 0;
    v6.our.resetpitch = 0;
    v6.our.teleport = 0;
    v6.our.switch_weapon = 0;
    v6.our.switch_use = 0;
    v6.our.fps_clip = 0;
    v6.our.ping_clip = 0;
    v6.our.airlag_ticks = 0;
    v6.our.line_alpha = 0;
    v6.our.old_tickbase = 0;
    v6.our.spin_yaw_nor = 0;
    v6.our.hittable_ticks = 0;
    v6.our.fakeflick_tick = 0;
    v6.our.localplayer_def = 0;
    v6.our.local_brk = 0;
    v6.our.break_aa = 0;
    v6.our.delay = false;
    v6.our.shooted = false;
    v6.our.shooted_use = false;
    v6.our.is_fakeflick = false;
    v6.our.is_airlag = false;
    v6.our.session = false;
    v6.our.is_avoid = false;
    v6.our.is_defensive = false;
    v6.our.is_idealtick = false;
    v6.our.is_fs_anim = false;
    v6.our.airlag_key = false;
    local v110 = nil;
    v110 = {
        watermark = {
            alpha = {
                lenght = 0, 
                open = 0
            }
        }, 
        defensive = {
            alpha = {
                lenght = 0, 
                open = 0
            }
        }, 
        tickbase_shiff = {
            alpha = {
                lenght = 0, 
                open = 0
            }
        }, 
        indicator = {
            size = 0, 
            alpha = {
                backround = 0, 
                outline = 0, 
                text = 0, 
                newalpha = 0, 
                shoot_len = 0, 
                shoot = 0, 
                screen = 0
            }
        }, 
        keybind = {
            alpha = {
                lenght = 0, 
                open = 0
            }
        }
    };
    v6.database = {
        antiaim_builder = {}, 
        cheat = {
            database = {
                cfg_item = {
                    [1] = "Default", 
                    [2] = ""
                }, 
                cfg_menu = {
                    [1] = "Default"
                }
            }, 
            run = {
                save = function(v111, v112, _, v114)
                    -- upvalues: v6 (ref)
                    if v112 == 1 then
                        return;
                    else
                        v111.database.cfg_item[v112][2] = v6.cde.algorithm(v114, "e");
                        return;
                    end;
                end
            }, 
            work = function(v115)
                v115.database = v115.database or {};
            end
        }, 
        antiaim = {
            defensive = {
                data = {
                    maximum = 100, 
                    minimum = 0, 
                    ready = false, 
                    wait = 80
                }, 
                work = function(v116)
                    -- upvalues: v6 (ref), v8 (ref), l_entity_0 (ref), l_math_0 (ref), l_globals_0 (ref)
                    if v6.our.def_mod == 0 then
                        v8.work = v8.pstat.defensive_type:get();
                        if v6:isdefensive() then
                            if v8.work == "Always on" then
                                v116.data.ready = true;
                            elseif v8.work == "Hittable" then
                                if not l_entity_0.get_threat(true) then
                                    v116.data.ready = false;
                                else
                                    v116.data.ready = true;
                                end;
                            elseif v8.work == "Prediction" then
                                local v117 = l_math_0.random(v116.data.minimum, v116.data.maximum) > v116.data.wait;
                                v116.data.ready = v117 or l_entity_0.get_threat(true) and true or false;
                            end;
                        else
                            v116.data.ready = false;
                        end;
                    elseif v6.our.def_mod == 1 then
                        v8.work = v8.pstat.exploit_defensive_type:get();
                        if v8.work == "Always on" then
                            v116.data.ready = true;
                        elseif v8.work == "Hittable" then
                            if not l_entity_0.get_threat(true) then
                                v116.data.ready = false;
                            else
                                v116.data.ready = true;
                            end;
                        elseif v8.work == "Automatic" then
                            v8.velocity = v6.cde.velocity();
                            v8.lastshot = l_math_0.abs(l_entity_0.get_local_player():get_player_weapon().m_fLastShotTime - l_globals_0.curtime);
                            if v8.velocity > 150 and v8.velocity < 255 then
                                v116.data.ready = true;
                            elseif v8.velocity > 150 and v8.velocity < 255 and l_entity_0.get_threat(true) then
                                v116.data.ready = false;
                            else
                                v116.data.ready = false;
                            end;
                        end;
                    end;
                end
            }, 
            safehead = {
                work = function(v118, _)
                    -- upvalues: l_entity_0 (ref), l_string_0 (ref), v6 (ref), l_bit_0 (ref)
                    local v120 = l_entity_0.get_local_player():is_alive() and l_entity_0.get_local_player():get_player_weapon():get_classname() or "";
                    if l_string_0.match(v120, "Knife") and v6.antiaim.settings.safestates.safeweapon:get("Knife") or l_string_0.match(v120, "Taser") and v6.antiaim.settings.safestates.safeweapon:get("Taser") or l_string_0.match(v120, "SSG08") and v6.antiaim.settings.safestates.safeweapon:get("Scout") then
                        if l_bit_0.band(l_entity_0.get_local_player().m_fFlags, 1) == 0 and l_bit_0.band(l_entity_0.get_local_player().m_fFlags, 4) == 4 then
                            v118.ready = true;
                        else
                            v118.ready = nil;
                        end;
                    else
                        v118.ready = nil;
                    end;
                end
            }, 
            manualyaw = {
                current_yaw = 0
            }, 
            fakeyaw = {
                current_yaw = 0
            }, 
            brutforce = {
                ready = false, 
                work = function(_)

                end
            }, 
            fakeflick = {
                ready = false, 
                tick = 0, 
                settings = {
                    speed = 7, 
                    extra_ticks = false
                }, 
                work = function(v122, _, v124, v125)
                    -- upvalues: v6 (ref)
                    v6.our.break_aa = v6.our.break_aa or 0;
                    v122.settings.speed = v125:get("High speed [risky]") and 5 or 11;
                    v122.settings.extra_ticks = v6.our.break_aa % 2 == 1;
                    local v126;
                    if v122.settings.extra_ticks and (v125:get("Extra ticks [risky]") and v124.command_number % v122.settings.speed < 2 or v124.command_number % v122.settings.speed == 0) then
                        v126 = true;
                    else
                        v126 = false;
                    end;
                    v122.ready = v126;
                    if v6.cde.velocity() > 5 then
                        v122.ready = false;
                    end;
                end
            }, 
            os = {
                ready = false, 
                data = {
                    crouch = {
                        ticks = 5, 
                        value = {
                            [1] = 1, 
                            [2] = 4
                        }
                    }, 
                    stand = {
                        value = 2
                    }
                }, 
                work = function(v127, _)
                    -- upvalues: v6 (ref), v3 (ref), l_bit_0 (ref), l_entity_0 (ref), v8 (ref)
                    local l_data_0 = v127.data;
                    if v6.antiaim.settings.safestates.automatic_os:get("Crouch") and v3[2].fakeduck:get() == false and l_bit_0.band(l_entity_0.get_local_player().m_fFlags, 1) == l_data_0.crouch.value[1] and l_bit_0.band(l_entity_0.get_local_player().m_fFlags, 4) == l_data_0.crouch.value[2] and v6.our.ticks > l_data_0.crouch.ticks then
                        v127.ready = true;
                    end;
                    if v6.antiaim.settings.safestates.automatic_os:get("Standing") and v3[2].fakeduck:get() == false and v8.GET_AA_STATE == l_data_0.stand.value then
                        v127.ready = false;
                    end;
                end
            }
        }, 
        config = {
            states = {
                team = {
                    ct = {
                        name = "Counter-terorist", 
                        value = 1
                    }, 
                    t = {
                        name = "Terorist", 
                        value = 2
                    }, 
                    generic = {
                        [1] = "Counter-terorist", 
                        [2] = "Terorist"
                    }
                }, 
                states = {
                    [1] = "Global", 
                    [2] = "Stand", 
                    [3] = "Run", 
                    [4] = "Walk", 
                    [5] = "Aero", 
                    [6] = "Aero+D", 
                    [7] = "Duck", 
                    [8] = "Duck+M", 
                    [9] = "Fakeduck", 
                    [10] = "Fakelag", 
                    [11] = "Hideshot", 
                    [12] = "Warmup", 
                    [13] = "Avoid backstab", 
                    [14] = "Freestanding", 
                    [15] = "Height advantage", 
                    [16] = "No enemies", 
                    [17] = "On nade", 
                    [18] = "Safe head"
                }, 
                states_short = {
                    [1] = {
                        [1] = "GLOBAL", 
                        [2] = "GENERIC"
                    }, 
                    [2] = {
                        [1] = "STAND", 
                        [2] = "STANDING"
                    }, 
                    [3] = {
                        [1] = "RUN", 
                        [2] = "MOVING"
                    }, 
                    [4] = {
                        [1] = "WALK", 
                        [2] = "SLOWMOTION"
                    }, 
                    [5] = {
                        [1] = "AERO", 
                        [2] = "AIR"
                    }, 
                    [6] = {
                        [1] = "AERO+D", 
                        [2] = "AIR+DUCK"
                    }, 
                    [7] = {
                        [1] = "DUCK", 
                        [2] = "CROUCH"
                    }, 
                    [8] = {
                        [1] = "DUCK+R", 
                        [2] = "CROUCH+M"
                    }, 
                    [9] = {
                        [1] = "FD", 
                        [2] = "FAKEDUCK"
                    }, 
                    [10] = {
                        [1] = "FL", 
                        [2] = "FAKELAG"
                    }, 
                    [11] = {
                        [1] = "OS", 
                        [2] = "HIDESHOT"
                    }, 
                    [12] = {
                        [1] = "WM", 
                        [2] = "WARMUP"
                    }, 
                    [13] = {
                        [1] = "AB", 
                        [2] = "AVOIDBACKSTAB"
                    }, 
                    [14] = {
                        [1] = "FS", 
                        [2] = "FREESTANDING"
                    }, 
                    [15] = {
                        [1] = "HA", 
                        [2] = "HEIGHT ADVANTAGE"
                    }, 
                    [16] = {
                        [1] = "NE", 
                        [2] = "NO ENEMIES"
                    }
                }
            }, 
            force = {
                safepoint = {
                    value = "Force"
                }, 
                baim = {
                    value = "Force"
                }, 
                shot = {
                    hitchance = 5, 
                    damage = 3
                }
            }, 
            fl = {
                [1] = {
                    value2 = 20, 
                    value = 14, 
                    name = "maximum"
                }, 
                [2] = {
                    value2 = 10, 
                    name = "ping", 
                    value = function()
                        -- upvalues: l_math_0 (ref), l_mtools_0 (ref)
                        return 14 - l_math_0.max(10, l_mtools_0.Client.GetPing());
                    end
                }, 
                [3] = {
                    value2 = 0, 
                    name = "random", 
                    value = function()
                        -- upvalues: l_math_0 (ref)
                        return l_math_0.random(1, 14);
                    end
                }, 
                [4] = {
                    value2 = 20, 
                    name = "fluctuate", 
                    value = function()
                        -- upvalues: l_globals_0 (ref)
                        return l_globals_0.tickcount % 32 == 0 and 1 or 14;
                    end
                }, 
                [5] = {
                    value2 = 0, 
                    value = 14, 
                    name = "global"
                }
            }, 
            wm = {
                [1] = 68, 
                [2] = 2.5, 
                [3] = 0, 
                [4] = -1.5
            }, 
            tt = {
                [1] = {
                    [1] = 80, 
                    [2] = 70
                }, 
                [2] = {
                    [1] = 50, 
                    [2] = 40
                }, 
                [3] = {
                    [1] = 5, 
                    [2] = 11
                }
            }
        }
    };
    v7.override_def_pitch = function(v130)
        -- upvalues: l_rage_0 (ref), v6 (ref)
        if type(v130) == "function" then
            local v131 = v130();
            if v131 then
                v130 = v131;
            end;
        end;
        return l_rage_0.antiaim:override_hidden_pitch(v6.cde.normalize("pitch", v130));
    end;
    v7.override_def_yaw = function(v132)
        -- upvalues: v0 (ref), l_rage_0 (ref), v6 (ref)
        if type(v132) == "function" then
            local v133 = v0.run(v132);
            if v133 then
                v132 = v133;
            end;
        end;
        return l_rage_0.antiaim:override_hidden_yaw_offset(v6.cde.normalize("yaw", v132));
    end;
    v7.override_bodylean = function(v134, v135)
        -- upvalues: v0 (ref)
        if type(v135) == "function" then
            local v136 = v0.run(v135);
            if v136 then
                v135 = v136;
            end;
        end;
        v134.view_angles.z = v135;
        return v134.view_angles.z;
    end;
    v6.cde.add_notify = function(v137, v138)
        -- upvalues: l_common_0 (ref)
        if not v138 then
            v138 = "celestium";
        end;
        return l_common_0.add_notify("               " .. v138, v137);
    end;
    v6.cde.get_icon = function(...)
        -- upvalues: l_ui_0 (ref)
        return l_ui_0.get_icon(...) .. "  ";
    end;
    v6.cde.lerp = function(v139, v140, v141)
        -- upvalues: l_globals_0 (ref)
        return v139 + (v140 - v139) * l_globals_0.frametime * v141;
    end;
    v6.cde.cslerp = function(v142, v143)
        -- upvalues: l_globals_0 (ref), l_math_0 (ref)
        local function v147(v144, v145, v146)
            -- upvalues: l_globals_0 (ref)
            return v144 + (v145 - v144) * l_globals_0.frametime * v146;
        end;
        local v148 = 0;
        return (function()
            -- upvalues: l_math_0 (ref), l_globals_0 (ref), v143 (ref), v148 (ref), v147 (ref), v142 (ref)
            local v149 = l_math_0.sin(l_globals_0.curtime * v143 * 0.2) * 0.5 + 0.5;
            v148 = v147(v148, v142 * v149, v143);
            return l_math_0.floor(v148);
        end)();
    end;
    v6.cde.get_weapon_index = function()
        -- upvalues: l_entity_0 (ref)
        local l_status_2, l_result_2 = pcall(l_entity_0.get_local_player);
        if not l_status_2 or not l_result_2 then
            return nil, "Failed to get local player";
        else
            local l_status_3, l_result_3 = pcall(l_result_2.get_player_weapon, l_result_2);
            weapon = l_result_3;
            if not l_status_3 or not weapon then
                return nil, "Failed to get player weapon";
            else
                l_status_3, l_result_3 = pcall(weapon.get_weapon_index, weapon);
                weapon_index = l_result_3;
                if not l_status_3 or not weapon_index then
                    return nil, "Failed to get weapon index";
                else
                    return weapon_index;
                end;
            end;
        end;
    end;
    v6.cde.random_float = function(v154, v155)
        -- upvalues: l_math_0 (ref)
        return v154 + l_math_0.random() * (v155 - v154);
    end;
    v6.cde.gradient = function(v156, v157, v158, v159)
        -- upvalues: l_math_0 (ref), l_globals_0 (ref), l_string_0 (ref)
        local function v162(v160, v161)
            -- upvalues: l_math_0 (ref), l_globals_0 (ref)
            return l_math_0.abs(l_math_0.sin(l_globals_0.realtime * (v161 or 1) % l_math_0.pi + (v160 or 0)));
        end;
        return (function(v163, v164)
            -- upvalues: l_string_0 (ref)
            local v165 = 0;
            local v166 = #v163:gsub("[\128-\191]", "");
            local v167 = "";
            for v168 in v163:gmatch(".[\128-\191]*") do
                v165 = v165 + 1;
                local v169 = v165 / v166;
                v167 = l_string_0.format("%s\a%s%s", v167, v164(v165, v166, v168, v169):to_hex(), v168);
            end;
            return v167;
        end)(v156, function(_, _, _, v173)
            -- upvalues: v162 (ref), v159 (ref), v157 (ref), v158 (ref)
            local v174 = v162(v173, v159);
            return v157:lerp(v158, v174);
        end);
    end;
    v6.cde.enemydistance = function()
        -- upvalues: l_entity_0 (ref), l_math_0 (ref)
        if l_entity_0.get_threat(true) == nil then
            return -1;
        else
            return l_math_0.floor((l_entity_0.get_threat(true):get_origin() - l_entity_0.get_local_player():get_origin()):length2dsqr());
        end;
    end;
    v6.cde.onload = function()
        -- upvalues: l_common_0 (ref), l_ui_0 (ref), v6 (ref), l_utils_0 (ref), l_string_0 (ref), v3 (ref)
        l_common_0.add_event("Welcome back, " .. l_common_0.get_username(), l_ui_0.get_icon("sparkles"));
        v6.cde.add_notify("Welcome back, " .. l_common_0.get_username(), "Celestium");
        files.create_folder("nl/celestium");
        l_utils_0.execute_after(0.3, function()
            -- upvalues: l_string_0 (ref), l_common_0 (ref)
            print_raw("\t\a{Link Active}" .. l_string_0.format("\t\t\t\t\t\t\n\t\t\t\t\t\t\n\t\t\t\t ______    _______  ___       _______   ________  ___________  __     ____  ____  ___      ___ \n\t\t\t\t/' _  '\\  /'     '||'  |     /'     '| /'       )('     _   ')|' \\   ('  _||_ ' ||'  \\    /'  |\n\t\t\t       (: ( \\___)(: ______)||  |    (: ______)(:   \\___/  )__/  \\\\__/ ||  |  |   (  ) : | \\   \\  //   |\n\t\t\t\t\\/ \\      \\/    |  |:  |     \\/    |   \\___  \\       \\\\_ /    |:  |  (:  |  | . ) /\\\\  \\/.    |\t\n\t\t\t\t//  \\ _   // ___)_  \\  |___  // ___)_   __/  \\\\      |.  |    |.  |   \\\\ \\__/ // |: \\.        |\n\t\t\t       (:   _) \\ (:      '|( \\_|:  \\(:      '| /' \\   :)     \\:  |    /\\  |\\  /\\\\ __ //\\ |.  \\    /:  |\n\t\t\t\t\\_______) \\_______) \\_______)\\_______)(_______/       \\__|   (__\\_|_)(__________)|___|\\__/|___|\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\n\t\t\t\t                                          -< %s >-\n\t\t\t\t\t", l_common_0.get_username()));
        end);
        local _ = 0;
        for _, v177 in next, v3[2] do
            v177:visibility(false);
            v3[2].legmovement:visibility(true);
            v3[2].fakeduck:visibility(true);
            v3[2].slowwalk:visibility(true);
        end;
    end;
    v6.cde.velocity = function()
        -- upvalues: l_math_0 (ref), l_entity_0 (ref)
        return (function(v178)
            -- upvalues: l_math_0 (ref)
            return l_math_0.sqrt(v178.m_vecVelocity.x ^ 2 + v178.m_vecVelocity.y ^ 2);
        end)(l_entity_0.get_local_player());
    end;
    v6.cde.mouse_check = function(v179, v180)
        -- upvalues: l_ui_0 (ref)
        if l_ui_0.get_alpha() < 1 then
            return false;
        else
            local v181 = l_ui_0.get_mouse_position();
            return v181.x >= v179.x and v181.x <= v180.x and v181.y >= v179.y and v181.y <= v180.y;
        end;
    end;
    v6.cde.algorithm = function(v182, v183)
        -- upvalues: l_bit_0 (ref), l_table_0 (ref), l_string_0 (ref)
        local v184 = 21;
        local function v188()
            -- upvalues: v182 (ref), l_bit_0 (ref), v184 (ref), l_table_0 (ref)
            local v185 = {};
            for v186 = 1, #v182 do
                local v187 = l_bit_0.bxor(v182:sub(v186, v186):byte(), v184);
                l_table_0.insert(v185, v187);
            end;
            return (l_table_0.concat(v185, "A"):gsub("6", "C"):gsub("7", "F"):gsub("8", "E"):gsub("9", "H"));
        end;
        local function v197()
            -- upvalues: v182 (ref), l_table_0 (ref), l_bit_0 (ref), v184 (ref), l_string_0 (ref)
            v182 = v182:gsub("C", "6"):gsub("F", "7"):gsub("E", "8"):gsub("H", "9");
            local v189 = {};
            for v190 in v182:gmatch("[^A]+") do
                l_table_0.insert(v189, tonumber(v190));
            end;
            local v191 = {};
            for v192 = 1, #v189 do
                local v193 = l_bit_0.bxor(v189[v192], v184);
                do
                    local l_v193_0 = v193;
                    l_table_0.insert(v191, (function()
                        -- upvalues: l_string_0 (ref), l_v193_0 (ref)
                        local l_status_4, l_result_4 = pcall(function()
                            -- upvalues: l_string_0 (ref), l_v193_0 (ref)
                            return l_string_0.char(l_v193_0);
                        end);
                        if l_status_4 then
                            return l_result_4;
                        else
                            return 2;
                        end;
                    end)());
                end;
            end;
            return l_table_0.concat(v191);
        end;
        if v183 == "d" then
            return v197();
        elseif v183 == "e" then
            return v188();
        else
            return;
        end;
    end;
    v6.cde.get_nade = function()
        -- upvalues: v6 (ref)
        local v198 = v6.cde.get_weapon_index();
        return ({
            [45] = true, 
            [47] = true, 
            [43] = true, 
            [44] = true, 
            [48] = true, 
            [46] = true
        })[v198] or nil;
    end;
    v6.cde.states = function(v199, v200, v201, v202, v203, v204, v205, v206, v207, v208, v209, v210)
        -- upvalues: v6 (ref), l_bit_0 (ref), l_entity_0 (ref), l_math_0 (ref), l_string_0 (ref), l_rage_0 (ref), v3 (ref)
        local v211 = {
            velocity = v6.cde.velocity(), 
            is_avoid = false, 
            min = 1, 
            air = {
                [1] = l_bit_0.band(l_entity_0.get_local_player().m_fFlags, 1) == 0, 
                [2] = l_bit_0.band(l_entity_0.get_local_player().m_fFlags, 4) == 4
            }, 
            distance = 100000
        };
        if l_entity_0.get_threat(true) ~= nil then
            v211.distance = l_math_0.floor((l_entity_0.get_threat(true):get_origin() - l_entity_0.get_local_player():get_origin()):length2dsqr());
        else
            v211.distance = 100000;
        end;
        a = function()
            -- upvalues: l_entity_0 (ref), l_string_0 (ref)
            if not l_entity_0.get_threat() then
                return false;
            else
                local l_status_5, l_result_5 = pcall(function()
                    -- upvalues: l_string_0 (ref), l_entity_0 (ref)
                    return l_string_0.match(l_entity_0.get_threat():get_player_weapon():get_classname(), "Knife");
                end);
                if l_status_5 then
                    return l_result_5;
                else
                    return false;
                end;
            end;
        end;
        v211.is_avoid = v211.distance < 80000 and (a() and true or false);
        if l_entity_0.get_game_rules().m_bWarmupPeriod and v200 then
            return 12;
        elseif v208 and v6.cde.get_nade() == true then
            return 17;
        elseif v209 and v210 == true and v211.is_avoid == false then
            return 18;
        elseif v207 and (function()
            -- upvalues: l_entity_0 (ref)
            local v214 = 0;
            for v215 = 1, #l_entity_0.get_players(true) do
                local v216 = l_entity_0.get_players(true)[v215];
                if v216 and v216:is_alive() then
                    v214 = v214 + 1;
                end;
            end;
            return v214 == 0;
        end)() then
            return 16;
        elseif l_entity_0.get_local_player():is_alive() and l_entity_0.get_threat() and l_entity_0.get_local_player():get_origin().z - l_entity_0.get_threat():get_origin().z > 70 and v206 then
            return 15;
        elseif v6.antiaim.settings.binds.freestanding:get() and v205 then
            return 14;
        elseif v204 and v211.is_avoid then
            return 13;
        elseif l_rage_0.exploit:get() == 1 and v3[1].onshot:get() and v201 or v3[1].onshot:get_override() and (v3[1].doubletap:get() == false or v3[1].doubletap:get_override() == false) and v201 then
            return 11;
        elseif (v3[2].fakeduck:get() or v3[2].fakeduck:get_override()) and v203 and l_rage_0.exploit:get() < 0.3 then
            return 9;
        elseif v202 and l_rage_0.exploit:get() < 0.3 then
            return 10;
        else
            if l_bit_0.band(l_entity_0.get_local_player().m_fFlags, 1) == 1 then
                if v199 > -1 and v199 < 5 then
                    if v211.air[2] then
                        return 6;
                    else
                        return 5;
                    end;
                elseif l_bit_0.band(l_entity_0.get_local_player().m_fFlags, 4) == 4 and v211.velocity < 2 then
                    return 7;
                elseif l_bit_0.band(l_entity_0.get_local_player().m_fFlags, 4) == 4 and v211.velocity > v211.min then
                    return 8;
                elseif v211.velocity <= 2 and not v211.air[1] and not v211.air[2] then
                    return 2;
                elseif v211.velocity > v211.min and (v3[2].slowwalk:get() or v3[2].slowwalk:get_override()) then
                    return 4;
                elseif v211.velocity > v211.min and not v3[2].slowwalk:get() or not v3[2].slowwalk:get_override() then
                    return 3;
                end;
            elseif v211.air[1] then
                if v211.air[2] then
                    return 6;
                else
                    return 5;
                end;
            end;
            return;
        end;
    end;
    v6.cde.reset_aa = function(_, v218)
        -- upvalues: v3 (ref)
        if not v218 then
            v218 = 0;
        end;
        v3[2].yaw_offset:override(v218);
        v3[2].yawmodifier:override("Disabled");
        v3[2].yawmod_offset:override(0);
        v3[2].yawbase:override("At target");
        v3[2].desync_options:override({});
        v3[2].desync_invert:override(true);
        v3[2].desync_Loffset:override(0);
        v3[2].desync_Roffset:override(0);
    end;
    v6.cde.normalize = function(v219, v220)
        -- upvalues: l_table_0 (ref)
        local v221 = type(v220) == "function" and v220() or v220;
        local v222 = {
            yaw = {
                [1] = nil, 
                [2] = -180, 
                [3] = 180, 
                [1] = v221
            }, 
            pitch = {
                [1] = nil, 
                [2] = -89, 
                [3] = 89, 
                [1] = v221
            }, 
            normal = {
                [1] = nil, 
                [2] = 0, 
                [3] = 100, 
                [1] = v221
            }
        };
        return (function(v223, v224, v225)
            local v226 = v225 - v224;
            while v223 < v224 do
                v223 = v223 + v226;
            end;
            while v225 < v223 do
                v223 = v223 - v226;
            end;
            return v223;
        end)(l_table_0.unpack(v222[v219]));
    end;
    if not l_status_0 then
        v6.cde.add_notify("\a{Link Active}[Watermark]\aDEFAULT ~ your avatar not found!", "Celestium");
    end;
    v6.menu.home_1 = v6:create_tab(v6.cde.get_icon("star-shooting"), "\n", 1);
    v6.menu.home_1_e = v6:create_tab(v6.cde.get_icon("star-shooting"), "\n\n", 1);
    v6.menu.home_1_e1 = v6:create_tab(v6.cde.get_icon("star-shooting"), "\n\n\n", 1);
    v6.menu.home_2_e = v6:create_tab(v6.cde.get_icon("star-shooting"), "\n\n ", 2);
    v6.menu.home_3_e = v6:create_tab(v6.cde.get_icon("star-shooting"), "\n\n  ", 2);
    v6.menu.home_4_e = v6:create_tab(v6.cde.get_icon("star-shooting"), "\n\n   ", 2);
    v6.menu.aa_1 = v6:create_tab(v6.cde.get_icon("axe") .. "\n", "\n\n ", 1);
    v6.menu.aa_4 = v6:create_tab(v6.cde.get_icon("axe") .. "\n", "\n\n\na   ", 1);
    v6.menu.aa_5 = v6:create_tab(v6.cde.get_icon("axe") .. "\n", "\n\n\nas   ", 1);
    v6.menu.aa_2 = v6:create_tab(v6.cde.get_icon("axe") .. "\n", "\n\n  ", 2);
    v6.menu.aa_3 = v6:create_tab(v6.cde.get_icon("axe") .. "\n", "\n\n   ", 2);
    v6.menu.misc_1 = v6:create_tab(v6.cde.get_icon("umbrella"), "\n    ", 1);
    v6.menu.misc_1_e1 = v6:create_tab(v6.cde.get_icon("umbrella"), "\n\n   ", 1);
    v6.menu.misc_1_e11 = v6:create_tab(v6.cde.get_icon("umbrella"), "\n\n\n   ", 1);
    v6.menu.misc_1_e2 = v6:create_tab(v6.cde.get_icon("umbrella"), "\n\n     ", 2);
    v6.menu.home_1:label(v6:string_ext("user") .. "Welcome back, ");
    v6.menu.home_1:button("    " .. l_common_0.get_username():sub(0, 16) .. "    ", function()

    end, true);
    v6.menu.home_1:label(v6:string_ext("dove") .. "Version:");
    v6.menu.home_1:button("    Alpha    ", function()

    end, true);
    v6.menu.home_1_e:label(v6:string_ext("clock") .. "  Last load:");
    v6.menu.home_1_e:button("    " .. l_string_0.format("%s:%s", l_common_0.get_system_time().hours, l_common_0.get_system_time().minutes) .. "    ", function()

    end, true);
    v6.menu.home_1_e:label(v6:string_ext("folders") .. "Current config:");
    v6.menu.home_1_e:button("    " .. l_common_0.get_config_name() .. "    ", function()

    end, true);
    v6.menu.items.home_sidebar = v6.menu.home_1_e1:list(v6:string_ext("list") .. "Selection", {
        [1] = "Home", 
        [2] = "Config", 
        [3] = "Files"
    });
    v6.menu.items.antiaim_sidebar = v6.menu.aa_1:list(v6:string_ext("list") .. "Selection\n", {
        [1] = "Settings", 
        [2] = "Builder", 
        [3] = "Defensive"
    });
    v6.menu.items.misc_sidebar = v6.menu.misc_1:list(v6:string_ext("list") .. "Selection\n\n", {
        [1] = "     Rage", 
        [2] = "     Misc", 
        [3] = "     Visual", 
        [4] = "     Animations"
    });
    v6.menu.home_3_e:label("\a474747CELinks:"):depend({
        [1] = nil, 
        [2] = 1, 
        [1] = v6.menu.items.home_sidebar
    });
    v6.menu.items.misc_discord = v6.menu.home_3_e:button("  " .. v6:string_ext("discord") .. "  Discord    ", function()
        panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://discord.gg/k6VNrEsnTx");
    end, true):depend({
        [1] = nil, 
        [2] = 1, 
        [1] = v6.menu.items.home_sidebar
    });
    v6.menu.items.misc_youtube = v6.menu.home_3_e:button("  " .. v6:string_ext("youtube") .. "  Youtube    ", function()
        panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://www.youtube.com/@srtx1337");
    end, true):depend({
        [1] = nil, 
        [2] = 1, 
        [1] = v6.menu.items.home_sidebar
    });
    v6.menu.home_4_e:label("Coming soon."):depend({
        [1] = nil, 
        [2] = 2, 
        [1] = v6.menu.items.home_sidebar
    });
    v6.menu.items.misc_discord = v6.menu.home_4_e:button("\t\t\t\t                  " .. v6:string_ext("font") .. "Fonts                  \t\t\t\t", function()
        panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://dl.dafont.com/dl/?f=comfortaa");
    end, true):depend({
        [1] = nil, 
        [2] = 3, 
        [1] = v6.menu.items.home_sidebar
    });
    local l_y_1 = render.screen_size().y;
    local l_x_1 = render.screen_size().x;
    v110.watermark.x = v6.menu.misc_1_e2:slider("watermark::x", 0, l_x_1, 0, 0);
    v110.watermark.y = v6.menu.misc_1_e2:slider("watermark::y", 0, l_y_1, 0, 1);
    v110.indicator.x = v6.menu.misc_1_e2:slider("indicator::x", 0, l_x_1, 0, 0);
    v110.indicator.y = v6.menu.misc_1_e2:slider("indicator::y", 0, l_y_1, 0, 1);
    v110.defensive.x = v6.menu.misc_1_e2:slider("indicator::x_", 0, l_x_1, 0, 0);
    v110.defensive.y = v6.menu.misc_1_e2:slider("indicator::y_", 0, l_y_1, 0, 1);
    v110.tickbase_shiff.x = v6.menu.misc_1_e2:slider("indicator::x__", 0, l_x_1, 0, 0);
    v110.tickbase_shiff.y = v6.menu.misc_1_e2:slider("indicator::y__", 0, l_y_1, 0, 1);
    v110.keybind.x = v6.menu.misc_1_e2:slider("keybind::x", 0, l_x_1, 0, 0);
    v110.keybind.y = v6.menu.misc_1_e2:slider("keybind::y", 0, l_y_1, 0, 1);
    v6.database.items = {
        antiaim = {
            settings = {
                value = v6.antiaim.settings, 
                base = v6.menu.aa_2, 
                visibility = {
                    [1] = nil, 
                    [2] = 1, 
                    [1] = v6.menu.items.antiaim_sidebar
                }
            }
        }, 
        builder = {
            value = v6.antiaim.builder, 
            builder = v6.antiaim.builder.builder, 
            base = {
                [1] = v6.menu.aa_2, 
                [2] = v6.menu.aa_3, 
                [3] = v6.menu.aa_4
            }, 
            visibility = {
                [1] = {
                    [1] = {
                        [1] = nil, 
                        [2] = 2, 
                        [1] = v6.menu.items.antiaim_sidebar
                    }, 
                    [2] = {
                        [1] = nil, 
                        [2] = 2, 
                        [3] = 3, 
                        [1] = v6.menu.items.antiaim_sidebar
                    }, 
                    [3] = {
                        [1] = nil, 
                        [2] = 3, 
                        [1] = v6.menu.items.antiaim_sidebar
                    }
                }
            }, 
            states = v6.database.config.states.states, 
            team = v6.database.config.states.team
        }, 
        misc = {
            value = {
                rage = v6.misc.rage, 
                misc = v6.misc.misc, 
                visual = v6.misc.visual, 
                anim = v6.misc.animation, 
                acc = v6.misc.accent
            }, 
            base = v6.menu.misc_1_e2, 
            visibility = {
                rage = {
                    [1] = nil, 
                    [2] = 1, 
                    [1] = v6.menu.items.misc_sidebar
                }, 
                misc = {
                    [1] = nil, 
                    [2] = 2, 
                    [1] = v6.menu.items.misc_sidebar
                }, 
                visual = {
                    [1] = nil, 
                    [2] = 3, 
                    [1] = v6.menu.items.misc_sidebar
                }, 
                anim = {
                    [1] = nil, 
                    [2] = 4, 
                    [1] = v6.menu.items.misc_sidebar
                }
            }
        }, 
        anim = {
            value = v6.misc.animation, 
            base = v6.menu.misc_1_e2, 
            visibility = {
                [1] = nil, 
                [2] = 4, 
                [1] = v6.menu.items.misc_sidebar
            }
        }
    };
    local v229 = v6:cmp({
        "str", 
        "aa", 
        v6:tolevel(7.789255)
    }, v6:unpack(v6.database.items.antiaim.settings))[1];
    v229.value.yawbase = v229.base:label(v6:string_ext("rotate") .. " Yawbase", function(v230)
        return {
            _value = v230:combo("\n", {
                [1] = "Local viewtopic", 
                [2] = "At target"
            })
        };
    end):depend(v229.visibility);
    v229.value.fakelag = v229.base:label(v6:string_ext("feather") .. " Fakelag", function(v231)
        return {
            _value = v231:combo("\n\n", {
                [1] = "Disabled", 
                [2] = "Maximum", 
                [3] = "Ping based", 
                [4] = "Random", 
                [5] = "Fluctuate"
            })
        };
    end):depend(v229.visibility);
    v229.value.safestates = v229.base:label(v6:string_ext("disease") .. " Safe states", function(v232)
        -- upvalues: v6 (ref)
        return {
            safeweapon = v232:selectable(v6:string_ext("gun") .. "Safe weapons", {
                [1] = "Scout", 
                [2] = "Knife", 
                [3] = "Taser"
            }), 
            automatic_os = v232:selectable(v6:string_ext("wand-magic") .. "Automatic OS", {
                [1] = "Crouch", 
                [2] = "Standing"
            }), 
            automatic_os_time = v232:slider(v6:string_ext("slider") .. "Time", 20, 300, 90, 1, function(v233)
                if v233 == 20 then
                    return "inf";
                else
                    return v233 .. "t";
                end;
            end)
        };
    end):depend(v229.visibility);
    v229.value.safestates.automatic_os_time:depend({
        [1] = nil, 
        [2] = "Crouch", 
        [3] = "Standing", 
        [1] = v229.value.safestates.automatic_os
    });
    v229.value.exploits = v229.base:label(v6:string_ext("ghost") .. "  Exploits", function(v234)
        -- upvalues: v6 (ref)
        return {
            fakeflick = v234:combo(v6:string_ext("hammer-crash") .. "Fakeflick", {
                [1] = "Disabled", 
                [2] = "Default"
            }), 
            fakeflick_options = v234:selectable(v6:string_ext("gears") .. "Fakeflick options", {
                [1] = "High speed [risky]", 
                [2] = "Extra ticks [risky]"
            }), 
            breakdesync = v234:combo(v6:string_ext("screwdriver") .. "Break desync", {
                [1] = "Disabled", 
                [2] = "Ping based", 
                [3] = "Tickcount"
            }), 
            avoidleg = v234:switch(v6:string_ext("person-skating") .. "Avoid legs")
        };
    end):depend(v229.visibility);
    v229.value.exploits.fakeflick_options:depend({
        [1] = nil, 
        [2] = "Default", 
        [1] = v229.value.exploits.fakeflick
    });
    v6:new_tooltip(v229.value.exploits.avoidleg, "tries to reduce the chances of the enemy shooting you in the foot", 1);
    v229.value.binds = v229.base:label(v6:string_ext("keyboard") .. "Binds", function(v235)
        -- upvalues: v6 (ref)
        return {
            freestanding = v235:switch(v6:string_ext("right-left") .. "Freestanding"), 
            edgeyaw = v235:switch(v6:string_ext("rotate-left") .. "Edge yaw"), 
            manualyaw = v235:combo(v6:string_ext("left-right") .. "Manual yaw", {
                [1] = "Disabled", 
                [2] = "Forward", 
                [3] = "Left", 
                [4] = "Right", 
                [5] = "Back"
            })
        };
    end):depend(v229.visibility);
    local v236 = v6:cmp({
        "str", 
        "bldr", 
        v6:tolevel(7.789804)
    }, v6:unpack(v6.database.items.builder))[1];
    v236.value.player_team = v236.base[1]:combo("\n\n\n", v6.database.config.states.team.generic):depend(v236.visibility[1][2]);
    v236.value.player_states = v236.base[1]:combo("\n\n\n", v6.database.config.states.states):depend(v236.visibility[1][2]);
    local function v244(v237, v238, v239)
        -- upvalues: v6 (ref), l_table_0 (ref)
        if not v239 then
            v239 = 1;
        end;
        for v240, v241 in pairs(v237) do
            local v242 = v237[1];
            local l_antiaim_builder_0 = v6.database.antiaim_builder;
            l_antiaim_builder_0[v242] = l_antiaim_builder_0[v242] or {
                [0] = {}
            };
            l_table_0.insert(l_antiaim_builder_0[v242][0], {
                [1] = v240, 
                [2] = v241, 
                [3] = v239 == 1 and "G" or v239
            });
        end;
        return v238;
    end;
    do
        local l_v236_0 = v236;
        for v246, _ in pairs(l_v236_0.team.generic) do
            l_v236_0.builder[v246] = {};
            do
                local l_v246_0 = v246;
                for v249, _ in pairs(l_v236_0.states) do
                    local l_v249_0 = v249;
                    local v252 = l_string_0.rep("\n    ", 64);
                    l_v236_0.builder[l_v246_0][v249] = {};
                    l_v236_0.builder[l_v246_0][v249].enable = l_v236_0.base[1]:switch(v6:string_ext("circle-check") .. "Allow \a{Link Active}" .. l_v236_0.states[v249] .. "\aDEFAULT state");
                    l_v236_0.builder[l_v246_0][v249].yaw = l_v236_0.base[2]:switch(v6:string_ext("rotate") .. "Yaw" .. v252, false);
                    l_v236_0.builder[l_v246_0][v249].yaw_create = v6:create(l_v236_0.builder[l_v246_0][v249].yaw);
                    local l_yaw_create_0 = l_v236_0.builder[l_v246_0][v249].yaw_create;
                    l_v236_0.builder[l_v246_0][v249].yaw_type = v244({
                        [1] = nil, 
                        [2] = "mod", 
                        [3] = "yaw", 
                        [4] = "ytyp", 
                        [5] = "cmbo", 
                        [1] = l_v249_0
                    }, l_yaw_create_0:combo(v6:string_ext("gear") .. "Type", {
                        [1] = "Static", 
                        [2] = "L & R", 
                        [3] = "Delay", 
                        [4] = "Sway", 
                        [5] = "Spin"
                    }), 1);
                    l_v236_0.builder[l_v246_0][v249].yaw_limit_static = v244({
                        [1] = nil, 
                        [2] = "mod", 
                        [3] = "yaw", 
                        [4] = "lmtt", 
                        [5] = "sldr", 
                        [1] = l_v249_0
                    }, l_yaw_create_0:slider(v6:string_ext("slider") .. "Limitation", -60, 60, 0, 1), 7);
                    l_v236_0.builder[l_v246_0][v249].yaw_limit_static_random = v244({
                        [1] = nil, 
                        [2] = "mod", 
                        [3] = "yaw", 
                        [4] = "rnd_0", 
                        [5] = "sldr", 
                        [1] = l_v249_0
                    }, l_yaw_create_0:slider(v6:string_ext("slider") .. "Irregularity", 0, 100, 0, 1, "%"), 7);
                    l_v236_0.builder[l_v246_0][v249].yaw_limit_l = v244({
                        [1] = nil, 
                        [2] = "mod", 
                        [3] = "yaw", 
                        [4] = "le_0", 
                        [5] = "sldr", 
                        [1] = l_v249_0
                    }, l_yaw_create_0:slider(v6:string_ext("caret-left") .. "Left", -60, 60, 0, 1), 7);
                    l_v236_0.builder[l_v246_0][v249].yaw_limit_r = v244({
                        [1] = nil, 
                        [2] = "mod", 
                        [3] = "yaw", 
                        [4] = "ri_0", 
                        [5] = "sldr", 
                        [1] = l_v249_0
                    }, l_yaw_create_0:slider(v6:string_ext("caret-right") .. "Right", -60, 60, 0, 1), 7);
                    l_v236_0.builder[l_v246_0][v249].yaw_limit_dl = v244({
                        [1] = nil, 
                        [2] = "mod", 
                        [3] = "yaw", 
                        [4] = "le_1", 
                        [5] = "sldr", 
                        [1] = l_v249_0
                    }, l_yaw_create_0:slider(v6:string_ext("caret-left") .. "Left\n", -60, 60, 0, 1), 7);
                    l_v236_0.builder[l_v246_0][v249].yaw_limit_dr = v244({
                        [1] = nil, 
                        [2] = "mod", 
                        [3] = "yaw", 
                        [4] = "ri_1", 
                        [5] = "sldr", 
                        [1] = l_v249_0
                    }, l_yaw_create_0:slider(v6:string_ext("caret-right") .. "Right\n", -60, 60, 0, 1), 7);
                    l_v236_0.builder[l_v246_0][v249].yaw_limit_dd = v244({
                        [1] = nil, 
                        [2] = "mod", 
                        [3] = "yaw", 
                        [4] = "dely", 
                        [5] = "sldr", 
                        [1] = l_v249_0
                    }, l_yaw_create_0:slider(v6:string_ext("slider") .. "Delay\n", 2, 64, 2, 1, "t"), 7);
                    l_v236_0.builder[l_v246_0][v249].yaw_limit_drd = v244({
                        [1] = nil, 
                        [2] = "mod", 
                        [3] = "yaw", 
                        [4] = "rnd_1", 
                        [5] = "sldr", 
                        [1] = l_v249_0
                    }, l_yaw_create_0:slider(v6:string_ext("slider") .. "Irregularity\n", 0, 100, 0, 1, "%"), 7);
                    l_v236_0.builder[l_v246_0][v249].yawmodifier = l_v236_0.base[2]:switch(v6:string_ext("street-view") .. "Yaw modifier" .. v252, false);
                    l_v236_0.builder[l_v246_0][v249].yaw_modifier_create = v6:create(l_v236_0.builder[l_v246_0][v249].yawmodifier);
                    l_yaw_create_0 = l_v236_0.builder[l_v246_0][v249].yaw_modifier_create;
                    l_v236_0.builder[l_v246_0][v249].operator = v244({
                        [1] = nil, 
                        [2] = "mod", 
                        [3] = "yawjttr", 
                        [4] = "ywopt", 
                        [1] = l_v249_0
                    }, l_yaw_create_0:combo(v6:string_ext("gear") .. "Operator", {
                        [1] = "Neverlose", 
                        [2] = "Celestium"
                    }), 1);
                    l_v236_0.builder[l_v246_0][v249].yaw_modifier_type = v244({
                        [1] = nil, 
                        [2] = "mod", 
                        [3] = "yawjttr", 
                        [4] = "ywtyp", 
                        [1] = l_v249_0
                    }, l_yaw_create_0:combo(v6:string_ext("gear") .. "Type", {
                        [1] = "Offset", 
                        [2] = "Center", 
                        [3] = "3-Way", 
                        [4] = "5-Way", 
                        [5] = "Spin", 
                        [6] = "Random"
                    }), 1);
                    l_v236_0.builder[l_v246_0][v249].yaw_modifier_limit = v244({
                        [1] = nil, 
                        [2] = "mod", 
                        [3] = "yawjttr", 
                        [4] = "lmtt", 
                        [1] = l_v249_0
                    }, l_yaw_create_0:slider(v6:string_ext("slider") .. "Limitation\n", -60, 60, 0, 1), 7);
                    l_v236_0.builder[l_v246_0][v249].yaw_modifier_random = v244({
                        [1] = nil, 
                        [2] = "mod", 
                        [3] = "yawjttr", 
                        [4] = "rnd_0", 
                        [1] = l_v249_0
                    }, l_yaw_create_0:slider(v6:string_ext("slider") .. "Irregularity\n", 0, 100, 0, 1, "%"), 7);
                    l_v236_0.builder[l_v246_0][v249].yaw_modifier_defensive = v244({
                        [1] = nil, 
                        [2] = "mod", 
                        [3] = "yawjttr", 
                        [4] = "rnd_0", 
                        [1] = l_v249_0
                    }, l_yaw_create_0:switch(v6:string_ext("toggle-on") .. "Hidden"), 7);
                    l_v236_0.builder[l_v246_0][v249].yaw_modifier_defensive_jitter = v244({
                        [1] = nil, 
                        [2] = "mod", 
                        [3] = "yawjttr", 
                        [4] = "rnd_0", 
                        [1] = l_v249_0
                    }, l_yaw_create_0:slider(v6:string_ext("slider") .. "Defensive limitation\n", -60, 60, 0, 1), 7);
                    l_v236_0.builder[l_v246_0][v249].desync = l_v236_0.base[2]:switch(v6:string_ext("solar-system") .. "Desync" .. v252, false);
                    l_v236_0.builder[l_v246_0][v249].desync_create = v6:create(l_v236_0.builder[l_v246_0][v249].desync);
                    l_yaw_create_0 = l_v236_0.builder[l_v246_0][v249].desync_create;
                    l_v236_0.builder[l_v246_0][v249].desync_side = v244({
                        [1] = nil, 
                        [2] = "mod", 
                        [3] = "dsync", 
                        [4] = "sid_0", 
                        [1] = l_v249_0
                    }, l_yaw_create_0:combo(v6:string_ext("face-smile-upside-down") .. "Side", {
                        [1] = "Left", 
                        [2] = "Right"
                    }), 1);
                    l_v236_0.builder[l_v246_0][v249].desync_invert = v244({
                        [1] = nil, 
                        [2] = "mod", 
                        [3] = "dsync", 
                        [4] = "invt", 
                        [1] = l_v249_0
                    }, l_yaw_create_0:switch(v6:string_ext("toggle-on") .. "Invert", false), 7);
                    l_v236_0.builder[l_v246_0][v249].desync_options_l = v244({
                        [1] = nil, 
                        [2] = "mod", 
                        [3] = "dsync", 
                        [4] = "op_0", 
                        [1] = l_v249_0
                    }, l_yaw_create_0:selectable(v6:string_ext("gear") .. "Options", {
                        [1] = "Jitter", 
                        [2] = "Randomize jitter", 
                        [3] = "Anti-brutforce", 
                        [4] = "Avoid overlap"
                    }), 1);
                    l_v236_0.builder[l_v246_0][v249].desync_freestand_l = v244({
                        [1] = nil, 
                        [2] = "mod", 
                        [3] = "dsync", 
                        [4] = "fs_0", 
                        [1] = l_v249_0
                    }, l_yaw_create_0:combo(v6:string_ext("slideshare") .. "Freestand desync", {
                        [1] = "Disabled", 
                        [2] = "Peek fake", 
                        [3] = "Peek real"
                    }), 1);
                    l_v236_0.builder[l_v246_0][v249].desync_limitation_l = v244({
                        [1] = nil, 
                        [2] = "mod", 
                        [3] = "dsync", 
                        [4] = "lm_0", 
                        [1] = l_v249_0
                    }, l_yaw_create_0:slider(v6:string_ext("slider") .. "Limitation", 0, 60, 60, 1), 7);
                    l_v236_0.builder[l_v246_0][v249].desync_lean_l = v244({
                        [1] = nil, 
                        [2] = "mod", 
                        [3] = "dsync", 
                        [4] = "ln_0", 
                        [1] = l_v249_0
                    }, l_yaw_create_0:slider(v6:string_ext("slider") .. "Lean", 0, 60, 0, 1, "t"), 7);
                    l_v236_0.builder[l_v246_0][v249].desync_options_r = v244({
                        [1] = nil, 
                        [2] = "mod", 
                        [3] = "dsync", 
                        [4] = "op_1", 
                        [1] = l_v249_0
                    }, l_yaw_create_0:selectable(v6:string_ext("gear") .. "Options", {
                        [1] = "Jitter", 
                        [2] = "Randomize jitter", 
                        [3] = "Anti-brutforce", 
                        [4] = "Avoid overlap"
                    }), 1);
                    l_v236_0.builder[l_v246_0][v249].desync_freestand_r = v244({
                        [1] = nil, 
                        [2] = "mod", 
                        [3] = "dsync", 
                        [4] = "fs_1", 
                        [1] = l_v249_0
                    }, l_yaw_create_0:combo(v6:string_ext("slideshare") .. "Freestand desync", {
                        [1] = "Disabled", 
                        [2] = "Peek fake", 
                        [3] = "Peek real"
                    }), 1);
                    l_v236_0.builder[l_v246_0][v249].desync_limitation_r = v244({
                        [1] = nil, 
                        [2] = "mod", 
                        [3] = "dsync", 
                        [4] = "lm_1", 
                        [1] = l_v249_0
                    }, l_yaw_create_0:slider(v6:string_ext("slider") .. "Limitation", 0, 60, 60, 1), 7);
                    l_v236_0.builder[l_v246_0][v249].desync_lean_r = v244({
                        [1] = nil, 
                        [2] = "mod", 
                        [3] = "dsync", 
                        [4] = "ln_1", 
                        [1] = l_v249_0
                    }, l_yaw_create_0:slider(v6:string_ext("slider") .. "Lean", 0, 60, 0, 1, "t"), 7);
                    l_v236_0.builder[l_v246_0][v249].fakeyaw = l_v236_0.base[2]:switch(v6:string_ext("repeat") .. "Fake yaw" .. v252, false);
                    l_v236_0.builder[l_v246_0][v249].fakeyaw_create = v6:create(l_v236_0.builder[l_v246_0][v249].fakeyaw);
                    l_yaw_create_0 = l_v236_0.builder[l_v246_0][v249].fakeyaw_create;
                    l_v236_0.builder[l_v246_0][v249].typ_fakeyaw = v244({
                        [1] = nil, 
                        [2] = "mod", 
                        [3] = "dsync", 
                        [4] = "fkyaw", 
                        [1] = l_v249_0
                    }, l_yaw_create_0:combo(v6:string_ext("gear") .. "Type\n\nFakeYaw", {
                        [1] = "Automatic", 
                        [2] = "Custom"
                    }), 7);
                    l_v236_0.builder[l_v246_0][v249].slider_fakeyaw = v244({
                        [1] = nil, 
                        [2] = "mod", 
                        [3] = "dsync", 
                        [4] = "fkyas", 
                        [1] = l_v249_0
                    }, l_yaw_create_0:slider(v6:string_ext("slider") .. "Limit\n\nFakeYaw", -90, 90, 0, 1), 7);
                    l_v236_0.builder[l_v246_0][v249].break_antiaim = l_v236_0.base[2]:switch(v6:string_ext("person-falling") .. "Break animation" .. v252, false);
                    l_v236_0.builder[l_v246_0][v249].break_antiaim_create = v6:create(l_v236_0.builder[l_v246_0][v249].break_antiaim);
                    l_yaw_create_0 = l_v236_0.builder[l_v246_0][v249].break_antiaim_create;
                    l_v236_0.builder[l_v246_0][v249].typ_break_antiaim = v244({
                        [1] = nil, 
                        [2] = "mod", 
                        [3] = "dsync", 
                        [4] = "fkyaw", 
                        [1] = l_v249_0
                    }, l_yaw_create_0:combo(v6:string_ext("gear") .. "Type\n\nbreak_antiaim", {
                        [1] = "Break", 
                        [2] = "Hidden"
                    }), 7);
                    l_v236_0.builder[l_v246_0][v249].defensive_type_main = l_v236_0.base[2]:slider(v6:string_ext("gear") .. "Defensive mode\n\nmode::defensive", 0, 1, 0, 1, function(v254)
                        if v254 == 0 then
                            return "Default";
                        else
                            return "Exploit";
                        end;
                    end);
                    l_v236_0.builder[l_v246_0][v249].exploit = l_v236_0.base[2]:switch(v6:string_ext("shield") .. "Exploit" .. v252, false);
                    l_v236_0.builder[l_v246_0][v249].exploit_create = v6:create(l_v236_0.builder[l_v246_0][v249].exploit);
                    l_yaw_create_0 = l_v236_0.builder[l_v246_0][v249].exploit_create;
                    l_v236_0.builder[l_v246_0][v249].exploit_defensive_type = v244({
                        [1] = nil, 
                        [2] = "mod", 
                        [3] = "dfnse", 
                        [4] = "mode", 
                        [1] = l_v249_0
                    }, l_yaw_create_0:combo(v6:string_ext("gear") .. "Type\n\n", {
                        [1] = "Always on", 
                        [2] = "Hittable", 
                        [3] = "Automatic"
                    }), 1);
                    l_v236_0.builder[l_v246_0][v249].exploit_disabler = v244({
                        [1] = nil, 
                        [2] = "mod", 
                        [3] = "exploit", 
                        [4] = "clear", 
                        [1] = l_v249_0
                    }, l_yaw_create_0:selectable(v6:string_ext("broom") .. "Clear\n\n", {
                        [1] = "Yaw", 
                        [2] = "Yaw modifier", 
                        [3] = "Desync", 
                        [4] = "Desync invert"
                    }), 1);
                    l_v236_0.builder[l_v246_0][v249].exploit_pitch = v244({
                        [1] = nil, 
                        [2] = "mod", 
                        [3] = "explt", 
                        [4] = "pitch", 
                        [1] = l_v249_0
                    }, l_yaw_create_0:combo(v6:string_ext("caret-up") .. "Pitch\n", {
                        [1] = "Disabled", 
                        [2] = "Default", 
                        [3] = "Up", 
                        [4] = "Zero", 
                        [5] = "Random", 
                        [6] = "Switch", 
                        [7] = "Automatic", 
                        [8] = "Sway", 
                        [9] = "Custom"
                    }));
                    l_v236_0.builder[l_v246_0][v249].exploit_custom_pitch = v244({
                        [1] = nil, 
                        [2] = "mod", 
                        [3] = "explt", 
                        [4] = "pitch", 
                        [1] = l_v249_0
                    }, l_yaw_create_0:slider("\nexploit::pitch_custom", -89, 89, 0, 1));
                    l_v236_0.builder[l_v246_0][v249].exploit_yaw = v244({
                        [1] = nil, 
                        [2] = "mod", 
                        [3] = "explt", 
                        [4] = "yaw", 
                        [1] = l_v249_0
                    }, l_yaw_create_0:combo(v6:string_ext("left-right") .. "Yaw\n", {
                        [1] = "Disabled", 
                        [2] = "Default", 
                        [3] = "180", 
                        [4] = "360", 
                        [5] = "720", 
                        [6] = "Random", 
                        [7] = "Switch", 
                        [8] = "Automatic", 
                        [9] = "Half", 
                        [10] = "Sway", 
                        [11] = "Custom"
                    }));
                    l_v236_0.builder[l_v246_0][v249].exploit_custom_yaw = v244({
                        [1] = nil, 
                        [2] = "mod", 
                        [3] = "explt", 
                        [4] = "yaw", 
                        [1] = l_v249_0
                    }, l_yaw_create_0:slider("\nexploit::yaw_custom", -60, 60, 0, 1));
                    l_v236_0.builder[l_v246_0][v249].defensive = l_v236_0.base[2]:switch(v6:string_ext("shield") .. "Defensive" .. v252, false);
                    l_v236_0.builder[l_v246_0][v249].defensive_create = v6:create(l_v236_0.builder[l_v246_0][v249].defensive);
                    l_yaw_create_0 = l_v236_0.builder[l_v246_0][v249].defensive_create;
                    l_v236_0.builder[l_v246_0][v249].defensive_type = v244({
                        [1] = nil, 
                        [2] = "mod", 
                        [3] = "dfnse", 
                        [4] = "mode", 
                        [1] = l_v249_0
                    }, l_yaw_create_0:combo(v6:string_ext("gear") .. "Type\n", {
                        [1] = "Always on", 
                        [2] = "Hittable", 
                        [3] = "Prediction"
                    }), 1);
                    l_v236_0.builder[l_v246_0][v249].defensive_session = v244({
                        [1] = nil, 
                        [2] = "mod", 
                        [3] = "dfnss", 
                        [4] = "sess", 
                        [1] = l_v249_0
                    }, l_yaw_create_0:combo(v6:string_ext("leaf") .. "Session mode", {
                        [1] = "Default", 
                        [2] = "Dynamic"
                    }), 1);
                    l_v236_0.builder[l_v246_0][v249].defensive_disabler = v244({
                        [1] = nil, 
                        [2] = "mod", 
                        [3] = "dfnse", 
                        [4] = "clea", 
                        [1] = l_v249_0
                    }, l_yaw_create_0:selectable(v6:string_ext("broom") .. "Clear", {
                        [1] = "Yaw", 
                        [2] = "Yaw modifier", 
                        [3] = "Desync", 
                        [4] = "Desync invert"
                    }), 1);
                    l_v236_0.builder[l_v246_0][v249].defensive_pitch = v244({
                        [1] = nil, 
                        [2] = "mod", 
                        [3] = "dfnse", 
                        [4] = "df_p", 
                        [1] = l_v249_0
                    }, l_yaw_create_0:combo(v6:string_ext("caret-up") .. "Pitch", {
                        [1] = "Disabled", 
                        [2] = "Default", 
                        [3] = "Up", 
                        [4] = "Zero", 
                        [5] = "Random", 
                        [6] = "Switch", 
                        [7] = "Automatic", 
                        [8] = "Sway", 
                        [9] = "Custom"
                    }), 1);
                    l_v236_0.builder[l_v246_0][v249].defensive_pitch_custom = v244({
                        [1] = nil, 
                        [2] = "mod", 
                        [3] = "dfnse", 
                        [4] = "dp_c", 
                        [1] = l_v249_0
                    }, l_yaw_create_0:slider("\n\n\n\n", -89, 89, 0, 1), 7);
                    l_v236_0.builder[l_v246_0][v249].defensive_yaw = v244({
                        [1] = nil, 
                        [2] = "mod", 
                        [3] = "dfnse", 
                        [4] = "df_y", 
                        [1] = l_v249_0
                    }, l_yaw_create_0:combo(v6:string_ext("left-right") .. "Yaw", {
                        [1] = "Disabled", 
                        [2] = "Default", 
                        [3] = "180", 
                        [4] = "360", 
                        [5] = "720", 
                        [6] = "Random", 
                        [7] = "Switch", 
                        [8] = "Automatic", 
                        [9] = "Half", 
                        [10] = "Sway", 
                        [11] = "Custom"
                    }), 1);
                    l_v236_0.builder[l_v246_0][v249].defensive_yaw_switch = v244({
                        [1] = nil, 
                        [2] = "mod", 
                        [3] = "dfnse", 
                        [4] = "sw_y", 
                        [1] = l_v249_0
                    }, l_yaw_create_0:slider("\n\nccccc", -60, 60, 0, 1), 7);
                    l_v236_0.builder[l_v246_0][v249].defensive_yaw_switch_speed = v244({
                        [1] = nil, 
                        [2] = "mod", 
                        [3] = "dfnse", 
                        [4] = "sw_y", 
                        [1] = l_v249_0
                    }, l_yaw_create_0:slider(v6:string_ext("bolt") .. "Speed\n\ncfc", 2, 64, 2, 1, "t"), 7);
                    l_v236_0.builder[l_v246_0][v249].defensive_yaw_custom = v244({
                        [1] = nil, 
                        [2] = "mod", 
                        [3] = "dfnse", 
                        [4] = "cs_y", 
                        [1] = l_v249_0
                    }, l_yaw_create_0:slider("\n\n\n\n", -60, 60, 0, 1), 7);
                    l_v236_0.builder[l_v246_0][v249].defensive_spin_speed = v244({
                        [1] = nil, 
                        [2] = "mod", 
                        [3] = "dfnse", 
                        [4] = "sp_s", 
                        [1] = l_v249_0
                    }, l_yaw_create_0:slider("\n\n\n\n\n\n", -32, 32, 0, 1), 7);
                    do
                        local l_v249_1 = v249;
                        l_v236_0.builder[l_v246_0][l_v249_1].settings = v6.menu.aa_4:label(v6:string_ext("gear") .. "Settings", function(v256)
                            -- upvalues: v6 (ref), l_pui_0 (ref), l_v236_0 (ref), l_v246_0 (ref), l_v249_1 (ref), v0 (ref), l_table_0 (ref), l_math_0 (ref), l_clipboard_0 (ref), l_string_0 (ref)
                            return {
                                export_current_state = v256:button(v6:string_ext("file-export") .. "Export current state", function()
                                    -- upvalues: l_pui_0 (ref), l_v236_0 (ref), l_v246_0 (ref), l_v249_1 (ref), v6 (ref), v0 (ref), l_table_0 (ref), l_math_0 (ref), l_clipboard_0 (ref)
                                    local v257 = l_pui_0.setup({
                                        [1] = l_v236_0.builder[l_v246_0][l_v249_1], 
                                        [2] = l_v236_0.value.player_team, 
                                        [3] = l_v236_0.value.player_states
                                    }, true);
                                    local v261 = "[celestium ~ alpha]" .. v6.cde.algorithm(json.stringify(v257:save()), "e") .. "[" .. v0.run(function()
                                        -- upvalues: v6 (ref), l_table_0 (ref), l_math_0 (ref)
                                        local v258 = json.stringify(v6.database.antiaim_builder);
                                        local v259 = {};
                                        for v260 = 1, #v258 do
                                            l_table_0.insert(v259, l_math_0.deg(v258:sub(v260, v260):byte() / 0.793289523));
                                        end;
                                        return l_table_0.concat(v259);
                                    end) .. "]";
                                    l_clipboard_0.set(v261);
                                    v6.cde.add_notify("Your config was copied successfully", "celestium");
                                end, true), 
                                import_current_state = v256:button(v6:string_ext("file-import") .. " Import current state", function()
                                    -- upvalues: l_pui_0 (ref), l_v236_0 (ref), l_v246_0 (ref), l_v249_1 (ref), l_clipboard_0 (ref), l_string_0 (ref), v6 (ref), v0 (ref)
                                    local v262 = l_pui_0.setup({
                                        [1] = l_v236_0.builder[l_v246_0][l_v249_1], 
                                        [2] = l_v236_0.value.player_team, 
                                        [3] = l_v236_0.value.player_states
                                    }, true);
                                    local v263 = l_clipboard_0.get();
                                    local v264, _ = l_string_0.find(v263, "celestium ~ alpha");
                                    if not v264 then
                                        v6.cde.add_notify("Your settings are corrupted or you are trying to transfer an incorrect config. please check again");
                                        return;
                                    else
                                        local v269 = v0.run(function(v266)
                                            local v267 = v266:find("%[");
                                            if not v267 then
                                                return v266;
                                            else
                                                local v268 = v266:find("%[", v267 + 1);
                                                if v268 then
                                                    return v266:sub(1, v268 - 1);
                                                else
                                                    return v266;
                                                end;
                                            end;
                                        end, v263):gsub("%[celestium ~ alpha%]", "");
                                        local v270 = v6.cde.algorithm(v269, "d");
                                        local l_status_6, _ = pcall(function()
                                            -- upvalues: v270 (ref), v262 (ref)
                                            if v270 ~= "broken" then
                                                return v262:load(json.parse(v270));
                                            else
                                                return nil;
                                            end;
                                        end);
                                        if l_status_6 then
                                            v6.cde.add_notify("Your config was imported successfully");
                                        else
                                            v6.cde.add_notify("Your settings are corrupted or you are trying to transfer an incorrect config. please check again");
                                        end;
                                        return;
                                    end;
                                end, true), 
                                reset_current_state = v256:button(v6:string_ext("trash") .. "\aCF6A6AFF" .. "  Reset current state  ", function()
                                    -- upvalues: l_v236_0 (ref), l_v246_0 (ref), l_v249_1 (ref)
                                    l_v236_0.builder[l_v246_0][l_v249_1].enable:set(false);
                                    l_v236_0.builder[l_v246_0][l_v249_1].yaw:set(false);
                                    l_v236_0.builder[l_v246_0][l_v249_1].yaw_limit_static:set(0);
                                    l_v236_0.builder[l_v246_0][l_v249_1].yaw_limit_static_random:set(0);
                                    l_v236_0.builder[l_v246_0][l_v249_1].yaw_limit_l:set(0);
                                    l_v236_0.builder[l_v246_0][l_v249_1].yaw_limit_r:set(0);
                                    l_v236_0.builder[l_v246_0][l_v249_1].yaw_limit_dl:set(0);
                                    l_v236_0.builder[l_v246_0][l_v249_1].yaw_limit_dr:set(0);
                                    l_v236_0.builder[l_v246_0][l_v249_1].yaw_limit_dd:set(2);
                                    l_v236_0.builder[l_v246_0][l_v249_1].yaw_limit_drd:set(0);
                                    l_v236_0.builder[l_v246_0][l_v249_1].yaw_type:set("Static");
                                    l_v236_0.builder[l_v246_0][l_v249_1].yawmodifier:set(false);
                                    l_v236_0.builder[l_v246_0][l_v249_1].yaw_modifier_limit:set(0);
                                    l_v236_0.builder[l_v246_0][l_v249_1].yaw_modifier_random:set(0);
                                    l_v236_0.builder[l_v246_0][l_v249_1].yaw_modifier_type:set("Offset");
                                    l_v236_0.builder[l_v246_0][l_v249_1].operator:set("Neverlose");
                                    l_v236_0.builder[l_v246_0][l_v249_1].yaw_modifier_defensive:set(false);
                                    l_v236_0.builder[l_v246_0][l_v249_1].yaw_modifier_defensive_jitter:set(0);
                                    l_v236_0.builder[l_v246_0][l_v249_1].desync:set(false);
                                    l_v236_0.builder[l_v246_0][l_v249_1].desync_side:set("Left");
                                    l_v236_0.builder[l_v246_0][l_v249_1].desync_invert:set(false);
                                    l_v236_0.builder[l_v246_0][l_v249_1].desync_options_l:set({});
                                    l_v236_0.builder[l_v246_0][l_v249_1].desync_freestand_l:set("Disabled");
                                    l_v236_0.builder[l_v246_0][l_v249_1].desync_limitation_l:set(60);
                                    l_v236_0.builder[l_v246_0][l_v249_1].desync_lean_l:set(0);
                                    l_v236_0.builder[l_v246_0][l_v249_1].desync_options_r:set({});
                                    l_v236_0.builder[l_v246_0][l_v249_1].desync_freestand_r:set("Disabled");
                                    l_v236_0.builder[l_v246_0][l_v249_1].desync_limitation_r:set(60);
                                    l_v236_0.builder[l_v246_0][l_v249_1].desync_lean_r:set(0);
                                    l_v236_0.builder[l_v246_0][l_v249_1].fakeyaw:set(false);
                                    l_v236_0.builder[l_v246_0][l_v249_1].typ_fakeyaw:set("Automatic");
                                    l_v236_0.builder[l_v246_0][l_v249_1].slider_fakeyaw:set(0);
                                    l_v236_0.builder[l_v246_0][l_v249_1].break_antiaim:set(false);
                                    l_v236_0.builder[l_v246_0][l_v249_1].typ_break_antiaim:set("Break");
                                    l_v236_0.builder[l_v246_0][l_v249_1].defensive_type_main:set(0);
                                    l_v236_0.builder[l_v246_0][l_v249_1].exploit:set(false);
                                    l_v236_0.builder[l_v246_0][l_v249_1].exploit_defensive_type:set("Always on");
                                    l_v236_0.builder[l_v246_0][l_v249_1].exploit_disabler:set({});
                                    l_v236_0.builder[l_v246_0][l_v249_1].exploit_pitch:set("Disabled");
                                    l_v236_0.builder[l_v246_0][l_v249_1].exploit_custom_pitch:set(0);
                                    l_v236_0.builder[l_v246_0][l_v249_1].exploit_yaw:set("Disabled");
                                    l_v236_0.builder[l_v246_0][l_v249_1].exploit_custom_yaw:set(0);
                                    l_v236_0.builder[l_v246_0][l_v249_1].defensive:set(false);
                                    l_v236_0.builder[l_v246_0][l_v249_1].defensive_type:set("Always on");
                                    l_v236_0.builder[l_v246_0][l_v249_1].defensive_session:set("Default");
                                    l_v236_0.builder[l_v246_0][l_v249_1].defensive_disabler:set({});
                                    l_v236_0.builder[l_v246_0][l_v249_1].defensive_pitch:set("Disabled");
                                    l_v236_0.builder[l_v246_0][l_v249_1].defensive_pitch_custom:set(0);
                                    l_v236_0.builder[l_v246_0][l_v249_1].defensive_yaw:set("Disabled");
                                    l_v236_0.builder[l_v246_0][l_v249_1].defensive_yaw_switch:set(0);
                                    l_v236_0.builder[l_v246_0][l_v249_1].defensive_yaw_switch_speed:set(2);
                                    l_v236_0.builder[l_v246_0][l_v249_1].defensive_yaw_custom:set(0);
                                    l_v236_0.builder[l_v246_0][l_v249_1].defensive_spin_speed:set(0);
                                end, true)
                            };
                        end);
                        l_v236_0.builder[l_v246_0][l_v249_1].import_other_team = v6.menu.aa_4:button(v6:string_ext("file") .. v6:format("Import [link]%s[reset] team", l_v246_0 == 2 and v6.database.config.states.team.ct.name or v6.database.config.states.team.t.name), function()
                            -- upvalues: l_v246_0 (ref), l_v236_0 (ref), l_v249_1 (ref), v6 (ref)
                            local v273 = l_v246_0 == 2 and 1 or 2;
                            local l_status_7, l_result_7 = pcall(function()
                                -- upvalues: l_v236_0 (ref), v273 (ref), l_v249_1 (ref), l_v246_0 (ref)
                                l_v236_0.builder[v273][l_v249_1].enable:set(l_v236_0.builder[l_v246_0][l_v249_1].enable:get());
                                l_v236_0.builder[v273][l_v249_1].yaw:set(l_v236_0.builder[l_v246_0][l_v249_1].yaw:get());
                                l_v236_0.builder[v273][l_v249_1].yaw_limit_static:set(l_v236_0.builder[l_v246_0][l_v249_1].yaw_limit_static:get());
                                l_v236_0.builder[v273][l_v249_1].yaw_limit_static_random:set(l_v236_0.builder[l_v246_0][l_v249_1].yaw_limit_static_random:get());
                                l_v236_0.builder[v273][l_v249_1].yaw_limit_l:set(l_v236_0.builder[l_v246_0][l_v249_1].yaw_limit_l:get());
                                l_v236_0.builder[v273][l_v249_1].yaw_limit_r:set(l_v236_0.builder[l_v246_0][l_v249_1].yaw_limit_r:get());
                                l_v236_0.builder[v273][l_v249_1].yaw_limit_dl:set(l_v236_0.builder[l_v246_0][l_v249_1].yaw_limit_dl:get());
                                l_v236_0.builder[v273][l_v249_1].yaw_limit_dr:set(l_v236_0.builder[l_v246_0][l_v249_1].yaw_limit_dr:get());
                                l_v236_0.builder[v273][l_v249_1].yaw_limit_dd:set(l_v236_0.builder[l_v246_0][l_v249_1].yaw_limit_dd:get());
                                l_v236_0.builder[v273][l_v249_1].yaw_limit_drd:set(l_v236_0.builder[l_v246_0][l_v249_1].yaw_limit_drd:get());
                                l_v236_0.builder[v273][l_v249_1].yaw_type:set(l_v236_0.builder[l_v246_0][l_v249_1].yaw_type:get());
                                l_v236_0.builder[v273][l_v249_1].yawmodifier:set(l_v236_0.builder[l_v246_0][l_v249_1].yawmodifier:get());
                                l_v236_0.builder[v273][l_v249_1].yaw_modifier_limit:set(l_v236_0.builder[l_v246_0][l_v249_1].yaw_modifier_limit:get());
                                l_v236_0.builder[v273][l_v249_1].yaw_modifier_random:set(l_v236_0.builder[l_v246_0][l_v249_1].yaw_modifier_random:get());
                                l_v236_0.builder[v273][l_v249_1].yaw_modifier_type:set(l_v236_0.builder[l_v246_0][l_v249_1].yaw_modifier_type:get());
                                l_v236_0.builder[v273][l_v249_1].operator:set(l_v236_0.builder[l_v246_0][l_v249_1].operator:get());
                                l_v236_0.builder[v273][l_v249_1].yaw_modifier_defensive:set(l_v236_0.builder[l_v246_0][l_v249_1].yaw_modifier_defensive:get());
                                l_v236_0.builder[v273][l_v249_1].yaw_modifier_defensive_jitter:set(l_v236_0.builder[l_v246_0][l_v249_1].yaw_modifier_defensive_jitter:get());
                                l_v236_0.builder[v273][l_v249_1].desync:set(l_v236_0.builder[l_v246_0][l_v249_1].desync:get());
                                l_v236_0.builder[v273][l_v249_1].desync_side:set(l_v236_0.builder[l_v246_0][l_v249_1].desync_side:get());
                                l_v236_0.builder[v273][l_v249_1].desync_invert:set(l_v236_0.builder[l_v246_0][l_v249_1].desync_invert:get());
                                l_v236_0.builder[v273][l_v249_1].desync_options_l:set(l_v236_0.builder[l_v246_0][l_v249_1].desync_options_l:get());
                                l_v236_0.builder[v273][l_v249_1].desync_freestand_l:set(l_v236_0.builder[l_v246_0][l_v249_1].desync_freestand_l:get());
                                l_v236_0.builder[v273][l_v249_1].desync_limitation_l:set(l_v236_0.builder[l_v246_0][l_v249_1].desync_limitation_l:get());
                                l_v236_0.builder[v273][l_v249_1].desync_lean_l:set(l_v236_0.builder[l_v246_0][l_v249_1].desync_lean_l:get());
                                l_v236_0.builder[v273][l_v249_1].desync_options_r:set(l_v236_0.builder[l_v246_0][l_v249_1].desync_options_r:get());
                                l_v236_0.builder[v273][l_v249_1].desync_freestand_r:set(l_v236_0.builder[l_v246_0][l_v249_1].desync_freestand_r:get());
                                l_v236_0.builder[v273][l_v249_1].desync_limitation_r:set(l_v236_0.builder[l_v246_0][l_v249_1].desync_limitation_r:get());
                                l_v236_0.builder[v273][l_v249_1].desync_lean_r:set(l_v236_0.builder[l_v246_0][l_v249_1].desync_lean_r:get());
                                l_v236_0.builder[v273][l_v249_1].fakeyaw:set(l_v236_0.builder[l_v246_0][l_v249_1].fakeyaw:get());
                                l_v236_0.builder[v273][l_v249_1].typ_fakeyaw:set(l_v236_0.builder[l_v246_0][l_v249_1].typ_fakeyaw:get());
                                l_v236_0.builder[v273][l_v249_1].slider_fakeyaw:set(l_v236_0.builder[l_v246_0][l_v249_1].slider_fakeyaw:get());
                                l_v236_0.builder[v273][l_v249_1].break_antiaim:set(l_v236_0.builder[l_v246_0][l_v249_1].break_antiaim:get());
                                l_v236_0.builder[v273][l_v249_1].typ_break_antiaim:set(l_v236_0.builder[l_v246_0][l_v249_1].typ_break_antiaim:get());
                                l_v236_0.builder[v273][l_v249_1].defensive_type_main:set(l_v236_0.builder[l_v246_0][l_v249_1].defensive_type_main:get());
                                l_v236_0.builder[v273][l_v249_1].exploit:set(l_v236_0.builder[l_v246_0][l_v249_1].exploit:get());
                                l_v236_0.builder[v273][l_v249_1].exploit_defensive_type:set(l_v236_0.builder[l_v246_0][l_v249_1].exploit_defensive_type:get());
                                l_v236_0.builder[v273][l_v249_1].exploit_disabler:set(l_v236_0.builder[l_v246_0][l_v249_1].exploit_disabler:get());
                                l_v236_0.builder[v273][l_v249_1].exploit_pitch:set(l_v236_0.builder[l_v246_0][l_v249_1].exploit_pitch:get());
                                l_v236_0.builder[v273][l_v249_1].exploit_custom_pitch:set(l_v236_0.builder[l_v246_0][l_v249_1].exploit_custom_pitch:get());
                                l_v236_0.builder[v273][l_v249_1].exploit_yaw:set(l_v236_0.builder[l_v246_0][l_v249_1].exploit_yaw:get());
                                l_v236_0.builder[v273][l_v249_1].exploit_custom_yaw:set(l_v236_0.builder[l_v246_0][l_v249_1].exploit_custom_yaw:get());
                                l_v236_0.builder[v273][l_v249_1].defensive:set(l_v236_0.builder[l_v246_0][l_v249_1].defensive:get());
                                l_v236_0.builder[v273][l_v249_1].defensive_type:set(l_v236_0.builder[l_v246_0][l_v249_1].defensive_type:get());
                                l_v236_0.builder[v273][l_v249_1].defensive_session:set(l_v236_0.builder[l_v246_0][l_v249_1].defensive_session:get());
                                l_v236_0.builder[v273][l_v249_1].defensive_disabler:set(l_v236_0.builder[l_v246_0][l_v249_1].defensive_disabler:get());
                                l_v236_0.builder[v273][l_v249_1].defensive_pitch:set(l_v236_0.builder[l_v246_0][l_v249_1].defensive_pitch:get());
                                l_v236_0.builder[v273][l_v249_1].defensive_pitch_custom:set(l_v236_0.builder[l_v246_0][l_v249_1].defensive_pitch_custom:get());
                                l_v236_0.builder[v273][l_v249_1].defensive_yaw:set(l_v236_0.builder[l_v246_0][l_v249_1].defensive_yaw:get());
                                l_v236_0.builder[v273][l_v249_1].defensive_yaw_switch:set(l_v236_0.builder[l_v246_0][l_v249_1].defensive_yaw_switch:get());
                                l_v236_0.builder[v273][l_v249_1].defensive_yaw_switch_speed:set(l_v236_0.builder[l_v246_0][l_v249_1].defensive_yaw_switch_speed:get());
                                l_v236_0.builder[v273][l_v249_1].defensive_yaw_custom:set(l_v236_0.builder[l_v246_0][l_v249_1].defensive_yaw_custom:get());
                                l_v236_0.builder[v273][l_v249_1].defensive_spin_speed:set(l_v236_0.builder[l_v246_0][l_v249_1].defensive_spin_speed:get());
                            end);
                            local v276 = nil;
                            local v277 = nil;
                            if v273 == 2 then
                                v276 = v6.database.config.states.team.ct.name;
                                v277 = v6.database.config.states.team.t.name;
                            elseif v273 == 1 then
                                v276 = v6.database.config.states.team.t.name;
                                v277 = v6.database.config.states.team.ct.name;
                            end;
                            if l_status_7 then
                                v6.cde.add_notify(v6:format("%s settings successfully transferred to %s settings", v276, v277));
                                return l_result_7;
                            else
                                v6.cde.add_notify(v6:format("An error occurred during transfer! not all settings were transferred"));
                                return;
                            end;
                        end, true);
                    end;
                end;
            end;
        end;
        for v278, _ in pairs(l_v236_0.team.generic) do
            local v280 = {
                [1] = l_v236_0.value.player_team, 
                [2] = l_v236_0.team.generic[v278]
            };
            do
                local l_v278_0 = v278;
                for v282, v283 in pairs(l_v236_0.states) do
                    do
                        local l_v282_0, l_v283_0 = v282, v283;
                        local v286 = {
                            [1] = l_v236_0.builder[l_v278_0][l_v282_0].enable, 
                            [2] = function()
                                -- upvalues: l_v282_0 (ref), l_v236_0 (ref), l_v278_0 (ref)
                                if l_v282_0 == 1 then
                                    return true;
                                else
                                    return l_v236_0.builder[l_v278_0][l_v282_0].enable:get();
                                end;
                            end
                        };
                        local v287 = {
                            [1] = l_v236_0.value.player_states, 
                            [2] = l_v236_0.states[l_v282_0]
                        };
                        local _ = l_table_0.unpack({
                            [1] = v287, 
                            [2] = v280, 
                            [3] = v286
                        });
                        l_v236_0.builder[l_v278_0][l_v282_0].enable:depend(v287, v280, {
                            [1] = l_v236_0.value.player_states, 
                            [2] = function()
                                -- upvalues: l_v283_0 (ref)
                                return l_v283_0 ~= 1;
                            end
                        }, l_v236_0.visibility[1][2]);
                        l_v236_0.builder[l_v278_0][l_v282_0].yaw:depend(v287, v280, l_v236_0.visibility[1][1]);
                        l_v236_0.builder[l_v278_0][l_v282_0].yaw_type:depend(v287, v280, l_v236_0.builder[l_v278_0][l_v282_0].yaw, l_v236_0.visibility[1][1]);
                        l_v236_0.builder[l_v278_0][l_v282_0].yaw_limit_static:depend(v287, v280, l_v236_0.builder[l_v278_0][l_v282_0].yaw, {
                            [1] = nil, 
                            [2] = "Static", 
                            [3] = "Sway", 
                            [4] = "Spin", 
                            [1] = l_v236_0.builder[l_v278_0][l_v282_0].yaw_type
                        }, l_v236_0.visibility[1][1]);
                        l_v236_0.builder[l_v278_0][l_v282_0].yaw_limit_static_random:depend(v287, v280, l_v236_0.builder[l_v278_0][l_v282_0].yaw, {
                            [1] = nil, 
                            [2] = "Static", 
                            [3] = "Sway", 
                            [4] = "Spin", 
                            [1] = l_v236_0.builder[l_v278_0][l_v282_0].yaw_type
                        }, l_v236_0.visibility[1][1]);
                        l_v236_0.builder[l_v278_0][l_v282_0].yaw_limit_l:depend(v287, v280, l_v236_0.builder[l_v278_0][l_v282_0].yaw, {
                            [1] = nil, 
                            [2] = "L & R", 
                            [1] = l_v236_0.builder[l_v278_0][l_v282_0].yaw_type
                        }, l_v236_0.visibility[1][1]);
                        l_v236_0.builder[l_v278_0][l_v282_0].yaw_limit_r:depend(v287, v280, l_v236_0.builder[l_v278_0][l_v282_0].yaw, {
                            [1] = nil, 
                            [2] = "L & R", 
                            [1] = l_v236_0.builder[l_v278_0][l_v282_0].yaw_type
                        }, l_v236_0.visibility[1][1]);
                        l_v236_0.builder[l_v278_0][l_v282_0].yaw_limit_dl:depend(v287, v280, l_v236_0.builder[l_v278_0][l_v282_0].yaw, {
                            [1] = nil, 
                            [2] = "Delay", 
                            [1] = l_v236_0.builder[l_v278_0][l_v282_0].yaw_type
                        }, l_v236_0.visibility[1][1]);
                        l_v236_0.builder[l_v278_0][l_v282_0].yaw_limit_dr:depend(v287, v280, l_v236_0.builder[l_v278_0][l_v282_0].yaw, {
                            [1] = nil, 
                            [2] = "Delay", 
                            [1] = l_v236_0.builder[l_v278_0][l_v282_0].yaw_type
                        }, l_v236_0.visibility[1][1]);
                        l_v236_0.builder[l_v278_0][l_v282_0].yaw_limit_dd:depend(v287, v280, l_v236_0.builder[l_v278_0][l_v282_0].yaw, {
                            [1] = nil, 
                            [2] = "Delay", 
                            [1] = l_v236_0.builder[l_v278_0][l_v282_0].yaw_type
                        }, l_v236_0.visibility[1][1]);
                        l_v236_0.builder[l_v278_0][l_v282_0].yaw_limit_drd:depend(v287, v280, l_v236_0.builder[l_v278_0][l_v282_0].yaw, {
                            [1] = nil, 
                            [2] = "Delay", 
                            [1] = l_v236_0.builder[l_v278_0][l_v282_0].yaw_type
                        }, l_v236_0.visibility[1][1]);
                        l_v236_0.builder[l_v278_0][l_v282_0].yawmodifier:depend(v287, v280, l_v236_0.visibility[1][1]);
                        l_v236_0.builder[l_v278_0][l_v282_0].operator:depend(v287, v280, l_v236_0.builder[l_v278_0][l_v282_0].yawmodifier, l_v236_0.visibility[1][1]);
                        l_v236_0.builder[l_v278_0][l_v282_0].yaw_modifier_type:depend(v287, v280, l_v236_0.builder[l_v278_0][l_v282_0].yawmodifier, l_v236_0.visibility[1][1]);
                        l_v236_0.builder[l_v278_0][l_v282_0].yaw_modifier_limit:depend(v287, v280, l_v236_0.builder[l_v278_0][l_v282_0].yawmodifier, l_v236_0.visibility[1][1]);
                        l_v236_0.builder[l_v278_0][l_v282_0].yaw_modifier_random:depend(v287, v280, l_v236_0.builder[l_v278_0][l_v282_0].yawmodifier, l_v236_0.visibility[1][1]);
                        l_v236_0.builder[l_v278_0][l_v282_0].yaw_modifier_defensive:depend(v287, v280, l_v236_0.builder[l_v278_0][l_v282_0].yawmodifier, l_v236_0.visibility[1][1]);
                        l_v236_0.builder[l_v278_0][l_v282_0].yaw_modifier_defensive_jitter:depend(v287, v280, l_v236_0.builder[l_v278_0][l_v282_0].yawmodifier, l_v236_0.builder[l_v278_0][l_v282_0].yaw_modifier_defensive, l_v236_0.visibility[1][1]);
                        l_v236_0.builder[l_v278_0][l_v282_0].desync:depend(v287, v280, l_v236_0.visibility[1][1]);
                        l_v236_0.builder[l_v278_0][l_v282_0].desync_side:depend(v287, v280, l_v236_0.builder[l_v278_0][l_v282_0].desync, l_v236_0.visibility[1][1]);
                        l_v236_0.builder[l_v278_0][l_v282_0].desync_invert:depend(v287, v280, l_v236_0.builder[l_v278_0][l_v282_0].desync, l_v236_0.visibility[1][1]);
                        l_v236_0.builder[l_v278_0][l_v282_0].desync_options_l:depend(v287, v280, l_v236_0.builder[l_v278_0][l_v282_0].desync, l_v236_0.visibility[1][1], {
                            [1] = nil, 
                            [2] = "Left", 
                            [1] = l_v236_0.builder[l_v278_0][l_v282_0].desync_side
                        });
                        l_v236_0.builder[l_v278_0][l_v282_0].desync_freestand_l:depend(v287, v280, l_v236_0.builder[l_v278_0][l_v282_0].desync, l_v236_0.visibility[1][1], {
                            [1] = nil, 
                            [2] = "Left", 
                            [1] = l_v236_0.builder[l_v278_0][l_v282_0].desync_side
                        });
                        l_v236_0.builder[l_v278_0][l_v282_0].desync_limitation_l:depend(v287, v280, l_v236_0.builder[l_v278_0][l_v282_0].desync, l_v236_0.visibility[1][1], {
                            [1] = nil, 
                            [2] = "Left", 
                            [1] = l_v236_0.builder[l_v278_0][l_v282_0].desync_side
                        });
                        l_v236_0.builder[l_v278_0][l_v282_0].desync_lean_l:depend(v287, v280, l_v236_0.builder[l_v278_0][l_v282_0].desync, l_v236_0.visibility[1][1], {
                            [1] = nil, 
                            [2] = "Left", 
                            [1] = l_v236_0.builder[l_v278_0][l_v282_0].desync_side
                        });
                        l_v236_0.builder[l_v278_0][l_v282_0].desync_options_r:depend(v287, v280, l_v236_0.builder[l_v278_0][l_v282_0].desync, l_v236_0.visibility[1][1], {
                            [1] = nil, 
                            [2] = "Right", 
                            [1] = l_v236_0.builder[l_v278_0][l_v282_0].desync_side
                        });
                        l_v236_0.builder[l_v278_0][l_v282_0].desync_freestand_r:depend(v287, v280, l_v236_0.builder[l_v278_0][l_v282_0].desync, l_v236_0.visibility[1][1], {
                            [1] = nil, 
                            [2] = "Right", 
                            [1] = l_v236_0.builder[l_v278_0][l_v282_0].desync_side
                        });
                        l_v236_0.builder[l_v278_0][l_v282_0].desync_limitation_r:depend(v287, v280, l_v236_0.builder[l_v278_0][l_v282_0].desync, l_v236_0.visibility[1][1], {
                            [1] = nil, 
                            [2] = "Right", 
                            [1] = l_v236_0.builder[l_v278_0][l_v282_0].desync_side
                        });
                        l_v236_0.builder[l_v278_0][l_v282_0].desync_lean_r:depend(v287, v280, l_v236_0.builder[l_v278_0][l_v282_0].desync, l_v236_0.visibility[1][1], {
                            [1] = nil, 
                            [2] = "Right", 
                            [1] = l_v236_0.builder[l_v278_0][l_v282_0].desync_side
                        });
                        l_v236_0.builder[l_v278_0][l_v282_0].fakeyaw:depend(v287, v280, l_v236_0.visibility[1][1]);
                        l_v236_0.builder[l_v278_0][l_v282_0].typ_fakeyaw:depend(v287, v280, l_v236_0.visibility[1][1], l_v236_0.builder[l_v278_0][l_v282_0].fakeyaw);
                        l_v236_0.builder[l_v278_0][l_v282_0].slider_fakeyaw:depend(v287, v280, l_v236_0.visibility[1][1], l_v236_0.builder[l_v278_0][l_v282_0].fakeyaw, {
                            [1] = nil, 
                            [2] = "Custom", 
                            [1] = l_v236_0.builder[l_v278_0][l_v282_0].typ_fakeyaw
                        });
                        l_v236_0.builder[l_v278_0][l_v282_0].break_antiaim:depend(v287, v280, l_v236_0.visibility[1][1]);
                        l_v236_0.builder[l_v278_0][l_v282_0].typ_break_antiaim:depend(v287, v280, l_v236_0.visibility[1][1], l_v236_0.builder[l_v278_0][l_v282_0].break_antiaim);
                        l_v236_0.builder[l_v278_0][l_v282_0].defensive_type_main:depend(v287, v280, l_v236_0.visibility[1][3]);
                        l_v236_0.builder[l_v278_0][l_v282_0].exploit:depend(v287, v280, l_v236_0.visibility[1][3], {
                            [1] = nil, 
                            [2] = 1, 
                            [1] = l_v236_0.builder[l_v278_0][l_v282_0].defensive_type_main
                        });
                        l_v236_0.builder[l_v278_0][l_v282_0].exploit_defensive_type:depend(v287, v280, l_v236_0.visibility[1][3], {
                            [1] = nil, 
                            [2] = 1, 
                            [1] = l_v236_0.builder[l_v278_0][l_v282_0].defensive_type_main
                        }, l_v236_0.builder[l_v278_0][l_v282_0].exploit);
                        l_v236_0.builder[l_v278_0][l_v282_0].exploit_disabler:depend(v287, v280, l_v236_0.visibility[1][3], {
                            [1] = nil, 
                            [2] = 1, 
                            [1] = l_v236_0.builder[l_v278_0][l_v282_0].defensive_type_main
                        }, l_v236_0.builder[l_v278_0][l_v282_0].exploit);
                        l_v236_0.builder[l_v278_0][l_v282_0].exploit_pitch:depend(v287, v280, l_v236_0.visibility[1][3], {
                            [1] = nil, 
                            [2] = 1, 
                            [1] = l_v236_0.builder[l_v278_0][l_v282_0].defensive_type_main
                        }, l_v236_0.builder[l_v278_0][l_v282_0].exploit);
                        l_v236_0.builder[l_v278_0][l_v282_0].exploit_custom_pitch:depend(v287, v280, l_v236_0.visibility[1][3], {
                            [1] = nil, 
                            [2] = 1, 
                            [1] = l_v236_0.builder[l_v278_0][l_v282_0].defensive_type_main
                        }, {
                            [1] = nil, 
                            [2] = "Custom", 
                            [1] = l_v236_0.builder[l_v278_0][l_v282_0].exploit_pitch
                        }, l_v236_0.builder[l_v278_0][l_v282_0].exploit);
                        l_v236_0.builder[l_v278_0][l_v282_0].exploit_yaw:depend(v287, v280, l_v236_0.visibility[1][3], {
                            [1] = nil, 
                            [2] = 1, 
                            [1] = l_v236_0.builder[l_v278_0][l_v282_0].defensive_type_main
                        }, l_v236_0.builder[l_v278_0][l_v282_0].exploit);
                        l_v236_0.builder[l_v278_0][l_v282_0].exploit_custom_yaw:depend(v287, v280, l_v236_0.visibility[1][3], {
                            [1] = nil, 
                            [2] = 1, 
                            [1] = l_v236_0.builder[l_v278_0][l_v282_0].defensive_type_main
                        }, {
                            [1] = nil, 
                            [2] = "Custom", 
                            [3] = "Switch", 
                            [4] = "360", 
                            [1] = l_v236_0.builder[l_v278_0][l_v282_0].exploit_yaw
                        }, l_v236_0.builder[l_v278_0][l_v282_0].exploit);
                        l_v236_0.builder[l_v278_0][l_v282_0].defensive:depend(v287, v280, l_v236_0.visibility[1][3], {
                            [1] = nil, 
                            [2] = 0, 
                            [1] = l_v236_0.builder[l_v278_0][l_v282_0].defensive_type_main
                        });
                        l_v236_0.builder[l_v278_0][l_v282_0].defensive_session:depend(v287, v280, l_v236_0.builder[l_v278_0][l_v282_0].defensive, l_v236_0.visibility[1][3], {
                            [1] = nil, 
                            [2] = 0, 
                            [1] = l_v236_0.builder[l_v278_0][l_v282_0].defensive_type_main
                        });
                        v6:new_tooltip(l_v236_0.builder[l_v278_0][l_v282_0].defensive_session, "changes the working time of the defense system every session", 1);
                        l_v236_0.builder[l_v278_0][l_v282_0].defensive_type:depend(v287, v280, l_v236_0.builder[l_v278_0][l_v282_0].defensive, l_v236_0.visibility[1][3], {
                            [1] = nil, 
                            [2] = 0, 
                            [1] = l_v236_0.builder[l_v278_0][l_v282_0].defensive_type_main
                        });
                        l_v236_0.builder[l_v278_0][l_v282_0].defensive_disabler:depend(v287, v280, l_v236_0.builder[l_v278_0][l_v282_0].defensive, l_v236_0.visibility[1][3], {
                            [1] = nil, 
                            [2] = 0, 
                            [1] = l_v236_0.builder[l_v278_0][l_v282_0].defensive_type_main
                        });
                        l_v236_0.builder[l_v278_0][l_v282_0].defensive_pitch:depend(v287, v280, l_v236_0.builder[l_v278_0][l_v282_0].defensive, l_v236_0.visibility[1][3], {
                            [1] = nil, 
                            [2] = 0, 
                            [1] = l_v236_0.builder[l_v278_0][l_v282_0].defensive_type_main
                        });
                        l_v236_0.builder[l_v278_0][l_v282_0].defensive_pitch_custom:depend(v287, v280, l_v236_0.builder[l_v278_0][l_v282_0].defensive, {
                            [1] = nil, 
                            [2] = "Custom", 
                            [1] = l_v236_0.builder[l_v278_0][l_v282_0].defensive_pitch
                        }, {
                            [1] = nil, 
                            [2] = 0, 
                            [1] = l_v236_0.builder[l_v278_0][l_v282_0].defensive_type_main
                        }, l_v236_0.visibility[1][3]);
                        l_v236_0.builder[l_v278_0][l_v282_0].defensive_yaw:depend(v287, v280, l_v236_0.builder[l_v278_0][l_v282_0].defensive, l_v236_0.visibility[1][3], {
                            [1] = nil, 
                            [2] = 0, 
                            [1] = l_v236_0.builder[l_v278_0][l_v282_0].defensive_type_main
                        });
                        l_v236_0.builder[l_v278_0][l_v282_0].defensive_yaw_switch:depend(v287, v280, l_v236_0.builder[l_v278_0][l_v282_0].defensive, {
                            [1] = nil, 
                            [2] = "Switch", 
                            [1] = l_v236_0.builder[l_v278_0][l_v282_0].defensive_yaw
                        }, {
                            [1] = nil, 
                            [2] = 0, 
                            [1] = l_v236_0.builder[l_v278_0][l_v282_0].defensive_type_main
                        }, l_v236_0.visibility[1][3]);
                        l_v236_0.builder[l_v278_0][l_v282_0].defensive_yaw_switch_speed:depend(v287, v280, l_v236_0.builder[l_v278_0][l_v282_0].defensive, {
                            [1] = nil, 
                            [2] = "Switch", 
                            [1] = l_v236_0.builder[l_v278_0][l_v282_0].defensive_yaw
                        }, {
                            [1] = nil, 
                            [2] = 0, 
                            [1] = l_v236_0.builder[l_v278_0][l_v282_0].defensive_type_main
                        }, l_v236_0.visibility[1][3]);
                        l_v236_0.builder[l_v278_0][l_v282_0].defensive_yaw_custom:depend(v287, v280, l_v236_0.builder[l_v278_0][l_v282_0].defensive, {
                            [1] = nil, 
                            [2] = "Custom", 
                            [1] = l_v236_0.builder[l_v278_0][l_v282_0].defensive_yaw
                        }, {
                            [1] = nil, 
                            [2] = 0, 
                            [1] = l_v236_0.builder[l_v278_0][l_v282_0].defensive_type_main
                        }, {
                            [1] = nil, 
                            [2] = 0, 
                            [1] = l_v236_0.builder[l_v278_0][l_v282_0].defensive_type_main
                        }, l_v236_0.visibility[1][3]);
                        l_v236_0.builder[l_v278_0][l_v282_0].defensive_spin_speed:depend(v287, v280, l_v236_0.builder[l_v278_0][l_v282_0].defensive, {
                            [1] = nil, 
                            [2] = "360", 
                            [1] = l_v236_0.builder[l_v278_0][l_v282_0].defensive_yaw
                        }, {
                            [1] = nil, 
                            [2] = 0, 
                            [1] = l_v236_0.builder[l_v278_0][l_v282_0].defensive_type_main
                        }, {
                            [1] = nil, 
                            [2] = 0, 
                            [1] = l_v236_0.builder[l_v278_0][l_v282_0].defensive_type_main
                        }, l_v236_0.visibility[1][3]);
                        l_v236_0.builder[l_v278_0][l_v282_0].settings:depend(v287, v280, {
                            [1] = l_v236_0.value.player_states, 
                            [2] = function()
                                -- upvalues: l_v283_0 (ref)
                                return l_v283_0 ~= 1;
                            end
                        }, l_v236_0.visibility[1][2]);
                        l_v236_0.builder[l_v278_0][l_v282_0].import_other_team:depend(v287, v280, {
                            [1] = l_v236_0.value.player_states, 
                            [2] = function()
                                -- upvalues: l_v283_0 (ref)
                                return l_v283_0 ~= 1;
                            end
                        }, l_v236_0.visibility[1][2]);
                    end;
                end;
            end;
        end;
        for v289 = 1, 2 do
            v6.antiaim.builder.builder[v289][9].defensive:disabled(true);
            v6.antiaim.builder.builder[v289][10].defensive:disabled(true);
            v6.antiaim.builder.builder[v289][1].enable:set(true);
            v6.antiaim.builder.builder[v289][1].enable:disabled(true);
        end;
        l_v236_0.builder.master_defensive = v6.menu.aa_5:button("               " .. v6:string_ext("toggle-on") .. "Defensive master key               ", function(_)
            -- upvalues: v6 (ref), l_v236_0 (ref)
            v6.our.defensive_key = not v6.our.defensive_key;
            for v291 = 1, #l_v236_0.states do
                for v292 = 1, 2 do
                    l_v236_0.builder[v292][v291].defensive:disabled(v6.our.defensive_key);
                    l_v236_0.builder[v292][v291].exploit:disabled(v6.our.defensive_key);
                end;
            end;
        end, true):depend({
            [1] = nil, 
            [2] = 3, 
            [1] = v6.menu.items.antiaim_sidebar
        });
    end;
    v229 = v6:cmp({
        "str", 
        "msc", 
        v6:tolevel(7.789794)
    }, v6:unpack(v6.database.items.misc))[1];
    v229.value.acc.accent = v6.menu.misc_1_e1:color_picker(v6:string_ext("droplet") .. "Accent color", color(204, 204, 255, 255));
    v229.value.acc.accent_text = v6.menu.misc_1_e11:label("\240\157\146\158\240\157\144\184\240\157\144\191\240\157\144\184\240\157\146\174\240\157\146\175\240\157\144\188\240\157\146\176\240\157\145\128");
    v229.value.rage.aimbotlogs = v229.base:switch(v6:string_ext("comment") .. " Aimbot logs", false):depend(v229.visibility.rage);
    v229.value.rage.aimbotlogs_create = v6:create(v229.value.rage.aimbotlogs);
    v229.value.rage.aimbotlogs_color = v229.value.rage.aimbotlogs_create:color_picker(v6:string_ext("droplet") .. "Color", color()):depend(v229.value.rage.aimbotlogs, v229.visibility.rage);
    v229.value.rage.aimbotlogs_type = v229.value.rage.aimbotlogs_create:selectable(v6:string_ext("gear") .. "Type", {
        [1] = "Console", 
        [2] = "Left up", 
        [3] = "NL Notify"
    }):depend(v229.value.rage.aimbotlogs, v229.visibility.rage);
    v229.value.rage.aimbotlogs_texttype = v229.value.rage.aimbotlogs_create:combo(v6:string_ext("gear") .. "Text type", {
        [1] = "Classic", 
        [2] = "Celestium"
    }):depend(v229.value.rage.aimbotlogs, v229.visibility.rage);
    v229.value.rage.hitchance_override = v229.base:switch(v6:string_ext("crosshairs") .. " Hitchance override", false):depend(v229.visibility.rage);
    v229.value.rage.hitchance_override_create = v6:create(v229.value.rage.hitchance_override);
    v229.value.rage.hitchance_override_weapons = v229.value.rage.hitchance_override_create:selectable(v6:string_ext("gun") .. "Air Weapons", {
        [1] = "Deagle", 
        [2] = "Scout", 
        [3] = "Awp", 
        [4] = "Auto", 
        [5] = "Shotguns", 
        [6] = "Smgs"
    }):depend(v229.value.rage.hitchance_override);
    v229.value.rage.hitchance_override_weapons_deagle = v229.value.rage.hitchance_override_create:slider(v6:string_ext("slider") .. "Deagle", 0, 100, 50, 1, "hc"):depend(v229.value.rage.hitchance_override, {
        [1] = nil, 
        [2] = "Deagle", 
        [1] = v229.value.rage.hitchance_override_weapons
    }, v229.visibility.rage);
    v229.value.rage.hitchance_override_weapons_scout = v229.value.rage.hitchance_override_create:slider(v6:string_ext("slider") .. "Scout", 0, 100, 50, 1, "hc"):depend(v229.value.rage.hitchance_override, {
        [1] = nil, 
        [2] = "Scout", 
        [1] = v229.value.rage.hitchance_override_weapons
    }, v229.visibility.rage);
    v229.value.rage.hitchance_override_weapons_awp = v229.value.rage.hitchance_override_create:slider(v6:string_ext("slider") .. "Awp", 0, 100, 50, 1, "hc"):depend(v229.value.rage.hitchance_override, {
        [1] = nil, 
        [2] = "Awp", 
        [1] = v229.value.rage.hitchance_override_weapons
    }, v229.visibility.rage);
    v229.value.rage.hitchance_override_weapons_auto = v229.value.rage.hitchance_override_create:slider(v6:string_ext("slider") .. "Auto", 0, 100, 50, 1, "hc"):depend(v229.value.rage.hitchance_override, {
        [1] = nil, 
        [2] = "Auto", 
        [1] = v229.value.rage.hitchance_override_weapons
    }, v229.visibility.rage);
    v229.value.rage.hitchance_override_weapons_shotguns = v229.value.rage.hitchance_override_create:slider(v6:string_ext("slider") .. "Shotguns", 0, 100, 50, 1, "hc"):depend(v229.value.rage.hitchance_override, {
        [1] = nil, 
        [2] = "Shotguns", 
        [1] = v229.value.rage.hitchance_override_weapons
    }, v229.visibility.rage);
    v229.value.rage.hitchance_override_weapons_smgs = v229.value.rage.hitchance_override_create:slider(v6:string_ext("slider") .. "Smgs", 0, 100, 50, 1, "hc"):depend(v229.value.rage.hitchance_override, {
        [1] = nil, 
        [2] = "Smgs", 
        [1] = v229.value.rage.hitchance_override_weapons
    }, v229.visibility.rage);
    v229.value.rage.inair_stop = v229.base:switch(v6:string_ext("cloud") .. "Airstop", false):depend(v229.visibility.rage);
    v229.value.rage.inair_stop_create = v6:create(v229.value.rage.inair_stop);
    v229.value.rage.inair_stop_weapons = v229.value.rage.inair_stop_create:selectable(v6:string_ext("gun") .. "Weapons", {
        [1] = "Deagle", 
        [2] = "Scout", 
        [3] = "Awp", 
        [4] = "Auto", 
        [5] = "Shotguns", 
        [6] = "Smgs"
    }):depend(v229.value.rage.inair_stop);
    v6:new_tooltip(v229.value.rage.inair_stop, "allows you to hover when your speed is low or you risk dying. allows you to use hover more efficiently", 1);
    v229.value.rage.faster_doubletap = v229.base:switch(v6:string_ext("comet") .. " Faster doubletap"):depend(v229.visibility.rage);
    v229.value.rage.force_states = v229.base:switch(v6:string_ext("gun-squirt") .. "Weapon extensions"):depend(v229.visibility.rage);
    v229.value.rage.force_states_create = v6:create(v229.value.rage.force_states);
    v229.value.rage.force_states_bodyaim = v229.value.rage.force_states_create:switch(v6:string_ext("child") .. "Force body aim \v[Bind]"):depend(v229.value.rage.force_states);
    v229.value.rage.force_states_safepoint = v229.value.rage.force_states_create:switch(v6:string_ext("user-helmet-safety") .. "Force safe point \v[Bind]"):depend(v229.value.rage.force_states);
    v229.value.rage.force_states_shot = v229.value.rage.force_states_create:switch(v6:string_ext("crosshairs-simple") .. "Force shot \v[Bind]"):depend(v229.value.rage.force_states);
    v229.value.rage.force_states_avoidlegs = v229.value.rage.force_states_create:switch(v6:string_ext("hand") .. "Avoid hitboxes"):depend(v229.value.rage.force_states);
    v6:new_tooltip(v229.value.rage.force_states_avoidlegs, "a function to prevent it from miss feet and hands at the wrong time", 1);
    v229.value.rage.teleport = v229.base:switch(v6:string_ext("street-view") .. " Teleport system", false):depend(v229.visibility.rage);
    v229.value.rage.teleport_create = v6:create(v229.value.rage.teleport);
    v229.value.rage.teleport_onkey = v229.value.rage.teleport_create:switch(v6:string_ext("toggle-on") .. "On key"):depend(v229.value.rage.teleport, v229.visibility.rage);
    v229.value.rage.teleport_automatic = v229.value.rage.teleport_create:combo(v6:string_ext("repeat") .. "Automatic", {
        [1] = "Disabled", 
        [2] = "On hittable", 
        [3] = "Delay"
    }):depend(v229.value.rage.teleport, v229.visibility.rage);
    v229.value.rage.teleport_charge = v229.value.rage.teleport_create:combo(v6:string_ext("gear") .. "Charge", {
        [1] = "Disabled", 
        [2] = "Slow", 
        [3] = "Fast"
    }):depend(v229.value.rage.teleport, v229.visibility.rage, {
        [1] = nil, 
        [2] = "On hittable", 
        [3] = "Delay", 
        [1] = v229.value.rage.teleport_automatic
    });
    v229.value.rage.teleport_delay = v229.value.rage.teleport_create:slider(v6:string_ext("slider") .. "Delay\n\n", 0, 64, 20, 1, "t"):depend(v229.value.rage.teleport, v229.visibility.rage, {
        [1] = nil, 
        [2] = "Delay", 
        [1] = v229.value.rage.teleport_automatic
    });
    v229.value.rage.airlag = v229.base:switch(v6:string_ext("skull") .. " Airlag", false):depend(v229.visibility.rage);
    v229.value.rage.airlag_create = v6:create(v229.value.rage.airlag);
    v229.value.rage.airlag_ticks = v229.value.rage.airlag_create:slider(v6:string_ext("slider") .. "Ticks", 1, 64, 20, 1, "t");
    v229.value.rage.extra_ticks = v229.value.rage.airlag_create:switch(v6:string_ext("gear") .. "Extra ticks");
    v6:new_tooltip(v229.value.rage.extra_ticks, "minimizes snagging by adding extra tick. can be difficult to see by eye", 2);
    v229.value.rage.faster_prediction = v229.base:switch(v6:string_ext("hourglass-start") .. " Faster prediction", false):depend(v229.visibility.rage);
    v6:new_tooltip(v229.value.rage.airlag, "breaks the LC in the air in a way that disrupts the aimbot and allows missletting. may not work anymore because the meta is getting old", 1);
    v229.value.rage.idealtick = v229.base:switch(v6:string_ext("shield") .. " Ideal tick", false):depend(v229.visibility.rage);
    v229.value.rage.idealtick_create = v6:create(v229.value.rage.idealtick);
    v229.value.rage.indicator = v229.value.rage.idealtick_create:switch(v6:string_ext("toggle-on") .. "Indicator"):depend(v229.value.rage.idealtick);
    v229.value.rage.idealtick_fastshoot = v229.value.rage.idealtick_create:switch(v6:string_ext("bolt") .. "Fast shoot"):depend(v229.value.rage.idealtick);
    v229.value.rage.idealtick_ospeek = v229.value.rage.idealtick_create:switch(v6:string_ext("joystick") .. "OS Peek"):depend(v229.value.rage.idealtick);
    v229.value.rage.idealtick_teleport = v229.value.rage.idealtick_create:combo(v6:string_ext("transporter") .. "Teleport mode", {
        [1] = "Default", 
        [2] = "Slow", 
        [3] = "Faster", 
        [4] = "Celestium"
    }):depend(v229.value.rage.idealtick);
    v6:new_tooltip(v229.value.rage.idealtick_ospeek, "allows you to take idealtick with hideshots", 1);
    v6:new_tooltip(v229.value.rage.idealtick_fastshoot, v6:format("When Autopeek works, it allows you to squeeze faster and earlier. \n[red]IT IS RECOMMENDED NOT TO USE WHEN YOU EXPERIENCE HIGH PING AND LOSS. MAY ALSO MISS"), 4);
    v6:new_tooltip(v229.value.rage.idealtick_teleport, "provides customized teleportation speed and latency.", 1);
    v229.value.misc.fastswitch = v229.base:switch(v6:string_ext("bolt") .. "  Fast switch", false):depend(v229.visibility.misc);
    v229.value.misc.fastswitch_create = v6:create(v229.value.misc.fastswitch);
    v229.value.misc.fastswitch_style = v229.value.misc.fastswitch_create:selectable(v6:string_ext("pen-swirl") .. "Style", {
        [1] = "On use", 
        [2] = "Weapon switch"
    }):depend(v229.visibility.misc, v229.value.misc.fastswitch);
    v6:new_tooltip(v229.value.misc.fastswitch, "WEAPON SWITCH: if this is selected the cheat will switch between weapons when firing\n\nON USE: turns off the antiaim for a short time when the cheat fires. on certain servers it can extend teleport ", 1);
    v229.value.misc.adaptive_silent = v229.base:switch(v6:string_ext("crosshairs") .. " Adaptive silent", false):depend(v229.visibility.misc);
    v229.value.misc.adaptive_silent_create = v6:create(v229.value.misc.adaptive_silent);
    v229.value.misc.adaptive_silent_first = v229.value.misc.adaptive_silent_create:slider(v6:string_ext("slider") .. "Chance", 20, 80, 50, 1, "%"):depend(v229.visibility.misc, v229.value.misc.adaptive_silent);
    v6:new_tooltip(v229.value.misc.adaptive_silent, "randomly turns silent aimbot off and on. for visual purposes", 1);
    v229.value.misc.buybot = v229.base:switch(v6:string_ext("basket-shopping") .. " Buybot"):depend(v229.visibility.misc);
    v229.value.misc.buybot_create = v6:create(v229.value.misc.buybot);
    v229.value.misc.buybot_items = v229.value.misc.buybot_create:selectable(v6:string_ext("gear") .. "Settings", {
        [1] = "Disable on warmup", 
        [2] = "Disable X money", 
        [3] = "Disable X round"
    }):depend(v229.visibility.misc, v229.value.misc.buybot);
    v229.value.misc.buybot_money = v229.value.misc.buybot_create:slider(v6:string_ext("slider") .. "Money", 500, 50000, 800, 1, "$"):depend(v229.visibility.misc, v229.value.misc.buybot, {
        [1] = nil, 
        [2] = "Disable X money", 
        [1] = v229.value.misc.buybot_items
    });
    v229.value.misc.buybot_round = v229.value.misc.buybot_create:slider(v6:string_ext("slider") .. "Rounds", 0, 2, 1, 1, function(v293)
        if v293 == 0 then
            return "First round";
        elseif v293 == 1 then
            return "Second round";
        elseif v293 == 2 then
            return "Third round";
        else
            return;
        end;
    end):depend(v229.visibility.misc, v229.value.misc.buybot, {
        [1] = nil, 
        [2] = "Disable X round", 
        [1] = v229.value.misc.buybot_items
    });
    v229.value.misc.unlocklatency = v229.base:switch(v6:string_ext("signal") .. " Ping spike", false):depend(v229.visibility.misc);
    v229.value.misc.unlocklatency_create = v6:create(v229.value.misc.unlocklatency);
    v229.value.misc.unlocklatency_spike = v229.value.misc.unlocklatency_create:slider(v6:string_ext("slider") .. "Spike", 0, 375, 0, 1, "ms"):depend(v229.value.misc.unlocklatency, v229.visibility.misc);
    v229.value.misc.unlocklatency_create:label(v6:format("                  100ms +  [red]dangerous!")):depend(v229.value.misc.unlocklatency, v229.visibility.misc);
    v6:new_tooltip(v229.value.misc.unlocklatency, "extends the pingspike. 100ms and above can cause you to miss.", 3);
    v229.value.misc.movement = v229.base:label(v6:string_ext("bullseye") .. "  Movement", function(v294)
        -- upvalues: v6 (ref)
        return {
            settings = v294:selectable(v6:string_ext("gear") .. "Settings", {
                [1] = "Jump scout", 
                [2] = "No fall damage", 
                [3] = "Fast ladder", 
                [4] = "Automatic strafe smoothing"
            })
        };
    end):depend(v229.visibility.misc);
    v229.value.misc.nade = v229.base:label(v6:string_ext("bomb") .. "  Grenade elements", function(v295)
        -- upvalues: v6 (ref)
        return {
            settings = v295:selectable(v6:string_ext("gear") .. "Options", {
                [1] = "Automatic release", 
                [2] = "Fix nade"
            }), 
            damage = v295:slider(v6:string_ext("slider") .. "Damage", 1, 90, 50, 1, "dmg")
        };
    end):depend(v229.visibility.misc);
    v229.value.misc.trashtalk = v229.base:label(v6:string_ext("comment") .. "  Trash talk", function(v296)
        -- upvalues: v6 (ref)
        return {
            settings = v296:combo(v6:string_ext("pen-swirl") .. "Style", {
                [1] = "Disabled", 
                [2] = "Celestium", 
                [3] = "Kurdish"
            }), 
            settings_other = v296:selectable(v6:string_ext("gears") .. "Settings", {
                [1] = "Fix", 
                [2] = "Death protection"
            })
        };
    end):depend(v229.visibility.misc);
    v229.value.misc.shared = v229.base:label(v6:string_ext("tag") .. "   Shared features", function(v297)
        -- upvalues: v6 (ref)
        return {
            items = v297:selectable(v6:string_ext("gear") .. "Settings", {
                [1] = "Clantag"
            })
        };
    end):depend(v229.visibility.misc);
    v229.value.misc.nade.damage:depend({
        [1] = nil, 
        [2] = "Automatic release", 
        [1] = v229.value.misc.nade.settings
    });
    v229.value.misc.trashtalk.settings_other:depend({
        [1] = nil, 
        [2] = "Celestium", 
        [3] = "Kurdish", 
        [1] = v229.value.misc.trashtalk.settings
    });
    v229.value.visual.aspectratio = v229.base:switch(v6:string_ext("expand") .. " Aspect ratio", false):depend(v229.visibility.visual);
    v229.value.visual.aspectratio_create = v6:create(v229.value.visual.aspectratio);
    v229.value.visual.aspectratio_ratio = v229.value.visual.aspectratio_create:slider(v6:string_ext("slider") .. "Ratio", 60, 200, 130, 0.01):depend(v229.value.visual.aspectratio, v229.visibility.visual);
    v229.value.visual.viewmodel = v229.base:switch(v6:string_ext("hand") .. " Viewmodel changer", false):depend(v229.visibility.visual);
    v229.value.visual.viewmodel_create = v6:create(v229.value.visual.viewmodel);
    v229.value.visual.viewmodel_fov = v229.value.visual.viewmodel_create:slider(v6:string_ext("slider") .. "Fov", -100, 100, 68, 1):depend(v229.visibility.visual, v229.value.visual.viewmodel);
    v229.value.visual.viewmodel_x = v229.value.visual.viewmodel_create:slider(v6:string_ext("slider") .. "X", -150, 150, 3, 1):depend(v229.visibility.visual, v229.value.visual.viewmodel);
    v229.value.visual.viewmodel_y = v229.value.visual.viewmodel_create:slider(v6:string_ext("slider") .. "Y", -150, 150, 0, 1):depend(v229.visibility.visual, v229.value.visual.viewmodel);
    v229.value.visual.viewmodel_z = v229.value.visual.viewmodel_create:slider(v6:string_ext("slider") .. "Z", -150, 150, -2, 1):depend(v229.visibility.visual, v229.value.visual.viewmodel);
    do
        local l_v229_0 = v229;
        l_v229_0.value.visual.viewmodel_reset = l_v229_0.value.visual.viewmodel_create:button(v6:string_ext("toggle-on") .. "Reset", function()
            -- upvalues: l_v229_0 (ref)
            l_v229_0.value.visual.viewmodel_fov:set(68);
            l_v229_0.value.visual.viewmodel_x:set(3);
            l_v229_0.value.visual.viewmodel_y:set(0);
            l_v229_0.value.visual.viewmodel_z:set(-2);
        end, true):depend(l_v229_0.visibility.visual, l_v229_0.value.visual.viewmodel);
        l_v229_0.value.visual.viewmodel_bob = l_v229_0.value.visual.viewmodel_create:switch(v6:string_ext("toggle-on") .. "Disable viewmodel bob"):depend(l_v229_0.visibility.visual, l_v229_0.value.visual.viewmodel);
        l_v229_0.value.visual.keepmodel = l_v229_0.base:switch(v6:string_ext("paint-roller") .. " Keep model transpency", false):depend(l_v229_0.visibility.visual);
        l_v229_0.value.visual.keepmodel_create = v6:create(l_v229_0.value.visual.keepmodel);
        l_v229_0.value.visual.keepmodel_ratio = l_v229_0.value.visual.keepmodel_create:slider(v6:string_ext("slider") .. "Alpha", 0, 255, 100, 1, "%"):depend(l_v229_0.value.visual.keepmodel, l_v229_0.visibility.visual);
        v6:new_tooltip(l_v229_0.value.visual.keepmodel, "customize the transparency of localplayer when scope is open", 1);
        l_v229_0.value.visual.thirdperson = l_v229_0.base:switch(v6:string_ext("circle-notch") .. " Thirdperson animation", false):depend(l_v229_0.visibility.visual);
        l_v229_0.value.visual.thirdperson_create = v6:create(l_v229_0.value.visual.thirdperson);
        l_v229_0.value.visual.thirdperson_distance = l_v229_0.value.visual.thirdperson_create:slider(v6:string_ext("slider") .. "Distance", 15, 250, 50, 1):depend(l_v229_0.visibility.visual, l_v229_0.value.visual.thirdperson);
        l_v229_0.value.visual.thirdperson_speed = l_v229_0.value.visual.thirdperson_create:slider(v6:string_ext("slider") .. "Animation speed", 3, 100, 40, 1, "%"):depend(l_v229_0.visibility.visual, l_v229_0.value.visual.thirdperson);
        l_v229_0.value.visual.crosshair_indicator = l_v229_0.base:switch(v6:string_ext("medal") .. "  Crosshair indicator", false):depend(l_v229_0.visibility.visual);
        l_v229_0.value.visual.crosshair_indicator_create = v6:create(l_v229_0.value.visual.crosshair_indicator);
        l_v229_0.value.visual.crosshair_indicator_textstyle = l_v229_0.value.visual.crosshair_indicator_create:combo(v6:string_ext("gear") .. "Text style", {
            [1] = "Default", 
            [2] = "Minimized", 
            [3] = "Small"
        }):depend(l_v229_0.visibility.visual, l_v229_0.value.visual.crosshair_indicator);
        l_v229_0.value.visual.crosshair_indicator_color = l_v229_0.value.visual.crosshair_indicator_create:color_picker(v6:string_ext("droplet") .. "Color", color(204, 204, 255, 255)):depend(l_v229_0.visibility.visual, l_v229_0.value.visual.crosshair_indicator);
        l_v229_0.value.visual.crosshair_indicator_items = l_v229_0.value.visual.crosshair_indicator_create:selectable(v6:string_ext("gears") .. "Items", {
            [1] = "Doubletap", 
            [2] = "Hideshots", 
            [3] = "Autopeek", 
            [4] = "Freestanding", 
            [5] = "Fakeduck"
        }):depend(l_v229_0.visibility.visual, l_v229_0.value.visual.crosshair_indicator);
        l_v229_0.value.visual.leftindicator = l_v229_0.base:switch(v6:string_ext("bars") .. "  Left indicator", false):depend(l_v229_0.visibility.visual);
        l_v229_0.value.visual.leftindicator_create = v6:create(l_v229_0.value.visual.leftindicator);
        l_v229_0.value.visual.leftindicator_settings = l_v229_0.value.visual.leftindicator_create:selectable(v6:string_ext("gear") .. "Elements", {
            [1] = "Dormant aimbot", 
            [2] = "Auto peek", 
            [3] = "On shot antiaim", 
            [4] = "Double tap", 
            [5] = "Minimum damage", 
            [6] = "Extended backtrack", 
            [7] = "Override resolver", 
            [8] = "Fake duck", 
            [9] = "Slow walk", 
            [10] = "Freestanding", 
            [11] = "Edge jump", 
            [12] = "Fake ping", 
            [13] = "Thirdperson", 
            [14] = "Is defensive"
        }):depend(l_v229_0.visibility.visual, l_v229_0.value.visual.leftindicator);
        l_v229_0.value.visual.leftindicator_style = l_v229_0.value.visual.leftindicator_create:combo(v6:string_ext("pen-swirl") .. "Style", {
            [1] = "500$", 
            [2] = "Celestium"
        }):depend(l_v229_0.visibility.visual, l_v229_0.value.visual.leftindicator);
        l_v229_0.value.visual.solus = l_v229_0.base:label(v6:string_ext("wave-sine") .. "Solus", function(v299)
            -- upvalues: v6 (ref)
            return {
                items = v299:selectable(v6:string_ext("gear") .. "Items", {
                    [1] = "Watermark", 
                    [2] = "Defensive", 
                    [3] = "Static watermark"
                }, "Make sure you have installed the font from \a{Link Active}Home -> Files -> Font")
            };
        end):depend(l_v229_0.visibility.visual);
        l_v229_0.value.visual.removals = l_v229_0.base:label(v6:string_ext("wave-pulse") .. "Framerate", function(v300)
            -- upvalues: v6 (ref)
            return {
                oldmap = v300:switch(v6:string_ext("person-simple") .. "Leg shadow"), 
                optimaztion = v300:switch(v6:string_ext("sun") .. "Optimization")
            };
        end):depend(l_v229_0.visibility.visual);
        v236 = v6:cmp({
            "str", 
            "anm", 
            v6:tolevel(7.795839)
        }, v6:unpack(v6.database.items.anim))[1];
        v236.value.extended = v236.base:combo(v6:string_ext("person-praying") .. "  Extended", {
            [1] = "Disabled", 
            [2] = "Earth quake 2", 
            [3] = "T Pose", 
            [4] = "Alien", 
            [5] = "Freeze", 
            [6] = "Flash", 
            [7] = "Static"
        }):depend(v236.visibility);
        v236.value.aero = v236.base:combo(v6:string_ext("person-falling") .. "  In aero", {
            [1] = "Disabled", 
            [2] = "Static", 
            [3] = "Jitter", 
            [4] = "Random"
        }):depend(v236.visibility);
        v236.value.ground = v236.base:combo(v6:string_ext("person-running") .. "  In ground", {
            [1] = "Disabled", 
            [2] = "Static", 
            [3] = "Jitter", 
            [4] = "Random", 
            [5] = "Moonwalk"
        }):depend(v236.visibility);
        v236.value.other = v236.base:selectable(v6:string_ext("gear") .. " Other", {
            [1] = "Reset pitch on land", 
            [2] = "Move lean", 
            [3] = "Earth quake", 
            [4] = "Kangaroo", 
            [5] = "Skeet legs"
        }):depend(v236.visibility);
        v236.value.other_moveleanlimit = v236.base:slider(v6:string_ext("slider") .. " Move lean", 0, 100, 0, 1, "%"):depend(v236.visibility, {
            [1] = nil, 
            [2] = "Move lean", 
            [1] = v236.value.other
        });
        v236.value.resetpitch_type = v236.base:slider(v6:string_ext("gear") .. "Style pitch", 0, 1, 0, 1, function(v301)
            if v301 == 0 then
                return "Static";
            else
                return "Dynamic";
            end;
        end):depend(v236.visibility, {
            [1] = nil, 
            [2] = "Reset pitch on land", 
            [1] = v236.value.other
        });
        v236.value.forcestatic = v236.base:switch(v6:string_ext("gear") .. "Condition \v[AIR]"):depend(v236.visibility, {
            [1] = nil, 
            [2] = "Static", 
            [1] = v236.value.aero
        });
        v6:new_tooltip(v236.value.resetpitch_type, "Static: only works on certain ticks.\nDynamic: on certain ticks or when fs is active", 1);
        v6:new_tooltip(v236.value.forcestatic, "makes static legs active when defensive is off or fakelag is running", 1);
    end;
    v6.menu.items.home_sidebar:set_callback(function(v302)
        -- upvalues: v6 (ref)
        if v302:get() == 1 then
            v302:update({
                [1] = nil, 
                [2] = "     Config", 
                [3] = "     Files", 
                [1] = "\a{Link Active}" .. v6.cde.get_icon("circle-small") .. "\aDEFAULTHome"
            });
        elseif v302:get() == 2 then
            v302:update({
                [1] = "     Home", 
                [2] = nil, 
                [3] = "     Files", 
                [2] = "\a{Link Active}" .. v6.cde.get_icon("circle-small") .. "\aDEFAULTConfig"
            });
        elseif v302:get() == 3 then
            v302:update({
                [1] = "     Home", 
                [2] = "     Config", 
                [3] = "\a{Link Active}" .. v6.cde.get_icon("circle-small") .. "\aDEFAULTFiles"
            });
        else
            v302:update({
                [1] = nil, 
                [2] = "     Files", 
                [1] = "\a{Link Active}" .. v6.cde.get_icon("circle-small") .. "\aDEFAULTFiles"
            });
        end;
    end);
    v6.menu.items.antiaim_sidebar:set_callback(function(v303)
        -- upvalues: v6 (ref)
        local v304 = "\a{Link Active}" .. v6.cde.get_icon("circle-small") .. "\aDEFAULT";
        if v303:get() == 1 then
            v303:update({
                [1] = nil, 
                [2] = "     Builder", 
                [3] = "     Defensive", 
                [1] = v304 .. "Settings"
            });
        elseif v303:get() == 2 then
            v303:update({
                [1] = "     Settings", 
                [2] = nil, 
                [3] = "     Defensive", 
                [2] = v304 .. "Builder"
            });
        elseif v303:get() == 3 then
            v303:update({
                [1] = "     Settings", 
                [2] = "     Builder", 
                [3] = v304 .. "Defensive"
            });
        else
            v303:update({
                [1] = nil, 
                [2] = "     Builder", 
                [3] = "     Defensive", 
                [1] = v304 .. "Settings"
            });
        end;
    end);
    v6.menu.items.misc_sidebar:set_callback(function(v305)
        -- upvalues: v6 (ref)
        local v306 = "\a{Link Active}" .. v6.cde.get_icon("circle-small") .. "\aDEFAULT";
        if v305:get() == 1 then
            v305:update({
                [1] = nil, 
                [2] = "     Misc", 
                [3] = "     Visual", 
                [4] = "     Animations", 
                [1] = v306 .. "Rage"
            });
        elseif v305:get() == 2 then
            v305:update({
                [1] = "     Rage", 
                [2] = nil, 
                [3] = "     Visual", 
                [4] = "     Animations", 
                [2] = v306 .. "Misc"
            });
        elseif v305:get() == 3 then
            v305:update({
                [1] = "     Rage", 
                [2] = "     Misc", 
                [3] = nil, 
                [4] = "     Animations", 
                [3] = v306 .. "Visual"
            });
        elseif v305:get() == 4 then
            v305:update({
                [1] = "     Rage", 
                [2] = "     Misc", 
                [3] = "     Visual", 
                [4] = v306 .. "Animations"
            });
        else
            v305:update({
                [1] = nil, 
                [2] = "     Misc", 
                [3] = "     Visual", 
                [4] = "     Animations", 
                [1] = v306 .. "Rage"
            });
        end;
    end);
    ffi.cdef("        void* __stdcall URLDownloadToFileA(void* LPUNKNOWN, const char* LPCSTR, const char* LPCSTR2, int a, int LPBINDSTATUSCALLBACK);\n        bool DeleteUrlCacheEntryA(const char* lpszUrlName);\n        typedef void*(__thiscall* get_client_entity_t)(void*, int);\n        typedef struct {\n            char  pad_0000[20];\n            int m_nOrder;\n            int m_nSequence;\n            float m_flPrevCycle;\n            float m_flWeight;\n            float m_flWeightDeltaRate;\n            float m_flPlaybackRate;\n            float m_flCycle;\n            void *m_pOwner;\n            char  pad_0038[4];\n        } animstate_layer_t;\n    ");
    local v307 = l_utils_0.get_vfunc("client.dll", "VClientEntityList003", 3, "void*(__thiscall*)(void*, int)");
    v6.events.trashtalk = function(v308)
        -- upvalues: l_entity_0 (ref), v6 (ref), l_utils_0 (ref), l_math_0 (ref)
        local v309 = l_entity_0.get_local_player();
        local v310 = l_entity_0.get(v308.userid, true);
        local v311 = l_entity_0.get(v308.attacker, true);
        local v312 = false;
        v312 = v6.misc.misc.trashtalk.settings_other:get("Death protection") and v309:is_alive() == true or (not v6.misc.misc.trashtalk.settings_other:get("Death protection") or v309:is_alive() ~= false) and v309:is_alive() ~= nil;
        local function v315()
            -- upvalues: v6 (ref), l_utils_0 (ref), l_math_0 (ref)
            local v313 = {
                [1] = {
                    [1] = "what a terrible player you are?", 
                    [2] = "N0 C3L3ST1UM N0 TALK", 
                    [3] = "i\195\167tim \197\159arab\196\177 siktim kar\196\177y\196\177", 
                    [4] = "raped you", 
                    [5] = "\208\189\208\184\209\137\208\184\208\185 \208\177\208\181\208\183 \208\188\208\176\208\185\209\130\209\131\208\187\209\129\208\176", 
                    [6] = "If you want to play, sorry, you're in the wrong park...", 
                    [7] = "\208\159\209\128\208\176\208\178\208\184\208\187\209\140\208\189\209\139\208\181 \209\128\209\131\208\179\208\176\209\130\208\181\208\187\209\140\209\129\209\130\208\178\208\176 - \209\141\209\130\208\190 \208\186\208\176\208\186 \208\191\208\190\209\141\208\183\208\184\209\143.", 
                    [8] = "\208\168\208\176\208\186\208\176\208\187\209\139 \209\129\208\178\208\190\208\177\208\190\208\180\208\189\209\139 \208\180\208\190 \209\130\208\181\209\133 \208\191\208\190\209\128, \208\191\208\190\208\186\208\176 \208\187\208\181\208\178 \208\189\208\181 \208\191\208\190\208\180\208\189\208\184\208\188\208\181\209\130\209\129\209\143 \209\129 \208\183\208\181\208\188\208\187\208\184."
                }, 
                [2] = {
                    [1] = "Heta \197\159\195\170r ji erd\195\170 rabe \195\167eqal azad in.", 
                    [2] = "Sondxwarina rast wek helbest\195\170 ye.", 
                    [3] = "Ger tu bi ser ket\195\174, bibore, yuere eun thae vrong park...", 
                    [4] = "parsek b\195\170 mathuls", 
                    [5] = "tecawiz\195\170 w\195\170 kir", 
                    [6] = "vnat l\195\174stikvanek tirsnak \195\174?"
                }
            };
            local v314 = v6.misc.misc.trashtalk.settings:get() == "Celestium" and 1 or 2;
            return l_utils_0.console_exec("say " .. v313[v314][l_math_0.random(1, #v313[v314])]);
        end;
        if v6.misc.misc.trashtalk.settings:get() ~= "Disabled" and v310 ~= v311 and v311 == v309 then
            if v6.misc.misc.trashtalk.settings_other:get("Fix") then
                l_utils_0.execute_after(1, function()
                    -- upvalues: v312 (ref), v315 (ref)
                    if v312 then
                        v315();
                    end;
                end);
            elseif v312 then
                v315();
            end;
        end;
    end;
    v6.events.aimbot_logs = function(v316)
        -- upvalues: l_entity_0 (ref), l_pui_0 (ref), v6 (ref), v2 (ref)
        local v317 = l_entity_0.get(v316.target);
        local _ = v317.m_iHealth;
        local _ = "\a" .. color(229, 72, 67, 255):to_hex();
        l_pui_0.colors.green = color(134, 198, 84, 255);
        l_pui_0.colors.celestium = color("#CCCCFFFF");
        local l_state_0 = v316.state;
        local l_state_1 = v316.state;
        local v322 = {
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
            [10] = "gear"
        };
        if l_state_0 == nil then
            v6.our.shooted = true;
            v6.our.shooted_use = true;
        else
            v6.our.shooted = false;
            v6.our.shooted_use = false;
        end;
        if l_entity_0.get_local_player() == nil then
            return;
        elseif not v317 then
            return;
        else
            if v6.misc.rage.aimbotlogs:get() then
                v2.aimbotlog = "\a" .. color(v6.misc.rage.aimbotlogs_color:get().r, v6.misc.rage.aimbotlogs_color:get().g, v6.misc.rage.aimbotlogs_color:get().b, v6.misc.rage.aimbotlogs_color:get().a):to_hex();
                local v323 = v6.misc.rage.aimbotlogs_texttype:get() == "Classic";
                if v6.misc.rage.aimbotlogs_texttype:get() == "Classic" then
                    if l_state_1 == "spread" then
                        l_state_1 = "spread";
                    end;
                    if l_state_1 == "prediction error" then
                        l_state_1 = "prediction error";
                    end;
                    if l_state_1 == "correction" then
                        l_state_1 = "correction";
                    end;
                    if l_state_1 == "damage rejection" then
                        l_state_1 = "damage rejection";
                    end;
                    if l_state_1 == "mispredictioon" then
                        l_state_1 = "misprediction";
                    end;
                    if l_state_1 == "lagcomp failure" then
                        l_state_1 = "lagcomp fail";
                    end;
                    if l_state_1 == "backtrack failure" then
                        l_state_1 = "backtrack failure";
                    end;
                elseif v6.misc.rage.aimbotlogs_texttype:get() == "Celestium" then
                    if l_state_0 == "spread" then
                        l_state_0 = "bullet dispersion";
                    end;
                    if l_state_0 == "prediction error" then
                        l_state_0 = "timing miscalculation";
                    end;
                    if l_state_0 == "correction" then
                        l_state_0 = "correction";
                    end;
                    if l_state_0 == "damage rejection" then
                        l_state_0 = "hit rejection";
                    end;
                    if l_state_0 == "mispredictioon" then
                        l_state_0 = "miscalculation";
                    end;
                    if l_state_0 == "lagcomp failure" then
                        l_state_0 = "Latency correction failure";
                    end;
                    if l_state_0 == "backtrack failure" then
                        l_state_0 = "Time rewind failure";
                    end;
                    if l_state_0 == "unregistered shot" then
                        l_state_0 = "off-target shot";
                    end;
                end;
                do
                    local l_v323_0 = v323;
                    if l_state_0 == nil then
                        local function v325()
                            -- upvalues: v6 (ref), v317 (ref), v322 (ref), v316 (ref)
                            return v6:format("[aimbotlog]Celestium[reset] \226\128\162 hit [aimbotlog]%s [reset]in the [aimbotlog]%s [reset]for [aimbotlog]%s[reset]dmg [aimbotlog]%s[reset]hc | \206\148: [aimbotlog]%st[reset]", v317:get_name() or "?", v322[v316.hitgroup] or "?", v316.damage, v316.hitchance, v316.backtrack);
                        end;
                        if v6.misc.rage.aimbotlogs_type:get("Console") then
                            print_raw(v325());
                        end;
                        if v6.misc.rage.aimbotlogs_type:get("Left up") then
                            print_dev(v325());
                        end;
                        if v6.misc.rage.aimbotlogs_type:get("NL Notify") then
                            v6.cde.add_notify(v325());
                        end;
                    else
                        local function v326()
                            -- upvalues: v6 (ref), l_v323_0 (ref), l_state_1 (ref), l_state_0 (ref), v317 (ref), v322 (ref), v316 (ref)
                            return v6:format("[aimbotlog]Celestium[reset] \226\128\162 Missed shot due to [aimbotlog]%s[reset], [aimbotlog]%s[reset], hitbox: [aimbotlog]%s[reset], hitchance: [aimbotlog]%s[reset], \206\148: [aimbotlog]%st[reset]", l_v323_0 and l_state_1 or l_state_0, v317:get_name(), v322[v316.wanted_hitgroup] or "unknown ", v316.hitchance or "unknown ", v316.backtrack or "unknown ");
                        end;
                        if v6.misc.rage.aimbotlogs_type:get("Console") then
                            print_raw(v326());
                        end;
                        if v6.misc.rage.aimbotlogs_type:get("Left up") then
                            print_dev(v326());
                        end;
                        if v6.misc.rage.aimbotlogs_type:get("NL Notify") then
                            v6.cde.add_notify(v326(), "celestium");
                        end;
                    end;
                end;
            end;
            return;
        end;
    end;
    v6.events.nade_prediction = function(v327)
        -- upvalues: l_entity_0 (ref), v6 (ref), l_utils_0 (ref)
        if not l_entity_0.get_local_player() or not l_entity_0.get_local_player():is_alive() then
            return;
        else
            if v6.misc.misc.nade.settings:get("Automatic release") and l_entity_0.get_local_player():get_player_weapon() and (l_entity_0.get_local_player():get_player_weapon():get_weapon_index() == 44 or l_entity_0.get_local_player():get_player_weapon():get_weapon_index() == 46) and l_entity_0.get_local_player():get_player_weapon().m_bPinPulled and v327.damage >= v6.misc.misc.nade.damage:get() then
                l_utils_0.console_exec("+attack");
                l_utils_0.execute_after(0.1, function()
                    -- upvalues: l_utils_0 (ref)
                    l_utils_0.console_exec("-attack");
                end);
            end;
            return;
        end;
    end;
    local v328 = {
        [1] = "               ", 
        [2] = "               ", 
        [3] = "c              ", 
        [4] = "ce             ", 
        [5] = "cel            ", 
        [6] = "cele           ", 
        [7] = "celes          ", 
        [8] = "celest         ", 
        [9] = "celesti        ", 
        [10] = "celestiu       ", 
        [11] = "celestium      ", 
        [12] = "celestium'    ", 
        [13] = "celestium' 7  ", 
        [14] = "celestium' 77 ", 
        [15] = "celestium' 77 ", 
        [16] = "celestium' 77 ", 
        [17] = "celestium' 77 ", 
        [18] = "celestium' 77 ", 
        [19] = "celestium' 77 ", 
        [20] = "celestium' 77 ", 
        [21] = "celestium' 77 ", 
        [22] = "celestium' 77 ", 
        [23] = " elestium' 77 ", 
        [24] = "  lestium' 77 ", 
        [25] = "   estium' 77 ", 
        [26] = "    stium' 77 ", 
        [27] = "     tium' 77 ", 
        [28] = "      ium' 77 ", 
        [29] = "       um' 77 ", 
        [30] = "        m' 77 ", 
        [31] = "         ' 77 ", 
        [32] = "            77 ", 
        [33] = "             7 ", 
        [34] = "               "
    };
    v229 = function()
        -- upvalues: l_utils_0 (ref), v328 (ref), l_math_0 (ref), l_globals_0 (ref)
        if l_utils_0.net_channel() == nil then
            return;
        else
            return v328[l_math_0.floor(l_math_0.fmod((l_globals_0.tickcount + l_utils_0.net_channel().latency[0] / l_globals_0.tickinterval) / 16, #v328 + 1) + 1)];
        end;
    end;
    local v329 = nil;
    local function v331()
        -- upvalues: v229 (ref), v329 (ref), l_common_0 (ref)
        local v330 = v229();
        if v330 == v329 then
            return;
        elseif v330 == nil then
            return;
        else
            l_common_0.set_clan_tag(v330);
            v329 = v330;
            return;
        end;
    end;
    v6.raw = {};
    v6.events.antiaim = function(v332)
        -- upvalues: l_entity_0 (ref), v6 (ref), v8 (ref), l_globals_0 (ref), l_math_0 (ref), v3 (ref), l_rage_0 (ref), v7 (ref), v0 (ref), l_mtools_0 (ref), l_bit_0 (ref), l_table_0 (ref), l_common_0 (ref)
        local v333;
        if l_entity_0.get_local_player() then
            v333 = l_entity_0.get_local_player().m_iTeamNum == 2 and 2 or 1;
        else
            v333 = 2;
        end;
        local l_raw_0 = v6.raw;
        v8.player_states = v6.cde.states(v6.our.ticks, v6.antiaim.builder.builder[v333][12].enable:get(), v6.antiaim.builder.builder[v333][11].enable:get(), v6.antiaim.builder.builder[v333][10].enable:get(), v6.antiaim.builder.builder[v333][9].enable:get(), v6.antiaim.builder.builder[v333][13].enable:get(), v6.antiaim.builder.builder[v333][14].enable:get(), v6.antiaim.builder.builder[v333][15].enable:get(), v6.antiaim.builder.builder[v333][16].enable:get(), v6.antiaim.builder.builder[v333][17].enable:get(), v6.antiaim.builder.builder[v333][18].enable:get(), v6.database.antiaim.safehead.ready == true);
        local v335 = l_entity_0.get_threat();
        if v335 then
            local v336 = v335:get_origin();
            v6.our.fakeflick_yaw = render.world_to_screen(v336);
        end;
        v8.GET_AA_STATE = v6.antiaim.builder.builder[v333][v8.player_states].enable:get() and v8.player_states or 1;
        v8.pstat = v6.antiaim.builder.builder[v333][v8.GET_AA_STATE];
        v8.entity = l_entity_0.get_local_player();
        l_raw_0.localplayer = l_entity_0.get_local_player();
        l_raw_0.data = {
            jitter_ready = false, 
            yaw_jitter = 0, 
            yaw_offset = 0, 
            ready = select(1, v6:isdefensive()), 
            ticks = select(2, v6:isdefensive())
        };
        if l_globals_0.choked_commands == 1 then
            l_raw_0.data.jitter_ready = v332.command_number % 4 >= 2;
        end;
        l_raw_0.setyaw = function()
            -- upvalues: l_math_0 (ref), v6 (ref)
            local l_status_8, l_result_8 = pcall(function()
                -- upvalues: l_math_0 (ref), v6 (ref)
                return l_math_0.floor(v6.our.fakeflick_yaw.x);
            end);
            local l_status_9, l_result_9 = pcall(function()
                return vector(render.screen_size().x).x / 2;
            end);
            if l_status_8 and l_status_9 then
                if not l_result_8 then
                    l_result_8 = 0;
                end;
                if l_result_9 < l_result_8 then
                    v6.our.last_num = 90;
                    return v6.our.last_num;
                elseif l_result_8 < l_result_9 then
                    v6.our.last_num = -90;
                    return v6.our.last_num;
                else
                    return v6.our.last_num or 180;
                end;
            else
                return;
            end;
        end;
        if l_raw_0.localplayer and l_raw_0.localplayer:is_alive() then
            l_raw_0.weapon = l_raw_0.localplayer:get_player_weapon():get_classname();
        else
            l_raw_0.weapon = " ";
        end;
        v6.our.def_mod = v8.pstat.defensive_type_main:get();
        if l_globals_0.choked_commands == 0 then
            v6.our.delay_ticks = v6.our.delay_ticks + 1;
            if v6.our.delay_ticks > v8.pstat.yaw_limit_dd:get() / 2 + l_math_0.random(-v8.pstat.yaw_limit_drd:get(), v8.pstat.yaw_limit_drd:get()) then
                v6.our.delay = not v6.our.delay;
                v6.our.delay_ticks = 0;
            end;
        end;
        l_raw_0.switch = v6.our.delay;
        v6.database.antiaim.safehead:work(v6.raw);
        v6.database.antiaim.defensive:work();
        v6.database.antiaim.os:work(v6.raw);
        v6.database.antiaim.fakeflick:work(v8.pstat.defensive:get(), v332, v6.antiaim.settings.exploits.fakeflick_options);
        v3[2].enabled:override(true);
        v3[2].pitch:override(v8.pstat.yaw:get() and "Down" or "Disabled");
        v3[2].yaw:override(v8.pstat.yaw:get() and "Backward" or "Disabled");
        v3[2].yawbase:override(v6.antiaim.settings.yawbase._value:get() == "Local viewtopic" and "Local View" or "At Target");
        local l_yawmodifier_0 = v3[2].yawmodifier;
        local l_l_yawmodifier_0_0 = l_yawmodifier_0;
        l_yawmodifier_0 = l_yawmodifier_0.override;
        local v343;
        if v8.pstat.yawmodifier:get() then
            v343 = v8.pstat.operator:get() == "Neverlose" and v8.pstat.yaw_modifier_type:get() or "Disabled";
        else
            v343 = "Disabled";
        end;
        l_yawmodifier_0(l_l_yawmodifier_0_0, v343);
        l_yawmodifier_0 = l_raw_0.data.ticks[2] > l_raw_0.data.ticks[1][1] and l_raw_0.data.ticks[2] < l_raw_0.data.ticks[1][2] / 2;
        l_l_yawmodifier_0_0 = v8.pstat.yaw_modifier_defensive:get() and (l_yawmodifier_0 and -v8.pstat.yaw_modifier_defensive_jitter:get() or v8.pstat.yaw_modifier_defensive_jitter:get()) or 0;
        v3[2].yawmod_offset:override(v8.pstat.yaw_modifier_limit:get() * 3 + l_math_0.random(-v8.pstat.yaw_modifier_random:get(), v8.pstat.yaw_modifier_random:get()) + l_l_yawmodifier_0_0);
        v3[2].desync:set(v8.pstat.desync:get());
        v3[2].desync:override(v8.pstat.desync:get());
        if l_rage_0.antiaim:inverter() then
            v3[2].desync_options:override(v8.pstat.desync_options_l:get());
            v3[2].desync_Loffset:override(v8.pstat.desync_limitation_l:get());
            v3[2].desync_freestand:override(v8.pstat.desync_freestand_l:get());
            v7.override_bodylean(v332, v8.pstat.desync_lean_l:get());
        else
            v3[2].desync_options:override(v8.pstat.desync_options_r:get());
            v3[2].desync_Roffset:override(v8.pstat.desync_limitation_r:get());
            v3[2].desync_freestand:override(v8.pstat.desync_freestand_r:get());
            v7.override_bodylean(v332, v8.pstat.desync_lean_r:get());
        end;
        if v6.antiaim.settings.exploits.fakeflick:get() == "Disabled" then
            v6.our.is_fakeflick = false;
        elseif v6.antiaim.settings.exploits.fakeflick:get() == "Default" then
            v343 = l_raw_0.setyaw();
            v3[2].yaw_offset:override(v6.database.antiaim.fakeflick.ready == true and v343 or 0);
            v3[2].yawmodifier:override("Disabled");
            v3[2].yawmod_offset:override(0);
            v3[2].yawbase:override("At target");
            v3[2].desync_options:override({});
            if set_yaw == 90 then
                v3[2].desync_invert:override(false);
            elseif set_yaw == -90 then
                v3[2].desync_invert:override(true);
            else
                v3[2].desync_invert:override(false);
            end;
            v3[2].desync_Loffset:override(60);
            v3[2].desync_Roffset:override(60);
            v6.our.is_fakeflick = v6.database.antiaim.fakeflick.ready;
        end;
        do
            local l_l_l_yawmodifier_0_0_0 = l_l_yawmodifier_0_0;
            if not v6.our.is_fakeflick then
                v3[2].yaw_offset:override(v0.run(function()
                    -- upvalues: v8 (ref), l_math_0 (ref), v0 (ref), l_raw_0 (ref), v332 (ref), l_l_l_yawmodifier_0_0_0 (ref), l_globals_0 (ref), l_rage_0 (ref), v6 (ref)
                    local v345 = nil;
                    v345 = {};
                    if v8.pstat.yaw:get() then
                        v345.yaw = l_math_0.random(-v8.pstat.yaw_limit_static_random:get(), v8.pstat.yaw_limit_static_random:get());
                        v345.jitter = l_math_0.random(-v8.pstat.yaw_modifier_random:get(), v8.pstat.yaw_modifier_random:get());
                        local v346;
                        if v8.pstat.yawmodifier:get() then
                            v346 = v8.pstat.operator:get() == "Celestium" and v0.run(function(v347)
                                -- upvalues: v8 (ref), l_raw_0 (ref), v332 (ref), l_math_0 (ref), v345 (ref), l_l_l_yawmodifier_0_0_0 (ref)
                                local v348 = v8.pstat.yaw_modifier_type:get();
                                local l_jitter_ready_0 = l_raw_0.data.jitter_ready;
                                local v350 = v8.pstat.yaw_modifier_limit:get() * 3;
                                if v348 ~= "Offset" then
                                    if v348 == "Center" then
                                        v347 = l_jitter_ready_0 and v350 or -v350;
                                    elseif v348 == "3-Way" then
                                        local v351 = v332.command_number % 6;
                                        if v351 == 0 then
                                            v347 = -v350;
                                        elseif v351 == 2 then
                                            v347 = v350;
                                        elseif v351 == 4 then
                                            v347 = v350;
                                        end;
                                    elseif v348 == "5-Way" then
                                        local v352 = v332.command_number % 10;
                                        if v352 == 0 then
                                            v347 = -v350 * 2;
                                        elseif v352 == 2 then
                                            v347 = -v350 + -v350 / 2;
                                        elseif v352 == 4 then
                                            v347 = v350;
                                        elseif v352 == 6 then
                                            v347 = v350 + v350 / 2;
                                        elseif v352 == 8 then
                                            v347 = v350 * 2;
                                        end;
                                    elseif v348 == "Spin" then
                                        v347 = (v332.command_number % 360 - 180) * v350;
                                    elseif v348 == "Random" then
                                        v347 = l_math_0.random(-v350, v350);
                                    end;
                                end;
                                return v347 + v345.jitter + l_l_l_yawmodifier_0_0_0;
                            end, l_raw_0.data.yaw_jitter) or 0;
                        else
                            v346 = 0;
                        end;
                        v345.op_jit = v346;
                        if v8.pstat.yaw_type:get() == "Static" then
                            l_raw_0.data.yaw_offset = v8.pstat.yaw_limit_static:get() * 3;
                        elseif v8.pstat.yaw_type:get() == "L & R" then
                            if l_globals_0.choked_commands == 1 then
                                l_raw_0.data.yaw_offset = l_rage_0.antiaim:inverter() and v8.pstat.yaw_limit_l:get() * 3 or v8.pstat.yaw_limit_r:get() * 3;
                            end;
                        elseif v8.pstat.yaw_type:get() == "Delay" then
                            l_raw_0.data.yaw_offset = l_raw_0.switch and v8.pstat.yaw_limit_dl:get() * 3 or v8.pstat.yaw_limit_dr:get() * 3;
                        elseif v8.pstat.yaw_type:get() == "Sway" then
                            l_raw_0.data.yaw_offset = v6.cde.cslerp(v8.pstat.yaw_limit_static:get() * 3 * 150, 7);
                        elseif v8.pstat.yaw_type:get() == "Spin" then
                            v6.our.spin_yaw_nor = v6.our.spin_yaw_nor + v8.pstat.yaw_limit_static:get() * 3;
                            l_raw_0.data.yaw_offset = v6.our.spin_yaw_nor;
                        end;
                    else
                        l_raw_0.data.yaw_offset = 0;
                        v345.yaw = 0;
                        v345.op_jit = 0;
                        v345.jitter = 0;
                    end;
                    return v6.cde.normalize("yaw", l_raw_0.data.yaw_offset + v345.op_jit + v345.yaw);
                end));
                if v8.pstat.operator:get() == "Celestium" then
                    v3[2].desync_invert:override(l_raw_0.data.jitter_ready and true or false);
                elseif v8.pstat.yaw_type:get() == "Delay" then
                    v3[2].desync_invert:override(l_raw_0.switch and true or false);
                else
                    v3[2].desync_invert:override(v8.pstat.desync_invert:get());
                end;
            end;
            v343 = nil;
            v343 = {
                pitch = v6.our.def_mod == 0 and v8.pstat.defensive_pitch:get() or v8.pstat.exploit_pitch:get(), 
                yaw = v6.our.def_mod == 0 and v8.pstat.defensive_yaw:get() or v8.pstat.exploit_yaw:get()
            };
            if v6.our.def_mod == 0 then
                if v6.our.defensive_key == true then
                    v7.override_def_yaw(0);
                    v7.override_def_pitch(89);
                else
                    if v343.pitch == "Disabled" then
                        v7.override_def_pitch(89);
                    elseif v343.pitch ~= "Default" then
                        if v343.pitch == "Up" then
                            v7.override_def_pitch(-89);
                        elseif v343.pitch == "Zero" then
                            v7.override_def_pitch(0);
                        elseif v343.pitch == "Random" then
                            v7.override_def_pitch(l_math_0.random(-179, 179) % 180 - 81 + l_math_0.floor(l_math_0.random(-45, 45) * 1.5));
                        elseif v343.pitch == "Switch" then
                            v7.override_def_pitch(v332.command_number % 4 >= 2 and l_math_0.random(-89, -20) or l_math_0.random(20, 70));
                        elseif v343.pitch == "Automatic" then
                            v7.override_def_pitch(-l_globals_0.tickcount % 35 * 12);
                        elseif v343.pitch == "Sway" then
                            v7.override_def_pitch(v0.run(function()
                                -- upvalues: l_globals_0 (ref), l_math_0 (ref)
                                local v353 = l_globals_0.tickcount % 9;
                                if v353 == 1 then
                                    return -89;
                                elseif v353 == 3 then
                                    return l_math_0.random(-60, 0);
                                elseif v353 == 5 then
                                    return l_math_0.random(0, 30);
                                elseif v353 == 7 then
                                    return l_math_0.random(50, 70);
                                elseif v353 == 9 then
                                    return l_math_0.random(-89, 89);
                                else
                                    return -45;
                                end;
                            end));
                        elseif v343.pitch == "Custom" then
                            v7.override_def_pitch(v8.pstat.defensive_pitch_custom:get());
                        end;
                    end;
                    if v343.yaw == "Disabled" then
                        v7.override_def_yaw(0);
                    elseif v343.yaw ~= "Default" then
                        if v343.yaw == "180" then
                            v7.override_def_yaw(-179);
                        elseif v343.yaw == "360" then
                            v6.our.spin_yaw = v6.our.spin_yaw + v8.pstat.defensive_spin_speed:get();
                            v7.override_def_yaw(v6.our.spin_yaw);
                        elseif v343.yaw == "720" then
                            v7.override_def_yaw(v6.cde.cslerp(6480, 6));
                        elseif v343.yaw == "Random" then
                            v7.override_def_yaw(l_globals_0.tickcount % 10 >= 5 and l_math_0.random(-180, 180) - (l_math_0.random(-89, 89) % 360 + l_math_0.random(0, 360)) - l_math_0.random(-180, 180) - 180 or l_math_0.deg(v6.cde.random_float(-9, 9)) - v6.cde.random_float(-180, 180) * 1.5);
                        elseif v343.yaw == "Switch" then
                            local v354 = v8.pstat.defensive_yaw_switch:get() * 4;
                            local v355 = v8.pstat.defensive_yaw_switch_speed:get() * 2;
                            v7.override_def_yaw(v332.command_number % v355 >= v355 / 2 and -v354 or v354);
                        elseif v343.yaw == "Automatic" then
                            v7.override_def_yaw(l_raw_0.setyaw() or 180);
                        elseif v343.yaw == "Half" then
                            local v356 = l_globals_0.tickcount % 30 * 5 + 10;
                            v7.override_def_yaw(l_globals_0.tickcount % 20 > 10 and -v356 or v356);
                        elseif v343.yaw == "Sway" then
                            v7.override_def_yaw(v6.our.spin_yaw - v6.cde.cslerp(2277, 8));
                        elseif v343.yaw == "Custom" then
                            v7.override_def_yaw(v8.pstat.defensive_yaw_custom:get() * 4);
                        end;
                    end;
                    v3[2].hidden:override(v6.database.antiaim.defensive.data.ready);
                    if l_raw_0.data.ready and v6.database.antiaim.defensive.data.ready then
                        if v8.pstat.defensive_disabler:get("Yaw") then
                            v3[2].yaw_offset:override(0);
                        end;
                        if v8.pstat.defensive_disabler:get("Yaw modifier") then
                            v3[2].yawmodifier:override("Disabled");
                            v3[2].yawmod_offset:override(0);
                        end;
                        if v8.pstat.defensive_disabler:get("Desync") then
                            v3[2].desync:set(false);
                            v3[2].desync:override(false);
                        end;
                        if v8.pstat.defensive_disabler:get("Desync invert") then
                            v3[2].desync_invert:override(false);
                            v3[2].desync_options:override({});
                        end;
                    end;
                end;
            elseif v6.our.def_mod == 1 then
                if v6.our.defensive_key == true or v8.pstat.exploit:get() == false then
                    v7.override_def_yaw(0);
                    v7.override_def_pitch(89);
                else
                    local v357 = l_raw_0.setyaw();
                    if v343.pitch == "Disabled" then
                        v7.override_def_pitch(89);
                    elseif v343.pitch ~= "Default" then
                        if v343.pitch == "Up" then
                            v7.override_def_pitch(-89);
                        elseif v343.pitch == "Zero" then
                            v7.override_def_pitch(0);
                        elseif v343.pitch == "Random" then
                            v7.override_def_pitch(l_math_0.random(-179, 179) % 180 - 81 + l_math_0.floor(l_math_0.random(-45, 45) * 1.5));
                        elseif v343.pitch == "Switch" then
                            v7.override_def_pitch(v332.command_number % 4 >= 2 and l_math_0.random(-89, -20) or l_math_0.random(20, 70));
                        elseif v343.pitch == "Automatic" then
                            v7.override_def_pitch(-l_globals_0.tickcount % 35 * 12);
                        elseif v343.pitch == "Sway" then
                            v7.override_def_pitch(v0.run(function()
                                -- upvalues: l_globals_0 (ref), l_math_0 (ref)
                                local v358 = l_globals_0.tickcount % 9;
                                if v358 == 1 then
                                    return -89;
                                elseif v358 == 3 then
                                    return l_math_0.random(-60, 0);
                                elseif v358 == 5 then
                                    return l_math_0.random(0, 30);
                                elseif v358 == 7 then
                                    return l_math_0.random(50, 70);
                                elseif v358 == 9 then
                                    return l_math_0.random(-89, 89);
                                else
                                    return -45;
                                end;
                            end));
                        elseif v343.pitch == "Custom" then
                            v7.override_def_pitch(v8.pstat.exploit_custom_pitch:get());
                        end;
                    end;
                    if v343.yaw == "Disabled" then
                        v7.override_def_yaw(0);
                    elseif v343.yaw ~= "Default" then
                        if v343.yaw == "180" then
                            v7.override_def_yaw(l_globals_0.tickcount % 2 == 0 and l_math_0.random(180, 175) or l_math_0.random(-180, -175));
                        elseif v343.yaw == "360" then
                            v6.our.spin_yaw = v6.our.spin_yaw + v8.pstat.exploit_custom_yaw:get();
                            v7.override_def_yaw(v6.our.spin_yaw);
                        elseif v343.yaw == "720" then
                            v7.override_def_yaw(v6.cde.cslerp(6480, 6));
                        elseif v343.yaw == "Random" then
                            v7.override_def_yaw(l_math_0.random(-180, 180) * 0.2 + l_math_0.max(v332.command_number % 360) - 180 + l_math_0.random(-90, 90) + l_math_0.random(-360, 360));
                        elseif v343.yaw == "Switch" then
                            local v359 = v8.pstat.exploit_custom_yaw:get() * 4;
                            local v360 = 4;
                            v7.override_def_yaw(v332.command_number % v360 >= v360 / 2 and -v359 or v359);
                        elseif v343.yaw == "Automatic" then
                            if v6:ready(v3[2].freestand) then
                                v7.override_def_yaw(180);
                            else
                                v7.override_def_yaw(v357 or 180);
                            end;
                        elseif v343.yaw == "Half" then
                            v7.override_def_yaw(v332.command_number % 4 >= 2 and -45 or 45);
                        elseif v343.yaw == "Sway" then
                            v7.override_def_yaw(v6.our.spin_yaw - v6.cde.cslerp(2277, 8));
                        elseif v343.yaw == "Custom" then
                            v7.override_def_yaw(v8.pstat.exploit_custom_yaw:get() * 4);
                        end;
                    end;
                    v3[2].hidden:override(v6.database.antiaim.defensive.data.ready);
                    local l_desync_invert_0 = v3[2].desync_invert;
                    local l_l_desync_invert_0_0 = l_desync_invert_0;
                    l_desync_invert_0 = l_desync_invert_0.override;
                    if v357 == 90 then

                    end;
                    l_desync_invert_0(l_l_desync_invert_0_0, v357 == -90);
                    if v6.database.antiaim.defensive.data.ready then
                        if v8.pstat.exploit_disabler:get("Yaw") then
                            v3[2].yaw_offset:override(0);
                        end;
                        if v8.pstat.exploit_disabler:get("Yaw modifier") then
                            v3[2].yawmodifier:override("Disabled");
                            v3[2].yawmod_offset:override(0);
                        end;
                        if v8.pstat.exploit_disabler:get("Desync") then
                            v3[2].desync:set(false);
                            v3[2].desync:override(false);
                        end;
                        if v8.pstat.exploit_disabler:get("Desync invert") then
                            v3[2].desync_options:override({});
                        end;
                    end;
                end;
            end;
        end;
        if v6.antiaim.settings.exploits.avoidleg:get() and v3[1].peek_assist:get() then
            l_yawmodifier_0 = l_entity_0.get_threat(true);
            v6.our.is_avoid = true;
            if v6.cde.velocity() >= 85 then
                v3[2].legmovement:override(v332.command_number % 6 >= 3 and "Sliding" or "Walking");
            end;
        else
            v6.our.is_avoid = false;
        end;
        if v6.antiaim.settings.exploits.breakdesync:get() == "Tickcount" then
            if l_globals_0.tickcount % 60 == 0 then
                v3[2].desync:set(false);
                v3[2].desync:override(false);
            end;
        elseif v6.antiaim.settings.exploits.breakdesync:get() == "Ping based" and l_globals_0.tickcount % 64 - l_math_0.floor(l_math_0.max(l_mtools_0.Client.GetPing() / 10)) == 0 then
            v3[2].desync:set(false);
            v3[2].desync:override(false);
        end;
        if v8.pstat.defensive:get() and v6.cde.get_nade() == nil then
            v6.our.is_defensive = true;
            v3[1].dt_lag:override("Always on");
        else
            v6.our.is_defensive = false;
            v3[1].dt_lag:override("Disabled");
        end;
        v6.our.auto_os_ready = v3[1].doubletap:get() == true;
        v8.tick = v6.antiaim.settings.safestates.automatic_os_time:get();
        v8.time = false;
        if v8.tick == 20 then
            v8.time = true;
        elseif v6.our.ticks > 2 and v6.our.ticks < v8.tick then
            v8.time = true;
        else
            v8.time = false;
        end;
        if v6.antiaim.settings.safestates.automatic_os:get("Crouch") and v3[2].fakeduck:get() == false and v6.our.auto_os_ready == false and l_bit_0.band(l_entity_0.get_local_player().m_fFlags, 1) == 1 and l_bit_0.band(l_entity_0.get_local_player().m_fFlags, 4) == 4 and v8.time then
            v3[1].doubletap:override(false);
            v3[1].onshot:override(true);
            v3[1].onshot_setting:override("Favor Fake Lag");
        else
            v3[1].onshot:override();
            v3[1].onshot_setting:override();
            v3[1].doubletap:override();
        end;
        if v6.antiaim.settings.safestates.automatic_os:get("Standing") and v6.our.auto_os_ready == false and v3[2].fakeduck:get() == false and v8.GET_AA_STATE == 2 and v8.time then
            v3[1].doubletap:override(false);
            v3[1].onshot:override(true);
            v3[1].onshot_setting:override("Favor Fake Lag");
        else
            v3[1].onshot:override();
            v3[1].onshot_setting:override();
            v3[1].doubletap:override();
        end;
        if v6.misc.rage.force_states:get() then
            if v6.misc.rage.force_states_bodyaim:get() then
                v3[1].bodyaims:override(v6.database.config.force.baim.value);
            end;
            if v6.misc.rage.force_states_safepoint:get() then
                v3[1].safepoints:override(v6.database.config.force.safepoint.value);
            end;
            if v6.misc.rage.force_states_shot:get() then
                v3[1].hitchances:override(v6.database.config.force.shot.hitchance);
                v3[1].mindamages:override(v6.database.config.force.shot.damage);
            end;
            if v6.misc.rage.force_states_avoidlegs:get() then
                if not v6:ready(v3[1].peek_assist) and v6.cde.velocity() > 55 then
                    l_yawmodifier_0 = {};
                    for _, v364 in pairs(v3[1].hitboxes:get()) do
                        if v364 == "Feet" then
                            v364 = nil;
                        end;
                        if v364 == "Legs" then
                            v364 = nil;
                        end;
                        l_table_0.insert(l_yawmodifier_0, v364);
                    end;
                    v3[1].hitboxes:override(l_table_0.unpack(l_yawmodifier_0));
                else
                    v3[1].hitboxes:override();
                end;
            end;
        end;
        l_yawmodifier_0 = v6.misc.rage.inair_stop_weapons;
        if v6.misc.rage.inair_stop:get() then
            if l_entity_0.get_local_player() and v6.cde.velocity() < 168 and (v8.player_states == 5 or v8.player_states == 6) then
                if l_yawmodifier_0:get("Deagle") then
                    v3[1].deagle_autostop:override("In Air");
                end;
                if l_yawmodifier_0:get("Scout") then
                    v3[1].ssg_autostop:override("In Air");
                end;
                if l_yawmodifier_0:get("Awp") then
                    v3[1].awp_autostop:override("In Air");
                end;
                if l_yawmodifier_0:get("Auto") then
                    v3.o_o:override("In Air");
                end;
                if l_yawmodifier_0:get("Shotguns") then
                    v3[1].shotgun_autostop:override("In Air");
                end;
                if l_yawmodifier_0:get("Smgs") then
                    v3[1].smg_autostop:override("In Air");
                end;
            else
                v3[1].deagle_autostop:override();
                v3[1].ssg_autostop:override();
                v3[1].awp_autostop:override();
                v3[1].autosniper_autostop:override();
                v3[1].shotgun_autostop:override();
                v3[1].smg_autostop:override();
            end;
        end;
        l_yawmodifier_0 = v6.misc.rage.hitchance_override_weapons;
        l_l_yawmodifier_0_0 = {
            [0] = {
                v6.misc.rage.hitchance_override_weapons_deagle:get(), 
                v6.misc.rage.hitchance_override_weapons_scout:get(), 
                v6.misc.rage.hitchance_override_weapons_awp:get(), 
                v6.misc.rage.hitchance_override_weapons_auto:get(), 
                v6.misc.rage.hitchance_override_weapons_shotguns:get(), 
                v6.misc.rage.hitchance_override_weapons_smgs:get()
            }
        };
        if v6.misc.rage.hitchance_override:get() and (v8.player_states == 5 or v8.player_states == 6) then
            if l_yawmodifier_0:get("Deagle") then
                v3[1].deagle_hc:override(l_l_yawmodifier_0_0[0][1]);
            end;
            if l_yawmodifier_0:get("Scout") then
                v3[1].ssg_hc:override(l_l_yawmodifier_0_0[0][2]);
            end;
            if l_yawmodifier_0:get("Awp") then
                v3[1].awp_hc:override(l_l_yawmodifier_0_0[0][3]);
            end;
            if l_yawmodifier_0:get("Auto") then
                v3[1].autosniper:override(l_l_yawmodifier_0_0[0][4]);
            end;
            if l_yawmodifier_0:get("Shotguns") then
                v3[1].shotgun_hc:override(l_l_yawmodifier_0_0[0][5]);
            end;
            if l_yawmodifier_0:get("Smgs") then
                v3[1].smg_hc:override(l_l_yawmodifier_0_0[0][6]);
            end;
        end;
        if v6.misc.rage.teleport:get() then
            l_yawmodifier_0 = {
                level = 7.593509, 
                short = v6:cmp({
                    [1] = "str", 
                    [2] = "mud", 
                    [3] = 0.3
                }, v6:unpack(v6.database.config.tt)), 
                item = v6.misc.rage.teleport_charge:get(), 
                item2 = v6.misc.rage.teleport_automatic:get(), 
                delay = v6.misc.rage.teleport_delay:get()
            };
            if v6.misc.rage.teleport_onkey:get() then
                l_rage_0.exploit:force_teleport();
            end;
            do
                local l_l_yawmodifier_0_1 = l_yawmodifier_0;
                l_l_yawmodifier_0_0 = function()
                    -- upvalues: l_l_yawmodifier_0_1 (ref)
                    if l_l_yawmodifier_0_1.item == "Slow" then
                        return {
                            [1] = l_l_yawmodifier_0_1.short[1][1][1], 
                            [2] = l_l_yawmodifier_0_1.short[1][1][2]
                        };
                    elseif l_l_yawmodifier_0_1.item == "Fast" then
                        return {
                            [1] = l_l_yawmodifier_0_1.short[1][2][1], 
                            [2] = l_l_yawmodifier_0_1.short[1][2][2]
                        };
                    else
                        return {
                            [1] = l_l_yawmodifier_0_1.short[1][3][1], 
                            [2] = l_l_yawmodifier_0_1.short[1][3][2]
                        };
                    end;
                end;
                if l_l_yawmodifier_0_1.item2 ~= "Disabled" and l_common_0.is_button_down(32) then
                    l_l_yawmodifier_0_1.ready = l_globals_0.tickcount % l_l_yawmodifier_0_0()[1] > l_l_yawmodifier_0_0()[2];
                    if l_l_yawmodifier_0_1.item2 == "On hittable" then
                        if l_entity_0.get_threat(true) then
                            v3[1].doubletap:override(l_l_yawmodifier_0_1.ready);
                        else
                            v3[1].doubletap:override();
                        end;
                    elseif l_l_yawmodifier_0_1.item2 == "Delay" then
                        if l_entity_0.get_threat(true) then
                            v6.our.teleport = v6.our.teleport + 1;
                            if v6.our.teleport > l_l_yawmodifier_0_1.delay then
                                v3[1].doubletap:override(l_l_yawmodifier_0_1.ready);
                            end;
                        else
                            v6.our.teleport = 0;
                        end;
                    end;
                else
                    v3[1].doubletap:override();
                end;
            end;
        end;
        if v6.our.def_mod == 1 and l_rage_0.exploit:get() == 1 then
            v332.force_defensive = v332.command_number % 7 == 0;
        end;
        if v6.misc.animation.resetpitch_type:get() == 1 then
            v6.our.is_fs_anim = v6:ready(v3[2].freestand) and v6.our.resetpitch > 5;
        end;
        if v6.cde.velocity() > 2 and v6.our.is_avoid ~= true then
            if v6.misc.animation.other:get("Skeet legs") and v3[1].peek_assist:get() then
                v3[2].legmovement:override("Sliding");
            elseif v6.misc.animation.ground:get() == "Jitter" then
                v3[2].legmovement:override(l_globals_0.tickcount % 4 >= 2 and "Sliding" or "Walking");
            elseif v6.misc.animation.ground:get() == "Static" then
                v3[2].legmovement:override("Sliding");
            elseif v6.misc.animation.ground:get() == "Random" then
                v3[2].legmovement:override(l_math_0.random() > 0.5 and "Sliding" or "Default");
            elseif v6.misc.animation.ground:get() == "Moonwalk" then
                v3[2].legmovement:override("Walking");
            else
                v3[2].legmovement:override();
            end;
        end;
        if v6.our.is_fakeflick == true then
            v3[2].freestand:override(false);
        else
            v3[2].freestand:override(v6.antiaim.settings.binds.freestanding:get());
        end;
        if (not v6.misc.rage.hitchance_override:get() or v8.player_states ~= 5 and v8.player_states ~= 6) and (not v6.misc.rage.force_states:get() or not v6.misc.rage.force_states_shot:get()) then
            v3[1].deagle_hc:override();
            v3[1].ssg_hc:override();
            v3[1].autosniper:override();
            v3[1].awp_hc:override();
            v3[1].smg_hc:override();
            v3[1].shotgun_hc:override();
            v3[1].hitchances:override();
            v3[1].mindamages:override();
        end;
        if v6.misc.misc.buybot:get() and v6.misc.misc.buybot_items:get("Disable on warmup") and l_entity_0.get_game_rules().m_bWarmupPeriod or v6.misc.misc.buybot_items:get("Disable X money") and l_entity_0.get_local_player().m_iAccount < v6.misc.misc.buybot_money:get() or v6.misc.misc.buybot_items:get("Disable X round") and l_entity_0.get_game_rules().m_totalRoundsPlayed < v6.misc.misc.buybot_round:get() then
            v3[3].buybot:override(false);
        else
            v3[3].buybot:override();
        end;
    end;
    v6.events.misc = function(v366)
        -- upvalues: v8 (ref), l_entity_0 (ref), v6 (ref), l_cvar_0 (ref), l_bit_0 (ref), v3 (ref), l_rage_0 (ref), l_globals_0 (ref), l_math_0 (ref), l_edgeyaw_0 (ref), v7 (ref), l_utils_0 (ref), l_string_0 (ref)
        v8.entity = l_entity_0.get_local_player();
        if not l_entity_0.get_local_player():is_alive() then
            return;
        else
            if v6.misc.visual.viewmodel:get() then
                l_cvar_0.viewmodel_fov:int(v6.misc.visual.viewmodel_fov:get(), true);
                l_cvar_0.viewmodel_offset_x:float(v6.misc.visual.viewmodel_x:get() / 10, true);
                l_cvar_0.viewmodel_offset_y:float(v6.misc.visual.viewmodel_y:get() / 10, true);
                l_cvar_0.viewmodel_offset_z:float(v6.misc.visual.viewmodel_z:get() / 10, true);
            end;
            if l_bit_0.band(l_entity_0.get_local_player().m_fFlags, l_bit_0.lshift(1, 0)) ~= 0 then
                v6.our.ticks = v6.our.ticks + 1;
                v6.our.resetpitch = v6.our.resetpitch + 1;
            else
                v6.our.resetpitch = 0;
                v6.our.ticks = 0;
            end;
            if v6.misc.misc.movement.settings:get("Jump scout") or v3[2].slowwalk:get() or v3[2].slowwalk:get_override() then
                if v6.cde.velocity() < 5 then
                    v3[3].airstrafe:override(false);
                else
                    v3[3].airstrafe:override();
                end;
            end;
            if v6.misc.visual.viewmodel_bob:get() and v6.misc.visual.viewmodel:get() then
                l_cvar_0.cl_bob_lower_amt:float(0);
                l_cvar_0.cl_bobamt_lat:float(0);
                l_cvar_0.cl_bobamt_vert:float(0);
                l_cvar_0.cl_bobcycle:float(0.98);
                l_cvar_0.cl_viewmodel_shift_left_amt:float(0);
                l_cvar_0.cl_viewmodel_shift_right_amt:float(0);
                l_cvar_0.cl_wpn_sway_interp:float(0);
                l_cvar_0.cl_wpn_sway_scale:float(0);
                l_cvar_0.cl_bobup:float(0);
                l_cvar_0.cl_bob_version:float(0);
                l_cvar_0.cam_idealdist:float(0);
                l_cvar_0.cam_idealpitch:float(0);
                l_cvar_0.cam_idealyaw:float(0);
                l_cvar_0.cl_use_new_headbob:float(0);
            end;
            local v367 = l_rage_0.exploit:get() > 0.7 or v3[2].fakeduck:get() or v3[2].fakeduck:get_override();
            local v368 = v6:cmp({
                [1] = "fl", 
                [2] = "cfg", 
                [3] = 0.4
            }, v6:unpack(v6.database));
            v3[2].fakelag_enablled:override(v6.antiaim.settings.fakelag._value:get() ~= "Disabled");
            if v6.misc.rage.airlag:get() and v3[1].doubletap:get() then
                v3[2].fakelag_limit:override(17);
            elseif v367 then
                v3[2].fakelag_limit:override(v368[1].config.fl[5].value);
                v3[2].fakelag_var:override(v368[1].config.fl[5].value2);
            elseif v6.antiaim.settings.fakelag._value:get() ~= "Disabled" then
                if v6.antiaim.settings.fakelag._value:get() == "Maximum" then
                    v3[2].fakelag_limit:override(v368[1].config.fl[1].value);
                    v3[2].fakelag_var:override(v368[1].config.fl[1].value2);
                elseif v6.antiaim.settings.fakelag._value:get() == "Ping based" then
                    v3[2].fakelag_limit:override(v368[1].config.fl[2].value());
                    v3[2].fakelag_var:override(v368[1].config.fl[2].value2);
                elseif v6.antiaim.settings.fakelag._value:get() == "Random" then
                    v3[2].fakelag_limit:override(v368[1].config.fl[3].value());
                    v3[2].fakelag_var:override(v368[1].config.fl[3].value2);
                elseif v6.antiaim.settings.fakelag._value:get() == "Fluctuate" then
                    v3[2].fakelag_limit:override(v368[1].config.fl[4].value());
                    v3[2].fakelag_var:override(v368[1].config.fl[4].value2);
                end;
            end;
            if v8.pstat.fakeyaw:get() and v6.antiaim.settings.exploits.fakeflick:get() == "Disabled" and v8.pstat.desync:get() == true then
                if v8.pstat.typ_fakeyaw:get() == "Automatic" then
                    local v369 = v6.cde.normalize("yaw", v6.database.antiaim.manualyaw.current_yaw < 0 and v6.database.antiaim.manualyaw.current_yaw - 90 or v6.database.antiaim.manualyaw.current_yaw + 90);
                    v6.database.antiaim.fakeyaw.current_yaw = v369;
                else
                    v6.database.antiaim.fakeyaw.current_yaw = v8.pstat.slider_fakeyaw:get();
                end;
                if l_globals_0.choked_commands == 0 then
                    v3[2].yaw_offset:override(v6.database.antiaim.fakeyaw.current_yaw);
                end;
            end;
            if v8.pstat.break_antiaim:get() then
                v8.entity = l_entity_0.get_local_player();
                v368.value = v8.pstat.typ_break_antiaim:get();
                if v368.value == "Break" then
                    if v6.our.break_aa % 2 == 1 and v366.command_number % 5 == 0 then
                        local v370 = l_math_0.random(-60, 60);
                        local v371 = v370 < 0 and -100 + v370 or 100 + v370;
                        v3[2].yaw_offset:override(v371);
                    end;
                elseif v368.value == "Hidden" and v6.our.break_aa % 2 == 1 and v366.command_number % 7 == 0 then
                    local v372 = l_math_0.random(-120, 120);
                    local v373 = v372 < 0 and -60 + v372 or 60 + v372;
                    v3[2].yaw_offset:override(v373);
                end;
            end;
            if v6.antiaim.settings.binds.edgeyaw:get() then
                v3[2].yaw_offset:override(l_edgeyaw_0.get());
            else
                local v374 = v6.antiaim.settings.binds.manualyaw:get();
                if v374 ~= "Disabled" then
                    if v374 == "Forward" then
                        v3[2].yaw_offset:override(180);
                        v6.database.antiaim.manualyaw.current_yaw = 180;
                    elseif v374 == "Left" then
                        v3[2].yaw_offset:override(-90);
                        v6.database.antiaim.manualyaw.current_yaw = -90;
                    elseif v374 == "Right" then
                        v3[2].yaw_offset:override(90);
                        v6.database.antiaim.manualyaw.current_yaw = 90;
                    elseif v374 == "Back" then
                        v3[2].yaw_offset:override(0);
                        v6.database.antiaim.manualyaw.current_yaw = 0;
                    end;
                elseif v374 == "Disabled" then
                    v6.database.antiaim.manualyaw.current_yaw = 0;
                end;
            end;
            if l_globals_0.choked_commands == 0 then
                if v6.misc.misc.nade.settings:get("Fix nade") and v6.cde.get_nade() ~= nil then
                    v3[3].weapon_action:override({});
                    v3[1].doubletap_switch:override(false);
                else
                    v3[3].weapon_action:override();
                    v3[1].doubletap_switch:override();
                end;
            end;
            if v6.misc.misc.fastswitch:get() == false or v3[1].peek_assist:get() == false or v3[1].doubletap:get() == false then
                v6.our.shooted = false;
                v6.our.shooted_use = false;
            end;
            if v6.misc.misc.fastswitch_style:get("On use") then
                if v6.our.shooted_use then
                    v6.cde.reset_aa(v7, 180);
                    v3[2].pitch:override("Disabled");
                    v3[2].freestand:override(false);
                    l_utils_0.execute_after(0.3, function()
                        -- upvalues: v6 (ref)
                        v6.our.shooted_use = false;
                    end);
                else
                    v6.our.shooted_use = false;
                end;
            end;
            if v6.misc.misc.fastswitch_style:get("Weapon switch") then
                if l_string_0.match(l_entity_0.get_local_player():get_player_weapon():get_classname(), "SSG08") then
                    if v6.our.shooted then
                        l_utils_0.console_exec("slot3");
                        l_utils_0.execute_after(0.012, function()
                            -- upvalues: l_utils_0 (ref), v6 (ref)
                            l_utils_0.console_exec("slot1");
                            v6.our.shooted = false;
                        end);
                    else
                        v6.our.shooted = false;
                    end;
                else
                    v6.our.shooted = false;
                end;
            end;
            return;
        end;
    end;
    v110.watermark.x:visibility(false);
    v110.watermark.y:visibility(false);
    v110.indicator.x:visibility(false);
    v110.indicator.y:visibility(false);
    v110.keybind.x:visibility(false);
    v110.keybind.y:visibility(false);
    v110.defensive.x:visibility(false);
    v110.defensive.y:visibility(false);
    v110.tickbase_shiff.x:visibility(false);
    v110.tickbase_shiff.y:visibility(false);
    v110.indicator.alpha.backround = function(v375)
        -- upvalues: l_ui_0 (ref), v110 (ref), v6 (ref)
        if l_ui_0.get_alpha() > 0 then
            v110.indicator.alpha.newalpha = l_ui_0.get_alpha() * v375;
        else
            v110.indicator.alpha.newalpha = v6.cde.lerp(v110.indicator.alpha.newalpha, v6.our.is_idealtick == true and v375 or 0, 2);
        end;
        return v110.indicator.alpha.newalpha;
    end;
    v110.indicator.alpha.lengthx = v110.indicator.alpha.lengthx or function()
        -- upvalues: l_rage_0 (ref)
        local v376 = l_rage_0.exploit:get() == 1 and {
            [1] = 1, 
            [2] = "C H A R G E D", 
            [3] = 37
        } or {
            [1] = 2, 
            [2] = "C H A R G I N G", 
            [3] = 34
        };
        return {
            text = v376[2], 
            lenght = v376[3], 
            value = v376[1]
        };
    end;
    v110.defensive.alpha = {
        line = 0, 
        shadow = 0, 
        screen = 0
    };
    v236 = v110.defensive.alpha;
    v244 = render.screen_size();
    local _ = false;
    local _ = 0;
    v110.defensive.run = l_drag_system_0.register({
        [1] = v110.defensive.x, 
        [2] = v110.defensive.y
    }, vector(190, 40), "defensive", function(v379)
        -- upvalues: l_rage_0 (ref), v3 (ref), v6 (ref), v110 (ref), l_common_0 (ref), v236 (ref), l_ui_0 (ref), v244 (ref), v1 (ref), l_math_0 (ref)
        local l_size_0 = v379.size;
        local l_position_0 = v379.position;
        local v382 = l_rage_0.exploit:get();
        local v383 = v3[1].doubletap:get();
        local v384 = v3[2].fakeduck:get();
        if v6.cde.mouse_check(vector(v110.defensive.x:get(), v110.defensive.y:get()), vector(v110.defensive.x:get() + l_size_0.x, v110.defensive.y:get() + l_size_0.y)) and l_common_0.is_button_down(1) then
            v236.screen = v6.cde.lerp(v236.screen, 130, 5);
        else
            v236.screen = v6.cde.lerp(v236.screen, 0, 13);
        end;
        if v382 < 1 then
            v236.line = v6.cde.lerp(v236.line, l_size_0.x - 5, 10);
        else
            v236.line = v6.cde.lerp(v236.line, 8, 10);
        end;
        if l_ui_0.get_alpha() > 0 or v382 < 1 and v383 and v384 == false then
            v236.shadow = v6.cde.lerp(v236.shadow, 255, 12);
        else
            v236.shadow = v6.cde.lerp(v236.shadow, 0, 6);
        end;
        render.shadow(vector(l_position_0.x + 5, l_position_0.y + 5), vector(l_position_0.x + l_size_0.x - 5, l_position_0.y + l_size_0.y - 5), color(213, 121, 121, v236.shadow), 40, 0, 6);
        render.shadow(vector(l_position_0.x + 5, l_position_0.y + 5), vector(l_position_0.x + l_size_0.x - 5, l_position_0.y + l_size_0.y - 5), color(213, 121, 121, v236.shadow), 40, 0, 6);
        render.shadow(vector(l_position_0.x + 5, l_position_0.y + 5), vector(l_position_0.x + l_size_0.x - 5, l_position_0.y + l_size_0.y - 5), color(v6.misc.accent.accent:get().r, v6.misc.accent.accent:get().g, v6.misc.accent.accent:get().b, v236.shadow), 30, 0, 6);
        render.rect(vector(l_position_0.x + 5, l_position_0.y + 5), vector(l_position_0.x + l_size_0.x - 5, l_position_0.y + l_size_0.y - 5), color(20, 20, 20, v236.shadow), 8);
        render.rect_outline(vector(l_position_0.x, l_position_0.y), vector(l_position_0.x + l_size_0.x, l_position_0.y + l_size_0.y), color(255, 255, 255, 100 * l_ui_0.get_alpha()), 1, 8);
        render.line(vector(l_position_0.x + 6, l_position_0.y + 5), vector(l_position_0.x + l_size_0.x - v236.line, l_position_0.y + 5), color(255, 255, 255, v236.shadow));
        render.line(vector(v244.x / 2, 0), vector(v244.x / 2, v244.y), color(255, 255, 255, v236.screen));
        render.line(vector(0, v244.y / 2), vector(v244.x, v244.y / 2), color(255, 255, 255, v236.screen));
        render.text(v1.comfortaa, vector(l_position_0.x + l_size_0.x / 2 - 45, l_position_0.y + l_size_0.y / 2 - 5), color(255, 255, 255, v236.shadow), nil, "Defensive: " .. l_math_0.floor(v382 * 100) .. "%");
    end);
    local v385 = 0;
    v110.indicator.run = l_drag_system_0.register({
        [1] = v110.indicator.x, 
        [2] = v110.indicator.y
    }, vector(150, 40), "indicator", function(v386)
        -- upvalues: v110 (ref), v6 (ref), l_ui_0 (ref), l_common_0 (ref), l_rage_0 (ref), l_math_0 (ref), v385 (ref), v244 (ref), v1 (ref)
        local l_alpha_0 = v110.indicator.alpha;
        local l_size_1 = v386.size;
        local l_position_1 = v386.position;
        local _ = color(v6.misc.accent.accent:get().r, v6.misc.accent.accent:get().g, v6.misc.accent.accent:get().b, v6.misc.accent.accent:get().a);
        l_alpha_0.outline = 100 * l_ui_0.get_alpha();
        if v6.cde.mouse_check(vector(v110.indicator.x:get(), v110.indicator.y:get()), vector(v110.indicator.x:get() + l_size_1.x, v110.indicator.y:get() + l_size_1.y)) and l_common_0.is_button_down(1) then
            l_alpha_0.screen = v6.cde.lerp(l_alpha_0.screen, 130, 5);
        else
            l_alpha_0.screen = v6.cde.lerp(l_alpha_0.screen, 0, 13);
        end;
        local v391 = v110.indicator.alpha.lengthx();
        l_alpha_0.shoot = v6.cde.lerp(l_alpha_0.shoot, l_rage_0.exploit:get() < 1 and 200 or 0, 15);
        l_alpha_0.shoot_len = v6.cde.lerp(l_alpha_0.shoot_len, l_rage_0.exploit:get() ~= 0 and l_rage_0.exploit:get() < 1 and l_position_1.x + l_size_1.x + 6 or 6, 2);
        l_alpha_0.shoot_len = l_math_0.min(l_alpha_0.shoot_len, 140);
        if l_alpha_0.shoot_len > 137 and l_rage_0.exploit:get() < 1 then
            v385 = v6.cde.lerp(v385, 0, 20);
        elseif l_rage_0.exploit:get() < 1 and l_alpha_0.shoot_len < 139 then
            v385 = v6.cde.lerp(v385, 255, 20);
        end;
        render.shadow(vector(l_position_1.x + 5, l_position_1.y + 5), vector(l_position_1.x + l_size_1.x - 5, l_position_1.y + l_size_1.y - 5), color(213, 121, 121, l_alpha_0.backround(255)), 40, 0, 6);
        render.shadow(vector(l_position_1.x + 5, l_position_1.y + 5), vector(l_position_1.x + l_size_1.x - 5, l_position_1.y + l_size_1.y - 5), color(213, 121, 121, l_alpha_0.backround(255)), 40, 0, 6);
        render.shadow(vector(l_position_1.x + 5, l_position_1.y + 5), vector(l_position_1.x + l_size_1.x - 5, l_position_1.y + l_size_1.y - 5), color(v6.misc.accent.accent:get().r, v6.misc.accent.accent:get().g, v6.misc.accent.accent:get().b, l_alpha_0.backround(255)), 30, 0, 6);
        render.rect(vector(l_position_1.x + 5, l_position_1.y + 5), vector(l_position_1.x + l_size_1.x - 5, l_position_1.y + l_size_1.y - 5), color(20, 20, 20, l_alpha_0.backround(255)), 8);
        render.rect_outline(vector(l_position_1.x, l_position_1.y), vector(l_position_1.x + l_size_1.x, l_position_1.y + l_size_1.y), color(255, 255, 255, l_alpha_0.outline), 1, 8);
        render.line(vector(l_position_1.x + 6, l_position_1.y + 5), vector(l_position_1.x + l_size_1.x - l_alpha_0.shoot_len, l_position_1.y + 5), color(255, 255, 255, l_alpha_0.backround(v385)));
        render.line(vector(v244.x / 2, 0), vector(v244.x / 2, v244.y), color(255, 255, 255, l_alpha_0.screen));
        render.line(vector(0, v244.y / 2), vector(v244.x, v244.y / 2), color(255, 255, 255, l_alpha_0.screen));
        render.text(v1.comfortaa, vector(l_position_1.x + v391.lenght, l_position_1.y + l_size_1.y / 2 - 5), color(255, 255, 255, l_alpha_0.backround(255)), nil, v391.text);
    end);
    v110.watermark.run = l_drag_system_0.register({
        [1] = v110.watermark.x, 
        [2] = v110.watermark.y
    }, vector(300, 32), "Watermark", function(v392)
        -- upvalues: l_globals_0 (ref), v6 (ref), v0 (ref), l_mtools_0 (ref), l_string_0 (ref), l_common_0 (ref), l_ui_0 (ref), v110 (ref), v1 (ref), l_status_0 (ref), l_result_0 (ref)
        if l_globals_0.tickcount % 15 == 0 then
            v6.our.fps_clip = v0.run(function()
                -- upvalues: l_mtools_0 (ref)
                local v393 = l_mtools_0.Client.GetFPS();
                if tonumber(v393) > 999 then
                    return "1k+";
                elseif #tostring(v393) == 1 then
                    return tostring(v393) .. "  ";
                elseif #tostring(v393) == 2 then
                    return v393;
                elseif #tostring(v393) == 3 then
                    return tostring(v393) .. " ";
                else
                    return v393;
                end;
            end);
            v6.our.ping_clip = v0.run(function()
                -- upvalues: l_mtools_0 (ref)
                local v394 = l_mtools_0.Client.GetPing();
                if tonumber(v394) > 999 then
                    return "1k+";
                else
                    return v394;
                end;
            end);
        end;
        local l_x_2 = render.screen_size().x;
        local l_y_2 = render.screen_size().y;
        local v397 = color(v6.misc.accent.accent:get().r, v6.misc.accent.accent:get().g, v6.misc.accent.accent:get().b, v6.misc.accent.accent:get().a);
        local v398 = nil;
        v398 = {
            x = v392.position.x, 
            y = v392.position.y, 
            s = v392.size, 
            c = v397
        };
        local v399 = l_string_0.format("user: %s  |  fps: %s  |  ping: %s  |  time: %s", l_common_0.get_username():sub(0, 7), v6.our.fps_clip, v6.our.ping_clip, l_string_0.format("%s:%s", l_common_0.get_system_time().hours, l_common_0.get_system_time().minutes));
        if l_ui_0.get_alpha() > 0.8 and v6.cde.mouse_check(vector(v110.watermark.x:get(), v110.watermark.y:get()), vector(v110.watermark.x:get() + v392.size.x, v110.watermark.y:get() + v392.size.y)) and l_common_0.is_button_down(1) then
            v6.our.line_alpha = v6.cde.lerp(v6.our.line_alpha, 130, 5);
        else
            v6.our.line_alpha = v6.cde.lerp(v6.our.line_alpha, 0, 13);
        end;
        local l_x_3 = render.measure_text(v1.comfortaa, "", v399).x;
        v110.watermark.alpha.lenght = v6.cde.lerp(v110.watermark.alpha.lenght, l_x_3, 6);
        render.shadow(vector(v398.x + v398.s.y - 29, v398.y + 4), vector(v398.x + v398.s.y - 29, v398.y + v398.s.x / 7 - 14), color(213, 121, 121, 200), 40, 0, 6);
        render.shadow(vector(v398.x + v398.s.y + 15 + v110.watermark.alpha.lenght, v398.y + 4), vector(v398.x + v398.s.y + 15 + v110.watermark.alpha.lenght, v398.y + v398.s.x / 7 - 14), color(213, 121, 121, 200), 40, 0, 6);
        render.shadow(vector(v398.x + v398.s.y - 28, v398.y + 4), vector(v398.x + v398.s.y + 14 + v110.watermark.alpha.lenght, v398.y + v398.s.x / 7 - 14), v397, 30, 0, 6);
        render.rect(vector(v398.x + v398.s.y - 28, v398.y + 4), vector(v398.x + v398.s.y + 15 + v110.watermark.alpha.lenght, v398.y + v398.s.x / 7 - 14), color(20, 20, 20, 180), 8);
        render.rect_outline(vector(v398.x, v398.y), vector(v398.x + v398.s.x + (v110.watermark.alpha.lenght - 249), v398.y + v398.s.y), color(255, 255, 255, 100 * l_ui_0.get_alpha()), 1, 8);
        render.text(v1.comfortaa, vector(v398.x + v398.s.y + 5, v398.y + 11), color(), nil, v399);
        render.texture(l_status_0 and l_result_0 or "", vector(v398.x + v398.s.y - 24, v398.y + 7), vector(19, 19), color(), "f", 4);
        render.line(vector(l_x_2 / 2, 0), vector(l_x_2 / 2, l_y_2), color(255, 255, 255, v6.our.line_alpha));
        render.line(vector(0, l_y_2 / 2), vector(l_x_2, l_y_2 / 2), color(255, 255, 255, v6.our.line_alpha));
    end);
    local v401 = color(229, 72, 67, 255);
    local v402 = color(163, 194, 43);
    local function v416(...)
        -- upvalues: v1 (ref), v6 (ref)
        local v403 = render.screen_size().x / 100 + 9;
        local v404 = render.screen_size().y / 1.47;
        local function v409(v405, v406, v407)
            -- upvalues: v1 (ref), v403 (ref), v404 (ref)
            if not v406 then
                v406 = color();
            end;
            local v408 = render.measure_text(v1.calibri, "", v405);
            render.gradient(vector(v403 / 1.9, v404 + v407), vector(v403 / 1.9 + v408.x / 2 + 5, v404 + v407 + v408.y + 11), color(0, 0, 0, 0), color(0, 0, 0, 50), color(0, 0, 0, 0), color(0, 0, 0, 50));
            render.gradient(vector(v403 / 1.9 + v408.x / 2 + 5, v404 + v407), vector(v403 / 1.9 + v408.x + 40, v404 + v407 + v408.y + 11), color(0, 0, 0, 50), color(0, 0, 0, 0), color(0, 0, 0, 50), color(0, 0, 0, 0));
            render.text(v1.calibri, vector(v403, v404 + 8 + v407), v406, nil, v405);
        end;
        local function v415(v410, _, v412)
            -- upvalues: v6 (ref), v1 (ref), v403 (ref), v404 (ref)
            local v413 = color(v6.misc.accent.accent:get().r, v6.misc.accent.accent:get().g, v6.misc.accent.accent:get().b, v6.misc.accent.accent:get().a);
            local v414 = render.measure_text(v1.calibri, "", v410);
            render.shadow(vector(v403 / 1.9 + 4, v404 + v412), vector(v403 / 1.9 + 4, v404 + v412 + v414.y + 13), v413, 30, 0, 6);
            render.rect(vector(v403 / 1.9 + 4, v404 + v412), vector(v403 / 1.9 + 4, v404 + v412 + v414.y + 13), v413, 6);
            render.text(v1.calibri, vector(v403, v404 + 8 + v412), v413, nil, v410);
        end;
        if v6.misc.visual.leftindicator_style:get() == "500$" then
            return v409(...);
        else
            return v415(...);
        end;
    end;
    v6.misc.visual.leftindicator:set_event("render", function()
        -- upvalues: l_globals_0 (ref), l_entity_0 (ref), l_ui_0 (ref), v6 (ref), v416 (ref), v3 (ref), l_rage_0 (ref), v401 (ref), v402 (ref)
        if l_globals_0.is_connected and l_entity_0.get_local_player() then
            local v417 = l_ui_0.get_binds();
            local v418 = 45;
            for v419 in pairs(v417) do
                if v6.misc.visual.leftindicator_settings:get("Minimum damage") and v417[v419].name == "Min. Damage" and v417[v419].active then
                    v416("MD", color(), v418);
                    v418 = v418 - 35;
                end;
            end;
            if v6:ready(v3[1].dormantaimbot) and v6.misc.visual.leftindicator_settings:get("Dormant aimbot") then
                v416("DA", color(), v418);
                v418 = v418 - 35;
            end;
            if v6.misc.visual.leftindicator_settings:get("Auto peek") and v6:ready(v3[1].peek_assist) then
                v416("AP", color(), v418);
                v418 = v418 - 35;
            end;
            if v6.misc.visual.leftindicator_settings:get("On shot antiaim") and v6:ready(v3[1].onshot) then
                v416("OS", l_rage_0.exploit:get() == 1 and color() or v401, v418);
                v418 = v418 - 35;
            end;
            if v6.misc.visual.leftindicator_settings:get("Double tap") and v6:ready(v3[1].doubletap) then
                v416("DT", l_rage_0.exploit:get() == 1 and color() or v401, v418);
                v418 = v418 - 35;
            end;
            if v6.misc.visual.leftindicator_settings:get("Extended backtrack") and v6.misc.misc.unlocklatency:get() and v6.misc.misc.unlocklatency_spike:get() > 0 then
                v416("EXB", color(), v418);
                v418 = v418 - 35;
            end;
            if v6.misc.visual.leftindicator_settings:get("Override resolver") and v3[1].override_resolver:get() then
                v416("OR", color(), v418);
                v418 = v418 - 35;
            end;
            if v6.misc.visual.leftindicator_settings:get("Fake duck") and v6:ready(v3[2].fakeduck) then
                v416("FD", color(), v418);
                v418 = v418 - 35;
            end;
            if v6.misc.visual.leftindicator_settings:get("SLow walk") and v6:ready(v3[2].slowwalk) then
                v416("SW", color(), v418);
                v418 = v418 - 35;
            end;
            if v6.misc.visual.leftindicator_settings:get("Freestanding") and v6:ready(v3[2].freestand) then
                v416("FS", color(), v418);
                v418 = v418 - 35;
            end;
            if v6.misc.visual.leftindicator_settings:get("Edge jump") and v6:ready(v3[3].edge_jump) then
                v416("EJ", color(), v418);
                v418 = v418 - 35;
            end;
            if v6.misc.visual.leftindicator_settings:get("Fake ping") and v3[3].fake_latency:get() > 0 then
                v416("PING", v402, v418);
                v418 = v418 - 35;
            end;
            if v6.misc.visual.leftindicator_settings:get("Thirdperson") and v6:ready(v3[4].thirdperson) then
                v416("TP", color(), v418);
                v418 = v418 - 35;
            end;
            if v6.misc.visual.leftindicator_settings:get("Is defensive") then
                v416("READY", color(), v418);
                v418 = v418 - 35;
            end;
        end;
    end);
    v6.events.visual = function(_)
        -- upvalues: l_entity_0 (ref), v8 (ref), v6 (ref), l_ui_0 (ref)
        if l_entity_0.get_local_player() and v8.pstat and l_entity_0.get_local_player():is_alive() then
            local v421 = v8.pstat.break_antiaim:get();
            if v6.antiaim.settings.exploits.fakeflick:get() == "Default" or v421 then
                v6.our.break_aa = l_entity_0.get_local_player().m_nTickBase;
            end;
        end;
        if l_ui_0.get_alpha() == 1 then
            l_ui_0.sidebar(v6.cde.gradient("\240\157\146\158\240\157\144\184\240\157\144\191\240\157\144\184\240\157\146\174\240\157\146\175\240\157\144\188\240\157\146\176\240\157\145\128", color(204, 204, 255, 255), color(204, 204, 255, 0), 2), v6.cde.get_icon("star-shooting"));
        end;
    end;
    local v422 = nil;
    v422 = {
        global = l_pui_0.setup({
            [1] = v6.misc, 
            [2] = v6.antiaim.builder
        }, true), 
        antiaim = l_pui_0.setup({
            [1] = v6.antiaim.builder
        }, true)
    };
    v6.menu.home_2_e:label("\a474747CEAll:"):depend({
        [1] = nil, 
        [2] = 1, 
        [1] = v6.menu.items.home_sidebar
    });
    do
        local l_v422_0 = v422;
        v6.menu.items.home_sidebar_export_cfg = v6.menu.home_2_e:button(v6:string_ext("file-export") .. "    Export      ", function()
            -- upvalues: v6 (ref), l_v422_0 (ref), v0 (ref), l_table_0 (ref), l_math_0 (ref), l_clipboard_0 (ref)
            local v427 = "[celestium ~ alpha]" .. v6.cde.algorithm(json.stringify(l_v422_0.global:save()), "e") .. "[" .. v0.run(function()
                -- upvalues: v6 (ref), l_table_0 (ref), l_math_0 (ref)
                local v424 = json.stringify(v6.database.antiaim_builder);
                local v425 = {};
                for v426 = 1, #v424 do
                    l_table_0.insert(v425, l_math_0.deg(v424:sub(v426, v426):byte() / 0.793289523));
                end;
                return l_table_0.concat(v425);
            end) .. "]";
            l_clipboard_0.set(v427);
            v6.cde.add_notify("Your config was copied successfully", "celestium");
        end, true):depend({
            [1] = nil, 
            [2] = 1, 
            [1] = v6.menu.items.home_sidebar
        });
        v6.menu.items.home_sidebar_import_cfg = v6.menu.home_2_e:button(v6:string_ext("file-import") .. "    Import      ", function()
            -- upvalues: l_clipboard_0 (ref), l_string_0 (ref), v6 (ref), v0 (ref), l_v422_0 (ref)
            local v428 = l_clipboard_0.get();
            local v429, _ = l_string_0.find(v428, "celestium ~ alpha");
            if not v429 then
                v6.cde.add_notify("Your settings are corrupted or you are trying to transfer an incorrect config. please check again");
                return;
            else
                local v434 = v0.run(function(v431)
                    local v432 = v431:find("%[");
                    if not v432 then
                        return v431;
                    else
                        local v433 = v431:find("%[", v432 + 1);
                        if v433 then
                            return v431:sub(1, v433 - 1);
                        else
                            return v431;
                        end;
                    end;
                end, v428):gsub("%[celestium ~ alpha%]", "");
                local v435 = v6.cde.algorithm(v434, "d");
                local l_status_10, _ = pcall(function()
                    -- upvalues: v435 (ref), l_v422_0 (ref)
                    if v435 ~= "broken" then
                        return l_v422_0.global:load(json.parse(v435));
                    else
                        return nil;
                    end;
                end);
                if l_status_10 then
                    v6.cde.add_notify("Your config was imported successfully");
                else
                    v6.cde.add_notify("Your settings are corrupted or you are trying to transfer an incorrect config. please check again");
                end;
                return;
            end;
        end, true):depend({
            [1] = nil, 
            [2] = 1, 
            [1] = v6.menu.items.home_sidebar
        });
        v6.menu.home_2_e:label("\a474747CEAa:"):depend({
            [1] = nil, 
            [2] = 1, 
            [1] = v6.menu.items.home_sidebar
        });
        v6.menu.items.home_sidebar_export__antiaim_cfg = v6.menu.home_2_e:button(v6:string_ext("file-export") .. "     Export     \n", function()
            -- upvalues: v6 (ref), l_v422_0 (ref), v0 (ref), l_table_0 (ref), l_math_0 (ref), l_clipboard_0 (ref)
            local v441 = "[celestium ~ alpha]" .. v6.cde.algorithm(json.stringify(l_v422_0.antiaim:save()), "e") .. "[" .. v0.run(function()
                -- upvalues: v6 (ref), l_table_0 (ref), l_math_0 (ref)
                local v438 = json.stringify(v6.database.antiaim_builder);
                local v439 = {};
                for v440 = 1, #v438 do
                    l_table_0.insert(v439, l_math_0.deg(v438:sub(v440, v440):byte() / 0.793289523));
                end;
                return l_table_0.concat(v439);
            end) .. "]";
            l_clipboard_0.set(v441);
            v6.cde.add_notify("Your config was copied successfully", "celestium\t");
        end, true):depend({
            [1] = nil, 
            [2] = 1, 
            [1] = v6.menu.items.home_sidebar
        });
        v6.menu.items.home_sidebar_import__antiaim_cfg = v6.menu.home_2_e:button(v6:string_ext("file-import") .. "     Import     \n", function()
            -- upvalues: l_clipboard_0 (ref), l_string_0 (ref), v6 (ref), v0 (ref), l_v422_0 (ref)
            local v442 = l_clipboard_0.get();
            local v443, _ = l_string_0.find(v442, "celestium ~ alpha");
            if not v443 then
                v6.cde.add_notify("Your settings are corrupted or you are trying to transfer an incorrect config. please check again");
                return;
            else
                local v448 = v0.run(function(v445)
                    local v446 = v445:find("%[");
                    if not v446 then
                        return v445;
                    else
                        local v447 = v445:find("%[", v446 + 1);
                        if v447 then
                            return v445:sub(1, v447 - 1);
                        else
                            return v445;
                        end;
                    end;
                end, v442):gsub("%[celestium ~ alpha%]", "");
                local v449 = v6.cde.algorithm(v448, "d");
                local l_status_11, _ = pcall(function()
                    -- upvalues: v449 (ref), l_v422_0 (ref)
                    if v449 ~= "broken" then
                        return l_v422_0.antiaim:load(json.parse(v449));
                    else
                        return nil;
                    end;
                end);
                if l_status_11 then
                    v6.cde.add_notify("Your config was imported successfully");
                else
                    v6.cde.add_notify("Your settings are corrupted or you are trying to transfer an incorrect config. please check again");
                end;
                return;
            end;
        end, true):depend({
            [1] = nil, 
            [2] = 1, 
            [1] = v6.menu.items.home_sidebar
        });
        v6:new_tooltip(v6.menu.items.home_sidebar_export_cfg, "Export all configuration", 1);
        v6:new_tooltip(v6.menu.items.home_sidebar_import_cfg, "Import all configuration", 1);
        v6:new_tooltip(v6.menu.items.home_sidebar_export__antiaim_cfg, "Export antiaim configuration", 1);
        v6:new_tooltip(v6.menu.items.home_sidebar_import__antiaim_cfg, "Import antiaim configuration", 1);
    end;
    v6.misc.animation.extended:set_event("post_update_clientside_animation", function()
        -- upvalues: v6 (ref), l_entity_0 (ref), v307 (ref)
        local v452 = v6.misc.animation.extended:get();
        if l_entity_0.get_local_player() and l_entity_0.get_local_player():is_alive() then
            local v453 = v307(l_entity_0.get_local_player():get_index());
            if v452 == "Earth quake 2" then
                ffi.cast("animstate_layer_t**", ffi.cast("uintptr_t", v453) + 10640)[0][9].m_flCycle = 61;
                ffi.cast("animstate_layer_t**", ffi.cast("uintptr_t", v453) + 10640)[0][9].m_flWeight = 6;
                ffi.cast("animstate_layer_t**", ffi.cast("uintptr_t", v453) + 10640)[0][9].m_nSequence = 232;
            elseif v452 == "T Pose" then
                ffi.cast("animstate_layer_t**", ffi.cast("uintptr_t", v453) + 10640)[0][9].m_flWeight = 1;
                ffi.cast("animstate_layer_t**", ffi.cast("uintptr_t", v453) + 10640)[0][9].m_nSequence = 11;
            elseif v452 == "Alien" then
                ffi.cast("animstate_layer_t**", ffi.cast("uintptr_t", v453) + 10640)[0][9].m_flWeight = 20;
                ffi.cast("animstate_layer_t**", ffi.cast("uintptr_t", v453) + 10640)[0][9].m_nSequence = 264;
            elseif v452 == "Freeze" then
                ffi.cast("animstate_layer_t**", ffi.cast("uintptr_t", v453) + 10640)[0][9].m_flWeight = 20;
                ffi.cast("animstate_layer_t**", ffi.cast("uintptr_t", v453) + 10640)[0][9].m_nSequence = 26;
            elseif v452 == "Flash" then
                ffi.cast("animstate_layer_t**", ffi.cast("uintptr_t", v453) + 10640)[0][9].m_flWeight = 1;
                ffi.cast("animstate_layer_t**", ffi.cast("uintptr_t", v453) + 10640)[0][9].m_nSequence = 224;
            elseif v452 == "Static" then
                ffi.cast("animstate_layer_t**", ffi.cast("uintptr_t", v453) + 10640)[0][9].m_flWeight = 20;
                ffi.cast("animstate_layer_t**", ffi.cast("uintptr_t", v453) + 10640)[0][9].m_nSequence = 14;
            end;
        end;
    end, function(v454)
        return v454:get() ~= "Disabled";
    end);
    v6.misc.animation.aero:set_event("post_update_clientside_animation", function()
        -- upvalues: v6 (ref), l_entity_0 (ref), l_rage_0 (ref), l_globals_0 (ref)
        local v455 = v6.misc.animation.aero:get();
        if l_entity_0.get_local_player() and l_entity_0.get_local_player():is_alive() then
            if v455 == "Static" then
                if v6.misc.animation.forcestatic:get() then
                    if v6.our.is_defensive ~= true or l_rage_0.exploit:get() < 1 then
                        v6:set_param(6, 1);
                    else
                        v6:set_param(6, 0);
                    end;
                else
                    v6:set_param(6, 1);
                end;
            elseif v455 == "Jitter" then
                v6:set_param(6, l_globals_0.tickcount % 4 >= 2 and 1 or 0);
            elseif v455 == "Random" then
                v6:set_param(6, v6.cde.random_float(0, 1));
            end;
        end;
    end, function(v456)
        return v456:get() ~= "Disabled";
    end);
    v6.misc.animation.ground:set_event("post_update_clientside_animation", function()
        -- upvalues: v6 (ref), l_entity_0 (ref), l_globals_0 (ref)
        local v457 = v6.misc.animation.ground:get();
        if l_entity_0.get_local_player() and l_entity_0.get_local_player():is_alive() then
            if v457 == "Static" then
                v6:set_param(0, 1);
            elseif v457 == "Jitter" then
                v6:set_param(0, l_globals_0.tickcount % 4 > 1 and 0.5 or 1);
            elseif v457 == "Random" then
                v6:set_param(0, v6.cde.random_float(0, 1));
            elseif v457 == "Moonwalk" then
                v6:set_param(7, 1);
            end;
        end;
    end, function(v458)
        return v458:get() ~= "Disabled";
    end);
    v34:new("post_update_clientside_animation", function()
        -- upvalues: v6 (ref), l_entity_0 (ref), v307 (ref), v3 (ref), l_math_0 (ref)
        local l_other_0 = v6.misc.animation.other;
        if l_entity_0.get_local_player() and l_entity_0.get_local_player():is_alive() then
            local v460 = v307(l_entity_0.get_local_player():get_index());
            if l_other_0:get("Reset pitch on land") and (v6.our.resetpitch > 5 and v6.our.resetpitch < 65 or v6.our.is_fs_anim == true) then
                v6:set_param(12, 0.5);
            end;
            if l_other_0:get("Move lean") and v6.cde.velocity() > 3 and v3[2].slowwalk:get() == false then
                ffi.cast("animstate_layer_t**", ffi.cast("uintptr_t", v460) + 10640)[0][12].m_flWeight = v6.misc.animation.other_moveleanlimit:get() / 100;
            end;
            if l_other_0:get("Earth quake") then
                ffi.cast("animstate_layer_t**", ffi.cast("uintptr_t", v460) + 10640)[0][12].m_flWeight = l_math_0.random(0, 100) / 100;
            end;
            if l_other_0:get("Kangaroo") then
                v6:set_param(6, v6.cde.random_float(0, 1));
                v6:set_param(10, v6.cde.random_float(0, 1));
                v6:set_param(9, v6.cde.random_float(0, 1));
            end;
            if l_other_0:get("Skeet legs") and v3[1].peek_assist:get() then
                v6:set_param(0, 0.6);
            end;
        end;
    end, "animlayer");
    v6.misc.visual.removals.oldmap:set_callback(function(v461)
        -- upvalues: l_cvar_0 (ref)
        if v461:get() then
            l_cvar_0.cl_foot_contact_shadows:int(0);
        else
            l_cvar_0.cl_foot_contact_shadows:int(1);
        end;
    end);
    v34:new({
        v6.misc.misc.movement.settings, 
        v3[3].airstrafe_smooth, 
        v6.misc.misc.movement.settings:get("Automatic strafe smoothing")
    }, "automatic_strafe");
    v34:new({
        v6.misc.visual.thirdperson, 
        v3[4].thirdperson_dist, 
        v6.misc.visual.thirdperson:get()
    }, "thirdperson");
    v34:new({
        [1] = v6.misc.misc.movement.settings, 
        [2] = v3[3].airstrafe, 
        [3] = v6.misc.misc.movement.settings:get("Jump scout") or v3[2].slowwalk:get() or v3[2].slowwalk:get_override()
    }, "jumpscout");
    v6.misc.visual.viewmodel_bob:set_callback(function(v462)
        -- upvalues: l_cvar_0 (ref)
        if not v462:get() then
            l_cvar_0.cl_bob_lower_amt:float(5);
            l_cvar_0.cl_bobamt_lat:float(0.1);
            l_cvar_0.cl_bobamt_vert:float(0.14);
            l_cvar_0.cl_bobcycle:float(0.98);
            l_cvar_0.cl_viewmodel_shift_left_amt:float(1.5);
            l_cvar_0.cl_viewmodel_shift_right_amt:float(0.75);
            l_cvar_0.cl_wpn_sway_interp:float(1);
            l_cvar_0.cl_wpn_sway_scale:float(1);
            l_cvar_0.cl_bobup:float(0.5);
            l_cvar_0.cl_bob_version:float(1);
            l_cvar_0.cam_idealdist:float(40);
            l_cvar_0.cam_idealpitch:float(-3);
            l_cvar_0.cam_idealyaw:float(0);
            l_cvar_0.cl_use_new_headbob:float(1);
        end;
    end);
    v6.misc.visual.thirdperson:set_event("createmove", function(_)
        -- upvalues: v6 (ref), l_entity_0 (ref), v3 (ref), l_math_0 (ref)
        local v464 = v6.misc.visual.thirdperson_distance:get();
        if not l_entity_0.get_local_player() or not v6.misc.visual.thirdperson:get() or not v3[4].thirdperson:get() then
            v3[4].thirdperson_dist:override();
            v6.our.thirdperson = 15;
        elseif v3[4].thirdperson:get() then
            local v465 = v6.misc.visual.thirdperson_speed:get();
            local v466 = (v464 - v6.our.thirdperson) / l_math_0.floor(v465 / 3);
            v6.our.thirdperson = v6.our.thirdperson + (v6.our.thirdperson < v464 and v466 or -v466);
            v6.our.thirdperson = v464 < v6.our.thirdperson and v464 or v6.our.thirdperson;
            v3[4].thirdperson_dist:override(v6.our.thirdperson);
        end;
    end);
    v6.misc.misc.movement.settings:set_event("createmove", function(v467)
        -- upvalues: l_entity_0 (ref), l_utils_0 (ref)
        local v468 = l_entity_0.get_local_player():get_origin();
        if l_entity_0.get_local_player().m_vecVelocity.z <= -500 then
            if l_utils_0.trace_line(vector(v468.x, v468.y, v468.z), vector(v468.x, v468.y, v468.z - 20)).fraction ~= 1 then
                v467.in_duck = 0;
            elseif l_utils_0.trace_line(vector(v468.x, v468.y, v468.z), vector(v468.x, v468.y, v468.z - 50)).fraction ~= 1 then
                v467.in_duck = 1;
            end;
        end;
    end, function(v469)
        return v469:get("No fall damage");
    end);
    v6.misc.misc.movement.settings:set_event("createmove", function(v470)
        -- upvalues: l_entity_0 (ref), l_math_0 (ref)
        if l_entity_0.get_local_player().m_MoveType == 9 then
            v470.view_angles.y = l_math_0.floor(v470.view_angles.y + 0.5);
            if v470.forwardmove > 0 then
                if v470.view_angles.x < 45 then
                    v470.view_angles.x = 89;
                    v470.in_moveright = 1;
                    v470.in_moveleft = 0;
                    v470.in_forward = 0;
                    v470.in_back = 1;
                    if v470.sidemove == 0 then
                        v470.view_angles.y = v470.view_angles.y + 90;
                    end;
                    if v470.sidemove < 0 then
                        v470.view_angles.y = v470.view_angles.y + 150;
                    end;
                    if v470.sidemove > 0 then
                        v470.view_angles.y = v470.view_angles.y + 30;
                    end;
                end;
            elseif v470.forwardmove < 0 then
                v470.view_angles.x = 89;
                v470.in_moveleft = 1;
                v470.in_moveright = 0;
                v470.in_forward = 1;
                v470.in_back = 0;
                if v470.sidemove == 0 then
                    v470.view_angles.y = v470.view_angles.y + 90;
                end;
                if v470.sidemove > 0 then
                    v470.view_angles.y = v470.view_angles.y + 150;
                end;
                if v470.sidemove < 0 then
                    v470.view_angles.y = v470.view_angles.y + 30;
                end;
            end;
        end;
    end, function(v471)
        return v471:get("Fast ladder");
    end);
    v6.misc.misc.movement.settings:set_event("createmove", function(_)
        -- upvalues: v6 (ref), v3 (ref), l_math_0 (ref)
        local v473 = v6.cde.velocity() / 5;
        v3[3].airstrafe_smooth:override(l_math_0.min(100, 100 - v473 + 0));
    end, function(v474)
        return v474:get("Automatic strafe smoothing");
    end);
    v6.misc.misc.unlocklatency:set_event("createmove", function(_)
        -- upvalues: l_cvar_0 (ref), v3 (ref), v6 (ref)
        l_cvar_0.sv_maxunlag:float(1);
        v3[3].fake_latency:override(v6.misc.misc.unlocklatency_spike:get());
    end);
    v6.misc.misc.unlocklatency:set_callback(function(v476)
        -- upvalues: l_cvar_0 (ref), v3 (ref)
        if not v476:get() then
            l_cvar_0.sv_maxunlag:float(0.2);
            v3[3].fake_latency:override();
        end;
    end);
    v6.misc.misc.adaptive_silent:set_event("createmove", function(_)
        -- upvalues: l_math_0 (ref), v6 (ref), v3 (ref)
        local v478 = l_math_0.random(0, 100) < l_math_0.floor(v6.misc.misc.adaptive_silent_first:get() / 1.5);
        local l_silent_aim_0 = v3[1].silent_aim;
        local l_l_silent_aim_0_0 = l_silent_aim_0;
        l_silent_aim_0 = l_silent_aim_0.override;
        if v6.misc.misc.adaptive_silent:get() == false then

        end;
        l_silent_aim_0(l_l_silent_aim_0_0, v478);
    end);
    v6.misc.misc.adaptive_silent:set_callback(function(v481)
        -- upvalues: v3 (ref)
        if not v481:get() then
            v3[1].silent_aim:override();
        end;
    end);
    v6.misc.rage.faster_prediction:set_event("createmove", function(_)
        -- upvalues: v8 (ref), l_mtools_0 (ref), l_cvar_0 (ref)
        v8.diff = {
            polate = 1, 
            ratio = 1, 
            interp = 0.031
        };
        local v483 = tonumber(l_mtools_0.Client.GetPing()) or 0;
        if v483 < 50 then
            v8.diff.polate = 0;
            v8.diff.interp = 0.016;
            v8.diff.ratio = 1;
        elseif v483 >= 50 then
            v8.diff.polate = 0;
            v8.diff.interp = 0.031;
            v8.diff.ratio = 1;
        end;
        l_cvar_0.cl_interpolate:int(v8.diff.polate);
        l_cvar_0.cl_interp:float(v8.diff.interp);
        l_cvar_0.cl_interp_ratio:int(v8.diff.ratio);
    end);
    v6.misc.rage.faster_prediction:set_callback(function(v484)
        -- upvalues: l_cvar_0 (ref)
        if not v484:get() then
            l_cvar_0.cl_interpolate:int(0);
            l_cvar_0.cl_interp:float(0.031);
            l_cvar_0.cl_interp_ratio:int(1);
        end;
    end);
    v6.misc.rage.idealtick:set_event("createmove", function(_)
        -- upvalues: l_globals_0 (ref), l_entity_0 (ref), v6 (ref), v3 (ref), l_ui_0 (ref), l_rage_0 (ref)
        local v486 = {
            [0] = l_globals_0.curtime - l_entity_0.get_local_player():get_player_weapon().m_fLastShotTime, 
            [1] = l_entity_0.get_threat(true), 
            [2] = l_entity_0.get_threat(true) and l_globals_0.curtime % 2 or 99
        };
        if v6.misc.rage.idealtick_ospeek:get() then
            if v3[1].onshot:get() and v6:ready(v3[1].peek_assist) then
                v3[1].onshot_setting:override("Break LC");
                if v486[0] >= 0.2 and v486[0] <= 0.45 then
                    v3[1].onshot:override(false);
                else
                    v3[1].onshot:override();
                end;
            else
                v3[1].onshot_setting:override();
            end;
        else
            v3[1].onshot_setting:override();
        end;
        if v6:ready(v3[1].peek_assist) and v6.misc.rage.idealtick_teleport:get() ~= "Default" then
            v6.our.is_idealtick = true;
            if v6.misc.rage.idealtick_teleport:get() == "Slow" then
                l_ui_0.find("Aimbot", "Ragebot", "Main", "Double Tap", "Immediate Teleport"):set(false);
                v6:procces_tick(20);
                if v486[2] < 0.43 then
                    v3[1].doubletap_fakelag:override(8);
                else
                    v3[1].doubletap_fakelag:override(1);
                    l_rage_0.exploit:force_charge();
                end;
            elseif v6.misc.rage.idealtick_teleport:get() == "Faster" then
                l_ui_0.find("Aimbot", "Ragebot", "Main", "Double Tap", "Immediate Teleport"):set(true);
                v6:procces_tick(20);
                if v486[1] then
                    v3[2].fakelag_limit:override(0);
                    v3[2].fakelag_enablled:override(false);
                end;
                if not v486[1] and v486[0] > 0.3 and v486[0] < 0.7 then
                    l_rage_0.exploit:force_charge();
                end;
            elseif v6.misc.rage.idealtick_teleport:get() == "Celestium" then
                v6:procces_tick(20);
                l_ui_0.find("Aimbot", "Ragebot", "Main", "Double Tap", "Immediate Teleport"):set(false);
                v3[1].doubletap_fakelag:override(v486[2] < 0.2 and 6 or 1);
                if v486[0] >= 0.1 and v486[0] <= 0.18 then
                    l_rage_0.exploit:force_charge();
                elseif v486[0] >= 0.18 and v486[0] <= 0.23 then
                    l_rage_0.exploit:force_teleport();
                end;
                if l_rage_0.exploit:get() < 0.8 and l_rage_0.exploit:get() > 0 then
                    l_rage_0.exploit:force_teleport();
                end;
            end;
        else
            v6.our.is_idealtick = false;
            v3[1].doubletap_fakelag:override();
            if v6.misc.rage.faster_doubletap:get() then
                v6:procces_tick(20);
            else
                v6:procces_tick();
            end;
        end;
        if v6.misc.rage.idealtick:get() and v6.misc.rage.idealtick_fastshoot:get() and v6:ready(v3[1].peek_assist) then
            v3[1].doubletap_fastp:override(true);
            v3[2].fakelag_limit:override(14);
            v3[1].ssg_hc:override(24);
        else
            v3[1].doubletap_fastp:override();
        end;
    end);
    v6.misc.rage.idealtick:set_callback(function(v487)
        -- upvalues: v3 (ref), v6 (ref)
        if not v487:get() then
            v3[1].doubletap_fakelag:override();
            v6:procces_tick();
            v3[1].doubletap_fastp:override();
            v3[1].onshot:override();
            v3[1].onshot_setting:override();
        end;
    end);
    v6.misc.visual.viewmodel:set_callback(function(v488)
        -- upvalues: l_cvar_0 (ref)
        if not v488:get() then
            l_cvar_0.viewmodel_fov:int(68);
            l_cvar_0.viewmodel_offset_x:float(2.5);
            l_cvar_0.viewmodel_offset_y:float(0);
            l_cvar_0.viewmodel_offset_z:float(-1.5);
            l_cvar_0.cl_bob_lower_amt:float(5);
            l_cvar_0.cl_bobamt_lat:float(0.1);
            l_cvar_0.cl_bobamt_vert:float(0.14);
            l_cvar_0.cl_bobcycle:float(0.98);
            l_cvar_0.cl_viewmodel_shift_left_amt:float(1.5);
            l_cvar_0.cl_viewmodel_shift_right_amt:float(0.75);
            l_cvar_0.cl_wpn_sway_interp:float(1);
            l_cvar_0.cl_wpn_sway_scale:float(1);
            l_cvar_0.cl_bobup:float(0.5);
            l_cvar_0.cl_bob_version:float(1);
            l_cvar_0.cam_idealdist:float(40);
            l_cvar_0.cam_idealpitch:float(-3);
            l_cvar_0.cam_idealyaw:float(0);
            l_cvar_0.cl_use_new_headbob:float(1);
        end;
    end);
    v34:new({
        v6.misc.rage.inair_stop, 
        function()
            -- upvalues: v3 (ref)
            v3[1].deagle_autostop:override();
            v3[1].ssg_autostop:override();
            v3[1].awp_autostop:override();
            v3[1].autosniper_autostop:override();
            v3[1].shotgun_autostop:override();
            v3[1].smg_autostop:override();
        end, 
        v6.misc.rage.inair_stop:get()
    }, "inair_stop");
    v34:new({
        v6.misc.rage.teleport, 
        v3[1].doubletap, 
        v6.misc.rage.teleport:get()
    }, "doubletap_tep");
    v34:new({
        v6.misc.rage.force_states, 
        function()
            -- upvalues: v3 (ref)
            v3[1].safepoints:override();
            v3[1].bodyaims:override();
            v3[1].hitboxes:override();
        end, 
        v6.misc.rage.force_states:get()
    }, "force_states");
    v34:new({
        v6.misc.rage.force_states_safepoint, 
        v3[1].safepoints, 
        v6.misc.rage.force_states_safepoint:get()
    }, "force_safepoint");
    v34:new({
        v6.misc.rage.force_states_shot, 
        function()
            -- upvalues: v3 (ref)
            v3[1].hitchances:override();
            v3[1].mindamages:override();
        end, 
        v6.misc.rage.force_states_shot:get()
    }, "force_shot");
    v34:new({
        v6.misc.rage.force_states_avoidlegs, 
        v3[1].hitboxes, 
        v6.misc.rage.force_states_avoidlegs:get()
    }, "hitbox_disabler");
    v34:new({
        v6.misc.rage.force_states_bodyaim, 
        v3[1].bodyaims, 
        v6.misc.rage.force_states_bodyaim:get()
    }, "force_boddyaim");
    v6.misc.misc.shared.items:set_callback(function(v489)
        -- upvalues: l_common_0 (ref)
        if not v489:get("Clantag") then
            l_common_0.set_clan_tag(" ");
        end;
    end);
    v422 = nil;
    v422 = {
        state = "", 
        flag = "c", 
        loc = v6:new(0), 
        alpha = {
            sp = v6:new(0), 
            dt = v6:new(0), 
            os = v6:new(0), 
            ap = v6:new(0), 
            fs = v6:new(0), 
            fd = v6:new(0), 
            md = v6:new(0)
        }, 
        name = {
            [1] = {
                value = true, 
                Doubletap = "DT"
            }, 
            [2] = {
                Hideshots = "OS", 
                value = true
            }, 
            [3] = {
                value = true, 
                Autopeek = "AP"
            }, 
            [4] = {
                value = true, 
                Freestanding = "FS"
            }, 
            [5] = {
                Fakeduck = "FD", 
                value = true
            }
        }
    };
    v6.misc.visual.crosshair_indicator:set_event("render", function()
        -- upvalues: v6 (ref), l_entity_0 (ref), v422 (ref), v3 (ref), l_rage_0 (ref), v8 (ref), l_string_0 (ref)
        local v490 = v6.misc.visual.crosshair_indicator_textstyle:get();
        local v491 = v490 == "Default" and "\240\157\146\158 \240\157\144\184 \240\157\144\191 \240\157\144\184 \240\157\146\174 \240\157\146\175 \240\157\144\188 \240\157\146\176 \240\157\145\128" or v490 == "Minimized" and "c e l e s t i u m" or "CELESTIUM";
        local v492 = v6.cde.gradient(v491, color(0, 0, 0, 0), color(v6.misc.visual.crosshair_indicator_color:get().r, v6.misc.visual.crosshair_indicator_color:get().g, v6.misc.visual.crosshair_indicator_color:get().b, v6.misc.visual.crosshair_indicator_color:get().a), 2.5);
        local v493 = render.screen_size().y / 2 + 19;
        local v494 = render.screen_size().x / 2;
        if l_entity_0.get_local_player() then
            v422.no_lerp = 17;
            v422.name[3].value = v6:ready(v3[1].peek_assist);
            v422.name[4].value = v6.antiaim.settings.binds.freestanding:get();
            v422.name[5].value = v6:ready(v3[2].fakeduck);
            v422.name[1].value = v6:ready(v3[1].doubletap) and not v422.name[5].value;
            v422.name[2].value = v6:ready(v3[1].onshot) and not v422.name[5].value;
            v422.alpha.dt:lerp(l_rage_0.exploit:get(), 10);
            v422.alpha.os:lerp(l_rage_0.exploit:get(), 10);
            v422.alpha.ap:lerp(v422.name[3].value and 1 or 0, 10);
            v422.alpha.fs:lerp(v422.name[4].value and 1 or 0, 10);
            v422.alpha.fd:lerp(v422.name[5].value and 1 or 0, 10);
            v422.state = v6.database.config.states.states[v8.GET_AA_STATE];
            if l_entity_0.get_local_player().m_bIsScoped or l_entity_0.get_local_player().m_bResumeZoom then
                v422.alpha.sp:lerp(20, 7);
                v494 = v494 + v422.alpha.sp.value;
                v422.flag = "s";
            else
                v422.alpha.sp:lerp(0, 7);
                v494 = v494 + v422.alpha.sp.value;
                v422.flag = "c";
            end;
            render.shadow(vector(v494 + (v422.flag == "s" and 28 or 0), v493 + (v422.flag == "s" and 10 or 0)), vector(v494 + (v422.flag == "s" and 28 or 0), v493 + (v422.flag == "s" and 10 or 0)), color(255, 255, 255, 180), 130, 1, 10);
            render.text(4, vector(v494, v493), color(255), v422.flag, v492);
            render.text(2, vector(v494, v493 + 13), color(255, 255, 255, 220), v422.flag, "\227\131\187 " .. l_string_0.upper(v422.state or "global") .. " \227\131\187");
            local function v499(v495, v496, v497, v498)
                -- upvalues: v422 (ref), v494 (ref), v493 (ref), l_rage_0 (ref)
                if v495.value and v496 then
                    v422.no_lerp = v422.no_lerp + 9.5;
                    render.text(2, vector(v494, v493 + v422.no_lerp), l_rage_0.exploit:get() == 1 and color(255, 255, 255, v497 * 200) or color(232, 94, 94, v497 * 200), v422.flag, v498);
                end;
            end;
            v499(v422.name[1], v6.misc.visual.crosshair_indicator_items:get("Doubletap"), v422.alpha.dt.value, v422.name[1].Doubletap);
            v499(v422.name[2], v6.misc.visual.crosshair_indicator_items:get("Hideshots"), v422.alpha.os.value, v422.name[2].Hideshots);
            v499(v422.name[3], v6.misc.visual.crosshair_indicator_items:get("Autopeek"), v422.alpha.ap.value, v422.name[3].Autopeek);
            v499(v422.name[4], v6.misc.visual.crosshair_indicator_items:get("Freestanding"), v422.alpha.fs.value, v422.name[4].Freestanding);
            v499(v422.name[5], v6.misc.visual.crosshair_indicator_items:get("Fakeduck"), v422.alpha.fd.value, v422.name[5].Fakeduck);
        end;
    end);
    v6.misc.rage.indicator:set_event("render", function()
        -- upvalues: v110 (ref)
        v110.indicator.run:update();
    end);
    v6.misc.visual.solus.items:set_event("render", function()
        -- upvalues: v110 (ref)
        v110.defensive.run:update();
    end, function(v500)
        return v500:get("Defensive");
    end);
    v6.misc.visual.solus.items:set_event("render", function()
        -- upvalues: v110 (ref)
        v110.watermark.run:update();
    end, function(v501)
        return v501:get("Watermark");
    end);
    local v502 = v6:new(0);
    v6.misc.visual.solus.items:set_event("render", function()
        -- upvalues: l_entity_0 (ref), v502 (ref), v6 (ref)
        if not l_entity_0.get_local_player() then
            return;
        else
            if l_entity_0.get_local_player().m_bIsScoped or l_entity_0.get_local_player().m_bResumeZoom then
                v502:lerp(1, 8);
            else
                v502:lerp(0, 8);
            end;
            local v503 = v6.cde.gradient("\240\157\146\158  \240\157\144\184  \240\157\144\191  \240\157\144\184  \240\157\146\174  \240\157\146\175  \240\157\144\188  \240\157\146\176  \240\157\145\128", color(204, 204, 255, 0), color(204, 204, 255, 255), 2.3);
            render.text(4, vector(render.screen_size().x / 2 + v502.value * 60, render.screen_size().y / 2 * 1.99 - 7), color(255), "c", v503);
            return;
        end;
    end, function(v504)
        return v504:get("Static watermark");
    end);
    v6.misc.misc.shared.items:set_event("render", function()
        -- upvalues: l_globals_0 (ref), v331 (ref)
        if l_globals_0.tickcount % 10 == 0 then
            v331();
        end;
    end, function(v505)
        return v505:get("Clantag");
    end);
    v6.misc.visual.aspectratio:set_event("render", function()
        -- upvalues: l_globals_0 (ref), v6 (ref), l_cvar_0 (ref)
        if l_globals_0.choked_commands == 0 then
            v6.our.aspect = v6.cde.lerp(v6.our.aspect, v6.misc.visual.aspectratio_ratio:get() / 100, 15);
            l_cvar_0.r_aspectratio:float(v6.our.aspect);
        end;
    end);
    v6.misc.visual.aspectratio:set_callback(function(v506)
        -- upvalues: l_cvar_0 (ref)
        if not v506:get() then
            l_cvar_0.r_aspectratio:float(0);
        end;
    end);
    v6.misc.rage.airlag:set_event("render", function()
        -- upvalues: v3 (ref), l_globals_0 (ref), v6 (ref), l_entity_0 (ref)
        if v3[1].doubletap:get() then
            local v507 = l_globals_0.tickcount % v6.misc.rage.airlag_ticks:get();
            local v508 = l_entity_0.get_local_player().m_nTickBase % v6.misc.rage.airlag_ticks:get();
            if v6.misc.rage.extra_ticks:get() then
                v6.our.airlag_key = v507 > 1;
            else
                v6.our.airlag_key = v508 == 0;
            end;
            if v6.our.airlag_key then
                v3[2].fakeduck:override(true);
            else
                v3[2].fakeduck:override(false);
            end;
        else
            v6.our.airlag_key = false;
            v3[2].fakeduck:override();
        end;
    end);
    v6.misc.rage.airlag:set_callback(function(v509)
        -- upvalues: v6 (ref), v3 (ref)
        if not v509:get() then
            v6.our.airlag_key = false;
            v3[2].fakeduck:override();
        end;
    end);
    v6.misc.visual.removals.optimaztion:set_callback(function(v510)
        -- upvalues: l_cvar_0 (ref)
        local v511 = v510:get() and 0 or 1;
        l_cvar_0.r_shadows:int(v511);
        l_cvar_0.cl_csm_static_prop_shadows:int(v511);
        l_cvar_0.cl_csm_shadows:int(v511);
        l_cvar_0.cl_csm_world_shadows:int(v511);
        l_cvar_0.cl_foot_contact_shadows:int(v511);
        l_cvar_0.cl_csm_viewmodel_shadows:int(v511);
        l_cvar_0.cl_csm_rope_shadows:int(v511);
        l_cvar_0.cl_csm_sprite_shadows:int(v511);
        l_cvar_0.r_dynamic:int(v511);
        l_cvar_0.cl_autohelp:int(v511);
        l_cvar_0.r_eyesize:int(v511);
        l_cvar_0.r_eyeshift_z:int(v511);
        l_cvar_0.r_eyeshift_y:int(v511);
        l_cvar_0.r_eyeshift_x:int(v511);
        l_cvar_0.r_eyemove:int(v511);
        l_cvar_0.r_eyegloss:int(v511);
        l_cvar_0.r_drawtracers_firstperson:int(v511);
        l_cvar_0.r_drawtracers:int(v511);
        l_cvar_0.fog_enable_water_fog:int(v511);
        l_cvar_0.mat_postprocess_enable:int(v511);
        l_cvar_0.cl_disablefreezecam:int(v511);
        l_cvar_0.cl_freezecampanel_position_dynamic:int(v511);
        l_cvar_0.r_drawdecals:int(v511);
        l_cvar_0.muzzleflash_light:int(v511);
        l_cvar_0.r_drawropes:int(v511);
        l_cvar_0.r_drawsprites:int(v511);
        l_cvar_0.cl_disablehtmlmotd:int(v511);
        l_cvar_0.cl_freezecameffects_showholiday:int(v511);
        l_cvar_0.m_rawinput:int(v511);
        l_cvar_0.cl_bob_lower_amt:int(v511);
        l_cvar_0.cl_detail_multiplier:int(v511);
        l_cvar_0.mat_drawwater:int(v511);
        l_cvar_0.func_break_max_pieces:int(v511);
    end);
    v6.cde.onload();
    v34:new("createmove", function(...)
        -- upvalues: v6 (ref)
        v6.events.antiaim(...);
        v6.events.misc(...);
    end, "antiaim");
    v34:new("render", function()
        -- upvalues: v6 (ref)
        v6.events.visual();
    end, "menu");
    v34:new("aim_ack", function(...)
        -- upvalues: v6 (ref)
        v6.events.aimbot_logs(...);
    end, "aimbot_logs");
    v34:new("player_death", function(...)
        -- upvalues: v6 (ref)
        v6.events.trashtalk(...);
    end, "trashtalk");
    v6.misc.visual.keepmodel:set_event("localplayer_transparency", function()
        -- upvalues: v6 (ref), l_entity_0 (ref)
        local v512 = v6.misc.visual.keepmodel:get() and v6.misc.visual.keepmodel_ratio:get() or 255;
        return l_entity_0.get_local_player().m_bIsScoped and v512 or 255;
    end);
    v34:new("grenade_prediction", function(...)
        -- upvalues: v6 (ref)
        v6.events.nade_prediction(...);
    end, "nade_throw");
    v34:new("shutdown", function()
        -- upvalues: v6 (ref), l_common_0 (ref), l_cvar_0 (ref), v3 (ref)
        v6.cde.add_notify("Goodbye, " .. l_common_0.get_username());
        l_cvar_0.viewmodel_fov:int(v6.database.config.wm[1]);
        l_cvar_0.viewmodel_offset_x:float(v6.database.config.wm[2]);
        l_cvar_0.viewmodel_offset_y:float(v6.database.config.wm[3]);
        l_cvar_0.viewmodel_offset_z:float(v6.database.config.wm[4]);
        l_cvar_0.cl_bob_lower_amt:float(5);
        l_cvar_0.cl_bobamt_lat:float(0.1);
        l_cvar_0.cl_bobamt_vert:float(0.14);
        l_cvar_0.cl_bobcycle:float(0.98);
        l_cvar_0.cl_viewmodel_shift_left_amt:float(1.5);
        l_cvar_0.cl_viewmodel_shift_right_amt:float(0.75);
        l_cvar_0.cl_wpn_sway_interp:float(1);
        l_cvar_0.cl_wpn_sway_scale:float(1);
        l_cvar_0.cl_bobup:float(0.5);
        l_cvar_0.cl_bob_version:float(1);
        l_cvar_0.cam_idealdist:float(40);
        l_cvar_0.cam_idealpitch:float(-3);
        l_cvar_0.cam_idealyaw:float(0);
        l_cvar_0.cl_use_new_headbob:float(1);
        l_cvar_0.r_aspectratio:float(0);
        l_common_0.set_clan_tag(" ");
        for _, v514 in next, v3[2] do
            if v514 ~= "menu_item(Freestanding)" then
                v514:visibility(true);
            else
                break;
            end;
        end;
        for _, v516 in pairs(v3) do
            for _, v518 in next, v516 do
                v518:override();
            end;
        end;
    end, "shutdown_lua");
end)({
    run = function(v519, ...)
        if type(v519) ~= "function" then
            return v519;
        else
            return v519(...);
        end;
    end, 
    safetly = function(v520, ...)
        local l_status_12, l_result_12 = pcall(function(...)
            -- upvalues: v520 (ref)
            return v520(...);
        end);
        if l_status_12 then
            return l_result_12;
        else
            return;
        end;
    end, 
    call = function(v523, ...)
        v523(...);
    end
}, {}, {
    cool_blue = "\a8F8FE2FF", 
    purple = "\aC36DF6FF", 
    link = "\a{Link Active}", 
    green = "\a80E758FF", 
    light_blue = "\a88C0E7FF", 
    red = "\aE85D5DFF", 
    reset = "\aDEFAULT", 
    sun_yellow = "\aEBC747FF", 
    black = "\a000000FF", 
    white = "\aFFFFFFFF", 
    cyan = "\a57EDD6FF", 
    lila = "\aF6C9E9FF"
}, {
    [1] = {
        peek_assist = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist"), 
        silent_aim = ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Silent Aim"), 
        override_resolver = ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Override Resolver"), 
        hitboxes = ui.find("Aimbot", "Ragebot", "Selection", "Hitboxes"), 
        hitchances = ui.find("Aimbot", "Ragebot", "Selection", "Hit Chance"), 
        mindamages = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"), 
        safepoints = ui.find("Aimbot", "Ragebot", "Safety", "Safe Points"), 
        bodyaims = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim"), 
        doubletap_fastp = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Immediate Teleport"), 
        doubletap_fakelag = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Fake Lag Limit"), 
        doubletap_switch = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Quick-Switch"), 
        dormantaimbot = ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot"), 
        onshot = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"), 
        onshot_setting = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options"), 
        doubletap = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"), 
        dt_lag = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"), 
        deagle_hc = ui.find("Aimbot", "Ragebot", "Selection", "Desert Eagle", "Hit Chance"), 
        ssg_hc = ui.find("Aimbot", "Ragebot", "Selection", "SSG-08", "Hit Chance"), 
        awp_hc = ui.find("Aimbot", "Ragebot", "Selection", "AWP", "Hit Chance"), 
        autosniper = ui.find("Aimbot", "Ragebot", "Selection", "AutoSnipers", "Hit Chance"), 
        shotgun_hc = ui.find("Aimbot", "Ragebot", "Selection", "Shotguns", "Hit Chance"), 
        smg_hc = ui.find("Aimbot", "Ragebot", "Selection", "SMGs", "Hit Chance"), 
        deagle_autostop = ui.find("Aimbot", "Ragebot", "Accuracy", "Desert Eagle", "Auto Stop", "Options"), 
        ssg_autostop = ui.find("Aimbot", "Ragebot", "Accuracy", "SSG-08", "Auto Stop", "Options"), 
        awp_autostop = ui.find("Aimbot", "Ragebot", "Accuracy", "AWP", "Auto Stop", "Options"), 
        autosniper_autostop = ui.find("Aimbot", "Ragebot", "Accuracy", "AutoSnipers", "Auto Stop", "Options"), 
        shotgun_autostop = ui.find("Aimbot", "Ragebot", "Accuracy", "Shotguns", "Auto Stop", "Options"), 
        smg_autostop = ui.find("Aimbot", "Ragebot", "Accuracy", "SMGs", "Auto Stop", "Options")
    }, 
    [2] = {
        enabled = ui.find("Aimbot", "Anti Aim", "Angles", "Enabled"), 
        pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"), 
        yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"), 
        yawbase = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"), 
        yaw_offset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"), 
        avoidback = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab"), 
        hidden = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden"), 
        yawmodifier = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"), 
        yawmod_offset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"), 
        desync = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"), 
        desync_options = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"), 
        desync_invert = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"), 
        desync_Loffset = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"), 
        desync_Roffset = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"), 
        desync_freestand = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding"), 
        freestand = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"), 
        fakelag_enablled = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Enabled"), 
        fakelag_limit = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Limit"), 
        fakelag_var = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Variability"), 
        legmovement = ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"), 
        fakeduck = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"), 
        slowwalk = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk")
    }, 
    [3] = {
        airstrafe = ui.find("Miscellaneous", "Main", "Movement", "Air Strafe"), 
        airstrafe_smooth = ui.find("Miscellaneous", "Main", "Movement", "Air Strafe", "Smoothing"), 
        edge_jump = ui.find("Miscellaneous", "Main", "Movement", "Edge Jump"), 
        fake_latency = ui.find("Miscellaneous", "Main", "Other", "Fake Latency"), 
        buybot = ui.find("Miscellaneous", "Main", "BuyBot", "Enabled"), 
        weapon_action = ui.find("Miscellaneous", "Main", "Other", "Weapon Actions")
    }, 
    [4] = {
        thirdperson = ui.find("Visuals", "World", "Main", "Force Thirdperson"), 
        thirdperson_dist = ui.find("Visuals", "World", "Main", "Force Thirdperson", "Distance")
    }
}, function(v524)
    local v525 = math.modf(v524);
    local v526 = math.floor(v524 / 2 * 0.5);
    local v527 = v524 - math.pi;
    local v528 = math.min(v526, v527) * math.asin(v524);
    if v524 < v528 then
        v528 = v527 - v526 + v528;
        v528 = v528 + v524 + v528;
        v528 = v528 - v524 * v526 + v526 - v528;
        local _ = v528 - v526 / v524 % v527 + v528;
    else
        v528 = (v527 + (v528 * (v526 - v524) + v524)) * 0.5;
        v528 = v528 * v526 + v524 / v528;
        local v530 = v526 + v528 / v524;
        if v530 then
            v528 = v530;
        end;
        v528 = (math.max(v526, v527, v528) + v526) * math.min(999, v525);
    end;
    return v528;
end, function()
    return {
        clipboard = require("neverlose/clipboard"), 
        drag_system = require("neverlose/drag_system"), 
        events = require("neverlose/events"), 
        pui = require("neverlose/pui"), 
        defensivetick = require("neverlose/get_defensive"), 
        mtools = require("neverlose/mtools"), 
        edgeyaw = require("neverlose/edge_yaw"), 
        inspect = require("neverlose/inspect")
    };
end);