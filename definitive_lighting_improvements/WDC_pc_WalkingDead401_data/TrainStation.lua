-- Decompiled using luadec 2.2 rev:  for Lua 5.2 from https://github.com/viruscamp/luadec
-- Command line: A:\Steam\twd-definitive\scripteditor-10-31-20\definitive_lighting_improvements\WDC_pc_WalkingDead401_data\TrainStation_temp.lua 

-- params : ...
-- function num : 0 , upvalues : _ENV
require("Relighting.lua")
require("PropertyMenuTool.lua")
require("CustomSound.lua")
--require("AgentMenuTool.lua")
local kScript = "TrainStation"
local kScene = "adv_trainStation"

local clemHouseTest = "adv_clementineHouse400.scene"

--SceneOpen(sceneName, "Game_OnSceneOpened", bFadeInString)


DrugStoreInterior = function(sceneObj)
    ResourceSetEnable("ProjectSeason1")
    ResourceSetEnable("WalkingDead101")
    
    RemovingAgentsWithPrefix(sceneObj, "lightrig_")
    RemovingAgentsWithPrefix(sceneObj, "light_CHAR")
    RemovingAgentsWithPrefix(sceneObj, "lightrotation_CC")
    --RemovingAgentsWithPrefix(sceneObj, "light_")
    
    local drugstoreInterior_wbox = "adv_drugstoreInterior.wbox"
    SceneSetWalkBoxes(sceneObj, drugstoreInterior_wbox)
    
    local agent1_prop = "adv_drugstoreInterior_meshesA.prop"
    local agent1      = AgentCreate("adv_drugstoreInterior_meshesA", agent1_prop, Vector(0,0,0), Vector(0,0,0), sceneObj, false, false)
    local agent2_prop = "adv_drugstoreInterior_meshesB.prop"
    local agent2      = AgentCreate("adv_drugstoreInterior_meshesB", agent2_prop, Vector(-6.171000,-0.002000,-5.620000), Vector(0,0,0), sceneObj, false, false)
    local agent3_prop = "adv_drugstoreInterior_meshesC.prop"
    local agent3      = AgentCreate("adv_drugstoreInterior_meshesC", agent3_prop, Vector(0,0,0), Vector(0,0,0), sceneObj, false, false)
    local agent4_prop = "adv_drugstoreInterior_meshesC_decals.prop"
    local agent4      = AgentCreate("adv_drugstoreInterior_meshesC_decals", agent4_prop, Vector(0,0,0), Vector(0,0,0), sceneObj, false, false)
    local agent5_prop = "adv_drugstoreInterior_meshesA_extra1.prop"
    local agent5      = AgentCreate("adv_drugstoreInterior_meshesA_extra1", agent5_prop, Vector(0,0,0), Vector(0,0,0), sceneObj, false, false)
    local agent6_prop = "adv_drugstoreInterior_meshesB_extra1.prop"
    local agent6      = AgentCreate("adv_drugstoreInterior_meshesB_extra1", agent6_prop, Vector(0,0,0), Vector(0,0,0), sceneObj, false, false)
    local agent7_prop = "adv_drugstoreInterior_meshesC_extra1.prop"
    local agent7      = AgentCreate("adv_drugstoreInterior_meshesC_extra1", agent7_prop, Vector(0,0,0), Vector(0,0,0), sceneObj, false, false)

    local sceneLightRef  = AgentFindInScene("light_ENV_exterior_ambFill", sceneObj)
    local sceneLightRef_props = AgentGetRuntimeProperties(sceneLightRef)
    
    local envlight_groupEnabled = PropertyGet(sceneLightRef_props, "EnvLight - Enabled Group")
    local envlight_groups = PropertyGet(sceneLightRef_props, "EnvLight - Groups")
    local envlight_shadowtype = 2
    local envlight_shadowquality = 2
    local envlight_hbaoParticipation = 1 --0 being ambient, 1 being direct
    local envlight_prop = "module_env_light.prop"
    --local envlight_prop = "module_env_lightgroup.prop"
    --local envlight_prop = "module_light.prop"
    --local envlight_prop = "module_scene_lightenv.prop"
    --local envlight_prop = "module_scene_lightenv_advanced.prop"
    --local envlight_prop = "light.prop"
    
    RemovingAgentsWithPrefix(sceneObj, "light_")
    
    local light1 = AgentCreate("light_lamp", envlight_prop, Vector(0.207692,1.522960,-1.390468), Vector(90,0,0), sceneObj, false, false)
    Custom_AgentSetProperty("light_lamp", "EnvLight - Type", 1, sceneObj)
    Custom_AgentSetProperty("light_lamp", "EnvLight - Intensity", 1, sceneObj)
    Custom_AgentSetProperty("light_lamp", "EnvLight - Radius", 5, sceneObj)
    Custom_AgentSetProperty("light_lamp", "EnvLight - Distance Falloff", 4, sceneObj)
    Custom_AgentSetProperty("light_lamp", "EnvLight - Spot Angle Inner", 5, sceneObj)
    Custom_AgentSetProperty("light_lamp", "EnvLight - Spot Angle Outer", 165, sceneObj)
    Custom_AgentSetProperty("light_lamp", "EnvLight - Color", Color(1, 1, 1, 1), sceneObj)
    Custom_AgentSetProperty("light_lamp", "EnvLight - Enabled Group", envlight_groupEnabled, sceneObj)
    Custom_AgentSetProperty("light_lamp", "EnvLight - Groups", envlight_groups, sceneObj)
    Custom_AgentSetProperty("light_lamp", "EnvLight - Shadow Type", envlight_shadowtype, sceneObj)
    Custom_AgentSetProperty("light_lamp", "EnvLight - Shadow Quality", envlight_shadowquality, sceneObj)
    Custom_AgentSetProperty("light_lamp", "EnvLight - HBAO Participation Type", envlight_hbaoParticipation, sceneObj)
    
    local light2 = AgentCreate("light_lamp01", envlight_prop, Vector(0.316396,1.283947,-1.390468), Vector(90,0,0), sceneObj, false, false)
    Custom_AgentSetProperty("light_lamp01", "EnvLight - Type", 1, sceneObj)
    Custom_AgentSetProperty("light_lamp01", "EnvLight - Intensity", 1, sceneObj)
    Custom_AgentSetProperty("light_lamp01", "EnvLight - Radius", 3.6, sceneObj)
    Custom_AgentSetProperty("light_lamp01", "EnvLight - Distance Falloff", 4.35, sceneObj)
    Custom_AgentSetProperty("light_lamp01", "EnvLight - Spot Angle Inner", 5, sceneObj)
    Custom_AgentSetProperty("light_lamp01", "EnvLight - Spot Angle Outer", 160, sceneObj)
    Custom_AgentSetProperty("light_lamp01", "EnvLight - Color", Color(1, 1, 1, 1), sceneObj)
    Custom_AgentSetProperty("light_lamp01", "EnvLight - Enabled Group", envlight_groupEnabled, sceneObj)
    Custom_AgentSetProperty("light_lamp01", "EnvLight - Groups", envlight_groups, sceneObj)
    Custom_AgentSetProperty("light_lamp01", "EnvLight - Shadow Type", envlight_shadowtype, sceneObj)
    Custom_AgentSetProperty("light_lamp01", "EnvLight - Shadow Quality", envlight_shadowquality, sceneObj)
    Custom_AgentSetProperty("light_lamp01", "EnvLight - HBAO Participation Type", envlight_hbaoParticipation, sceneObj)
    
    local light3 = AgentCreate("light_juicemachine", envlight_prop, Vector(-5.824718,2.316584,5.093388), Vector(169.451767,0,0), sceneObj, false, false)
    Custom_AgentSetProperty("light_juicemachine", "EnvLight - Type", 1, sceneObj)
    Custom_AgentSetProperty("light_juicemachine", "EnvLight - Intensity", 1, sceneObj)
    Custom_AgentSetProperty("light_juicemachine", "EnvLight - Radius", 5, sceneObj)
    Custom_AgentSetProperty("light_juicemachine", "EnvLight - Distance Falloff", 2, sceneObj)
    Custom_AgentSetProperty("light_juicemachine", "EnvLight - Spot Angle Inner", 34, sceneObj)
    Custom_AgentSetProperty("light_juicemachine", "EnvLight - Spot Angle Outer", 160, sceneObj)
    Custom_AgentSetProperty("light_juicemachine", "EnvLight - Color", Color(0.93725502490997, 1, 0.70196098089218, 1), sceneObj)
    Custom_AgentSetProperty("light_juicemachine", "EnvLight - Enabled Group", envlight_groupEnabled, sceneObj)
    Custom_AgentSetProperty("light_juicemachine", "EnvLight - Groups", envlight_groups, sceneObj)
    Custom_AgentSetProperty("light_juicemachine", "EnvLight - Shadow Type", envlight_shadowtype, sceneObj)
    Custom_AgentSetProperty("light_juicemachine", "EnvLight - Shadow Quality", envlight_shadowquality, sceneObj)
    Custom_AgentSetProperty("light_juicemachine", "EnvLight - HBAO Participation Type", envlight_hbaoParticipation, sceneObj)
    
    local light4 = AgentCreate("light_juicemachine01", envlight_prop, Vector(-4.360179,2.316584,5.093388), Vector(169.451767,0,0), sceneObj, false, false)
    Custom_AgentSetProperty("light_juicemachine01", "EnvLight - Type", 1, sceneObj)
    Custom_AgentSetProperty("light_juicemachine01", "EnvLight - Intensity", 1, sceneObj)
    Custom_AgentSetProperty("light_juicemachine01", "EnvLight - Radius", 5, sceneObj)
    Custom_AgentSetProperty("light_juicemachine01", "EnvLight - Distance Falloff", 2, sceneObj)
    Custom_AgentSetProperty("light_juicemachine01", "EnvLight - Spot Angle Inner", 34, sceneObj)
    Custom_AgentSetProperty("light_juicemachine01", "EnvLight - Spot Angle Outer", 160, sceneObj)
    Custom_AgentSetProperty("light_juicemachine01", "EnvLight - Color", Color(0.93725502490997, 1, 0.70196098089218, 1), sceneObj)
    Custom_AgentSetProperty("light_juicemachine01", "EnvLight - Enabled Group", envlight_groupEnabled, sceneObj)
    Custom_AgentSetProperty("light_juicemachine01", "EnvLight - Groups", envlight_groups, sceneObj)
    Custom_AgentSetProperty("light_juicemachine01", "EnvLight - Shadow Type", envlight_shadowtype, sceneObj)
    Custom_AgentSetProperty("light_juicemachine01", "EnvLight - Shadow Quality", envlight_shadowquality, sceneObj)
    Custom_AgentSetProperty("light_juicemachine01", "EnvLight - HBAO Participation Type", envlight_hbaoParticipation, sceneObj)
    
    local light5 = AgentCreate("light_juicemachine02", envlight_prop, Vector(-2.822215,2.316584,5.093388), Vector(163.456879,23.977518,-4.327414), sceneObj, false, false)
    Custom_AgentSetProperty("light_juicemachine02", "EnvLight - Type", 1, sceneObj)
    Custom_AgentSetProperty("light_juicemachine02", "EnvLight - Intensity", 1, sceneObj)
    Custom_AgentSetProperty("light_juicemachine02", "EnvLight - Radius", 5.3000001907349, sceneObj)
    Custom_AgentSetProperty("light_juicemachine02", "EnvLight - Distance Falloff", 2, sceneObj)
    Custom_AgentSetProperty("light_juicemachine02", "EnvLight - Spot Angle Inner", 92, sceneObj)
    Custom_AgentSetProperty("light_juicemachine02", "EnvLight - Spot Angle Outer", 111, sceneObj)
    Custom_AgentSetProperty("light_juicemachine02", "EnvLight - Color", Color(0.93725502490997, 1, 0.70196098089218, 1), sceneObj)
    Custom_AgentSetProperty("light_juicemachine02", "EnvLight - Enabled Group", envlight_groupEnabled, sceneObj)
    Custom_AgentSetProperty("light_juicemachine02", "EnvLight - Groups", envlight_groups, sceneObj)
    Custom_AgentSetProperty("light_juicemachine02", "EnvLight - Shadow Type", envlight_shadowtype, sceneObj)
    Custom_AgentSetProperty("light_juicemachine02", "EnvLight - Shadow Quality", envlight_shadowquality, sceneObj)
    Custom_AgentSetProperty("light_juicemachine02", "EnvLight - HBAO Participation Type", envlight_hbaoParticipation, sceneObj)
    
    local light6 = AgentCreate("light_juicemachine03", envlight_prop, Vector(-3.613292,2.316584,5.093388), Vector(169.451767,0.000000,0.000000), sceneObj, false, false)
    Custom_AgentSetProperty("light_juicemachine03", "EnvLight - Type", 1, sceneObj)
    Custom_AgentSetProperty("light_juicemachine03", "EnvLight - Intensity", 1, sceneObj)
    Custom_AgentSetProperty("light_juicemachine03", "EnvLight - Radius", 5, sceneObj)
    Custom_AgentSetProperty("light_juicemachine03", "EnvLight - Distance Falloff", 2, sceneObj)
    Custom_AgentSetProperty("light_juicemachine03", "EnvLight - Spot Angle Inner", 5, sceneObj)
    Custom_AgentSetProperty("light_juicemachine03", "EnvLight - Spot Angle Outer", 160, sceneObj)
    Custom_AgentSetProperty("light_juicemachine03", "EnvLight - Color", Color(0.93725502490997, 1, 0.70196098089218, 1), sceneObj)
    Custom_AgentSetProperty("light_juicemachine03", "EnvLight - Enabled Group", envlight_groupEnabled, sceneObj)
    Custom_AgentSetProperty("light_juicemachine03", "EnvLight - Groups", envlight_groups, sceneObj)
    Custom_AgentSetProperty("light_juicemachine03", "EnvLight - Shadow Type", envlight_shadowtype, sceneObj)
    Custom_AgentSetProperty("light_juicemachine03", "EnvLight - Shadow Quality", envlight_shadowquality, sceneObj)
    Custom_AgentSetProperty("light_juicemachine03", "EnvLight - HBAO Participation Type", envlight_hbaoParticipation, sceneObj)
    
    local light7 = AgentCreate("light_juicemachine04", envlight_prop, Vector(-5.115184,2.316584,5.093388), Vector(169.451767,0.000000,0.000000), sceneObj, false, false)
    Custom_AgentSetProperty("light_juicemachine04", "EnvLight - Type", 1, sceneObj)
    Custom_AgentSetProperty("light_juicemachine04", "EnvLight - Intensity", 1, sceneObj)
    Custom_AgentSetProperty("light_juicemachine04", "EnvLight - Radius", 5, sceneObj)
    Custom_AgentSetProperty("light_juicemachine04", "EnvLight - Distance Falloff", 2, sceneObj)
    Custom_AgentSetProperty("light_juicemachine04", "EnvLight - Spot Angle Inner", 5, sceneObj)
    Custom_AgentSetProperty("light_juicemachine04", "EnvLight - Spot Angle Outer", 160, sceneObj)
    Custom_AgentSetProperty("light_juicemachine04", "EnvLight - Color", Color(0.93725502490997, 1, 0.70196098089218, 1), sceneObj)
    Custom_AgentSetProperty("light_juicemachine04", "EnvLight - Enabled Group", envlight_groupEnabled, sceneObj)
    Custom_AgentSetProperty("light_juicemachine04", "EnvLight - Groups", envlight_groups, sceneObj)
    Custom_AgentSetProperty("light_juicemachine04", "EnvLight - Shadow Type", envlight_shadowtype, sceneObj)
    Custom_AgentSetProperty("light_juicemachine04", "EnvLight - Shadow Quality", envlight_shadowquality, sceneObj)
    Custom_AgentSetProperty("light_juicemachine04", "EnvLight - HBAO Participation Type", envlight_hbaoParticipation, sceneObj)
    
    local light8 = AgentCreate("light_juicemachine05", envlight_prop, Vector(-5.510325,2.329066,5.159794), Vector(49.313824,0.000000,0.000000), sceneObj, false, false)
    Custom_AgentSetProperty("light_juicemachine05", "EnvLight - Type", 1, sceneObj)
    Custom_AgentSetProperty("light_juicemachine05", "EnvLight - Intensity", 1, sceneObj)
    Custom_AgentSetProperty("light_juicemachine05", "EnvLight - Radius", 5, sceneObj)
    Custom_AgentSetProperty("light_juicemachine05", "EnvLight - Distance Falloff", 8, sceneObj)
    Custom_AgentSetProperty("light_juicemachine05", "EnvLight - Spot Angle Inner", 5, sceneObj)
    Custom_AgentSetProperty("light_juicemachine05", "EnvLight - Spot Angle Outer", 120, sceneObj)
    Custom_AgentSetProperty("light_juicemachine05", "EnvLight - Color", Color(0.93725502490997, 1, 0.70196098089218, 1), sceneObj)
    Custom_AgentSetProperty("light_juicemachine05", "EnvLight - Enabled Group", envlight_groupEnabled, sceneObj)
    Custom_AgentSetProperty("light_juicemachine05", "EnvLight - Groups", envlight_groups, sceneObj)
    Custom_AgentSetProperty("light_juicemachine05", "EnvLight - Shadow Type", envlight_shadowtype, sceneObj)
    Custom_AgentSetProperty("light_juicemachine05", "EnvLight - Shadow Quality", envlight_shadowquality, sceneObj)
    Custom_AgentSetProperty("light_juicemachine05", "EnvLight - HBAO Participation Type", envlight_hbaoParticipation, sceneObj)
    
    local light9 = AgentCreate("light_juicemachine06", envlight_prop, Vector(-3.217357,2.329066,5.159794), Vector(49.313824,0.000000,0.000000), sceneObj, false, false)
    Custom_AgentSetProperty("light_juicemachine06", "EnvLight - Type", 1, sceneObj)
    Custom_AgentSetProperty("light_juicemachine06", "EnvLight - Intensity", 2.4, sceneObj)
    Custom_AgentSetProperty("light_juicemachine06", "EnvLight - Radius", 5, sceneObj)
    Custom_AgentSetProperty("light_juicemachine06", "EnvLight - Distance Falloff", 8, sceneObj)
    Custom_AgentSetProperty("light_juicemachine06", "EnvLight - Spot Angle Inner", 62.950000762939, sceneObj)
    Custom_AgentSetProperty("light_juicemachine06", "EnvLight - Spot Angle Outer", 120, sceneObj)
    Custom_AgentSetProperty("light_juicemachine06", "EnvLight - Color", Color(0.93725502490997, 1, 0.70196098089218, 1), sceneObj)
    Custom_AgentSetProperty("light_juicemachine06", "EnvLight - Enabled Group", envlight_groupEnabled, sceneObj)
    Custom_AgentSetProperty("light_juicemachine06", "EnvLight - Groups", envlight_groups, sceneObj)
    Custom_AgentSetProperty("light_juicemachine06", "EnvLight - Shadow Type", envlight_shadowtype, sceneObj)
    Custom_AgentSetProperty("light_juicemachine06", "EnvLight - Shadow Quality", envlight_shadowquality, sceneObj)
    Custom_AgentSetProperty("light_juicemachine06", "EnvLight - HBAO Participation Type", envlight_hbaoParticipation, sceneObj)
    
    local light10 = AgentCreate("light_juicemachine07", envlight_prop, Vector(-4.008433,2.329066,5.159794), Vector(49.313824,0.000000,0.000000), sceneObj, false, false)
    Custom_AgentSetProperty("light_juicemachine07", "EnvLight - Type", 1, sceneObj)
    Custom_AgentSetProperty("light_juicemachine07", "EnvLight - Intensity", 1, sceneObj)
    Custom_AgentSetProperty("light_juicemachine07", "EnvLight - Radius", 5, sceneObj)
    Custom_AgentSetProperty("light_juicemachine07", "EnvLight - Distance Falloff", 8, sceneObj)
    Custom_AgentSetProperty("light_juicemachine07", "EnvLight - Spot Angle Inner", 5, sceneObj)
    Custom_AgentSetProperty("light_juicemachine07", "EnvLight - Spot Angle Outer", 120, sceneObj)
    Custom_AgentSetProperty("light_juicemachine07", "EnvLight - Color", Color(0.93725502490997, 1, 0.70196098089218, 1), sceneObj)
    Custom_AgentSetProperty("light_juicemachine07", "EnvLight - Enabled Group", envlight_groupEnabled, sceneObj)
    Custom_AgentSetProperty("light_juicemachine07", "EnvLight - Groups", envlight_groups, sceneObj)
    Custom_AgentSetProperty("light_juicemachine07", "EnvLight - Shadow Type", envlight_shadowtype, sceneObj)
    Custom_AgentSetProperty("light_juicemachine07", "EnvLight - Shadow Quality", envlight_shadowquality, sceneObj)
    Custom_AgentSetProperty("light_juicemachine07", "EnvLight - HBAO Participation Type", envlight_hbaoParticipation, sceneObj)
    
    local light11 = AgentCreate("light_juicemachine08", envlight_prop, Vector(-4.755321,2.329066,5.159794), Vector(49.313824,0.000000,0.000000), sceneObj, false, false)
    Custom_AgentSetProperty("light_juicemachine08", "EnvLight - Type", 1, sceneObj)
    Custom_AgentSetProperty("light_juicemachine08", "EnvLight - Intensity", 1, sceneObj)
    Custom_AgentSetProperty("light_juicemachine08", "EnvLight - Radius", 5, sceneObj)
    Custom_AgentSetProperty("light_juicemachine08", "EnvLight - Distance Falloff", 8, sceneObj)
    Custom_AgentSetProperty("light_juicemachine08", "EnvLight - Spot Angle Inner", 5, sceneObj)
    Custom_AgentSetProperty("light_juicemachine08", "EnvLight - Spot Angle Outer", 120, sceneObj)
    Custom_AgentSetProperty("light_juicemachine08", "EnvLight - Color", Color(0.93725502490997, 1, 0.70196098089218, 1), sceneObj)
    Custom_AgentSetProperty("light_juicemachine08", "EnvLight - Enabled Group", envlight_groupEnabled, sceneObj)
    Custom_AgentSetProperty("light_juicemachine08", "EnvLight - Groups", envlight_groups, sceneObj)
    Custom_AgentSetProperty("light_juicemachine08", "EnvLight - Shadow Type", envlight_shadowtype, sceneObj)
    Custom_AgentSetProperty("light_juicemachine08", "EnvLight - Shadow Quality", envlight_shadowquality, sceneObj)
    Custom_AgentSetProperty("light_juicemachine08", "EnvLight - HBAO Participation Type", envlight_hbaoParticipation, sceneObj)
    
    local light12 = AgentCreate("light_juicemachine09", envlight_prop, Vector(-5.135570,2.329066,5.159794), Vector(49.313824,0.000000,0.000000), sceneObj, false, false)
    Custom_AgentSetProperty("light_juicemachine09", "EnvLight - Type", 1, sceneObj)
    Custom_AgentSetProperty("light_juicemachine09", "EnvLight - Intensity", 1, sceneObj)
    Custom_AgentSetProperty("light_juicemachine09", "EnvLight - Radius", 5, sceneObj)
    Custom_AgentSetProperty("light_juicemachine09", "EnvLight - Distance Falloff", 8, sceneObj)
    Custom_AgentSetProperty("light_juicemachine09", "EnvLight - Spot Angle Inner", 5, sceneObj)
    Custom_AgentSetProperty("light_juicemachine09", "EnvLight - Spot Angle Outer", 120, sceneObj)
    Custom_AgentSetProperty("light_juicemachine09", "EnvLight - Color", Color(0.93725502490997, 1, 0.70196098089218, 1), sceneObj)
    Custom_AgentSetProperty("light_juicemachine09", "EnvLight - Enabled Group", envlight_groupEnabled, sceneObj)
    Custom_AgentSetProperty("light_juicemachine09", "EnvLight - Groups", envlight_groups, sceneObj)
    Custom_AgentSetProperty("light_juicemachine09", "EnvLight - Shadow Type", envlight_shadowtype, sceneObj)
    Custom_AgentSetProperty("light_juicemachine09", "EnvLight - Shadow Quality", envlight_shadowquality, sceneObj)
    Custom_AgentSetProperty("light_juicemachine09", "EnvLight - HBAO Participation Type", envlight_hbaoParticipation, sceneObj)
    
    local light13 = AgentCreate("light_juicemachine10", envlight_prop, Vector(-5.890574,2.329066,5.159794), Vector(49.313824,0.000000,0.000000), sceneObj, false, false)
    Custom_AgentSetProperty("light_juicemachine10", "EnvLight - Type", 1, sceneObj)
    Custom_AgentSetProperty("light_juicemachine10", "EnvLight - Intensity", 2.4, sceneObj)
    Custom_AgentSetProperty("light_juicemachine10", "EnvLight - Radius", 5, sceneObj)
    Custom_AgentSetProperty("light_juicemachine10", "EnvLight - Distance Falloff", 8, sceneObj)
    Custom_AgentSetProperty("light_juicemachine10", "EnvLight - Spot Angle Inner", 62.950000762939, sceneObj)
    Custom_AgentSetProperty("light_juicemachine10", "EnvLight - Spot Angle Outer", 120, sceneObj)
    Custom_AgentSetProperty("light_juicemachine10", "EnvLight - Color", Color(0.93725502490997, 1, 0.70196098089218, 1), sceneObj)
    Custom_AgentSetProperty("light_juicemachine10", "EnvLight - Enabled Group", envlight_groupEnabled, sceneObj)
    Custom_AgentSetProperty("light_juicemachine10", "EnvLight - Groups", envlight_groups, sceneObj)
    Custom_AgentSetProperty("light_juicemachine10", "EnvLight - Shadow Type", envlight_shadowtype, sceneObj)
    Custom_AgentSetProperty("light_juicemachine10", "EnvLight - Shadow Quality", envlight_shadowquality, sceneObj)
    Custom_AgentSetProperty("light_juicemachine10", "EnvLight - HBAO Participation Type", envlight_hbaoParticipation, sceneObj)
    
    local light14 = AgentCreate("light_juicemachine11", envlight_prop, Vector(-4.388682,2.329066,5.159794), Vector(49.313824,0.000000,0.000000), sceneObj, false, false)
    Custom_AgentSetProperty("light_juicemachine11", "EnvLight - Type", 1, sceneObj)
    Custom_AgentSetProperty("light_juicemachine11", "EnvLight - Intensity", 2.4, sceneObj)
    Custom_AgentSetProperty("light_juicemachine11", "EnvLight - Radius", 5, sceneObj)
    Custom_AgentSetProperty("light_juicemachine11", "EnvLight - Distance Falloff", 8, sceneObj)
    Custom_AgentSetProperty("light_juicemachine11", "EnvLight - Spot Angle Inner", 62.950000762939, sceneObj)
    Custom_AgentSetProperty("light_juicemachine11", "EnvLight - Spot Angle Outer", 120, sceneObj)
    Custom_AgentSetProperty("light_juicemachine11", "EnvLight - Color", Color(0.93725502490997, 1, 0.70196098089218, 1), sceneObj)
    Custom_AgentSetProperty("light_juicemachine11", "EnvLight - Enabled Group", envlight_groupEnabled, sceneObj)
    Custom_AgentSetProperty("light_juicemachine11", "EnvLight - Groups", envlight_groups, sceneObj)
    Custom_AgentSetProperty("light_juicemachine11", "EnvLight - Shadow Type", envlight_shadowtype, sceneObj)
    Custom_AgentSetProperty("light_juicemachine11", "EnvLight - Shadow Quality", envlight_shadowquality, sceneObj)
    Custom_AgentSetProperty("light_juicemachine11", "EnvLight - HBAO Participation Type", envlight_hbaoParticipation, sceneObj)
    
    local light15 = AgentCreate("light_juicemachine12", envlight_prop, Vector(-3.597606,2.329066,5.159794), Vector(49.313824,0.000000,0.000000), sceneObj, false, false)
    Custom_AgentSetProperty("light_juicemachine12", "EnvLight - Type", 1, sceneObj)
    Custom_AgentSetProperty("light_juicemachine12", "EnvLight - Intensity", 1, sceneObj)
    Custom_AgentSetProperty("light_juicemachine12", "EnvLight - Radius", 5, sceneObj)
    Custom_AgentSetProperty("light_juicemachine12", "EnvLight - Distance Falloff", 8, sceneObj)
    Custom_AgentSetProperty("light_juicemachine12", "EnvLight - Spot Angle Inner", 5, sceneObj)
    Custom_AgentSetProperty("light_juicemachine12", "EnvLight - Spot Angle Outer", 120, sceneObj)
    Custom_AgentSetProperty("light_juicemachine12", "EnvLight - Color", Color(0.93725502490997, 1, 0.70196098089218, 1), sceneObj)
    Custom_AgentSetProperty("light_juicemachine12", "EnvLight - Enabled Group", envlight_groupEnabled, sceneObj)
    Custom_AgentSetProperty("light_juicemachine12", "EnvLight - Groups", envlight_groups, sceneObj)
    Custom_AgentSetProperty("light_juicemachine12", "EnvLight - Shadow Type", envlight_shadowtype, sceneObj)
    Custom_AgentSetProperty("light_juicemachine12", "EnvLight - Shadow Quality", envlight_shadowquality, sceneObj)
    Custom_AgentSetProperty("light_juicemachine12", "EnvLight - HBAO Participation Type", envlight_hbaoParticipation, sceneObj)
    
    local light16 = AgentCreate("light_atm", envlight_prop, Vector(5.435517,1.403774,-2.659433), Vector(-178.534744,11.990791,0.311271), sceneObj, false, false)
    Custom_AgentSetProperty("light_atm", "EnvLight - Type", 1, sceneObj)
    Custom_AgentSetProperty("light_atm", "EnvLight - Intensity", 3, sceneObj)
    Custom_AgentSetProperty("light_atm", "EnvLight - Radius", 5, sceneObj)
    Custom_AgentSetProperty("light_atm", "EnvLight - Distance Falloff", 3.35, sceneObj)
    Custom_AgentSetProperty("light_atm", "EnvLight - Spot Angle Inner", 85, sceneObj)
    Custom_AgentSetProperty("light_atm", "EnvLight - Spot Angle Outer", 125, sceneObj)
    Custom_AgentSetProperty("light_atm", "EnvLight - Color", Color(0.56078398227692, 0.78823500871658, 1, 1), sceneObj)
    Custom_AgentSetProperty("light_atm", "EnvLight - Enabled Group", envlight_groupEnabled, sceneObj)
    Custom_AgentSetProperty("light_atm", "EnvLight - Groups", envlight_groups, sceneObj)
    Custom_AgentSetProperty("light_atm", "EnvLight - Shadow Type", envlight_shadowtype, sceneObj)
    Custom_AgentSetProperty("light_atm", "EnvLight - Shadow Quality", envlight_shadowquality, sceneObj)
    Custom_AgentSetProperty("light_atm", "EnvLight - HBAO Participation Type", envlight_hbaoParticipation, sceneObj)
    
    local light17 = AgentCreate("light_exit_red", envlight_prop, Vector(-3.550529,2.711920,-2.646201), Vector(0.000000,0.000000,0.000000), sceneObj, false, false)
    Custom_AgentSetProperty("light_exit_red", "EnvLight - Type", 0, sceneObj)
    Custom_AgentSetProperty("light_exit_red", "EnvLight - Intensity", 3, sceneObj)
    Custom_AgentSetProperty("light_exit_red", "EnvLight - Radius", 8, sceneObj)
    Custom_AgentSetProperty("light_exit_red", "EnvLight - Distance Falloff", 1.8, sceneObj)
    Custom_AgentSetProperty("light_exit_red", "EnvLight - Spot Angle Inner", 5, sceneObj)
    Custom_AgentSetProperty("light_exit_red", "EnvLight - Spot Angle Outer", 45, sceneObj)
    Custom_AgentSetProperty("light_exit_red", "EnvLight - Color", Color(0.38823500275612, 0.066666997969151, 0.066666997969151, 1), sceneObj)
    Custom_AgentSetProperty("light_exit_red", "EnvLight - Enabled Group", envlight_groupEnabled, sceneObj)
    Custom_AgentSetProperty("light_exit_red", "EnvLight - Groups", envlight_groups, sceneObj)
    Custom_AgentSetProperty("light_exit_red", "EnvLight - Shadow Type", envlight_shadowtype, sceneObj)
    Custom_AgentSetProperty("light_exit_red", "EnvLight - Shadow Quality", envlight_shadowquality, sceneObj)
    Custom_AgentSetProperty("light_exit_red", "EnvLight - HBAO Participation Type", envlight_hbaoParticipation, sceneObj)
    
    local light18 = AgentCreate("light_fridge", envlight_prop, Vector(0.502013,1.862627,5.112618), Vector(75.988579,0.000000,0.000000), sceneObj, false, false)
    Custom_AgentSetProperty("light_fridge", "EnvLight - Type", 1, sceneObj)
    Custom_AgentSetProperty("light_fridge", "EnvLight - Intensity", 1.15, sceneObj)
    Custom_AgentSetProperty("light_fridge", "EnvLight - Radius", 2.5, sceneObj)
    Custom_AgentSetProperty("light_fridge", "EnvLight - Distance Falloff", 2, sceneObj)
    Custom_AgentSetProperty("light_fridge", "EnvLight - Spot Angle Inner", 5, sceneObj)
    Custom_AgentSetProperty("light_fridge", "EnvLight - Spot Angle Outer", 156, sceneObj)
    Custom_AgentSetProperty("light_fridge", "EnvLight - Color", Color(0.61568599939346, 0.9137259721756, 1, 1), sceneObj)
    Custom_AgentSetProperty("light_fridge", "EnvLight - Enabled Group", envlight_groupEnabled, sceneObj)
    Custom_AgentSetProperty("light_fridge", "EnvLight - Groups", envlight_groups, sceneObj)
    Custom_AgentSetProperty("light_fridge", "EnvLight - Shadow Type", envlight_shadowtype, sceneObj)
    Custom_AgentSetProperty("light_fridge", "EnvLight - Shadow Quality", envlight_shadowquality, sceneObj)
    Custom_AgentSetProperty("light_fridge", "EnvLight - HBAO Participation Type", envlight_hbaoParticipation, sceneObj)
    
    local light19 = AgentCreate("light_fridge01", envlight_prop, Vector(-0.132691,2.077664,5.051461), Vector(-179.999985,-0.000000,0.000000), sceneObj, false, false)
    Custom_AgentSetProperty("light_fridge01", "EnvLight - Type", 1, sceneObj)
    Custom_AgentSetProperty("light_fridge01", "EnvLight - Intensity", 1, sceneObj)
    Custom_AgentSetProperty("light_fridge01", "EnvLight - Radius", 5, sceneObj)
    Custom_AgentSetProperty("light_fridge01", "EnvLight - Distance Falloff", 4, sceneObj)
    Custom_AgentSetProperty("light_fridge01", "EnvLight - Spot Angle Inner", 5, sceneObj)
    Custom_AgentSetProperty("light_fridge01", "EnvLight - Spot Angle Outer", 120, sceneObj)
    Custom_AgentSetProperty("light_fridge01", "EnvLight - Color", Color(0.61568599939346, 0.9137259721756, 1, 1), sceneObj)
    Custom_AgentSetProperty("light_fridge01", "EnvLight - Enabled Group", envlight_groupEnabled, sceneObj)
    Custom_AgentSetProperty("light_fridge01", "EnvLight - Groups", envlight_groups, sceneObj)
    Custom_AgentSetProperty("light_fridge01", "EnvLight - Shadow Type", envlight_shadowtype, sceneObj)
    Custom_AgentSetProperty("light_fridge01", "EnvLight - Shadow Quality", envlight_shadowquality, sceneObj)
    Custom_AgentSetProperty("light_fridge01", "EnvLight - HBAO Participation Type", envlight_hbaoParticipation, sceneObj)
    
    local light20 = AgentCreate("light_fridge02", envlight_prop, Vector(1.122131,2.077664,5.051461), Vector(-179.999985,-0.000000,0.000000), sceneObj, false, false)
    Custom_AgentSetProperty("light_fridge02", "EnvLight - Type", 1, sceneObj)
    Custom_AgentSetProperty("light_fridge02", "EnvLight - Intensity", 1, sceneObj)
    Custom_AgentSetProperty("light_fridge02", "EnvLight - Radius", 5, sceneObj)
    Custom_AgentSetProperty("light_fridge02", "EnvLight - Distance Falloff", 5, sceneObj)
    Custom_AgentSetProperty("light_fridge02", "EnvLight - Spot Angle Inner", 5, sceneObj)
    Custom_AgentSetProperty("light_fridge02", "EnvLight - Spot Angle Outer", 120, sceneObj)
    Custom_AgentSetProperty("light_fridge02", "EnvLight - Color", Color(0.61568599939346, 0.9137259721756, 1, 1), sceneObj)
    Custom_AgentSetProperty("light_fridge02", "EnvLight - Enabled Group", envlight_groupEnabled, sceneObj)
    Custom_AgentSetProperty("light_fridge02", "EnvLight - Groups", envlight_groups, sceneObj)
    Custom_AgentSetProperty("light_fridge02", "EnvLight - Shadow Type", envlight_shadowtype, sceneObj)
    Custom_AgentSetProperty("light_fridge02", "EnvLight - Shadow Quality", envlight_shadowquality, sceneObj)
    Custom_AgentSetProperty("light_fridge02", "EnvLight - HBAO Participation Type", envlight_hbaoParticipation, sceneObj)
    
    local light21 = AgentCreate("light_fridge03", envlight_prop, Vector(0.461059,2.077664,5.051461), Vector(-179.999985,-0.000000,0.000000), sceneObj, false, false)
    Custom_AgentSetProperty("light_fridge03", "EnvLight - Type", 1, sceneObj)
    Custom_AgentSetProperty("light_fridge03", "EnvLight - Intensity", 1, sceneObj)
    Custom_AgentSetProperty("light_fridge03", "EnvLight - Radius", 5, sceneObj)
    Custom_AgentSetProperty("light_fridge03", "EnvLight - Distance Falloff", 8, sceneObj)
    Custom_AgentSetProperty("light_fridge03", "EnvLight - Spot Angle Inner", 5, sceneObj)
    Custom_AgentSetProperty("light_fridge03", "EnvLight - Spot Angle Outer", 120, sceneObj)
    Custom_AgentSetProperty("light_fridge03", "EnvLight - Color", Color(0.61568599939346, 0.9137259721756, 1, 1), sceneObj)
    Custom_AgentSetProperty("light_fridge03", "EnvLight - Enabled Group", envlight_groupEnabled, sceneObj)
    Custom_AgentSetProperty("light_fridge03", "EnvLight - Groups", envlight_groups, sceneObj)
    Custom_AgentSetProperty("light_fridge03", "EnvLight - Shadow Type", envlight_shadowtype, sceneObj)
    Custom_AgentSetProperty("light_fridge03", "EnvLight - Shadow Quality", envlight_shadowquality, sceneObj)
    Custom_AgentSetProperty("light_fridge03", "EnvLight - HBAO Participation Type", envlight_hbaoParticipation, sceneObj)
    
    local light22 = AgentCreate("light_office", envlight_prop, Vector(7.222539,3.065466,4.209622), Vector(32.245842,-90.000000,0.000000), sceneObj, false, false)
    Custom_AgentSetProperty("light_office", "EnvLight - Type", 1, sceneObj)
    Custom_AgentSetProperty("light_office", "EnvLight - Intensity", 4.35, sceneObj)
    Custom_AgentSetProperty("light_office", "EnvLight - Radius", 8.85, sceneObj)
    Custom_AgentSetProperty("light_office", "EnvLight - Distance Falloff", 1, sceneObj)
    Custom_AgentSetProperty("light_office", "EnvLight - Spot Angle Inner", 5, sceneObj)
    Custom_AgentSetProperty("light_office", "EnvLight - Spot Angle Outer", 35, sceneObj)
    Custom_AgentSetProperty("light_office", "EnvLight - Color", Color(0.78039199113846, 1, 0.60000002384186, 1), sceneObj)
    Custom_AgentSetProperty("light_office", "EnvLight - Enabled Group", envlight_groupEnabled, sceneObj)
    Custom_AgentSetProperty("light_office", "EnvLight - Groups", envlight_groups, sceneObj)
    Custom_AgentSetProperty("light_office", "EnvLight - Shadow Type", envlight_shadowtype, sceneObj)
    Custom_AgentSetProperty("light_office", "EnvLight - Shadow Quality", envlight_shadowquality, sceneObj)
    Custom_AgentSetProperty("light_office", "EnvLight - HBAO Participation Type", envlight_hbaoParticipation, sceneObj)
    
    local light23 = AgentCreate("light_office01", envlight_prop, Vector(7.024538,3.271215,1.280118), Vector(43.902493,-90.000000,0.000000), sceneObj, false, false)
    Custom_AgentSetProperty("light_office01", "EnvLight - Type", 1, sceneObj)
    Custom_AgentSetProperty("light_office01", "EnvLight - Intensity", 1, sceneObj)
    Custom_AgentSetProperty("light_office01", "EnvLight - Radius", 6.55, sceneObj)
    Custom_AgentSetProperty("light_office01", "EnvLight - Distance Falloff", 2, sceneObj)
    Custom_AgentSetProperty("light_office01", "EnvLight - Spot Angle Inner", 5, sceneObj)
    Custom_AgentSetProperty("light_office01", "EnvLight - Spot Angle Outer", 120, sceneObj)
    Custom_AgentSetProperty("light_office01", "EnvLight - Color", Color(0.81176501512527, 1, 0.59607797861099, 1), sceneObj)
    Custom_AgentSetProperty("light_office01", "EnvLight - Enabled Group", envlight_groupEnabled, sceneObj)
    Custom_AgentSetProperty("light_office01", "EnvLight - Groups", envlight_groups, sceneObj)
    Custom_AgentSetProperty("light_office01", "EnvLight - Shadow Type", envlight_shadowtype, sceneObj)
    Custom_AgentSetProperty("light_office01", "EnvLight - Shadow Quality", envlight_shadowquality, sceneObj)
    Custom_AgentSetProperty("light_office01", "EnvLight - HBAO Participation Type", envlight_hbaoParticipation, sceneObj)
    
    local light24 = AgentCreate("light_office02", envlight_prop, Vector(6.301869,2.496740,-1.430942), Vector(43.902493,-90.000000,0.000000), sceneObj, false, false)
    Custom_AgentSetProperty("light_office02", "EnvLight - Type", 1, sceneObj)
    Custom_AgentSetProperty("light_office02", "EnvLight - Intensity", 9.65, sceneObj)
    Custom_AgentSetProperty("light_office02", "EnvLight - Radius", 5.45, sceneObj)
    Custom_AgentSetProperty("light_office02", "EnvLight - Distance Falloff", 2, sceneObj)
    Custom_AgentSetProperty("light_office02", "EnvLight - Spot Angle Inner", 42, sceneObj)
    Custom_AgentSetProperty("light_office02", "EnvLight - Spot Angle Outer", 61.55, sceneObj)
    Custom_AgentSetProperty("light_office02", "EnvLight - Color", Color(0.75294101238251, 1, 0.59607797861099, 1), sceneObj)
    Custom_AgentSetProperty("light_office02", "EnvLight - Enabled Group", envlight_groupEnabled, sceneObj)
    Custom_AgentSetProperty("light_office02", "EnvLight - Groups", envlight_groups, sceneObj)
    Custom_AgentSetProperty("light_office02", "EnvLight - Shadow Type", envlight_shadowtype, sceneObj)
    Custom_AgentSetProperty("light_office02", "EnvLight - Shadow Quality", envlight_shadowquality, sceneObj)
    Custom_AgentSetProperty("light_office02", "EnvLight - HBAO Participation Type", envlight_hbaoParticipation, sceneObj)
    
    local light25 = AgentCreate("light_atm01", envlight_prop, Vector(5.208680,1.384592,-2.848701), Vector(-178.625153,-23.388239,-0.594734), sceneObj, false, false)
    Custom_AgentSetProperty("light_atm01", "EnvLight - Type", 1, sceneObj)
    Custom_AgentSetProperty("light_atm01", "EnvLight - Intensity", 12.65, sceneObj)
    Custom_AgentSetProperty("light_atm01", "EnvLight - Radius", 2.9, sceneObj)
    Custom_AgentSetProperty("light_atm01", "EnvLight - Distance Falloff", 4.2, sceneObj)
    Custom_AgentSetProperty("light_atm01", "EnvLight - Spot Angle Inner", 5, sceneObj)
    Custom_AgentSetProperty("light_atm01", "EnvLight - Spot Angle Outer", 125, sceneObj)
    Custom_AgentSetProperty("light_atm01", "EnvLight - Color", Color(0.33333298563957, 0.65490198135376, 1, 1), sceneObj)
    Custom_AgentSetProperty("light_atm01", "EnvLight - Enabled Group", envlight_groupEnabled, sceneObj)
    Custom_AgentSetProperty("light_atm01", "EnvLight - Groups", envlight_groups, sceneObj)
    Custom_AgentSetProperty("light_atm01", "EnvLight - Shadow Type", envlight_shadowtype, sceneObj)
    Custom_AgentSetProperty("light_atm01", "EnvLight - Shadow Quality", envlight_shadowquality, sceneObj)
    Custom_AgentSetProperty("light_atm01", "EnvLight - HBAO Participation Type", envlight_hbaoParticipation, sceneObj)
    
    local light26 = AgentCreate("light_lamp02", envlight_prop, Vector(-0.935984,1.765518,-1.774921), Vector(177.826828,0.000000,0.000000), sceneObj, false, false)
    Custom_AgentSetProperty("light_lamp02", "EnvLight - Type", 1, sceneObj)
    Custom_AgentSetProperty("light_lamp02", "EnvLight - Intensity", 0.35, sceneObj)
    Custom_AgentSetProperty("light_lamp02", "EnvLight - Radius", 5.5, sceneObj)
    Custom_AgentSetProperty("light_lamp02", "EnvLight - Distance Falloff", 2, sceneObj)
    Custom_AgentSetProperty("light_lamp02", "EnvLight - Spot Angle Inner", 5, sceneObj)
    Custom_AgentSetProperty("light_lamp02", "EnvLight - Spot Angle Outer", 73, sceneObj)
    Custom_AgentSetProperty("light_lamp02", "EnvLight - Color", Color(1, 1, 1, 1), sceneObj)
    Custom_AgentSetProperty("light_lamp02", "EnvLight - Enabled Group", envlight_groupEnabled, sceneObj)
    Custom_AgentSetProperty("light_lamp02", "EnvLight - Groups", envlight_groups, sceneObj)
    Custom_AgentSetProperty("light_lamp02", "EnvLight - Shadow Type", envlight_shadowtype, sceneObj)
    Custom_AgentSetProperty("light_lamp02", "EnvLight - Shadow Quality", envlight_shadowquality, sceneObj)
    Custom_AgentSetProperty("light_lamp02", "EnvLight - HBAO Participation Type", envlight_hbaoParticipation, sceneObj)
    
    local light27 = AgentCreate("light_lamp03", envlight_prop, Vector(0.012210,1.786901,-1.349436), Vector(177.891586,-14.018348,0.526648), sceneObj, false, false)
    Custom_AgentSetProperty("light_lamp03", "EnvLight - Type", 1, sceneObj)
    Custom_AgentSetProperty("light_lamp03", "EnvLight - Intensity", 0.15, sceneObj)
    Custom_AgentSetProperty("light_lamp03", "EnvLight - Radius", 6.85, sceneObj)
    Custom_AgentSetProperty("light_lamp03", "EnvLight - Distance Falloff", 2, sceneObj)
    Custom_AgentSetProperty("light_lamp03", "EnvLight - Spot Angle Inner", 5, sceneObj)
    Custom_AgentSetProperty("light_lamp03", "EnvLight - Spot Angle Outer", 73, sceneObj)
    Custom_AgentSetProperty("light_lamp03", "EnvLight - Color", Color(1, 1, 1, 1), sceneObj)
    Custom_AgentSetProperty("light_lamp03", "EnvLight - Enabled Group", envlight_groupEnabled, sceneObj)
    Custom_AgentSetProperty("light_lamp03", "EnvLight - Groups", envlight_groups, sceneObj)
    Custom_AgentSetProperty("light_lamp03", "EnvLight - Shadow Type", envlight_shadowtype, sceneObj)
    Custom_AgentSetProperty("light_lamp03", "EnvLight - Shadow Quality", envlight_shadowquality, sceneObj)
    Custom_AgentSetProperty("light_lamp03", "EnvLight - HBAO Participation Type", envlight_hbaoParticipation, sceneObj)
    
    local light28 = AgentCreate("light_lamp04", envlight_prop, Vector(0.649085,1.513927,-1.568927), Vector(90.000000,0.000000,0.000000), sceneObj, false, false)
    Custom_AgentSetProperty("light_lamp04", "EnvLight - Type", 0, sceneObj)
    Custom_AgentSetProperty("light_lamp04", "EnvLight - Intensity", 2.55, sceneObj)
    Custom_AgentSetProperty("light_lamp04", "EnvLight - Radius", 0.75, sceneObj)
    Custom_AgentSetProperty("light_lamp04", "EnvLight - Distance Falloff", 2, sceneObj)
    Custom_AgentSetProperty("light_lamp04", "EnvLight - Spot Angle Inner", 5, sceneObj)
    Custom_AgentSetProperty("light_lamp04", "EnvLight - Spot Angle Outer", 145, sceneObj)
    Custom_AgentSetProperty("light_lamp04", "EnvLight - Color", Color(1, 1, 1, 1), sceneObj)
    Custom_AgentSetProperty("light_lamp04", "EnvLight - Enabled Group", envlight_groupEnabled, sceneObj)
    Custom_AgentSetProperty("light_lamp04", "EnvLight - Groups", envlight_groups, sceneObj)
    Custom_AgentSetProperty("light_lamp04", "EnvLight - Shadow Type", envlight_shadowtype, sceneObj)
    Custom_AgentSetProperty("light_lamp04", "EnvLight - Shadow Quality", envlight_shadowquality, sceneObj)
    Custom_AgentSetProperty("light_lamp04", "EnvLight - HBAO Participation Type", envlight_hbaoParticipation, sceneObj)
    
    local light29 = AgentCreate("light_office05", envlight_prop, Vector(8.438405,1.559179,2.700533), Vector(43.902493,-90.000000,0.000000), sceneObj, false, false)
    Custom_AgentSetProperty("light_office05", "EnvLight - Type", 0, sceneObj)
    Custom_AgentSetProperty("light_office05", "EnvLight - Intensity", 1.05, sceneObj)
    Custom_AgentSetProperty("light_office05", "EnvLight - Radius", 4.65, sceneObj)
    Custom_AgentSetProperty("light_office05", "EnvLight - Distance Falloff", 2, sceneObj)
    Custom_AgentSetProperty("light_office05", "EnvLight - Spot Angle Inner", 5, sceneObj)
    Custom_AgentSetProperty("light_office05", "EnvLight - Spot Angle Outer", 45, sceneObj)
    Custom_AgentSetProperty("light_office05", "EnvLight - Color", Color(0.7921569943428, 1, 0.54901999235153, 1), sceneObj)
    Custom_AgentSetProperty("light_office05", "EnvLight - Enabled Group", envlight_groupEnabled, sceneObj)
    Custom_AgentSetProperty("light_office05", "EnvLight - Groups", envlight_groups, sceneObj)
    Custom_AgentSetProperty("light_office05", "EnvLight - Shadow Type", envlight_shadowtype, sceneObj)
    Custom_AgentSetProperty("light_office05", "EnvLight - Shadow Quality", envlight_shadowquality, sceneObj)
    Custom_AgentSetProperty("light_office05", "EnvLight - HBAO Participation Type", envlight_hbaoParticipation, sceneObj)
    
    local light30 = AgentCreate("light_office06", envlight_prop, Vector(8.485707,1.604467,-1.311186), Vector(28.585510,-90.000000,0.000000), sceneObj, false, false)
    Custom_AgentSetProperty("light_office06", "EnvLight - Type", 0, sceneObj)
    Custom_AgentSetProperty("light_office06", "EnvLight - Intensity", 2.3, sceneObj)
    Custom_AgentSetProperty("light_office06", "EnvLight - Radius", 4.65, sceneObj)
    Custom_AgentSetProperty("light_office06", "EnvLight - Distance Falloff", 2, sceneObj)
    Custom_AgentSetProperty("light_office06", "EnvLight - Spot Angle Inner", 5, sceneObj)
    Custom_AgentSetProperty("light_office06", "EnvLight - Spot Angle Outer", 45, sceneObj)
    Custom_AgentSetProperty("light_office06", "EnvLight - Color", Color(0.76078397035599, 1, 0.44705900549889, 1), sceneObj)
    Custom_AgentSetProperty("light_office06", "EnvLight - Enabled Group", envlight_groupEnabled, sceneObj)
    Custom_AgentSetProperty("light_office06", "EnvLight - Groups", envlight_groups, sceneObj)
    Custom_AgentSetProperty("light_office06", "EnvLight - Shadow Type", envlight_shadowtype, sceneObj)
    Custom_AgentSetProperty("light_office06", "EnvLight - Shadow Quality", envlight_shadowquality, sceneObj)
    Custom_AgentSetProperty("light_office06", "EnvLight - HBAO Participation Type", envlight_hbaoParticipation, sceneObj)
    
    local light31 = AgentCreate("light_office03", envlight_prop, Vector(7.024541,3.271215,5.223538), Vector(43.795681,-93.568405,-3.427944), sceneObj, false, false)
    Custom_AgentSetProperty("light_office03", "EnvLight - Type", 1, sceneObj)
    Custom_AgentSetProperty("light_office03", "EnvLight - Intensity", 6.55, sceneObj)
    Custom_AgentSetProperty("light_office03", "EnvLight - Radius", 7, sceneObj)
    Custom_AgentSetProperty("light_office03", "EnvLight - Distance Falloff", 2, sceneObj)
    Custom_AgentSetProperty("light_office03", "EnvLight - Spot Angle Inner", 5, sceneObj)
    Custom_AgentSetProperty("light_office03", "EnvLight - Spot Angle Outer", 28, sceneObj)
    Custom_AgentSetProperty("light_office03", "EnvLight - Color", Color(0.77254897356033, 1, 0.59607797861099, 1), sceneObj)
    Custom_AgentSetProperty("light_office03", "EnvLight - Enabled Group", envlight_groupEnabled, sceneObj)
    Custom_AgentSetProperty("light_office03", "EnvLight - Groups", envlight_groups, sceneObj)
    Custom_AgentSetProperty("light_office03", "EnvLight - Shadow Type", envlight_shadowtype, sceneObj)
    Custom_AgentSetProperty("light_office03", "EnvLight - Shadow Quality", envlight_shadowquality, sceneObj)
    Custom_AgentSetProperty("light_office03", "EnvLight - HBAO Participation Type", envlight_hbaoParticipation, sceneObj)
    
    local light32 = AgentCreate("light_office04", envlight_prop, Vector(4.293126,3.008490,1.106305), Vector(28.992195,-48.791027,32.376320), sceneObj, false, false)
    Custom_AgentSetProperty("light_office04", "EnvLight - Type", 1, sceneObj)
    Custom_AgentSetProperty("light_office04", "EnvLight - Intensity", 1, sceneObj)
    Custom_AgentSetProperty("light_office04", "EnvLight - Radius", 7, sceneObj)
    Custom_AgentSetProperty("light_office04", "EnvLight - Distance Falloff", 2, sceneObj)
    Custom_AgentSetProperty("light_office04", "EnvLight - Spot Angle Inner", 5, sceneObj)
    Custom_AgentSetProperty("light_office04", "EnvLight - Spot Angle Outer", 40, sceneObj)
    Custom_AgentSetProperty("light_office04", "EnvLight - Color", Color(1, 0.99215698242188, 0.86274498701096, 1), sceneObj)
    Custom_AgentSetProperty("light_office04", "EnvLight - Enabled Group", envlight_groupEnabled, sceneObj)
    Custom_AgentSetProperty("light_office04", "EnvLight - Groups", envlight_groups, sceneObj)
    Custom_AgentSetProperty("light_office04", "EnvLight - Shadow Type", envlight_shadowtype, sceneObj)
    Custom_AgentSetProperty("light_office04", "EnvLight - Shadow Quality", envlight_shadowquality, sceneObj)
    Custom_AgentSetProperty("light_office04", "EnvLight - HBAO Participation Type", envlight_hbaoParticipation, sceneObj)
    
    local light33 = AgentCreate("light_atm02", envlight_prop, Vector(3.923417,-0.904999,-2.429519), Vector(-120.613472,-99.871605,-1.475786), sceneObj, false, false)
    Custom_AgentSetProperty("light_atm02", "EnvLight - Type", 1, sceneObj)
    Custom_AgentSetProperty("light_atm02", "EnvLight - Intensity", 1.45, sceneObj)
    Custom_AgentSetProperty("light_atm02", "EnvLight - Radius", 6.9, sceneObj)
    Custom_AgentSetProperty("light_atm02", "EnvLight - Distance Falloff", 4, sceneObj)
    Custom_AgentSetProperty("light_atm02", "EnvLight - Spot Angle Inner", 5, sceneObj)
    Custom_AgentSetProperty("light_atm02", "EnvLight - Spot Angle Outer", 49, sceneObj)
    Custom_AgentSetProperty("light_atm02", "EnvLight - Color", Color(0.68235301971436, 0.85490202903748, 1, 1), sceneObj)
    Custom_AgentSetProperty("light_atm02", "EnvLight - Enabled Group", envlight_groupEnabled, sceneObj)
    Custom_AgentSetProperty("light_atm02", "EnvLight - Groups", envlight_groups, sceneObj)
    Custom_AgentSetProperty("light_atm02", "EnvLight - Shadow Type", envlight_shadowtype, sceneObj)
    Custom_AgentSetProperty("light_atm02", "EnvLight - Shadow Quality", envlight_shadowquality, sceneObj)
    Custom_AgentSetProperty("light_atm02", "EnvLight - HBAO Participation Type", envlight_hbaoParticipation, sceneObj)
    
    local light34 = AgentCreate("light_atm03", envlight_prop, Vector(4.196242,-0.190567,-2.578872), Vector(-142.006378,-102.274765,14.157829), sceneObj, false, false)
    Custom_AgentSetProperty("light_atm03", "EnvLight - Type", 1, sceneObj)
    Custom_AgentSetProperty("light_atm03", "EnvLight - Intensity", 0.5, sceneObj)
    Custom_AgentSetProperty("light_atm03", "EnvLight - Radius", 5.95, sceneObj)
    Custom_AgentSetProperty("light_atm03", "EnvLight - Distance Falloff", 4, sceneObj)
    Custom_AgentSetProperty("light_atm03", "EnvLight - Spot Angle Inner", 5, sceneObj)
    Custom_AgentSetProperty("light_atm03", "EnvLight - Spot Angle Outer", 49, sceneObj)
    Custom_AgentSetProperty("light_atm03", "EnvLight - Color", Color(0.68235301971436, 0.85490202903748, 1, 1), sceneObj)
    Custom_AgentSetProperty("light_atm03", "EnvLight - Enabled Group", envlight_groupEnabled, sceneObj)
    Custom_AgentSetProperty("light_atm03", "EnvLight - Groups", envlight_groups, sceneObj)
    Custom_AgentSetProperty("light_atm03", "EnvLight - Shadow Type", envlight_shadowtype, sceneObj)
    Custom_AgentSetProperty("light_atm03", "EnvLight - Shadow Quality", envlight_shadowquality, sceneObj)
    Custom_AgentSetProperty("light_atm03", "EnvLight - HBAO Participation Type", envlight_hbaoParticipation, sceneObj)
    
    local light35 = AgentCreate("light_lamp05", envlight_prop, Vector(0.307424,0.409313,0.158116), Vector(-157.809021,-0.000000,0.000000), sceneObj, false, false)
    Custom_AgentSetProperty("light_lamp05", "EnvLight - Type", 1, sceneObj)
    Custom_AgentSetProperty("light_lamp05", "EnvLight - Intensity", 0.15, sceneObj)
    Custom_AgentSetProperty("light_lamp05", "EnvLight - Radius", 5, sceneObj)
    Custom_AgentSetProperty("light_lamp05", "EnvLight - Distance Falloff", 4, sceneObj)
    Custom_AgentSetProperty("light_lamp05", "EnvLight - Spot Angle Inner", 5, sceneObj)
    Custom_AgentSetProperty("light_lamp05", "EnvLight - Spot Angle Outer", 147, sceneObj)
    Custom_AgentSetProperty("light_lamp05", "EnvLight - Color", Color(1, 1, 1, 1), sceneObj)
    Custom_AgentSetProperty("light_lamp05", "EnvLight - Enabled Group", envlight_groupEnabled, sceneObj)
    Custom_AgentSetProperty("light_lamp05", "EnvLight - Groups", envlight_groups, sceneObj)
    Custom_AgentSetProperty("light_lamp05", "EnvLight - Shadow Type", envlight_shadowtype, sceneObj)
    Custom_AgentSetProperty("light_lamp05", "EnvLight - Shadow Quality", envlight_shadowquality, sceneObj)
    Custom_AgentSetProperty("light_lamp05", "EnvLight - HBAO Participation Type", envlight_hbaoParticipation, sceneObj)
    
    local light36 = AgentCreate("light_office07", envlight_prop, Vector(5.215880,1.559347,-0.910715), Vector(-171.126236,-84.322586,0.889343), sceneObj, false, false)
    Custom_AgentSetProperty("light_office07", "EnvLight - Type", 1, sceneObj)
    Custom_AgentSetProperty("light_office07", "EnvLight - Intensity", 5.3, sceneObj)
    Custom_AgentSetProperty("light_office07", "EnvLight - Radius", 3.65, sceneObj)
    Custom_AgentSetProperty("light_office07", "EnvLight - Distance Falloff", 2, sceneObj)
    Custom_AgentSetProperty("light_office07", "EnvLight - Spot Angle Inner", 34, sceneObj)
    Custom_AgentSetProperty("light_office07", "EnvLight - Spot Angle Outer", 100, sceneObj)
    Custom_AgentSetProperty("light_office07", "EnvLight - Color", Color(0.94117701053619, 1, 0.73333299160004, 1), sceneObj)
    Custom_AgentSetProperty("light_office07", "EnvLight - Enabled Group", envlight_groupEnabled, sceneObj)
    Custom_AgentSetProperty("light_office07", "EnvLight - Groups", envlight_groups, sceneObj)
    Custom_AgentSetProperty("light_office07", "EnvLight - Shadow Type", envlight_shadowtype, sceneObj)
    Custom_AgentSetProperty("light_office07", "EnvLight - Shadow Quality", envlight_shadowquality, sceneObj)
    Custom_AgentSetProperty("light_office07", "EnvLight - HBAO Participation Type", envlight_hbaoParticipation, sceneObj)
    
    local light37 = AgentCreate("light_office08", envlight_prop, Vector(5.478865,1.600616,1.734366), Vector(-171.126236,-84.322586,0.889343), sceneObj, false, false)
    Custom_AgentSetProperty("light_office08", "EnvLight - Type", 1, sceneObj)
    Custom_AgentSetProperty("light_office08", "EnvLight - Intensity", 5.3, sceneObj)
    Custom_AgentSetProperty("light_office08", "EnvLight - Radius", 3.65, sceneObj)
    Custom_AgentSetProperty("light_office08", "EnvLight - Distance Falloff", 2, sceneObj)
    Custom_AgentSetProperty("light_office08", "EnvLight - Spot Angle Inner", 34, sceneObj)
    Custom_AgentSetProperty("light_office08", "EnvLight - Spot Angle Outer", 100, sceneObj)
    Custom_AgentSetProperty("light_office08", "EnvLight - Color", Color(0.82745099067688, 1, 0.56470602750778, 1), sceneObj)
    Custom_AgentSetProperty("light_office08", "EnvLight - Enabled Group", envlight_groupEnabled, sceneObj)
    Custom_AgentSetProperty("light_office08", "EnvLight - Groups", envlight_groups, sceneObj)
    Custom_AgentSetProperty("light_office08", "EnvLight - Shadow Type", envlight_shadowtype, sceneObj)
    Custom_AgentSetProperty("light_office08", "EnvLight - Shadow Quality", envlight_shadowquality, sceneObj)
    Custom_AgentSetProperty("light_office08", "EnvLight - HBAO Participation Type", envlight_hbaoParticipation, sceneObj)
    
    local light38 = AgentCreate("light_office09", envlight_prop, Vector(5.653212,1.627973,4.509634), Vector(-171.126236,-84.322586,0.889343), sceneObj, false, false)
    Custom_AgentSetProperty("light_office09", "EnvLight - Type", 1, sceneObj)
    Custom_AgentSetProperty("light_office09", "EnvLight - Intensity", 5.3, sceneObj)
    Custom_AgentSetProperty("light_office09", "EnvLight - Radius", 3.65, sceneObj)
    Custom_AgentSetProperty("light_office09", "EnvLight - Distance Falloff", 2, sceneObj)
    Custom_AgentSetProperty("light_office09", "EnvLight - Spot Angle Inner", 34, sceneObj)
    Custom_AgentSetProperty("light_office09", "EnvLight - Spot Angle Outer", 100, sceneObj)
    Custom_AgentSetProperty("light_office09", "EnvLight - Color", Color(0.80000001192093, 1, 0.57254898548126, 1), sceneObj)
    Custom_AgentSetProperty("light_office09", "EnvLight - Enabled Group", envlight_groupEnabled, sceneObj)
    Custom_AgentSetProperty("light_office09", "EnvLight - Groups", envlight_groups, sceneObj)
    Custom_AgentSetProperty("light_office09", "EnvLight - Shadow Type", envlight_shadowtype, sceneObj)
    Custom_AgentSetProperty("light_office09", "EnvLight - Shadow Quality", envlight_shadowquality, sceneObj)
    Custom_AgentSetProperty("light_office09", "EnvLight - HBAO Participation Type", envlight_hbaoParticipation, sceneObj)
    
    local light39 = AgentCreate("light_amb", envlight_prop, Vector(0.915504,1.528301,0.639207), Vector(0.000000,0.000000,0.000000), sceneObj, false, false)
    Custom_AgentSetProperty("light_amb", "EnvLight - Type", 3, sceneObj)
    Custom_AgentSetProperty("light_amb", "EnvLight - Intensity", 0.005, sceneObj)
    Custom_AgentSetProperty("light_amb", "EnvLight - Radius", 5, sceneObj)
    Custom_AgentSetProperty("light_amb", "EnvLight - Distance Falloff", 2, sceneObj)
    Custom_AgentSetProperty("light_amb", "EnvLight - Spot Angle Inner", 5, sceneObj)
    Custom_AgentSetProperty("light_amb", "EnvLight - Spot Angle Outer", 45, sceneObj)
    Custom_AgentSetProperty("light_amb", "EnvLight - Color", Color(0.37647101283073, 0.54117602109909, 1, 1), sceneObj)
    Custom_AgentSetProperty("light_amb", "EnvLight - Enabled Group", envlight_groupEnabled, sceneObj)
    Custom_AgentSetProperty("light_amb", "EnvLight - Groups", envlight_groups, sceneObj)
    Custom_AgentSetProperty("light_amb", "EnvLight - Shadow Type", envlight_shadowtype, sceneObj)
    Custom_AgentSetProperty("light_amb", "EnvLight - Shadow Quality", envlight_shadowquality, sceneObj)
    Custom_AgentSetProperty("light_amb", "EnvLight - HBAO Participation Type", envlight_hbaoParticipation, sceneObj)
    
    local light40 = AgentCreate("light_Shelf", envlight_prop, Vector(2.219095,1.201050,-0.111294), Vector(0.000000,0.000000,0.000000), sceneObj, false, false)
    Custom_AgentSetProperty("light_Shelf", "EnvLight - Type", 0, sceneObj)
    Custom_AgentSetProperty("light_Shelf", "EnvLight - Intensity", 0.45, sceneObj)
    Custom_AgentSetProperty("light_Shelf", "EnvLight - Radius", 2.45, sceneObj)
    Custom_AgentSetProperty("light_Shelf", "EnvLight - Distance Falloff", 3, sceneObj)
    Custom_AgentSetProperty("light_Shelf", "EnvLight - Spot Angle Inner", 5, sceneObj)
    Custom_AgentSetProperty("light_Shelf", "EnvLight - Spot Angle Outer", 45, sceneObj)
    Custom_AgentSetProperty("light_Shelf", "EnvLight - Color", Color(0.31372600793839, 0.36078399419785, 0.57647097110748, 1), sceneObj)
    Custom_AgentSetProperty("light_Shelf", "EnvLight - Enabled Group", envlight_groupEnabled, sceneObj)
    Custom_AgentSetProperty("light_Shelf", "EnvLight - Groups", envlight_groups, sceneObj)
    Custom_AgentSetProperty("light_Shelf", "EnvLight - Shadow Type", envlight_shadowtype, sceneObj)
    Custom_AgentSetProperty("light_Shelf", "EnvLight - Shadow Quality", envlight_shadowquality, sceneObj)
    Custom_AgentSetProperty("light_Shelf", "EnvLight - HBAO Participation Type", envlight_hbaoParticipation, sceneObj)
    
    local light41 = AgentCreate("light_juiceBarLeftWall", envlight_prop, Vector(-2.315925,1.825007,1.209111), Vector(5.314844,16.144518,-34.026733), sceneObj, false, false)
    Custom_AgentSetProperty("light_juiceBarLeftWall", "EnvLight - Type", 1, sceneObj)
    Custom_AgentSetProperty("light_juiceBarLeftWall", "EnvLight - Intensity", 0.35, sceneObj)
    Custom_AgentSetProperty("light_juiceBarLeftWall", "EnvLight - Radius", 6.3, sceneObj)
    Custom_AgentSetProperty("light_juiceBarLeftWall", "EnvLight - Distance Falloff", 2, sceneObj)
    Custom_AgentSetProperty("light_juiceBarLeftWall", "EnvLight - Spot Angle Inner", 13, sceneObj)
    Custom_AgentSetProperty("light_juiceBarLeftWall", "EnvLight - Spot Angle Outer", 35, sceneObj)
    Custom_AgentSetProperty("light_juiceBarLeftWall", "EnvLight - Color", Color(0.93725502490997, 1, 0.70196098089218, 1), sceneObj)
    Custom_AgentSetProperty("light_juiceBarLeftWall", "EnvLight - Enabled Group", envlight_groupEnabled, sceneObj)
    Custom_AgentSetProperty("light_juiceBarLeftWall", "EnvLight - Groups", envlight_groups, sceneObj)
    Custom_AgentSetProperty("light_juiceBarLeftWall", "EnvLight - Shadow Type", envlight_shadowtype, sceneObj)
    Custom_AgentSetProperty("light_juiceBarLeftWall", "EnvLight - Shadow Quality", envlight_shadowquality, sceneObj)
    Custom_AgentSetProperty("light_juiceBarLeftWall", "EnvLight - HBAO Participation Type", envlight_hbaoParticipation, sceneObj)
    
    --characters
    local duck_prop = "sk56_duck.prop"
    local duck = AgentCreate("Duck", duck_prop, Vector(-3.966125,1.219055,3.742249), Vector(0,0.000000,174.511963,0.000000,0), sceneObj, false, false)
    local duck_idle_chore = "adv_drugstore_duckInChair.chore"
    local duck_wdusable_actionenter_chore = ""
    local duck_wdusable_actionexit_chore = ""
    local duck_wdusable_actionuse_chore = "sk56_idle_duckStandA.chore"
    Custom_AgentSetProperty("Duck", "Walk Animation - Idle", duck_idle_chore, sceneObj)
    Custom_AgentSetProperty("Duck", "WDUseable - Action Enter Chore", duck_wdusable_actionenter_chore, sceneObj)
    Custom_AgentSetProperty("Duck", "WDUseable - Action Exit Chore", duck_wdusable_actionexit_chore, sceneObj)
    Custom_AgentSetProperty("Duck", "WDUseable - Action Use Chore", duck_wdusable_actionuse_chore, sceneObj)
    Custom_AgentSetProperty("Duck", "Game Selectable", true, sceneObj)
    Custom_AgentSetProperty("Duck", "WDUseable - Use Activate On Look", true, sceneObj)
    
    local carley_prop = "sk55_carley.prop"
    local carley = AgentCreate("Carley", carley_prop, Vector(0.487534,0.257507,-0.937622), Vector(0.000000,-175.049728,0.000000), sceneObj, false, false)
    local carley_idle_chore = "drugstore_carley_carleyMain_1.chore"
    local carley_wdusable_actionenter_chore = ""
    local carley_wdusable_actionexit_chore = ""
    local carley_wdusable_actionuse_chore = "adv_strugstoreact3_carleyRadio_leeInteraction.chore"
    Custom_AgentSetProperty("Carley", "Walk Animation - Idle", carley_idle_chore, sceneObj)
    Custom_AgentSetProperty("Carley", "WDUseable - Action Enter Chore", carley_wdusable_actionenter_chore, sceneObj)
    Custom_AgentSetProperty("Carley", "WDUseable - Action Exit Chore", carley_wdusable_actionexit_chore, sceneObj)
    Custom_AgentSetProperty("Carley", "WDUseable - Action Use Chore", carley_wdusable_actionuse_chore, sceneObj)
    Custom_AgentSetProperty("Carley", "Game Selectable", true, sceneObj)
    Custom_AgentSetProperty("Carley", "WDUseable - Use Activate On Look", true, sceneObj)
    
    local doug_prop = "sk54_doug.prop"
    local doug = AgentCreate("Doug", doug_prop, Vector(0.000000,0.000000,-4.705872), Vector(0.000000,0.000000,0.000000), sceneObj, false, false)
    local doug_idle_chore = "adv_drugstore_dougChecksWindow.chore"
    local doug_wdusable_actionenter_chore = ""
    local doug_wdusable_actionexit_chore = ""
    local doug_wdusable_actionuse_chore = "adv_drugstore_dougboardupwindow.chore"
    Custom_AgentSetProperty("Doug", "Walk Animation - Idle", doug_idle_chore, sceneObj)
    Custom_AgentSetProperty("Doug", "WDUseable - Action Enter Chore", doug_wdusable_actionenter_chore, sceneObj)
    Custom_AgentSetProperty("Doug", "WDUseable - Action Exit Chore", doug_wdusable_actionexit_chore, sceneObj)
    Custom_AgentSetProperty("Doug", "WDUseable - Action Use Chore", doug_wdusable_actionuse_chore, sceneObj)
    Custom_AgentSetProperty("Doug", "Game Selectable", true, sceneObj)
    Custom_AgentSetProperty("Doug", "WDUseable - Use Activate On Look", true, sceneObj)
    
    
    local glenn_prop = "sk54_glenn.prop"
    local glenn = AgentCreate("Glenn", glenn_prop, Vector(0.000000,0.000000,-2.417847), Vector(0.000000,0.000000,0.000000), sceneObj, false, false)
    local glenn_idle_chore = "adv_drugstore_glennInCorner.chore"
    local glenn_wdusable_actionenter_chore = ""
    local glenn_wdusable_actionexit_chore = ""
    local glenn_wdusable_actionuse_chore = "adv_drugstore_glennInCorner_stand.chore"
    Custom_AgentSetProperty("Glenn", "Walk Animation - Idle", glenn_idle_chore, sceneObj)
    Custom_AgentSetProperty("Glenn", "WDUseable - Action Enter Chore", glenn_wdusable_actionenter_chore, sceneObj)
    Custom_AgentSetProperty("Glenn", "WDUseable - Action Exit Chore", glenn_wdusable_actionexit_chore, sceneObj)
    Custom_AgentSetProperty("Glenn", "WDUseable - Action Use Chore", glenn_wdusable_actionuse_chore, sceneObj)
    Custom_AgentSetProperty("Glenn", "Game Selectable", true, sceneObj)
    Custom_AgentSetProperty("Glenn", "WDUseable - Use Activate On Look", true, sceneObj)
    
    local katjaa_prop = "sk55_katjaa.prop"
    local katjaa = AgentCreate("Katjaa", katjaa_prop, Vector(-3.431702,0.000000,4.726501), Vector(0.000000,163.858902,0.000000), sceneObj, false, false)
    local katjaa_idle_chore = "adv_drugstore_katjaaInChair_dialog.chore"
    local katjaa_wdusable_actionenter_chore = ""
    local katjaa_wdusable_actionexit_chore = ""
    local katjaa_wdusable_actionuse_chore = "adv_drugstoreact3_katjaaDirtyDuck.chore"
    Custom_AgentSetProperty("Katjaa", "Walk Animation - Idle", katjaa_idle_chore, sceneObj)
    Custom_AgentSetProperty("Katjaa", "WDUseable - Action Enter Chore", katjaa_wdusable_actionenter_chore, sceneObj)
    Custom_AgentSetProperty("Katjaa", "WDUseable - Action Exit Chore", katjaa_wdusable_actionexit_chore, sceneObj)
    Custom_AgentSetProperty("Katjaa", "WDUseable - Action Use Chore", katjaa_wdusable_actionuse_chore, sceneObj)
    Custom_AgentSetProperty("Katjaa", "Game Selectable", true, sceneObj)
    Custom_AgentSetProperty("Katjaa", "WDUseable - Use Activate On Look", true, sceneObj)
    
    local kenny_prop = "sk54_kenny.prop"
    local kenny = AgentCreate("Kenny", kenny_prop, Vector(4.318787,0.000000,2.592651), Vector(0.000000,0.000000,0.000000), sceneObj, false, false)
    local kenny_idle_chore = "adv_drugstore_kennyBehindCounter_dialog.chore"
    local kenny_wdusable_actionenter_chore = ""
    local kenny_wdusable_actionexit_chore = ""
    local kenny_wdusable_actionuse_chore = "adv_drugstore_kennyExtendsHand.chore"
    Custom_AgentSetProperty("Kenny", "Walk Animation - Idle", kenny_idle_chore, sceneObj)
    Custom_AgentSetProperty("Kenny", "WDUseable - Action Enter Chore", kenny_wdusable_actionenter_chore, sceneObj)
    Custom_AgentSetProperty("Kenny", "WDUseable - Action Exit Chore", kenny_wdusable_actionexit_chore, sceneObj)
    Custom_AgentSetProperty("Kenny", "WDUseable - Action Use Chore", kenny_wdusable_actionuse_chore, sceneObj)
    Custom_AgentSetProperty("Kenny", "Game Selectable", true, sceneObj)
    Custom_AgentSetProperty("Kenny", "WDUseable - Use Activate On Look", true, sceneObj)
    
    
    local larry_prop = "sk54_larry.prop"
    local larry = AgentCreate("Larry", larry_prop, Vector(3.331299,0.000000,4.240662), Vector(0.000000,158.496994,0.000000), sceneObj, false, false)
    local larry_idle_chore = "adv_drugstore_lillyTendLarry.chore"
    local larry_wdusable_actionenter_chore = ""
    local larry_wdusable_actionexit_chore = ""
    local larry_wdusable_actionuse_chore = "adv_drugstore_lillyLarryFloor.chore"
    Custom_AgentSetProperty("Larry", "Walk Animation - Idle", larry_idle_chore, sceneObj)
    Custom_AgentSetProperty("Larry", "WDUseable - Action Enter Chore", larry_wdusable_actionenter_chore, sceneObj)
    Custom_AgentSetProperty("Larry", "WDUseable - Action Exit Chore", larry_wdusable_actionexit_chore, sceneObj)
    Custom_AgentSetProperty("Larry", "WDUseable - Action Use Chore", larry_wdusable_actionuse_chore, sceneObj)
    Custom_AgentSetProperty("Larry", "Game Selectable", true, sceneObj)
    Custom_AgentSetProperty("Larry", "WDUseable - Use Activate On Look", true, sceneObj)
    
    local lilly_prop = "sk55_lilly.prop"
    local lilly = AgentCreate("Lilly", lilly_prop, Vector(4.794800,0.000000,-2.841812), Vector(0.000000,-98.461662,0.000000), sceneObj, false, false)
    local lilly_idle_chore = "adv_drugstore_lillyTendLarry.chore"
    local lilly_wdusable_actionenter_chore = ""
    local lilly_wdusable_actionexit_chore = ""
    local lilly_wdusable_actionuse_chore = "adv_drugstore_lillyLarryFloor.chore"
    Custom_AgentSetProperty("Lilly", "Walk Animation - Idle", lilly_idle_chore, sceneObj)
    Custom_AgentSetProperty("Lilly", "WDUseable - Action Enter Chore", lilly_wdusable_actionenter_chore, sceneObj)
    Custom_AgentSetProperty("Lilly", "WDUseable - Action Exit Chore", lilly_wdusable_actionexit_chore, sceneObj)
    Custom_AgentSetProperty("Lilly", "WDUseable - Action Use Chore", lilly_wdusable_actionuse_chore, sceneObj)
    Custom_AgentSetProperty("Lilly", "Game Selectable", true, sceneObj)
    Custom_AgentSetProperty("Lilly", "WDUseable - Use Activate On Look", true, sceneObj)
    
    --DevTools_AgentMenuTool_GetValidPropertyNames(duck)
    
    Custom_AgentSetProperty("adv_trainStation.scene", "FX anti-aliasing", true, sceneObj)
    Custom_AgentSetProperty("adv_trainStation.scene", "FX Sharp Shadows Enabled", true, sceneObj)
    Custom_AgentSetProperty("adv_trainStation.scene", "Generate NPR Lines", false, sceneObj)
    Custom_AgentSetProperty("adv_trainStation.scene", "Screen Space Lines - Enabled", false, sceneObj)
    Custom_AgentSetProperty("adv_trainStation.scene", "FX Ambient Occlusion Enabled", true, sceneObj)
    Custom_AgentSetProperty("adv_trainStation.scene", "FX Tonemap Intensity", 1.0, sceneObj)
    Custom_AgentSetProperty("adv_trainStation.scene", "FX Tonemap White Point", 5.0, sceneObj)
    Custom_AgentSetProperty("adv_trainStation.scene", "FX Tonemap Black Point", 0.001, sceneObj)
    Custom_AgentSetProperty("adv_trainStation.scene", "FX Tonemap Filmic Toe Intensity", 1.0, sceneObj)
    Custom_AgentSetProperty("adv_trainStation.scene", "FX Tonemap Filmic Shoulder Intensity", 0.75, sceneObj)
    Custom_AgentSetProperty("adv_trainStation.scene", "HBAO Intensity", 2.5, sceneObj)
    Custom_AgentSetProperty("adv_trainStation.scene", "HBAO Max Radius Percent", 0.75, sceneObj)
    Custom_AgentSetProperty("adv_trainStation.scene", "FX Bloom Threshold", -0.05, sceneObj)
    Custom_AgentSetProperty("adv_trainStation.scene", "FX Bloom Intensity", 1.5, sceneObj)
    Custom_AgentSetProperty("adv_trainStation.scene", "Ambient Color", RGBColor(0, 0, 0, 0), sceneObj)
    Custom_AgentSetProperty("adv_trainStation.scene", "Shadow Color", RGBColor(0, 0, 0, 0), sceneObj)
    Custom_AgentSetProperty("adv_trainStation.scene", "FX Vignette Tint Enabled", true, sceneObj)
    Custom_AgentSetProperty("adv_trainStation.scene", "FX Vignette Tint", RGBColor(0, 0, 0, 0), sceneObj)
    Custom_AgentSetProperty("adv_trainStation.scene", "FX Vignette Falloff", 1.5, sceneObj)
    Custom_AgentSetProperty("adv_trainStation.scene", "FX Vignette Center", 0, sceneObj)
    Custom_AgentSetProperty("adv_trainStation.scene", "FX Vignette Corners", 3.0, sceneObj)
    Custom_AgentSetProperty("adv_trainStation.scene", "LightEnv Saturation", 1.5, sceneObj)
    Custom_AgentSetProperty("adv_trainStation.scene", "LightEnv Reflection Intensity Shadow", 1.0, sceneObj)
    Custom_AgentSetProperty("adv_trainStation.scene", "Specular Multiplier Enabled", true, sceneObj)
    
    
    
    
    
    
    --local cam = AgentFindInScene("cam_orbit", sceneObj)
    Custom_AgentSetProperty("cam_orbit", "Scene: Location Info", nil, sceneObj)
    Custom_AgentSetProperty("cam_orbit", "Orbit Cam - Collision with Environment Enable", false, sceneObj)

    --PrintSceneLightsToTXT(sceneObj, "trainstation-lights.txt")
    
    SetPropertyOnAllCameras(sceneObj, "Field of View Scale", 1.5)
end

ModifyScene = function(sceneObj)
    local light1 = AgentFindInScene("light_ENV_exterior_ambFill", sceneObj)
    local light2 = AgentFindInScene("light_NODE_exterior", sceneObj)
    --destroyMe(light1)
    destroyMe(light2)
    
    local light3  = AgentFindInScene("light_ENV_interior", sceneObj)
    local light5  = AgentFindInScene("light_ENV_exterior_groundFill01", sceneObj)
    local light7  = AgentFindInScene("light_ENV_exterior_groundFill02", sceneObj)
    local light8  = AgentFindInScene("light_ENV_exterior_groundFill03", sceneObj)
    local light9  = AgentFindInScene("light_ENV_exterior_groundFill04", sceneObj)
    local light10 = AgentFindInScene("light_ENV_exterior_groundFill05", sceneObj)
    local light12 = AgentFindInScene("light_ENV_exterior_groundFill07", sceneObj)
    local light13 = AgentFindInScene("light_ENV_exterior_groundFill08", sceneObj)
    local light14 = AgentFindInScene("light_ENV_exterior_doorFill", sceneObj)
    local light15 = AgentFindInScene("light_ENV_exterior_groundFill09", sceneObj)
    local light16 = AgentFindInScene("light_ENV_exterior_groundFill10", sceneObj)
    local light17 = AgentFindInScene("light_ENV_exterior_groundFill11", sceneObj)
    local light18 = AgentFindInScene("light_ENV_exterior_groundFill12", sceneObj)
    local light19 = AgentFindInScene("light_ENV_exterior_hotSpecSpotCar", sceneObj)
    local light22 = AgentFindInScene("light_ENV_exterior_hotSpot01", sceneObj)
    local light20 = AgentFindInScene("light_ENV_exterior_hotSpot02", sceneObj)
    local light21 = AgentFindInScene("light_ENV_exterior_hotSpot04", sceneObj)
    local light4  = AgentFindInScene("light_ENV_exterior_hotSpot05", sceneObj)
    local light6  = AgentFindInScene("light_ENV_exterior_hotSpot06", sceneObj)
    local light11 = AgentFindInScene("light_ENV_exterior_hotSpot07", sceneObj)
    local light23 = AgentFindInScene("light_ENV_exterior_groundFill13", sceneObj)
    local light24 = AgentFindInScene("light_ENV_exterior_groundFill14", sceneObj)
    local light25 = AgentFindInScene("light_ENV_exterior", sceneObj)
    local light26 = AgentFindInScene("light_ENV_exterior_hotSpecSpotTrainEngine", sceneObj)
    local light27 = AgentFindInScene("light_gobo_trainStation_treesINVERT", sceneObj)
    destroyMe(light3)
    destroyMe(light4)
    destroyMe(light5)
    destroyMe(light6)
    destroyMe(light7)
    destroyMe(light8)
    destroyMe(light9)
    destroyMe(light10)
    destroyMe(light11)
    destroyMe(light12)
    destroyMe(light13)
    destroyMe(light14)
    destroyMe(light15)
    destroyMe(light16)
    destroyMe(light17)
    destroyMe(light18)
    destroyMe(light19)
    destroyMe(light20)
    destroyMe(light21)
    destroyMe(light22)
    destroyMe(light23)
    destroyMe(light24)
    destroyMe(light25)
    destroyMe(light26)
    destroyMe(light27)
    
    local light28 = AgentFindInScene("light_muscleCarInterior_mirror", sceneObj)
    local light29 = AgentFindInScene("light_muscleCarInterior_speedometer", sceneObj)
    local light30 = AgentFindInScene("light_muscleCarInterior_fuel", sceneObj)
    local light31 = AgentFindInScene("light_muscleCarInterior_RPM", sceneObj)
    local light32 = AgentFindInScene("light_muscleCarInterior_radio", sceneObj)
    local light33 = AgentFindInScene("light_muscleCarInterior_pedals", sceneObj)
    destroyMe(light28)
    destroyMe(light29)
    destroyMe(light30)
    destroyMe(light31)
    destroyMe(light32)
    destroyMe(light33)
    
    local shaft1 = AgentFindInScene("fx_lightShaft401", sceneObj)
    local shaft2 = AgentFindInScene("fx_lightShaft402", sceneObj)
    local shaft3 = AgentFindInScene("fx_lightShaft403", sceneObj)
    local shaft4 = AgentFindInScene("fx_lightShaft404", sceneObj)
    destroyMe(shaft1)
    destroyMe(shaft2)
    destroyMe(shaft3)
    destroyMe(shaft4)
    
    local light34 = AgentFindInScene("light_SKY_amb", sceneObj)
    local light35 = AgentFindInScene("light_SKY_horizonSpot", sceneObj)
    local light36 = AgentFindInScene("light_SKY_sunPoint", sceneObj)
    local light37 = AgentFindInScene("light_SKY_sunPoint01", sceneObj)
    local light38 = AgentFindInScene("light_SKY_sunBroadLight", sceneObj)
    
    local light39 = AgentFindInScene("light_AMB_0", sceneObj)
    local light40 = AgentFindInScene("light_AMB_Mattes", sceneObj)
    local light41 = AgentFindInScene("light_ENV_exterior_sunKey", sceneObj)
    local light42 = AgentFindInScene("light_ENV_A_ambFillGrass", sceneObj)
    
    destroyMe(light39)
    --destroyMe(light40)
    --destroyMe(light41)
   -- destroyMe(light42)

    local sunColor     = RGBColor(255, 214, 159, 255)
    local ambientColor = RGBColor(108, 170, 225, 255)
    local skyColor     = RGBColor(24, 99, 205, 255)
    local fogColor     = Desaturate_RGBColor(skyColor, 0.45)
    skyColor           = Desaturate_RGBColor(skyColor, 0.2)
    
    --enviorment module (fog)
    local envModule       = AgentFindInScene("module_environment_fog", sceneObj)
    local envModule_props = AgentGetRuntimeProperties(envModule)
    customSetPropertyColor(envModule_props, "5416356241638078242", sunColor)
    
    
    Custom_AgentSetProperty("adv_trainStation.scene", "FX Tonemap Intensity", 1.0, sceneObj)
    Custom_AgentSetProperty("adv_trainStation.scene", "FX Tonemap White Point", 4.0, sceneObj)
    Custom_AgentSetProperty("adv_trainStation.scene", "FX Tonemap Intensity", 1.0, sceneObj)
    
    Custom_AgentSetProperty("adv_trainStation.scene", "HBAO Intensity", 2.0, sceneObj)
    Custom_AgentSetProperty("adv_trainStation.scene", "HBAO Max Radius Percent", 0.75, sceneObj)
    
    
    --post effect
    --local sceneCamera = SceneGetCamera(SceneObject)
    local postEffectModule = AgentFindInScene("module_post_effect", sceneObj)
    local postEffectModule_props = AgentGetRuntimeProperties(postEffectModule)
    --customSetProperty(postEffectModule_props, "2369792796864402195", 0.5) --no clue
    --customSetProperty(postEffectModule_props, "8204949331042930819", 25.5) --no clue
    --customSetProperty(postEffectModule_props, "3430585715052144879", 25.5) --no clue
    
    customSetProperty(postEffectModule_props, "4539003406121630780", 25.5) --0.60000002384186
    customSetProperty(postEffectModule_props, "15278937006502347797", 25.5) --0.60000002384186
    
    --customSetPropertyColor(postEffectModule_props, "1574261333037183380", 25.5) --graduated filter top
    --customSetPropertyColor(postEffectModule_props, "15188887184429951521", 25.5) --graduated filter bottom
    
    --camera
    local sceneCamera = SceneGetCamera(SceneObject)
    local sceneCamera_props = AgentGetRuntimeProperties(sceneCamera)
    customSetProperty(sceneCamera_props, "550511701480871091", 25.5) --no clue
    
    --lightprobe
    --local probeModule            = AgentFindInScene("module_lightprobe", sceneObj)
    --local probeModule_props = AgentGetRuntimeProperties(probeModule)
    --customSetProperty(probeModule_props, "1025426863444100460", 25.5) --no clue
    
    --sun
    ModifyLightSettings(light41, 6.0, 20.0, sunColor)
    ModifyAgentTransformation_Rotation(light41, Vector(110, 92, 60))
    local sunProps = AgentGetRuntimeProperties(light41)
    customSetProperty(sunProps, "1930888535905678774", 3) --sets shadow thingy for reverse lighting
    customSetProperty(sunProps, "17514946436635221562", 0.1) --sets reverse lighting for sun
    customSetProperty(sunProps, "17681688128104012802", 0.5) --sets shadow intensity
    customSetProperty(sunProps, "12886873986940172262", 1.0) --sets specular intensity
    
    --skydome light
    ModifyLightSettings(light34, 4.0, 1.0, skyColor)
    
    --flat ambient
    ModifyLightSettings(light1, 0.5, 1.0, ambientColor)
    
    --mattes ambient
    ModifyLightSettings(light40, 2.0, 2.0, sunColor)
    
    --grass ambient
    ModifyLightSettings(light42, 0.75, 1.0, ambientColor)
    
    SetPropertyOnAllCameras(sceneObj, "Field of View Scale", 1.35)
    
    RemovingAllLightingRigs(sceneObj)
    RemoveNPR_OutlineOnAllAgents(sceneObj)
end

SwapClemWithFlashbackClem = function(sceneObj)
    ResourceSetEnable("WalkingDead403")
    local clemAgent = AgentFindInScene("Clementine", sceneObj)
    local clem400_prop = "sk63_clementineFlashback.prop"
    local clem400 = AgentCreate("sk63_clementineFlashback", clem400_prop, Vector(0,0,0), Vector(0,0,0), sceneObj, false, false)
    
    local clem400_props        = AgentGetRuntimeProperties(clem400)
    local clem_props        = AgentGetRuntimeProperties(clemAgent)
    Custom_AgentSetProperty("Clementine", "D3D Mesh List", PropertyGet(clem400_props, "D3D Mesh List"), sceneObj)
    Custom_AgentSetProperty("Clementine", "D3D Mesh", PropertyGet(clem400_props, "D3D Mesh"), sceneObj)
    Custom_AgentSetProperty("Clementine", "Skeleton File", PropertyGet(clem400_props, "Skeleton File"), sceneObj)
    Custom_AgentSetProperty("Clementine", "Skeleton Body", PropertyGet(clem400_props, "Skeleton Body"), sceneObj)
    Custom_AgentSetProperty("Clementine", "Skeleton Face", PropertyGet(clem400_props, "Skeleton Face"), sceneObj)
    Custom_AgentSetProperty("Clementine", "Render Share Skeleton With Agent", PropertyGet(clem400_props, "Render Share Skeleton With Agent"), sceneObj)
    
    AgentHide(clem400, true)

    --Custom_AgentSetProperty("Clementine", "Mesh sk56_clementine - Visible", false, sceneObj)
    Custom_AgentSetProperty("Clementine", "Eye Look-At Position", PropertyGet(clem400_props, "Eye Look-At Position"), sceneObj)
    Custom_AgentSetProperty("Clementine", "Eye Look-At Child Properties", PropertyGet(clem400_props, "Eye Look-At Child Properties"), sceneObj)
    Custom_AgentSetProperty("Clementine", "Eye Look-At Properties", PropertyGet(clem400_props, "Eye Look-At Properties"), sceneObj)
    Custom_AgentSetProperty("Clementine", "Look-at Buffer Angle", PropertyGet(clem400_props, "Look-at Buffer Angle"), sceneObj)
    Custom_AgentSetProperty("Clementine", "Look-at Min Buffer Angle", PropertyGet(clem400_props, "Look-at Min Buffer Angle"), sceneObj)
    Custom_AgentSetProperty("Clementine", "Style Idle", PropertyGet(clem400_props, "Style Idle"), sceneObj)
    Custom_AgentSetProperty("Clementine", "Style Guide", PropertyGet(clem400_props, "Style Guide"), sceneObj)
    Custom_AgentSetProperty("Clementine", "Style Guide2", PropertyGet(clem400_props, "Style Guide2"), sceneObj)
    Custom_AgentSetProperty("Clementine", "Style Idle2", PropertyGet(clem400_props, "Style Idle2"), sceneObj)
    Custom_AgentSetProperty("Clementine", "Look - Chore Head", PropertyGet(clem400_props, "Look - Chore Head"), sceneObj)
    Custom_AgentSetProperty("Clementine", "Look - Chore Eyes", PropertyGet(clem400_props, "Look - Chore Eyes"), sceneObj)
    Custom_AgentSetProperty("Clementine", "Look - Contribution Fade Speed", PropertyGet(clem400_props, "Look - Contribution Fade Speed"), sceneObj)
    Custom_AgentSetProperty("Clementine", "Look - FOV Degrees", PropertyGet(clem400_props, "Look - FOV Degrees"), sceneObj)
    Custom_AgentSetProperty("Clementine", "Eye Look-At Properties", PropertyGet(clem400_props, "Eye Look-At Properties"), sceneObj)
    Custom_AgentSetProperty("Clementine", "Eye Look-At Properties", PropertyGet(clem400_props, "Eye Look-At Properties"), sceneObj)
    Custom_AgentSetProperty("Clementine", "Look-at Buffer Angle", PropertyGet(clem400_props, "Look-at Buffer Angle"), sceneObj)
    Custom_AgentSetProperty("Clementine", "Look-at Min Buffer Angle", PropertyGet(clem400_props, "Look-at Min Buffer Angle"), sceneObj)
    
    --Custom_AgentSetProperty("Clementine", "Render Global Scale", 1.05, sceneObj)
    
    --lee
    local ajAgent = AgentFindInScene("AJ", sceneObj)
    local lee400_prop = "sk61_lee.prop"
    local lee400 = AgentCreate("sk61_lee", lee400_prop, Vector(0,0,0), Vector(0,0,0), sceneObj, false, false)
    
    local lee400_props        = AgentGetRuntimeProperties(lee400)
    local aj_props        = AgentGetRuntimeProperties(ajAgent)
    
    --Custom_AgentSetProperty("AJ", "Mesh sk54_lee_armL - Visible", false, sceneObj)
    --Custom_AgentSetProperty("AJ", "Mesh sk54_lee_armR - Visible", false, sceneObj)
    --Custom_AgentSetProperty("AJ", "Mesh sk54_lee_body - Visible", true, sceneObj)
    --Custom_AgentSetProperty("AJ", "Mesh sk54_lee_bodyStomachGutted - Visible", false, sceneObj)
    --Custom_AgentSetProperty("AJ", "Mesh sk54_lee_head - Visible", false, sceneObj)
    --Custom_AgentSetProperty("AJ", "Mesh sk54_lee_legs - Visible", false, sceneObj)
    --Custom_AgentSetProperty("AJ", "Mesh sk54_leeJacket_armL - Visible", false, sceneObj)
    --Custom_AgentSetProperty("AJ", "Mesh sk54_leeJacket_armR - Visible", false, sceneObj)
    --Custom_AgentSetProperty("AJ", "Mesh sk54_leeJacket_body - Visible", false, sceneObj)
    --Custom_AgentSetProperty("AJ", "Mesh sk54_leeJacket_head - Visible", false, sceneObj)
    --Custom_AgentSetProperty("AJ", "Mesh sk54_leeJacket_legs - Visible", false, sceneObj)
    
    Custom_AgentSetProperty("AJ", "D3D Mesh List", PropertyGet(lee400_props, "D3D Mesh List"), sceneObj)
    Custom_AgentSetProperty("AJ", "D3D Mesh", PropertyGet(lee400_props, "D3D Mesh"), sceneObj)
    Custom_AgentSetProperty("AJ", "Skeleton File", PropertyGet(lee400_props, "Skeleton File"), sceneObj)
    Custom_AgentSetProperty("AJ", "Skeleton Body", PropertyGet(lee400_props, "Skeleton Body"), sceneObj)
    Custom_AgentSetProperty("AJ", "Skeleton Face", PropertyGet(lee400_props, "Skeleton Face"), sceneObj)
    Custom_AgentSetProperty("AJ", "Render Share Skeleton With Agent", PropertyGet(lee400_props, "Render Share Skeleton With Agent"), sceneObj)
    Custom_AgentSetProperty("AJ", "Eye Look-At Position", PropertyGet(lee400_props, "Eye Look-At Position"), sceneObj)
    Custom_AgentSetProperty("AJ", "Eye Look-At Child Properties", PropertyGet(lee400_props, "Eye Look-At Child Properties"), sceneObj)
    Custom_AgentSetProperty("AJ", "Eye Look-At Properties", PropertyGet(lee400_props, "Eye Look-At Properties"), sceneObj)
    Custom_AgentSetProperty("AJ", "Style Idle", PropertyGet(lee400_props, "Style Idle"), sceneObj)
    Custom_AgentSetProperty("AJ", "Style Guide", PropertyGet(lee400_props, "Style Guide"), sceneObj)
    Custom_AgentSetProperty("AJ", "Style Guide2", PropertyGet(lee400_props, "Style Guide2"), sceneObj)
    Custom_AgentSetProperty("AJ", "Style Idle2", PropertyGet(lee400_props, "Style Idle2"), sceneObj)
    Custom_AgentSetProperty("AJ", "Look - Enabled", PropertyGet(lee400_props, "Look - Enabled"), sceneObj)
    Custom_AgentSetProperty("AJ", "Look - Chore Head", PropertyGet(lee400_props, "Look - Chore Head"), sceneObj)
    Custom_AgentSetProperty("AJ", "Look - Chore Eyes", PropertyGet(lee400_props, "Look - Chore Eyes"), sceneObj)
    Custom_AgentSetProperty("AJ", "Look - Contribution Fade Speed", PropertyGet(lee400_props, "Look - Contribution Fade Speed"), sceneObj)
    Custom_AgentSetProperty("AJ", "Look - FOV Degrees", PropertyGet(lee400_props, "Look - FOV Degrees"), sceneObj)
    Custom_AgentSetProperty("AJ", "Eye Look-At Properties", PropertyGet(lee400_props, "Eye Look-At Properties"), sceneObj)
    Custom_AgentSetProperty("AJ", "Eye Look-At Properties", PropertyGet(lee400_props, "Eye Look-At Properties"), sceneObj)
    Custom_AgentSetProperty("AJ", "Look-at Buffer Angle", PropertyGet(lee400_props, "Look-at Buffer Angle"), sceneObj)
    Custom_AgentSetProperty("AJ", "Look-at Min Buffer Angle", PropertyGet(lee400_props, "Look-at Min Buffer Angle"), sceneObj)
    
    --Custom_AgentSetProperty("Clementine", "Render Global Scale", 0.98, sceneObj)
    
    AgentHide(lee400, true)
end


local OnLogicReady = function()
  if Game_GetLoaded() then
    return 
  end
  local debugID = LogicGet("Debug ID")
  if debugID < 1 then
    return 
  end
  --LogicSet("1 - Killed First Zombie", true)
  if debugID == 1 then
    Game_SetSceneDialogNode("cs_enterStation")
    AgentSetProperty("obj_doorBackTrainStation", kGameSelectable, true)
  else
    if debugID == 2 then
      Game_SetSceneDialogNode("cs_zombieTime")
    else
      Game_SetSceneDialogNode("cs_holyShit")
    end
  end
end

CleanUpExistingTrainScene = function(sceneObj)
    local agent1   = AgentFindInScene("adv_trainStation_meshesITreeFlatsMatteHillBlocker", sceneObj)
    local agent2   = AgentFindInScene("adv_trainStation_meshesCCrawlspace", sceneObj)
    local agent3   = AgentFindInScene("adv_trainStationHill_meshesDTreeFoliageNoCast", sceneObj)
    local agent4   = AgentFindInScene("adv_trainStationHill_meshesCTreeFoliageNoCast", sceneObj)
    local agent5   = AgentFindInScene("adv_trainStationHill_meshesBTreeFoliageNoCast", sceneObj)
    local agent6   = AgentFindInScene("adv_trainStationHill_meshesATreeFoliageNoCast", sceneObj)
    local agent7   = AgentFindInScene("adv_trainStation_meshesITreeFoliageNoCast", sceneObj)
    local agent8   = AgentFindInScene("adv_trainStation_meshesETreeFoliageNoCast", sceneObj)
    local agent9   = AgentFindInScene("adv_trainStation_meshesCTreeFoliageNoCast", sceneObj)
    local agent10  = AgentFindInScene("adv_trainStationHill_meshesAGrass", sceneObj)
    local agent11  = AgentFindInScene("adv_trainStationHill_meshesARocks", sceneObj)
    local agent12  = AgentFindInScene("adv_trainStationHill_meshesATerrain", sceneObj)
    local agent13  = AgentFindInScene("adv_trainStationHill_meshesATreeFlats", sceneObj)
    local agent14  = AgentFindInScene("adv_trainStationHill_meshesATrees", sceneObj)
    local agent15  = AgentFindInScene("adv_trainStationHill_meshesBGrass", sceneObj)
    local agent16  = AgentFindInScene("adv_trainStationHill_meshesBRocks", sceneObj)
    local agent17  = AgentFindInScene("adv_trainStationHill_meshesBTerrain", sceneObj)
    local agent18  = AgentFindInScene("adv_trainStationHill_meshesBTreeFlats", sceneObj)
    local agent19  = AgentFindInScene("adv_trainStationHill_meshesBTrees", sceneObj)
    local agent20  = AgentFindInScene("adv_trainStationHill_meshesCGrass", sceneObj)
    local agent21  = AgentFindInScene("adv_trainStationHill_meshesCTerrain", sceneObj)
    local agent22  = AgentFindInScene("adv_trainStationHill_meshesCTreeFlats", sceneObj)
    local agent23  = AgentFindInScene("adv_trainStationHill_meshesCTrees", sceneObj)
    local agent24  = AgentFindInScene("adv_trainStationHill_meshesDGrass", sceneObj)
    local agent25  = AgentFindInScene("adv_trainStationHill_meshesDRocks", sceneObj)
    local agent26  = AgentFindInScene("adv_trainStationHill_meshesDTerrain", sceneObj)
    local agent27  = AgentFindInScene("adv_trainStationHill_meshesDTreeFlats", sceneObj)
    local agent28  = AgentFindInScene("adv_trainStationHill_meshesDTrees", sceneObj)
    local agent29  = AgentFindInScene("adv_trainStationHill_meshesEGrass", sceneObj)
    local agent30  = AgentFindInScene("adv_trainStationHill_meshesERocks", sceneObj)
    local agent31  = AgentFindInScene("adv_trainStationHill_meshesETerrain", sceneObj)
    local agent32  = AgentFindInScene("adv_trainStationHill_meshesETreeFlats", sceneObj)
    local agent33  = AgentFindInScene("adv_trainStationHill_meshesETrees", sceneObj)
    local agent34  = AgentFindInScene("adv_trainStationHill_meshesAMatteFill", sceneObj)
    local agent35  = AgentFindInScene("adv_trainStation_meshesAMatteFill", sceneObj)
    local agent36  = AgentFindInScene("adv_trainStation_meshesATerrain", sceneObj)
    local agent37  = AgentFindInScene("adv_trainStation_meshesATreeFlats", sceneObj)
    local agent38  = AgentFindInScene("adv_trainStation_meshesBGrass", sceneObj)
    local agent39  = AgentFindInScene("adv_trainStation_meshesBPowerLinesGuardrail", sceneObj)
    local agent40  = AgentFindInScene("adv_trainStation_meshesBTerrain", sceneObj)
    local agent41  = AgentFindInScene("adv_trainStation_meshesBTreeFlats", sceneObj)
    local agent42  = AgentFindInScene("adv_trainStation_meshesBTrees", sceneObj)
    local agent43  = AgentFindInScene("adv_trainStation_meshesCBuilding", sceneObj)
    local agent44  = AgentFindInScene("adv_trainStation_meshesCCloth", sceneObj)
    local agent45  = AgentFindInScene("adv_trainStation_meshesCDeck", sceneObj)
    local agent46  = AgentFindInScene("adv_trainStation_meshesCFences", sceneObj)
    local agent47  = AgentFindInScene("adv_trainStation_meshesCGrass", sceneObj)
    local agent48  = AgentFindInScene("adv_trainStation_meshesCMatteFill", sceneObj)
    local agent49  = AgentFindInScene("adv_trainStation_meshesCPropsExterior", sceneObj)
    local agent50  = AgentFindInScene("adv_trainStation_meshesCPropsInterior", sceneObj)
    local agent51  = AgentFindInScene("adv_trainStation_meshesCPropsOffice", sceneObj)
    local agent52  = AgentFindInScene("adv_trainStation_meshesCTerrain", sceneObj)
    local agent53  = AgentFindInScene("adv_trainStation_meshesCTreeFlats", sceneObj)
    local agent54  = AgentFindInScene("adv_trainStation_meshesCTrees", sceneObj)
    local agent55  = AgentFindInScene("adv_trainStation_meshesDMatteFill", sceneObj)
    local agent56  = AgentFindInScene("adv_trainStation_meshesDPowerlines", sceneObj)
    local agent57  = AgentFindInScene("adv_trainStation_meshesDTerrain", sceneObj)
    local agent58  = AgentFindInScene("adv_trainStation_meshesDTrainCars", sceneObj)
    local agent59  = AgentFindInScene("adv_trainStation_meshesDTreeFlats", sceneObj)
    local agent60  = AgentFindInScene("adv_trainStation_meshesDTrees", sceneObj)
    local agent61  = AgentFindInScene("adv_trainStation_meshesEGrass", sceneObj)
    local agent62  = AgentFindInScene("adv_trainStation_meshesEPowerLinesGuardrail", sceneObj)
    local agent63  = AgentFindInScene("adv_trainStation_meshesERubble", sceneObj)
    local agent64  = AgentFindInScene("adv_trainStation_meshesETerrain", sceneObj)
    local agent65  = AgentFindInScene("adv_trainStation_meshesETrainCarsA", sceneObj)
    local agent66  = AgentFindInScene("adv_trainStation_meshesETrainCarsB", sceneObj)
    local agent67  = AgentFindInScene("adv_trainStation_meshesETrees", sceneObj)
    local agent68  = AgentFindInScene("adv_trainStation_meshesFMatteFill", sceneObj)
    local agent69  = AgentFindInScene("adv_trainStation_meshesFTerrain", sceneObj)
    local agent70  = AgentFindInScene("adv_trainStation_meshesFTreeFlats", sceneObj)
    local agent71  = AgentFindInScene("adv_trainStation_meshesGGrass", sceneObj)
    local agent72  = AgentFindInScene("adv_trainStation_meshesGMatteFill", sceneObj)
    local agent73  = AgentFindInScene("adv_trainStation_meshesGTerrain", sceneObj)
    local agent74  = AgentFindInScene("adv_trainStation_meshesGTreeFlats", sceneObj)
    local agent75  = AgentFindInScene("adv_trainStation_meshesHGrass", sceneObj)
    local agent76  = AgentFindInScene("adv_trainStation_meshesHTerrain", sceneObj)
    local agent77  = AgentFindInScene("adv_trainStation_meshesHTreeFlats", sceneObj)
    local agent78  = AgentFindInScene("adv_trainStation_meshesHTrees", sceneObj)
    local agent79  = AgentFindInScene("adv_trainStation_meshesIBridge", sceneObj)
    local agent80  = AgentFindInScene("adv_trainStation_meshesIGrass", sceneObj)
    local agent81  = AgentFindInScene("adv_trainStation_meshesIMatteFill", sceneObj)
    local agent82  = AgentFindInScene("adv_trainStation_meshesITerrain", sceneObj)
    local agent83  = AgentFindInScene("adv_trainStation_meshesITreeFlats", sceneObj)
    local agent84  = AgentFindInScene("adv_trainStation_meshesITreesA", sceneObj)
    local agent85  = AgentFindInScene("adv_trainStation_meshesITreesB", sceneObj)
    local agent86  = AgentFindInScene("adv_trainStation_meshesCCrops", sceneObj)
    local agent87  = AgentFindInScene("adv_trainStation_meshesCGroundPlants", sceneObj)
    local agent88  = AgentFindInScene("adv_trainStation_meshesCIvy", sceneObj)
    local agent89  = AgentFindInScene("adv_trainStation_meshesCRocks", sceneObj)
    local agent90  = AgentFindInScene("adv_trainStation_meshesEGroundPlants", sceneObj)
    local agent91  = AgentFindInScene("adv_trainStation_meshesEIvy", sceneObj)
    local agent92  = AgentFindInScene("adv_trainStation_meshesERocks", sceneObj)
    local agent93  = AgentFindInScene("adv_trainStation_meshesCBuildingWindows", sceneObj)
    local agent94  = AgentFindInScene("trigger_cam_nav_car", sceneObj)
    local agent95  = AgentFindInScene("obj_matteForestHillTile", sceneObj)
    local agent96  = AgentFindInScene("obj_lidRainBarrel", sceneObj)
    local agent97  = AgentFindInScene("obj_bullet01", sceneObj)
    local agent98  = AgentFindInScene("obj_bullet02", sceneObj)
    local agent99  = AgentFindInScene("obj_grenade", sceneObj)
    local agent100 = AgentFindInScene("obj_mattressTrainStation", sceneObj)
    local agent101 = AgentFindInScene("obj_doorMetalPainted", sceneObj)
    local agent102 = AgentFindInScene("obj_capClementine400", sceneObj)
    local agent103 = AgentFindInScene("obj_fenceBarrierA", sceneObj)
    local agent104 = AgentFindInScene("obj_fenceBarrierB", sceneObj)
    local agent105 = AgentFindInScene("obj_keyTrainStation", sceneObj)
    local agent106 = AgentFindInScene("obj_bell", sceneObj)
    local agent107 = AgentFindInScene("obj_jarBeans", sceneObj)
    local agent108 = AgentFindInScene("obj_knifeAJ", sceneObj)
    local agent109 = AgentFindInScene("obj_canPeaches", sceneObj)
    local agent110 = AgentFindInScene("obj_barrelTrainStationA", sceneObj)
    local agent111 = AgentFindInScene("obj_logicalWaterFountain", sceneObj)
    local agent112 = AgentFindInScene("obj_logicalMap", sceneObj)
    local agent113 = AgentFindInScene("obj_boardWood", sceneObj)
    local agent114 = AgentFindInScene("obj_doorTrap", sceneObj)
    local agent115 = AgentFindInScene("obj_noteCouple", sceneObj)
    local agent116 = AgentFindInScene("obj_bottlePoison", sceneObj)
    local agent117 = AgentFindInScene("obj_chairDiningA", sceneObj)
    local agent118 = AgentFindInScene("obj_chairWoodA", sceneObj)
    local agent119 = AgentFindInScene("obj_tiesZombieBench", sceneObj)
    local agent120 = AgentFindInScene("obj_skullDeer", sceneObj)
    local agent121 = AgentFindInScene("obj_arrow01", sceneObj)
    local agent122 = AgentFindInScene("obj_arrow02", sceneObj)
    local agent123 = AgentFindInScene("obj_arrow03", sceneObj)
    local agent124 = AgentFindInScene("obj_noteCouple", sceneObj)
    local agent125 = AgentFindInScene("obj_zombieChoppedFingers", sceneObj)
    local agent126 = AgentFindInScene("obj_treeTemp", sceneObj)
    local agent127 = AgentFindInScene("obj_doorBackTrainStation", sceneObj)
    local agent128 = AgentFindInScene("obj_doorTicketBoothTrainStation", sceneObj)
    local agent129 = AgentFindInScene("obj_rockBoulderTrainStationHillA", sceneObj)
    local agent130 = AgentFindInScene("obj_treeSmallTrainStationHillA", sceneObj)
    local agent131 = AgentFindInScene("obj_treeSmallTrainStationHillB", sceneObj)
    local agent132 = AgentFindInScene("obj_treeSmallTrainStationHillC", sceneObj)
    local agent133 = AgentFindInScene("obj_treeSmallTrainStationHillD", sceneObj)
    local agent134 = AgentFindInScene("obj_tireSwingTrainStation", sceneObj)
    local agent135 = AgentFindInScene("obj_logicalBarrel", sceneObj)
    local agent136 = AgentFindInScene("obj_logicalBell", sceneObj)
    local agent137 = AgentFindInScene("obj_logicalGarden", sceneObj)
    local agent138 = AgentFindInScene("obj_logicalSign", sceneObj)
    local agent139 = AgentFindInScene("obj_logicalTireSwing", sceneObj)
    local agent140 = AgentFindInScene("obj_logicalZombieCouple", sceneObj)
    local agent141 = AgentFindInScene("obj_logicalJarBeans", sceneObj)
    local agent142 = AgentFindInScene("obj_logicalCanPeaches", sceneObj)
    local agent143 = AgentFindInScene("obj_logicalDoorBooth", sceneObj)
    local agent144 = AgentFindInScene("obj_logicalWindowBooth", sceneObj)
    local agent145 = AgentFindInScene("obj_logicalCrib", sceneObj)
    local agent146 = AgentFindInScene("obj_logicalMattress", sceneObj)
    local agent147 = AgentFindInScene("obj_keysMuscleCar", sceneObj)
    local agent148 = AgentFindInScene("obj_logicalBrake", sceneObj)
    local agent149 = AgentFindInScene("obj_logicalShifter", sceneObj)
    local agent150 = AgentFindInScene("trigger_dialog_ajTrapsZombie", sceneObj)
    local agent151 = AgentFindInScene("trigger_dialog_ajWarning", sceneObj)
    local agent152 = AgentFindInScene("trigger_dialog_boothExit", sceneObj)
    local agent153 = AgentFindInScene("trigger_dialog_caughtByTrappedZombie", sceneObj)
    local agent154 = AgentFindInScene("trigger_dialog_zombieStands", sceneObj)
    local agent155 = AgentFindInScene("trigger_dialog_cameraTutorial", sceneObj)
    local agent156 = AgentFindInScene("trigger_dialog_firstZombie", sceneObj)
    local agent157 = AgentFindInScene("trigger_cam_nav_car", sceneObj)
    local agent158 = AgentFindInScene("trigger_chore_cam_nav_car_depth", sceneObj)
    local agent159 = AgentFindInScene("trigger_chore_cam_nav_car_width", sceneObj)
    local agent160 = AgentFindInScene("trigger_dialog_letsGo", sceneObj)
    
    destroyMe(agent1)
    destroyMe(agent2)
    destroyMe(agent3)
    destroyMe(agent4)
    destroyMe(agent5)
    destroyMe(agent6)
    destroyMe(agent7)
    destroyMe(agent8)
    destroyMe(agent9)
    destroyMe(agent10)
    destroyMe(agent11)
    destroyMe(agent12)
    destroyMe(agent13)
    destroyMe(agent14)
    destroyMe(agent15)
    destroyMe(agent16)
    destroyMe(agent17)
    destroyMe(agent18)
    destroyMe(agent19)
    destroyMe(agent20)
    destroyMe(agent21)
    destroyMe(agent22)
    destroyMe(agent23)
    destroyMe(agent24)
    destroyMe(agent25)
    destroyMe(agent26)
    destroyMe(agent27)
    destroyMe(agent28)
    destroyMe(agent29)
    destroyMe(agent30)
    destroyMe(agent31)
    destroyMe(agent32)
    destroyMe(agent33)
    destroyMe(agent34)
    destroyMe(agent35)
    destroyMe(agent36)
    destroyMe(agent37)
    destroyMe(agent38)
    destroyMe(agent39)
    destroyMe(agent40)
    destroyMe(agent41)
    destroyMe(agent42)
    destroyMe(agent43)
    destroyMe(agent44)
    destroyMe(agent45)
    destroyMe(agent46)
    destroyMe(agent47)
    destroyMe(agent48)
    destroyMe(agent49)
    destroyMe(agent50)
    destroyMe(agent51)
    destroyMe(agent52)
    destroyMe(agent53)
    destroyMe(agent54)
    destroyMe(agent55)
    destroyMe(agent56)
    destroyMe(agent57)
    destroyMe(agent58)
    destroyMe(agent59)
    destroyMe(agent60)
    destroyMe(agent61)
    destroyMe(agent62)
    destroyMe(agent63)
    destroyMe(agent64)
    destroyMe(agent65)
    destroyMe(agent66)
    destroyMe(agent67)
    destroyMe(agent68)
    destroyMe(agent69)
    destroyMe(agent70)
    destroyMe(agent71)
    destroyMe(agent72)
    destroyMe(agent73)
    destroyMe(agent74)
    destroyMe(agent75)
    destroyMe(agent76)
    destroyMe(agent77)
    destroyMe(agent78)
    destroyMe(agent79)
    destroyMe(agent80)
    destroyMe(agent81)
    destroyMe(agent82)
    destroyMe(agent83)
    destroyMe(agent84)
    destroyMe(agent85)
    destroyMe(agent86)
    destroyMe(agent87)
    destroyMe(agent88)
    destroyMe(agent89)
    destroyMe(agent90)
    destroyMe(agent91)
    destroyMe(agent92)
    destroyMe(agent93)
    destroyMe(agent94)
    destroyMe(agent95)
    destroyMe(agent96)
    destroyMe(agent97)
    destroyMe(agent98)
    destroyMe(agent99)
    destroyMe(agent100)
    destroyMe(agent101)
    destroyMe(agent102)
    destroyMe(agent103)
    destroyMe(agent104)
    destroyMe(agent105)
    destroyMe(agent106)
    destroyMe(agent107)
    destroyMe(agent108)
    destroyMe(agent109)
    destroyMe(agent110)
    destroyMe(agent111)
    destroyMe(agent112)
    destroyMe(agent113)
    destroyMe(agent114)
    destroyMe(agent115)
    destroyMe(agent116)
    destroyMe(agent117)
    destroyMe(agent118)
    destroyMe(agent119)
    destroyMe(agent120)
    destroyMe(agent121)
    destroyMe(agent122)
    destroyMe(agent123)
    destroyMe(agent124)
    destroyMe(agent125)
    destroyMe(agent126)
    destroyMe(agent127)
    destroyMe(agent128)
    destroyMe(agent129)
    destroyMe(agent130)
    destroyMe(agent131)
    destroyMe(agent132)
    destroyMe(agent133)
    destroyMe(agent134)
    destroyMe(agent135)
    destroyMe(agent136)
    destroyMe(agent137)
    destroyMe(agent138)
    destroyMe(agent139)
    destroyMe(agent140)
    destroyMe(agent141)
    destroyMe(agent142)
    destroyMe(agent143)
    destroyMe(agent144)
    destroyMe(agent145)
    destroyMe(agent146)
    destroyMe(agent147)
    destroyMe(agent148)
    destroyMe(agent149)
    destroyMe(agent149)
    destroyMe(agent150)
    destroyMe(agent151)
    destroyMe(agent152)
    destroyMe(agent153)
    destroyMe(agent154)
    destroyMe(agent155)
    destroyMe(agent156)
    destroyMe(agent157)
    destroyMe(agent158)
    destroyMe(agent159)
    destroyMe(agent160)
    
    
    
    local agent161 = AgentFindInScene("obj_vehicleMuscleCar", sceneObj)
    local agent162 = AgentFindInScene("obj_keysMuscleCar", sceneObj)
    local agent163 = AgentFindInScene("obj_mirrorFrameMuscleCar", sceneObj)
    local agent164 = AgentFindInScene("obj_mirrorMuscleCarRenderToTexture", sceneObj)
    local agent165 = AgentFindInScene("obj_mirrorMuscleCar", sceneObj)
    local agent166 = AgentFindInScene("obj_seatBeltMuscleCar", sceneObj)
    destroyMe(agent161)
    destroyMe(agent162)
    destroyMe(agent163)
    destroyMe(agent164)
    destroyMe(agent165)
    destroyMe(agent166)
end

CreateClemHouse = function(sceneObj)
    local newPosition = Vector(0, 0, 0)

    local agent1_prop = "adv_clementineHouse400_meshesAHouse.prop"
    local agent1      = AgentCreate("adv_clementineHouse400_meshesAHouse", agent1_prop, newPosition, Vector(0,0,0), sceneObj, false, false)
    
    local agent2_prop = "adv_clementineHouse400_meshesAFence.prop"
    local agent2      = AgentCreate("adv_clementineHouse400_meshesAFence", agent2_prop, newPosition, Vector(0,0,0), sceneObj, false, false)

    local agent3_prop = "adv_clementineHouse400_meshesAGarage.prop"
    local agent3      = AgentCreate("adv_clementineHouse400_meshesAGarage", agent3_prop, newPosition, Vector(0,0,0), sceneObj, false, false)
    
    local agent4_prop = "adv_clementineHouse400_meshesAGlass.prop"
    local agent4      = AgentCreate("adv_clementineHouse400_meshesAGlass", agent4_prop, newPosition, Vector(0,0,0), sceneObj, false, false)
    
    local agent5_prop = "adv_clementineHouse400_meshesAGrass.prop"
    local agent5      = AgentCreate("adv_clementineHouse400_meshesAGrass", agent5_prop, newPosition, Vector(0,0,0), sceneObj, false, false)

    local agent6_prop = "adv_clementineHouse400_meshesAHouseInterior.prop"
    local agent6      = AgentCreate("adv_clementineHouse400_meshesAHouseInterior", agent6_prop, newPosition, Vector(0,0,0), sceneObj, false, false)
    
    local agent7_prop = "adv_clementineHouse400_meshesAIvy.prop"
    local agent7      = AgentCreate("adv_clementineHouse400_meshesAIvy", agent7_prop, newPosition, Vector(0,0,0), sceneObj, false, false)
    
    local agent8_prop = "adv_clementineHouse400_meshesATerrain.prop"
    local agent8      = AgentCreate("adv_clementineHouse400_meshesATerrain", agent8_prop, newPosition, Vector(0,0,0), sceneObj, false, false)
    
    local agent9_prop = "adv_clementineHouse400_meshesATreeFlats.prop"
    local agent9      = AgentCreate("adv_clementineHouse400_meshesATreeFlats", agent9_prop, newPosition, Vector(0,0,0), sceneObj, false, false)
    
    local agent10_prop = "adv_clementineHouse400_meshesATreeHouse.prop"
    local agent10      = AgentCreate("adv_clementineHouse400_meshesATreeHouse", agent10_prop, newPosition, Vector(0,0,0), sceneObj, false, false)
    
    local agent11_prop = "adv_clementineHouse400_meshesATreeHouseTree.prop"
    local agent11      = AgentCreate("adv_clementineHouse400_meshesATreeHouseTree", agent11_prop, newPosition, Vector(0,0,0), sceneObj, false, false)
    
    local agent12_prop = "adv_clementineHouse400_meshesATrees.prop"
    local agent12      = AgentCreate("adv_clementineHouse400_meshesATrees", agent12_prop, newPosition, Vector(0,0,0), sceneObj, false, false)
    
    local agent13_prop = "adv_clementineHouse400_meshesBGrass.prop"
    local agent13      = AgentCreate("adv_clementineHouse400_meshesBGrass", agent13_prop, newPosition, Vector(0,0,0), sceneObj, false, false)
    
    local agent14_prop = "adv_clementineHouse400_meshesBHouse.prop"
    local agent14      = AgentCreate("adv_clementineHouse400_meshesBHouse", agent14_prop, newPosition, Vector(0,0,0), sceneObj, false, false)
    
    local agent15_prop = "adv_clementineHouse400_meshesBTerrain.prop"
    local agent15      = AgentCreate("adv_clementineHouse400_meshesBTerrain", agent15_prop, newPosition, Vector(0,0,0), sceneObj, false, false)
    
    local agent16_prop = "adv_clementineHouse400_meshesBTreeFlats.prop"
    local agent16      = AgentCreate("adv_clementineHouse400_meshesBTreeFlats", agent16_prop, newPosition, Vector(0,0,0), sceneObj, false, false)
    
    local agent17_prop = "adv_clementineHouse400_meshesBTrees.prop"
    local agent17      = AgentCreate("adv_clementineHouse400_meshesBTrees", agent17_prop, newPosition, Vector(0,0,0), sceneObj, false, false)
    
    local agent18_prop = "adv_clementineHouse400_meshesCGrass.prop"
    local agent18      = AgentCreate("adv_clementineHouse400_meshesCGrass", agent18_prop, newPosition, Vector(0,0,0), sceneObj, false, false)
    
    local agent19_prop = "adv_clementineHouse400_meshesCHouse.prop"
    local agent19      = AgentCreate("adv_clementineHouse400_meshesCHouse", agent19_prop, newPosition, Vector(0,0,0), sceneObj, false, false)
    
    local agent20_prop = "adv_clementineHouse400_meshesCTerrain.prop"
    local agent20      = AgentCreate("adv_clementineHouse400_meshesCTerrain", agent20_prop, newPosition, Vector(0,0,0), sceneObj, false, false)
    
    local agent21_prop = "adv_clementineHouse400_meshesCTrees.prop"
    local agent21      = AgentCreate("adv_clementineHouse400_meshesCTrees", agent21_prop, newPosition, Vector(0,0,0), sceneObj, false, false)
    
    local agent22_prop = "adv_clementineHouse400_meshesDHouse.prop"
    local agent22      = AgentCreate("adv_clementineHouse400_meshesDHouse", agent22_prop, newPosition, Vector(0,0,0), sceneObj, false, false)
    
    local agent23_prop = "adv_clementineHouse400_meshesDTerrain.prop"
    local agent23      = AgentCreate("adv_clementineHouse400_meshesDTerrain", agent23_prop, newPosition, Vector(0,0,0), sceneObj, false, false)
    
    local agent24_prop = "adv_clementineHouse400_meshesDTreeFlats.prop"
    local agent24      = AgentCreate("adv_clementineHouse400_meshesDTreeFlats", agent24_prop, newPosition, Vector(0,0,0), sceneObj, false, false)
    
    
    ResourceSetEnable("WalkingDead101")
    --set walkboxes
    local walkbox_file = "adv_clementineHouseExterior.wbox"
    SceneSetWalkBoxes(sceneObj, walkbox_file)
end

LoadOldGameSceneTest = function(sceneObj)
    ResourceSetEnable("ProjectSeason1")
    ResourceSetEnable("WalkingDead102")
    ResourceSetEnable("ProjectS1_EnviormentMats")
    
    PropertyRemove(sceneObj, "Walk Boxes")
    
    --Prop adv_dairyExteriorDay_distGround:
    local agent0_prop = "adv_dairyExteriorDay_distGround.prop"
    local agent0      = AgentCreate("adv_dairyExteriorDay_distGround", agent0_prop, Vector(0, 0, 0), Vector(0, 0, 0), sceneObj, false, false)

    --Prop adv_dairyExteriorDay_distTrees:
    local agent1_prop = "adv_dairyExteriorDay_distTrees.prop"
    local agent1      = AgentCreate("adv_dairyExteriorDay_distTrees", agent1_prop, Vector(0, 0, 0), Vector(0, 0, 0), sceneObj, false, false)

    --Prop adv_dairyExteriorDay_meshesA:
    local agent2_prop = "adv_dairyExteriorDay_meshesA.prop"
    local agent2      = AgentCreate("adv_dairyExteriorDay_meshesA", agent2_prop, Vector(0, 0, 0), Vector(0, 0, 0), sceneObj, false, false)

    --Prop adv_dairyExteriorDay_meshesB:
    local agent3_prop = "adv_dairyExteriorDay_meshesB.prop"
    local agent3      = AgentCreate("adv_dairyExteriorDay_meshesB", agent3_prop, Vector(0, 0, 0), Vector(0, 0, 0), sceneObj, false, false)

    --Prop adv_dairyExteriorDay_meshesC:
    local agent4_prop = "adv_dairyExteriorDay_meshesC.prop"
    local agent4      = AgentCreate("adv_dairyExteriorDay_meshesC", agent4_prop, Vector(0, 0, 0), Vector(0, 0, 0), sceneObj, false, false)

    --Prop adv_dairyExteriorDay_meshesD:
    local agent5_prop = "adv_dairyExteriorDay_meshesD.prop"
    local agent5      = AgentCreate("adv_dairyExteriorDay_meshesD", agent5_prop, Vector(0, 0, 0), Vector(0, 0, 0), sceneObj, false, false)

    --Prop adv_dairyExteriorDay_meshesE:
    local agent6_prop = "adv_dairyExteriorDay_meshesE.prop"
    local agent6      = AgentCreate("adv_dairyExteriorDay_meshesE", agent6_prop, Vector(0, 0, 0), Vector(0, 0, 0), sceneObj, false, false)

    --Prop adv_dairyExteriorDay_meshesF:
    local agent7_prop = "adv_dairyExteriorDay_meshesF.prop"
    local agent7      = AgentCreate("adv_dairyExteriorDay_meshesF", agent7_prop, Vector(0, 0, 0), Vector(0, 0, 0), sceneObj, false, false)

    --Prop adv_dairyExteriorDay_meshesG:
    local agent8_prop = "adv_dairyExteriorDay_meshesG.prop"
    local agent8      = AgentCreate("adv_dairyExteriorDay_meshesG", agent8_prop, Vector(0, 0, 0), Vector(0, 0, 0), sceneObj, false, false)

    --Prop adv_dairyExteriorDay_meshesH:
    local agent9_prop = "adv_dairyExteriorDay_meshesH.prop"
    local agent9      = AgentCreate("adv_dairyExteriorDay_meshesH", agent9_prop, Vector(0, 0, 0), Vector(0, 0, 0), sceneObj, false, false)

    --Prop adv_dairyExteriorDay_meshesI:
    local agent10_prop = "adv_dairyExteriorDay_meshesI.prop"
    local agent10      = AgentCreate("adv_dairyExteriorDay_meshesI", agent10_prop, Vector(0, 0, 0), Vector(0, 0, 0), sceneObj, false, false)

    --Prop adv_dairyExteriorDay_meshesJ:
    local agent11_prop = "adv_dairyExteriorDay_meshesJ.prop"
    local agent11      = AgentCreate("adv_dairyExteriorDay_meshesJ", agent11_prop, Vector(0, 0, 0), Vector(0, 0, 0), sceneObj, false, false)
end


CreateHershelFarmThing = function(sceneObj)
    ResourceSetEnable("ProjectSeason1")
    ResourceSetEnable("WalkingDead101")
    --ResourceSetEnable("WalkingDead102")

    local agent1_prop = "adv_hershelFarmExterior_meshesA.prop"
    local agent1      = AgentCreate("adv_hershelFarmExterior_meshesA", agent1_prop, Vector(0,0,0), Vector(0,0,0), sceneObj, false, false)
    
    local agent2_prop = "adv_hershelFarmExterior_meshesB.prop"
    local agent2      = AgentCreate("adv_hershelFarmExterior_meshesB", agent2_prop, Vector(0,0,0), Vector(0,0,0), sceneObj, false, false)

    local agent3_prop = "adv_hershelFarmExterior_meshesB_foliage.prop"
    local agent3      = AgentCreate("adv_hershelFarmExterior_meshesB_foliage", agent3_prop, Vector(0,0,0), Vector(0,0,0), sceneObj, false, false)
    
    local agent4_prop = "adv_hershelFarmExterior_meshesC.prop"
    local agent4      = AgentCreate("adv_hershelFarmExterior_meshesC", agent4_prop, Vector(0,0,0), Vector(0,0,0), sceneObj, false, false)
    
    local agent5_prop = "adv_hershelFarmExterior_meshesC_decals.prop"
    local agent5      = AgentCreate("adv_hershelFarmExterior_meshesC_decals", agent5_prop, Vector(0,0,0), Vector(0,0,0), sceneObj, false, false)

    local agent6_prop = "adv_hershelFarmExterior_meshesC_foliage.prop"
    local agent6      = AgentCreate("adv_hershelFarmExterior_meshesC_foliage", agent6_prop, Vector(0,0,0), Vector(0,0,0), sceneObj, false, false)
    
    local agent7_prop = "adv_hershelFarmExterior_meshesD.prop"
    local agent7      = AgentCreate("adv_hershelFarmExterior_meshesD", agent7_prop, Vector(0,0,0), Vector(0,0,0), sceneObj, false, false)
    
    local agent8_prop = "adv_hershelFarmExterior_meshesD_decals.prop"
    local agent8      = AgentCreate("adv_hershelFarmExterior_meshesD_decals", agent8_prop, Vector(0,0,0), Vector(0,0,0), sceneObj, false, false)
    
    local agent9_prop = "adv_hershelFarmExterior_meshesD_foliage.prop"
    local agent9      = AgentCreate("adv_hershelFarmExterior_meshesD_foliage", agent9_prop, Vector(0,0,0), Vector(0,0,0), sceneObj, false, false)
    
    local agent10_prop = "adv_hershelFarmExterior_meshesE.prop"
    local agent10      = AgentCreate("adv_hershelFarmExterior_meshesE", agent10_prop, Vector(0,0,0), Vector(0,0,0), sceneObj, false, false)
    
    local agent11_prop = "adv_hershelFarmExterior_meshesE_decals.prop"
    local agent11      = AgentCreate("adv_hershelFarmExterior_meshesE_decals", agent11_prop, Vector(0,0,0), Vector(0,0,0), sceneObj, false, false)
    
    local agent12_prop = "adv_hershelFarmExterior_meshesF.prop"
    local agent12      = AgentCreate("adv_hershelFarmExterior_meshesF", agent12_prop, Vector(0,0,0), Vector(0,0,0), sceneObj, false, false)
    
    local agent13_prop = "adv_hershelFarmExterior_meshesF_decals.prop"
    local agent13      = AgentCreate("adv_hershelFarmExterior_meshesF_decals", agent13_prop, Vector(0,0,0), Vector(0,0,0), sceneObj, false, false)
    
    local agent14_prop = "adv_hershelFarmExterior_meshesG.prop"
    local agent14      = AgentCreate("adv_hershelFarmExterior_meshesG", agent14_prop, Vector(0,0,0), Vector(0,0,0), sceneObj, false, false)
    
    local agent15_prop = "adv_hershelFarmExterior_meshesH.prop"
    local agent15      = AgentCreate("adv_hershelFarmExterior_meshesH", agent15_prop, Vector(0,0,0), Vector(0,0,0), sceneObj, false, false)
    
    local agent16_prop = "adv_hershelFarmExterior_meshesH_decals.prop"
    local agent16      = AgentCreate("adv_hershelFarmExterior_meshesH_decals", agent16_prop, Vector(0,0,0), Vector(0,0,0), sceneObj, false, false)
    
    local agent17_prop = "adv_hershelFarmExterior_meshesI.prop"
    local agent17      = AgentCreate("adv_hershelFarmExterior_meshesI", agent17_prop, Vector(0,0,0), Vector(0,0,0), sceneObj, false, false)
    
    local agent18_prop = "adv_hershelFarmExterior_meshesJ.prop"
    local agent18      = AgentCreate("adv_hershelFarmExterior_meshesJ", agent18_prop, Vector(0,0,0), Vector(0,0,0), sceneObj, false, false)
    
    local agent19_prop = "adv_hershelFarmExterior_meshesK.prop"
    local agent19      = AgentCreate("adv_hershelFarmExterior_meshesK", agent19_prop, Vector(0,0,0), Vector(0,0,0), sceneObj, false, false)
    
    local agent20_prop = "adv_hershelFarmExterior_meshesK_distGround.prop"
    local agent20      = AgentCreate("adv_hershelFarmExterior_meshesK_distGround", agent20_prop, Vector(0,0,0), Vector(0,0,0), sceneObj, false, false)
    
    local agent21_prop = "adv_hershelFarmExterior_meshesL.prop"
    local agent21      = AgentCreate("adv_hershelFarmExterior_meshesL", agent21_prop, Vector(0,0,0), Vector(0,0,0), sceneObj, false, false)
    
    local agent22_prop = "adv_hershelFarmExterior_meshesL_decals.prop"
    local agent22      = AgentCreate("adv_hershelFarmExterior_meshesL_decals", agent22_prop, Vector(0,0,0), Vector(0,0,0), sceneObj, false, false)
    
    local agent23_prop = "adv_hershelFarmExterior_meshesL_distGround.prop"
    local agent23      = AgentCreate("adv_hershelFarmExterior_meshesL_distGround", agent23_prop, Vector(0,0,0), Vector(0,0,0), sceneObj, false, false)
    
    local agent24_prop = "adv_hershelFarmExterior_meshesM.prop"
    local agent24      = AgentCreate("adv_hershelFarmExterior_meshesM", agent24_prop, Vector(0,0,0), Vector(0,0,0), sceneObj, false, false)
    
    local agent25_prop = "adv_hershelFarmExterior_meshesM_decals.prop"
    local agent25      = AgentCreate("adv_hershelFarmExterior_meshesM_decals", agent25_prop, Vector(0,0,0), Vector(0,0,0), sceneObj, false, false)
    
    local agent26_prop = "adv_hershelFarmExterior_meshesM_distGround.prop"
    local agent26      = AgentCreate("adv_hershelFarmExterior_meshesM_distGround", agent26_prop, Vector(0,0,0), Vector(0,0,0), sceneObj, false, false)
    
    --ShaderRestoreAllTextures
    
    --set walkboxes
    local walkbox_file = "adv_hershelFarmExterior.wbox"
    SceneSetWalkBoxes(sceneObj, walkbox_file)
end

LoadEpilougeTrain = function(sceneObj)
    ResourceSetEnable("ProjectSeason1")
    ResourceSetEnable("WalkingDead103")
    ResourceSetEnable("ProjectS1_EnviormentMats")
    
    PropertyRemove(sceneObj, "Walk Boxes")
    --RemovingAgentsWithPrefix(sceneObj, "light_")
    
    --Prop obj_trainTileEpilogueA:
    local agent0_prop = "obj_trainTileEpilogueA.prop"
    local agent0      = AgentCreate("obj_trainTileEpilogueA", agent0_prop, Vector(0, 0, 0), Vector(0, 0, 0), sceneObj, false, false)

    --Prop obj_trainTileEpilogueB:
    local agent1_prop = "obj_trainTileEpilogueB.prop"
    local agent1      = AgentCreate("obj_trainTileEpilogueB", agent1_prop, Vector(0, 0, 0), Vector(0, 0, 0), sceneObj, false, false)

    --Prop obj_trainEngine:
    local agent2_prop = "obj_trainEngine.prop"
    local agent2      = AgentCreate("obj_trainEngine", agent2_prop, Vector(0, 0, 0), Vector(0, 0, 0), sceneObj, false, false)

    --Prop obj_trainBoxcar:
    local agent3_prop = "obj_trainBoxcar.prop"
    local agent3      = AgentCreate("obj_trainBoxcar", agent3_prop, Vector(0, 0, 0), Vector(0, 0, 0), sceneObj, false, false)

    --Prop obj_trainTileEpilogueA01:
    local agent4_prop = "obj_trainTileEpilogueA01.prop"
    local agent4      = AgentCreate("obj_trainTileEpilogueA01", agent4_prop, Vector(0, 0, 0), Vector(0, 0, 0), sceneObj, false, false)

    --Prop obj_trainTileEpilogueA02:
    local agent5_prop = "obj_trainTileEpilogueA02.prop"
    local agent5      = AgentCreate("obj_trainTileEpilogueA02", agent5_prop, Vector(0, 0, 0), Vector(0, 0, 0), sceneObj, false, false)

    --Prop obj_trainTileEpilogueB01:
    local agent6_prop = "obj_trainTileEpilogueB01.prop"
    local agent6      = AgentCreate("obj_trainTileEpilogueB01", agent6_prop, Vector(0, 0, 0), Vector(0, 0, 0), sceneObj, false, false)

    --Prop adv_dairyExteriorDay_meshesF:
    local agent7_prop = "obj_trainTileEpilogueB02.prop"
    local agent7      = AgentCreate("obj_trainTileEpilogueB02", agent7_prop, Vector(0, 0, 0), Vector(0, 0, 0), sceneObj, false, false)

    --Prop obj_trainTileEpilogueParent:
    local agent8_prop = "obj_trainTileEpilogueParent.prop"
    local agent8      = AgentCreate("obj_trainTileEpilogueParent", agent8_prop, Vector(0, 0, 0), Vector(0, 0, 0), sceneObj, false, false)

    --Prop obj_houseEpilogueA:
    local agent9_prop = "obj_houseEpilogueA.prop"
    local agent9      = AgentCreate("obj_houseEpilogueA", agent9_prop, Vector(0, 0, 0), Vector(0, 0, 0), sceneObj, false, false)

    --Prop obj_houseEpilogueB:
    local agent10_prop = "obj_houseEpilogueB.prop"
    local agent10      = AgentCreate("obj_houseEpilogueB", agent10_prop, Vector(0, 0, 0), Vector(0, 0, 0), sceneObj, false, false)

    --Prop obj_houseEpilogueC:
    local agent11_prop = "obj_houseEpilogueC.prop"
    local agent11      = AgentCreate("obj_houseEpilogueC", agent11_prop, Vector(0, 0, 0), Vector(0, 0, 0), sceneObj, false, false)
    
        --Prop obj_houseEpilogueD:
        local agent12_prop = "obj_houseEpilogueD.prop"
        local agent12      = AgentCreate("obj_houseEpilogueD", agent12_prop, Vector(0, 0, 0), Vector(0, 0, 0), sceneObj, false, false)
    
        --Prop obj_houseEpilogueE:
        local agent13_prop = "obj_houseEpilogueE.prop"
        local agent13      = AgentCreate("obj_houseEpilogueE", agent13_prop, Vector(0, 0, 0), Vector(0, 0, 0), sceneObj, false, false)
    
        --Prop obj_houseEpilogueF:
        local agent14_prop = "obj_houseEpilogueF.prop"
        local agent14      = AgentCreate("obj_houseEpilogueF", agent14_prop, Vector(0, 0, 0), Vector(0, 0, 0), sceneObj, false, false)
    
        --Prop obj_trainTileEpilogueC:
        local agent15_prop = "obj_trainTileEpilogueC.prop"
        local agent15      = AgentCreate("obj_trainTileEpilogueC", agent15_prop, Vector(0, 0, 0), Vector(0, 0, 0), sceneObj, false, false)
    
        --Prop obj_trainTileBushesA:
        local agent16_prop = "obj_trainTileBushesA.prop"
        local agent16      = AgentCreate("obj_trainTileBushesA", agent16_prop, Vector(0, 0, 0), Vector(0, 0, 0), sceneObj, false, false)
    
        --Prop obj_trainTileBushesA01:
        local agent17_prop = "obj_trainTileBushesA01.prop"
        local agent17      = AgentCreate("obj_trainTileBushesA01", agent17_prop, Vector(0, 0, 0), Vector(0, 0, 0), sceneObj, false, false)
    
        --Prop obj_trainTileBushesA02:
        local agent18_prop = "obj_trainTileBushesA02.prop"
        local agent18      = AgentCreate("obj_trainTileBushesA02", agent18_prop, Vector(0, 0, 0), Vector(0, 0, 0), sceneObj, false, false)
    
        --Prop obj_trainTileBushesB01:
        local agent19_prop = "obj_trainTileBushesB01.prop"
        local agent19      = AgentCreate("obj_trainTileBushesB01", agent19_prop, Vector(0, 0, 0), Vector(0, 0, 0), sceneObj, false, false)
    
        --Prop obj_trainTileBushesB02:
        local agent20_prop = "obj_trainTileBushesB02.prop"
        local agent20      = AgentCreate("obj_trainTileBushesB02", agent20_prop, Vector(0, 0, 0), Vector(0, 0, 0), sceneObj, false, false)
end

CreateWellingtonSeasonThree = function(sceneObj)
    ResourceSetEnable("ProjectSeason3")
    ResourceSetEnable("WalkingDead301")
    
    --ResourceSetDisable("WalkingDead401")
    --ResourceSetDisable("ProjectSeason4")
    
    local main_prop = "adv_wellington301.prop"
    PreLoad(main_prop)
    local main      = AgentCreate("adv_wellington301", main_prop, Vector(0,0,0), Vector(0,0,0), sceneObj, false, false)
    
    local agent1_prop = "adv_wellington301_meshesA.prop"
    PreLoad(agent1_prop)
    local agent1      = AgentCreate("adv_wellington301_meshesA", agent1_prop, Vector(0,0,0), Vector(0,0,0), sceneObj, false, false)
    
    local agent2_prop = "adv_wellington301_meshesB.prop"
    PreLoad(agent2_prop)
    local agent2      = AgentCreate("adv_wellington301_meshesB", agent2_prop, Vector(0,0,0), Vector(0,0,0), sceneObj, false, false)

    local agent3_prop = "adv_wellington301_meshesBBushes.prop"
    PreLoad(agent3_prop)
    local agent3      = AgentCreate("adv_wellington301_meshesBBushes", agent3_prop, Vector(0,0,0), Vector(0,0,0), sceneObj, false, false)
    
    local agent4_prop = "adv_wellington301_meshesBGrass.prop"
    PreLoad(agent4_prop)
    local agent4      = AgentCreate("adv_wellington301_meshesBGrass", agent4_prop, Vector(0,0,0), Vector(0,0,0), sceneObj, false, false)
    
    local agent5_prop = "adv_wellington301_meshesBPuddles.prop"
    PreLoad(agent5_prop)
    local agent5      = AgentCreate("adv_wellington301_meshesBPuddles", agent5_prop, Vector(0,0,0), Vector(0,0,0), sceneObj, false, false)

    local agent6_prop = "adv_wellington301_meshesBTrees.prop"
    PreLoad(agent6_prop)
    local agent6      = AgentCreate("adv_wellington301_meshesBTrees", agent6_prop, Vector(0,0,0), Vector(0,0,0), sceneObj, false, false)
    
    local agent7_prop = "adv_wellington301_meshesC.prop"
    PreLoad(agent7_prop)
    local agent7      = AgentCreate("adv_wellington301_meshesC", agent7_prop, Vector(0,0,0), Vector(0,0,0), sceneObj, false, false)
    
    local agent8_prop = "adv_wellington301_meshesCBushes.prop"
    PreLoad(agent8_prop)
    local agent8      = AgentCreate("adv_wellington301_meshesCBushes", agent8_prop, Vector(0,0,0), Vector(0,0,0), sceneObj, false, false)
    
    local agent9_prop = "adv_wellington301_meshesCGrass.prop"
    PreLoad(agent9_prop)
    local agent9      = AgentCreate("adv_wellington301_meshesCGrass", agent9_prop, Vector(0,0,0), Vector(0,0,0), sceneObj, false, false)
    
    local agent10_prop = "adv_wellington301_meshesCTreeCards.prop"
    PreLoad(agent10_prop)
    local agent10      = AgentCreate("adv_wellington301_meshesCTreeCards", agent10_prop, Vector(0,0,0), Vector(0,0,0), sceneObj, false, false)
    
    local agent11_prop = "adv_wellington301_meshesD.prop"
    PreLoad(agent11_prop)
    local agent11      = AgentCreate("adv_wellington301_meshesD", agent11_prop, Vector(0,0,0), Vector(0,0,0), sceneObj, false, false)
    
    local agent12_prop = "adv_wellington301_meshesDBushes.prop"
    PreLoad(agent12_prop)
    local agent12      = AgentCreate("adv_wellington301_meshesDBushes", agent12_prop, Vector(0,0,0), Vector(0,0,0), sceneObj, false, false)
    
    local agent13_prop = "adv_wellington301_meshesDGrass.prop"
    PreLoad(agent13_prop)
    local agent13      = AgentCreate("adv_wellington301_meshesDGrass", agent13_prop, Vector(0,0,0), Vector(0,0,0), sceneObj, false, false)
    
    local agent14_prop = "adv_wellington301_meshesDTreeCards.prop"
    PreLoad(agent14_prop)
    local agent14      = AgentCreate("adv_wellington301_meshesDTreeCards", agent14_prop, Vector(0,0,0), Vector(0,0,0), sceneObj, false, false)
    
    local agent15_prop = "adv_wellington301_meshesDTrees.prop"
    PreLoad(agent15_prop)
    local agent15      = AgentCreate("adv_wellington301_meshesDTrees", agent15_prop, Vector(0,0,0), Vector(0,0,0), sceneObj, false, false)
    
    local agent16_prop = "adv_wellington301_meshesE.prop"
    PreLoad(agent16_prop)
    local agent16      = AgentCreate("adv_wellington301_meshesE", agent16_prop, Vector(0,0,0), Vector(0,0,0), sceneObj, false, false)
    
    local agent17_prop = "adv_wellington301_meshesEBushes.prop"
    PreLoad(agent17_prop)
    local agent17      = AgentCreate("adv_wellington301_meshesEBushes", agent17_prop, Vector(0,0,0), Vector(0,0,0), sceneObj, false, false)
    
    local agent18_prop = "adv_wellington301_meshesEGrass.prop"
    PreLoad(agent18_prop)
    local agent18      = AgentCreate("adv_wellington301_meshesEGrass", agent18_prop, Vector(0,0,0), Vector(0,0,0), sceneObj, false, false)
    
    local agent19_prop = "adv_wellington301_meshesETreeCards.prop"
    PreLoad(agent19_prop)
    local agent19      = AgentCreate("adv_wellington301_meshesETreeCards", agent19_prop, Vector(0,0,0), Vector(0,0,0), sceneObj, false, false)
    
    local agent20_prop = "adv_wellington301_meshesETrees.prop"
    PreLoad(agent20_prop)
    local agent20      = AgentCreate("adv_wellington301_meshesETrees", agent20_prop, Vector(0,0,0), Vector(0,0,0), sceneObj, false, false)
    
    local agent21_prop = "adv_wellington301_meshesF.prop"
    PreLoad(agent21_prop)
    local agent21      = AgentCreate("adv_wellington301_meshesF", agent21_prop, Vector(0,0,0), Vector(0,0,0), sceneObj, false, false)
    
    local agent22_prop = "adv_wellington301_meshesFBushes.prop"
    PreLoad(agent22_prop)
    local agent22      = AgentCreate("adv_wellington301_meshesFBushes", agent22_prop, Vector(0,0,0), Vector(0,0,0), sceneObj, false, false)
    
    local agent23_prop = "adv_wellington301_meshesFGrass.prop"
    PreLoad(agent23_prop)
    local agent23      = AgentCreate("adv_wellington301_meshesFGrass", agent23_prop, Vector(0,0,0), Vector(0,0,0), sceneObj, false, false)
    
    local agent24_prop = "adv_wellington301_meshesFTrees.prop"
    PreLoad(agent24_prop)
    local agent24      = AgentCreate("adv_wellington301_meshesFTrees", agent24_prop, Vector(0,0,0), Vector(0,0,0), sceneObj, false, false)
    
    local agent25_prop = "adv_wellington301_meshesFTreesCards.prop"
    PreLoad(agent25_prop)
    local agent25      = AgentCreate("adv_wellington301_meshesFTreesCards", agent25_prop, Vector(0,0,0), Vector(0,0,0), sceneObj, false, false)
    
    local agent26_prop = "adv_wellington301_meshesG.prop"
    PreLoad(agent26_prop)
    local agent26      = AgentCreate("adv_wellington301_meshesG", agent26_prop, Vector(0,0,0), Vector(0,0,0), sceneObj, false, false)

    local agent27_prop = "adv_wellington301_meshesGBushes.prop"
    PreLoad(agent27_prop)
    local agent27      = AgentCreate("adv_wellington301_meshesGBushes", agent27_prop, Vector(0,0,0), Vector(0,0,0), sceneObj, false, false)
    
    local agent28_prop = "adv_wellington301_meshesGGrass.prop"
    PreLoad(agent28_prop)
    local agent28      = AgentCreate("adv_wellington301_meshesGGrass", agent28_prop, Vector(0,0,0), Vector(0,0,0), sceneObj, false, false)
    
    local agent29_prop = "adv_wellington301_meshesGTreeCards.prop"
    PreLoad(agent29_prop)
    local agent29      = AgentCreate("adv_wellington301_meshesGTreeCards", agent29_prop, Vector(0,0,0), Vector(0,0,0), sceneObj, false, false)
    
    local agent30_prop = "adv_wellington301_meshesH.prop"
    PreLoad(agent30_prop)
    local agent30      = AgentCreate("adv_wellington301_meshesH", agent30_prop, Vector(0,0,0), Vector(0,0,0), sceneObj, false, false)
    
    local agent31_prop = "adv_wellington301_meshesI.prop"
    PreLoad(agent31_prop)
    local agent31      = AgentCreate("adv_wellington301_meshesI", agent31_prop, Vector(0,0,0), Vector(0,0,0), sceneObj, false, false)
    
    local agent32_prop = "adv_wellington301_meshesJ.prop"
    PreLoad(agent32_prop)
    local agent32      = AgentCreate("adv_wellington301_meshesJ", agent32_prop, Vector(0,0,0), Vector(0,0,0), sceneObj, false, false)
    
    --ResourceSetEnable("WalkingDead401")
    --ResourceSetEnable("ProjectSeason4")
end

TrainStation = function()
  
    ModifyScene(kScene)
    CleanUpExistingTrainScene(kScene)
    DrugStoreInterior(kScene)
    
    --PrintSceneListToTXT(kScene, "sceneobject_401-trainstation.txt")
    
    --SwapClemWithFlashbackClem(kScene)
    
    --LoadOldGameSceneTest(kScene) --dairy farm
    
    --CreateHershelFarmThing(kScene)
    --LoadOldGameSceneTest(kScene)
    --LoadEpilougeTrain(kScene)
    
    
    local leeChoreTest_prop = "sk61_lee.prop"
    local leeChoreTest = AgentCreate("sk61_lee_test", leeChoreTest_prop, Vector(7.5,0,0), Vector(0,90,0), kScene, false, false)
    local leeChoreTest_props        = AgentGetRuntimeProperties(leeChoreTest)
    
    Custom_AgentSetProperty("Clementine", "D3D Mesh List", 0, kScene)
    
    --leeChoreTest.controller = ChorePlay("")
    leeChoreTest.controller = PlayAnimationLooping("sk63_action_ajDoesWinningJig.anm")
    leeChoreTest.controller = PlayAnimationLooping("sk63_action_ajDoesWinningJig.anm", true)
    local agent_controller = leeChoreTest.controller

    ControllerSetScene(agent_controller, kScene)
    ControllerSetTimeScale(agent_controller, SceneGetTimeScale(kScene))
    ControllerDisableTimeSync(agent_controller, false)
    ControllerSetTime(agent_controller, 0.0)
    ControllerDrift(agent_controller, true)
    ControllerSetName(agent_controller, AgentGetName(agent))
    ControllerDisableTimeSync(agent_controller, true)
    ControllerSetLooping(agent_controller, true)
    
    
    
    --sound
    CustomSound_Ambient_Setup("soundCustom_ambient", kScene)
    local amb_mus_soundFile = "tlou2_graveyard.wav"
    CustomSound_Ambient_SetProperties("soundCustom_ambient", amb_mus_soundFile, 5.0, 1.0, kScene)
    CustomSound_Ambient_Play("soundCustom_ambient", 1.0, kScene)
    
    
    
    
    --CreateWellingtonSeasonThree(kScene)
    --CreateClemHouse(kScene)
    --SceneAdd(clemHouseTest)
    --ResourceSetEnable("ProjectSeason3")
    --ResourceSetEnable("WalkingDead301")
    --SceneAdd("adv_wellington301.scene")
    --ModifyClemHouseScene(kScene)

    --DlgPreloadAll(Game_GetPlayerDialog(), false)
  --if Game_GetSkipEnterCutscenes() then
  --Game_RunSceneDialog("logic_freeWalkExterior", false)
    --end
    --cs_zombieTime
  Game_SetSceneDialogNode("cs_exit")
  Game_RunSceneDialog("logic_freeWalk", false)

    Devtools_Init(kScene)

    --DevTools_AgentMenuTool_Initalize(kScene)
end

if IsDebugBuild() then
  Callback_OnLogicReady:Add(OnLogicReady)
end
Game_SceneOpen(kScene, kScript)

