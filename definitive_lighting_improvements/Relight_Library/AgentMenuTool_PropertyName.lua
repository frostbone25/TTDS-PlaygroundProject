--txt file contains arrays of lines that will be formated as such
--[property key number] [user defined name string]

--propety name file database
local agentName_propertyName_txtFile = "agentMenuTool_propertyNames.txt"

--property name array list (just contains lines from the agent menu tool)
local agentName_propertyName_linesFromFile = {}

--initalizes the class
DevTools_AgentMenuTool_PropertyName_Initalize = function()
    DevTools_AgentMenuTool_PropertyName_ReadFromFile()
end

--loads the lines from agentName_propertyName_txtFile into an array
--probably a bad idea to load all the lines of a file into memory... but fuck it!
DevTools_AgentMenuTool_PropertyName_ReadFromFile = function()
    local txtFile = io.open(agentName_propertyName_txtFile, "r")
    
    for line in txtFile:lines() do
       table.insert(agentName_propertyName_linesFromFile, line)
    end
   
    txtFile:close()
end

--gets the user defined property name from the file (returns a string)
--if it doesnt exist then it just simply returns (unknown)
DevTools_AgentMenuTool_PropertyName_GetPropertyName = function(symbolString)
    local result             = "unknown"
    local symbolString_proxy = custom_KeyToString(symbolString)
    
    for line in pairs(agentName_propertyName_linesFromFile) do
        if (string.match)(line, symbolString_proxy) then
            local propertyName = (string.gsub)(line, symbolString_proxy)
            
            result = propertyName
            break
        end
    end
    
    return result
end