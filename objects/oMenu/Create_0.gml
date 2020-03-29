gui_width =			48;
gui_height =		840;
gui_margin =		32;

alpha =				1;
alpha_set =			true;

menu_x =			gui_width - 500;
menu_y =			gui_height - gui_margin;
menu_x_target =		gui_width + gui_margin;
menu_speed =		1;
menu_font =			fMenu;
menu_itemheight =	font_get_size(fMenu);
menu_committed =	-1;
menu_control =		false;

if (file_exists("user_data"))
menu[4] =			scrGetString(global.langtype,"main_menu_items","menu_item_4");
menu[3] =			scrGetString(global.langtype,"main_menu_items","menu_item_3");
menu[2] =			scrGetString(global.langtype,"main_menu_items","menu_item_2");
menu[1] =			scrGetString(global.langtype,"main_menu_items","menu_item_1");
menu[0] =			scrGetString(global.langtype,"main_menu_items","menu_item_0");

menu_items =		array_length_1d(menu);
menu_cursor =		menu_items-1;

layer_background_alpha(layer_background_get_id("GameName"),1);

with (oNews) hide = false;
if (instance_exists(oPlayer))
	instance_destroy(oPlayer);
	
alarm[0] = 15;