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
    Bridge.Notify("Deleted your vehicle.", "success")
end

callbacks["me"] = function(source, args, rawCommand, info)
    local username = GetPlayerName(source)
    local license = GetPlayerIdentifierByType(source, "license")
    local message = rawCommand:gsub("me ", "")

    if not info.global then
        local playerIds = {}
        local ped = GetPlayerPed(source)
        local coords = GetEntityCoords(ped)
        local playerName = Bridge.getFullName(source)
        local players = lib.getNearbyPlayers(coords, 10, true)
        
        for _, player in ipairs(players) do
            table.insert(playerIds, player.id)
        end

        for _, id in ipairs(playerIds) do 
            TriggerClientEvent("chat:addMessage", id, {args = {info.prefix .. " " .. playerName .. ": " .. message}})
        end
    else
        local playerName = Bridge.getFullName(source)
        TriggerClientEvent("chat:addMessage", -1, {args = {info.prefix .. " " .. playerName .. ": " .. message}})
    end
end

callbacks["do"] = function(source, args, rawCommand, info)
    local username = GetPlayerName(source)
    local license = GetPlayerIdentifierByType(source, "license")
    local message = rawCommand:gsub("do ", "")

    if not info.global then
        local playerIds = {}
        local ped = GetPlayerPed(source)
        local coords = GetEntityCoords(ped)
        local playerName = Bridge.getFullName(source)
        local players = lib.getNearbyPlayers(coords, 10, true)
        
        for _, player in ipairs(players) do
            table.insert(playerIds, player.id)
        end

        for _, id in ipairs(playerIds) do
            TriggerClientEvent("chat:addMessage", id, {args = {info.prefix .. " " .. playerName .. " does " .. message}})
        end
    else
        local playerName = Bridge.getFullName(source)
        TriggerClientEvent("chat:addMessage", -1, {args = {info.prefix .. " " .. playerName .. " does " .. message}})
    end
end

callbacks["dw"] = function(source, args, rawCommand, info)
    local username = GetPlayerName(source)
    local license = GetPlayerIdentifierByType(source, "license")
    local message = rawCommand:gsub("dw ", "")

    if not info.global then
        local playerIds = {}
        local ped = GetPlayerPed(source)
        local coords = GetEntityCoords(ped)
        local playerName = Bridge.getFullName(source)
        local players = lib.getNearbyPlayers(coords, 10, true)
        
        for _, player in ipairs(players) do
            table.insert(playerIds, player.id)
        end
        
        for _, id in ipairs(playerIds) do 
            TriggerClientEvent("chat:addMessage", id, {args = {info.prefix ..  " " .. message}})
        end
    else
        TriggerClientEvent("chat:addMessage", -1, {args = {info.prefix .. " " .. message}})
    end
end

callbacks["clear"] = function(source, args, rawCommand, info)
    TriggerClientEvent("chat:clear", -1)
    Wait(1000)
    TriggerClientEvent("chat:addMessage", -1, {args = {info.prefix .. " Chat Cleared by staff."}})
end

callbacks["announce"] = function(source, args, rawCommand, info)
    local message = rawCommand:gsub("announce ", "")
    TriggerClientEvent("chat:addMessage", -1, info.message)
end

callbacks["discord"] = function(source, args, rawCommand, info)
    TriggerClientEvent("chat:addMessage", source, info.message)
end

callbacks["website"] = function(source, args, rawCommand, info)
    TriggerClientEvent("chat:addMessage", source, info.message)
end

callbacks["store"] = function(source, args, rawCommand, info)
    TriggerClientEvent("chat:addMessage", source, info.message)
end

callbacks["players"] = function(source, args, rawCommand, info)
    local players = Bridge.getPlayerCount()
    TriggerClientEvent("chat:addMessage", source, {args = {info.prefix .. ("There are currently %s players online"):format(players)}})
end

return callbacks