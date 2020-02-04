local isPlayerDead = false
local PlayerLoaded = false
local onScreen = false

ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
    end
    
	PlayerLoaded = true
	ESX.PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
    PlayerLoaded = true
    
end)

AddEventHandler('esx:onPlayerDeath', function(data)
	isPlayerDead = true
end)

RegisterNetEvent('esx_ambulancejob:revive')
AddEventHandler('esx_ambulancejob:revive', function()
    isPlayerDead = false
end)

Citizen.CreateThread(function()
    while true do
        if PlayerLoaded and isPlayerDead and not onScreen then
            print("AAAAA CTM ME MORI")
            SendNUIMessage({
                setDisplay = true
            })
            onScreen = true
        elseif not isPlayerDead and onScreen then
            print("VIVO CTM AAAA")
            SendNUIMessage({
                setDisplay = false
            })
            onScreen = false
        end
        Citizen.Wait(100)
    end
end)