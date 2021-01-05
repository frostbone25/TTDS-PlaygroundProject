-- Decompiled using luadec 2.2 rev:  for Lua 5.2 from https://github.com/viruscamp/luadec
-- Command line: A:\Steam\twd-definitive\scripteditor-10-31-20\s1_lighting_improvements\WDC_pc_WalkingDead101_data\env_drugstoreOffice_temp.lua 

-- params : ...
-- function num : 0 , upvalues : _ENV
require("Relighting.lua")
require("PropertyMenuTool.lua")
require("CustomSound.lua")

local kScript = "drugstoreOffice"
local kScene = "adv_drugstoreOffice.scene"


ModifyScene = function(sceneObj)
    local clemAgent = AgentFindInScene("Clementine", sceneObj)
    local leeAgent = AgentFindInScene("Lee", sceneObj)
    
    --DevTools_AgentMenuTool_GetValidPropertyNames(clemAgent)
    --DevTools_AgentMenuTool_GetValidPropertyNames(leeAgent)

    Custom_AgentSetProperty("adv_drugstoreOffice.scene", "FX anti-aliasing", true, sceneObj)
    Custom_AgentSetProperty("adv_drugstoreOffice.scene", "FX Sharp Shadows Enabled", true, sceneObj)
    Custom_AgentSetProperty("adv_drugstoreOffice.scene", "Generate NPR Lines", false, sceneObj)
    Custom_AgentSetProperty("adv_drugstoreOffice.scene", "Screen Space Lines - Enabled", false, sceneObj)
    
    Custom_AgentSetProperty("adv_drugstoreOffice.scene", "FX Ambient Occlusion Enabled", true, sceneObj)
    
    Custom_AgentSetProperty("adv_drugstoreOffice.scene", "FX Tonemap Intensity", 1.0, sceneObj)
    Custom_AgentSetProperty("adv_drugstoreOffice.scene", "FX Tonemap White Point", 5.0, sceneObj)
    Custom_AgentSetProperty("adv_drugstoreOffice.scene", "FX Tonemap Black Point", 0.001, sceneObj)
    Custom_AgentSetProperty("adv_drugstoreOffice.scene", "FX Tonemap Filmic Toe Intensity", 1.0, sceneObj)
    Custom_AgentSetProperty("adv_drugstoreOffice.scene", "FX Tonemap Filmic Shoulder Intensity", 0.75, sceneObj)
    
    Custom_AgentSetProperty("adv_drugstoreOffice.scene", "HBAO Intensity", 2.5, sceneObj)
    Custom_AgentSetProperty("adv_drugstoreOffice.scene", "HBAO Max Radius Percent", 0.75, sceneObj)
    
    Custom_AgentSetProperty("adv_drugstoreOffice.scene", "FX Bloom Threshold", -0.05, sceneObj)
    Custom_AgentSetProperty("adv_drugstoreOffice.scene", "FX Bloom Intensity", 1.5, sceneObj)
    
    Custom_AgentSetProperty("adv_drugstoreOffice.scene", "Ambient Color", RGBColor(0, 0, 0, 0), sceneObj)
    Custom_AgentSetProperty("adv_drugstoreOffice.scene", "Shadow Color", RGBColor(0, 0, 0, 0), sceneObj)
    
    
    Custom_AgentSetProperty("adv_drugstoreOffice.scene", "FX Vignette Tint Enabled", true, sceneObj)
    Custom_AgentSetProperty("adv_drugstoreOffice.scene", "FX Vignette Tint", RGBColor(0, 0, 0, 0), sceneObj)
    Custom_AgentSetProperty("adv_drugstoreOffice.scene", "FX Vignette Falloff", 1.5, sceneObj)
    Custom_AgentSetProperty("adv_drugstoreOffice.scene", "FX Vignette Center", 0, sceneObj)
    Custom_AgentSetProperty("adv_drugstoreOffice.scene", "FX Vignette Corners", 3.0, sceneObj)
    
    Custom_AgentSetProperty("adv_drugstoreOffice.scene", "LightEnv Saturation", 1.5, sceneObj)
    
    Custom_AgentSetProperty("adv_drugstoreOffice.scene", "LightEnv Reflection Intensity Shadow", 1.0, sceneObj)
    Custom_AgentSetProperty("adv_drugstoreOffice.scene", "Specular Multiplier Enabled", true, sceneObj)

    
    --DevTools_AgentMenuTool_GetValidPropertyNames(sceneAgent)
    
    Custom_RemoveAgent("light_shadowLIGHT_CAM_0", sceneObj)
    Custom_RemoveAgent("light_shadowLIGHT_CAM_1", sceneObj)
    Custom_RemoveAgent("light_shadowLIGHT_CAM_2", sceneObj)
    Custom_RemoveAgent("light_shadowLIGHT_CAM_3", sceneObj)
    Custom_RemoveAgent("light_shadowLIGHT_CAM_4", sceneObj)
    Custom_RemoveAgent("light_shadowLIGHT_CAM_5", sceneObj)
    Custom_RemoveAgent("light_shadowLIGHT_CAM_6", sceneObj)
    Custom_RemoveAgent("light_shadowLIGHT_CAM_7", sceneObj)
    Custom_RemoveAgent("light_characters_shadowLIGHT_CAM_0", sceneObj)
    Custom_RemoveAgent("light_characters_shadowLIGHT_CAM_1", sceneObj)
    
    local light1 = AgentFindInScene("light_ENV_A_1", sceneObj)
    local light2 = AgentFindInScene("light_ENV_S_2", sceneObj)
    local light3 = AgentFindInScene("light_ENV_P_1", sceneObj)
    local light4 = AgentFindInScene("light_ENV_S_13", sceneObj)
    local light5 = AgentFindInScene("light_ENV_S_1", sceneObj)
    local light6 = AgentFindInScene("light_ENV_S_3", sceneObj)
    local light7 = AgentFindInScene("light_ENV_S_4", sceneObj)
    local light8 = AgentFindInScene("light_ENV_P_3", sceneObj)
    local light10 = AgentFindInScene("light_ENV_S_5", sceneObj)
    local light11 = AgentFindInScene("light_ENV_S_6", sceneObj)
    local light12 = AgentFindInScene("light_ENV_S_7", sceneObj)
    local light13 = AgentFindInScene("light_ENV_S_8", sceneObj)
    local light14 = AgentFindInScene("light_ENV_S_9", sceneObj)
    local light15 = AgentFindInScene("light_ENV_S_10", sceneObj)
    local light16 = AgentFindInScene("light_ENV_S_11", sceneObj)
    local light17 = AgentFindInScene("light_ENV_S_12", sceneObj)
    local light18 = AgentFindInScene("light_ENV_S_14", sceneObj)
    local light19 = AgentFindInScene("light_ENV_S_15", sceneObj)
    Custom_RemoveAgent("light_ENV_A_2", sceneObj) 
    --Custom_RemoveAgent("light_ENV_S_2", sceneObj) --exit sign
    --Custom_RemoveAgent("light_ENV_P_1", sceneObj) --main lamp light
    Custom_RemoveAgent("light_ENV_S_13", sceneObj) --unknown
    --Custom_RemoveAgent("light_ENV_S_1", sceneObj) --pharmacy door spotlight (on desk)
    Custom_RemoveAgent("light_ENV_S_3", sceneObj) --greenish accent light on sleeping bag [REMOVE]
    Custom_RemoveAgent("light_ENV_S_4", sceneObj) --pharmacy door spotlight (below the desk) [REMOVE]
    --Custom_RemoveAgent("light_ENV_P_3", sceneObj) --main lamp light (smaller range, more intense) [REMOVE]
    --Custom_RemoveAgent("light_ENV_S_5", sceneObj) --entry door spotlight (narrow, accent)
    Custom_RemoveAgent("light_ENV_S_6", sceneObj) --greenish accent light on sleeping bag (narrow, more towards table) [REMOVE]
    Custom_RemoveAgent("light_ENV_S_7", sceneObj) --back exit wall accent
    --Custom_RemoveAgent("light_ENV_S_8", sceneObj) --broader pharamcy door spotlight
    Custom_RemoveAgent("light_ENV_S_9", sceneObj) --random super narrow accent on pallet [REMOVE]
    Custom_RemoveAgent("light_ENV_S_10", sceneObj) --below table accent [REMOVE]
    Custom_RemoveAgent("light_ENV_S_11", sceneObj) --entry door spotlight (bottom left, narrow) [REMOVE]
    Custom_RemoveAgent("light_ENV_S_12", sceneObj) --grenish pallet accent [REMOVE]
    Custom_RemoveAgent("light_ENV_S_14", sceneObj) --top left of room accent [REMOVE]
    Custom_RemoveAgent("light_ENV_S_15", sceneObj) --narrow bookshelf accent behind first camera angle [REMOVE]
    
    --ambient
    Custom_AgentSetProperty("light_ENV_A_1", "EnvLight - Intensity", 0.015, sceneObj)
    
    --0 being ambient, 1 being direct
    local AO_Direct = 1
    local masterWrapIntensity = 0.1
    
    local lampColor = RGBColor(255, 231, 203, 255)
    --lampColor = RGBColor(203, 231, 255, 255)
    --lamp pointlight
    Custom_AgentSetProperty("light_ENV_P_1", "EnvLight - Intensity", 1.0, sceneObj)
    Custom_AgentSetProperty("light_ENV_P_1", "EnvLight - Radius", 4.5, sceneObj)
    Custom_AgentSetProperty("light_ENV_P_1", "EnvLight - Color", lampColor, sceneObj)
    Custom_AgentSetProperty("light_ENV_P_1", "EnvLight - Enlighten Intensity", 0.25, sceneObj)
    Custom_AgentSetProperty("light_ENV_P_1", "EnvLight - HBAO Participation Type", AO_Direct, sceneObj)
    Custom_AgentSetProperty("light_ENV_P_1", "EnvLight - Shadow Type", 3, sceneObj)
    Custom_AgentSetProperty("light_ENV_P_1", "EnvLight - Wrap", masterWrapIntensity, sceneObj)
    Custom_AgentSetProperty("light_ENV_P_1", "EnvLight - Shadow Quality", -1, sceneObj)
    
    --lamp sub pointlight
    Custom_AgentSetProperty("light_ENV_P_3", "EnvLight - Intensity", 5.0, sceneObj)
    Custom_AgentSetProperty("light_ENV_P_3", "EnvLight - Color", lampColor, sceneObj)
    
    --entry door spotlight
    Custom_AgentSetProperty("light_ENV_S_5", "EnvLight - Intensity", 1.5, sceneObj)
    Custom_AgentSetProperty("light_ENV_S_5", "EnvLight - Color", lampColor, sceneObj)
    Custom_AgentSetProperty("light_ENV_S_5", "EnvLight - Spot Angle Outer", 95, sceneObj)
    Custom_AgentSetProperty("light_ENV_S_5", "EnvLight - Enlighten Intensity", 0.25, sceneObj)
    Custom_AgentSetProperty("light_ENV_S_5", "EnvLight - HBAO Participation Type", AO_Direct, sceneObj)
    Custom_AgentSetProperty("light_ENV_S_5", "EnvLight - Shadow Type", 3, sceneObj)
    Custom_AgentSetProperty("light_ENV_S_5", "EnvLight - Wrap", masterWrapIntensity, sceneObj)
    
    --broad pharmacy door spotlight
    Custom_AgentSetProperty("light_ENV_S_8", "EnvLight - Intensity", 1.5, sceneObj)
    Custom_AgentSetProperty("light_ENV_S_8", "EnvLight - Color", lampColor, sceneObj)
    Custom_AgentSetProperty("light_ENV_S_8", "EnvLight - Spot Angle Outer", 80, sceneObj)
    Custom_AgentSetProperty("light_ENV_S_8", "EnvLight - Enlighten Intensity", 0.25, sceneObj)
    Custom_AgentSetProperty("light_ENV_S_8", "EnvLight - HBAO Participation Type", AO_Direct, sceneObj)
    Custom_AgentSetProperty("light_ENV_S_8", "EnvLight - Shadow Type", 3, sceneObj)
    Custom_AgentSetProperty("light_ENV_S_8", "EnvLight - Wrap", masterWrapIntensity, sceneObj)
    
    --back wall accent spotlight
    Custom_AgentSetProperty("light_ENV_S_7", "EnvLight - Intensity", 1.5, sceneObj)
    Custom_AgentSetProperty("light_ENV_S_7", "EnvLight - Color", lampColor, sceneObj)
    Custom_AgentSetProperty("light_ENV_S_7", "EnvLight - Spot Angle Outer", 90, sceneObj)
    Custom_AgentSetProperty("light_ENV_S_7", "EnvLight - Enlighten Intensity", 0.25, sceneObj)
    Custom_AgentSetProperty("light_ENV_S_7", "EnvLight - HBAO Participation Type", AO_Direct, sceneObj)
    Custom_AgentSetProperty("light_ENV_S_7", "EnvLight - Shadow Type", 3, sceneObj)
    Custom_AgentSetProperty("light_ENV_S_7", "EnvLight - Wrap", masterWrapIntensity, sceneObj)
    
    --pharmacy door desk accent
    Custom_AgentSetProperty("light_ENV_S_1", "EnvLight - Intensity", 1.5, sceneObj)
    Custom_AgentSetProperty("light_ENV_S_1", "EnvLight - Spot Angle Outer", 70, sceneObj)
    Custom_AgentSetProperty("light_ENV_S_1", "EnvLight - Groups", 1, sceneObj)
    Custom_AgentSetProperty("light_ENV_S_1", "EnvLight - Enabled Group", true, sceneObj)
    
    --cine mode
    SetPropertyOnAllCameras(sceneObj, "Field of View Scale", 1.35)
    local sceneagent = AgentFindInScene("adv_drugstoreOffice.scene", sceneObject)
    local amount = 0.125
    Custom_AgentSetProperty("adv_drugstoreOffice.scene", "Viewport Scissor Left", amount, sceneObj)
    Custom_AgentSetProperty("adv_drugstoreOffice.scene", "Viewport Scissor Bottom", amount, sceneObj)
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
    
    --unused
    local meshList = { "sk63_clementineFlashback_bodyLower.d3dmesh", 
    "sk63_clementineFlashback_bodyUpper.d3dmesh", 
    "sk63_clementineFlashback_eyesMouth.d3dmesh", 
    "sk63_clementineFlashback_hair.d3dmesh", 
    "sk63_clementineFlashback_hands.d3dmesh", 
    "sk63_clementineFlashback_head.d3dmesh"}
    
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
    
    
    local testing = AgentFindInScene("sk63_clementineFlashback", sceneObj)
    --DevTools_AgentMenuTool_GetValidPropertyNames(testing)
    
    --MeshGetMaterials
    --AgentToModels
    -- - Light Color Diffuse
    -- - Diffuse Color
    -- - Diffuse Albedo Color
    
    
    --local lee400_prop = "sk61_lee.prop"
    --local lee400 = AgentCreate("sk61_lee", clem400_prop, Vector(0,0,0), Vector(0,0,0), sceneObj, false, false)
    
    --sound
    CustomSound_Ambient_Setup("soundCustom_ambient", sceneObj)
    local amb_mus_soundFile = "tlou2_graveyard"
    CustomSound_Ambient_SetProperties("soundCustom_ambient", amb_mus_soundFile, 5.0, 1.0, sceneObj)
    CustomSound_Ambient_Play("soundCustom_ambient", 1.0, sceneObj)
end


drugstoreOffice = function()


    ModifyScene(kScene)
    
    --PrintSceneListToTXT(kScene, "adv_drugstoreOffice101.txt")
    

  -- function num : 0_0 , upvalues : _ENV
  local bGotKeys = Logic["Drugstore - Got Keys"]
  -- DECOMPILER ERROR at PC5: Confused about usage of register: R1 in 'UnsetPending'

  if bGotKeys then
    Logic["Office - Pallet moved"] = true
    -- DECOMPILER ERROR at PC7: Confused about usage of register: R1 in 'UnsetPending'

    Logic["Office - found medikit"] = true
    AgentSetProperty("obj_doorDrugstoreOffice", "Game Selectable", false)
    AgentSetProperty("obj_doorDrugstoreAlley", "Game Selectable", false)
    AgentHide("Clementine", true)
  end
  -- DECOMPILER ERROR at PC23: Confused about usage of register: R1 in 'UnsetPending'

  Logic["Drugstore - ArrivalComplete"] = true
  if Logic["Office - got photo"] then
    AgentHide("obj_photoLeeFamily", true)
    AgentSetProperty("trigger_camPhoto", "Trigger Enabled", false)
  else
    if Input_IsUsingTouch() then
      AgentSetProperty("trigger_camPhoto", "Trigger Enabled", true)
    end
  end
  if bGotKeys or Logic["Office - Pallet moved"] then
    AgentSetPos("obj_drugStoreOfficeWoodenPalette", Vector(-2.217857, 0.649245, 0.729007))
    AgentSetRot("obj_drugStoreOfficeWoodenPalette", Vector(-58.13037, -90.98405, 0.282882))
    AgentSetSelectable("obj_drugStoreOfficeWoodenPaletteLogical", false)
  end
  if bGotKeys or Logic["Office - Desk moved"] then
    AgentSetPos("obj_deskDrugstoreOffice", Vector(-1.03863, 0.5799, -2.363176))
    AgentSetRot("obj_deskDrugstoreOffice", Vector(0, -7.310176, 0))
    AgentSetSelectable("obj_deskDrugstoreOffice", false)
    if bGotKeys then
      CameraActivate("cam_navPart3")
    else
      CameraActivate("cam_navPart2")
    end
  end
  if Logic["MotorInn - Have Remote"] then
    AgentHide("obj_Remote", true)
  end
  Mode(mode_Main)
  if not SaveLoad_IsFromLoad() then
    if Platform_IsWiiU() then
      print("Dialog Preloading start1")
      DlgPreload("env_office.dlog", "enter_office", 0, 10, 0, false)
    end
    Dialog_Play("enter_office")
  end
end

SceneOpen(kScene, kScript)

