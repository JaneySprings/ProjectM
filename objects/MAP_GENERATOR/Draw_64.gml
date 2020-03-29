scrDrawSettings(fMessages,c_white,fa_center,fa_center,Alpha_2-(1-Alpha_1));
draw_sprite_ext(Pixel,0,0,0,ScreenWidth,ScreenHeight,0,c_black,Alpha_1);

scrDrawShadow(ScreenWidth-192,ScreenHeight-192,DebugMessage,c_white,c_black,Alpha_2-(1-Alpha_1),Alpha_2-(1-Alpha_1)-0.3);
draw_set_halign(fa_left);

part_system_drawit(LoadSystem);
scrLoadPartPattern();