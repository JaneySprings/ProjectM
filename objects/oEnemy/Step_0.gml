///Add Physics and kinematic for all class inhireids
physics_VelocityH = move * physics_VelocityH_increed;
scrPhysics();

//function_SetPlayerInvisible logic if catch damage
if (function_SetPlayerInvisible) image_alpha = 0.4;
else image_alpha = 1;

//Trace if player near and trigger zone enable
if (instance_exists(oPlayer)) {
	PlayerDistance = distance_to_object(oPlayer);
	if (PlayerDistance > 420) {
		with (instance_create_layer(x,y,"NpcLayer",oAwake)) AwakeId = other.id;
		instance_deactivate_object(id);
	} else {
		if (PlayerDistance < TriggerSize) Triggered = true;
		if (PlayerDistance > DetriggerSize) Triggered = false;
	}
}

//Death Particle System
if (CurrentHp <= 0) {
	var ChunkParticle = part_type_create();
	var BloodParticle = part_type_create();
	var _rand = irandom(9);
	
	if (instance_exists(SelfBulletId)) instance_destroy(SelfBulletId);
	if (_rand == 5) with(instance_create_layer(x,y,"SpecialLayer",oPowerUp)) {
		physics_VelocityH = random_range(-4,4);
		physics_VelocityV = random_range(-6,-2);
	}
	
	scrPartTypeMain(ChunkParticle,noone,0,0,0.15,-90,200,250,false);
	scrPartSprite(ChunkParticle,PartSprite,1,1,1,0);
	scrPartColor(ChunkParticle,c_ltgray);
	scrPartAngle(ChunkParticle,0,360,2);
	scrPartAlpha(ChunkParticle,1,0);
	scrPartDirect(ChunkParticle,30,150,0,0);
	scrPartSpeed(ChunkParticle,1,3);
	
	scrPartTypeMain(BloodParticle,noone,0,0,0,0,100,150,false);
	scrPartSprite(BloodParticle,Pixel,0,2,2,0);
	scrPartColor(BloodParticle,PartColor);
	scrPartAngle(BloodParticle,0,360,2);
	scrPartAlpha(BloodParticle,1,0);
	scrPartDirect(BloodParticle,0,180);
	scrPartSpeed(BloodParticle,2,4,-0.05);
		
	part_emitter_region(ChunkParticlesystem, ChunkEmitter, x-4, x+4, y+4, y+4, ps_shape_ellipse, ps_distr_gaussian);
	part_emitter_burst(ChunkParticlesystem,ChunkEmitter,ChunkParticle,12);
	part_emitter_burst(ChunkParticlesystem,ChunkEmitter,BloodParticle,192);
	
	scrShakeCamera(3,17);
	
	repeat(5 + irandom(10)) 
		with(instance_create_layer(x,y,"BulletLayer",oExperienceParticle)) {
			physics_VelocityH = choose(-1,1) * (1 + irandom(3));
			physics_VelocityV = -5
		}	instance_destroy();
}