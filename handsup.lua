function raiseHands()
    local playerPed = PlayerPedId()
    if not IsEntityPlayingAnim(playerPed, "mp_arresting", "idle", 3) then
        RequestAnimDict("mp_arresting")
        while not HasAnimDictLoaded("mp_arresting") do
            Wait(100)
        end
        TaskPlayAnim(playerPed, "mp_arresting", "idle", 8.0, -8.0, -1, 49, 0, false, false, false)
    end
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsControlJustPressed(1, 74) then
            raiseHands()
        end
    end
end)
