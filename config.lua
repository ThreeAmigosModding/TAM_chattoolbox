config = {}

config.framework = 'ND' -- ND, QB, ESX, or none

config.EnableDV = true -- true/false. Enable or disable the delete vehicle command.
config.EnableDAV = true -- true/false. Enable or disable the delete all vehicles command.

config.DVCommand = 'dv' -- The delete vehicle command without the slash. Default: dv 
config.DAVCommand = 'delallveh' -- the delete all vehicle command without the slash. Default: delallveh

config.DVRestricted = false -- true/false. Weather or not the delete vehicle command should be restricted to any group with the permission command.Name
config.DAVRestricted = true -- true/false. Whether or not the command should be restricted to any group with the permission command.Name

config.EnableMe = true -- true/false. Enable or disable the /me command
config.MeCommand = 'me' -- The me command without the slash. Default: me
config.MeLocation = 'head' -- head, chat, or both. Where to show the /me command.

config.EnableMer = true, -- true/false. Enable or disable the /mer command.
config.MeRCommand = 'mer' -- The mer command without the slash. Default: mer
config.MerLocation = 'head' -- head, chat, or both. Where to show the /mer command.

config.EnableGme = true -- true/false. Enable or disable the global me command
config.GMeCommand = 'gme' -- The gme command without the slash. Default: gme

config.EnableGmer = true, -- true/false. Enable or disable the global mer command.
config.GmerCommand = 'gmer' -- The gmer command without the slash. Default: gmer

config.EnableDo = true, -- true/false. Enable or disable the local do command.
config.DoCommand = 'do' -- The do command without the slash. Default: do

config.EnableOOC = true, -- true/false. Enable or disable the local ooc command.
config.OOCCommand = 'ooc' -- The ooc command without the slash. Default: ooc

config.EnableGOOC = true, -- true/false. Enable or disable the global ooc command.
config.GOOCCommand = 'gooc' -- The global gooc command without the slash. Default: gooc

config.EnableTwt = true, -- true/false. Enable or disable the tweet command.
config.TwtCommand = 'tweet' -- The tweet command without the slash. Default: tweet

config.EnableDarkWeb = true, -- true/false. Enable or disable the darkweb command.
config.DarkWebCommand = 'darkweb' -- The darkweb command without the slash. Default: darkweb

config.Enable911 = true, -- true/false. Enable or disable the 911 command.
config.911Command = '911' -- The 911 command without the slash. Default: 911

config.EnableRT = true, -- true/false. Enable or disable the radio traffic command.
config.RTCommand = 'rt' -- The radio traffic command without the slash. Default: rt

config.EnableNews = true, -- true/false. Enable or disable the news command.
config.NewsCommand = 'news' -- The news command without the slash. Default: news

config.EnableAd = true, -- true/false. Enable or disable the ad command.
config.AdCommand = 'ad' -- The ad command without the slash. Default: ad

config.EnableAnnounce = true, -- true/false. Enable or disable the Announce command.
config.AnnounceCommand = 'announce' -- The Announce command without the slash. Default: Announce
config.AnnounceRestricted = true -- true/false. Whether or not the command should be restricted to any group with the permission command.Name

config.EnableDiscord = true, -- true/false. Enable or disable the Discord command.
config.DiscordCommand = 'discord' -- The Discord command without the slash. Default: discord
config.DiscordLink = 'discord.gg/perimeter' -- The discord link to display

config.EnableTeamSpeak = true, -- true/false. Enable or disable the TeamSpeak command.
config.TeamSpeakCommand = 'teamspeak' -- The TeamSpeak command without the slash. Default: teamspeak
config.TeamSpeakLink = 'ts.example.com' -- The TeamSpeak link to display

config.EnableWeb = true, -- true/false. Enable or disable the website command.
config.WebCommand = 'website' -- The website command without the slash. Default: website
config.WebLink = 'https://perimetergaming.com' -- The website link to display

config.JoinMessageEnable = true -- true/false. Enable or disable join messages
config.JoinMessage = "" -- join message. must have %s as that acts as a placeholder for the message.
config.LeaveMessageEnable = true -- true/false. Enable or disable leave messages
config.LeaveMessage = "" -- leave message. must have %s as that acts as a placeholder for the message.

config.EnableFilter = true -- true/false. Enable or disable the word filter. Make sure to setup config_server.lua if you're going to do so.
config.FilterMessage = "[^3SYSTEM^0] You cannot say ^1%s^0 in this server!" -- must have %s as that acts as a placeholder for the message.

config.filteredWords = { -- list of words to add. Make sure to include the comma.
    "fuck",
    "faggot",
    "kys"
}

