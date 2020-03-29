var halfw = w * 0.5;

//draw messege
draw_set_colour(c_black);
draw_set_alpha(a-0.3);
draw_rectangle(x-halfw-border,y-h-(border*2),x+halfw+border,y,false);
draw_sprite(Marker,0,x,y);
draw_set_alpha(a);
//draw text
scrDrawSettings(fText,c_white,fa_center,fa_top,a-0.1);
draw_text(x,y-h-border,print);
draw_set_alpha(1);