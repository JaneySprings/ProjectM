FireSystem = part_system_create_layer("SpecialLayer",false);
FireParticle = part_type_create();
FlickParticle = part_type_create();
FireEmitter = part_emitter_create(FireSystem);	

scrPartTypeMain(FireParticle,noone,0,0,0.03,90,35,40,true);
scrPartSprite(FireParticle,SimpleParticle,0,1,1,0);
scrPartColor(FireParticle,c_orange);
scrPartAlpha(FireParticle,1,0);

scrPartTypeMain(FlickParticle,noone,0,0,0.03,90,50,65,true);
scrPartSprite(FlickParticle,Pixel,0,1,1,0);
scrPartColor(FlickParticle,c_orange);
scrPartAlpha(FlickParticle,1,0);


part_emitter_region(FireSystem, FireEmitter, x-4, x+4, y+8, y+8, ps_shape_ellipse, ps_distr_gaussian);
part_emitter_stream(FireSystem,FireEmitter,FireParticle,1);


LightId = instance_create_layer(x,y,"LightmapLayer",oLight)
Flash = 0.5;
FlashMax = 0.7;

with (LightId) {
	sprite_index = Pixel;
	image_blend = $FF0564FF;
	LightArea = 7;
}