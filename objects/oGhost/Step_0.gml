event_inherited();
//Simple walk animation (Eye direction)
if (physics_VelocityH != 0) image_xscale = sign(physics_VelocityH);

//Triggered state
if (instance_exists(oPlayer)) {
	if (Triggered) or (CompleteLastEvent) { 
		move = 0;
	
		if (oPlayer.x > x) image_xscale = 1;
		else image_xscale = -1;
	
		//Randomize
		if (SetRandonEvent) {
			alarm[2] = 30 + irandom(60);
			SetRandonEvent = false;
		}
				
		switch(EventIndex) {
			case 0: //shoot
				CompleteLastEvent = true;
				sprite_index = GhostShoot;
			
				if (image_index > 4) and (CanShoot) {
					SelfBulletId = instance_create_layer(x+20*image_xscale,y+4,"BulletLayer",oBullet);
					with(SelfBulletId) {
						sprite_index = GhostBullet;
						image_xscale = other.image_xscale;
						DamageToPlayer = 10;
						LiveTime = 30;
						physics_VelocityHeed = 4 * other.image_xscale;
						physics_VelocityVeed = 0.2;
					}
					audio_play_sound(snd_sfx5, 1, false);
					CanShoot = false;
				}
				if (image_index > image_number - 1) {
					sprite_index = GhostWalk;
					SetRandonEvent = true;
					CompleteLastEvent = false;
					EventIndex = -1;
				}
			break;
			case 1: //tp
				if (distance_to_object(oPlayer) > 70) CanTeleport = true;
				if (CanTeleport) {
					CompleteLastEvent = true;
					sprite_index = GhostTeleport;
				
					if (image_index == 0) audio_play_sound(sEnemyAttack02,1,false);
					if (floor(image_index) == 8) { 
						x = oPlayer.x - 42 * (oPlayer.image_xscale);
						y = oPlayer.y - 16;
					}
					if (image_index > image_number - 1) {
						sprite_index = GhostWalk;
						SetRandonEvent = true;
						EventIndex = -1;
						CanTeleport = false;
					}
				} else {
					EventIndex = 0; 
					CanShoot = true;
					CompleteLastEvent = false;
				}
			break;
		}	
	} else {
		sprite_index = GhostWalk;
		if (!place_meeting(x+physics_VelocityH*10,y+1,oWall) and place_meeting(x,y+1,oWall)) or (place_meeting(x+sign(physics_VelocityH),y,oWall))
			move = -move;
		else if (move == 0) move = choose(-1,1);
	}
} else {
		sprite_index = GhostWalk;
		if (!place_meeting(x+physics_VelocityH*10,y+1,oWall) and place_meeting(x,y+1,oWall)) or (place_meeting(x+sign(physics_VelocityH),y,oWall))
			move = -move;
		else if (move == 0) move = choose(-1,1);
}