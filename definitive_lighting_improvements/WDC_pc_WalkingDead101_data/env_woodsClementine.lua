-- Decompiled using luadec 2.2 rev:  for Lua 5.2 from https://github.com/viruscamp/luadec
-- Command line: A:\Steam\twd-definitive\scripteditor-10-31-20\s1_lighting_improvements\WDC_pc_WalkingDead101_data\env_woodsClementine_temp.lua 

-- params : ...
-- function num : 0 , upvalues : _ENV
require("wd_tutorial.lua")
local kScript = "woodsClementine"
local kScene = "adv_woodsClementine.scene"
local kDialog = "env_forest.dlog"
woodsClementine = function()
  -- function num : 0_0 , upvalues : _ENV, kDialog
  Mode(mode_Main)
  if IsToolBuild() and AgentGetProperty("logic_debug", "Debug - WoodsStartFromCop") then
    Yield()
    -- DECOMPILER ERROR at PC16: Confused about usage of register: R0 in 'UnsetPending'

    Logic["Woods - Escaped Backseat"] = true
    AgentSetProperty("trigger_seeKeys", "Trigger Enabled", false)
    AgentHide("obj_shellShotgunWD", false)
    if not SaveLoad_IsFromLoad() then
      Dialog_Play("cs_copIsZombie")
    end
    return 
  end
  SceneAdd("fx_overlayEyesBlink.scene")
  if Platform_IsWiiU() then
    print("Dialog Preloading start")
    DlgPreload(kDialog, "cs_wakeUp", 0, 15, 0, false)
  end
  if not SaveLoad_IsFromLoad() then
    Yield()
    local prefs = GetPreferences()
    if not prefs["Skip Intro Cutscenes"] then
      Dialog_Play("cs_wakeUp", "Lee", nil, kDialog)
    end
  end
end

BackSeat = function()
  -- function num : 0_1
end

Woods_nearCarTriggerEnter = function(trigger)
  -- function num : 0_2 , upvalues : _ENV
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R1 in 'UnsetPending'

  Logic["Woods - Lee Near Cop Car"] = true
end

Woods_nearCarTriggerExit = function(trigger)
  -- function num : 0_3 , upvalues : _ENV
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R1 in 'UnsetPending'

  Logic["Woods - Lee Near Cop Car"] = false
end

Woods_BackSeatSlideFinished = function()
  -- function num : 0_4 , upvalues : _ENV, kDialog
  Mode(mode_thirdperson)
  Dialog_Play("Cop Car Window Passenger Side", "Lee", nil, kDialog)
end

Woods_BackingAwayFromCopDone = function()
  -- function num : 0_5 , upvalues : _ENV, kDialog
  Dialog_Play("backingAwayFromCopFinished", "Lee", nil, kDialog)
end

Woods_PeekAwayFromCopCB = function()
  -- function num : 0_6 , upvalues : _ENV, kDialog
  Dialog_Play("disable_keys", "Lee", nil, kDialog)
end

Woods_PreLoadCopShoot = function()
  -- function num : 0_7
end

SceneOpen(kScene, kScript)

