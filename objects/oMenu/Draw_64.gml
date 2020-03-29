scrDrawSettings(fMenu,c_white,fa_left,fa_bottom,1);

for (var i = 0; i < menu_items; i++)
{
	var txt = menu[i];
	var xx = menu_x;
	var yy = menu_y - (menu_itemheight * (i * 2));
	if (i == menu_cursor)
		draw_sprite_ext(Selector,0,xx-14,yy-30,2,2,0,c_white,alpha);
	scrDrawOutlined(xx,yy,1,txt,c_white,c_black);
	scrDrawShadow(xx,yy,txt,c_white,c_black,1,0.7);
}