if (!SetGameOver) {
	if (alpha >= 0)
		alpha -= 0.02;
	else 
		instance_destroy();
} else {
	if (DrawGameOver) {
		if (alpha < 1) alpha += 0.01;
		if (alpha == 1) {	
			alarm[1] = 360;
			alpha += 0.01;
		}
	}
}