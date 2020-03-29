for (var i = 0; i < RepeatCount; i++) 
	draw_sprite_ext(Mace,1,AnchorX+8*i*dcos(Angle),AnchorY-8*i*dsin(Angle),1,1,Angle+90,c_white,1);

draw_sprite(Mace,2,AnchorX,AnchorY);
draw_self();