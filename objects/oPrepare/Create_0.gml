//Legal key founding
if file_exists("permision.dll") {
	var f = file_text_open_read("permision.dll");
	key = file_text_read_string(f);
	if (key != "ADMIN_DEVELOPER_VIEW")
		game_end();
	file_text_close(f);
}
else game_end();

//Define
#macro ScreenWidth 1920
#macro ScreenHeight 1080

if (file_exists("game_log.txt"))
	file_delete("game_log.txt");
	
//GithubLogfileUrl = http_get_file("https://raw.githubusercontent.com/JaneySprings/MMAD/master/game_log.txt","\game_log.txt");	

LoadFrameDelay = 180;
TransitionFadeout = false;
CurrentFrameMode = 0;
ImageAlpha = 0;
ImageAlphaIncr = 0.02;
ResolutionArrayPointer = 0;

//Resolutions
ResolutionArray[0 ,0] =			480;
ResolutionArray[0, 1] =			270;

ResolutionArray[1, 0] =			960;
ResolutionArray[1, 1] =			540;

ResolutionArray[2, 0] =			1280;
ResolutionArray[2, 1] =			720;

ResolutionArray[3, 0] =			1366;
ResolutionArray[3, 1] =			768;

ResolutionArray[4, 0] =			1440;
ResolutionArray[4, 1] =			810;

ResolutionArray[5, 0] =			1600;
ResolutionArray[5, 1] =			900;

ResolutionArray[6, 0] =			1920;
ResolutionArray[6, 1] =			1080;

if (file_exists("configfile")) script_execute(scrLoadSettings);
else {
	global.resolution = 1;
	global.fullscreenMode = false;
	global.raytrace = false;
	global.volumeState = 1;
	global.langtype = "en";
}

//Particles region
LoadSystem = part_system_create();
LoadParticle = part_type_create();
LoadFlipParticle = part_type_create();
ParticleIndex = -1;

scrPartTypeMain(LoadParticle,noone,1,1,0,0,100,120,false);
scrPartTypeMain(LoadFlipParticle,noone,1,-1,0,0,100,120,false);
scrPartSprite(LoadParticle,TriangleParticle,0,1,1,false);
scrPartSprite(LoadFlipParticle,TriangleParticle,0,1,-1,false);
scrPartAlpha(LoadParticle,0,1,0);
scrPartAlpha(LoadFlipParticle,0,1,0);

alarm[0] = 15;