/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

//Reload Arrow
if (Reload) {
		SelfBulletId = instance_create_layer(x,y,"BulletLayer",oBullet);
		with(oBullet) {
			sprite_index = TurretArrow;
			image_xscale = other.image_xscale;
			DamageToPlayer = 15;
		}	
	Reload = false;
	move = 0;
}

if (Triggered) {
	if (Shoot) {
		with (SelfBulletId) {
			hspeed = 5 * image_xscale;
			vspeed = 0.3;
			LiveTime = 150;
		}
		audio_play_sound(sTurretArrow,1,false);
		alarm[1] = 300;
		alarm[2] = 15;
		move = -4*image_xscale;
		Shoot = false;
	}
}