-- Decompiled using luadec 2.2 rev:  for Lua 5.2 from https://github.com/viruscamp/luadec
-- Command line: A:\Steam\twd-definitive\scripteditor-10-31-20\s1_lighting_improvements\WDC_pc_WalkingDead101_data\env_motorInn_end_temp.lua 

-- params : ...
-- function num : 0 , upvalues : _ENV
local kScript = "motorInn_End"
local kScene = "adv_motorInn_end.scene"
local kDialog = "env_motorInnEnd.dlog"
motorInn_End = function()
  -- function num : 0_0 , upvalues : _ENV, kDialog
  if Input_IsUsingTouch() then
    AgentSetProperty("cam_motorInnEnd_carToTruck", "Pan Cam - Keep Agent On Screen", true)
  end
  Mode(mode_Main)
  if SaveLoad_IsFromLoad() then
    return 
  end
  local prefs = GetPreferences()
  if not prefs["Skip Intro Cutscenes"] then
    if Platform_IsWiiU() then
      print("Dialog Preloading start1")
      DlgPreload(kDialog, "cs_IntroEndEpisode", 0, 15, 0, false)
    end
    Dialog_Play("cs_IntroEndEpisode", "Lee", nil, kDialog)
  end
  if Logic["Drugstore - CarleyLives"] == true then
    AgentHide("Doug", true)
  else
    AgentHide("Carley", true)
  end
end

MotorInnEnd_TriggerLarryConfrontation = function(trigger)
  -- function num : 0_1 , upvalues : _ENV, kDialog
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R1 in 'UnsetPending'

  (trigger.mProps)["Trigger Enabled"] = false
  Dialog_Play("cs_larryConfrontation", "Lee", nil, kDialog)
end

SceneOpen(kScene, kScript)
SceneAdd("ui_tobecontinued")

