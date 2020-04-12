if (global.InputKeycodeDOWN) and (global.InputKeycodeSPACE_pressed) and (place_meeting(x,y-1,oPlayer)) Peel = true;

if (instance_exists(oPlayer)) {
	if ((oPlayer.y + 14) < y) {
		if (!instance_exists(ThisWall)) ThisWall = instance_create_layer(x,y,"WallsLayer",oWall);
		with (ThisWall) image_xscale = other.image_xscale;
		if (Peel) instance_destroy(ThisWall);
	} else {
		if (instance_exists(ThisWall)) instance_destroy(ThisWall);
		Peel = false;
	}
}
