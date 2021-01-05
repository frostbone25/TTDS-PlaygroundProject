-- Decompiled using luadec 2.2 rev:  for Lua 5.2 from https://github.com/viruscamp/luadec
-- Command line: A:\Steam\twd-definitive\scripteditor-10-31-20\s1_lighting_improvements\WDC_pc_WalkingDead101_data\env_streetOutskirts_temp.lua 

-- params : ...
-- function num : 0 , upvalues : _ENV
require("wd_tutorial.lua")
local kScript = "streetOutskirts"
local kScene = "adv_streetOutskirts.scene"
local kTreeProps = {"obj_streetOutskirtsTileTreesA.prop", "obj_streetOutskirtsTileTreesB.prop", "obj_streetOutskirtsTileTreesC.prop", "obj_streetOutskirtsTileTreesD.prop", "obj_streetOutskirtsTileTreesE.prop", "obj_streetOutskirtsTileTreesF.prop", "obj_streetOutskirtsTileTreesG.prop", "obj_streetOutskirtsTileTreesH.prop"}
local SetTreeShadows = function(qualityLevel)
  -- function num : 0_0 , upvalues : _ENV, kTreeProps
  local bDisableShadowsForMid = qualityLevel <= 6
  for i,prop in ipairs(kTreeProps) do
    PropertySet(prop, "Render EnvLight Shadow Cast Enable", not bDisableShadowsForMid)
  end
  -- DECOMPILER ERROR: 2 unprocessed JMP targets
end

local EngineRenderSetCurQualityLevel = RenderSetCurQualityLevel
RenderSetCurQualityLevel = function(level)
  -- function num : 0_1 , upvalues : SetTreeShadows, EngineRenderSetCurQualityLevel
  SetTreeShadows(level)
  EngineRenderSetCurQualityLevel(level)
end

streetOutskirts = function()
  -- function num : 0_2 , upvalues : _ENV, SetTreeShadows
  Main_AllowMovement(false)
  Mode(mode_Main)
  SceneAdd("ui_openingcredits.scene")
  Yield()
  if Platform_IsWiiU() then
    print("Dialog Preloading start")
    DlgPreload("env_copCar", "cs_intro", 0, 10, 0, false)
  end
  if LangGetCurLanguage() == "german" and Platform_IsVita() then
    AgentSetProperty("ui_fryingpan", "Text Scale", 0.6)
  end
  SetTreeShadows(RenderGetCurQualityLevel())
  if SaveLoad_IsFromLoad() and Logic["CopCar - PastIntro"] then
    SceneHide("ui_openingcredits.scene", true)
  end
  Dialog_Play("cs_intro")
end

if not IsRegistered() then
  ThreadStart(LoadScript, "env_clementineHouseExterior.lua")
else
  SceneOpen(kScene, kScript)
end

