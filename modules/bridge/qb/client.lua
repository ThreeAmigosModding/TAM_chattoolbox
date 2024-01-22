--[[------------------------------------------------------
----       For Support - discord.gg/threeamigos       ----
---- Do not edit if you do not know what you're doing ----
--]]------------------------------------------------------

local bridge = {}
local QBCore = exports["qb-core"]:GetCoreObject()

---@param description string
---@param type string
---@param duration integer
function bridge.notify(description, type, duration)
    QBCore.Functions.Notify(description, type, duration or 5000)
end

return bridge