switch(ScrollerIndex) {
	case 0: layer_background_sprite(layer_background_get_id("Background"),ScrollerImage01); break;
	case 1: layer_background_sprite(layer_background_get_id("Background"),ScrollerImage02); break;
	case 2: layer_background_sprite(layer_background_get_id("Background"),ScrollerImage03); break;
	case 3: layer_background_sprite(layer_background_get_id("Background"),ScrollerImage04); break;
}

if (ScrollerIndex < 3) ScrollerIndex++;
else ScrollerIndex = 0;

layer_x("Background", -1380);
mode = 0;