-- Decompiled using luadec 2.2 rev:  for Lua 5.2 from https://github.com/viruscamp/luadec
-- Command line: A:\Steam\twd-definitive\scripteditor-10-31-20\s1_lighting_improvements\WDC_pc_WalkingDead101_data\env_drugstoreExteriorNight_temp.lua 

-- params : ...
-- function num : 0 , upvalues : _ENV
local kScript = "drugstoreExterior"
local kScene = "adv_drugstoreExteriorNight.scene"
GoBackInside = function(key, val)
  -- function num : 0_0 , upvalues : _ENV
  if val then
    LoadScript("env_drugstoreInterior.lua")
  end
end

preloadStuff = function(idx)
  -- function num : 0_1
end

drugstoreExterior = function()
  -- function num : 0_2 , upvalues : _ENV
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R0 in 'UnsetPending'

  Logic["Drugstore - Secure"] = true
  -- DECOMPILER ERROR at PC3: Confused about usage of register: R0 in 'UnsetPending'

  Logic["Drugstore - ArrivalComplete"] = true
  PropertyAddKeyCallback(AgentGetProperties("logic_game"), "Macon St - finished run back", "GoBackInside")
  if Logic["Macon St - Lock Chopped"] then
    AgentHide("obj_lockCombination", true)
  end
  if Logic["Macon St - Gate open"] then
    AgentSetPos("obj_gateSecurityDrugstoreNightA", Vector(7.208621, 0, 7.103714))
    AgentSetRot("obj_gateSecurityDrugstoreNightA", Vector(0, -12.76173, 0))
    AgentSetPos("obj_gateSecurityDrugstoreNightB", Vector(7.208621, 0, 7.103714))
    AgentSetRot("obj_gateSecurityDrugstoreNightB", Vector(0, 0.353057, 0))
  end
  AgentHide("obj_brick_Lee", true)
  Mode(mode_NoMovement)
  Mode(mode_Main)
  Mode(mode_Reticle)
  if not SaveLoad_IsFromLoad() then
    if IsToolBuild() and AgentGetProperty("logic_debug", "Debug - DrugstoreExtStartFromBrother") then
      Dialog_Play("Killing Brother")
    else
      if Platform_IsWiiU() then
        print("Dialog Preloading start1")
        DlgPreload("env_maconStreet.dlog", "enter_street", 0, 10, 0, false)
      end
      Dialog_Play("enter_street")
    end
  end
end

SceneOpen(kScene, kScript)

