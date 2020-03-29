//Define all global damage count
var pFlyGroundAttackRed = oPlayer.FlyGroundAttackDamage;
var pHoriDashRed = global.DashDamage;
var pDoubleJumpRed = global.DoubleJumpDamage;
var pPartShieldRed = global.PartShieldDamage;

if (!Invisible) {
	if (oPlayer.FlyGroundAttack) {
		//Damage calculate
		flash = true;
		OtherDamage = pFlyGroundAttackRed / defence;
		CurrentHp -= OtherDamage;
		with (instance_create_layer(x-random_range(-32,32),y-64,"TextLayer",oTextParticle)) text = string(other.OtherDamage);
		audio_play_sound(sDamageDetect,1,false);
		
		Invisible = true;
		alarm[0] = 30;
	}
	if (oPlayer.HoriDash) {
		//Direction calculate
		hsp = 5 * other.image_xscale;
		vsp = -7;
		
		//Damage calculate
		flash = true;
		OtherDamage = pHoriDashRed / defence;
		CurrentHp -= OtherDamage;
		with (instance_create_layer(x-random_range(-32,32),y-64,"TextLayer",oTextParticle)) text = string(other.OtherDamage);
		audio_play_sound(sDamageDetect,1,false);
		
		Invisible = true;
		alarm[0] = 30;
	}
	if (oPlayer.HighJump and oPlayer.PossibleJumping) {
		//Direction calculate
		vsp = - 8;
		
		//Damage calculate
		flash = true;
		OtherDamage = pDoubleJumpRed / defence;
		CurrentHp -= OtherDamage;
		with (instance_create_layer(x-random_range(-32,32),y-64,"TextLayer",oTextParticle)) text = string(other.OtherDamage);
		audio_play_sound(sDamageDetect,1,false);
		
		Invisible = true;
		alarm[0] = 30;
	}
	if (oPlayer.PartShield) {
		//Direction calculate
		hsp = 6 * other.image_xscale;
		vsp = -5;
		
		//Damage calculate
		flash = true;
		OtherDamage = pPartShieldRed / defence;
		CurrentHp -= OtherDamage;
		with (instance_create_layer(x-random_range(-32,32),y-64,"TextLayer",oTextParticle)) text = string(other.OtherDamage);
		audio_play_sound(sDamageDetect,1,false);
		
		Invisible = true;
		alarm[0] = 45;
	}
}