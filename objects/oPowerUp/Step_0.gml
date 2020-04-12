if (!isGrounded) {
	scrPhysics();
	if (place_meeting(x+sign(physics_VelocityH),y,oWall)) physics_VelocityH = -physics_VelocityH;
	if (place_meeting(x,y+1,oWall)) { isGrounded = true; ydr = y; }
} else y += sin(get_timer()/500000*4);
