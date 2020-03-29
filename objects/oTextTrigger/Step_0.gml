var KeyUp = global.keyUpP;

if (instance_exists(oPlayer)) {
	DistanceToPlayer = distance_to_object(oPlayer);
	EyedirectionPlayer = (image_xscale == -oPlayer.image_xscale);
	
	if (oPlayer.x < x)
		image_xscale = -1;
	if (oPlayer.x > x)
		image_xscale = 1;
}

if (DistanceToPlayer < 48) and KeyUp and
	(EyedirectionPlayer) and (!instance_exists(oTextCutsc))
	with (instance_create_layer(CreateAbove.x,CreateAbove.y-24,"TextLayer",oTextCutsc)) {
		oFirst = other.CreateAbove;
		
		if (other.key[0] != "") str[0] = scrGetString(global.langtype,"note",other.key[0])
		if (other.key[1] != "") str[1] = scrGetString(global.langtype,"note",other.key[1])
		if (other.key[2] != "") str[2] = scrGetString(global.langtype,"note",other.key[2])
	}
	