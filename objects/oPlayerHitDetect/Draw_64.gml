if (!SetGameOver) draw_sprite_ext(Vingette,0,0,0,4,4,0,c_white,alpha);
else if (DrawGameOver) {
	scrDrawSettings(fMenu,$2B1E89,fa_center,fa_center,alpha);
	
	draw_sprite_ext(Pixel,0,0,0,const_ScreenWidth_native,const_ScreenHeight_native,0,c_black,alpha-0.1);
	draw_sprite_ext(TriangleParticle,0,const_ScreenWidth_native/2,const_ScreenHeight_native/2-206,1,1,0,c_white,alpha);
	draw_sprite_ext(TriangleParticle,0,const_ScreenWidth_native/2,const_ScreenHeight_native/2-156,1,-1,0,c_white,alpha);
	draw_text(const_ScreenWidth_native/2,const_ScreenHeight_native/2,scrGetString(global.langtype,"cutscenes","cts_01"));
}