fx_version   'cerulean'
use_experimental_fxv2_oal 'yes'
lua54        'yes'
game 'gta5'

name 'TAM_chat'
author 'Hakko'
description 'Three Amigos Modding Chat Resource'
version '1.0.0'

client_debug_mode 'false'
server_debug_mode 'false'
experimental_features_enabled '0'

dependencies {
	'ox_lib',
    'spawnmanager'
}

shared_scripts {
	'@ox_lib/init.lua',
}

client_scripts {
    'src/client/main.lua',
}

server_scripts {
    'src/server/main.lua',
}