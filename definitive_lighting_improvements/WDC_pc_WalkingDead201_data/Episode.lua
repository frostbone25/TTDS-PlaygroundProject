-- Decompiled using luadec 2.2 rev:  for Lua 5.2 from https://github.com/viruscamp/luadec
-- Command line: A:\Steam\twd-definitive\scripteditor-10-31-20\definitive_lighting_improvements\WDC_pc_WalkingDead201_data\Episode_temp.lua 

-- params : ...
-- function num : 0 , upvalues : _ENV
Episode_Init = function()
  -- function num : 0_0 , upvalues : _ENV
  DebugMenu_AddButton(1, "Act I")
  DebugMenu_AddButton(1, "Previously On", "PreviouslyOn")
  DebugMenu_AddButton(1, "Truck Stop", "TruckStopBathroom")
  DebugMenu_AddButton(1, "Campfire", "ClearingCampfire")
  DebugMenu_AddButton(1, "Campfire Backpack", "ClearingCampfire", "LogicSet( \"1Campfire - Reached Campfire\", true );")
  DebugMenu_AddButton(1, "River Woods", "RiverWoods")
  DebugMenu_AddButton(1, "River Woods Action", "RiverWoods", "LogicSet( \"1RiverWoods - Winston Fight Stage\", 10 );")
  DebugMenu_AddButton(1, "River Shore", "RiverShore")
  DebugMenu_AddButton(1, "River Shore Path", "RiverShore", "LogicSet( \"1RiverShore - Used Stairs\", true );")
  DebugMenu_AddButton(1, "River Shore Forest", "RiverShore", "LogicSet( \"1RiverShore - Current Trail Path\", 2 );")
  DebugMenu_AddButton(2, "Act II")
  DebugMenu_AddButton(2, "River Camp", "RiverCamp")
  DebugMenu_AddButton(2, "River Camp Fight", "RiverCamp", "LogicSet( \"2Camp - Dog Attacked\", true );")
  DebugMenu_AddButton(2, "River Camp Walk", "RiverCamp", "LogicSet( \"2Camp - Dog Attacked\", true ); LogicSet( \"2Camp - Killed Dog\", true )")
  DebugMenu_AddButton(2, "Cabin Exterior I", "CabinExterior")
  DebugMenu_AddButton(2, "Cabin Shed I", "CabinShedInterior")
  DebugMenu_AddButton(2, "Cabin Exterior II", "CabinExterior", "LogicSet( \"bEnteredCabinExterior\", true );")
  DebugMenu_AddButton(2, "Cabin Interior I", "CabinInterior", "LogicSet( \"bEnteredCabinExterior\", true );")
  DebugMenu_AddButton(3, "Act III")
  DebugMenu_AddButton(3, "Cabin Shed II", "CabinShedInterior", "LogicSet( \"Act\", 3 );")
  DebugMenu_AddButton(3, "Cabin Shed Fight", "CabinShedInterior", "LogicSet( \"Act\", 3 ); LogicSet( \"3Shed - Bandaged Arm\", true )")
  DebugMenu_AddButton(3, "Cabin Interior II", "CabinInterior", "LogicSet( \"Act\", 3 );")
  DebugMenu_AddButton(3, "Backwoods Stream", "BackwoodsStream")
  DebugMenu_AddButton(3, "Stream Sandbar", "BackwoodsStream", "LogicSet( \"3BackwoodsStream - Reached the Sandbar\", true );")
  DebugMenu_AddButton(3, "Stream Walkers", "BackwoodsStream", "LogicSet( \"3BackwoodsStream - Pete Bitten\", true );")
  DebugMenu_AddButton(3, "Next Time On", "NextTimeOn")
  DebugMenu_AddButton(3, "Credits", nil, "DebugMenu_ToggleButtons( nil, true ); Credits( 1, true );")
  if not IsDebugBuild() then
    return 
  end
  if not Game_GetScene() then
    GameMode()
    DebugMenu_ToggleButtons()
  end
end

Callback_OnGameSceneOpen:Add(Episode_Init)

