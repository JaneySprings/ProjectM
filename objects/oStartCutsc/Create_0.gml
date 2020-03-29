if (global.Timeline == 0) {
	ShowStartCutsc = true;
	ShowKeyMapping = true;
} else {
	ShowStartCutsc = false;
	ShowKeyMapping = false;
}

alpha = 1;
text_a = -1;
tick = -1000;
ypos = 0;

if (ShowStartCutsc) {
	oCamera.follow = noone;
	oCamera.y = 128;
}
with (oPlayer) {
	DisableInput = true;
	HideUI = true;
}