-- Decompiled using luadec 2.2 rev:  for Lua 5.2 from https://github.com/viruscamp/luadec
-- Command line: A:\Steam\twd-definitive\scripteditor-10-31-20\definitive_lighting_improvements\WDC_pc_WalkingDead201_data\NextTimeOn_temp.lua 

-- params : ...
-- function num : 0 , upvalues : _ENV
local kScript = "NextTimeOn"
local kScene = "adv_nextTimeOn201"
NextTimeOn = function()
  -- function num : 0_0 , upvalues : _ENV, kScene, kScript
  Game_NewScene(kScene, kScript)
  Navigate_Enable(false)
  if Platform_NeedShaderPreload() then
    RenderPreloadShader("SceneToonOutline2_CC_TINT_QLo.t3fxb", "64")
    RenderPreloadShader("Mesh_DTL_CC_TINT_SDTL_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "323")
    RenderPreloadShader("Mesh_LGT_CC_TINT_QLo.t3fxb", "324")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "195")
    RenderPreloadShader("Mesh_LGT_VCOL_CC_TINT_QLo.t3fxb", "324")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "66")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "74")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "74")
    RenderPreloadShader("SceneToonOutline2_CC_TINT_QLo.t3fxb", "192")
    RenderPreloadShader("Mesh_CC_TINT_QLo.t3fxb", "326")
    RenderPreloadShader("Mesh_VCOL_CC_TINT_QLo.t3fxb", "67")
    RenderPreloadShader("Mesh_1SKN_CC_TINT_QLo.t3fxb", "67")
  end
  Game_StartScene(true)
end

NextTimeOn_EndEpisode = function()
  -- function num : 0_1 , upvalues : _ENV
  WDAchievements_Unlock("achievement_07")
  SaveLoad_SetEpisode("ShowEndCredits1")
  Menu_EndStats(1)
  Game_EndEpisode("MenuSeason2", "Menu_Main")
end

SceneOpen(kScene, kScript)
SceneAdd("ui_nextTimeOn")

