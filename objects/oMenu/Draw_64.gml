scrDrawSettings(fMenu,c_white,fa_left,fa_bottom,1);

for (var i = 0; i < MenuItemsCount; i++)
{
	var txt = MenuNamesArray[i];
	var xx = MenuPositionX;
	var yy = MenuPositionY - (MenuItemHeight * MenuSizeNamesDelay * i );
	if (i == MenuCurrentPosition)
		draw_sprite_ext(Selector,0,xx-14,yy-30,2,2,0,c_white,MenuSelectorAlpha);
	scrDrawOutlined(xx,yy,1,txt,c_white,c_black);
	scrDrawShadow(xx,yy,txt,c_white,c_black,1,0.7);
}