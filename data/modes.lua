--[[------------------------------------------------------
----       For Support - discord.gg/threeamigos       ----
----       Docs - https://docs.threeamigos.shop       ----
--]]------------------------------------------------------

local modes = {}

modes["all"] = {  -- Mode Name
    displayName = "ALL", -- Name to display
    color = "#FFFFFF", -- Mode color hex
    groups = false, -- Group(s) that can see the chats, set to false to allow everyone,
    prefix = false -- Prefix to put before message, set to false to disable.
}

modes["staff"] = {  -- Mode Name
    displayName = "STAFF", -- Name to display
    color = "#FFF000", -- Mode color hex
    groups = {"admin"}, -- Group(s) that can see the chats, set to false to allow everyone
    prefix = "[STAFF]" -- Prefix to put before message, set to false to disable.
}

return modes