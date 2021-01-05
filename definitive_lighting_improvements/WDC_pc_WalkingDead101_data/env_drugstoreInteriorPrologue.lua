-- Decompiled using luadec 2.2 rev:  for Lua 5.2 from https://github.com/viruscamp/luadec
-- Command line: A:\Steam\twd-definitive\scripteditor-10-31-20\s1_lighting_improvements\WDC_pc_WalkingDead101_data\env_drugstoreInteriorPrologue_temp.lua 

-- params : ...
-- function num : 0 , upvalues : _ENV
local kScene = "adv_drugstoreInteriorPrologue.scene"
local mBoardsComingOut = {}
local mBoardsFailed = {}
local getAvailableBoards = function()
  -- function num : 0_0 , upvalues : mBoardsComingOut, mBoardsFailed, _ENV
  local avail = {}
  for i = 0, 5 do
    if not mBoardsComingOut[i] and not mBoardsFailed[i] then
      (table.insert)(avail, i)
    end
  end
  return avail
end

Prologue_PickABoard = function()
  -- function num : 0_1 , upvalues : getAvailableBoards, _ENV, mBoardsComingOut
  local avail = getAvailableBoards()
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R1 in 'UnsetPending'

  if #avail == 0 then
    Logic["Drugstore - PrologueBoardCurrentOut"] = -1
    return 
  end
  local boardIdx = TableGetRandomElement(avail)
  mBoardsComingOut[boardIdx] = true
  -- DECOMPILER ERROR at PC13: Confused about usage of register: R2 in 'UnsetPending'

  Logic["Drugstore - PrologueBoardCurrentOut"] = boardIdx
end

Prologue_ResetBoard = function(idx)
  -- function num : 0_2 , upvalues : mBoardsComingOut
  mBoardsComingOut[idx] = false
end

Prologue_BoardIsComingOut = function(idx)
  -- function num : 0_3 , upvalues : mBoardsComingOut
  return mBoardsComingOut[idx]
end

Prologue_FailBoard = function(idx)
  -- function num : 0_4 , upvalues : mBoardsFailed
  mBoardsFailed[idx] = true
end

dlgIdle = function(dlgItem, logicKey)
  -- function num : 0_5 , upvalues : _ENV
  while Logic[logicKey] do
    Dialog_PlayAndWait(dlgItem)
    Yield()
  end
end

Prologue_MoveToCarley = function()
  -- function num : 0_6 , upvalues : _ENV
  Mode_Pop(mode_choice)
  Dialog_Play("cs_MoveToCarley")
end

Prologue_MoveToDoug = function()
  -- function num : 0_7 , upvalues : _ENV
  Mode_Pop(mode_choice)
  Dialog_Play("cs_MoveToDoug")
end

Prologue = function()
  -- function num : 0_8 , upvalues : _ENV
  Mode(mode_Main)
  if SaveLoad_IsFromLoad() then
    return 
  end
  if IsToolBuild() and AgentGetProperty("logic_debug", "Debug - PrologueStartFromChoice") then
    Dialog_Play("cs_choiceSetup")
  else
    if IsToolBuild() and AgentGetProperty("logic_debug", "Debug - PrologueStartFromSaveClem") then
      AgentHide("Glenn", true)
      Dialog_Play("cs_kennyReturns")
    else
      if Platform_HasHeadTracking() then
        Dialog_Play("cs_getOnDoor")
      else
        if not SaveLoad_IsFromLoad() then
          if not IsToolBuild() or not (GetPreferences())["Skip Intro Cutscenes"] then
            if Platform_IsWiiU() then
              print("Dialog Preloading start1")
              DlgPreload("env_drugstorePrologue.dlog", "cs_prologueAtEnd", 0, 15, 0, false)
            end
            Dialog_Play("cs_prologueAtEnd")
          else
            if Platform_IsWiiU() then
              print("Dialog Preloading start2")
              DlgPreload("env_drugstorePrologue.dlog", "logic_StartScene", 0, 10, 0, false)
            end
            Dialog_Play("logic_StartScene")
          end
        end
      end
    end
  end
end

SceneOpen(kScene, "Prologue")

