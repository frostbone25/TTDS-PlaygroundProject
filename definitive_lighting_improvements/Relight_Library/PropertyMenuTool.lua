local input_legend_DevMenu = "[LEGEND] 1 - Menu Up, 2 - Menu Down, 3 - Select Item, 4 - Main Menu\n + - Agent Up, - - Agent Down, Q - Reduce Value, E - Increase Value"
local vectorButtons        = { "X", "Y", "Z", "Print Property" }
local colorButtons         = { "R", "G", "B", "A", "Print Property" }
local booleanButtons       = { "True Or False", "Print Property" }
local numberButtons        = { "Increase Or Decrease (0.1)", "Increase Or Decrease (0.5)", "Increase Or Decrease (1)", "Increase Or Decrease (5)", "Print Property" }
local devtoolsButtons      = { "Zero Transformations", "Modify Position", "Modify Rotation", "Modify World Position", "Modify World Rotation", "Modify Property", "Print Scene To File", "Disable Walkboxes", "Toggle Scene Time Scale", "Find Agent", "Delete Agent", "Duplicate Agent", "Toggle Legend", "Print Agent Transformations", "Toggle Graphic Black", "Toggle Combat Mode", "Print Valid Prop Names", "Modify Known Properties", "Change Property", "Game UI Push Mode Toggle"}

local maxIndex              = 21
local minIndex              = 0
local devtoolsMenuIndex     = 1
local isDevtoolsMenuEnabled = false
local kScene                = ""
local devtoolsCamera        = ""
local editMode              = false
local toggleLegend          = false
local toggleGB              = false
local toggleCombatMode      = false



local modifyKnownPropertyMode = false



local sceneTimeToggle = false

local IS_MENU_SCENE = true

local modifyPositionMenu_enabled      = false
local modifyRotationMenu_enabled      = false
local modifyWorldPositionMenu_enabled = false
local modifyWorldRotationMenu_enabled = false
local modifyPropertyMenu_enabled      = false

local modifyPropertyMenu_color   = false
local modifyPropertyMenu_number  = false
local modifyPropertyMenu_vector  = false
local modifyPropertyMenu_boolean = false

--printing
local print_sceneAgentList_txtFile            = tostring(kScene) .. ".txt"
local print_deletedAgentNames_txtFile         = tostring(kScene) .. "_deletedAgentNames" .. ".txt"
local print_savedAgentTransformations_txtFile = tostring(kScene) .. "_agentTransformations" .. ".txt"
local print_savedAgentProperties_txtFile      = tostring(kScene) .. "_agentProperties" .. ".txt"

local curr_sceneAgents_length   = 0
local curr_sceneAgentIndex      = 0
local curr_sceneAgents          = nil
local curr_agent                = nil
local curr_agent_pos            = Vector(0,0,0)
local curr_agent_rot            = Vector(0,0,0)
local curr_agent_pos_world      = Vector(0,0,0)
local curr_agent_rot_world      = Vector(0,0,0)

local curr_agent_name_string      = "Name: " .. "(0/0)" .. tostring(AgentGetName(curr_agent))
local curr_agent_pos_string       = "Position: " .. tostring(curr_agent_pos)
local curr_agent_rot_string       = "Rotation: " .. tostring(curr_agent_rot)
local curr_agent_pos_world_string = "World Position: " .. tostring(curr_agent_pos_world)
local curr_agent_rot_world_string = "World Rotation: " .. tostring(curr_agent_rot_world)

local curr_agent_properties_length = 0
local curr_agent_propterties_index = 0
local curr_agent_properties        = nil
local curr_agent_properties_keys   = nil
local curr_agent_property_key      = nil
local curr_agent_property_keyType  = nil
local curr_agent_property_value    = nil

local curr_agent_property_index_string     = "Property Index: (0/0)"
local curr_agent_property_key_string       = "Property Key: "
local curr_agent_property_keyType_string   = "Property Key Type: "
local curr_agent_property_value_string     = "Property Value: "
local curr_agent_property_valueType_string = "Property Value Type: "

local maimenu_agent_name = "agentTool_Menu"

local modify_position_increment = 0.1
local modify_rotation_increment = 1


Devtools_Init = function(theScene)
    kScene         = theScene
    devtoolsCamera = SceneGetCamera(kScene)
  
    Devtools_GetSceneAgents()
  
    print_sceneAgentList_txtFile            = tostring(kScene) .. ".txt"
    print_deletedAgentNames_txtFile         = tostring(kScene) .. "_deletedAgentNames" .. ".txt"
    print_savedAgentTransformations_txtFile = tostring(kScene) .. "_agentTransformations" .. ".txt"
    print_savedAgentProperties_txtFile      = tostring(kScene) .. "_agentProperties" .. ".txt"
    Devtools_PrintNewSessionSeperatorInTXTFiles()

    Devtools_UI_InitalizeMenuText()
    Devtools_InputHandler()
    Devtools_Agent_GetAgentFromList(curr_sceneAgents)
    Devtools_UI_UpdateStrings()
end

Devtools_GetSceneAgents = function()
    curr_sceneAgents        = SceneGetAgents(kScene)
    curr_sceneAgents_length = table.getn(curr_sceneAgents)
end

Devtools_ToggleMenu = function()
  isDevtoolsMenuEnabled = not isDevtoolsMenuEnabled
end

Devtools_ToggleLegend = function()
    toggleLegend = not toggleLegend
end

Devtools_UI_InitalizeMenuText = function()
    local CreateTextAgent = function(name, text, posx, posy, posz, halign, valign)
        local pos       = Vector(posx, posy, posz)
        local textAgent = AgentCreate(name, "ui_text.prop", pos)
        if halign then
            TextSetHorizAlign(textAgent, halign)
        end
        if valign then
            TextSetVertAlign(textAgent, valign)
        end
        TextSet(textAgent, text)
        return textAgent
    end
    
    --text coords are based in 2D (left, top)
    local mainmenu_text_pos = Vector(-9.0, 5, 0) --s4 game
    --local mainmenu_text_pos = Vector(0.0, 15, 15) --main menu
    --local mainmenu_text_pos = Vector(0.0, 0, 0) 
    actor_mainmenu          = CreateTextAgent(maimenu_agent_name, "", mainmenu_text_pos.x, mainmenu_text_pos.y, mainmenu_text_pos.z, 0, 0)
  
    AgentSetProperty(actor_mainmenu, "Text Render Layer", 99)
  
    local OnCallbackFired = function()
        local mainmenu_agent = AgentFind(maimenu_agent_name)
        local mainmenu_text  = ""

        --main menu
        if not modifyPositionMenu_enabled and not modifyRotationMenu_enabled and not modifyWorldPositionMenu_enabled and not modifyWorldRotationMenu_enabled and not modifyPropertyMenu_enabled then
            if toggleLegend then
                mainmenu_text = input_legend_DevMenu .. "\n"
            end
            mainmenu_text = mainmenu_text .. "[Agent Tool Menu]\n"
            mainmenu_text = mainmenu_text .. curr_agent_name_string .. "\n"
            mainmenu_text = mainmenu_text .. curr_agent_pos_string .. "\n"
            mainmenu_text = mainmenu_text .. curr_agent_rot_string .. "\n"
            mainmenu_text = mainmenu_text .. curr_agent_pos_world_string .. "\n"
            mainmenu_text = mainmenu_text .. curr_agent_rot_world_string .. "\n"
            
            maxIndex = 21
            for i, mainmenu_button in ipairs(devtoolsButtons) do
                if i == devtoolsMenuIndex then
                    --Selected
                    mainmenu_text = mainmenu_text .. "← " .. mainmenu_button .. "\n"
                else
                    --Not Selected
                    mainmenu_text = mainmenu_text .. "   " .. mainmenu_button .. "\n"
                end
            end
        end
        
        --modify position menu
        if modifyPositionMenu_enabled and not modifyRotationMenu_enabled and not modifyWorldPositionMenu_enabled and not modifyWorldRotationMenu_enabled and not modifyPropertyMenu_enabled then
            if toggleLegend then
                mainmenu_text = input_legend_DevMenu .. "\n"
            end
            mainmenu_text = mainmenu_text .. "[Agent Tool Menu]\n"
            mainmenu_text = mainmenu_text .. curr_agent_name_string .. "\n"
            mainmenu_text = mainmenu_text .. "[Modify Position]\n"
            mainmenu_text = mainmenu_text .. curr_agent_pos_string .. "\n"
     
            maxIndex = 4
            for i, vector_button in ipairs(vectorButtons) do
                if i == devtoolsMenuIndex then
                    --Selected
                    mainmenu_text = mainmenu_text .. "← " .. vector_button .. "\n"
                else
                    --Not Selected
                    mainmenu_text = mainmenu_text .. "   " .. vector_button .. "\n"
                end
            end
        end
        
        --modify rotation menu
        if not modifyPositionMenu_enabled and modifyRotationMenu_enabled and not modifyWorldPositionMenu_enabled and not modifyWorldRotationMenu_enabled and not modifyPropertyMenu_enabled then
            if toggleLegend then
                mainmenu_text = input_legend_DevMenu .. "\n"
            end
            mainmenu_text = mainmenu_text .. "[Agent Tool Menu]\n"
            mainmenu_text = mainmenu_text .. curr_agent_name_string .. "\n"
            mainmenu_text = mainmenu_text .. "[Modify Rotation]\n"
            mainmenu_text = mainmenu_text .. curr_agent_rot_string .. "\n"
     
            maxIndex = 4
            for i, vector_button in ipairs(vectorButtons) do
                if i == devtoolsMenuIndex then
                    --Selected
                    mainmenu_text = mainmenu_text .. "← " .. vector_button .. "\n"
                else
                    --Not Selected
                    mainmenu_text = mainmenu_text .. "   " .. vector_button .. "\n"
                end
            end
        end
        
        --modify world position menu
        if not modifyPositionMenu_enabled and not modifyRotationMenu_enabled and modifyWorldPositionMenu_enabled and not modifyWorldRotationMenu_enabled and not modifyPropertyMenu_enabled then
            if toggleLegend then
                mainmenu_text = input_legend_DevMenu .. "\n"
            end
            mainmenu_text = mainmenu_text .. "[Agent Tool Menu]\n"
            mainmenu_text = mainmenu_text .. curr_agent_name_string .. "\n"
            mainmenu_text = mainmenu_text .. "[Modify World Position]\n"
            mainmenu_text = mainmenu_text .. curr_agent_pos_world_string .. "\n"
     
            maxIndex = 4
            for i, vector_button in ipairs(vectorButtons) do
                if i == devtoolsMenuIndex then
                    --Selected
                    mainmenu_text = mainmenu_text .. "← " .. vector_button .. "\n"
                else
                    --Not Selected
                    mainmenu_text = mainmenu_text .. "   " .. vector_button .. "\n"
                end
            end
        end
        
        --modify world rotation menu
        if not modifyPositionMenu_enabled and not modifyRotationMenu_enabled and not modifyWorldPositionMenu_enabled and modifyWorldRotationMenu_enabled and not modifyPropertyMenu_enabled then
            if toggleLegend then
                mainmenu_text = input_legend_DevMenu .. "\n"
            end
            mainmenu_text = mainmenu_text .. "[Agent Tool Menu]\n"
            mainmenu_text = mainmenu_text .. curr_agent_name_string .. "\n"
            mainmenu_text = mainmenu_text .. "[Modify World Rotation]\n"
            mainmenu_text = mainmenu_text .. curr_agent_rot_world_string .. "\n"
     
            maxIndex = 4
            for i, vector_button in ipairs(vectorButtons) do
                if i == devtoolsMenuIndex then
                    --Selected
                    mainmenu_text = mainmenu_text .. "← " .. vector_button .. "\n"
                else
                    --Not Selected
                    mainmenu_text = mainmenu_text .. "   " .. vector_button .. "\n"
                end
            end
        end
        
        --modify properties menu
        if not modifyPositionMenu_enabled and not modifyRotationMenu_enabled and not modifyWorldPositionMenu_enabled and not modifyWorldRotationMenu_enabled and modifyPropertyMenu_enabled then
            if toggleLegend then
                mainmenu_text = input_legend_DevMenu .. "\n"
            end
            mainmenu_text = mainmenu_text .. "[Agent Tool Menu]\n"
            mainmenu_text = mainmenu_text .. curr_agent_name_string .. "\n"
            
            if modifyKnownPropertyMode then
                mainmenu_text = mainmenu_text .. "[Modify Known Properties]\n"
            else
                mainmenu_text = mainmenu_text .. "[Modify Properties]\n"
            end

            mainmenu_text = mainmenu_text .. curr_agent_property_index_string .. "\n"
            
            if modifyKnownPropertyMode then
                mainmenu_text = mainmenu_text .. curr_agent_property_keyType_string .. "\n"
                mainmenu_text = mainmenu_text .. curr_agent_property_valueType_string .. "\n"
                mainmenu_text = mainmenu_text .. curr_agent_property_key_string .. "\n"
                mainmenu_text = mainmenu_text .. curr_agent_property_value_string .. "\n"
            else
                mainmenu_text = mainmenu_text .. curr_agent_property_key_string .. "\n"
                mainmenu_text = mainmenu_text .. curr_agent_property_value_string .. "\n"
                mainmenu_text = mainmenu_text .. curr_agent_property_valueType_string .. "\n"
            end

            SetMyPropertyEditors(tostring(TypeName(curr_agent_property_value)))
            
            if modifyPropertyMenu_color then
                maxIndex = 6
                for i, color_button in ipairs(colorButtons) do
                    if i == devtoolsMenuIndex then
                        --Selected
                        mainmenu_text = mainmenu_text .. "← " .. color_button .. "\n"
                    else
                        --Not Selected
                        mainmenu_text = mainmenu_text .. "   " .. color_button .. "\n"
                    end
                end
            elseif modifyPropertyMenu_number then
                maxIndex = 6
                for i, number_button in ipairs(numberButtons) do
                    if i == devtoolsMenuIndex then
                        --Selected
                        mainmenu_text = mainmenu_text .. "← " .. number_button .. "\n"
                    else
                        --Not Selected
                        mainmenu_text = mainmenu_text .. "   " .. number_button .. "\n"
                    end
                end
            elseif modifyPropertyMenu_vector then
                maxIndex = 5
                for i, vector_button in ipairs(vectorButtons) do
                    if i == devtoolsMenuIndex then
                        --Selected
                        mainmenu_text = mainmenu_text .. "← " .. vector_button .. "\n"
                    else
                        --Not Selected
                        mainmenu_text = mainmenu_text .. "   " .. vector_button .. "\n"
                    end
                end
            elseif modifyPropertyMenu_boolean then
                maxIndex = 3
                for i, boolean_button in ipairs(booleanButtons) do
                    if i == devtoolsMenuIndex then
                        --Selected
                        mainmenu_text = mainmenu_text .. "← " .. boolean_button .. "\n"
                    else
                        --Not Selected
                        mainmenu_text = mainmenu_text .. "   " .. boolean_button .. "\n"
                    end
                end
            else
                maxIndex      = 1
                mainmenu_text = mainmenu_text .. "[CAN'T EDIT PROPERTY]\n"
            end
        end
        
        if not isDevtoolsMenuEnabled then
            TextSet(mainmenu_agent, "")
        else
            TextSet(mainmenu_agent, mainmenu_text)
        end
    end
    Callback_OnPostUpdate:Add(OnCallbackFired)
end

SetMyPropertyEditors = function(propertyKeyTypeString)
    if propertyKeyTypeString == "table" then
        modifyPropertyMenu_color   = true
        modifyPropertyMenu_number  = false
        modifyPropertyMenu_vector  = false
        modifyPropertyMenu_boolean = false 
    elseif propertyKeyTypeString == "number" then
        modifyPropertyMenu_color   = false
        modifyPropertyMenu_number  = true
        modifyPropertyMenu_vector  = false
        modifyPropertyMenu_boolean = false 
    elseif propertyKeyTypeString == "test" then
        modifyPropertyMenu_color   = false
        modifyPropertyMenu_number  = false
        modifyPropertyMenu_vector  = true
        modifyPropertyMenu_boolean = false 
    elseif propertyKeyTypeString == "boolean" then
        modifyPropertyMenu_color   = false
        modifyPropertyMenu_number  = false
        modifyPropertyMenu_vector  = false
        modifyPropertyMenu_boolean = true 
    else
        modifyPropertyMenu_color   = false
        modifyPropertyMenu_number  = false
        modifyPropertyMenu_vector  = false
        modifyPropertyMenu_boolean = false 
    end
end

Devtools_ValueChanger = function(delta)
    if curr_agent then
        --menu modify position
        if modifyPositionMenu_enabled then
            if devtoolsMenuIndex == 1 then
               local newPos = AgentGetPos(curr_agent) 
               newPos.x     = newPos.x + modify_position_increment * delta
               AgentSetPos(curr_agent, newPos)
            end
            if devtoolsMenuIndex == 2 then
               local newPos = AgentGetPos(curr_agent) 
               newPos.y     = newPos.y + modify_position_increment * delta
               AgentSetPos(curr_agent, newPos)
            end
            if devtoolsMenuIndex == 3 then
               local newPos = AgentGetPos(curr_agent) 
               newPos.z     = newPos.z + modify_position_increment * delta
               AgentSetPos(curr_agent, newPos)
            end
        end
        --menu modify rotation
        if modifyRotationMenu_enabled then
            if devtoolsMenuIndex == 1 then
                local newRot = AgentGetRot(curr_agent) 
               newRot.x     = newRot.x + modify_rotation_increment * delta
               AgentSetRot(curr_agent, newRot)
            end
            if devtoolsMenuIndex == 2 then
               local newRot = AgentGetRot(curr_agent) 
               newRot.y     = newRot.y + modify_rotation_increment * delta
               AgentSetRot(curr_agent, newRot)
            end
            if devtoolsMenuIndex == 3 then
               local newRot = AgentGetRot(curr_agent) 
               newRot.z     = newRot.z + modify_rotation_increment * delta
               AgentSetRot(curr_agent, newRot)
            end
        end
        --menu modify world position
        if modifyWorldPositionMenu_enabled then
            if devtoolsMenuIndex == 1 then
                local newPos = AgentGetWorldPos(curr_agent) 
               newPos.x     = newPos.x + modify_position_increment * delta
               AgentSetWorldPos(curr_agent, newPos)
            end
            if devtoolsMenuIndex == 2 then
               local newPos = AgentGetWorldPos(curr_agent) 
               newPos.y     = newPos.y + modify_position_increment * delta
               AgentSetWorldPos(curr_agent, newPos)
            end
            if devtoolsMenuIndex == 3 then
               local newPos = AgentGetWorldPos(curr_agent) 
               newPos.z     = newPos.z + modify_position_increment * delta
               AgentSetWorldPos(curr_agent, newPos)
            end
        end
       --menu modify world rotation
        if modifyWorldRotationMenu_enabled then
            if devtoolsMenuIndex == 1 then
                local newRot = AgentGetWorldRot(curr_agent) 
               newRot.x     = newRot.x + modify_rotation_increment * delta
               AgentSetWorldRot(curr_agent, newRot)
            end
            if devtoolsMenuIndex == 2 then
               local newRot = AgentGetWorldRot(curr_agent) 
               newRot.y     = newRot.y + modify_rotation_increment * delta
               AgentSetWorldRot(curr_agent, newRot)
            end
            if devtoolsMenuIndex == 3 then
               local newRot = AgentGetWorldRot(curr_agent) 
               newRot.z     = newRot.z + modify_rotation_increment * delta
               AgentSetWorldRot(curr_agent, newRot)
            end
        end
       
       --property menu stuff
       --number value
        if modifyPropertyMenu_number then
            if devtoolsMenuIndex == 1 then
               curr_agent_property_value = curr_agent_property_value + 0.1 * delta
               PropertySet(curr_agent_properties, curr_agent_property_key, curr_agent_property_value)
            end
            if devtoolsMenuIndex == 2 then
                curr_agent_property_value = curr_agent_property_value + 0.5 * delta
               PropertySet(curr_agent_properties, curr_agent_property_key, curr_agent_property_value)
            end
            if devtoolsMenuIndex == 3 then
                curr_agent_property_value = curr_agent_property_value + 1.0 * delta
               PropertySet(curr_agent_properties, curr_agent_property_key, curr_agent_property_value)
            end
            if devtoolsMenuIndex == 4 then
                curr_agent_property_value = curr_agent_property_value + 5.0 * delta
               PropertySet(curr_agent_properties, curr_agent_property_key, curr_agent_property_value)
            end
           if devtoolsMenuIndex == 5 then
              Devtools_Print_SaveCurrentAgentProperty() 
           end
        end
       --boolean value
        if modifyPropertyMenu_boolean then
            if devtoolsMenuIndex == 1 then
                if delta == -1 then
                    curr_agent_property_value = false
                else
                    curr_agent_property_value = true
                end
               PropertySet(curr_agent_properties, curr_agent_property_key, curr_agent_property_value)
            end
           if devtoolsMenuIndex == 2 then
              Devtools_Print_SaveCurrentAgentProperty() 
           end
        end
       --color value
        if modifyPropertyMenu_color then
            if devtoolsMenuIndex == 1 then
                local currColor           = PropertyGet(curr_agent_properties, curr_agent_property_key)
                
                currColor.r = currColor.r + 0.05 * delta

               PropertySet(curr_agent_properties, curr_agent_property_key, currColor)
            end
            if devtoolsMenuIndex == 2 then
                local currColor           = PropertyGet(curr_agent_properties, curr_agent_property_key)
                
                currColor.g = currColor.g + 0.05 * delta

               PropertySet(curr_agent_properties, curr_agent_property_key, currColor)
            end
            if devtoolsMenuIndex == 3 then
                local currColor           = PropertyGet(curr_agent_properties, curr_agent_property_key)
                
                currColor.b = currColor.b + 0.05 * delta

               PropertySet(curr_agent_properties, curr_agent_property_key, currColor)
            end
            if devtoolsMenuIndex == 4 then
                local currColor           = PropertyGet(curr_agent_properties, curr_agent_property_key)
                
                currColor.a = currColor.a + 0.05 * delta

               PropertySet(curr_agent_properties, curr_agent_property_key, currColor)
            end
           if devtoolsMenuIndex == 5 then
              Devtools_Print_SaveCurrentAgentProperty() 
           end
        end
    end
end

Devtools_Q_Press = function()
    Devtools_ValueChanger(-1)
end

Devtools_E_Press = function()
    Devtools_ValueChanger(1)
end


Devtools_InputHandler = function()
    while 1 do
        if Input_IsVKeyPressed(96) then
            --numpad zero, toggle
            Devtools_ToggleMenu()
        end
      
        if isDevtoolsMenuEnabled then
            if Input_IsVKeyPressed(50) then
                --key 2 (up)
                local indexReq = devtoolsMenuIndex + 1 
      
                if indexReq < maxIndex then
                    devtoolsMenuIndex = indexReq 
                end
            elseif Input_IsVKeyPressed(49) then
                --key 1 (down)
                local indexReq = devtoolsMenuIndex - 1 
                
                if indexReq > minIndex then
                    devtoolsMenuIndex = indexReq
                end
            elseif Input_IsVKeyPressed(51) then
                --key 3 (select)
                Devtools_SelectOption(devtoolsMenuIndex)
            elseif Input_IsVKeyPressed(81) then
                --key q (decrease)
                Devtools_Q_Press()
                Devtools_UI_UpdateStrings()
            elseif Input_IsVKeyPressed(69) then
                --key e (increase)
                Devtools_E_Press()
                Devtools_UI_UpdateStrings()
            elseif Input_IsVKeyPressed(52) then 
                --key 4 (back menu)
                modifyPositionMenu_enabled      = false
                modifyRotationMenu_enabled      = false
                modifyWorldPositionMenu_enabled = false
                modifyWorldRotationMenu_enabled = false
                modifyPropertyMenu_enabled      = false
                devtoolsMenuIndex               = 1
                modifyKnownPropertyMode = false
            elseif Input_IsVKeyPressed(109) then
                --key - (agent cycle up)
                local indexReq = 0

                if modifyPropertyMenu_enabled then
                    --cycle property
                    indexReq = curr_agent_propterties_index - 1 
      
                    if indexReq > minIndex then
                        curr_agent_propterties_index = indexReq 
                        Devtools_Agent_Properties_GetProperty(curr_agent_properties, curr_agent_properties_keys)
                    end
                else
                    --cycle agent
                    indexReq = curr_sceneAgentIndex - 1 
      
                    if indexReq > minIndex then
                        curr_sceneAgentIndex = indexReq 
                        Devtools_Agent_GetAgentFromList(curr_sceneAgents)
                        Devtools_Agent_Properties_GetProperty(curr_agent_properties, curr_agent_properties_keys)
                    end
                end
                
                Devtools_UI_UpdateStrings()
            elseif Input_IsVKeyPressed(107) then
                --key + (agent cycle down)
                local indexReq = 0

                if modifyPropertyMenu_enabled then
                    --cycle property
                    indexReq = curr_agent_propterties_index + 1 
      
                    local totalLength_properties = curr_agent_properties_length + 1
                    if indexReq < totalLength_properties then
                        curr_agent_propterties_index = indexReq 
                        Devtools_Agent_Properties_GetProperty()
                    end
                else
                    --cycle agent
                    indexReq = curr_sceneAgentIndex + 1 
      
                    local totalLength_agents = curr_sceneAgents_length + 1
                    if indexReq < totalLength_agents then
                        curr_sceneAgentIndex = indexReq 
                        Devtools_Agent_GetAgentFromList(curr_sceneAgents)
                    end
                end
                
                Devtools_UI_UpdateStrings()
            end
        end  
        WaitForNextFrame()
        WaitForNextFrame()
        WaitForNextFrame()
        WaitForNextFrame()
        WaitForNextFrame()
        WaitForNextFrame()
    end
end

Devtools_SelectOption = function(option)
    if option == 1 then
        --Zero Transformations
        modifyPositionMenu_enabled      = false
        modifyRotationMenu_enabled      = false
        modifyWorldPositionMenu_enabled = false
        modifyWorldRotationMenu_enabled = false
        modifyPropertyMenu_enabled      = false
        Devtools_ZeroTransformations()
    elseif option == 2 then
        --Modify Position
        modifyPositionMenu_enabled      = true
        modifyRotationMenu_enabled      = false
        modifyWorldPositionMenu_enabled = false
        modifyWorldRotationMenu_enabled = false
        modifyPropertyMenu_enabled      = false
        devtoolsMenuIndex               = 1
    elseif option == 3 then
      --Modify Rotation
        modifyPositionMenu_enabled      = false
        modifyRotationMenu_enabled      = true
        modifyWorldPositionMenu_enabled = false
        modifyWorldRotationMenu_enabled = false
        modifyPropertyMenu_enabled      = false
        devtoolsMenuIndex               = 1
    elseif option == 4 then
        --Modify World Position
        modifyPositionMenu_enabled      = false
        modifyRotationMenu_enabled      = false
        modifyWorldPositionMenu_enabled = true
        modifyWorldRotationMenu_enabled = false
        modifyPropertyMenu_enabled      = false
        devtoolsMenuIndex               = 1
    elseif option == 5 then
        --Modify World Rotation
        modifyPositionMenu_enabled      = false
        modifyRotationMenu_enabled      = false
        modifyWorldPositionMenu_enabled = false
        modifyWorldRotationMenu_enabled = true
        modifyPropertyMenu_enabled      = false
        devtoolsMenuIndex               = 1
    elseif option == 6 then
        --Modify Property
        modifyPositionMenu_enabled      = false
        modifyRotationMenu_enabled      = false
        modifyWorldPositionMenu_enabled = false
        modifyWorldRotationMenu_enabled = false
        modifyPropertyMenu_enabled      = true
        devtoolsMenuIndex               = 1
        curr_agent_propterties_index    = 0
        modifyKnownPropertyMode = false
    elseif option == 7 then
        --Print Scene To File
        modifyPositionMenu_enabled      = false
        modifyRotationMenu_enabled      = false
        modifyWorldPositionMenu_enabled = false
        modifyWorldRotationMenu_enabled = false
        modifyPropertyMenu_enabled      = false
        Devtools_PrintSceneToFile()
    elseif option == 8 then
        --Disable Walkboxes
        modifyPositionMenu_enabled      = false
        modifyRotationMenu_enabled      = false
        modifyWorldPositionMenu_enabled = false
        modifyWorldRotationMenu_enabled = false
        modifyPropertyMenu_enabled      = false
        Devtools_DisableSceneWalkboxes()
    elseif option == 9 then
        --Toggle Time Scale
        modifyPositionMenu_enabled      = false
        modifyRotationMenu_enabled      = false
        modifyWorldPositionMenu_enabled = false
        modifyWorldRotationMenu_enabled = false
        modifyPropertyMenu_enabled      = false
        Devtools_ToggleTimeScale()
    elseif option == 10 then
        --Find Agent
        modifyPositionMenu_enabled      = false
        modifyRotationMenu_enabled      = false
        modifyWorldPositionMenu_enabled = false
        modifyWorldRotationMenu_enabled = false
        modifyPropertyMenu_enabled      = false
        Devtools_SearchForAgent()
    elseif option == 11 then
        --Delete Agent
        modifyPositionMenu_enabled      = false
        modifyRotationMenu_enabled      = false
        modifyWorldPositionMenu_enabled = false
        modifyWorldRotationMenu_enabled = false
        modifyPropertyMenu_enabled      = false
        Devtools_DeleteAgent()
    elseif option == 12 then
        --Duplicate Agent
        modifyPositionMenu_enabled      = false
        modifyRotationMenu_enabled      = false
        modifyWorldPositionMenu_enabled = false
        modifyWorldRotationMenu_enabled = false
        modifyPropertyMenu_enabled      = false
        Devtools_DuplicateAgent()
    elseif option == 13 then
        --Toggle UI Legend
        modifyPositionMenu_enabled      = false
        modifyRotationMenu_enabled      = false
        modifyWorldPositionMenu_enabled = false
        modifyWorldRotationMenu_enabled = false
        modifyPropertyMenu_enabled      = false
        Devtools_ToggleLegend()
    elseif option == 14 then
        --Save Current Agent Transformations
        modifyPositionMenu_enabled      = false
        modifyRotationMenu_enabled      = false
        modifyWorldPositionMenu_enabled = false
        modifyWorldRotationMenu_enabled = false
        modifyPropertyMenu_enabled      = false
        Devtools_Print_SaveCurrentAgentTransformations()
    elseif option == 15 then
        --Toggle Graphic Black
        modifyPositionMenu_enabled      = false
        modifyRotationMenu_enabled      = false
        modifyWorldPositionMenu_enabled = false
        modifyWorldRotationMenu_enabled = false
        modifyPropertyMenu_enabled      = false
        Devtools_ToggleGB()
    elseif option == 16 then
        --Toggle Combat Mode
        modifyPositionMenu_enabled      = false
        modifyRotationMenu_enabled      = false
        modifyWorldPositionMenu_enabled = false
        modifyWorldRotationMenu_enabled = false
        modifyPropertyMenu_enabled      = false
        Devtools_ToggleCombatMode()
    elseif option == 17 then
        --print valid prop names of agent
        modifyPositionMenu_enabled      = false
        modifyRotationMenu_enabled      = false
        modifyWorldPositionMenu_enabled = false
        modifyWorldRotationMenu_enabled = false
        modifyPropertyMenu_enabled      = true
        devtoolsMenuIndex               = 1
        curr_agent_propterties_index    = 0
        modifyKnownPropertyMode = true
        if curr_agent then
            DevTools_AgentMenuTool_GetValidPropertyNames(curr_agent)
        end
    elseif option == 19 then
        --Toggle Combat Mode
        modifyPositionMenu_enabled      = false
        modifyRotationMenu_enabled      = false
        modifyWorldPositionMenu_enabled = false
        modifyWorldRotationMenu_enabled = false
        modifyPropertyMenu_enabled      = false
        Devtools_ChangeProperty()
    elseif option == 20 then
        --Toggle Combat Mode
        modifyPositionMenu_enabled      = false
        modifyRotationMenu_enabled      = false
        modifyWorldPositionMenu_enabled = false
        modifyWorldRotationMenu_enabled = false
        modifyPropertyMenu_enabled      = false
        Devtools_ToggleUIPushMode()
        --DialogBox_YesNo("Test")
    end
end

Devtools_ToggleUIPushMode = function()
    if IS_MENU_SCENE then
        WidgetInputHandler_EnableInput(false)
    else
        Game_PushMode(eModeDialogBox)
    end
end

Devtools_Agent_GetAgentFromList = function(agentList)
    if agentList then
        for i, sceneAgent in ipairs(agentList) do
            if i == curr_sceneAgentIndex then
                if not sceneAgent then
                    curr_agent                   = nil
                    curr_agent_properties        = nil
                    curr_agent_properties_keys   = nil
                    curr_agent_properties_length = 0
                else
                    curr_agent                   = sceneAgent
                    curr_agent_properties        = AgentGetRuntimeProperties(curr_agent)
                    curr_agent_properties_keys   = PropertyGetKeys(curr_agent_properties)
                    curr_agent_properties_length = custom_GetPropertyLength(curr_agent_properties_keys)
                    
                    Devtools_Agent_GetTransformation()
                end
            end
        end
    end
end

Devtools_Agent_Properties_GetProperty = function()
    if curr_agent_properties_keys then
        for i, agent_property_key in ipairs(curr_agent_properties_keys) do
            if i == curr_agent_propterties_index then
                curr_agent_property_key     = agent_property_key
                curr_agent_property_keyType = PropertyGetKeyType(curr_agent_properties, agent_property_key)
                curr_agent_property_value   = PropertyGet(curr_agent_properties, agent_property_key)
            end
        end
    end
end

Devtools_Agent_GetTransformation = function()
    if curr_agent then
        curr_agent_pos       = AgentGetPos(curr_agent)
        curr_agent_rot       = AgentGetRot(curr_agent)
        curr_agent_pos_world = AgentGetWorldRot(curr_agent)
        curr_agent_rot_world = AgentGetWorldPos(curr_agent)
    end
end

Devtools_UI_UpdateStrings = function()
    local indexNum         = "[" .. tostring(curr_sceneAgents_length) .. "/" .. tostring(curr_sceneAgentIndex) .. "] "
    curr_agent_name_string = "Name: " .. indexNum .. tostring(AgentGetName(curr_agent))

    curr_agent_pos_string       = "Position: " .. tostring(curr_agent_pos)
    curr_agent_rot_string       = "Rotation: " .. tostring(curr_agent_rot)
    curr_agent_pos_world_string = "World Position: " .. tostring(curr_agent_pos_world)
    curr_agent_rot_world_string = "World Rotation: " .. tostring(curr_agent_rot_world)
              
    local indexPropertyNum               = "(" .. tostring(curr_agent_properties_length) .. "/" .. tostring(curr_agent_propterties_index) .. ")"
    curr_agent_property_index_string     = "Property Index: " .. indexPropertyNum
    
    if modifyKnownPropertyMode then
        curr_agent_property_key_string       = "Property Key: " .. tostring(curr_agent_property_key)
        curr_agent_property_value_string     = "Property Value: " .. tostring(curr_agent_property_value)
        curr_agent_property_valueType_string = "Property Value Type: " .. tostring(TypeName(curr_agent_property_value))
    else
        curr_agent_property_key_string       = "Property Key: " .. tostring(curr_agent_property_key)
        curr_agent_property_keyType_string   = "Property Key Type: " .. tostring(TypeName(curr_agent_property_keyType))
        curr_agent_property_value_string     = "Property Value: " .. tostring(curr_agent_property_value)
        curr_agent_property_valueType_string = "Property Value Type: " .. tostring(TypeName(curr_agent_property_value))
    end  
end

---------------------------------UTILITY FUNCTIONS---------------------------------
---------------------------------UTILITY FUNCTIONS---------------------------------
---------------------------------UTILITY FUNCTIONS---------------------------------

custom_GetPropertyLength = function(propertyKeys)
    local newLength = 0
    if propertyKeys then
        for i, property in ipairs(propertyKeys) do
            newLength = newLength + 1
        end
    end
    return newLength
end

--gets the key and if it's a symbol it removes the symbol: tag and quotations
local custom_KeyToString = function(key)
    --convert the key to a string
    local keyAsString = tostring(key)
    
    --if the string contains symbol: then remove it, otherwise keep the string as is
    if (string.match)(keyAsString, "symbol: ") then
        keyAsString = (string.sub)(keyAsString, 9)
    else
        keyAsString = keyAsString
    end
    
    --remove any leftover quotations from the string
    keyAsString = keyAsString:gsub('"','')

    --return the final result
    return keyAsString
end


---------------------------------MAIN DEV TOOL COMMAND FUNCTIONS---------------------------------
---------------------------------MAIN DEV TOOL COMMAND FUNCTIONS---------------------------------
---------------------------------MAIN DEV TOOL COMMAND FUNCTIONS---------------------------------

Devtools_PrintNewSessionSeperatorInTXTFiles = function()
    local txt_file_sceneAgentList = io.open(print_sceneAgentList_txtFile, "a")
    local txt_file_savedAgentTransformations = io.open(print_savedAgentTransformations_txtFile, "a")
    local txt_file_savedAgentProperties = io.open(print_savedAgentProperties_txtFile, "a")
    local txt_file_deletedAgentNames = io.open(print_deletedAgentNames_txtFile, "a")
    
    txt_file_sceneAgentList:write(" ", "\n")
    txt_file_sceneAgentList:write("-------------NEW SESSION-------------", "\n")
    txt_file_sceneAgentList:write(" ", "\n")
    
    txt_file_savedAgentTransformations:write(" ", "\n")
    txt_file_savedAgentTransformations:write("-------------NEW SESSION-------------", "\n")
    txt_file_savedAgentTransformations:write(" ", "\n")
    
    txt_file_savedAgentProperties:write(" ", "\n")
    txt_file_savedAgentProperties:write("-------------NEW SESSION-------------", "\n")
    txt_file_savedAgentProperties:write(" ", "\n")
    
    txt_file_deletedAgentNames:write(" ", "\n")
    txt_file_deletedAgentNames:write("-------------NEW SESSION-------------", "\n")
    txt_file_deletedAgentNames:write(" ", "\n")
end

Devtools_Print_SaveCurrentAgentProperty = function()
    if IS_MENU_SCENE then
        WidgetInputHandler_EnableInput(false)
    else
        Game_PushMode(eModeDialogBox)
    end
    
    local enteredText, cancel = Menu_OpenTextEntryBox("Property Description", Menu_Text("Describe in detail the best you can, what this property is and does and what the values correspond to."))  
    if cancel then
        if IS_MENU_SCENE then
            WidgetInputHandler_EnableInput(true)
        else
            Game_PushMode(eModeDialogBox)
        end
        return
    end

    local txt_file_savedAgentProperties = io.open(print_savedAgentProperties_txtFile, "a")
    
    local propertyDescription = "My Description: "
    propertyDescription       = propertyDescription .. enteredText
    
    --txt_file_savedAgentProperties:write(" ", "\n")
    txt_file_savedAgentProperties:write("-------------Saved Property-------------", "\n")

    txt_file_savedAgentProperties:write(curr_agent_property_index_string, "\n")
    txt_file_savedAgentProperties:write(curr_agent_name_string, "\n")
    txt_file_savedAgentProperties:write(propertyDescription, "\n")
    txt_file_savedAgentProperties:write(curr_agent_property_key_string, "\n")
    --txt_file_savedAgentProperties:write(curr_agent_property_keyType_string, "\n")

    if (string.match)(curr_agent_property_valueType_string, "table") then
        txt_file_savedAgentProperties:write(tprint(curr_agent_property_value), "\n")
    else
        txt_file_savedAgentProperties:write(curr_agent_property_value_string, "\n")
    end

    --txt_file_savedAgentProperties:write(curr_agent_property_valueType_string, "\n")

    if IS_MENU_SCENE then
        WidgetInputHandler_EnableInput(true)
    else
        Game_PushMode(eModeDialogBox)
    end
end

Devtools_Print_SaveCurrentAgentTransformations = function()
    if IS_MENU_SCENE then
        WidgetInputHandler_EnableInput(false)
    else
        Game_PushMode(eModeDialogBox)
    end

    local dialogResult = DialogBox_YesNo("Save " .. curr_agent_name_string .. " agent transformations to file?")
    
    if dialogResult then
        
        local txt_file_savedAgentTransformations = io.open(print_savedAgentTransformations_txtFile, "a")

        txt_file_savedAgentTransformations:write(" ", "\n")
        txt_file_savedAgentTransformations:write("-------------Saved Agent-------------", "\n")

        txt_file_savedAgentTransformations:write(curr_agent_name_string, "\n")
        txt_file_savedAgentTransformations:write(curr_agent_pos_string, "\n")
        txt_file_savedAgentTransformations:write(curr_agent_rot_string, "\n")
        txt_file_savedAgentTransformations:write(curr_agent_pos_world_string, "\n")
        txt_file_savedAgentTransformations:write(curr_agent_rot_world_string, "\n")

        return
    end
    
    if IS_MENU_SCENE then
        WidgetInputHandler_EnableInput(true)
    end
end

Devtools_DisableSceneWalkboxes = function()
    if IS_MENU_SCENE then
        WidgetInputHandler_EnableInput(false)
    else
        Game_PushMode(eModeDialogBox)
    end
    
    local dialogResult = DialogBox_YesNo("Do you want to disable the scene walkboxes?")
    if dialogResult then
        PropertyRemove(kScene, "Walk Boxes")
        Game_PopMode(eModeDialogBox)
    end
    
    if IS_MENU_SCENE then
        WidgetInputHandler_EnableInput(true)
    else
        Game_PushMode(eModeDialogBox)
    end
end

Devtools_DeleteAgent = function()
    if IS_MENU_SCENE then
        WidgetInputHandler_EnableInput(false)
    else
        Game_PushMode(eModeDialogBox)
    end
    
    local agentName    = tostring(AgentGetName(curr_agent))
    local dialogResult = DialogBox_YesNo("Are you sure you want to delete " .. agentName .. "?")
    if not dialogResult then
        if IS_MENU_SCENE then
            WidgetInputHandler_EnableInput(true)
        else
            Game_PushMode(eModeDialogBox)
        end
        return
    end
    
        AgentDestroy(curr_agent)
        curr_agent                   = nil
        curr_agent_properties        = nil
        curr_agent_properties_keys   = nil
        curr_agent_properties_length = nil
        curr_agent_property_key      = nil
        curr_agent_property_keyType  = nil
        curr_agent_property_value    = nil
        
        curr_sceneAgents        = SceneGetAgents(kScene)
        curr_sceneAgents_length = table.getn(curr_sceneAgents)
        
        Devtools_UI_UpdateStrings()
        
        local txt_file = io.open(print_deletedAgentNames_txtFile, "a")
        txt_file:write(agentName, "\n")
    
    if IS_MENU_SCENE then
        WidgetInputHandler_EnableInput(true)
    else
        Game_PushMode(eModeDialogBox)
    end
end

Devtools_DuplicateAgent = function()
    if IS_MENU_SCENE then
        WidgetInputHandler_EnableInput(false)
    else
        Game_PushMode(eModeDialogBox)
    end
    
    local enteredText1, cancel1 = Menu_OpenTextEntryBox("New Agent Name", Menu_Text("Enter the name of the new agent"))  
    if cancel1 then
        if IS_MENU_SCENE then
            WidgetInputHandler_EnableInput(true)
        else
            Game_PushMode(eModeDialogBox)
        end
        return
    end
    
    local enteredText2, cancel2 = Menu_OpenTextEntryBox("Existing Agent Name", Menu_Text("Enter the name an agent to inherit its properties"))  
    if cancel2 then
        if IS_MENU_SCENE then
            WidgetInputHandler_EnableInput(true)
        else
            Game_PushMode(eModeDialogBox)
        end
        return
    end

    if AgentExists(enteredText2) then
        local existingAgent = AgentFind(enteredText2)
       
        local dupedAgent = AgentCreate(enteredText1, AgentGetProperties(existingAgent), AgentGetPos(existingAgent), AgentGetRot(existingAgent), kScene, false, false)

        curr_agent                   = dupedAgent
        curr_agent_properties        = AgentGetRuntimeProperties(curr_agent)
        curr_agent_properties_keys   = PropertyGetKeys(curr_agent_properties)
        curr_agent_properties_length = custom_GetPropertyLength(curr_agent_properties_keys)
       
        Devtools_UI_UpdateStrings()
    else
        DialogBox_Okay("Can't find the existing agent to inherit properties from!", "Can't Find Existing Agent!")
    end
   
    if IS_MENU_SCENE then
        WidgetInputHandler_EnableInput(true)
    else
        Game_PushMode(eModeDialogBox)
    end
end

Devtools_SearchForAgent = function()
    if IS_MENU_SCENE then
        WidgetInputHandler_EnableInput(false)
    else
        Game_PushMode(eModeDialogBox)
    end
    
    local enteredText, cancel = Menu_OpenTextEntryBox("Find Agent", Menu_Text("Enter the name of the agent (has to be exact)"))  
    if cancel then
        if IS_MENU_SCENE then
            WidgetInputHandler_EnableInput(true)
        else
            Game_PushMode(eModeDialogBox)
        end
        return
    end

    if AgentExists(enteredText) then
       local newAgent = AgentFind(enteredText)
       
       curr_agent                   = newAgent
       curr_agent_properties        = AgentGetRuntimeProperties(curr_agent)
       curr_agent_properties_keys   = PropertyGetKeys(curr_agent_properties)
       curr_agent_properties_length = custom_GetPropertyLength(curr_agent_properties_keys)
       
       Devtools_UI_UpdateStrings()
    else
       DialogBox_Okay("Can't find the given agent!", "Can't Find Agent!")
    end
   
    if IS_MENU_SCENE then
        WidgetInputHandler_EnableInput(true)
    else
        Game_PushMode(eModeDialogBox)
    end
end

Devtools_ToggleTimeScale = function()
    sceneTimeToggle       = not sceneTimeToggle
    
    if sceneTimeToggle then
        SceneSetTimeScale(kScene, 1)
    else
        SceneSetTimeScale(kScene, 0)
    end
end

Devtools_PrintSceneToFile = function()
    if IS_MENU_SCENE then
        WidgetInputHandler_EnableInput(false)
    else
        Game_PushMode(eModeDialogBox)
    end
    
    local dialogResult = DialogBox_YesNo("Do you want to print the scene to a .txt file?")
    if dialogResult then
        --PrintSceneListToTXT comes from Relighting.lua
        PrintSceneListToTXT(kScene, print_sceneAgentList_txtFile)
        if IS_MENU_SCENE then
            WidgetInputHandler_EnableInput(true)
        else
            Game_PushMode(eModeDialogBox)
        end
    end
    
    if IS_MENU_SCENE then
        WidgetInputHandler_EnableInput(true)
    else
        Game_PushMode(eModeDialogBox)
    end
end

Devtools_ZeroTransformations = function()
    if not curr_agent then
        return
    end
    
    if IS_MENU_SCENE then
        WidgetInputHandler_EnableInput(false)
    else
        Game_PushMode(eModeDialogBox)
    end
    
    local dialogResult = DialogBox_YesNo("Do you want to zero transformations on " .. tostring(AgentGetName(curr_agent)) .. "?")
    
    if not dialogResult then
        if IS_MENU_SCENE then
            WidgetInputHandler_EnableInput(true)
        else
            Game_PushMode(eModeDialogBox)
        end
        return
    end
    
    AgentSetPos(curr_agent, Vector(0, 0, 0))
    AgentSetRot(curr_agent, Vector(0, 0, 0))
    AgentSetWorldPos(curr_agent, Vector(0, 0, 0))
    AgentSetWorldRot(curr_agent, Vector(0, 0, 0))
    
    if IS_MENU_SCENE then
        WidgetInputHandler_EnableInput(true)
    else
        Game_PushMode(eModeDialogBox)
    end
end

Devtools_ChangeProperty = function()
    if IS_MENU_SCENE then
        WidgetInputHandler_EnableInput(false)
    else
        Game_PushMode(eModeDialogBox)
    end
    
    --get property name
    local enteredText1, cancel1 = Menu_OpenTextEntryBox("Name", Menu_Text("Enter the name of the property (has to be exact)"))  
    if cancel1 then
        if IS_MENU_SCENE then
            WidgetInputHandler_EnableInput(true)
        else
            Game_PushMode(eModeDialogBox)
        end
        return
    end
    
    --check if agent exists
    if not AgentExists(AgentGetName(curr_agent)) then
        DialogBox_Okay("Current Agent does not exist!", "Can't Find Agent!")
        return
    end
    
    --check if the property exists
    if not PropertyExists(curr_agent_properties, enteredText1) then
        DialogBox_Okay("Property does not exist!", "Can't Find Property!")
        return
    end
    
    --get property value
    local enteredText2, cancel2 = Menu_OpenTextEntryBox("", Menu_Text("Property Value"))  
    if cancel2 then
        if IS_MENU_SCENE then
            WidgetInputHandler_EnableInput(true)
        else
            Game_PushMode(eModeDialogBox)
        end
        return
    end

    --parsed values
    if string.match(enteredText2, "true") then
        PropertySet(curr_agent_properties, enteredText1, true)
    elseif string.match(enteredText2, "false") then
        PropertySet(curr_agent_properties, enteredText1, false)
    else
        PropertySet(curr_agent_properties, enteredText1, tonumber(enteredText2))
    end

    local propValue = tostring(PropertyGet(curr_agent_properties, enteredText1))

    --write changes to file
    local name = tostring(kScene) .. "_changedKnownProperties.txt"
    local txtFileChanges = io.open(name, "a")

    txtFileChanges:write(" ", "\n")
    txtFileChanges:write("-------------Saved Change-------------", "\n")

    txtFileChanges:write(curr_agent_name_string, "\n")
    txtFileChanges:write("Property Name: " .. enteredText1, "\n")
    txtFileChanges:write("Property Value: " .. propValue, "\n")
    
   
    if IS_MENU_SCENE then
        WidgetInputHandler_EnableInput(true)
    else
        Game_PushMode(eModeDialogBox)
    end
end

Devtools_ToggleGB = function()
    toggleGB = not toggleGB
    
    local prefs = GetPreferences()
    
    if toggleGB then
        PropertySet(prefs, "Enable Graphic Black", toggleGB)
        PropertySet(prefs, "Render - Graphic Black Enabled", toggleGB)
    else
        PropertySet(prefs, "Enable Graphic Black", toggleGB)
        PropertySet(prefs, "Render - Graphic Black Enabled", toggleGB)
    end
end

Devtools_ToggleCombatMode = function()
    toggleCombatMode = not toggleCombatMode
    
    local agentName         = "Clementine"
    local playerAgent       = nil
    local playerAgent_props = nil
    
    
    if AgentExists(AgentGetName(agentName)) then
        playerAgent   = AgentFindInScene(agentName, kScene)
        playerAgent_props = AgentGetRuntimeProperties(playerAgent)
    else
        return
    end

    if toggleCombatMode then
        --customSetProperty(playerAgent_props, "2862775590831660558", true)
        --customSetProperty(playerAgent_props, "3401687789990160590", 0)
        --customSetProperty(playerAgent_props, "5979534911236656551", -5)
        --customSetProperty(playerAgent_props, "6948204790539553372", 0)
        --customSetProperty(playerAgent_props, "8049559525395093852", true)
        --customSetProperty(playerAgent_props, "11898563266719103843", true)
        --customSetProperty(playerAgent_props, "12660521803285649103", 1.8299998044968)
        --customSetProperty(playerAgent_props, "13038688290462709975", 1.8299998044968)
        --customSetProperty(playerAgent_props, "16207038837632758877", 0.029279997572303)
        
        PropertySet(playerAgent_props, "Player - Movement Multiplier", 10.0)
        
        --customSetProperty(playerAgent_props, "16559717404394275949", "Zombie05")
    else
        --customSetProperty(playerAgent_props, "2862775590831660558", false)
        --customSetProperty(playerAgent_props, "3401687789990160590", 0)
        --customSetProperty(playerAgent_props, "5979534911236656551", 0)
        --customSetProperty(playerAgent_props, "6948204790539553372", 0)
        --customSetProperty(playerAgent_props, "8049559525395093852", false)
        --customSetProperty(playerAgent_props, "11898563266719103843", false)
        --customSetProperty(playerAgent_props, "12660521803285649103", 0)
        --customSetProperty(playerAgent_props, "13038688290462709975", 0)
        --customSetProperty(playerAgent_props, "16207038837632758877", 0)
        
        PropertySet(playerAgent_props, "Player - Movement Multiplier", 1.0)
        
        --customSetProperty(playerAgent_props, "16559717404394275949", "")
    end
end

---------------------------------MAIN DEV TOOL COMMAND FUNCTIONS END---------------------------------
---------------------------------MAIN DEV TOOL COMMAND FUNCTIONS END---------------------------------
---------------------------------MAIN DEV TOOL COMMAND FUNCTIONS END---------------------------------





--property 
local agentName_propertyNamesFromTxt_txtFile = "strings.txt"

--loads the lines from agentName_propertyName_txtFile into an array
--probably a bad idea to load all the lines of a file into memory... but fuck it!
DevTools_AgentMenuTool_GetValidPropertyNames = function(agent)
    --clear the lists
    local agentName_propertyName_validOnesFromFile = {}
    local agentName_propertyName_validOnesFromFile_values = {}
    local agentName_propertyName_validOnesFromFile_valueTypes = {}

    local txtFile = io.open(agentName_propertyNamesFromTxt_txtFile, "r")

    local agent_properties = AgentGetRuntimeProperties(agent)
    local agent_property_keys = PropertyGetKeys(agent_properties)

    local printValues = true
    local printValueTypes = true
    
    for line in txtFile:lines() do
        if PropertyExists(agent_properties, line) then
            table.insert(agentName_propertyName_validOnesFromFile, line)
            
            if printValues then
                local propertyValue = PropertyGet(agent_properties, line)
                propertyValue = tostring(propertyValue)
                table.insert(agentName_propertyName_validOnesFromFile_values, propertyValue)
            end
            
            if printValueTypes then
                local propertyValueType = TypeName(PropertyGet(agent_properties, line))
                propertyValueType = tostring(propertyValueType)
                table.insert(agentName_propertyName_validOnesFromFile_valueTypes, propertyValueType)
            end
        end
    end
    
    txtFile:close()
    
    local agentValidPropertiesTxtFile = AgentGetName(agent) .. "_foundpropnames.txt"
    local txt_file_agentValidPropertiesTxtFile = io.open(agentValidPropertiesTxtFile, "a")

    txt_file_agentValidPropertiesTxtFile:write(" ", "\n")
    txt_file_agentValidPropertiesTxtFile:write("-------------Saved Valid Property Names-------------", "\n")
    
    txt_file_agentValidPropertiesTxtFile:write(curr_agent_name_string, "\n")
    local index = 0
    for _, line in pairs(agentName_propertyName_validOnesFromFile) do
        txt_file_agentValidPropertiesTxtFile:write(line, "\n")
        
        if printValues then
            txt_file_agentValidPropertiesTxtFile:write("Value: " .. agentName_propertyName_validOnesFromFile_values[_], "\n")
        end
            
        if printValueTypes then
            txt_file_agentValidPropertiesTxtFile:write("Value Type: " .. agentName_propertyName_validOnesFromFile_valueTypes[_], "\n")
        end
       
        index = index + 1
    end

    txt_file_agentValidPropertiesTxtFile:close()
end