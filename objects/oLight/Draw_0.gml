var lx = x;
var ly = y;
var rad = LightArea * 16;  
var tile_size = 16;    
var tilemap = layer_tilemap_get_id("TilesCasters");
var alwaystrace = global.raytrace;

if (TRACE_RAY) or (alwaystrace) {
	
	var startx = floor((lx-rad)/tile_size);
	var endx = floor((lx+rad)/tile_size);
	var starty = floor((ly-rad)/tile_size);
	var endy = floor((ly+rad)/tile_size);


	if( !surface_exists(surf) ) {
		surf = surface_create(room_width,room_height);
	}
	
	if( !surface_exists(ShadowMap) ) {
		ShadowMap = surface_create(2*rad,2*rad);
	}

	surface_set_target(surf);
	draw_clear_alpha(0,0);

	vertex_begin(VBuffer, VertexFormat);
	for(var yy=starty;yy<=endy;yy++) {
	    for(var xx=startx;xx<=endx;xx++) {
			
	        var tile = tilemap_get(tilemap,xx,yy);
			
	        if (tile == 1) {
	            // get corners
	            var px1 = xx * tile_size;    // top left
	            var py1 = yy * tile_size;
	            var px2 = px1+tile_size;    // bottom right
	            var py2 = py1+tile_size;


	            if ( !SignTest( px1,py1, px2,py1, lx,ly) ) {
					ProjectShadow(VBuffer,  px1,py1, px2,py1, lx,ly );
				}
				if ( !SignTest( px2,py1, px2,py2, lx,ly) ) {
					ProjectShadow(VBuffer,  px2,py1, px2,py2, lx,ly );
				}
				if ( !SignTest( px2,py2, px1,py2, lx,ly) ) {
					ProjectShadow(VBuffer,  px2,py2, px1,py2, lx,ly );
				}
				if ( !SignTest( px1,py2, px1,py1, lx,ly) ) {
					ProjectShadow(VBuffer,  px1,py2, px1,py1, lx,ly );                      
				}                    
	        }
			if (tile == 2) {
	            // get corners
	            var px1 = xx * tile_size;    // top left
	            var py1 = yy * tile_size;
	            var px2 = px1+tile_size/2;    // bottom right
	            var py2 = py1+tile_size/2;


	            if ( !SignTest( px1,py1, px2,py1, lx,ly) ) {
					ProjectShadow(VBuffer,  px1,py1, px2,py1, lx,ly );
				}
				if ( !SignTest( px2,py1, px2,py2, lx,ly) ) {
					ProjectShadow(VBuffer,  px2,py1, px2,py2, lx,ly );
				}
				if ( !SignTest( px2,py2, px1,py2, lx,ly) ) {
					ProjectShadow(VBuffer,  px2,py2, px1,py2, lx,ly );
				}
				if ( !SignTest( px1,py2, px1,py1, lx,ly) ) {
					ProjectShadow(VBuffer,  px1,py2, px1,py1, lx,ly );                      
				}                    
	        }
	    }
	}

	vertex_end(VBuffer);    
	vertex_submit(VBuffer,pr_trianglelist,-1);
	surface_reset_target();
	surface_set_target(ShadowMap);
	draw_surface_part(surf,lx-rad,ly-rad,2*rad,2*rad,0,0);
	surface_reset_target();
	
	TRACE_RAY = false;
}
if (surface_exists(ShadowMap)) {
	gpu_set_blendmode(bm_add);
	shader_set(glsl_light);
	shader_set_uniform_f( LightPosRadius, lx,ly,rad,0.0 );
	draw_surface_ext(ShadowMap,x-rad,y-rad,1,1,0,image_blend,Alpha);
	shader_reset();
	gpu_set_blendmode(bm_normal);
} else TRACE_RAY = true;