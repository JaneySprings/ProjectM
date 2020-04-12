scrPhysics();
var KeyUp = global.InputKeycodeUP_pressed;

//animation
if (instance_exists(oPlayer))
{
	DistanceToPlayer = distance_to_object(oPlayer);
	EyedirectionPlayer = (image_xscale == -oPlayer.image_xscale);
	
	if (DistanceToPlayer > 420) {
		with (instance_create_layer(x,y,"NpcLayer",oAwake)) AwakeId = other.id;
		instance_deactivate_object(id);
	}
	
	if (oPlayer.x < x)
		image_xscale = -1;
	if (oPlayer.x > x)
		image_xscale = 1;
	
	if (DistanceToPlayer < 48) and KeyUp and
		(EyedirectionPlayer) and (!instance_exists(oTextCutsc))
			StartDialog = true;
		
	if (DistanceToPlayer < 96) with(oCamera) follow = other.id;
	else with(oCamera) follow = oPlayer;
}
//module start
if (StartDialog) and (!instance_exists(id_cur))
{
	id_cur = instance_create_layer(x,y-24,"TextLayer",oTextCutsc);
	with (id_cur) {
		oFirst = other.id;
		oSecond = oPlayer;
		
		switch (global.Timeline) {
			case 0.1:
			VoiceFirst = sVoice1;
			str[0] = scrGetString(global.langtype,"dialogs","text_005");
			str[1] = scrGetString(global.langtype,"dialogs","text_006");
			str[2] = scrGetString(global.langtype,"dialogs","text_007");
			str[3] = scrGetString(global.langtype,"dialogs","text_008");
			str[4] = scrGetString(global.langtype,"dialogs","text_009");
			str[5] = scrGetString(global.langtype,"dialogs","text_010");
			break;
		}
	}
}
if (instance_exists(id_cur)) {
	if (id_cur.quit) StartDialog = false;
	if (id_cur.det == "1") sprite_index = SpriteTalk;
	else sprite_index = SpriteIdle;
} else sprite_index = SpriteIdle;
