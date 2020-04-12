var KeySkip = global.InputKeycodeSPACE_pressed;

l += 0.35;
h = string_height(print);
w = string_width(print);
print = string_copy(str[ArrayIndex],1,l);

if (KeySkip) {
	if (l < string_length(str[ArrayIndex]))
		l += string_length(str[ArrayIndex]);
	else if (str[ArrayIndex+1] != "") {
		l = 0;
		ArrayIndex++;
		det = string_copy(str[ArrayIndex],string_length(str[ArrayIndex]),1);
		str[ArrayIndex] = string_delete(str[ArrayIndex],string_length(str[ArrayIndex]),1);
		//Change object and sound
		if (det == "1") {
			if (!audio_is_playing(VoiceFirst) and (audio_exists(VoiceFirst)))
				audio_play_sound(VoiceFirst,1,false);
			x = oFirst.x;
			y = oFirst.y-24;
		}
		if (det == "2") {
			if (!audio_is_playing(VoiceSecond) and (audio_exists(VoiceSecond)))
				audio_play_sound(VoiceSecond,1,false);
			x = oSecond.x;
			y = oSecond.y-24;
		}
	} else quit = true;
}

//quit
if (quit) {
	if (a >= 0) a -= 0.04;
	if (a <= 0) instance_destroy();
	with(oPlayer) {
		function_DisableUserInput = false;
		function_SetPlayerUiInvisible = false;
	}
}

//Blackframe effect
if (ypos < 0) and (!quit)
	ypos +=8;
if (ypos >= -128) and (quit)
	ypos -=6;
