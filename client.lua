lib.locale()
local Items = exports.ox_inventory:Items()
local House = 1

local function DrawText3D(coords, text)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextColour(255, 255, 255, 215)
    BeginTextCommandDisplayText('STRING')
    SetTextCentre(true)
    AddTextComponentSubstringPlayerName(text)
    SetDrawOrigin(coords.x, coords.y, coords.z, 0)
    EndTextCommandDisplayText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0 + 0.0125, 0.017 + factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

local function LoadAnimDict(dict) while not HasAnimDictLoaded(dict) do RequestAnimDict(dict) Wait(0) end end

CreateThread(function()
    local HasShownText
    while true do
        local PlayerCoords = GetEntityCoords(cache.ped)
        local WaitTime = 800
        local Nearby = false
        for i = 1, #Config.Houses do
            if #(PlayerCoords - Config.Houses[i].coords) <= 1.4 and Config.Houses[i].opened then
                WaitTime = 0
                Nearby = true
                House = i
                if Config.UseDrawText then
                    if not HasShownText then HasShownText = true exports['qbx-core']:DrawText(locale('text.enter_house')) end
                else
                    DrawText3D(Config.Houses[i].coords, locale('text.enter_house'))
                end
                if IsControlJustReleased(0, 38) then
                    LoadAnimDict('anim@heists@keycard@')
                    TaskPlayAnim(cache.ped, 'anim@heists@keycard@', 'exit', 5.0, 1.0, -1, 16, 0, false, false, false)
                    TriggerServerEvent('houserobbery:server:enterHouse', i)
                    RemoveAnimDict('anim@heists@keycard@')
                end
            elseif #(PlayerCoords - Config.Houses[i].coords) <= 1.6 and not Config.Houses[i].opened then
                WaitTime = 0
                Nearby = true
                if Config.UseDrawText then
                    if not HasShownText then HasShownText = true exports['qbx-core']:DrawText(locale('text.enter_requirements')) end
                else
                    DrawText3D(Config.Houses[i].coords, locale('text.enter_requirements'))
                end
            end
        end
        if not Nearby and HasShownText then HasShownText = false exports['qbx-core']:HideText() end
        Wait(WaitTime)
    end
end)

CreateThread(function()
    local HasShownText
    while true do
        local PlayerCoords = GetEntityCoords(cache.ped)
        local WaitTime = 800
        local Nearby = false
        for i = 1, #Config.Interiors do
            local Exit = vector3(Config.Interiors[i].exit.x, Config.Interiors[i].exit.y, Config.Interiors[i].exit.z)
            if #(PlayerCoords - Exit) <= 1.4 then
                WaitTime = 0
                Nearby = true
                if Config.UseDrawText then
                    if not HasShownText then HasShownText = true exports['qbx-core']:DrawText(locale('text.leave_house')) end
                else
                    DrawText3D(Exit, locale('text.leave_house'))
                end
                if IsControlJustReleased(0, 38) then
                    LoadAnimDict('anim@heists@keycard@')
                    TaskPlayAnim(cache.ped, 'anim@heists@keycard@', 'exit', 5.0, 1.0, -1, 16, 0, false, false, false)
                    TriggerServerEvent('houserobbery:server:leaveHouse')
                    RemoveAnimDict('anim@heists@keycard@')
                end
            end
        end
        if not Nearby and HasShownText then HasShownText = false exports['qbx-core']:HideText() end
        Wait(WaitTime)
    end
end)

CreateThread(function()
    local HasShownText
    while true do
        local PlayerCoords = GetEntityCoords(cache.ped)
        local WaitTime = 800
        local Nearby = false
        if Config.Houses[House].opened and Config.Houses[House].loot[1] then
            for i = 1, #Config.Houses[House].loot do
                if #(PlayerCoords - Config.Houses[House].loot[i].coords) < 0.8 and not Config.Houses[House].loot[i].isOpened then
                    WaitTime = 0
                    Nearby = true
                    if Config.UseDrawText then
                        if not HasShownText then HasShownText = true exports['qbx-core']:DrawText(locale('text.search')) end
                    else
                        DrawText3D(Config.Houses[House].loot[i].coords, locale('text.search'))
                    end
                    if IsControlJustReleased(0, 38) then
                        -- if not QBCore.Functions.IsWearingGloves() then
                        --     if Config.FingerDropChance > math.random(0, 100) then TriggerServerEvent('evidence:server:CreateFingerDrop', GetEntityCoords(cache.ped)) end
                        -- end
                        lib.callback('houserobbery:callback:checkLoot', false, function(CanStart)
                            if not CanStart then return end
                            if lib.progressCircle({
                                duration = math.random(4000, 8000),
                                position = 'bottom',
                                canCancel = true,
                                disable = {
                                    move = true,
                                    combat = true,
                                },
                                anim = {
                                    dict = 'missexile3',
                                    clip = 'ex03_dingy_search_case_base_michael',
                                    flag = 1,
                                    blendIn = 1.0
                                },
                            }) then
                                TriggerServerEvent('houserobbery:server:lootFinished', House, i)
                            else
                                TriggerServerEvent('houserobbery:server:lootCancelled', House, i)
                            end
                        end, House, i)
                    end
                end
            end
        end
        if not Nearby and HasShownText then HasShownText = false exports['qbx-core']:HideText() end
        Wait(WaitTime)
    end
end)

CreateThread(function()
    local HasShownText
    while true do
        local PlayerCoords = GetEntityCoords(cache.ped or PlayerPedId())
        local WaitTime = 800
        local Nearby = false
        if Config.Houses[House].opened and Config.Houses[House].pickups[1] then
            for i = 1, #Config.Houses[House].pickups do
                if #(PlayerCoords - Config.Houses[House].pickups[i].coords) < 0.8 and not Config.Houses[House].pickups[i].isOpened then
                    WaitTime = 0
                    Nearby = true
                    if Config.UseDrawText then
                        if not HasShownText then HasShownText = true exports['qbx-core']:DrawText(locale('text.pickup', { Item = Items[Config.Houses[House].pickups[i].reward]['label'] })) end
                    else
                        DrawText3D(Config.Houses[House].pickups[i].coords, locale('text.pickup', Items[Config.Houses[House].pickups[i].reward]["label"]))
                    end
                    if IsControlJustReleased(0, 38) then
                        -- if not QBCore.Functions.IsWearingGloves() then
                        --     if Config.FingerDropChance > math.random(0, 100) then TriggerServerEvent('evidence:server:CreateFingerDrop', GetEntityCoords(cache.ped)) end
                        -- end
                        lib.callback('houserobbery:callback:checkPickup', false, function(CanStart)
                            if not CanStart then return end
                            if lib.progressCircle({
                                duration = math.random(4000, 8000),
                                position = 'bottom',
                                canCancel = true,
                                disable = {
                                    move = true,
                                    combat = true,
                                },
                                anim = {
                                    dict = 'missexile3',
                                    clip = 'ex03_dingy_search_case_base_michael',
                                    flag = 1,
                                    blendIn = 1.0
                                },
                            }) then
                                TriggerServerEvent('houserobbery:server:pickupFinished', House, i)
                            else
                                TriggerServerEvent('houserobbery:server:pickupCancelled', House, i)
                            end
                        end, House, i)
                    end
                elseif #(PlayerCoords - Config.Houses[House].pickups[i].coords) < 30.0 and Config.Houses[House].pickups[i].isOpened then
                    local Pickup = Config.Houses[House].pickups[i]
                    local Entity = GetClosestObjectOfType(Pickup.coords.x, Pickup.coords.y, Pickup.coords.z, 3.0, joaat(Pickup.prop), false, false, false)
                    if DoesEntityExist(Entity) then
                        SetEntityVisible(Entity, false, false)
                    end
                end
            end
        end
        if not Nearby and HasShownText then HasShownText = false exports['qbx-core']:HideText() end
        Wait(WaitTime)
    end
end)

lib.callback.register('houserobbery:callback:startSkillcheck', function(Difficulty)
    LoadAnimDict('veh@break_in@0h@p_m_one@')
    TaskPlayAnim(cache.ped, 'veh@break_in@0h@p_m_one@', 'std_force_entry_rds', 3.0, 3.0, -1, 17, 0, false, false, false)
    local Success = lib.skillCheck(Difficulty)
    ClearPedTasks(cache.ped)
    RemoveAnimDict('veh@break_in@0h@p_m_one@')
    return Success
end)

lib.callback.register('houserobbery:callback:checkTime', function()
    local CurrentHour = GetClockHours()
    if CurrentHour >= Config.Hours.Start or CurrentHour <= Config.Hours.End then
        return true
    else
        return false
    end
end)

RegisterNetEvent('houserobbery:client:syncconfig', function(Data, Index)
    if Index then
        Config.Houses[Index] = Data
    else
        Config.Houses = Data
    end
end)

function CreatePublicBlip(coords, text, sprite, color, scale)
	local blip = AddBlipForCoord(coords.x, coords.y, coords.z)

	SetBlipSprite(blip, sprite)
	SetBlipScale(blip, scale)
	SetBlipColour(blip, color)
    SetBlipDisplay(blip, 5)
	SetBlipAsShortRange(blip, true)

	BeginTextCommandSetBlipName('STRING')
	AddTextComponentSubstringPlayerName(text)
	EndTextCommandSetBlipName(blip)

    return blip
end

local Blips = {}

function InitHouseBlips()
	for key, blip in pairs(Config.Houses) do
        Blips[key] = CreatePublicBlip(blip.coords, "Cambriolage", 119, 1, 0.8)
    end
end

CreateThread(function()
    InitHouseBlips()
end)

function ClearBlips()
    for k, blip in pairs(Blips) do
        if blip then
            RemoveBlip(blip)
        end
    end
end

AddEventHandler('onClientResourceStart', function(resourceName)
    if (GetCurrentResourceName() == resourceName) then
        ClearBlips()
        InitHouseBlips()
    end
end)