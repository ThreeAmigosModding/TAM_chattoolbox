--[[------------------------------------------------------
----       For Support - discord.gg/threeamigos       ----
---- Do not edit if you do not know what you're doing ----
--]]------------------------------------------------------

-- Utils = require ("modules.utils.%s"):format(lib.context)
Config = require "data.config"

local bridgeResources = {
    ["ND_Core"] = "nd",
    ["es_extended"] = "esx", -- Untested. Use with caution, expect bugs
    ["qb-core"] = "qb" -- Untested. Use with caution, expect bugs
}

---@return string
local function getBridge()
    for resource, framework in pairs(bridgeResources) do
        if GetResourceState(resource):find("start") then
            lib.print.info(("Successfully loaded %s module!"):format(framework))
            if framework == "qb" or framework == "esx" then lib.print.info(("%s has not been tested! Please use caution and expect bugs."):format(framework)) end
            return ("modules.bridge.%s.%s"):format(framework, lib.context)
        end
    end
    lib.print.info(("Successfully loaded %s module!"):format(framework))
    return ("modules.bridge.standalone.%s"):format(lib.context)
end

Bridge = require(getBridge())