-- Decompiled using luadec 2.2 rev:  for Lua 5.2 from https://github.com/viruscamp/luadec
-- Command line: A:\Steam\twd-definitive\scripteditor-10-31-20\definitive_lighting_improvements\WDC_pc_Menu_data\Menu_main_temp.lua 

-- params : ...
-- function num : 0 , upvalues : _ENV
require("RichPresence.lua")
require("Utilities.lua")
require("AspectRatio.lua")
require("MenuUtils.lua")
require("Menu_JumpScrollList.lua")
require("Menu_Characters.lua")
require("Menu_ConceptGallery.lua")
require("Menu_Music.lua")
require("Menu_Options.lua")
require("Menu_Seasons.lua")
require("Menu_VideoMenu.lua")
require("UI_ListButton.lua")
require("UI_ListButtonLite.lua")
require("UI_Legend.lua")
require("UI_Popup.lua")
if ResourceExists("DebugLoader.lua") then
  require("DebugLoader.lua")
  require("MenuBootUtils.lua")
end

local loadAnyLevelStatus, droytiLal = pcall(require, "Menu_loadAnyLevel.lua")
local droytiAmbienceStatus, droytiAmb = pcall(require, "Menu_DroytiAmbience.lua")

require("Relighting.lua")
require("PropertyMenuTool.lua")
require("CustomSound.lua")

local kScene = "ui_menuMain.scene"
local kKeyArtScene = "adv_clementineHouse400.scene"
local mControllerAmbient, mControllerIdle, mControllerNowPlaying, mRefCounterAmbient = nil, nil, nil, nil
local bgMain = {isMenuMain = true}
bgMain.transitionTo = function(self, otherBG)
  -- function num : 0_0 , upvalues : _ENV, kScene
  if not otherBG then
    ChorePlay("ui_menuMain_show")
    Menu_Main_EnableAmbient(true)
    Sleep(1.5)
  else
    if otherBG.sharesBGWithMain then
      SceneHide(kScene, false)
    end
  end
end

bgMain.transitionFrom = function(self, otherBG)
  -- function num : 0_1 , upvalues : _ENV, kScene
  if not otherBG then
    ChorePlayAndWait("ui_menuMain_hide")
  else
    if otherBG.sharesBGWithMain then
      SceneHide(kScene, true)
    end
  end
end

local EnableAmbient = function(bEnable)
  -- function num : 0_2 , upvalues : mControllerAmbient, _ENV
  if bEnable then
    mControllerAmbient = ChorePlayAndSync("ui_menu_ambientFadeIn", mControllerAmbient)
  else
    mControllerAmbient = ChorePlayAndSync("ui_menu_ambientFadeOut", mControllerAmbient)
  end
end

mRefCounterAmbient = ReferenceCounter(EnableAmbient)
local OpenDebugMenu = function()
  -- function num : 0_3 , upvalues : _ENV, kScene
  if SceneIsActive(kScene) then
    WidgetInputHandler_EnableInput(false)
    MenuBoot_CreateDebugMenu()
  end
end

local UpdateLegend = function()
  -- function num : 0_4 , upvalues : _ENV
  Legend_Clear()
  Legend_Add("faceButtonDown", "legend_select")
  if IsPlatformXboxOne() then
    Legend_Add("faceButtonUp", MenuUtils_LegendStringForProfileUser(Menu_Text("legend_changeProfile")), "PlatformOpenAccountPickerUI()")
  end
end


modifyScene_prepareScene = function(sceneObj)
    -- REMOVE AGENTS FROM SCENE 
    local agent1  = AgentFindInScene("light_ENV_exterior_sunSpecWater", sceneObj)
    local agent2  = AgentFindInScene("light_ENV_exteriorHouse_sunFillHouse", sceneObj)
    local agent3  = AgentFindInScene("light_ENV_exteriorHouse_sunHotspotRoof", sceneObj)
    local agent4  = AgentFindInScene("light_ENV_exteriorHouse_sunHotspotRoofB", sceneObj)
    local agent5  = AgentFindInScene("light_ENV_exteriorHouse_sunHotspotGroundB", sceneObj)
    local agent6  = AgentFindInScene("light_ENV_exteriorHouse_sunFakeSpot", sceneObj)
    local agent7  = AgentFindInScene("light_ENV_exteriorHouse_sunHotSpotGramophone", sceneObj)
    local agent8  = AgentFindInScene("light_ENV_S_beetnick", sceneObj)
    local agent9  = AgentFindInScene("light_ENV_exteriorHouse_sunHotspotWall", sceneObj)
    local agent10 = AgentFindInScene("light_ENV_exteriorHouse_sunHotspotGround", sceneObj)
    local agent11 = AgentFindInScene("light_ENV_exteriorHouse_sunHotspotTreehouse", sceneObj)
    local agent12 = AgentFindInScene("fx_lightShaft401", sceneObj)
    local agent13 = AgentFindInScene("fx_lightShaft402", sceneObj)
    local agent14 = AgentFindInScene("fx_lightShaft403", sceneObj)
    local agent15 = AgentFindInScene("light_ENV_ivy", sceneObj)
    
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
    
    RemovingAllLightingRigs(sceneObj)
    RemoveNPR_OutlineOnAllAgents(sceneObj)
    
    -- ADD AGENTS
    ResourceSetEnable("WalkingDead401")
    local fx_camRain_prop = "fx_camRain.prop"
    local fx_camRainSplashes_prop = "fx_camRainSplashes.prop"
    local fx_camRainSplashSpawn_prop = "fx_camRainSplashSpawn.prop"

    local fx_camRain      = AgentCreate("fx_camRain", fx_camRain_prop, newPosition, Vector(0,0,0), sceneObj, false, false)
    local fx_camRainSplashes      = AgentCreate("fx_camRainSplashes", fx_camRainSplashes_prop, newPosition, Vector(0,0,0), sceneObj, false, false)
    local fx_camRainSplashSpawn      = AgentCreate("fx_camRainSplashSpawn", fx_camRainSplashSpawn_prop, newPosition, Vector(0,0,0), sceneObj, false, false)
    
    local module_enviorment_prop = "module_environment.prop"
    local module_enviorment      = AgentCreate("module_environment", module_enviorment_prop, newPosition, Vector(0,0,0), sceneObj, false, false)

    --modify agents
    local mesh1 = AgentFindInScene("adv_clementineHouse400_meshesAGrass", sceneObj)
    local mesh1_props = AgentGetRuntimeProperties(mesh1)
    customSetProperty(mesh1_props, "1898707794026217630", 0) --render order
    customSetProperty(mesh1_props, "1024957873050470385", 0) --set to zero
    customSetProperty(mesh1_props, "9318400394721951400", 0) --render order
    customSetProperty(mesh1_props, "6433641785849518460", 0) --render order
    customSetProperty(mesh1_props, "7372204144053900984", 0) --render order
    customSetProperty(mesh1_props, "16007138477389058512", 0) --render order
    customSetProperty(mesh1_props, "7805960902143653656", 1) --set
    customSetProperty(mesh1_props, "7700607954150507997", 2) --intensity
    
    local mesh2 = AgentFindInScene("adv_clementineHouse400_meshesAIvy", sceneObj)
    local mesh2_props = AgentGetRuntimeProperties(mesh2)
    customSetProperty(mesh2_props, "3352586747710770981", 0) --render order
    customSetProperty(mesh2_props, "7805960902143653656", 0) --dunno but set to 0
    customSetProperty(mesh2_props, "3963791493029129957", 0) --render order
    
    local mesh3 = AgentFindInScene("adv_clementineHouse400_meshesBGrass", sceneObj)
    local mesh3_props = AgentGetRuntimeProperties(mesh3)
    customSetProperty(mesh3_props, "3857615555302162101", 0) --render order
    customSetProperty(mesh3_props, "5563325619049308454", 0) --render order
    
    local mesh4 = AgentFindInScene("adv_clementineHouse400_meshesATrees", sceneObj)
    local mesh4_props = AgentGetRuntimeProperties(mesh4)
    customSetProperty(mesh4_props, "7805960902143653656", -1) --foliage intenisty light thing?
    
    local mesh5 = AgentFindInScene("adv_clementineHouse400_meshesATreeHouseTree", sceneObj)
    local mesh5_props = AgentGetRuntimeProperties(mesh5)
    customSetProperty(mesh5_props, "7700607954150507997", 5) --idk but set this to 5
    customSetProperty(mesh5_props, "7805960902143653656", -1) --idk but set this to 5
    
    
    
    --sound
    CustomSound_Ambient_Setup("soundCustom_ambient", sceneObj)
end


modifyScene_rain = function(sceneObj)
    -- LIGHTING
    local light_dir = AgentFindInScene("light_ENV_exterior_sunKey_ch", sceneObj)
    local light_amb = AgentFindInScene("light_ENV_Ambient", sceneObj)
    local light_grass = AgentFindInScene("light_ENV_grass", sceneObj)
    local light_ambTree = AgentFindInScene("light_ENV_exterior_ambientTreeFlats_ch", sceneObj)
    
    local light_dir_props = AgentGetRuntimeProperties(light_dir)
    local light_amb_props = AgentGetRuntimeProperties(light_amb)
    local light_grass_props = AgentGetRuntimeProperties(light_grass)
    local light_ambTree_props = AgentGetRuntimeProperties(light_ambTree)
    
    --sun
    local sunColor = RGBColor(111, 183, 255, 255)
    sunColor = Desaturate_RGBColor(sunColor, 0.7)
    customSetPropertyColor(light_dir_props, "4281326393034255142", sunColor)
    customSetProperty(light_dir_props, "6895516104914333780", 0.4) --light intensity
    customSetProperty(light_dir_props, "12886873986940172262", 1.0) --specular intensity
    customSetProperty(light_dir_props, "17514946436635221562", 0.1) --backlighting intensity
    customSetProperty(light_dir_props, "1733657658237399986", 1) --enable AO for light (1 enable 0 disable)
    customSetProperty(light_dir_props, "6363179296869353415", 1) --shadow thing set to 1
    customSetProperty(light_dir_props, "1930888535905678774", 3) -- shadow res 3
    ModifyAgentTransformation_Rotation(light_dir, Vector(46.799000,-5.642670,-1.695126))
    
    --ambient trees
    customSetProperty(light_ambTree_props, "6895516104914333780", 0.25) --light intensity
    
    --ambient
    local ambientColor     = RGBColor(111, 183, 255, 255)
    --ambientColor     = Desaturate_RGBColor(ambientColor, 0.45)
    customSetPropertyColor(light_amb_props, "4281326393034255142", ambientColor)
    customSetProperty(light_amb_props, "6895516104914333780", 0.125) --light intensity
    customSetProperty(light_amb_props, "12886873986940172262", 1.0) --specular intensity
    
    -- SKYLIGHTING
    local skyLight1 = AgentFindInScene("light_SKY_amb", sceneObj)
    local skyLight2 = AgentFindInScene("light_SKY_horizonSpot", sceneObj)
    local skyLight3 = AgentFindInScene("light_SKY_sunPoint", sceneObj)
    local skyLight4 = AgentFindInScene("light_SKY_sunBroadLight", sceneObj)
    local skyLight5 = AgentFindInScene("light_SKY_sunPoint01", sceneObj)
    local skyLight6 = AgentFindInScene("light_SKY_sunPointNX", sceneObj)
    local sky_group_sun = AgentFindInScene("group_sun", sceneObj)
    local skyLight1_props = AgentGetRuntimeProperties(skyLight1)
    local skyLight2_props = AgentGetRuntimeProperties(skyLight2)
    local skyLight3_props = AgentGetRuntimeProperties(skyLight3)
    local skyLight4_props = AgentGetRuntimeProperties(skyLight4)
    
    local skyColor     = RGBColor(24, 99, 205, 255)
    skyColor     = Desaturate_RGBColor(skyColor, 0.75)
    customSetPropertyColor(skyLight1_props, "4281326393034255142", skyColor)
    customSetProperty(skyLight1_props, "6895516104914333780", 0.8) --light intensity
    
    customSetPropertyColor(skyLight4_props, "4281326393034255142", skyColor)
    customSetProperty(skyLight4_props, "6895516104914333780", 0.5) --light intensity
    
    customSetProperty(skyLight3_props, "6895516104914333780", 1.0) --light intensity
    
    ModifyAgentTransformation_Rotation(sky_group_sun, Vector(56.196850,-115.275024,-6.413490))
    
    -- FX STUFF
    local fx_leaves = AgentFindInScene("fx_camLeaves", sceneObj)
    local fx_pollen = AgentFindInScene("fx_camPollen", sceneObj)
    local fx_rain1 = AgentFindInScene("fx_camRain", sceneObj)
    local fx_rain2 = AgentFindInScene("fx_camRainSplashes", sceneObj)
    local fx_rain3 = AgentFindInScene("fx_camRainSplashSpawn", sceneObj)
    
    local fx_leaves_props = AgentGetRuntimeProperties(fx_leaves)
    local fx_pollen_props = AgentGetRuntimeProperties(fx_pollen)
    local fx_rain1_props = AgentGetRuntimeProperties(fx_rain1)
    local fx_rain2_props = AgentGetRuntimeProperties(fx_rain2)
    local fx_rain3_props = AgentGetRuntimeProperties(fx_rain3)
    
    customSetProperty(fx_leaves_props, "689599953923669477", false) --enable emitter
    customSetProperty(fx_pollen_props, "689599953923669477", false) --enable emitter
    
    customSetProperty(fx_rain1_props, "689599953923669477", true) --enable emitter
    customSetProperty(fx_rain1_props, "4180975590232535326", 0.005) --particle size
    customSetProperty(fx_rain1_props, "2137029241144994061", 0.8) --particle count
    customSetProperty(fx_rain1_props, "907461805036530086", 1.0) --particle speed
    customSetProperty(fx_rain1_props, "459837671211266514", -0.1) --rain random size
    customSetProperty(fx_rain1_props, "2293817456966484758", 0.0) --rain diffuse intensity
    
    -- FOG STUFF
    local fog = AgentFindInScene("module_environment", sceneObj)
    local fog_props = AgentGetRuntimeProperties(fog)
    
    local fogColor = RGBColor(52, 93, 152, 255)
    fogColor = Desaturate_RGBColor(fogColor, 0.45)
    fogColor = Multiplier_RGBColor(fogColor, 0.9)
    customSetPropertyColor(fog_props, "5416356241638078242", fogColor)
    
    customSetProperty(fog_props, "16533278351305872715", 1.0) --fog density
    customSetProperty(fog_props, "15127451441696618964", 13) --fog start
    customSetProperty(fog_props, "11447774337455102559", 1.0) --height fog fade
    customSetProperty(fog_props, "3358245545686664500", 300) --max distance
    customSetProperty(fog_props, "16533278351305872715", 1) --density
    customSetProperty(fog_props, "15222782018368006447", true) --enable fog

    -- CAMERA STUFF
    local camera = AgentFindInScene("cam_cutsceneChore", sceneObj)
    local camera_props = AgentGetRuntimeProperties(camera)
    customSetProperty(camera_props, "7787725830777798802", 1.25) --camera fov
    
    -- POST PROCESSING
    local sceneAgent = AgentFindInScene("adv_clementineHouse400.scene", sceneObj)
    local sceneAgent_props = AgentGetRuntimeProperties(sceneAgent)
    --shadows
    customSetProperty(sceneAgent_props, "9602275225843161244", 0.0) --shadow bias near shadows?
    customSetProperty(sceneAgent_props, "1809390664809499465", 0.0) --shadow bias
    customSetProperty(sceneAgent_props, "2538759675348854153", true) --enable pnumbra shadow?
    
    --taa
    customSetProperty(sceneAgent_props, "2264047566069028784", 0.0) --TAA Sharpness
    
    --bloom
    customSetProperty(sceneAgent_props, "12144243618429851605", 0.3) --FX Bloom Intensity
    customSetProperty(sceneAgent_props, "18049689073467266258", -0.8) --FX Bloom Threshold
    
    --saturation
    customSetProperty(sceneAgent_props, "7617980933373779790", 0.0) --Saturation Vingette (Outer)
    customSetProperty(sceneAgent_props, "18139025584124076081", 0.0) --Master Saturation
    
    --npr outline effect
    customSetProperty(sceneAgent_props, "7391351126530590744", false) --Enable/Disable NPR
    
    --hbao
    customSetProperty(sceneAgent_props, "18061190101111761026", 1) --hbao enable? (0 disable 1 enable)
    customSetProperty(sceneAgent_props, "5636885953636634602", 1.5) --HBAO Intensity
    customSetProperty(sceneAgent_props, "1141861927729799242", 8.0) --HBAO Max Radius Percent
    customSetProperty(sceneAgent_props, "12242444477182177399", true) --HBAO Enabled
    
    
    PropertySet(sceneAgent_props, "Wind Speed", 2)
    PropertySet(sceneAgent_props, "Wind Idle Strength", 20)
    PropertySet(sceneAgent_props, "Wind Idle Spacial Frequency", 64)
    PropertySet(sceneAgent_props, "Wind Gust Separation Exponent", 1)
    
    PropertySet(sceneAgent_props, "Wind Gust Speed", 0.5)
    PropertySet(sceneAgent_props, "Wind Gust Strength", 0.5)
    PropertySet(sceneAgent_props, "Wind Gust Spacial Frequency", 32)
    
    
    
    --psudeo property check
    --local symbolCheck = SymbolToString("Wind Gust Strength")
    --local test = PropertyGet(sceneAgent_props, "Wind Gust Strength", 57)
    --test = tostring(test)
    --DialogBox_Okay("Checking name (Wind Gust Strength) string to property, converting property to string. Result = " .. test)
    
    
    --local puddle_pos = Vector(11.652, -0.3, -6.735)
    --local puddle_propfile = "obj_puddlePoolClemHouse400.prop"
    --local puddle      = AgentCreate("obj_puddlePoolClemHouse400_mine", puddle_propfile, puddle_pos, Vector(0,0,0), sceneObj, false, false)
    --local puddle = AgentFindInScene("obj_puddlePoolClemHouse400", sceneObj)
    --local puddle_props = AgentGetRuntimeProperties(puddle)
    --ModifyAgentTransformation_Position(puddle, puddle_pos)
    
    --customSetProperty(puddle_props, "4273370320593893048", 0.1)
    --customSetProperty(puddle_props, "4857578369356927332", 0.35)
    --customSetProperty(puddle_props, "6747884369231213288", 3) --obj scale
    --customSetProperty(puddle_props, "1504390651565685996", 4) --tile size
    --customSetProperty(puddle_props, "12012789014150368376", 0) --diffuse intensity

    --local gramophone = AgentFindInScene("obj_gramophone", sceneObj)
    --destroyMe(gramophone)
    
    
    --SOUND EVENT
    --local amb_rain_soundFile = "amb_ext_farm_rain.wav"
    --local amb_rain_soundFile = "SFX_rain_hitting_clothes_01.wav"
    local amb_rain_soundFile = "amb_ext_dairynight_rain_fight.wav"
    CustomSound_Ambient_SetProperties("soundCustom_ambient", amb_rain_soundFile, 5.0, 1.0, sceneObj)
    CustomSound_Ambient_Play("soundCustom_ambient", 0.1, sceneObj)
end



modifyScene_night = function(sceneObj)
    -- LIGHTING
    local light_dir = AgentFindInScene("light_ENV_exterior_sunKey_ch", sceneObj)
    local light_amb = AgentFindInScene("light_ENV_Ambient", sceneObj)
    local light_grass = AgentFindInScene("light_ENV_grass", sceneObj)
    local light_ambTree = AgentFindInScene("light_ENV_exterior_ambientTreeFlats_ch", sceneObj)
    
    local light_dir_props = AgentGetRuntimeProperties(light_dir)
    local light_amb_props = AgentGetRuntimeProperties(light_amb)
    local light_grass_props = AgentGetRuntimeProperties(light_grass)
    local light_ambTree_props = AgentGetRuntimeProperties(light_ambTree)
    
    --sun
    local sunColor = RGBColor(111, 183, 255, 255)
    sunColor = Desaturate_RGBColor(sunColor, 0.5)
    customSetPropertyColor(light_dir_props, "4281326393034255142", sunColor)
    customSetProperty(light_dir_props, "6895516104914333780", 0.25) --light intensity
    customSetProperty(light_dir_props, "12886873986940172262", 1.0) --specular intensity
    customSetProperty(light_dir_props, "17514946436635221562", 0.1) --backlighting intensity
    customSetProperty(light_dir_props, "1733657658237399986", 1) --enable AO for light (1 enable 0 disable)
    customSetProperty(light_dir_props, "6363179296869353415", 1) --shadow thing set to 1
    customSetProperty(light_dir_props, "1930888535905678774", 3) -- shadow res 3
    ModifyAgentTransformation_Rotation(light_dir, Vector(80.799000,85.642670,-40.695126))
    
    --ambient trees
    customSetProperty(light_ambTree_props, "6895516104914333780", 0.05) --light intensity
    
    --ambient
    local ambientColor     = RGBColor(111, 183, 255, 255)
    ambientColor     = Desaturate_RGBColor(ambientColor, 0.45)
    customSetPropertyColor(light_amb_props, "4281326393034255142", ambientColor)
    customSetProperty(light_amb_props, "6895516104914333780", 0.015) --light intensity
    customSetProperty(light_amb_props, "12886873986940172262", 1.0) --specular intensity
    
    -- SKYLIGHTING
    local skyLight1 = AgentFindInScene("light_SKY_amb", sceneObj)
    local skyLight2 = AgentFindInScene("light_SKY_horizonSpot", sceneObj)
    local skyLight3 = AgentFindInScene("light_SKY_sunPoint", sceneObj)
    local skyLight4 = AgentFindInScene("light_SKY_sunBroadLight", sceneObj)
    local skyLight5 = AgentFindInScene("light_SKY_sunPoint01", sceneObj)
    local skyLight6 = AgentFindInScene("light_SKY_sunPointNX", sceneObj)
    local sky_group_sun = AgentFindInScene("group_sun", sceneObj)
    local skyLight1_props = AgentGetRuntimeProperties(skyLight1)
    local skyLight2_props = AgentGetRuntimeProperties(skyLight2)
    local skyLight3_props = AgentGetRuntimeProperties(skyLight3)
    local skyLight4_props = AgentGetRuntimeProperties(skyLight4)
    
    
    
    ResourceSetEnable("WalkingDead402")
    local sky_stars_obj_prop = "obj_skydomeStars.prop"
    local sky_stars_obj      = AgentCreate("obj_skydomeStars", sky_stars_obj_prop, Vector(0,90, 0), Vector(0,0,0), sceneObj, false, false)
    local sky_stars_properties = AgentGetRuntimeProperties(sky_stars_obj)
    customSetProperty(sky_stars_properties, "6877110840349535248", 2)
    customSetProperty(sky_stars_properties, "10618285860390121326", 0)
    customSetProperty(sky_stars_properties, "2779111186025429042", 15)
    customSetProperty(sky_stars_properties, "10266644458375938023", 0)
    customSetProperty(sky_stars_properties, "16249058763827471239", 15) --tilesize
    customSetProperty(sky_stars_properties, "16787775851154318358", 1.0) --intenisty
    
    
    local sky_original = AgentFindInScene("obj_skydome", sceneObj)
    destroyMe(sky_original)

    
    
    
    local skyColor     = RGBColor(24, 99, 205, 255)
    skyColor     = Desaturate_RGBColor(skyColor, 0.75)
    customSetPropertyColor(skyLight1_props, "4281326393034255142", skyColor)
    customSetProperty(skyLight1_props, "6895516104914333780", 2.0) --light intensity
    
    customSetPropertyColor(skyLight4_props, "4281326393034255142", skyColor)
    customSetProperty(skyLight4_props, "6895516104914333780", 0.1) --light intensity
    
    customSetProperty(skyLight3_props, "6895516104914333780", 0.0) --light intensity
    
    ModifyAgentTransformation_Rotation(sky_group_sun, Vector(76.196850,-115.275024,-6.413490))
    
    -- FX STUFF
    local fx_leaves = AgentFindInScene("fx_camLeaves", sceneObj)
    local fx_pollen = AgentFindInScene("fx_camPollen", sceneObj)
    local fx_rain1 = AgentFindInScene("fx_camRain", sceneObj)
    local fx_rain2 = AgentFindInScene("fx_camRainSplashes", sceneObj)
    local fx_rain3 = AgentFindInScene("fx_camRainSplashSpawn", sceneObj)
    
    local fx_leaves_props = AgentGetRuntimeProperties(fx_leaves)
    local fx_pollen_props = AgentGetRuntimeProperties(fx_pollen)
    local fx_rain1_props = AgentGetRuntimeProperties(fx_rain1)
    local fx_rain2_props = AgentGetRuntimeProperties(fx_rain2)
    local fx_rain3_props = AgentGetRuntimeProperties(fx_rain3)
    
    customSetProperty(fx_leaves_props, "689599953923669477", false) --enable emitter
    customSetProperty(fx_pollen_props, "689599953923669477", false) --enable emitter
    customSetProperty(fx_rain1_props, "689599953923669477", false) --enable emitter

    -- FOG STUFF
    local fog = AgentFindInScene("module_environment", sceneObj)
    local fog_props = AgentGetRuntimeProperties(fog)
    
    local fogColor = RGBColor(52, 93, 152, 255)
    fogColor = Desaturate_RGBColor(fogColor, 0.45)
    fogColor = Multiplier_RGBColor(fogColor, 0.9)
    customSetPropertyColor(fog_props, "5416356241638078242", fogColor)
    
    customSetProperty(fog_props, "16533278351305872715", 1.0) --fog density
    customSetProperty(fog_props, "15127451441696618964", 13) --fog start
    customSetProperty(fog_props, "11447774337455102559", 1.0) --height fog fade
    customSetProperty(fog_props, "3358245545686664500", 300) --max distance
    customSetProperty(fog_props, "16533278351305872715", 1) --density
    customSetProperty(fog_props, "15222782018368006447", false) --enable fog

    -- CAMERA STUFF
    local camera = AgentFindInScene("cam_cutsceneChore", sceneObj)
    local camera_props = AgentGetRuntimeProperties(camera)
    customSetProperty(camera_props, "7787725830777798802", 1.5) --camera fov
    
    -- POST PROCESSING
    local sceneAgent = AgentFindInScene("adv_clementineHouse400.scene", sceneObj)
    local sceneAgent_props = AgentGetRuntimeProperties(sceneAgent)
    --shadows
    customSetProperty(sceneAgent_props, "9602275225843161244", 0.0) --shadow bias near shadows?
    customSetProperty(sceneAgent_props, "1809390664809499465", 0.0) --shadow bias
    customSetProperty(sceneAgent_props, "2538759675348854153", true) --enable pnumbra shadow?
    
    --taa
    customSetProperty(sceneAgent_props, "2264047566069028784", 0.0) --TAA Sharpness
    
    --bloom
    customSetProperty(sceneAgent_props, "12144243618429851605", 0.3) --FX Bloom Intensity
    customSetProperty(sceneAgent_props, "18049689073467266258", -0.8) --FX Bloom Threshold
    
    --saturation
    customSetProperty(sceneAgent_props, "7617980933373779790", 0.0) --Saturation Vingette (Outer)
    customSetProperty(sceneAgent_props, "18139025584124076081", 0.0) --Master Saturation
    
    --npr outline effect
    customSetProperty(sceneAgent_props, "7391351126530590744", false) --Enable/Disable NPR
    
    --hbao
    customSetProperty(sceneAgent_props, "18061190101111761026", 1) --hbao enable? (0 disable 1 enable)
    customSetProperty(sceneAgent_props, "5636885953636634602", 1.5) --HBAO Intensity
    customSetProperty(sceneAgent_props, "1141861927729799242", 8.0) --HBAO Max Radius Percent
    customSetProperty(sceneAgent_props, "12242444477182177399", true) --HBAO Enabled
    
    
    PropertySet(sceneAgent_props, "Wind Speed", 1)
    PropertySet(sceneAgent_props, "Wind Idle Strength", 1)
    PropertySet(sceneAgent_props, "Wind Idle Spacial Frequency", 64)
    PropertySet(sceneAgent_props, "Wind Gust Separation Exponent", 1)
    
    PropertySet(sceneAgent_props, "Wind Gust Speed", 1)
    PropertySet(sceneAgent_props, "Wind Gust Strength", 0)
    PropertySet(sceneAgent_props, "Wind Gust Spacial Frequency", 32)
    

    --SOUND EVENT
    local amb_night_soundFile = "amb_night_sample.wav"
    CustomSound_Ambient_SetProperties("soundCustom_ambient", amb_night_soundFile, 5.0, 1.0, sceneObj)
    CustomSound_Ambient_Play("soundCustom_ambient", 0.25, sceneObj)
end







Menu_Main = function()
  -- function num : 0_5 , upvalues : _ENV, kKeyArtScene, kScene, bgMain, UpdateLegend
  if not SceneIsActive(kKeyArtScene) then
    MenuUtils_AddScene(kKeyArtScene)
  end

  --add and modify scene
  modifyScene_prepareScene(kKeyArtScene)
  modifyScene_rain(kKeyArtScene)
  --modifyScene_night(kKeyArtScene)
  
  
  --sound
  CustomSound_Ambient_Setup("soundCustom_ambient_mus", kKeyArtScene)
  local amb_mus_soundFile = "tlou2_greiving.mp3"
  CustomSound_Ambient_SetProperties("soundCustom_ambient_mus", amb_mus_soundFile, 5.0, 1.0, kKeyArtScene)
  CustomSound_Ambient_Play("soundCustom_ambient_mus", 1.0, kKeyArtScene)
  
  
  Devtools_Init(kKeyArtScene)

  SceneHide(kKeyArtScene, false)
  SceneHide("ui_menuMain", false)
  local menu = Menu_Create(ListMenu, "ui_menuMain", kScene)
  menu.align = "left"
  menu.background = bgMain
  menu.Show = function(self, direction)
    -- function num : 0_5_0 , upvalues : _ENV, UpdateLegend
    Menu_Main_SetIdle("env_clementineHouse400_mainMenu")
    if direction and direction < 0 then
      ChorePlay("ui_alphaGradient_show")
    end
    ;
    (Menu.Show)(self)
    RichPresence_Set("richPresence_mainMenu", false)
    UpdateLegend()
  end

  menu.Hide = function(self, direction)
    -- function num : 0_5_1 , upvalues : _ENV
    ChorePlay("ui_alphaGradient_hide")
    ;
    (Menu.Hide)(self)
  end

  menu.Populate = function(self)
    -- function num : 0_5_2 , upvalues : _ENV, menu, UpdateLegend
    local buttonSeasons = Menu_Add(ListButtonLite, "seasons", "label_seasonSelect", "Menu_Seasons()")
    AgentSetProperty(buttonSeasons.agent, "Text Glyph Scale", 1.5)
    if Menu_VideoPlayer_CanSupportVideo() then
      Menu_Add(ListButtonLite, "videos", "label_videos", "Menu_VideoMenu()")
    end
    Menu_Add(ListButtonLite, "characters", "label_characters", "Menu_Characters()")
    Menu_Add(ListButtonLite, "art", "label_art", "Menu_ConceptGallery()")
    Menu_Add(ListButtonLite, "music", "label_music", "Menu_Music()")
    Menu_Add(ListButtonLite, "settings", "label_settings", "Menu_Options()")
    Menu_Add(ListButtonLite, "credits", "label_credits", "Menu_ShowCredits( 0 )")
    if IsPlatformPC() or IsPlatformMac() then
      Menu_Add(ListButtonLite, "exit", "label_exitGame", "UI_Confirm( \"popup_quit_header\", \"popup_quit_message\", \"EngineQuit()\" )")
    end
  
    --add ambience and LAL compatability
    if(loadAnyLevelStatus) then
        Menu_Add(ListButtonLite, "loadanylevel", "Load Any Level", "Menu_LoadAnyLevel()")
    end
    if(droytiAmbienceStatus) then
        Menu_Add(ListButtonLite, "ambience", "Ambience", "Menu_DroytiAmbience()")
    end
    
    
    local legendWidget = Menu_Add(Legend)
    legendWidget.Place = function(self)
      -- function num : 0_5_2_0 , upvalues : menu
      self:AnchorToAgent(menu.agent, "left", "bottom")
    end

    UpdateLegend()
  end

  menu.onModalPopped = function(self)
    -- function num : 0_5_3 , upvalues : _ENV, UpdateLegend
    (Menu.onModalPopped)(self)
    UpdateLegend()
  end

  --Menu_Show(menu)
end

Menu_Main_Start = function()
  -- function num : 0_6 , upvalues : _ENV
  if Input_UseTouch() then
    ClickText_Enable(true)
  end
  local prefs = GetPreferences()
  if PropertyIsLocal(prefs, "Menu - User Gamma Setting") then
    RenderSetIntensity(PropertyGet(prefs, "Menu - User Gamma Setting"))
    PropertyRemove(prefs, "Menu - User Gamma Setting")
    SavePrefs()
  end
  RenderForce_16_by_9_AspectRatio(true)
  RenderDelay(1)
  WaitForNextFrame()
  Menu_Main()
end

Menu_Main_GetKeyArtScene = function()
  -- function num : 0_7 , upvalues : kKeyArtScene
  return kKeyArtScene
end

Menu_Main_SetIdle = function(chore)
  -- function num : 0_8 , upvalues : mControllerIdle, _ENV
  if mControllerIdle then
    ControllerKill(mControllerIdle)
  end
  if chore then
    mControllerIdle = ChorePlay(chore, 10)
    if mControllerIdle then
      ControllerSetLooping(mControllerIdle, true)
    end
  end
end

Menu_Main_EnableAmbient = function(bEnable)
  -- function num : 0_9 , upvalues : mRefCounterAmbient
  mRefCounterAmbient:Enable(bEnable)
end

Menu_Main_SetNowPlaying = function(text)
  -- function num : 0_10 , upvalues : _ENV, mControllerNowPlaying
  local chore = nil
  if text then
    local nowPlaying = AgentFind("ui_menuMain_nowPlaying")
    AgentSetProperty(nowPlaying, kText, text)
    chore = "ui_nowPlaying_show"
  else
    do
      chore = "ui_nowPlaying_hide"
      mControllerNowPlaying = ChorePlayAndSync(chore, mControllerNowPlaying)
    end
  end
end

if IsToolBuild() then
  Preload_SetSubProjectShaderPack("Menu", FileStripExtension(kScene))
end
if ResourceExists("DebugLoader.lua") then
  Callback_OnLoadDebugMenu:Add(OpenDebugMenu)
end
SceneOpen(kScene, "Menu_Main_Start")

