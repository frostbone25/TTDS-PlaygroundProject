-- Decompiled using luadec 2.2 rev:  for Lua 5.2 from https://github.com/viruscamp/luadec
-- Command line: A:\Steam\twd-definitive\scripteditor-10-31-20\definitive_lighting_improvements\WDC_pc_WalkingDead201_data\BackwoodsStream_temp.lua 

-- params : ...
-- function num : 0 , upvalues : _ENV
local kScript = "BackwoodsStream"
local kScene = "adv_backwoodsStream"
local envMeshes = {}
envMeshes.forest = {"obj_backwoodsStreamTileA", "obj_backwoodsStreamTileB", "obj_backwoodsStreamTileC", "obj_backwoodsStreamTileD", "obj_backwoodsStreamTileEnd", "ZombieWoodsA", "ZombieWoodsB", "ZombieWoodsC"}
envMeshes.stream = {"adv_backwoodsStream_meshesA", "adv_backwoodsStream_meshesB", "adv_backwoodsStream_meshesC", "adv_backwoodsStream_meshesD", "adv_backwoodsStream_meshesE", "adv_backwoodsStream_meshesF", "adv_backwoodsStream_meshesG", "adv_backwoodsStream_meshesH", "adv_backwoodsStream_meshesI", "adv_backwoodsStream_meshesJ", "adv_backwoodsStream_meshesK", "adv_backwoodsStream_meshesL", "adv_backwoodsStream_meshesM", "obj_coolerFish", "obj_panelMetalBackwoodsStream", "obj_rockFormationBackwoodsStreamA", "obj_rockFormationBackwoodsStreamB", "obj_rockFormationBackwoodsStreamC", "obj_rockFormationBackwoodsStreamD", "obj_rockFormationBackwoodsStreamE", "obj_stonesStepping", "obj_coolerFish", "obj_treeFallen", "obj_treeRocksA", "obj_treeRocksB"}
envMeshes.streamWithTraps = {"adv_backwoodsStream_meshesA", "adv_backwoodsStream_meshesB", "adv_backwoodsStream_meshesC", "adv_backwoodsStream_meshesD", "adv_backwoodsStream_meshesE", "adv_backwoodsStream_meshesF", "adv_backwoodsStream_meshesG", "adv_backwoodsStream_meshesH", "adv_backwoodsStream_meshesI", "adv_backwoodsStream_meshesJ", "adv_backwoodsStream_meshesK", "adv_backwoodsStream_meshesL", "adv_backwoodsStream_meshesM", "obj_coolerFish", "obj_panelMetalBackwoodsStream", "obj_rockFormationBackwoodsStreamA", "obj_rockFormationBackwoodsStreamB", "obj_rockFormationBackwoodsStreamC", "obj_rockFormationBackwoodsStreamD", "obj_rockFormationBackwoodsStreamE", "obj_stonesStepping", "obj_trapBase", "obj_trapFishBase", "obj_trapFishA", "obj_trapFishB", "obj_trapFishC", "obj_trapFishDraped", "obj_coolerFish", "obj_treeFallen", "obj_treeRocksA", "obj_treeRocksB"}
local mBanterDialogID, mZombiesApproachPeteDeathTimerID, mFishEscapeDialogID = nil, nil, nil
local PreloadAssets = function()
  -- function num : 0_0 , upvalues : _ENV
  PreLoad("env_backwoodsStream_cs_walkAndTalk_2_rails.chore")
  PreLoad("env_backwoodsStream_cs_walkerBite_1.chore")
  PreLoad("env_backwoodsStream_cs_walkerBite_10.chore")
  PreLoad("env_backwoodsStream_timer_choiceCam_1.chore")
  PreLoad("env_backwoodsStream_cs_peteOrNick_peek_C_to_L_1.chore")
  PreLoad("env_backwoodsStream_cs_peteOrNick_peek_C_to_R_1.chore")
  PreLoad("env_backwoodsStream_cs_peteOrNick_peek_L_to_R_1.chore")
  PreLoad("env_backwoodsStream_cs_peteOrNick_peek_R_to_L_1.chore")
  PreLoad("env_backwoodsStream_cs_goWithPete_1.chore")
  PreLoad("env_backwoodsStream_timer_PeteGrabbed_1.chore")
  PreLoad("env_backwoodsStream_timer_PeteGrabbed_2.chore")
  PreLoad("env_backwoodsStream_timer_PeteGrabbed_clemHasBoard_1.chore")
  PreLoad("env_backwoodsStream_timer_PeteGrabbed_2.chore")
  PreLoad("env_backwoodsStream_cs_clemFreesPete_2.chore")
  PreLoad("env_backwoodsStream_cs_goWithNick_1.chore")
  PreLoad("env_backwoodsStream_cs_goWithNick_2.chore")
  PreLoad("env_backwoodsStream_cs_goWithNick_6.chore")
  PreLoad("env_backwoodsStream_cs_goWithNick_5.chore")
  if Platform_NeedShaderPreload() then
    RenderPreloadShader("Mesh_QLo.t3fxb", "14")
    RenderPreloadShader("Mesh_LGT_QLo.t3fxb", "263")
    RenderPreloadShader("Mesh_LGT_QLo.t3fxb", "135")
    RenderPreloadShader("Mesh_VCOL_QLo.t3fxb", "3")
    RenderPreloadShader("Mesh_LGT_VCOL_QLo.t3fxb", "135")
    RenderPreloadShader("Mesh_DTL_QLo.t3fxb", "134")
    RenderPreloadShader("Mesh_DTL_QLo.t3fxb", "132")
    RenderPreloadShader("Mesh_DTL_VCOL_QLo.t3fxb", "135")
    RenderPreloadShader("Mesh_DTL_VCOL_QLo.t3fxb", "140")
    RenderPreloadShader("Mesh_DTL_SDTL_QLo.t3fxb", "74")
    RenderPreloadShader("Mesh_QLo.t3fxb", "74")
    RenderPreloadShader("Mesh_QLo.t3fxb", "330")
    RenderPreloadShader("Mesh_DTL_VCOL_SDTL_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_VCOL_QLo.t3fxb", "334")
    RenderPreloadShader("Mesh_VCOL_QLo.t3fxb", "270")
    RenderPreloadShader("Mesh_DTL_SDTL_QLo.t3fxb", "78")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "76")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "78")
    RenderPreloadShader("Mesh_QLo.t3fxb", "6")
    RenderPreloadShader("ScenePreZ_QLo.t3fxb", "128")
    RenderPreloadShader("SceneShadowMap_QLo.t3fxb", "0")
    RenderPreloadShader("SceneShadowMapAlpha_QLo.t3fxb", "0")
    RenderPreloadShader("Mesh_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_DTL_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_DTL_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_LGT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "263")
    RenderPreloadShader("FX_Null_QLo.t3fxb", "0")
    RenderPreloadShader("DirectionalLightShadow_QLo.t3fxb", "1024")
    RenderPreloadShader("SceneToonOutline2_QLo.t3fxb", "0")
    RenderPreloadShader("Mesh_DTL_SDTL_QLo.t3fxb", "3")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "334")
    RenderPreloadShader("Mesh_DTL_QLo.t3fxb", "198")
    RenderPreloadShader("Mesh_DTL_QLo.t3fxb", "196")
    RenderPreloadShader("Mesh_LGT_QLo.t3fxb", "199")
    RenderPreloadShader("SceneShadowMap_1SKN_QLo.t3fxb", "0")
    RenderPreloadShader("SceneShadowMapAlpha_1SKN_QLo.t3fxb", "0")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "3")
    RenderPreloadShader("Mesh_LGT_DTL_QLo.t3fxb", "263")
    RenderPreloadShader("SceneToonOutline2_QLo.t3fxb", "64")
    RenderPreloadShader("SceneToonOutline2_QLo.t3fxb", "256")
    RenderPreloadShader("SceneToonOutline2_1SKN_QLo.t3fxb", "0")
    RenderPreloadShader("Mesh_DTL_SDTL_QLo.t3fxb", "6")
    RenderPreloadShader("Mesh_DTL_SDTL_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "4")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "6")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "68")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_1SKN_DTL_SDTL_QLo.t3fxb", "6")
    RenderPreloadShader("Mesh_DTL_SDTL_QLo.t3fxb", "259")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "326")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "270")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_LGT_DTL_VCOL_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_VCOL_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_LGT_DTL_VCOL_QLo.t3fxb", "263")
    RenderPreloadShader("Mesh_LGT_DTL_VCOL_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_DTL_VCOL_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_DTL_VCOL_QLo.t3fxb", "204")
    RenderPreloadShader("Mesh_QLo.t3fxb", "10")
    RenderPreloadShader("Mesh_QLo.t3fxb", "78")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "10")
    RenderPreloadShader("Mesh_DTL_SDTL_QLo.t3fxb", "10")
    RenderPreloadShader("Mesh_DTL_SDTL_QLo.t3fxb", "266")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "134")
    RenderPreloadShader("Mesh_VCOL_QLo.t3fxb", "134")
    RenderPreloadShader("Mesh_QLo.t3fxb", "134")
    RenderPreloadShader("Mesh_QLo.t3fxb", "142")
    RenderPreloadShader("Mesh_LGT_VCOL_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "135")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_DTL_SDTL_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_VCOL_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_DTL_VCOL_SDTL_QLo.t3fxb", "7")
    RenderPreloadShader("SceneShadowMap_VCOL_QLo.t3fxb", "0")
    RenderPreloadShader("SceneShadowMapAlpha_VCOL_QLo.t3fxb", "0")
    RenderPreloadShader("Mesh_LGT_VCOL_QLo.t3fxb", "263")
    RenderPreloadShader("Mesh_VCOL_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_QLo.t3fxb", "266")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "138")
    RenderPreloadShader("Mesh_VCOL_QLo.t3fxb", "138")
    RenderPreloadShader("Mesh_QLo.t3fxb", "138")
    RenderPreloadShader("Mesh_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_QLo.t3fxb", "68")
    RenderPreloadShader("Mesh_1SKN_QLo.t3fxb", "262")
    RenderPreloadShader("SceneToonOutline2_QLo.t3fxb", "320")
    RenderPreloadShader("SceneToonOutline2_1SKN_QLo.t3fxb", "64")
    RenderPreloadShader("Mesh_1SKN_DTL_SDTL_QLo.t3fxb", "70")
    RenderPreloadShader("Mesh_DTL_SDTL_QLo.t3fxb", "323")
  end
end

BackwoodsStream_GreatFishEscape = function()
  -- function num : 0_1 , upvalues : mFishEscapeDialogID, _ENV
  mFishEscapeDialogID = Game_RunDialog("amb_escapingFish", false)
end

BackwoodsStream_GreatFishEscape_Pause = function(bPause)
  -- function num : 0_2 , upvalues : mFishEscapeDialogID, _ENV
  if mFishEscapeDialogID then
    if bPause then
      DlgPause(mFishEscapeDialogID)
    else
      DlgResume(mFishEscapeDialogID)
    end
  end
end

BackwoodsStream_EscapingFishCheck = function()
  -- function num : 0_3 , upvalues : _ENV, mFishEscapeDialogID
  print("*** escaping fish check! ***")
  if LogicGet("3BackwoodsStream - Escaping Fish") <= 1 then
    if mFishEscapeDialogID then
      DlgStop(mFishEscapeDialogID)
    end
    Game_RunDialog("cs_lastFishGetsAway")
  end
end

BackwoodsStream_EscapingFish_KillCallback = function()
  -- function num : 0_4 , upvalues : _ENV
  PropertyRemoveKeyCallback(AgentGetProperties("logic_game"), "3BackwoodsStream - Escaping Fish", BackwoodsStream_EscapingFishCheck)
end

BackwoodsStream_ZombiesApproachPeteTimer_Start = function()
  -- function num : 0_5 , upvalues : _ENV, mZombiesApproachPeteDeathTimerID
  print("Zombies approaching Pete -- timer started!")
  mZombiesApproachPeteDeathTimerID = Game_RunDialog("timer_zombiesApproachPete", false)
end

BackwoodsStream_ZombiesApproachPeteTimer_Stop = function()
  -- function num : 0_6 , upvalues : _ENV, mZombiesApproachPeteDeathTimerID
  print("Zombies approaching Pete -- stop timer?")
  print("mZombiesApproachPeteDeathTimerID is " .. tostring(mZombiesApproachPeteDeathTimerID))
  if mZombiesApproachPeteDeathTimerID then
    print("Timer STOPPED!")
    DlgStop(mZombiesApproachPeteDeathTimerID)
  end
end

BackwoodsStream_MakeAllObjsUnselectable = function()
  -- function num : 0_7 , upvalues : _ENV, kScene
  for key,value in pairs(SceneGetAgents(kScene)) do
    if AgentHasProperty(value, "Game Selectable") then
      AgentSetSelectable(value, false)
    end
  end
end

BackwoodsStream_ConnectiveTissuePause = function()
  -- function num : 0_8 , upvalues : _ENV
  while Game_ModeIsOnStack(eModeCutscene) do
    Yield()
  end
  if not LogicGet("3BackwoodsStream - Started Fishing") then
    Dialog_Run(Game_GetSceneDialog(), "cs_connectiveTissue")
  end
end

BackwoodsStream_StartWalkAcrossLog = function()
  -- function num : 0_9 , upvalues : _ENV
  AgentSetProperty(Game_GetPlayer(), "Chored Movement - Chore Forward", "env_backwoodsStream_cs_walkAndTalk_2_rails.chore")
  AgentSetProperty(Game_GetPlayer(), "Chored Movement - Dialog End", "cs_walkerBite")
  ChoredMovement_Start()
end

BackwoodsStream_SetEnvironment = function(state)
  -- function num : 0_10 , upvalues : _ENV, envMeshes
  local meshesToShow = nil
  for key,value in pairs(envMeshes) do
    if state == key then
      meshesToShow = envMeshes[state]
      break
    end
  end
  do
    if not meshesToShow then
      print("BackwoodsStream_SetEnvironment() didn\'t get a valid state!")
      return 
    end
    for key,value in pairs(envMeshes) do
      for key,value in pairs(value) do
        AgentHide(value, true)
      end
    end
    for key,value in pairs(meshesToShow) do
      AgentHide(value, false)
    end
  end
end

BackwoodsStream_BanterStart = function()
  -- function num : 0_11 , upvalues : mBanterDialogID, _ENV
  mBanterDialogID = Dialog_Run(Game_GetSceneDialog(), "amb_fishingBanter", false)
  print("^^STARTING^^ fishing banter!  Dialog ID: " .. tostring(mBanterDialogID))
end

BackwoodsStream_BanterPause = function(bPause)
  -- function num : 0_12 , upvalues : _ENV, mBanterDialogID
  if not bPause then
    print("** RESUMING ** fishing banter!  Dialog ID: " .. tostring(mBanterDialogID))
    DlgResume(mBanterDialogID)
  else
    print(">> PAUSING << fishing banter!  Dialog ID: " .. tostring(mBanterDialogID))
    DlgPause(mBanterDialogID)
  end
end

BackwoodsStream_BanterEnd = function()
  -- function num : 0_13 , upvalues : _ENV, mBanterDialogID
  print("-> STOPPING <- fishing banter!  Dialog ID: " .. tostring(mBanterDialogID))
  if DlgIsRunning(mBanterDialogID) then
    DlgStop(mBanterDialogID)
  else
    print("...but the banter wasn\'t running!")
  end
end

BackwoodsStream = function()
  -- function num : 0_14 , upvalues : _ENV, kScene, kScript, PreloadAssets
  Game_NewScene(kScene, kScript)
  PreloadAssets()
  Game_StartScene(true)
end

SceneOpen(kScene, kScript)

