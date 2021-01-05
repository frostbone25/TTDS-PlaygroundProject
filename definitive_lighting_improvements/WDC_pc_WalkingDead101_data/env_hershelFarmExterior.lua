-- Decompiled using luadec 2.2 rev:  for Lua 5.2 from https://github.com/viruscamp/luadec
-- Command line: A:\Steam\twd-definitive\scripteditor-10-31-20\s1_lighting_improvements\WDC_pc_WalkingDead101_data\env_hershelFarmExterior_temp.lua 

-- params : ...
-- function num : 0 , upvalues : _ENV
require("Relighting.lua")
require("PropertyMenuTool.lua")

local kScript = "hershelFarmExterior"
local kScene = "adv_hershelFarmExterior.scene"
require("wd_tutorial.lua")
local onAgentCreate = function(agent)
  -- function num : 0_0 , upvalues : _ENV
  if AgentGetName(agent) ~= "Lee" then
    return 
  end
  local onIdleChange = function(key, idle)
    -- function num : 0_0_0 , upvalues : _ENV
    Print("CHANGE!")
    if ResourceGetName(idle) == "sk54_idle_leebodyb.anm" then
      Print("adjust")
      -- DECOMPILER ERROR at PC15: Confused about usage of register: R2 in 'UnsetPending'

      ;
      ((AgentFind("Lee")).mProps)["Walk Animation - Idle"] = "adv_everywhere_lee.chore"
    end
  end

  Print("added")
  PropertyAddKeyCallback(agent.mProps, "Walk Animation - Idle", onIdleChange)
end

HershelFarm_SwitchMusic = function(trigger)
  -- function num : 0_1 , upvalues : _ENV
  if Logic["Farm - DisableTriggerFunctions"] then
    return 
  end
  local name = AgentGetName(trigger)
  local sceneProps = (SceneGetSceneAgent(AgentGetScene(trigger))).mProps
  local music = nil
  if name == "trigger_MusicKatjaa" then
    music = "mus_loop_Neutral_01c.wav"
  else
    if name == "trigger_MusicKenny" then
      music = "mus_loop_Neutral_01b.wav"
    else
      if name == "trigger_MusicHershel" then
        music = "mus_loop_Neutral_01d.wav"
      else
        if name == "trigger_MusicShawn" then
          music = "mus_loop_Neutral_01a.wav"
        end
      end
    end
  end
  if music then
    print("switching music to: " .. music)
    soundModule_SwitchMusic(music)
  end
end

HershelsFarm_BarnToTractor = function(trigger)
  -- function num : 0_2 , upvalues : _ENV
  AgentSetProperty("Shawn", "Walk Animation - Idle", "adv_hershelfarmexterior_shawnBuildingFence.chore")
  triggerCamera_EnterBox(trigger)
end

HershelsFarm_TractorToBarn = function(trigger)
  -- function num : 0_3 , upvalues : _ENV
  AgentSetProperty("Shawn", "Walk Animation - Idle", "sk54_idle_kennyStandA.anm")
  triggerCamera_EnterBox(trigger)
end

HershelsFarm_WideCamTrigger = function(trigger)
  -- function num : 0_4 , upvalues : _ENV
  if Logic["Farm - DisableTriggerFunctions"] then
    return 
  end
  AgentSetProperty("trigger_cam_nav_frontPorch", "Trigger Enabled", true)
  AgentSetProperty("Shawn", "Walk Animation - Idle", "sk54_idle_kennyStandA.anm")
  -- DECOMPILER ERROR at PC16: Confused about usage of register: R1 in 'UnsetPending'

  Logic["Farm - FrontOfHouseWideShot"] = true
  triggerCamera_EnterBox(trigger)
end

HershelsFarm_FromWideCamTrigger = function(trigger)
  -- function num : 0_5 , upvalues : _ENV
  if Logic["Farm - DisableTriggerFunctions"] then
    return 
  end
  -- DECOMPILER ERROR at PC6: Confused about usage of register: R1 in 'UnsetPending'

  Logic["Farm - FrontOfHouseWideShot"] = false
  if AgentGetName(trigger) == "trigger_cam_tractor" then
    AgentSetProperty("Shawn", "Walk Animation - Idle", "adv_hershelfarmexterior_shawnBuildingFence.chore")
  end
  triggerCamera_EnterBox(trigger)
end

local mWalkAndTalkCtl = nil
HershelsFarm_StartWalkAndTalk = function(choreName)
  -- function num : 0_6 , upvalues : mWalkAndTalkCtl, _ENV
  mWalkAndTalkCtl = ChorePlay(choreName)
end

HershelsFarm_StopWalkAndTalk = function()
  -- function num : 0_7 , upvalues : _ENV, mWalkAndTalkCtl
  ControllerKill(mWalkAndTalkCtl)
end

local mAttackAmbientIDs = {}
HershelsFarm_Attack_FireAmbient = function(startNodeName)
  -- function num : 0_8 , upvalues : mAttackAmbientIDs, _ENV
  if not startNodeName then
    return 
  end
  if not mAttackAmbientIDs[startNodeName] or not DlgIsRunning(mAttackAmbientIDs[startNodeName]) then
    mAttackAmbientIDs[startNodeName] = Dialog_Play(startNodeName)
  end
end


modifyScene = function(sceneObj)
    local light1  = AgentFindInScene("light_dots", sceneObj)
    local light2  = AgentFindInScene("light_01", sceneObj)
    local light3  = AgentFindInScene("light_02", sceneObj)
    local light4  = AgentFindInScene("light_03", sceneObj)
    local light5  = AgentFindInScene("light_04", sceneObj)
    local light6  = AgentFindInScene("light_05", sceneObj)
    local light7  = AgentFindInScene("light_06", sceneObj)
    local light8  = AgentFindInScene("light_07", sceneObj)
    local light9  = AgentFindInScene("light_08", sceneObj)
    local light10 = AgentFindInScene("light_09", sceneObj)
    local light11 = AgentFindInScene("light_10", sceneObj)
    local light12 = AgentFindInScene("light_11", sceneObj)
    local light13 = AgentFindInScene("light_12", sceneObj)
    local light14 = AgentFindInScene("light_13", sceneObj)
    local light15 = AgentFindInScene("light_14", sceneObj)
    local light16 = AgentFindInScene("light_15", sceneObj)
    local light17 = AgentFindInScene("light_16", sceneObj)
    local light18 = AgentFindInScene("light_17", sceneObj)
    local light19 = AgentFindInScene("light_18", sceneObj)
    local light20 = AgentFindInScene("light_19", sceneObj)
    local light21 = AgentFindInScene("light_20", sceneObj)
    local light22 = AgentFindInScene("light_21", sceneObj)
    local light23 = AgentFindInScene("light_poinFillBlacks", sceneObj)
    local light24 = AgentFindInScene("light_poinFillBlacks01", sceneObj)
    local light25 = AgentFindInScene("light_poinFillBlacks02", sceneObj)
    local light26 = AgentFindInScene("light_poinFillBlacks03", sceneObj)
    local light27 = AgentFindInScene("light_poinFillBlacks04", sceneObj)
    local light28 = AgentFindInScene("light_poinFillBlacks05", sceneObj)
    local light29 = AgentFindInScene("lightShadow_characterLIGHT_CAM_0", sceneObj)
    local light30 = AgentFindInScene("lightShadow_characterLIGHT_CAM_1", sceneObj)
    local light31 = AgentFindInScene("lightShadow_characterLIGHT_CAM_2", sceneObj)
    local light32 = AgentFindInScene("lightShadow_characterLIGHT_CAM_3", sceneObj)
    local light33 = AgentFindInScene("lightShadow_characterLIGHT_CAM_4", sceneObj)
    local light34 = AgentFindInScene("lightShadow_characterLIGHT_CAM_5", sceneObj)
    local light35 = AgentFindInScene("lightShadow_characterLIGHT_CAM_6", sceneObj)
    local light36 = AgentFindInScene("lightShadow_characterLIGHT_CAM_7", sceneObj)
    local light37 = AgentFindInScene("light_character_shadowLIGHT_CAM_0", sceneObj)
    local light38 = AgentFindInScene("light_character_shadowLIGHT_CAM_1", sceneObj)
    local light39 = AgentFindInScene("light_character_shadowLIGHT_CAM_2", sceneObj)
    local light40 = AgentFindInScene("light_character_shadowLIGHT_CAM_3", sceneObj)
    local light41 = AgentFindInScene("light_character_shadowLIGHT_CAM_4", sceneObj)
    local light42 = AgentFindInScene("light_character_shadowLIGHT_CAM_5", sceneObj)
    local light43 = AgentFindInScene("light_character_shadowLIGHT_CAM_6", sceneObj)
    local light44 = AgentFindInScene("light_character_shadowLIGHT_CAM_7", sceneObj)
    destroyMe(light1)
    destroyMe(light2)
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
    destroyMe(light28)
    destroyMe(light29)
    destroyMe(light30)
    destroyMe(light31)
    destroyMe(light32)
    destroyMe(light33)
    destroyMe(light34)
    destroyMe(light35)
    destroyMe(light36)
    destroyMe(light37)
    destroyMe(light38)
    destroyMe(light39)
    destroyMe(light40)
    destroyMe(light41)
    destroyMe(light42)
    destroyMe(light43)
    destroyMe(light44)
    
    
    local light45 = AgentFindInScene("light_ENV_D_1", sceneObj)
    local light46 = AgentFindInScene("light_", sceneObj) -- no idea
    local light47 = AgentFindInScene("light_ambEnlighten", sceneObj)
    local light47_props = AgentGetRuntimeProperties(light47)
    destroyMe(light46)

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
    local dupedLight45_sun = AgentCreate("light_ENV_D_1_duplicated_sun", AgentGetProperties(light45), AgentGetPos(light45), AgentGetRot(light45), sceneObj, false, false)
    ModifyLightSettings(dupedLight45_sun, 4.0, 3.0, sunColor)
    --ModifyAgentTransformation_Rotation(dupedLight42_sun, Vector(110, 92, 60))
    
    --remove original sun
    destroyMe(light45)
    
    --unknown
    --ModifyLightSettings(light46, 16.0, 1.0, skyColor)
    
    --flat ambient
    --ModifyLightSettings(light47, 16.0, 1.0, ambientColor)
    --customSetProperty(light47_props, "1733657658237399986", 8)
    --customSetProperty(light47_props, "1930888535905678774", 8)

    RemovingAllLightingRigs(sceneObj)
end

hershelFarmExterior = function()
  -- function num : 0_9 , upvalues : _ENV
  Mode(mode_Main)
  
  Devtools_Init(kScene)
  PrintSceneListToTXT(kScene, "101-hershelfarmday.txt")
  modifyScene(kScene)
  
  if not SaveLoad_IsFromLoad() and (not IsToolBuild() or not (GetPreferences())["Skip Intro Cutscenes"]) then
    if Logic["Farm - Zombies Present"] then
      if Platform_IsWiiU() then
        print("Dialog Preloading start")
        DlgPreload("env_hershelsfarm.dlog", "cs_runtoshawn", 0, 15, 0, false)
      end
      Dialog_Play("cs_runtoshawn")
    else
      if Platform_IsWiiU() then
        print("Dialog Preloading start")
        DlgPreload("env_hershelsfarm.dlog", "Wake-Up", 0, 15, 0, false)
      end
      Dialog_Play("Wake-Up")
    end
  end
end

Callback_AgentCreated:Add(onAgentCreate)
SceneOpen(kScene, kScript)

