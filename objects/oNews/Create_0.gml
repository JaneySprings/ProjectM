layer_background_xscale(layer_background_get_id("Background"),4);
layer_background_yscale(layer_background_get_id("Background"),4);

newsMain =			array_create(32, "");
newsTemp =			array_create(32, "");
newsMain[0] =		"loading...";

rect_x =			0;
hide =				false;
fileRead =			true;
mode =				-1;
alpha =				1;
ScrollerIndex =	choose(0,1,2,3);

if (file_exists("game_log.txt")) {
	var file = file_text_open_read("game_log.txt");
	for (var i = 0; i < 32; i++;) newsTemp[i] = file_text_readln(file);
	file_text_close(file);
} alarm[1] = 240;