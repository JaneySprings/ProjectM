/// @desc Check sound played
if (audio_is_playing(snd_canstop))
	audio_stop_sound(snd_canstop);

if (!audio_is_playing(snd_mustplay)) {
	global.Music = audio_get_name(audio_play_sound(snd_mustplay,1,true)); 
	instance_destroy();
}