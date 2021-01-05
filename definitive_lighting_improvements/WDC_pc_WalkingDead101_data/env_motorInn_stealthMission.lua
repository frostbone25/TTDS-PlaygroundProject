-- Decompiled using luadec 2.2 rev:  for Lua 5.2 from https://github.com/viruscamp/luadec
-- Command line: A:\Steam\twd-definitive\scripteditor-10-31-20\s1_lighting_improvements\WDC_pc_WalkingDead101_data\env_motorInn_stealthMission_temp.lua 

-- params : ...
-- function num : 0 , upvalues : _ENV
local kScript = "motorInn_Stealth"
local kScene = "adv_motorInn_stealthMission.scene"
local kDialog = "env_motorInnMission.dlog"
local mStation1, mStation2, mStation3, mStation4, mStation5, mStation6, logicAgent = nil, nil, nil, nil, nil, nil, nil
motorInn_Stealth = function()
  -- function num : 0_0 , upvalues : _ENV, kScene, mStation1, mStation2, mStation3, mStation4, mStation5, mStation6, logicAgent, kDialog
  ResourceSetNonPurgable("env_motorInn.dlog", true)
  AgentAddOnDestroyCallback(SceneGetSceneAgent(kScene), function()
    -- function num : 0_0_0 , upvalues : _ENV
    ResourceSetNonPurgable("env_motorInn.dlog", false)
  end
)
  Mode(mode_Main)
  Main_AllowMovement(false)
  mStation1 = AgentFind("obj_station1")
  mStation2 = AgentFind("obj_station2")
  mStation3 = AgentFind("obj_station3")
  mStation4 = AgentFind("obj_station4")
  mStation5 = AgentFind("obj_station5")
  mStation6 = AgentFind("obj_station6")
  logicAgent = AgentFind("logic_game")
  do
    if not SaveLoad_IsFromLoad() then
      local prefs = GetPreferences()
      if Logic["MotorInn - Debug Skip To upstairs"] then
        Dialog_Play("debug_startUpstairs", "Lee", nil, kDialog)
      else
        if prefs["Skip Intro Cutscenes"] then
          if Platform_IsWiiU() then
            print("Dialog Preloading start1")
            DlgPreload(kDialog, "Station 1 Keepalive", 0, 10, 0, false)
          end
          Dialog_Play("Station 1 Keepalive", "Lee", nil, kDialog)
        else
          if Platform_IsWiiU() then
            print("Dialog Preloading start2")
            DlgPreload(kDialog, "cs_enterMotorInnMissionNEW", 0, 10, 0, false)
          end
          Dialog_Play("cs_enterMotorInnMissionNEW", "Lee", nil, kDialog)
        end
      end
      if (logicAgent.mProps)["MotorInn - Clicked on Ice Machine"] and not (logicAgent.mProps)["MotorInn - Tried to Help Girl"] then
        SceneSetWalkBoxes(kScene, "adv_motorinn.wbox")
      else
        SceneSetWalkBoxes(kScene, "adv_motorinnFloor2.wbox")
      end
    end
    Yield()
    PanicMeter_AttachItem("ui_panicmeter_overlay", "timer_ZombiesSeeLee")
    PropertyAddKeyCallback(AgentGetProperties("logic_game"), "MotorInn - Peeking In Truck Window", "MotorInnStealth_PeekInTruckUpdate")
    PropertyAddKeyCallback(AgentGetProperties("logic_game"), "MotorInn - Peek Tutorial 2", "MotorInnStealth_PeekTutorial2")
  end
end

MotorInnStealth_ZombieRVTriggerFailure = function(trigger)
  -- function num : 0_1 , upvalues : _ENV, kDialog
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R1 in 'UnsetPending'

  (trigger.mProps)["Trigger Enabled"] = false
  Dialog_Play("cs_zombieAwlKillStation2Failure", "Lee", nil, kDialog)
end

MotorInnStealth_PeekTutorial2 = function(key, val)
  -- function num : 0_2 , upvalues : _ENV, kDialog
  if val and not Logic["MotorInn - Peek Tutorial 2 Shown"] and not Logic["MotorInn - Left Station 1"] then
    HelpText_Show("tutorial_peek2")
    -- DECOMPILER ERROR at PC14: Confused about usage of register: R2 in 'UnsetPending'

    Logic["MotorInn - Peek Tutorial 2 Shown"] = true
    Dialog_Play("PeekHintTimer", "Lee", nil, kDialog)
  end
end

MotorInnStealth_PeekInTruckUpdate = function()
  -- function num : 0_3 , upvalues : _ENV
  Reticle_Update(true)
end

MotorInnStealth_ArriveStation1 = function()
  -- function num : 0_4 , upvalues : _ENV, kDialog
  Print("Station 1 Callback")
  Dialog_Play("Station 1 Keepalive", "Lee", nil, kDialog)
  Mode_Pop(mode_Chored_Movement)
  return true
end

MotorInnStealth_ArriveStation2 = function()
  -- function num : 0_5 , upvalues : _ENV, kDialog
  Dialog_Play("Station 2 Keepalive", "Lee", nil, kDialog)
  Mode_Pop(mode_Chored_Movement)
  return true
end

MotorInnStealth_ArriveStation3 = function()
  -- function num : 0_6 , upvalues : _ENV, kDialog
  Dialog_Play("Station 3 Keepalive", "Lee", nil, kDialog)
  Mode_Pop(mode_Chored_Movement)
  return true
end

MotorInnStealth_ArriveStation4 = function()
  -- function num : 0_7 , upvalues : _ENV, kDialog
  Dialog_Play("Station 4 Keepalive", "Lee", nil, kDialog)
  Mode_Pop(mode_Chored_Movement)
  return true
end

MotorInnStealth_ArriveStation5 = function()
  -- function num : 0_8 , upvalues : _ENV, kDialog
  Print("Station 5 callback")
  Dialog_Play("Station 5 Keepalive", "Lee", nil, kDialog)
  Mode_Pop(mode_Chored_Movement)
  return true
end

MotorInnStealth_ArriveStation6 = function()
  -- function num : 0_9 , upvalues : _ENV, kDialog
  Dialog_Play("Station 6 Keepalive", "Lee", nil, kDialog)
  Mode_Pop(mode_Chored_Movement)
  return true
end

MotorInnStealth_ResetStationChores = function()
  -- function num : 0_10 , upvalues : _ENV, kDialog
  Dialog_Play("Reset Station Camera Chores", "Lee", nil, kDialog)
end

SceneOpen(kScene, kScript)

