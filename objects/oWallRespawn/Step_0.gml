if (instance_exists(oBlackFadeout)) 
	if (oBlackFadeout.set) and (oBlackFadeout.alpha > 0.9) {
		oPlayer.x = oPlayer.Last_x;
		oPlayer.y = oPlayer.Last_y - 8;
	}
