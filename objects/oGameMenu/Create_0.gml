GUI_W = 				const_ScreenWidth_native;
GUI_H = 				const_ScreenHeight_native;

col =					make_color_hsv(0,0,64*4);
blur_range =			55;

surf_factor =			noone;
surf_pre_blur=			noone;
surf_post_blur= 		noone;
surf_post_blur_final =	noone;

uni_blur_range_h =		shader_get_uniform(glsl_gaussian_blur_horizontal, "blur_range");
uni_blur_range_v =		shader_get_uniform(glsl_gaussian_blur_vertical, "blur_range");

sample_factor_h =		shader_get_sampler_index(glsl_gaussian_blur_horizontal,"surface_factor")
sample_factor_v =		shader_get_sampler_index(glsl_gaussian_blur_vertical,"surface_factor")

//all
Location =				global.ScriptIndex;
MapSprite = 			global.MapSprite;
MapS =					9;
MapX =					GUI_W/2-(oPlayer.x/16)*MapS;
MapY =					GUI_H/2-(oPlayer.y/16)*MapS;
MapIconAlpha =			0.7;
MapIconChange = 		false;

with (oPlayer) {
	function_DisableUserInput = true;
	function_SetPlayerUiInvisible = true;
} with (oPostFX) DisableFog2d = true;