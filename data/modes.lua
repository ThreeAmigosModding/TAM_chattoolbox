--[[------------------------------------------------------
----       For Support - discord.gg/threeamigos       ----
----       Docs - https://docs.threeamigos.shop       ----
--]]------------------------------------------------------

local modes = {}

modes["staff"] = {  -- Mode Name
    enabled = true, -- Enable or disable this chat mode.
    displayName = "STAFF", -- Name to display
    color = "#FFC342", -- Mode color hex
    groups = {"admin"}, -- Group(s) that can see the chats, set to false or remove to allow everyone
    prefix = "[STAFF]" -- Prefix to put before message, set to false or remove to disable.
}

modes["local"] = {  -- Mode Name
    enabled = true, -- Enable or disable this chat mode.
    displayName = "LOCAL", -- Name to display
    color = "#FFF000", -- Mode color hex
    groups = false, -- Group(s) that can see the chats, set to false or remove to allow everyone
    cb = function(source, message, cbs) -- optional if you want to provide a custom function for chat modes.
        local selfCoords = GetEntityCoords(GetPlayerPed(source))
        local players = lib.getNearbyPlayers(selfCoords, 200, true)
        local playerIds = {}
        local characterName = Bridge.getFullName(source)

        for _, player in ipairs(players) do
            table.insert(playerIds, player.id)
        end

        cbs.updateMessage({
            template = "<b>^#FFF000[LOCAL]^7</b> {}",
            args = {characterName, message.args[2]}
        })

        cbs.setRouting(playerIds)
    end
}

modes["all"] = {
    enabled = true, -- Enable or disable this chat mode.
    displayName = "OOC", -- Name to display
    color = "#808080", -- Mode color hex
    groups = false, -- Group(s) that can see the chats, set to false to allow everyone
    cb = function(source, message, cbs)
        local characterName = Bridge.getFullName(source)
        cbs.updateMessage({
            template = "<b>^#808080[OOC]^7</b> {}",
            args = {characterName, message.args[2]}
        })
    end
}

return modes