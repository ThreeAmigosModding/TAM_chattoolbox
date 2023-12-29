local oxLib = GetResourceState("ox_lib")
local name = nil

if config.framework == 'ND' then
    local NDCore = exports["ND_Core"]:GetCoreObject()
    local char = NDCore.Functions.GetSelectedCharacter()

    if char then
        name = chracter.firstName .. " " .. character.lastName
    else
        print('no character')
    end
elseif config.framework == 'QB' then
    local QBCore = exports['qb-core']:GetCoreObject()
    local Player = QBCore.Functions.GetPlayerData()
    print(Player.CharInfo)
elseif config.framework == 'ESX' then

else
    name = GetPlayerName(PlayerPedId())
end


-- register commands
if config.enableMe then
    RegisterCommand(config.MeCommand, function(source, args, rawCommand)
        if config.MeLocation == 'head' or config.MeLocation == 'both' then
            local text = "* " .. table.concat(args, " ") .. " *"
            local ply = pedId()
            local name = GetPlayerName(PlayerPedId())

            if ply ~= -1 then
                displayText(ply, text)
            end

            TriggerClientEvent("tam:toolBox:sendProximityMeMessage", -1, source, name, table.concat(args, " "))
        elseif config.MeLocation == 'chat' or config.MeLocation == 'both' then
            local name = GetPlayerName(source)
            TriggerClientEvent("tam:toolBox:sendProximityMeMessage", -1, source, name, table.concat(args, " "))
        else
            Citizen.Trace('You have an error in your tam_chattoolbox config.')
        end
    end, false)
end

if config.enableMer then
    RegisterCommand(config.MerCommand, function(source, args, rawCommand)
        if config.MerLocation == 'head' or config.MerLocation == 'both' then
            local text = "* ^8" .. table.concat(args, " ") .. " *"
            local ply = pedId()
            local name = GetPlayerName(PlayerPedId())

            if ply ~= -1 then
                displayText(ply, text)
            end

            TriggerClientEvent("tam:toolBox:sendProximityMeMessage", -1, source, name, '^8' .. table.concat(args, " "))
        elseif config.MerLocation == 'chat' or config.MerLocation == 'both' then
            local name = GetPlayerName(PlayerPedId())
            TriggerClientEvent("tam:toolBox:sendProximityMeMessage", -1, source, name, '^8' .. table.concat(args, " "))
        else
            Citizen.Trace('You have an error in your tam_chattoolbox config.')
        end
    end, false)
end

if config.enableDV then
    RegisterCommand(config.DVCommand, function()
        TriggerEvent("tam:chatToolbox:deleteVehicle")
    end, config.DVRestricted)

    TriggerEvent("chat:addSuggestion", config.DVCommand, "Deletes the vehicle you're sat in, or standing next to.")
end

RegisterCommand(config.DAVCommand, function(source, args, rawCommand)
    TriggerClientEvent("tam:chatToolbox:delallveh", -1)
end, config.DAVRestricted)

-- events
RegisterNetEvent('tam:toolBox:sendProximityMeMessage', function(id, name, msg)
    local pedId = PlayerId()
    local srvId = GetPlayerFromServerId(id)
    if pedId == srvId then
        TriggerEvent('chatMessage', "", {255, 0, 0}, " ^6 ^*ME | ^7" .. name .."^7: ".."^r " .. msg)
    elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(srvId)), GetEntityCoords(GetPlayerPed(pedId)), true) < 19.999 then
        TriggerEvent('chatMessage', "", {255, 0, 0}, " ^6 ^*ME | ^7" .. name .."^7: ".."^r " .. msg)
    end
end)

RegisterNetEvent('tam:toolBox:sendProximityDoMessage', function(id, name, msg)
    local pedId = PlayerId()
    local srvId = GetPlayerFromServerId(id)
    if pedId == srvId then
        TriggerEvent('chatMessage', "", {255, 0, 0}, " ^6 ^*ME | ^7" .. name .."^7: ".."^r " .. msg)
    elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(srvId)), GetEntityCoords(GetPlayerPed(pedId)), true) < 19.999 then
        TriggerEvent('chatMessage', "", {255, 0, 0}, " ^6 ^*ME | ^7" .. name .."^7: ".."^r " .. msg)
    end
end)

RegisterNetEvent("tam:chatToolbox:deleteVehicle", function()
    local ped = PlayerPedId()

    if (DoesEntityExist(ped) and not IsEntityDead(ped)) then
        local pos = GetEntityCoords(ped)
        if (IsPedSittingInAnyVehicle(ped)) then
            local veh = GetVehiclePedIsIn(ped, false)
            if (GetPedInVehicleSeat(veh, -1) == ped) then
                DeleteGivenVehicle(veh, numRetries)
            else
                if oxlib == 'started' then
                    lib.notify({description = 'You must be in the driver\'s seat!', type = 'error'})
                else
                    Notify('~r~You must be in the driver\'s seat!')
                end

            end
            local inFrontOfPlayer = GetOffsetFromEntityInWorldCoords(ped, 0.0, distanceToCheck, 0.0)
        else
            local veh = GetVehicleInDirection(ped, pos, inFrontOfPlayer)
            if (DoesEntityExist(veh)) then
                DeleteGivenVehicle(veh, numRetries)
            else
                if oxlib == 'started' then
                    lib.notify({description = 'You must be in or near a vehicle to delete it.', type = 'error'})
                else
                    Notify('~r~Failed to delete vehicle, trying again...')
                end
            end
        end
    end
end)

RegisterNetEvent("tam:chatToolbox:delallveh", function ()
    for veh in EnumerateVehicles() do
        if (not IsPedAPlayer(GetPedInVehicleSeat(veh, -1))) then
            SetVehicleHasBeenOwnedByPlayer(veh, false)
            SetEntityAsMissionEntity(veh, false, false)
            DeleteVehicle(veh)
            if (DoesEntityExist(veh)) then
                DeleteVehicle(veh)
                if oxlib == 'started' then
                    lib.notify({description = 'Deleted All Vehicles', type = 'Success'})
                else
                    Notify('Deleted All Vehicles!')
                end
            end
        end
    end
end)

-- functions
local distanceToCheck = 5.0
local numRetries = 5

function DeleteGivenVehicle(veh, tMax)
    local timeout = 0

    SetEntityAsMissionEntity(veh, true, true)
    DeleteVehicle(veh)
    if (DoesEntityExist(veh)) then
        if oxlib == 'started' then
            lib.notify({description = 'Failed to delete vehicle, trying again...', type = 'error'})
        else
            Notify('~r~Failed to delete vehicle, trying again...')
        end
        while (DoesEntityExist(veh) and timeout < tMax) do
            DeleteVehicle(veh)
            if (not DoesEntityExist(veh)) then
                if oxlib == 'started' then
                    lib.notify({description = 'Vehicle Deleted', type = 'success'})
                else
                    Notify('Vehicle Deleted!')
                end

            end
            timeout = timeout + 1
            Wait(500)
            if (DoesEntityExist(veh) and (timeout == tMax - 1)) then
                if oxlib == 'started' then
                    lib.notify({description = 'Failed to delete vehicle after ' .. tMax .. ' retries.', type = 'error'})
                else
                    Notify('~r~Failed to delete vehicle after ' .. tMax .. ' retries.')
                end
            end
        end
    else
        if oxlib == 'started' then
            lib.notify({description = 'Vehicle Deleted', type = 'success'})
        else
            Notify('Vehicle Deleted!')
        end
    end
end

-- Gets a vehicle in a certain direction
-- Credit to Konijima
function GetVehicleInDirection(entFrom, coordFrom, coordTo)
    local ray = StartShapeTestCapsule(coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 5.0, 10, entFrom, 7)
    local _, _, _, _, veh = GetShapeTestResult(ray)

    if (IsEntityAVehicle(veh)) then
        return veh
    end
end

function Notify(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
end

local peds = {}
local GetGameTimer = GetGameTimer

function drawText3D(coords, text)
    local camCoords = GetGameplayCamCoord()
    local dist = #(coords - camCoords)
    local scale = 200 / (GetGameplayCamFov() * dist)

    SetTextScale(0.0, 0.5 * scale)
    SetTextFont(4)
    SetTextCentre(true)
    SetTextColour(230, 230, 230, 255)
    SetTextDropShadow(0,0,0,0,55)
    SetTextDropShadow()


    BeginTextCommandDisplayText("STRING")
    AddTextComponentSubstringPlayerName(text)
    EndTextCommandDisplayText(0.0, 0.0)
    ClearDrawOrigin()
end

function displayText(ped, text)
    local playerPed = PlayerPedId()
    local playerPos = GetEntityCoords(playerPed)
    local targetPos = GetEntityCoords(ped)
    local dist = #(playerPos - targetPos)
    local los = HasEntityClearLosToEntity(playerPed, ped, 17)

    if dist <= c.dist and los then
        local exists = peds[ped] ~= nil

        peds[ped] = {
            time = GetGameTimer() + c.time,
            text = text
        }

        if not exists then
            local display = true

            while display do
                Wait(0)
                local pos = GetOffsetFromEntityInWorldCoords(ped, 0.0, 0.0, 1.0)
                draw3dText(pos, peds[ped].text)
                display = GetGameTimer() <= peds[ped].time
            end

            peds[ped] = nil
        end

    end
end

local entityEnumerator = {
    __gc = function(enum)
    if enum.destructor and enum.handle then
        enum.destructor(enum.handle)
    end
    enum.destructor = nil
    enum.handle = nil
    end
}

local function EnumerateEntities(initFunc, moveFunc, disposeFunc)
    return coroutine.wrap(function()
    local iter, id = initFunc()
    if not id or id == 0 then
        disposeFunc(iter)
        return
    end

    local enum = {handle = iter, destructor = disposeFunc}
    setmetatable(enum, entityEnumerator)

    local next = true
    repeat
        coroutine.yield(id)
        next, id = moveFunc(iter)
    until not next

    enum.destructor, enum.handle = nil, nil
    disposeFunc(iter)
    end)
end

function EnumerateObjects()
    return EnumerateEntities(FindFirstObject, FindNextObject, EndFindObject)
end

function EnumeratePeds()
    return EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed)
end

function EnumerateVehicles()
    return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end

function EnumeratePickups()
    return EnumerateEntities(FindFirstPickup, FindNextPickup, EndFindPickup)
end

--[[Usage:
for ped in EnumeratePeds() do
    <do something with 'ped'>
end
]]