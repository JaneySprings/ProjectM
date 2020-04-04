menu_x += (menu_x_target - menu_x) / menu_speed;
//key
var _keycodeUp =		global.keyUpP;
var _keycodeDown =		global.keyDownP;
var _keycodeEnter =		global.keyEnterP;

if (menu_control) {
	if (_keycodeUp) {	
		audio_play_sound(sMenuControl,1,false);
		menu_cursor++;
		if (menu_cursor >= menu_items) menu_cursor = 0;
	}
	
	if (_keycodeDown) {
		audio_play_sound(sMenuControl,1,false);
		menu_cursor--;
		if (menu_cursor < 0) menu_cursor = menu_items-1;
	}
	
	if (_keycodeEnter) {
		audio_play_sound(sMenuConfirm,1,false);
		menu_committed = menu_cursor;
		menu_control = false;
	}
}

//menu switch
if (menu_committed != -1)
	switch (menu_committed) {
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
				AudioPlayId = scrGetAudioId(global.Music);
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
				CreateStartCutscene = true; //TRUE!!!
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
			menu_committed = -1;
			menu_control = true;
		break;
		//Exit
		case 0: game_end(); break;
	}	
	
//alpha
if (alpha_set) {
	alpha -= 0.01;	
	if (alpha == 0.3) alpha_set = false;
}

if (!alpha_set) {
	alpha += 0.01;	
	if (alpha > 1) alpha_set = true;
}
