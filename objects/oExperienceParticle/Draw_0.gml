if (PartAngle < 180) or (PartAngle > -180) PartAngle += SpinIncr;
else PartAngle = 0;

gpu_set_blendmode(bm_add);
draw_sprite_ext(FxParticles,0,x,y,1,1,PartAngle,image_blend,0.7);
gpu_set_blendmode(bm_normal);
draw_self();