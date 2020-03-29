#region Main
switch(GenerationStepIndex) {
	case 0: //Room Targeting and reset position
		if (GenerationStepNext) {
			if (instance_exists(oPlayer)) {
				oPlayer.DisableInput = true;
				oPlayer.x = 0;
				oPlayer.y = -64;
			}
			audio_stop_sound(AudioStopId);
			room_goto(TargetRoomIndex);
			ParticleIndex = irandom(8);
			GenerationStepNext = false;
			alarm[0] = 90;
		}
	break;
	case 1: //Create player if he is exists
		if (GenerationStepNext) {
			if (!instance_exists(oPlayer))
				with(instance_create_layer(0,0,"PlayerLayer",oPlayer)) {
					DisableInput = true;
					x = 0;
					y = -64;
				}
			GenerationStepNext = false;
			alarm[0] = 60;
		}
	break;

	case 2:	//Primary Seed Generation
		if (GenerationStepNext) {
			DebugMessage = scrGetString(global.langtype,"map_generator_debug_messages","debug_message_3");
			switch(GenerationScriptIndex) {
				//BridgeOfDeath
				case 1: Pattern_bridgeOfDeath_create(); break;
				//Other
				default: DebugMessage = scrGetString(global.langtype,"map_generator_debug_messages","debug_message_2"); break;
			}
			GenerationStepNext = false
			alarm[0] = 100;
		}
	break;
	case 3: //Set patterns and move Generator around the map
		if (GenerationStepNext) {
			DebugMessage = scrGetString(global.langtype,"map_generator_debug_messages","debug_message_4");
			//Check if we dont need a generation
			if (GenerationScriptIndex > 0)
				for (var i = 0; i < ArrayH; i++)
					for (var j = 0; j < ArrayW; j++) {
						//move to Creation Coordinates
						x = 256 + GeneratedBlockWidth * j;  //256px to map start delay
						y = GeneratedBlockHeight * i;
						switch(GenerationScriptIndex) {
							//BridgeOfDeath
							case 1: Pattern_bridgeOfDeath_build(i,j); break;
							//Other
							default: DebugMessage = scrGetString(global.langtype,"map_generator_debug_messages","debug_message_2"); break;
						}
					}
			GenerationStepNext = false;
			alarm[0] = 100;
		}
	break;
	
	case 4: //Prepare generated level
		if (GenerationStepNext) {
			DebugMessage = scrGetString(global.langtype,"map_generator_debug_messages","debug_message_1");
			//teleport player and view to start position
			oPlayer.x = PlayerSpawnpoint_X;
			oCamera.x = PlayerSpawnpoint_X;
			oPlayer.y = PlayerSpawnpoint_Y;
			oCamera.y = PlayerSpawnpoint_Y;
			oPlayer.DisableInput = false;
			
			with (instance_create_layer(x,y,"PlayerLayer",SOUND_PLAYER)) snd_mustplay = other.AudioPlayId;
			if (CreateStartCutscene) and (!instance_exists(oStartCutsc)) instance_create_layer(PlayerSpawnpoint_X,PlayerSpawnpoint_Y,"TextLayer",oStartCutsc);

			CreateMapSurface = true;
			GenerationStepNext = false;
			alarm[0] = 80;
		}
	break;
	case 5: AlphaFadeout_1 = true; break; //End action
}
#endregion
#region Visual Settings
//alpha's
if (!AlphaFadeout_1) {
	if (Alpha_1 <= 1) Alpha_1 += 0.05;
	if (Alpha_1 == 1) GenerationStepIndex = 0; 
}
if (AlphaFadeout_1) {
	if (Alpha_1 >= 0) {
		Alpha_1 -= 0.05;
		Alpha_3 -= 0.1;
	} else {
		scrSaveGame();
		part_system_clear(LoadSystem);
		part_system_destroy(LoadSystem);
		instance_destroy();
	}
}

if (AlphaFadeout_2) {
	Alpha_2 -= 0.02;	
	if (Alpha_2 == 0.3) AlphaFadeout_2 = false;
}
if (!AlphaFadeout_2) {
	Alpha_2 += 0.02;	
	if (Alpha_2 > 1) AlphaFadeout_2 = true;
}

if (Alpha_3 < 1) Alpha_3 += 0.02;
#endregion