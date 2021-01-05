-- Decompiled using luadec 2.2 rev:  for Lua 5.2 from https://github.com/viruscamp/luadec
-- Command line: A:\Steam\twd-definitive\scripteditor-10-31-20\definitive_lighting_improvements\WDC_pc_WalkingDead401_data\BoardingSchoolExterior_temp.lua 

-- params : ...
-- function num : 0 , upvalues : _ENV

require("Relighting.lua")
require("PropertyMenuTool.lua")

local kScript = "BoardingSchoolExterior"
local kScene = "adv_boardingSchoolExterior"

ModifyScene = function(sceneObj)
    local agent1  = AgentFindInScene("light_AMB_grassIvy", sceneObj)
    local agent2  = AgentFindInScene("light_gobo_trainStation_buildingStripe01", sceneObj)
    local agent3  = AgentFindInScene("light_ENV_pointFill", sceneObj)
    local agent4  = AgentFindInScene("light_ENV_pointFill02", sceneObj)
    local agent5  = AgentFindInScene("light_ENV_pointFill04", sceneObj)
    local agent6  = AgentFindInScene("light_ENV_pointFill06", sceneObj)
    local agent7  = AgentFindInScene("light_ENV_pointFill08", sceneObj)
    local agent8  = AgentFindInScene("light_ENV_pointFill10", sceneObj)
    local agent9  = AgentFindInScene("light_ENV_pointFill11", sceneObj)
    local agent10 = AgentFindInScene("light_gobo_trainStation_buildingStripe03", sceneObj)
    local agent11 = AgentFindInScene("light_ENV_pointSunBounce02", sceneObj)
    local agent12 = AgentFindInScene("light_ENV_pointFill12", sceneObj)
    local agent13 = AgentFindInScene("light_ENV_pointFill14", sceneObj)
    local agent14 = AgentFindInScene("light_ENV_pointFill16", sceneObj)
    local agent15 = AgentFindInScene("light_gobo_trainStation_buildingLeafy", sceneObj)
    local agent16 = AgentFindInScene("light_gobo_trainStation_buildingLeafyInvert", sceneObj)
    local agent17 = AgentFindInScene("light_ENV_pointFill17", sceneObj)
    local agent18 = AgentFindInScene("light_ENV_pointSunBounce05", sceneObj)
    local agent19 = AgentFindInScene("light_ENV_pointSunBounce07", sceneObj)
    local agent20 = AgentFindInScene("light_gobo_trainStation_buildingStripe05", sceneObj)
    local agent21 = AgentFindInScene("light_gobo_trainStation_buildingLeafyInvertStripes01", sceneObj)
    local agent22 = AgentFindInScene("light_ENV_pointSunBounce09", sceneObj)
    local agent23 = AgentFindInScene("light_ENV_pointSunBounce11", sceneObj)
    local agent24 = AgentFindInScene("light_ENV_pointFill20", sceneObj)
    local agent25 = AgentFindInScene("fx_lightShaft401", sceneObj)
    local agent26 = AgentFindInScene("light_ENV_pointFill22", sceneObj)
    local agent27 = AgentFindInScene("light_ENV_pointFill23", sceneObj)
    local agent28 = AgentFindInScene("light_ENV_pointFill21", sceneObj)
    local agent29 = AgentFindInScene("light_gobo_trainStation_buildingLeafy02", sceneObj)
    local agent30 = AgentFindInScene("light_ENV_pointFill19", sceneObj)
    local agent31 = AgentFindInScene("light_ENV_pointSunBounce10", sceneObj)
    local agent32 = AgentFindInScene("light_gobo_trainStation_buildingLeafyInvertStripes02", sceneObj)
    local agent33 = AgentFindInScene("light_gobo_trainStation_buildingLeafyInvertStripes", sceneObj)
    local agent34 = AgentFindInScene("light_ENV_pointSunBounce08", sceneObj)
    local agent35 = AgentFindInScene("light_ENV_pointSunBounce06", sceneObj)
    local agent36 = AgentFindInScene("light_ENV_pointFill18", sceneObj)
    local agent37 = AgentFindInScene("light_gobo_trainStation_buildingLeafyInvert01", sceneObj)
    local agent38 = AgentFindInScene("light_gobo_trainStation_buildingLeafy01", sceneObj)
    local agent39 = AgentFindInScene("light_ENV_pointSunBounce04", sceneObj)
    local agent40 = AgentFindInScene("light_ENV_pointFill15", sceneObj)
    local agent41 = AgentFindInScene("light_ENV_pointFill13", sceneObj)
    local agent42 = AgentFindInScene("light_ENV_pointSunBounce03", sceneObj)
    local agent43 = AgentFindInScene("light_gobo_trainStation_buildingStripe04", sceneObj)
    local agent44 = AgentFindInScene("light_ENV_pointSunBounce01", sceneObj)
    local agent45 = AgentFindInScene("light_ENV_pointSunBounce", sceneObj)
    local agent46 = AgentFindInScene("light_ENV_pointFill09", sceneObj)
    local agent47 = AgentFindInScene("light_ENV_pointFill07", sceneObj)
    local agent48 = AgentFindInScene("light_ENV_pointFill05", sceneObj)
    local agent49 = AgentFindInScene("light_ENV_pointFill03", sceneObj)
    local agent50 = AgentFindInScene("light_ENV_pointFill01", sceneObj)
    local agent51 = AgentFindInScene("light_gobo_trainStation_buildingStripe02", sceneObj)
    local agent52 = AgentFindInScene("light_gobo_trainStation_buildingStripe", sceneObj)
    local agent53 = AgentFindInScene("light_AMB_0", sceneObj)
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

    local sunColor     = RGBColor(255, 214, 159, 255)
    local ambientColor = RGBColor(108, 170, 225, 255)
    local skyColor     = RGBColor(24, 99, 205, 255)
    local fogColor     = Desaturate_RGBColor(skyColor, 0.45)
    skyColor           = Desaturate_RGBColor(skyColor, 0.2)

        
    local sceneAgent       = AgentFindInScene("adv_boardingSchoolExterior.scene", sceneObj)
    local sceneAgent_props = AgentGetRuntimeProperties(sceneAgent)
    customSetProperty(sceneAgent_props, "1872325006323272", 0.85) --shadow intensity?
    customSetProperty(sceneAgent_props, "2264047566069028784", 0.0) --taa sharpness
    customSetProperty(sceneAgent_props, "3792194742005286198", 1.0) --taa saturation
    
    customSetProperty(sceneAgent_props, "4905517082657547560", 2.0) --reflection intensity
    customSetProperty(sceneAgent_props, "5593429732192260810", 18.0) --NPR outline thing
    customSetProperty(sceneAgent_props, "7617980933373779790", 0.0) --saturation
    customSetProperty(sceneAgent_props, "7753193115890057177", 10.0) --hbao/contact shadow radius?
    
    customSetProperty(sceneAgent_props, "9657378797859664110", true) --tonemap enable
    customSetProperty(sceneAgent_props, "10439930478480375941", 2.0) --reflection?
    customSetProperty(sceneAgent_props, "10763936288790665913", 0.0) --tonemap highlights
    
    customSetProperty(sceneAgent_props, "11194384636909414441", 0.5) --some value
    customSetProperty(sceneAgent_props, "11511751025634089432", 0.6) --tonemap middle
    customSetProperty(sceneAgent_props, "12144243618429851605", 1.0) --bloom intensity
    
    customSetProperty(sceneAgent_props, "13520285575587690970", 11.0) --npr strength?
    customSetProperty(sceneAgent_props, "14597386597950219641", 3.0) --tonemap white point
    customSetProperty(sceneAgent_props, "17674958196662778078", 0.4) --contact shadow length?
    customSetProperty(sceneAgent_props, "18139025584124076081", 0.0) --saturation
    customSetProperty(sceneAgent_props, "10763936288790665913", 0.0) --tonemap highlights
    customSetProperty(sceneAgent_props, "10763936288790665913", 0.0) --tonemap highlights
    customSetProperty(sceneAgent_props, "10763936288790665913", 0.0) --tonemap highlights
    customSetProperty(sceneAgent_props, "10763936288790665913", 0.0) --tonemap highlights
    
    
    
    
    --enviorment module (fog)
    --local envModule       = AgentFindInScene("module_environment_fog", sceneObj)
    --local envModule_props = AgentGetRuntimeProperties(envModule)
    --customSetPropertyColor(envModule_props, "5416356241638078242", sunColor)

    --sun
    --ModifyLightSettings(light41, 6.0, 20.0, sunColor)
    --ModifyAgentTransformation_Rotation(light41, Vector(110, 92, 60))
    local sun       = AgentFindInScene("light_ENV_D_SunKey", sceneObj)
    local sun_props = AgentGetRuntimeProperties(sun)
    customSetPropertyColor(sun_props, "1930888535905678774", Color(1.0, 0.8745, 0.7215, 1.0))
    customSetProperty(sun_props, "1930888535905678774", 3) --shadow thingy
    customSetProperty(sun_props, "6895516104914333780", 5.0) --sun intensity
    customSetProperty(sun_props, "12240037695649491852", 2.0) --spec intensity?
    customSetProperty(sun_props, "17514946436635221562", 0.05) --bounce light
    customSetProperty(sun_props, "17681688128104012802", 0.5) --shadow intensity
    
    local amb       = AgentFindInScene("light_ENV_ambFill", sceneObj)
    local amb_props = AgentGetRuntimeProperties(amb)
    customSetPropertyColor(amb_props, "4281326393034255142", Color(0.596077, 0.78039, 1.0, 1.0))
    customSetProperty(amb_props, "6895516104914333780", 0.3) --intensity or spec
    
    local sky_amb   = AgentFindInScene("light_SKY_amb", sceneObj)
    local sky_amb_props = AgentGetRuntimeProperties(sky_amb)
    customSetPropertyColor(sky_amb_props, "4281326393034255142", Color(0.77647, 0.79215, 0.784313, 1.0))
    customSetProperty(sky_amb_props, "6895516104914333780", 1.0) --sky intensity base
    
    
    
    
    
    --skydome light
    --ModifyLightSettings(light34, 4.0, 1.0, skyColor)
    
    --flat ambient
    --ModifyLightSettings(light1, 0.5, 1.0, ambientColor)
    
    --mattes ambient
    --ModifyLightSettings(light40, 2.0, 2.0, sunColor)
    
    --grass ambient
    --ModifyLightSettings(light42, 0.75, 1.0, ambientColor)
    
    RemovingAllLightingRigs(sceneObj)
    RemoveNPR_OutlineOnAllAgents(sceneObj)
end

BoardingSchoolExterior = function()
    ModifyScene(kScene)
    Devtools_Init(kScene)
end

Game_SceneOpen(kScene, kScript)

