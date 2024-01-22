--[[------------------------------------------------------
----       For Support - discord.gg/threeamigos       ----
---- Do not edit if you do not know what you're doing ----
--]]------------------------------------------------------
local callbacks = {}

-- https://github.com/ND-Framework/ND_Core/blob/main/server/commands.lua#L323-L366 thanks andy
callbacks["dv"] = function(source, args, rawCommand, info)
    local ped = GetPlayerPed(source)
    local veh = GetVehiclePedIsIn(ped)
    if veh and veh ~= 0 and DoesEntityExist(veh) then
        DeleteEntity(veh)
        Utils.logDiscord(username .. " (" .. license .. ") " .. " has executed /" .. rawCommand)
        return TriggerClientEvent("ox_lib:notify", source, {description = "Deleted your vehicle.", type = "success"})
    end

    local count = 0
    local coords = GetEntityCoords(ped)
    if args.radius then
        for _, veh in ipairs(GetAllVehicles()) do
            local vehDist = #(GetEntityCoords(veh) - coords)
            if vehDist < args.radius then
                DeleteEntity(veh)
                count += 1
            end
        end
        Utils.logDiscord(username .. " (" .. license .. ") " .. " has executed /" .. rawCommand .. " " .. args.radius)
        return Bridge.Notify("Deleted %d vehicles.", "success")
    end

    local closest, dist
    for _, veh in ipairs(GetAllVehicles()) do
        local vehDist = #(GetEntityCoords(veh) - coords)
        if vehDist < 5.0 and not closest or (dist and dist > vehDist) then
            closest = veh
            dist = vehDist
        end
    end

    if not closest then
        return Bridge.Notify("No Nearby Vehicle Found!", "error")
    end
    DeleteEntity(closest)
    Utils.logDiscord(username .. " (" .. license .. ") " .. " has executed /" .. rawCommand)
    Bridge.Notify("Deleted your vehicle.", "success")
end

callbacks["me"] = function(source, args, rawCommand, info)
    if Utils.antiSpam(source, rawCommand .. " " .. args) then return end

    local username = GetPlayerName(source)
    local license = GetPlayerIdentifierByType(source, "license")
    Utils.logDiscord(username .. " (" .. license .. ") " .. " has executed /" .. rawCommand .. " " .. args.args)

    if not args.global then
        local coords = GetEntityCoords(source)
        local players = lib.getNearbyPlayers(coords, 10)
        local playerName = Utils.getFullName(source)
        for _, player in ipairs(players) do 
            TriggerClientEvent("chat:addMessage", player, {args = {info.prefix .. playerName .. " " .. args.args}})
        end
    else
        local playerName = Utils.getFullName(source)
        TriggerClientEvent("chat:addMessage", -1, {args = {info.prefix .. playerName .. " " .. args.args}})
    end
end

callbacks["do"] = function(source, args, rawCommand, info)
    if Utils.antiSpam(source, rawCommand .. " " .. args) then return end

    local username = GetPlayerName(source)
    local license = GetPlayerIdentifierByType(source, "license")
    Utils.logDiscord(username .. " (" .. license .. ") " .. " has executed /" .. rawCommand .. " " .. args.args)

    if not args.global then
        local coords = GetEntityCoords(source)
        local players = lib.getNearbyPlayers(coords, 10)
        local playerName = Utils.getFullName(source)
        for _, player in ipairs(players) do 
            TriggerClientEvent("chat:addMessage", player, {args = {info.prefix .. playerName .. " " .. args.args}})
        end
    else
        local playerName = Utils.getFullName(source)
        TriggerClientEvent("chat:addMessage", -1, {args = {info.prefix .. playerName .. " " .. args.args}})
    end
end

callbacks["ooc"] = function(source, args, rawCommand, info)
    if Utils.antiSpam(source, rawCommand .. " " .. args) then return end

    local username = GetPlayerName(source)
    local license = GetPlayerIdentifierByType(source, "license")
    Utils.logDiscord(username .. " (" .. license .. ") " .. " has executed /" .. rawCommand .. " " .. args.args)

    if not args.global then
        local coords = GetEntityCoords(source)
        local players = lib.getNearbyPlayers(coords, 10)
        local playerName = GetPlayerName()
        for _, player in ipairs(players) do 
            TriggerClientEvent("chat:addMessage", player, {args = {info.prefix .. playerName .. ": " .. args.args}})
        end
    else
        local playerName = GetPlayerName()
        TriggerClientEvent("chat:addMessage", -1, {args = {info.prefix .. playerName .. ": " .. args.args}})
    end
end

callbacks["ooc"] = function(source, args, rawCommand, info)
    if Utils.antiSpam(source, rawCommand .. " " .. args) then return end

    local username = GetPlayerName(source)
    local license = GetPlayerIdentifierByType(source, "license")
    Utils.logDiscord(username .. " (" .. license .. ") " .. " has executed /" .. rawCommand .. " " .. args.args)

    if not args.global then
        local coords = GetEntityCoords(source)
        local players = lib.getNearbyPlayers(coords, 10)
        for _, player in ipairs(players) do 
            TriggerClientEvent("chat:addMessage", player, {args = {info.prefix .. args.business .. ": " .. args.args}})
        end
    else
        TriggerClientEvent("chat:addMessage", -1, {args = {info.prefix .. args.business .. ": " .. args.args}})
    end
end

callbacks["twt"] = function(source, args, rawCommand, info)
    if Utils.antiSpam(source, rawCommand .. " " .. args) then return end

    local username = GetPlayerName(source)
    local license = GetPlayerIdentifierByType(source, "license")
    Utils.logDiscord(username .. " (" .. license .. ") " .. " has executed /" .. rawCommand .. " " .. args.args)

    if not args.global then
        local coords = GetEntityCoords(source)
        local players = lib.getNearbyPlayers(coords, 10)
        local playerName = Utils.getFullName(source)
        for _, player in ipairs(players) do 
            TriggerClientEvent("chat:addMessage", player, {args = {info.prefix .. playerName .. ": " .. args.args}})
        end
    else
        local playerName = Utils.getFullName(source)
        TriggerClientEvent("chat:addMessage", -1, {args = {info.prefix .. playerName .. ": " .. args.args}})
    end
end

callbacks["dw"] = function(source, args, rawCommand, info)
    if Utils.antiSpam(source, rawCommand .. " " .. args) then return end

    local username = GetPlayerName(source)
    local license = GetPlayerIdentifierByType(source, "license")
    Utils.logDiscord(username .. " (" .. license .. ") " .. " has executed /" .. rawCommand .. " " .. args.args)

    if not args.global then
        local coords = GetEntityCoords(source)
        local players = lib.getNearbyPlayers(coords, 10)
        for _, player in ipairs(players) do 
            TriggerClientEvent("chat:addMessage", player, {args = {info.prefix ..  " ANONYMOUS: " .. args.args}})
        end
    else
        TriggerClientEvent("chat:addMessage", -1, {args = {info.prefix .. " ANONYMOUS: " .. args.args}})
    end
end

callbacks["clear"] = function(source, args, rawCommand, info)
    TriggerClientEvent("chat:clear", -1)
    Wait(3000)
    TriggerClientEvent("chat:addMessage", -1, "[^3SYSTEM^0] Chat Cleared by staff.")
    Utils.logDiscord(username .. " (" .. license .. ") " .. " has executed /" .. rawCommand)
end

callbacks["announce"] = function(source, args, rawCommand, info)
    Utils.logDiscord(username .. " (" .. license .. ") " .. " has executed /" .. rawCommand)

    TriggerClientEvent("chat:addMessage", -1, {args = {info.prefix .. args.args}})
end

callbacks["discord"] = function(source, args, rawCommand, info)
    Utils.logDiscord(username .. " (" .. license .. ") " .. " has executed /" .. rawCommand)

    TriggerClientEvent("chat:addMessage", source, {args = {info.message}})
end

callbacks["website"] = function(source, args, rawCommand, info)
    Utils.logDiscord(username .. " (" .. license .. ") " .. " has executed /" .. rawCommand)

    TriggerClientEvent("chat:addMessage", source, {args = {info.message}})
end

callbacks["store"] = function(source, args, rawCommand, info)
    Utils.logDiscord(username .. " (" .. license .. ") " .. " has executed /" .. rawCommand)

    TriggerClientEvent("chat:addMessage", source, {args = {info.message}})
end

callbacks["players"] = function(source, args, rawCommand, info)
    Utils.logDiscord(username .. " (" .. license .. ") " .. " has executed /" .. rawCommand)
    local players = Utils.getPlayerCount()
    TriggerClientEvent("chat:addMessage", source, {args = {info.prefix .. ("There are currently %s players online"):format(players)}})
end

return callbacks