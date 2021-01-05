-- Decompiled using luadec 2.2 rev:  for Lua 5.2 from https://github.com/viruscamp/luadec
-- Command line: A:\Steam\twd-definitive\scripteditor-10-31-20\definitive_lighting_improvements\WDC_pc_ProjectSeason4_data\ProjectSettings_temp.lua 

-- params : ...
-- function num : 0 , upvalues : _ENV
require("ProjectSettingsManager.lua")
print("Applying WD4 project settings")
ProjectSettingsManager_Apply("Season4")
local prefs = GetPreferences()
PropertySet(prefs, "Enable Graphic Black", false)
PropertySet(prefs, "Render - Graphic Black Enabled", false)
WalkAnimatorUsePrioritiesVer2()
InputSetTouchEnabled(false)

