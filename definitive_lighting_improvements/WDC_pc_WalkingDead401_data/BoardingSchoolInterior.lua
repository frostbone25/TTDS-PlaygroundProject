-- Decompiled using luadec 2.2 rev:  for Lua 5.2 from https://github.com/viruscamp/luadec
-- Command line: A:\Steam\twd-definitive\scripteditor-10-31-20\definitive_lighting_improvements\WDC_pc_WalkingDead401_data\BoardingSchoolInterior_temp.lua 

-- params : ...
-- function num : 0 , upvalues : _ENV
require("Relighting.lua")
local kScript = "BoardingSchoolInterior"
local kScene = "adv_boardingSchoolInterior"



ModifyScene = function(sceneObj)
    local light1 = AgentFindInScene("light_ENV_amb", sceneObj)
    local light2 = AgentFindInScene("light_ENV_secondfloorWindow_sunHotspot", sceneObj)
    destroyMe(light1)
    destroyMe(light2)

    local light3  = AgentFindInScene("light_ENV_lobbyWindowBounce02", sceneObj)
    local light4  = AgentFindInScene("light_ENV_lobbyWindowBounce01", sceneObj)
    local light5  = AgentFindInScene("light_ENV_lobbyWindowBounce03", sceneObj)
    local light6  = AgentFindInScene("light_ENV_lobbyBounce01", sceneObj)
    local light7  = AgentFindInScene("light_ENV_lobbyBounce02", sceneObj)
    local light8  = AgentFindInScene("light_ENV_lobbyBounce03", sceneObj)
    local light9  = AgentFindInScene("light_ENV_lobbyBounce04", sceneObj)
    local light10 = AgentFindInScene("light_ENV_lobbyBounce05", sceneObj)
    local light11 = AgentFindInScene("light_ENV_lobbyBounce06", sceneObj)
    local light12 = AgentFindInScene("light_ENV_lobbyStairsAccent", sceneObj)
    local light13 = AgentFindInScene("light_ENV_lobbyPuddleSpec", sceneObj)
    
    local light14 = AgentFindInScene("light_ENV_hallwayWindow_sunBounce01", sceneObj)
    local light15 = AgentFindInScene("light_ENV_hallwayWindow_sunBounce04", sceneObj)
    local light16 = AgentFindInScene("light_ENV_hallwayWindow_sunBounce03", sceneObj)
    local light17 = AgentFindInScene("light_ENV_commonRoom_sunHotspot01", sceneObj)
    local light18 = AgentFindInScene("light_ENV_commonRoom_sunHotspot02", sceneObj)
    local light19 = AgentFindInScene("light_ENV_commonRoom_sunBounce01", sceneObj)
    local light20 = AgentFindInScene("light_ENV_commonRoom_sunBounce02", sceneObj)
    local light21 = AgentFindInScene("light_ENV_commonRoom_fill01", sceneObj)
    local light22 = AgentFindInScene("light_ENV_commonRoom_fill04", sceneObj)
    local light23 = AgentFindInScene("light_ENV_commonRoom_fill03", sceneObj)
    local light24 = AgentFindInScene("light_ENV_commonRoom_fill02", sceneObj)
    local light25 = AgentFindInScene("light_ENV_secondFloorFill01", sceneObj)
    local light26 = AgentFindInScene("light_ENV_secondFloorFill02", sceneObj)
    local light27 = AgentFindInScene("light_ENV_secondFloorFill03", sceneObj)
    local light28 = AgentFindInScene("light_ENV_secondFloorFill04", sceneObj)
    local light29 = AgentFindInScene("light_ENV_hallwayWindow_sunHotspot01", sceneObj)
    local light30 = AgentFindInScene("light_ENV_hallwayWindow_sunHotspot02", sceneObj)
    local light31 = AgentFindInScene("light_ENV_hallwayWindow_sunHotspot03", sceneObj)
    local light32 = AgentFindInScene("light_ENV_hallwayWindow_sunBounce02", sceneObj)
    
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

    local sunColor     = RGBColor(255, 214, 159, 255)
    local ambientColor = RGBColor(108, 170, 225, 255)
    local skyColor     = RGBColor(24, 99, 205, 255)
    local fogColor     = Desaturate_RGBColor(skyColor, 0.45)
    skyColor           = Desaturate_RGBColor(skyColor, 0.2)
    
    --enviorment module (fog)
    local envModule       = AgentFindInScene("module_environment", sceneObj)
    local envModule_props = AgentGetRuntimeProperties(envModule)
    customSetPropertyColor(envModule_props, "5416356241638078242", fogColor)

    --sun
    local dupedLight42_sun = AgentCreate("light_ENV_D_1_duplicated_sun", AgentGetProperties(light42), AgentGetPos(light42), AgentGetRot(light42), sceneObj, false, false)
    ModifyLightSettings(dupedLight42_sun, 6.0, 4.0, sunColor)
    ModifyAgentTransformation_Rotation(dupedLight42_sun, Vector(110, 92, 60))
    
    --remove original sun
    destroyMe(light42)
    
    --skydome light
    ModifyLightSettings(light40, 14.0, 1.0, skyColor)
    
    --flat ambient
    ModifyLightSettings(light39, 0.35, 1.0, ambientColor)
    
    --bg tree fill
    ModifyLightSettings(light36, 6.0, 1.0, sunColor)
    ModifyLightSettings(light37, 6.0, 1.0, sunColor)
    ModifyLightSettings(light37, 6.0, 1.0, sunColor)
    
    RemovingAllLightingRigs(sceneObj)
end


local OnLogicReady = function()
  -- function num : 0_0 , upvalues : _ENV
  if Game_GetLoaded() then
    return 
  end
  if LogicGet(kAct) == 2 then
    Game_SetSceneDialog("env_boardingSchoolInterior_act2")
  end
end

BoardingSchoolInterior = function()
  

    PrintSceneListToTXT(kScene, "sceneobject_401-boardingSchoolInterior.txt")
    --ModifyScene(kScene)


    if not Game_GetLoaded() then
        AgentRestore("obj_backpackClem400", 1)
    end
    
    if Game_GetSkipEnterCutscenes() and LogicGet(kAct) == 1 then
        Game_RunSceneDialog("logic_freeWalk", false)
    end
end

Callback_OnLogicReady:Add(OnLogicReady)
Game_SceneOpen(kScene, kScript)

