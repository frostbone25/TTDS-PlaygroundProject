-- Decompiled using luadec 2.2 rev:  for Lua 5.2 from https://github.com/viruscamp/luadec
-- Command line: A:\Steam\twd-definitive\scripteditor-10-31-20\definitive_lighting_improvements\WDC_pc_WalkingDead401_data\BoardingSchoolExteriorNight_temp.lua 

-- params : ...
-- function num : 0 , upvalues : _ENV
local kScript = "BoardingSchoolExteriorNight"
local kScene = "adv_boardingSchoolExteriorNight"
local OnLogicReady = function()
  -- function num : 0_0 , upvalues : _ENV
  if Game_GetLoaded() then
    return 
  end
  local act = LogicGet(kAct)
  if act == 2 then
    Game_SetSceneDialog("env_boardingSchoolExteriorNight_act2")
  else
    if act == 3 then
      Game_SetSceneDialog("env_boardingSchoolExteriorNight_act3")
    end
  end
end

BoardingSchoolExteriorNight = function()
  -- function num : 0_1 , upvalues : _ENV
  if Game_GetSkipEnterCutscenes() and LogicGet(kAct) ~= 2 then
    Game_RunSceneDialog("logic_freeWalk", false)
  end
  if not Game_GetLoaded() and LogicGet(kAct) > 1 then
    AgentHide("obj_flowersMeadowCranesbill", true)
    PropertyRemove(AgentGetProperties("group_freewalkADVManager"), "Group - Idle")
    local characters = {"Clementine", "AJ", "Aasim", "Brody", "Louis", "Marlon", "Mitch", "Omar", "Rosie", "Ruby", "Tennyson", "Violet", "Willy"}
    for _,character in ipairs(characters) do
      PropertyRemove(AgentGetProperties(character), kIdleAnim)
      AgentDetach(character)
    end
  end
end

BoardingSchoolExteriorNight_EnableCollision = function(bEnable)
  -- function num : 0_2 , upvalues : _ENV
  local kCollisionsEnabled = "Collisions Enabled"
  local characters = {"AJ", "Aasim", "Brody", "Louis", "Marlon", "Omar", "Ruby", "Tennyson", "Violet"}
  for _,character in ipairs(characters) do
    local props = AgentGetProperties(character)
    if bEnable then
      PropertySet(props, kCollisionsEnabled, true)
    else
      PropertyRemove(props, kCollisionsEnabled)
    end
  end
end

BoardingSchoolExteriorNight_EndEpisode = function()
  -- function num : 0_3 , upvalues : _ENV
  WDAchievements_Unlock("achievement_20")
  Menu_EndEpisode("401", false)
  Menu_EndEpisode_CheckUpsell("401")
end

Callback_OnLogicReady:Add(OnLogicReady)
Game_SceneOpen(kScene, kScript)

