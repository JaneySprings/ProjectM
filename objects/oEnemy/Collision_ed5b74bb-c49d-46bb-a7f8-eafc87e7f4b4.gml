if (!function_SetPlayerInvisible) {
	flash = true;
	OtherDamage = other.DamageToPlayer / defence;
	CurrentHp -= OtherDamage;
	with (instance_create_layer(x-random_range(-32,32),y-64,"TextLayer",oTextParticle)) text = string(other.OtherDamage);
	audio_play_sound(sDamageDetect,1,false);
		
	function_SetPlayerInvisible = true;
	alarm[0] = 30;
}