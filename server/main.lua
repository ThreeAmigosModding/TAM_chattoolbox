--[[------------------------------------------------------
----       For Support - discord.gg/threeamigos       ----
---- Do not edit if you do not know what you're doing ----
--]]------------------------------------------------------

if not lib.checkDependency("ox_lib", "3.16.2") then return Utils.print("ox_lib either outdated or missing. Please download the latest release else this resource will not work!\n https://github.com/overextended/ox_lib/releases/latest/", "error") end

local commands = require "data.commands"
local callbacks = require "modules.callbacks.server"

---@param source integer
---@param args string
---@param raw string
---@param command string
local function callback(source, args, raw, command, info)
    callbacks[command](source, args, raw, info)
end

---@param commands table
for command, info in pairs(commands) do
    if not info.enabled then return end
    local cb = info.cb or callback
    lib.addCommand(command, {
        help = info.description,
        params = info.params,
        restricted = Bridge.getGroups(info.groups)
    }, function(source, args, raw, info)
        cb(source, args, raw, command, info)
    end)
    Utils.print("Loaded Chat Commands & Callbacks", "info")
end

local modes = require "data.modes"

---@param modes table
for mode, info in pairs(modes) do
    if not info.enabled then return end
    exports.chat:registerMode({
        name = mode,
        displayName = info.displayName,
        color = info.color,
        seObject = ("mode.%s"):format(mode),
        cb = function(source, message, cbs)
            if info.prefix ~= false and info.prefix ~= nil then
                cbs.updateMessage({
                    template = info.prefix .. " {}"
                })
            end

            if info.groups ~= nil and info.groups ~= false then
                for _, group in pairs(Bridge.getGroups(info.groups)) do
                    lib.addAce(group, ("mode.%s"):format(mode))
                end
            else
                lib.addAce("builtin.everyone", ("mode.%s"):format(mode))
            end
            cbs.setSeObject(("mode.%s"):format(mode))
        end
    })
    Utils.print("Loaded Chat Modes", "info")
end

if Config.enableAntiSpam then
    AddEventHandler("chatMessage", function(source, name, message)
        if Utils.antiSpam(source, message) then CancelEvent() end
    end)
end

if Config.enableFilter then
    AddEventHandler("chatMessage", function(source, name, message)
        for _, word in ipairs(config.blacklistedWords) do 
            if string.find(string.lower(message, word)) then
                CancelEvent()
                Utils.notify("Blacklisted word!", "error")
            end
        end
    end)
end

if Config.enableJoinNotifications then
    AddEventHandler("playerJoining", function(source, oldId)
        local playerName = GetPlayerName(source)
        TriggerClientEvent("chat:addMessage", -1, args = {(Config.joinMessage):format(playerName)})
    end)
end

if Config.enableLeaveNotifications then
    AddEventHandler("playerDropped", function(reason)
        local playerName = GetPlayerName(source)
        TriggerClientEvent("chat:addMessage", -1, args = {(Config.leaveMessage):format(playerName, reason)})
    end)
end