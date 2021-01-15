-----Variables-----
local kScene = ""
local testAgent = nil
local globalRadius = 1
local gameCamAgent = nil

--Loops--
Interaction_InputLoop = function() --Input Loop. Should be run *after* the main loop.
    local player = Game_GetPlayer()
    
    WaitForNextFrame()
    Notification_HideObjective()
    
    while true do --it's generally a *really* bad idea to do this! they stop all further code from running after being called. use wisely!
        local playerPos = AgentGetWorldPos(player)
        local playerRot = AgentGetWorldRot(player)

        --"Orbit Cam - Enabled"
        
        local distToAgent = VectorDistance(AgentGetWorldPos(testAgent), playerPos)
        
        if Input_IsVKeyPressed(70) then
            if distToAgent < globalRadius then
                local agent_props = AgentGetRuntimeProperties(testAgent)
                PropertySet(agent_props, propertyString, propertyValue)
            end
        end
        
        WaitForNextFrame()
    end
end

Interaction_MainLoop = function() --Main loop. Should be run *before* the input loop.
    local Interaction_OnPostUpdate = function()
            local agentName = "ambience_warpText_" .. tostring(theWarp["ID"])
            local textAgent = AgentFind(agentName)

            if not textAgent then --A bit of a safety measure to prevent gnarly things from happening. Auto-crashes the game.
                EngineQuit()
            end

            if Interaction_IsPlayerWithinRadius(textAgent, theWarp) then
            --break
            end
    end

    Callback_OnPostUpdate:Add(AmbienceWarps_OnPostUpdate)
    AmbienceWarps_InputLoop()
end

--Regular Functions--
Interaction_IsPlayerWithinRadius = function(textAgent, theWarp) --Checks if the player is within the radius of a given warp & updates the UI accordingly.
    local player = Game_GetPlayer()
    local playerPos = AgentGetWorldPos(player)

    local distToAgent = VectorDistance(theWarp["Position"], playerPos)
    if distToAgent < theWarp["Radius"] then
        TextSet(textAgent, theWarp["Message"])
        return true
    else
        TextSet(textAgent, "")
        return false
    end
end

Interaction_Init = function(theScene) --Initialization Function
    kScene = theScene
    theCamera = SceneGetCamera(kScene)


    AmbienceWarps_MainLoop()
end