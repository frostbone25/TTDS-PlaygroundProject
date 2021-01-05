-- Decompiled using luadec 2.2 rev:  for Lua 5.2 from https://github.com/viruscamp/luadec
-- Command line: A:\Steam\twd-definitive\scripteditor-10-31-20\definitive_lighting_improvements\WDC_pc_WalkingDead201_data\RiverShore_temp.lua 

-- params : ...
-- function num : 0 , upvalues : _ENV
local kScript = "RiverShore"
local kScene = "adv_riverShore"
local envMeshes = {}
envMeshes.shoreline = {"group_shoreline", "obj_canoeBrokenRiverShore"}
envMeshes.trail = {"group_trail"}
envMeshes.trailLower = {"group_trailLower"}
envMeshes.trailUpper = {"group_trailUpper"}
envMeshes.forestFloor = {"group_forestFloor"}
local mCurrentEnv = nil
local PreloadAssets = function()
  -- function num : 0_0 , upvalues : _ENV
  PreLoad("env_riverShore_cs_wind_1.chore")
  PreLoad("env_riverShore_cs_crowsOnSign_1.chore")
  PreLoad("env_riverShore_cs_crowsFlyOver_1.chore")
  PreLoad("env_riverShore_cs_pathTransition_1.chore")
  PreLoad("env_riverShore_trigger_toForestFloor_2.chore")
end

RiverShore_SetEnvironment = function(state)
  -- function num : 0_1 , upvalues : _ENV, envMeshes, mCurrentEnv
  local hideEnv = function(env)
    -- function num : 0_1_0 , upvalues : _ENV
    for key,value in pairs(env) do
      if AgentHasProperty(value, "Group - Visible") then
        AgentSetProperty(value, "Group - Visible", false)
        local groupChildren = AgentGetChildren(value)
        for key,value in pairs(groupChildren) do
          if AgentHasProperty(value, "Trigger Enabled") then
            AgentSetProperty(value, "Trigger Enabled", false)
          end
        end
      else
        do
          do
            AgentHide(value, true)
            if AgentHasProperty(value, "Trigger Enabled") then
              AgentSetProperty(value, "Trigger Enabled", false)
            end
            -- DECOMPILER ERROR at PC51: LeaveBlock: unexpected jumping out DO_STMT

            -- DECOMPILER ERROR at PC51: LeaveBlock: unexpected jumping out IF_ELSE_STMT

            -- DECOMPILER ERROR at PC51: LeaveBlock: unexpected jumping out IF_STMT

          end
        end
      end
    end
  end

  local meshesToShow = nil
  for key,value in pairs(envMeshes) do
    if state == key then
      meshesToShow = envMeshes[state]
      break
    end
  end
  do
    if not meshesToShow then
      print("RiverShore_SetEnvironment() didn\'t get a valid state!")
      return 
    else
      if mCurrentEnv == meshesToShow then
        print("RiverShore_SetEnvironment(): " .. tostring(meshesToShow) .. " is already active! Nothing to do!")
        return 
      end
    end
    if not mCurrentEnv then
      for key,value in pairs(envMeshes) do
        hideEnv(value)
      end
    else
      do
        hideEnv(mCurrentEnv)
        for key,value in pairs(meshesToShow) do
          if AgentHasProperty(value, "Group - Visible") then
            AgentSetProperty(value, "Group - Visible", true)
            local groupChildren = AgentGetChildren(value)
            for key,value in pairs(groupChildren) do
              if AgentHasProperty(value, "Trigger Enabled") then
                AgentSetProperty(value, "Trigger Enabled", true)
              end
            end
          else
            do
              do
                AgentHide(value, false)
                if AgentHasProperty(value, "Trigger Enabled") then
                  AgentSetProperty(value, "Trigger Enabled", true)
                end
                -- DECOMPILER ERROR at PC98: LeaveBlock: unexpected jumping out DO_STMT

                -- DECOMPILER ERROR at PC98: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                -- DECOMPILER ERROR at PC98: LeaveBlock: unexpected jumping out IF_STMT

              end
            end
          end
        end
        mCurrentEnv = meshesToShow
      end
    end
  end
end

RiverShore_MakeAllObjsUnselectable = function()
  -- function num : 0_2 , upvalues : _ENV, kScene
  for key,value in pairs(SceneGetAgents(kScene)) do
    if AgentHasProperty(value, "Game Selectable") then
      AgentSetSelectable(value, false)
    end
  end
end

RiverShore_MoveCanoe = function()
  -- function num : 0_3 , upvalues : _ENV
  AgentSetProperty(Game_GetPlayer(), "Chored Movement - Chore Forward", "env_riverShore_use_canoe_13.chore")
  AgentSetProperty(Game_GetPlayer(), "Chored Movement - Dialog End", "cs_use_canoe_CM_outro")
  ChoredMovement_Start()
  ChoredMovement_ReverseControls(true)
end

RiverShore_WalkThroughUnderbrush = function(pathArea)
  -- function num : 0_4 , upvalues : _ENV
  if pathArea == "lower" then
    print("RiverShore_WalkThroughUnderbrush(): LOWER")
    AgentSetProperty(Game_GetPlayer(), "Chored Movement - Chore Forward", "env_riverShore_cs_pathTransition_1.chore")
    AgentSetProperty(Game_GetPlayer(), "Chored Movement - Dialog End", "trigger_toForestFloor")
    ChoredMovement_Start()
    ChoredMovement_ReverseControls(false)
  else
    if pathArea == "upper" then
      print("RiverShore_WalkThroughUnderbrush(): UPPER")
    else
      print("RiverShore_WalkThroughUnderbrush() didn\'t get a valid area!")
    end
  end
end

RiverShore_StartWalkAcrossLandslide = function(pathArea)
  -- function num : 0_5 , upvalues : _ENV
  if pathArea == "lower" then
    AgentSetProperty(Game_GetPlayer(), "Chored Movement - Chore Forward", "env_riverShore_choredMove_beforeLandslide_lower_1.chore")
    AgentSetProperty(Game_GetPlayer(), "Chored Movement - Dialog End", "logic_prepForestFloor")
    ChoredMovement_Start()
    ChoredMovement_ReverseControls(false)
  else
    if pathArea == "upper" then
      AgentSetProperty(Game_GetPlayer(), "Chored Movement - Chore Forward", "env_riverShore_choredMove_beforeLandslide_upper_1.chore")
      AgentSetProperty(Game_GetPlayer(), "Chored Movement - Dialog End", "logic_prepForestFloor")
      ChoredMovement_Start()
      ChoredMovement_ReverseControls(false)
    else
      print("RiverShore_StartWalkAcrossLandslide() didn\'t get a valid area!")
    end
  end
end

RiverShore = function()
  -- function num : 0_6 , upvalues : _ENV, kScene, kScript, PreloadAssets
  Game_NewScene(kScene, kScript)
  PreloadAssets()
  if Platform_NeedShaderPreload() then
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "7")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "334")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "334")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "135")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "195")
    RenderPreloadShader("Mesh_DTL_CC_TINT_QLo.t3fxb", "198")
    RenderPreloadShader("Mesh_DTL_CC_TINT_QLo.t3fxb", "196")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "327")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_DTL_VCOL_CC_TINT_QLo.t3fxb", "196")
    RenderPreloadShader("SceneShadowMap_VCOL_QLo.t3fxb", "0")
    RenderPreloadShader("SceneShadowMapAlpha_VCOL_QLo.t3fxb", "0")
    RenderPreloadShader("Mesh_LGT_DTL_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "323")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("SceneShadowMap_QLo.t3fxb", "0")
    RenderPreloadShader("SceneShadowMapAlpha_QLo.t3fxb", "0")
    RenderPreloadShader("FX_Null_QLo.t3fxb", "0")
    RenderPreloadShader("DirectionalLightShadow_QLo.t3fxb", "1024")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("SceneToonOutline2_CC_TINT_QLo.t3fxb", "64")
    RenderPreloadShader("Mesh_DTL_CC_TINT_SDTL_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_LGT_DTL_VCOL_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_TINT_QLo.t3fxb", "71")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_TINT_QLo.t3fxb", "199")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "67")
    RenderPreloadShader("ScenePreZ_QLo.t3fxb", "128")
  end
  if IsPlatformAndroid() then
    AgentSetProperty("cam_nav_shore", "Pan Cam - Dampening", 2)
    AgentSetProperty("cam_nav_trailTileLowerC", "Pan Cam - Dampening", 2)
    AgentSetProperty("cam_nav_trailTileLowerFork", "Pan Cam - Dampening", 2)
    AgentSetProperty("cam_nav_forestFloor", "Pan Cam - Dampening", 2)
  end
  Game_StartScene(true)
end

SceneOpen(kScene, kScript)
SceneAdd("ui_openingCredits")

