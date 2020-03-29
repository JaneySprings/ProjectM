if (CreateMapSurface) {
	var wall_col = c_gray;
	var walls_col = $662819;
	var main_col = $A5422A
	
	var map_w = GeneratedRoomWidth / 16;
	var map_h = GeneratedRoomHeight / 16;
	var map_surf = surface_create(map_w,map_h);
	if (surface_exists(map_surf)) {
	
		surface_set_target(map_surf);
		draw_clear_alpha(c_white,0);

		for (var i = 0; i < map_h; i++)
			for (var j = 0; j < map_w; j++) {
				y = 16*i; 
				x = 16*j;
				if (tilemap_get(MainTileLayer_id, j, i) != 0)
					draw_sprite_ext(Pixel,0,j,i,1,1,0,main_col,1);
				if (place_meeting(x,y,oWall)) draw_sprite_ext(Pixel,0,j,i,1,1,0,wall_col,1);
				if (place_meeting(x,y,oWallThrough)) draw_sprite_ext(Pixel,0,j,i,1,1,0,walls_col,1);
			}
		
		if (sprite_exists(global.MapSprite)) sprite_delete(global.MapSprite);
		global.MapSprite = sprite_create_from_surface(map_surf,0,0,map_w,map_h,false,false,0,0);
		surface_reset_target();
		surface_free(map_surf);
	} CreateMapSurface = false;
}