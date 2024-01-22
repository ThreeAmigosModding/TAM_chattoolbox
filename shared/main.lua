--[[------------------------------------------------------
----       For Support - discord.gg/threeamigos       ----
---- Do not edit if you do not know what you're doing ----
--]]------------------------------------------------------

Utils = require ("modules.utils.%s"):format(lib.context)
Config = require "data.config"

local bridgeResources = {
    ["ND_Core"] = "nd",
    ["es_extended"] = "esx",
    ["qb-core"] = "qb",
    ["ox_core"] = "ox"
}

---@return string
local function getBridge()
    for resource, framework in pairs(bridgeResources) do
        if GetResourceState(resource):find("start") then
            Utils.print(("Successfully loaded %s module!"):format(framework), "info")
            return ("modules.bridge.%s.%s"):format(framework, lib.context)
        end
    end
    Utils.print(("Successfully loaded %s module!"):format(framework), "info")
    return ("modules.bridge.standalone.%s"):format(lib.context)
end

Bridge = require(getBridge())