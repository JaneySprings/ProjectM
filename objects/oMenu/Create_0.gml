MenuSizeWidth =					48;
MenuSizeHeight =					840;
MenuSizeMargin =					32;
MenuSizeNamesDelay =		2;

MenuTransitionSpeed =			1;
MenuSelectorAlpha =				1;
MenuSelectorAlphaSet =		true;

MenuPositionX =						MenuSizeWidth - 500;
MenuPositionY =						MenuSizeHeight - MenuSizeMargin;
MenuPositionXTarget =			MenuSizeWidth + MenuSizeMargin;
MenuCurrentFont =				fMenu;
MenuItemHeight =					font_get_size(MenuCurrentFont);
MenuSelectedPosition =			-1;
MenuCanChange =					true;

if (file_exists("user_data"))
MenuNamesArray[4] =			scrGetString(global.langtype,"main_menu_items","menu_item_4");
MenuNamesArray[3] =			scrGetString(global.langtype,"main_menu_items","menu_item_3");
MenuNamesArray[2] =			scrGetString(global.langtype,"main_menu_items","menu_item_2");
MenuNamesArray[1] =			scrGetString(global.langtype,"main_menu_items","menu_item_1");
MenuNamesArray[0] =			scrGetString(global.langtype,"main_menu_items","menu_item_0");

MenuItemsCount =		array_length_1d(MenuNamesArray);
MenuCurrentPosition =		MenuItemsCount-1;

layer_background_alpha(layer_background_get_id("GameName"),1);

with (oNews) hide = false;