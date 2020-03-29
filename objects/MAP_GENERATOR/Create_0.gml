GenerationStepIndex =	-1;
GenerationScriptIndex =	-1;
GenerationStepNext =	true;

GeneratedRoomWidth =	0;
GeneratedRoomHeight =	0;
GeneratedBlockWidth =	1;
GeneratedBlockHeight =	1;

ArrayW =				0;
ArrayH =				0;
Seed[0,0] =				0;

MainTileLayer_id =		0;
InterierTileLayer_id =	0;
ForwardTileLayer_id =	0;
SettingTileLayer_id =	0;

CreateMapSurface =		false;
CreateStartCutscene =	false;

AlphaFadeout_1 =		false;
AlphaFadeout_2 =		true;
Alpha_1 =				0;
Alpha_2 =				1;
Alpha_3 =				-1;

PlayerSpawnpoint_X =	0;
PlayerSpawnpoint_Y =	-64;
LastRoomIndex =			room;
TargetRoomIndex =		noone;
AudioStopId =			noone;
AudioPlayId =			noone;

ParticleIndex = 		-1;
LoadSystem =			part_system_create();
LoadParticle =			part_type_create();
LoadFlipParticle =		part_type_create();

DebugMessage =			scrGetString(global.langtype,"map_generator_debug_messages","debug_message_0");

scrPartTypeMain(LoadParticle,noone,1,1,0,0,100,120,false);
scrPartTypeMain(LoadFlipParticle,noone,1,-1,0,0,100,120,false);
scrPartSprite(LoadParticle,TriangleParticle,0,1,1,false);
scrPartSprite(LoadFlipParticle,TriangleParticle,0,1,-1,false);
scrPartAlpha(LoadParticle,0,1,0);
scrPartAlpha(LoadFlipParticle,0,1,0);
part_system_automatic_draw(LoadSystem,false);