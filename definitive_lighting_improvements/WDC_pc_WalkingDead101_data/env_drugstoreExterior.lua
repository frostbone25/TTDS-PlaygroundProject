-- Decompiled using luadec 2.2 rev:  for Lua 5.2 from https://github.com/viruscamp/luadec
-- Command line: A:\Steam\twd-definitive\scripteditor-10-31-20\s1_lighting_improvements\WDC_pc_WalkingDead101_data\env_drugstoreExterior_temp.lua 

-- params : ...
-- function num : 0 , upvalues : _ENV
local kScript = "drugstoreExterior"
local kScene = "adv_drugstoreExterior.scene"
drugstoreExterior = function()
  -- function num : 0_0 , upvalues : _ENV
  Mode(mode_Main)
  if Platform_IsWiiU() then
    print("Dialog Preloading start")
    DlgPreload("env_maconStreet.dlog", "cs_arrival", 0, 15, 0, false)
  end
  if not SaveLoad_IsFromLoad() then
    Dialog_Play("cs_arrival")
  end
end

SceneOpen(kScene, kScript)

