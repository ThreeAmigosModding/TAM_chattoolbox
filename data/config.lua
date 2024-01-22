--[[------------------------------------------------------
----       For Support - discord.gg/threeamigos       ----
----       Docs - https://docs.threeamigos.shop       ----
--]]------------------------------------------------------

local config = {}

config.enableJoinNotifications = true -- Enable or disable player join notifications
config.joinMessage = "%s has joined the server!" -- Message to display when someone joins the server. You MUST keep %s or else it won't work. %s is the players name.
config.enableLeaveNotifications = true -- Enable or disable player leave notifications
config.leaveMessage = "%s has left the server because %s !" -- Message to display when someone leaves the server. You MUST keep %s or else it won't work. %s is the players name & reason.

config.enableFilter = true -- enable the filter
config.blacklistedWords = {
    "faggot",
    "fuck",
    "whore"
}

config.enableAntiSpam = true -- enable anti spam?
config.antiSpamTime = 2 -- time in seconds between messages before mute

config.enableDiscordLogging = true -- Make sure you set the convar ctb:discordWebhookURL "YOURDISCORDWEBHOOKURL" else it won't work. Do not use setr, use set.
config.botName = "TAM ChatToolBox" -- Discord log bot name.
config.botAvatar = "https://cdn.discordapp.com/icons/1159320132150112327/1967d7914a1587a14ce2e0b64cf71a83.webp" -- Discord log avatar img
config.embedColor = 000000 -- The hex color (without #) to use for the embed.
config.embedTitle = "TAM ChatToolBox Logging" -- Embed Title
config.embedFooter = "Copyright © 2024 ThreeAmigosModding" -- Embed Footer

return config