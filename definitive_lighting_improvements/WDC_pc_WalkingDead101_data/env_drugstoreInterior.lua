-- Decompiled using luadec 2.2 rev:  for Lua 5.2 from https://github.com/viruscamp/luadec
-- Command line: A:\Steam\twd-definitive\scripteditor-10-31-20\s1_lighting_improvements\WDC_pc_WalkingDead101_data\env_drugstoreInterior_temp.lua 

-- params : ...
-- function num : 0 , upvalues : _ENV
require("Relighting.lua")

local kScene = "adv_drugstoreInteriorAct3.scene"

local preloadShaders = function()
  -- function num : 0_0 , upvalues : _ENV
  RenderPreloadShader("Mesh_CC_QLo.t3fxb", "2")
  RenderPreloadShader("Mesh_LGT_DTL_CC_QLo.t3fxb", "7")
  RenderPreloadShader("Mesh_LGT_CC_QLo.t3fxb", "263")
  RenderPreloadShader("Mesh_CC_QLo.t3fxb", "258")
  RenderPreloadShader("Mesh_ENV_LGT_CC_QLo.t3fxb", "135")
  RenderPreloadShader("Mesh_ENV_CC_QLo.t3fxb", "138")
  RenderPreloadShader("Mesh_CC_QLo.t3fxb", "3")
  RenderPreloadShader("Mesh_CC_QLo.t3fxb", "71")
  RenderPreloadShader("Mesh_CC_QLo.t3fxb", "66")
  RenderPreloadShader("Mesh_DTL_CC_QLo.t3fxb", "71")
  RenderPreloadShader("Mesh_1SKN_CC_QLo.t3fxb", "64")
  RenderPreloadShader("Mesh_1SKN_CC_QLo.t3fxb", "66")
  RenderPreloadShader("Mesh_LGT_DTL_CC_QLo.t3fxb", "71")
  RenderPreloadShader("Mesh_CC_QLo.t3fxb", "322")
  RenderPreloadShader("Mesh_1SKN_CC_QLo.t3fxb", "322")
  RenderPreloadShader("Mesh_ENV_LGT_CC_QLo.t3fxb", "199")
  RenderPreloadShader("Mesh_LGT_CC_QLo.t3fxb", "199")
  RenderPreloadShader("Mesh_CC_QLo.t3fxb", "74")
  RenderPreloadShader("Mesh_ENV_CC_QLo.t3fxb", "202")
  RenderPreloadShader("Mesh_ENV_LGT_CC_QLo.t3fxb", "196")
  RenderPreloadShader("Mesh_CC_QLo.t3fxb", "131")
  RenderPreloadShader("Mesh_CC_QLo.t3fxb", "138")
  RenderPreloadShader("Mesh_ENV_LGT_CC_QLo.t3fxb", "132")
  RenderPreloadShader("Mesh_1SKN_CC_QLo.t3fxb", "10")
  RenderPreloadShader("Mesh_1SKN_CC_QLo.t3fxb", "138")
  RenderPreloadShader("Mesh_CC_QLo.t3fxb", "259")
  RenderPreloadShader("Mesh_CC_QLo.t3fxb", "67")
  RenderPreloadShader("Mesh_CC_QLo.t3fxb", "330")
  RenderPreloadShader("Mesh_CC_QLo.t3fxb", "202")
  RenderPreloadShader("Mesh_CC_QLo.t3fxb", "3")
  RenderPreloadShader("Mesh_CC_QLo.t3fxb", "2")
  RenderPreloadShader("Mesh_LGT_DTL_CC_QLo.t3fxb", "7")
  RenderPreloadShader("Mesh_LGT_CC_QLo.t3fxb", "263")
  RenderPreloadShader("Mesh_CC_QLo.t3fxb", "258")
  RenderPreloadShader("Mesh_ENV_CC_QLo.t3fxb", "138")
  RenderPreloadShader("Mesh_ENV_LGT_CC_QLo.t3fxb", "132")
  RenderPreloadShader("Mesh_ENV_LGT_CC_QLo.t3fxb", "135")
  RenderPreloadShader("Mesh_CC_QLo.t3fxb", "138")
  RenderPreloadShader("Mesh_LGT_DTL_CC_QLo.t3fxb", "71")
  RenderPreloadShader("Mesh_CC_QLo.t3fxb", "71")
  RenderPreloadShader("Mesh_CC_QLo.t3fxb", "66")
  RenderPreloadShader("Mesh_CC_QLo.t3fxb", "322")
  RenderPreloadShader("Mesh_LGT_CC_QLo.t3fxb", "199")
  RenderPreloadShader("Mesh_ENV_LGT_CC_QLo.t3fxb", "199")
  RenderPreloadShader("Mesh_CC_QLo.t3fxb", "131")
  RenderPreloadShader("Mesh_CC_QLo.t3fxb", "67")
  RenderPreloadShader("Mesh_CC_QLo.t3fxb", "74")
  RenderPreloadShader("Mesh_ENV_CC_QLo.t3fxb", "202")
  RenderPreloadShader("Mesh_1SKN_CC_QLo.t3fxb", "10")
  RenderPreloadShader("Mesh_CC_QLo.t3fxb", "330")
  RenderPreloadShader("Mesh_1SKN_CC_QLo.t3fxb", "138")
  RenderPreloadShader("Mesh_CC_QLo.t3fxb", "202")
  RenderPreloadShader("Mesh_1SKN_CC_QLo.t3fxb", "64")
  RenderPreloadShader("Mesh_1SKN_CC_QLo.t3fxb", "66")
  RenderPreloadShader("Mesh_1SKN_CC_QLo.t3fxb", "322")
  RenderPreloadShader("Mesh_DTL_CC_QLo.t3fxb", "71")
  RenderPreloadShader("Mesh_ENV_LGT_CC_QLo.t3fxb", "196")
  RenderPreloadShader("Mesh_DTL_CC_QLo.t3fxb", "7")
  RenderPreloadShader("Mesh_CC_QLo.t3fxb", "323")
  RenderPreloadShader("Mesh_CC_QLo.t3fxb", "259")
  RenderPreloadShader("Mesh_1SKN_CC_QLo.t3fxb", "2")
  RenderPreloadShader("Mesh_1SKN_CC_QLo.t3fxb", "0")
  RenderPreloadShader("Mesh_1SKN_CC_QLo.t3fxb", "258")
end

local callouts = {}
local calloutThread = nil
Callout_Add = function(dlgItem)
  -- function num : 0_1 , upvalues : _ENV, callouts
  (table.insert)(callouts, dlgItem)
end

Callout_Remove = function(dlgItem)
  -- function num : 0_2 , upvalues : _ENV, callouts
  for i,v in ipairs(callouts) do
    if v == dlgItem then
      (table.remove)(callouts, i)
      return 
    end
  end
end

local CalloutThreadFunc = function()
  -- function num : 0_3 , upvalues : calloutThread, _ENV, callouts
  calloutThread = GetCurrentThread()
  while 1 do
    Sleep(10)
    local n = ((table.getn)(callouts))
    local id = nil
    while n <= 0 or id == nil do
      local item = TableGetRandomElement(callouts)
      id = Dialog_Play(item, SceneGetSceneAgent(SceneGetBottomScene()))
      if id == nil then
        Callout_Remove(item)
      end
    end
  end
end

local calloutActivate = function(bActive)
  -- function num : 0_4 , upvalues : _ENV, calloutThread, CalloutThreadFunc
  if bActive and not ThreadIsRunning(calloutThread) then
    calloutThread = ThreadStart(CalloutThreadFunc)
  end
  ThreadKill(calloutThread)
  calloutThread = nil
end

dlgIdle = function(dlgItem, logicKey)
  -- function num : 0_5 , upvalues : _ENV
  while Logic[logicKey] do
    Dialog_PlayAndWait(dlgItem)
    Yield()
  end
end

local introDialogID = nil
hax = function()
  -- function num : 0_6 , upvalues : introDialogID, _ENV
  if introDialogID and DlgIsRunning(introDialogID) then
    RenderDelay(1)
    ControllerKill(DlgGetCurPlaybackController(introDialogID))
    DlgStop(introDialogID)
  end
end

Arrival = function()
  -- function num : 0_7 , upvalues : _ENV, preloadShaders, introDialogID
  if IsEngineIPhone() or IsEngineAndroid() then
    preloadShaders()
  end

    --PrintSceneListToTXT(kScene, "adv_drugstoreInterior101.txt")
    --PrintSceneLightsToTXT(kScene, "adv_drugstoreInterior101_lights.txt")

  -- DECOMPILER ERROR at PC11: Confused about usage of register: R0 in 'UnsetPending'

  Logic["Drugstore - Arrival"] = true
  -- DECOMPILER ERROR at PC17: Confused about usage of register: R0 in 'UnsetPending'

  if Logic["Drugstore - Secure"] then
    Logic["Drugstore - ArrivalComplete"] = true
    -- DECOMPILER ERROR at PC19: Confused about usage of register: R0 in 'UnsetPending'

    Logic["Drugstore - Window Boarded"] = true
    -- DECOMPILER ERROR at PC21: Confused about usage of register: R0 in 'UnsetPending'

    Logic["Drugstore - Window Barricaded"] = true
  end
  Mode(mode_thirdperson)
  Mode(mode_Main)
  CameraActivate("cam_nav")
  if not SaveLoad_IsFromLoad() then
    if IsToolBuild() and AgentGetProperty("logic_debug", "Debug - DrugstoreStartFromWCZombie") then
      AgentSetProperty("logic_debug", "Debug - DrugstoreStartFromWCZombie", false)
      if Platform_IsWiiU() then
        print("Dialog Preloading start1")
        DlgPreload("env_drugstore.dlog", "cs_clementineOpensBathroom", 0, 15, 0, false)
      end
      introDialogID = Dialog_Play("cs_clementineOpensBathroom")
    else
      if not IsToolBuild() or not (GetPreferences())["Skip Intro Cutscenes"] then
        if Platform_IsWiiU() then
          print("Dialog Preloading start2")
          DlgPreload("env_drugstore.dlog", "Enter", 0, 15, 0, false)
        end
        introDialogID = Dialog_Play("Enter")
      end
    end
  end
end

SceneOpen(kScene, "Arrival")

