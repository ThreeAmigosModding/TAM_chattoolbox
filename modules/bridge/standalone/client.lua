--[[------------------------------------------------------
----       For Support - discord.gg/threeamigos       ----
---- Do not edit if you do not know what you're doing ----
--]]------------------------------------------------------

local bridge = {}

---@param description string
---@param type string
---@param duration integer
function bridge.notify(description, type, duration)
    lib.notify({description = description, type = type, duration = duration or 1000})
end

return bridge