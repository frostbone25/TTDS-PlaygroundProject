-- Decompiled using luadec 2.2 rev:  for Lua 5.2 from https://github.com/viruscamp/luadec
-- Command line: A:\Steam\twd-definitive\scripteditor-10-31-20\s1_lighting_improvements\WDC_pc_WalkingDead101_data\env_clementineHouseExterior_temp.lua 

-- params : ...
-- function num : 0 , upvalues : _ENV
require("Relighting.lua")

local kScript = "ClementineHouseExterior"
local kScene = "adv_clementineHouseExterior"
local kDialog = "env_clementineYard.dlog"

--local newKscene = "adv_sewerEntrance"
--local newKscene = "cms_networkBoxMessage"
--local newKscene = "ui_debugConsole"
--local newKscene = "platformDataVisualizer"
--local newKscene = "player"

if not IsRegistered() then
  require("wd_tutorial.lua")
end

ClearScene = function(sceneObj)
    local agent1 = AgentFindInScene("adv_clementineHouseExterior_meshesA", sceneObj)
    local agent2 = AgentFindInScene("adv_clementineHouseExterior_meshesB", sceneObj)
    local agent3 = AgentFindInScene("adv_clementineHouseExterior_meshesC", sceneObj)
    local agent4 = AgentFindInScene("adv_clementineHouseExterior_meshesD", sceneObj)
    local agent5 = AgentFindInScene("adv_clementineHouseExterior_meshesE", sceneObj)
    local agent6 = AgentFindInScene("adv_clementineHouseExterior_meshesF", sceneObj)
    local agent7 = AgentFindInScene("adv_clementineHouseExterior_meshesG", sceneObj)
    local agent8 = AgentFindInScene("adv_clementineHouseExterior_meshesH", sceneObj)
    local agent9 = AgentFindInScene("adv_clementineHouseExterior_meshesI", sceneObj)
    local agent10 = AgentFindInScene("adv_clementineHouseExterior_meshesJ", sceneObj)
    local agent11 = AgentFindInScene("adv_clementineHouseExterior_meshesK", sceneObj)
    local agent12 = AgentFindInScene("adv_clementineHouseExterior_meshesL", sceneObj)
    local agent13 = AgentFindInScene("adv_clementineHouseExterior_meshesM", sceneObj)
    local agent14 = AgentFindInScene("adv_clementineHouseExterior_meshesN", sceneObj)
    local agent15 = AgentFindInScene("adv_clementineHouseExterior_meshesO", sceneObj)
    local agent16 = AgentFindInScene("adv_clementineHouseExterior_meshesB_decals", sceneObj)
    local agent17 = AgentFindInScene("adv_clementineHouseExterior_meshesC_decals", sceneObj)
    local agent18 = AgentFindInScene("adv_clementineHouseExterior_meshesE_decals", sceneObj)
    local agent19 = AgentFindInScene("adv_clementineHouseExterior_meshesF_decals", sceneObj)
    local agent20 = AgentFindInScene("adv_clementineHouseExterior_meshesG_decals", sceneObj)
    local agent21 = AgentFindInScene("adv_clementineHouseExterior_meshesO_decals", sceneObj)
    local agent22 = AgentFindInScene("adv_clementineHouseExterior_distTrees", sceneObj)
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
end

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

    local light6  = AgentFindInScene("light_ENV_S_1", sceneObj)
    local light7  = AgentFindInScene("light_ENV_S_2", sceneObj)
    local light8  = AgentFindInScene("light_ENV_S_3", sceneObj)
    local light9  = AgentFindInScene("light_ENV_S_4", sceneObj)
    local light10 = AgentFindInScene("light_ENV_S_5", sceneObj)
    local light11 = AgentFindInScene("light_ENV_S_6", sceneObj)
    local light12 = AgentFindInScene("light_ENV_S_7", sceneObj)
    local light13 = AgentFindInScene("light_ENV_S_8", sceneObj)
    local light14 = AgentFindInScene("light_ENV_S_9", sceneObj)
    local light15 = AgentFindInScene("light_ENV_S_10", sceneObj)
    local light16 = AgentFindInScene("light_ENV_S_11", sceneObj)
    local light17 = AgentFindInScene("light_ENV_S_12", sceneObj)
    local light18 = AgentFindInScene("light_ENV_S_13", sceneObj)
    local light19 = AgentFindInScene("light_ENV_S_14", sceneObj)
    local light20 = AgentFindInScene("light_ENV_S_15", sceneObj)
    local light21 = AgentFindInScene("light_ENV_S_16", sceneObj)
    local light22 = AgentFindInScene("light_ENV_S_17", sceneObj)
    local light23 = AgentFindInScene("light_ENV_S_18", sceneObj)
    local light24 = AgentFindInScene("light_ENV_S_19", sceneObj)
    local light25 = AgentFindInScene("light_ENV_S_20", sceneObj)
    local light26 = AgentFindInScene("light_ENV_S_22", sceneObj)
    local light27 = AgentFindInScene("light_ENV_S_23", sceneObj)
    local light28 = AgentFindInScene("light_ENV_S_26", sceneObj)
    local light29 = AgentFindInScene("light_ENV_S_27", sceneObj)
    local light30 = AgentFindInScene("light_ENV_S_28", sceneObj)
    local light31 = AgentFindInScene("light_ENV_S_29", sceneObj)
    local light32 = AgentFindInScene("light_ENV_S_30", sceneObj)
    local light33 = AgentFindInScene("light_spot_trees", sceneObj)
    local light34 = AgentFindInScene("light_spot_trees01", sceneObj)
    local light35 = AgentFindInScene("light_spot_trees02", sceneObj)
    local light36 = AgentFindInScene("light_ENV_S_bgTreeFill", sceneObj)
    local light37 = AgentFindInScene("light_ENV_S_bgTreeFill01", sceneObj)
    local light38 = AgentFindInScene("light_ENV_S_bgTreeFill02", sceneObj)
    
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
    
    local light39 = AgentFindInScene("light_ENV_A_1", sceneObj)
    local light40 = AgentFindInScene("light_ENV_A_2", sceneObj)
    local light41 = AgentFindInScene("light_ENV_A_3  vfx", sceneObj)
    local light42 = AgentFindInScene("light_ENV_D_1", sceneObj)
    --destroyMe(light39)--light_ENV_A_1 (ambient)
    --destroyMe(light40)--light_ENV_A_2 (sky)
    --destroyMe(light41)--light_ENV_A_3 (vfx)
    --destroyMe(light42)--light_ENV_D_1 (sun)
    
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



CreateClemHouse = function(sceneObj)
    ResourceSetEnable("ProjectSeason4")
    ResourceSetEnable("Menu")

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


ReplaceCamera = function(sceneObj)
    --Custom_RemoveAgent("cam_cutscene", sceneObj)
    --Custom_RemoveAgent("cam_cutscene_zombieTimer", sceneObj)
    --Custom_RemoveAgent("cam_nav_gate_parent", sceneObj)
    --Custom_RemoveAgent("cam_nav", sceneObj)
    --Custom_RemoveAgent("cam_nav_yard_parent", sceneObj)
    --Custom_RemoveAgent("cam_nav_trigger_yard_depth", sceneObj)
    --Custom_RemoveAgent("cam_nav_yard", sceneObj)
    --Custom_RemoveAgent("cam_cutsceneChore", sceneObj)
    --Custom_RemoveAgent("cam_player", sceneObj)
    --Custom_RemoveAgent("cam_playerwalk", sceneObj)
    --Custom_RemoveAgent("cam_nav_porch_parent", sceneObj)
    --Custom_RemoveAgent("cam_nav_porch", sceneObj)
    --Custom_RemoveAgent("cam_nav_trigger_porch_depth", sceneObj)
    --Custom_RemoveAgent("cam_nav_gate", sceneObj)
    --Custom_RemoveAgent("cam_nav_porch_horizontal01", sceneObj)
    --Custom_RemoveAgent("cam_nav_trigger_gate_depth", sceneObj)
    --Custom_RemoveAgent("cam_nav_yard_horizontal", sceneObj)
    --Custom_RemoveAgent("cam_nav_porch_horizontal", sceneObj)
    --Custom_RemoveAgent("cam_nav_gate_horizontal", sceneObj)
    --Custom_RemoveAgent("cam_nav_shawnArrivalYard", sceneObj)
    --Custom_RemoveAgent("cam_nav_shawnArrivalYard_horizontal", sceneObj)
    --Custom_RemoveAgent("cam_nav_shawnArrivalYard_parent", sceneObj)
    --Custom_RemoveAgent("cam_nav_shawnArrivalFence", sceneObj)
    --Custom_RemoveAgent("cam_nav_shawnArrivalFence_horizontal", sceneObj)
    --Custom_RemoveAgent("cam_nav_shawnArrivalFence_parent", sceneObj)
    --Custom_RemoveAgent("cam_nav_trigger_shawnGate_depth", sceneObj)
    --Custom_RemoveAgent("cam_nav_yardPoolLevel", sceneObj)
    --Custom_RemoveAgent("cam_nav_gate_nav", sceneObj)
    --Custom_RemoveAgent("cam_nav_yardPoolLevel_parent", sceneObj)
    --Custom_RemoveAgent("cam_nav_yardPoolLevel_horizontal", sceneObj)
    --Custom_RemoveAgent("cam_nav_yardPoolLevel_nav", sceneObj)
    --Custom_RemoveAgent("cam_nav_shawnArrivalFence_nav", sceneObj)
    --Custom_RemoveAgent("cam_nav_shawnArrivalYard_nav", sceneObj)
    --Custom_RemoveAgent("cam_leeFrontHouse", sceneObj)
    --Custom_RemoveAgent("cam_leeFrontHouse_horizontal", sceneObj)
    --Custom_RemoveAgent("cam_nav_porchToGate", sceneObj)
    --Custom_RemoveAgent("cam_leeFrontHouse_nav", sceneObj)
    --Custom_RemoveAgent("cam_leeFrontHouse_parent", sceneObj)
    --Custom_RemoveAgent("cam_leeShawnDialog", sceneObj)
    --Custom_RemoveAgent("cam_leeClemFrontHouse", sceneObj)
    --Custom_RemoveAgent("cam_carCop", sceneObj)
    --Custom_RemoveAgent("cam_leeShawnPushCar", sceneObj)
    --Custom_RemoveAgent("cam_shawnTruck", sceneObj)
    --Custom_RemoveAgent("cam_ClemGate_Lee_M", sceneObj)
    --Custom_RemoveAgent("cam_ClemGate_Lee_CU", sceneObj)
    --Custom_RemoveAgent("cam_ClemGate_Clementine_CU", sceneObj)
    --Custom_RemoveAgent("cam_ClemGate_Clementine_OST", sceneObj)
    --Custom_RemoveAgent("cam_Driveway_Lee_CU", sceneObj)
    --Custom_RemoveAgent("cam_Driveway_Chet_CU", sceneObj)
    --Custom_RemoveAgent("cam_Driveway_Clementine_CU", sceneObj)
    --Custom_RemoveAgent("cam_Driveway_Shawn_CU", sceneObj)
    --Custom_RemoveAgent("cam_Driveway_Shawn_M", sceneObj)
    --Custom_RemoveAgent("cam_Driveway_Lee_M", sceneObj)
    --Custom_RemoveAgent("cam_Driveway_Clementine_M", sceneObj)
    --Custom_RemoveAgent("cam_Driveway_Chet_M", sceneObj)
    --Custom_RemoveAgent("cam_leeClemDialog", sceneObj)
    --Custom_RemoveAgent("camAxis_cam_nav_porch", sceneObj)
    --Custom_RemoveAgent("camAxis_cam_nav_gate", sceneObj)
    --Custom_RemoveAgent("camAxis_cam_nav_shawnArrivalFence_nav", sceneObj)
    --Custom_RemoveAgent("camAxis_cam_nav_shawnArrivalYard_nav", sceneObj)
    
    ResourceSetEnable("ProjectSeason4")
    
    local orbitCam_prop = "cam_orbit.prop"
    local orbitCam = AgentCreate("orbitCam", orbitCam_prop, Vector(0,0,0), Vector(0,0,0), sceneObj, false, false)
    local orbitCam_properties = AgentGetRuntimeProperties(orbitCam)
    local orbitCam_camera = AgentGetCamera(orbitCam)
    CameraActivate(orbitCam_camera)
    
    local leeAgent = AgentFindInScene("Lee", sceneObj)
    
    PropertySet(orbitCam_properties, "Orbit Cam - Attach Agent", leeAgent)
    
    local sceneAgent = AgentFindInScene("adv_clementineHouseExterior.scene", sceneObj)
    local sceneAgent_properties = AgentGetRuntimeProperties(sceneAgent)
    PropertySet(sceneAgent_properties, "Scene - Last Camera", orbitCam_camera)
    PropertySet(sceneAgent_properties, "Scene - Camera", orbitCam_camera)
    PropertySet(sceneAgent_properties, "Active Camera", orbitCam_camera)
    
    CameraActivate(orbitCam_camera)
    CameraPush(orbitCam_camera)
end


ClementineHouseExterior = function()

  --PrintSceneListToTXT(kScene, "sceneobject_101-clemHouseExt.txt")
  ModifyScene(kScene)
  ReplaceCamera(kScene)
  --ClearScene(kScene)
  --CreateWellingtonSeasonThree(kScene)
  
  --SceneAdd(newKscene)
  
  --CreateClemHouse(kScene)
  
  -- function num : 0_0 , upvalues : _ENV, kDialog
  local mbKilledBabySitter = Logic["ClemHouseInt - Killed Babysitter"]
  
  if Platform_IsXfinity() then
    local isTrial = not (((GetPreferences()).DLC).WalkingDead102).Purchased
  end
  -- DECOMPILER ERROR at PC20: Confused about usage of register: R2 in 'UnsetPending'
  if isTrial and mbKilledBabySitter then
    ((AgentFind("logic_game")).mProps).bDemoMode = true
    local func = function()
        -- function num : 0_0_0 , upvalues : _ENV
        LoadScript("ui_demoUpsell.lua")
    end

    ThreadStart(func)
    return 
  end
  do
    if Platform_IsWiiU() then
      print("Dialog Preloading start")
      DlgPreload(kDialog, "Enter", 0, 15, 0, false)
    end
    if Platform_IsIOS() or Platform_IsAndroid() then
      AgentHide("obj_treesBackClementineExterior", true)
      ShaderHideTexture("obj_doorSlidingGlassClementineHouseExterior", "env_clementinehouseinteriorglassdoors.d3dtx", true)
    end
    Mode(mode_Main)
    -- DECOMPILER ERROR at PC62: Confused about usage of register: R2 in 'UnsetPending'

    Logic["ClemHouseInt - Test Fight Prototype"] = true
    if not SaveLoad_IsFromLoad() then
      Dialog_Play("Enter", "Lee", nil, kDialog)
    else
      if Logic["ClemHouseExt - Entered From House"] and not Logic["ClemHouseInt - ChoseLookForHelp"] then
        ClemHouseExt_RestrictWalkbox()
      end
    end
  end
end

ClemHouseExt_RestrictWalkbox = function()
  -- function num : 0_1 , upvalues : _ENV, kScene
  for i = 40, 77 do
    WalkBoxesDisableTri(kScene, i)
  end
end

SceneOpen(kScene, kScript)
--SceneOpen(newKscene, kScript)