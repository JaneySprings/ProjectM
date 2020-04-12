var Key_close = 	global.InputKeycodeTAB_pressed;
var Key_exit =		global.InputKeycodeESCAPE_pressed;
var Key_left =		global.InputKeycodeLEFT;
var Key_right = 	global.InputKeycodeRIGHT;
var Key_up =		global.InputKeycodeUP;
var Key_down =		global.InputKeycodeDOWN;

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
	function_DisableUserInput =false;
	function_SetPlayerUiInvisible = false;
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