-- Decompiled using luadec 2.2 rev:  for Lua 5.2 from https://github.com/viruscamp/luadec
-- Command line: A:\Steam\twd-definitive\scripteditor-10-31-20\s1_lighting_improvements\WDC_pc_WalkingDead101_data\env_persistencetest_temp.lua 

-- params : ...
-- function num : 0 , upvalues : _ENV
local kScript = "streetOutskirts"
local kScene = "adv_streetOutskirts.scene"
streetOutskirts = function()
  -- function num : 0_0 , upvalues : _ENV, kScene
  AgentSetProperty(SceneGetSceneAgent(kScene), "Dialog Agent - File Primary", "env_persistenceTest.dlog")
  Main_AllowMovement(false)
  Mode(mode_Main)
  AgentSetProperty("cop", "Timer Enabled", true)
end

SceneOpen(kScene, kScript)

