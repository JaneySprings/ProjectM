//Resize app surface
if (surface_exists(surf_app_resize)) {
	surface_set_target ( surf_app_resize );
	draw_surface_stretched(application_surface, 0, 0, w , h);
	surface_reset_target ( );

	//Create bloom surface
	shader_set ( glsl_threshold );
	shader_set_uniform_f ( uthresh, 0.9 ); // Sampling
	if (surface_exists(surf_bloom)) {
		surface_set_target ( surf_bloom );
		draw_surface_stretched(application_surface, 0, 0, w , h);
		surface_reset_target ( );
	}
	
	//Create horizontal blur surface
	shader_set ( glsl_gaussian_blur );
	shader_set_uniform_f ( uscale, 0.045 , 0.0 ); //x 
	if (surface_exists(surf_blur_pass) and (surface_exists(surf_bloom))) {
		surface_set_target ( surf_blur_pass );
		draw_surface_stretched(surf_bloom, 0, 0, w, h);
		surface_reset_target ( );
	}
	
	//Create vetrical blur surface
	if (surface_exists(surf_blur_pass) and (surface_exists(surf_bloom))) {
		surface_set_target ( surf_bloom );
		shader_set_uniform_f ( uscale, 0.0, 0.08); //y (16/9 * x)
		draw_surface_stretched(surf_blur_pass, 0, 0, w, h);
		surface_reset_target ( );
		shader_reset ( );
	}
	
	//Draw all surfaces
	draw_surface_stretched(surf_app_resize, Xpos, Ypos, ScreenW , ScreenH);
	gpu_set_blendmode ( bm_add );
	if (surface_exists(surf_bloom))
		draw_surface_stretched(surf_bloom, Xpos, Ypos, ScreenW, ScreenH);
	gpu_set_blendmode ( bm_normal );
} else {
	if (instance_exists(oLight)) oLight.TRACE_RAY = true;
	event_perform(ev_create,0);
}