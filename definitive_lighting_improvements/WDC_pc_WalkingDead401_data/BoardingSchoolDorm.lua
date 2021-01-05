-- Decompiled using luadec 2.2 rev:  for Lua 5.2 from https://github.com/viruscamp/luadec
-- Command line: A:\Steam\twd-definitive\scripteditor-10-31-20\definitive_lighting_improvements\WDC_pc_WalkingDead401_data\BoardingSchoolDorm_temp.lua 

-- params : ...
-- function num : 0 , upvalues : _ENV
require("OpeningCredits.lua")
local kScript = "BoardingSchoolDorm"
local kScene = "adv_boardingSchoolDorm"
BoardingSchoolDorm = function()
  -- function num : 0_0 , upvalues : _ENV
  if Game_GetSkipEnterCutscenes() then
    Game_RunSceneDialog("logic_freeWalkRoom", false)
  end
end

Game_SceneOpen(kScene, kScript)

