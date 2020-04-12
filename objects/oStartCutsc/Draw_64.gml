	var _w = const_ScreenWidth_native;
	var _h = const_ScreenHeight_native;
	
	draw_sprite_ext(Pixel,0,0,ypos,_w,128,0,c_black,1);
	draw_sprite_ext(Pixel,0,0,_h-ypos,_w,-128,0,c_black,1);


if (ShowStartCutsc) {
	draw_sprite_ext(Pixel,0,0,0,_w,_h,0,c_black,alpha);
	scrDrawSettings(fMenu,c_white,fa_center,fa_center,text_a - (1 - alpha));
	draw_text(_w/2,_h/2 - 64,scrGetString(global.langtype,"cutscenes","cts_02"));
	draw_set_alpha(text_a - 0.3 - (1 - alpha));
	draw_text(_w/2,_h/2+64,scrGetString(global.langtype,"cutscenes","cts_03"));
	draw_set_font(fText);
	draw_set_alpha(1);
}
