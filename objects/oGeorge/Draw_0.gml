draw_self();

var buttonY = sin(get_timer()/250000)*2;

if instance_exists(oPlayer) {	
	if (DistanceToPlayer < 48) and (EyedirectionPlayer)
		if (alpha <= 1)
			alpha += 0.05;
	
	if ((!EyedirectionPlayer) or (DistanceToPlayer > 48)) and (alpha >= 0)
		alpha -= 0.05;
			
	draw_set_alpha(alpha);
	
	if (!instance_exists(oTextCutsc)) 
		draw_sprite(KeyButton,4,x,y-32+buttonY);
}
draw_set_alpha(1);