//reset temp file
if (file_exists("temp_seed_01.txt")) {
	var temp_file = file_text_open_read("temp_seed_01.txt");
		for (var i = 0; i < ArrayH; i++)
			for (var j = 0; j < ArrayW; j++)
				Seed[i, j] = file_text_read_real(temp_file);
		file_text_close(temp_file);
} else {
	//Reset Seed to zero position
	for (var i = 0; i < ArrayH; i++)
		for (var j = 0; j < ArrayW; j++)
			Seed[i, j] = 0;

	var confirm = scrGetNumber("random_map_generation_confirm","level_1_generate_automatic");
	if (confirm) {
		//generate random level
		//while randon high != 0 set high map
		for (var i = 0; i < ArrayW; i += choose(2,3))
			for (var high = ArrayH-1; high > (ArrayH - 4) - irandom(2); high--) {
				//Primary adding hight
				Seed[high, i] = 11; //srand
				//Create Spawnpoint
				if (i == 0) and (high == ArrayH - 2) 
					Seed[high, i] = 12;
				
				//Add bridge
				if (i > 0) and (high == ArrayH - 4) {
					Seed[high, i-1] = 21;  //srand
					//Seed[ArrayH - 1 - high, i+1] = 21; //srand
				}
			}

		for (var i = 0; i < ArrayW; i++) {
			//create bottoms
			//add bottom collumn if whis cell exists
			if (Seed[ArrayH-1, i] != 0)
				Seed[ArrayH-1, i] = 1 + irandom(4); //without zero number and count -1
		}
	} else {
		//generate user level
		var user_file = file_text_open_read("UserData/user_datacode_1.txt");
		for (var i = 0; i < ArrayH; i++)
			for (var j = 0; j < ArrayW; j++)
				Seed[i, j] = file_text_read_real(user_file);
		file_text_close(user_file);
	}
	//create temp file
	var temp_file = file_text_open_write("temp_seed_01.txt");
		for (var i = 0; i < ArrayH; i++) {
			for (var j = 0; j < ArrayW; j++)
				 file_text_write_real(temp_file,Seed[i, j]);
			file_text_writeln(temp_file);
		}
		file_text_close(temp_file);
}