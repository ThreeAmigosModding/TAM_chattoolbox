--[[------------------------------------------------------
----       For Support - discord.gg/threeamigos       ----
----       Docs - https://docs.threeamigos.shop       ----
--]]------------------------------------------------------

local commands = {}

commands["dv"] = { -- command name
    enabled = true, -- enable or disable the command. Disable if you are using ND Core as the same functionality is built it.
    description = "Delete nearby vehicle or all vehicles in a radius.", -- command description
    groups = {"admin"}, -- Group(s) that have the permission to use the command, set to false to allow everyone. Ace permission by default, but if using ND Core you can specify the group name.
    params = {
        {
            name = "radius", -- parameter name
            type = "number", -- parameter type 'number' or 'string' or 'playerId'
            help = "Radius to delete vehicles in", -- parameter description
            optional = true -- is the parameter optional or not
        }
    }
}

commands["me"] = { -- command name
    enabled = true, -- enable or disable the command
    global = false, -- Set to false to only show to nearbly players
    description = "Send a message in character", -- command description
    groups = false, -- Group(s) that have the permission to use the command, set to false to allow everyone. Ace permission by default, but if using ND Core you can specify the group name.
    params = {
        {
            name = "args", -- parameter name
            type = "string", -- parameter type 'number' or 'string' or 'playerId'
            help = "What to say", -- parameter description
            optional = false -- is the parameter optional or not
        }
    },
    prefix = "^1[ME]^7: " -- prefix to ammend to the message
}

commands["do"] = { -- command name
    enabled = true, -- enable or disable the command
    global = true, -- Set to false to only show to nearbly players
    description = "Send a message in character.", -- command description
    groups = false, -- Group(s) that have the permission to use the command, set to false to allow everyone. Ace permission by default, but if using ND Core you can specify the group name.
    params = {
        {
            name = "args", -- parameter name
            type = "string", -- parameter type 'number' or 'string' or 'playerId'
            help = "What to say", -- parameter description
            optional = false -- is the parameter optional or not
        }
    },
    prefix = "^2[DO]^7: " -- prefix to ammend to the message
}

commands["dw"] = { -- command name
    enabled = true, -- enable or disable the command
    global = true, -- Set to false to only show to nearbly players
    description = "Send a message on the dark web.", -- command description
    groups = false, -- Group(s) that have the permission to use the command, set to false to allow everyone. Ace permission by default, but if using ND Core you can specify the group name.
    params = {
        {
            name = "args", -- parameter name
            type = "string", -- parameter type 'number' or 'string' or 'playerId'
            help = "What to say", -- parameter description
            optional = false -- is the parameter optional or not
        }
    },
    prefix = "^3[DARK WEB]^7: " -- prefix to ammend to the message
}

commands["clear"] = { -- command name
    enabled = true, -- enable or disable the command
    description = "Clears the chat.", -- command description
    groups = {"admin"}, -- Group(s) that have the permission to use the command, set to false to allow everyone. Ace permission by default, but if using ND Core you can specify the group name.
    params = {},
    prefix = "^5[SYSTEM]^7: "
}

commands["announce"] = { -- command name
    enabled = true, -- enable or disable the command
    global = true,
    description = "Send an announcement in chat", -- command description
    groups = {"admin"}, -- Group(s) that have the permission to use the command, set to false to allow everyone. Ace permission by default, but if using ND Core you can specify the group name.
    params = {
        {
            name = "args", -- parameter name
            type = "string", -- parameter type 'number' or 'string' or 'playerId'
            help = "What to say", -- parameter description
            optional = false -- is the parameter optional or not
        }
    },
    prefix = "^5[ANNOUNCEMENT]^7: " -- prefix to ammend to the message
}

commands["discord"] = { -- command name
    enabled = true, -- enable or disable the command
    description = "Join our Discord!", -- command description
    groups = false, -- Group(s) that have the permission to use the command, set to false to allow everyone. Ace permission by default, but if using ND Core you can specify the group name.
    message = "https://discord.gg/threeamigos" -- what to send back to the player that runs it. 
}

commands["website"] = { -- command name
    enabled = true, -- enable or disable the command
    description = "Check out our Discord!", -- command description
    groups = false, -- Group(s) that have the permission to use the command, set to false to allow everyone. Ace permission by default, but if using ND Core you can specify the group name.
    message = "View our website - https://threeamigos.shop" -- what to send back to the player that runs it. 
}

commands["store"] = { -- command name
    enabled = true, -- enable or disable the command
    description = "Purchase something from our store!", -- command description
    groups = false, -- Group(s) that have the permission to use the command, set to false to allow everyone. Ace permission by default, but if using ND Core you can specify the group name.
    message = "https://threeamigos.tebex.io" -- what to send back to the player that runs it. 
}

commands["players"] = { -- command name
    enabled = true, -- enable or disable the command
    description = "Get the number of current players!", -- command description
    groups = false, -- Group(s) that have the permission to use the command, set to false to allow everyone. Ace permission by default, but if using ND Core you can specify the group name.
    prefix = "^5[SYSTEM]^7: " -- prefix to ammend to the message
}

return commands