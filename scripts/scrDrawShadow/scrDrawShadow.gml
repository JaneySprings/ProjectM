/// @description scrDrawShadow(x, y, string, colour, shadow_colour, text_alpha, shadow_alpha)
/// @param x
/// @param y
/// @param string
/// @param colour
/// @param shadow_colour
/// @param text_alpha
/// @param shadow_alpha
var xx = argument0;
var yy = argument1;
var str = argument2;

//Draw shadow
draw_set_colour(argument4);
draw_set_alpha(argument6);
draw_text(xx, yy+2, str);

//Draw Text
draw_set_colour(argument3);
draw_set_alpha(argument5);
draw_text(xx, yy, str);
draw_set_colour(c_white);

draw_set_alpha(1);