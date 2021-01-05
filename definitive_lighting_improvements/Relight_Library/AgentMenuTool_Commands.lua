local agentMenuTool_commands_scene                = ""
local agentMenuTool_commands_sceneTimeScaleToggle = false
local agentMenuTool_commands_trippingBallsToggle  = false
local agentMenuTool_commands_sceneAgentList       = nil

DevTools_AgentMenuTool_Commands_Initalize = function(sceneObject)
    agentMenuTool_commands_scene = sceneObject
end

DevTools_AgentMenuTool_Commands_DisableWalkboxes = function(sceneObject)
    PropertyRemove(kScene, "Walk Boxes")
end

DevTools_AgentMenuTool_Commands_ToggleSceneTimeScale = function(sceneObject)
    agentMenuTool_commands_sceneTimeScaleToggle = not agentMenuTool_commands_sceneTimeScaleToggle
    
    if agentMenuTool_commands_sceneTimeScaleToggle then
        SceneSetTimeScale(kScene, 1)
    else
        SceneSetTimeScale(kScene, 0)
    end
end

DevTools_AgentMenuTool_Commands_ReloadScene = function(sceneObject)
    
end

DevTools_AgentMenuTool_Commands_TrippingBalls = function(sceneObject)
    agentMenuTool_commands_trippingBallsToggle = not agentMenuTool_commands_trippingBallsToggle
    
    agentMenuTool_commands_sceneAgentList = SceneGetAgents(sceneObject)
    
    if agentMenuTool_commands_trippingBallsToggle then
        
    end
end