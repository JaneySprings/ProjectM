MenuPositionX =			96;
MenuPositionY =			748;
MenuTransitionSpeed =		1;
MenuCurrentFont =			fMenu;
MenuItemHeight =	font_get_size(fMenu);
MenuSelectedPosition =	-1;
MenuCanChange =		true;

MenuNamesArray[4] =			scrGetString(global.langtype,"main_menu_items","menu_item_9");
MenuNamesArray[3] =			scrGetString(global.langtype,"main_menu_items","menu_item_8");
MenuNamesArray[2] =			scrGetString(global.langtype,"main_menu_items","menu_item_7");
MenuNamesArray[1] =			scrGetString(global.langtype,"main_menu_items","menu_item_6");
MenuNamesArray[0] =			scrGetString(global.langtype,"main_menu_items","menu_item_5");

On =				scrGetString(global.langtype,"main_menu_items","menu_item_key_on");
Off =				scrGetString(global.langtype,"main_menu_items","menu_item_key_off");

MenuItemsCount =		array_length_1d(MenuNamesArray);
MenuCurrentPosition =		4; 

alpha =				1;
alpha_set =			true;

//volume 
CurVolume = global.volumeState;
//Resolutions
res[0 ,0] =			480;
res[0, 1] =			270;

res[1, 0] =			960;
res[1, 1] =			540;

res[2, 0] =			1280;
res[2, 1] =			720;

res[3, 0] =			1366;
res[3, 1] =			768;

res[4, 0] =			1440;
res[4, 1] =			810;

res[5, 0] =			1600;
res[5, 1] =			900;

res[6, 0] =			1920;
res[6, 1] =			1080;

ResCount = array_height_2d(res) - 1;
CurResIndex = global.resolution;

//lang
langFullName[0] = "English";
langFullName[1] = "Русский";

langType[0] = "en";
langType[1] = "ru";

LangCount = array_length_1d(langFullName);

if global.langtype == "en" CurLangIndex = 0;
if global.langtype == "ru" CurLangIndex = 1;

with (oNews) hide = true;
layer_background_alpha(layer_background_get_id("GameName"),0);