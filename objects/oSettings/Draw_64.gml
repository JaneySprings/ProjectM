scrDrawSettings(fMenu,c_black,fa_left,fa_bottom,1);
draw_sprite_ext(Pixel,0,0,228,1920,4,0,c_white,0.3);
draw_sprite_ext(Pixel,0,0,832,1920,4,0,c_white,0.3);

for (var i = 0; i < MenuItemsCount; i++)
{
	var txt = MenuNamesArray[i];
	var xx = MenuPositionX;
	var yy = MenuPositionY - (MenuItemHeight * (i *2));
	if (i == MenuCurrentPosition)
		draw_sprite_ext(Selector,0,xx-14,yy-30,2,2,0,c_white,alpha);
	draw_set_halign(fa_left);	
	scrDrawOutlined(xx,yy,1,txt,c_white,c_black);
	scrDrawShadow(xx,yy,txt,c_white,c_black,1,0.7);
	draw_set_halign(fa_center);
	if (i == 4)
	{
		if (!global.fullscreenMode) { scrDrawOutlined(1520,yy,1,"< " + string(window_get_width()) + " x " + string(window_get_height()) + " >",c_white,c_black)
			scrDrawShadow(1520,yy,"< " + string(window_get_width()) + " x " + string(window_get_height()) + " >",c_white,c_black,1,0.7); }
		else {
			draw_set_color(c_dkgray);
			draw_text(1520,yy,"< " + string(window_get_width()) + " x " + string(window_get_height()) + " >");
		}
	} 
	if (i == 3) {
		if (global.fullscreenMode) {  
			scrDrawOutlined(1520,yy,1,On,c_white,c_black);
			scrDrawShadow(1520,yy,On,c_white,c_black,1,0.7); 
		}
		else { 
			scrDrawOutlined(1520,yy,1,Off,c_white,c_black);
			scrDrawShadow(1520,yy,Off,c_white,c_black,1,0.7);
		}
	}
	if (i == 2) {
		if (global.raytrace) {  
			scrDrawOutlined(1520,yy,1,On,c_white,c_black);
			scrDrawShadow(1520,yy,On,c_white,c_black,1,0.7); 
		}
		else { 
			scrDrawOutlined(1520,yy,1,Off,c_white,c_black);
			scrDrawShadow(1520,yy,Off,c_white,c_black,1,0.7);
		}
	}
	if (i == 1) {
		draw_sprite_ext(Pixel,0,1260,yy-8,520,-36,0,c_black,0.8);
		draw_sprite_ext(Pixel,0,1264,yy-12,512,-28,0,c_white,0.2);
		draw_sprite_ext(Pixel,0,1264,yy-12,CurVolume*512,-28,0,c_white,0.7);
	}
	if (i == 0) {
		scrDrawOutlined(1520,yy,1,langFullName[CurLangIndex],c_white,c_black);
		scrDrawShadow(1520,yy,langFullName[CurLangIndex],c_white,c_black,1,0.7);
	}
}