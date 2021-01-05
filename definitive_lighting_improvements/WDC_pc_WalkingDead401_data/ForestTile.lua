-- Decompiled using luadec 2.2 rev:  for Lua 5.2 from https://github.com/viruscamp/luadec
-- Command line: A:\Steam\twd-definitive\scripteditor-10-31-20\definitive_lighting_improvements\WDC_pc_WalkingDead401_data\ForestTile_temp.lua 

-- params : ...
-- function num : 0 , upvalues : _ENV
local kScript = "ForestTile"
local kScene = "adv_forestTile"
local mStationExitFunc = nil
local OnLogicReady = function()
  -- function num : 0_0 , upvalues : _ENV
  if Game_GetLoaded() then
    return 
  end
  if LogicGet("2 - Entered ForestShack") then
    Game_SetSceneDialogNode("cs_fromShack")
  end
end

ForestTile = function()
  -- function num : 0_1 , upvalues : _ENV
  if Game_GetSkipEnterCutscenes() then
    Game_RunSceneDialog("logic_freeWalk", false)
  end
end

ForestTile_OnButtonExit = function()
  -- function num : 0_2 , upvalues : _ENV
  ForestTile_OverrideStationExit(false)
  Station_Activate(false)
  Station_Exit()
  Game_RunSceneDialog("cs_funTimeOver")
end

ForestTile_OverrideStationExit = function(bOverride)
  -- function num : 0_3 , upvalues : mStationExitFunc, _ENV
  if bOverride and not mStationExitFunc then
    mStationExitFunc = Station_OnButtonExit
    Station_OnButtonExit = ForestTile_OnButtonExit
  end
  if mStationExitFunc then
    Station_OnButtonExit = mStationExitFunc
    mStationExitFunc = nil
  end
end

Callback_OnLogicReady:Add(OnLogicReady)
Game_SceneOpen(kScene, kScript)

