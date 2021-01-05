-- Decompiled using luadec 2.2 rev:  for Lua 5.2 from https://github.com/viruscamp/luadec
-- Command line: A:\Steam\twd-definitive\scripteditor-10-31-20\definitive_lighting_improvements\WDC_pc_WalkingDead401_data\BoardingSchoolDormNight_temp.lua 

-- params : ...
-- function num : 0 , upvalues : _ENV
local kScript = "BoardingSchoolDormNight"
local kScene = "adv_boardingSchoolDormNight"
local OnLogicReady = function()
  -- function num : 0_0 , upvalues : _ENV
  if Game_GetLoaded() then
    return 
  end
  if LogicGet(kAct) == 3 then
    Game_SetSceneDialog("env_boardingSchoolDormNight_act3")
  end
end

BoardingSchoolDormNight = function()
  -- function num : 0_1 , upvalues : _ENV
  if Game_GetSkipEnterCutscenes() and LogicGet(kAct) == 3 then
    Game_RunSceneDialog("logic_freeWalkRoom", false)
  end
  if not Game_GetLoaded() then
    PropertyRemove(AgentGetProperties("Clementine"), kIdleAnim)
    PropertyRemove(AgentGetProperties("AJ"), kIdleAnim)
  end
  if IsToolBuild() then
    Collectible_ResetEpisode(401, false, true)
  end
end

Callback_OnLogicReady:Add(OnLogicReady)
Game_SceneOpen(kScene, kScript)

