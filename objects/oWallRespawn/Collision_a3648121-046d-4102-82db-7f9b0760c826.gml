if (!instance_exists(oBlackFadeout)) {
	with (instance_create_layer(0,0,"BulletLayer",oBlackFadeout)) {
		ToBlack = true;
		ToClear = true;
		incr = 0.05;
	}
}