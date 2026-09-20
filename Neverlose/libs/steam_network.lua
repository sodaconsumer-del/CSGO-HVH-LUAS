ffi.cdef[[
    uint32_t GetModuleHandleA(const char* lpModuleName);
    uint32_t GetProcAddress(uint32_t hModule, const char* lpProcName);
]]

local SteamNetworkingIdentity_t = ffi.typeof([[
    struct {
        int m_eType;
        int m_cbSize;
        union {
            uint64_t m_steamID64;
            char m_szGenericString[ 32 ];
            uint8_t m_genericBytes[ 32 ];
            char m_szUnknownRawString[ 128 ];
            void* m_ip;
            uint32_t m_reserved[ 32 ];
        };
    }
]])

local SteamNetworkingMessage_t = ffi.typeof([[
    struct {
        void* m_pData;
        int m_cbSize;
        unsigned int m_conn;
        $ m_identityPeer;
        int64_t m_nConnUserData;
        long long m_usecTimeReceived;
        int64_t m_nMessageNumber;
        void(__thiscall* m_pfnFreeData)(void*);
        void(__thiscall* m_pfnRelease)(void*);
        int m_nChannel;
        int m_nFlags;
        int64_t m_nUserData;
    }
]], SteamNetworkingIdentity_t)

local proc_address = ffi.C.GetProcAddress(
    ffi.C.GetModuleHandleA("steamnetworkingsockets.dll"),
    "SteamNetworkingMessages_LibV2")

assert(proc_address ~= 0, "failed to get steam_networking_messages")

local SteamNetworkingIdentity = SteamNetworkingIdentity_t
local SteamNetworkingMessage_t = ffi.typeof("$* [?]", SteamNetworkingMessage_t)
local this = ffi.cast("void***", ffi.cast("void*(__thiscall*)()", proc_address)())

local send_message_to_user_fn = ffi.cast(
    ffi.typeof("int(__thiscall*)(void*, const $&, const void *, uint32_t, int, int)", SteamNetworkingIdentity_t),
    this[0][0]
)

local receive_messages_on_channel_fn = ffi.cast(
    ffi.typeof(
        "int(__thiscall*)(void*, int, $, int)",
        SteamNetworkingMessage_t
    ),
    this[0][1]
)

local accept_session_with_user_fn =  ffi.cast(ffi.typeof("bool(__thiscall*)(void*, const $&)", SteamNetworkingIdentity_t), this[0][2])
local close_connection_with_user_fn = ffi.cast(ffi.typeof("bool(__thiscall*)(void*, const $&)", SteamNetworkingIdentity_t), this[0][3])

local DEFAULT_CHANNEL = 1200
local function send_message_to_user(steamid, message, channel)
    local uint64_steamid = ffi.cast("uint64_t", steamid)
    local message_char = ffi.cast("const char*", message)

    local identity = SteamNetworkingIdentity()
    identity.m_eType = 16
    identity.m_cbSize = ffi.sizeof(uint64_steamid)
    identity.m_steamID64 = uint64_steamid

    return send_message_to_user_fn(this, identity, message_char, message:len(), 8, channel or DEFAULT_CHANNEL)
end

local function receive_messages_on_channel(channel)
    local buff = SteamNetworkingMessage_t(1337)

    local num_messages = receive_messages_on_channel_fn(this, channel or DEFAULT_CHANNEL, buff, 1337)

    return num_messages, buff
end

local function close_connection_with_user(steamid)
    local uint64_steamid = ffi.cast("uint64_t", steamid)

    local identity = SteamNetworkingIdentity()
    identity.m_eType = 16
    identity.m_cbSize = ffi.sizeof(uint64_steamid)
    identity.m_steamID64 = uint64_steamid

    return close_connection_with_user_fn(this, identity)
end

local function accept_session_with_user(steamid)
    local uint64_steamid = ffi.cast("uint64_t", steamid)

    local identity = SteamNetworkingIdentity()
    identity.m_eType = 16
    identity.m_cbSize = ffi.sizeof(uint64_steamid)
    identity.m_steamID64 = uint64_steamid

    return accept_session_with_user_fn(this, identity)
end

return {
    send_message_to_user = send_message_to_user,
    receive_messages_on_channel = receive_messages_on_channel,
    close_connection_with_user = close_connection_with_user,
    accept_session_with_user = accept_session_with_user
}