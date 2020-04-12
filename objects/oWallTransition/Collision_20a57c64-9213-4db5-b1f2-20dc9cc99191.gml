if (!instance_exists(MAP_GENERATOR)) {
	global.ScriptIndex = ScriptIndex;
	//Create generator
	with (instance_create_layer(0,0,"TextLayer",MAP_GENERATOR)) {
		GenerationScriptIndex = other.ScriptIndex;
		TargetRoomIndex = other.Target;
		AudioStopId = scrGetAudioByName(global.Music);
		AudioPlayId = other.AudioToNext;
	}
}