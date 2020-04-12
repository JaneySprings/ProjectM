//set tick ancounter
	tick++;
	
	if (ShowStartCutsc) {
		//Show main dream text
		if (text_a < 1)
			text_a += 0.002;
		//Fadeout black screen
		if (tick > -120) 
			if (alpha > 0) 
				alpha -= 0.01;
		//Reset tick to skip pozition
	} else if (tick < 760) tick = 760;
		
	if (ShowStartCutsc) and (alpha <= 0) and (oCamera.y < oPlayer.y) and (tick > 150) oCamera.y+=0.5; 
	if (tick > 1) and (tick <= 1020) with (oPlayer) sprite_index = DefauiltPlayerLay;
	if (tick > 1020) and (tick < 1200) with (oPlayer) sprite_index = DefauiltPlayerLayopen;
	if (tick >= 1200) and (!ShowStartCutsc) {
		if (ypos >= -128) ypos -=6;
		else tick = 1340;
	}
	if (tick == 1320) 
		if (ShowStartCutsc) 
			with (instance_create_layer(oPlayer.x,oPlayer.y-24,"TextLayer",oTextCutsc)) {		
				switch (global.Timeline) {
					case 0: 
						str[0] = scrGetString(global.langtype,"dialogs","text_001");
						str[1] = scrGetString(global.langtype,"dialogs","text_002");
						global.Timeline += 0.1;
					break;
					case 0.1:
						str[0] = scrGetString(global.langtype,"dialogs","text_003");
						str[1] = scrGetString(global.langtype,"dialogs","text_004");
					break;
					
				}
				oFirst = oPlayer;
			}
	if (tick == 1340) instance_destroy();