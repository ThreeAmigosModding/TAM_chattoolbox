--[[------------------------------------------------------
----       For Support - discord.gg/threeamigos       ----
---- Do not edit if you do not know what you're doing ----
--]]------------------------------------------------------

local utils = {}
local muted = {}

---@param message string
function utils.logDiscord(message)
    local webhook = GetConvar("ctb:discordWebhookURL", "false")
    if not webhook or not Config.enableDiscordLogging then return end

    local year, month, day, hour, minute, second = GetLocalTime()
    local embed = {
        {
            ["color"] = Config.embedColor,
            ["title"] = Config.embedTitle,
            ["timestamp"] = os.date("!%Y-%m-%dT%H:%M:%S.000Z"),
            ["description"] = message,
            ["footer"] = {
                ["text"] = config.footer .. " • TAM_ChatToolBox By Three Amigos Modding"
            }
        }
    }

    PerformHttpRequest(webhook, function(err, text, headers) end, json.encode({username = Config.botName, embeds = embed, avatar_url = Config.botAvatar}), {["Content-Type"] = "application/json"})
end

---@param source integer
---@param message string
---@return boolean
function utils.antiSpam(source, message)
    if muted[source] == nil then
        muted[source] = {time = os.time()}
        return false
    elseif os.time - muted[source].time < Config.antiSpamTime then
        Bridge.Notify("Please don't spam.", "error")
        return true
    elseif message == muted[source].message then
        Bridge.Notify("Please don't spam.", "error")
        return true
    end

    muted[source] = {message = message, time = os.time()}

    return false
end

---@param message string
---@param type string
---@return function
function utils.print(message, type)
    if Config.Debug then
        return lib.print.debug(message)
    end

    return ("lib.print.%s(%s)"):format(type, message)
end

return utils