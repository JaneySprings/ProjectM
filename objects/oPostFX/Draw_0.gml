shader_set(glsl_2dfog);
shader_set_uniform_f(u_color, 0.3, 0.3, 0.45);
shader_set_uniform_i(u_octaves, 4);
shader_set_uniform_f(u_time, current_time * 0.002);

if (!DisableFog2d) draw_sprite_tiled_ext(fxNoice,0,-oCamera.x*1.002,-oCamera.y*1.001,10,10,c_white,1);
shader_reset();

if (i == 60) {
	part_emitter_region(ShardSystem, ShardEmitter, oCamera.x-300, oCamera.x+300, oCamera.y-150, oCamera.y+150, ps_shape_rectangle, ps_distr_linear);
	part_emitter_burst(ShardSystem,ShardEmitter,ShardParticle,1);
	i = 0;
} i++;