w = const_ScreenWidth_render;
h = const_ScreenHeight_render;
i = 0;

surf_blur_pass = surface_create (w,h);
surf_bloom = surface_create (w,h);
surf_app_resize = surface_create (w,h);

Xpos = 0;
Ypos = 0;
DisableFog2d = false;

ScreenW = window_get_width();
ScreenH = window_get_height();

// Aspect Ratio 
var k = floor(window_get_width() / window_get_height());

if (k < (16/9)) {
	ScreenH = (ScreenW * 9)/16;
	Ypos = (window_get_height() - ScreenH)/2;
}
if (k > (16/9)) {
	ScreenW = (ScreenH * 16)/9;
	Xpos = (window_get_width() - ScreenW)/2;
}

uscale = shader_get_uniform ( glsl_gaussian_blur, "u_Scale" );
uthresh = shader_get_uniform ( glsl_threshold, "u_Threshold" );

u_color = shader_get_uniform(glsl_2dfog, "color");
u_octaves = shader_get_uniform(glsl_2dfog, "OCTAVES");
u_time = shader_get_uniform(glsl_2dfog, "TIME");


ShardSystem = part_system_create();
ShardParticle = part_type_create();
ShardEmitter = part_emitter_create(ShardSystem);	

scrPartTypeMain(ShardParticle,pt_shape_disk,0.25,0.25,0.0001,-75,1200,1300,true);
scrPartAlpha(ShardParticle,0,0.05,0)
part_type_size(ShardParticle,0.05,0.2,0.001,0);

application_surface_draw_enable ( false );