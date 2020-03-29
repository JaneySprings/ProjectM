if (surface_exists(surf_post_blur_final)) draw_surface(surf_post_blur_final,0,0);
else {
	surf_factor	= surface_create(GUI_W,GUI_H);
	surf_pre_blur = surface_create(GUI_W,GUI_H);
	surf_post_blur = surface_create(GUI_W,GUI_H);
	surf_post_blur_final = surface_create(GUI_W,GUI_H);
	
	surface_set_target(surf_pre_blur);
	draw_clear_alpha(0,0);
	draw_surface(application_surface,0,0);
	surface_reset_target();

	surface_set_target(surf_factor);
	draw_clear_alpha(0,0);
	gpu_set_blendmode(bm_add);
	draw_rectangle_colour(0,0,GUI_W,GUI_H,col,col,col,col,0);
	gpu_set_blendmode(bm_normal);
	surface_reset_target();

	surface_set_target(surf_post_blur);
	draw_clear_alpha(0,0);
	shader_set(glsl_gaussian_blur_vertical);
	texture_set_stage(sample_factor_v, surface_get_texture(surf_factor));
	shader_set_uniform_f(uni_blur_range_v,blur_range);
	draw_surface(surf_pre_blur,0,0);
	shader_reset();
	surface_reset_target();

	surface_set_target(surf_post_blur_final);
	shader_set(glsl_gaussian_blur_horizontal);
	texture_set_stage(sample_factor_h, surface_get_texture(surf_factor));
	shader_set_uniform_f(uni_blur_range_h,blur_range);
	draw_surface(surf_post_blur,0,0);
	shader_reset();
	surface_reset_target();
	surface_free(surf_factor);
	surface_free(surf_pre_blur);
	surface_free(surf_post_blur);
}

//main fon
draw_sprite_ext(Pixel,0,0,0,GUI_W,GUI_H,0,c_black,0.7);

draw_sprite_ext(MapSprite,0,MapX,MapY,MapS,MapS,0,c_white,1);

//Draw all pointers
var _X = oPlayer.x/16;
var _Y = oPlayer.y/16;
draw_sprite_ext(MapIcon,0,MapX+_X*MapS,MapY+_Y*MapS,4,4,0,c_white,MapIconAlpha);

if instance_exists(oGeorge) {
	var _npc0_X = oGeorge.x/16;
	var _npc0_Y = oGeorge.y/16;
	draw_sprite_ext(MapIcon,1,MapX+_npc0_X*MapS,MapY+_npc0_Y*MapS,4,4,0,c_aqua,1.5-MapIconAlpha);
}


draw_sprite_ext(GradientH64,0,513,100,-2,2,0,c_gray,1);
draw_sprite_ext(GradientH64,0,GUI_W-511,100,2,2,0,c_gray,1);
draw_line_width_color(512,100,GUI_W-512,100,2,c_gray,c_gray);

//Name and keys
scrDrawSettings(fMessages,c_white,fa_center,fa_center,1);

switch(Location) {
	case -1: draw_text(GUI_W/2,64,scrGetString(global.langtype,"location_name","location_01")); break;
	case 1: draw_text(GUI_W/2,64,scrGetString(global.langtype,"location_name","location_02")); break;
}
//Legend
draw_set_halign(fa_left);
scrDrawShadow(68,GUI_H-96,scrGetString(global.langtype,"keys","leg_player"),c_white,c_black,1,0.7);
draw_sprite_ext(MapIcon,0,36,GUI_H-96,3,3,0,c_white,1);

scrDrawShadow(68,GUI_H-38,scrGetString(global.langtype,"keys","leg_npc"),c_white,c_black,1,0.7);
draw_sprite_ext(MapIcon,1,36,GUI_H-38,3,3,0,c_aqua,1);

//Buttons
draw_set_halign(fa_right);
scrDrawShadow(GUI_W-78,GUI_H-38,scrGetString(global.langtype,"keys","key_close_map"),c_white,c_black,1,0.7);
draw_sprite_ext(KeyButton,1,GUI_W-36,GUI_H-38,3,3,0,c_white,1);

scrDrawShadow(GUI_W-78,GUI_H-96,scrGetString(global.langtype,"keys","key_quit"),c_white,c_black,1,0.7);
draw_sprite_ext(KeyButton,0,GUI_W-36,GUI_H-96,3,3,0,c_white,1);