return function(selectedPlayer, playerOptions)
    local PlayerStates = PlayerStates or {}
    local CurrentPlayer = CurrentPlayer or selectedPlayer

    local function GetPlayerNames()
        local names = {}
        for _, ply in ipairs(player.GetAll()) do
            table.insert(names, ply:Nick())
        end
        return names
    end

    if playerOptions then
        local names = GetPlayerNames()
        table.clear(playerOptions)
        for i, n in ipairs(names) do
            playerOptions[i] = n
        end
    end

    for _, ply in ipairs(player.GetAll()) do
        local nick = ply:Nick()
        PlayerStates[nick] = PlayerStates[nick] or {}
    end

    if selectedPlayer then
        CurrentPlayer = selectedPlayer

        PlayerStates[CurrentPlayer] = PlayerStates[CurrentPlayer] or {}

        _G.CurrentPlayerState = PlayerStates[CurrentPlayer]
        _G.CurrentPlayerName = CurrentPlayer

        print("[PLAYERLIST] Selected player:", CurrentPlayer)
        print("[PLAYERLIST] Current state table:", _G.CurrentPlayerState)
    end

    hook.Add("PlayerConnect", "UpdatePlayerOptions", function()
        if playerOptions then
            local names = GetPlayerNames()
            table.clear(playerOptions)
            for i, n in ipairs(names) do
                playerOptions[i] = n
            end
        end
    end)
    hook.Add("PlayerDisconnected", "UpdatePlayerOptions", function()
        if playerOptions then
            local names = GetPlayerNames()
            table.clear(playerOptions)
            for i, n in ipairs(names) do
                playerOptions[i] = n
            end
        end
    end)
end
