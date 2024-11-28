local CurrentDistance = 0
local showTime = 0
local isCircleVisible = false

local r = 255
local g = 0
local b = 0
local transparency = 255

RegisterNetEvent('SaltyChat_VoiceRangeChanged')
AddEventHandler('SaltyChat_VoiceRangeChanged', function(voiceRange, index, availableVoiceRanges)
    CurrentDistance = voiceRange
    showTime = GetGameTimer() + 1000 
    isCircleVisible = true 
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0) 
        if isCircleVisible then
            local currentTime = GetGameTimer()
            
            if currentTime < showTime then
              
                local pedCoords = GetEntityCoords(PlayerPedId())
                DrawMarker(0x94FDAE17, pedCoords.x, pedCoords.y, pedCoords.z - 1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, CurrentDistance * 2.0, CurrentDistance * 2.0, 0.4, r, g, b, transparency, false, true, 2, false, nil, nil, false)
            else
              
                isCircleVisible = false
            end
        else
            Citizen.Wait(100)
        end
    end
end)