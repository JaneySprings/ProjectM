if (!Invisible) {
	CurrentHp -= other.DamageToPlayer / global.PlayerDefense;
	Invisible = true;
	
	audio_play_sound(sDamageDetect,1,false);
	instance_create_layer(x,y,"TextLayer",oPlayerHitDetect);
	scrShakeCamera(40,10);
	
	alarm[1] = 90;
} else image_alpha = 0.7;