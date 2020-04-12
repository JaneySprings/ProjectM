var _keycodeSpace = global.InputKeycodeSPACE_pressed;

switch(CurrentFrameMode) {
	case 1:
		if (!TransitionFadeout) and (ImageAlpha < 1) ImageAlpha += 0.01;
		else if (TransitionFadeout) {
			if (ImageAlpha > 0) ImageAlpha -= ImageAlphaIncr;
			else {
				TransitionFadeout = false
				CurrentFrameMode++;
				alarm[1] = LoadFrameDelay;
			}
		}
	break;
	case 2:
		if (!TransitionFadeout) and (ImageAlpha < 1) ImageAlpha += ImageAlphaIncr;
		else if (TransitionFadeout) {
			if (ImageAlpha > 0) ImageAlpha -= ImageAlphaIncr;
			else CurrentFrameMode++;
		}
	break;
	case 3: room_goto_next(); break;  
}

if (_keycodeSpace) and (CurrentFrameMode > 0) CurrentFrameMode++;

//particles
scrLoadPartPattern();