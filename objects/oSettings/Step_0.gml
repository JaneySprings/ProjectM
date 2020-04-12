//keys
var key_up =		global.InputKeycodeUP_pressed;
var key_down =		global.InputKeycodeDOWN_pressed;
var key_left =		global.InputKeycodeLEFT_pressed;;
var key_right =		global.InputKeycodeRIGHT_pressed;;
var key_esc =		global.InputKeycodeESCAPE_pressed;

if (MenuCanChange)
{
	if (key_up)
	{
		audio_play_sound(sMenuControl,1,false);;
		MenuCurrentPosition++;
		if (MenuCurrentPosition >= MenuItemsCount)
			MenuCurrentPosition = 0;
	}
	if (key_down)
	{
		audio_play_sound(sMenuControl,1,false);
		MenuCurrentPosition--;
		if (MenuCurrentPosition < 0)
			MenuCurrentPosition = MenuItemsCount-1;
	}
	if (key_esc)
	{
		audio_play_sound(sMenuConfirm,1,false);
		MenuSelectedPosition = -2;
	}
}

//MenuNamesArray switch

if (MenuSelectedPosition != -1)
{
	switch (MenuSelectedPosition)
	{
		case 4: //resolution
		{
			if (!global.fullscreenMode)
			{
				global.resolution = CurResIndex;
				window_set_size(res[CurResIndex, 0],res[CurResIndex, 1]);
			}
			MenuSelectedPosition = -1;
			break;
		}
		case 3: //fullscreen
		{
			window_set_fullscreen(global.fullscreenMode);
			game_set_speed(60,fps);
			MenuSelectedPosition = -1;
			break;	
		}
		case 2: //FXAA
		{
			MenuSelectedPosition = -1;
			break;
		}
		case 1: //Volume
		{	
			global.volumeState = CurVolume;
			audio_master_gain(global.volumeState);
			MenuSelectedPosition = -1;
			break;
		}
		case 0: //lang
		{
			global.langtype = langType[CurLangIndex];
			MenuSelectedPosition = -1;
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
if (MenuCurrentPosition == 4) and (!global.fullscreenMode) {
	if (key_right) {
		if (CurResIndex < ResCount) CurResIndex++;
		MenuSelectedPosition = MenuCurrentPosition;
	}
	if (key_left) {
		if (CurResIndex > 0) CurResIndex--;
		MenuSelectedPosition = MenuCurrentPosition;
	}
}
//Fullscreen
if (MenuCurrentPosition == 3) {
	if (key_right or key_left) {
		global.fullscreenMode = !global.fullscreenMode;
		MenuSelectedPosition = MenuCurrentPosition;
	}
}
//Rays
if (MenuCurrentPosition == 2) {
	if (key_right or key_left) {
		global.raytrace = !global.raytrace;
		MenuSelectedPosition = MenuCurrentPosition;
	}
}
//volume
if (MenuCurrentPosition == 1) {
	if (key_right) {
		if (CurVolume < 1) CurVolume += 0.1;
		MenuSelectedPosition = MenuCurrentPosition;
	}
	if (key_left) {
		if (CurVolume > 0) CurVolume -= 0.1;
		MenuSelectedPosition = MenuCurrentPosition;
	}
}
//lang
if (MenuCurrentPosition == 0) {
	if (key_right) {
		if (CurLangIndex < LangCount-1) CurLangIndex++;
		else CurLangIndex = 0;
		
		MenuSelectedPosition = MenuCurrentPosition;
	}
	if (key_left) {
		if (CurLangIndex > 0) CurLangIndex--;
		else CurLangIndex = LangCount-1;
		
		MenuSelectedPosition = MenuCurrentPosition;
	}
}