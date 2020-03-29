instance_create_layer(x,y,"PostfxLayer",GAME_SYSTEM_SETTING);
	with(instance_create_layer(x,y,"PostfxLayer",MAP_GENERATOR)) {
		PlayerSpawnpoint_X = 256;
		PlayerSpawnpoint_Y = 478;
		AudioPlayId = database1;
		TargetRoomIndex = rLostRuins;
	}
//Delete all old generations
if (file_exists("temp_seed_01.txt")) file_delete("temp_seed_01.txt");