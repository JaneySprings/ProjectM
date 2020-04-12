//gravity
physics_VelocityV += physics_Gravity;

//hcollision
if (place_meeting(x+physics_VelocityH,y,oWall))
{
	while (!place_meeting(x+sign(physics_VelocityH),y,oWall))
		x = x + sign(physics_VelocityH);
	physics_VelocityH = 0;
}
x = x + physics_VelocityH;
//vcollision
if (place_meeting(x,y+physics_VelocityV,oWall))
{
	while (!place_meeting(x,y+sign(physics_VelocityV),oWall))
		y = y + sign(physics_VelocityV);
	physics_VelocityV = 0;
}
y = y + physics_VelocityV;
