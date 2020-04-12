switch(ParticleIndex) {
	case 0: 
		part_particles_create(LoadSystem,const_ScreenWidth_native-96,const_ScreenHeight_native-140,LoadParticle,1);
		alarm[2] = 15;
		ParticleIndex = -1;	
	break;
	
	case 1:
		part_particles_create(LoadSystem,const_ScreenWidth_native-144,const_ScreenHeight_native-140,LoadFlipParticle,1);
		alarm[2] = 15;
		ParticleIndex = -1;
	break;
	
	case 2:
		part_particles_create(LoadSystem,const_ScreenWidth_native-192,const_ScreenHeight_native-140,LoadParticle,1);
		alarm[2] = 15;
		ParticleIndex = -1;
	break;
	
	case 3:
		part_particles_create(LoadSystem,const_ScreenWidth_native-240,const_ScreenHeight_native-140,LoadFlipParticle,1);
		alarm[2] = 15;
		ParticleIndex = -1;
	break;
	
	case 4:
		part_particles_create(LoadSystem,const_ScreenWidth_native-288,const_ScreenHeight_native-140,LoadParticle,1);
		alarm[2] = 15;
		ParticleIndex = -1;
	break;
	
	case 5:
		part_particles_create(LoadSystem,const_ScreenWidth_native-144,const_ScreenHeight_native-100,LoadParticle,1);
		alarm[2] = 15;
		ParticleIndex = -1;
	break;
	
	case 6:
		part_particles_create(LoadSystem,const_ScreenWidth_native-240,const_ScreenHeight_native-100,LoadParticle,1);
		alarm[2] = 15;
		ParticleIndex = -1;
	break;
	
	case 7:
		part_particles_create(LoadSystem,const_ScreenWidth_native-192,const_ScreenHeight_native-100,LoadFlipParticle,1);
		alarm[2] = 15;
		ParticleIndex = -1;
	break;
	
	case 8:
		part_particles_create(LoadSystem,const_ScreenWidth_native-192,const_ScreenHeight_native-60,LoadParticle,1);
		alarm[2] = 15;
		ParticleIndex = -1;
	break;
}