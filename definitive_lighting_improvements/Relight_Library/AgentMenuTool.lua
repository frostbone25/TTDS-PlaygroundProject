--require these scripts for the agent menu tool to work
require("AgentMenuTool_Agent.lua")
require("AgentMenuTool_PropertyName.lua")
require("AgentMenuTool_Commands.lua")
require("AgentMenuTool_Printing.lua")
require("AgentMenuTool_Utilities.lua")

--key ui
local ui_menu_legend_opened = "[Keys] 1 - Menu Up, 2 - Menu Down, 3 - Select Item, 4 - Main Menu\n + - Agent Up, - - Agent Down, Q - Reduce Value, E - Increase Value"
local ui_menu_legend_closed = "(Numpad 1 for Keys)"

--ui variables
local ui_agent      = nil
local ui_agent_name = "agentMenuTool_ui"
--local ui_agent_pos  = Vector(-9.0, 5, 0) --text coords are based in 2D
local ui_agent_pos      = Vector(0, 0, 0) --text coords are based in 2D
local ui_buttons        = nil
local ui_text           = ""
local ui_index          = 0
local ui_update_checker = 0

--main menu ui variables
local ui_menu_buttons = { "Agent", "Commands", "Printing" }
local ui_menu_index   = 1
local ui_menu_text    = ""

--commands menu ui variables
local ui_commands_buttons = { "Disable Walkboxes", "Toggle Scene Time Scale", "Toggle Graphic Black", "Reload Scene", "Tripping Balls" }
local ui_commands_index   = 1
local ui_commands_text    = ""

--agent menu ui variables
local ui_agent_buttons = { "Transformations", "Properties", "Create From Existing Agent", "Create New Agent", "Delete Agent", "Find Agent" }
local ui_agent_index   = 1
local ui_agent_text    = ""

local isEnabled       = true
local isLegendEnabled = false
local isMenuScene     = false
local isEarlierSeason = false

local isMainMenuEnabled           = true
local isAgentMenuEnabled          = false
local isAgentTransformMenuEnabled = false
local isAgentPropertyMenuEnabled  = false
local isCommandsMenuEnabled       = false

local agentMenuTool_scene  = ""
local agentMenuTool_camera = ""

--main tool initalization function
DevTools_AgentMenuTool_Initalize = function(theScene)
    --get main agent tool objects
    agentMenuTool_scene  = theScene
    agentMenuTool_camera = SceneGetCamera(agentMenuTool_scene)

    DevTools_AgentMenuTool_InitalizeMenuText()
  
    --commands
    DevTools_AgentMenuTool_Commands_Initalize(theScene)
    

    --DevTools_AgentMenuTool_InputHandler()
end

DevTools_AgentMenuTool_CreateTextAgent = function(name, text, pos, halign, valign)
    local textAgent                        = AgentCreate(name, "ui_text.prop", pos)
        
    if halign then
        TextSetHorizAlign(textAgent, halign)
    end
        
    if valign then
        TextSetVertAlign(textAgent, valign)
    end
        
    TextSet(textAgent, text)
    
    AgentSetProperty(textAgent, "Text Render Layer", 99)
        
    return textAgent
end

DevTools_AgentMenuTool_InitalizeMenuText = function()
    ui_agent = DevTools_AgentMenuTool_CreateTextAgent(ui_agent_name, "testing", ui_agent_pos, 0, 0)

    local OnCallbackFired = function()
        if not isEnabled then
            TextSet(ui_agent, ui_text)
            return
        end

        if isLegendEnabled then
            ui_text =  ui_menu_legend_opened .. "\n"
        else
            ui_text =  ui_menu_legend_closed .. "\n"
        end
        
        ui_text = ui_text .. "[AGENT MENU TOOL]" .. "\n"

        if isMainMenuEnabled then
            --fill out ui with the menu objects
            ui_text    = ui_text .. ui_menu_text
            ui_buttons = ui_menu_buttons
            ui_index   = ui_menu_index
        elseif isCommandsMenuEnabled then
            ui_text    = ui_text .. ui_commands_text
            ui_buttons = ui_commands_buttons
            ui_index   = ui_commands_index
        elseif isAgentMenuEnabled then
            ui_text    = ui_text .. ui_agent_text
            ui_buttons = ui_agent_buttons
            ui_index   = ui_agent_index
        end

        --generate ui buttons
        for i, ui_button in ipairs(ui_buttons) do
            if i == ui_index then
                --Selected
                ui_text = ui_text .. "← " .. ui_button .. "\n"
            else
                --Not Selected
                ui_text = ui_text .. "   " .. ui_button .. "\n"
            end
        end

        TextSet(ui_agent, ui_text)
    end

    Callback_OnPostUpdate:Add(OnCallbackFired)
end

DevTools_AgentMenuTool_InputHandler = function()
    --while 1 do
    --Yield()
    --ui_menu_text = "got past 2"
        --toggle menu
        --if Input_IsVKeyPressed(96) then
            --key numpad 0 (menu toggle)
            --isEnabled = not isEnabled
            --end
            --ui_menu_text = "got past 3"
        --main menu input
        --[[
        if isEnabled then
            if Input_IsVKeyPressed(49) then
                --key 1 (down)
                local newIndex = ui_index - 1 
                if newIndex > 0 then
                    ui_index = newIndex
                end
            elseif Input_IsVKeyPressed(50) then
                --key 2 (up)
                local newIndex = ui_index + 1 
      
                if newIndex < table.getn(ui_buttons) + 1 then
                    ui_index = newIndex 
                end
            elseif Input_IsVKeyPressed(51) then
                --key 3 (select)
                --DevTools_AgentMenuTool_SelectOption(ui_index)
            elseif Input_IsVKeyPressed(52) then 
                --key 4 (back menu)
                --DevTools_AgentMenuTool_GoBack()
            elseif Input_IsVKeyPressed(81) then
                --key q (decrease)
            elseif Input_IsVKeyPressed(69) then
                --key e (increase)
            elseif Input_IsVKeyPressed(109) then
                --key - (agent cycle up)
            elseif Input_IsVKeyPressed(107) then
                --key + (agent cycle down)
            elseif Input_IsVKeyPressed(97) then 
                --key numpad 1 (legend toggle)
                isLegendEnabled = not isLegendEnabled
            end
        end
        
        ui_menu_text = "got past 4"
        --]]
        --ui_menu_text = "got past 5"
        
        --WaitForNextFrame()
        --WaitForNextFrame()
        --WaitForNextFrame()
        --WaitForNextFrame()
        --WaitForNextFrame()
        --WaitForNextFrame()

        --ui_menu_text = "got past 6"
        --end
    
        --Callback_OnPostUpdate:Add(AgentMenuTool_Input)
end

DevTools_AgentMenuTool_GoBack = function()
    if isCommandsMenuEnabled then
        isMainMenuEnabled           = true
        isCommandsMenuEnabled       = false 
        isAgentMenuEnabled          = false
        isAgentTransformMenuEnabled = false
        isAgentPropertyMenuEnabled  = false
    end
    
    if isAgentMenuEnabled then
        isMainMenuEnabled           = true
        isCommandsMenuEnabled       = false 
        isAgentMenuEnabled          = false
        isAgentTransformMenuEnabled = false
        isAgentPropertyMenuEnabled  = false
    end
end

DevTools_AgentMenuTool_SelectOption = function(option)
    if option == 1 then
        isMainMenuEnabled           = false
        isCommandsMenuEnabled       = false
        isAgentMenuEnabled          = true
        isAgentTransformMenuEnabled = false
        isAgentPropertyMenuEnabled  = false
    elseif option == 2 then

    elseif option == 3 then
        isMainMenuEnabled           = false
        isCommandsMenuEnabled       = true
        isAgentMenuEnabled          = false
        isAgentTransformMenuEnabled = false
        isAgentPropertyMenuEnabled  = false
    elseif option == 4 then

    end    
end