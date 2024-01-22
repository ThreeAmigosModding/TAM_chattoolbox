--[[------------------------------------------------------
----       For Support - discord.gg/threeamigos       ----
---- Do not edit if you do not know what you're doing ----
--]]------------------------------------------------------

local bridge = {}
local QBCore = exports["qb-core"]:GetCoreObject()

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
    TriggerClientEvent('QBCore:Notify', source, description, type, duration or 5000)
end

---@param source integer
---@return string
function bridge.getFullName(source)
    local PlayerData = QBCore.Functions.GetPlayerData()
    return PlayerData.charinfo.firstname .. " " .. PlayerData.charinfo.lastname
end

---@return integer
function bridge.getPlayerCount()
    local playerCount = 0
    local players = QBCore.Functions.GetQBPlayers()

    return #players
end

return bridge