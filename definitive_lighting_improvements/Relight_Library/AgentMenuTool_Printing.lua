local print_sceneAgentList_txtFile            = ""
local print_deletedAgentNames_txtFile         = ""
local print_savedAgentTransformations_txtFile = ""
local print_savedAgentProperties_txtFile      = ""

local agentMenuTool_printing_scene = ""

DevTools_AgentMenuTool_Printing_Initalize = function(sceneObject)
    print_sceneAgentList_txtFile            = tostring(sceneObject) .. ".txt"
    print_deletedAgentNames_txtFile         = tostring(sceneObject) .. "_deletedAgentNames" .. ".txt"
    print_savedAgentTransformations_txtFile = tostring(sceneObject) .. "_agentTransformations" .. ".txt"
    print_savedAgentProperties_txtFile      = tostring(sceneObject) .. "_agentProperties" .. ".txt"
    
    agentMenuTool_printing_scene = sceneObject
end

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

Devtools_Print_SaveCurrentAgentProperty = function(agent, agentProperties, propertyKey, myDescription, agentPropertiesLength, agentPropertyIndex)
    local txt_file_savedAgentProperties = io.open(print_savedAgentProperties_txtFile, "a")
    
    local propertyDescription = "My Description: "
    propertyDescription       = propertyDescription .. myDescription
    
    local agent_name             = AgentGetName(agent)
    local agent_property_key     = propertyKey
    local agent_property_keyType = TypeName(propertyKey)
    local agent_property_value   = PropertyGet(agentProperties, propertyKey)
    local agent_property_valueType TypeName(agent_property_value)
    local agent_property_index = "(" .. agentPropertiesLength .. "/" .. agentPropertyIndex .. ")"
    
    agent_name = tostring(agent_name)
    agent_property_key = tostring(agent_property_key)
    agent_property_keyType = tostring(agent_property_keyType)
    agent_property_value = tostring(agent_property_value)
    agent_property_valueType = tostring(agent_property_valueType)
    
    txt_file_savedAgentProperties:write(" ", "\n")
    txt_file_savedAgentProperties:write("-------------Saved Property-------------", "\n")

    txt_file_savedAgentProperties:write(agent_name, "\n")
    txt_file_savedAgentProperties:write(propertyDescription, "\n")
    txt_file_savedAgentProperties:write(agent_property_index, "\n")
    txt_file_savedAgentProperties:write(agent_property_key, "\n")
    txt_file_savedAgentProperties:write(agent_property_keyType, "\n")

    if (string.match)(agent_property_valueType, "table") then
        txt_file_savedAgentProperties:write(DevTools_AgentMenuTool_TablePrint(PropertyGet(agentProperties, propertyKey)), "\n")
    else
        txt_file_savedAgentProperties:write(agent_property_value, "\n")
    end

    txt_file_savedAgentProperties:write(agent_property_valueType, "\n")
end

Devtools_Print_SaveCurrentAgentTransformations = function(agent)
    local txt_file_savedAgentTransformations       = io.open(print_savedAgentTransformations_txtFile, "a")

    txt_file_savedAgentTransformations:write(" ", "\n")
    txt_file_savedAgentTransformations:write("-------------Saved Agent-------------", "\n")
    
    local agent_name      = AgentGetName(agent)
    local agent_pos       = AgentGetPos(agent)
    local agent_rot       = AgentGetRot(agent)
    local agent_pos_world = AgentGetWorldPos(agent)
    local agent_rot_world = AgentGetWorldRot(agent)
    
    agent_name = tostring(agent_name)
    agent_pos = tostring(agent_pos)
    agent_rot = tostring(agent_rot)
    agent_pos_world = tostring(agent_pos_world)
    agent_rot_world = tostring(agent_rot_world)

    txt_file_savedAgentTransformations:write(agent_name, "\n")
    txt_file_savedAgentTransformations:write(agent_pos, "\n")
    txt_file_savedAgentTransformations:write(agent_rot, "\n")
    txt_file_savedAgentTransformations:write(agent_pos_world, "\n")
    txt_file_savedAgentTransformations:write(agent_rot_world, "\n")
end

--prints an entire scene and its contents to a text file
PrintSceneListToTXT = function()
    local main_txt_file                 = io.open(print_sceneAgentList_txtFile, "a")
    local scene_agents                  = SceneGetAgents(agentMenuTool_printing_scene)
    local print_agent_transformation    = true
    local print_agent_properties        = true
    local print_agent_properties_keyset = false --not that useful
    local print_scene_camera            = true
    
    if print_scene_camera then
        local sceneCamera = SceneGetCamera(agentMenuTool_printing_scene)
        
        local cam_name        = tostring(AgentGetName(sceneCamera))
        local cam_type        = tostring(TypeName(sceneCamera))
        local cam_pos       = tostring(AgentGetPos(sceneCamera))
        local cam_rot       = tostring(AgentGetRot(sceneCamera))
        local cam_pos_world = tostring(AgentGetWorldPos(sceneCamera))
        local cam_rot_world = tostring(AgentGetWorldRot(sceneCamera))
        
        main_txt_file:write(" ", "\n")
        main_txt_file:write("Camera Name: " .. cam_name, "\n")
        main_txt_file:write("Camera Type: " .. cam_type, "\n")
        main_txt_file:write("Camera Position: " .. cam_pos, "\n")
        main_txt_file:write("Camera Rotation: " .. cam_rot, "\n")
        main_txt_file:write("Camera World Position: " .. cam_pos_world, "\n")
        main_txt_file:write("Camera World Rotation: " .. cam_rot_world, "\n")
        
        local cam_properties = AgentGetProperties(sceneCamera)
        
        if cam_properties then
            --write a quick header to seperate
            main_txt_file:write(" --- Camera Properties ---", "\n")
            
            --get the property keys list
            local cam_property_keys = PropertyGetKeys(cam_properties)
            
            --begin looping through each property key found in the property keys list
            for b, cam_property_key in ipairs(cam_property_keys) do
                --get the key type and the value, as well as the value type
                local cam_property_key_type     = TypeName(PropertyGetKeyType(cam_properties, cam_property_key))
                local cam_property_value        = PropertyGet(cam_properties, cam_property_key)
                local cam_property_value_type = TypeName(PropertyGet(cam_properties, cam_property_key))

                --convert these to a string using a special function to format it nicely
                local cam_propety_key_string       = tostring(cam_property_key)
                local cam_property_key_type_string = tostring(cam_property_value_type)
                
                --convert these to a string using a special function to format it nicely
                local cam_property_value_string      = tostring(cam_property_value)
                local cam_property_value_type_string = tostring(cam_property_key_type)
                
                --begin writing these values to file
                main_txt_file:write("Camera" .. " " .. b .. " [Camera Property]", "\n")
                main_txt_file:write("Camera" .. " " .. b .. " Key: " .. cam_propety_key_string, "\n")
                main_txt_file:write("Camera" .. " " .. b .. " Value: " .. cam_property_value_string, "\n")
                main_txt_file:write("Camera" .. " " .. b .. " Key Type: " .. cam_property_key_type_string, "\n")
                main_txt_file:write("Camera" .. " " .. b .. " Value Type: " .. cam_property_value_type_string, "\n")

                --if the key type is of a table type, then print out the values of the table
                if cam_property_key_type_string == "table" then
                    main_txt_file:write("Camera" .. " " .. b .. " Value Table", "\n")
                    main_txt_file:write(tprint(cam_property_value), "\n")
                end
            end
            
            --write a header to indicate the end of the agent properties information
            main_txt_file:write(" ---Camera Properties END ---", "\n")
        end
    end
    
    --being looping through the list of agents gathered from the scene
    for i, agent_object in pairs(scene_agents) do
        --get the agent name and the type
        local agent_name = tostring(AgentGetName(agent_object))
        local agent_type = tostring(TypeName(agent_object))--type(agent_object)
        
        --start writing the agent information to the file
        main_txt_file:write(i, "\n")
        main_txt_file:write(i .. " Agent Name: " .. agent_name, "\n")
        main_txt_file:write(i .. " Agent Type: " .. agent_type, "\n")
        
        --if true, then it also writes information regarding the transformation properties of the agent
        if print_agent_transformation then
            local agent_pos = tostring(AgentGetPos(agent_object))
            local agent_rot = tostring(AgentGetRot(agent_object))
            
            local agent_pos_world = tostring(AgentGetWorldPos(agent_object))
            local agent_rot_world = tostring(AgentGetWorldRot(agent_object))
            
            main_txt_file:write(i .. " Agent Position: " .. agent_pos, "\n")
            main_txt_file:write(i .. " Agent Rotation: " .. agent_rot, "\n")
            main_txt_file:write(i .. " Agent World Position: " .. agent_pos_world, "\n")
            main_txt_file:write(i .. " Agent World Rotation: " .. agent_rot_world, "\n")
        end

        --get the properties list from the agent
        local agent_properties = AgentGetProperties(agent_object)
        
        --if the properties field isnt null and print_agent_properties is true
        if agent_properties and print_agent_properties then
            --write a quick header to seperate
            main_txt_file:write(i .. " --- Agent Properties ---", "\n")
            
            --get the property keys list
            local agent_property_keys = PropertyGetKeys(agent_properties)
            
            --begin looping through each property key found in the property keys list
            for x, agent_property_key in ipairs(agent_property_keys) do
                --get the key type and the value, as well as the value type
                local agent_property_key_type   = TypeName(PropertyGetKeyType(agent_properties, agent_property_key))
                local agent_property_value      = PropertyGet(agent_properties, agent_property_key)
                local agent_property_value_type = TypeName(PropertyGet(agent_properties, agent_property_key))

                --convert these to a string using a special function to format it nicely
                local agent_propety_key_string       = tostring(agent_property_key)
                local agent_property_key_type_string = tostring(agent_property_value_type)
                
                --convert these to a string using a special function to format it nicely
                local agent_property_value_string      = tostring(agent_property_value)
                local agent_property_value_type_string = tostring(agent_property_key_type)
                
                --begin writing these values to file
                main_txt_file:write(i .. " " .. x .. " [Agent Property]", "\n")
                main_txt_file:write(i .. " " .. x .. " Key: " .. agent_propety_key_string, "\n")
                main_txt_file:write(i .. " " .. x .. " Value: " .. agent_property_value_string, "\n")
                main_txt_file:write(i .. " " .. x .. " Key Type: " .. agent_property_key_type_string, "\n")
                main_txt_file:write(i .. " " .. x .. " Value Type: " .. agent_property_value_type_string, "\n")

                --if the key type is of a table type, then print out the values of the table
                if agent_property_key_type_string == "table" then
                    main_txt_file:write(i .. " " .. x .. " Value Table", "\n")
                    main_txt_file:write(DevTools_AgentMenuTool_TablePrint(agent_property_value), "\n")
                end
                
                --for printing the key property set of the agent properties
                if print_agent_properties_keyset then
                    local property_key_set = PropertyGetKeyPropertySet(agent_properties, agent_property_key)
                    
                    main_txt_file:write(i .. " " .. x .. " [Key Property Set] " .. tostring(property_key_set), "\n")
                    
                    for y, property_key in pairs(property_key_set) do
                        main_txt_file:write(i .. " " .. x .. " Key Property Set Key: " .. tostring(property_key), "\n")
                        main_txt_file:write(i .. " " .. x .. " Key Property Set Value: " .. tostring(PropertyGet(agent_properties, property_key)), "\n")
                    end
                end
            end
            
            --write a header to indicate the end of the agent properties information
            main_txt_file:write(i .. " ---Agent Properties END ---", "\n")
            
        end
    end
    
    --close the file stream
    main_txt_file:close()

    --for testing/validating
    --DialogBox_Okay("Printed Output")
end

function DevTools_AgentMenuTool_TablePrint (tbl, indent)
    if not indent then 
        indent = 0 
    end
  
    local toprint = string.rep(" ", indent) .. "{\r\n"
  
    indent = indent + 2 
  
    for k, v in pairs(tbl) do
        toprint = toprint .. string.rep(" ", indent)
    
        if (type(k) == "number") then
            toprint = toprint .. "[" .. k .. "] = "
        elseif (type(k) == "string") then
            toprint = toprint  .. k ..  "= "   
        end
  
        if (type(v) == "number") then
            toprint = toprint .. v .. ",\r\n"
        elseif (type(v) == "string") then
            toprint = toprint .. "\"" .. v .. "\",\r\n"
        elseif (type(v) == "table") then
            toprint = toprint .. tprint(v, indent + 2) .. ",\r\n"
        else
            toprint = toprint .. "\"" .. tostring(v) .. "\",\r\n"
        end
  
    end

    toprint = toprint .. string.rep(" ", indent - 2) .. "}"
  
    return toprint
end
