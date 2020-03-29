switch(ParticleIndex) {
	case 0: 
		part_particles_create(LoadSystem,ScreenWidth-96,ScreenHeight-140,LoadParticle,1);
		alarm[2] = 15;
		ParticleIndex = -1;	
	break;
	
	case 1:
		part_particles_create(LoadSystem,ScreenWidth-144,ScreenHeight-140,LoadFlipParticle,1);
		alarm[2] = 15;
		ParticleIndex = -1;
	break;
	
	case 2:
		part_particles_create(LoadSystem,ScreenWidth-192,ScreenHeight-140,LoadParticle,1);
		alarm[2] = 15;
		ParticleIndex = -1;
	break;
	
	case 3:
		part_particles_create(LoadSystem,ScreenWidth-240,ScreenHeight-140,LoadFlipParticle,1);
		alarm[2] = 15;
		ParticleIndex = -1;
	break;
	
	case 4:
		part_particles_create(LoadSystem,ScreenWidth-288,ScreenHeight-140,LoadParticle,1);
		alarm[2] = 15;
		ParticleIndex = -1;
	break;
	
	case 5:
		part_particles_create(LoadSystem,ScreenWidth-144,ScreenHeight-100,LoadParticle,1);
		alarm[2] = 15;
		ParticleIndex = -1;
	break;
	
	case 6:
		part_particles_create(LoadSystem,ScreenWidth-240,ScreenHeight-100,LoadParticle,1);
		alarm[2] = 15;
		ParticleIndex = -1;
	break;
	
	case 7:
		part_particles_create(LoadSystem,ScreenWidth-192,ScreenHeight-100,LoadFlipParticle,1);
		alarm[2] = 15;
		ParticleIndex = -1;
	break;
	
	case 8:
		part_particles_create(LoadSystem,ScreenWidth-192,ScreenHeight-60,LoadParticle,1);
		alarm[2] = 15;
		ParticleIndex = -1;
	break;
}