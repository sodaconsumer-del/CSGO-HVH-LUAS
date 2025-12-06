ffi.cdef("    typedef int(__fastcall* clantag_t)(const char*, const char*);\n\n    typedef void*(__thiscall* get_client_entity_t)(void*, int);\n\n    typedef struct\n    {\n        float x;\n        float y;\n        float z;\n    } Vector_t;\n\n    typedef struct {\n        char  pad_0000[20];\n        int m_nOrder; //0x0014\n        int m_nSequence; //0x0018\n        float m_flPrevCycle; //0x001C\n        float m_flWeight; //0x0020\n        float m_flWeightDeltaRate; //0x0024\n        float m_flPlaybackRate; //0x0028\n        float m_flCycle; //0x002C\n        void *m_pOwner; //0x0030\n        char  pad_0038[4]; //0x0034\n    } CAnimationLayer;\n\n    typedef struct\n    {\n        char    pad0[0x60]; // 0x00\n        void* pEntity; // 0x60\n        void* pActiveWeapon; // 0x64\n        void* pLastActiveWeapon; // 0x68\n        float        flLastUpdateTime; // 0x6C\n        int            iLastUpdateFrame; // 0x70\n        float        flLastUpdateIncrement; // 0x74\n        float        flEyeYaw; // 0x78\n        float        flEyePitch; // 0x7C\n        float        flGoalFeetYaw; // 0x80\n        float        flLastFeetYaw; // 0x84\n        float        flMoveYaw; // 0x88\n        float        flLastMoveYaw; // 0x8C // changes when moving/jumping/hitting ground\n        float        flLeanAmount; // 0x90\n        char         pad1[0x4]; // 0x94\n        float        flFeetCycle; // 0x98 0 to 1\n        float        flMoveWeight; // 0x9C 0 to 1\n        float        flMoveWeightSmoothed; // 0xA0\n        float        flDuckAmount; // 0xA4\n        float        flHitGroundCycle; // 0xA8\n        float        flRecrouchWeight; // 0xAC\n        Vector_t        vecOrigin; // 0xB0\n        Vector_t        vecLastOrigin;// 0xBC\n        Vector_t        vecVelocity; // 0xC8\n        Vector_t        vecVelocityNormalized; // 0xD4\n        Vector_t        vecVelocityNormalizedNonZero; // 0xE0\n        float        flVelocityLenght2D; // 0xEC\n        float        flJumpFallVelocity; // 0xF0\n        float        flSpeedNormalized; // 0xF4 // clamped velocity from 0 to 1\n        float        flRunningSpeed; // 0xF8\n        float        flDuckingSpeed; // 0xFC\n        float        flDurationMoving; // 0x100\n        float        flDurationStill; // 0x104\n        bool        bOnGround; // 0x108\n        bool        bHitGroundAnimation; // 0x109\n        char    pad2[0x2]; // 0x10A\n        float        flNextLowerBodyYawUpdateTime; // 0x10C\n        float        flDurationInAir; // 0x110\n        float        flLeftGroundHeight; // 0x114\n        float        flHitGroundWeight; // 0x118 // from 0 to 1, is 1 when standing\n        float        flWalkToRunTransition; // 0x11C // from 0 to 1, doesnt change when walking or crouching, only running\n        char    pad3[0x4]; // 0x120\n        float        flAffectedFraction; // 0x124 // affected while jumping and running, or when just jumping, 0 to 1\n        char    pad4[0x208]; // 0x128\n        float        flMinBodyYaw; // 0x330\n        float        flMaxBodyYaw; // 0x334\n        float        flMinPitch; //0x338\n        float        flMaxPitch; // 0x33C\n        int            iAnimsetVersion; // 0x340\n    } CCSGOPlayerAnimationState_534535_t;\n\n");
local l_clipboard_0 = require("neverlose/clipboard");
local l_base64_0 = require("neverlose/base64");
local l_gradient_0 = require("neverlose/gradient");
local l_system_0 = require("neverlose/drag_system");
local l_pui_0 = require("neverlose/pui");
local l_animations_0 = require("neverlose/animations");
local _ = require("neverlose/vmt_hook");
local v7 = {};
local v8 = {};
local v9 = {};
local v10 = {};
local _ = {};
local v12 = {};
local v13 = {};
local v14 = {};
local v15 = {};
local _ = {};
local v17 = {};
local v18 = {};
local _ = {};
local v20 = {};
local v21 = {};
local v22 = {};
local v23 = {};
local v24 = {};
local v25 = {};
local v26 = {};
local v27 = {};
local v28 = {};
local v29 = panorama.loadstring("    return {\n        stringify: JSON.stringify,\n        parse: JSON.parse\n    };\n")();
v21.hwnd = ffi.cast("uintptr_t***", ffi.cast("uintptr_t", utils.opcode_scan("engine.dll", "8B 0D ?? ?? ?? ?? 85 C9 74 16 8B 01 8B")) + 2)[0][0] + 2;
v21.fwindow = ffi.cast("int(__stdcall*)(uintptr_t, int)", utils.opcode_scan("gameoverlayrenderer.dll", "55 8B EC 83 EC 14 8B 45 0C F7"));
v21.get_window = ffi.cast("uintptr_t**", ffi.cast("uintptr_t", utils.opcode_scan("gameoverlayrenderer.dll", "FF 15 ?? ?? ?? ?? 3B C6 74")) + 2)[0][0];
v21.gameoverlayrenderer = ffi.cast("int(__thiscall*)(uintptr_t)", utils.opcode_scan("gameoverlayrenderer.dll", "FF E1"));
v21.bind_argument = function(v30, v31)
    return function(...)
        -- upvalues: v30 (ref), v31 (ref)
        return v30(v31, ...);
    end;
end;
v21.entity_list_003 = ffi.cast(ffi.typeof("uintptr_t**"), utils.create_interface("client.dll", "VClientEntityList003"));
v21.get_entity_address = v21.bind_argument(ffi.cast("get_client_entity_t", v21.entity_list_003[0][3]), v21.entity_list_003);
local v32 = {};
configs_db = db.configs_dbbeta or {};
configs_db.cfg_list = configs_db.cfg_list or {
    [1] = {
        [1] = "Experimental", 
        [2] = ""
    }
};
configs_db.menu_list = configs_db.menu_list or {
    [1] = "Experimental"
};
configs_db.cfg_list[1][2] = "kocA3gAnqXBpdGNobGVmdACrcmlnaHRfbGltaXQ8qnBpdGNocmlnaHQAp29wdGlvbnOSpkppdHRlcqF+rHJhbmRvbXBpdGNoMQCscmFuZG9tcGl0Y2gyAKxmcmVlc3RhbmRpbmejT2ZmsGRlZmVuc2l2ZV9hYV95YXeoRGlzYWJsZWSpc2xpZGVyeWF3AKh5YXdfdHlwZaNMJlKrbGVmdF9vZmZzZXTvrHJpZ2h0X29mZnNldBapeWF3X3RpY2tzAa1tb2RpZmllcl9tb2RlpkppdHRlcqhyaWdodHlhdwC0bW9kaWZpZXJfb2Zmc2V0X2xlZnTQtqVwaXRjaKREb3dutW1vZGlmaWVyX29mZnNldF9yaWdodEq2ZGVmZW5zaXZlX2FhX2Rpc2FibGVyc5GhfrRtb2RpZmllcl9vZmZzZXRfd2F5MgC0bW9kaWZpZXJfb2Zmc2V0X3dheTMAtG1vZGlmaWVyX29mZnNldF93YXk0ALRtb2RpZmllcl9vZmZzZXRfd2F5NQCoeWF3X2Jhc2WqTG9jYWwgVmlld6psZWZ0X2xpbWl0PKV0aWNrcyOqcmFuZG9teWF3MQC2ZGVmZW5zaXZlX2FhX3NlbnNpdml0eRS0bW9kaWZpZXJfb2Zmc2V0X3dheTEAqGJvZHlfeWF3w69tb2RpZmllcl9vZmZzZXTQq6xkZWZlbnNpdmVfYWHCp2xlZnR5YXcAo3lhd6hCYWNrd2FyZLJkZWZlbnNpdmVfYWFfcGl0Y2ioRGlzYWJsZWSqcmFuZG9teWF3MgCseWF3X21vZGlmaWVypTMtV2F5pHR5cGWqVGljayBCYXNlZKtwaXRjaHNsaWRlcgAB3gAnqXBpdGNobGVmdACrcmlnaHRfbGltaXQ8qnBpdGNocmlnaHQAp29wdGlvbnOSpkppdHRlcqF+rHJhbmRvbXBpdGNoMQCscmFuZG9tcGl0Y2gyAKxmcmVlc3RhbmRpbmejT2ZmsGRlZmVuc2l2ZV9hYV95YXeoRGlzYWJsZWSpc2xpZGVyeWF3AKh5YXdfdHlwZaNMJlKrbGVmdF9vZmZzZXTnrHJpZ2h0X29mZnNldBapeWF3X3RpY2tzAa1tb2RpZmllcl9tb2RlpkppdHRlcqhyaWdodHlhdwC0bW9kaWZpZXJfb2Zmc2V0X2xlZnTQsaVwaXRjaKREb3dutW1vZGlmaWVyX29mZnNldF9yaWdodCm2ZGVmZW5zaXZlX2FhX2Rpc2FibGVyc5GhfrRtb2RpZmllcl9vZmZzZXRfd2F5MgW0bW9kaWZpZXJfb2Zmc2V0X3dheTP1tG1vZGlmaWVyX29mZnNldF93YXk0ALRtb2RpZmllcl9vZmZzZXRfd2F5NdDbqHlhd19iYXNlqUF0IFRhcmdldKpsZWZ0X2xpbWl0PKV0aWNrc1OqcmFuZG9teWF3MQC2ZGVmZW5zaXZlX2FhX3NlbnNpdml0eRS0bW9kaWZpZXJfb2Zmc2V0X3dheTHxqGJvZHlfeWF3w69tb2RpZmllcl9vZmZzZXQArGRlZmVuc2l2ZV9hYcKnbGVmdHlhdwCjeWF3qEJhY2t3YXJksmRlZmVuc2l2ZV9hYV9waXRjaKhEaXNhYmxlZKpyYW5kb215YXcyAKx5YXdfbW9kaWZpZXKmUmFuZG9tpHR5cGWqVGljayBCYXNlZKtwaXRjaHNsaWRlcgAC3gAnqXBpdGNobGVmdACrcmlnaHRfbGltaXQrqnBpdGNocmlnaHQAp29wdGlvbnOSpkppdHRlcqF+rHJhbmRvbXBpdGNoMQCscmFuZG9tcGl0Y2gyAKxmcmVlc3RhbmRpbmejT2ZmsGRlZmVuc2l2ZV9hYV95YXeoRGlzYWJsZWSpc2xpZGVyeWF3AKh5YXdfdHlwZaNMJlKrbGVmdF9vZmZzZXTsrHJpZ2h0X29mZnNldBqpeWF3X3RpY2tzAa1tb2RpZmllcl9tb2RlpkppdHRlcqhyaWdodHlhdwC0bW9kaWZpZXJfb2Zmc2V0X2xlZnTvpXBpdGNopERvd261bW9kaWZpZXJfb2Zmc2V0X3JpZ2h0GrZkZWZlbnNpdmVfYWFfZGlzYWJsZXJzkaF+tG1vZGlmaWVyX29mZnNldF93YXkyALRtb2RpZmllcl9vZmZzZXRfd2F5MwC0bW9kaWZpZXJfb2Zmc2V0X3dheTTQ27Rtb2RpZmllcl9vZmZzZXRfd2F5NQCoeWF3X2Jhc2WqTG9jYWwgVmlld6psZWZ0X2xpbWl0KaV0aWNrcwGqcmFuZG9teWF3MQC2ZGVmZW5zaXZlX2FhX3NlbnNpdml0eRS0bW9kaWZpZXJfb2Zmc2V0X3dheTHsqGJvZHlfeWF3w69tb2RpZmllcl9vZmZzZXTvrGRlZmVuc2l2ZV9hYcKnbGVmdHlhdwCjeWF3qEJhY2t3YXJksmRlZmVuc2l2ZV9hYV9waXRjaKhEaXNhYmxlZKpyYW5kb215YXcyAKx5YXdfbW9kaWZpZXKmT2Zmc2V0pHR5cGWjTCZSq3BpdGNoc2xpZGVyAAPeACepcGl0Y2hsZWZ0AKtyaWdodF9saW1pdDyqcGl0Y2hyaWdodACnb3B0aW9uc5KmSml0dGVyoX6scmFuZG9tcGl0Y2gxAKxyYW5kb21waXRjaDIArGZyZWVzdGFuZGluZ6NPZmawZGVmZW5zaXZlX2FhX3lhd6hEaXNhYmxlZKlzbGlkZXJ5YXcAqHlhd190eXBlo0wmUqtsZWZ0X29mZnNldOiscmlnaHRfb2Zmc2V0Fql5YXdfdGlja3MBrW1vZGlmaWVyX21vZGWmSml0dGVyqHJpZ2h0eWF3ALRtb2RpZmllcl9vZmZzZXRfbGVmdOqlcGl0Y2ikRG93brVtb2RpZmllcl9vZmZzZXRfcmlnaHQWtmRlZmVuc2l2ZV9hYV9kaXNhYmxlcnORoX60bW9kaWZpZXJfb2Zmc2V0X3dheTIAtG1vZGlmaWVyX29mZnNldF93YXkz0Nu0bW9kaWZpZXJfb2Zmc2V0X3dheTQAtG1vZGlmaWVyX29mZnNldF93YXk1AKh5YXdfYmFzZalBdCBUYXJnZXSqbGVmdF9saW1pdDSldGlja3MBqnJhbmRvbXlhdzEAtmRlZmVuc2l2ZV9hYV9zZW5zaXZpdHkUtG1vZGlmaWVyX29mZnNldF93YXkxAKhib2R5X3lhd8OvbW9kaWZpZXJfb2Zmc2V09KxkZWZlbnNpdmVfYWHCp2xlZnR5YXcAo3lhd6hCYWNrd2FyZLJkZWZlbnNpdmVfYWFfcGl0Y2ioRGlzYWJsZWSqcmFuZG9teWF3MgCseWF3X21vZGlmaWVypk9mZnNldKR0eXBlo0wmUqtwaXRjaHNsaWRlcgAE3gAnqXBpdGNobGVmdNDZq3JpZ2h0X2xpbWl0OqpwaXRjaHJpZ2h0QadvcHRpb25zkqZKaXR0ZXKhfqxyYW5kb21waXRjaDHQsaxyYW5kb21waXRjaDJPrGZyZWVzdGFuZGluZ6NPZmawZGVmZW5zaXZlX2FhX3lhd6NMJlKpc2xpZGVyeWF30f9MqHlhd190eXBlo0wmUqtsZWZ0X29mZnNldAescmlnaHRfb2Zmc2V0+al5YXdfdGlja3MBrW1vZGlmaWVyX21vZGWmSml0dGVyqHJpZ2h0eWF3VbRtb2RpZmllcl9vZmZzZXRfbGVmdNCrpXBpdGNopERvd261bW9kaWZpZXJfb2Zmc2V0X3JpZ2h0LLZkZWZlbnNpdmVfYWFfZGlzYWJsZXJzkaF+tG1vZGlmaWVyX29mZnNldF93YXky0Nu0bW9kaWZpZXJfb2Zmc2V0X3dheTMAtG1vZGlmaWVyX29mZnNldF93YXk0ALRtb2RpZmllcl9vZmZzZXRfd2F5NQCoeWF3X2Jhc2WqTG9jYWwgVmlld6psZWZ0X2xpbWl0OqV0aWNrcwGqcmFuZG9teWF3MdC/tmRlZmVuc2l2ZV9hYV9zZW5zaXZpdHk/tG1vZGlmaWVyX29mZnNldF93YXkxAKhib2R5X3lhd8OvbW9kaWZpZXJfb2Zmc2V04axkZWZlbnNpdmVfYWHDp2xlZnR5YXfQv6N5YXeoQmFja3dhcmSyZGVmZW5zaXZlX2FhX3BpdGNoo0wmUqpyYW5kb215YXcyS6x5YXdfbW9kaWZpZXKmT2Zmc2V0pHR5cGWnRGVmYXVsdKtwaXRjaHNsaWRlcgcF3gAnqXBpdGNobGVmdACrcmlnaHRfbGltaXQ8qnBpdGNocmlnaHQAp29wdGlvbnOSpkppdHRlcqF+rHJhbmRvbXBpdGNoMQCscmFuZG9tcGl0Y2gyAKxmcmVlc3RhbmRpbmejT2ZmsGRlZmVuc2l2ZV9hYV95YXeoRGlzYWJsZWSpc2xpZGVyeWF3AKh5YXdfdHlwZaNMJlKrbGVmdF9vZmZzZXTorHJpZ2h0X29mZnNldBGpeWF3X3RpY2tzAa1tb2RpZmllcl9tb2RlpkppdHRlcqhyaWdodHlhdwC0bW9kaWZpZXJfb2Zmc2V0X2xlZnTQuqVwaXRjaKREb3dutW1vZGlmaWVyX29mZnNldF9yaWdodEG2ZGVmZW5zaXZlX2FhX2Rpc2FibGVyc5SsRnJlZXN0YW5kaW5nqk1hbnVhbCBZYXepU2FmZSBIZWFkoX60bW9kaWZpZXJfb2Zmc2V0X3dheTIAtG1vZGlmaWVyX29mZnNldF93YXkzALRtb2RpZmllcl9vZmZzZXRfd2F5NAC0bW9kaWZpZXJfb2Zmc2V0X3dheTUAqHlhd19iYXNlqUF0IFRhcmdldKpsZWZ0X2xpbWl0PKV0aWNrcxiqcmFuZG9teWF3MQC2ZGVmZW5zaXZlX2FhX3NlbnNpdml0eSi0bW9kaWZpZXJfb2Zmc2V0X3dheTHnqGJvZHlfeWF3w69tb2RpZmllcl9vZmZzZXTQzaxkZWZlbnNpdmVfYWHCp2xlZnR5YXcAo3lhd6hCYWNrd2FyZLJkZWZlbnNpdmVfYWFfcGl0Y2imQ3VzdG9tqnJhbmRvbXlhdzIArHlhd19tb2RpZmllcqZDZW50ZXKkdHlwZaNMJlKrcGl0Y2hzbGlkZXLQpwbeACepcGl0Y2hsZWZ0AKtyaWdodF9saW1pdDOqcGl0Y2hyaWdodACnb3B0aW9uc5KmSml0dGVyoX6scmFuZG9tcGl0Y2gxAKxyYW5kb21waXRjaDIArGZyZWVzdGFuZGluZ6lQZWVrIEZha2WwZGVmZW5zaXZlX2FhX3lhd6hEaXNhYmxlZKlzbGlkZXJ5YXcAqHlhd190eXBlo0wmUqtsZWZ0X29mZnNldMy0rHJpZ2h0X29mZnNldMy0qXlhd190aWNrcwGtbW9kaWZpZXJfbW9kZadEZWZhdWx0qHJpZ2h0eWF3ALRtb2RpZmllcl9vZmZzZXRfbGVmdAClcGl0Y2ioRGlzYWJsZWS1bW9kaWZpZXJfb2Zmc2V0X3JpZ2h0ALZkZWZlbnNpdmVfYWFfZGlzYWJsZXJzkaF+tG1vZGlmaWVyX29mZnNldF93YXkyALRtb2RpZmllcl9vZmZzZXRfd2F5MwC0bW9kaWZpZXJfb2Zmc2V0X3dheTQAtG1vZGlmaWVyX29mZnNldF93YXk1AKh5YXdfYmFzZapMb2NhbCBWaWV3qmxlZnRfbGltaXQjpXRpY2tzAapyYW5kb215YXcxALZkZWZlbnNpdmVfYWFfc2Vuc2l2aXR5FLRtb2RpZmllcl9vZmZzZXRfd2F5MQCoYm9keV95YXfDr21vZGlmaWVyX29mZnNldAesZGVmZW5zaXZlX2FhwqdsZWZ0eWF3AKN5YXeoQmFja3dhcmSyZGVmZW5zaXZlX2FhX3BpdGNoqERpc2FibGVkqnJhbmRvbXlhdzIArHlhd19tb2RpZmllcqZDZW50ZXKkdHlwZaNMJlKrcGl0Y2hzbGlkZXIAiapwaXRjaF96ZXJvwqtncm91bmRfbGVnc6ZTdGF0aWOvbWFudWFsX3lhd19iYXNlo09mZqxmcmVlc3RhbmRpbmfCrGFkZGljdGlvbmFsc5YBAgMEBaF+sWJvZHlfZnJlZXN0YW5kaW5nw7VkaXNhYmxlX3lhd19tb2RpZmllcnPDsXNsaWRpbmdfc2xvd193YWxrw6hhaXJfbGVnc6ZTdGF0aWM=";
v32.save_config = function(v33)
    -- upvalues: l_pui_0 (ref), l_base64_0 (ref)
    if v33 == 1 then
        common.add_notify("[Anti-Neverlose]", "You cant save on default configs!");
        return;
    else
        local v34 = l_pui_0.save();
        configs_db.cfg_list[v33][2] = l_base64_0.encode(msgpack.pack(v34));
        common.add_notify("[Anti-Neverlose]", "Saved Config!");
        cvar.play:call("ambient\\tones\\elev1");
        db.configs_dbbeta = configs_db;
        return;
    end;
end;
v32.import_config = function(v35)
    -- upvalues: l_clipboard_0 (ref), l_pui_0 (ref), l_base64_0 (ref)
    local v36 = l_clipboard_0.get();
    if v35 == 1 then
        common.add_notify("[Anti-Neverlose]", "You cant import on default configs!");
        return;
    else
        configs_db.cfg_list[v35][2] = v36:gsub("<antineverlose>", "");
        l_pui_0.load(msgpack.unpack(l_base64_0.decode(configs_db.cfg_list[v35][2])));
        common.add_notify("[Anti-Neverlose]", "Imported Config from clipboard!");
        cvar.play:call("ambient\\tones\\elev1");
        db.configs_dbbeta = configs_db;
        return;
    end;
end;
v32.export_config = function(v37)
    -- upvalues: l_clipboard_0 (ref)
    if configs_db.cfg_list[v37][2] == nil or configs_db.cfg_list[v37][2] == "" then
        common.add_notify("[Anti-Neverlose]", "Error: Empty Config!");
        return;
    elseif v37 == 1 then
        common.add_notify("[Anti-Neverlose]", "You cant export on default configs!");
        return;
    else
        l_clipboard_0.set("<antineverlose>" .. configs_db.cfg_list[v37][2]);
        common.add_notify("[Anti-Neverlose]", "Exported Config to clipboard!");
        db.configs_dbbeta = configs_db;
        return;
    end;
end;
v32.update_values = function(v38)
    local v39 = configs_db.cfg_list[v38][1] .. "\a" .. ui.get_style("Link Active"):to_hex() .. " - Active";
    for v40, v41 in ipairs(configs_db.cfg_list) do
        configs_db.menu_list[v40] = v41[1];
    end;
    configs_db.menu_list[v38] = v39;
end;
v32.create_config = function(v42)
    if type(v42) ~= "string" then
        return;
    elseif v42 == nil or v42 == "" or v42 == " " then
        return;
    else
        for v43 = #configs_db.menu_list, 1, -1 do
            if configs_db.menu_list[v43] == v42 then
                common.add_notify("[Anti-Neverlose]", "Error: same name!");
                return;
            end;
        end;
        if #configs_db.cfg_list > 6 then
            common.add_notify("[antineverlose]", ":(");
            return;
        else
            local v44 = {
                [1] = nil, 
                [2] = "", 
                [1] = v42
            };
            table.insert(configs_db.cfg_list, v44);
            table.insert(configs_db.menu_list, v42);
            db.configs_dbbeta = configs_db;
            return;
        end;
    end;
end;
v32.remove_config = function(v45)
    if v45 == 1 then
        common.add_notify("[Anti-Neverlose]", "You cant remove default configs!");
        return;
    else
        local v46 = configs_db.cfg_list[v45][1];
        for v47 = #configs_db.cfg_list, 1, -1 do
            if configs_db.cfg_list[v47][1] == v46 then
                table.remove(configs_db.cfg_list, v47);
                table.remove(configs_db.menu_list, v47);
            end;
        end;
        db.configs_dbbeta = configs_db;
        return;
    end;
end;
v32.load_config = function(v48)
    -- upvalues: l_pui_0 (ref), l_base64_0 (ref)
    if configs_db.cfg_list[v48][2] == nil or configs_db.cfg_list[v48][2] == "" then
        print(string.format("Error[data_base[%s]]", v48));
        return;
    elseif #configs_db.cfg_list < v48 then
        print(string.format("Error[data_base[%s]]", v48));
        return;
    else
        l_pui_0.load(msgpack.unpack(l_base64_0.decode(configs_db.cfg_list[v48][2])));
        cvar.play:call("ambient\\tones\\elev1");
        return;
    end;
end;
v14.slow_walk = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk");
v14.yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw");
v14.yaw_base = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base");
v14.yaw_offset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset");
v14.avoid_backstab = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab");
v14.hidden = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden");
v14.pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Pitch");
v14.yaw_modifier = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier");
v14.yaw_modifier_offset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset");
v14.body_yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw");
v14.inventer = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter");
v14.left_limit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit");
v14.right_limit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit");
v14.options = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options");
v14.freestandingt = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding");
v14.freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding");
v14.disable_yaw_modifiers = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Disable Yaw Modifiers");
v14.body_freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Body Freestanding");
v14.legs = ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement");
v14.logs = ui.find("Miscellaneous", "Main", "Other", "Log Events");
v14.double_tap = ui.find("Aimbot", "Ragebot", "Main", "Double Tap");
v14.hide_shots = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots");
v14.dormant_aimbot = ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot");
v14.peek_assist = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist");
v14.safe_points = ui.find("Aimbot", "Ragebot", "Safety", "Safe Points");
v14.body_aim = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim");
v14.scope_overlay = ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay");
v14.auto_peek = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist");
v14.fl = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Limit");
v12.user = common.get_username();
v12.build = "Beta";
v13.file_export = ui.get_icon("file-export");
v13.file_import = ui.get_icon("file-import");
v13.folder_gear = ui.get_icon("folder-gear");
v13.discord = ui.get_icon("discord");
v13.youtube = ui.get_icon("youtube");
v13.config = ui.get_icon("sketch");
v13.gear = ui.get_icon("gear");
v13.house = ui.get_icon("house");
v13.rotate = ui.get_icon("rotate");
v15.main = l_pui_0.create("\aE94545FF" .. v13.house, "\aE94545FFGet Good. Get Anti Neverlose", 1);
v15.info = l_pui_0.create("\aE94545FF" .. v13.house, "\aE94545FFInfo", 2);
v15.config_system = ui.create("\aE94545FF" .. v13.house, "\aE94545FFInterface Configs", 2);
v15.ragebot = l_pui_0.create("\aE94545FF" .. v13.gear, "\aE94545FFRagebot");
v15.visuals = l_pui_0.create("\aE94545FF" .. v13.gear, "\aE94545FFVisuals");
v15.misc = l_pui_0.create("\aE94545FF" .. v13.gear, "\aE94545FFMiscellaneous");
v15.movement = l_pui_0.create("\aE94545FF" .. v13.gear, "\aE94545FFMovement");
v15.antiaim = l_pui_0.create("\aE94545FF" .. v13.rotate, "\aE94545FFAnti aim");
v15.builder = l_pui_0.create("\aE94545FF" .. v13.rotate, "\aE94545FFBuilder");
v15.config_system_antiaim = l_pui_0.create("\aE94545FF" .. v13.rotate, "\aE94545FFPresets", 1);
imageee = render.load_image(network.get("https://i.ibb.co/1L5Kyk8/72307-EA5-51-B0-4630-A2-A2-F53-CA96-DC184.png"), vector(270, 200));
v9.antineverlose = v15.main:texture(imageee, vector(265, 265));
v9.name = v15.info:label("                         \aFFFFFFFFANTI\aE94545FFNEVERLOSE V2");
v9.user = v15.info:label("\aFFFFFFFFUSER   \aE94545FF\194\187  \aFFFFFFFF " .. v12.user .. "");
v9.build = v15.info:label("\aFFFFFFFFBUILD   \aE94545FF\194\187  \aFFFFFFFF" .. string.upper(v12.build) .. "");
v9.version = v15.info:label("\aFFFFFFFFVERSION   \aE94545FF\194\187  \aFFFFFFFF 12.0.0");
v9.update = v15.info:label("\aFFFFFFFFUPDATE   \aE94545FF\194\187  \aFFFFFFFF 03.10.24");
v9.youtube = v15.main:button("\aE94545FF" .. v13.youtube .. "\aDEFAULT Youtube", function()
    panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://www.youtube.com/channel/UCKYqJrcbdPsW6FH2nlb5sGg");
end, true);
v9.config = v15.main:button("\aE94545FF" .. v13.config .. "\aDEFAULT Paid Neverlose Config       ", function()
    panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://neverlose.cc/market/item?id=UUihsJ");
end, true);
v9.discord_server = v15.main:button("                     \aE94545FF" .. v13.discord .. "\aDEFAULT Our Discord Server                    ", function()
    panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://discord.gg/kCXx7yBXus");
end, true);
v15.info:label("\aFFFFFFFFAuthors: \aE94545FFSecs" .. " \aDEFAULT& " .. "\aE94545FFventu");
v9.share_cfg = v15.config_system:button("\aE94545FF" .. v13.file_export .. " \aDEFAULTExport", nil, true);
v9.apply_cfg = v15.config_system:button("\aE94545FF" .. v13.file_import .. " \aDEFAULTImport", nil, true);
v9.load_cfg = v15.config_system:button("\aE94545FF" .. v13.folder_gear .. " \aDEFAULTDef. Config", nil, true);
v9.visuals_aimbotlogs = v15.ragebot:switch("\aE94545FF\f<indent>  \aFFFFFFFFRagebot \aE94545FFLogging", false);
v9.visuals_aimbotlogs_tab = v9.visuals_aimbotlogs:create();
v9.aimbotlogs_print = v9.visuals_aimbotlogs_tab:selectable("Print", "Logs", "\208\161onsole", "Screen");
v9.aimbotlogs_color = v9.visuals_aimbotlogs_tab:color_picker("Color");
v9.no_scope_hitchance = v15.ragebot:switch("\aE94545FF\f<telescope>  \aFFFFFFFFNo Scope \aE94545FFMode");
v9.no_scope_hitchance_tab = v9.no_scope_hitchance:create();
v9.no_scope_hitchance_weapons = v9.no_scope_hitchance_tab:selectable("Weapons", {
    [1] = "Auto", 
    [2] = "Scout", 
    [3] = "Awp"
});
v9.no_scope_hitchance_value = v9.no_scope_hitchance_tab:slider("Hit Chance", 0, 100, 0);
v9.no_scope_hitchance_distance = v9.no_scope_hitchance_tab:slider("Distance", 0, 1000, 0, 1, function(v49)
    if v49 == 1000 then
        return "Inf.";
    else
        return v49;
    end;
end);
v9.air_hitchance = v15.ragebot:switch("\aE94545FF\f<rocket-launch>  \aFFFFFFFFAir \aE94545FFMode");
v9.air_hitchance_tab = v9.air_hitchance:create();
v9.air_hitchance_weapons = v9.air_hitchance_tab:selectable("Weapons", {
    [1] = "Scout", 
    [2] = "Revolver", 
    [3] = "Awp", 
    [4] = "Auto", 
    [5] = "All"
});
v9.air_hitchance_value = v9.air_hitchance_tab:slider("Hit Chance", 0, 100, 0);
v9.ideal_tick = v15.ragebot:switch("\aE94545FF" .. ui.get_icon("rabbit-running") .. " \aFFFFFFFFIdeal \aE94545FFTick", false);
v9.prev_os = v15.ragebot:switch("\aE94545FF" .. ui.get_icon("eye-slash") .. " \aFFFFFFFFPrevent \aE94545FFOn-Shot", false);
v9.visuals_crosshairid = v15.visuals:switch("\aE94545FF\f<crosshairs>  \aFFFFFFFFCrosshair \aE94545FFIndication", false);
v9.visuals_crosshairid_tab = v9.visuals_crosshairid:create();
v9.visuals_crosshairid_type = v9.visuals_crosshairid_tab:combo("Type", {
    [1] = "Old", 
    [2] = "Release", 
    [3] = "Beta"
});
v9.visuals_crosshairid_add_y = v9.visuals_crosshairid_tab:slider("Add Y", render.screen_size().y / -2, render.screen_size().y / 2, 0);
v9.visuals_crosshairid_main_color = v9.visuals_crosshairid_tab:color_picker("Main");
v9.visuals_crosshairid_state_color = v9.visuals_crosshairid_tab:color_picker("Addative");
v9.visuals_crosshairid_addative_color = v9.visuals_crosshairid_tab:color_picker("Binds");
v9.visuals_crosshairid_glow_color = v9.visuals_crosshairid_tab:color_picker("Glow");
v9.visuals_damageid = v15.visuals:switch("\aE94545FF\f<swords-laser>  \aFFFFFFFFDamage \aE94545FFIndication", false);
v9.visuals_damageid_tab = v9.visuals_damageid:create();
v9.visuals_damageid_pos = v9.visuals_damageid_tab:combo("Position", "Left", "Right");
v9.visuals_damageid_color = v9.visuals_damageid_tab:color_picker("Color");
v9.visuals_velocityid = v15.visuals:switch("\aE94545FF\f<person-falling>  \aFFFFFFFFVelocity \aE94545FFIndication", false);
v9.visuals_velocityid_tab = v9.visuals_velocityid:create();
v9.visuals_velocityid_x = v9.visuals_velocityid_tab:slider("X", 0, render.screen_size().x, render.screen_size().x / 2);
v9.visuals_velocityid_y = v9.visuals_velocityid_tab:slider("Y", 0, render.screen_size().y, render.screen_size().y / 9);
v9.visuals_velocityid_color = v9.visuals_velocityid_tab:color_picker("Color");
v9.visuals_gamesense = v15.visuals:switch(" game\a00E20EFFsense \aE94545FFIndication", false);
v9.visuals_gamesense_tab = v9.visuals_gamesense:create();
v9.visuals_gamesense_menu = v9.visuals_gamesense_tab:switch("Skeet Menu Overlay");
v9.visuals_scopeoverlay = v15.visuals:switch("\aE94545FF\f<person-military-rifle>  \aFFFFFFFFCustom Scope \aE94545FFOverlay", false);
v9.visuals_scopeoverlay_tab = v9.visuals_scopeoverlay:create();
v9.visuals_scopeoverlay_color = v9.visuals_scopeoverlay_tab:color_picker("Color");
v9.visuals_scopeoverlay_gap = v9.visuals_scopeoverlay_tab:slider("Gap", 0, 500, 0);
v9.visuals_scopeoverlay_line_size = v9.visuals_scopeoverlay_tab:slider("Line Size", 0, 500, 0);
v9.visuals_watermark = v15.visuals:switch("\aE94545FF\f<expand>  \aFFFFFFFFWater\aE94545FFmark", false);
v9.visuals_watermark_tab = v9.visuals_watermark:create();
v9.visuals_watermark_place = v9.visuals_watermark_tab:combo("Where", {
    [1] = "Up", 
    [2] = "Down"
});
v9.visuals_watermark_color = v9.visuals_watermark_tab:color_picker("Color", color(28, 225, 37, 255));
v9.visuals_watermark_offset = v9.visuals_watermark_tab:slider("Offset", -890, 890, 0);
v9.visuals_solusui = v15.visuals:switch("\aE94545FF\f<browsers>  \aFFFFFFFFSolus\aE94545FF UI", false);
v9.visuals_solusui_group = v9.visuals_solusui:create();
v9.visuals_solusui_select = v9.visuals_solusui_group:selectable("Select", {
    [1] = "Hotkeys", 
    [2] = "Spectators"
});
v9.visuals_solusui_color = v9.visuals_solusui_group:color_picker("Accent Color", color(144, 169, 133, 255));
v9.visuals_solusui_pos_x = v9.visuals_solusui_group:slider("posx", 0, render.screen_size().x, 234);
v9.visuals_solusui_pos_y = v9.visuals_solusui_group:slider("posy", 0, render.screen_size().y, 454);
v9.visuals_solusui_pos_x1 = v9.visuals_solusui_group:slider("posx1", 0, render.screen_size().x, 250);
v9.visuals_solusui_pos_y1 = v9.visuals_solusui_group:slider("posy1", 0, render.screen_size().y, 250);
v9.clantag = v15.misc:switch("\aE94545FF\f<user-tag>  \aFFFFFFFFClan \aE94545FFTag", false);
v9.misc_trashtalk = v15.misc:switch("\aE94545FF\f<trash-can-list>  \aFFFFFFFFKill \aE94545FFSay", false);
v9.misc_automuteunmute = v15.misc:switch("\aE94545FF\f<volume-slash>  \aFFFFFFFFAuto \aE94545FFMute\aFFFFFFFF/\aE94545FFUnmute", false);
v9.misc_automuteunmute_tab = v9.misc_automuteunmute:create();
v9.misc_automuteunmute_settings = v9.misc_automuteunmute_tab:combo("Auto", "Mute", "Unmute");
v9.misc_automuteunmute_player = v9.misc_automuteunmute_tab:combo("Players", "Enemy", "Every");
v9.misc_taskbarnotify = v15.misc:switch("\aE94545FF\f<square-bolt>  \aFFFFFFFFTaskbar \aE94545FFNotify \aFFFFFFFF[New Round]", false);
v9.misc_aspectratio = v15.misc:switch("\aE94545FF\f<glasses>  \aFFFFFFFFOverride \aE94545FFAspect Ratio", false);
v9.misc_aspectratio_tab = v9.misc_aspectratio:create();
v9.misc_aspectratio_value = v9.misc_aspectratio_tab:slider("Value", 0, 35, 0, 0.1);
v9.misc_viewmodel = v15.misc:switch("\aE94545FF\f<street-view>  \aFFFFFFFFOverride \aE94545FFViewmodel", false);
v9.misc_viewmodel_tab = v9.misc_viewmodel:create();
v9.misc_viewmodel_x = v9.misc_viewmodel_tab:slider("Position X", -10, 10, 0);
v9.misc_viewmodel_y = v9.misc_viewmodel_tab:slider("Position Y", -10, 10, 0);
v9.misc_viewmodel_z = v9.misc_viewmodel_tab:slider("Position Z", -10, 10, 0);
v9.misc_viewmodel_fov = v9.misc_viewmodel_tab:slider("FOV", 0, 120, 0);
v9.misc_fastladder = v15.movement:switch("\aE94545FF\f<water-ladder>  \aFFFFFFFFFast \aE94545FFLadder", false);
v9.breal_lc = v15.movement:switch("\aE94545FF\f<bone-break>  \aFFFFFFFFForce Break \aE94545FFLC In Air", false);
v9.no_fall_damage = v15.movement:switch("\aE94545FF\f<person-falling-burst>  \aFFFFFFFFNo Fall \aE94545FFDamage", false);
v9.avoid_collisions = v15.movement:switch("\aE94545FF\f<transporter-2>  \aFFFFFFFFAvoid \aE94545FFCollisions", false);
v9.avoid_collisions_tab = v9.avoid_collisions:create();
v9.avoid_collisions_distance = v9.avoid_collisions_tab:slider("Distance", 5, 20, 15, 1, "m");
v9.antiaim_enable = v15.antiaim:switch("\aE94545FF\f<shield-halved>  \aFFFFFFFFEnable \aE94545FFAntiAims", false);
v10.addictionals = v15.antiaim:listable(" ", {
    [1] = "\aE94545FF\f<knife-kitchen>  \aFFFFFFFFAvoid \aE94545FFBackstab", 
    [2] = "\aE94545FF\f<user-helmet-safety>  \aFFFFFFFFSafe \aE94545FFHead", 
    [3] = "\aE94545FF\f<user-slash>  \aFFFFFFFFDisable AA \aE94545FFon Warmup", 
    [4] = "\aE94545FF\f<triangle-exclamation>  \aFFFFFFFFAnim. \aE94545FFBreakers", 
    [5] = "\aE94545FF\f<user-pen>  \aFFFFFFFFAnti \aE94545FFBruteforce"
});
v10.addictionals_tab = v10.addictionals:create();
v10.air_legs = v10.addictionals_tab:combo("Air Legs", "Default", "Static", "Walking");
v10.ground_legs = v10.addictionals_tab:combo("Ground Legs", "Default", "Static", "Walking");
v10.sliding_slow_walk = v10.addictionals_tab:switch("Sliding Slow Walk");
v10.manual_yaw_base = v15.antiaim:combo("\aE94545FF\f<arrows-up-down-left-right>  \aFFFFFFFFManual \aE94545FFYaw", "Off", "Left", "Right", "Forward");
v10.freestanding = v15.antiaim:switch("\aE94545FF\f<arrow-right-to-arc>  \aFFFFFFFFFreest\aE94545FFanding", false);
v10.freestanding_tab = v10.freestanding:create();
v10.disable_yaw_modifiers = v10.freestanding_tab:switch("Disable Yaw Modifiers", true);
v10.body_freestanding = v10.freestanding_tab:switch("Body Freestanding", true);
v9.antiaim_condition = v15.builder:combo("", "Standing", "Moving", "Slow Walking", "Crouching", "Air", "Crouching Air", "Legit AA");
v9.cfg_selector = v15.config_system_antiaim:list("", configs_db.menu_list);
v9.name = v15.config_system_antiaim:input("", "New Config");
v9.create = v15.config_system_antiaim:button("      \226\158\149", function()
    -- upvalues: v32 (ref), v9 (ref)
    v32.create_config(v9.name:get());
    v9.cfg_selector:update(configs_db.menu_list);
end, true);
v9.create:tooltip("Create config\n\208\161\208\190\208\183\208\180\208\176\209\130\209\140 \208\186\208\190\208\189\209\132\208\184\208\179\209\131\209\128\208\176\209\134\208\184\209\142");
v9.remove = v15.config_system_antiaim:button(" \240\159\151\145 ", function()
    -- upvalues: v32 (ref), v9 (ref)
    v32.remove_config(v9.cfg_selector:get());
    v9.cfg_selector:update(configs_db.menu_list);
end, true);
v9.remove:tooltip("Remove config\n\208\163\208\180\208\176\208\187\208\184\209\130\209\140 \208\186\208\190\208\189\209\132\208\184\208\179\209\131\209\128\208\176\209\134\208\184\209\142");
v9.save = v15.config_system_antiaim:button(" \240\159\146\190 ", function()
    -- upvalues: v32 (ref), v9 (ref)
    v32.save_config(v9.cfg_selector:get());
end, true);
v9.save:tooltip("Save config\n\208\161\208\190\209\133\209\128\208\176\208\189\208\184\209\130\209\140 \208\186\208\190\208\189\209\132\208\184\208\179\209\131\209\128\208\176\209\134\208\184\209\142");
v9.load = v15.config_system_antiaim:button(" \240\159\147\145 ", function()
    -- upvalues: v32 (ref), v9 (ref)
    v32.update_values(v9.cfg_selector:get());
    v32.load_config(v9.cfg_selector:get());
    v9.cfg_selector:update(configs_db.menu_list);
end, true);
v9.load:tooltip("Load config\n\208\151\208\176\208\179\209\128\209\131\208\183\208\184\209\130\209\140 \208\186\208\190\208\189\209\132\208\184\208\179\209\131\209\128\208\176\209\134\208\184\209\142");
v9.import = v15.config_system_antiaim:button(" \240\159\147\165 ", function()
    -- upvalues: v32 (ref), v9 (ref)
    v32.import_config(v9.cfg_selector:get());
end, true);
v9.import:tooltip("Import config\n\208\152\208\188\208\191\208\190\209\128\209\130 \208\186\208\190\208\189\209\132\208\184\208\179\209\131\209\128\208\176\209\134\208\184\208\184");
v9.export = v15.config_system_antiaim:button("\240\159\147\164      ", function()
    -- upvalues: v32 (ref), v9 (ref)
    v32.export_config(v9.cfg_selector:get());
end, true);
v9.export:tooltip("Export config\n\208\173\208\186\209\129\208\191\208\190\209\128\209\130 \208\186\208\190\208\189\209\132\208\184\208\179\209\131\209\128\208\176\209\134\208\184\208\184");
for v50 = 0, 6 do
    v18[v50] = {};
    v18[v50].pitch = v15.builder:combo("\aE94545FF\f<head-side>  \aFFFFFFFFPitch", "Disabled", "Down", "Fake Down", "Fake Up");
    v18[v50].yaw = v15.builder:combo("\aE94545FF\f<send-backward>  \aFFFFFFFFYaw", "Disabled", "Backward", "Static");
    v18[v50].yaw_base = v15.builder:combo("\aE94545FF\f<arrow-turn-down-right>  \aFFFFFFFFYaw Base", "Local View", "At Target");
    v18[v50].yaw_type = v15.builder:combo("\aE94545FF\f<user-gear>  \aFFFFFFFFYaw Type", {
        [1] = "L&R", 
        [2] = "Tick Based"
    });
    v18[v50].left_offset = v15.builder:slider("\aE94545FF\f<arrow-right-long>  \aFFFFFFFFOffset Left", -180, 180, 0);
    v18[v50].right_offset = v15.builder:slider("\aE94545FF\f<arrow-right-long>  \aFFFFFFFFOffset Right", -180, 180, 0);
    v18[v50].yaw_ticks = v15.builder:slider("\aE94545FF\f<arrow-right-long>  \aFFFFFFFFTicks", 1, 100, 0);
    v18[v50].yaw_modifier = v15.builder:combo("\aE94545FF\f<user-shield>  \aFFFFFFFFYaw \aE94545FFModifier", "Disabled", "Center", "Offset", "Random", "Spin", "3-Way", "5-Way");
    v18[v50].modifier_mode = v15.builder:combo("\aE94545FF\f<arrow-turn-down-right>  \aFFFFFFFFModifier Mode", "Default", "Jitter", "Random", "3 Way", "5 Way");
    v18[v50].modifier_offset = v15.builder:slider("\aE94545FF\f<arrow-right-long>  \aFFFFFFFFOffset", -180, 180, 0);
    v18[v50].modifier_offset_left = v15.builder:slider("\aE94545FF\f<arrow-right-long>  \aFFFFFFFFLeft Offset", -180, 180, 0);
    v18[v50].modifier_offset_right = v15.builder:slider("\aE94545FF\f<arrow-right-long>  \aFFFFFFFFRight Offset", -180, 180, 0);
    v18[v50].modifier_offset_way1 = v15.builder:slider("\aE94545FF\f<arrow-right-long>  \aFFFFFFFFWay #1", -180, 180, 0);
    v18[v50].modifier_offset_way2 = v15.builder:slider("\aE94545FF\f<arrow-right-long>  \aFFFFFFFFWay #2", -180, 180, 0);
    v18[v50].modifier_offset_way3 = v15.builder:slider("\aE94545FF\f<arrow-right-long>  \aFFFFFFFFWay #3", -180, 180, 0);
    v18[v50].modifier_offset_way4 = v15.builder:slider("\aE94545FF\f<arrow-right-long>  \aFFFFFFFFWay #4", -180, 180, 0);
    v18[v50].modifier_offset_way5 = v15.builder:slider("\aE94545FF\f<arrow-right-long>  \aFFFFFFFFWay #5", -180, 180, 0);
    v18[v50].body_yaw = v15.builder:switch("\aE94545FF\f<child-reaching>  \aFFFFFFFFBody \aE94545FFYaw", false);
    v18[v50].body_yaw_tab = v18[v50].body_yaw:create();
    v18[v50].type = v18[v50].body_yaw_tab:combo("Type", {
        [1] = "Default", 
        [2] = "Tick Based", 
        [3] = "L&R"
    });
    v18[v50].left_limit = v18[v50].body_yaw_tab:slider("Left Limit", 0, 60, 0);
    v18[v50].right_limit = v18[v50].body_yaw_tab:slider("Right Limit", 0, 60, 0);
    v18[v50].ticks = v18[v50].body_yaw_tab:slider("Ticks", 1, 100, 0);
    v18[v50].options = v18[v50].body_yaw_tab:selectable("Options", "Avoid Overlap", "Jitter", "Randomize Jitter");
    v18[v50].delay_jitter = v18[v50].body_yaw_tab:slider("Delay Jitter", 0, 1000, 500, 1, function(v51)
        if v51 == 0 then
            return "NL";
        else
            return v51 .. "ms";
        end;
    end);
    v18[v50].freestanding = v18[v50].body_yaw_tab:combo("Freestanding", "Off", "Peek Fake", "Peek Real");
    v18[v50].defensive_aa = v15.builder:switch("\aFFDD63FF\f<shield-check>  \aFFDD63FFDefensive Anti Aim ", false);
    v18[v50].defensive_aa_tab = v18[v50].defensive_aa:create();
    v18[v50].defensive_aa_pitch = v18[v50].defensive_aa_tab:combo("Pitch", "Disabled", "Down", "Fake Down", "Fake Up", "Random", "Semi Up", "Custom", "L&R", "Random L&R");
    v18[v50].pitchslider = v18[v50].defensive_aa_tab:slider("Pitch", -89, 89, 0);
    v18[v50].pitchleft = v18[v50].defensive_aa_tab:slider("Pitch Left", -89, 89, 0);
    v18[v50].pitchright = v18[v50].defensive_aa_tab:slider("Pitch Right", -89, 89, 0);
    v18[v50].randompitch1 = v18[v50].defensive_aa_tab:slider("Pitch Random Left", -89, 89, 0);
    v18[v50].randompitch2 = v18[v50].defensive_aa_tab:slider("Pitch Random Right", -89, 89, 0);
    v18[v50].defensive_aa_yaw = v18[v50].defensive_aa_tab:combo("Yaw", "Disabled", "Center", "Offset", "Random", "Spin", "3-Way", "5-Way", "Custom", "L&R", "Random L&R");
    v18[v50].slideryaw = v18[v50].defensive_aa_tab:slider("Yaw Add", -180, 180, 0);
    v18[v50].leftyaw = v18[v50].defensive_aa_tab:slider("Yaw Left", -180, 180, 0);
    v18[v50].rightyaw = v18[v50].defensive_aa_tab:slider("Yaw Right", -180, 180, 0);
    v18[v50].randomyaw1 = v18[v50].defensive_aa_tab:slider("Yaw Random Left", -180, 180, 0);
    v18[v50].randomyaw2 = v18[v50].defensive_aa_tab:slider("Yaw Random Right", -180, 180, 0);
    v18[v50].defensive_aa_disablers = v18[v50].defensive_aa_tab:selectable("Disablers", "Freestanding", "Manual Yaw", "Hide Shots", "Double Tap", "Safe Head");
    v18[v50].defensive_aa_sensivity = v18[v50].defensive_aa_tab:slider("Sensivity", 0, 100, 20, 1, "%");
end;
v7.enabled = false;
v7.start_time = globals.realtime;
v17.anti_aim_on_use = function(v52)
    -- upvalues: v7 (ref)
    v7.enabled = false;
    if not v52.in_use then
        v7.start_time = globals.realtime;
        return;
    else
        local v53 = entity.get_local_player();
        if v53 == nil then
            return;
        else
            local v54 = v53:get_origin();
            local v55 = entity.get_entities("CPlantedC4");
            local v56 = 999;
            if #v55 > 0 then
                v56 = v54:dist((v55[1]:get_origin()));
            end;
            local v57 = entity.get_entities("CHostage");
            local v58 = 999;
            if #v57 > 0 then
                local v59 = {
                    v57[1]:get_origin(), 
                    v57[2]:get_origin()
                };
                v58 = math.min(v54:dist(v59[1]), v54:dist(v59[2]));
            end;
            if v58 < 65 and v53.m_iTeamNum ~= 2 then
                return;
            elseif v56 < 65 and v53.m_iTeamNum ~= 2 then
                return;
            elseif v52.in_use and globals.realtime - v7.start_time < 0.02 then
                return;
            else
                v52.in_use = false;
                v7.enabled = true;
                return;
            end;
        end;
    end;
end;
v17.state = function()
    -- upvalues: v14 (ref), v7 (ref)
    if not entity.get_local_player() then
        return;
    else
        local v60 = math.sqrt(entity.get_local_player().m_vecVelocity.x ^ 2 + entity.get_local_player().m_vecVelocity.y ^ 2) < 2;
        local v61 = bit.band(entity.get_local_player().m_fFlags, 1) == 0;
        local v62 = entity.get_local_player().m_flDuckAmount > 0.5;
        local v63 = v62 and v62 and not v60;
        local v64 = v14.slow_walk:get();
        local l_enabled_0 = v7.enabled;
        if v64 and not l_enabled_0 then
            return "walking";
        elseif v62 and not v61 and not l_enabled_0 then
            return "ducking";
        elseif v61 and not v62 and not l_enabled_0 then
            return "jumping";
        elseif v63 and not l_enabled_0 then
            return "ducking_in_jumping";
        elseif v60 and not l_enabled_0 then
            return "standing";
        elseif not v60 and not v62 and not l_enabled_0 then
            return "running";
        elseif l_enabled_0 then
            return "legit_aa";
        else
            return;
        end;
    end;
end;
v24.time_to_ticks = function(v66)
    return math.floor(0.5 + v66 / globals.tickinterval);
end;
v24.defensive = false;
v24.defensive_ticks = 0;
v24.system = function()
    -- upvalues: v9 (ref), v17 (ref), v18 (ref), v14 (ref), v10 (ref), v24 (ref)
    local v67 = 0;
    local v68 = 0;
    if v9.antiaim_condition:get() == "Standing" then
        v67 = 0;
    end;
    if v9.antiaim_condition:get() == "Moving" then
        v67 = 1;
    end;
    if v9.antiaim_condition:get() == "Slow Walking" then
        v67 = 2;
    end;
    if v9.antiaim_condition:get() == "Crouching" then
        v67 = 3;
    end;
    if v9.antiaim_condition:get() == "Air" then
        v67 = 4;
    end;
    if v9.antiaim_condition:get() == "Crouching Air" then
        v67 = 5;
    end;
    if v9.antiaim_condition:get() == "Legit AA" then
        v67 = 6;
    end;
    if v17.state() == "standing" then
        v68 = 0;
    end;
    if v17.state() == "running" then
        v68 = 1;
    end;
    if v17.state() == "walking" then
        v68 = 2;
    end;
    if v17.state() == "ducking" then
        v68 = 3;
    end;
    if v17.state() == "jumping" then
        v68 = 4;
    end;
    if v17.state() == "ducking_in_jumping" then
        v68 = 5;
    end;
    if v17.state() == "legit_aa" then
        v68 = 6;
    end;
    local v69 = entity.get_local_player();
    if not v69 then
        return;
    else
        local v70 = v69:get_player_weapon(false):get_classname() == "CKnife";
        if v18[v68].defensive_aa:get() then
            ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden"):set(true);
            ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"):override("Always On");
            ui.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options"):override("Break LC");
            if v18[v68].defensive_aa_disablers:get("Freestanding") and v14.freestanding:get() then
                return;
            elseif v18[v68].defensive_aa_disablers:get("Manual Yaw") and v10.manual_yaw_base:get() ~= "Off" then
                return;
            elseif v18[v68].defensive_aa_disablers:get("Hide Shots") and v14.hide_shots:get() then
                ui.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options"):override("");
                return;
            elseif v18[v68].defensive_aa_disablers:get("Double Tap") and v14.double_tap:get() then
                return;
            elseif v18[v68].defensive_aa_disablers:get("Safe Head") and v10.addictionals:get(2) and v70 then
                return;
            else
                local _ = false;
                local _ = v69:get_simulation_time();
                v24.defensive = v18[v68].defensive_aa:get();
            end;
        else
            ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"):override(nil);
            ui.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options"):override(nil);
            ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden"):override(nil);
        end;
        return;
    end;
end;
v17.side = false;
v17.current_tick = v24.time_to_ticks(globals.realtime);
v17.antibrute_time_last = globals.realtime;
v17.delay_time = globals.realtime;
v17.delay_switch = false;
v17.desync_side = function()
    -- upvalues: v17 (ref)
    if entity.get_local_player() == nil then
        return;
    elseif globals.choked_commands ~= 0 then
        return;
    else
        v17.side = entity.get_local_player().m_flPoseParameter[11] * -120 - 120 < 0;
        return;
    end;
end;
v17.main = function(v73)
    -- upvalues: v9 (ref), v17 (ref), v10 (ref), v14 (ref), v24 (ref), v18 (ref)
    local v74 = 0;
    local v75 = 0;
    if v9.antiaim_condition:get() == "Standing" then
        v74 = 0;
    end;
    if v9.antiaim_condition:get() == "Moving" then
        v74 = 1;
    end;
    if v9.antiaim_condition:get() == "Slow Walking" then
        v74 = 2;
    end;
    if v9.antiaim_condition:get() == "Crouching" then
        v74 = 3;
    end;
    if v9.antiaim_condition:get() == "Air" then
        v74 = 4;
    end;
    if v9.antiaim_condition:get() == "Crouching Air" then
        v74 = 5;
    end;
    if v9.antiaim_condition:get() == "Legit AA" then
        v74 = 6;
    end;
    if v17.state() == "standing" then
        v75 = 0;
    end;
    if v17.state() == "running" then
        v75 = 1;
    end;
    if v17.state() == "walking" then
        v75 = 2;
    end;
    if v17.state() == "ducking" then
        v75 = 3;
    end;
    if v17.state() == "jumping" then
        v75 = 4;
    end;
    if v17.state() == "ducking_in_jumping" then
        v75 = 5;
    end;
    if v17.state() == "legit_aa" then
        v75 = 6;
    end;
    if v9.antiaim_enable:get() then
        if entity.get_game_rules().m_bWarmupPeriod == true and v10.addictionals:get(3) then
            return;
        else
            if v10.addictionals:get(5) then
                v14.body_yaw:override(true);
                v14.options:override("Anti Bruteforce");
            end;
            if v24.defensive and v18[v75].defensive_aa:get() and (not is_knife or not v10.addictionals:get(2) or v75 ~= 4 and v75 ~= 5) then
                local v76 = utils.random_int(1, 3);
                if v18[v75].defensive_aa_pitch:get() == "Random" then
                    if v76 == 1 then
                        v14.pitch:override("Down");
                    elseif v76 == 2 then
                        v14.pitch:override("Fake Up");
                    elseif v76 == 3 then
                        v14.pitch:override("Disabled");
                    end;
                elseif v18[v75].defensive_aa_pitch:get() == "Semi Up" then
                    rage.antiaim:override_hidden_pitch(45);
                elseif v18[v75].defensive_aa_pitch:get() == "L&R" then
                    rage.antiaim:override_hidden_pitch(v17.side and v18[v75].pitchleft:get() or v18[v75].pitchright:get());
                elseif v18[v75].defensive_aa_pitch:get() == "Random L&R" then
                    rage.antiaim:override_hidden_pitch(math.random(v18[v75].randompitch1:get(), v18[v75].randompitch2:get()));
                elseif v18[v75].defensive_aa_pitch:get() == "Custom" then
                    rage.antiaim:override_hidden_pitch(v18[v75].pitchslider:get());
                else
                    v14.pitch:override(v18[v75].defensive_aa_pitch:get());
                end;
            else
                v14.pitch:override(v18[v75].pitch:get());
            end;
            v14.yaw_base:override(v18[v75].yaw_base:get());
            if not v24.defensive or not v18[v75].defensive_aa:get() or is_knife and v10.addictionals:get(2) and (v75 == 4 or v75 == 5) then
                if v18[v75].defensive_aa_yaw:get() == "3-Way" then
                    local v77 = v73.tickcount % 3;
                    if v77 == 0 then
                        rage.antiaim:override_hidden_yaw_offset(utils.random_int(-110, -90));
                    elseif v77 == 1 then
                        rage.antiaim:override_hidden_yaw_offset(utils.random_int(90, 120));
                    elseif v77 == 2 then
                        rage.antiaim:override_hidden_yaw_offset(utils.random_int(-180, -150));
                    end;
                elseif v18[v75].defensive_aa_yaw:get() == "5-Way" then
                    local v78 = v73.tickcount % 5;
                    if v78 == 0 then
                        rage.antiaim:override_hidden_yaw_offset(utils.random_int(-90, -75));
                    elseif v78 == 1 then
                        rage.antiaim:override_hidden_yaw_offset(utils.random_int(-45, -30));
                    elseif v78 == 2 then
                        rage.antiaim:override_hidden_yaw_offset(utils.random_int(-180, -160));
                    elseif v78 == 3 then
                        rage.antiaim:override_hidden_yaw_offset(utils.random_int(45, 60));
                    elseif v78 == 4 then
                        rage.antiaim:override_hidden_yaw_offset(utils.random_int(90, 110));
                    end;
                elseif v18[v75].defensive_aa_yaw:get() == "Spin" then
                    local v79 = globals.curtime * 1000;
                    v79 = math.normalize_yaw(v79);
                    rage.antiaim:override_hidden_yaw_offset(v79);
                elseif v18[v75].defensive_aa_yaw:get() == "Random" then
                    local v80 = v73.tickcount % 5;
                    if v80 == 0 then
                        rage.antiaim:override_hidden_yaw_offset(utils.random_int(-90, -75));
                    elseif v80 == 1 then
                        rage.antiaim:override_hidden_yaw_offset(utils.random_int(-45, -30));
                    elseif v80 == 2 then
                        rage.antiaim:override_hidden_yaw_offset(utils.random_int(-180, -160));
                    elseif v80 == 3 then
                        rage.antiaim:override_hidden_yaw_offset(utils.random_int(45, 60));
                    elseif v80 == 4 then
                        rage.antiaim:override_hidden_yaw_offset(utils.random_int(90, 110));
                    end;
                elseif v18[v75].defensive_aa_yaw:get() == "Custom" then
                    rage.antiaim:override_hidden_yaw_offset(v18[v75].slideryaw:get());
                elseif v18[v75].defensive_aa_yaw:get() == "L&R" then
                    rage.antiaim:override_hidden_yaw_offset(v17.side and v18[v75].rightyaw:get() or v18[v75].leftyaw:get());
                elseif v18[v75].defensive_aa_yaw:get() == "Random L&R" then
                    rage.antiaim:override_hidden_yaw_offset(math.random(v18[v75].randomyaw1:get(), v18[v75].randomyaw2:get()));
                end;
            end;
            v14.body_yaw:override(true);
            if v18[v75].type:get() == "Default" then
                v14.left_limit:override(v18[v75].left_limit:get());
                v14.right_limit:override(v18[v75].right_limit:get());
            elseif v18[v75].type:get() == "Tick Based" then
                if is_knife and v10.addictionals:get(2) and (v75 == 4 or v75 == 5) then
                    return;
                else
                    local v81 = false;
                    local v82 = v24.time_to_ticks(globals.realtime) - v17.current_tick;
                    local v83 = v18[v75].ticks:get();
                    if v83 <= v82 * 2 then
                        v14.inventer:override(true);
                        v81 = true;
                    else
                        v14.inventer:override(false);
                        v81 = false;
                    end;
                    if v83 <= v82 then
                        v17.current_tick = v24.time_to_ticks(globals.realtime);
                    end;
                    v14.left_limit:override(v81 and v18[v75].left_limit:get() or v18[v75].left_limit:get());
                    v14.right_limit:override(v81 and v18[v75].right_limit:get() or v18[v75].right_limit:get());
                end;
            elseif v18[v75].type:get() == "L&R" then
                if is_knife and v10.addictionals:get(2) and (v75 == 4 or v75 == 5) then
                    return;
                else
                    v14.left_limit:override(v17.side and v18[v75].right_limit:get() or v18[v75].left_limit:get());
                    v14.right_limit:override(v17.side and v18[v75].left_limit:get() or v18[v75].right_limit:get());
                end;
            end;
            if v18[v75].options:get(2) and v18[v75].delay_jitter:get() > 0 then
                v14.options:override();
                if v17.delay_time + v18[v75].delay_jitter:get() / 1000 < globals.realtime then
                    v17.delay_switch = not v17.delay_switch;
                    v17.delay_time = globals.realtime;
                end;
                v14.inventer:override(v17.delay_switch and true or false);
            end;
            v14.freestandingt:override(v18[v75].freestanding:get());
            v14.freestanding:override(v10.freestanding:get());
            v14.body_freestanding:override(v10.body_freestanding:get());
            v14.disable_yaw_modifiers:override(v10.disable_yaw_modifiers:get());
            if v10.manual_yaw_base:get() == "Off" then
                if v18[v75].yaw_type:get() == "Tick Based" then
                    local v84 = false;
                    local v85 = v24.time_to_ticks(globals.realtime) - v17.current_tick;
                    local v86 = v18[v75].yaw_ticks:get();
                    v84 = v86 <= v85 * 0;
                    if v86 <= v85 then
                        v17.current_tick = v24.time_to_ticks(globals.realtime);
                    end;
                    yaw_offset = v84 and v18[v75].right_offset:get() or v18[v75].left_offset:get();
                else
                    yaw_offset = v17.side and v18[v75].right_offset:get() or v18[v75].left_offset:get();
                end;
            elseif v10.manual_yaw_base:get() == "Left" then
                yaw_offset = -90;
            elseif v10.manual_yaw_base:get() == "Right" then
                yaw_offset = 90;
            else
                yaw_offset = -180;
            end;
            v14.yaw_offset:override(yaw_offset);
            if entity.get_local_player():get_player_weapon(false):get_classname() == "CKnife" and v10.addictionals:get(2) and (v75 == 4 or v75 == 5) then
                v14.yaw_offset:override(0);
                v14.yaw_modifier_offset:override(0);
                v14.yaw_modifier:override("Disabled");
                v14.body_yaw:override(false);
                v14.options:override("");
                v14.left_limit:override(0);
                v14.right_limit:override(0);
                v14.inventer:override(false);
            end;
            if v18[v75].modifier_mode:get() == "Default" then
                v14.yaw_modifier_offset:override(v18[v75].modifier_offset:get());
            elseif v18[v75].modifier_mode:get() == "Jitter" then
                local v87 = v17.side and v18[v75].modifier_offset_right:get() or v18[v75].modifier_offset_left:get();
                v14.yaw_modifier_offset:override(v87);
            elseif v18[v75].modifier_mode:get() == "Random" then
                local v88 = utils.random_int(v18[v75].modifier_offset_right:get(), v18[v75].modifier_offset_left:get());
                v14.yaw_modifier_offset:override(v88);
            elseif v18[v75].modifier_mode:get() == "3 Way" then
                if globals.tickcount % 3 == 0 then
                    v14.yaw_modifier_offset:override(v18[v75].modifier_offset_way1:get());
                elseif globals.tickcount % 3 == 1 then
                    v14.yaw_modifier_offset:override(v18[v75].modifier_offset_way2:get());
                elseif globals.tickcount % 3 == 2 then
                    v14.yaw_modifier_offset:override(v18[v75].modifier_offset_way3:get());
                end;
            elseif v18[v75].modifier_mode:get() == "5 Way" then
                if globals.tickcount % 5 == 0 then
                    v14.yaw_modifier_offset:override(v18[v75].modifier_offset_way1:get());
                elseif globals.tickcount % 5 == 1 then
                    v14.yaw_modifier_offset:override(v18[v75].modifier_offset_way2:get());
                elseif globals.tickcount % 5 == 2 then
                    v14.yaw_modifier_offset:override(v18[v75].modifier_offset_way3:get());
                elseif globals.tickcount % 5 == 3 then
                    v14.yaw_modifier_offset:override(v18[v75].modifier_offset_way4:get());
                elseif globals.tickcount % 5 == 4 then
                    v14.yaw_modifier_offset:override(v18[v75].modifier_offset_way5:get());
                end;
            end;
            v14.avoid_backstab:override(v10.addictionals:get(1));
            v14.yaw_modifier:override(v18[v75].yaw_modifier:get());
        end;
    else
        v14.pitch:override(nil);
        v14.yaw_base:override(nil);
        v14.yaw:override(nil);
        v14.yaw_modifier:override(nil);
        v14.body_yaw:override(nil);
        v14.left_limit:override(nil);
        v14.right_limit:override(nil);
        v14.options:override(nil);
        v14.freestandingt:override(nil);
        v14.freestanding:override(nil);
        v14.body_freestanding:override(nil);
        v14.disable_yaw_modifiers:override(nil);
        v14.yaw_offset:override(nil);
        v14.yaw_modifier_offset:override(nil);
        v14.avoid_backstab:override(nil);
        v14.hidden:override(nil);
    end;
end;
v17.visibility_manager = function()
    -- upvalues: v9 (ref), v17 (ref), v18 (ref), v10 (ref)
    local v89 = 0;
    local v90 = 0;
    if v9.antiaim_condition:get() == "Standing" then
        v89 = 0;
    end;
    if v9.antiaim_condition:get() == "Moving" then
        v89 = 1;
    end;
    if v9.antiaim_condition:get() == "Slow Walking" then
        v89 = 2;
    end;
    if v9.antiaim_condition:get() == "Crouching" then
        v89 = 3;
    end;
    if v9.antiaim_condition:get() == "Air" then
        v89 = 4;
    end;
    if v9.antiaim_condition:get() == "Crouching Air" then
        v89 = 5;
    end;
    if v9.antiaim_condition:get() == "Legit AA" then
        v89 = 6;
    end;
    if v17.state() == "standing" then
        v90 = 0;
    end;
    if v17.state() == "running" then
        v90 = 1;
    end;
    if v17.state() == "walking" then
        v90 = 2;
    end;
    if v17.state() == "ducking" then
        v90 = 3;
    end;
    if v17.state() == "jumping" then
        v90 = 4;
    end;
    if v17.state() == "ducking_in_jumping" then
        v90 = 5;
    end;
    if v17.state() == "legit_aa" then
        v90 = 6;
    end;
    for _, v92 in pairs(v18[0]) do
        v92:visibility(v9.antiaim_condition:get() == "Standing");
    end;
    for _, v94 in pairs(v18[1]) do
        v94:visibility(v9.antiaim_condition:get() == "Moving");
    end;
    for _, v96 in pairs(v18[2]) do
        v96:visibility(v9.antiaim_condition:get() == "Slow Walking");
    end;
    for _, v98 in pairs(v18[3]) do
        v98:visibility(v9.antiaim_condition:get() == "Crouching");
    end;
    for _, v100 in pairs(v18[4]) do
        v100:visibility(v9.antiaim_condition:get() == "Air");
    end;
    for _, v102 in pairs(v18[5]) do
        v102:visibility(v9.antiaim_condition:get() == "Crouching Air");
    end;
    for _, v104 in pairs(v18[6]) do
        v104:visibility(v9.antiaim_condition:get() == "Legit AA");
    end;
    v18[v89].modifier_offset:visibility(false);
    v18[v89].modifier_offset_left:visibility(false);
    v18[v89].modifier_offset_right:visibility(false);
    v18[v89].modifier_offset_way1:visibility(false);
    v18[v89].modifier_offset_way2:visibility(false);
    v18[v89].modifier_offset_way3:visibility(false);
    v18[v89].modifier_offset_way4:visibility(false);
    v18[v89].modifier_offset_way5:visibility(false);
    v18[v89].pitch:visibility(false);
    v18[v89].left_offset:visibility(false);
    v18[v89].right_offset:visibility(false);
    v18[v89].yaw_modifier:visibility(false);
    v18[v89].modifier_mode:visibility(false);
    v18[v89].freestanding:visibility(false);
    v18[v89].left_limit:visibility(false);
    v18[v89].right_limit:visibility(false);
    v18[v89].options:visibility(false);
    v18[v89].yaw_base:visibility(false);
    v18[v89].yaw_ticks:visibility(false);
    v18[v89].yaw_type:visibility(false);
    v10.addictionals:visibility(false);
    v18[v89].defensive_aa:visibility(false);
    v18[v89].body_yaw:visibility(false);
    v18[v89].yaw:visibility(false);
    v9.visuals_velocityid_x:visibility(false);
    v9.visuals_velocityid_y:visibility(false);
    v9.visuals_solusui_pos_x:visibility(false);
    v9.visuals_solusui_pos_y:visibility(false);
    v9.visuals_solusui_pos_x1:visibility(false);
    v9.visuals_solusui_pos_y1:visibility(false);
    v10.manual_yaw_base:visibility(false);
    v10.freestanding:visibility(false);
    v10.disable_yaw_modifiers:visibility(false);
    v10.body_freestanding:visibility(false);
    v9.antiaim_condition:visibility(false);
    v9.cfg_selector:visibility(false);
    v9.name:visibility(false);
    v9.create:visibility(false);
    v9.remove:visibility(false);
    v9.save:visibility(false);
    v9.load:visibility(false);
    v9.import:visibility(false);
    v9.export:visibility(false);
    v9.aimbotlogs_print:visibility(v9.visuals_aimbotlogs:get());
    v9.aimbotlogs_color:visibility(v9.visuals_aimbotlogs:get());
    v9.no_scope_hitchance_weapons:visibility(v9.no_scope_hitchance:get());
    v9.no_scope_hitchance_value:visibility(v9.no_scope_hitchance:get());
    v9.no_scope_hitchance_distance:visibility(v9.no_scope_hitchance:get());
    v9.air_hitchance_weapons:visibility(v9.air_hitchance:get());
    v9.air_hitchance_value:visibility(v9.air_hitchance:get());
    v9.visuals_crosshairid_type:visibility(v9.visuals_crosshairid:get());
    v9.visuals_crosshairid_add_y:visibility(v9.visuals_crosshairid:get());
    v9.visuals_crosshairid_main_color:visibility(v9.visuals_crosshairid:get());
    v9.visuals_crosshairid_state_color:visibility(v9.visuals_crosshairid:get());
    v9.visuals_crosshairid_addative_color:visibility(v9.visuals_crosshairid:get());
    v9.visuals_crosshairid_glow_color:visibility(v9.visuals_crosshairid:get());
    v9.visuals_damageid_pos:visibility(v9.visuals_damageid:get());
    v9.visuals_damageid_color:visibility(v9.visuals_damageid:get());
    v9.visuals_velocityid_color:visibility(v9.visuals_velocityid:get());
    v9.visuals_gamesense_menu:visibility(v9.visuals_gamesense:get());
    v9.visuals_scopeoverlay_color:visibility(v9.visuals_scopeoverlay:get());
    v9.visuals_scopeoverlay_gap:visibility(v9.visuals_scopeoverlay:get());
    v9.visuals_scopeoverlay_line_size:visibility(v9.visuals_scopeoverlay:get());
    v9.visuals_watermark_place:visibility(v9.visuals_watermark:get());
    v9.visuals_watermark_color:visibility(v9.visuals_watermark:get());
    v9.visuals_watermark_offset:visibility(v9.visuals_watermark:get());
    v9.visuals_solusui_select:visibility(v9.visuals_solusui:get());
    v9.visuals_solusui_color:visibility(v9.visuals_solusui:get());
    v9.misc_automuteunmute_settings:visibility(v9.misc_automuteunmute:get());
    v9.misc_automuteunmute_player:visibility(v9.misc_automuteunmute:get());
    v9.misc_aspectratio_value:visibility(v9.misc_aspectratio:get());
    v9.misc_viewmodel_x:visibility(v9.misc_viewmodel:get());
    v9.misc_viewmodel_y:visibility(v9.misc_viewmodel:get());
    v9.misc_viewmodel_z:visibility(v9.misc_viewmodel:get());
    v9.misc_viewmodel_fov:visibility(v9.misc_viewmodel:get());
    v9.avoid_collisions_distance:visibility(v9.avoid_collisions:get());
    v10.air_legs:visibility(v10.addictionals:get(4));
    v10.ground_legs:visibility(v10.addictionals:get(4));
    v10.sliding_slow_walk:visibility(v10.addictionals:get(4));
    if v9.antiaim_enable:get() then
        ui.find("Aimbot", "Anti Aim", "Angles", "Enabled"):override(true);
        v10.manual_yaw_base:visibility(true);
        v10.freestanding:visibility(true);
        v10.disable_yaw_modifiers:visibility(true);
        v10.body_freestanding:visibility(true);
        v9.antiaim_condition:visibility(true);
        v9.cfg_selector:visibility(true);
        v9.name:visibility(true);
        v9.create:visibility(true);
        v9.remove:visibility(true);
        v9.save:visibility(true);
        v9.load:visibility(true);
        v9.import:visibility(true);
        v9.export:visibility(true);
        v18[v89].pitch:visibility(true);
        v18[v89].left_offset:visibility(true);
        v18[v89].right_offset:visibility(true);
        v18[v89].yaw_modifier:visibility(true);
        v18[v89].modifier_mode:visibility(true);
        v18[v89].freestanding:visibility(true);
        v18[v89].left_limit:visibility(true);
        v18[v89].right_limit:visibility(true);
        v18[v89].options:visibility(true);
        v18[v89].delay_jitter:visibility(v18[v89].options:get(2));
        v18[v89].yaw_base:visibility(true);
        v18[v89].yaw_ticks:visibility(true);
        v18[v89].yaw_type:visibility(true);
        v10.addictionals:visibility(true);
        v18[v89].defensive_aa:visibility(true);
        v18[v89].body_yaw:visibility(true);
        v18[v89].yaw:visibility(true);
        v18[v89].yaw_base:visibility(v18[v89].yaw:get() ~= "Disabled");
        v18[v89].left_offset:visibility(v18[v89].yaw:get() ~= "Disabled");
        v18[v89].right_offset:visibility(v18[v89].yaw:get() ~= "Disabled");
        v18[v89].modifier_mode:visibility(v18[v89].yaw_modifier:get() ~= "Disabled");
        v18[v89].modifier_offset:visibility(v18[v89].yaw_modifier:get() ~= "Disabled" and v18[v89].modifier_mode:get() == "Default");
        v18[v89].ticks:visibility(v18[v89].type:get() == "Tick Based");
        v18[v89].yaw_ticks:visibility(v18[v89].yaw_type:get() == "Tick Based");
        v18[v89].pitchslider:visibility(v18[v89].defensive_aa_pitch:get() == "Custom");
        v18[v89].pitchleft:visibility(v18[v89].defensive_aa_pitch:get() == "L&R");
        v18[v89].pitchright:visibility(v18[v89].defensive_aa_pitch:get() == "L&R");
        v18[v89].slideryaw:visibility(v18[v89].defensive_aa_yaw:get() == "Custom");
        v18[v89].leftyaw:visibility(v18[v89].defensive_aa_yaw:get() == "L&R");
        v18[v89].rightyaw:visibility(v18[v89].defensive_aa_yaw:get() == "L&R");
        v18[v89].randomyaw1:visibility(v18[v89].defensive_aa_yaw:get() == "Random L&R");
        v18[v89].randomyaw2:visibility(v18[v89].defensive_aa_yaw:get() == "Random L&R");
        v18[v89].randompitch1:visibility(v18[v89].defensive_aa_pitch:get() == "Random L&R");
        v18[v89].randompitch2:visibility(v18[v89].defensive_aa_pitch:get() == "Random L&R");
        if v18[v89].modifier_mode:get() == "Default" then
            v18[v89].modifier_offset:visibility(v18[v89].yaw_modifier:get() ~= "Disabled");
        elseif v18[v89].modifier_mode:get() == "Jitter" or v18[v89].modifier_mode:get() == "Random" then
            v18[v89].modifier_offset_left:visibility(v18[v89].yaw_modifier:get() ~= "Disabled");
            v18[v89].modifier_offset_right:visibility(v18[v89].yaw_modifier:get() ~= "Disabled");
        elseif v18[v89].modifier_mode:get() == "3 Way" then
            v18[v89].modifier_offset_way1:visibility(v18[v89].yaw_modifier:get() ~= "Disabled");
            v18[v89].modifier_offset_way2:visibility(v18[v89].yaw_modifier:get() ~= "Disabled");
            v18[v89].modifier_offset_way3:visibility(v18[v89].yaw_modifier:get() ~= "Disabled");
        elseif v18[v89].modifier_mode:get() == "5 Way" then
            v18[v89].modifier_offset_way1:visibility(v18[v89].yaw_modifier:get() ~= "Disabled");
            v18[v89].modifier_offset_way2:visibility(v18[v89].yaw_modifier:get() ~= "Disabled");
            v18[v89].modifier_offset_way3:visibility(v18[v89].yaw_modifier:get() ~= "Disabled");
            v18[v89].modifier_offset_way4:visibility(v18[v89].yaw_modifier:get() ~= "Disabled");
            v18[v89].modifier_offset_way5:visibility(v18[v89].yaw_modifier:get() ~= "Disabled");
        end;
    else
        ui.find("Aimbot", "Anti Aim", "Angles", "Enabled"):override(false);
    end;
end;
v20.fast_ladder = function(v105)
    if not entity.get_local_player() then
        return;
    elseif entity.get_local_player().m_MoveType ~= 9 then
        return;
    else
        local v106 = {
            [1] = 43, 
            [2] = 44, 
            [3] = 45, 
            [4] = 46, 
            [5] = 47, 
            [6] = 48
        };
        for _, v108 in pairs(v106) do
            if entity.get_local_player():get_player_weapon():get_weapon_index() == v108 then
                return;
            end;
        end;
        v105.in_moveleft = v105.in_back;
        if v105.sidemove == 0 then
            v105.view_angles.y = v105.view_angles.y + 45;
        end;
        if v105.in_forward and v105.sidemove < 0 then
            v105.view_angles.y = v105.view_angles.y + 90;
        end;
        if v105.in_back and v105.sidemove > 0 then
            v105.view_angles.y = v105.view_angles.y + 90;
        end;
        if v105.view_angles.x < 0 then
            v105.view_angles.x = -45;
        end;
        v105.in_moveright = v105.in_forward;
        return;
    end;
end;
v26.trace = function(v109)
    local v110 = math.pi * 2;
    local v111 = v110 / 8;
    local l_x_0 = entity.get_local_player().m_vecOrigin.x;
    local l_y_0 = entity.get_local_player().m_vecOrigin.y;
    local l_z_0 = entity.get_local_player().m_vecOrigin.z;
    for v115 = 0, v110, v111 do
        local v116 = 10 * math.cos(v115) + l_x_0;
        local v117 = 10 * math.sin(v115) + l_y_0;
        local v118 = utils.trace_line(vector(v116, v117, l_z_0), vector(v116, v117, l_z_0 - v109), entity.get_local_player());
        local l_fraction_0 = v118.fraction;
        local _ = v118.entity;
        if l_fraction_0 ~= 1 then
            return true;
        end;
    end;
    return false;
end;
v26.handle = function(v121)
    -- upvalues: v9 (ref), v26 (ref)
    if not v9.no_fall_damage:get() then
        return;
    else
        self = entity.get_local_player();
        if self == nil then
            return;
        else
            if self.m_vecVelocity.z >= -500 then
                no_fall_damage = false;
            elseif v26.trace(15) then
                no_fall_damage = false;
            elseif v26.trace(75) then
                no_fall_damage = true;
            end;
            if self.m_vecVelocity.z < -500 then
                if no_fall_damage then
                    v121.in_duck = 1;
                else
                    v121.in_duck = 0;
                end;
            end;
            return;
        end;
    end;
end;
v27.vector = function(v122, v123)
    local v124 = nil;
    local v125 = nil;
    local v126 = nil;
    local v127 = nil;
    v124 = math.sin(math.rad(v122));
    v125 = math.sin(math.rad(v123));
    v126 = math.cos(math.rad(v122));
    v127 = math.cos(math.rad(v123));
    return vector(v126 * v127, v126 * v125, -v124);
end;
v27.velocity = function(v128)
    if v128 == nil then
        return;
    else
        return (v128.m_vecVelocity:length());
    end;
end;
v27.handle = function(v129)
    -- upvalues: v9 (ref), v27 (ref)
    local v130 = entity.get_local_player();
    if not v130 then
        return;
    elseif not v9.avoid_collisions:get() then
        return;
    else
        local v131 = v9.avoid_collisions_distance:get();
        local l_y_1 = render.camera_angles().y;
        local l_m_vecOrigin_0 = v130.m_vecOrigin;
        local l_huge_0 = math.huge;
        local l_huge_1 = math.huge;
        for v136 = 1, 180 do
            local l_x_1 = v27.vector(0, l_y_1 + v136 - 90).x;
            local l_y_2 = v27.vector(0, l_y_1 + v136 - 90).y;
            local _ = v27.vector(0, l_y_1).z;
            local v140 = l_m_vecOrigin_0.x + l_x_1 * 70;
            local v141 = l_m_vecOrigin_0.y + l_y_2 * 70;
            local v142 = l_m_vecOrigin_0.z + 60;
            local v143 = utils.trace_line(l_m_vecOrigin_0, vector(v140, v141, v142), nil, nil, 1);
            if l_m_vecOrigin_0:dist(v143.end_pos) < l_huge_0 then
                l_huge_0 = l_m_vecOrigin_0:dist(v143.end_pos);
                l_huge_1 = v136;
            end;
        end;
        if l_huge_0 < 25 + v131 and v129.in_jump and not v129.in_moveright and not v129.in_moveleft and not v129.in_back then
            forward_velo = math.abs(v27.velocity(v130) * math.cos(math.rad(l_huge_1)));
            if math.abs(l_huge_1 - 90) < 40 then
                side_velo = v27.velocity(v130) * math.sin(math.rad(l_huge_1)) * (25 + v131 - l_huge_0) / 15;
            else
                side_velo = v27.velocity(v130) * math.sin(math.rad(l_huge_1));
            end;
            v129.forwardmove = forward_velo;
            if l_huge_1 >= 90 then
                v129.sidemove = side_velo;
            else
                v129.sidemove = side_velo * -1;
            end;
        end;
        return;
    end;
end;
local v144 = {
    [1] = "\208\165\208\190\209\135\208\181\209\136\209\140 \208\165\208\176\208\181\209\129\208\176\209\130\209\140?\208\154\209\131\208\191\208\184 anti neverlose.lua beta", 
    [2] = "\208\167\209\145 \209\131\208\188\208\184\209\128\208\176\208\181\209\136\209\140?\208\154\209\131\208\191\208\184 antineverlose.lua beta \208\157\208\184\209\137\208\184\208\185!", 
    [3] = "By Anti neverlose.lua beta", 
    [4] = "\208\154\208\184\209\130\208\176\208\181\209\134 \208\181\208\177\208\176\208\189\208\189\209\139\208\185 \208\184\208\179\209\128\208\176\209\130\209\140 \208\189\208\176\209\131\209\135\208\184\209\129\209\140", 
    [5] = "\208\157\208\184\209\137\208\184\208\185 \208\189\208\176\208\185\208\180\208\184 8 \208\157\208\155\208\149 \208\184 \208\186\209\131\208\191\208\184 \209\131\208\182\208\181 \209\129\208\181\208\177\208\181 \208\189\208\190\209\128\208\188 \208\187\209\131\208\176\209\136\208\186\209\131", 
    [6] = "ANGRY ? ? ? ? its anti neverlose lua beta", 
    [7] = "antineverlose beta", 
    [8] = "GET GOOD BUY ANTINEVERLOSE.LUA BETA", 
    [9] = "Fucked by Anti-Neverlose.lua", 
    [10] = "\208\161\208\171\208\157 \208\159\208\158\208\156\208\158\208\153\208\154\208\152 1", 
    [11] = "antineverlose.wav", 
    [12] = "\208\146\208\171\208\181\208\177\208\176\208\189,\208\154\208\184\208\180\208\176\208\185 \209\133\208\178\209\133 \209\130\208\181\208\177\208\181 \208\188\208\176\208\186\209\129\208\184\208\188\209\131\208\188 \208\191\208\190\208\187\209\139 \208\188\209\139\209\130\209\140", 
    [13] = "\208\154\209\131\208\191\208\184 \209\129\208\181\208\177\208\181 \208\186\209\132\208\179 \208\163 \208\161\208\181\208\186\209\129\208\176 \209\135\208\181\208\188 \208\184\208\179\209\128\208\176\209\130\209\140 \208\180\208\176\208\187\209\140\209\136\208\181 \209\129\208\190 \209\129\208\178\208\190\208\181\208\185 \209\133\209\131\208\185\208\189\208\181\208\185", 
    [14] = "\208\157\208\184\209\137\208\176\209\143 1 , \209\130\208\181\209\128\208\191\208\184 \208\180\208\176\208\187\209\140\209\136\208\181", 
    [15] = "\208\156\208\184\209\129\209\129\208\176\208\181\209\130 \209\135\208\184\209\130?\208\154\209\131\208\191\208\184 \208\187\209\131\208\176 \208\186\208\190\209\130\208\190\209\128\208\176\209\143 \208\181\208\179\208\190 \209\131\208\187\209\131\209\135\209\136\208\184\209\130) anti neverlose.lua", 
    [16] = "its a anti neverlose.lua bro", 
    [17] = "antineverlose.lua \226\152\134\226\152\134\226\152\134 \226\156\159 \226\156\159 \226\156\159", 
    [18] = "Yes im user anti neverlose.lua", 
    [19] = "\208\161\208\181\208\186\209\129?\208\157\208\181\209\130 \208\187\209\131\209\135\209\136\208\181 \208\178\208\190\208\183\209\140\208\188\209\131 anti neverlose.lua", 
    [20] = "anti neverlose.lua boosted ", 
    [21] = "By AntiNeverlose.lua", 
    [22] = "\226\152\134\239\189\161 antineverlose fucked you(^\239\189\165\207\137\239\189\165^) \226\139\134\239\189\161\194\176", 
    [23] = "\208\162\209\128\208\176\209\133\208\189\209\131\208\187 \208\180\208\176\208\182\208\181 \208\189\208\181 \208\183\208\176\208\188\208\181\209\130\208\184\208\178", 
    [24] = "resolver boosted by anti neverlose.lua", 
    [25] = "resolver boosted by anti neverlose.lua", 
    [26] = "resolver boosted by anti neverlose.lua", 
    [27] = "resolver boosted by anti neverlose.lua", 
    [28] = "resolver boosted by anti neverlose.lua", 
    [29] = "\208\157\208\181 \208\183\208\187\208\184\209\129\209\140 \209\141\209\130\208\190 \208\182\208\181 \208\191\209\128\208\190\209\129\209\130\208\190 \208\176\208\189\209\130\208\184 \208\189\208\181\208\178\208\181\209\128\208\187\209\131\208\183 \208\177\208\181\209\130\208\176", 
    [30] = "\208\183\208\187\208\184\209\136\209\140\209\129\209\143?? Anti Neverlose Beta boosted"
};
v20.trash_talk = function(v145)
    -- upvalues: v9 (ref), v144 (ref)
    if v9.misc_trashtalk:get() and entity.get(v145.userid, true) ~= entity.get(v145.attacker, true) and entity.get(v145.attacker, true) == entity.get_local_player() then
        utils.console_exec("say " .. v144[utils.random_int(1, #v144)]);
    end;
end;
v20.override_viewmodel = function()
    -- upvalues: v9 (ref)
    cvar.viewmodel_fov:int(v9.misc_viewmodel_fov:get(), true);
    cvar.viewmodel_offset_x:float(v9.misc_viewmodel_x:get(), true);
    cvar.viewmodel_offset_y:float(v9.misc_viewmodel_y:get(), true);
    cvar.viewmodel_offset_z:float(v9.misc_viewmodel_z:get(), true);
end;
v20.unmute_mute = function()
    -- upvalues: v9 (ref)
    if not v9.misc_automuteunmute:get() then
        return;
    else
        local v146 = v9.misc_automuteunmute_settings:get();
        local _ = entity.get_players(v9.misc_automuteunmute_player:get() == "Enemy", true, function(v147)
            -- upvalues: v146 (ref)
            local v148 = v147:get_player_info();
            local v149 = panorama.FriendsListAPI.IsSelectedPlayerMuted(v148.steamid64);
            if v146 == "Unmute" and v149 then
                panorama.FriendsListAPI.ToggleMute(v148.steamid64);
            elseif v146 == "Mute" and not v149 then
                panorama.FriendsListAPI.ToggleMute(v148.steamid64);
            end;
        end);
        return;
    end;
end;
v9.misc_aspectratio_value:set_callback(function()
    -- upvalues: v9 (ref)
    if v9.misc_aspectratio:get() then
        cvar.r_aspectratio:float(v9.misc_aspectratio_value:get() / 10);
    end;
end, false);
v9.misc_aspectratio:set_callback(function()
    -- upvalues: v9 (ref)
    cvar.r_aspectratio:float(v9.misc_aspectratio:get() and v9.misc_aspectratio_value:get() / 10 or 0);
end, true);
local v151 = {};
local function v158(v152, v153, v154)
    v154 = globals.frametime * (v154 * 175);
    if v154 < 0 then
        v154 = 0.01;
    elseif v154 > 1 then
        v154 = 1;
    end;
    if type(v152) == "userdata" then
        local v155 = {
            [1] = 0, 
            [2] = 0, 
            [3] = 0, 
            [4] = 0
        };
        for v156, v157 in ipairs({
            [1] = "r", 
            [2] = "g", 
            [3] = "b", 
            [4] = "a"
        }) do
            v155[v156] = lerp(v152[v157], v153[v157], v154);
        end;
        return Color.new(unpack(v155));
    elseif math.abs(v152 - v153) < (delta or 0.01) then
        return v153;
    else
        return (v153 - v152) * v154 + v152;
    end;
end;
local v159 = {
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
local function _(v160)
    return "" .. ("\a%02x%02x%02x"):format(v160.r, v160.g, v160.b);
end;
events.aim_ack:set(function(v162)
    -- upvalues: v9 (ref), v159 (ref), v151 (ref)
    local _ = nil;
    local v164 = v162.target:get_name();
    local l_damage_0 = v162.damage;
    local l_wanted_damage_0 = v162.wanted_damage;
    local _ = v162.hitchance;
    local _ = v162.hitgroup;
    local _ = v162.backtrack;
    if not v9.visuals_aimbotlogs:get() then
        return;
    else
        local v170 = "\aFF2D2DFF";
        local v171 = "\a2DFF3DFF";
        if v9.aimbotlogs_print:get("Logs") then
            if not v162.state then
                print_dev("Hit " .. v164 .. " in the " .. v159[v162.hitgroup] .. " for " .. l_damage_0 .. "(" .. l_wanted_damage_0 .. ")");
            end;
            if v162.state then
                print_dev("Missed shot due to " .. v162.state);
            end;
        end;
        if v9.aimbotlogs_print:get("\208\161onsole") then
            if not v162.state then
                print_raw((v171 .. "%s\aFFFFFFFF Registered shot in %s's " .. v171 .. "%s\aFFFFFFFF for " .. v171 .. "%s\aFFFFFFFF(" .. v171 .. "%s\aFFFFFFFF) (hitchance: " .. v171 .. "%s%% \aFFFFFFFF| history(\206\148): " .. v171 .. "%s \aFFFFFFFF)"):format("[Anti-Neverlose]", v162.target:get_name(), v159[v162.hitgroup], v162.damage, v162.wanted_damage, v162.hitchance, v162.backtrack));
            end;
            if v162.state then
                print_raw((v170 .. "%s \aFFFFFFFFMissed shot in %s's " .. v170 .. "%s\aFFFFFFFF due to " .. v170 .. "%s\aFFFFFFFF (hitchance: " .. v170 .. "%s%% \aFFFFFFFF| history(\206\148): " .. v170 .. "%s \aFFFFFFFF)"):format("[Anti-Neverlose]", v162.target:get_name(), v159[v162.wanted_hitgroup], v162.state, v162.hitchance, v162.backtrack));
            end;
        end;
        if v9.aimbotlogs_print:get("Screen") then
            if not v162.state then
                table.insert(v151, {
                    anim1 = 0, 
                    anim = 0, 
                    [1] = {
                        [1] = "\240\159\170\144 Hit " .. v164 .. " in the " .. v159[v162.hitgroup] .. " for " .. l_damage_0 .. "(" .. l_wanted_damage_0 .. ")"
                    }, 
                    time = globals.realtime, 
                    color = v9.aimbotlogs_color:get()
                });
            end;
            if v162.state then
                table.insert(v151, {
                    anim1 = 0, 
                    anim = 0, 
                    [1] = {
                        [1] = "\240\159\146\148 Missed shot due to " .. v162.state
                    }, 
                    time = globals.realtime, 
                    color = v9.aimbotlogs_color:get()
                });
            end;
        end;
        return;
    end;
end);
events.render:set(function()
    -- upvalues: v9 (ref), v151 (ref), v158 (ref)
    if not v9.aimbotlogs_print:get("Screen") then
        return;
    else
        local v172 = render.screen_size();
        local v173 = v172.x / 2;
        local v174 = v172.y / 1.32;
        add_y = 0;
        for v175, v176 in ipairs(v151) do
            local v177 = v176[1];
            local l_x_2 = render.measure_text(1, "", v177[1]).x;
            local l_y_3 = render.measure_text(1, "", v177[1]).y;
            if v176.time + 1 > globals.realtime then
                v176.anim = v158(v176.anim, 1, 0.07);
                v176.anim1 = v158(v176.anim1, 1, 0.05);
            end;
            add_y = add_y + 25 * v176.anim;
            render.rect(vector(v173 - l_x_2 / 2 - 12, v174 - 4 - add_y), vector(v173 + l_x_2 / 2 + 12, v174 + l_y_3 + 5 - add_y), color(25, 25, 25, 230 * v176.anim1), 4);
            render.rect_outline(vector(v173 - l_x_2 / 2 - 12, v174 - 4 - add_y), vector(v173 + l_x_2 / 2 + 12, v174 + l_y_3 + 5 - add_y), color(v9.aimbotlogs_color:get().r, v9.aimbotlogs_color:get().g, v9.aimbotlogs_color:get().b, 255 * v176.anim1), 1.5, 4, false);
            render.shadow(vector(v173 - l_x_2 / 2 - 12, v174 - 4 - add_y), vector(v173 + l_x_2 / 2 + 12, v174 + l_y_3 + 5 - add_y), color(v9.aimbotlogs_color:get().r, v9.aimbotlogs_color:get().g, v9.aimbotlogs_color:get().b, v9.aimbotlogs_color:get().a * v176.anim1), 20, 0, 6);
            render.text(1, vector(v173 - l_x_2 / 2, v174 - add_y), color(255, 255, 255, 255 * v176.anim1), "", v177[1]);
            if v176.time + 3 < globals.realtime then
                v176.anim = v158(v176.anim, 0, 0.05);
                v176.anim1 = v158(v176.anim1, 0, 0.05);
            end;
            if v176.anim < 0.01 and v176.time + 4 < globals.realtime or #v151 > 7 then
                table.remove(v151, v175);
            end;
        end;
        return;
    end;
end);
v17.antibruteforce_restart = function()
    -- upvalues: v10 (ref), v151 (ref), v9 (ref)
    if v10.addictionals:get(5) then
        table.insert(v151, {
            anim1 = 0, 
            anim = 0, 
            [1] = {
                [1] = "\240\159\155\161\239\184\143 Reset Anti-Bruteforce due to new Round Start"
            }, 
            time = globals.realtime, 
            color = v9.aimbotlogs_color:get()
        });
    end;
end;
local v180 = 0;
local v181 = 0;
local v182 = 0;
local v183 = 0;
local v184 = 0;
local v185 = 0;
local v186 = 0;
local v187 = 0;
local v188 = 0;
local v189 = 0;
local v190 = 0;
local v191 = 0;
local _ = 0;
local v193 = 0;
local _ = 0;
local _ = 0;
local _ = 0;
local _ = 0;
local _ = 0;
local _ = 0;
local _ = 0;
local _ = 0;
local _ = 0;
local _ = 0;
local function v207(v204, v205, v206)
    return v204 - (v204 - v205) * v206;
end;
v22.crosshair_indicators = function()
    -- upvalues: v9 (ref), v17 (ref), v180 (ref), v207 (ref), v181 (ref), v14 (ref), v182 (ref), v187 (ref), v183 (ref), v188 (ref), v184 (ref), v189 (ref), v185 (ref), v190 (ref), v186 (ref), v191 (ref), l_gradient_0 (ref)
    if common.is_button_down(9) then
        return;
    elseif not v9.visuals_crosshairid:get() then
        return;
    else
        local v208 = entity.get_local_player();
        if not v208 then
            return;
        elseif not v208:is_alive() then
            return;
        elseif not globals.is_in_game then
            return;
        else
            local l_m_bIsScoped_0 = v208.m_bIsScoped;
            local v210 = render.screen_size();
            local v211 = false;
            local v212 = ui.get_binds();
            local v213 = nil;
            if v17.state() == "standing" then
                v213 = "STANDING";
            elseif v17.state() == "running" then
                v213 = "RUNNING";
            elseif v17.state() == "walking" then
                v213 = "WALKING";
            elseif v17.state() == "ducking" then
                v213 = "DUCKING";
            elseif v17.state() == "jumping" then
                v213 = "JUMPING";
            elseif v17.state() == "legit_aa" then
                v213 = "LEGIT AA";
            elseif v17.state() == "ducking_in_jumping" then
                v213 = "CROUCHING AIR";
            end;
            if v9.visuals_crosshairid_type:get() == "Old" then
                local v214 = "ANTI";
                local v215 = "NEVERLOSE";
                local v216 = "WS";
                local v217 = "DOUBLE TAP";
                local v218 = "HIDE SHOTS";
                local v219 = "DORMANT";
                local v220 = "BODY";
                local v221 = "MIN. DAMAGE";
                local v222 = render.measure_text(2, "", v214);
                local _ = render.measure_text(2, "", v215);
                local v224 = render.measure_text(2, "", v214 .. v215);
                local _ = render.measure_text(2, "", v216);
                local v226 = render.measure_text(2, "", v213);
                local v227 = render.measure_text(2, "", v217);
                local v228 = render.measure_text(2, "", v218);
                local v229 = render.measure_text(2, "", v219);
                local v230 = render.measure_text(2, "", v220);
                local v231 = render.measure_text(2, "", v221);
                for v232 = 1, #v212 do
                    local v233 = v212[v232];
                    if v233.name == "Min. Damage" and v233.active then
                        v211 = true;
                    end;
                end;
                if l_m_bIsScoped_0 then
                    x_plus = 2;
                else
                    x_plus = 0;
                end;
                for v234 = 0, 1 do
                    v180 = v207(v180, x_plus * v234, 0.03);
                end;
                v181 = v9.visuals_crosshairid_add_y:get();
                y_plus1 = 0;
                y_plus2 = 0;
                y_plus3 = 0;
                y_plus4 = 0;
                y_plus5 = 0;
                local l_r_0 = v9.visuals_crosshairid_addative_color:get().r;
                local l_g_0 = v9.visuals_crosshairid_addative_color:get().g;
                local l_b_0 = v9.visuals_crosshairid_addative_color:get().b;
                render.shadow(vector(v210.x / 2 - v224.x / 2 + v224.x / 2 * v180 + 1 + 5 * v180, v210.y / 2 + 19 + v181), vector(v210.x / 2 + v224.x / 2 + v224.x / 2 * v180 + 1 + 5 * v180, v210.y / 2 + 19 + v181), v9.visuals_crosshairid_glow_color:get(), v224.y * 1.2, 0, 9);
                render.shadow(vector(v210.x / 2 - v226.x / 2 + v226.x / 2 * v180 + 1 + 5 * v180, v210.y / 2 + 29 + v181), vector(v210.x / 2 + v226.x / 2 + v226.x / 2 * v180 + 1 + 5 * v180, v210.y / 2 + 29 + v181), v9.visuals_crosshairid_glow_color:get(), v224.y * 1.2, 0, 9);
                render.text(2, vector(v210.x / 2 - v224.x / 2 + v224.x / 2 * v180 + 1 + 5 * v180, v210.y / 2 + 13 + v181), v9.visuals_crosshairid_main_color:get(), "", v214);
                render.text(2, vector(v210.x / 2 - v224.x / 2 + v222.x + v224.x / 2 * v180 + 1 + 5 * v180, v210.y / 2 + 13 + v181), v9.visuals_crosshairid_state_color:get(), "", v215);
                render.text(2, vector(v210.x / 2 - v226.x / 2 + v226.x / 2 * v180 + 1 + 5 * v180, v210.y / 2 + 23 + v181), v9.visuals_crosshairid_state_color:get(), "", v213);
                if v14.double_tap:get() then
                    v182 = v207(v182, 1, 0.035);
                    v187 = v207(v187, 1, 0.06);
                    y_plus1 = 10 * v182;
                    if rage.exploit:get() == 0 then
                        render.text(2, vector(v210.x / 2 - v227.x / 2 + v227.x / 2 * v180 + 1 + 5 * v180, v210.y / 2 + 23 + y_plus1 + v181), color(v9.visuals_crosshairid_state_color:get().r, v9.visuals_crosshairid_state_color:get().g, v9.visuals_crosshairid_state_color:get().b, v9.visuals_crosshairid_state_color:get().a * v187), "", v217);
                    else
                        render.text(2, vector(v210.x / 2 - v227.x / 2 + v227.x / 2 * v180 + 1 + 5 * v180, v210.y / 2 + 23 + y_plus1 + v181), color(l_r_0, l_g_0, l_b_0, 255 * v187), "", v217);
                    end;
                else
                    v182 = v207(v182, 0, 0.035);
                    v187 = v207(v187, 0, 0.06);
                    y_plus1 = 10 * v182;
                    render.text(2, vector(v210.x / 2 - v227.x / 2 + v227.x / 2 * v180 + 1 + 5 * v180, v210.y / 2 + 23 + y_plus1 + v181), color(l_r_0, l_g_0, l_b_0, 255 * v187), "", v217);
                end;
                if v14.hide_shots:get() then
                    v183 = v207(v183, 1, 0.035);
                    v188 = v207(v188, 1, 0.06);
                    y_plus2 = 10 * v183;
                    render.text(2, vector(v210.x / 2 - v228.x / 2 + v228.x / 2 * v180 + 1 + 5 * v180, v210.y / 2 + 23 + y_plus2 + y_plus1 + v181), color(l_r_0, l_g_0, l_b_0, 255 * v188), "", v218);
                else
                    v183 = v207(v183, 0, 0.035);
                    v188 = v207(v188, 0, 0.06);
                    y_plus2 = 10 * v183;
                    render.text(2, vector(v210.x / 2 - v228.x / 2 + v228.x / 2 * v180 + 1 + 5 * v180, v210.y / 2 + 23 + y_plus2 + y_plus1 + v181), color(l_r_0, l_g_0, l_b_0, 255 * v188), "", v218);
                end;
                if v211 then
                    v184 = v207(v184, 1, 0.035);
                    v189 = v207(v189, 1, 0.06);
                    y_plus3 = 10 * v184;
                    render.text(2, vector(v210.x / 2 - v231.x / 2 + v231.x / 2 * v180 + 1 + 5 * v180, v210.y / 2 + 23 + y_plus3 + y_plus2 + y_plus1 + v181), color(l_r_0, l_g_0, l_b_0, 255 * v189), "", v221);
                else
                    v184 = v207(v184, 0, 0.035);
                    v189 = v207(v189, 0, 0.06);
                    y_plus3 = 10 * v184;
                    render.text(2, vector(v210.x / 2 - v231.x / 2 + v231.x / 2 * v180 + 1 + 5 * v180, v210.y / 2 + 23 + y_plus3 + y_plus2 + y_plus1 + v181), color(l_r_0, l_g_0, l_b_0, 255 * v189), "", v221);
                end;
                if v14.body_aim:get() == "Force" then
                    v185 = v207(v185, 1, 0.035);
                    v190 = v207(v190, 1, 0.06);
                    y_plus4 = 10 * v185;
                    render.text(2, vector(v210.x / 2 - v230.x / 2 + v230.x / 2 * v180 + 1 + 5 * v180, v210.y / 2 + 23 + y_plus4 + y_plus2 + y_plus1 + y_plus3 + v181), color(l_r_0, l_g_0, l_b_0, 255 * v190), "", v220);
                else
                    v185 = v207(v185, 0, 0.035);
                    v190 = v207(v190, 0, 0.06);
                    y_plus4 = 10 * v185;
                    render.text(2, vector(v210.x / 2 - v230.x / 2 + v230.x / 2 * v180 + 1 + 5 * v180, v210.y / 2 + 23 + y_plus4 + y_plus2 + y_plus1 + y_plus3 + v181), color(l_r_0, l_g_0, l_b_0, 255 * v190), "", v220);
                end;
                if v14.dormant_aimbot:get() then
                    v186 = v207(v186, 1, 0.035);
                    v191 = v207(v191, 1, 0.06);
                    y_plus5 = 10 * v186;
                    render.text(2, vector(v210.x / 2 - v229.x / 2 + v229.x / 2 * v180 + 1 + 5 * v180, v210.y / 2 + 23 + y_plus4 + y_plus2 + y_plus1 + y_plus3 + y_plus5 + v181), color(l_r_0, l_g_0, l_b_0, 150 * v191), "", v219);
                else
                    v186 = v207(v186, 0, 0.035);
                    v191 = v207(v191, 0, 0.06);
                    y_plus5 = 10 * v186;
                    render.text(2, vector(v210.x / 2 - v229.x / 2 + v229.x / 2 * v180 + 1 + 5 * v180, v210.y / 2 + 23 + y_plus4 + y_plus2 + y_plus1 + y_plus3 + y_plus5 + v181), color(l_r_0, l_g_0, l_b_0, 150 * v191), "", v219);
                end;
            elseif v9.visuals_crosshairid_type:get() == "Release" then
                for v238 = 1, #v212 do
                    local v239 = v212[v238];
                    if v239.name == "Min. Damage" and v239.active then
                        v211 = true;
                    end;
                end;
                if l_m_bIsScoped_0 then
                    x_plus = 2;
                else
                    x_plus = 0;
                end;
                for v240 = 0, 1 do
                    v180 = v207(v180, x_plus * v240, 0.03);
                end;
                v181 = v9.visuals_crosshairid_add_y:get();
                y_plus1 = 0;
                y_plus2 = 0;
                y_plus3 = 0;
                y_plus4 = 0;
                y_plus5 = 0;
                local l_r_1 = v9.visuals_crosshairid_addative_color:get().r;
                local l_g_1 = v9.visuals_crosshairid_addative_color:get().g;
                local l_b_1 = v9.visuals_crosshairid_addative_color:get().b;
                local v244 = render.measure_text(2, "", "A N T I");
                local _ = render.measure_text(2, "", "N E V E R L O S E");
                local v246 = render.measure_text(2, "", "A N T I N E V E R L O S E");
                local v247 = render.measure_text(2, "", v213);
                local v248 = render.measure_text(2, "", "DT");
                local _ = render.measure_text(2, "", "OS");
                local v250 = render.measure_text(2, "", "BA");
                local v251 = render.measure_text(2, "", "DMG");
                render.shadow(vector(v210.x / 2 - v246.x / 2 + v246.x / 2 * v180 + 1 + 5 * v180, v210.y / 2 + 19 + v181), vector(v210.x / 2 + v246.x / 2 + v246.x / 2 * v180 + 1 + 5 * v180, v210.y / 2 + 19 + v181), v9.visuals_crosshairid_glow_color:get(), v246.y * 1.2, 0, 9);
                render.text(2, vector(v210.x / 2 - v246.x / 2 + v246.x / 2 * v180 + 1 + 5 * v180, v210.y / 2 + 13 + v181), v9.visuals_crosshairid_main_color:get(), "", "A N T I");
                render.text(2, vector(v210.x / 2 - v246.x / 2 + v244.x + v246.x / 2 * v180 + 1 + 5 * v180, v210.y / 2 + 13 + v181), v9.visuals_crosshairid_state_color:get(), "", "N E V E R L O S E");
                render.text(2, vector(v210.x / 2 - v247.x / 2 + v247.x / 2 * v180 + 1 + 5 * v180, v210.y / 2 + 23 + v181), v9.visuals_crosshairid_state_color:get(), "", v213);
                if v14.double_tap:get() then
                    v182 = v207(v182, 1, 0.035);
                    v187 = v207(v187, 1, 0.06);
                    y_plus1 = 10 * v182;
                    if rage.exploit:get() == 0 then
                        render.text(2, vector(v210.x / 2 - v248.x / 2 + v248.x / 2 * v180 + 1 + 5 * v180, v210.y / 2 + 23 + y_plus1 + v181), color(v9.visuals_crosshairid_state_color:get().r, v9.visuals_crosshairid_state_color:get().g, v9.visuals_crosshairid_state_color:get().b, v9.visuals_crosshairid_state_color:get().a * v187), "", "DT");
                    else
                        render.text(2, vector(v210.x / 2 - v248.x / 2 + v248.x / 2 * v180 + 1 + 5 * v180, v210.y / 2 + 23 + y_plus1 + v181), color(l_r_1, l_g_1, l_b_1, 255 * v187), "", "DT");
                    end;
                else
                    v182 = v207(v182, 0, 0.035);
                    v187 = v207(v187, 0, 0.06);
                    y_plus1 = 10 * v182;
                    render.text(2, vector(v210.x / 2 - v248.x / 2 + v248.x / 2 * v180 + 1 + 5 * v180, v210.y / 2 + 23 + y_plus1 + v181), color(l_r_1, l_g_1, l_b_1, 255 * v187), "", "DT");
                end;
                if v14.hide_shots:get() then
                    v183 = v207(v183, 1, 0.035);
                    v188 = v207(v188, 1, 0.06);
                    y_plus2 = 10 * v183;
                    render.text(2, vector(v210.x / 2 - v248.x / 2 + v248.x / 2 * v180 + 1 + 5 * v180, v210.y / 2 + 23 + y_plus2 + y_plus1 + v181), color(l_r_1, l_g_1, l_b_1, 255 * v188), "", "OS");
                else
                    v183 = v207(v183, 0, 0.035);
                    v188 = v207(v188, 0, 0.06);
                    y_plus2 = 10 * v183;
                    render.text(2, vector(v210.x / 2 - v248.x / 2 + v248.x / 2 * v180 + 1 + 5 * v180, v210.y / 2 + 23 + y_plus2 + y_plus1 + v181), color(l_r_1, l_g_1, l_b_1, 255 * v188), "", "OS");
                end;
                if v14.body_aim:get() == "Force" then
                    v185 = v207(v185, 1, 0.035);
                    v190 = v207(v190, 1, 0.06);
                    y_plus4 = 10 * v185;
                    render.text(2, vector(v210.x / 2 - v250.x / 2 + v250.x / 2 * v180 + 1 + 5 * v180, v210.y / 2 + 23 + y_plus4 + y_plus2 + y_plus1 + y_plus3 + v181), color(l_r_1, l_g_1, l_b_1, 255 * v190), "", "BA");
                else
                    v185 = v207(v185, 0, 0.035);
                    v190 = v207(v190, 0, 0.06);
                    y_plus4 = 10 * v185;
                    render.text(2, vector(v210.x / 2 - v250.x / 2 + v250.x / 2 * v180 + 1 + 5 * v180, v210.y / 2 + 23 + y_plus4 + y_plus2 + y_plus1 + y_plus3 + v181), color(l_r_1, l_g_1, l_b_1, 255 * v190), "", "BA");
                end;
                if v211 then
                    v184 = v207(v184, 1, 0.035);
                    v189 = v207(v189, 1, 0.06);
                    y_plus3 = 10 * v184;
                    render.text(2, vector(v210.x / 2 - v251.x / 2 + v251.x / 2 * v180 + 1 + 5 * v180, v210.y / 2 + 23 + y_plus3 + y_plus2 + y_plus1 + v181), color(l_r_1, l_g_1, l_b_1, 255 * v189), "", "DMG");
                else
                    v184 = v207(v184, 0, 0.035);
                    v189 = v207(v189, 0, 0.06);
                    y_plus3 = 10 * v184;
                    render.text(2, vector(v210.x / 2 - v251.x / 2 + v251.x / 2 * v180 + 1 + 5 * v180, v210.y / 2 + 23 + y_plus3 + y_plus2 + y_plus1 + v181), color(l_r_1, l_g_1, l_b_1, 255 * v189), "", "DMG");
                end;
            elseif v9.visuals_crosshairid_type:get() == "Beta" then
                for v252 = 1, #v212 do
                    local v253 = v212[v252];
                    if v253.name == "Min. Damage" and v253.active then
                        v211 = true;
                    end;
                end;
                if l_m_bIsScoped_0 then
                    x_plus = 2;
                else
                    x_plus = 0;
                end;
                for v254 = 0, 1 do
                    v180 = v207(v180, x_plus * v254, 0.03);
                end;
                v181 = v9.visuals_crosshairid_add_y:get();
                y_plus1 = 0;
                y_plus2 = 0;
                y_plus3 = 0;
                y_plus4 = 0;
                y_plus5 = 0;
                local l_r_2 = v9.visuals_crosshairid_addative_color:get().r;
                local l_g_2 = v9.visuals_crosshairid_addative_color:get().g;
                local l_b_2 = v9.visuals_crosshairid_addative_color:get().b;
                local v258 = render.measure_text(2, "", "ANTINEVERLOSE");
                local v259 = render.measure_text(2, "", "B E T A");
                local v260 = render.measure_text(2, "", "DT");
                local _ = render.measure_text(2, "", "OS");
                local v262 = render.measure_text(2, "", "BA");
                local v263 = render.measure_text(2, "", "DMG");
                local v264 = l_gradient_0.text_animate("ANTINEVERLOSE", -2, {
                    color(255, 255, 255), 
                    color(v9.visuals_crosshairid_main_color:get().r, v9.visuals_crosshairid_main_color:get().g, v9.visuals_crosshairid_main_color:get().b)
                });
                local v265 = l_gradient_0.text_animate("B E T A", -2, {
                    color(255, 255, 255), 
                    color(v9.visuals_crosshairid_state_color:get().r, v9.visuals_crosshairid_state_color:get().g, v9.visuals_crosshairid_state_color:get().b)
                });
                render.shadow(vector(v210.x / 2 - v258.x / 2 + v258.x / 2 * v180 + 1 + 5 * v180, v210.y / 2 + 19 + v181), vector(v210.x / 2 + v258.x / 2 + v258.x / 2 * v180 + 1 + 5 * v180, v210.y / 2 + 19 + v181), v9.visuals_crosshairid_glow_color:get(), v258.y * 1.2, 0, 9);
                render.text(2, vector(v210.x / 2 - v258.x / 2 + v258.x / 2 * v180 + 1 + 5 * v180, v210.y / 2 + 13 + v181), v9.visuals_crosshairid_main_color:get(), "", v264:get_animated_text());
                render.text(2, vector(v210.x / 2 - v259.x / 2 + v259.x / 2 * v180 + 1 + 5 * v180, v210.y / 2 + 23 + v181), v9.visuals_crosshairid_state_color:get(), "", v265:get_animated_text());
                if v14.double_tap:get() then
                    v182 = v207(v182, 1, 0.035);
                    v187 = v207(v187, 1, 0.06);
                    y_plus1 = 10 * v182;
                    if rage.exploit:get() == 0 then
                        render.text(2, vector(v210.x / 2 - v260.x / 2 + v260.x / 2 * v180 + 1 + 5 * v180, v210.y / 2 + 23 + y_plus1 + v181), color(v9.visuals_crosshairid_state_color:get().r, v9.visuals_crosshairid_state_color:get().g, v9.visuals_crosshairid_state_color:get().b, v9.visuals_crosshairid_state_color:get().a * v187), "", "DT");
                    else
                        render.text(2, vector(v210.x / 2 - v260.x / 2 + v260.x / 2 * v180 + 1 + 5 * v180, v210.y / 2 + 23 + y_plus1 + v181), color(l_r_2, l_g_2, l_b_2, 255 * v187), "", "DT");
                    end;
                else
                    v182 = v207(v182, 0, 0.035);
                    v187 = v207(v187, 0, 0.06);
                    y_plus1 = 10 * v182;
                    render.text(2, vector(v210.x / 2 - v260.x / 2 + v260.x / 2 * v180 + 1 + 5 * v180, v210.y / 2 + 23 + y_plus1 + v181), color(l_r_2, l_g_2, l_b_2, 255 * v187), "", "DT");
                end;
                if v14.hide_shots:get() then
                    v183 = v207(v183, 1, 0.035);
                    v188 = v207(v188, 1, 0.06);
                    y_plus2 = 10 * v183;
                    render.text(2, vector(v210.x / 2 - v260.x / 2 + v260.x / 2 * v180 + 1 + 5 * v180, v210.y / 2 + 23 + y_plus2 + y_plus1 + v181), color(l_r_2, l_g_2, l_b_2, 255 * v188), "", "OS");
                else
                    v183 = v207(v183, 0, 0.035);
                    v188 = v207(v188, 0, 0.06);
                    y_plus2 = 10 * v183;
                    render.text(2, vector(v210.x / 2 - v260.x / 2 + v260.x / 2 * v180 + 1 + 5 * v180, v210.y / 2 + 23 + y_plus2 + y_plus1 + v181), color(l_r_2, l_g_2, l_b_2, 255 * v188), "", "OS");
                end;
                if v14.body_aim:get() == "Force" then
                    v185 = v207(v185, 1, 0.035);
                    v190 = v207(v190, 1, 0.06);
                    y_plus4 = 10 * v185;
                    render.text(2, vector(v210.x / 2 - v262.x / 2 + v262.x / 2 * v180 + 1 + 5 * v180, v210.y / 2 + 23 + y_plus4 + y_plus2 + y_plus1 + y_plus3 + v181), color(l_r_2, l_g_2, l_b_2, 255 * v190), "", "BA");
                else
                    v185 = v207(v185, 0, 0.035);
                    v190 = v207(v190, 0, 0.06);
                    y_plus4 = 10 * v185;
                    render.text(2, vector(v210.x / 2 - v262.x / 2 + v262.x / 2 * v180 + 1 + 5 * v180, v210.y / 2 + 23 + y_plus4 + y_plus2 + y_plus1 + y_plus3 + v181), color(l_r_2, l_g_2, l_b_2, 255 * v190), "", "BA");
                end;
                if v211 then
                    v184 = v207(v184, 1, 0.035);
                    v189 = v207(v189, 1, 0.06);
                    y_plus3 = 10 * v184;
                    render.text(2, vector(v210.x / 2 - v263.x / 2 + v263.x / 2 * v180 + 1 + 5 * v180, v210.y / 2 + 23 + y_plus3 + y_plus2 + y_plus1 + v181), color(l_r_2, l_g_2, l_b_2, 255 * v189), "", "DMG");
                else
                    v184 = v207(v184, 0, 0.035);
                    v189 = v207(v189, 0, 0.06);
                    y_plus3 = 10 * v184;
                    render.text(2, vector(v210.x / 2 - v263.x / 2 + v263.x / 2 * v180 + 1 + 5 * v180, v210.y / 2 + 23 + y_plus3 + y_plus2 + y_plus1 + v181), color(l_r_2, l_g_2, l_b_2, 255 * v189), "", "DMG");
                end;
                v264:animate();
                v265:animate();
            end;
            return;
        end;
    end;
end;
local v266 = 0;
local function v270(v267, v268, v269)
    return v267 + (v268 - v267) * v269;
end;
v22.custom_scope = function()
    -- upvalues: v9 (ref), v14 (ref), v266 (ref), v270 (ref)
    if not v9.visuals_scopeoverlay:get() then
        return;
    else
        v14.scope_overlay:set("Remove All");
        if common.is_button_down(9) then
            return;
        else
            local v271 = entity.get_local_player();
            if not v271 then
                return;
            elseif not v271:is_alive() then
                return;
            elseif not globals.is_in_game then
                return;
            else
                local v272 = v271:is_alive();
                local l_m_bIsScoped_1 = v271.m_bIsScoped;
                local v274 = 0;
                local l_x_3 = render.screen_size().x;
                local l_y_4 = render.screen_size().y;
                local v277 = color(255, 255, 255, 0);
                local v278 = v9.visuals_scopeoverlay_color:get();
                local v279 = v9.visuals_scopeoverlay_gap:get();
                local v280 = v9.visuals_scopeoverlay_line_size:get();
                v274 = v271 and v272 and l_m_bIsScoped_1 and 1 or 0;
                v266 = v270(v266, v274, 8.3 * globals.frametime);
                if not l_m_bIsScoped_1 and v266 < 0.01 then
                    return;
                else
                    render.gradient(vector(l_x_3 / 2 - v279 * v266, l_y_4 / 2), vector(l_x_3 / 2 - v279 * v266 - v280 * v266, l_y_4 / 2 + 1), v278, v277, v278, v277);
                    render.gradient(vector(l_x_3 / 2 + v279 * v266 + 1, l_y_4 / 2), vector(l_x_3 / 2 + v279 * v266 + v280 * v266, l_y_4 / 2 + 1), v278, v277, v278, v277);
                    render.gradient(vector(l_x_3 / 2, l_y_4 / 2 + v279 * v266), vector(l_x_3 / 2 + 1, l_y_4 / 2 + v279 * v266 + v280 * v266), v278, v278, v277, v277);
                    render.gradient(vector(l_x_3 / 2, l_y_4 / 2 - v279 * v266), vector(l_x_3 / 2 + 1, l_y_4 / 2 - v279 * v266 - v280 * v266), v278, v278, v277, v277);
                    return;
                end;
            end;
        end;
    end;
end;
v22.kibit_damage = function()
    -- upvalues: v9 (ref)
    if common.is_button_down(9) then
        return;
    elseif not v9.visuals_damageid:get() then
        return;
    else
        local v281 = entity.get_local_player();
        if not v281 then
            return;
        elseif not v281:is_alive() then
            return;
        elseif not globals.is_in_game then
            return;
        else
            local v282 = render.screen_size();
            local v283 = v9.visuals_damageid_color:get();
            local l_visuals_damageid_pos_0 = v9.visuals_damageid_pos;
            local v285 = 0;
            local v286 = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"):get();
            local v287 = render.measure_text(1, "", v286);
            if l_visuals_damageid_pos_0:get() == "Left" then
                v285 = -5 - v287.x;
            elseif l_visuals_damageid_pos_0:get() == "Right" then
                v285 = 5;
            end;
            render.text(1, vector(v282.x / 2 + v285, v282.y / 2.02 - 10), v283, "", v286);
            return;
        end;
    end;
end;
v22.bytes = {
    [1] = "<svg width=\"23\" height=\"25\" viewBox=\"0 0 23 25\" fill=\"none\" xmlns=\"http://www.w3.org/2000/svg\"><path d=\"M11.0424 3.70542C11.0424 2.97256 11.2582 2.25615 11.6625 1.6468C12.0667 1.03745 12.6414 0.562514 13.3137 0.28206C13.986 0.00160549 14.7257 -0.0717742 15.4394 0.0712003C16.1532 0.214175 16.8087 0.567081 17.3233 1.08529C17.8378 1.60351 18.1883 2.26375 18.3302 2.98253C18.4722 3.70131 18.3993 4.44635 18.1209 5.12342C17.8424 5.8005 17.3708 6.37921 16.7657 6.78636C16.1607 7.19352 15.4493 7.41084 14.7217 7.41084C13.7468 7.40779 12.8127 7.01641 12.1234 6.32217C11.434 5.62793 11.0454 4.68722 11.0424 3.70542ZM23 12.6911C23 12.4454 22.9031 12.2098 22.7306 12.036C22.5581 11.8623 22.3241 11.7647 22.0802 11.7647C21.932 11.7635 21.7858 11.7993 21.6548 11.8689H21.6663C21.6548 11.8689 20.9189 12.2279 19.5737 12.0889C18.2285 11.95 16.1819 11.3478 13.4454 9.18249C11.7208 7.8277 9.04179 6.33395 6.04089 6.91292C4.22425 7.26031 3.17796 8.19824 3.06298 8.30246C2.97256 8.38373 2.89921 8.48241 2.84724 8.59267C2.79527 8.70293 2.76574 8.82256 2.76039 8.94449C2.75503 9.06643 2.77395 9.18821 2.81605 9.30266C2.85814 9.41712 2.92256 9.52193 3.00549 9.61093C3.17019 9.79207 3.39957 9.89993 3.64321 9.91079C3.88685 9.92164 4.12479 9.83461 4.30473 9.66883C4.43121 9.55304 7.27114 7.07504 11.7322 10.2015C11.1857 12.0455 10.3344 13.7836 9.21425 15.3428L8.93831 15.7017C6.76524 18.5039 4.09777 19.7545 1.01639 19.4419C0.772438 19.4173 0.528788 19.4913 0.339039 19.6477C0.14929 19.804 0.0289856 20.0299 0.00459052 20.2756C-0.0198045 20.5213 0.0537085 20.7667 0.208958 20.9578C0.364207 21.1489 0.588475 21.27 0.832425 21.2946C1.21185 21.3293 1.56828 21.3409 1.92471 21.3409C5.67296 21.3409 8.43241 19.3261 10.341 16.906C12.5716 17.5081 16.5613 19.245 16.5613 24.0736C16.5613 24.3193 16.6582 24.555 16.8307 24.7287C17.0032 24.9024 17.2372 25 17.4811 25C17.7251 25 17.959 24.9024 18.1315 24.7287C18.304 24.555 18.4009 24.3193 18.4009 24.0736C18.4009 21.2135 17.2397 18.8166 15.0436 17.1376C13.8478 16.2228 12.5141 15.6554 11.4563 15.308C12.2176 14.0671 12.8349 12.7422 13.2959 11.3594C16.2623 13.4321 18.6079 13.9416 20.1946 13.9416C21.7812 13.9416 22.4366 13.5364 22.5056 13.49C22.653 13.4155 22.7771 13.3015 22.8643 13.1606C22.9516 13.0196 22.9985 12.8571 23 12.6911Z\" fill=\"white\"/></svg>"
};
v22.image_velocity = render.load_image(v22.bytes[1], vector(23, 25));
v22.bounded = function(v288, v289, v290, v291)
    local v292 = ui.get_mouse_position();
    return v288 <= v292.x and v292.x <= v290 and v289 <= v292.y and v292.y <= v291;
end;
v22.velocity_indicator = l_system_0.register({
    [1] = v9.visuals_velocityid_x, 
    [2] = v9.visuals_velocityid_y
}, vector(80, 30), "Test", function(v293)
    -- upvalues: v9 (ref), v193 (ref), v207 (ref), v22 (ref), l_animations_0 (ref)
    if common.is_button_down(9) then
        return;
    elseif not v9.visuals_velocityid:get() then
        return;
    else
        local v294 = entity.get_local_player();
        if not v294 then
            return;
        elseif not v294:is_alive() then
            return;
        elseif not globals.is_in_game then
            return;
        else
            local _ = render.screen_size();
            local _ = v9.visuals_velocityid_x:get();
            local _ = v9.visuals_velocityid_y:get();
            local v298 = v9.visuals_velocityid_color:get();
            local l_m_flVelocityModifier_0 = v294.m_flVelocityModifier;
            local v300 = "Slowed Down: " .. math.floor(l_m_flVelocityModifier_0 * 100) .. "%";
            local l_x_4 = render.measure_text(1, "", v300).x;
            local l_y_5 = render.measure_text(1, "", v300).y;
            if ui.get_alpha() > 0.5 then
                v193 = 1;
            elseif math.floor(l_m_flVelocityModifier_0 * 100) ~= 100 then
                v193 = v207(v193, 1, 0.03);
            else
                v193 = v207(v193, 0, 0.01);
            end;
            local v303 = v22.bounded(v293.position.x - l_x_4 / 2 - 5, v293.position.y - 20, v293.position.x + l_x_4 / 2 + 4, v293.position.y + l_y_5 + 3);
            local _ = v303 and common.is_button_down(1);
            if v303 and common.is_button_down(2) then
                v293.position.x = render.screen_size().x / 2;
            end;
            local v305 = l_animations_0.new("centered", centered);
            local l_v305_0 = v305;
            v305 = v305.update;
            local l_LERP_0 = l_animations_0.types.LERP;
            local v308;
            if ui.get_alpha() > 0.1 then
                v308 = v303 and 255 or 0;
            else
                v308 = 0;
            end;
            v305 = v305(l_v305_0, l_LERP_0, v308);
            render.rect(vector(v293.position.x - l_x_4 / 2 - 5, v293.position.y - 20), vector(v293.position.x + l_x_4 / 2 + 4, v293.position.y + l_y_5 + 3), color(25, 25, 25, 255 * v193), 4);
            render.shadow(vector(v293.position.x - l_x_4 / 2 - 5, v293.position.y - 20), vector(v293.position.x + l_x_4 / 2 + 4, v293.position.y + l_y_5 + 3), color(v298.r, v298.g, v298.b, 255 * v193), 25, 0, 4);
            render.text(1, vector(v293.position.x - l_x_4 / 2, v293.position.y), color(255, 255, 255, 255 * v193), "", v300);
            render.texture(v22.image_velocity, vector(v293.position.x - l_x_4 / 8, v293.position.y - l_y_5 - 5), vector(18, 20), color(v298.r, v298.g, v298.b, 255 * v193));
            render.rect_outline(vector(v293.position.x - l_x_4 / 2 - 5, v293.position.y - 20), vector(v293.position.x + l_x_4 / 2 + 4, v293.position.y + l_y_5 + 3), color(255, 255, 255, 200 * v305), 1, 6, false);
            render.text(1, vector(v293.position.x - l_x_4 / 1.85, v293.position.y + l_y_5 + 6), color(255, 255, 255, v305), nil, "\240\159\150\177 Press M2 to center.");
            return;
        end;
    end;
end);
lerpx = function(v309, v310, v311)
    return v310 * (1 - v309) + v311 * v309;
end;
v22.window = function(v312, v313, v314, v315, v316, v317)
    -- upvalues: v9 (ref)
    local v318 = render.measure_text(1, "", v316);
    local l_r_3 = v9.visuals_solusui_color:get().r;
    local l_g_3 = v9.visuals_solusui_color:get().g;
    local l_b_3 = v9.visuals_solusui_color:get().b;
    render.rect(vector(v312, v313 + 1), vector(v312 + v314 + 3, v313 + 20), color(25, 25, 25, v317 / 1.5), 2);
    render.rect_outline(vector(v312, v313 + 1), vector(v312 + v314 + 3, v313 + 20), color(l_r_3, l_g_3, l_b_3, v317 / 1.5), 1, 2);
    render.shadow(vector(v312, v313 + 1), vector(v312 + v314 + 3, v313 + 20), color(l_r_3, l_g_3, l_b_3, v317), 20, 0, 2);
    render.text(1, vector(v312 + 1 + v314 / 2 + 1 - v318.x / 2, v313 + v315 / 2 - v318.y / 2 + 2), color(255, 255, 255, v317), "", v316);
end;
local _ = render.screen_size().x;
local _ = render.screen_size().y;
local v324 = 0;
local v325 = 1;
local _ = 0;
local v327 = 0;
local v328 = {
    [""] = {
        alpha_k = 0
    }
};
local _ = 1;
v22.keybinds = l_system_0.register({
    [1] = v9.visuals_solusui_pos_x, 
    [2] = v9.visuals_solusui_pos_y
}, vector(120, 28), "Keybinds", function(v330)
    -- upvalues: v9 (ref), v328 (ref), v327 (ref), v325 (ref), v324 (ref), v22 (ref)
    if v9.visuals_solusui_select:get("Hotkeys") and v9.visuals_solusui:get() then
        local v331 = 0;
        local v332 = globals.frametime * 16;
        local v333 = 0;
        local _ = 66;
        local v335 = {};
        local v336 = ui.get_binds();
        for v337 = 1, #v336 do
            local v338 = v336[v337];
            local v339 = v336[v337].mode == 1 and "holding" or v336[v337].mode == 2 and "toggled" or "[?]";
            local l_value_0 = v336[v337].value;
            local l_name_0 = v336[v337].name;
            if l_name_0 == "Peek Assist" then
                l_name_0 = "Quick peek assist";
            end;
            if l_name_0 == "Edge Jump" then
                l_name_0 = "Jump at edge";
            end;
            if l_name_0 == "Hide Shots" then
                l_name_0 = "On shot anti-aim";
            end;
            if l_name_0 == "Minimum Damage" then
                l_name_0 = "Minimum damage";
            end;
            if l_name_0 == "Fake Latency" then
                l_name_0 = "Ping spike";
            end;
            if l_name_0 == "Fake Duck" then
                l_name_0 = "Duck peek assist";
            end;
            if l_name_0 == "Safe Points" then
                l_name_0 = "Safe point";
            end;
            if l_name_0 == "Body Aim" then
                l_name_0 = "Body aim";
            end;
            if l_name_0 == "Double Tap" then
                l_name_0 = "Double tap";
            end;
            if l_name_0 == "Yaw Base" then
                l_name_0 = "Manual override";
            end;
            if l_name_0 == "Slow Walk" then
                l_name_0 = "Slow motion";
            end;
            local v342 = render.measure_text(1, "", v339);
            local v343 = render.measure_text(1, "", l_name_0);
            if v328[v338.name] == nil then
                v328[v338.name] = {
                    alpha_k = 0
                };
            end;
            v328[v338.name].alpha_k = lerpx(v332, v328[v338.name].alpha_k, v338.active and 255 or 0);
            render.text(1, vector(v330.position.x + 3, v330.position.y + 19 + v333), color(255, v328[v338.name].alpha_k), "", l_name_0);
            if l_name_0 == "Minimum damage" or l_name_0 == "Ping spike" then
                render.text(1, vector(v330.position.x + (v327 - v342.x) - render.measure_text(1, nil, l_value_0).x + 28, v330.position.y + 19 + v333), color(255, v328[v338.name].alpha_k), "", "[" .. l_value_0 .. "]");
            else
                render.text(1, vector(v330.position.x + (v327 - v342.x - 8), v330.position.y + 19 + v333), color(255, v328[v338.name].alpha_k), "", "[" .. v339 .. "]");
            end;
            v333 = v333 + 16 * v328[v338.name].alpha_k / 255;
            local v344 = v342.x + v343.x + 18;
            if v344 > 119 and v331 < v344 then
                v331 = v344;
            end;
            if v336.active then
                table.insert(v335, v336);
            end;
        end;
        v325 = lerpx(v332, v325, (not (ui.get_alpha() <= 0) or v333 > 0) and 1 or 0);
        v327 = lerpx(v332, v327, math.max(v331, 119));
        if ui.get_alpha() > 0 or v333 > 6 then
            v324 = lerpx(v332, v324, math.max(ui.get_alpha() * 255, v333 > 1 and 255 or 0));
        elseif v333 < 15.99 and ui.get_alpha() == 0 then
            v324 = lerpx(v332, v324, 0);
        end;
        if ui.get_alpha() or #v335 > 0 then
            v22.window(v330.position.x, v330.position.y, v327, 16, "Hotkeys", v324);
        end;
    end;
end);
local v345 = render.load_image(network.get("https://avatars.cloudflare.steamstatic.com/fef49e7fa7e1997310d705b2a6158ff8dc1cdfeb_medium.jpg"), vector(50, 50));
v22.spectators = l_system_0.register({
    [1] = v9.visuals_solusui_pos_x1, 
    [2] = v9.visuals_solusui_pos_y1
}, vector(120, 28), "Spectators", function(v346)
    -- upvalues: v9 (ref), v22 (ref), v345 (ref)
    if v9.visuals_solusui_select:get("Spectators") and v9.visuals_solusui:get() then
        local v347 = 120;
        if v347 > 149 and max_width < v347 then
            max_width = v347;
        end;
        if ui.get_alpha() > 0.3 or ui.get_alpha() > 0.3 and not globals.is_in_game then
            v22.window(v346.position.x, v346.position.y, v347, 16, "Spectators", 255);
        end;
        local v348 = entity.get_local_player();
        if v348 == nil then
            return;
        else
            local _ = v348:get_spectators();
            if v348.m_hObserverTarget and (v348.m_iObserverMode == 4 or v348.m_iObserverMode == 5) then
                v348 = v348.m_hObserverTarget;
            end;
            local v350 = v348.get_spectators(v348);
            if v350 == nil then
                return;
            else
                for v351, v352 in pairs(v350) do
                    local v353 = v352:get_name();
                    local _ = render.measure_text(1, "", v353).x;
                    name_sub = string.len(v353) > 30 and string.sub(v353, 0, 30) .. "..." or v353;
                    local v355 = v352:get_steam_avatar();
                    if v355 == nil or v355.width <= 5 then
                        v355 = v345;
                    end;
                    if not v352:is_bot() or v352:is_player() then
                        render.text(1, vector(v346.position.x + 17, v346.position.y + 5 + v351 * 15), color(), "u", name_sub);
                        render.texture(v355, vector(v346.position.x + 1, v346.position.y + 5 + v351 * 15), vector(12, 12), color(), "f", 0);
                    end;
                end;
                if #v348.get_spectators(v348) > 0 or v348.m_iObserverMode == 4 or v348.m_iObserverMode == 5 then
                    v22.window(v346.position.x, v346.position.y, v347, 16, "Spectators", 255);
                end;
            end;
        end;
    end;
end);
events.mouse_input:set(function()
    if ui.get_alpha() > 0.3 then
        return false;
    else
        return;
    end;
end);
v22.watermark = function()
    -- upvalues: v9 (ref), l_gradient_0 (ref)
    if not v9.visuals_watermark:get() then
        return;
    else
        local v356 = entity.get_local_player();
        if not v356 then
            return;
        elseif not v356:is_alive() then
            return;
        elseif not globals.is_in_game then
            return;
        else
            local l_x_7 = render.screen_size().x;
            local l_y_7 = render.screen_size().y;
            local v359 = l_gradient_0.text_animate("N E V E R L O S E", -2, {
                color(25, 25, 25), 
                color(v9.visuals_watermark_color:get().r, v9.visuals_watermark_color:get().g, v9.visuals_watermark_color:get().b)
            });
            local v360 = render.measure_text(1, nil, "A N T I " .. v359:get_animated_text());
            local v361 = render.measure_text(1, nil, "B E T A");
            if v9.visuals_watermark_place:get() == "Up" then
                render.text(1, vector(l_x_7 / 2 - v360.x / 2 + v9.visuals_watermark_offset:get(), l_y_7 / 200), color(255, 255, 255, 255), nil, "A N T I " .. v359:get_animated_text());
                render.text(1, vector(l_x_7 / 2 - v361.x / 2 + v9.visuals_watermark_offset:get(), l_y_7 / 200 + v360.y / 2 + 5), color(220, 72, 72, 255), nil, "B E T A");
            elseif v9.visuals_watermark_place:get() == "Down" then
                render.text(1, vector(l_x_7 / 2 - v360.x / 2 + v9.visuals_watermark_offset:get(), l_y_7 / 1.014), color(255, 255, 255, 255), nil, "A N T I " .. v359:get_animated_text());
                render.text(1, vector(l_x_7 / 2 - v361.x / 2 + v9.visuals_watermark_offset:get(), l_y_7 / 1.014 - v360.y / 2 - 5), color(220, 72, 72, 255), nil, "B E T A");
            end;
            v359:animate();
            return;
        end;
    end;
end;
local v362 = render.load_font("Calibri", 23, "abd");
render.indicator = function(v363, v364, v365, v366, v367)
    -- upvalues: v362 (ref)
    local v368 = render.screen_size().x / 100 + 2;
    local v369 = render.screen_size().y / 1.47;
    ts = render.measure_text(v362, nil, v363);
    render.gradient(vector(v368 / 1.9, v369 + v364), vector(v368 / 1.9 + ts.x / 2, v369 + v364 + ts.y + 6), color(0, 0, 0, 0), color(0, 0, 0, 45), color(0, 0, 0, 0), color(0, 0, 0, 45));
    render.gradient(vector(v368 / 1.9 + ts.x / 2, v369 + v364), vector(v368 / 1.9 + ts.x, v369 + v364 + ts.y + 6), color(0, 0, 0, 45), color(0, 0, 0, 0), color(0, 0, 0, 45), color(0, 0, 0, 0));
    render.text(v362, vector(v368, v369 + 4 + v364), v365, nil, v363);
    if v366 and v367 then
        render.circle_outline(vector(v368 + ts.x + 18, v369 + v364 + ts.y / 2 + 2), color(0, 0, 0, 255), 10.5, 90, 1, 4);
        render.circle_outline(vector(v368 + ts.x + 18, v369 + v364 + ts.y / 2 + 2), v366, 10, 90, v367, 3);
    end;
end;
v22.get_bind = function(v370)
    local v371 = false;
    local v372 = 0;
    local v373 = ui.get_binds();
    for v374 = 1, #v373 do
        if v373[v374].name == v370 and v373[v374].active then
            v371 = true;
            v372 = v373[v374].value;
        end;
    end;
    return {
        [1] = v371, 
        [2] = v372
    };
end;
v22.spectators_get = function()
    local v375 = {};
    local v376, v377 = entity.get_local_player();
    if v376 ~= nil then
        if v376.m_hObserverTarget then
            v377 = v376.m_hObserverTarget;
        else
            v377 = v376;
        end;
        local v378 = entity.get_players(false, false);
        if v378 ~= nil then
            for _, v380 in pairs(v378) do
                local l_m_hObserverTarget_0 = v380.m_hObserverTarget;
                if l_m_hObserverTarget_0 and l_m_hObserverTarget_0 == v377 then
                    table.insert(v375, v380);
                end;
            end;
        end;
    end;
    return v375;
end;
v22.skeetcc_ebaniy = function()
    -- upvalues: v9 (ref), v22 (ref), v23 (ref), v14 (ref), v10 (ref)
    if not v9.visuals_gamesense:get() then
        return;
    else
        local v382 = entity.get_local_player();
        if v9.visuals_gamesense_menu:get() then
            local v383 = {
                Pos = ui.get_position() - vector(3, 3), 
                Size = ui.get_size() + vector(3, 3)
            };
            local v384 = color(96, 227, 231);
            local v385 = color(130, 0, 150);
            if ui.get_alpha() > 0.3 then
                render.rect(v383.Pos - vector(6, 6), v383.Pos + v383.Size + vector(3, 3) + vector(6, 6), color("0A0A0AFF"));
                render.rect(v383.Pos - vector(5, 5), v383.Pos + v383.Size + vector(3, 3) + vector(5, 5), color("3C3C3CFF"));
                render.rect(v383.Pos - vector(4, 4), v383.Pos + v383.Size + vector(3, 3) + vector(4, 4), color("282828FF"));
                render.rect(v383.Pos - vector(1, 1), v383.Pos + v383.Size + vector(3, 3) + vector(1, 1), color("3C3C3CFF"));
                render.rect(v383.Pos, v383.Pos + v383.Size + vector(3, 3), color("141414FF"));
                render.gradient(v383.Pos + vector(1, 1), v383.Pos + vector(v383.Size.x, 0) + vector(1, 2), v384, v385, v384, v385);
            end;
        end;
        if not v382 then
            return;
        elseif not v382:is_alive() then
            return;
        elseif not globals.is_in_game then
            return;
        else
            local _ = render.screen_size();
            local v387 = ui.find("Miscellaneous", "Main", "Other", "Fake Latency"):get();
            local v388 = 5;
            local v389 = v22.spectators_get();
            for _, v391 in pairs(v389) do
                local v392 = v391:get_name();
                local l_x_8 = render.measure_text(1, nil, v392).x;
                render.text(1, vector(render.screen_size().x - l_x_8 - 2, 2 + v388), color(255, 255, 255, 255), nil, v392);
                v388 = v388 + 17;
            end;
            local v394 = entity.get_entities("CPlantedC4", true)[1];
            local v395 = "";
            local v396 = 0;
            local v397 = false;
            local v398 = 0;
            local v399 = 0;
            local v400 = false;
            if v394 ~= nil then
                v396 = v394.m_flC4Blow - globals.curtime;
                v397 = v394.m_bBombDefused;
                if v396 > 0 and not v397 then
                    local v401 = v394.m_hBombDefuser ~= 4294967295;
                    local l_m_flDefuseLength_0 = v394.m_flDefuseLength;
                    local v403 = v401 and v394.m_flDefuseCountDown - globals.curtime or -1;
                    if v403 > 0 then
                        local v404 = v403 < v396 and color(58, 191, 54, 160) or color(252, 18, 19, 125);
                        local v405 = (render.screen_size().y - 50) / l_m_flDefuseLength_0 * v403;
                        render.rect(vector(0, 0), vector(16, render.screen_size().y), color(25, 25, 25, 160));
                        render.rect_outline(vector(0, 0), vector(16, render.screen_size().y), color(25, 25, 25, 160));
                        render.rect(vector(0, render.screen_size().y - v405), vector(16, render.screen_size().y), v404);
                    end;
                    v395 = v394.m_nBombSite == 0 and "A" or "B";
                    local l_m_iHealth_0 = v382.m_iHealth;
                    local l_m_ArmorValue_0 = v382.m_ArmorValue;
                    local v408 = v394.m_vecOrigin:dist(v382.m_vecOrigin);
                    local v409 = 450.7;
                    local v410 = (v408 - 75.68) / 789.2;
                    v398 = v409 * math.exp(-v410 * v410);
                    if l_m_ArmorValue_0 > 0 then
                        local v411 = v398 * 0.5;
                        local v412 = (v398 - v411) * 0.5;
                        if l_m_ArmorValue_0 < v412 then
                            l_m_ArmorValue_0 = l_m_ArmorValue_0 * 2;
                            v411 = v398 - v412;
                        end;
                        v398 = v411;
                    end;
                    v399 = math.ceil(v398);
                    v400 = l_m_iHealth_0 <= v399;
                end;
            end;
            if v23.planting then
                v23.fill = 3.125 - (3.125 + v23.on_plant_time - globals.curtime);
                if v23.fill > 3.125 then
                    v23.fill = 3.125;
                end;
            end;
            local v413 = 37;
            local v414 = 0;
            local l_get_bind_0 = v22.get_bind;
            local l_m_iPing_0 = v382:get_resource().m_iPing;
            local v417 = math.abs(l_m_iPing_0 % 360) / (v387 / 2);
            if v417 > 1 then
                v417 = 1;
            end;
            local v418 = color(255 - 125 * v417, 200 * v417, 0);
            local v419 = {
                [1] = {
                    "DA", 
                    v14.dormant_aimbot:get(), 
                    color(255, 200)
                }, 
                [2] = {
                    [1] = "PING", 
                    [2] = v387 > 0 and v382:is_alive(), 
                    [3] = v418
                }, 
                [3] = {
                    "BODY", 
                    v14.body_aim:get() == "Force", 
                    color(255, 200)
                }, 
                [4] = {
                    "SAFE", 
                    v14.safe_points:get() == "Force", 
                    color(255, 200)
                }, 
                [5] = {
                    [1] = "DT", 
                    [2] = v14.double_tap:get(), 
                    [3] = rage.exploit:get() == 1 and color(255, 200) or color(255, 0, 0, 255)
                }, 
                [6] = {
                    "OSAA", 
                    v14.hide_shots:get(), 
                    color(255, 200)
                }, 
                [7] = {
                    "DUCK", 
                    ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"):get(), 
                    color(255, 200)
                }, 
                [8] = {
                    "FS", 
                    v10.freestanding:get(), 
                    color(255, 200)
                }, 
                [9] = {
                    "HITCHANCE OVR", 
                    l_get_bind_0("Hit Chance")[1], 
                    color(255, 200)
                }, 
                [10] = {
                    "HITBOX OVR", 
                    l_get_bind_0("Hitboxes")[1], 
                    color(255, 200)
                }, 
                [11] = {
                    "MD", 
                    l_get_bind_0("Min. Damage")[1], 
                    color(255, 200)
                }, 
                [12] = {
                    v395 .. " - " .. string.format("%.1f", v396) .. "s", 
                    v396 > 0 and not v397, 
                    color(255, 200)
                }, 
                [13] = {
                    "FATAL", 
                    v382:is_alive() and v400, 
                    color(255, 0, 0, 255)
                }, 
                [14] = {
                    "-" .. v399 .. " HP", 
                    v382:is_alive() and not v400 and v398 > 0.5, 
                    color(210, 216, 112, 255)
                }, 
                [15] = {
                    [1] = v23.planting_site, 
                    [2] = v23.planting, 
                    [3] = color(210, 216, 112, 255), 
                    [4] = color(255, 255), 
                    [5] = skeet_indication_style == "New" and v23.fill / 3.3 or nil
                }
            };
            for _, v421 in pairs(v419) do
                if v421[2] then
                    render.indicator(v421[1], v414, v421[3], v421[4], v421[5]);
                    v414 = v414 - v413;
                end;
            end;
            return;
        end;
    end;
end;
v23.reset = function()
    -- upvalues: v23 (ref)
    v23.planting = false;
    v23.fill = 0;
    v23.on_plant_time = 0;
    v23.planting_site = "";
end;
v23.bomb_beginplant = function(v422)
    -- upvalues: v23 (ref)
    local v423 = entity.get_player_resource();
    if v423 == nil then
        return;
    else
        v23.on_plant_time = globals.curtime;
        v23.planting = true;
        local l_m_bombsiteCenterA_0 = v423.m_bombsiteCenterA;
        local l_m_bombsiteCenterB_0 = v423.m_bombsiteCenterB;
        local v426 = entity.get(v422.userid, true):get_origin();
        v23.planting_site = v426:dist(l_m_bombsiteCenterA_0) < v426:dist(l_m_bombsiteCenterB_0) and "Bombsite A" or "Bombsite B";
        return;
    end;
end;
events.post_update_clientside_animation(function(v427)
    -- upvalues: v10 (ref), v17 (ref)
    if not v427 then
        return;
    elseif not v427:is_alive() then
        return;
    else
        if v10.addictionals:get() then
            if v10.air_legs:get() == "Default" then
                ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"):override("Default");
            elseif v10.air_legs:get() == "Static" then
                ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"):override("Sliding");
                v427.m_flPoseParameter[6] = 1;
            elseif v17.state() == "jumping" or v17.state() ~= "ducking_in_jumping" or v10.air_legs:get() == "Walking" then

            end;
            if v10.ground_legs:get() == "Default" then
                ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"):override("Default");
            elseif v10.ground_legs:get() == "Static" then
                ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"):override("Sliding");
                v427.m_flPoseParameter[0] = 1;
            elseif v10.ground_legs:get() == "Walking" then
                ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"):override("Walking");
                v427.m_flPoseParameter[7] = 0;
            end;
            if v10.sliding_slow_walk:get() then
                v427.m_flPoseParameter[9] = 0;
            end;
        end;
        return;
    end;
end);
v17.move_lean = function(v428)
    -- upvalues: v9 (ref)
    if v9.move_lean:get() then
        v428.animate_move_lean = true;
    else
        v428.animate_move_lean = false;
    end;
end;
v25.main = function()
    -- upvalues: v17 (ref), v9 (ref)
    local v429 = utils.random_int(1, 2);
    if v17.state() == "jumping" or v17.state() == "ducking_in_jumping" and v9.breal_lc:get() then
        if v429 == 1 then
            ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"):override("Always On");
        else
            ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"):override("On Peek");
        end;
    end;
end;
v20.get_nearest_enemy = function()
    local v430 = entity.get_local_player();
    if not v430 or not v430:is_alive() then
        return;
    else
        local l_huge_2 = math.huge;
        local l_huge_3 = math.huge;
        for _, v434 in ipairs(entity.get_players(true, true)) do
            if v434 ~= nil and v434.m_iHealth > 0 then
                local v435 = v434:get_origin():dist_to_ray(render.camera_position(), v430:get_origin());
                if v435 < l_huge_2 then
                    l_huge_2 = v435;
                    l_huge_3 = v434;
                end;
            end;
        end;
        if not l_huge_3 then
            return;
        else
            return v430:get_origin():dist(l_huge_3.get_origin(l_huge_3));
        end;
    end;
end;
v20.air_hitchance = function()
    -- upvalues: v9 (ref), v17 (ref)
    if not v9.air_hitchance:get() then
        return;
    else
        ssg = ui.find("Aimbot", "Ragebot", "Selection", "SSG-08", "Hit Chance");
        awp = ui.find("Aimbot", "Ragebot", "Selection", "AWP", "Hit Chance");
        auto = ui.find("Aimbot", "Ragebot", "Selection", "AutoSnipers", "Hit Chance");
        revolver = ui.find("Aimbot", "Ragebot", "Selection", "R8 Revolver", "Hit Chance");
        all = ui.find("Aimbot", "Ragebot", "Selection", "Hit Chance");
        hitchance = air_hitchance_value:get();
        if v17.state() == "ducking_in_jumping" or v17.state() == "jumping" then
            if v9.air_hitchance_weapons:get("Scout") then
                ssg:override(hitchance);
            end;
            if v9.air_hitchance_weapons:get("Awp") then
                awp:override(hitchance);
            end;
            if v9.air_hitchance_weapons:get("Auto") then
                auto:override(hitchance);
            end;
            if v9.air_hitchance_weapons:get("Revolver") then
                revolver:override(hitchance);
            end;
            if v9.air_hitchance_weapons:get("All") then
                all:override(hitchance);
            end;
        end;
        return;
    end;
end;
v20.no_scope_hitchance = function()
    -- upvalues: v9 (ref), v20 (ref)
    if not v9.no_scope_hitchance:get() then
        return;
    else
        local l_m_bIsScoped_2 = entity.get_local_player().m_bIsScoped;
        ssg = ui.find("Aimbot", "Ragebot", "Selection", "SSG-08", "Hit Chance");
        awp = ui.find("Aimbot", "Ragebot", "Selection", "AWP", "Hit Chance");
        auto = ui.find("Aimbot", "Ragebot", "Selection", "AutoSnipers", "Hit Chance");
        hitchance = v9.no_scope_hitchance_value:get();
        if not l_m_bIsScoped_2 then
            if v9.no_scope_hitchance_distance:get() == 1000 then
                if v9.no_scope_hitchance_weapons:get("Scout") then
                    ssg:override(hitchance);
                end;
                if v9.no_scope_hitchance_weapons:get("Auto") then
                    auto:override(hitchance);
                end;
                if v9.no_scope_hitchance_weapons:get("Awp") then
                    awp:override(hitchance);
                end;
            elseif v20.get_nearest_enemy() < v9.no_scope_hitchance_distance:get() then
                if v9.no_scope_hitchance_weapons:get("Scout") then
                    ssg:override(hitchance);
                end;
                if v9.no_scope_hitchance_weapons:get("Auto") then
                    auto:override(hitchance);
                end;
                if v9.no_scope_hitchance_weapons:get("Awp") then
                    awp:override(hitchance);
                end;
            else
                ssg:override(nil);
                awp:override(nil);
                auto:override(nil);
            end;
        else
            ssg:override(nil);
            awp:override(nil);
            auto:override(nil);
        end;
        return;
    end;
end;
local v437 = {};
local v438 = ui.create("\aE94545FF" .. v13.gear, "\aE94545FFRagebot");
local v439 = {
    enable = v438:switch("\aE94545FF" .. ui.get_icon("transporter-1") .. "\aFFFFFFFF Auto Teleport in Air\aE94545FF [Exploit]", false), 
    guns = v438:selectable("", {
        [1] = "Scout", 
        [2] = "AWP", 
        [3] = "Auto", 
        [4] = "Pistols", 
        [5] = "Zeus", 
        [6] = "Knife", 
        [7] = "Nades"
    }), 
    delay = v438:slider("Recharge Delay", 1, 10, 1, 1, " sec")
};
v437.teleport = false;
v437.ref = ui.find("Aimbot", "Ragebot", "Main", "Double tap");
v437.teleport_time = 0;
v437.update = function(_)
    -- upvalues: v437 (ref), v439 (ref)
    local v441 = entity.get_local_player();
    if not v441 then
        return;
    else
        local v442 = v441:get_player_weapon();
        if not v442 then
            return;
        else
            local v443 = v442:get_weapon_index();
            local l_weapon_type_0 = v442:get_weapon_info().weapon_type;
            local v445 = v443 == 40;
            local v446 = v443 == 9;
            local v447 = v443 == 38 or v443 == 39;
            local v448 = l_weapon_type_0 == 1;
            local v449 = v443 == 31;
            local v450 = l_weapon_type_0 == 0;
            local v451 = l_weapon_type_0 == 9;
            local v452 = bit.band(v441.m_fFlags, 1) == 0;
            if v437.teleport_time > 0 then
                v437.teleport_time = v437.teleport_time - globals.tickcount;
                if v437.teleport_time <= 0 then
                    v437.teleport = false;
                end;
            end;
            entity.get_players(true, false, function(v453)
                -- upvalues: v437 (ref), v439 (ref), v445 (ref), v446 (ref), v447 (ref), v448 (ref), v449 (ref), v450 (ref), v451 (ref), v452 (ref)
                if v453:is_visible() and v453:is_alive() and not v437.teleport and v439.enable:get() and v439.guns:get() ~= 0 and v437.ref:get() then
                    for v454, v455 in pairs({
                        [1] = v445, 
                        [2] = v446, 
                        [3] = v447, 
                        [4] = v448, 
                        [5] = v449, 
                        [6] = v450, 
                        [7] = v451, 
                        [8] = not v445 and not v446 and not v447 and not v448 and not v449 and not v450 and not v451
                    }) do
                        if v439.guns:get(v454) and v455 then
                            v437.teleport = true;
                            v437.teleport_time = v439.delay:get() * 1000;
                        end;
                    end;
                    if v437.teleport and v452 then
                        rage.exploit:force_teleport();
                    end;
                end;
            end);
            return;
        end;
    end;
end;
v437.visible = function()
    -- upvalues: v439 (ref)
    v439.guns:visibility(v439.enable:get());
    v439.delay:visibility(v439.enable:get());
end;
v439.enable:set_callback(v437.visible, true);
events.createmove:set(function(v456)
    -- upvalues: v437 (ref)
    v437.update(v456);
end);
Func = ui.create("\aE94545FF" .. v13.gear, "\aE94545FFVisuals");
fps_boost = Func:switch("\aE94545FF" .. ui.get_icon("wand-magic-sparkles") .. "\aFFFFFFFF Fps \aE94545FFBoost", false);
fps_boost_c = fps_boost:create();
fps_boost_list = fps_boost_c:list("Select Option", {
    [1] = "Low Fps", 
    [2] = "Medium Fps", 
    [3] = "High Fps"
});
local v457 = {
    [1] = {
        cvar = {
            [1] = cvar.r_shadows, 
            [2] = cvar.cl_csm_static_prop_shadows, 
            [3] = cvar.cl_csm_shadows, 
            [4] = cvar.cl_csm_world_shadows, 
            [5] = cvar.cl_foot_contact_shadows, 
            [6] = cvar.cl_csm_viewmodel_shadows, 
            [7] = cvar.cl_csm_rope_shadows, 
            [8] = cvar.cl_csm_sprite_shadows, 
            [9] = cvar.cl_foot_contact_shadows
        }
    }, 
    [2] = {
        cvar = {
            [1] = cvar.r_drawparticles, 
            [2] = cvar.cl_detail_multiplier
        }
    }, 
    [3] = {
        cvar = {
            [1] = cvar.r_eyesize, 
            [2] = cvar.r_eyeshift_z, 
            [3] = cvar.r_eyeshift_y, 
            [4] = cvar.r_eyeshift_x, 
            [5] = cvar.r_eyemove, 
            [6] = cvar.r_eyegloss
        }
    }, 
    [4] = {
        cvar = {
            [1] = cvar.r_drawtracers_firstperson, 
            [2] = cvar.r_drawtracers
        }
    }, 
    [5] = {
        cvar = {
            [1] = cvar.mat_postprocess_enable
        }
    }, 
    [6] = {
        cvar = {
            [1] = cvar.fog_enable_water_fog
        }
    }, 
    [7] = {
        cvar = {
            [1] = cvar.m_rawinput, 
            [2] = cvar.cl_bob_lower_amt
        }
    }, 
    [8] = {
        cvar = {
            [1] = cvar.cl_disablefreezecam, 
            [2] = cvar.cl_freezecampanel_position_dynamic, 
            [3] = cvar.cl_freezecameffects_showholiday
        }
    }, 
    [9] = {
        cvar = {
            [1] = cvar.r_drawropes, 
            [2] = cvar.r_drawsprites, 
            [3] = cvar.func_break_max_pieces, 
            [4] = cvar.mat_drawwater
        }
    }, 
    [10] = {
        cvar = {
            [1] = cvar.cl_disablehtmlmotd, 
            [2] = cvar.r_dynamic, 
            [3] = cvar.cl_autohelp, 
            [4] = cvar.r_drawdecals, 
            [5] = cvar.muzzleflash_light
        }
    }
};
fps_boost_func = function()
    -- upvalues: v457 (ref)
    if not fps_boost:get() then
        for _, v459 in ipairs(v457) do
            for _, v461 in ipairs(v459.cvar) do
                v461:int(1);
            end;
        end;
        return;
    else
        local v462 = fps_boost_list:get();
        if v462 == 1 then
            cvar.r_shadows:int(0);
            cvar.cl_csm_static_prop_shadows:int(0);
            cvar.cl_csm_shadows:int(0);
            cvar.cl_csm_world_shadows:int(0);
            cvar.cl_foot_contact_shadows:int(0);
            cvar.cl_csm_viewmodel_shadows:int(0);
            cvar.cl_csm_rope_shadows:int(0);
            cvar.cl_csm_sprite_shadows:int(0);
            cvar.cl_foot_contact_shadows:int(0);
        else
            cvar.r_shadows:int(1);
            cvar.cl_csm_static_prop_shadows:int(1);
            cvar.cl_csm_shadows:int(1);
            cvar.cl_csm_world_shadows:int(1);
            cvar.cl_foot_contact_shadows:int(1);
            cvar.cl_csm_viewmodel_shadows:int(1);
            cvar.cl_csm_rope_shadows:int(1);
            cvar.cl_csm_sprite_shadows:int(1);
            cvar.cl_foot_contact_shadows:int(1);
        end;
        if v462 == 2 then
            cvar.r_drawparticles:int(0);
            cvar.cl_detail_multiplier:int(0);
            cvar.r_eyesize:int(0);
            cvar.r_eyeshift_z:int(0);
            cvar.r_eyeshift_y:int(0);
            cvar.r_eyeshift_x:int(0);
            cvar.r_eyemove:int(0);
            cvar.r_eyegloss:int(0);
            cvar.r_drawtracers_firstperson:int(0);
            cvar.r_drawtracers:int(0);
        elseif v462 == 3 then
            for _, v464 in ipairs(v457) do
                for _, v466 in ipairs(v464.cvar) do
                    v466:int(0);
                end;
            end;
        else
            for _, v468 in ipairs(v457) do
                for _, v470 in ipairs(v468.cvar) do
                    v470:int(1);
                end;
            end;
        end;
        return;
    end;
end;
disableFpsBoost = function()
    -- upvalues: v457 (ref)
    for _, v472 in ipairs(v457) do
        for _, v474 in ipairs(v472.cvar) do
            v474:int(1);
        end;
    end;
end;
local v475 = v15.ragebot:switch("\aE94545FF\f<virus>  \aFFFFFFFFExtended \aE94545FFBacktrack", false);
v475:set_callback(function(v476)
    if v476:get() then
        ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Extended Backtrack"):override(true);
    else
        ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Extended Backtrack"):override(false);
    end;
end);
v28.gjioer = false;
v28.teleport_tick = 0;
v28.ideal_tick = function()
    -- upvalues: v14 (ref), v9 (ref), v28 (ref)
    local v477 = entity.get_local_player();
    if not v477 then
        return;
    elseif not v477:is_alive() then
        return;
    else
        local v478 = utils.net_channel().avg_latency[0] * 1000;
        local v479 = false;
        local v480 = ui.get_binds();
        for v481 = 1, #v480 do
            local v482 = v480[v481];
            if v482.name == "Peek Assist" and v482.active then
                v479 = true;
            end;
        end;
        if (v14.auto_peek:get() or v479) and v14.double_tap:get() then
            idt = true;
        else
            idt = false;
        end;
        if v9.ideal_tick:get() then
            if v9.prev_os:get() and idt then
                v14.fl:set(0);
                if v478 >= 60 then
                    v14.fl:set(8);
                elseif v478 <= 30 then
                    v14.fl:set(0);
                else
                    v14.fl:set(4);
                end;
            else
                v14.fl:set(14);
            end;
            if idt then
                if v28.gjioer then
                    v28.teleport_tick = v28.teleport_tick + 1;
                    if v28.teleport_tick > 1 then
                        v28.gjioer = false;
                        v28.teleport_tick = 0;
                    end;
                    cvar.sv_maxusrcmdprocessticks:int(23);
                end;
            else
                cvar.sv_maxusrcmdprocessticks:int(13);
            end;
        else
            v14.fl:set(14);
            cvar.sv_maxusrcmdprocessticks:int(13);
        end;
        return;
    end;
end;
local v483 = {
    [1] = "a ", 
    [2] = "an ", 
    [3] = "ant ", 
    [4] = "anti ", 
    [5] = "antin ", 
    [6] = "antine ", 
    [7] = "antinev ", 
    [8] = "antineve ", 
    [9] = "antinever ", 
    [10] = "antineverl ", 
    [11] = "antineverlo ", 
    [12] = "antineverlos ", 
    [13] = "antineverlose ", 
    [14] = "antineverlos b ", 
    [15] = "antineverlo be ", 
    [16] = "antineverl bet ", 
    [17] = "antinever beta ", 
    [18] = "antinever beta ", 
    [19] = "antineverl bet ", 
    [20] = "antineverlo be ", 
    [21] = "antineverlos b ", 
    [22] = "antineverlose ", 
    [23] = "ntineverlose ", 
    [24] = "tineverlose ", 
    [25] = "ineverlose ", 
    [26] = "neverlose ", 
    [27] = "everlose ", 
    [28] = "verlose ", 
    [29] = "erlose ", 
    [30] = "rlose ", 
    [31] = "lose ", 
    [32] = "ose ", 
    [33] = "se ", 
    [34] = "e ", 
    [35] = " "
};
local function v484()
    -- upvalues: v483 (ref)
    if utils.net_channel() == nil then
        return;
    else
        return v483[math.floor(math.fmod((globals.tickcount + utils.net_channel().latency[0] / globals.tickinterval) / 22, #v483 + 1) + 1)];
    end;
end;
v20.check_nil = nil;
v20.clan_tag = function(v485)
    -- upvalues: v20 (ref)
    if v485 == v20.check_nil then
        return;
    elseif v485 == nil then
        return;
    else
        common.set_clan_tag(v485);
        v20.check_nil = v485;
        return;
    end;
end;
events.bomb_abortplant:set(function()
    -- upvalues: v23 (ref)
    v23.reset();
end);
events.bomb_defused:set(function()
    -- upvalues: v23 (ref)
    v23.reset();
end);
events.bomb_planted:set(function()
    -- upvalues: v23 (ref)
    v23.reset();
end);
events.round_prestart:set(function()
    -- upvalues: v23 (ref)
    v23.reset();
end);
events.bomb_beginplant:set(function(v486)
    -- upvalues: v23 (ref)
    v23.bomb_beginplant(v486);
end);
events.player_death:set(function(v487)
    -- upvalues: v20 (ref)
    v20.trash_talk(v487);
end);
events.createmove:set(function(v488)
    -- upvalues: v9 (ref), v20 (ref), v17 (ref), v24 (ref), v25 (ref), v26 (ref), v27 (ref)
    if v9.misc_fastladder:get() then
        v20.fast_ladder(v488);
    end;
    v17.main(v488);
    v17.desync_side();
    v17.anti_aim_on_use(v488);
    v24.system();
    v20.unmute_mute();
    v25.main();
    v20.no_scope_hitchance();
    v26.handle(v488);
    v27.handle(v488);
    if v9.misc_viewmodel:get() then
        v20.override_viewmodel();
    else
        cvar.viewmodel_fov:int(68);
        cvar.viewmodel_offset_x:float(2.5);
        cvar.viewmodel_offset_y:float(0);
        cvar.viewmodel_offset_z:float(-1.5);
    end;
end);
events.bullet_impact:set(function(v489)
    -- upvalues: v17 (ref), v10 (ref), v151 (ref), v9 (ref)
    if entity.get_local_player() == nil then
        return;
    else
        local v490 = entity.get(v489.userid, true);
        if not v490:is_enemy() then
            return;
        else
            local v491 = (vector(v489.x, v489.y, v489.z) - v490:get_hitbox_position(0)):angles();
            local v492 = (v490:get_hitbox_position(3) - v490:get_hitbox_position(0)):angles() - v491;
            v492.y = math.clamp(v492.y, -180, 180);
            if math.sqrt(v492.y * v492.y + v492.x * v492.x) < 5 and v17.antibrute_time_last + 0.1 < globals.realtime and v10.addictionals:get(5) then
                table.insert(v151, {
                    anim1 = 0, 
                    anim = 0, 
                    [1] = {
                        [1] = " Anti-bruteforce triggered, switched angle "
                    }, 
                    time = globals.realtime, 
                    color = v9.aimbotlogs_color:get()
                });
            end;
            return;
        end;
    end;
end);
events.render:set(function()
    -- upvalues: v17 (ref), v22 (ref), v28 (ref), v9 (ref), v20 (ref), v484 (ref), v14 (ref)
    v17.visibility_manager();
    v22.crosshair_indicators();
    v22.custom_scope();
    v22.kibit_damage();
    v22.velocity_indicator:update();
    v22.keybinds:update();
    v22.spectators:update();
    v22.skeetcc_ebaniy();
    v22.watermark();
    v28.ideal_tick();
    if v9.clantag:get() then
        v20.clan_tag(v484());
    else
        v20.clan_tag(" ");
    end;
    if v9.aimbotlogs_print:get("Logs") then
        v14.logs:set("Select");
    end;
end);
events.round_start:set(function()
    -- upvalues: v20 (ref), v17 (ref)
    v20.taskbar_notify();
    v17.antibruteforce_restart();
end);
events.shutdown:set(function()
    cvar.viewmodel_fov:int(68);
    cvar.viewmodel_offset_x:float(2.5);
    cvar.viewmodel_offset_y:float(0);
    cvar.viewmodel_offset_z:float(-1.5);
end);
events.shutdown:set(function()
    db.configs_dbbetabeta = configs_db;
end);
l_pui_0.setup({
    [1] = v18, 
    [2] = v10
});
local v493 = {
    elements = {
        [1] = v9.visuals_aimbotlogs, 
        [2] = v9.aimbotlogs_print, 
        [3] = v9.visuals_crosshairid, 
        [4] = v9.visuals_crosshairid_add_y, 
        [5] = v9.visuals_crosshairid_type, 
        [6] = v9.visuals_gamesense, 
        [7] = v9.visuals_damageid, 
        [8] = v9.visuals_damageid_pos, 
        [9] = v9.visuals_velocityid, 
        [10] = v9.visuals_velocityid_x, 
        [11] = v9.visuals_velocityid_y, 
        [12] = v9.visuals_scopeoverlay, 
        [13] = v9.visuals_scopeoverlay_gap, 
        [14] = v9.visuals_scopeoverlay_line_size, 
        [15] = v9.visuals_gamesense_menu, 
        [16] = v9.visuals_watermark, 
        [17] = v9.visuals_watermark_place, 
        [18] = v9.visuals_solusui, 
        [19] = v9.visuals_solusui_select, 
        [20] = v9.avoid_collisions, 
        [21] = v9.no_fall_damage, 
        [22] = v9.avoid_collisions_distance, 
        [23] = v9.misc_trashtalk, 
        [24] = v9.misc_automuteunmute, 
        [25] = v9.misc_automuteunmute_settings, 
        [26] = v9.misc_automuteunmute_player, 
        [27] = v9.misc_taskbarnotify, 
        [28] = v9.misc_aspectratio, 
        [29] = v9.misc_aspectratio_value, 
        [30] = v9.misc_viewmodel, 
        [31] = v9.misc_viewmodel_x, 
        [32] = v9.misc_viewmodel_y, 
        [33] = v9.misc_viewmodel_z, 
        [34] = v9.misc_viewmodel_fov, 
        [35] = v9.misc_fastladder, 
        [36] = v9.breal_lc, 
        [37] = v9.no_scope_hitchance, 
        [38] = v9.no_scope_hitchance_weapons, 
        [39] = v9.no_scope_hitchance_value, 
        [40] = v9.no_scope_hitchance_distance, 
        [41] = v9.air_hitchance, 
        [42] = v9.air_hitchance_weapons, 
        [43] = v9.air_hitchance_value, 
        [44] = v9.clantag, 
        [45] = v9.prev_os, 
        [46] = v9.ideal_tick, 
        [47] = v475, 
        [48] = fps_boost, 
        [49] = fps_boost_list
    }, 
    colors = {
        [1] = v9.visuals_crosshairid_main_color, 
        [2] = v9.visuals_crosshairid_state_color, 
        [3] = v9.visuals_crosshairid_addative_color, 
        [4] = v9.visuals_crosshairid_glow_color, 
        [5] = v9.visuals_scopeoverlay_color, 
        [6] = v9.visuals_velocityid_color, 
        [7] = v9.visuals_damageid_color, 
        [8] = v9.aimbotlogs_color, 
        [9] = v9.visuals_solusui_color, 
        [10] = v9.visuals_watermark_color
    }
};
local function v499()
    -- upvalues: v493 (ref), l_clipboard_0 (ref), l_base64_0 (ref), v29 (ref)
    local v494 = {
        [1] = {}, 
        [2] = {}
    };
    for _, v496 in pairs(v493.elements) do
        table.insert(v494[1], v496:get());
    end;
    for _, v498 in pairs(v493.colors) do
        table.insert(v494[2], {
            [1] = v498:get().r, 
            [2] = v498:get().g, 
            [3] = v498:get().b, 
            [4] = v498:get().a
        });
    end;
    l_clipboard_0.set(l_base64_0.encode(v29.stringify(v494)));
    common.add_notify("[Anti-Neverlose]", "Exported to clipboard");
end;
local function v505(v500)
    -- upvalues: v29 (ref), l_base64_0 (ref), v493 (ref)
    if not pcall(function()
        -- upvalues: v29 (ref), l_base64_0 (ref), v500 (ref), v493 (ref)
        some_config = v29.parse(l_base64_0.decode(v500));
        for v501, v502 in pairs(some_config) do
            v501 = ({
                [1] = "elements", 
                [2] = "colors"
            })[v501];
            for v503, v504 in pairs(v502) do
                if v501 == "elements" then
                    v493[v501][v503]:set(v504);
                end;
                if v501 == "colors" then
                    v493[v501][v503]:set(color(unpack(v504)));
                end;
            end;
        end;
        common.add_notify("[Anti-Neverlose]", "Imported from clipboard");
    end) then
        common.add_notify("[Anti-Neverlose]", "Failed to import");
        return;
    else
        return;
    end;
end;
v9.share_cfg:set_callback(function()
    -- upvalues: v499 (ref)
    v499();
end);
v9.apply_cfg:set_callback(function()
    -- upvalues: v505 (ref), l_clipboard_0 (ref)
    v505(l_clipboard_0.get());
end);
v9.load_cfg:set_callback(function()
    -- upvalues: v505 (ref)
    v505("eyIxIjp7IjEiOnRydWUsIjIiOnsiMSI6IkxvZ3MiLCIyIjoi0KFvbnNvbGUiLCIzIjoiU2NyZWVuIn0sIjMiOnRydWUsIjQiOjAsIjUiOiJCZXRhIiwiNiI6dHJ1ZSwiNyI6dHJ1ZSwiOCI6IkxlZnQiLCI5Ijp0cnVlLCIxMCI6OTcxLCIxMSI6MTU5LCIxMiI6dHJ1ZSwiMTMiOjksIjE0Ijo2NiwiMTUiOnRydWUsIjE2Ijp0cnVlLCIxNyI6IkRvd24iLCIxOCI6dHJ1ZSwiMTkiOnsiMSI6IkhvdGtleXMiLCIyIjoiU3BlY3RhdG9ycyJ9LCIyMCI6dHJ1ZSwiMjEiOnRydWUsIjIyIjoxNSwiMjMiOmZhbHNlLCIyNCI6ZmFsc2UsIjI1IjoiVW5tdXRlIiwiMjYiOiJFdmVyeSIsIjI3Ijp0cnVlLCIyOCI6dHJ1ZSwiMjkiOjEzLCIzMCI6dHJ1ZSwiMzEiOjIsIjMyIjoxLCIzMyI6MiwiMzQiOjgwLCIzNSI6dHJ1ZSwiMzYiOmZhbHNlLCIzNyI6ZmFsc2UsIjM4Ijp7fSwiMzkiOjAsIjQwIjowLCI0MSI6dHJ1ZSwiNDIiOnsiMSI6IkFsbCJ9LCI0MyI6NTUsIjQ0Ijp0cnVlLCI0NSI6ZmFsc2UsIjQ2Ijp0cnVlLCI0NyI6dHJ1ZX0sIjIiOnsiMSI6eyIxIjoyNTUsIjIiOjAsIjMiOjAsIjQiOjI1NX0sIjIiOnsiMSI6MjU1LCIyIjowLCIzIjowLCI0IjoyNTV9LCIzIjp7IjEiOjI1NSwiMiI6MjU1LCIzIjoyNTUsIjQiOjI1NX0sIjQiOnsiMSI6MCwiMiI6MCwiMyI6MCwiNCI6MjU1fSwiNSI6eyIxIjoyNTUsIjIiOjI1NSwiMyI6MjU1LCI0IjoyNTV9LCI2Ijp7IjEiOjI1NSwiMiI6MjU1LCIzIjoyNTUsIjQiOjI1NX0sIjciOnsiMSI6MjU1LCIyIjoyNTUsIjMiOjI1NSwiNCI6MjU1fSwiOCI6eyIxIjoyNTUsIjIiOjY1LCIzIjo2NSwiNCI6MjU1fSwiOSI6eyIxIjoyNTUsIjIiOjIsIjMiOjIsIjQiOjI1NX0sIjEwIjp7IjEiOjI4LCIyIjoyMjUsIjMiOjM3LCI0IjoyNTV9fX0=");
end);
fps_boost:set_callback(fps_boost_func);
fps_boost_list:set_callback(fps_boost_func);
v8.main = ui.sidebar("\240\157\152\188\240\157\153\137\240\157\153\143\240\157\153\132 \aE94545FF\240\157\153\137\240\157\153\128\240\157\153\145\240\157\153\128\240\157\153\141\240\157\153\135\240\157\153\138\240\157\153\142\240\157\153\128 ", "\aE94545FF" .. ui.get_icon("cube"));