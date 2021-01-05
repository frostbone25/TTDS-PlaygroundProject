-- Decompiled using luadec 2.2 rev:  for Lua 5.2 from https://github.com/viruscamp/luadec
-- Command line: A:\Steam\twd-definitive\scripteditor-10-31-20\definitive_lighting_improvements\WDC_pc_WalkingDead401_data\TrainStationNight_temp.lua 

-- params : ...
-- function num : 0 , upvalues : _ENV
local kScript = "TrainStationNight"
local kScene = "adv_trainStationNight"
local kLouisChore = "env_trainStationNight_act2_bg_louisDistract_1.chore"
local mbAbelPresent = false
local mbDebugText = false
local mClemDeathMonitorThread, mLouisController, mLouisFadeThread = nil, nil, nil
local mFoodSlots = {false, false, false}
local mPlaceController, mTakeController, mAJThread = nil, nil, nil
local mFoodCollected = 0
local mFoodLimit = nil
local mZombieStates = {}
local OnLogicReady = function()
  -- function num : 0_0 , upvalues : _ENV
  local debugID = LogicGet("Debug ID")
  if debugID == 1 then
    Game_SetSceneDialogNode("cs_onTop")
  else
    if debugID == 2 then
      AgentSetProperty("Clementine", "Player - Over The Shoulder Control Mode", true)
      AgentHide("Zombie01", true)
      AgentHide("Zombie02", true)
      AgentHide("Zombie03", true)
      Game_SetSceneDialogNode("cs_clemWaitingBehindCover")
    else
      if debugID == 3 then
        Game_SetSceneDialogNode("cs_madeIt")
      end
    end
  end
end

local DebugPrint = function(mesg, verbosity, bIsError)
  -- function num : 0_1 , upvalues : mbDebugText, _ENV
  if not mbDebugText then
    return 
  end
  Print(mesg, verbosity, bIsError)
end

local OnDeath = function()
  -- function num : 0_2 , upvalues : _ENV
  ThreadStart(TrainStationNight_EnableLouisDistraction, false, 1)
  TrainStationNight_MonitorForClemDeath(false)
  Dialog_StopBackground()
end

local FadeInVolume = function(controller, fadeTime)
  -- function num : 0_3 , upvalues : _ENV
  local elapsedTime = GetFrameTime()
  while elapsedTime < fadeTime and ControllerIsPlaying(controller) do
    ControllerSetSoundVolume(controller, elapsedTime / fadeTime)
    WaitForNextFrame()
    elapsedTime = elapsedTime + GetFrameTime()
  end
  ControllerSetSoundVolume(controller, 1)
end

local FadeOutVolume = function(controller, fadeTime)
  -- function num : 0_4 , upvalues : _ENV
  local elapsedTime = GetFrameTime()
  while elapsedTime < fadeTime and ControllerIsPlaying(controller) do
    ControllerSetSoundVolume(controller, 1 - elapsedTime / fadeTime)
    WaitForNextFrame()
    elapsedTime = elapsedTime + GetFrameTime()
  end
  ControllerSetSoundVolume(controller, 0)
end

local GetFoodPosition = function(desiredPosition)
  -- function num : 0_5 , upvalues : mFoodSlots
  if desiredPosition and not mFoodSlots[desiredPosition] then
    return desiredPosition
  else
    for i = 1, #mFoodSlots do
      if mFoodSlots[i] == false then
        return i
      end
    end
  end
  do
    return nil
  end
end

local HideLogicals = function(bHide)
  -- function num : 0_6 , upvalues : mFoodSlots, _ENV
  for i = 1, #mFoodSlots do
    if mFoodSlots[i] then
      AgentHide("obj_logicalFood" .. i, bHide)
    end
  end
end

local RevealAbel = function(node, bWaitForPlace)
  -- function num : 0_7 , upvalues : mbAbelPresent, DebugPrint, _ENV, mTakeController, mPlaceController
  if not mbAbelPresent then
    DebugPrint("Abel comin\'")
    mbAbelPresent = true
    while 1 do
      if ControllerIsPlaying(mTakeController) or bWaitForPlace and ControllerIsPlaying(mPlaceController) then
        WaitForNextFrame()
        -- DECOMPILER ERROR at PC22: LeaveBlock: unexpected jumping out IF_THEN_STMT

        -- DECOMPILER ERROR at PC22: LeaveBlock: unexpected jumping out IF_STMT

      end
    end
    TrainStationNight_AJGatheringEnable(false)
    Game_RunSceneDialog(node, false)
  end
end

local AJManager = function(timeLimit)
  -- function num : 0_8 , upvalues : mbAbelPresent, _ENV, mPlaceController, GetFoodPosition, kScene, RevealAbel
  local gatheringTime = 0
  local lastPosition = 0
  while 1 do
    if gatheringTime < timeLimit then
      if not mbAbelPresent and not Game_IsPaused() then
        if not ControllerIsPlaying(mPlaceController) then
          if lastPosition == 3 then
            lastPosition = 0
          end
          local position = GetFoodPosition(lastPosition + 1)
          if position then
            lastPosition = position
            TrainStationNight_PlaceFood(position)
          end
        end
        do
          gatheringTime = gatheringTime + GetFrameTime() * SceneGetTimeScale(kScene)
          WaitForNextFrame()
          -- DECOMPILER ERROR at PC37: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC37: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC37: LeaveBlock: unexpected jumping out IF_STMT

          -- DECOMPILER ERROR at PC37: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC37: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
  ThreadStart(RevealAbel, "cs_abelRevealTimeout", true)
end

TrainStationNight = function()
  -- function num : 0_9 , upvalues : _ENV
  DlgPreloadAll(Game_GetPlayerDialog(), false)
  if Game_GetSkipEnterCutscenes() then
    Game_RunSceneDialog("logic_freeWalk", false)
  end
end

TrainStationNight_MonitorForClemDeath = function(bEnable)
  -- function num : 0_10 , upvalues : _ENV, mClemDeathMonitorThread
  if bEnable == ThreadIsRunning(mClemDeathMonitorThread) then
    return 
  end
  local bZombiesPayingAttention = nil
  local OnKeyChange = function(key, value)
    -- function num : 0_10_0 , upvalues : bZombiesPayingAttention
    if key == "2 - Zombies Paying Attention" then
      bZombiesPayingAttention = value
    end
  end

  if bEnable then
    bZombiesPayingAttention = LogicGet("2 - Zombies Paying Attention")
    LogicAddKeyCallback("2 - Zombies Paying Attention", OnKeyChange)
    local update = function()
    -- function num : 0_10_1 , upvalues : _ENV, bZombiesPayingAttention, OnKeyChange, mClemDeathMonitorThread
    while Game_ModeIsOnStack(eModePeek) do
      if bZombiesPayingAttention then
        Game_RunSceneDialog("cs_clemBlowsCover")
        break
      end
      WaitForNextFrame()
    end
    LogicRemoveKeyCallback("2 - Zombies Paying Attention", OnKeyChange)
    mClemDeathMonitorThread = nil
  end

    mClemDeathMonitorThread = ThreadStart(update)
  else
    do
      mClemDeathMonitorThread = ThreadKill(mClemDeathMonitorThread)
      LogicRemoveKeyCallback("2 - Zombies Paying Attention", OnKeyChange)
    end
  end
end

TrainStationNight_EnableLouisDistraction = function(bEnable, fadeTime)
  -- function num : 0_11 , upvalues : _ENV, mLouisController, kLouisChore, mLouisFadeThread, FadeOutVolume
  if bEnable then
    if ControllerIsPlaying(mLouisController) then
      return 
    end
    mLouisController = ChorePlay(kLouisChore, 9900)
  else
    if mLouisFadeThread then
      mLouisFadeThread = ThreadKill(mLouisFadeThread)
    end
    if not ControllerIsPlaying(mLouisController) then
      mLouisController = nil
      return 
    end
    if fadeTime and fadeTime > 0 then
      FadeOutVolume(mLouisController, fadeTime)
    end
    mLouisController = ControllerKill(mLouisController)
  end
end

TrainStationNight_ResumeLouisDistraction = function(fadeTime)
  -- function num : 0_12 , upvalues : _ENV, mLouisController, kLouisChore, mLouisFadeThread, FadeInVolume
  if not Game_GetLoaded() or ControllerIsPlaying(mLouisController) then
    return 
  end
  local pct = LogicGet("2 - Louis Distraction Percentage")
  if pct < 1 then
    mLouisController = ChorePlayAndAdvance(kLouisChore, ChoreGetLength(kLouisChore) * pct)
    if fadeTime then
      mLouisFadeThread = ThreadStart(FadeInVolume, mLouisController, fadeTime)
    end
  end
end

TrainStationNight_PlaceFood = function(desiredPosition)
  -- function num : 0_13 , upvalues : _ENV, mPlaceController, DebugPrint, GetFoodPosition, mFoodSlots
  if ControllerIsPlaying(mPlaceController) then
    DebugPrint("tried to place food while a place chore is already playing")
    return false
  end
  local availablePosition = GetFoodPosition(desiredPosition)
  if not availablePosition then
    DebugPrint("food already in place at position " .. desiredPosition)
    return false
  end
  mFoodSlots[availablePosition] = true
  DebugPrint("placing food at position " .. availablePosition)
  AgentHide("obj_logicalFood" .. availablePosition, false)
  mPlaceController = ChorePlay("env_trainStationNight_act2_ajRetrievesJar_" .. availablePosition, 9800)
  return availablePosition
end

TrainStationNight_TakeFood = function(desiredPosition)
  -- function num : 0_14 , upvalues : _ENV, mTakeController, DebugPrint, mFoodSlots, HideLogicals, mFoodCollected, RevealAbel
  if ControllerIsPlaying(mTakeController) then
    DebugPrint("tried to take food while a take chore is already playing")
    return false
  end
  if not mFoodSlots[desiredPosition] then
    DebugPrint("no food present in position " .. desiredPosition)
    return false
  end
  HideLogicals(true)
  mTakeController = ChorePlayAndWait("env_trainStationNight_act2_clemTakesJar_" .. desiredPosition, 9900)
  mFoodSlots[desiredPosition] = false
  mFoodCollected = mFoodCollected + 1
  if desiredPosition == 3 then
    ThreadStart(RevealAbel, "cs_creepyEncounter", false)
  else
    HideLogicals(false)
  end
  return true
end

TrainStationNight_AJGatheringEnable = function(bEnable, timeLimit, foodLimit)
  -- function num : 0_15 , upvalues : mAJThread, mFoodLimit, mFoodCollected, _ENV, AJManager, mbAbelPresent, mPlaceController, mTakeController, mFoodSlots
  if bEnable and not mAJThread then
    if not timeLimit then
      timeLimit = 30
    end
    mFoodLimit = foodLimit or mFoodLimit
    mFoodCollected = 0
    mAJThread = ThreadStart(AJManager, timeLimit)
    mbAbelPresent = false
  end
  mAJThread = ThreadKill(mAJThread)
  mPlaceController = nil
  mTakeController = ControllerKill(mTakeController)
  for i = 1, #mFoodSlots do
    AgentHide("obj_logicalFood" .. i, true)
    mFoodSlots[i] = false
  end
end

TrainStationNight_ZombiesDetectionEnable = function(bEnable)
  -- function num : 0_16 , upvalues : mZombieStates, _ENV
  if bEnable == false then
    mZombieStates = {}
    for i = 1, 8 do
      local zombie = "Zombie0" .. i
      local props = AgentGetProperties(zombie)
      if props["AI Agent - AI Agent Enable"] then
        local oldState = props["AI Agent - Current State"]
        mZombieStates[zombie] = oldState
        if (string.find)(oldState, "Path To") then
          props["AI Agent - Current State"] = "Patrol"
        else
          local newState = (string.gsub)(oldState, " With Detection And Interaction", "")
          newState = (string.gsub)(newState, " With Interaction", "")
          newState = (string.gsub)(newState, " With Detection", "")
          props["AI Agent - Current State"] = newState
        end
      end
    end
  else
    do
      for zombie,state in pairs(mZombieStates) do
        AgentSetProperty(zombie, "AI Agent - Current State", "Patrol With Detection")
        AgentSetProperty(zombie, "AI Agent - Detection State To Switch To", "Path To With Interaction")
      end
      mZombieStates = {}
    end
  end
end

TrainStationNight_DisableZombat = function()
  -- function num : 0_17 , upvalues : _ENV
  local disableAI = function(agent)
    -- function num : 0_17_0 , upvalues : _ENV
    if AgentExists(agent) then
      AgentSetProperty(agent, "AI Agent - AI Agent Enable", false)
    end
  end

  for i = 1, 10 do
    disableAI((string.format)("Zombie%02d", i))
    disableAI((string.format)("ZombieHerd%02d", i))
  end
end

if IsDebugBuild() then
  Callback_OnLogicReady:Add(OnLogicReady)
end
Game_SceneOpen(kScene, kScript)
Callback_OnDeath:Add(OnDeath)

