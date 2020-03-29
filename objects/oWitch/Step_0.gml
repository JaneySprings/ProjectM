// Inherit the parent event
event_inherited();

//Trigger Actions
if (instance_exists(oPlayer)) {
	if (Triggered) {
		//Simple animation (Eye direction)
		if (oPlayer.x > x) image_xscale = 1;
		else image_xscale = -1;
	
		//Set nearest object enemy::classEnemy (not self)
		if (!instance_exists(ChoosedInstance))
			ChoosedInstance = instance_nearest(x,y,oGhost);
	
		//attak if player nearest
		if (distance_to_object(oPlayer) < 96) or EndThisEvent { 
			//Define standart statesment
			CastIndex = -1;
			EndThisEvent = true;
		
			//Restore invisible in EnemyObjects
			if (instance_exists(ChoosedInstance)) with (ChoosedInstance) Invisible = false;
		
			//Spawn tunder bullet
			sprite_index = WitchAttack;
			if (image_index > 4) and (CanShoot) {
				SelfBulletId = instance_create_layer(x+8*image_xscale,y-45,"BulletLayer",oBullet);
				with(SelfBulletId) {
					sprite_index = WitchBullet;
					image_xscale = other.image_xscale;
					DamageToPlayer = 20;
					LiveTime = 30;
					direction = -15 * image_xscale;
					speed = 1 * other.image_xscale;
				}
				audio_play_sound(sEnemyAttack01,1,false);
				CanShoot = false;
			}
			if (image_index > image_number - 1) {
				image_index = 0;
				EndThisEvent = false;
				CanShoot = true;
			}
		} else {
			sprite_index = WitchIdle;
			CastIndex = CastIndexPersistent;
		}

		//Cast ability
		if (distance_to_object(ChoosedInstance) < 450) {
			switch (CastIndex) {
				case 0: //Cast always invisible
					sprite_index = WitchCast;
				
					if (image_index > image_number - 1) {
						image_speed = 0;
						with (ChoosedInstance) {
							Invisible = true;
							Triggered = true;
						}
				
						//Particle Create
						var Dist = distance_to_object(ChoosedInstance)/5;
						var Angle = point_direction(x,y-36,ChoosedInstance.x,ChoosedInstance.y);
			
						scrPartTypeMain(CastParticle,pt_shape_square,0.1,0.1,0,0,Dist+10,Dist+40,true);
						
						scrPartColor(CastParticle,c_yellow,c_orange,c_red);
						scrPartAlpha(CastParticle,1,0);
						scrPartAngle(CastParticle,0,360,2);
						scrPartDirect(CastParticle,Angle);
						scrPartSpeed(CastParticle,3);
		
						part_emitter_region(CastSystem, CastEmitter, x-5, x+5, y-40, y-48, ps_shape_ellipse, ps_distr_gaussian);
						part_emitter_burst(CastSystem,CastEmitter,CastParticle,1); 
					}
				break;
				default: 
					image_speed = 1;
			}
		} 
	}
} else sprite_index = WitchIdle;
if (CurrentHp <= 0) and (instance_exists(ChoosedInstance)) with (ChoosedInstance) Invisible = false;