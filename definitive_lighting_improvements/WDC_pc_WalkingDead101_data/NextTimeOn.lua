-- Decompiled using luadec 2.2 rev:  for Lua 5.2 from https://github.com/viruscamp/luadec
-- Command line: A:\Steam\twd-definitive\scripteditor-10-31-20\s1_lighting_improvements\WDC_pc_WalkingDead101_data\NextTimeOn_temp.lua 

-- params : ...
-- function num : 0 , upvalues : _ENV
require("ui_stats.lua")
local kScript = "NextTimeOn"
local kScene = "adv_nextTimeOn101"
local OnCreditsComplete = function()
  -- function num : 0_0 , upvalues : _ENV
  SubProject_Switch("MenuSeason1", "MainMenuNoStartPane")
end

NextTimeOn = function()
  -- function num : 0_1 , upvalues : _ENV, OnCreditsComplete
  Persistent_Store()
  DataBackupManager_SubmitGameLogic(true)
  Mode(mode_Main)
  if Logic["MotorInn - Gave Girl The Gun"] then
    AgentDetach("adv_nextTimeOn101_motorInnMeshesBalconyFallen")
  else
    AgentDetach("adv_nextTimeOn101_motorInnMeshesBalconyFull")
  end
  if Platform_IsWiiU() then
    DlgPreload("nextTimeOn_Episode2.dlog", "cs_nextTimeOn", 0, 15, 0, false)
  end
  local id = Dialog_Play("cs_nextTimeOn")
  DlgWait(id)
  WDAchievements_Unlock("achievement_01")
  Callback_OnCreditsComplete:Add(OnCreditsComplete)
  SceneAdd("ui_stats.scene", "UI_Stats_Open")
end

SceneOpen(kScene, kScript)
SceneAdd("ui_nexttime")

