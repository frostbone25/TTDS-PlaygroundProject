-- Decompiled using luadec 2.2 rev:  for Lua 5.2 from https://github.com/viruscamp/luadec
-- Command line: A:\Steam\twd-definitive\scripteditor-10-31-20\s1_lighting_improvements\WDC_pc_WalkingDead101_data\env_hershelFarmExteriorNight_temp.lua 

-- params : ...
-- function num : 0 , upvalues : _ENV
require("Relighting.lua")

local kScript = "hershelFarmExterior"
local kScene = "adv_hershelFarmExteriorNight.scene"
hershelFarmExterior = function()
  -- function num : 0_0 , upvalues : _ENV
  Mode(mode_Main)
  Mode_Push(mode_NoMovement)
  Mode_Push(mode_NoInteraction)
  if not SaveLoad_IsFromLoad() then
    if Platform_IsWiiU() then
      print("Dialog Preloading start")
      DlgPreload("env_hershelsfarm.dlog", "cs_arrivalAtHershels", 0, 15, 0, false)
    end
    DlgRun("env_hershelsfarm.dlog", "cs_arrivalAtHershels")
  end
end

-- DECOMPILER ERROR at PC16: Confused about usage of register: R2 in 'UnsetPending'

if not IsRegistered() and not Platform_IsXfinity() then
  ((AgentFind("logic_game")).mProps).bDemoMode = true
  local func = function()
  -- function num : 0_1 , upvalues : _ENV
  LoadScript("ui_demoUpsell.lua")
end

  ThreadStart(func)
else
  do
    SceneOpen(kScene, kScript)
  end
end

