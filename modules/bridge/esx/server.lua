--[[------------------------------------------------------
----       For Support - discord.gg/threeamigos       ----
---- Do not edit if you do not know what you're doing ----
--]]------------------------------------------------------

local bridge = {}
local ESX = exports["es_extended"]:getSharedObject()

---@param groups string|table
---@return boolean|table
function bridge.getGroups(groups)
    if groups ~= nil and groups ~= false then
        restricted = {}
        for _, group in pairs(groups) do
            table.insert(restricted, ("group.%s"):format(group))
        end
    
        return restricted
    end
    return false
end

---@param source integer
---@param description string
---@param type string
---@param duration integer
function bridge.notify(source, description, type, duration)
    TriggerClientEvent('esx:showNotification', source, description)
end

---@param source integer
---@return string
function bridge.getFullName(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer then
        local firstName = xPlayer.get('firstName')
        local lastName = xPlayer.get('lastName')
        return firstName .. " " .. lastName
    end
end

---@return integer
function bridge.getPlayerCount()
    local players = ESX.GetPlayers()
    return #players
end

return bridge