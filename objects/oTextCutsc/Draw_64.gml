var _w = ScreenWidth;
var _h = ScreenHeight;

scrDrawSettings(fMessages,c_white,fa_right,fa_center,1);

draw_sprite_ext(Pixel,0,0,ypos,_w,128,0,c_black,1);
draw_sprite_ext(Pixel,0,0,_h-ypos,_w,-128,0,c_black,1);

draw_sprite_ext(KeyButton,2,_w*4/5,_h-ypos-80,3,3,0,c_white,1);
draw_text(_w*4/5-60,_h-ypos-80,scrGetString(global.langtype,"keys","key_skip"));
draw_set_font(fText);