--[[------------------------------------------------------
----       For Support - discord.gg/threeamigos       ----
----       Docs - https://docs.threeamigos.shop       ----
--]]------------------------------------------------------

local config = {}

config.enableJoinNotifications = true -- Enable or disable player join notifications
config.joinMessage = "%s has joined the server!" -- Message to display when someone joins the server. You MUST keep %s or else it won't work. %s is the players name.
config.enableLeaveNotifications = true -- Enable or disable player leave notifications
config.leaveMessage = "%s has left the server because %s !" -- Message to display when someone leaves the server. You MUST keep %s or else it won't work. %s is the players name & reason.

return config