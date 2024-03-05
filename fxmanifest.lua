--[[------------------------------------------------------
----       For Support - discord.gg/threeamigos       ----
---- Do not edit if you do not know what you're doing ----
--]]------------------------------------------------------
fx_version "cerulean"
use_experimental_fxv2_oal "yes"
lua54 "yes"
game "gta5"

name "TAM_ChatToolBox"
author "Hakko"
description "Three Amigos Modding Chat Toolbox"
version "1.0.0"

client_debug_mode "false"
server_debug_mode "false"
experimental_features_enabled "0"

files {
    "data/**",
    "modules/**/client.lua"
}

shared_scripts {
	"@ox_lib/init.lua",
    "shared/main.lua"
}

server_scripts {
    "server/main.lua",
}

dependencies {
	"ox_lib",
    "chat"
}