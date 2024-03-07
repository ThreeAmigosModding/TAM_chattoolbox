--[[------------------------------------------------------
----       For Support - discord.gg/threeamigos       ----
---- Do not edit if you do not know what you're doing ----
--]]------------------------------------------------------

if not lib.checkDependency("ox_lib", "3.16.3") then return print("ox_lib either outdated or missing. Please download the latest release else this resource will not work!\n https://github.com/overextended/ox_lib/releases/latest/", "error") end

local modes = require "data.modes"
local config = require "data.config"
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
    if not info.enabled then end
    local cb = info.cb or callback
    lib.addCommand(command, {
        help = info.description,
        params = info.params,
        restricted = Bridge.getGroups(info.groups)
    }, function(source, args, raw)
        cb(source, args, raw, command, info)
    end)
    lib.print.info("Loaded Chat Command: " .. command)
end

---@param modes table
for mode, info in pairs(modes) do
    if not info.enabled then end
    exports.chat:registerMode({
        name = mode,
        displayName = info.displayName,
        color = info.color,
        cb = info.cb or function(source, message, cbs)
            local characterName = Bridge.getFullName(source)
            if info.prefix ~= false and info.prefix ~= nil then
                cbs.updateMessage({
                    template = "<b>^".. info.color .. info.prefix .. "^7</b> {}" or "{}",
                    args = {characterName, message.args[2]}
                })
            end
    
            if info.groups ~= nil and info.groups ~= false then
                local allowedGroups = {}
                local selfCoords = GetEntityCoords(GetPlayerPed(source))
                local players = GetPlayers()
    
                for _, id in ipairs(players) do
                    if group ~= false then
                        table.insert(allowedGroups, id)
                    end
                end
    
                cbs.setRouting(allowedGroups)
            end
        end
    })
    lib.print.info("Loaded Chat Mode: " .. mode)
end

if config.enableJoinNotifications then
    AddEventHandler("playerJoining", function(source, oldId)
        local playerName = GetPlayerName(source)
        TriggerClientEvent("chat:addMessage", -1, {args = {(config.joinMessage):format(playerName)}})
    end)
    lib.print.info("Loaded Player Join Module")
end

if config.enableLeaveNotifications then
    AddEventHandler("playerDropped", function(reason)
        local playerName = GetPlayerName(source)
        TriggerClientEvent("chat:addMessage", -1, {args = {(config.leaveMessage):format(playerName, reason)}})
    end)
    lib.print.info("Loaded Player Leave Module")
end

AddEventHandler('chatMessage', function(source, name, message)
    if string.sub(message, 1, 1) == "/" then
        CancelEvent()
    end
end)