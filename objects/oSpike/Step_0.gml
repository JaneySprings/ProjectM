if (place_meeting(x,y,oPlayer)) and (image_index == 0) 
	if (!oPlayer.function_SetPlayerInvisible) image_speed = 1;

if (place_meeting(x,y,oEnemy)) and (image_index == 0) 
	if (!oEnemy.function_SetPlayerInvisible) image_speed = 1;
	
if (image_index > image_number - 1) image_speed = 0;