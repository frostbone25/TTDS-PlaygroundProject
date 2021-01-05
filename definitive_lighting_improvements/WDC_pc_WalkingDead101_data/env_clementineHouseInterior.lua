-- Decompiled using luadec 2.2 rev:  for Lua 5.2 from https://github.com/viruscamp/luadec
-- Command line: A:\Steam\twd-definitive\scripteditor-10-31-20\s1_lighting_improvements\WDC_pc_WalkingDead101_data\env_clementineHouseInterior_temp.lua 

-- params : ...
-- function num : 0 , upvalues : _ENV
local kScript = "clementineHouseInterior"
local kScene = "adv_clementineHouseInterior.scene"
local kDialogHouse = "env_ClementineHouse.dlog"
local kDialogClem = "clementinehouse_clementine.dlog"
ClemHouseInt_KitchenLivingCamTriggerEnter = function(trigger)
  -- function num : 0_0 , upvalues : _ENV
  AgentHide("blocker_kitchen", true)
  triggerCamera_EnterBox(trigger)
end

ClemHouseInt_KitchenLivingCamTriggerExit = function(trigger)
  -- function num : 0_1 , upvalues : _ENV
  AgentHide("blocker_kitchen", false)
  triggerCamera_ExitBox(trigger)
end

local mAttackChoreCtl, mAttackChoreName = nil, nil
ClemHouseInt_AttackStart = function(attackChore)
  -- function num : 0_2 , upvalues : mAttackChoreCtl, _ENV
  mAttackChoreCtl = nil
  Main_AllowMovement(false)
  CameraActivate("cam_nav_JPStylePlayer")
  PropertyRemoveKeyCallback(AgentGetProperties("logic_game"), "ClemHouseInt - BabysitterAteLee", "ClemHouseInt_AttackFail")
  PropertyAddKeyCallback(AgentGetProperties("logic_game"), "ClemHouseInt - BabysitterAteLee", "ClemHouseInt_AttackFail")
  ClemHouseInt_AttackChoreStart(attackChore)
end

ClemHouseInt_MovePhaseStart = function()
  -- function num : 0_3 , upvalues : _ENV, kDialogHouse
  local phaseNum = Logic["ClemHouseInt - BabysitterPhase"]
  assert(phaseNum > 0, "ClemHouseInt_MovePhaseStart: phaseNum <= 0")
  ChoredMovement_ReverseControls(true)
  ChoredMovement_Start("env_clementinehouse_choredmove_scootawayfromzombie_" .. phaseNum .. ".chore")
  Dialog_Play("babysitterChores_Leg" .. phaseNum, "Lee", nil, kDialogHouse)
  -- DECOMPILER ERROR: 1 unprocessed JMP targets
end

ClemHouseInt_OnBabysitterCatchesLee = function(trigger)
  -- function num : 0_4 , upvalues : _ENV, kDialogHouse
  -- DECOMPILER ERROR at PC1: Confused about usage of register: R1 in 'UnsetPending'

  (trigger.mProps)["Trigger Enabled"] = false
  Dialog_Play("cs_BabysitterCatchesLee", "Lee", nil, kDialogHouse)
end

ClemHouseInt_AttackChoreStart = function(attackChore)
  -- function num : 0_5 , upvalues : mAttackChoreName, mAttackChoreCtl, _ENV
  if attackChore ~= nil then
    mAttackChoreName = attackChore
  end
  if mAttackChoreCtl then
    ControllerSetTime(mAttackChoreCtl, 0)
    ControllerPlay(mAttackChoreCtl)
  else
    if mAttackChoreName then
      mAttackChoreCtl = ChorePlay(mAttackChoreName)
      PanicMeter_AttachItem("ui_panicmeter_overlay", mAttackChoreCtl)
    else
      Print("ClemHouseInt_AttackChoreStart: no chore specified")
    end
  end
end

ClemHouseInt_AttackChoreStop = function()
  -- function num : 0_6 , upvalues : mAttackChoreCtl, _ENV
  if mAttackChoreCtl then
    ControllerKill(mAttackChoreCtl)
    mAttackChoreCtl = nil
    PanicMeter_RemoveItem("ui_panicmeter_overlay", mAttackChoreCtl)
  end
end

ClemHouseInt_AttackFail = function(key, value)
  -- function num : 0_7 , upvalues : _ENV, kDialogHouse
  if value then
    Dialog_Play("cs_LeeDeath", "Lee", nil, kDialogHouse)
  end
end

ClemHouseInt_AttackSuccess = function()
  -- function num : 0_8 , upvalues : _ENV
  ClemHouseInt_AttackChoreStop()
  PropertyRemoveKeyCallback(AgentGetProperties("logic_game"), "ClemHouseInt - BabysitterAteLee", "ClemHouseInt_AttackFail")
end

clementineHouseInterior = function()
  -- function num : 0_9 , upvalues : _ENV, kScene, kDialogHouse
  do
    if Platform_IsAndroid() then
      local sceneAgent = SceneGetSceneAgent(AgentGetScene(kScene))
      if sceneAgent then
        AgentSetProperty(sceneAgent, "FX Tonemap Enabled", true)
        AgentSetProperty(sceneAgent, "FX Tonemap Intensity", 1.5)
      end
    end
    Mode(mode_Main)
    if not IsRegistered() and Logic["ClemHouseInt - Babysitter Fight Started"] then
      Dialog_Play("debug_IntroFightFromDemo", "Lee", nil, kDialogHouse)
    else
      if IsToolBuild and AgentGetProperty("logic_debug", "Debug - TestZombieBabysitter") then
        AgentSetProperty("logic_debug", "Debug - TestZombieBabysitter", false)
        AgentSetProperty("obj_bloodSpill", "Trigger Enabled", false)
        if Platform_IsWiiU() then
          print("Dialog Preloading start")
          DlgPreload(kDialogHouse, "cs_newFightIntro", 0, 10, 0, false)
        end
        Dialog_Play("cs_newFightIntro", "Lee", nil, kDialogHouse)
      else
        if not SaveLoad_IsFromLoad() then
          if Platform_IsWiiU() then
            print("Dialog Preloading start")
            DlgPreload(kDialogHouse, "cs_enterHouse", 0, 15, 0, false)
          end
          Dialog_Play("cs_enterHouse", "Lee", nil, kDialogHouse)
        end
      end
    end
  end
end

local crawlChore, dollyChore = nil, nil
local bPlayedClemLine = false
ClemHouseInt_StartFightCrawl = function()
  -- function num : 0_10 , upvalues : _ENV, crawlChore, bPlayedClemLine
  local thread = function()
    -- function num : 0_10_0 , upvalues : _ENV, crawlChore, bPlayedClemLine
    if Logic["ClemHouseInt - BabysitterPhase"] <= 2 then
      crawlChore = ChorePlay("env_clementinehouse_ambient_babysitterclimbs2_1.chore")
    else
      crawlChore = ChorePlay("env_clementinehouse_ambient_babysitterclimbs3_1.chore")
    end
    ControllerSetPriority(crawlChore, 9000)
    Sleep(0.5)
    while 1 do
      while 1 do
        if crawlChore and (ControllerIsPlaying(crawlChore) or ControllerIsPaused(crawlChore)) then
          Yield()
          if Logic["ClemHouseInt - BabysitterPhase"] > 3 and not bPlayedClemLine and AgentIsOnScreen("obj_hammerWD_Clementine") then
            Dialog_Play("ambient_clementineOffersHelp")
            bPlayedClemLine = true
          end
          if Dialog_CutsceneIsRunning() and not ControllerIsPaused(crawlChore) then
            ControllerPause(crawlChore)
            ControllerSetContribution(crawlChore, 0)
            ControllerSetTime(crawlChore, (math.random)(300) / 100)
            -- DECOMPILER ERROR at PC76: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC76: LeaveBlock: unexpected jumping out IF_STMT

            -- DECOMPILER ERROR at PC76: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC76: LeaveBlock: unexpected jumping out IF_STMT

          end
        end
      end
      if Dialog_CutsceneIsRunning() or ControllerIsPaused(crawlChore) then
        ControllerSetContribution(crawlChore, 1)
        ControllerPlay(crawlChore)
      end
    end
    if not Dialog_CutsceneIsRunning() then
      if Logic["ClemHouseInt - BabysitterPhase"] <= 2 then
        Dialog_StopAll()
        Dialog_Play("cs_leeDiesBetweenKitchenAndDoor")
      else
        if Logic["ClemHouseInt - BabysitterPhase"] == 3 or Logic["ClemHouseInt - BabysitterPhase"] == 4 then
          Dialog_StopAll()
          Dialog_Play("cs_leeDiesAtSlidingGlassDoor")
        end
      end
    end
  end

  ThreadStart(thread)
end

local hammerWait = nil
ClemHouseHint_WaitForHammer = function(bWait)
  -- function num : 0_11 , upvalues : _ENV, hammerWait
  do
    if bWait and not ThreadIsRunning(hammerWait) then
      local thread = function()
    -- function num : 0_11_0 , upvalues : _ENV
    Sleep(3)
    while Dialog_CutsceneIsRunning() do
      Yield()
    end
    -- DECOMPILER ERROR at PC15: Confused about usage of register: R0 in 'UnsetPending'

    if Logic["ClemHouseInt - BabysitterLeeSafe"] then
      Logic["ClemHouseInt - Lee Did Not Use Hammer Enough"] = true
      Dialog_Play("use_Babysitter")
    else
      Dialog_Play("cs_leeDiesOnTopOfBabysitter")
    end
  end

      hammerWait = ThreadStart(thread)
    end
    if not bWait then
      ThreadKill(hammerWait)
      hammerWait = nil
    end
  end
end

ClemHouseInt_StopFightCrawl = function()
  -- function num : 0_12 , upvalues : _ENV, crawlChore, dollyChore
  ControllerKill(crawlChore)
  ControllerKill(dollyChore)
end

SceneOpen(kScene, kScript)

