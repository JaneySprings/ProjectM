//backgroundEffect
switch(mode) {
	case 0:
		if (alpha >= 0) 
			alpha -= 0.01;
		layer_background_alpha(layer_background_get_id("MainFon"),alpha);
	break;
	case 1:
		if (alpha <= 1) 
			alpha += 0.02;
		layer_background_alpha(layer_background_get_id("MainFon"),alpha);
	break;
}
if (layer_get_x("Background") > 0) and (mode == 0) {
	alarm[1] = 480;
	mode = 1;
}

//Animation
if (rect_x <= 512) rect_x += 8;