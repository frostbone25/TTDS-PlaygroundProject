-- Decompiled using luadec 2.2 rev:  for Lua 5.2 from https://github.com/viruscamp/luadec
-- Command line: A:\Steam\twd-definitive\scripteditor-10-31-20\definitive_lighting_improvements\WDC_pc_WalkingDead401_data\BoardingSchoolBasement_temp.lua 

-- params : ...
-- function num : 0 , upvalues : _ENV
local kScript = "BoardingSchoolBasement"
local kScene = "adv_boardingSchoolBasement"
local OnLogicReady = function()
  -- function num : 0_0 , upvalues : _ENV
  if Game_GetLoaded() then
    return 
  end
  if LogicGet("Debug ID") == 1 then
    Game_SetSceneDialogNode("use_flashlight")
  end
end

BoardingSchoolBasement = function()
  -- function num : 0_1 , upvalues : _ENV
  if Game_GetSkipEnterCutscenes() then
    Game_RunSceneDialog("logic_freeWalk", false)
  end
end

if IsDebugBuild() then
  Callback_OnLogicReady:Add(OnLogicReady)
end
Game_SceneOpen(kScene, kScript)

