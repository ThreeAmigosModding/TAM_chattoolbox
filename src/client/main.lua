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


RegisterCommand(config.MeCommand, function() 
    if config.MeLocation == 'head' or config.MeLocation == 'both' then
        local text = "* " .. table.concat(args, " ") .. " *"
        local ply = pedId()

        if ply ~= -1 then
            displayText(ply, text)
        end
    elseif config.MeLocation == 'chat' or config.MeLocation == 'both'
        
    else
        Citizen.Trace('You have an error in your tam_chattoolbox config.')
    end
end)