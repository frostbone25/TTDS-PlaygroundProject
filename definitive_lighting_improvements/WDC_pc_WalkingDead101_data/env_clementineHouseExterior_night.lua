-- Decompiled using luadec 2.2 rev:  for Lua 5.2 from https://github.com/viruscamp/luadec
-- Command line: A:\Steam\twd-definitive\scripteditor-10-31-20\s1_lighting_improvements\WDC_pc_WalkingDead101_data\env_clementineHouseExterior_night_temp.lua 

-- params : ...
-- function num : 0 , upvalues : _ENV

require("Relighting.lua")

local kScript = "ClementineHouseExterior_Night"
local kScene = "adv_clementineHouseExterior_Night"
local kDialog = "env_clementineYard.dlog"


ModifyScene = function(sceneObj)
    local light1 = AgentFindInScene("light_shadowLIGHT_CAM_0", sceneObj)
    local light2 = AgentFindInScene("light_shadowLIGHT_CAM_1", sceneObj)
    local light3 = AgentFindInScene("light_characters_shadowLIGHT_CAM_0", sceneObj)
    local light4 = AgentFindInScene("light_characters_shadowLIGHT_CAM_1", sceneObj)
    local light5 = AgentFindInScene("light_characters_shadowLIGHT_CAM_2", sceneObj)
    destroyMe(light1)
    destroyMe(light2)
    destroyMe(light3)
    destroyMe(light4)
    destroyMe(light5)

    local light6  = AgentFindInScene("light_hose_spot_1", sceneObj)
    local light7  = AgentFindInScene("light_hose_spot_2", sceneObj)
    local light8  = AgentFindInScene("light_house_interior_spot", sceneObj)
    local light9  = AgentFindInScene("light_street_spot_1", sceneObj)
    local light10 = AgentFindInScene("light_street_spot_2", sceneObj)
    local light11 = AgentFindInScene("light_street_spot_3", sceneObj)
    local light12 = AgentFindInScene("light_street_spot_4", sceneObj)
    local light13 = AgentFindInScene("light_street_spot_5", sceneObj)
    local light14 = AgentFindInScene("light_street_spot_6", sceneObj)
    local light15 = AgentFindInScene("light_street_spot_7BlueBounceCar", sceneObj)
    local light16 = AgentFindInScene("light_street_spot_7BlueBounceCar01", sceneObj)
    local light17 = AgentFindInScene("light_hose_spot_3", sceneObj)
    local light18 = AgentFindInScene("light_hose_spot_4", sceneObj)
    local light19 = AgentFindInScene("light_hose_spot_5", sceneObj)
    local light20 = AgentFindInScene("light_hose_spot_6", sceneObj)
    local light21 = AgentFindInScene("light_hose_spot_7", sceneObj)
    local light22 = AgentFindInScene("light_hose_spot_8", sceneObj)
    local light23 = AgentFindInScene("light_hose_spot_10", sceneObj)
    local light24 = AgentFindInScene("light_atm_P_1", sceneObj)
    local light25 = AgentFindInScene("light_atm_P_2", sceneObj)
    local light26 = AgentFindInScene("light_atm_P_3", sceneObj)
    local light27 = AgentFindInScene("light_atm_P_6", sceneObj)
    
    local light28 = AgentFindInScene("light_AMB_StreetLamps", sceneObj)
    local light29 = AgentFindInScene("light_dots", sceneObj)
    
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
    destroyMe(light28)
    destroyMe(light29)
    destroyMe(light30)
    destroyMe(light31)
    destroyMe(light32)
    destroyMe(light33)
    destroyMe(light34)
    destroyMe(light35)
    --destroyMe(light36)
    --destroyMe(light37)
    --destroyMe(light38)
    
    local light39 = AgentFindInScene("light_Amb", sceneObj)
    local light40 = AgentFindInScene("light_Sky_Amb", sceneObj)
    local light41 = AgentFindInScene("light_Amb_At", sceneObj)
    local light42 = AgentFindInScene("light_Directional", sceneObj)
    --destroyMe(light39)--light_ENV_A_1 (ambient)
    --destroyMe(light40)--light_ENV_A_2 (sky)
    destroyMe(light41)--light_ENV_A_3 (unknown)
    --destroyMe(light42)--light_ENV_D_1 (sun)
    
    local moonColor    = RGBColor(255, 214, 159, 255)
    local ambientColor = RGBColor(108, 170, 225, 255)
    local skyColor     = RGBColor(24, 99, 205, 255)
    local fogColor     = Desaturate_RGBColor(skyColor, 0.45)
    
    --enviorment module (fog)
    local envModule       = AgentFindInScene("module_environment", sceneObj)
    local envModule_props = AgentGetRuntimeProperties(envModule)
    customSetPropertyColor(envModule_props, "5416356241638078242", fogColor)

    --sun
    local dupedLight42_sun = AgentCreate("light_ENV_D_1_duplicated_sun", AgentGetProperties(light42), AgentGetPos(light42), AgentGetRot(light42), sceneObj, false, false)
    ModifyLightSettings(dupedLight42_sun, 6.0, 4.0, moonColor)
    ModifyAgentTransformation_Rotation(dupedLight42_sun, Vector(110, 92, 60))
    
    --remove original sun
    destroyMe(light42)
    
    --skydome light
    ModifyLightSettings(light40, 0.0, 1.0, skyColor)
    
    --flat ambient
    ModifyLightSettings(light39, 0.35, 1.0, ambientColor)
    
    --bg tree fill
    ModifyLightSettings(light36, 6.0, 1.0, sunColor)
    ModifyLightSettings(light37, 6.0, 1.0, sunColor)
    ModifyLightSettings(light37, 6.0, 1.0, sunColor)
    
    RemovingAllLightingRigs(sceneObj)
end


ClementineHouseExterior_Night = function()

  --ModifyScene(kScene)
  PrintSceneListToTXT(kScene, "sceneoutput_101-clemHouseExterior.txt")

  -- function num : 0_0 , upvalues : _ENV, kDialog
  if Platform_IsWiiU() then
    print("Dialog Preloading start")
    DlgPreload(kDialog, "Enter", 0, 15, 0, false)
  end
  Mode(mode_Main)
  -- DECOMPILER ERROR at PC19: Confused about usage of register: R0 in 'UnsetPending'

  Logic["ClemHouseInt - Test Fight Prototype"] = true
  if not SaveLoad_IsFromLoad() then
    Dialog_Play("Enter", "Lee", nil, kDialog)
  else
    if Logic["ClemHouseExt - Entered From House"] and not Logic["ClemHouseInt - ChoseLookForHelp"] then
      ClemHouseExt_RestrictWalkbox()
    end
  end
end

ClemHouseExt_RestrictWalkbox = function()
  -- function num : 0_1 , upvalues : _ENV, kScene
  for i = 40, 77 do
    WalkBoxesDisableTri(kScene, i)
  end
end

if Platform_IsXfinity() then
  local isTrial = not (((GetPreferences()).DLC).WalkingDead102).Purchased
end
-- DECOMPILER ERROR at PC23: Confused about usage of register: R4 in 'UnsetPending'

if isTrial then
  ((AgentFind("logic_game")).mProps).bDemoMode = true
  local func = function()
  -- function num : 0_2 , upvalues : _ENV
  LoadScript("ui_demoUpsell.lua")
end

  ThreadStart(func)
else
  do
    SceneOpen(kScene, kScript)
  end
end

