/// @desc Set all user configs
if (!global.fullscreenMode) {
	ResolutionArrayPointer = global.resolution;
	window_set_size(ResolutionArray[ResolutionArrayPointer,0],ResolutionArray[ResolutionArrayPointer, 1]);
}

window_set_fullscreen(global.fullscreenMode);
audio_master_gain(global.volumeState);

ParticleIndex = irandom(8);
CurrentFrameMode++;

alarm[1] = 240;