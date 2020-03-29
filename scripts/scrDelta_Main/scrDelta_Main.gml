/// @function scrDelta_Main( draw_overlay )
/// @param draw_over
var draw_over = argument0;
var half_delta = Delta/2;

if (keyboard_check_pressed(vk_numpad7)) Delta -= half_delta;
if (keyboard_check_pressed(vk_numpad8)) Delta += half_delta;

if (keyboard_check_pressed(vk_numpad0)) {
	if (d_var_current < d_var_count) d_var_current++;
	else d_var_current = 1;
}

if (keyboard_check_pressed(vk_numpad4)) d_var[d_var_current-1] -= Delta;
if (keyboard_check_pressed(vk_numpad5)) d_var[d_var_current-1] += Delta;

if (draw_over) {
	scrDrawSettings(fMessages, c_fuchsia , fa_left , fa_center, 1);
	draw_text(16,32,"7 - 8 incres delta count , 4 - 5 set var count, 0 select var[]  Incr: " + string(Delta));
	for (var i = 0; i < d_var_count; i++;) {
		if (d_var_current-1 == i) draw_set_color(c_green);
		else draw_set_color(c_fuchsia);
		draw_text(16,86 + 24 * i,string(d_var[i]));
	}
}