var Key_close = 	global.keyTabP;
var Key_exit =		global.keyEscP;
var Key_left =		global.keyLeft;
var Key_right = 	global.keyRight;
var Key_up =		global.keyUp;
var Key_down =		global.keyDown;

//Key mapping
if (Key_left)
	if (MapX > -sprite_get_width(MapSprite) * MapS)
		MapX -= 4;
if (Key_right)
	if (MapX < GUI_W)
		MapX += 4;
if (Key_up)
	if (MapY > -sprite_get_height(MapSprite) * MapS)
		MapY -= 4;
if (Key_down)
	if (MapY < GUI_H)
		MapY += 4;

if (Key_close) {
	with (oPostFX) DisableFog2d = false;
	with (oPlayer) {
	DisableInput =false;
	HideUI = false;
	} instance_destroy();
}

//Exit to menus;
if (Key_exit) {
	//Save all info
	scrSaveGame();
	audio_stop_all();
	room_goto(R_TitleScreen);
	instance_destroy(oPlayer);
	instance_destroy();
}

//Effect
if (MapIconChange) {
	if (MapIconAlpha < 1) MapIconAlpha += 0.02;
	else MapIconChange = false;
} else {
	if (MapIconAlpha > 0.5) MapIconAlpha -= 0.02;
	else MapIconChange = true;
}