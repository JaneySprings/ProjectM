//keys
var key_up =		global.keyUpP;
var key_down =		global.keyDownP;
var key_left =		global.keyLeftP;;
var key_right =		global.keyRightP;;
var key_esc =		global.keyEscP;

if (menu_control)
{
	if (key_up)
	{
		audio_play_sound(sMenuControl,1,false);;
		menu_cursor++;
		if (menu_cursor >= menu_items)
			menu_cursor = 0;
	}
	if (key_down)
	{
		audio_play_sound(sMenuControl,1,false);
		menu_cursor--;
		if (menu_cursor < 0)
			menu_cursor = menu_items-1;
	}
	if (key_esc)
	{
		audio_play_sound(sMenuConfirm,1,false);
		menu_committed = -2;
	}
}

//menu switch

if (menu_committed != -1)
{
	switch (menu_committed)
	{
		case 4: //resolution
		{
			if (!global.fullscreenMode)
			{
				global.resolution = CurResIndex;
				window_set_size(res[CurResIndex, 0],res[CurResIndex, 1]);
			}
			menu_committed = -1;
			break;
		}
		case 3: //fullscreen
		{
			window_set_fullscreen(global.fullscreenMode);
			game_set_speed(60,fps);
			menu_committed = -1;
			break;	
		}
		case 2: //FXAA
		{
			menu_committed = -1;
			break;
		}
		case 1: //Volume
		{	
			global.volumeState = CurVolume;
			audio_master_gain(global.volumeState);
			menu_committed = -1;
			break;
		}
		case 0: //lang
		{
			global.langtype = langType[CurLangIndex];
			menu_committed = -1;
			break;
		}
		default: {
			script_execute(scrSaveSettings);
			instance_create_layer(x,y,"Instances",oMenu);
			instance_destroy();
			break;
		}
	}
}
//alpha
if (alpha_set)
{
	alpha -= 0.01;	
	if (alpha == 0.3)
		alpha_set = false;
}

if (!alpha_set)
{
	alpha += 0.01;	
	if (alpha > 1)
		alpha_set = true;
}

//resolution navigation 
if (menu_cursor == 4) and (!global.fullscreenMode) {
	if (key_right) {
		if (CurResIndex < ResCount) CurResIndex++;
		menu_committed = menu_cursor;
	}
	if (key_left) {
		if (CurResIndex > 0) CurResIndex--;
		menu_committed = menu_cursor;
	}
}
//Fullscreen
if (menu_cursor == 3) {
	if (key_right or key_left) {
		global.fullscreenMode = !global.fullscreenMode;
		menu_committed = menu_cursor;
	}
}
//Rays
if (menu_cursor == 2) {
	if (key_right or key_left) {
		global.raytrace = !global.raytrace;
		menu_committed = menu_cursor;
	}
}
//volume
if (menu_cursor == 1) {
	if (key_right) {
		if (CurVolume < 1) CurVolume += 0.1;
		menu_committed = menu_cursor;
	}
	if (key_left) {
		if (CurVolume > 0) CurVolume -= 0.1;
		menu_committed = menu_cursor;
	}
}
//lang
if (menu_cursor == 0) {
	if (key_right) {
		if (CurLangIndex < LangCount-1) CurLangIndex++;
		else CurLangIndex = 0;
		
		menu_committed = menu_cursor;
	}
	if (key_left) {
		if (CurLangIndex > 0) CurLangIndex--;
		else CurLangIndex = LangCount-1;
		
		menu_committed = menu_cursor;
	}
}