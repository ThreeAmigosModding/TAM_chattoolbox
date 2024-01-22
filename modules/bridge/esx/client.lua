--[[------------------------------------------------------
----       For Support - discord.gg/threeamigos       ----
---- Do not edit if you do not know what you're doing ----
--]]------------------------------------------------------

local bridge = {}
local ESX = exports["es_extended"]:getSharedObject()

---@param description string
---@param type string
---@param duration integer
function bridge.notify(description, type, duration)
    ESX.ShowNotification(description)
end

return bridge