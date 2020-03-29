if (!isGrounded) {
	scrPhysics();
	if (place_meeting(x+sign(hsp),y,oWall)) hsp = -hsp;
	if (place_meeting(x,y+1,oWall)) { isGrounded = true; ydr = y; }
} else y += sin(get_timer()/500000*4);
