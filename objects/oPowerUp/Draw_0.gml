draw_self();
scrDrawSettings(fText,c_white,fa_center,fa_center,1);

if instance_exists(oPlayer) {
	// Local define
    var _keyUp = global.keyUpP;
    var _distanceToPlayer = distance_to_object(oPlayer);
    
	// Distance check
	if (_distanceToPlayer < 24)
		if (StatisticMenuAlpha <= 1)
			StatisticMenuAlpha += 0.05;
	if (StatisticMenuAlpha >= 0) and (_distanceToPlayer > 24)
		StatisticMenuAlpha -= 0.05;
	if (_distanceToPlayer > 1024) instance_destroy();
			
	draw_set_alpha(StatisticMenuAlpha-0.3);
	draw_set_color(c_black);
	draw_rectangle(x-48,ydr-64,x+48,ydr-10,false);
	draw_rectangle_color(x-25,ydr-64,x+48,ydr-41,GradientColor,c_black,c_black,GradientColor,false);
	draw_set_alpha(StatisticMenuAlpha);
	draw_set_color(c_white);
	
	draw_sprite(AbilityIcon,image_index-1,x-37,ydr-53);
	draw_sprite(AbilitySlot,image_index,x-37,ydr-53);
    
    switch(image_index) {
        case 0: draw_text(x+12,ydr-53,"Hp Pack"); break;
    }
    
    draw_set_halign(fa_left);
    draw_set_color(c_maroon);
	draw_text(x-45,ydr-30,"Damage:");
	draw_set_halign(fa_right);
	draw_text(x+45,ydr-30,"+ " + string(UpIncreeceCount));
	
	draw_set_halign(fa_left);
    draw_set_color($CD8000);
	draw_text(x-45,ydr-18,"Force:");
	draw_set_halign(fa_right);
	draw_text(x+45,ydr-18,"+ " + string(DownIncreeceCount));
	
	draw_sprite(KeyButton,4,x,ydr-4);
	
	if (_keyUp) and (_distanceToPlayer < 24) {
	    switch(image_index) {
	        case 0: oPlayer.CurrentHp += UpIncreeceCount; break;
	    } instance_destroy();
	}
} draw_set_alpha(1);