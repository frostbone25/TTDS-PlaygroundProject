-- Decompiled using luadec 2.2 rev:  for Lua 5.2 from https://github.com/viruscamp/luadec
-- Command line: A:\Steam\twd-definitive\scripteditor-10-31-20\definitive_lighting_improvements\WDC_pc_WalkingDead401_data\BoardingSchoolExteriorGate_temp.lua 

-- params : ...
-- function num : 0 , upvalues : _ENV
local kScript = "BoardingSchoolExteriorGate"
local kScene = "adv_boardingSchoolExteriorGate"
local OnLogicReady = function()
  -- function num : 0_0 , upvalues : _ENV
  if Game_GetLoaded() then
    return 
  end
  local debugID = LogicGet("Debug ID")
  if debugID == 1 then
    Game_SetSceneDialogNode("cs_outside")
  end
end

BoardingSchoolExteriorGate = function()
  -- function num : 0_1 , upvalues : _ENV
  DlgPreloadAll(Game_GetPlayerDialog(), false)
end

if IsDebugBuild() then
  Callback_OnLogicReady:Add(OnLogicReady)
end
Game_SceneOpen(kScene, kScript)

