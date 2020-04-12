//Define all global damage count
var pFlyGroundAttackRed = oPlayer.FlyGroundAttackDamage;
var pHoriDashRed = global.DashDamage;
var pDoubleJumpRed = global.DoubleJumpDamage;
var pPartShieldRed = global.PartShieldDamage;

if (!function_SetPlayerInvisible) {
	if (oPlayer.FlyGroundAttack) {
		//Damage calculate
		flash = true;
		OtherDamage = pFlyGroundAttackRed / defence;
		CurrentHp -= OtherDamage;
		with (instance_create_layer(x-random_range(-32,32),y-64,"TextLayer",oTextParticle)) text = string(other.OtherDamage);
		audio_play_sound(sDamageDetect,1,false);
		
		function_SetPlayerInvisible = true;
		alarm[0] = 30;
	}
	if (oPlayer.HoriDash) {
		//Direction calculate
		physics_VelocityH = 5 * other.image_xscale;
		physics_VelocityV = -7;
		
		//Damage calculate
		flash = true;
		OtherDamage = pHoriDashRed / defence;
		CurrentHp -= OtherDamage;
		with (instance_create_layer(x-random_range(-32,32),y-64,"TextLayer",oTextParticle)) text = string(other.OtherDamage);
		audio_play_sound(sDamageDetect,1,false);
		
		function_SetPlayerInvisible = true;
		alarm[0] = 30;
	}
	if (oPlayer.HighJump and oPlayer.PossibleJumping) {
		//Direction calculate
		physics_VelocityV = - 8;
		
		//Damage calculate
		flash = true;
		OtherDamage = pDoubleJumpRed / defence;
		CurrentHp -= OtherDamage;
		with (instance_create_layer(x-random_range(-32,32),y-64,"TextLayer",oTextParticle)) text = string(other.OtherDamage);
		audio_play_sound(sDamageDetect,1,false);
		
		function_SetPlayerInvisible = true;
		alarm[0] = 30;
	}
	if (oPlayer.PartShield) {
		//Direction calculate
		physics_VelocityH = 6 * other.image_xscale;
		physics_VelocityV = -5;
		
		//Damage calculate
		flash = true;
		OtherDamage = pPartShieldRed / defence;
		CurrentHp -= OtherDamage;
		with (instance_create_layer(x-random_range(-32,32),y-64,"TextLayer",oTextParticle)) text = string(other.OtherDamage);
		audio_play_sound(sDamageDetect,1,false);
		
		function_SetPlayerInvisible = true;
		alarm[0] = 45;
	}
}