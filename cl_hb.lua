---@type function
RegisterNUICallback("getHealth", function(data, callback)
    callback({
        h = GetEntityHealth(PlayerPedId()),
        a = GetPedArmour(PlayerPedId())
    })
end)

---@type thread
CreateThread(function()
    Wait(1500)

    NUI:Toggle(true)

    local map = RequestScaleformMovie("minimap")

    while true do
        Wait(250)

        BeginScaleformMovieMethod(map, "SETUP_HEALTH_ARMOUR")
        ScaleformMovieMethodAddParamInt(3)
        EndScaleformMovieMethod()
    end
end)