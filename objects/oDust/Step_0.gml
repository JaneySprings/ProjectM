scrPhysics();

image_angle += 5*physics_VelocityH;

if (place_meeting(x,y+1,oWall)) { 
	physics_VelocityH = 0;
	image_speed = 1;
}
if (place_meeting(x+sign(physics_VelocityH),y,oWall)) physics_VelocityH = -physics_VelocityH;