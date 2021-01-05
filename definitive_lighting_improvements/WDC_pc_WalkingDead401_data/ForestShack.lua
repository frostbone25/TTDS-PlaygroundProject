-- Decompiled using luadec 2.2 rev:  for Lua 5.2 from https://github.com/viruscamp/luadec
-- Command line: A:\Steam\twd-definitive\scripteditor-10-31-20\definitive_lighting_improvements\WDC_pc_WalkingDead401_data\ForestShack_temp.lua 

-- params : ...
-- function num : 0 , upvalues : _ENV
local kScript = "ForestShack"
local kScene = "adv_forestShack"
local OnLogicReady = function()
  -- function num : 0_0 , upvalues : _ENV
  if Game_GetLoaded() then
    return 
  end
  if LogicGet("2 - Entered ForestTile") then
    Game_SetSceneDialogNode("cs_shackAttack")
  end
end

ForestShack = function()
  -- function num : 0_1 , upvalues : _ENV
  if Game_GetSkipEnterCutscenes() then
    Game_RunSceneDialog("logic_freeWalk", false)
  end
end

Callback_OnLogicReady:Add(OnLogicReady)
Game_SceneOpen(kScene, kScript)

