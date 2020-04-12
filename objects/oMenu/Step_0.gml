MenuPositionX += (MenuPositionXTarget - MenuPositionX) / MenuTransitionSpeed;
//key
var _keycodeUp =		global.InputKeycodeUP_pressed;
var _keycodeDown =		global.InputKeycodeDOWN_pressed;
var _keycodeEnter =		global.InputKeycodeENTER_pressed;

if (MenuCanChange) {
	if (_keycodeUp) {	
		audio_play_sound(sMenuControl,1,false);
		MenuCurrentPosition++;
		if (MenuCurrentPosition >= MenuItemsCount) MenuCurrentPosition = 0;
	}
	
	if (_keycodeDown) {
		audio_play_sound(sMenuControl,1,false);
		MenuCurrentPosition--;
		if (MenuCurrentPosition < 0) MenuCurrentPosition = MenuItemsCount-1;
	}
	
	if (_keycodeEnter) {
		audio_play_sound(sMenuConfirm,1,false);
		MenuSelectedPosition = MenuCurrentPosition;
		MenuCanChange = false;
	}
}

//MenuNamesArray switch
if (MenuSelectedPosition != -1)
	switch (MenuSelectedPosition) {
		case 4: //Button continue
		scrLoadGlobals();
		//Get index for map generator
		global.ScriptIndex = scrGetGlobals("ScriptIndex");
		global.MapSprite = noone;
		//Instant generator
		with(instance_create_layer(x,y,"PostfxLayer",MAP_GENERATOR)) {
				GenerationScriptIndex = scrGetGlobals("ScriptIndex");
				PlayerSpawnpoint_X = scrGetGlobals("X");
				PlayerSpawnpoint_Y = scrGetGlobals("Y");
				AudioPlayId = scrGetAudioByName(global.Music);
				TargetRoomIndex = scrGetGlobals("Room");
				CreateStartCutscene = true;
			}
		//Other
		//with (oNews) hide = true;
		audio_stop_sound(database0);
		instance_destroy();
		
		break;
		//New game
		case 3: 
			//Delete all temp files
			if (file_exists("user_data")) file_delete("user_data");
			if (file_exists("temp_seed_01.txt")) file_delete("temp_seed_01.txt");
			//add first generator setting
			instance_create_layer(x,y,"PostfxLayer",GAME_SYSTEM_SETTING);
			with(instance_create_layer(x,y,"PostfxLayer",MAP_GENERATOR)) {
				PlayerSpawnpoint_X = 256;
				PlayerSpawnpoint_Y = 478;
				AudioPlayId = database1;
				TargetRoomIndex = rLostRuins;
				CreateStartCutscene = false; //TRUE!!!
			}
			//Other
			with (oNews) hide = true;
			if (instance_exists(oPlayer)) instance_destroy(oPlayer);
			audio_stop_sound(database0);
			instance_destroy();
		break;
		//Settings
		case 2:
			instance_create_layer(x,y,"Instances",oSettings);
			instance_destroy();
		break;
		//Updates
		case 1: 
			url_open("https://vk.com/gmunity_oc"); 
			MenuSelectedPosition = -1;
			MenuCanChange = true;
		break;
		//Exit
		case 0: game_end(); break;
	}	
	
//MenuSelectorAlpha
if (MenuSelectorAlphaSet) {
	MenuSelectorAlpha -= 0.01;	
	if (MenuSelectorAlpha == 0.3) MenuSelectorAlphaSet = false;
}

if (!MenuSelectorAlphaSet) {
	MenuSelectorAlpha += 0.01;	
	if (MenuSelectorAlpha > 1) MenuSelectorAlphaSet = true;
}
