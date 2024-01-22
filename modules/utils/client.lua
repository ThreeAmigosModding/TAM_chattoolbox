--[[------------------------------------------------------
----       For Support - discord.gg/threeamigos       ----
---- Do not edit if you do not know what you're doing ----
--]]------------------------------------------------------

local utils = {}

---@param message string
---@param type string
function utils.print(message, type)
    if Config.Debug then
        return lib.print.debug(message)
    end

    return ("lib.print.%s(%s)"):format(type, message)
end

return utils