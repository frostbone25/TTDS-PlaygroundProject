-- Decompiled using luadec 2.2 rev:  for Lua 5.2 from https://github.com/viruscamp/luadec
-- Command line: A:\Steam\twd-definitive\scripteditor-10-31-20\definitive_lighting_improvements\WDC_pc_WalkingDead103_data\env_epilogue_temp.lua 

-- params : ...
-- function num : 0 , upvalues : _ENV
require("Relighting.lua")
require("PropertyMenuTool.lua")
require("CustomSound.lua")

local kScript = "Epilogue"
local kScene = "adv_trainTileEpilogue"


ModifyScene = function(sceneObj)
    local clemAgent = AgentFindInScene("Clementine", sceneObj)
    local leeAgent = AgentFindInScene("Lee", sceneObj)
    
    
    local sunColor     = RGBColor(255, 180, 35, 255)
    local ambientColor = RGBColor(72,178,255, 255)
    local skyColor     = RGBColor(24, 99, 205, 255)
    --local fogColor     = Desaturate_RGBColor(skyColor, 0.45)
    skyColor = Desaturate_RGBColor(skyColor, 0.2)
    ambientColor = Desaturate_RGBColor(ambientColor, 0.35)
    sunColor = Desaturate_RGBColor(sunColor, 0.1)
    sunColor = Multiplier_RGBColor(sunColor, 1.0)
    
    Custom_AgentSetProperty("light_Directional", "EnvLight - Intensity", 8.0, sceneObj)
    Custom_AgentSetProperty("light_Directional", "EnvLight - Intensity Specular", 1.0, sceneObj)
    Custom_AgentSetProperty("light_Directional", "EnvLight - Enlighten Intensity", 5.0, sceneObj)
    Custom_AgentSetProperty("light_Directional", "EnvLight - Color", sunColor, sceneObj)
    
    Custom_AgentSetProperty("light_Amb", "EnvLight - Intensity", 0.025, sceneObj)
    Custom_AgentSetProperty("light_Amb", "EnvLight - Intensity Specular", 1.0, sceneObj)
    Custom_AgentSetProperty("light_Amb", "EnvLight - Color", ambientColor, sceneObj)
    Custom_RemoveAgent("light_Amb_train", sceneObj)
    --Custom_AgentSetProperty("light_Amb_train", "EnvLight - Intensity", 0.025, sceneObj)
    --Custom_AgentSetProperty("light_Amb_train", "EnvLight - Intensity Specular", 1.0, sceneObj)
    --Custom_AgentSetProperty("light_Amb_train", "EnvLight - Color", ambientColor, sceneObj)
    
    Custom_AgentSetProperty("light_Amb_SKY", "EnvLight - Intensity", 0.5, sceneObj)
    
    
    Custom_AgentSetProperty("light_Spot_ext", "EnvLight - Color", sunColor, sceneObj)
    Custom_AgentSetProperty("light_Spot_ext06", "EnvLight - Color", sunColor, sceneObj)
    Custom_AgentSetProperty("light_Spot_ext07", "EnvLight - Color", sunColor, sceneObj)
    Custom_AgentSetProperty("light_Spot_ext13", "EnvLight - Color", sunColor, sceneObj)
    Custom_AgentSetProperty("light_Spot_ext10", "EnvLight - Color", sunColor, sceneObj)
    Custom_AgentSetProperty("light_Spot_ext17", "EnvLight - Color", sunColor, sceneObj)
    Custom_AgentSetProperty("light_Spot_ext18", "EnvLight - Color", sunColor, sceneObj)
    Custom_AgentSetProperty("light_Spot_ext02", "EnvLight - Color", sunColor, sceneObj)
    Custom_AgentSetProperty("light_Spot_ext19", "EnvLight - Color", sunColor, sceneObj)
    Custom_AgentSetProperty("light_Spot_ext20", "EnvLight - Color", sunColor, sceneObj)
    Custom_AgentSetProperty("light_Spot_ext21", "EnvLight - Color", sunColor, sceneObj)
    Custom_AgentSetProperty("light_Spot_ext22", "EnvLight - Color", sunColor, sceneObj)
    Custom_AgentSetProperty("light_Spot_ext23", "EnvLight - Color", sunColor, sceneObj)
    
    local spotlightIntensities = 1.0
    Custom_AgentSetProperty("light_Spot_ext", "EnvLight - Intensity", spotlightIntensities, sceneObj)
    Custom_AgentSetProperty("light_Spot_ext06", "EnvLight - Intensity", spotlightIntensities, sceneObj)
    Custom_AgentSetProperty("light_Spot_ext07", "EnvLight - Intensity", spotlightIntensities, sceneObj)
    Custom_AgentSetProperty("light_Spot_ext13", "EnvLight - Intensity", spotlightIntensities, sceneObj)
    Custom_AgentSetProperty("light_Spot_ext10", "EnvLight - Intensity", spotlightIntensities, sceneObj)
    Custom_AgentSetProperty("light_Spot_ext17", "EnvLight - Intensity", spotlightIntensities, sceneObj)
    Custom_AgentSetProperty("light_Spot_ext18", "EnvLight - Intensity", spotlightIntensities, sceneObj)
    Custom_AgentSetProperty("light_Spot_ext02", "EnvLight - Intensity", spotlightIntensities, sceneObj)
    Custom_AgentSetProperty("light_Spot_ext19", "EnvLight - Intensity", spotlightIntensities, sceneObj)
    Custom_AgentSetProperty("light_Spot_ext20", "EnvLight - Intensity", spotlightIntensities, sceneObj)
    Custom_AgentSetProperty("light_Spot_ext21", "EnvLight - Intensity", spotlightIntensities, sceneObj)
    Custom_AgentSetProperty("light_Spot_ext22", "EnvLight - Intensity", spotlightIntensities, sceneObj)
    Custom_AgentSetProperty("light_Spot_ext23", "EnvLight - Intensity", spotlightIntensities, sceneObj)
    

    Custom_AgentSetProperty("adv_trainTileEpilogue.scene", "FX anti-aliasing", true, sceneObj)
    Custom_AgentSetProperty("adv_trainTileEpilogue.scene", "FX Sharp Shadows Enabled", true, sceneObj)
    Custom_AgentSetProperty("adv_trainTileEpilogue.scene", "Generate NPR Lines", false, sceneObj)
    Custom_AgentSetProperty("adv_trainTileEpilogue.scene", "Screen Space Lines - Enabled", false, sceneObj)
    Custom_AgentSetProperty("adv_trainTileEpilogue.scene", "FX Ambient Occlusion Enabled", true, sceneObj)
    Custom_AgentSetProperty("adv_trainTileEpilogue.scene", "FX Tonemap Intensity", 1.0, sceneObj)
    Custom_AgentSetProperty("adv_trainTileEpilogue.scene", "FX Tonemap White Point", 5.0, sceneObj)
    --Custom_AgentSetProperty("adv_trainTileEpilogue.scene", "FX Tonemap Black Point", 0.001, sceneObj)
    Custom_AgentSetProperty("adv_trainTileEpilogue.scene", "FX Tonemap Filmic Toe Intensity", 1.0, sceneObj)
    Custom_AgentSetProperty("adv_trainTileEpilogue.scene", "FX Tonemap Filmic Shoulder Intensity", 1.5, sceneObj)
    
    Custom_AgentSetProperty("adv_trainTileEpilogue.scene", "HBAO Intensity", 2.5, sceneObj)
    Custom_AgentSetProperty("adv_trainTileEpilogue.scene", "HBAO Max Radius Percent", 0.75, sceneObj)
    
    Custom_AgentSetProperty("adv_trainTileEpilogue.scene", "FX Bloom Threshold", -0.2, sceneObj)
    Custom_AgentSetProperty("adv_trainTileEpilogue.scene", "FX Bloom Intensity", 0.5, sceneObj)
    
    Custom_AgentSetProperty("adv_trainTileEpilogue.scene", "Ambient Color", RGBColor(0, 0, 0, 0), sceneObj)
    Custom_AgentSetProperty("adv_trainTileEpilogue.scene", "Shadow Color", RGBColor(0, 0, 0, 0), sceneObj)
    
    
    Custom_AgentSetProperty("adv_trainTileEpilogue.scene", "FX Vignette Tint Enabled", true, sceneObj)
    Custom_AgentSetProperty("adv_trainTileEpilogue.scene", "FX Vignette Tint", RGBColor(0, 0, 0, 0), sceneObj)
    Custom_AgentSetProperty("adv_trainTileEpilogue.scene", "FX Vignette Falloff", 1.5, sceneObj)
    Custom_AgentSetProperty("adv_trainTileEpilogue.scene", "FX Vignette Center", 0, sceneObj)
    Custom_AgentSetProperty("adv_trainTileEpilogue.scene", "FX Vignette Corners", 3.0, sceneObj)
    
    Custom_AgentSetProperty("adv_trainTileEpilogue.scene", "LightEnv Saturation", 1.5, sceneObj)
    
    Custom_AgentSetProperty("adv_trainTileEpilogue.scene", "LightEnv Reflection Intensity Shadow", 1.0, sceneObj)
    Custom_AgentSetProperty("adv_trainTileEpilogue.scene", "Specular Multiplier Enabled", true, sceneObj)

    
    --DevTools_AgentMenuTool_GetValidPropertyNames(sceneAgent)
    
    --cine mode
    SetPropertyOnAllCameras(sceneObj, "Field of View Scale", 1.4)
    local sceneagent = AgentFindInScene("adv_trainTileEpilogue.scene", sceneObject)
    local amount = 0.125
    --Custom_AgentSetProperty("adv_drugstoreOffice.scene", "Viewport Scissor Left", amount, sceneObj)
    --Custom_AgentSetProperty("adv_drugstoreOffice.scene", "Viewport Scissor Bottom", amount, sceneObj)
    --Custom_AgentSetProperty("adv_drugstoreOffice.scene", "Frame Buffer Scale Override", true, sceneObj)
    SetPropertyOnSpecificAgents(sceneObj, "ui_", "Render FX Color Enabled", false)
    SetPropertyOnSpecificAgents(sceneObj, "ui_", "Render Depth Test", false)
    SetPropertyOnSpecificAgents(sceneObj, "ui_", "Render Depth Write", false)
    SetPropertyOnSpecificAgents(sceneObj, "ui_", "Render Color Write", false)
    SetPropertyOnSpecificAgents(sceneObj, "ui_", "Render After Anti-Aliasing", true)
    
    RemovingAllLightingRigs(sceneObj)
    
    --ResourceSetEnable("ProjectSeason4")
    ResourceSetEnable("WalkingDead403")
    local clem400_prop = "sk63_clementineFlashback.prop"
    local clem400_skl = "sk56_clementine.skl"
    local clem400 = AgentCreate("sk63_clementineFlashback", clem400_prop, Vector(0,0,0), Vector(0,0,0), sceneObj, false, false)
    
    local clem400_props        = AgentGetRuntimeProperties(clem400)
    local clem_props        = AgentGetRuntimeProperties(clemAgent)
    Custom_AgentSetProperty("sk63_clementineFlashback", "Mesh sk63_clementineFlashback_bodyLower - Visible", true, sceneObj)
    Custom_AgentSetProperty("sk63_clementineFlashback", "Mesh sk63_clementineFlashback_bodyUpper - Visible", true, sceneObj)
    Custom_AgentSetProperty("sk63_clementineFlashback", "Mesh sk63_clementineFlashback_eyesMouth - Visible", true, sceneObj)
    Custom_AgentSetProperty("sk63_clementineFlashback", "Mesh sk63_clementineFlashback_hair - Visible", true, sceneObj)
    Custom_AgentSetProperty("sk63_clementineFlashback", "Mesh sk63_clementineFlashback_hands - Visible", true, sceneObj)
    Custom_AgentSetProperty("sk63_clementineFlashback", "Mesh sk63_clementineFlashback_head - Visible", true, sceneObj)
    
    local clemMeshFrom400 = PropertyGet(clem400_props, "D3D Mesh")
    local clemMeshListFrom400 = PropertyGet(clem400_props, "D3D Mesh List")
    local clemSklFrom400 = PropertyGet(clem400_props, "Skeleton File")
    local clemSklBodyFrom400 = PropertyGet(clem400_props, "Skeleton Body")
    local clemSklFaceFrom400 = PropertyGet(clem400_props, "Skeleton Face")

    Custom_AgentSetProperty("Clementine", "Mesh sk56_clementine - Visible", false, sceneObj)
    Custom_AgentSetProperty("Clementine", "D3D Mesh List", clemMeshListFrom400, sceneObj)
    Custom_AgentSetProperty("Clementine", "D3D Mesh", clemMeshFrom400, sceneObj)
    Custom_AgentSetProperty("Clementine", "Skeleton File", clemSklFrom400, sceneObj)
    Custom_AgentSetProperty("Clementine", "Skeleton Body", clemSklBodyFrom400, sceneObj)
    Custom_AgentSetProperty("Clementine", "Skeleton Face", clemSklFaceFrom400, sceneObj)
    Custom_AgentSetProperty("Clementine", "Render Share Skeleton With Agent", PropertyGet(clem400_props, "Render Share Skeleton With Agent"), sceneObj)
    Custom_AgentSetProperty("Clementine", "Eye Look-At Position", PropertyGet(clem400_props, "Eye Look-At Position"), sceneObj)
    --Custom_AgentSetProperty("Clementine", "Eye Look-At Child Properties", PropertyGet(clem400_props, "Eye Look-At Child Properties"), sceneObj)
    --Custom_AgentSetProperty("Clementine", "Eye Look-At Properties", PropertyGet(clem400_props, "Eye Look-At Properties"), sceneObj)
    --Custom_AgentSetProperty("Clementine", "Look-at Buffer Angle", PropertyGet(clem400_props, "Look-at Buffer Angle"), sceneObj)
    --Custom_AgentSetProperty("Clementine", "Look-at Min Buffer Angle", PropertyGet(clem400_props, "Look-at Min Buffer Angle"), sceneObj)
    --Custom_AgentSetProperty("Clementine", "Style Idle", PropertyGet(clem400_props, "Style Idle"), sceneObj)
    --Custom_AgentSetProperty("Clementine", "Style Guide", PropertyGet(clem400_props, "Style Guide"), sceneObj)
    --Custom_AgentSetProperty("Clementine", "Style Guide2", PropertyGet(clem400_props, "Style Guide2"), sceneObj)
    --Custom_AgentSetProperty("Clementine", "Style Idle2", PropertyGet(clem400_props, "Style Idle2"), sceneObj)
    Custom_AgentSetProperty("Clementine", "Look - Chore Head", PropertyGet(clem400_props, "Look - Chore Head"), sceneObj)
    Custom_AgentSetProperty("Clementine", "Look - Chore Eyes", PropertyGet(clem400_props, "Look - Chore Eyes"), sceneObj)
    Custom_AgentSetProperty("Clementine", "Look - Contribution Fade Speed", PropertyGet(clem400_props, "Look - Contribution Fade Speed"), sceneObj)
    Custom_AgentSetProperty("Clementine", "Look - FOV Degrees", PropertyGet(clem400_props, "Look - FOV Degrees"), sceneObj)
    Custom_AgentSetProperty("Clementine", "Eye Look-At Properties", PropertyGet(clem400_props, "Eye Look-At Properties"), sceneObj)
    Custom_AgentSetProperty("Clementine", "Eye Look-At Properties", PropertyGet(clem400_props, "Eye Look-At Properties"), sceneObj)
    Custom_AgentSetProperty("Clementine", "Look-at Buffer Angle", PropertyGet(clem400_props, "Look-at Buffer Angle"), sceneObj)
    Custom_AgentSetProperty("Clementine", "Look-at Min Buffer Angle", PropertyGet(clem400_props, "Look-at Min Buffer Angle"), sceneObj)
    
    Custom_AgentSetProperty("Clementine", "Render Global Scale", 1.05, sceneObj)
    
    AgentHide(clem400, true)
    
    --lee
    local lee400_prop = "sk61_lee.prop"
    local lee400 = AgentCreate("sk61_lee", lee400_prop, Vector(0,0,0), Vector(0,0,0), sceneObj, false, false)
    
    local lee400_props        = AgentGetRuntimeProperties(lee400)
    local lee_props        = AgentGetRuntimeProperties(leeAgent)
    
    Custom_AgentSetProperty("Lee", "Mesh sk54_lee_armL - Visible", false, sceneObj)
    Custom_AgentSetProperty("Lee", "Mesh sk54_lee_armR - Visible", false, sceneObj)
    Custom_AgentSetProperty("Lee", "Mesh sk54_lee_body - Visible", true, sceneObj)
    Custom_AgentSetProperty("Lee", "Mesh sk54_lee_bodyStomachGutted - Visible", false, sceneObj)
    Custom_AgentSetProperty("Lee", "Mesh sk54_lee_head - Visible", false, sceneObj)
    Custom_AgentSetProperty("Lee", "Mesh sk54_lee_legs - Visible", false, sceneObj)
    Custom_AgentSetProperty("Lee", "Mesh sk54_leeJacket_armL - Visible", false, sceneObj)
    Custom_AgentSetProperty("Lee", "Mesh sk54_leeJacket_armR - Visible", false, sceneObj)
    Custom_AgentSetProperty("Lee", "Mesh sk54_leeJacket_body - Visible", false, sceneObj)
    Custom_AgentSetProperty("Lee", "Mesh sk54_leeJacket_head - Visible", false, sceneObj)
    Custom_AgentSetProperty("Lee", "Mesh sk54_leeJacket_legs - Visible", false, sceneObj)
    
    Custom_AgentSetProperty("Lee", "D3D Mesh List", PropertyGet(lee400_props, "D3D Mesh List"), sceneObj)
    Custom_AgentSetProperty("Lee", "D3D Mesh", PropertyGet(lee400_props, "D3D Mesh"), sceneObj)
    Custom_AgentSetProperty("Lee", "Skeleton File", PropertyGet(lee400_props, "Skeleton File"), sceneObj)
    Custom_AgentSetProperty("Lee", "Skeleton Body", PropertyGet(lee400_props, "Skeleton Body"), sceneObj)
    Custom_AgentSetProperty("Lee", "Skeleton Face", PropertyGet(lee400_props, "Skeleton Face"), sceneObj)
    Custom_AgentSetProperty("Lee", "Render Share Skeleton With Agent", PropertyGet(lee400_props, "Render Share Skeleton With Agent"), sceneObj)
    --Custom_AgentSetProperty("Lee", "Eye Look-At Position", PropertyGet(lee400_props, "Eye Look-At Position"), sceneObj)
    Custom_AgentSetProperty("Lee", "Eye Look-At Child Properties", PropertyGet(lee400_props, "Eye Look-At Child Properties"), sceneObj)
    Custom_AgentSetProperty("Lee", "Eye Look-At Properties", PropertyGet(lee400_props, "Eye Look-At Properties"), sceneObj)
    --Custom_AgentSetProperty("Lee", "Style Idle", PropertyGet(lee400_props, "Style Idle"), sceneObj)
    --Custom_AgentSetProperty("Lee", "Style Guide", PropertyGet(lee400_props, "Style Guide"), sceneObj)
    --Custom_AgentSetProperty("Lee", "Style Guide2", PropertyGet(lee400_props, "Style Guide2"), sceneObj)
    --Custom_AgentSetProperty("Lee", "Style Idle2", PropertyGet(lee400_props, "Style Idle2"), sceneObj)
    --Custom_AgentSetProperty("Lee", "Look - Enabled", PropertyGet(lee400_props, "Look - Enabled"), sceneObj)
    Custom_AgentSetProperty("Lee", "Look - Chore Head", PropertyGet(lee400_props, "Look - Chore Head"), sceneObj)
    Custom_AgentSetProperty("Lee", "Look - Chore Eyes", PropertyGet(lee400_props, "Look - Chore Eyes"), sceneObj)
    Custom_AgentSetProperty("Lee", "Look - Contribution Fade Speed", PropertyGet(lee400_props, "Look - Contribution Fade Speed"), sceneObj)
    Custom_AgentSetProperty("Lee", "Look - FOV Degrees", PropertyGet(lee400_props, "Look - FOV Degrees"), sceneObj)
    Custom_AgentSetProperty("Lee", "Eye Look-At Properties", PropertyGet(lee400_props, "Eye Look-At Properties"), sceneObj)
    Custom_AgentSetProperty("Lee", "Eye Look-At Properties", PropertyGet(lee400_props, "Eye Look-At Properties"), sceneObj)
    Custom_AgentSetProperty("Lee", "Look-at Buffer Angle", PropertyGet(lee400_props, "Look-at Buffer Angle"), sceneObj)
    Custom_AgentSetProperty("Lee", "Look-at Min Buffer Angle", PropertyGet(lee400_props, "Look-at Min Buffer Angle"), sceneObj)
    
    --Custom_AgentSetProperty("Lee", "Render Global Scale", 0.95, sceneObj)
    
    --SetPreference("Animated Lookats Active", true)
    
    AgentHide(lee400, true)
end



Epilogue = function()
  -- function num : 0_0 , upvalues : _ENV
  
  
  ModifyScene(kScene)
  --PrintSceneListToTXT(kScene, "env_trainEpilogue103.txt")
  
  
  Mode(mode_Main)
  if SaveLoad_IsFromLoad() then
    return 
  end
  Episode_SetFightTextures(false)
  if AllowIntroCutscenes() then
    if Platform_IsWiiU() then
      print("Dialog Preloading start1: Epilogue")
      DlgPreload("env_trainEpilogue.dlog", "cs_enter", 0, 15, 0, false)
    end
    Dialog_Play("cs_enter")
  end
end

SceneOpen(kScene, kScript)

