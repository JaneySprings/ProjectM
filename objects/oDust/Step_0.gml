scrPhysics();

image_angle += 5*hsp;

if (place_meeting(x,y+1,oWall)) { 
	hsp = 0;
	image_speed = 1;
}
if (place_meeting(x+sign(hsp),y,oWall)) hsp = -hsp;