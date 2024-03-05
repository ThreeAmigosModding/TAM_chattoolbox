--[[------------------------------------------------------
----       For Support - discord.gg/threeamigos       ----
---- Do not edit if you do not know what you're doing ----
--]]------------------------------------------------------

local bridge = {}
local NDCore = exports["ND_Core"]

---@param groups string|table
---@return boolean|table
function bridge.getGroups(groups)
    if groups ~= nil and groups ~= false then
        local restricted = {}
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
    local player = NDCore:getPlayer(source)
    player.notify({description = description, type = type, duration = duration or 1000})
end

---@param source integer
---@return string
function bridge.getFullName(source)
    local player = NDCore:getPlayer(source)
    return player.fullname
end

---@return integer
function bridge.getPlayerCount()
    local players = NDCore:getPlayers()
    return #players
end

return bridge