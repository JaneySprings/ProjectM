/// @description draw_text_outlined(x, y, offset, string, colour, outline_colour)
/// @param x
/// @param y
/// @param offset
/// @param string
/// @param colour
/// @param outline_colour

var xx = argument0;
var yy = argument1;
var offset = argument2
var str = argument3;

draw_set_colour(argument5);
draw_text(xx-offset, yy, str);
draw_text(xx+offset, yy, str);
draw_text(xx, yy-offset, str);
draw_text(xx, yy+offset, str);
draw_set_colour(argument4);
draw_text(xx, yy, str);