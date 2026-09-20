local try_require = function(module) local ok, r = pcall(require, module) return ok and r or nil end
local surface = try_require('gamesense/surface') or error('~ Download surface library: https://gamesense.pub/forums/viewtopic.php?id=18793')
local ffi = require('ffi')

local json = _G.json or try_require('json') or try_require('gamesense/json')
if json then
    json.decode = json.decode or json.parse
    json.encode = json.encode or json.stringify
end

local pan_ok, pan = pcall(require, "gamesense/panorama")
local success_img, images = pcall(require, "gamesense/images")
if not success_img then images = nil end

local tokenize_console_line
local CON_MODULE, CHAT_MODULE, INTEL_MODULE

local function HUD_LOG(msg, r, g, b, no_prefix, val, c_name, target_tab, player_ent)
    if not CON_MODULE then return end
    r, g, b = r or 255, g or 255, b or 255
    local target = target_tab and target_tab:lower() or "log"
    if not CON_MODULE.tabs[target] then target = "log" end
    local final_msg = msg
    local p_context = player_ent

    if not no_prefix and target ~= "chat" then
        local lp = entity.get_local_player()
        local name = entity.get_player_name(lp) or "User"
        final_msg = "[" .. name .. "] " .. msg
        p_context = p_context or lp
    end
    local h, m, s = client.system_time()

    local tokens = tokenize_console_line and tokenize_console_line(final_msg, p_context) or { { text = final_msg, r = r, g = g, b = b } }

    local avatar = nil
    if p_context and images and images.get_player_avatar then
        local entidx = bit.band(p_context, 0xFFFF)
        if entidx > 0 and entidx <= 64 then
            pcall(function() avatar = images.get_player_avatar(entidx) end)
        end
    end

    local entry = {
        timestamp = globals.realtime(),
        time = string.format("%02d:%02d:%02d", h, m, s),
        text = final_msg,
        tokens = tokens,
        r = r, g = g, b = b,
        val = val, c_name = (c_name and tostring(c_name) or nil),
        player_ent = p_context,
        avatar = avatar
    }
    table.insert(CON_MODULE.tabs[target], entry)
    if #CON_MODULE.tabs[target] > (CON_MODULE.max_msgs or 50) then table.remove(CON_MODULE.tabs[target], 1) end
end

local function error_on(err)
    if not CON_MODULE or not HUD_LOG then return end
    local info = debug.traceback(err)
    HUD_LOG("[amphoreus] [V-HUD ERROR]", 255, 50, 50, true, nil, nil, "system")
    for line in info:gmatch("[^\r\n]+") do
        HUD_LOG("  " .. line, 255, 100, 100, true, nil, nil, "system")
    end
end

local TAC_ICON_DATA = {
["icon_headshot"]={32,32,'<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32"><g><path fill="#FFF" d="M28.477 7.202H31.626V8.063H28.477z"/><path transform="rotate(-45.364 28.813 5.514)" fill="#FFF" d="M27.564 5.084H30.064V5.944H27.564z"/><path transform="rotate(44.684 29.08 9.851)" fill="#FFF" d="M27.83 9.422H30.331V10.281H27.83z"/><path transform="rotate(64.532 27.338 10.516)" fill="#FFF" d="M26.504 10.086H28.171000000000003V10.945H26.504z"/><path transform="rotate(-57.439 27.273 4.703)" fill="#FFF" d="M26.441 4.272H28.108V5.132000000000001H26.441z"/><path fill="#FFF" d="M27.339,7.493L24.407,6.21l-8.186-0.023c0,0-0.171-0.146-0.533-0.534c-0.364-0.387-1.284-1.21-2.375-1.742 c-1.09-0.534-2.592-0.97-4.044-1.065C7.816,2.75,6.557,3.038,5.66,3.353S3.457,4.394,2.414,5.556 c-1.042,1.163-1.671,3.368-1.671,5.887c0,1.769,1.454,5.959,1.345,7.666l-0.292,2.761c-0.218,0.945-0.289,2.145-0.289,2.145 c0.447,0.532,1.925,2.204,3.475,3.366c1.551,1.162,3.658,2.76,5.693,2.737c2.034-0.023,2.494-0.437,3.365-0.896 c0.872-0.461,1.042-0.824,1.17-1.164c0.127-0.339-0.104-0.774-0.249-1.234c-0.144-0.461,0.024-0.872,0.249-1.042 c0.223-0.169,0.574-0.533,0.914-0.823c0.339-0.292,0.702-1.042,0.896-1.599c0.193-0.558,0.557-2.108,0.774-2.642 c0.218-0.532,0.823-1.912,0.993-2.397c0.17-0.484,0.146-1.622-0.072-2.249s-0.218-1.213-0.146-1.966 c0.073-0.751,0.484-0.969,0.58-2.35c0.047-0.655-0.604-2.3-0.846-2.809l6.538-0.072L27.339,7.493z M9.026,10.69l-1.089,1.236 l-1.332-0.97l-0.921,0.631L5.103,9.892L4.425,9.844l0.073-1.065L2.875,8.292V8.22l1.283-0.751L3.747,6.113h1.694l0.243-1.26 L6.678,5.29l0.774-1.091l0.485,1.042l1.478-0.315L9.729,6.21l1.891,1.283L10.675,8.56l0.944,0.993l-1.43,0.266l-0.12,1.188 L9.026,10.69z M12.224,15.002c-0.724-0.062-1.574-0.509-1.84-0.896c-0.267-0.387-0.363-1.018,0-1.308s1.138-0.896,2.325-0.774 c1.188,0.121,1.938,0.881,1.889,1.481c-0.048,0.601-0.461,0.988-0.896,1.183C13.265,14.881,12.511,15.027,12.224,15.002z M17.214,21.614c0,0-0.112,0.294-0.291,0.437c-0.483,0.388-0.558,0.437-0.848,0.461c-0.291,0.024-0.8,0-1.09,0 s-0.727-0.218-1.065-0.389c-0.339-0.169-0.823-0.678-0.921-0.75c-0.097-0.073-0.351-0.416-0.169-0.557 c0.287-0.224,0.727-0.606,1.066-0.679c0.338-0.073,0.762-0.193,1.313-0.193s1.35-0.049,1.641,0.096 c0.291,0.146,0.581,0.484,0.581,0.655C17.432,20.865,17.214,21.614,17.214,21.614z M18.691,13.041 c0.068,0.252-0.28,0.704-0.34,0.969c-0.097,0.436,0.024,0.703,0,0.992c-0.023,0.291-0.217,0.412-0.217,0.412 s-0.218-0.097-0.534-0.218c-0.315-0.121-0.75-0.483-0.75-0.775c0-0.291,0.023-0.702,0.314-0.969c0.291-0.266,0.8-0.604,1.14-0.63 C18.644,12.799,18.605,12.726,18.691,13.041z"/></g></svg>'},
["icon_noscope"]={32,32,'<svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="32.074px" height="32.074px" viewBox="0 0 32.074 32.074" enable-background="new 0 0 32.074 32.074" xml:space="preserve"><g id="Layer_2"><g><path fill="#FFFFFF" d="M27.366,15.763c-0.083,1.883-0.603,3.655-1.495,5.194l0.726,0.735c1.144-1.875,1.803-4.077,1.803-6.429 c0-6.829-5.557-12.385-12.386-12.385c-2.343,0-4.535,0.654-6.406,1.788l0.73,0.73c1.535-0.886,3.3-1.402,5.176-1.485l1-0.008 c5.879,0.257,10.603,4.982,10.86,10.859L27.366,15.763z"/><polygon fill="#FFFFFF" points="26.406,15.763 20.7,15.763 19.69,14.763 26.395,14.763 "/><polygon fill="#FFFFFF" points="16.514,4.874 16.514,11.549 15.514,10.598 15.514,4.874 "/><polygon fill="#FFFFFF" points="5.611,15.763 12.443,15.763 11.448,14.763 5.622,14.763 "/><path fill="#FFFFFF" d="M16.514,26.615c1.907-0.084,3.699-0.616,5.252-1.529l0.728,0.728c-1.886,1.163-4.106,1.834-6.48,1.834 c-6.829,0-12.386-5.557-12.386-12.386c0-2.371,0.67-4.589,1.83-6.474L6.173,9.54c-0.903,1.546-1.429,3.328-1.512,5.223l-0.008,1 c0.257,5.879,4.982,10.603,10.86,10.86L16.514,26.615z"/><polygon fill="#FFFFFF" points="16.514,25.647 16.514,19.806 15.514,18.841 15.514,25.647 "/></g><g><rect x="14.022" y="-1.261" transform="matrix(0.707 -0.7072 0.7072 0.707 -6.0247 15.7014)" fill="#FFFFFF" width="3.827" height="32.765"/></g></g></svg>'},
["icon_blind"]={32,32,'<svg version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" width="32.074px" height="32.074px" viewBox="0 0 32.074 32.074" enable-background="new 0 0 32.074 32.074" xml:space="preserve"><g id="Layer_2"><path fill="#FFFFFF" d="M24.653,20.562c3.162-2.137,4.701-4.76,4.701-4.76s-4.11-7.656-13.544-7.656 c-1.136,0-2.206,0.131-3.208,0.358l2.968,2.973c0.089-0.006,0.178-0.008,0.269-0.008c2.337,0,4.239,1.902,4.239,4.239 c0,0.104-0.004,0.207-0.011,0.309l1.686,1.681c0.211-0.625,0.325-1.294,0.325-1.99c0-2.104-1.045-3.961-2.64-5.091 c4.001,1.063,6.428,3.69,7.502,5.141c-0.697,0.879-1.926,2.203-3.697,3.333L24.653,20.562z M15.689,19.943 c-2.196-0.076-3.973-1.831-4.085-4.019c-0.004-0.072-0.006-0.145-0.006-0.217l-1.776-1.659c-0.146,0.528-0.224,1.084-0.224,1.659 c0,2.046,0.989,3.856,2.51,4.993c-3.536-1.093-6.071-3.513-7.314-4.927c0.732-0.869,1.927-2.111,3.537-3.207l-1.43-1.46 c-3.027,2.154-4.637,4.695-4.637,4.695s4.986,7.467,13.544,7.467c1.061,0,2.059-0.1,2.992-0.277 C18.802,22.991,15.739,19.945,15.689,19.943z"/><g><rect x="13.776" y="-0.676" transform="matrix(0.707 -0.7072 0.7072 0.707 -6.5109 15.6986)" fill="#FFFFFF" width="3.827" height="32.765"/></g></g></svg>'},
["penetrate"]={32,32,'<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32"><g><path fill="#FFF" d="M2.416 5.792v19.083l11.334 2.834V2.875L2.416 5.792zM7.813 19.98c-1.438 0-2.604-2.099-2.604-4.688 0-2.589 1.166-4.688 2.604-4.688 1.438 0 2.604 2.099 2.604 4.688C10.416 17.881 9.25 19.98 7.813 19.98zM24.38 16.268L15.166 16.268 15.166 14.375 24.38 14.375 25.558 15.292z"/><path fill="#FFF" d="M26.979 18.188L29.817 15.349 26.942 12.474 24.989 12.474 27.886 15.372 24.989 18.188z"/></g></svg>'},
["domination"]={32,32,'<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32"><path fill="#FFF" d="M19.939,2.104c-2.592-0.738-5.217-0.703-7.647-0.059c-0.011,0.003-0.021,0.007-0.032,0.01 c-0.438,0.117-0.867,0.254-1.289,0.411c-0.033,0.013-0.064,0.021-0.099,0.031c-0.056,0.022-0.108,0.047-0.165,0.067 c-0.251,0.102-0.502,0.201-0.746,0.314C9.837,2.938,9.721,3,9.6,3.061c-0.506,0.25-0.996,0.524-1.468,0.834 c-0.019,0.01-0.036,0.021-0.055,0.03C5.566,5.57,3.629,8.023,2.461,10.986c-0.885,2.246-0.873,4.306-0.873,4.306 c-0.181,4.422,1.723,8.821,5.196,11.924l0.04-0.052c3.85,3.146,9.207,4.236,14.197,2.361c1.135-0.426,2.172-0.992,3.125-1.652 c0.041-0.025,0.078-0.055,0.117-0.081c0.271-0.19,0.534-0.385,0.788-0.591c0.251-0.202,0.497-0.412,0.733-0.631 c0.08-0.074,0.154-0.15,0.232-0.228c1.77-1.7,3.129-3.87,3.851-6.403C32.053,12.273,27.607,4.287,19.939,2.104z M22.154,17.327 h5.154c-0.221,1.868-0.89,3.655-1.951,5.194c-0.084,0.117-0.168,0.232-0.256,0.347c-0.158,0.211-0.313,0.421-0.486,0.621 c-0.281,0.321-0.576,0.632-0.891,0.918c-0.063,0.059-0.134,0.112-0.199,0.17c-0.338,0.295-0.688,0.575-1.057,0.828 c-0.015,0.011-0.027,0.021-0.044,0.03c-1.276,0.865-2.722,1.472-4.249,1.771l0.008,0.027c-0.287,0.058-0.572,0.084-0.856,0.117 v-5.105c0-0.732-0.595-1.327-1.327-1.327s-1.327,0.595-1.327,1.327v5.117c-2.34-0.271-4.552-1.242-6.315-2.807 c-1.92-1.858-3.271-4.474-3.653-7.229H9.76c0.733,0,1.327-0.595,1.327-1.327s-0.594-1.327-1.327-1.327H4.645 c0.047-0.478,0.123-0.952,0.236-1.422c0.986-3.433,3.496-6.596,6.977-7.929c0.035-0.014,0.072-0.027,0.106-0.042 c0.896-0.332,1.804-0.53,2.709-0.634v5.246c0,0.733,0.595,1.327,1.327,1.327s1.327-0.594,1.327-1.327V4.655 c4.098,0.501,7.784,3.198,9.337,7.331c0.332,0.886,0.543,1.787,0.648,2.687h-5.158c-0.732,0-1.326,0.595-1.326,1.327 S21.422,17.327,22.154,17.327z"/></svg>'},
["revenge"]={32,32,'<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32"><g><path opacity=".4" fill="#FFF" d="M24.17 13.083L24.17 8.385 19.707 9.452 17.694 6.609 14.86 8.432 10.547 6.293 9.18 10.478 4.785 11.346 6.6 14.216 2.258 10.557 8.416 9.609 8.811 3.135 14.86 6.846 18.737 2.819 20.173 8.346 26.102 5.583 25.541 12.426 30.05 14.044 26.339 16.399 28.077 14.216z"/><g><path fill="#FFF" d="M22.953,30.499c-2.883,0-5.766,0-8.646,0c-0.016-0.269,0.052-0.532,0.032-0.799 c-0.015-0.201,0.021-0.399,0.039-0.597c0.016-0.192,0.008-0.396,0.106-0.579c0.034-0.062,0.047-0.151,0.034-0.222 c-0.054-0.313-0.105-0.628-0.187-0.935c-0.089-0.343-0.188-0.69-0.369-0.999c-0.138-0.232-0.346-0.413-0.535-0.6 c-0.951-0.951-1.875-1.93-2.878-2.828c-0.276-0.247-0.535-0.511-0.802-0.768c-0.046-0.043-0.093-0.081-0.142-0.119 c-0.122-0.093-0.223-0.196-0.199-0.382c0.029-0.231,0.063-0.462,0.111-0.689c0.092-0.427,0.177-0.851,0.177-1.293 c0.001-0.917-0.043-1.835,0.024-2.751c0.018-0.228,0.052-0.453,0.1-0.676c0.064-0.295,0.222-0.496,0.516-0.632 c0.63-0.293,1.278-0.545,1.909-0.837c0.282-0.131,0.574-0.186,0.888-0.165c0.239,0.016,0.483,0.002,0.761,0.002 c-0.257-0.096-0.502-0.102-0.747-0.207c0.482-0.209,0.943-0.387,1.384-0.607c0.273-0.136,0.516-0.189,0.771,0.01 c0.007,0.006,0.015,0.012,0.026,0.019c0.004,0.114,0.055,0.227,0.033,0.346c-0.051,0.308-0.029,0.622-0.093,0.926 c-0.038,0.181-0.071,0.364-0.138,0.54c-0.11,0.296-0.39,0.42-0.601,0.613c-0.248,0.225-0.517,0.427-0.777,0.637 c-0.212,0.173-0.431,0.338-0.634,0.52c-0.227,0.201-0.476,0.369-0.685,0.583c0.007,0.109,0.054,0.206,0.076,0.308 c0.085,0.362,0.169,0.724,0.254,1.088c-0.047,0.045-0.033,0.103-0.036,0.158c-0.005,0.044,0.004,0.085-0.026,0.13 c-0.177,0.273-0.354,0.546-0.513,0.829c-0.053,0.092-0.158,0.172-0.127,0.344c0.578-0.471,1.132-0.926,1.681-1.375 c0.168,0.084,0.316,0.17,0.473,0.236c0.603,0.256,1.129,0.627,1.577,1.097c0.134,0.139,0.276,0.186,0.433,0.184 c0.376-0.005,0.75,0.041,1.125,0.038c0.224-0.001,0.451-0.02,0.671,0.042c0.008,0.078,0.048,0.143,0.087,0.206 c0.201,0.34,0.408,0.676,0.591,1.026c0.049,0.093,0.058,0.191,0.035,0.283c-0.045,0.202-0.057,0.409-0.083,0.614 c-0.031,0.235-0.063,0.471-0.089,0.706c-0.014,0.132-0.045,0.269-0.036,0.397c0.092,0.033,0.104-0.035,0.118-0.075 c0.157-0.431,0.311-0.863,0.464-1.295c0.079-0.23,0.188-0.46,0.214-0.698c0.044-0.452,0.036-0.91,0.068-1.364 c0.016-0.234-0.02-0.471,0.046-0.706c0.217-0.089,0.442-0.082,0.672-0.051c0.193,0.026,0.381,0.042,0.543-0.11 c0.312-0.295,0.572-0.629,0.805-0.987c0.292,0.073,0.582,0.146,0.868,0.219c0.024-0.074-0.003-0.104-0.035-0.132 c-0.181-0.155-0.361-0.312-0.546-0.462c-0.054-0.042-0.093-0.119-0.18-0.096c0.045-0.118,0.063-0.241,0.094-0.362 c0.037-0.155,0.034-0.32,0.092-0.472c0.07,0.002,0.14-0.006,0.206-0.032c0.414-0.16,0.825-0.315,1.236-0.476 c0.041-0.016,0.107-0.033,0.059-0.114c-0.062,0-0.129-0.007-0.192,0.001c-0.403,0.052-0.809,0.053-1.213,0.088 c-0.021-0.104,0.019-0.202,0.026-0.303c0.019-0.3,0.073-0.595,0.101-0.894c0.031-0.342,0.108-0.679,0.002-1.015 c0.025-0.023,0.042-0.006,0.06,0.002c0.016,0.009,0.038,0.01,0.058,0.012c0.392,0.039,0.703,0.216,0.942,0.526 c0.313,0.409,0.63,0.817,0.945,1.226c0.109,0.14,0.227,0.282,0.244,0.461c0.035,0.42,0.083,0.838,0.046,1.267 c-0.037,0.412-0.045,0.827-0.067,1.242c-0.018,0.31-0.051,0.62-0.071,0.931c-0.026,0.401-0.084,0.798-0.118,1.198 c-0.028,0.3-0.033,0.603-0.069,0.9c-0.016,0.123-0.009,0.246-0.029,0.366c-0.05,0.281-0.053,0.565-0.088,0.848 c-0.03,0.243-0.037,0.488-0.066,0.729c-0.046,0.362-0.098,0.723-0.153,1.083c-0.029,0.188-0.062,0.38-0.197,0.528 c-0.092,0.102-0.162,0.219-0.234,0.334c-0.132,0.213-0.225,0.434-0.223,0.698C22.957,28.393,22.953,29.445,22.953,30.499z"/></g><path fill="#FFF" d="M24.627 12.5L24.627 7.542 19.916 8.667 17.792 5.667 14.802 7.591 10.249 5.333 8.806 9.75 4.168 10.667 6.083 13.695 1.5 9.833 8 8.833 8.416 2 14.802 5.917 18.893 1.667 20.409 7.5 26.666 4.583 26.073 11.807 30.833 13.515 26.916 16 28.751 13.695z"/></g></svg>'},
}
local TAC_ICONS = {}
for k, data in pairs(TAC_ICON_DATA) do
    local obj = { width = data[1], height = data[2], svg = data[3], textures = {} }
    function obj:measure(w, h)
        if not w and not h then return self.width, self.height
        elseif not w then return math.floor(self.width * (h / self.height)), h
        elseif not h then return w, math.floor(self.height * (w / self.width))
        else return w, h end
    end
    function obj:draw(x, y, w, h, r, g, b, a)
        local dw, dh = self:measure(w, h)
        local id = dw .. "_" .. dh
        if self.textures[id] == nil then
            local tex = renderer.load_svg(self.svg, dw, dh)
            self.textures[id] = tex or false
        end
        if self.textures[id] and a > 0 then
            renderer.texture(self.textures[id], x, y, dw, dh, r, g, b, a)
        end
        return dw, dh
    end
    TAC_ICONS[k] = obj
end


local PAN_MODULE = {
    id = "v_console_blur",
    created = false,
    panel = nil
}

function PAN_MODULE.init()
    if not pan_ok then return end
    pcall(function()
        pan.load_string([[
            var parent = $.GetContextPanel().FindChildTraverse("v_hud_root") || $.GetContextPanel();
            var blur = parent.FindChildTraverse("v_console_blur");
            if (!blur) {
                blur = $.CreatePanel("Panel", parent, "v_console_blur");
                blur.style.backdropFilter = "blur(18px) brightness(0.55)";
                blur.style.borderRadius = "12px";
                blur.style.border = "1px solid rgba(255, 255, 255, 0.03)";
                blur.style.background = "linear-gradient(135deg, rgba(15, 15, 18, 0.6), rgba(25, 25, 30, 0.4))";
                blur.style.opacity = "0";
                blur.style.boxShadow = "0 8px 32px 0 rgba(0, 0, 0, 0.37)";
                blur.style.visibility = "visible";
            }
        ]])()
        PAN_MODULE.created = true
    end)
end

function PAN_MODULE.update(x, y, w, h, alpha)
    if not pan_ok or not PAN_MODULE.created then return end
    local eased_alpha = ease_out_quad(alpha)
    pcall(function()
        pan.load_string(string.format([[
            var blur = $.GetContextPanel().FindChildTraverse("v_console_blur");
            if (blur) {
                blur.style.x = "%dpx";
                blur.style.y = "%dpx";
                blur.style.width = "%dpx";
                blur.style.height = "%dpx";
                blur.style.opacity = "%f";
            }
        ]], x, y, w, h, eased_alpha))()
    end)
end

PAN_MODULE.init()


local G_CONSOLE_CLIPBOARD = ""
local tokenize_console_line

local function set_clipboard(text)
    if not text or text == "" then return end
    G_CONSOLE_CLIPBOARD = text
    if pan_ok then
        pcall(function()
            if pan.set_clipboard then
                pan.set_clipboard(text)
            elseif pan.load_string then
                pan.load_string(string.format("$.GetContextPanel().SetClipboardText(%q)", text))()
            end
        end)
    end
end

local function get_clipboard()
    local text = G_CONSOLE_CLIPBOARD
    if pan_ok then
        pcall(function()
            local res = ""
            if pan.get_clipboard then
                res = pan.get_clipboard()
            elseif pan.load_string then
                res = pan.load_string("return $.GetContextPanel().GetClipboardText()")()
            end
            if res ~= nil and res ~= "" then
                text = res
            end
        end)
    end
    return text
end

local _log = client.log
client.log = function(...)
    local args = {...}
    local str = table.concat(args, " ")
    _log(str)
    HUD_LOG(str, 255, 180, 50, true)
end

local lock_p, lock_y = 0, 0
local ORIG_YAW, ORIG_PIT = 0.022, 0.022
local ORIG_MOUSE = 1
local CONSOLE_W, CONSOLE_H = 600, 400
local kill_log = {}
local G_ROUND_INFO = {
    active = false,
    winner = 0,
    mvp_ent = 0,
    mvp_name = "",
    mvp_avatar = nil,
    mvp_kd = "0/0",
    start_time = 0,
    duration = 17.0,
    mvp_id = 0
}
local G_STREAK_MAP = {}
local G_DOMINATION_MAP = {}
local G_DAMAGE_TRACKER = {}
local G_PLAYER_COUNT_CACHE = nil
local _G_LAST_CURTIME = nil
local G_LAST_MAP = globals.mapname() or ""
local G_LAST_CURTIME = globals.curtime() or 0

local function clear_session_state()
    kill_log = {}
    G_STREAK_MAP = {}
    G_DOMINATION_MAP = {}
    G_DAMAGE_TRACKER = {}
    G_PLAYER_COUNT_CACHE = nil
    G_TRACKED_SCORES = { t = 0, ct = 0 }
    if CON_MODULE and CON_MODULE.tabs then
        CON_MODULE.tabs = {
            ["log"] = {
                { text = "Welcome to Console!", r = 255, g = 255, b = 255, accent_word = "Console!" },
                { text = "Session Reset. Use ALT + 1/2/3/4 to switch tabs.", r = 200, g = 200, b = 200 }
            },
            ["chat"] = {},
            ["history"] = {},
            ["system"] = {}
        }
        CON_MODULE.scroll_indices = { ["log"] = 0, ["chat"] = 0, ["history"] = 0, ["system"] = 0 }

        if INTEL_MODULE then
            INTEL_MODULE.dmg = 0
            INTEL_MODULE.kills = 0
            INTEL_MODULE.deaths = 0
            INTEL_MODULE.hs = 0
            INTEL_MODULE.rounds = 1
            if update_intel_stats then update_intel_stats() end
        end
    end
    if CHAT_MODULE then
        CHAT_MODULE.last_msg_count = 0
        CHAT_MODULE.scroll_offset = 0
    end
    G_ROUND_INFO.active = false
    G_ROUND_INFO.mvp_name = ""
    G_ROUND_INFO.mvp_avatar = nil
    if G_PLANT_INFO  then G_PLANT_INFO.active  = false end
    if G_BOMB_INFO   then G_BOMB_INFO.active   = false end
    if G_DEFUSE_INFO then G_DEFUSE_INFO.active = false end
    HUD_LOG("System: Session data successfully purged.", 150, 150, 150, true, nil, nil, "system")
end
local G_BOMB_INFO = {
    active = false,
    blow_time = 0
}
local G_DEFUSE_INFO = {
    active = false,
    start_time = 0,
    duration = 10.0,
    defuser_name = "",
    defuser_ent = nil,
    has_kit = false
}
local G_PLANT_INFO = {
    active = false,
    start_time = 0,
    duration = 3.125
}
local G_TRACKED_SCORES = { t = 0, ct = 0 }
local SB_MODULE = {
    active = false,
    anim_alpha = 0,
    _cache = nil,
    _cache_tick = -999,
    _dbg_done = false,
    _row_anims = {},
}
local G_KILL_STREAKS = {}
local draw_scoreboard
local G_TEAM_MENU_ACTIVE = false
local m_key_prev = false
local G_INPUT_LANG = "EN"
local INPUT_KEY_MAP = {
    EN = {[0x30]={")","0"},[0x31]={"!","1"},[0x32]={"@","2"},[0x33]={"#","3"},[0x34]={"$","4"},[0x35]={"%","5"},[0x36]={"^","6"},[0x37]={"&","7"},[0x38]={"*","8"},[0x39]={"(","9"},[0x41]={"A","a"},[0x42]={"B","b"},[0x43]={"C","c"},[0x44]={"D","d"},[0x45]={"E","e"},[0x46]={"F","f"},[0x47]={"G","g"},[0x48]={"H","h"},[0x49]={"I","i"},[0x4A]={"J","j"},[0x4B]={"K","k"},[0x4C]={"L","l"},[0x4D]={"M","m"},[0x4E]={"N","n"},[0x4F]={"O","o"},[0x50]={"P","p"},[0x51]={"Q","q"},[0x52]={"R","r"},[0x53]={"S","s"},[0x54]={"T","t"},[0x55]={"U","u"},[0x56]={"V","v"},[0x57]={"W","w"},[0x58]={"X","x"},[0x59]={"Y","y"},[0x5A]={"Z","z"},[0xBA]={":",";"},[0xBB]={"+","="},[0xBC]={"<",","},[0xBD]={"_","-"},[0xBE]={">","."},[0xBF]={"?","/"},[0xC0]={"~","`"},[0xDB]={"{","["},[0xDC]={"|","\\"},[0xDD]={"}","]"},[0xDE]={"\"","'"},[0x20]={" "," "}},
    RU = {[0x41]={"Ф","ф"},[0x42]={"И","и"},[0x43]={"С","с"},[0x44]={"В","в"},[0x45]={"У","у"},[0x46]={"А","а"},[0x47]={"П","п"},[0x48]={"Р","р"},[0x49]={"Ш","ш"},[0x4A]={"О","о"},[0x4B]={"Л","л"},[0x4C]={"Д","д"},[0x4D]={"Ь","ь"},[0x4E]={"Т","т"},[0x4F]={"Щ","щ"},[0x50]={"З","з"},[0x51]={"Й","й"},[0x52]={"К","к"},[0x53]={"Ы","ы"},[0x54]={"Е","е"},[0x55]={"Г","г"},[0x56]={"М","м"},[0x57]={"Ц","ц"},[0x58]={"Ч","ч"},[0x59]={"Н","н"},[0x5A]={"Я","я"},[0xBA]={"Ж","ж"},[0xDE]={"Э","э"},[0xBC]={"Б","б"},[0xBE]={"Ю","ю"},[0xDB]={"Х","х"},[0xDD]={"Ъ","ъ"},[0xC0]={"Ё","ё"},[0xBF]={",","."},[0x20]={" "," "}}
}

local HUD_LAYOUT = {
    alerts = {
        timer = { y = 0, target_y = 0, h = 30, active = false },
        defuse = { y = 0, target_y = 0, h = 45, active = false }
    }
}
local ANIMATIONS = {}
local function lerp(a, b, t) return a + (b - a) * t end

local function ease_out_quad(t) return t * (2 - t) end
local function ease_in_quad(t) return t * t end

local function animate_value(id, current, target, speed, easing_fn)
    local ft = globals.frametime()
    local val = lerp(current, target, ft * (speed or 10))
    if math.abs(val - target) < 0.001 then return target end
    return val
end

local HUD_THEME = {
    r = 150, g = 210, b = 120, a = 160,
    base_r = 150, base_g = 210, base_b = 120,
    pulse = 1.0,
    current_health = 100
}

local function get_dynamic_accent()
    local lp = entity.get_local_player()
    if lp then
        local health = entity.get_prop(lp, "m_iHealth") or 100
        HUD_THEME.current_health = animate_value("hp_sync", HUD_THEME.current_health, health, 5)

        local ratio = math.max(0, math.min(1, HUD_THEME.current_health / 100))
        local dr, dg, db = 255, 50, 50

        local r = lerp(dr, HUD_THEME.base_r, ratio)
        local g = lerp(dg, HUD_THEME.base_g, ratio)
        local b = lerp(db, HUD_THEME.base_b, ratio)

        local p = 0.9 + 0.1 * math.sin(globals.realtime() * 3)
        return r, g, b, p
    end
    return HUD_THEME.base_r, HUD_THEME.base_g, HUD_THEME.base_b, 1.0
end
local THEMES = {
    ["Default"] = {
        bg = {15, 15, 15}, accent = {150, 210, 120},
        syntax = { cmd={150, 210, 120}, str={255, 255, 255}, num={180, 180, 255} }
    },
    ["Gamesensical"] = {
        bg = {15, 15, 15}, accent = {149, 184, 12},
        syntax = { cmd={149, 184, 12}, str={255, 255, 255}, num={200, 200, 200} }
    }
}

local function apply_theme(name)
    local theme = THEMES[name] or THEMES["Default"]
    HUD_THEME.base_r, HUD_THEME.base_g, HUD_THEME.base_b = theme.accent[1], theme.accent[2], theme.accent[3]
    HUD_THEME.r, HUD_THEME.g, HUD_THEME.b = HUD_THEME.base_r, HUD_THEME.base_g, HUD_THEME.base_b
end
CON_MODULE = {
    active = false,
    active_tab = "log",
    search_active = false,
    search_text   = "",
    tabs = {
        ["log"] = {
            { text = "Welcome to Console!", r = 255, g = 255, b = 255, accent_word = "Console!" },
            { text = "Use ALT + 1/2/3/4 to switch tabs.", r = 200, g = 200, b = 200 }
        },
        ["chat"] = {},
        ["history"] = {},
        ["system"] = {}
    },
    scroll_indices = { ["log"] = 0, ["chat"] = 0, ["history"] = 0, ["system"] = 0 },
    max_msgs = 50,
    input_text = "",
    caret_pos = 0,
    sel_start = 0,
    sel_end = 0,
    last_key_time = 0,
    last_action_time = 0,
    key_states = {},
    history = {},
    history_idx = 0,
    suggestions = {},
    sugg_idx = 1,
    anim_alpha = 0,
    persistent_ready = false,
    last_inserted_text = "",
    last_inserted_time = 0,
    aliases = {
        ["warmup"]   = "sv_cheats 1; sv_infinite_ammo 1; ammo_grenade_limit_total 5; mp_warmup_end; mp_freezetime 0; mp_roundtime 60; mp_roundtime_defuse 60; sv_showimpacts 1; mp_limitteams 0; mp_autoteambalance 0; mp_maxmoney 60000; mp_startmoney 60000; mp_buytime 9999; mp_buy_anywhere 1; mp_restartgame 1; bot_stop 1; mp_respawn_on_death_ct 1; mp_respawn_on_death_t 1; bot_kick; bot_add_t; bot_add_ct; bot_stop",
        ["fix"]      = "r_cleardecals; snd_restart",
        ["practice"] = "sv_showimpacts 2; sv_grenade_trajectory 1; sv_grenade_trajectory_time 10",
        ["shot"]     = "cl_drawhud 0; r_drawviewmodel 0",
        ["bot_ready"] = "bot_stop 1; bot_place; bot_freeze 1",
        ["low"]      = "host_timescale 0.5",
        ["fast"]     = "host_timescale 5.0",
        ["norm"]     = "host_timescale 1.0",
        ["bunny"]    = "sv_cheats 1; sv_autobunnyhopping 1; sv_enablebunnyhopping 1; sv_airaccelerate 100",
        ["speed"]    = "sv_noclipspeed 5",
        ["trace"]    = "cl_crosshair_recoil 1",
        ["untrace"]  = "cl_crosshair_recoil 0",
        ["wall"]     = "mat_wireframe 1",
        ["gg"]       = "say gg bots",
        ["afk"]      = "say I'm AFK for a minute, wait for me pls"
    }
}

CHAT_MODULE = {
    active = false,
    input_text = "",
    caret_pos = 0,
    sel_start = 0,
    sel_end = 0,
    mode = "All",
    anim_alpha = 0,
    last_msg_time = 0,
    history_limit = 10,
    scroll_offset = 0,
    last_msg_count = 0,
    key_states = {}
}

INTEL_MODULE = {
    dmg = 0,
    kills = 0,
    deaths = 0,
    hs = 0,
    rounds = 1,
    adr = 0,
    hs_pct = 0,
    kd = 0,
    active = true,
    anim_alpha = 0
}

HUD = HUD or {}
function HUD.is_input_active()
    if CON_MODULE  and CON_MODULE.active  then return true end
    if CHAT_MODULE and CHAT_MODULE.active then return true end
    if BM_MODULE   and BM_MODULE.is_open  then return true end
    if ui.is_menu_open and ui.is_menu_open() then return true end
    return false
end

function HUD.get_player_team_color(ent)
    if not ent then return 120, 180, 255 end
    local team
    local ok, t = pcall(entity.get_prop, ent, "m_iTeamNum")
    if ok and t then team = t end
    if not team then
        local pr = entity.get_player_resource()
        if pr then
            local idx = bit.band(ent, 0xFFFF)
            if idx > 0 and idx <= 64 then
                local ok2, t2 = pcall(entity.get_prop, pr, "m_iTeam", idx)
                if ok2 and t2 then team = t2 end
            end
        end
    end
    if     team == 2 then return 255, 200, 100
    elseif team == 3 then return 150, 200, 255
    else                  return 180, 180, 180 end
end

HUD._player_name_cache = nil
client.set_event_callback("setup_command", function()
    HUD._player_name_cache_tick = (HUD._player_name_cache_tick or 0) + 1
    if HUD._player_name_cache_tick < 64 then return end
    HUD._player_name_cache_tick = 0
    local entries = {}
    pcall(function()
        for _, pe in ipairs(entity.get_players and entity.get_players(true) or {}) do
            local nm = entity.get_player_name(pe)
            if nm and #nm > 1 then entries[#entries+1] = { ent = pe, name = nm } end
        end
        table.sort(entries, function(a, b) return #a.name > #b.name end)
    end)
    HUD._player_name_cache = entries
end)

-- gamesense charges per native callback, so we bridge one per event
-- and fan it out to all subscribers ourselves.
HUD.bus = HUD.bus or {
    _listeners = {},
    _bridged   = {},
}
local _BUS_NATIVE = {
    paint = true, paint_ui = true, setup_command = true, run_command = true,
    player_hurt = true, player_death = true, player_say = true,
    player_spawn = true, player_team = true, item_purchase = true,
    weapon_fire = true, bomb_planted = true, bomb_defused = true,
    bomb_pickup = true, bomb_dropped = true, round_start = true,
    round_end = true, round_prestart = true, round_freeze_end = true,
    round_mvp = true, cs_round_final_beep = true, hostage_killed = true,
    hostage_rescued = true, vote_cast = true, level_init = true,
    shutdown = true, render = true, net_update_end = true, ragdoll_dissolved = true,
}
function HUD.bus:_bridge(name)
    if self._bridged[name] then return end
    if not _BUS_NATIVE[name] then self._bridged[name] = true; return end
    local self_ref = self
    pcall(client.set_event_callback, name, function(...)
        local list = self_ref._listeners[name]
        if not list then return end
        for i = 1, #list do
            local ok, err = pcall(list[i], ...)
            if not ok and HUD_LOG then
                HUD_LOG("[bus] " .. name .. " listener error: " .. tostring(err), 255, 100, 100, true, nil, nil, "system")
            end
        end
    end)
    self._bridged[name] = true
end
function HUD.bus:on(name, fn)
    self._listeners[name] = self._listeners[name] or {}
    self._listeners[name][#self._listeners[name] + 1] = fn
    self:_bridge(name)
    return fn
end
function HUD.bus:off(name, fn)
    local list = self._listeners[name]; if not list then return end
    for i = #list, 1, -1 do if list[i] == fn then table.remove(list, i) end end
end
function HUD.bus:emit(name, ...)
    local list = self._listeners[name]; if not list then return end
    for i = 1, #list do
        local ok, err = pcall(list[i], ...)
        if not ok and HUD_LOG then
            HUD_LOG("[bus] emit " .. name .. " error: " .. tostring(err), 255, 100, 100, true, nil, nil, "system")
        end
    end
end

HUD.profile = HUD.profile or { _stats = {} }
local function _now_ms()
    return (globals.realtime() or 0) * 1000.0
end
function HUD.profile.scope(name)
    local t0 = _now_ms()
    return function()
        local s = HUD.profile._stats[name]
        if not s then s = { calls = 0, total = 0, max = 0 }; HUD.profile._stats[name] = s end
        local dt = _now_ms() - t0
        s.calls = s.calls + 1
        s.total = s.total + dt
        if dt > s.max then s.max = dt end
    end
end
function HUD.profile.wrap(name, fn)
    return function(...)
        local stop = HUD.profile.scope(name)
        local ok, a, b, c, d, e, f = pcall(fn, ...)
        stop()
        if not ok then error(a, 0) end
        return a, b, c, d, e, f
    end
end
function HUD.profile.reset()
    HUD.profile._stats = {}
end
function HUD.profile.report(n)
    n = n or 10
    local list = {}
    for k, s in pairs(HUD.profile._stats) do
        list[#list+1] = { name = k, total = s.total, calls = s.calls, max = s.max,
                          avg = s.total / math.max(1, s.calls) }
    end
    table.sort(list, function(a, b) return a.total > b.total end)
    if HUD_LOG then
        HUD_LOG(string.format("[profile] top %d (total ms / calls / avg ms / max ms)", n),
            150, 220, 255, true, nil, nil, "system")
        for i = 1, math.min(n, #list) do
            local r = list[i]
            HUD_LOG(string.format("  %-26s %8.2f / %5d / %6.3f / %6.2f",
                r.name:sub(1, 26), r.total, r.calls, r.avg, r.max),
                200, 200, 200, true, nil, nil, "system")
        end
    end
end

HUD._modules = HUD._modules or {}
function HUD.module(name, def)
    def = def or {}
    def._name = name
    HUD._modules[name] = def
    HUD[name] = def
    return def
end

HUD.state = HUD.state or {
    _dirty           = false,
    _last_save_time  = 0,
    _save_interval   = 30.0,
    _storage_key     = "v_hud_state",
    _version         = 1,
    _positions       = {},
}

function HUD.mark_dirty()
    if HUD.state then HUD.state._dirty = true end
end

local function _hud_sanitize(v, depth)
    depth = depth or 0
    if depth > 8 then return nil end
    local t = type(v)
    if t == "number" or t == "string" or t == "boolean" then return v end
    if t == "table" then
        local r, is_array = {}, (#v > 0)
        for k, vv in pairs(v) do
            local key = is_array and k or tostring(k)
            r[key] = _hud_sanitize(vv, depth + 1)
        end
        return r
    end
    return nil
end

function HUD.save_all()
    if not json or not json.encode then return false, "no json" end

    local blob = { version = HUD.state._version }

    blob.settings = {}
    if SETTINGS then
        -- hotkeys are skipped on purpose: ui.set on them silently rebinds to M1
        local _SKIP_KEYS = {
            con_key  = true,
            buy_key  = true,
            buy_auto = true,
            buy_eco  = true,
        }
        for key, handle in pairs(SETTINGS) do
            if not _SKIP_KEYS[key] then
                local ok, packed = pcall(function() return { ui.get(handle) } end)
                if ok then blob.settings[key] = packed end
            end
        end
    end

    if CON_MODULE then
        blob.aliases = _hud_sanitize(CON_MODULE.aliases or {})
        local clean_hist = {}
        for i = 1, #(CON_MODULE.history or {}) do
            local v = CON_MODULE.history[i]
            if type(v) == "string" then clean_hist[#clean_hist + 1] = v end
        end
        blob.history = clean_hist

        blob.view = {
            active_tab     = CON_MODULE.active_tab,
            scroll_indices = _hud_sanitize(CON_MODULE.scroll_indices or {}),
            input_lang     = G_INPUT_LANG,
        }
    end

    blob.positions = _hud_sanitize(HUD.state._positions or {})

    local ok, encoded = pcall(json.encode, _hud_sanitize(blob))
    if not ok or not encoded then
        if HUD_LOG then HUD_LOG("[state] save encode failed: " .. tostring(encoded), 255, 120, 120, true, nil, nil, "system") end
        return false, tostring(encoded)
    end

    local wok, werr = pcall(database.write, HUD.state._storage_key, encoded)
    if not wok then
        if HUD_LOG then HUD_LOG("[state] save failed: " .. tostring(werr), 255, 120, 120, true, nil, nil, "system") end
        return false, tostring(werr)
    end

    HUD.state._dirty = false
    HUD.state._last_save_time = globals.realtime() or 0
    return true, #encoded
end

function HUD.load_all()
    if not json or not json.decode then return false, "no json" end
    local raw = database.read(HUD.state._storage_key)
    if not raw or raw == "" then return false, "empty" end
    raw = tostring(raw):gsub("^%s*(.-)%s*$", "%1"):gsub("%z", "")

    local ok, blob = pcall(json.decode, raw)
    if not ok or type(blob) ~= "table" then
        if HUD_LOG then HUD_LOG("[state] load decode failed: " .. tostring(blob), 255, 120, 120, true, nil, nil, "system") end
        return false, tostring(blob)
    end

    if blob.settings and SETTINGS then
        local _SKIP_KEYS = {
            con_key  = true,
            buy_key  = true,
            buy_auto = true,
            buy_eco  = true,
        }
        for key, packed in pairs(blob.settings) do
            local handle = SETTINGS[key]
            if handle and type(packed) == "table" and not _SKIP_KEYS[key] then
                pcall(ui.set, handle, unpack(packed))
            end
        end
    end

    if CON_MODULE then
        if type(blob.aliases) == "table" then CON_MODULE.aliases = blob.aliases end
        if type(blob.history) == "table" then CON_MODULE.history = blob.history end

        if type(blob.view) == "table" then
            if type(blob.view.active_tab) == "string" and CON_MODULE.tabs[blob.view.active_tab] then
                CON_MODULE.active_tab = blob.view.active_tab
            end
            if type(blob.view.scroll_indices) == "table" then
                for k, v in pairs(blob.view.scroll_indices) do
                    if CON_MODULE.scroll_indices then CON_MODULE.scroll_indices[k] = tonumber(v) or 0 end
                end
            end
            if type(blob.view.input_lang) == "string" then G_INPUT_LANG = blob.view.input_lang end
        end
    end

    if type(blob.positions) == "table" then HUD.state._positions = blob.positions end

    pcall(function() if handle_menu_visibility then handle_menu_visibility() end end)
    pcall(function()
        if apply_theme and ui_con_theme and ui_con_theme ~= 0 then
            apply_theme(ui.get(ui_con_theme))
        end
    end)

    HUD.state._dirty = false
    return true
end

function HUD.state_clear()
    pcall(database.write, HUD.state._storage_key, "")
    HUD.state._dirty = false
    if HUD_LOG then HUD_LOG("[state] storage cleared.", 200, 200, 150, true, nil, nil, "system") end
end

HUD.bus:on("setup_command", function()
    local now = globals.realtime() or 0
    if (now - (HUD.state._last_save_time or 0)) < HUD.state._save_interval then return end
    HUD.save_all()
end)

HUD.bus:on("shutdown", function()
    pcall(HUD.save_all)
end)

HUD.editor = HUD.editor or {
    enabled   = false,
    _frame    = {},
    _drag     = nil,
    _mouse_prev = false,
}

function HUD.editor.pos(name, default_x, default_y)
    local pos = HUD.state and HUD.state._positions and HUD.state._positions[name]
    if pos and tonumber(pos.x) and tonumber(pos.y) and pos.user_set then
        local saved_scale = tonumber(pos.scale) or 1.0
        local cur_scale   = HUD_SCALE or 1.0
        if saved_scale > 0 and math.abs(saved_scale - cur_scale) > 1e-4 then
            local k = cur_scale / saved_scale
            pos.x = pos.x * k
            pos.y = pos.y * k
            pos.scale = cur_scale
            if HUD and HUD.mark_dirty then HUD.mark_dirty() end
        end
        return pos.x, pos.y
    end
    return default_x, default_y
end

function HUD.editor.bbox(name, x, y, w, h)
    if not HUD.editor.enabled then return end
    HUD.editor._frame[name] = { x = x, y = y, w = w, h = h }
end

function HUD.editor.paint_overlay()
    if not HUD.editor.enabled then
        HUD.editor._frame = {}
        HUD.editor._drag = nil
        return
    end

    local sw, sh = client.screen_size()
    local mx, my = ui.mouse_position()
    local lmb = client.key_state(0x01)
    local prev = HUD.editor._mouse_prev

    if HUD.editor._drag then
        surface.draw_filled_rect(0, 0, sw, sh, 0, 0, 0, 90)
    end

    if font_con then
        surface.draw_text(10, 10, 255, 220, 120, 180, font_con, "[HUD EDITOR] drag elements. untick to exit.")
    end

    for name, r in pairs(HUD.editor._frame) do
        local hover   = mx >= r.x and mx <= r.x + r.w and my >= r.y and my <= r.y + r.h
        local is_drag = HUD.editor._drag and HUD.editor._drag.name == name
        if hover or is_drag then
            local cr, cg, cb = 120, 255, 120
            surface.draw_outlined_rect(r.x - 1, r.y - 1, r.w + 2, r.h + 2, cr, cg, cb, 220)
            if font_con then
                surface.draw_text(r.x + 2, r.y - 14, cr, cg, cb, 255, font_con, name)
            end
        end
    end

    if HUD.editor._drag then
        local d = HUD.editor._drag
        local cur = HUD.state._positions[d.name] or { x = 0, y = 0 }
        cur.x = mx - d.dx
        cur.y = my - d.dy
        cur.user_set = true
        cur.scale = HUD_SCALE or 1.0
        local rect = HUD.editor._frame[d.name]
        if rect then
            cur.x = math.max(0, math.min(sw - rect.w, cur.x))
            cur.y = math.max(0, math.min(sh - rect.h, cur.y))
        end
        HUD.state._positions[d.name] = cur
        if not lmb then
            HUD.editor._drag = nil
            if HUD and HUD.mark_dirty then HUD.mark_dirty() end
        end
    elseif lmb and not prev then
        for name, r in pairs(HUD.editor._frame) do
            if mx >= r.x and mx <= r.x + r.w and my >= r.y and my <= r.y + r.h then
                local pos = HUD.state._positions[name] or { x = r.x, y = r.y }
                HUD.editor._drag = {
                    name = name,
                    dx   = mx - (pos.x or r.x),
                    dy   = my - (pos.y or r.y),
                }
                break
            end
        end
    end

    HUD.editor._mouse_prev = lmb
    HUD.editor._frame = {}
end

_G.HUD = HUD

HUD.editor = HUD.editor or {
    enabled   = false,
    _frame    = {},
    _drag     = nil,
    _mouse_prev = false,
}

function HUD.editor.pos(name, default_x, default_y)
    local pos = HUD.state and HUD.state._positions and HUD.state._positions[name]
    if pos and tonumber(pos.x) and tonumber(pos.y) and pos.user_set then
        local saved_scale = tonumber(pos.scale) or 1.0
        local cur_scale   = HUD_SCALE or 1.0
        if saved_scale > 0 and math.abs(saved_scale - cur_scale) > 1e-4 then
            local k = cur_scale / saved_scale
            pos.x = pos.x * k
            pos.y = pos.y * k
            pos.scale = cur_scale
            if HUD and HUD.mark_dirty then HUD.mark_dirty() end
        end
        return pos.x, pos.y
    end
    return default_x, default_y
end

function HUD.editor.bbox(name, x, y, w, h)
    if not HUD.editor.enabled then return end
    HUD.editor._frame[name] = { x = x, y = y, w = w, h = h }
end

function HUD.editor.paint_overlay()
    if not HUD.editor.enabled then
        HUD.editor._frame = {}
        HUD.editor._drag = nil
        return
    end

    local sw, sh = client.screen_size()
    local mx, my = ui.mouse_position()
    local lmb = client.key_state(0x01)
    local prev = HUD.editor._mouse_prev

    if HUD.editor._drag then
        surface.draw_filled_rect(0, 0, sw, sh, 0, 0, 0, 90)
    end

    if font_con then
        surface.draw_text(10, 10, 255, 220, 120, 180, font_con, "[HUD EDITOR] drag elements. untick to exit.")
    end

    for name, r in pairs(HUD.editor._frame) do
        local hover   = mx >= r.x and mx <= r.x + r.w and my >= r.y and my <= r.y + r.h
        local is_drag = HUD.editor._drag and HUD.editor._drag.name == name
        if hover or is_drag then
            local cr, cg, cb = 120, 255, 120
            surface.draw_outlined_rect(r.x - 1, r.y - 1, r.w + 2, r.h + 2, cr, cg, cb, 220)
            if font_con then
                surface.draw_text(r.x + 2, r.y - 14, cr, cg, cb, 255, font_con, name)
            end
        end
    end

    if HUD.editor._drag then
        local d = HUD.editor._drag
        local cur = HUD.state._positions[d.name] or { x = 0, y = 0 }
        cur.x = mx - d.dx
        cur.y = my - d.dy
        cur.user_set = true
        cur.scale = HUD_SCALE or 1.0
        local rect = HUD.editor._frame[d.name]
        if rect then
            cur.x = math.max(0, math.min(sw - rect.w, cur.x))
            cur.y = math.max(0, math.min(sh - rect.h, cur.y))
        end
        HUD.state._positions[d.name] = cur
        if not lmb then
            HUD.editor._drag = nil
            if HUD and HUD.mark_dirty then HUD.mark_dirty() end
        end
    elseif lmb and not prev then
        for name, r in pairs(HUD.editor._frame) do
            if mx >= r.x and mx <= r.x + r.w and my >= r.y and my <= r.y + r.h then
                local pos = HUD.state._positions[name] or { x = r.x, y = r.y }
                HUD.editor._drag = {
                    name = name,
                    dx   = mx - (pos.x or r.x),
                    dy   = my - (pos.y or r.y),
                }
                break
            end
        end
    end

    HUD.editor._mouse_prev = lmb
    HUD.editor._frame = {}
end

_G.HUD = HUD

local function update_intel_stats()
    INTEL_MODULE.adr = INTEL_MODULE.dmg / math.max(1, INTEL_MODULE.rounds)
    INTEL_MODULE.hs_pct = (INTEL_MODULE.hs / math.max(1, INTEL_MODULE.kills)) * 100
    INTEL_MODULE.kd = INTEL_MODULE.kills / math.max(1, INTEL_MODULE.deaths)
end

local key_pressed_prev = false

local function history_save()
    if not CON_MODULE or not CON_MODULE.history or not json then return end

    local clean_history = {}
    for i=1, #CON_MODULE.history do
        local val = CON_MODULE.history[i]
        if type(val) == "string" then
            table.insert(clean_history, val)
        end
    end

    local status, data = pcall(json.encode, clean_history)
    if status and data then
        pcall(function()
            database.write("v_hud_history", data)
        end)
    end
end

local function aliases_save()
    if not CON_MODULE or not CON_MODULE.aliases or not json then return end
    local status, data = pcall(json.encode, CON_MODULE.aliases)
    if status and data then
        pcall(function() database.write("v_hud_aliases", data) end)
    end
end

local function aliases_load()
    if not CON_MODULE or not json then return end
    local raw = database.read("v_hud_aliases")
    if raw then
        local status, decoded = pcall(json.decode, raw)
        if status and type(decoded) == "table" then
            CON_MODULE.aliases = decoded
        end
    end
end

local function history_load()
    if not CON_MODULE or not json then return end

    if CON_MODULE.loading_persistent then return end
    CON_MODULE.loading_persistent = true

    local raw = database.read("v_hud_history")
    if raw then
        local status, decoded = pcall(json.decode, raw)
        if status and type(decoded) == "table" then
            CON_MODULE.history = decoded
        end
    end
    aliases_load()
    CON_MODULE.persistent_ready = true
    CON_MODULE.loading_persistent = false
end


local CMDS = {
    "cl_crosshair", "cl_radar_always_centered", "cl_radar_scale", "cl_hud_color", "cl_hud_background_alpha",
    "sensitivity", "volume", "net_graph", "fps_max", "m_rawinput", "m_yaw", "m_pitch",
    "disconnect", "retry", "quit", "status", "say", "say_team", "voice_enable", "voice_scale",
    "sv_cheats", "bot_add", "bot_kick", "bot_stop", "cl_drawhud", "r_drawviewmodel",
    "clear", "echo", "exec", "bind", "unbind", "alias", "developer", "con_enable",
    "hud_help", "hud_color", "hud_alpha", "config", "prof", "hud", "theme",
    "mm_dedicated_search_maxping", "rate", "cl_cmdrate", "cl_updaterate", "cl_interp",
    "mp_restartgame", "mp_warmup_end", "mp_freezetime", "mp_roundtime", "mp_roundtime_defuse", "mp_buytime", "mp_startmoney",
    "mp_maxmoney", "mp_afterroundmoney", "mp_buy_anywhere", "mp_solid_teammates", "mp_limitteams", "mp_autoteambalance",
    "mp_forcecamera", "mp_friendlyfire", "mp_teammates_are_enemies", "mp_respawn_on_death_ct", "mp_respawn_on_death_t",
    "mp_round_restart_delay", "mp_ignore_round_win_conditions", "mp_match_end_restart", "mp_match_restart_delay",
    "sv_infinite_ammo", "sv_showimpacts", "sv_grenade_trajectory", "sv_gravity", "sv_maxspeed", "sv_accelerate", "sv_friction",
    "cl_crosshairalpha", "cl_crosshaircolor", "cl_crosshairdot", "cl_crosshairgap", "cl_crosshairsize", "cl_crosshairthickness",
    "cl_crosshair_drawoutline", "cl_crosshair_outlinethickness", "cl_crosshair_sniper_width", "cl_crosshairgap_useweaponvalue",
    "cl_bob_lower_amt", "cl_bobamt_lat", "cl_bobamt_vert", "viewmodel_fov", "viewmodel_offset_x", "viewmodel_offset_y", "viewmodel_offset_z",
    "mat_monitorgamma", "mat_queue_mode", "muzzleflash_light", "r_dynamic", "r_drawtracers_firstperson",
    "cl_autowepswitch", "cl_autohelp", "cl_showhelp", "cl_showfps", "cl_showpos", "cl_showloadout",
    "cl_teamid_overhead_always", "cl_teammate_colors_show", "cl_use_opens_buy_menu", "gameinstructor_enable",
    "hud_scaling", "hud_showtargetid", "safezonex", "safezoney", "spec_show_xray", "vprof_off",
    "voice_mixer_volume", "voice_loopback", "voice_modenable", "voice_threshold",
    "host_writeconfig", "key_listboundkeys", "log_address_add", "lookspring", "lookstrafe",
    "map_showspawnpoints", "mat_info", "mat_save_changes", "name", "net_allow_multicast",
    "net_graphheight", "net_graphpos", "net_graphproportionalfont", "net_graphshowinterp", "net_graphshowlatency",
    "net_graphshowsvproxytables", "net_graphsolid", "net_graphtext", "net_maxroutable", "net_scale",
    "option_duck_method", "option_speed_method", "password", "play_distance", "player_nevershow_communityservermessage",
    "r_eyegloss", "r_eyemove", "r_eyeshift_x", "r_eyeshift_y", "r_eyeshift_z", "r_eyesize",
    "scene_showfaceto", "scene_showlook", "scene_showmoveto", "scene_showunlock",
    "sk_autoaim_mode", "snd_deathcamera_volume", "snd_duckerreleasetime", "snd_duckerthreshold", "snd_ducking_off",
    "snd_ducktovolume", "snd_dzmusic_volume", "snd_hrtf_distance_behind", "snd_hrtf_voice_delay", "snd_hwconfig",
    "snd_mapobjective_volume", "snd_menumusic_volume", "snd_mix_async", "snd_mixahead", "snd_music_selection",
    "snd_musicvolume_multiplier_inOverlay", "snd_mute_losefocus", "snd_mvp_volume", "snd_pitchquality",
    "snd_roundend_volume", "snd_roundstart_volume", "snd_surround_speakers", "snd_tensecondwarning_volume",
    "spec_replay_autostart", "sv_forcepreload", "sv_logbans", "sv_logecho", "sv_logfile", "sv_logflush",
    "sv_logsdir", "sv_noclipaccelerate", "sv_noclipspeed", "sv_pvsskipanimation", "sv_skyname",
    "sv_specaccelerate", "sv_specnoclip", "sv_specspeed", "sv_unlag", "sv_voiceenable", "tv_nochat",
    "ui_steam_overlay_notification_position", "vgui_drawtree", "viewmodel_presetpos",
    "weapon_accuracy_logging", "xbox_autothrottle", "xbox_throttlebias", "xbox_throttlexpo"
}

local CVAR_RANGES = {
    ["sensitivity"] = { min = 0, max = 10 },
    ["volume"] = { min = 0, max = 1 },
    ["cl_crosshairgap"] = { min = -10, max = 10 },
    ["cl_crosshairsize"] = { min = 0, max = 15 },
    ["cl_crosshairthickness"] = { min = 1, max = 5 },
    ["cl_hud_color"] = { min = 0, max = 12 },
    ["cl_hud_background_alpha"] = { min = 0, max = 1 },
    ["voice_scale"] = { min = 0, max = 1 },
    ["fps_max"] = { min = 0, max = 999 },
    ["net_graph"] = { min = 0, max = 4 },
    ["cl_interp"] = { min = 0, max = 0.5 },
    ["cl_interp_ratio"] = { min = 1, max = 2 },
    ["rate"] = { min = 20000, max = 786432 },
    ["cl_updaterate"] = { min = 10, max = 128 },
    ["cl_cmdrate"] = { min = 10, max = 128 },
    ["m_yaw"] = { min = 0.001, max = 1.0 },
    ["m_pitch"] = { min = 0.001, max = 1.0 }
}

local function utf8_is_cont(b) return b and (b >= 0x80 and b < 0xC0) end
local function utf8_prev(str, pos)
    if pos <= 0 then return 0 end
    local p = pos; repeat p = p - 1 until p <= 0 or not utf8_is_cont(str:byte(p+1))
    return p
end
local function utf8_next(str, pos)
    if not str or pos >= #str then return #str end
    local b = str:byte(pos + 1)
    if not b then return #str end
    if b < 0x80 then return pos + 1 end
    if b < 0xE0 then return pos + 2 end
    if b < 0xF0 then return pos + 3 end
    return pos + 4
end


local function split_ascii_segments(s)
    local segs = {}
    if not s or s == "" then return segs end
    local i = 1
    while i <= #s do
        local b = s:byte(i)
        if b < 0x80 then
            local j = i
            while j <= #s and s:byte(j) < 0x80 do j = j + 1 end
            table.insert(segs, { text = s:sub(i, j-1), ascii = true })
            i = j
        else
            local j = i
            while j <= #s and s:byte(j) >= 0x80 do
                local cb = s:byte(j)
                if     cb >= 0xF0 then j = j + 4
                elseif cb >= 0xE0 then j = j + 3
                elseif cb >= 0xC0 then j = j + 2
                else                   j = j + 1 end
            end
            table.insert(segs, { text = s:sub(i, j-1), ascii = false })
            i = j
        end
    end
    return segs
end

local REND_FLAG_NORM = ""
local REND_FLAG_SM   = "s"

local FONT_REND_FLAG = {}

local function get_text_size_safe(font, text)
    if not text or text == "" then return 0, 0 end
    if type(font) ~= "number" then return renderer.measure_text("", text) end
    local segs = split_ascii_segments(text)
    if #segs == 1 and segs[1].ascii then
        return surface.get_text_size(font, text)
    end
    local rflag = FONT_REND_FLAG[font] or REND_FLAG_NORM
    local total_w, max_h = 0, 0
    for _, seg in ipairs(segs) do
        local sw, sh
        if seg.ascii then
            sw, sh = surface.get_text_size(font, seg.text)
        else
            sw, sh = renderer.measure_text(rflag, seg.text)
        end
        total_w = total_w + sw
        if sh > max_h then max_h = sh end
    end
    return total_w, max_h
end

local FONT_HEIGHT_CACHE = {}
local function get_font_height(font)
    if not FONT_HEIGHT_CACHE[font] then
        local _, h = surface.get_text_size(font, "Wg")
        FONT_HEIGHT_CACHE[font] = h or 12
    end
    return FONT_HEIGHT_CACHE[font]
end

local function draw_text_safe(x, y, r, g, b, a, font, text, flags)
    if not text or text == "" or a <= 0 then return end
    if type(font) ~= "number" then
        renderer.text(x, y, r, g, b, a, flags or "", 0, text)
        return
    end
    local segs = split_ascii_segments(text)
    if #segs == 1 and segs[1].ascii then
        surface.draw_text(x, y, r, g, b, a, font, text)
        return
    end
    local rflag = FONT_REND_FLAG[font] or REND_FLAG_NORM
    local surf_h = get_font_height(font)
    local _, rend_h = renderer.measure_text(rflag, "Wg")
    local rend_h = rend_h or surf_h
    local y_off = math.floor((surf_h - rend_h) / 2)
    local cx = x
    for _, seg in ipairs(segs) do
        if seg.ascii then
            surface.draw_text(cx, y, r, g, b, a, font, seg.text)
            local sw, _ = surface.get_text_size(font, seg.text)
            cx = cx + sw
        else
            renderer.text(cx, y + y_off, r, g, b, a, rflag, 0, seg.text)
            local sw, _ = renderer.measure_text(rflag, seg.text)
            cx = cx + sw + 1
        end
    end
end

local function draw_glow_text(x, y, r, g, b, a, font, text, strength)
    for i = 1, strength or 3 do
        local off = i * 1
        local alpha = math.floor(a / (i * 2))
        surface.draw_text(x-off, y, r, g, b, alpha, font, text)
        surface.draw_text(x+off, y, r, g, b, alpha, font, text)
        surface.draw_text(x, y-off, r, g, b, alpha, font, text)
        surface.draw_text(x, y+off, r, g, b, alpha, font, text)
    end
    surface.draw_text(x, y, r, g, b, a, font, text)
end

local function draw_glow_line(x1, y1, x2, y2, r, g, b, a, strength)
    for i = 1, strength or 2 do
        local alpha = math.floor(a / (i * 3))
        surface.draw_line(x1, y1-i, x2, y2-i, r, g, b, alpha)
        surface.draw_line(x1, y1+i, x2, y2+i, r, g, b, alpha)
    end
    surface.draw_line(x1, y1, x2, y2, r, g, b, a)
end

local function draw_gs_header(x, y, w)
    local r1, g1, b1 = 59, 175, 222
    local r2, g2, b2 = 202, 70, 205
    local r3, g3, b3 = 201, 227, 58
    local r4, g4, b4 = 255, 140, 50
    local r5, g5, b5 = 255, 50, 50

    local seg = w / 4
    surface.draw_filled_gradient_rect(x, y, seg, S(2), r1, g1, b1, 255, r2, g2, b2, 255, true)
    surface.draw_filled_gradient_rect(x + seg, y, seg, S(2), r2, g2, b2, 255, r3, g3, b3, 255, true)
    surface.draw_filled_gradient_rect(x + seg * 2, y, seg, S(2), r3, g3, b3, 255, r4, g4, b4, 255, true)
    surface.draw_filled_gradient_rect(x + seg * 3, y, seg, S(2), r4, g4, b4, 255, r5, g5, b5, 255, true)
end

local function delete_selection()
    if CON_MODULE.sel_start ~= CON_MODULE.sel_end then
        local s = math.min(CON_MODULE.sel_start, CON_MODULE.sel_end)
        local e = math.max(CON_MODULE.sel_start, CON_MODULE.sel_end)
        CON_MODULE.input_text = CON_MODULE.input_text:sub(1, s) .. CON_MODULE.input_text:sub(e + 1)
        CON_MODULE.caret_pos = s
        CON_MODULE.sel_start = 0
        CON_MODULE.sel_end = 0
        return true
    end
    return false
end

local function insert_text(t)
    if not t or t == "" then return end

    local cur_t = globals.realtime()
    if t == CON_MODULE.last_inserted_text and (cur_t - CON_MODULE.last_inserted_time) < 0.2 then
        return
    end

    CON_MODULE.last_inserted_text = t
    CON_MODULE.last_inserted_time = cur_t

    delete_selection()
    local s = CON_MODULE.input_text:sub(1, CON_MODULE.caret_pos)
    local e = CON_MODULE.input_text:sub(CON_MODULE.caret_pos + 1)
    CON_MODULE.input_text = s .. t .. e
    CON_MODULE.caret_pos = CON_MODULE.caret_pos + #t
end

local function delete_at_caret()
    if delete_selection() then return true end
    if CON_MODULE.caret_pos > 0 then
        local p = utf8_prev(CON_MODULE.input_text, CON_MODULE.caret_pos)
        CON_MODULE.input_text = CON_MODULE.input_text:sub(1, p) .. CON_MODULE.input_text:sub(CON_MODULE.caret_pos + 1)
        CON_MODULE.caret_pos = p
        return true
    end
    return false
end

local function update_suggestions()
    CON_MODULE.suggestions = {}
    local text = CON_MODULE.input_text:gsub("^%s+", ""):lower()
    if text == "" then return end

    local words = {}
    for w in text:gmatch("%S+") do table.insert(words, w) end
    local has_space = text:find(" ") ~= nil

    if not has_space and #words <= 1 then
        for _, cmd in ipairs(CMDS) do
            if cmd:lower():find(text, 1, true) == 1 then
                table.insert(CON_MODULE.suggestions, cmd)
                if #CON_MODULE.suggestions >= 15 then break end
            end
        end

        if #CON_MODULE.suggestions < 15 then
            for alias_name, _ in pairs(CON_MODULE.aliases) do
                if alias_name:lower():find(text, 1, true) == 1 then
                    local exists = false
                    for _, s in ipairs(CON_MODULE.suggestions) do if s == alias_name then exists = true; break end end
                    if not exists then
                        table.insert(CON_MODULE.suggestions, alias_name)
                        if #CON_MODULE.suggestions >= 15 then break end
                    end
                end
            end
        end
    else
        local cmd = words[1]
        local is_known = false
        for _, c in ipairs(CMDS) do if c:lower() == cmd then is_known = true; break end end
        if not is_known and CON_MODULE.aliases[cmd] then is_known = true end

        if is_known then
            local cur_val = client.get_cvar(cmd)
            if cur_val then
                local range = CVAR_RANGES[cmd]
                local hint = string.format("[INFO] %s: %s", cmd, tostring(cur_val))
                if range then
                    hint = hint .. string.format(" [Range: %s - %s]", tostring(range.min), tostring(range.max))
                end
                table.insert(CON_MODULE.suggestions, hint)
            end
        end
    end
end


local function config_save(name)
    local data = {}
    for key, handle in pairs(SETTINGS) do
        local val = { ui.get(handle) }
        data[key] = val
    end
    local function sanitize(v)
        if type(v) == "table" then
            local r = {}
            local is_array = (#v > 0)
            for k, val in pairs(v) do
                local key = is_array and k or tostring(k)
                r[key] = sanitize(val)
            end
            return r
        elseif type(v) == "number" or type(v) == "string" or type(v) == "boolean" then
            return v
        end
        return tostring(v)
    end

    local encoder = json.encode or json.serialize or json.stringify or (function() return nil, "No JSON encoder found" end)
    local success, encoded = pcall(encoder, sanitize(data))
    if not success or not encoded then
        HUD_LOG("Config: Failed to encode - " .. tostring(encoded or "Unknown error"), 255, 100, 100)
        return
    end

    database.write("CustomHUD_cfg_" .. name, encoded)

    local names_raw = database.read("CustomHUD_cfg_names") or ""
    local names = {}
    for n in names_raw:gmatch("%S+") do names[n] = true end
    if not names[name] then
        names_raw = names_raw .. (names_raw == "" and "" or " ") .. name
        database.write("CustomHUD_cfg_names", names_raw)
    end

    HUD_LOG("Config: Saved '" .. name .. "' to database.", 100, 255, 100)
end

local function config_load(name)
    local raw = database.read("CustomHUD_cfg_" .. name)

    if not raw or raw == "" then HUD_LOG("Config: '" .. name .. "' not found.", 255, 100, 100); return end

    raw = tostring(raw):gsub("^%s*(.-)%s*$", "%1"):gsub("%z", "")

    if not json or not json.decode then
        HUD_LOG("Config: Critical! JSON library not found.", 255, 50, 50)
        return
    end

    local success, result = pcall(json.decode, raw)
    if not success then
        HUD_LOG("Config: Decode failed. Reason: " .. tostring(result):sub(1, 50), 255, 100, 100)
        HUD_LOG("Data start: " .. tostring(raw):sub(1, 30), 230, 230, 230, true)
        return
    end
    local decoded = result

    for key, val in pairs(decoded) do
        if SETTINGS[key] then
            pcall(ui.set, SETTINGS[key], unpack(val))
        end
    end
    pcall(function()
        if handle_menu_visibility then handle_menu_visibility() end
        if apply_theme and ui_con_theme and ui_con_theme ~= 0 then
            pcall(apply_theme, ui.get(ui_con_theme))
        end
    end)

    HUD_LOG("Config: Loaded '" .. name .. "' successfully.", 100, 255, 100)
end

local function execute_command(cmd, depth)
    if not cmd or cmd == "" then return end
    depth = depth or 0
    if depth > 10 then
        HUD_LOG("Error: Alias recursion limit reached.", 255, 100, 100)
        return
    end

    if depth == 0 then
        local is_in_history = false
        if #CON_MODULE.history > 0 and CON_MODULE.history[1] == cmd then
            is_in_history = true
        end
        if not is_in_history then
            table.insert(CON_MODULE.history, 1, cmd)
            if #CON_MODULE.history > 50 then table.remove(CON_MODULE.history) end
            history_save()
            if HUD and HUD.mark_dirty then HUD.mark_dirty() end
        end
        CON_MODULE.history_idx = 0
    end

    for part in cmd:gmatch("[^;]+") do
        local part_clean = part:gsub("^%s*(.-)%s*$", "%1")
        if part_clean ~= "" then
            local success, err = xpcall(function()
                local words = {}
                for w in part_clean:gmatch("%S+") do table.insert(words, w) end
                if #words == 0 then return end

                local base_cmd = words[1]:lower()

                if CON_MODULE.aliases[base_cmd] and base_cmd ~= "alias" then
                    execute_command(CON_MODULE.aliases[base_cmd], depth + 1)
                    return
                end

                if base_cmd == "alias" then
                    if #words == 1 then
                        HUD_LOG("--- CURRENT ALIASES", 180, 180, 180, true)
                        local count = 0
                        for k, v in pairs(CON_MODULE.aliases) do
                            HUD_LOG(string.format("  %-12s : %s", k, v), 200, 200, 200, true)
                            count = count + 1
                        end
                        if count == 0 then HUD_LOG("  No aliases defined.", 140, 140, 140, true) end
                    elseif #words == 2 then
                        local name = words[2]:lower()
                        if CON_MODULE.aliases[name] then
                            HUD_LOG(string.format("alias %s : %s", name, CON_MODULE.aliases[name]), 150, 255, 100, true)
                        else
                            HUD_LOG(string.format("Alias '%s' not found.", name), 255, 180, 100, true)
                        end
                    else
                        local name = words[2]:lower()
                        local find_start = part_clean:find(words[2], 1, true) + #words[2]
                        local content = part_clean:sub(find_start):gsub("^%s+", "")
                        content = content:gsub('^"(.*)"$', "%1")

                        if content == "" or content == "nil" then
                            CON_MODULE.aliases[name] = nil
                            HUD_LOG(string.format("Alias '%s' removed.", name), 255, 150, 50, true)
                        else
                            CON_MODULE.aliases[name] = content
                            HUD_LOG(string.format("Alias '%s' set to: %s", name, content), 100, 255, 100, true)
                        end
                        aliases_save()
                        if HUD and HUD.mark_dirty then HUD.mark_dirty() end
                    end
                    return
                end

                local is_cheat_protected = (base_cmd:match("^bot_") or base_cmd == "noclip" or base_cmd == "god" or base_cmd == "sv_gravity" or base_cmd:match("^sv_")) and base_cmd ~= "sv_cheats"
                if is_cheat_protected and tonumber(client.get_cvar("sv_cheats")) == 0 then
                    HUD_LOG(part_clean, 255, 255, 255)
                    HUD_LOG("Can't use cvar " .. base_cmd .. " (cheats disabled).", 255, 100, 100)
                    return
                end

                if base_cmd:match("^sv_") or base_cmd:match("^cl_") or base_cmd == "sensitivity" or base_cmd == "volume" then
                    local base_val = tonumber(words[2])
                    if base_val then
                        HUD_LOG("[CVAR] " .. base_cmd .. " = " .. tostring(base_val), 100, 255, 100, true, base_val, base_cmd)
                        return
                    end
                end

                HUD_LOG(part_clean, 255, 255, 255, false, nil, nil, "LOG")

                if base_cmd == "hud_color" and #words >= 4 then
                    HUD_THEME.r, HUD_THEME.g, HUD_THEME.b = tonumber(words[2]) or 255, tonumber(words[3]) or 255, tonumber(words[4]) or 255
                    HUD_LOG("[HUD] Accent color updated.", 100, 255, 100, true); return
                elseif base_cmd == "hud_alpha" and #words >= 2 then
                    HUD_THEME.a = tonumber(words[2]) or 160
                    HUD_LOG("[HUD] Transparency updated.", 100, 255, 100, true); return
                elseif base_cmd == "config" then
                    local sub, name = words[2] and words[2]:lower(), words[3] or "default"
                    if sub == "save" then config_save(name)
                    elseif sub == "load" then config_load(name)
                    elseif sub == "list" then
                        HUD_LOG("--- CONFIG LIST")
                        local n_raw = database.read("CustomHUD_cfg_names") or ""
                        for n in n_raw:gmatch("%S+") do HUD_LOG(" - " .. n, 200, 200, 200, true) end
                    end; return
                elseif base_cmd == "clear" then
                    CON_MODULE.tabs[CON_MODULE.active_tab] = {}
                    CON_MODULE.scroll_indices[CON_MODULE.active_tab] = 0; return
                elseif base_cmd == "prof" then
                    local sub = words[2] and words[2]:lower() or nil
                    if sub == "reset" then
                        HUD.profile.reset()
                        HUD_LOG("[profile] stats cleared.", 150, 220, 255, true, nil, nil, "system")
                    else
                        local n = tonumber(sub) or 10
                        HUD.profile.report(n)
                    end
                    return
                elseif base_cmd == "hud" then
                    local sub = words[2] and words[2]:lower() or nil
                    if sub == "save" then
                        local ok, info = HUD.save_all()
                        if ok then HUD_LOG("[state] saved (" .. tostring(info) .. " bytes).", 150, 255, 150, true, nil, nil, "system")
                        else       HUD_LOG("[state] save failed: " .. tostring(info), 255, 120, 120, true, nil, nil, "system") end
                    elseif sub == "load" then
                        local ok, info = HUD.load_all()
                        if ok then HUD_LOG("[state] loaded.", 150, 255, 150, true, nil, nil, "system")
                        else       HUD_LOG("[state] load failed: " .. tostring(info), 255, 120, 120, true, nil, nil, "system") end
                    elseif sub == "reset" then
                        HUD.state_clear()
                    else
                        HUD_LOG("usage: hud save | hud load | hud reset", 200, 200, 150, true, nil, nil, "system")
                    end
                    return
                elseif base_cmd == "theme" then
                    local sub = words[2] and words[2]:lower() or nil
                    if sub == "list" then
                        HUD_LOG("--- THEMES", 180, 180, 180, true)
                        for name, _ in pairs(THEMES) do
                            HUD_LOG("  " .. name, 200, 220, 200, true)
                        end
                    elseif sub == "load" and words[3] then
                        local target = words[3]
                        local found = nil
                        for name, _ in pairs(THEMES) do
                            if name:lower() == target:lower() then found = name; break end
                        end
                        if found and ui_con_theme then
                            pcall(ui.set, ui_con_theme, found)
                            apply_theme(found)
                            HUD_LOG("[theme] loaded: " .. found, 150, 255, 150, true, nil, nil, "system")
                            if HUD and HUD.mark_dirty then HUD.mark_dirty() end
                        else
                            HUD_LOG("[theme] not found: " .. tostring(target), 255, 120, 120, true, nil, nil, "system")
                        end
                    elseif sub == "export" then
                        local target = words[3] or (ui_con_theme and ui.get(ui_con_theme)) or "Default"
                        local src = THEMES[target]
                        if src then
                            local ok, enc = pcall(json.encode, { name = target, theme = src })
                            if ok and enc then
                                set_clipboard(enc)
                                HUD_LOG("[theme] '" .. target .. "' exported to clipboard.", 150, 220, 255, true, nil, nil, "system")
                            else
                                HUD_LOG("[theme] export failed.", 255, 120, 120, true, nil, nil, "system")
                            end
                        else
                            HUD_LOG("[theme] unknown: " .. tostring(target), 255, 120, 120, true, nil, nil, "system")
                        end
                    elseif sub == "import" then
                        local raw = get_clipboard() or ""
                        raw = tostring(raw):gsub("^%s*(.-)%s*$", "%1")
                        if raw == "" then
                            HUD_LOG("[theme] clipboard is empty.", 255, 180, 100, true, nil, nil, "system")
                            return
                        end
                        local ok, dec = pcall(json.decode, raw)
                        if not ok or type(dec) ~= "table" or not dec.name or type(dec.theme) ~= "table" then
                            HUD_LOG("[theme] invalid import data.", 255, 120, 120, true, nil, nil, "system")
                            return
                        end
                        local nm = tostring(dec.name)
                        THEMES[nm] = dec.theme
                        HUD_LOG("[theme] imported: " .. nm .. " (use 'theme load " .. nm .. "')", 150, 255, 150, true, nil, nil, "system")
                    else
                        HUD_LOG("usage: theme list | theme load <name> | theme export [name] | theme import", 200, 200, 150, true, nil, nil, "system")
                    end
                    return
                elseif base_cmd == "help" then
                    HUD_LOG("--- HUD CONSOLE HELP ---", 150, 210, 120, true)
                    HUD_LOG("CORE COMMANDS:", 255, 255, 255, true)
                    HUD_LOG("  hud_color R G B - Set accent color", 200, 200, 200, true)
                    HUD_LOG("  hud_alpha A - Set transparency (0-255)", 200, 200, 200, true)
                    HUD_LOG("  clear - Wipe current tab", 200, 200, 200, true)

                    HUD_LOG("CONFIG SYSTEM:", 255, 255, 255, true)
                    HUD_LOG("  config save/load <name> - Manage presets", 200, 200, 200, true)
                    HUD_LOG("  config list - Show all saved configs", 200, 200, 200, true)

                    HUD_LOG("MACROS & ALIASES:", 255, 255, 255, true)
                    HUD_LOG("  alias <n> \"<cmd>\" - Create custom macro", 200, 200, 200, true)
                    HUD_LOG("  alias - List all current macros", 200, 200, 200, true)
                    HUD_LOG("  warmup, fix, practice, shot, low/fast/norm, bunny...", 100, 255, 150, true)

                    HUD_LOG("HOTKEYS:", 255, 255, 255, true)
                    HUD_LOG("  ALT + 1/2/3/4 - Switch Tabs (Log, Chat, Hist, Sys)", 200, 200, 200, true)
                    HUD_LOG("  CTRL + A/C/V  - Select All, Copy, Paste", 200, 200, 200, true)
                    HUD_LOG("  SHIFT + ARROW - Scroll tab logs/Select text", 200, 200, 200, true)
                    HUD_LOG("PROFILER:", 255, 255, 255, true)
                    HUD_LOG("  prof [N]      - Show top N (default 10)", 200, 200, 200, true)
                    HUD_LOG("  prof reset    - Reset profiler stats", 200, 200, 200, true)
                    HUD_LOG("STATE:", 255, 255, 255, true)
                    HUD_LOG("  hud save      - Save everything to storage", 200, 200, 200, true)
                    HUD_LOG("  hud load      - Load everything from storage", 200, 200, 200, true)
                    HUD_LOG("  hud reset     - Clear saved state blob", 200, 200, 200, true)
                    HUD_LOG("THEMES:", 255, 255, 255, true)
                    HUD_LOG("  theme list          - Show all themes", 200, 200, 200, true)
                    HUD_LOG("  theme load <name>   - Switch to theme", 200, 200, 200, true)
                    HUD_LOG("  theme export [name] - Copy theme to clipboard", 200, 200, 200, true)
                    HUD_LOG("  theme import        - Import from clipboard", 200, 200, 200, true)
                    HUD_LOG("--------------------------", 150, 210, 120, true)
                    return
                end

                if not part_clean:find(" ") then
                    local val = tonumber(client.get_cvar(base_cmd))
                    if val then HUD_LOG("[CVAR] " .. base_cmd .. " = " .. val, 100, 255, 150, true, val, base_cmd); return end
                end

                client.exec(part_clean)
            end, function(e) return tostring(e) end)

            if not success then
                HUD_LOG("[LUA ERROR] " .. tostring(err):sub(1, 100), 255, 100, 100, true, nil, nil, "system")
            end
        end
    end
end

local function poll_keyboard()
    if not CON_MODULE.active then return end
    local cur_t = globals.realtime()
    local shift = client.key_state(0x10)
    local ctrl  = client.key_state(0x11)
    local alt   = client.key_state(0x12)

    if ctrl then
        if client.key_state(0x41) then
            if not CON_MODULE.key_states[0x41] then
                CON_MODULE.sel_start = 0
                CON_MODULE.sel_end = #CON_MODULE.input_text
                CON_MODULE.caret_pos = #CON_MODULE.input_text
                CON_MODULE.key_states[0x41] = true
            end
        else CON_MODULE.key_states[0x41] = false end

        if client.key_state(0x43) then
            if not CON_MODULE.key_states[0x43] then
                if CON_MODULE.sel_start ~= CON_MODULE.sel_end then
                    local s = math.min(CON_MODULE.sel_start, CON_MODULE.sel_end)
                    local e = math.max(CON_MODULE.sel_start, CON_MODULE.sel_end)
                    set_clipboard(CON_MODULE.input_text:sub(s + 1, e))
                end
                CON_MODULE.key_states[0x43] = true
            end
        else CON_MODULE.key_states[0x43] = false end

        if client.key_state(0x56) then
            if not CON_MODULE.key_states[0x56] then
                local text = get_clipboard()
                if text ~= "" then
                    insert_text(text)
                    update_suggestions()
                end
                CON_MODULE.key_states[0x56] = true
            end
        else CON_MODULE.key_states[0x56] = false end

        if client.key_state(0x46) then
            if not CON_MODULE.key_states[0x46] then
                CON_MODULE.search_active = not CON_MODULE.search_active
                if not CON_MODULE.search_active then CON_MODULE.search_text = "" end
                CON_MODULE._search_toggle_time = cur_t + 0.3
                CON_MODULE.key_states[0x46] = true
            end
        else CON_MODULE.key_states[0x46] = false end

        return
    end

    if shift and alt then
        if (CON_MODULE.key_states[0xDEAD] or 0) < cur_t then
            G_INPUT_LANG = (G_INPUT_LANG == "EN") and "RU" or "EN"
            CON_MODULE.key_states[0xDEAD] = cur_t + 0.5
        end
    else
        CON_MODULE.key_states[0xDEAD] = 0
    end

    if alt then
        if client.key_state(0x31) and (CON_MODULE.key_states[0x31] or 0) < cur_t then
            CON_MODULE.active_tab = "log"
            CON_MODULE.key_states[0x31] = cur_t + 0.3
        elseif client.key_state(0x32) and (CON_MODULE.key_states[0x32] or 0) < cur_t then
            CON_MODULE.active_tab = "chat"
            CON_MODULE.key_states[0x32] = cur_t + 0.3
        elseif client.key_state(0x33) and (CON_MODULE.key_states[0x33] or 0) < cur_t then
            CON_MODULE.active_tab = "history"
            CON_MODULE.key_states[0x33] = cur_t + 0.3
        elseif client.key_state(0x34) and (CON_MODULE.key_states[0x34] or 0) < cur_t then
            CON_MODULE.active_tab = "system"
            CON_MODULE.key_states[0x34] = cur_t + 0.3
        end
    end

    local function handle_p(vk, c_low, c_high, debounce)
        if alt or ctrl then
            if not shift then return end
        end

        if vk == 0x46 and CON_MODULE._search_toggle_time and cur_t < CON_MODULE._search_toggle_time then
            return
        end

        if client.key_state(vk) then
            if (CON_MODULE.key_states[vk] or 0) < cur_t then
                local char
                local map = INPUT_KEY_MAP[G_INPUT_LANG]
                if map and map[vk] then
                    char = shift and map[vk][1] or map[vk][2]
                else
                    char = shift and c_high or c_low
                end

                if char then
                    if CON_MODULE.search_active then
                        CON_MODULE.search_text = CON_MODULE.search_text .. char
                    else
                        insert_text(char); update_suggestions()
                    end
                end
                CON_MODULE.key_states[vk] = cur_t + (debounce or 0.15)
            end
        else
            CON_MODULE.key_states[vk] = 0
        end
    end

    for i = 0x41, 0x5A do handle_p(i, string.char(i+32), string.char(i)) end
    for i = 0x30, 0x39 do handle_p(i, string.char(i), string.char(i)) end

    handle_p(0x20, " ", " ")
    handle_p(0xBD, "-", "_")
    handle_p(0xBE, ".", ">")
    handle_p(0xBC, ",", "<")
    handle_p(0xBB, "=", "+")
    handle_p(0xDC, "\\", "|")
    handle_p(0xBF, "/", "?")
    handle_p(0xBA, ";", ":")
    handle_p(0xDE, "'", "\"")
    handle_p(0xDB, "[", "{")
    handle_p(0xDD, "]", "}")

    local function handle_nav(vk, fn, first_delay, repeat_rate)
        local is_down = client.key_state(vk)
        if is_down then
            if (CON_MODULE.key_states[vk] or 0) < cur_t then
                fn()
                local is_first = (CON_MODULE.key_states[vk] == 0)
                local delay = is_first and (first_delay or 0.35) or (repeat_rate or 0.06)
                CON_MODULE.key_states[vk] = cur_t + delay
            end
        else CON_MODULE.key_states[vk] = 0 end
    end

    handle_nav(0x0D, function()
        if CON_MODULE.search_active then
            CON_MODULE.search_active = false
            CON_MODULE.search_text = ""
            return
        end
        if CON_MODULE.input_text ~= "" then
            execute_command(CON_MODULE.input_text)

            CON_MODULE.input_text = ""
            CON_MODULE.caret_pos = 0
            CON_MODULE.sugg_idx = 1
            update_suggestions()
        end
    end, 0.4, 0.4)

    handle_nav(0x08, function()
        if CON_MODULE.search_active then
            if #CON_MODULE.search_text > 0 then
                local p = utf8_prev(CON_MODULE.search_text, #CON_MODULE.search_text)
                CON_MODULE.search_text = CON_MODULE.search_text:sub(1, p)
            end
        else
            if delete_at_caret() then update_suggestions() end
        end
    end, 0.35, 0.08)

    handle_nav(0x25, function()
        if shift then
            if CON_MODULE.sel_start == CON_MODULE.sel_end then CON_MODULE.sel_start = CON_MODULE.caret_pos end
            CON_MODULE.caret_pos = utf8_prev(CON_MODULE.input_text, CON_MODULE.caret_pos)
            CON_MODULE.sel_end = CON_MODULE.caret_pos
        else
            CON_MODULE.sel_start = 0; CON_MODULE.sel_end = 0
            CON_MODULE.caret_pos = utf8_prev(CON_MODULE.input_text, CON_MODULE.caret_pos)
        end
    end, 0.35, 0.1)

    handle_nav(0x27, function()
        if shift then
            if CON_MODULE.sel_start == CON_MODULE.sel_end then CON_MODULE.sel_start = CON_MODULE.caret_pos end
            CON_MODULE.caret_pos = utf8_next(CON_MODULE.input_text, CON_MODULE.caret_pos)
            CON_MODULE.sel_end = CON_MODULE.caret_pos
        else
            CON_MODULE.sel_start = 0; CON_MODULE.sel_end = 0
            CON_MODULE.caret_pos = utf8_next(CON_MODULE.input_text, CON_MODULE.caret_pos)
        end
    end, 0.35, 0.1)

    handle_nav(0x09, function()
        if #CON_MODULE.suggestions > 0 then
            local sugg = CON_MODULE.suggestions[CON_MODULE.sugg_idx]
            if not sugg:find("^%[INFO%]") then
                CON_MODULE.input_text = sugg .. " "
                CON_MODULE.caret_pos = #CON_MODULE.input_text
                update_suggestions()
            end
        end
    end, 0.3)

    local max_lines = CON_MODULE.max_lines or math.floor((CONSOLE_H - 95) / 16)

    handle_nav(0x21, function()
        local t = CON_MODULE.active_tab
        CON_MODULE.scroll_indices[t] = math.min(math.max(0, #CON_MODULE.tabs[t] - max_lines), CON_MODULE.scroll_indices[t] + 5)
    end, 0.15)

    handle_nav(0x22, function()
        local t = CON_MODULE.active_tab
        CON_MODULE.scroll_indices[t] = math.max(0, CON_MODULE.scroll_indices[t] - 5)
    end, 0.15)

    handle_nav(0x26, function()
        local t = CON_MODULE.active_tab
        if shift then
            CON_MODULE.scroll_indices[t] = math.min(math.max(0, #CON_MODULE.tabs[t] - max_lines), CON_MODULE.scroll_indices[t] + 1)
        elseif #CON_MODULE.suggestions > 0 then
            CON_MODULE.sugg_idx = CON_MODULE.sugg_idx - 1
            if CON_MODULE.sugg_idx < 1 then CON_MODULE.sugg_idx = #CON_MODULE.suggestions end
        elseif #CON_MODULE.history > 0 then
            CON_MODULE.history_idx = math.min(#CON_MODULE.history, CON_MODULE.history_idx + 1)
            CON_MODULE.input_text = CON_MODULE.history[CON_MODULE.history_idx] or ""
            CON_MODULE.caret_pos = #CON_MODULE.input_text; CON_MODULE.sugg_idx = 1; update_suggestions()
        else
            CON_MODULE.scroll_indices[t] = math.min(math.max(0, #CON_MODULE.tabs[t] - max_lines), CON_MODULE.scroll_indices[t] + 1)
        end
    end, 0.1)

    handle_nav(0x28, function()
        local t = CON_MODULE.active_tab
        if shift then
            CON_MODULE.scroll_indices[t] = math.max(0, CON_MODULE.scroll_indices[t] - 1)
        elseif #CON_MODULE.suggestions > 0 then
            CON_MODULE.sugg_idx = CON_MODULE.sugg_idx + 1
            if CON_MODULE.sugg_idx > #CON_MODULE.suggestions then CON_MODULE.sugg_idx = 1 end
        elseif CON_MODULE.history_idx > 0 then
            CON_MODULE.history_idx = math.max(0, CON_MODULE.history_idx - 1)
            CON_MODULE.input_text = CON_MODULE.history[CON_MODULE.history_idx] or ""
            CON_MODULE.caret_pos = #CON_MODULE.input_text; CON_MODULE.sugg_idx = 1; update_suggestions()
        else
            CON_MODULE.scroll_indices[t] = math.max(0, CON_MODULE.scroll_indices[t] - 1)
        end
    end, 0.1)

    if client.key_state(0x1B) then
        if CON_MODULE.search_active then
            CON_MODULE.search_active = false
            CON_MODULE.search_text = ""
        else
            CON_MODULE.active = false
        end
    end
end


client.set_event_callback("player_say", function(e)
    local ent = client.userid_to_entindex(e.userid)
    local name = entity.get_player_name(ent) or "User"
    HUD_LOG("[" .. name .. "] " .. e.text, 255, 255, 255, true, nil, nil, "CHAT", ent)
end)

local HUD_SCALE = 1.0
local function S(val) return val * HUD_SCALE end
local function S_F(val, min_val)
    return math.max(min_val or 9, math.floor(val * HUD_SCALE))
end

local ui_hud_scale
local font_main, font_timer, font_hp_ap, font_con, font_numbers, font_weapon, font_defuse, font_alert, font_icons, BM_FONT_MAIN, BM_FONT_HEADER, BM_FONT_ICONS

local function update_hud_fonts()
    HUD_SCALE = (ui_hud_scale and ui.get(ui_hud_scale) or 100) / 100
    FONT_HEIGHT_CACHE = {}

    font_main    = surface.create_font("Segoe UI", S_F(13, 9), 400, {0x10})
    font_timer   = surface.create_font("Verdana",  S_F(13, 9), 400, {0x10})
    font_hp_ap   = surface.create_font("Tahoma",   S_F(11, 8), 400, {0x10})
    font_con     = surface.create_font("Verdana",  S_F(11, 9), 400, {0x10, 0x20})
    font_numbers = surface.create_font("Segoe UI", S_F(32,18), 500, {0x10})
    font_weapon  = surface.create_font("Segoe UI", S_F(11, 8), 400, {0x10})
    font_defuse  = surface.create_font("Segoe UI", S_F(13, 9), 400, {0x10})
    font_alert   = surface.create_font("Verdana",  S_F(13, 9), 700, {0x10})
    font_tid_name = surface.create_font("Segoe UI", S_F(15, 11), 600, {0x10})
    font_tid_info = surface.create_font("Segoe UI", S_F(12, 9), 400, {0x10})
    font_sb_header = surface.create_font("Segoe UI", S_F(11, 9), 700, {0x10})
    font_sb_name   = surface.create_font("Segoe UI", S_F(12, 10), 400, {0x10})
    font_sb_stat   = surface.create_font("Segoe UI", S_F(11, 9), 400, {0x10})
    font_sb_title  = surface.create_font("Segoe UI", S_F(14, 11), 700, {0x10})

    FONT_REND_FLAG = {
        [font_main]    = REND_FLAG_NORM,
        [font_timer]   = REND_FLAG_NORM,
        [font_hp_ap]   = REND_FLAG_SM,
        [font_con]     = REND_FLAG_SM,
        [font_numbers] = REND_FLAG_NORM,
        [font_weapon]  = REND_FLAG_SM,
        [font_defuse]  = REND_FLAG_NORM,
        [font_alert]   = REND_FLAG_NORM,
    }

    local ok
    ok, font_icons = pcall(surface.create_font, "astrium-wep", S_F(14, 10), 400, { 0x10 })
    if not ok or not font_icons then
        ok, font_icons = pcall(surface.create_font, "astriumwep", S_F(14, 10), 400, { 0x10 })
    end
    if not ok or not font_icons then
        font_icons = font_weapon
    end

    BM_FONT_MAIN   = surface.create_font("Verdana", S_F(13, 11), 600, {0x10})
    BM_FONT_HEADER = surface.create_font("Verdana", S_F(16, 14), 700, {0x10})
    BM_FONT_ICONS  = surface.create_font("astriumwep", S(35), 400, {0x10})
end

local lock_p, lock_y = 0, 0
local ORIG_YAW, ORIG_PIT, ORIG_SENS = 0.022, 0.022, 1.0
local WEAPON_ICONS = {
    ["deagle"] = "A", ["elite"] = "B", ["fiveseven"] = "C", ["glock"] = "D", ["ak47"] = "E", ["aug"] = "F", ["famas"] = "G", ["g3sg1"] = "H", ["galilar"] = "I", ["m249"] = "J", ["m4a1"] = "K", ["mac10"] = "L", ["p90"] = "M", ["mp5sd"] = "N", ["ump45"] = "O", ["xm1014"] = "P", ["bizon"] = "Q", ["mag7"] = "R", ["negev"] = "S", ["sawedoff"] = "T", ["tec9"] = "U", ["taser"] = "V", ["hkp2000"] = "W", ["mp7"] = "X", ["mp9"] = "Y", ["p250"] = "Z", ["scar20"] = "a", ["sg556"] = "b", ["ssg08"] = "c", ["awp"] = "d", ["m4a1_s"] = "e", ["usp_s"] = "f", ["cz75a"] = "g", ["revolver"] = "h", ["knife"] = "i", ["knife_t"] = "j", ["m9_bayonet"] = "k", ["bayonet"] = "l", ["flip"] = "m", ["gut"] = "n", ["karambit"] = "o", ["stiletto"] = "p", ["widowmaker"] = "q", ["ursus"] = "r", ["skeleton"] = "s", ["tactical"] = "t", ["falchion"] = "u", ["survival"] = "v", ["paracord"] = "w", ["canis"] = "x", ["cord"] = "y", ["css"] = "z", ["hegrenade"] = "I", ["flashbang"] = "G", ["smokegrenade"] = "H", ["molotov"] = "L", ["incgrenade"] = "n", ["decoy"] = "J", ["c4"] = "K"
}

HUD.icons = HUD.icons or { _cache = {}, _defs = {} }

local function _svg(inner)
    return '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">' .. inner .. '</svg>'
end

HUD.icons._defs = {
    hp     = _svg('<path d="M12 21s-7-4.35-9.5-9.06C.7 8.6 2.7 4.5 6.5 4.5c2 0 3.5 1.1 4.5 2.7C12 5.6 13.5 4.5 15.5 4.5c3.8 0 5.8 4.1 4 7.44C19 16.65 12 21 12 21z" fill="none" stroke="white" stroke-width="2" stroke-linejoin="round"/>'),
    ap     = _svg('<path d="M12 2 L20 5 V11 C20 16 16 20.5 12 22 C8 20.5 4 16 4 11 V5 Z" fill="none" stroke="white" stroke-width="2" stroke-linejoin="round"/>'),
    money  = _svg('<rect x="3" y="6" width="18" height="12" rx="1" fill="none" stroke="white" stroke-width="2"/><circle cx="12" cy="12" r="3" fill="none" stroke="white" stroke-width="2"/><circle cx="6" cy="12" r="1" fill="white"/><circle cx="18" cy="12" r="1" fill="white"/>'),

    dmg    = _svg('<path d="M3 3 L7 3 L13 11 L17 7 L21 7 L21 11 L17 11 L13 16 L21 21 L17 21 L11 16 L7 21 L3 21 L3 17 L7 17 L11 13 L3 5 Z" fill="white"/>'),
    adr    = _svg('<path d="M3 21 L3 3 L5 3 L5 19 L21 19 L21 21 Z" fill="white"/><path d="M7 16 L10 11 L13 14 L17 7 L20 11 L20 17 L7 17 Z" fill="white"/>'),
    hs     = _svg('<circle cx="12" cy="12" r="10" fill="white"/><circle cx="12" cy="12" r="6" fill="black"/><circle cx="12" cy="12" r="2" fill="white"/><rect x="11" y="1" width="2" height="4" fill="white"/><rect x="11" y="19" width="2" height="4" fill="white"/><rect x="1" y="11" width="4" height="2" fill="white"/><rect x="19" y="11" width="4" height="2" fill="white"/>'),

    log     = _svg('<path d="M4 4 H20 V8 H4 Z M4 10 H20 V14 H4 Z M4 16 H20 V20 H4 Z" fill="white"/>'),
    chat    = _svg('<path d="M3 4 H21 V16 H13 L8 21 V16 H3 Z" fill="white"/>'),
    history = _svg('<circle cx="12" cy="12" r="10" fill="none" stroke="white" stroke-width="2"/><rect x="11.2" y="6" width="1.6" height="7" fill="white"/><rect x="11.2" y="11.2" width="5" height="1.6" fill="white"/>'),
    system  = _svg('<path d="M12 2 L14 5 L17 4 L17 8 L20 9 L18 12 L20 15 L17 16 L17 20 L14 19 L12 22 L10 19 L7 20 L7 16 L4 15 L6 12 L4 9 L7 8 L7 4 L10 5 Z" fill="white"/><circle cx="12" cy="12" r="3" fill="black"/>'),

    pistols   = _svg('<path d="M4 13 H15 L15 10 H18 L20 10 L20 14 L18 14 L18 16 L15 18 H12 L10 16 H7 L4 19 V13 Z" fill="none" stroke="white" stroke-width="1.5" stroke-linejoin="round"/><rect x="15" y="7" width="2" height="3" rx="0.5" fill="white"/>'),
    heavy     = _svg('<rect x="2" y="11" width="18" height="4" rx="1" fill="none" stroke="white" stroke-width="1.5"/><rect x="7" y="7" width="8" height="4" rx="1" fill="none" stroke="white" stroke-width="1.5"/><path d="M8 15 L7 20 M14 15 L15 20" stroke="white" stroke-width="1.5" stroke-linecap="round"/><circle cx="21" cy="13" r="2" fill="none" stroke="white" stroke-width="1.5"/>'),
    smgs      = _svg('<rect x="2" y="10" width="16" height="4" rx="1" fill="none" stroke="white" stroke-width="1.5"/><rect x="18" y="9" width="4" height="3" rx="0.5" fill="none" stroke="white" stroke-width="1.5"/><path d="M10 14 V18 H14 V14" fill="none" stroke="white" stroke-width="1.5" stroke-linejoin="round"/><rect x="5" y="7" width="6" height="3" rx="0.5" fill="none" stroke="white" stroke-width="1.5"/>'),
    rifles    = _svg('<path d="M1 12 H6 L7 10 H9 L10 12 H22" stroke="white" stroke-width="1.5" fill="none" stroke-linecap="round"/><path d="M10 12 V16 H14 V14" stroke="white" stroke-width="1.5" fill="none" stroke-linejoin="round"/><rect x="18" y="9" width="4" height="3" rx="0.5" fill="none" stroke="white" stroke-width="1.5"/><circle cx="22" cy="8" r="1.5" fill="none" stroke="white" stroke-width="1"/>'),
    equip     = _svg('<path d="M12 3 L20 7 V12 C20 17 16 20 12 21 C8 20 4 17 4 12 V7 Z" fill="none" stroke="white" stroke-width="1.5" stroke-linejoin="round"/><path d="M8 12 L11 15 L16 9" stroke="white" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round"/>'),
    grenades  = _svg('<circle cx="12" cy="14" r="7" fill="none" stroke="white" stroke-width="1.5"/><rect x="10" y="3" width="4" height="4" rx="1" fill="none" stroke="white" stroke-width="1.5"/><line x1="9" y1="7" x2="15" y2="7" stroke="white" stroke-width="1.5" stroke-linecap="round"/><path d="M9 12 L11 14 L15 10" stroke="white" stroke-width="1.5" fill="none" stroke-linecap="round" stroke-linejoin="round"/>'),

    assist     = _svg('<path d="M12 21 L4 13 C1 10 3 5 7 5 C9 5 10.5 6 12 8 C13.5 6 15 5 17 5 C21 5 23 10 20 13 Z" fill="none" stroke="white" stroke-width="2"/>'),
    domination = _svg('<path d="M5 7 L19 7 L17 17 L7 17 Z" fill="white"/><path d="M3 5 L21 5 L20 8 L4 8 Z" fill="white"/><rect x="9" y="17" width="6" height="2" fill="white"/><rect x="7" y="19" width="10" height="2" fill="white"/>'),
    revenge    = _svg('<path d="M12 3 V8" stroke="white" stroke-width="2" fill="none"/><path d="M5 11 A7 7 0 1 0 19 11" stroke="white" stroke-width="2" fill="none"/><path d="M19 11 L21 8 L17 8 Z" fill="white"/>'),

    clock      = _svg('<circle cx="12" cy="12" r="10" fill="none" stroke="white" stroke-width="2"/><rect x="11.2" y="6" width="1.6" height="7" fill="white"/><rect x="11.2" y="11.2" width="5" height="1.6" fill="white"/>'),
    defuser    = _svg('<rect x="6" y="10" width="12" height="8" rx="1" fill="none" stroke="white" stroke-width="1.5"/><path d="M10 10 V7 H14 V10" fill="none" stroke="white" stroke-width="1.5"/><circle cx="12" cy="14" r="2" fill="none" stroke="white" stroke-width="1.5"/><line x1="12" y1="16" x2="12" y2="17" stroke="white" stroke-width="1.5"/>'),
    bomb       = _svg('<rect x="7" y="8" width="10" height="12" rx="2" fill="none" stroke="white" stroke-width="1.5"/><line x1="12" y1="5" x2="12" y2="8" stroke="white" stroke-width="1.5"/><circle cx="12" cy="5" r="1.5" fill="white"/><rect x="9" y="11" width="6" height="3" rx="0.5" fill="none" stroke="white" stroke-width="1"/><line x1="10" y1="16" x2="14" y2="16" stroke="white" stroke-width="1"/>'),
    kill_icon  = _svg('<path d="M12 2 L14 9 H21 L15.5 13.5 L17.5 21 L12 16.5 L6.5 21 L8.5 13.5 L3 9 H10 Z" fill="none" stroke="white" stroke-width="1.5" stroke-linejoin="round"/>'),
    death_icon = _svg('<circle cx="12" cy="8" r="5" fill="none" stroke="white" stroke-width="1.5"/><path d="M10 7 V9 M14 7 V9" stroke="white" stroke-width="1.5" stroke-linecap="round"/><path d="M9 11 L12 13 L15 11" fill="none" stroke="white" stroke-width="1.5"/><path d="M8 13 L12 22 L16 13" fill="none" stroke="white" stroke-width="1.5" stroke-linejoin="round"/>'),
    assist_icon = _svg('<circle cx="12" cy="10" r="4" fill="none" stroke="white" stroke-width="1.5"/><path d="M6 20 C6 16 8 14 12 14 C16 14 18 16 18 20" fill="none" stroke="white" stroke-width="1.5"/><path d="M17 7 L21 3 M21 7 L17 3" stroke="white" stroke-width="1.5" stroke-linecap="round"/>'),
    signal_4  = _svg('<rect x="2" y="18" width="3" height="4" fill="white"/><rect x="7" y="14" width="3" height="8" fill="white"/><rect x="12" y="9" width="3" height="13" fill="white"/><rect x="17" y="3" width="3" height="19" fill="white"/>'),
    signal_3  = _svg('<rect x="2" y="18" width="3" height="4" fill="white"/><rect x="7" y="14" width="3" height="8" fill="white"/><rect x="12" y="9" width="3" height="13" fill="white"/><rect x="17" y="3" width="3" height="19" fill="white" opacity="0.2"/>'),
    signal_2  = _svg('<rect x="2" y="18" width="3" height="4" fill="white"/><rect x="7" y="14" width="3" height="8" fill="white"/><rect x="12" y="9" width="3" height="13" fill="white" opacity="0.2"/><rect x="17" y="3" width="3" height="19" fill="white" opacity="0.2"/>'),
    signal_1  = _svg('<rect x="2" y="18" width="3" height="4" fill="white"/><rect x="7" y="14" width="3" height="8" fill="white" opacity="0.2"/><rect x="12" y="9" width="3" height="13" fill="white" opacity="0.2"/><rect x="17" y="3" width="3" height="19" fill="white" opacity="0.2"/>'),
    fire       = _svg('<path d="M12 2 C12 2 8 8 8 12 C8 16 10 18 12 20 C14 18 16 16 16 12 C16 8 12 2 12 2 Z" fill="none" stroke="white" stroke-width="1.5"/><path d="M12 10 C12 10 10 13 10 15 C10 17 11 18 12 18 C13 18 14 17 14 15 C14 13 12 10 12 10 Z" fill="white"/>'),
    star       = _svg('<path d="M12 2 L14.9 8.6 L22 9.3 L17 14 L18.2 21 L12 17.5 L5.8 21 L7 14 L2 9.3 L9.1 8.6 Z" fill="white"/>'),
    skull      = _svg('<circle cx="12" cy="10" r="7" fill="none" stroke="white" stroke-width="1.5"/><circle cx="9" cy="9" r="1.5" fill="white"/><circle cx="15" cy="9" r="1.5" fill="white"/><path d="M9 14 L10 13 L11 14 L12 13 L13 14 L14 13 L15 14" fill="none" stroke="white" stroke-width="1.2"/><path d="M10 17 V20 M14 17 V20" stroke="white" stroke-width="1.5"/>'),('<rect x="6" y="8" width="12" height="10" rx="2" fill="none" stroke="white" stroke-width="1.5"/><circle cx="9" cy="13" r="1.5" fill="white"/><circle cx="15" cy="13" r="1.5" fill="white"/><line x1="9" y1="16" x2="15" y2="16" stroke="white" stroke-width="1.5" stroke-linecap="round"/><line x1="12" y1="5" x2="12" y2="8" stroke="white" stroke-width="1.5"/><circle cx="12" cy="4" r="1.5" fill="none" stroke="white" stroke-width="1"/><line x1="4" y1="12" x2="6" y2="12" stroke="white" stroke-width="1.5"/><line x1="18" y1="12" x2="20" y2="12" stroke="white" stroke-width="1.5"/>'),

    bullet     = '<svg xmlns="http://www.w3.org/2000/svg" width="8" height="24" viewBox="0 0 8 24"><path d="M4 1 L7 5 V17 H1 V5 Z" fill="white"/><rect x="1" y="17" width="6" height="5" fill="none" stroke="white" stroke-width="1.5"/></svg>',

    t_side  = [==[<svg xmlns="http://www.w3.org/2000/svg" width="900" height="939" viewBox="0 0 900 939"><g transform="translate(0,939) scale(0.1,-0.1)" fill="white" fill-rule="evenodd" stroke="none"><path d="M4090 8964 c-553 -59 -1086 -230 -1565 -502 -142 -81 -387 -247 -525 -358 -175 -140 -478 -442 -614 -614 -371 -466 -630 -992 -766 -1555 -81 -333 -110 -586 -110 -950 0 -422 48 -764 163 -1145 114 -383 274 -723 503 -1065 389 -584 898 -1037 1514 -1349 614 -310 1236 -451 1915 -433 426 12 806 79 1195 212 885 303 1644 919 2134 1730 467 774 655 1714 525 2620 -169 1174 -846 2209 -1854 2833 -518 320 -1082 512 -1699 576 -183 20 -635 19 -816 0z m686 -274 c1260 -98 2366 -808 2979 -1913 219 -395 362 -828 431 -1312 24 -171 30 -660 10 -852 -84 -789 -393 -1495 -912 -2083 -624 -706 -1462 -1136 -2407 -1236 -192 -20 -681 -14 -852 10 -598 86 -1109 279 -1590 601 -1243 833 -1862 2328 -1574 3801 65 332 167 632 324 944 422 844 1142 1488 2035 1822 305 114 705 199 1045 221 118 8 392 6 511 -3z"/><path d="M4498 8064 c-5 -8 -286 -870 -378 -1156 l-31 -98 -662 0 c-645 0 -661 0 -642 -19 11 -10 243 -179 515 -376 272 -197 503 -366 513 -375 18 -17 12 -39 -183 -640 -111 -342 -199 -624 -196 -627 3 -3 244 168 536 381 l532 387 96 -70 c54 -39 295 -214 537 -390 242 -175 441 -318 443 -316 2 2 -81 261 -183 576 -103 316 -195 599 -205 630 l-17 57 535 388 535 389 -664 5 -663 5 -114 350 c-62 192 -152 469 -199 615 -90 279 -97 298 -105 284z"/><path d="M7620 5773 c-155 -142 -466 -413 -620 -542 -183 -154 -301 -240 -523 -384 -637 -414 -792 -523 -1041 -733 -70 -60 -134 -113 -141 -118 -13 -10 -224 109 -232 131 -2 6 5 29 16 52 26 51 27 85 1 111 -26 26 -39 25 -80 -2 -80 -54 -108 -193 -57 -279 14 -24 53 -71 86 -104 67 -65 78 -95 34 -95 -37 0 -233 -110 -469 -261 l-91 -59 -174 109 c-203 127 -339 201 -382 210 -17 4 -32 12 -35 19 -2 7 30 47 72 90 41 43 82 94 91 114 29 71 14 160 -38 223 -51 63 -106 66 -128 8 -7 -20 -4 -37 15 -78 l24 -53 -21 -20 c-24 -21 -193 -122 -205 -122 -4 0 -52 38 -107 85 -236 202 -469 372 -829 603 -308 198 -461 300 -561 376 -158 119 -538 443 -824 704 -84 76 -116 100 -122 90 -5 -7 -9 -92 -9 -188 0 -429 71 -595 394 -929 143 -147 302 -279 561 -466 339 -245 474 -346 583 -438 57 -48 107 -87 112 -87 4 0 25 14 46 31 51 40 97 59 145 59 48 0 81 -14 146 -63 71 -53 94 -104 101 -217 5 -87 4 -89 -28 -134 -37 -51 -49 -55 -75 -26 -35 39 -85 11 -85 -48 0 -53 89 -102 164 -88 47 9 140 80 201 155 28 33 57 61 65 61 8 0 48 -38 89 -85 40 -47 120 -129 177 -183 57 -53 104 -100 104 -103 0 -4 -53 -51 -117 -106 -65 -55 -199 -173 -297 -261 -99 -89 -185 -162 -191 -162 -7 0 -34 7 -61 15 -70 21 -147 20 -167 -3 -61 -67 53 -300 232 -479 132 -132 255 -212 307 -199 35 9 44 43 33 123 -5 37 -7 78 -4 90 3 13 34 39 83 69 300 185 436 272 567 366 l149 107 46 -35 c83 -63 443 -301 590 -389 80 -48 149 -93 153 -99 5 -6 6 -52 3 -101 -9 -136 16 -160 113 -110 155 78 352 289 435 466 48 100 54 146 26 182 -18 22 -29 27 -67 27 -24 0 -74 -8 -109 -17 l-64 -17 -32 30 c-80 75 -364 327 -460 409 l-107 90 127 126 c70 69 152 153 181 187 30 34 59 62 64 62 6 0 44 -36 85 -81 84 -90 159 -139 212 -139 48 0 118 34 131 64 16 34 3 74 -27 88 -21 10 -29 8 -56 -12 l-31 -23 -33 39 c-19 22 -37 49 -40 61 -10 38 14 183 38 226 28 51 106 111 165 127 61 18 109 7 178 -41 71 -49 55 -54 206 74 57 48 196 154 308 235 511 369 653 482 815 653 232 244 315 379 357 583 22 106 34 367 22 473 l-8 71 -105 -95z"/></g></svg>]==],
    ct_side = [[<svg xmlns="http://www.w3.org/2000/svg" width="1000" height="1000" viewBox="0 0 1000 1000"><g
 transform="translate(0,1000) scale(0.1,-0.1)" fill="white" stroke="none" ><path d="M4380 9674 c-299 -41 -629 -116 -893
 -205 -1310 -439 -2362 -1426 -2880 -2705 -125 -307 -216 -624 -280 -974 l-31 -175 -4 -570 c-2 -392 0 -598 8 -660 90 -700
 340 -1379 727 -1970 650 -992 1643 -1705 2778 -1993 88 -23 219 -52 290 -66 273 -53 328 -56 893 -56 478 0 540 2 667 21
 1344 196 2532 955 3278 2094 342 523 577 1113 691 1735 46 253 48 292 43 900 -4 570 -4 576 -30 720 -144 786 -422 1435
 -877 2045 -142 191 -262 329 -454 520 -325 324 -650 569 -1049 790 -475 263 -975 435 -1553 532 -157 26 -166 27 -689 29
 -415 2 -553 -1 -635 -12z m-876 -683 c32 -35 89 -247 98 -366 3 -39 2 -40 -28 -42 -18 0 -41 -6 -53 -12 -46 -25 -90 -142
 -106 -283 l-7 -57 -49 6 c-46 5 -51 4 -82 -29 -40 -43 -73 -136 -91 -260 -8 -49 -16 -92 -20 -95 -4 -4 -13 3 -22 15 -8 12
 -29 29 -46 38 -29 15 -32 15 -57 -3 -35 -26 -59 -76 -76 -159 -19 -95 -35 -278 -35 -407 0 -126 -5 -129 -62 -46 -21 30
 -58 73 -83 97 -39 37 -50 43 -83 40 -33 -3 -39 -8 -62 -53 -24 -48 -25 -58 -25 -230 0 -99 7 -229 14 -288 7 -60 10 -111 7
 -114 -3 -3 -36 23 -74 59 -112 106 -167 114 -204 30 -37 -84 -14 -303 68 -650 15 -61 24 -115 20 -120 -4 -4 -19 7 -33 23
 -85 102 -189 207 -229 234 -60 39 -95 40 -124 4 -20 -25 -22 -36 -17 -108 6 -88 40 -240 86 -385 17 -52 31 -96 31 -97 0
 -12 -35 5 -94 46 -202 138 -310 148 -308 26 1 -78 59 -222 167 -415 31 -56 54 -104 51 -107 -3 -3 -39 7 -81 22 -188 66
 -266 17 -202 -127 22 -49 132 -203 206 -288 17 -19 31 -38 31 -41 0 -3 -42 -4 -94 -1 -106 5 -159 -7 -182 -44 -47 -70 86
 -204 417 -420 l133 -88 -98 -32 c-54 -18 -117 -44 -141 -58 -50 -30 -73 -73 -56 -105 24 -43 170 -95 344 -122 48 -7 87
 -16 87 -20 0 -3 -44 -19 -97 -34 -288 -81 -345 -170 -150 -234 66 -22 247 -55 362 -66 39 -3 79 -8 90 -10 11 -2 58 -7 105
 -10 144 -10 344 -24 350 -23 17 1 16 -8 -11 -67 -39 -87 -93 -233 -120 -327 -27 -93 -24 -92 -180 -49 -216 61 -353 113
 -522 197 -93 47 -227 129 -238 145 -3 5 -39 25 -80 45 -169 81 -254 153 -242 206 6 23 88 61 118 55 27 -5 51 15 40 33 -3
 6 -22 17 -41 25 -55 23 -143 85 -211 149 -104 97 -107 158 -10 204 62 29 200 56 224 44 19 -11 53 6 53 26 0 9 -21 22 -47
 28 -7 1 -32 17 -55 35 -234 180 -428 391 -428 463 0 32 46 48 131 48 44 0 85 -5 92 -10 16 -13 58 3 51 20 -3 7 -19 22 -36
 33 -48 30 -164 180 -209 269 -66 132 -49 208 53 234 22 6 90 10 149 10 60 -1 112 1 115 5 3 3 -12 30 -34 60 -128 173 -252
 429 -252 521 0 57 15 83 56 96 44 15 154 6 166 -13 5 -9 11 -8 24 5 15 15 15 18 -3 45 -33 48 -90 177 -129 290 -32 92 -38
 121 -38 196 -1 85 0 90 27 113 65 56 226 15 454 -117 47 -27 90 -49 94 -49 15 0 10 26 -21 99 -82 192 -153 420 -170 541
 -26 188 21 230 169 153 83 -42 281 -197 281 -219 0 -9 7 -14 18 -12 15 3 18 24 24 213 8 285 33 464 74 552 46 96 104 53
 208 -155 27 -54 52 -92 59 -89 7 2 15 36 19 83 24 264 37 346 74 472 27 90 71 152 108 152 34 0 91 -54 142 -136 66 -104
 75 -99 92 51 15 140 52 314 79 370 32 70 66 59 115 -38 35 -70 47 -66 67 23 20 89 70 248 97 308 40 92 72 113 108 73z
 m3003 -19 c32 -49 60 -127 101 -290 21 -79 41 -144 47 -145 5 -1 16 12 24 28 35 69 62 105 79 105 44 0 97 -203 118 -450 4
 -41 8 -78 11 -82 11 -19 34 -4 54 35 58 115 129 179 175 158 63 -28 122 -250 140 -528 4 -54 8 -105 10 -113 1 -8 3 -25 3
 -37 2 -49 29 -19 79 86 96 204 155 237 196 112 35 -107 53 -261 62 -538 4 -112 9 -203 12 -203 2 0 36 30 74 66 128 120
 258 204 316 204 17 0 37 -9 48 -21 25 -28 23 -140 -4 -265 -19 -83 -95 -319 -152 -471 -13 -35 -21 -65 -17 -69 3 -4 30 8
 59 25 254 149 400 193 464 138 48 -42 40 -169 -22 -347 -35 -99 -104 -252 -120 -265 -14 -11 -23 -51 -11 -53 18 -4 27 -1
 42 15 13 13 36 17 92 17 67 1 77 -1 94 -23 58 -71 -22 -299 -203 -578 -33 -52 -58 -96 -55 -100 4 -3 26 0 51 6 94 23 232
 6 273 -35 37 -37 32 -102 -15 -200 -44 -90 -148 -232 -197 -270 -36 -27 -56 -71 -27 -58 9 4 58 9 108 12 113 5 134 -4 134
 -56 0 -80 -131 -227 -424 -476 -49 -41 -56 -50 -41 -58 9 -5 23 -7 31 -4 21 8 152 -21 202 -45 92 -45 91 -108 -1 -202 -44
 -45 -148 -121 -222 -163 -11 -6 -20 -20 -20 -30 0 -16 6 -18 35 -16 46 4 104 -33 108 -69 6 -48 -74 -117 -224 -192 -38
 -19 -76 -42 -83 -51 -37 -44 -292 -185 -444 -245 -105 -41 -285 -101 -305 -101 -13 0 -26 28 -55 123 -21 67 -54 160 -74
 207 -57 139 -63 126 69 134 285 18 601 66 693 106 23 10 51 30 63 45 48 61 -25 118 -232 180 -53 16 -96 32 -96 36 0 3 24
 9 53 13 80 9 242 52 293 78 95 47 90 111 -13 165 -32 17 -88 40 -125 53 -38 12 -68 25 -68 29 0 5 26 24 59 44 100 62 283
 204 358 278 105 104 125 155 77 200 -24 22 -33 24 -135 24 -60 0 -109 1 -109 3 0 1 38 53 85 114 91 121 149 222 160 280 6
 33 4 41 -24 69 -29 29 -36 31 -76 26 -24 -4 -76 -18 -116 -32 -40 -14 -74 -24 -75 -22 -1 1 35 77 80 168 126 254 157 373
 109 420 -43 43 -126 15 -272 -91 -38 -28 -74 -50 -79 -50 -7 0 -6 17 4 48 67 215 111 441 97 506 -11 53 -48 81 -87 66 -37
 -14 -160 -134 -233 -226 -57 -73 -80 -91 -69 -56 12 38 66 293 81 379 70 408 5 541 -177 362 -39 -38 -73 -69 -75 -69 -3 0
 -2 28 2 63 26 245 28 471 5 551 -36 120 -116 102 -215 -48 -27 -41 -53 -76 -57 -76 -5 0 -8 26 -8 58 -1 267 -41 539 -88
 599 -31 38 -57 38 -101 -3 -23 -20 -41 -35 -42 -33 -4 19 -7 42 -13 89 -11 85 -36 180 -63 233 -27 55 -71 81 -111 66 -37
 -14 -42 -11 -42 25 0 61 -29 189 -56 243 -28 57 -66 86 -102 76 -19 -5 -22 -1 -22 25 0 81 53 310 87 375 19 37 50 33 80
 -11z m-1949 -1439 c40 -131 126 -416 192 -633 65 -217 118 -395 117 -395 -20 -8 -83 -65 -98 -89 -29 -48 -26 -129 9 -197
 23 -45 36 -58 82 -82 52 -26 61 -27 170 -25 97 3 119 6 142 23 32 24 86 112 94 154 11 51 -15 120 -63 169 l-43 45 201 626
 c111 344 205 630 210 635 16 17 58 -24 88 -86 23 -49 32 -86 40 -168 19 -195 33 -613 35 -1040 l1 -425 -107 -210 c-58
 -115 -116 -228 -129 -251 -25 -44 -21 -74 9 -74 12 0 52 -40 108 -107 481 -583 911 -1155 1142 -1521 183 -291 272 -504
 367 -882 137 -545 204 -1301 131 -1474 -26 -62 -168 -167 -193 -142 -4 3 -10 117 -14 253 -19 596 -101 1099 -235 1447
 -114 295 -425 794 -807 1295 -276 360 -746 911 -778 911 -12 0 -52 -41 -106 -107 -49 -59 -99 -120 -113 -136 l-25 -29
 -108 136 c-69 86 -115 136 -127 136 -43 0 -601 -678 -906 -1100 -265 -366 -569 -870 -637 -1055 -157 -425 -230 -873 -253
 -1547 -7 -201 -8 -208 -27 -208 -64 0 -185 104 -207 176 -18 62 -24 306 -11 474 35 459 128 924 261 1305 105 301 356 690
 830 1285 311 390 729 880 761 892 11 4 19 12 19 17 0 6 -57 126 -127 268 l-128 257 2 361 c5 663 30 1148 65 1242 17 48 68
 113 87 113 4 0 40 -107 79 -237z m192 -2326 c0 -2 -12 -14 -27 -28 l-28 -24 24 28 c23 25 31 32 31 24z m140 -504 c-96
 -654 -285 -1232 -512 -1572 -94 -140 -289 -313 -378 -336 -20 -5 -41 6 -104 53 -78 58 -79 61 -80 103 l-1 44 -55 3 c-43 2
 -63 9 -89 31 l-34 28 57 77 c31 43 100 142 151 222 174 266 1051 1491 1061 1482 2 -2 -6 -63 -16 -135z m396 -133 c459
 -625 761 -1048 879 -1230 37 -58 94 -140 126 -182 l58 -77 -52 -38 c-41 -30 -63 -39 -107 -43 l-55 -5 2 -42 c2 -42 0 -44
 -72 -103 -40 -33 -80 -60 -87 -60 -20 0 -120 62 -171 105 -241 205 -453 672 -591 1305 -36 166 -79 408 -91 510 -4 30 -9
 64 -12 75 -8 30 0 20 173 -215z"/></g></svg>]],
}

function HUD.icons.get(name, size)
    size = math.floor(size or 16)
    if size < 4 then size = 4 end
    local key = name .. "_" .. size
    local cached = HUD.icons._cache[key]
    if cached ~= nil then return cached or nil end
    local svg = HUD.icons._defs[name]
    if not svg then
        HUD.icons._cache[key] = false
        return nil
    end
    local stroke_only = svg:find('<g[^>]-fill="none"') ~= nil
    if not stroke_only then
        svg = svg:gsub('<path ([^>]-)/>', function(attrs)
            if attrs:find('fill=') then return nil end
            return '<path ' .. attrs .. ' fill="white" fill-rule="evenodd"/>'
        end)
        svg = svg:gsub('<path ([^>]-)>', function(attrs)
            if attrs:find('fill=') or attrs:sub(-1) == '/' then return nil end
            return '<path ' .. attrs .. ' fill="white" fill-rule="evenodd">'
        end)
        svg = svg:gsub('fill="#000000"', 'fill="white"')
        svg = svg:gsub('fill="#000"',    'fill="white"')
        svg = svg:gsub('fill="black"',   'fill="white"')
    end

    local sw_attr = tonumber(svg:match('width="(%d+)"'))  or 24
    local sh_attr = tonumber(svg:match('height="(%d+)"')) or 24
    local aspect  = sw_attr / sh_attr
    local tex_w, tex_h
    if aspect >= 1 then
        tex_w, tex_h = size, math.floor(size / aspect + 0.5)
    else
        tex_w, tex_h = math.floor(size * aspect + 0.5), size
    end
    if tex_w < 1 then tex_w = 1 end
    if tex_h < 1 then tex_h = 1 end
    local oversample = 1
    local rast_w = tex_w * oversample
    local rast_h = tex_h * oversample
    if rast_w < 1 then rast_w = 1 end
    if rast_h < 1 then rast_h = 1 end
    local ok, tex = pcall(renderer.load_svg, svg, rast_w, rast_h)
    if not ok or not tex then
        HUD.icons._cache[key] = false
        return nil
    end
    HUD.icons._cache[key] = { tex = tex, w = tex_w, h = tex_h }
    return HUD.icons._cache[key]
end

function HUD.icons.draw(name, x, y, size, r, g, b, a)
    local c = HUD.icons.get(name, size)
    if not c then return false end
    pcall(renderer.texture, c.tex, math.floor(x), math.floor(y), c.w, c.h,
          r or 255, g or 255, b or 255, a or 255)
    return true
end

local PISTOLS = {
    ["CWeaponGlock"] = true, ["CWeaponHKP2000"] = true, ["CWeaponUSP"] = true,
    ["CWeaponElite"] = true, ["CWeaponP250"] = true, ["CWeaponTec9"] = true,
    ["CWeaponFiveSeven"] = true, ["CWeaponCZ75"] = true, ["CWeaponDesertEagle"] = true,
    ["CWeaponRevolver"] = true, ["CDEagle"] = true
}

local function get_weapon_slot(cls)
    if not cls then return 1 end
    if cls == "CC4" or cls == "CWeaponC4" then return 5 end
    if cls:find("Knife") or cls == "CWeaponMelee" or cls == "CWeaponTaser" then return 3 end
    if cls:find("Grenade") or cls:find("Flashbang") or cls == "CMolotovProjectile" or cls == "CDecoyProjectile" then return 4 end
    if PISTOLS[cls] then return 2 end
    return 1
end

local function get_weapons(lp)
    local wpns = {}
    for i = 0, 63 do
        local handle = entity.get_prop(lp, "m_hMyWeapons", i)
        if handle ~= nil then
            local ent = bit.band(handle, 0xFFFF)
            if ent > 0 then
                local cls = entity.get_classname(ent)
                if cls then
                    local slot = get_weapon_slot(cls)
                    local name = cls:gsub("^CWeapon", ""):gsub("^C", "")
                    if name == "IncendiaryGrenade" then name = "INCENDIARY"
                    elseif name:find("Smoke")     then name = "SMOKE"
                    elseif name:find("HEGrenade") then name = "HE GRENADE"
                    elseif name:find("Flashbang") then name = "FLASHBANG"
                    elseif name:find("Decoy")     then name = "DECOY"
                    elseif name:find("Molotov")   then name = "MOLOTOV"
                    elseif name:find("Knife") or name == "Melee" then name = "KNIFE"
                    end
                    local icon = nil
                    if images and images.get_weapon_icon then
                        pcall(function() icon = images.get_weapon_icon(ent) end)
                    end
                    table.insert(wpns, { ent = ent, slot = slot, name = name:upper(), icon = icon, classname = cls })
                end
            end
        end
    end
    table.sort(wpns, function(a, b)
        if a.slot == b.slot then return a.ent < b.ent end
        return a.slot < b.slot
    end)
    return wpns
end


client.set_event_callback("shutdown", function()
    client.set_cvar("m_pitch", 0.022)
    client.exec("cl_use_opens_buy_menu 1")
    client.exec("bind b buymenu")
    client.exec("bind e +use")
end)

local function get_team_scores_legacy()
    local ts, cs = 0, 0
    for _, t in ipairs(entity.get_all("CCSTeam")) do
        local n = entity.get_prop(t, "m_iTeamNum")
        if n == 2 then ts = entity.get_prop(t, "m_scoreTotal") or 0
        elseif n == 3 then cs = entity.get_prop(t, "m_scoreTotal") or 0 end
    end
    return ts, cs
end

client.set_event_callback("round_end", function(e)
    if e and e.winner then
        if e.winner == 2 then
            G_TRACKED_SCORES.t = G_TRACKED_SCORES.t + 1
        elseif e.winner == 3 then
            G_TRACKED_SCORES.ct = G_TRACKED_SCORES.ct + 1
        end
    end
    G_KILL_STREAKS = {}
end)


local ui_main_enable     = ui.new_checkbox("LUA", "B", "Enable Custom HUD")
ui_hud_scale       = ui.new_slider("LUA", "B", "HUD DPI Scale (%)", 50, 150, 100)
local ui_editor_enable   = ui.new_checkbox("LUA", "B", "Edit HUD Layout")
local ui_editor_reset    = ui.new_button("LUA", "B", "Reset HUD Layout", function()
    if HUD and HUD.state and HUD.state._positions then
        HUD.state._positions = {}
        HUD_LOG("[editor] layout reset to defaults.", 200, 220, 150, true, nil, nil, "system")
        if HUD.mark_dirty then HUD.mark_dirty() end
    end
end)
local ui_mwheel_enable   = ui.new_checkbox("LUA", "B", "Mousewheel Scroll (experimental)")
local ui_intel_toggle    = ui.new_checkbox("LUA", "B", "Enable Additional Info")
local ui_con_enable      = ui.new_checkbox("LUA", "B", "Enable Custom Console")
local ui_wpn_color_label = ui.new_label("LUA", "B", "Weapon HUD Color")
local ui_wpn_color       = ui.new_color_picker("LUA", "B", "Weapon HUD Color", 255, 210, 210, 255)
local ui_con_color       = ui.new_color_picker("LUA", "B", "Console Accent Color", 150, 210, 120, 255)
local ui_con_reset       = ui.new_button("LUA", "B", "Reset Console Color", function()
    ui.set(ui_con_color, 150, 210, 120, 255)
    HUD_LOG("Settings: Console accent color reset to default.", 150, 210, 120, true, nil, nil, "system")
end)
local ui_chat_label      = ui.new_label("LUA", "B", "Custom Chat Color")
local ui_chat_color      = ui.new_color_picker("LUA", "B", "Custom Chat Color", 150, 210, 120, 255)
local ui_chat_reset      = ui.new_button("LUA", "B", "Reset Chat Color", function()
    ui.set(ui_chat_color, 150, 210, 120, 255)
    HUD_LOG("Settings: Chat accent color reset to default.", 150, 210, 120, true, nil, nil, "system")
end)
local ui_con_key         = ui.new_hotkey("LUA", "B", "Console Toggle", false, 0x24)
local ui_con_theme       = ui.new_combobox("LUA", "B", "Console Theme", {"Default", "Gamesensical", "Custom"})

local ui_con_cust_bg     = ui.new_color_picker("LUA", "B", "Custom BG", 15, 15, 15, 180)
local ui_con_cust_acc    = ui.new_color_picker("LUA", "B", "Custom Accent", 100, 200, 255, 255)
local ui_con_cust_glow   = ui.new_checkbox("LUA", "B", "Custom Glow Effect")
local ui_con_cust_line   = ui.new_checkbox("LUA", "B", "Custom Scanlines")
local ui_con_cust_shad   = ui.new_checkbox("LUA", "B", "Custom Drop Shadow")
local ui_con_cust_w      = ui.new_slider("LUA", "B", "Custom Width", 400, 1000, 600)
local ui_con_cust_h      = ui.new_slider("LUA", "B", "Custom Height", 200, 800, 400)

ui.set_callback(ui_con_theme, function()
    apply_theme(ui.get(ui_con_theme))
end)

local ui_crosshair_enable = ui.new_checkbox("LUA", "B", "Enable Custom Crosshair")
local ui_crosshair_color  = ui.new_color_picker("LUA", "B", "Crosshair Color", 255, 255, 255, 230)
local ui_crosshair_gap    = ui.new_slider("LUA", "B", "\n gap", 0, 25, 4)
local ui_crosshair_len    = ui.new_slider("LUA", "B", "\n length", 0, 50, 6)
local ui_crosshair_thick  = ui.new_slider("LUA", "B", "\n thickness", 1, 5, 1)
local ui_crosshair_dot    = ui.new_checkbox("LUA", "B", "Crosshair Dot")
local ui_crosshair_dotsize = ui.new_slider("LUA", "B", "\n dotsize", 1, 10, 2)
local ui_crosshair_out    = ui.new_checkbox("LUA", "B", "Crosshair Outline")
local ui_crosshair_out_c  = ui.new_color_picker("LUA", "B", "Outline Color", 0, 0, 0, 150)
local ui_crosshair_dynamic = ui.new_checkbox("LUA", "B", "Dynamic Gap")

local ui_buy_menu_enable  = ui.new_checkbox("LUA", "B", "Enable Custom Buy Menu")
local ui_buy_menu_key     = ui.new_hotkey("LUA", "B", "Buy Menu Key")
local ui_buy_menu_warn    = ui.new_label("LUA", "B", "\aFFB400FF!! DON'T FORGET TO BIND IT :3 !!")

local ui_scoreboard_enable = ui.new_checkbox("LUA", "B", "Enable Custom Scoreboard")

local ui_autobuy_label    = ui.new_label("LUA", "B", "--- Quick Buy Presets ---")
local ui_autobuy_key      = ui.new_hotkey("LUA", "B", "Full Buy (Scar20/G3SG1)", false, 0x70)
local ui_ecobuy_key       = ui.new_hotkey("LUA", "B", "Eco Buy (P250 + Armor)", false, 0x71)

local lx, ly, lz = 0, 0, 0
local la, lb, lc = 0, 0, 0

local function handle_menu_visibility()
    local main_active = ui.get(ui_main_enable)
    ui.set_visible(ui_hud_scale, main_active)
    client.set_cvar("cl_drawhud", main_active and 0 or 1)

    local xhair_active = main_active and ui.get(ui_crosshair_enable)
    client.set_cvar("crosshair", xhair_active and 0 or 1)

    ui.set_visible(ui_crosshair_enable, main_active)
    ui.set_visible(ui_crosshair_color, xhair_active)
    ui.set_visible(ui_crosshair_gap, xhair_active)
    ui.set_visible(ui_crosshair_len, xhair_active)
    ui.set_visible(ui_crosshair_thick, xhair_active)
    ui.set_visible(ui_crosshair_dot, xhair_active)
    ui.set_visible(ui_crosshair_dotsize, xhair_active and ui.get(ui_crosshair_dot))
    ui.set_visible(ui_crosshair_out, xhair_active)
    ui.set_visible(ui_crosshair_out_c, xhair_active and ui.get(ui_crosshair_out))
    ui.set_visible(ui_crosshair_dynamic, xhair_active)

    ui.set_visible(ui_buy_menu_enable, main_active)
    local bmenu_active = main_active and ui.get(ui_buy_menu_enable)
    ui.set_visible(ui_buy_menu_key, bmenu_active)
    ui.set_visible(ui_buy_menu_warn, bmenu_active)

    ui.set_visible(ui_autobuy_label, bmenu_active)
    ui.set_visible(ui_autobuy_key, bmenu_active)
    ui.set_visible(ui_ecobuy_key, bmenu_active)

    ui.set_visible(ui_scoreboard_enable, main_active)
    ui.set_visible(ui_intel_toggle, main_active)
    ui.set_visible(ui_con_enable, main_active)
    ui.set_visible(ui_editor_enable, main_active)
    ui.set_visible(ui_editor_reset,  main_active)
    ui.set_visible(ui_mwheel_enable, main_active)
    ui.set_visible(ui_chat_label, main_active)
    ui.set_visible(ui_chat_color, main_active)
    ui.set_visible(ui_chat_reset, main_active)
    local con_active = main_active and ui.get(ui_con_enable)
    ui.set_visible(ui_con_key, con_active)

    local con_active = main_active and ui.get(ui_con_enable)
    local is_custom = con_active and ui.get(ui_con_theme) == "Custom"

    ui.set_visible(ui_con_color, con_active and not is_custom)
    ui.set_visible(ui_con_reset, con_active and not is_custom)
    ui.set_visible(ui_con_theme, con_active)

    ui.set_visible(ui_con_cust_bg, is_custom)
    ui.set_visible(ui_con_cust_acc, is_custom)
    ui.set_visible(ui_con_cust_glow, is_custom)
    ui.set_visible(ui_con_cust_line, is_custom)
    ui.set_visible(ui_con_cust_shad, is_custom)
    ui.set_visible(ui_con_cust_w, is_custom)
    ui.set_visible(ui_con_cust_h, is_custom)

    client.set_cvar("con_enable", con_active and 0 or 1)

    if bmenu_active then
        client.exec("cl_use_opens_buy_menu 0")
        client.exec("unbind b")
    else
        client.exec("cl_use_opens_buy_menu 1")
        client.exec("bind b buymenu")
        client.exec("bind e +use")
    end
end

ui.set_callback(ui_main_enable, handle_menu_visibility)
ui.set_callback(ui_intel_toggle, handle_menu_visibility)
ui.set_callback(ui_con_enable, handle_menu_visibility)
ui.set_callback(ui_con_theme, handle_menu_visibility)
ui.set_callback(ui_crosshair_enable, handle_menu_visibility)
ui.set_callback(ui_crosshair_dot, handle_menu_visibility)
ui.set_callback(ui_crosshair_out, handle_menu_visibility)
ui.set_callback(ui_crosshair_dynamic, handle_menu_visibility)
ui.set_callback(ui_buy_menu_enable, handle_menu_visibility)

pcall(handle_menu_visibility)
update_hud_fonts()
ui.set_callback(ui_hud_scale, update_hud_fonts)

SETTINGS = {
    ["hud_enabled"] = ui_main_enable,
    ["con_enabled"] = ui_con_enable,
    ["editor"]      = ui_editor_enable,
    ["mwheel"]      = ui_mwheel_enable,
    ["con_color"]   = ui_con_color,
    ["chat_color"]  = ui_chat_color,
    ["con_key"]     = ui_con_key,
    ["wpn_color"]   = ui_wpn_color,
    ["con_theme"]   = ui_con_theme,
    ["con_bg"]      = ui_con_cust_bg,
    ["con_acc"]     = ui_con_cust_acc,
    ["con_glow"]    = ui_con_cust_glow,
    ["con_line"]    = ui_con_cust_line,
    ["con_shad"]    = ui_con_cust_shad,
    ["con_w"]       = ui_con_cust_w,
    ["con_h"]       = ui_con_cust_h,
    ["xh_enabled"]  = ui_crosshair_enable,
    ["xh_color"]    = ui_crosshair_color,
    ["xh_gap"]      = ui_crosshair_gap,
    ["xh_len"]      = ui_crosshair_len,
    ["xh_thick"]    = ui_crosshair_thick,
    ["xh_dot"]      = ui_crosshair_dot,
    ["xh_dotsize"]  = ui_crosshair_dotsize,
    ["xh_out"]      = ui_crosshair_out,
    ["xh_out_c"]    = ui_crosshair_out_c,
    ["xh_dyn"]      = ui_crosshair_dynamic,
    ["buy_enabled"] = ui_buy_menu_enable,
    ["buy_key"]     = ui_buy_menu_key,
    ["buy_auto"]    = ui_autobuy_key,
    ["buy_eco"]     = ui_ecobuy_key,
    ["intel_enabled"] = ui_intel_toggle,
    ["chat_enabled"] = ui_main_enable,
    ["hud_scale"]   = ui_hud_scale
}


local BM_MODULE = {
    is_open = false,
    cur_cat = 0,
    tab_interp_x = 0,
    hovered_item = nil,
    sideboard_anim = 0,
    last_cat_tick = 0
}

local WEAPON_STATS = {
    ["ak47"] = { dmg=0.82, acc=0.65, pen=0.78, rate=0.60, mob=0.68 },
    ["m4a1"] = { dmg=0.74, acc=0.82, pen=0.70, rate=0.67, mob=0.70 },
    ["awp"]   = { dmg=1.00, acc=0.95, pen=0.98, rate=0.15, mob=0.45 },
    ["scar20"]= { dmg=0.88, acc=0.80, pen=0.85, rate=0.50, mob=0.55 },
    ["g3sg1"] = { dmg=0.88, acc=0.80, pen=0.85, rate=0.50, mob=0.55 },
    ["deagle"]= { dmg=0.75, acc=0.72, pen=0.85, rate=0.40, mob=0.80 },
    ["p250"]  = { dmg=0.55, acc=0.60, pen=0.65, rate=0.55, mob=0.88 },
    ["glock"] = { dmg=0.45, acc=0.50, pen=0.45, rate=0.62, mob=0.92 },
    ["famas"] = { dmg=0.65, acc=0.75, pen=0.70, rate=0.75, mob=0.72 },
    ["galilar"]={ dmg=0.65, acc=0.68, pen=0.72, rate=0.67, mob=0.72 },
    ["ssg08"] = { dmg=0.78, acc=0.85, pen=0.75, rate=0.25, mob=0.75 },
    ["sg556"] = { dmg=0.76, acc=0.88, pen=1.00, rate=0.65, mob=0.65 },
    ["aug"]   = { dmg=0.72, acc=0.92, pen=0.90, rate=0.67, mob=0.65 },
    ["negev"] = { dmg=0.70, acc=0.55, pen=0.75, rate=1.00, mob=0.35 },
    ["mp9"]   = { dmg=0.52, acc=0.50, pen=0.60, rate=0.95, mob=0.85 },
    ["mac10"] = { dmg=0.50, acc=0.45, pen=0.55, rate=0.92, mob=0.85 },
    ["ump45"] = { dmg=0.68, acc=0.55, pen=0.65, rate=0.58, mob=0.82 },
    ["elite"] = { dmg=0.42, acc=0.40, pen=0.50, rate=0.80, mob=0.90 },
    ["fiveseven"] = { dmg=0.60, acc=0.60, pen=0.85, rate=0.50, mob=0.88 },
    ["cz75a"] = { dmg=0.58, acc=0.35, pen=0.70, rate=0.90, mob=0.88 },
    ["nova"]  = { dmg=0.78, acc=0.25, pen=0.35, rate=0.20, mob=0.75 },
    ["xm1014"]= { dmg=0.82, acc=0.20, pen=0.35, rate=0.65, mob=0.65 },
    ["p90"]   = { dmg=0.50, acc=0.45, pen=0.75, rate=0.95, mob=0.88 },
    ["mp7"]   = { dmg=0.55, acc=0.55, pen=0.65, rate=0.82, mob=0.82 },
}

local function get_weapon_silhouette(cmd)
    for _, cat in ipairs(BM_CATEGORIES) do
        for _, it in ipairs(cat.items) do
            if it.cmd == cmd then return it.icon end
        end
    end
    return "i"
end

local BM_CATEGORIES = {
    {
        name = "PISTOLS",
        items = {
            { name = "Glock/USP", cmd = "glock", price = 200 },
            { name = "P250", cmd = "p250", price = 300 },
            { name = "Desert Eagle", cmd = "deagle", price = 700 },
            { name = "Dual Berettas", cmd = "elite", price = 300 },
            { name = "Five-Seven/Tec-9", cmd = "fiveseven", price = 500 },
            { name = "CZ75-Auto", cmd = "cz75a", price = 500 },
        }
    },
    {
        name = "HEAVY",
        items = {
            { name = "Nova", cmd = "nova", price = 1050 },
            { name = "XM1014", cmd = "xm1014", price = 2000 },
            { name = "Negev", cmd = "negev", price = 1700 },
        }
    },
    {
        name = "SMGS",
        items = {
            { name = "MAC-10/MP9", cmd = "mac10", price = 1050 },
            { name = "MP7", cmd = "mp7", price = 1500 },
            { name = "UMP-45", cmd = "ump45", price = 1200 },
            { name = "P90", cmd = "p90", price = 2350 },
        }
    },
    {
        name = "RIFLES",
        items = {
            { name = "Galil/Famas", cmd = "galilar", price = 1800 },
            { name = "AK-47 / M4A4", cmd = "ak47", price = 2700 },
            { name = "SSG 08", cmd = "ssg08", price = 1700 },
            { name = "SG 553 / AUG", cmd = "sg556", price = 3000 },
            { name = "AWP", cmd = "awp", price = 4750 },
            { name = "SCAR-20 / G3SG1", cmd = "scar20", price = 5000 },
        }
    },
    {
        name = "EQUIP",
        items = {
            { name = "Kevlar", cmd = "vest", price = 650 },
            { name = "Kevlar + Helm", cmd = "vesthelm", price = 1000 },
            { name = "Defuse Kit", cmd = "defuser", price = 400 },
        }
    },
    {
        name = "GRENADES",
        items = {
            { name = "Flashbang", cmd = "flashbang", price = 200 },
            { name = "HE Grenade", cmd = "hegrenade", price = 300 },
            { name = "Smoke", cmd = "smokegrenade", price = 300 },
            { name = "Molotov/Inc", cmd = "molotov", price = 400 },
            { name = "Decoy", cmd = "decoy", price = 50 },
        }
    }
}

function BM_MODULE.draw()
    if not BM_MODULE.is_open then
        if pan_ok then PAN_MODULE.update(0,0,0,0,0) end
        BM_MODULE.sideboard_anim = 0
        return
    end

    local sw, sh = client.screen_size()
    local w, h   = S_F(760, 680), S_F(500, 430)
    local x, y   = (sw - w) / 2, (sh - h) / 2
    local accent = { ui.get(SETTINGS["con_color"]) }
    local function br(v) return math.max(210, v) end
    local br_accent = { br(accent[1]), br(accent[2]), br(accent[3]) }
    local ft = globals.frametime()

    if pan_ok then PAN_MODULE.update(x, y, w, h, 1.0) end
    renderer.rectangle(x, y, w, h, 18, 18, 18, 235, S(12))

    renderer.rectangle(x, y, w, S_F(50, 45), 255, 255, 255, 18, S(10))

    local lp = entity.get_local_player()
    if not lp or entity.get_prop(lp, "m_bInBuyZone") ~= 1 then
        BM_MODULE.is_open = false; return
    end

    local money = entity.get_prop(lp, "m_iAccount") or 0
    renderer.text(x + S(28), y + S(22), 255, 255, 255, 255, "bd", 0, "BUY MENU")

    local bal_val = tostring(money)
    local bw_h_d, _ = renderer.measure_text("bd", "$")
    local bw_h_v, _ = renderer.measure_text("bd", bal_val)
    local bw_h_total, _ = renderer.measure_text("bd", "WALLET: ")
    local start_rx = x + w - S(28) - (bw_h_total + bw_h_d + bw_h_v)

    renderer.text(start_rx, y + S(22), 255, 255, 255, 255, "bd", 0, "WALLET: ")
    renderer.text(start_rx + bw_h_total, y + S(22), 120, 200, 80, 255, "bd", 0, "$")
    renderer.text(start_rx + bw_h_total + bw_h_d, y + S(22), 255, 255, 255, 255, "bd", 0, bal_val)

    local tm_x = x + S(260)
    local teammates = entity.get_players(true)
    for i, p in ipairs(teammates) do
        if i > 5 then break end
        local tx = tm_x + (i-1) * S(70)
        local p_money = entity.get_prop(p, "m_iAccount") or 0
        local p_name = entity.get_player_name(p):sub(1,6)

        renderer.text(tx, y + S(10), 255, 255, 255, 150, "bd", 0, p_name)
        renderer.text(tx, y + S(25), 255, 255, 255, 255, "bd", 0, "$" .. p_money)

        local pw = entity.get_player_weapon(p)
        if pw ~= nil then
            local icon = images.get_weapon_icon(pw)
            if icon then
                local iw, ih = icon:measure()
                local sc = S(14) / ih
                icon:draw(tx + S(40), y + S(25), iw * sc, 14, 255, 255, 255, 100)
            end
        end
    end

    local tab_w = (w - S(60)) / #BM_CATEGORIES
    if not BM_MODULE.click_prev then
        local alt_down = client.key_state(0x12)

        if client.key_state(0x02) then
            BM_MODULE.cur_cat = 0
            BM_MODULE.last_cat_tick = globals.tickcount()
            BM_MODULE.click_prev = true
        end

        if alt_down then
            for i=1, #BM_CATEGORIES do
                if client.key_state(0x30 + i) and BM_MODULE.cur_cat ~= i then
                    BM_MODULE.cur_cat = i
                    BM_MODULE.last_cat_tick = globals.tickcount()
                    BM_MODULE.click_prev = true
                end
            end
        end

        if client.key_state(0x30) or client.key_state(0x1B) then
            BM_MODULE.cur_cat = 0
            BM_MODULE.last_cat_tick = globals.tickcount()
            BM_MODULE.click_prev = true
        end
    end


    local tab_ty = y + S_F(65, 55)
    local target_tab_x = (BM_MODULE.cur_cat > 0) and (x + S(30) + (BM_MODULE.cur_cat - 1) * tab_w) or x + S(30)
    BM_MODULE.tab_interp_x = lerp(BM_MODULE.tab_interp_x, target_tab_x, ft * 12)
    if BM_MODULE.cur_cat > 0 then
        local line_y = tab_ty + S_F(26, 22)
        renderer.rectangle(BM_MODULE.tab_interp_x, line_y, tab_w - S(10), S(3), accent[1], accent[2], accent[3], 255, 1)
        renderer.rectangle(BM_MODULE.tab_interp_x, line_y + 1, tab_w - S(10), S(5), accent[1], accent[2], accent[3], 60, 1)
    end

    local tab_w = (w - S(40)) / 6
    local _bm_tab_icons = { "pistols", "heavy", "smgs", "rifles", "equip", "grenades" }
    for idx, cat in ipairs(BM_CATEGORIES) do
        local tx = x + S(20) + (idx - 1) * tab_w
        local is_active = (BM_MODULE.cur_cat == idx)
        local tab_a = is_active and 255 or 150
        local tw_t, _ = renderer.measure_text("bd", cat.name)
        renderer.text(tx + (tab_w - tw_t) / 2, tab_ty, 255, 255, 255, tab_a, "bd", 0, cat.name)
    end

    local it_w, it_h = S_F(165, 145), S_F(105, 95)
    local cols = 4
    local start_y = y + S_F(110, 102)

    local grid_full_w = cols * it_w + (cols - 1) * S(12)
    local grid_x_off = x + (w - grid_full_w) / 2

    BM_MODULE.hovered_item = nil

    if BM_MODULE.cur_cat == 0 then
        local cw, ch = S(220), S(140)
        local grid_3_w = 3 * cw + 2 * S(20)
        local h_off = x + (w - grid_3_w) / 2

        for idx, cat in ipairs(BM_CATEGORIES) do
            local col = (idx - 1) % 3
            local row = math.floor((idx - 1) / 3)
            local cx, cy = h_off + col * (cw + S(20)), start_y + row * (ch + S(20))

            local mx, my = ui.mouse_position()
            local hover = (mx >= cx and mx <= cx + cw and my >= cy and my <= cy + ch) and ui.is_menu_open()

            renderer.rectangle(cx, cy, cw, ch, 255, 255, 255, hover and 40 or 20, S(10))
            if hover then
                renderer.rectangle(cx, cy, cw, ch, accent[1], accent[2], accent[3], 30, S(10))
                if not BM_MODULE.click_prev and client.key_state(0x01) then
                    BM_MODULE.cur_cat = idx
                    BM_MODULE.click_prev = true; BM_MODULE.last_cat_tick = globals.tickcount()
                end
            end

            local cat_label_name = cat.name
            local icon_key = _bm_tab_icons[idx]
            local icon_sz  = S_F(28, 22)
            local icon_gap = S(8)

            local cat_label_idx = "[" .. idx .. "] "
            local cn_w_idx, _ = renderer.measure_text("bd", cat_label_idx)
            local cn_w_name, _ = renderer.measure_text("bd", cat_label_name)
            local text_total = cn_w_idx + cn_w_name

            local has_icon = icon_key and HUD.icons._defs[icon_key]
            local content_h = (has_icon and (icon_sz + icon_gap) or 0) + 14
            local content_y = cy + (ch - content_h) / 2

            if has_icon then
                local icon_x = cx + (cw - icon_sz) / 2
                HUD.icons.draw(icon_key, icon_x, content_y, icon_sz, accent[1], accent[2], accent[3], 255)
            end

            local text_y = content_y + (has_icon and (icon_sz + icon_gap) or 0)
            local text_x = cx + (cw - text_total) / 2

            renderer.text(text_x, text_y, accent[1], accent[2], accent[3], 255, "bd", 0, cat_label_idx)
            renderer.text(text_x + cn_w_idx, text_y, 255, 255, 255, 255, "bd", 0, cat_label_name)
        end
    else
        local cur_cat_data = BM_CATEGORIES[BM_MODULE.cur_cat]
        for i_idx, item in ipairs(cur_cat_data.items) do
            local col = (i_idx - 1) % cols
            local row = math.floor((i_idx - 1) / cols)

            local ix, iy = grid_x_off + col * (it_w + S(12)), start_y + row * (it_h + S(12))
            local mx, my = ui.mouse_position()
            local hover = (mx >= ix and mx <= ix + it_w and my >= iy and my <= iy + it_h) and ui.is_menu_open()

            local grow = hover and S(4) or 0
            local g_ix, g_iy, g_iw, g_ih = ix - grow/2, iy - grow/2, it_w + grow, it_h + grow

            if hover then
                BM_MODULE.hovered_item = item
                BM_MODULE.last_valid_hover = item
            end

            local is_owned = false
            local wpn_list = get_weapons(lp)
            for _, w in ipairs(wpn_list) do
                local w_name = w.classname:lower():gsub("^cweapon", ""):gsub("^c", "")
                if item.cmd == w_name or (item.cmd == "glock" and (w_name == "glock" or w_name == "usp")) then is_owned = true; break end
            end
            if not is_owned and item.cmd:find("vest") and entity.get_prop(lp, "m_ArmorValue") > 0 then is_owned = true end

            local label_a = is_owned and 150 or 255
            local label_idx = "[" .. i_idx .. "] "
            local label_name = item.name
            local l_idx_w, _ = renderer.measure_text("bd", label_idx)
            local l_name_w, _ = renderer.measure_text("bd", label_name)
            local it_total_w = l_idx_w + l_name_w

            local price_val = tostring(item.price)
            local pr_d_w, _ = renderer.measure_text("bd", "$")
            local pr_v_w, _ = renderer.measure_text("bd", price_val)
            local pr_total_w = pr_d_w + pr_v_w

            local max_content_w = math.max(it_total_w, pr_total_w) + S(12)

            renderer.rectangle(g_ix, g_iy, g_iw, g_ih, 15, 15, 15, hover and 100 or 60, S(10))

            local plate_h = S_F(38, 32)
            local plate_w = math.max(g_iw - S(10), max_content_w)

            g_iw = math.max(g_iw, plate_w + S(10))
            g_ix = grid_x_off + col * (it_w + S(12)) + (it_w - g_iw) / 2

            local plate_x = g_ix + (g_iw - plate_w) / 2
            local plate_y = g_iy + g_ih - plate_h - S(6)
            renderer.rectangle(plate_x, plate_y, plate_w, plate_h, 10, 10, 10, 230, S(4))

            if hover then
                renderer.rectangle(g_ix, g_iy, g_iw, g_ih, accent[1], accent[2], accent[3], 40, S(8))
                surface.draw_outlined_rect(g_ix-1, g_iy-1, g_iw+2, g_ih+2, 0, 0, 0, 100)
            end

            local alt_down = client.key_state(0x12)
            local key_down = client.key_state(0x30 + i_idx)
            local can_key_buy = key_down and not alt_down and not BM_MODULE.click_prev and BM_MODULE.cur_cat > 0

            if can_key_buy and globals.tickcount() - BM_MODULE.last_cat_tick < 10 then
                can_key_buy = false
            end

            if ( (hover and client.key_state(0x01)) or can_key_buy ) and not is_owned and not BM_MODULE.click_prev then
                client.exec("buy " .. item.cmd)
                BM_MODULE.click_prev = true
            end

            if success_img and images.get_weapon_icon then
                local wc = (item.cmd == "glock") and "weapon_glock" or (item.cmd:find("vest") and (item.cmd=="vest" and "item_kevlar" or "item_assaultsuit") or (not item.cmd:find("weapon_") and "weapon_"..item.cmd or item.cmd))
                local img = images.get_weapon_icon(wc)
                if img then
                    local mw, mh = img:measure()
                    local icon_h = S(32) + grow
                    local icon_w = math.ceil(mw * (icon_h / mh))

                    local available_space = plate_y - g_iy
                    local icon_y = g_iy + (available_space - icon_h) / 2 + S(2)

                    img:draw(g_ix + (g_iw - icon_w)/2, icon_y, icon_w, icon_h, 255, 255, 255, is_owned and 120 or 255)
                end
            end

            local it_tx = plate_x + (plate_w - it_total_w)/2
            local it_ty = plate_y + S(5)

            renderer.text(it_tx, it_ty, br_accent[1], br_accent[2], br_accent[3], label_a, "bd", 0, label_idx)
            renderer.text(it_tx + l_idx_w, it_ty, 255, 255, 255, label_a, "bd", 0, label_name)

            local pr_tx = plate_x + (plate_w - pr_total_w)/2
            local pr_ty = it_ty + S_F(17, 13)

            renderer.text(pr_tx, pr_ty, 120, 200, 80, label_a, "bd", 0, "$")
            renderer.text(pr_tx + pr_d_w, pr_ty, 255, 255, 255, math.floor(label_a * 0.9), "bd", 0, price_val)
        end
    end

    if BM_MODULE.hovered_item and WEAPON_STATS[BM_MODULE.hovered_item.cmd] then
        BM_MODULE.sideboard_anim = math.min(1, BM_MODULE.sideboard_anim + ft * 8)
    else
        BM_MODULE.sideboard_anim = math.max(0, BM_MODULE.sideboard_anim - ft * 8)
    end

    if BM_MODULE.sideboard_anim > 0.01 then
        local active_item = BM_MODULE.hovered_item or BM_MODULE.last_valid_hover
        if active_item and WEAPON_STATS[active_item.cmd] then
            local sb_w = S(220)
            local sx = x + w + S(10) - (1.0 - BM_MODULE.sideboard_anim) * S(30)
            local stats = WEAPON_STATS[active_item.cmd] or {dmg=0.5, acc=0.5, pen=0.5, rate=0.5, mob=0.5}
            local sa = math.floor(255 * BM_MODULE.sideboard_anim)

            renderer.rectangle(sx, y, sb_w, h, 15, 15, 15, math.floor(180 * BM_MODULE.sideboard_anim), S(12))
            renderer.text(sx + S(20), y + S(22), 255, 255, 255, sa, "bd", 0, "Stats")

            local s_labels = { {k="dmg", n="DAMAGE"}, {k="rate", n="RATE"}, {k="acc", n="ACCURACY"}, {k="pen", n="PENETR."}, {k="mob", n="MOBILITY"} }
            for i, s in ipairs(s_labels) do
                local sy = y + S(70) + (i-1) * S(55)
                surface.draw_text(sx + S(20), sy, 200, 200, 200, sa, BM_FONT_MAIN, s.n)
                local val = stats[s.k] or 0.5
                renderer.rectangle(sx + S(20), sy + S(20), sb_w - S(40), S(6), 30, 30, 30, sa, 1)
                renderer.rectangle(sx + S(20), sy + S(20), (sb_w - S(40)) * val, S(6), accent[1], accent[2], accent[3], sa, 1)
            end
        end
    end

    local qb_y = y + h - S_F(68, 62)
    renderer.rectangle(x + S(25), qb_y, w - S(50), S_F(45, 40), 15, 15, 15, 180, S(8))
    local function draw_preset(px, label, cmds)
        local pw = S(150)
        local mx, my = ui.mouse_position()
        local hover = (mx >= px and mx <= px + pw and my >= qb_y + S(8) and my <= qb_y + S(38)) and ui.is_menu_open()
        renderer.rectangle(px, qb_y + S(8), pw, S(30), accent[1], accent[2], accent[3], hover and 180 or 80, S(6))
        local tw, _ = renderer.measure_text("bd", label)
        renderer.text(px + (pw - tw)/2, qb_y + S(15), 255, 255, 255, 255, "bd", 0, label)
        if hover and not BM_MODULE.click_prev and client.key_state(0x01) then
            for _, c in ipairs(cmds) do client.exec("buy " .. c) end
            BM_MODULE.click_prev = true
        end
    end

    local preset_w = S(150) * 2 + S(15)
    local preset_start_x = x + (w - preset_w) / 2
    draw_preset(preset_start_x, "FULL BUY", {"scar20", "g3sg1", "vesthelm", "hegrenade", "molotov", "incgrenade", "smokegrenade", "defuser"})
    draw_preset(preset_start_x + S(165), "PISTOL ECO", {"p250", "vest"})

    BM_MODULE.click_prev = client.key_state(0x01)
end


local function lerp(a, b, t) return a + (b - a) * t end

local _pan_reader_debug = false
local _pan_score_cache = { t = 0, ct = 0, tick = -999, valid = false }
local function _read_scores_panorama()
    if not pan_ok then return nil, nil end
    local ok, result = pcall(function()
        return pan.load_string([[
            try {
                return '' + GameStateAPI.GetTeamScore(2) + '-' + GameStateAPI.GetTeamScore(3);
            } catch(e) {
                return 'ERR';
            }
        ]])()
    end)
    if not _pan_reader_debug then
        _pan_reader_debug = true
        _log("[V-HUD] pan reader: ok=" .. tostring(ok) .. " type=" .. type(result) .. " val=[" .. tostring(result) .. "]")
    end
    if ok and result then
        local s = tostring(result)
        local t_str, ct_str = s:match("(%d+)%-(%d+)")
        if t_str then
            return tonumber(t_str), tonumber(ct_str)
        end
    end
    return nil, nil
end

local _score_debug_done = false
local function get_team_scores()
    local ts, cs = nil, nil

    local teams = entity.get_all("CCSTeam")
    for i = 1, #teams do
        local t = teams[i]
        local n = entity.get_prop(t, "m_iTeamNum") or 0
        local s = entity.get_prop(t, "m_scoreTotal")
                or entity.get_prop(t, "m_iScore")
        if s ~= nil then
            if     n == 2 then ts = s
            elseif n == 3 then cs = s
            elseif n == 0 or n == nil then
                if     i == 3 then ts = s
                elseif i == 4 then cs = s end
            end
        end
    end

    if (ts == nil or cs == nil) and pan_ok then
        local tick = globals.tickcount() or 0
        if (tick - _pan_score_cache.tick) >= 16 then
            local pt, pct = _read_scores_panorama()
            if pt ~= nil and pct ~= nil then
                _pan_score_cache.t     = pt
                _pan_score_cache.ct    = pct
                _pan_score_cache.valid = true
            end
            _pan_score_cache.tick = tick
        end
        if _pan_score_cache.valid then
            ts = ts or _pan_score_cache.t
            cs = cs or _pan_score_cache.ct
        end
    end

    if (not ts) or (not cs) then
        ts = ts or G_TRACKED_SCORES.t
        cs = cs or G_TRACKED_SCORES.ct
    end

    if ts and ts > G_TRACKED_SCORES.t then G_TRACKED_SCORES.t = ts end
    if cs and cs > G_TRACKED_SCORES.ct then G_TRACKED_SCORES.ct = cs end

    return ts or 0, cs or 0
end

local function fetch_icon(ent, cls)
    if not images or not images.get_weapon_icon then return nil end
    local item_def = bit.band(entity.get_prop(ent, "m_iItemDefinitionIndex") or 0, 0xFFFF)
    local icon = nil
    pcall(function() icon = images.get_weapon_icon(item_def) end)
    if icon then return icon end
    if cls then
        local cn = "weapon_" .. cls:lower():gsub("^cweapon", ""):gsub("^c", "")
        pcall(function() icon = images.get_weapon_icon(cn) end)
    end
    return icon
end

function INTEL_MODULE.draw()
    if not ui.get(ui_intel_toggle) or not ui.get(ui_main_enable) then return end

    local sw, sh = client.screen_size()
    local ft = globals.frametime()
    local is_alive = entity.is_alive(entity.get_local_player())

    if is_alive then
        INTEL_MODULE.anim_alpha = math.min(1, INTEL_MODULE.anim_alpha + ft * 4)
    else
        INTEL_MODULE.anim_alpha = math.max(0.6, INTEL_MODULE.anim_alpha - ft * 2)
    end

    if INTEL_MODULE.anim_alpha <= 0 then return end

    local ar, ag, ab, ap = get_dynamic_accent()
    local a = math.floor(255 * INTEL_MODULE.anim_alpha)

    HUD.icons._defs["hs"] = _svg('<circle cx="12" cy="12" r="9" fill="none" stroke="white" stroke-width="2"/><circle cx="12" cy="12" r="2" fill="white"/><line x1="12" y1="1" x2="12" y2="6" stroke="white" stroke-width="1.5"/><line x1="12" y1="18" x2="12" y2="23" stroke="white" stroke-width="1.5"/><line x1="1" y1="12" x2="6" y2="12" stroke="white" stroke-width="1.5"/><line x1="18" y1="12" x2="23" y2="12" stroke="white" stroke-width="1.5"/>') 
    local bh = S(24)
    local _icon_sz_probe = math.max(8, math.floor(bh - S(10)))
    local _icon_probe_w  = _icon_sz_probe + math.floor(S(3))
    local function _probe_bw(lbl, val)
        local lw2 = surface.get_text_size(font_hp_ap, lbl .. ":")
        local vw2 = surface.get_text_size(font_hp_ap, val)
        return _icon_probe_w + lw2 + math.floor(S(4)) + vw2 + S(16)
    end
    local adr_str = string.format("%.0f",  INTEL_MODULE.adr)
    local kd_str  = string.format("%.2f",  INTEL_MODULE.kd)
    local hs_str  = string.format("%.0f%%", INTEL_MODULE.hs_pct)
    local bw = math.max(S(70),
        _probe_bw("ADR", adr_str),
        _probe_bw("K/D", kd_str),
        _probe_bw("HS%", hs_str))
    bw = math.ceil(bw)
    local total_w = (bw * 3) + (S(4) * 2)
    local x, y = HUD.editor.pos("intel", (sw - total_w) / 2, sh - S(40.5))
    HUD.editor.bbox("intel", x, y, total_w, bh)

    local function draw_intel_box(bx, by, label, value, val_r, val_g, val_b, icon_name)
        surface.draw_filled_rect(bx, by, bw, bh, 15, 15, 15, math.floor(140 * INTEL_MODULE.anim_alpha))
        surface.draw_outlined_rect(bx, by, bw, bh, 40, 40, 40, math.floor(150 * INTEL_MODULE.anim_alpha))

        local l_str = label .. ":"
        local v_str = tostring(value)
        local lw, lh = surface.get_text_size(font_hp_ap, l_str)
        local vw, vh = surface.get_text_size(font_hp_ap, v_str)

        local icon_sz = math.floor(bh - S(10))
        if icon_sz < 8 then icon_sz = 8 end
        local icon_w = (icon_name and HUD.icons._defs[icon_name]) and (icon_sz + S(3)) or 0
        local total_tw = icon_w + lw + S(4) + vw
        local start_tx = bx + (bw - total_tw) / 2
        local cur_x = start_tx

        if icon_w > 0 then
            local icon_y = by + math.floor((bh - icon_sz) / 2) - 1
            HUD.icons.draw(icon_name, cur_x, icon_y, icon_sz, val_r, val_g, val_b,
                math.floor(255 * INTEL_MODULE.anim_alpha))
            cur_x = cur_x + icon_w
        end

        surface.draw_text(cur_x + 1, by + (bh - lh) / 2, 0, 0, 0, math.floor(200 * INTEL_MODULE.anim_alpha), font_hp_ap, l_str)
        surface.draw_text(cur_x + lw + S(4) + 1, by + (bh - vh) / 2, 0, 0, 0, math.floor(200 * INTEL_MODULE.anim_alpha), font_hp_ap, v_str)

        surface.draw_text(cur_x, by + (bh - lh) / 2 - 1, 255, 255, 255, a, font_hp_ap, l_str)
        surface.draw_text(cur_x + lw + S(4), by + (bh - vh) / 2 - 1, val_r, val_g, val_b, a, font_hp_ap, v_str)
    end

    draw_intel_box(x, y, "ADR", adr_str, 255, 255, 255, "adr")
    draw_intel_box(x + bw + 4, y, "K/D", kd_str, ar, ag, ab, "dmg")
    draw_intel_box(x + (bw + 4) * 2, y, "HS%", hs_str, 255, 255, 255, "hs")
end


local function draw_round_end()
    if not G_ROUND_INFO.active then return end
    local sw, sh = client.screen_size()
    local ct = globals.curtime()
    local elapsed = ct - G_ROUND_INFO.start_time
    if elapsed > G_ROUND_INFO.duration then
        G_ROUND_INFO.active = false
        return
    end

    local f_alpha = 255
    if elapsed < 0.5 then f_alpha = (elapsed / 0.5) * 255
    elseif elapsed > G_ROUND_INFO.duration - 0.5 then f_alpha = ((G_ROUND_INFO.duration - elapsed) / 0.5) * 255 end
    local alpha = math.floor(f_alpha)

    local has_mvp = G_ROUND_INFO.mvp_name ~= ""
    local w, h = S(320), has_mvp and S(90) or S(45)
    local x, y = (sw - w) / 2, S(100)
    y = y + (1.0 - (f_alpha/255)) * S(-20)

    surface.draw_filled_rect(x, y, w, h, 15, 15, 15, math.floor(160 * alpha / 255))
    surface.draw_outlined_rect(x, y, w, h, 40, 40, 40, math.floor(150 * alpha / 255))

    local winner_text = "ROUND DRAW"
    local wr, wg, wb = 200, 200, 200
    if G_ROUND_INFO.winner == 2 then
        winner_text = "TERRORISTS WIN"
        wr, wg, wb = 255, 200, 100
    elseif G_ROUND_INFO.winner == 3 then
        winner_text = "COUNTER-TERRORISTS WIN"
        wr, wg, wb = 150, 200, 255
    end

    local tw, th = surface.get_text_size(font_main, winner_text)
    surface.draw_text(x + (w - tw) / 2 + 1, y + 10 + 1, 0, 0, 0, math.floor(200 * alpha / 255), font_main, winner_text)
    surface.draw_text(x + (w - tw) / 2, y + 10, wr, wg, wb, alpha, font_main, winner_text)

    if has_mvp then
        surface.draw_filled_rect(x + S(20), y + S(35), w - S(40), S(1), 40, 40, 40, math.floor(100 * alpha/255))

        local avatar_size = S(36)
        local ax, ay = x + S(20), y + S(45)
        if G_ROUND_INFO.mvp_avatar then
            pcall(function()
                local avatar = G_ROUND_INFO.mvp_avatar
                if type(avatar) == "table" and avatar.draw then
                    avatar:draw(ax, ay, avatar_size, avatar_size, 255, 255, 255, alpha)
                else
                    renderer.texture(avatar, ax, ay, avatar_size, avatar_size, 255, 255, 255, alpha)
                end
            end)
        else
            surface.draw_filled_rect(ax, ay, avatar_size, avatar_size, 30, 30, 30, alpha)
        end
        surface.draw_outlined_rect(ax, ay, avatar_size, avatar_size, 60, 60, 60, alpha)

        local tx = ax + avatar_size + S(12)
        local l_off = S(40)
        surface.draw_text(tx + 1, ay + S(2) + 1, 0, 0, 0, math.floor(200 * alpha / 255), font_main, "MVP:")
        surface.draw_text(tx, ay + S(2), 255, 255, 255, alpha, font_main, "MVP:")

        surface.draw_text(tx + l_off + 1, ay + S(2) + 1, 0, 0, 0, math.floor(200 * alpha / 255), font_main, G_ROUND_INFO.mvp_name)
        surface.draw_text(tx + l_off, ay + S(2), 255, 255, 255, alpha, font_main, G_ROUND_INFO.mvp_name)

        surface.draw_text(tx + 1, ay + S(20) + 1, 0, 0, 0, math.floor(200 * alpha / 255), font_main, "K/D:")
        surface.draw_text(tx, ay + S(20), 180, 180, 180, alpha, font_main, "K/D:")

        surface.draw_text(tx + l_off + 1, ay + S(20) + 1, 0, 0, 0, math.floor(200 * alpha / 255), font_main, G_ROUND_INFO.mvp_kd)
        surface.draw_text(tx + l_off, ay + S(20), 180, 180, 180, alpha, font_main, G_ROUND_INFO.mvp_kd)
    end
    surface.draw_filled_rect(x, y + h - 2, w, 2, wr, wg, wb, alpha)
end

local function draw_crosshair()
    if not ui.get(ui_crosshair_enable) then return end
    local lp = entity.get_local_player()
    if not lp or not entity.is_alive(lp) then return end

    local sw, sh = client.screen_size()
    local cx, cy = sw / 2, sh / 2

    local r, g, b, a = ui.get(ui_crosshair_color)
    local gap = S(ui.get(ui_crosshair_gap))
    local length = S(ui.get(ui_crosshair_len))
    local thick = S(ui.get(ui_crosshair_thick))
    local dot = ui.get(ui_crosshair_dot)
    local out = ui.get(ui_crosshair_out)
    local or_, og, ob, oa = ui.get(ui_crosshair_out_c)

    if ui.get(ui_crosshair_dynamic) then
        local wpn = entity.get_player_weapon(lp)
        if wpn then
            local inacc = entity.get_prop(wpn, "m_fAccuracyPenalty") or 0
            gap = gap + math.floor(inacc * 100)
        end
        local vx, vy = entity.get_prop(lp, "m_vecVelocity")
        local speed = math.sqrt(vx*vx + vy*vy)
        gap = gap + math.floor(speed / 20)
    end

    local function draw_rect_out(x, y, w, h, dr, dg, db, da)
        if out then
            surface.draw_filled_rect(x - 1, y - 1, w + 2, h + 2, or_, og, ob, oa)
        end
        surface.draw_filled_rect(x, y, w, h, dr, dg, db, da)
    end

    if dot then
        local ds = S(ui.get(ui_crosshair_dotsize))
        draw_rect_out(cx - ds/2, cy - ds/2, ds, ds, r, g, b, a)
    end

    draw_rect_out(cx - gap - length, cy - thick/2, length, thick, r, g, b, a)
    draw_rect_out(cx + gap, cy - thick/2, length, thick, r, g, b, a)
    draw_rect_out(cx - thick/2, cy - gap - length, thick, length, r, g, b, a)
    draw_rect_out(cx - thick/2, cy + gap, thick, length, r, g, b, a)
end

tokenize_console_line = function(line, player_ent)
    local tokens = {}
    if not line or line == "" then return tokens end

    local theme_name = ui.get(ui_con_theme) or "Default"
    local theme = THEMES[theme_name] or THEMES["Default"]
    local colors = theme.syntax

    local matches = {}
    local p_name = player_ent and entity.get_player_name(player_ent)

    local gs_pos = 1
    while true do
        local b, e = line:lower():find('gamesense', gs_pos)
        if not b then break end
        table.insert(matches, { s = b, e = e, type = "gs_prefix", priority = 3500 })
        gs_pos = e + 1
    end

    do
        local line_l = line:lower()
        local seen = {}
        local entries = HUD and HUD._player_name_cache or nil
        if not entries or #entries == 0 then
            entries = {}
            pcall(function()
                if player_ent then
                    local nm = entity.get_player_name(player_ent)
                    if nm and #nm > 1 then entries[#entries+1] = { ent = player_ent, name = nm } end
                end
                local all = entity.get_players and entity.get_players(true) or {}
                for _, pe in ipairs(all) do
                    if pe ~= player_ent then
                        local nm = entity.get_player_name(pe)
                        if nm and #nm > 1 then entries[#entries+1] = { ent = pe, name = nm } end
                    end
                end
                table.sort(entries, function(a, b) return #a.name > #b.name end)
            end)
            if HUD then HUD._player_name_cache = entries end
        end
        for _, pe in ipairs(entries) do
            local nm_l = pe.name:lower()
            if nm_l ~= "" and not seen[nm_l] then
                seen[nm_l] = true
                local p_pos = 1
                while true do
                    local b, e = line_l:find(nm_l, p_pos, true)
                    if not b then break end
                    table.insert(matches, { s = b, e = e, type = "player", priority = 3000, ent = pe.ent })
                    p_pos = e + 1
                end
            end
        end
    end

    local g_pos = 1
    while true do
        local b, e = line:find('[%[%]]', g_pos)
        if not b then break end
        table.insert(matches, { s = b, e = e, type = "tag", priority = 600 })
        g_pos = e + 1
    end

    local s_pos = 1
    while true do
        local b, e = line:find('%b""', s_pos)
        if not b then break end
        table.insert(matches, { s = b, e = e, type = "string", priority = 500 })
        s_pos = e + 1
    end

    local n_pos = 1
    while true do
        local b, e = line:find("%d+%.?%d*", n_pos)
        if not b then break end
        local cb = b > 1 and line:sub(b-1, b-1) or " "
        local ca = e < #line and line:sub(e+1, e+1) or " "
        if not cb:match("%a") and not ca:match("%a") then
            table.insert(matches, { s = b, e = e, type = "number", priority = 100 })
        end
        n_pos = e + 1
    end

    for _, word in ipairs({"true", "false", "nil"}) do
        local b_p = 1
        while true do
            local b, e = line:find("%f[%a]" .. word .. "%f[%A]", b_p)
            if not b then break end
            table.insert(matches, { s = b, e = e, type = word, priority = 200 })
            b_p = e + 1
        end
    end

    for _, cmd in ipairs(CMDS) do
        local b_p = 1
        while true do
            local b, e = line:find("%f[%a]" .. cmd .. "%f[%A]", b_p)
            if not b then break end
            table.insert(matches, { s = b, e = e, type = "keyword", priority = 50 })
            b_p = e + 1
        end
    end

    local t_p = 1
    while true do
        local b, e = line:find("[%%[%]%@%:%=]", t_p)
        if not b then break end
        table.insert(matches, { s = b, e = e, type = "tag", priority = 300 })
        t_p = e + 1
    end

    table.sort(matches, function(a, b)
        if a.s == b.s then return a.priority > b.priority end
        return a.s < b.s
    end)

    local final = {}; local last_e = 0
    for _, m in ipairs(matches) do
        if m.s > last_e then table.insert(final, m); last_e = m.e end
    end

    local lp = 1
    for _, m in ipairs(final) do
        if m.s > lp then table.insert(tokens, { text = line:sub(lp, m.s - 1), type = "default" }) end
        table.insert(tokens, { text = line:sub(m.s, m.e), type = m.type, ent = m.ent })
        lp = m.e + 1
    end
    if lp <= #line then table.insert(tokens, { text = line:sub(lp), type = "default" }) end

    return tokens
end

local function apply_console_freeze(active)
    if active then
        local cur_sens = tonumber(client.get_cvar("sensitivity")) or 1.0
        if cur_sens ~= 0 then ORIG_SENS = cur_sens end
        client.set_cvar("sensitivity", 0)
        if pan_ok then
            pcall(function()
                pan.load_string([[
                    ["ScoreboardContainer", "Scoreboard", "ScoreboardRoot"].forEach(function(id) {
                        var p = $.GetContextPanel().GetRoot().FindChildTraverse(id);
                        if (p) p.style.visibility = "collapse";
                    });
                ]])()
            end)
        end
        client.exec("-showscores")
    else
        client.set_cvar("sensitivity", ORIG_SENS or 1.0)
        if pan_ok then
            pcall(function()
                pan.load_string([[
                    ["ScoreboardContainer", "Scoreboard", "ScoreboardRoot"].forEach(function(id) {
                        var p = $.GetContextPanel().GetRoot().FindChildTraverse(id);
                        if (p) p.style.visibility = "visible";
                    });
                ]])()
            end)
        end
        client.exec("-showscores")
        client.exec("alias +showscores; alias -showscores")
    end
end

local function draw_console()
    if CON_MODULE.anim_alpha <= 0 then return end

    local theme_name = ui.get(ui_con_theme) or "Default"
    local sw, sh = client.screen_size()

    local w, h = S(CONSOLE_W), S(CONSOLE_H)
    w = math.max(450, w)
    h = math.max(300, h)
    local is_custom = theme_name == "Custom"
    if is_custom then
        w = S(ui.get(ui_con_cust_w))
        h = S(ui.get(ui_con_cust_h))
    end

    local alpha_pct = CON_MODULE.anim_alpha
    local text_a = math.floor(255 * alpha_pct)

    local y_off = (1.0 - alpha_pct) * S(-20)

    local pos = HUD.state and HUD.state._positions and HUD.state._positions.console
    local default_x = (sw - w) / 2
    local default_y = (sh - h) / 2
    local x = (pos and tonumber(pos.x)) or default_x
    local y = ((pos and tonumber(pos.y)) or default_y) + y_off
    x = math.max(0, math.min(sw - w, x))
    y = math.max(0, math.min(sh - h, y))

    local theme = THEMES[theme_name] or THEMES["Default"]
    local br, bg, bb, ba
    local ar, ag, ab, ap = get_dynamic_accent()

    local mx, my = ui.mouse_position()
    local mouse_left = client.key_state(0x01)
    local mouse_right = client.key_state(0x02)

    if is_custom then
        br, bg, bb, ba = ui.get(ui_con_cust_bg)
        local cr, cg, cb = ui.get(ui_con_cust_acc)
        ar, ag, ab = cr, cg, cb
    else
        local theme = THEMES[theme_name] or THEMES["Default"]
        br, bg, bb = theme.bg[1], theme.bg[2], theme.bg[3]
        ba = HUD_THEME.a
        local cr, cg, cb = ui.get(ui_con_color)
        ar, ag, ab = cr, cg, cb
    end

    local glow_a = math.floor(200 * alpha_pct * ap)

    local show_shadow = is_custom and ui.get(ui_con_cust_shad)
    if show_shadow then
        surface.draw_filled_rect(x - 4, y - 4, w + 8, h + 8, 0, 0, 0, math.floor(30 * alpha_pct))
        surface.draw_filled_rect(x - 2, y - 2, w + 4, h + 4, 0, 0, 0, math.floor(60 * alpha_pct))
    end

    local cur_a = math.floor(ba * alpha_pct)
    local br_final, bg_final, bb_final, ba_final = br, bg, bb, cur_a

    if theme_name == "Gamesensical" then
        br_final, bg_final, bb_final, ba_final = 12, 12, 12, math.floor(160 * alpha_pct)
    end

    surface.draw_filled_rect(x, y, w, h, br_final, bg_final, bb_final, ba_final)

    surface.draw_outlined_rect(x, y, w, h, 40, 40, 40, math.floor(180 * alpha_pct))
    surface.draw_outlined_rect(x + 1, y + 1, w - 2, h - 2, 255, 255, 255, math.floor(15 * alpha_pct))

    surface.draw_filled_rect(x, y, w, S(25), br_final + 10, bg_final + 10, bb_final + 10, ba_final)

    CON_MODULE._drag = CON_MODULE._drag or { active = false, off_x = 0, off_y = 0 }
    local header_hit = (mx >= x and mx <= x + w - S(28) and my >= y and my <= y + S(25)) and CON_MODULE.active

    if CON_MODULE._drag.active then
        local nx = mx - CON_MODULE._drag.off_x
        local ny = my - CON_MODULE._drag.off_y
        nx = math.max(0, math.min(sw - w, nx))
        ny = math.max(0, math.min(sh - h, ny))
        HUD.state._positions.console = { x = nx, y = ny }
        if not mouse_left then
            CON_MODULE._drag.active = false
            if HUD and HUD.mark_dirty then HUD.mark_dirty() end
        end
    elseif mouse_left and not MOUSE_DOWN_PREV and header_hit then
        CON_MODULE._drag.active = true
        CON_MODULE._drag.off_x = mx - x
        CON_MODULE._drag.off_y = my - y
    end

    do
        local btn_size = S(18)
        local bx = x + w - btn_size - S(4)
        local by = y + S(4)
        local b_hover = (mx >= bx and mx <= bx + btn_size and my >= by and my <= by + btn_size) and CON_MODULE.active
        local bg_a = b_hover and 220 or 0
        surface.draw_filled_rect(bx, by, btn_size, btn_size, 200, 60, 60, math.floor(bg_a * alpha_pct))

        local cx = math.floor(bx + btn_size / 2)
        local cy = math.floor(by + btn_size / 2)
        local arm = math.max(3, math.floor(btn_size / 2) - math.max(2, S(3)))
        local function _x(off)
            surface.draw_line(cx - arm + off, cy - arm, cx + arm + off, cy + arm, 230, 230, 230, text_a)
            surface.draw_line(cx + arm + off, cy - arm, cx - arm + off, cy + arm, 230, 230, 230, text_a)
        end
        _x(0); _x(1)

        if b_hover and mouse_left and not MOUSE_DOWN_PREV then
            CON_MODULE.active = false
            if not (BM_MODULE and BM_MODULE.is_open) then
                apply_console_freeze(false)
            end
        end
    end

    local sense_r, sense_g, sense_b
    if is_custom then
        sense_r, sense_g, sense_b = ui.get(ui_con_cust_acc)
    else
        sense_r, sense_g, sense_b = ui.get(ui_con_color)
    end

    if theme_name == "Gamesensical" then
        local ok = pcall(draw_gs_header, x, y, w)
        if not ok then
            surface.draw_outlined_rect(x, y, w, S(25), 40, 40, 40, math.floor(150 * alpha_pct))
        end
    else
        surface.draw_outlined_rect(x, y, w, S(25), 40, 40, 40, math.floor(150 * alpha_pct))
    end
    draw_text_safe(x + S(8), y + S(5), 255, 255, 255, text_a, font_main, "Game")
    do
        local tw, _ = get_text_size_safe(font_main, "Game")
        draw_text_safe(x + S(8) + tw, y + S(5), sense_r, sense_g, sense_b, text_a, font_main, "Sense")
    end

    local use_glow = is_custom and ui.get(ui_con_cust_glow)
    if use_glow then
        draw_glow_line(x, y + S(26), x + w, y + S(26), ar, ag, ab, glow_a, S(2))
    elseif theme_name == "Gamesensical" then
        local seg = w / 4
        local a = math.floor(255 * alpha_pct)
        surface.draw_filled_gradient_rect(x,           y + S(26), seg, S(1),  59, 175, 222, a, 202,  70, 205, a, true)
        surface.draw_filled_gradient_rect(x + seg,     y + S(26), seg, S(1), 202,  70, 205, a, 201, 227,  58, a, true)
        surface.draw_filled_gradient_rect(x + seg * 2, y + S(26), seg, S(1), 201, 227,  58, a, 255, 140,  50, a, true)
        surface.draw_filled_gradient_rect(x + seg * 3, y + S(26), seg, S(1), 255, 140,  50, a, 255,  50,  50, a, true)
    else
        local hp_pulse = math.sin(globals.realtime() * 2) * 50 + 200
        surface.draw_line(x, y + S(26), x + w, y + S(26), ar, ag, ab, math.floor(hp_pulse * alpha_pct))
    end

    PAN_MODULE.update(x, y, w, h, alpha_pct)

    local tab_names = {"log", "chat", "history", "system"}
    local tab_x = x + S(10); local tab_y = y + S(33)
    local tab_padding = S(15)
    local mx, my = ui.mouse_position()
    local is_hovering_any = false

    for i, name in ipairs(tab_names) do
        local tw, th = surface.get_text_size(font_con, name)
        local is_active = (CON_MODULE.active_tab == name)
        local color = is_active and {ar, ag, ab} or {140, 140, 140}

        local icon_sz = math.floor(th)
        if icon_sz < 10 then icon_sz = 10 end
        local icon_gap = S(4)
        local icon_w   = (HUD.icons._defs[name]) and (icon_sz + icon_gap) or 0

        local hx, hy, hw, hh = tab_x - S(10), tab_y - S(4), icon_w + tw + S(20), th + S(8)
        local is_hover = (mx >= hx and mx <= hx + hw and my >= hy and my <= hy + hh)
        if is_hover and alpha_pct > 0.9 then
            is_hovering_any = true
            if not is_active then color = {220, 220, 220} end
            if client.key_state(0x01) and not MOUSE_DOWN_PREV then
                CON_MODULE.active_tab = name
                if HUD and HUD.mark_dirty then HUD.mark_dirty() end
            end
            if mouse_right and not CON_MODULE._rmb_prev then
                CON_MODULE.tabs[name] = {}
                CON_MODULE.scroll_indices[name] = 0
                HUD_LOG("[console] tab '" .. name .. "' cleared.", 200, 200, 150, true, nil, nil, "system")
            end
        end

        local text_a = math.floor(255 * alpha_pct)

        if is_active then
            surface.draw_filled_rect(tab_x - S(8), tab_y - S(2), icon_w + tw + S(16), th + S(4), ar, ag, ab, math.floor(35 * alpha_pct))
        end

        if icon_w > 0 then
            HUD.icons.draw(name, tab_x, tab_y, icon_sz, color[1], color[2], color[3], text_a)
        end
        draw_text_safe(tab_x + icon_w, tab_y, color[1], color[2], color[3], text_a, font_con, name)
        tab_x = tab_x + icon_w + tw + S(tab_padding)
    end
    MOUSE_DOWN_PREV = client.key_state(0x01)
    CON_MODULE._rmb_prev = mouse_right


    local show_lines = is_custom and ui.get(ui_con_cust_line)
    if show_lines then
        for i = 0, h - S(25), S(4) do
            surface.draw_filled_rect(x, y + S(25) + i, w, S(1), 0, 0, 0, math.floor(20 * alpha_pct))
        end
    end


    local players = entity.get_players()
    local name_map = {}
    for _, p in ipairs(players) do
        local n = entity.get_player_name(p)
        if n then name_map[n:upper()] = true end
    end

    local start_y = y + S(55)
    local _, con_th = surface.get_text_size(font_con, "W")
    local line_h = con_th + S(4)
    local max_lines = math.floor((h - S(95)) / line_h)
    CON_MODULE.max_lines = max_lines
    local t = CON_MODULE.active_tab or "log"
    if not CON_MODULE.tabs[t] then t = "log" end

    local tab_data = CON_MODULE.tabs[t]
    if CON_MODULE.search_active and CON_MODULE.search_text ~= "" then
        local q = CON_MODULE.search_text:lower()
        local filtered = {}
        for i = 1, #tab_data do
            local m = tab_data[i]
            if m and m.text and m.text:lower():find(q, 1, true) then
                filtered[#filtered + 1] = m
            end
        end
        tab_data = filtered
    end
    local s_idx = CON_MODULE.scroll_indices[t] or 0
    if CON_MODULE.search_active then s_idx = 0 end
    local start_idx = math.max(1, #tab_data - s_idx - max_lines + 1)
    local count = 0

    for i = start_idx, #tab_data do
        if count >= max_lines then break end
        if i > #tab_data - s_idx then break end

        local msg = tab_data[i]
        if not msg then break end
        local line_y = start_y + count*line_h
        local text_a = math.floor(255 * alpha_pct)

        if i % 2 == 0 then
            surface.draw_filled_rect(x, line_y - 1, w, line_h, 255, 255, 255, math.floor(5 * alpha_pct))
        end

        local time_str = "[" .. (msg.time or "--:--:--") .. "] "
        local tw_time, _ = get_text_size_safe(font_con, time_str)

        local _, con_th = surface.get_text_size(font_con, "W")
        local line_v_off = (line_h - con_th) / 2
        local draw_y = line_y + line_v_off

        draw_text_safe(x + S(10), draw_y, 255, 255, 100, math.floor(120 * alpha_pct), font_con, time_str)

        local curr_x = x + S(10) + tw_time

        local _msg_max_right = x + w - S(10)
        local _ellipsis      = "\xE2\x80\xA6"
        local _ell_w         = get_text_size_safe(font_con, _ellipsis)
        local _line_truncated = false
        local function _draw_clipped(txt, tr, tg, tb, ta)
            if _line_truncated or not txt or txt == "" then return end
            local w_tok = get_text_size_safe(font_con, txt)
            if curr_x + w_tok <= _msg_max_right then
                draw_text_safe(curr_x, draw_y, tr, tg, tb, ta, font_con, txt)
                curr_x = curr_x + w_tok
                return
            end
            local p, last_p, last_w = 0, 0, 0
            while p < #txt do
                local np = utf8_next(txt, p)
                local sw_ = get_text_size_safe(font_con, txt:sub(1, np))
                if curr_x + sw_ + _ell_w > _msg_max_right then break end
                last_p, last_w = np, sw_
                p = np
            end
            if last_p > 0 then
                local sub = txt:sub(1, last_p)
                draw_text_safe(curr_x, draw_y, tr, tg, tb, ta, font_con, sub)
                curr_x = curr_x + last_w
            end
            if curr_x + _ell_w <= _msg_max_right then
                draw_text_safe(curr_x, draw_y, 160, 160, 160, ta, font_con, _ellipsis)
                curr_x = curr_x + _ell_w
            end
            _line_truncated = true
        end

        local theme_name = ui.get(ui_con_theme) or "Default"
        local theme = THEMES[theme_name] or THEMES["Default"]
        local is_error = msg.text:find("%[LUA ERROR%]") ~= nil

        if not msg.accent_word then
            local need_retok = not msg.tokens or #msg.tokens == 0
            if not need_retok then
                local has_player = false
                for _, tk in ipairs(msg.tokens) do
                    if tk.type == "player" then has_player = true; break end
                end
                if not has_player and msg.player_ent then need_retok = true end
            end
            if need_retok then
                msg.tokens = tokenize_console_line(msg.text, msg.player_ent)
            end
        end

        local base_r, base_g, base_b = msg.r, msg.g, msg.b
        if msg.use_accent then base_r, base_g, base_b = ar, ag, ab end

        if msg.accent_word and msg.accent_word ~= "" then
            local s, e = msg.text:find(msg.accent_word, 1, true)
            if s then
                local before = msg.text:sub(1, s - 1)
                local word   = msg.text:sub(s, e)
                local after  = msg.text:sub(e + 1)
                _draw_clipped(before, base_r, base_g, base_b, text_a)
                _draw_clipped(word,   ar, ag, ab, text_a)
                if after ~= "" then
                    _draw_clipped(after, base_r, base_g, base_b, text_a)
                end
            else
                _draw_clipped(msg.text, base_r, base_g, base_b, text_a)
            end
        elseif not msg.tokens or #msg.tokens == 0 then
            _draw_clipped(msg.text, base_r, base_g, base_b, text_a)
        else
            for _, tok in ipairs(msg.tokens) do
                local tr, tg, tb = base_r, base_g, base_b
                local t_alpha = text_a

                if not is_error then
                    if tok.type == "keyword" then tr, tg, tb = theme.syntax.cmd[1], theme.syntax.cmd[2], theme.syntax.cmd[3]
                    elseif tok.type == "string" then tr, tg, tb = 255, 180, 100
                    elseif tok.type == "number" then tr, tg, tb = theme.syntax.num[1], theme.syntax.num[2], theme.syntax.num[3]
                    elseif tok.type == "true" then tr, tg, tb = 100, 255, 100
                    elseif tok.type == "false" then tr, tg, tb = 255, 100, 100
                    elseif tok.type == "nil" then tr, tg, tb = 100, 100, 255
                    elseif tok.type == "gs_prefix" then
                        _draw_clipped("game",  255, 255, 255, t_alpha)
                        _draw_clipped("sense", ar, ag, ab,    t_alpha)
                        goto next_token
                    elseif tok.type == "tag" then
                        tr, tg, tb = msg.r, msg.g, msg.b
                    elseif tok.type == "player" then
                        tr, tg, tb = HUD.get_player_team_color(tok.ent)

                        local _, con_th_p = surface.get_text_size(font_con, "W")
                        local tw, th = get_text_size_safe(font_con, tok.text)
                        local is_h = (mx >= curr_x and mx <= curr_x + tw and my >= draw_y and my <= draw_y + th)
                        if is_h then
                            tr, tg, tb = 180, 220, 255
                            local _ul_w = math.max(0, math.min(tw, _msg_max_right - curr_x))
                            if _ul_w > 0 then
                                surface.draw_filled_rect(curr_x, draw_y + th - 1, _ul_w, 1, tr, tg, tb, t_alpha)
                            end

                            local cur_time = globals.realtime()
                            local can_interact = (cur_time > CON_MODULE.last_action_time + 0.5)

                            if mouse_right and not MOUSE_DOWN_PREV and can_interact then
                                MOUSE_DOWN_PREV = true
                                CON_MODULE.last_action_time = cur_time
                                pcall(function()
                                    if tok.ent then
                                        local sid = entity.get_steam64(tok.ent)
                                        if sid then
                                            set_clipboard(sid)
                                            HUD_LOG("Copied SteamID64: " .. sid, 150, 255, 150, true, nil, nil, "SYSTEM")
                                        end
                                    end
                                end)
                            end
                        end
                    end
                else
                    tr, tg, tb = 255, 50, 50
                end

                _draw_clipped(tok.text, tr, tg, tb, t_alpha)
                ::next_token::
            end
        end

        if msg.val and msg.c_name then
            local cmd_lower = msg.c_name:lower()
            local range = CVAR_RANGES[cmd_lower] or { min = 0, max = (msg.val <= 1 and 1 or 10) }
            local prog = (msg.val - range.min) / (range.max - range.min)
            prog = math.max(0, math.min(1, prog))

            local bar_w = S(120)
            local bar_x = x + w - bar_w - S(15)

            surface.draw_filled_rect(bar_x, line_y + S(4), bar_w, S(4), 30, 30, 30, text_a)
            surface.draw_filled_gradient_rect(bar_x, line_y + S(4), bar_w * prog, S(4), ar, ag, ab, text_a, ar/2, ag/2, ab/2, text_a, true)
            surface.draw_outlined_rect(bar_x - S(1), line_y + S(3), bar_w + S(2), S(6), 60, 60, 60, math.floor(150 * alpha_pct))
        end

        count = count + 1
    end

    local input_y = y + h - S(30)

    if CON_MODULE.search_active then
        surface.draw_filled_rect(x + S(2), y + S(27), w - S(4), (input_y - S(6)) - (y + S(27)),
            0, 0, 0, math.floor(90 * alpha_pct))

        local sb_h = S(20)
        local sb_x = x + S(10)
        local sb_w = w - S(20)
        local sb_y = input_y - sb_h - S(6)
        surface.draw_filled_rect(sb_x, sb_y, sb_w, sb_h, br + 8, bg + 8, bb + 8, math.floor(240 * alpha_pct))
        surface.draw_outlined_rect(sb_x, sb_y, sb_w, sb_h, ar, ag, ab, math.floor(200 * alpha_pct))
        local label = "find: "
        local lw, _ = get_text_size_safe(font_con, label)
        draw_text_safe(sb_x + S(6), sb_y + S(3), ar, ag, ab, text_a, font_con, label)
        draw_text_safe(sb_x + S(6) + lw, sb_y + S(3), 255, 255, 255, text_a, font_con, CON_MODULE.search_text)
        local hint = "Enter / Ctrl+F to close"
        local hw, _ = get_text_size_safe(font_con, hint)
        draw_text_safe(sb_x + sb_w - hw - S(8), sb_y + S(3), 140, 140, 140, text_a, font_con, hint)
        if math.floor(globals.realtime() * 2) % 2 == 0 then
            local tw, _ = get_text_size_safe(font_con, CON_MODULE.search_text)
            surface.draw_filled_rect(sb_x + S(6) + lw + tw, sb_y + S(4), S(1), S(12), ar, ag, ab, text_a)
        end
    end

    local t = CON_MODULE.active_tab
    if #CON_MODULE.tabs[t] > max_lines then
        local sb_h = (max_lines / #CON_MODULE.tabs[t]) * (h - S(95))
        local sb_y = start_y + ((#CON_MODULE.tabs[t] - CON_MODULE.scroll_indices[t] - max_lines) / #CON_MODULE.tabs[t]) * (h - S(95))
        surface.draw_filled_rect(x + w - S(4), start_y, S(2), h - S(95), 40, 40, 40, math.floor(100 * alpha_pct))
        surface.draw_filled_rect(x + w - S(4), sb_y, S(2), sb_h, ar, ag, ab, math.floor(200 * alpha_pct))
    end

    surface.draw_filled_rect(x + S(5), input_y, w - S(10), S(25), br + 5, bg + 5, bb + 5, math.floor(255 * alpha_pct))
    surface.draw_outlined_rect(x + S(5), input_y, w - S(10), S(25), 60, 60, 60, math.floor(150 * alpha_pct))

    if mouse_left and not MOUSE_DOWN_PREV and CON_MODULE.active then
        if mx >= x + 5 and mx <= x + w - 5 and my >= input_y and my <= input_y + 25 then
            CON_MODULE.sel_start = 0
            CON_MODULE.sel_end = 0
        end
    end

    local _prompt_w, _   = get_text_size_safe(font_con, "> ")
    local _in_text_x     = x + S(15) + _prompt_w
    local _in_right      = x + w - S(15)
    local _in_avail_w    = math.max(0, _in_right - _in_text_x)
    local _in_caret_w, _ = get_text_size_safe(font_con, CON_MODULE.input_text:sub(1, CON_MODULE.caret_pos))
    local _in_scroll     = CON_MODULE.input_scroll or 0
    if _in_caret_w - _in_scroll > _in_avail_w then
        _in_scroll = _in_caret_w - _in_avail_w
    end
    if _in_caret_w - _in_scroll < 0 then
        _in_scroll = math.max(0, _in_caret_w)
    end
    CON_MODULE.input_scroll = _in_scroll

    if CON_MODULE.sel_start ~= CON_MODULE.sel_end then
        local s = math.max(0, math.min(CON_MODULE.sel_start, CON_MODULE.sel_end))
        local e = math.max(0, math.max(CON_MODULE.sel_start, CON_MODULE.sel_end))

        local text_before   = CON_MODULE.input_text:sub(1, s)
        local text_selected = CON_MODULE.input_text:sub(s + 1, e)

        local sw_before, _   = get_text_size_safe(font_con, text_before)
        local sw_selected, _ = get_text_size_safe(font_con, text_selected)
        local hx1 = _in_text_x + sw_before - _in_scroll
        local hx2 = hx1 + sw_selected
        local cx1 = math.max(_in_text_x, hx1)
        local cx2 = math.min(_in_right, hx2)
        if cx2 > cx1 then
            surface.draw_filled_rect(cx1, input_y + S(4), cx2 - cx1, S(18), ar, ag, ab, math.floor(100 * alpha_pct))
        end
    end

    draw_text_safe(x + S(15), input_y + S(5), ar, ag, ab, text_a, font_con, "> ")

    local theme_name = ui.get(ui_con_theme) or "Default"
    local theme = THEMES[theme_name] or THEMES["Default"]
    local tokens = tokenize_console_line(CON_MODULE.input_text)

    local _in_visible_lo, _in_visible_hi = 0, #CON_MODULE.input_text
    do
        local s = CON_MODULE.input_text
        local lo = 0
        if _in_scroll > 0 and #s > 0 then
            local p = 0
            while p < #s do
                local np = utf8_next(s, p)
                local ww = get_text_size_safe(font_con, s:sub(1, np))
                if ww > _in_scroll then lo = p; break end
                p = np
            end
        end
        local base_w = lo > 0 and get_text_size_safe(font_con, s:sub(1, lo)) or 0
        local hi = lo
        local p = lo
        while p < #s do
            local np = utf8_next(s, p)
            local ww = get_text_size_safe(font_con, s:sub(1, np)) - base_w
            if ww > _in_avail_w then break end
            hi = np
            p = np
        end
        _in_visible_lo, _in_visible_hi = lo, hi
    end

    local curr_x = _in_text_x
    local byte_pos = 0
    for _, tok in ipairs(tokens) do
        local tok_len   = #tok.text
        local tok_start = byte_pos
        local tok_end   = byte_pos + tok_len
        byte_pos = tok_end
        if not (tok_end <= _in_visible_lo or tok_start >= _in_visible_hi) then
            local clip_lo = math.max(tok_start, _in_visible_lo)
            local clip_hi = math.min(tok_end,   _in_visible_hi)
            local sub = tok.text:sub(clip_lo - tok_start + 1, clip_hi - tok_start)
            if sub ~= "" then
                local tr, tg, tb = 255, 255, 255
                if tok.type == "keyword" then tr, tg, tb = theme.syntax.cmd[1], theme.syntax.cmd[2], theme.syntax.cmd[3]
                elseif tok.type == "string" then tr, tg, tb = 255, 180, 100
                elseif tok.type == "number" then tr, tg, tb = theme.syntax.num[1], theme.syntax.num[2], theme.syntax.num[3]
                elseif tok.type == "true" then tr, tg, tb = 100, 255, 100
                elseif tok.type == "false" then tr, tg, tb = 255, 100, 100
                elseif tok.type == "nil" then tr, tg, tb = 100, 100, 255
                elseif tok.type == "tag" then tr, tg, tb = 255, 255, 255
                end
                draw_text_safe(curr_x, input_y + S(5), tr, tg, tb, text_a, font_con, sub)
                local w_tok, _ = get_text_size_safe(font_con, sub)
                curr_x = curr_x + w_tok
            end
        end
    end

    if #CON_MODULE.suggestions > 0 then
        local hints = {}
        local cmds = {}
        for _, s in ipairs(CON_MODULE.suggestions) do
            if s:find("^%[INFO%]") then table.insert(hints, s)
            else table.insert(cmds, s) end
        end

        if #hints > 0 then
            local hint_text = hints[1]
            local hw, hh = surface.get_text_size(font_con, hint_text)
            local h_box_w = hw + S(20)
            local h_box_x = x + S(5)
            local h_box_y = input_y - S(25)

            surface.draw_filled_rect(h_box_x, h_box_y, h_box_w, S(22), br + 15, bg + 15, bb + 15, math.floor(240 * alpha_pct))
            surface.draw_outlined_rect(h_box_x, h_box_y, h_box_w, S(22), ar, ag, ab, text_a)
            surface.draw_text(h_box_x + S(10), h_box_y + S(4), 150, 255, 150, text_a, font_con, hint_text)
        end

        if #cmds > 0 then
            local max_tw = 100
            for _, s in ipairs(cmds) do
                local tw, th = surface.get_text_size(font_con, s)
                if tw > max_tw then max_tw = tw end
            end
            local box_w = max_tw + S(20)
            local sugg_y = input_y - (#cmds * S(15)) - (#hints > 0 and S(32) or S(5))

            surface.draw_filled_rect(x + S(5), sugg_y, box_w, #cmds * S(15) + S(2), br + 2, bg + 2, bb + 2, math.floor(220 * alpha_pct))
            surface.draw_outlined_rect(x + S(5), sugg_y, box_w, #cmds * S(15) + S(2), ar, ag, ab, text_a)
            for i, s in ipairs(cmds) do
                local is_sel = (i == CON_MODULE.sugg_idx)
                local color = is_sel and {ar, ag, ab} or {200, 200, 200}
                if is_sel then
                    surface.draw_filled_rect(x + S(6), sugg_y + (i-1)*S(15) + S(1), S(2), S(13), ar, ag, ab, text_a)
                end
                draw_text_safe(x + S(10), sugg_y + (i-1)*S(15) + S(2), color[1], color[2], color[3], text_a, font_con, s)
            end
        end
    end

    local cur_time = globals.realtime()
    if CON_MODULE.active and math.floor(cur_time * 2) % 2 == 0 then
        local tw = _in_caret_w - _in_scroll
        if tw >= 0 and tw <= _in_avail_w then
            surface.draw_filled_rect(_in_text_x + tw, input_y + S(5), S(1), S(15), ar, ag, ab, text_a)
        end
    end

    if CON_MODULE.active and alpha_pct > 0.5 and ui.is_menu_open() then
        local mx, my = ui.mouse_position()
        surface.draw_filled_rect(mx - 1, my - 1, 3, 3, ar, ag, ab, 255)
        surface.draw_outlined_rect(mx - 2, my - 2, 5, 5, 0, 0, 0, 150)
    end

end


function CHAT_MODULE.draw()
    if not ui.get(SETTINGS["chat_enabled"]) then return end

    local sw, sh = client.screen_size()
    local ft = globals.frametime()
    local cur_t = globals.realtime()

    if CHAT_MODULE.active then
        CHAT_MODULE.anim_alpha = math.min(1, CHAT_MODULE.anim_alpha + ft * 8)
    else
        CHAT_MODULE.anim_alpha = math.max(0, CHAT_MODULE.anim_alpha - ft * 8)
    end

    local chat_w, chat_h = S(500), S(240)
    local chat_x, chat_y = HUD.editor.pos("chat", S(20), sh - chat_h - S(60))
    HUD.editor.bbox("chat", chat_x, chat_y, chat_w, chat_h)
    local line_h = S(24)
    local padding = S(15)
    local header_h = S(2)
    local ar, ag, ab = ui.get(ui_chat_color)
    local ap = 1.0
    local win_alpha = math.floor(255 * CHAT_MODULE.anim_alpha)

    if CHAT_MODULE.anim_alpha > 0 then

        surface.draw_filled_rect(chat_x, chat_y, chat_w, chat_h, 12, 12, 12, math.floor(180 * CHAT_MODULE.anim_alpha))

        surface.draw_outlined_rect(chat_x, chat_y, chat_w, chat_h, ar, ag, ab, math.floor(40 * CHAT_MODULE.anim_alpha * ap))
        surface.draw_outlined_rect(chat_x + 1, chat_y + 1, chat_w - 2, chat_h - 2, 255, 255, 255, math.floor(15 * CHAT_MODULE.anim_alpha))
        surface.draw_outlined_rect(chat_x, chat_y, chat_w, chat_h, 45, 45, 45, math.floor(200 * CHAT_MODULE.anim_alpha))

        surface.draw_filled_gradient_rect(chat_x, chat_y, chat_w, S(2), ar, ag, ab, math.floor(win_alpha * ap), ar/2, ag/2, ab/2, 0, true)

        local sb_w = S(2)
        local sb_x = chat_x + chat_w - sb_w - S(4)
        local sb_y = chat_y + S(10)
        local sb_h = chat_h - S(20)
        surface.draw_filled_rect(sb_x, sb_y, sb_w, sb_h, 60, 60, 60, math.floor(40 * CHAT_MODULE.anim_alpha))
    end

    local chat_tab = (CON_MODULE and CON_MODULE.tabs and CON_MODULE.tabs.chat) or {}

    if #chat_tab ~= CHAT_MODULE.last_msg_count then
        if CHAT_MODULE.last_msg_count > 0 then
            CHAT_MODULE.scroll_offset = CHAT_MODULE.scroll_offset + line_h
        end
        CHAT_MODULE.last_msg_count = #chat_tab
    end
    CHAT_MODULE.scroll_offset = CHAT_MODULE.scroll_offset * 0.85
    if CHAT_MODULE.scroll_offset < 0.1 then CHAT_MODULE.scroll_offset = 0 end

    local theme_name = ui.get(ui_con_theme) or "Default"
    local theme = THEMES[theme_name] or THEMES["Default"]

    local max_history = 10
    local bottom_y = chat_y + chat_h - S(45)

    local visible_msgs = {}
    for i = 1, #chat_tab do
        local msg = chat_tab[i]
        if msg and not msg.stale then
            local age = cur_t - (msg.timestamp or 0)
            if CHAT_MODULE.active or age < 10 then
                table.insert(visible_msgs, msg)
            end
        end
    end
    local v_start = math.max(1, #visible_msgs - max_history + 1)

    for vi = v_start, #visible_msgs do
        local msg = visible_msgs[vi]
        local lx = chat_x + padding
        local k = #visible_msgs - vi
        local ly = bottom_y - (k + 1) * line_h + CHAT_MODULE.scroll_offset

        local is_visible = true
        if CHAT_MODULE.active and (ly < chat_y + S(10) or ly > bottom_y + S(10)) then
            is_visible = false
        end

        if is_visible then
            local age = cur_t - (msg.timestamp or 0)
            local final_alpha = 0

            if not msg.stale then
                if CHAT_MODULE.active then
                    final_alpha = win_alpha
                elseif age < 10 then
                    local p_alpha = age > 8 and (1 - (age - 8) / 2) or 1
                    final_alpha = math.floor(255 * p_alpha)
                end
            end

            if final_alpha > 0 and msg.text then
                    local v_offset = (line_h - S(14)) / 2

                        if msg.avatar then
                            local av_size = S(18)
                            local av_y = ly + (line_h - av_size) / 2

                            pcall(function()
                                if type(msg.avatar) == "table" and msg.avatar.draw then
                                    msg.avatar:draw(lx, av_y, av_size, av_size, 255, 255, 255, final_alpha)
                                else
                                    renderer.texture(msg.avatar, lx, av_y, av_size, av_size, 255, 255, 255, final_alpha)
                                end
                            end)

                            surface.draw_outlined_rect(lx, av_y, av_size, av_size, 0, 0, 0, math.floor(final_alpha * 0.5))
                            lx = lx + av_size + S(5)
                        end

                    local ts_str = "[" .. (msg.time or "00:00:00") .. "] "
                    local tw_ts, _ = get_text_size_safe(font_con, ts_str)
                    draw_text_safe(lx, ly + v_offset, 100, 100, 100, math.floor(final_alpha * 0.6), font_con, ts_str)

                    local need_retok = not msg.tokens or #msg.tokens == 0
                    if not need_retok then
                        local has_player = false
                        for _, t in ipairs(msg.tokens) do
                            if t.type == "player" then has_player = true; break end
                        end
                        if not has_player and msg.player_ent then need_retok = true end
                    end
                    if need_retok then
                        msg.tokens = tokenize_console_line(msg.text, msg.player_ent)
                    end
                    local tokens = msg.tokens
                    local curr_lx = lx + tw_ts
                    local _max_right = chat_x + chat_w - padding
                    local _ellipsis  = "\xE2\x80\xA6"
                    local _ell_w     = get_text_size_safe(font_con, _ellipsis)
                    local _truncated = false

                    for _, tok in ipairs(tokens) do
                        if _truncated then break end
                        local tr, tg, tb = 255, 255, 255
                        if tok.type == "keyword" then tr, tg, tb = theme.syntax.cmd[1], theme.syntax.cmd[2], theme.syntax.cmd[3]
                        elseif tok.type == "string" then tr, tg, tb = 255, 180, 100
                        elseif tok.type == "number" then tr, tg, tb = theme.syntax.num[1], theme.syntax.num[2], theme.syntax.num[3]
                        elseif tok.type == "true" then tr, tg, tb = 100, 255, 100
                        elseif tok.type == "false" then tr, tg, tb = 255, 100, 100
                        elseif tok.type == "nil" then tr, tg, tb = 100, 100, 255
                        elseif tok.type == "tag" then tr, tg, tb = 160, 160, 160
                        elseif tok.type == "gs_prefix" then tr, tg, tb = 150, 210, 120
                        elseif tok.type == "player" then
                            tr, tg, tb = HUD.get_player_team_color(tok.ent)
                        end

                        local txt = tok.text or ""
                        local w, _ = get_text_size_safe(font_con, txt)

                        if curr_lx + w <= _max_right then
                            if not CHAT_MODULE.active then
                                draw_text_safe(curr_lx + S(1), ly + v_offset + S(1), 0, 0, 0, final_alpha, font_con, txt)
                            end
                            draw_text_safe(curr_lx, ly + v_offset, tr, tg, tb, final_alpha, font_con, txt)
                            curr_lx = curr_lx + w
                        else
                            local p = 0
                            local last_p = 0
                            local last_w = 0
                            while p < #txt do
                                local np = utf8_next(txt, p)
                                local sub = txt:sub(1, np)
                                local sw  = get_text_size_safe(font_con, sub)
                                if curr_lx + sw + _ell_w > _max_right then break end
                                last_p = np
                                last_w = sw
                                p = np
                            end
                            if last_p > 0 then
                                local sub = txt:sub(1, last_p)
                                if not CHAT_MODULE.active then
                                    draw_text_safe(curr_lx + S(1), ly + v_offset + S(1), 0, 0, 0, final_alpha, font_con, sub)
                                end
                                draw_text_safe(curr_lx, ly + v_offset, tr, tg, tb, final_alpha, font_con, sub)
                                curr_lx = curr_lx + last_w
                            end
                            if curr_lx + _ell_w <= _max_right then
                                if not CHAT_MODULE.active then
                                    draw_text_safe(curr_lx + S(1), ly + v_offset + S(1), 0, 0, 0, final_alpha, font_con, _ellipsis)
                                end
                                draw_text_safe(curr_lx, ly + v_offset, 160, 160, 160, final_alpha, font_con, _ellipsis)
                            end
                            _truncated = true
                        end
                    end
                end
            end
        end

    if CHAT_MODULE.active or CHAT_MODULE.anim_alpha > 0 then
        local input_h = S_F(30, 24)
        local in_y = chat_y + chat_h - input_h

        local text_y_off = (input_h - S_F(14, 12)) / 2

        surface.draw_filled_gradient_rect(chat_x + S(5), in_y, chat_w - S(10), S(1), ar, ag, ab, math.floor(80 * CHAT_MODULE.anim_alpha), ar, ag, ab, 0, true)

        if CHAT_MODULE.active then
            local lang_prefix = "[" .. G_INPUT_LANG .. "] "
            draw_text_safe(chat_x + padding, in_y + text_y_off, ar, ag, ab, win_alpha, font_con, lang_prefix)
            local lw, _ = get_text_size_safe(font_con, lang_prefix)

            local prefix = (CHAT_MODULE.mode == "Team" and "[TEAM] " or "[ALL] ")
            draw_text_safe(chat_x + padding + lw, in_y + text_y_off, 100, 255, 100, win_alpha, font_con, prefix)

            local pw, _ = get_text_size_safe(font_con, prefix)
            local text_x = chat_x + padding + lw + pw

            local _input_right = chat_x + chat_w - padding
            local _avail_w     = math.max(0, _input_right - text_x)
            local _caret_w, _  = get_text_size_safe(font_con, CHAT_MODULE.input_text:sub(1, CHAT_MODULE.caret_pos))
            local _scroll_off  = CHAT_MODULE.input_scroll or 0
            if _caret_w - _scroll_off > _avail_w then
                _scroll_off = _caret_w - _avail_w
            end
            if _caret_w - _scroll_off < 0 then
                _scroll_off = math.max(0, _caret_w)
            end
            CHAT_MODULE.input_scroll = _scroll_off

            if CHAT_MODULE.sel_start ~= CHAT_MODULE.sel_end then
                local s = math.max(0, math.min(CHAT_MODULE.sel_start, CHAT_MODULE.sel_end))
                local e = math.max(0, math.max(CHAT_MODULE.sel_start, CHAT_MODULE.sel_end))
                local before_sel = CHAT_MODULE.input_text:sub(1, s)
                local selected   = CHAT_MODULE.input_text:sub(s + 1, e)
                local off_w, _   = get_text_size_safe(font_con, before_sel)
                local sel_w,  _  = get_text_size_safe(font_con, selected)
                local hx1 = text_x + off_w - _scroll_off
                local hx2 = hx1 + sel_w
                local cx1 = math.max(text_x, hx1)
                local cx2 = math.min(_input_right, hx2)
                if cx2 > cx1 then
                    surface.draw_filled_rect(cx1, in_y + text_y_off - S(1), cx2 - cx1, S_F(14, 12) + S(2), ar, ag, ab, math.floor(100 * CHAT_MODULE.anim_alpha))
                end
            end

            do
                local s = CHAT_MODULE.input_text
                local lo = 0
                if _scroll_off > 0 and #s > 0 then
                    local p = 0
                    while p < #s do
                        local np = utf8_next(s, p)
                        local w  = get_text_size_safe(font_con, s:sub(1, np))
                        if w > _scroll_off then lo = p; break end
                        p = np
                    end
                end
                local base_w = lo > 0 and get_text_size_safe(font_con, s:sub(1, lo)) or 0
                local hi = lo
                local p = lo
                while p < #s do
                    local np = utf8_next(s, p)
                    local w  = get_text_size_safe(font_con, s:sub(1, np)) - base_w
                    if w > _avail_w then break end
                    hi = np
                    p = np
                end
                local visible = s:sub(lo + 1, hi)
                draw_text_safe(text_x, in_y + text_y_off, 255, 255, 255, win_alpha, font_con, visible)
            end

            if math.floor(globals.realtime() * 2) % 2 == 0 then
                local tw = _caret_w - _scroll_off
                if tw >= 0 and tw <= _avail_w then
                    surface.draw_filled_rect(text_x + tw, in_y + text_y_off, S(1), S_F(14, 12), ar, ag, ab, win_alpha)
                end
            end
        end
    end
end

local function poll_chat_keyboard()
    if not CHAT_MODULE.active then
        if not SETTINGS or not SETTINGS["chat_enabled"] or not ui.get(SETTINGS["chat_enabled"]) then return end
        if (CON_MODULE and CON_MODULE.active) or (BM_MODULE and BM_MODULE.is_open) then return end

        local cur_t = globals.realtime()
        local y_key = client.key_state(0x59)
        local u_key = client.key_state(0x55)

        if y_key and (CHAT_MODULE.key_states[0x59] or 0) < cur_t then
            CHAT_MODULE.active = true
            CHAT_MODULE.mode = "All"
            CHAT_MODULE.input_text = ""
            CHAT_MODULE.caret_pos = 0
            CHAT_MODULE.key_states[0x59] = cur_t + 0.3

            local cur_sens = tonumber(client.get_cvar("sensitivity")) or 1.0
            if cur_sens ~= 0 then ORIG_SENS = cur_sens end
            client.set_cvar("sensitivity", 0)
        elseif u_key and (CHAT_MODULE.key_states[0x55] or 0) < cur_t then
            CHAT_MODULE.active = true
            CHAT_MODULE.mode = "Team"
            CHAT_MODULE.input_text = ""
            CHAT_MODULE.caret_pos = 0
            CHAT_MODULE.key_states[0x55] = cur_t + 0.3

            local cur_sens = tonumber(client.get_cvar("sensitivity")) or 1.0
            if cur_sens ~= 0 then ORIG_SENS = cur_sens end
            client.set_cvar("sensitivity", 0)
        end
        return
    end

    local cur_t = globals.realtime()
    local shift = client.key_state(0x10)
    local alt = client.key_state(0x12)

    if shift and alt then
        if (CHAT_MODULE.key_states[0xDEAD] or 0) < cur_t then
            G_INPUT_LANG = (G_INPUT_LANG == "EN") and "RU" or "EN"
            CHAT_MODULE.key_states[0xDEAD] = cur_t + 0.5
        end
    else
        CHAT_MODULE.key_states[0xDEAD] = 0
    end

    local ctrl = client.key_state(0x11)

    local function chat_delete_selection()
        if CHAT_MODULE.sel_start ~= CHAT_MODULE.sel_end then
            local s = math.min(CHAT_MODULE.sel_start, CHAT_MODULE.sel_end)
            local e = math.max(CHAT_MODULE.sel_start, CHAT_MODULE.sel_end)
            CHAT_MODULE.input_text = CHAT_MODULE.input_text:sub(1, s) .. CHAT_MODULE.input_text:sub(e + 1)
            CHAT_MODULE.caret_pos = s
            CHAT_MODULE.sel_start = 0
            CHAT_MODULE.sel_end   = 0
            return true
        end
        return false
    end

    local function insert_chat_text(t)
        if not t or t == "" then return end
        local cur_t = globals.realtime()
        if t == CHAT_MODULE.last_inserted_text and (cur_t - (CHAT_MODULE.last_inserted_time or 0)) < 0.2 then
            return
        end
        CHAT_MODULE.last_inserted_text = t
        CHAT_MODULE.last_inserted_time = cur_t

        chat_delete_selection()
        local s = CHAT_MODULE.input_text:sub(1, CHAT_MODULE.caret_pos)
        local e = CHAT_MODULE.input_text:sub(CHAT_MODULE.caret_pos + 1)
        CHAT_MODULE.input_text = s .. t .. e
        CHAT_MODULE.caret_pos = CHAT_MODULE.caret_pos + #t
    end

    if ctrl then
        if client.key_state(0x41) then
            if not CHAT_MODULE.key_states[0x41] then
                CHAT_MODULE.sel_start = 0
                CHAT_MODULE.sel_end   = #CHAT_MODULE.input_text
                CHAT_MODULE.caret_pos = #CHAT_MODULE.input_text
                CHAT_MODULE.key_states[0x41] = true
            end
        else CHAT_MODULE.key_states[0x41] = false end

        if client.key_state(0x43) then
            if not CHAT_MODULE.key_states[0x43] then
                if CHAT_MODULE.sel_start ~= CHAT_MODULE.sel_end then
                    local s = math.min(CHAT_MODULE.sel_start, CHAT_MODULE.sel_end)
                    local e = math.max(CHAT_MODULE.sel_start, CHAT_MODULE.sel_end)
                    set_clipboard(CHAT_MODULE.input_text:sub(s + 1, e))
                end
                CHAT_MODULE.key_states[0x43] = true
            end
        else CHAT_MODULE.key_states[0x43] = false end

        if client.key_state(0x56) then
            if not CHAT_MODULE.key_states[0x56] then
                local text = get_clipboard()
                if text and text ~= "" then insert_chat_text(text) end
                CHAT_MODULE.key_states[0x56] = true
            end
        else CHAT_MODULE.key_states[0x56] = false end
        return
    end

    local function handle_chat_p(vk, c_low, c_high)
        if alt then
            if not shift then return end
        end
        if client.key_state(vk) then
            if (CHAT_MODULE.key_states[vk] or 0) < cur_t then
                local char
                local map = INPUT_KEY_MAP[G_INPUT_LANG]
                if map and map[vk] then
                    char = shift and map[vk][1] or map[vk][2]
                else
                    char = shift and c_high or c_low
                end

                if char then insert_chat_text(char) end
                CHAT_MODULE.key_states[vk] = cur_t + 0.15
            end
        else CHAT_MODULE.key_states[vk] = 0 end
    end

    for i = 0x41, 0x5A do handle_chat_p(i, string.char(i+32), string.char(i)) end
    for i = 0x30, 0x39 do handle_chat_p(i, string.char(i), string.char(i)) end
    handle_chat_p(0x20, " ", " ")

    handle_chat_p(0xBD, "-", "_")
    handle_chat_p(0xBE, ".", ">")
    handle_chat_p(0xBC, ",", "<")
    handle_chat_p(0xBB, "=", "+")
    handle_chat_p(0xBA, ";", ":")
    handle_chat_p(0xDE, "'", "\"")
    handle_chat_p(0xDB, "[", "{")
    handle_chat_p(0xDD, "]", "}")

    if client.key_state(0x08) then
        if (CHAT_MODULE.key_states[0x08] or 0) < cur_t then
            if not chat_delete_selection() and CHAT_MODULE.caret_pos > 0 then
                local p = utf8_prev(CHAT_MODULE.input_text, CHAT_MODULE.caret_pos)
                CHAT_MODULE.input_text = CHAT_MODULE.input_text:sub(1, p) .. CHAT_MODULE.input_text:sub(CHAT_MODULE.caret_pos + 1)
                CHAT_MODULE.caret_pos = p
            end
            CHAT_MODULE.key_states[0x08] = cur_t + 0.1
        end
    else CHAT_MODULE.key_states[0x08] = 0 end

    if client.key_state(0x25) then
        if (CHAT_MODULE.key_states[0x25] or 0) < cur_t then
            if shift then
                if CHAT_MODULE.sel_start == CHAT_MODULE.sel_end then CHAT_MODULE.sel_start = CHAT_MODULE.caret_pos end
                CHAT_MODULE.caret_pos = utf8_prev(CHAT_MODULE.input_text, CHAT_MODULE.caret_pos)
                CHAT_MODULE.sel_end = CHAT_MODULE.caret_pos
            else
                if CHAT_MODULE.sel_start ~= CHAT_MODULE.sel_end then
                    CHAT_MODULE.caret_pos = math.min(CHAT_MODULE.sel_start, CHAT_MODULE.sel_end)
                else
                    CHAT_MODULE.caret_pos = utf8_prev(CHAT_MODULE.input_text, CHAT_MODULE.caret_pos)
                end
                CHAT_MODULE.sel_start = 0; CHAT_MODULE.sel_end = 0
            end
            local first = (CHAT_MODULE.key_states[0x25] == 0)
            CHAT_MODULE.key_states[0x25] = cur_t + (first and 0.35 or 0.06)
        end
    else CHAT_MODULE.key_states[0x25] = 0 end

    if client.key_state(0x27) then
        if (CHAT_MODULE.key_states[0x27] or 0) < cur_t then
            if shift then
                if CHAT_MODULE.sel_start == CHAT_MODULE.sel_end then CHAT_MODULE.sel_start = CHAT_MODULE.caret_pos end
                CHAT_MODULE.caret_pos = utf8_next(CHAT_MODULE.input_text, CHAT_MODULE.caret_pos)
                CHAT_MODULE.sel_end = CHAT_MODULE.caret_pos
            else
                if CHAT_MODULE.sel_start ~= CHAT_MODULE.sel_end then
                    CHAT_MODULE.caret_pos = math.max(CHAT_MODULE.sel_start, CHAT_MODULE.sel_end)
                else
                    CHAT_MODULE.caret_pos = utf8_next(CHAT_MODULE.input_text, CHAT_MODULE.caret_pos)
                end
                CHAT_MODULE.sel_start = 0; CHAT_MODULE.sel_end = 0
            end
            local first = (CHAT_MODULE.key_states[0x27] == 0)
            CHAT_MODULE.key_states[0x27] = cur_t + (first and 0.35 or 0.06)
        end
    else CHAT_MODULE.key_states[0x27] = 0 end

    if client.key_state(0x24) then
        if not CHAT_MODULE.key_states[0x24] then
            if shift then
                if CHAT_MODULE.sel_start == CHAT_MODULE.sel_end then CHAT_MODULE.sel_start = CHAT_MODULE.caret_pos end
                CHAT_MODULE.caret_pos = 0
                CHAT_MODULE.sel_end = 0
            else
                CHAT_MODULE.caret_pos = 0
                CHAT_MODULE.sel_start = 0; CHAT_MODULE.sel_end = 0
            end
            CHAT_MODULE.key_states[0x24] = true
        end
    else CHAT_MODULE.key_states[0x24] = false end

    if client.key_state(0x23) then
        if not CHAT_MODULE.key_states[0x23] then
            if shift then
                if CHAT_MODULE.sel_start == CHAT_MODULE.sel_end then CHAT_MODULE.sel_start = CHAT_MODULE.caret_pos end
                CHAT_MODULE.caret_pos = #CHAT_MODULE.input_text
                CHAT_MODULE.sel_end = CHAT_MODULE.caret_pos
            else
                CHAT_MODULE.caret_pos = #CHAT_MODULE.input_text
                CHAT_MODULE.sel_start = 0; CHAT_MODULE.sel_end = 0
            end
            CHAT_MODULE.key_states[0x23] = true
        end
    else CHAT_MODULE.key_states[0x23] = false end

    if client.key_state(0x0D) then
        if (CHAT_MODULE.key_states[0x0D] or 0) < cur_t then
            if CHAT_MODULE.input_text ~= "" then
                local cmd = CHAT_MODULE.mode == "Team" and "say_team " or "say "
                client.exec(cmd .. CHAT_MODULE.input_text)
            end
            CHAT_MODULE.active = false
            CHAT_MODULE.sel_start = 0; CHAT_MODULE.sel_end = 0
            client.set_cvar("sensitivity", ORIG_SENS or 1.0)
            CHAT_MODULE.key_states[0x0D] = cur_t + 0.3
        end
    else CHAT_MODULE.key_states[0x0D] = 0 end

    if client.key_state(0x1B) then
        CHAT_MODULE.active = false
        CHAT_MODULE.sel_start = 0; CHAT_MODULE.sel_end = 0
        client.set_cvar("sensitivity", ORIG_SENS or 1.0)
    end
end

local _paint_debug_done = false
local _paint_debug_tick = 0
local function on_paint()
    if not CON_MODULE.persistent_ready then history_load() end

    if not _paint_debug_done then
        _paint_debug_tick = _paint_debug_tick + 1
        if _paint_debug_tick > 200 then
            _paint_debug_done = true
            local msgs = {}
            table.insert(msgs, "pan_ok=" .. tostring(pan_ok))
            table.insert(msgs, "json=" .. tostring(json ~= nil))
            
            local teams = entity.get_all("CCSTeam")
            table.insert(msgs, "CCSTeam count=" .. #teams)
            for i = 1, #teams do
                local t = teams[i]
                local n = entity.get_prop(t, "m_iTeamNum")
                local s1 = entity.get_prop(t, "m_scoreTotal")
                local s2 = entity.get_prop(t, "m_iScore")
                table.insert(msgs, "team" .. tostring(n) .. " total=" .. tostring(s1) .. " iScore=" .. tostring(s2))
            end
            
            local gr = entity.get_game_rules()
            table.insert(msgs, "game_rules=" .. tostring(gr ~= nil and gr or "nil"))
            if gr then
                table.insert(msgs, "totalRounds=" .. tostring(entity.get_prop(gr, "m_totalRoundsPlayed")))
            end
            
            if pan_ok then
                local pok, presult = pcall(function()
                    return pan.load_string([[return 'panorama_works']])()
                end)
                table.insert(msgs, "pan_test=" .. tostring(pok) .. " result=" .. tostring(presult))
                
                if pok then
                    local sok, sresult = pcall(function()
                        return pan.load_string([[
                            try {
                                return 'GSA=' + (typeof GameStateAPI) + ' score=' + GameStateAPI.GetTeamScore(2) + '-' + GameStateAPI.GetTeamScore(3);
                            } catch(e) {
                                return 'GSA_err:' + e.message;
                            }
                        ]])()
                    end)
                    table.insert(msgs, "pan_score=" .. tostring(sok) .. " " .. tostring(sresult))
                end
            end
            
            for _, m in ipairs(msgs) do
                HUD_LOG(m, 255, 255, 0, true, nil, nil, "system")
            end
            
            _log("[V-HUD DEBUG] " .. table.concat(msgs, " | "))
        end
    end

    local cur_map = globals.mapname()
    local cur_time = globals.curtime()

    if (cur_map ~= G_LAST_MAP) or (cur_time < (G_LAST_CURTIME - 0.5)) then
        G_LAST_MAP = cur_map
        G_LAST_CURTIME = cur_time
        clear_session_state()
    end
    G_LAST_CURTIME = cur_time

    if not ui.get(ui_main_enable) then return end

    local mouse_left = client.key_state(0x01)
    local mouse_right = client.key_state(0x02)

    local frame_time = globals.frametime()
    if CON_MODULE.active then
        CON_MODULE.anim_alpha = math.min(1.0, CON_MODULE.anim_alpha + frame_time * 8)
    else
        CON_MODULE.anim_alpha = math.max(0.0, CON_MODULE.anim_alpha - frame_time * 8)
    end

    if ui.get(ui_con_enable) then
        local con_hotkey = ui.get(ui_con_key)
        if con_hotkey and not CON_MODULE.key_prev then
            CON_MODULE.active = not CON_MODULE.active
            local should_freeze = CON_MODULE.active or BM_MODULE.is_open
            apply_console_freeze(should_freeze)
        end
        CON_MODULE.key_prev = con_hotkey
    end


    if ui.get(ui_buy_menu_enable) then
        local lp = entity.get_local_player()
        if lp and entity.is_alive(lp) then
            local is_in_buy_zone = entity.get_prop(lp, "m_bInBuyZone") == 1
            local pres = ui.get(ui_buy_menu_key)
            if pres and not key_pressed_prev and is_in_buy_zone then
                BM_MODULE.is_open = not BM_MODULE.is_open
                local should_freeze_bm = CON_MODULE.active or BM_MODULE.is_open
                if should_freeze_bm then
                    local cur_sens = tonumber(client.get_cvar("sensitivity")) or 1.0
                    if cur_sens ~= 0 then ORIG_SENS = cur_sens end
                    client.set_cvar("sensitivity", 0)
                else
                    client.set_cvar("sensitivity", ORIG_SENS or 1.0)
                end
            end
            key_pressed_prev = pres

            local autobuy_pres = ui.get(ui_autobuy_key)
            if autobuy_pres and not autobuy_prev and is_in_buy_zone then
                local cmds = {"scar20", "g3sg1", "vesthelm", "hegrenade", "molotov", "incgrenade", "smokegrenade", "defuser"}
                for _, c in ipairs(cmds) do client.exec("buy " .. c) end
                HUD_LOG("System: Full Buy executed.", 120, 255, 120, true)
            end
            autobuy_prev = autobuy_pres

            local ecobuy_pres = ui.get(ui_ecobuy_key)
            if ecobuy_pres and not ecobuy_prev and is_in_buy_zone then
                local cmds = {"p250", "vest"}
                for _, c in ipairs(cmds) do client.exec("buy " .. c) end
                HUD_LOG("System: Eco Buy executed.", 120, 200, 255, true)
            end
            ecobuy_prev = ecobuy_pres
            if BM_MODULE.is_open then
                if client.key_state(0x1B) or not is_in_buy_zone then
                    BM_MODULE.is_open = false
                    if not CON_MODULE.active then
                        client.set_cvar("sensitivity", ORIG_SENS or 1.0)
                    end
                end
                if BM_MODULE.is_open then BM_MODULE.draw() end
            end
        end
    end

    if _GLASS_HUD and _GLASS_HUD.get_state and (globals.tickcount() % 16 == 0) then
        local enabled, _, specs_enabled = _GLASS_HUD.get_state()
        if enabled and specs_enabled and _GLASS_HUD.update_specs then
            local specs = {}
            local players = entity.get_players()
            local lp = entity.get_local_player()
            if lp then
                for i=1, #players do
                    local p = players[i]
                    if p ~= lp and not entity.is_alive(p) then
                        local target = entity.get_prop(p, "m_hObserverTarget")
                        if target ~= nil then
                            local target_idx = bit.band(target, 0xFFFF)
                            if target_idx == lp then
                                table.insert(specs, entity.get_player_name(p))
                            end
                        end
                    end
                end
                local spec_str = table.concat(specs, ",")
                if spec_str ~= (CON_MODULE.last_spec_str or "") then
                    _GLASS_HUD.update_specs(specs)
                    CON_MODULE.last_spec_str = spec_str
                end
            end
        end
    end

    local lp = entity.get_local_player()
    if not lp then
        goto draw_console_final
    end

    do
        local team = entity.get_prop(lp, "m_iTeamNum") or 0


    local m_key = client.key_state(0x4D)
    if m_key and not m_key_prev and not CON_MODULE.active then G_TEAM_MENU_ACTIVE = true end
    m_key_prev = m_key

    if client.key_state(0x01) or client.key_state(0x1B) then
        G_TEAM_MENU_ACTIVE = false
    end

    if (team == 0 or G_TEAM_MENU_ACTIVE) and not CON_MODULE.active and not CHAT_MODULE.active then
        goto draw_console_final
    end

    local hide_hud_bits = entity.get_prop(lp, "m_iHideHUD") or 0
    if bit.band(hide_hud_bits, 4) ~= 0 and not CON_MODULE.active and not CHAT_MODULE.active then
        goto draw_console_final
    end

    local gr = entity.get_game_rules()
    if gr ~= nil and entity.get_prop(gr, "m_bIsTournamentMatchGameOver") == 1 and not CHAT_MODULE.active then
        goto draw_console_final
    end

    draw_round_end()
    draw_crosshair()

    if CHAT_MODULE and CHAT_MODULE.draw then
        CHAT_MODULE.draw()
    end
    poll_chat_keyboard()


    local sw, sh = client.screen_size()

    local ct = globals.curtime()

    local is_planting = false
    local bar_h = 4
    if G_PLANT_INFO.active then
        local p_rem = (G_PLANT_INFO.start_time + G_PLANT_INFO.duration) - ct
        if p_rem > 0 then
            is_planting = true
            local p_prog = math.max(0, math.min(1, 1 - (p_rem / G_PLANT_INFO.duration)))
            local bw_p = sw * p_prog
            local r = 255 - (255 - 100) * p_prog
            local g = 50 + (140 - 50) * p_prog
            local b = 50 + (40 - 50) * p_prog
            surface.draw_filled_gradient_rect(0, sh - bar_h, bw_p, bar_h, r, g, b, 180, r/2, g/2, b/2, 0, true)
            surface.draw_filled_rect(0, sh - 1, bw_p, 1, r, g, b, 255)
        else
            G_PLANT_INFO.active = false
        end
    end

    if G_DEFUSE_INFO.active then
        local d_rem = (G_DEFUSE_INFO.start_time + G_DEFUSE_INFO.duration) - ct
        if d_rem > 0 then
            local d_prog = math.max(0, math.min(1, 1 - (d_rem / G_DEFUSE_INFO.duration)))
            local bar_w, bar_h = 180, 4
            local ay = HUD_LAYOUT.alerts.defuse.y
            local bx, by = (sw - bar_w) / 2, ay

            local p_c4 = entity.get_all("CPlantedC4")[1]
            local is_too_late = false
            if p_c4 then
                local blow_t = entity.get_prop(p_c4, "m_flC4Blow") or 0
                if d_rem > (blow_t - ct) then is_too_late = true end
            end

            local pulse = math.abs(math.sin(globals.realtime() * 8)) * 60

            local r, g, b = 100, 140, 40
            if G_DEFUSE_INFO.has_kit then
                r, g, b = 100, 200, 255
            end

            if is_too_late then
                r, g, b = 255, 50, 50
                r = math.min(255, r + pulse)
            end

            surface.draw_filled_rect(bx - 2, by - 2, bar_w + 4, bar_h + 4, 15, 15, 15, 160)
            surface.draw_filled_rect(bx, by, bar_w * d_prog, bar_h, r, g, b, 255)

            local status_txt = string.format("%s DEFUSING... %.1fs", G_DEFUSE_INFO.defuser_name:upper(), d_rem)
            if is_too_late then status_txt = "TOO LATE! RUN!" end

            local tw, th = surface.get_text_size(font_defuse, status_txt)
            surface.draw_text((sw - tw) / 2, by + 10, r, g, b, 255, font_defuse, status_txt)

            if G_DEFUSE_INFO.has_kit then
                local kit_txt = "KIT DETECTED (-50% TIME)"
                local kw, kh = surface.get_text_size(font_weapon, kit_txt)
                surface.draw_text((sw - kw) / 2, by + 28, 150, 200, 255, 200, font_weapon, kit_txt)
            end
        else
            G_DEFUSE_INFO.active = false
        end
    end

    local cur_y = S(10)
    local alerts_order = {"timer", "defuse"}
    local step = globals.frametime() * 8

    local planted_c4 = entity.get_all("CPlantedC4")[1]
    local is_defused = planted_c4 and entity.get_prop(planted_c4, "m_bBombDefused") == 1

    HUD_LAYOUT.alerts.timer.h = (planted_c4 and not is_defused) and S(65) or S(30)
    HUD_LAYOUT.alerts.defuse.active = G_DEFUSE_INFO.active
    HUD_LAYOUT.alerts.defuse.h = S(45)

    local lp_has_kit = lp and entity.get_prop(lp, "m_bHasDefuser") == 1
    local blow_time = (planted_c4 and entity.get_prop(planted_c4, "m_flC4Blow")) or 0
    local b_rem = blow_time - ct
    local defuse_time_needed = lp_has_kit and 5.0 or 10.0
    local is_safe = b_rem > defuse_time_needed
    local can_defuse_with_kit = b_rem > 5.0


    for _, key in ipairs(alerts_order) do
        local a = HUD_LAYOUT.alerts[key]
        if a.active then
            a.target_y = cur_y
            cur_y = cur_y + a.h + 5
        else
            a.target_y = -a.h - 50
        end
        a.y = lerp(a.y, a.target_y, step)
    end

    local cx_screen = math.floor(sw / 2)

    local player_resource = entity.get_player_resource()
    local game_rules      = entity.get_game_rules()
    if player_resource ~= nil and game_rules ~= nil then
        local round_start   = entity.get_prop(game_rules, "m_fRoundStartTime") or 0
        local round_time    = entity.get_prop(game_rules, "m_iRoundTime") or 0
        local is_freeze     = entity.get_prop(game_rules, "m_bFreezePeriod") == 1
        local ct            = globals.curtime()

        local remaining
        local planted_c4 = entity.get_all("CPlantedC4")[1]
        local is_defused = planted_c4 and entity.get_prop(planted_c4, "m_bBombDefused") == 1

        if planted_c4 and not is_defused then
            local blow_time = entity.get_prop(planted_c4, "m_flC4Blow") or 0
            remaining = math.max(0, blow_time - ct)
        elseif G_ROUND_INFO.active then
            remaining = math.max(0, (G_ROUND_INFO.start_time + G_ROUND_INFO.duration) - ct)
        elseif is_freeze then
            remaining = math.max(0, round_start - ct)
        else
            remaining = math.max(0, (round_start + round_time) - ct)
        end

        local time_str
        if planted_c4 then
            time_str = string.format("%.1f", remaining)
        elseif G_ROUND_INFO.active then
            time_str = string.format("0:%02d", math.floor(remaining))
        else
            local mins = math.floor(remaining / 60)
            local secs = math.floor(remaining % 60)
            time_str = string.format("%d:%02d", mins, secs)
        end

    HUD_LAYOUT.alerts.timer.active = (globals.curtime() > 0)

        local ts, cs = get_team_scores()
        local tbg_h, tcx = S(24), cx_screen

        local bg_r, bg_g, bg_b, bg_a = 15, 15, 15, 160
        local br, bg, bb, ba = 40, 40, 40, 150

        local function draw_hud_box(x, y, w, h, text, tr, tg, tb, custom_font)
            if renderer.blur then renderer.blur(x, y, w, h) end
            surface.draw_filled_rect(x, y, w, h, 10, 10, 10, 140)
            surface.draw_outlined_rect(x, y, w, h, 45, 45, 45, 180)
            local use_f = custom_font or font_main
            local tw, th = surface.get_text_size(use_f, text)
            surface.draw_text(x + (w - tw) / 2 + 1, y + (h - th) / 2 + 1, 0, 0, 0, 180, use_f, text)
            surface.draw_text(x + (w - tw) / 2, y + (h - th) / 2, tr, tg, tb, 255, use_f, text)
        end

        local function draw_team_roster(x, y, team_num, alive_count, max_count)
            local dot_size, gap = S(4), S(3)
            local tr, tg, tb = (team_num == 2) and {255, 200, 100} or {100, 200, 255}

            for i = 1, max_count do
                local visual_gap = S(8)
                local dx = (team_num == 2) and (x - visual_gap - (i-1)*(dot_size+gap) - dot_size) or (x + visual_gap + (i-1)*(dot_size+gap))
                local is_alive = (i <= alive_count)
                local dy = y + (S(26) - dot_size) / 2

                if is_alive then
                    surface.draw_filled_rect(dx, dy, dot_size, dot_size, tr[1], tr[2], tr[3], 255)
                    surface.draw_filled_rect(dx-1, dy-1, dot_size+2, dot_size+2, tr[1], tr[2], tr[3], 45)
                else
                    surface.draw_filled_rect(dx, dy, dot_size, dot_size, 35, 35, 35, 140)
                    surface.draw_outlined_rect(dx, dy, dot_size, dot_size, 55, 55, 55, 110)
                end
            end
        end

            if HUD_LAYOUT.alerts.timer.active then
                local ay = HUD_LAYOUT.alerts.timer.y
                local tr, tg, tb = 255, 255, 255
                local tbg_h, timer_w = S(26), S(80)
                local _timer_dx, _timer_dy = HUD.editor.pos("timer", tcx - timer_w / 2, ay)
                tcx = _timer_dx + timer_w / 2
                ay  = _timer_dy
                HUD.editor.bbox("timer", _timer_dx, ay, timer_w, tbg_h)

                local pr = entity.get_player_resource()
                local t_alive, ct_alive, t_total, ct_total = 0, 0, 0, 0

                if pr ~= nil then
                    local tick = globals.tickcount()
                    if not G_PLAYER_COUNT_CACHE or (tick - (G_PLAYER_COUNT_CACHE.tick or 0)) >= 8 then
                        local ta, ca, tt, ct2 = 0, 0, 0, 0
                        for i = 1, 64 do
                            if entity.get_prop(pr, "m_bConnected", i) == 1 then
                                local team = entity.get_prop(pr, "m_iTeam", i)
                                local alive = entity.get_prop(pr, "m_bAlive", i) == 1
                                if team == 2 then tt = tt + 1; if alive then ta = ta + 1 end
                                elseif team == 3 then ct2 = ct2 + 1; if alive then ca = ca + 1 end end
                            end
                        end
                        G_PLAYER_COUNT_CACHE = { t_alive=ta, ct_alive=ca, t_total=tt, ct_total=ct2, tick=tick }
                    end
                    t_alive  = G_PLAYER_COUNT_CACHE.t_alive
                    ct_alive = G_PLAYER_COUNT_CACHE.ct_alive
                    t_total  = G_PLAYER_COUNT_CACHE.t_total
                    ct_total = G_PLAYER_COUNT_CACHE.ct_total
                end

                t_total = math.min(5, t_total)
                ct_total = math.min(5, ct_total)

                if planted_c4 and not is_defused then
                    draw_hud_box(tcx - timer_w / 2, ay, timer_w, tbg_h, "", 255, 255, 255)
                    if images then
                        local c4_ico = images.get_weapon_icon("c4")
                        if c4_ico then
                            local iw, ih = c4_ico:measure()
                            local ratio = iw / ih
                            local draw_h = tbg_h - S(8)
                            local draw_w = math.floor(draw_h * ratio)
                            c4_ico:draw(tcx - draw_w / 2, ay + (tbg_h - draw_h) / 2, draw_w, draw_h, 255, 100, 100, 255)
                        end
                    end
                    local site_num = entity.get_prop(planted_c4, "m_nBombSite")
                    local site_str = (site_num == 0 and "A: " or "B: ") .. time_str .. "s"
                    local sit_w = S(90)
                    tr, tg, tb = 100, 200, 100
                    if not is_safe then
                        if can_defuse_with_kit then tr, tg, tb = 255, 200, 50 else tr, tg, tb = 255, 50, 50 end
                    end
                    draw_hud_box(tcx - sit_w / 2, ay + S(32), sit_w, tbg_h, site_str, tr, tg, tb, font_timer)
                else
                    if remaining <= 40 then
                        local t = remaining / 40
                        tg, tb = math.floor(255 * t), math.floor(255 * t)
                    end
                    draw_hud_box(tcx - timer_w / 2, ay, timer_w, tbg_h, time_str, tr, tg, tb, font_timer)
                end

                local score_w = S(34)
                local _t_sx  = tcx - timer_w / 2 - score_w - S(4)
                local _ct_sx = tcx + timer_w / 2 + S(4)
                draw_hud_box(_t_sx,  ay, score_w, tbg_h, tostring(ts), 255, 200, 100, font_timer)
                draw_hud_box(_ct_sx, ay, score_w, tbg_h, tostring(cs), 100, 200, 255, font_timer)

                do
                    local ic_sz = S(21)
                    local ic_sz2 = S(23)
                    local ic_y  = ay + tbg_h + S(3)
                    local total = ic_sz * 2 + S(12)
                    local sx    = tcx - total / 2
                    HUD.icons.draw("t_side",  sx + ic_sz + S(-65), ic_y, ic_sz2, 255, 200, 100, 255)
                    HUD.icons.draw("ct_side", sx + ic_sz + S(56),  ic_y, ic_sz, 100, 200, 255, 255)
                end

                draw_team_roster(tcx - timer_w / 2 - score_w - S(4), ay, 2, t_alive, t_total)
                draw_team_roster(tcx + timer_w / 2 + score_w + S(4), ay, 3, ct_alive, ct_total)
            end
        end

    if not entity.is_alive(lp) then
        do
            local obs_mode = entity.get_prop(lp, "m_iObserverMode") or 0
            if obs_mode == 4 or obs_mode == 5 then
                local obs_handle = entity.get_prop(lp, "m_hObserverTarget")
                if obs_handle and obs_handle ~= 0 then
                    local target = bit.band(obs_handle, 0xFFFF)
                    if target > 0 and target <= 64 and target ~= lp then
                        local t_name = entity.get_player_name(target) or "Unknown"
                        local t_team = entity.get_prop(target, "m_iTeamNum") or 0
                        local t_hp   = entity.get_prop(target, "m_iHealth") or 0
                        local t_armor = entity.get_prop(target, "m_ArmorValue") or 0
                        local t_money = entity.get_prop(target, "m_iAccount") or 0
                        local t_has_defuser = entity.get_prop(target, "m_bHasDefuser") == 1
                        local t_has_helmet  = entity.get_prop(target, "m_bHasHelmet") == 1

                        local name_r, name_g, name_b = 255, 255, 255
                        if t_team == 2 then name_r, name_g, name_b = 255, 200, 100
                        elseif t_team == 3 then name_r, name_g, name_b = 100, 200, 255 end

                        local panel_w = S(340)
                        local panel_h = S(52)
                        local avatar_sz = S(36)
                        local panel_x = (sw - panel_w) / 2
                        local panel_y = sh - panel_h - S(80)

                        surface.draw_filled_rect(panel_x, panel_y, panel_w, panel_h, 10, 10, 10, 180)
                        surface.draw_outlined_rect(panel_x, panel_y, panel_w, panel_h, 45, 45, 45, 180)

                        surface.draw_filled_rect(panel_x, panel_y, panel_w, S(2), name_r, name_g, name_b, 200)

                        local av_x = panel_x + S(8)
                        local av_y = panel_y + (panel_h - avatar_sz) / 2
                        local avatar = nil
                        if images and images.get_player_avatar then
                            pcall(function() avatar = images.get_player_avatar(target) end)
                        end
                        if avatar then
                            pcall(function()
                                if type(avatar) == "table" and avatar.draw then
                                    avatar:draw(av_x, av_y, avatar_sz, avatar_sz, 255, 255, 255, 255)
                                else
                                    renderer.texture(avatar, av_x, av_y, avatar_sz, avatar_sz, 255, 255, 255, 255)
                                end
                            end)
                        else
                            surface.draw_filled_rect(av_x, av_y, avatar_sz, avatar_sz, 30, 30, 30, 200)
                        end
                        surface.draw_outlined_rect(av_x, av_y, avatar_sz, avatar_sz, 60, 60, 60, 200)

                        local text_x = av_x + avatar_sz + S(10)
                        local nw, nh = surface.get_text_size(font_main, t_name)
                        surface.draw_text(text_x + 1, panel_y + S(8) + 1, 0, 0, 0, 180, font_main, t_name)
                        surface.draw_text(text_x, panel_y + S(8), name_r, name_g, name_b, 255, font_main, t_name)

                        local info_y = panel_y + S(8) + nh + S(4)
                        local info_parts = {}

                        local hp_p = math.max(0, math.min(1, t_hp / 100))
                        local hp_r = math.floor(255 - 95 * hp_p)
                        local hp_g = math.floor(130 + 80 * hp_p)
                        local hp_b = math.floor(130 + 10 * hp_p)

                        local hp_str = "HP: " .. tostring(t_hp)
                        local hw, hh = surface.get_text_size(font_hp_ap, hp_str)
                        HUD.icons.draw("hp", text_x, info_y - 1, S(12), 200, 120, 130, 255)
                        surface.draw_text(text_x + S(14), info_y, hp_r, hp_g, hp_b, 255, font_hp_ap, hp_str)

                        local cx = text_x + S(14) + hw + S(12)

                        local ap_str = "AP: " .. tostring(t_armor)
                        if t_has_helmet then ap_str = ap_str .. "+H" end
                        local aw, ah = surface.get_text_size(font_hp_ap, ap_str)
                        HUD.icons.draw("ap", cx, info_y - 1, S(12), 130, 165, 210, 255)
                        surface.draw_text(cx + S(14), info_y, 130, 185, 220, 255, font_hp_ap, ap_str)

                        cx = cx + S(14) + aw + S(12)

                        local money_str = "$" .. tostring(t_money)
                        HUD.icons.draw("money", cx, info_y - 1, S(12), 145, 200, 130, 255)
                        surface.draw_text(cx + S(14), info_y, 145, 200, 130, 255, font_hp_ap, money_str)

                        if t_has_defuser then
                            local dk_str = "KIT"
                            local dkw, dkh = surface.get_text_size(font_hp_ap, dk_str)
                            local dk_x = panel_x + panel_w - dkw - S(10)
                            surface.draw_text(dk_x, info_y, 100, 200, 255, 200, font_hp_ap, dk_str)
                        end

                        local t_weapon = entity.get_player_weapon(target)
                        if t_weapon then
                            local wpn_icon = fetch_icon(t_weapon, entity.get_classname(t_weapon))
                            if wpn_icon then
                                local iw, ih = wpn_icon:measure()
                                local icon_h = S(18)
                                local icon_w = math.floor(iw * (icon_h / ih))
                                local icon_x = panel_x + panel_w - icon_w - S(10)
                                local icon_y = panel_y + S(6)
                                wpn_icon:draw(icon_x, icon_y, icon_w, icon_h, 200, 200, 200, 220)
                            end
                        end

                        local mode_str = obs_mode == 4 and "FIRST PERSON" or "THIRD PERSON"
                        local mw, mh = surface.get_text_size(font_weapon, mode_str)
                        surface.draw_text(panel_x + (panel_w - mw) / 2, panel_y - mh - S(3), 180, 180, 180, 180, font_weapon, mode_str)

                        HUD.editor.bbox("spectator", panel_x, panel_y - mh - S(3), panel_w, panel_h + mh + S(3))
                    end
                end
            end
        end
        goto draw_killfeed
    end

    do
        local pw, ph = 450, 49
        local px, py = HUD.editor.pos("hp_ap", 0, sh - ph)

        local function format_num(n)
            return tostring(n)
        end

        local function draw_stat_box(bx, by, bw, bh, label, value, r, g, b, max_val, is_money, icon_name)
            surface.draw_filled_rect(bx, by, bw, bh, 15, 15, 15, 160)
            surface.draw_outlined_rect(bx, by, bw, bh, 40, 40, 40, 150)

            local v_str = is_money and format_num(value) or tostring(value)
            local l_str = label .. ":"

            local lw, lh = surface.get_text_size(font_hp_ap, l_str)
            local vw, vh = surface.get_text_size(font_hp_ap, v_str)
            local gap = S(4)

            local icon_sz = math.floor(bh - S(10))
            if icon_sz < 8 then icon_sz = 8 end
            local icon_w = (icon_name and HUD.icons._defs[icon_name]) and (icon_sz + S(3)) or 0
            local total_tw = icon_w + lw + gap + vw

            local start_tx = bx + (bw - total_tw) / 2
            local cur_x = start_tx

            if icon_w > 0 then
                local icon_y = by + math.floor((bh - icon_sz) / 2)
                local ir, ig, ib = 255, 255, 255
                if     icon_name == "hp"    then ir, ig, ib = 200, 120, 130; icon_y = icon_y - 1
                elseif icon_name == "ap"    then ir, ig, ib = 130, 165, 210; icon_y = icon_y - 1
                elseif icon_name == "money" then ir, ig, ib = 145, 200, 130
                end
                HUD.icons.draw(icon_name, cur_x, icon_y, icon_sz, ir, ig, ib, 255)
                cur_x = cur_x + icon_w
            end

            surface.draw_text(cur_x + 1, by + (bh - lh) / 2, 0, 0, 0, 200, font_hp_ap, l_str)
            surface.draw_text(cur_x + lw + gap + 1, by + (bh - vh) / 2, 0, 0, 0, 200, font_hp_ap, v_str)

            surface.draw_text(cur_x, by + (bh - lh) / 2 - 1, 255, 255, 255, 255, font_hp_ap, l_str)
            surface.draw_text(cur_x + lw + gap, by + (bh - vh) / 2 - 1, 255, 255, 255, 255, font_hp_ap, v_str)

            local fill = (math.min(max_val or 100, value) / (math.min(max_val or 100, value) > 0 and (max_val or 100) or 1)) * (bw - S(4))
            local fr, fg, fb = r, g, b
            if icon_name == "hp" then fr, fg, fb = 200, 120, 130 end
            surface.draw_filled_rect(bx + S(2), by + bh - S(3), fill, S(2), fr, fg, fb, 255)
        end

        local hp = entity.get_prop(lp, "m_iHealth") or 0
        local hp_p = math.max(0, math.min(1, hp / 100))
        local hr = math.floor(220 - (220 - 160) * hp_p)
        local hg = math.floor(130 + (210 - 130) * hp_p)
        local hb = math.floor(130 + (140 - 130) * hp_p)
        local _hpap_y = py + (sh - S(40.5)) - (sh - ph)
        local _shift_y = py - (sh - ph)
        draw_stat_box(px + S(20), sh - S(40.5) + _shift_y, S(68), S(24), "HP", hp, hr, hg, hb, nil, false, "hp")

        local ar = entity.get_prop(lp, "m_ArmorValue") or 0
        local ar_p = math.max(0, math.min(1, ar / 100))
        local ar_r = math.floor(120 + (160 - 120) * ar_p)
        local ar_g = math.floor(130 + (185 - 130) * ar_p)
        local ar_b = math.floor(160 + (220 - 160) * ar_p)
        draw_stat_box(px + S(93), sh - S(40.5) + _shift_y, S(68), S(24), "AP", ar, ar_r, ar_g, ar_b, 100, false, "ap")

        local mn = entity.get_prop(lp, "m_iAccount") or 0
        local mn_p = math.max(0, math.min(1, mn / 16000))
        local mr = math.floor(130 + (160 - 130) * mn_p)
        local mg = math.floor(150 + (210 - 150) * mn_p)
        local mb = math.floor(120 + (150 - 120) * mn_p)
        draw_stat_box(px + S(166), sh - S(40.5) + _shift_y, S(75), S(24), "$", mn, mr, mg, mb, 16000, true, "money")

        HUD.editor.bbox("hp_ap", px + S(20), sh - S(40.5) + _shift_y, S(75) + (S(166) - S(20)), S(24))

        local active_weapon = entity.get_player_weapon(lp)
        local raw_weapons   = get_weapons(lp)
        local wpn_r, wpn_g, wpn_b = ui.get(ui_wpn_color)
        local grouped = {}
        local melee_g = {}
        local grenades = {}
        for _, wpn in ipairs(raw_weapons) do
            if wpn.slot == 4 then table.insert(grenades, wpn)
            elseif wpn.slot == 3 then table.insert(melee_g, wpn)
            else table.insert(grouped, { items = { wpn }, slot = wpn.slot }) end
        end
        if #melee_g  > 0 then table.insert(grouped, { items = melee_g,  slot = 3 }) end
        if #grenades > 0 then table.insert(grouped, { items = grenades, slot = 4 }) end
        table.sort(grouped, function(a, b) return a.slot < b.slot end)

        local sel_h, sel_gap = S(26), S(6)
        local sel_y = sh - S(44) - #grouped * (sel_h + sel_gap)
        local slot_w, slot_h, slot_margin = S(10), S(14), S(14)
        local slot_x  = sw - slot_w - slot_margin
        local slot_y2 = sel_y + math.floor((sel_h - slot_h) / 2)
        local _wp_block_x_default = sw
        local _wp_block_y_default = sh - S(44)
        local _wp_x, _wp_y = HUD.editor.pos("weapons", _wp_block_x_default, _wp_block_y_default)
        local _wp_dx = _wp_x - _wp_block_x_default
        local _wp_dy = _wp_y - _wp_block_y_default
        sel_y = sel_y + _wp_dy
        local _wp_first_sel_y = sel_y
        local sw = sw + _wp_dx

        for _, group in ipairs(grouped) do
            local items = group.items
            local is_active_row, active_item = false, nil
            for _, itm in ipairs(items) do
                if itm.ent == active_weapon then is_active_row = true; active_item = itm; break end
            end
            local slot_x  = sw - slot_w - slot_margin
            local slot_y2 = sel_y + math.floor((sel_h - slot_h) / 2)
            local icon_cx = slot_x - S(8) - S(32)
            local is_grp = (group.slot == 3 or group.slot == 4)
            local item_spacing = (group.slot == 3) and S(38) or S(22)
            local extra_w = is_grp and math.max(0, (#items - 1) * item_spacing) or 0
            local icon_area_left = icon_cx - S(32) - extra_w
            local primary_item = active_item or items[#items]
            local dn = string.upper(primary_item.name)
            local nw, nh = surface.get_text_size(font_weapon, dn)

            local row_w = S(110)
            local row_x = sw - row_w
            surface.draw_filled_rect(row_x, sel_y, row_w, sel_h, 15, 15, 15, 160)
            surface.draw_outlined_rect(row_x, sel_y, row_w, sel_h, 40, 40, 40, 150)

            if is_active_row then
                surface.draw_filled_rect(row_x, sel_y, S(2), sel_h, 100, 140, 40, 255)
                surface.draw_text(row_x - nw - S(8) + 1, sel_y + (sel_h - nh) / 2 + 1, 0, 0, 0, 150, font_weapon, dn)
                surface.draw_text(row_x - nw - S(8), sel_y + (sel_h - nh) / 2, 255, 255, 255, 220, font_weapon, dn)
            else
                surface.draw_text(row_x - nw - S(8) + 1, sel_y + (sel_h - nh) / 2 + 1, 0, 0, 0, 80, font_weapon, dn)
                surface.draw_text(row_x - nw - S(8), sel_y + (sel_h - nh) / 2, 200, 200, 200, 100, font_weapon, dn)
            end
            surface.draw_filled_rect(slot_x, slot_y2, slot_w, slot_h, 180, 180, 180, 160)
            local ss = tostring(group.slot)
            local ssw, ssh = surface.get_text_size(font_weapon, ss)
            surface.draw_text(slot_x + (slot_w - ssw) / 2, slot_y2 + (slot_h - ssh) / 2, 20, 20, 20, 255, font_weapon, ss)

            local wpn_icon = fetch_icon(primary_item.ent, primary_item.classname)
            local dw, dh = 0, 0
            if wpn_icon then
                local iw, ih = wpn_icon:measure()
                local is_grenade = primary_item.classname:find("Grenade") or primary_item.classname:find("Flashbang") or primary_item.classname:find("Molotov")
                dh = is_grenade and (sel_h - S(6)) or (sel_h - S(10))
                dw = dh * (iw / ih)
                local y_nudge = is_grenade and -S(2) or 0
                wpn_icon:draw(math.floor(icon_cx - dw / 2), math.floor(sel_y + (sel_h - dh) / 2 + y_nudge), math.floor(dw), math.floor(dh), wpn_r, wpn_g, wpn_b, 255)
            else
                surface.draw_text(icon_cx - S(5), sel_y + (sel_h - S(10)) / 2, wpn_r, wpn_g, wpn_b, 255, font_weapon, "?")
            end

            if is_grp and #items > 1 then
                local dot_w2, dot_h2 = S(2), S(2)
                local dot_gap2       = S(6)
                local active_w       = S(4)
                local total_dw       = (#items - 1) * dot_gap2 + active_w
                local offset         = (group.slot == 3) and S(26) or S(22)
                local dots_sx        = icon_cx - offset - total_dw
                local dot_y2         = sel_y + (sel_h - dot_h2) / 2

                local current_x = dots_sx
                for idx = 1, #items do
                    local ispri = (items[idx].ent == active_weapon)
                    local dw    = ispri and active_w or dot_w2
                    surface.draw_filled_rect(current_x, dot_y2, dw, dot_h2, wpn_r, wpn_g, wpn_b, ispri and 255 or 100)
                    current_x = current_x + dot_gap2
                end
            end
            sel_y = sel_y + sel_h + sel_gap
        end

        if active_weapon then
            local clip = entity.get_prop(active_weapon, "m_iClip1")
            local reserve = entity.get_prop(active_weapon, "m_iPrimaryReserveAmmoCount") or 0
            surface.draw_filled_gradient_rect(sw - S(200), sel_y, S(200), sel_h, 30, 30, 30, 0, 25, 25, 25, 130, true)
            local ai = fetch_icon(active_weapon, entity.get_classname(active_weapon))
            local adw, adh = 0, 0
            if ai then
                local aiw, aih = ai:measure()
                local is_grenade = (entity.get_classname(active_weapon) or ""):find("Grenade") or
                                   (entity.get_classname(active_weapon) or ""):find("Flashbang") or
                                   (entity.get_classname(active_weapon) or ""):find("Molotov")
                adh = is_grenade and (sel_h - S(6)) or (sel_h - S(10))
                adw = adh * (aiw / aih)
                local y_nudge = is_grenade and -S(2) or 0
                ai:draw(math.floor(sw - S(64) - adw / 2), math.floor(sel_y + (sel_h - adh) / 2 + y_nudge), math.floor(adw), math.floor(adh), wpn_r, wpn_g, wpn_b, 255)
            end
            if clip ~= nil and (clip >= 0 or reserve > 0) then
                local cs2, rs2 = tostring(math.max(0, clip)), tostring(reserve)
                local cw2, ch2 = surface.get_text_size(font_numbers, cs2)
                local r_str    = "/ " .. rs2
                local rw2, rh2 = surface.get_text_size(font_hp_ap, r_str)

                local ammo_right = sw - S(64) - S(36)

                local icon_cy  = math.floor(sel_y + (sel_h - adh) / 2 + adh / 2)
                local clip_y   = math.floor(icon_cy - ch2 / 2)
                local res_y    = math.floor(icon_cy - rh2 / 2)
                local total_w2 = cw2 + S(6) + rw2
                local block_x  = ammo_right - total_w2

                surface.draw_text(block_x + 1, clip_y + 1,   0,   0,   0, 180, font_numbers, cs2)
                surface.draw_text(block_x,     clip_y,      wpn_r, wpn_g, wpn_b, 255, font_numbers, cs2)

                local rx = block_x + cw2 + S(6)
                surface.draw_text(rx + 1, res_y + 1,   0,   0,   0,  80, font_hp_ap, r_str)
                surface.draw_text(rx,     res_y,      180, 180, 180, 120, font_hp_ap, r_str)

                local cls = entity.get_classname(active_weapon) or ""
                local supports_burst = (cls == "CWeaponGlock" or cls == "CWeaponFamas")
                if supports_burst then
                    local burst = entity.get_prop(active_weapon, "m_bBurstMode") == 1
                    local badge = burst and "BRST" or "SEMI"
                    local br2, bg2, bb2 = burst and 255 or 180, burst and 200 or 180, burst and 100 or 180
                    local bw2, bh2 = surface.get_text_size(font_weapon, badge)
                    local ax  = sw - slot_w - slot_margin
                    local ay2 = sel_y + math.floor((sel_h - slot_h) / 2)
                    surface.draw_text(
                        math.floor(ax + (slot_w - bw2) / 2),
                        math.floor(ay2 + (slot_h - bh2) / 2),
                        br2, bg2, bb2, 220, font_weapon, badge)
                end
            end
        end
        HUD.editor.bbox("weapons", sw - S(220), _wp_first_sel_y, S(220), (sel_y + sel_h) - _wp_first_sel_y)
    end

    do
        local cx_s, cy_s = sw / 2, sh / 2
        local eye_x, eye_y, eye_z = client.eye_position()
        local hit_ent = nil
        if eye_x then
            local pitch, yaw = client.camera_angles()
            if pitch and yaw then
                local rad_p = math.rad(pitch)
                local rad_y = math.rad(yaw)
                local cos_p = math.cos(rad_p)
                local dir_x = cos_p * math.cos(rad_y)
                local dir_y = cos_p * math.sin(rad_y)
                local dir_z = -math.sin(rad_p)
                local range = 8192
                local end_x = eye_x + dir_x * range
                local end_y = eye_y + dir_y * range
                local end_z = eye_z + dir_z * range

                local frac, hit = client.trace_line(lp, eye_x, eye_y, eye_z, end_x, end_y, end_z)
                if hit and hit > 0 and hit <= 64 then
                    hit_ent = hit
                end
            end
        end

        if hit_ent then
            local tid_name = entity.get_player_name(hit_ent) or ""
            local tid_team = entity.get_prop(hit_ent, "m_iTeamNum") or 0
            local tid_hp   = entity.get_prop(hit_ent, "m_iHealth") or 0
            local tid_armor = entity.get_prop(hit_ent, "m_ArmorValue") or 0
            local tid_has_helmet = entity.get_prop(hit_ent, "m_bHasHelmet") == 1
            local tid_has_defuser = entity.get_prop(hit_ent, "m_bHasDefuser") == 1
            local my_team = entity.get_prop(lp, "m_iTeamNum") or 0
            local is_teammate = (tid_team == my_team)

            if tid_name ~= "" and entity.is_alive(hit_ent) then
                local nr, ng, nb = 255, 255, 255
                if is_teammate then
                    if tid_team == 2 then nr, ng, nb = 255, 200, 100
                    elseif tid_team == 3 then nr, ng, nb = 100, 200, 255 end
                else
                    nr, ng, nb = 255, 80, 80
                end

                local tid_y = cy_s + S(30)

                local nw_tid, nh_tid = surface.get_text_size(font_tid_name, tid_name)
                local tid_x = cx_s - nw_tid / 2
                surface.draw_text(tid_x + 1, tid_y + 1, 0, 0, 0, 200, font_tid_name, tid_name)
                surface.draw_text(tid_x, tid_y, nr, ng, nb, 255, font_tid_name, tid_name)

                if is_teammate then
                    local bar_w = S(80)
                    local bar_h = S(4)
                    local bar_x = cx_s - bar_w / 2
                    local bar_y = tid_y + nh_tid + S(4)

                    surface.draw_filled_rect(bar_x, bar_y, bar_w, bar_h, 30, 30, 30, 180)
                    surface.draw_outlined_rect(bar_x, bar_y, bar_w, bar_h, 50, 50, 50, 150)

                    local hp_pct = math.max(0, math.min(1, tid_hp / 100))
                    local hp_r = math.floor(255 - 95 * hp_pct)
                    local hp_g = math.floor(80 + 130 * hp_pct)
                    local hp_b = 80
                    surface.draw_filled_rect(bar_x + 1, bar_y + 1, (bar_w - 2) * hp_pct, bar_h - 2, hp_r, hp_g, hp_b, 255)

                    local hp_str = tostring(tid_hp) .. " HP"
                    local hpw, _ = surface.get_text_size(font_tid_info, hp_str)
                    surface.draw_text(cx_s - hpw / 2 + 1, bar_y + bar_h + S(3) + 1, 0, 0, 0, 150, font_tid_info, hp_str)
                    surface.draw_text(cx_s - hpw / 2, bar_y + bar_h + S(3), 180, 180, 180, 220, font_tid_info, hp_str)

                    local tid_wpn = entity.get_player_weapon(hit_ent)
                    if tid_wpn then
                        local wpn_ico = fetch_icon(tid_wpn, entity.get_classname(tid_wpn))
                        if wpn_ico then
                            local iw, ih = wpn_ico:measure()
                            local ico_h = S(14)
                            local ico_w = math.floor(iw * (ico_h / ih))
                            local ico_x = cx_s - ico_w / 2
                            local ico_y = bar_y + bar_h + S(16)
                            wpn_ico:draw(ico_x, ico_y, ico_w, ico_h, 200, 200, 200, 200)
                        end
                    end
                end
            end
        end
    end

    ::draw_killfeed::
    status, err = pcall(function()
        local sw, sh = client.screen_size()
        local kx, ky = HUD.editor.pos("killfeed", sw - S(12), S(40))
        local gap, icon_h = S(6), S(14)
        local kf_min_x, kf_max_y = kx, ky
        local kf_max_x, kf_min_y = kx, ky

        for i = #kill_log, 1, -1 do if globals.realtime() - kill_log[i].time > 6.0 then table.remove(kill_log, i) end end
        local _kf_render_limit = math.min(#kill_log, 6)
        for i = 1, _kf_render_limit do
            local k = kill_log[i]
            local dt = globals.realtime() - k.time
            local alpha = 255
            if dt < 0.3 then alpha = math.floor(255 * (dt / 0.3)) elseif dt > 5.5 then alpha = math.floor(255 * (1.0 - (dt - 5.5) / 0.5)) end
            alpha = math.max(0, math.min(255, alpha))

            k.y_offset = k.y_offset + (0 - k.y_offset) * globals.frametime() * 10
            k.x_offset = k.x_offset + (0 - k.x_offset) * globals.frametime() * 8

            local function get_team_color(team)
                if team == 2 then return 255, 200, 100
                elseif team == 3 then return 100, 200, 255
                end
                return 225, 225, 225
            end

            local ar, ag, ab = get_team_color(k.a_team)
            local vr, vg, vb = get_team_color(k.v_team)
            local asr, asg, asb = get_team_color(k.as_team)
            local paper_r, paper_g, paper_b = 210, 210, 210

            local aw_w, _ = surface.get_text_size(font_main, k.attacker or "")
            local aw = math.ceil(aw_w)

            local asw = 0
            if k.assister and k.assister ~= "" then
                local w_as, _ = surface.get_text_size(font_main, k.assister)
                asw = math.ceil(w_as)
            end

            local vw_w, _ = surface.get_text_size(font_main, k.victim or "")
            local vw = math.ceil(vw_w)

            local tw = 0
            local tac_icon_sz = S(14)
            for _, obj in ipairs(k.tac_icon_objs or {}) do
                local mw, mh = obj:measure()
                tw = tw + math.ceil(mw * (tac_icon_sz / mh)) + S(2)
            end
            for _, _key in ipairs(k.extra_mod_keys or {}) do
                if HUD.icons._defs[_key] then
                    tw = tw + tac_icon_sz + S(2)
                end
            end

            if k.wpn_svg_obj then
                local mw, mh = k.wpn_svg_obj:measure()
                wiw = math.ceil(mw * (S(12) / mh))
            else
                local w_wp, _ = surface.get_text_size(font_main, "["..(k.weapon or "knife").."]")
                wiw = math.ceil(w_wp)
            end

            local pad_l = S(6)
            local gap_av = k.a_av_obj and S(8) or 0
            local gap_1 = S(4)
            local gap_2 = S(5)
            local gap_3 = S(1)
            local gap_4 = S(3)
            local pad_r = S(6)

            local content_w = pad_l + gap_av + gap_1 + aw + asw + gap_2 + wiw + gap_4 + tw + gap_3 + vw + pad_r
            local _, main_th = surface.get_text_size(font_main, "W")
            local row_h = main_th + S(5)
            local rx, ry = kx - content_w + S(k.x_offset), ky + (i-1) * (row_h + S(4)) + S(k.y_offset)

            if rx < kf_min_x then kf_min_x = rx end
            if rx + content_w > kf_max_x then kf_max_x = rx + content_w end
            if ry < kf_min_y then kf_min_y = ry end
            if ry + row_h > kf_max_y then kf_max_y = ry + row_h end

            if renderer.blur then
                renderer.blur(rx, ry, content_w, row_h)
            end

            local br, bg, bb, bg_a = 5, 5, 5, math.floor(160 * alpha / 255)
            local out_r, out_g, out_b = 60, 60, 60
            local out_a = math.floor(200 * alpha / 255)

            if k.is_death then
                out_a = math.floor(255 * alpha / 255)
                bg_a = math.floor(180 * alpha / 255)
                br, bg, bb = 150, 20, 20
                out_r, out_g, out_b = 255, 60, 60
            elseif k.is_local then
                out_r, out_g, out_b = 255, 40, 40
                out_a = math.floor(255 * alpha / 255)
                bg_a = math.floor(110 * alpha / 255); br, bg, bb = 5, 5, 5
            else
                out_r, out_g, out_b = 60, 60, 60
                out_a = math.floor(200 * alpha / 255)
                bg_a = math.floor(130 * alpha / 255); br, bg, bb = 5, 5, 5
            end

            renderer.rectangle(rx, ry, content_w, row_h, br, bg, bb, bg_a, S(4))
            if out_a > 0 then
                local rd = S(4)
                renderer.circle_outline(rx + rd, ry + rd, out_r, out_g, out_b, out_a, rd, 180, 0.25, 1)
                renderer.circle_outline(rx + content_w - rd, ry + rd, out_r, out_g, out_b, out_a, rd, 270, 0.25, 1)
                renderer.circle_outline(rx + content_w - rd, ry + row_h - rd, out_r, out_g, out_b, out_a, rd, 0, 0.25, 1)
                renderer.circle_outline(rx + rd, ry + row_h - rd, out_r, out_g, out_b, out_a, rd, 90, 0.25, 1)

                renderer.line(rx + rd, ry, rx + content_w - rd, ry, out_r, out_g, out_b, out_a)
                renderer.line(rx + rd, ry + row_h, rx + content_w - rd, ry + row_h, out_r, out_g, out_b, out_a)
                renderer.line(rx, ry + rd, rx, ry + row_h - rd, out_r, out_g, out_b, out_a)
                renderer.line(rx + content_w, ry + rd, rx + content_w, ry + row_h - rd, out_r, out_g, out_b, out_a)
            end

            local curr_x = rx + pad_l
            local text_y = ry + (row_h - main_th) / 2
            local icon_y = ry + (row_h - S(12)) / 2
            local av_y = ry + (row_h - S(10)) / 2

            if k.a_av_obj then
                k.a_av_obj:draw(curr_x, av_y, S(10), S(10), 255, 255, 255, alpha)
                curr_x = curr_x + gap_av + gap_1
            else
                curr_x = curr_x + gap_1
            end

            surface.draw_text(curr_x + S(1), text_y + S(1), 0, 0, 0, math.floor(200 * alpha / 255), font_main, k.attacker or "")
            surface.draw_text(curr_x, text_y, ar, ag, ab, alpha, font_main, k.attacker or ""); curr_x = curr_x + aw

            if k.assister and k.assister ~= "" then
                surface.draw_text(curr_x + S(1), text_y + S(1), 0, 0, 0, math.floor(200 * alpha / 255), font_main, k.assister)
                surface.draw_text(curr_x, text_y, asr, asg, asb, alpha, font_main, k.assister); curr_x = curr_x + asw
            end

            curr_x = curr_x + gap_2
            if k.wpn_svg_obj then
                k.wpn_svg_obj:draw(curr_x, icon_y, wiw, S(12), paper_r, paper_g, paper_b, alpha)
                curr_x = curr_x + wiw
            else
                surface.draw_text(curr_x, text_y, paper_r, paper_g, paper_b, alpha, font_main, "["..(k.weapon or "knife").."]")
                curr_x = curr_x + wiw
            end

            curr_x = curr_x + gap_4
            local tac_icon_sz = S(14)
            for _, obj in ipairs(k.tac_icon_objs or {}) do
                local mw, mh = obj:measure()
                local iw = math.ceil(mw * (tac_icon_sz / mh))
                local icon_cy = ry + math.floor((row_h - tac_icon_sz) / 2)
                obj:draw(curr_x, icon_cy, iw, tac_icon_sz, paper_r, paper_g, paper_b, alpha)
                curr_x = curr_x + iw + S(2)
            end
            for _, _key in ipairs(k.extra_mod_keys or {}) do
                if HUD.icons._defs[_key] then
                    local icon_cy = ry + math.floor((row_h - tac_icon_sz) / 2)
                    HUD.icons.draw(_key, curr_x, icon_cy, tac_icon_sz, paper_r, paper_g, paper_b, alpha)
                    curr_x = curr_x + tac_icon_sz + S(2)
                end
            end
            if k.tac_info and k.tac_info ~= "" then
            end

            curr_x = curr_x + gap_3
            surface.draw_text(curr_x + S(1), text_y + S(1), 0, 0, 0, math.floor(200 * alpha / 255), font_main, k.victim or "")
            surface.draw_text(curr_x, text_y, vr, vg, vb, alpha, font_main, k.victim or "")
        end
        if #kill_log > 0 and HUD.editor and HUD.editor.bbox then
            HUD.editor.bbox("killfeed", kf_min_x, kf_min_y, kf_max_x - kf_min_x, kf_max_y - kf_min_y)
        end
    end)

    end

    if INTEL_MODULE and INTEL_MODULE.draw then
        INTEL_MODULE.draw()
    end

    ::draw_console_final::
    if CON_MODULE.anim_alpha > 0.01 then
        draw_console()
        poll_keyboard()
    end


    HUD.editor.enabled = ui.get(ui_editor_enable) == true
    if HUD.editor.enabled then
        local sw_e, sh_e = client.screen_size()
        if #kill_log == 0 then
            local ax, ay = HUD.editor.pos("killfeed", sw_e - S(12), S(40))
            HUD.editor.bbox("killfeed", ax - S(200), ay, S(200), S(22))
        end
        if not CHAT_MODULE or CHAT_MODULE.anim_alpha < 0.05 then
            local cw_e, ch_e = S(500), S(240)
            local cx_e, cy_e = HUD.editor.pos("chat", S(20), sh_e - ch_e - S(60))
            HUD.editor.bbox("chat", cx_e, cy_e, cw_e, ch_e)
        end
        if not INTEL_MODULE or INTEL_MODULE.anim_alpha < 0.05 then
            local ibw, ibh = S(70), S(24)
            local itw = (ibw * 3) + (S(4) * 2)
            local ix_e, iy_e = HUD.editor.pos("intel", (sw_e - itw) / 2, sh_e - S(40.5))
            HUD.editor.bbox("intel", ix_e, iy_e, itw, ibh)
        end
        local lp_e = entity.get_local_player()
        if not lp_e or (entity.get_prop(lp_e, "m_iHealth") or 0) <= 0 then
            local px_e, py_e = HUD.editor.pos("hp_ap", 0, sh_e - 49)
            HUD.editor.bbox("hp_ap", px_e + S(20), py_e + (sh_e - S(40.5)) - (sh_e - 49), S(75) + (S(166) - S(20)), S(24))
        end
        if not (HUD_LAYOUT and HUD_LAYOUT.alerts and HUD_LAYOUT.alerts.timer and HUD_LAYOUT.alerts.timer.active) then
            local tw_e = S(80)
            local tx_e, ty_e = HUD.editor.pos("timer", math.floor(sw_e / 2) - tw_e / 2, S(15))
            HUD.editor.bbox("timer", tx_e, ty_e, tw_e, S(26))
        end
        if not lp_e or (entity.get_prop(lp_e, "m_iHealth") or 0) <= 0 then
            local wx_e, wy_e = HUD.editor.pos("weapons", sw_e - S(200) - S(40), sh_e - S(140))
            HUD.editor.bbox("weapons", wx_e, wy_e, S(220), S(120))
        end
    end
    HUD.editor.paint_overlay()

    MOUSE_DOWN_PREV = mouse_left or mouse_right
end


local function set_mvp_data(ent)
    if not ent or ent == 0 then return end
    G_ROUND_INFO.mvp_ent = ent
    G_ROUND_INFO.mvp_name = entity.get_player_name(ent)

    local pr = entity.get_player_resource()
    local kills, deaths = 0, 0
    if pr then
        kills = entity.get_prop(pr, "m_iKills", ent) or 0
        deaths = entity.get_prop(pr, "m_iDeaths", ent) or 0
    end
    G_ROUND_INFO.mvp_kd = string.format("%d/%d", kills, deaths)

    if images then
        local steamid64 = entity.get_steam64(ent)
        if steamid64 then
            G_ROUND_INFO.mvp_avatar = images.get_steam_avatar(steamid64)
        end
    end
end

client.set_event_callback("round_end", function(e)
    local gr = entity.get_game_rules()
    local is_match_end = false
    if gr ~= nil then
        is_match_end = (entity.get_prop(gr, "m_bIsTournamentMatchGameOver") == 1) or (entity.get_prop(gr, "m_bMatchWaitingForResume") == 1)
    end
    G_ROUND_INFO.winner = e.winner
    G_ROUND_INFO.active = true
    G_ROUND_INFO.duration = is_match_end and 17.0 or 8.0
    G_ROUND_INFO.start_time = globals.curtime()

    if e.reason == 1 and G_PLANT_INFO.planter_ent then
        set_mvp_data(G_PLANT_INFO.planter_ent)
    elseif e.reason == 7 and G_DEFUSE_INFO.defuser_ent then
        set_mvp_data(G_DEFUSE_INFO.defuser_ent)
    end
end)

client.set_event_callback("round_mvp", function(e)
    local ent = client.userid_to_entindex(e.userid)
    set_mvp_data(ent)
end)

client.set_event_callback("round_start", function()
    G_ROUND_INFO.active = false
    G_ROUND_INFO.mvp_name = ""
    G_ROUND_INFO.mvp_avatar = nil
    G_PLANT_INFO.active = false
    G_DEFUSE_INFO.active = false
    G_TEAM_MENU_ACTIVE = false

    if INTEL_MODULE then
        INTEL_MODULE.rounds = INTEL_MODULE.rounds + 1
        update_intel_stats()
    end
end)

client.set_event_callback("bomb_beginplant", function(e)
    local ent = client.userid_to_entindex(e.userid)
    if ent == entity.get_local_player() then
        G_PLANT_INFO.active = true
        G_PLANT_INFO.start_time = globals.curtime()
        G_PLANT_INFO.planter_name = entity.get_player_name(ent)
        G_PLANT_INFO.planter_ent = ent
    end
end)

client.set_event_callback("player_team", function(e)
    if client.userid_to_entindex(e.userid) == entity.get_local_player() then
        G_TEAM_MENU_ACTIVE = false
    end
end)

client.set_event_callback("bomb_begindefuse", function(e)
    local ent = client.userid_to_entindex(e.userid)
    G_DEFUSE_INFO.active = true
    G_DEFUSE_INFO.start_time = globals.curtime()
    G_DEFUSE_INFO.defuser_name = entity.get_player_name(ent)
    G_DEFUSE_INFO.defuser_ent = ent

    local has_kit = entity.get_prop(ent, "m_bHasDefuser") == 1
    if has_kit == nil then has_kit = (e.haskit == 1) end

    G_DEFUSE_INFO.has_kit = has_kit
    G_DEFUSE_INFO.duration = G_DEFUSE_INFO.has_kit and 5.0 or 10.0
end)

client.set_event_callback("bomb_abortdefuse", function()
    G_DEFUSE_INFO.active = false
end)

client.set_event_callback("bomb_defused", function()
    G_DEFUSE_INFO.active = false
    HUD_LOG("[gamesense] Bomb Defused!", 255, 255, 255, true)
end)

client.set_event_callback("bomb_exploded", function()
    G_DEFUSE_INFO.active = false
    HUD_LOG("[gamesense] Bomb Exploded!", 255, 255, 255, true)
end)

client.set_event_callback("bomb_abortplant", function(e)
    if client.userid_to_entindex(e.userid) == entity.get_local_player() then
        G_PLANT_INFO.active = false
    end
end)

client.set_event_callback("bomb_planted", function(e)
    if client.userid_to_entindex(e.userid) == entity.get_local_player() then
        G_PLANT_INFO.active = false
    end
    HUD_LOG("[gamesense] Bomb Planted at site " .. (e.site == 0 and "A" or "B"), 255, 255, 255, true)
end)

client.set_event_callback("key", function(e)
    if not CON_MODULE or not CON_MODULE.active then return end

    if e.key == 0x09 then
        return false
    end
end)

client.set_event_callback("pre_render", function()
    if CON_MODULE.active then
        client.exec("-showscores")
    end
end)

client.set_event_callback("char", function(e)
    if not CON_MODULE.active then return end
    if client.key_state(0x11) then return end

    local char = e.text or e.char
    if char and char ~= "" then
        insert_text(char)
        update_suggestions()
    end
end)

client.set_event_callback("key", function(e)
    if not CON_MODULE.active or not e.key_state then return end
end)


client.set_event_callback("player_hurt", function(e)
    local lp = entity.get_local_player()
    local attacker = client.userid_to_entindex(e.attacker)
    local victim = client.userid_to_entindex(e.userid)

    if e.health == 0 and attacker ~= 0 and victim ~= 0 then
        if not G_DAMAGE_TRACKER[attacker] then G_DAMAGE_TRACKER[attacker] = {} end
        G_DAMAGE_TRACKER[attacker][victim] = e.dmg_health
    end

    if not lp then return end

    local hgs = {"Generic", "Head", "Chest", "Stomach", "Left arm", "Right arm", "Left leg", "Right leg", "Neck", "?", "Gear"}
    local group = hgs[e.hitgroup + 1] or "?"

    if attacker == lp and victim ~= lp then
        local name = entity.get_player_name(victim) or "Enemy"
        HUD_LOG(string.format("[gamesense] Hit %s for %d in %s (%d HP left)", name, e.dmg_health, group, e.health), 255, 255, 255, true, nil, nil, nil, victim)

        if INTEL_MODULE then
            INTEL_MODULE.dmg = INTEL_MODULE.dmg + e.dmg_health
            update_intel_stats()
        end
    end
end)

client.set_event_callback("item_purchase", function(e)
    local ent = client.userid_to_entindex(e.userid)
    if ent == entity.get_local_player() and e.item then
        HUD_LOG("[gamesense] Purchased " .. e.item:gsub("weapon_", ""), 255, 255, 255, true)
    end
end)

client.set_event_callback("player_death", function(e)
    local att, vic = client.userid_to_entindex(e.attacker), client.userid_to_entindex(e.userid)
    local assister = client.userid_to_entindex(e.assister)

    if att ~= 0 and vic ~= 0 then
        local lp = entity.get_local_player()
        local wn = (e.weapon or "knife"):gsub("weapon_", "")

        local is_overkill = false
        if G_DAMAGE_TRACKER[att] and G_DAMAGE_TRACKER[att][vic] and G_DAMAGE_TRACKER[att][vic] >= 150 then
            is_overkill = true
        end

        local cur_time = globals.curtime()
        if not G_STREAK_MAP[att] then G_STREAK_MAP[att] = {count = 0, last = 0} end
        if cur_time - G_STREAK_MAP[att].last > 7.0 then
            G_STREAK_MAP[att].count = 0

        G_KILL_STREAKS[att] = (G_KILL_STREAKS[att] or 0) + 1
        G_KILL_STREAKS[vic] = 0
        end
        G_STREAK_MAP[att].count = G_STREAK_MAP[att].count + 1
        G_STREAK_MAP[att].last = cur_time
        local streak = G_STREAK_MAP[att].count

        if att == lp then
            INTEL_MODULE.kills = INTEL_MODULE.kills + 1
            if e.headshot == true or (type(e.headshot) == "number" and e.headshot > 0) then
                INTEL_MODULE.hs = INTEL_MODULE.hs + 1
            end
            update_intel_stats()
        elseif vic == lp then
            INTEL_MODULE.deaths = INTEL_MODULE.deaths + 1
            update_intel_stats()
        end

        if not G_DOMINATION_MAP[att] then G_DOMINATION_MAP[att] = {} end
        if not G_DOMINATION_MAP[vic] then G_DOMINATION_MAP[vic] = {} end
        G_DOMINATION_MAP[att][vic] = (G_DOMINATION_MAP[att][vic] or 0) + 1

        local is_domination = G_DOMINATION_MAP[att][vic] >= 3
        local is_revenge = G_DOMINATION_MAP[vic][att] and G_DOMINATION_MAP[vic][att] >= 3
        if is_revenge then
            G_DOMINATION_MAP[vic][att] = 0
        end

        G_DOMINATION_MAP[vic] = {}
        G_STREAK_MAP[vic] = {count = 0, last = 0}

        local att_hp = entity.get_prop(att, "m_iHealth") or 0
        local tac_info = ""
        local tac_icon_keys = {}

        if e.penetrated and e.penetrated > 0 then
            table.insert(tac_icon_keys, "penetrate")
        end
        if e.headshot == true or (type(e.headshot) == "number" and e.headshot > 0) then
            table.insert(tac_icon_keys, "icon_headshot")
        end
        if e.noscope == true or (type(e.noscope) == "number" and e.noscope > 0) then
            table.insert(tac_icon_keys, "icon_noscope")
        end
        if e.attackerblind == true or (type(e.attackerblind) == "number" and e.attackerblind > 0) then
            table.insert(tac_icon_keys, "icon_blind")
        end

        local extra_mod_keys = {}

        do
            local an_dbg = entity.get_player_name(att) or "?"
            local vn_dbg = entity.get_player_name(vic) or "?"
            local all_icons = {}
            for _, k in ipairs(tac_icon_keys)   do table.insert(all_icons, k) end
            for _, k in ipairs(extra_mod_keys) do table.insert(all_icons, k) end
            local icons_str = (#all_icons > 0) and table.concat(all_icons, ", ") or "(none)"
            HUD_LOG(string.format(
                "[killfeed-dbg] %s -> %s | wpn=%s | icons=[%s]",
                an_dbg, vn_dbg, tostring(e.weapon or "?"), icons_str
            ), 200, 220, 255, true, nil, nil, "system")
        end

        if att_hp > 0 then
            tac_info = string.format("%dHP", att_hp)
        end

        local dmg = G_DAMAGE_TRACKER[att] and G_DAMAGE_TRACKER[att][vic] or 100
        if dmg > 100 then
            tac_info = tac_info ~= "" and (tac_info .. string.format(" %dDMG", dmg)) or string.format("%dDMG", dmg)
        end

        local a_av_obj = nil
        if images then
            local sid = entity.get_steam64(att)
            if sid then a_av_obj = images.get_steam_avatar(sid) end
        end
        local wpn_svg_obj = images and images.get_weapon_icon(e.weapon or "knife") or nil

        local tac_icon_objs = {}
        for _, key in ipairs(tac_icon_keys) do
            local obj = TAC_ICONS[key]
            if obj then table.insert(tac_icon_objs, obj) end
        end

        local an, vn = entity.get_player_name(att), entity.get_player_name(vic)
        local aw, ah = surface.get_text_size(font_main, an)
        local vw, vh = surface.get_text_size(font_main, vn)
        local tw, th = surface.get_text_size(font_main, tac_info)

        local assist_str, asw = "", 0
        if assister ~= 0 then
            assist_str = " + " .. entity.get_player_name(assister)
            asw = surface.get_text_size(font_main, assist_str)
        end

        local wiw = 0
        if wpn_svg_obj then
            local mw, mh = wpn_svg_obj:measure()
            wiw = math.floor(mw * (17 / mh))
        else
            wiw = surface.get_text_size(font_main, "["..wn.."]")
        end

        local total_w = S(2) + S(6) + (a_av_obj and (S(10) + S(6)) or S(6)) + aw + asw + S(5) + wiw + S(5) + vw + S(7) + tw

        local me = entity.get_local_player()
        local is_local = (att == me)
        local is_death = (vic == me)

        table.insert(kill_log, 1, {
            attacker = an, victim = vn, assister = assist_str,
            a_av_obj = a_av_obj, wpn_svg_obj = wpn_svg_obj,
            tac_info = tac_info,
            tac_icon_objs = tac_icon_objs,
            extra_mod_keys = extra_mod_keys,
            a_team = entity.get_prop(att, "m_iTeamNum"),
            v_team = entity.get_prop(vic, "m_iTeamNum"),
            as_team = assister ~= 0 and entity.get_prop(assister, "m_iTeamNum") or nil,
            weapon = wn, is_local = is_local, is_death = is_death,
            time = globals.realtime(),
            streak = streak,
            y_offset = 6, x_offset = 80
        })
        if #kill_log > 32 then table.remove(kill_log) end

        if att == lp then
            HUD_LOG(string.format("[gamesense] Killed %s with %s", entity.get_player_name(vic), wn), 255, 255, 255, true, nil, nil, nil, vic)
        elseif vic == lp then
            HUD_LOG(string.format("[gamesense] Death to %s (%s)", entity.get_player_name(att), wn), 255, 255, 255, true, nil, nil, nil, att)
        end
    end
    return true
end)

client.set_event_callback("other_death", function() return true end)

client.set_event_callback("setup_command", function(cmd)
    local should_freeze_cam = CON_MODULE.active or (CHAT_MODULE and CHAT_MODULE.active) or (BM_MODULE and BM_MODULE.is_open)
    if should_freeze_cam then
        cmd.forwardmove = 0; cmd.sidemove = 0; cmd.buttons = 0
        cmd.pitch = lock_p; cmd.yaw = lock_y
    else
        lock_p = cmd.pitch; lock_y = cmd.yaw
    end

    if (CHAT_MODULE and CHAT_MODULE.active) or (BM_MODULE and BM_MODULE.is_open) then
        cmd.weaponselect = 0
    end
end)

client.set_event_callback("paint", function()
    xpcall(on_paint, error_on)
end)

client.set_event_callback("paint", function()
    if not ui.get(ui_main_enable) or not ui.get(ui_scoreboard_enable) then
        SB_MODULE.anim_alpha = 0
        SB_MODULE.active = false
        return
    end
    local tab_down = client.key_state(0x09)
    if not CON_MODULE.active and not (CHAT_MODULE and CHAT_MODULE.active) then
        SB_MODULE.active = tab_down
    else
        SB_MODULE.active = false
    end
    local ft = globals.frametime()
    if SB_MODULE.active then
        SB_MODULE.anim_alpha = math.min(1.0, SB_MODULE.anim_alpha + ft * 10)
    else
        SB_MODULE.anim_alpha = math.max(0.0, SB_MODULE.anim_alpha - ft * 10)
        if SB_MODULE.anim_alpha <= 0 then SB_MODULE._row_anims = {} end
    end
    if SB_MODULE.anim_alpha > 0 then
        xpcall(draw_scoreboard, error_on)
    end
end)

client.set_event_callback("paint_ui", function()
    if entity.get_local_player() ~= nil then return end
    if not ui.get(ui_main_enable) then return end
    if not ui.get(ui_con_enable)  then return end

    if not CON_MODULE.persistent_ready then history_load() end

    local frame_time = globals.frametime()
    if CON_MODULE.active then
        CON_MODULE.anim_alpha = math.min(1.0, CON_MODULE.anim_alpha + frame_time * 8)
    else
        CON_MODULE.anim_alpha = math.max(0.0, CON_MODULE.anim_alpha - frame_time * 8)
    end

    local con_hotkey = ui.get(ui_con_key)
    if con_hotkey and not CON_MODULE.key_prev then
        CON_MODULE.active = not CON_MODULE.active
    end
    CON_MODULE.key_prev = con_hotkey

    if CON_MODULE.anim_alpha > 0.01 then
        xpcall(draw_console, function(err)
            client.log("[custom_hud] draw_console error in menu: " .. tostring(err))
        end)
        xpcall(poll_keyboard, function(err)
            client.log("[custom_hud] poll_keyboard error in menu: " .. tostring(err))
        end)
    end
end)

local SB_MODULE_DUMMY_ = nil

ui.set_callback(ui_scoreboard_enable, function()
    if ui.get(ui_scoreboard_enable) then
        client.exec("unbind tab")
        client.exec("alias +showscores; alias -showscores")
    else
        client.exec("bind tab +showscores")
    end
end)
if ui.get(ui_scoreboard_enable) then
    client.exec("unbind tab")
    client.exec("alias +showscores; alias -showscores")
end

local function sb_get_players()
    local tick = globals.tickcount() or 0
    if SB_MODULE._cache and (tick - SB_MODULE._cache_tick) < 16 then
        return SB_MODULE._cache
    end

    local pr = entity.get_player_resource()
    local t_players, ct_players = {}, {}

    if pr then
        for i = 1, 64 do
            if entity.get_prop(pr, "m_bConnected", i) == 1 then
                local team = entity.get_prop(pr, "m_iTeam", i)
                if team == 2 or team == 3 then
                    local alive = entity.get_prop(pr, "m_bAlive", i) == 1
                    local kills = entity.get_prop(pr, "m_iKills", i) or 0
                    local deaths = entity.get_prop(pr, "m_iDeaths", i) or 0
                    local assists = entity.get_prop(pr, "m_iAssists", i) or 0
                    local score = entity.get_prop(pr, "m_iScore", i) or 0
                    local mvps = entity.get_prop(pr, "m_iMVPs", i) or 0
                    local ping = entity.get_prop(pr, "m_iPing", i) or 0
                    local hp = alive and (entity.get_prop(i, "m_iHealth") or 0) or 0
                    local money = entity.get_prop(i, "m_iAccount") or 0
                    local name = entity.get_player_name(i) or "Unknown"

                    local avatar = nil
                    if images then
                        pcall(function()
                            local sid = entity.get_steam64(i)
                            if sid then
                                avatar = images.get_steam_avatar(sid)
                            end
                        end)
                        if not avatar and images.get_player_avatar then
                            pcall(function() avatar = images.get_player_avatar(i) end)
                        end
                    end

                    local wpn_icon = nil
                    local wpn_icons_all = {}
                    local has_bomb = false
                    local has_defuser = entity.get_prop(i, "m_bHasDefuser") == 1
                    if alive then
                        local wpn = entity.get_player_weapon(i)
                        if wpn then wpn_icon = fetch_icon(wpn, entity.get_classname(wpn)) end
                        local weapons = get_weapons(i)
                        for _, w in ipairs(weapons) do
                            if w.slot == 5 then has_bomb = true end
                            local w_icon = fetch_icon(w.ent, w.classname)
                            if w_icon then
                                table.insert(wpn_icons_all, { icon = w_icon, slot = w.slot, is_active = (w.ent == wpn) })
                            end
                        end
                        table.sort(wpn_icons_all, function(a, b) return a.slot < b.slot end)
                    end

                    local streak = G_KILL_STREAKS[i] or 0

                    local entry = {
                        idx = i, name = name, alive = alive,
                        kills = kills, deaths = deaths, assists = assists,
                        score = score, mvps = mvps, ping = ping,
                        hp = hp, money = money,
                        avatar = avatar, wpn_icon = wpn_icon, wpn_icons_all = wpn_icons_all, team = team,
                        has_bomb = has_bomb, has_defuser = has_defuser,
                        streak = streak,
                    }
                    if team == 2 then table.insert(t_players, entry)
                    else table.insert(ct_players, entry) end
                end
            end
        end
    end

    local function sort_fn(a, b) return a.score > b.score end
    table.sort(t_players, sort_fn)
    table.sort(ct_players, sort_fn)

    SB_MODULE._cache = { t = t_players, ct = ct_players }
    SB_MODULE._cache_tick = tick
    return SB_MODULE._cache
end

draw_scoreboard = function()
    if SB_MODULE.anim_alpha <= 0 then return end

    local sw, sh = client.screen_size()
    local alpha = SB_MODULE.anim_alpha
    local text_a = math.floor(255 * alpha)
    local data = sb_get_players()
    local ts, cs = get_team_scores()

    local row_h = S(30)
    local header_h = S(28)
    local team_header_h = S(40)
    local col_gap = S(10)
    local half_w = S(500)
    local total_w = half_w * 2 + col_gap
    local avatar_sz = S(22)
    local pad = S(6)

    local max_rows = math.max(#data.t, #data.ct, 1)
    local total_h = team_header_h + header_h + max_rows * row_h + S(6)
    local bx = (sw - total_w) / 2
    local by = (sh - total_h) / 2 + (1.0 - alpha) * S(-40)

    surface.draw_filled_rect(0, 0, sw, sh, 0, 0, 0, math.floor(80 * alpha))

    local map_name = (globals.mapname() or "Unknown")
    local round_str = map_name:upper() .. "  |  ROUND " .. tostring(ts + cs + 1)
    local mw, mh = surface.get_text_size(font_sb_title, round_str)
    surface.draw_text((sw - mw) / 2 + 1, by - mh - S(10) + 1, 0, 0, 0, math.floor(180 * alpha), font_sb_title, round_str)
    surface.draw_text((sw - mw) / 2, by - mh - S(10), 220, 220, 220, text_a, font_sb_title, round_str)

    local score_display = tostring(ts) .. " : " .. tostring(cs)
    local sdw, sdh = surface.get_text_size(font_numbers, score_display)
    surface.draw_text((sw - sdw) / 2 + 1, by - mh - S(10) - sdh - S(4) + 1, 0, 0, 0, math.floor(150 * alpha), font_numbers, score_display)
    surface.draw_text((sw - sdw) / 2, by - mh - S(10) - sdh - S(4), 255, 255, 255, text_a, font_numbers, score_display)

    local cols = {
        { key = "name",    label = "PLAYER",  w = S(190), align = "left" },
        { key = "ping",    label = "MS",       w = S(42),  align = "center" },
        { key = "kills",   label = "K",        w = S(36),  align = "center" },
        { key = "deaths",  label = "D",        w = S(36),  align = "center" },
        { key = "assists", label = "A",        w = S(36),  align = "center" },
        { key = "mvps",    label = "MVP",      w = S(36),  align = "center" },
        { key = "money",   label = "$",        w = S(50),  align = "center" },
    }

    local function draw_team_half(tx, ty, players, team_num, team_score)
        local is_t = (team_num == 2)
        local tr2, tg2, tb2 = is_t and 255 or 100, is_t and 200 or 200, is_t and 100 or 255
        local team_name = is_t and "TERRORISTS" or "COUNTER-TERRORISTS"
        local icon_key = is_t and "t_side" or "ct_side"

        surface.draw_filled_rect(tx, ty, half_w, team_header_h, 12, 12, 12, math.floor(220 * alpha))
        surface.draw_filled_gradient_rect(tx, ty, half_w, team_header_h, tr2, tg2, tb2, math.floor(50 * alpha), tr2, tg2, tb2, 0, true)
        surface.draw_filled_rect(tx, ty + team_header_h - S(2), half_w, S(2), tr2, tg2, tb2, math.floor(180 * alpha))

        local ic_sz = S(22)
        HUD.icons.draw(icon_key, tx + S(10), ty + (team_header_h - ic_sz) / 2, ic_sz, tr2, tg2, tb2, text_a)

        local tn_w, tn_h = surface.get_text_size(font_sb_title, team_name)
        surface.draw_text(tx + S(10) + ic_sz + S(8) + 1, ty + (team_header_h - tn_h) / 2 + 1, 0, 0, 0, math.floor(120 * alpha), font_sb_title, team_name)
        surface.draw_text(tx + S(10) + ic_sz + S(8), ty + (team_header_h - tn_h) / 2, 255, 255, 255, text_a, font_sb_title, team_name)

        local sc_str = tostring(team_score)
        local sc_w, sc_h = surface.get_text_size(font_numbers, sc_str)
        surface.draw_text(tx + half_w - sc_w - S(12) + 1, ty + (team_header_h - sc_h) / 2 + 1, 0, 0, 0, math.floor(120 * alpha), font_numbers, sc_str)
        surface.draw_text(tx + half_w - sc_w - S(12), ty + (team_header_h - sc_h) / 2, tr2, tg2, tb2, text_a, font_numbers, sc_str)

        local cy = ty + team_header_h

        surface.draw_filled_rect(tx, cy, half_w, header_h, 20, 20, 20, math.floor(220 * alpha))
        local hx = tx + avatar_sz + S(8)
        for _, col in ipairs(cols) do
            local lw, lh = surface.get_text_size(font_sb_header, col.label)
            local lx = hx
            if col.align == "center" then
                if col.key == "money" then
                    lx = hx + S(4)
                else
                    lx = hx + (col.w - lw) / 2
                end
            elseif col.align == "left" then lx = hx end
            surface.draw_text(lx, cy + (header_h - lh) / 2, 120, 120, 120, text_a, font_sb_header, col.label)
            hx = hx + col.w
        end
        cy = cy + header_h

        local lp = entity.get_local_player()
        local ft = globals.frametime()
        for i, p in ipairs(players) do
            local is_local = (p.idx == lp)
            local dead_mult = p.alive and 1.0 or 0.4

            local anim_key = team_num * 100 + i
            if not SB_MODULE._row_anims[anim_key] then SB_MODULE._row_anims[anim_key] = 0 end
            SB_MODULE._row_anims[anim_key] = math.min(1.0, SB_MODULE._row_anims[anim_key] + ft * (6 + i * 1.5))
            local row_alpha_mult = SB_MODULE._row_anims[anim_key]
            local row_x_off = (1.0 - row_alpha_mult) * S(30) * (is_t and -1 or 1)
            local row_a = math.floor(alpha * row_alpha_mult * (i % 2 == 0 and 180 or 160))

            local rtx = tx + row_x_off

            surface.draw_filled_rect(tx, cy, half_w, row_h, 15, 15, 15, row_a)

            if is_local then
                surface.draw_filled_rect(tx, cy, half_w, row_h, tr2, tg2, tb2, math.floor(30 * alpha * row_alpha_mult))
                surface.draw_filled_rect(tx, cy, S(3), row_h, tr2, tg2, tb2, math.floor(200 * alpha * row_alpha_mult))
            end

            if i < #players then
                surface.draw_filled_rect(tx + S(6), cy + row_h - 1, half_w - S(12), 1, 35, 35, 35, math.floor(120 * alpha))
            end

            local av_y = cy + (row_h - avatar_sz) / 2
            local av_x = rtx + S(5)
            local has_avatar = false
            if p.avatar then
                local draw_ok = pcall(function()
                    if type(p.avatar) == "table" and p.avatar.draw then
                        p.avatar:draw(av_x, av_y, avatar_sz, avatar_sz, 255, 255, 255, math.floor(255 * alpha * dead_mult * row_alpha_mult))
                    else
                        renderer.texture(p.avatar, av_x, av_y, avatar_sz, avatar_sz, 255, 255, 255, math.floor(255 * alpha * dead_mult * row_alpha_mult))
                    end
                end)
                has_avatar = draw_ok
            end
            if not has_avatar then
                surface.draw_filled_rect(av_x, av_y, avatar_sz, avatar_sz, 20, 20, 20, math.floor(200 * alpha * row_alpha_mult))
                local sil_sz = math.floor(avatar_sz * 0.8)
                local sil_x = av_x + (avatar_sz - sil_sz) / 2
                local sil_y = av_y + (avatar_sz - sil_sz) / 2
                local sil_icon = is_t and "t_side" or "ct_side"
                HUD.icons.draw(sil_icon, sil_x, sil_y, sil_sz, tr2, tg2, tb2, math.floor(200 * alpha * dead_mult * row_alpha_mult))
            end

            if not p.alive then
                surface.draw_filled_rect(av_x, av_y, avatar_sz, avatar_sz, 0, 0, 0, math.floor(140 * alpha))
                local m = S(3)
                surface.draw_line(av_x + m, av_y + m, av_x + avatar_sz - m, av_y + avatar_sz - m, 200, 50, 50, math.floor(220 * alpha * row_alpha_mult))
                surface.draw_line(av_x + avatar_sz - m, av_y + m, av_x + m, av_y + avatar_sz - m, 200, 50, 50, math.floor(220 * alpha * row_alpha_mult))
            else
                surface.draw_outlined_rect(av_x, av_y, avatar_sz, avatar_sz, tr2, tg2, tb2, math.floor(60 * alpha * row_alpha_mult))
            end

            if p.alive and p.hp > 0 then
                local bar_y = av_y + avatar_sz + 1
                local bar_h = S(2)
                local hp_pct = math.max(0, math.min(1, p.hp / 100))
                surface.draw_filled_rect(av_x, bar_y, avatar_sz, bar_h, 25, 25, 25, math.floor(120 * alpha))
                local hp_r = math.floor(255 - 95 * hp_pct)
                local hp_g = math.floor(80 + 130 * hp_pct)
                surface.draw_filled_rect(av_x, bar_y, math.floor(avatar_sz * hp_pct), bar_h, hp_r, hp_g, 80, math.floor(220 * alpha * row_alpha_mult))
            end

            if p.has_bomb and p.alive then
                local bic = S(12)
                HUD.icons.draw("bomb", av_x + avatar_sz - bic + S(2), av_y - S(2), bic, 255, 80, 80, math.floor(255 * alpha * row_alpha_mult))
            end

            if p.streak and p.streak >= 3 and p.alive then
                local fic = S(12)
                local fire_a = math.floor((200 + math.abs(math.sin(globals.realtime() * 4)) * 55) * alpha * row_alpha_mult)
                HUD.icons.draw("fire", av_x - fic - S(1), av_y + (avatar_sz - fic) / 2, fic, 255, 160, 30, fire_a)
            end

            local rx = rtx + avatar_sz + S(8)
            for _, col in ipairs(cols) do
                local val_str = ""
                local vr, vg, vb = 220, 220, 220

                if col.key == "name" then
                    val_str = p.name:sub(1, 14)
                    vr, vg, vb = 255, 255, 255
                    if is_local then vr, vg, vb = tr2, tg2, tb2 end
                    if not p.alive then vr, vg, vb = math.floor(vr*0.45), math.floor(vg*0.45), math.floor(vb*0.45) end
                    local use_font = font_sb_name
                    local nw2, nh2 = surface.get_text_size(use_font, val_str)
                    local ny = cy + (row_h - nh2) / 2
                    local va = math.floor(255 * alpha * dead_mult * row_alpha_mult)
                    surface.draw_text(rx + 1, ny + 1, 0, 0, 0, math.floor(100 * alpha * dead_mult * row_alpha_mult), use_font, val_str)
                    surface.draw_text(rx, ny, vr, vg, vb, va, use_font, val_str)
                    if p.alive and p.wpn_icons_all and #p.wpn_icons_all > 0 then
                        local wi_x = rx + nw2 + S(4)
                        local wi_h = S(14)
                        local wi_a = math.floor(180 * alpha * row_alpha_mult)
                        for _, wi in ipairs(p.wpn_icons_all) do
                            pcall(function()
                                local iw, ih = wi.icon:measure()
                                local wi_w = math.min(math.floor(iw * (wi_h / ih)), S(36))
                                local wi_y = cy + (row_h - wi_h) / 2
                                local wr2, wg2, wb2 = 160, 160, 160
                                if wi.is_active then wr2, wg2, wb2 = 255, 255, 255 end
                                wi.icon:draw(wi_x, wi_y, wi_w, wi_h, wr2, wg2, wb2, wi.is_active and va or wi_a)
                                wi_x = wi_x + wi_w + S(2)
                            end)
                        end
                        if p.has_defuser and p.team == 3 then
                            local def_icon = nil
                            if images and images.get_weapon_icon then
                                pcall(function() def_icon = images.get_weapon_icon("item_defuser") end)
                            end
                            if def_icon then
                                local diw, dih = def_icon:measure()
                                local dic_h = S(14)
                                local dic_w = math.floor(diw * (dic_h / dih))
                                def_icon:draw(wi_x, cy + (row_h - dic_h) / 2, dic_w, dic_h, 100, 200, 255, math.floor(200 * alpha * row_alpha_mult))
                            else
                                local dic = S(14)
                                HUD.icons.draw("defuser", wi_x, cy + (row_h - dic) / 2, dic, 100, 200, 255, math.floor(200 * alpha * row_alpha_mult))
                            end
                        end
                    end
                    val_str = ""
                elseif col.key == "kills" then
                    local k_str = tostring(p.kills)
                    local use_font = font_sb_stat
                    local kw2, kh2 = surface.get_text_size(use_font, k_str)
                    local ic_s = S(10)
                    local ic_gap = S(2)
                    local ktw = ic_s + ic_gap + kw2
                    local kx = rx + (col.w - ktw) / 2
                    local va = math.floor(255 * alpha * dead_mult * row_alpha_mult)
                    local kr, kg, kb = 255, 255, 255
                    if p.kills == 0 then kr, kg, kb = 160, 160, 160 end
                    HUD.icons.draw("kill_icon", kx, cy + (row_h - ic_s) / 2, ic_s, kr, kg, kb, va)
                    surface.draw_text(kx + ic_s + ic_gap + 1, cy + (row_h - kh2) / 2 + 1, 0, 0, 0, math.floor(100 * alpha * dead_mult * row_alpha_mult), use_font, k_str)
                    surface.draw_text(kx + ic_s + ic_gap, cy + (row_h - kh2) / 2, kr, kg, kb, va, use_font, k_str)
                    val_str = ""
                elseif col.key == "deaths" then
                    local d_str = tostring(p.deaths)
                    local use_font = font_sb_stat
                    local dw2, dh2 = surface.get_text_size(use_font, d_str)
                    local ic_s = S(10)
                    local ic_gap = S(2)
                    local dtw = ic_s + ic_gap + dw2
                    local dx = rx + (col.w - dtw) / 2
                    local va = math.floor(255 * alpha * dead_mult * row_alpha_mult)
                    local dr, dg, db = 180, 180, 180
                    if p.deaths > p.kills then dr, dg, db = 220, 130, 130 end
                    HUD.icons.draw("death_icon", dx, cy + (row_h - ic_s) / 2, ic_s, dr, dg, db, va)
                    surface.draw_text(dx + ic_s + ic_gap + 1, cy + (row_h - dh2) / 2 + 1, 0, 0, 0, math.floor(100 * alpha * dead_mult * row_alpha_mult), use_font, d_str)
                    surface.draw_text(dx + ic_s + ic_gap, cy + (row_h - dh2) / 2, dr, dg, db, va, use_font, d_str)
                    val_str = ""
                elseif col.key == "assists" then
                    local a_str = tostring(p.assists)
                    local use_font = font_sb_stat
                    local aw2, ah2 = surface.get_text_size(use_font, a_str)
                    local ic_s = S(10)
                    local ic_gap = S(2)
                    local atw = ic_s + ic_gap + aw2
                    local ax = rx + (col.w - atw) / 2
                    local va = math.floor(255 * alpha * dead_mult * row_alpha_mult)
                    local ar2, ag2, ab2 = 160, 160, 160
                    HUD.icons.draw("assist_icon", ax, cy + (row_h - ic_s) / 2, ic_s, ar2, ag2, ab2, va)
                    surface.draw_text(ax + ic_s + ic_gap + 1, cy + (row_h - ah2) / 2 + 1, 0, 0, 0, math.floor(100 * alpha * dead_mult * row_alpha_mult), use_font, a_str)
                    surface.draw_text(ax + ic_s + ic_gap, cy + (row_h - ah2) / 2, ar2, ag2, ab2, va, use_font, a_str)
                    val_str = ""
                elseif col.key == "money" then
                    val_str = "$" .. tostring(p.money)
                    vr, vg, vb = 100, 180, 100
                    local use_font = font_sb_stat
                    local mw3, mh3 = surface.get_text_size(use_font, val_str)
                    local vx = rx + S(4)
                    local vy = cy + (row_h - mh3) / 2
                    local va = math.floor(255 * alpha * dead_mult * row_alpha_mult)
                    surface.draw_text(vx + 1, vy + 1, 0, 0, 0, math.floor(100 * alpha * dead_mult * row_alpha_mult), use_font, val_str)
                    surface.draw_text(vx, vy, vr, vg, vb, va, use_font, val_str)
                    val_str = ""
                elseif col.key == "mvps" then
                    if p.mvps > 0 then
                        local mvp_str = tostring(p.mvps)
                        local use_font = font_sb_stat
                        local mw2, mh2 = surface.get_text_size(use_font, mvp_str)
                        local star_sz = S(10)
                        local star_gap = S(2)
                        local total_mvp_w = star_sz + star_gap + mw2
                        local mvp_x = rx + (col.w - total_mvp_w) / 2
                        local mvp_y = cy + (row_h - mh2) / 2
                        local va = math.floor(255 * alpha * dead_mult * row_alpha_mult)
                        HUD.icons.draw("star", mvp_x, cy + (row_h - star_sz) / 2, star_sz, 255, 215, 0, va)
                        surface.draw_text(mvp_x + star_sz + star_gap + 1, mvp_y + 1, 0, 0, 0, math.floor(100 * alpha * dead_mult * row_alpha_mult), use_font, mvp_str)
                        surface.draw_text(mvp_x + star_sz + star_gap, mvp_y, 255, 215, 0, va, use_font, mvp_str)
                    end
                    val_str = ""
                elseif col.key == "ping" then
                    local ping_str = tostring(p.ping)
                    local use_font = font_sb_stat
                    local pw2, ph2 = surface.get_text_size(use_font, ping_str)
                    local sig_sz = S(10)
                    local sig_gap = S(2)
                    local total_pw = sig_sz + sig_gap + pw2
                    local ping_x = rx + (col.w - total_pw) / 2
                    local ping_y = cy + (row_h - ph2) / 2
                    local va = math.floor(255 * alpha * dead_mult * row_alpha_mult)
                    local sig_icon, pr2, pg2, pb2
                    if p.ping > 100 then
                        sig_icon = "signal_1"; pr2, pg2, pb2 = 255, 80, 80
                    elseif p.ping > 60 then
                        sig_icon = "signal_2"; pr2, pg2, pb2 = 255, 200, 80
                    elseif p.ping > 30 then
                        sig_icon = "signal_3"; pr2, pg2, pb2 = 100, 200, 100
                    else
                        sig_icon = "signal_4"; pr2, pg2, pb2 = 100, 200, 100
                    end
                    HUD.icons.draw(sig_icon, ping_x, cy + (row_h - sig_sz) / 2 - S(0.5), sig_sz, pr2, pg2, pb2, va)
                    surface.draw_text(ping_x + sig_sz + sig_gap + 1, ping_y + 1, 0, 0, 0, math.floor(100 * alpha * dead_mult * row_alpha_mult), use_font, ping_str)
                    surface.draw_text(ping_x + sig_sz + sig_gap, ping_y, pr2, pg2, pb2, va, use_font, ping_str)
                    val_str = ""
                end

                if val_str ~= "" then
                    local use_font = col.key == "name" and font_sb_name or font_sb_stat
                    local vw2, vh2 = surface.get_text_size(use_font, val_str)
                    local vx = rx
                    if col.align == "center" then vx = rx + (col.w - vw2) / 2 end
                    local vy = cy + (row_h - vh2) / 2
                    local va = math.floor(255 * alpha * dead_mult * row_alpha_mult)
                    surface.draw_text(vx + 1, vy + 1, 0, 0, 0, math.floor(100 * alpha * dead_mult * row_alpha_mult), use_font, val_str)
                    surface.draw_text(vx, vy, vr, vg, vb, va, use_font, val_str)
                end
                rx = rx + col.w
            end

            cy = cy + row_h
        end

        local block_h = team_header_h + header_h + #players * row_h
        surface.draw_outlined_rect(tx, ty, half_w, block_h, 50, 50, 50, math.floor(180 * alpha))
    end

    draw_team_half(bx, by, data.t, 2, ts)
    draw_team_half(bx + half_w + col_gap, by, data.ct, 3, cs)
end

client.set_event_callback("shutdown", function()
    client.exec("bind tab +showscores")
    xpcall(on_shutdown, error_on)
    if INTEL_MODULE then
        INTEL_MODULE.dmg = 0; INTEL_MODULE.kills = 0; INTEL_MODULE.deaths = 0
        INTEL_MODULE.hs = 0; INTEL_MODULE.rounds = 1; update_intel_stats()
    end
    clear_session_state()
end)

client.set_event_callback("client_disconnect", clear_session_state)
client.set_event_callback("level_init", clear_session_state)
client.set_event_callback("game_newmap", function()
    if INTEL_MODULE then
        INTEL_MODULE.dmg = 0; INTEL_MODULE.kills = 0; INTEL_MODULE.deaths = 0
        INTEL_MODULE.hs = 0; INTEL_MODULE.rounds = 1; update_intel_stats()
    end
    clear_session_state()
end)

do
    local targets = {
        "draw_console", "on_paint",
    }
    for _, name in ipairs(targets) do
        local fn = _G[name]
        if type(fn) == "function" and not _G["__prof_wrapped_" .. name] then
            _G[name] = HUD.profile.wrap(name, fn)
            _G["__prof_wrapped_" .. name] = true
        end
    end
    if BM_MODULE and type(BM_MODULE.draw) == "function" and not BM_MODULE.__prof_wrapped then
        BM_MODULE.draw = HUD.profile.wrap("BM_MODULE.draw", BM_MODULE.draw)
        BM_MODULE.__prof_wrapped = true
    end
    if INTEL_MODULE and type(INTEL_MODULE.draw) == "function" and not INTEL_MODULE.__prof_wrapped then
        INTEL_MODULE.draw = HUD.profile.wrap("INTEL_MODULE.draw", INTEL_MODULE.draw)
        INTEL_MODULE.__prof_wrapped = true
    end
    if CHAT_MODULE and type(CHAT_MODULE.draw) == "function" and not CHAT_MODULE.__prof_wrapped then
        CHAT_MODULE.draw = HUD.profile.wrap("CHAT_MODULE.draw", CHAT_MODULE.draw)
        CHAT_MODULE.__prof_wrapped = true
    end
end

do
    local ok, info = HUD.load_all()
    if HUD_LOG then
        if ok then
            HUD_LOG("[state] loaded saved HUD state.", 150, 220, 255, true, nil, nil, "system")
        elseif info == "empty" then
            HUD_LOG("[state] no saved state yet (first run).", 200, 200, 150, true, nil, nil, "system")
        else
            HUD_LOG("[state] load skipped: " .. tostring(info), 220, 150, 100, true, nil, nil, "system")
        end
    end
end

HUD_LOG("System: Elite Intelligence Engine active.", 120, 180, 255, true, nil, nil, "system")
