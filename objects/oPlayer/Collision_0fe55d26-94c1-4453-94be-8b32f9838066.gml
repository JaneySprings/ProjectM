if (!function_SetPlayerInvisible) {
	CurrentHp -= other.DamageToPlayer / global.PlayerDefense;
	function_SetPlayerInvisible = true;
	
	audio_play_sound(resource_PlayerHitSound,1,false);
	instance_create_layer(x,y,"TextLayer",oPlayerHitDetect);
	scrShakeCamera(40,10);
	alarm[1] = 90;
} else image_alpha = 0.7;