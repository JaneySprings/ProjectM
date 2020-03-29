switch(CurrentFrameMode) {
	case 1:
		draw_set_alpha(ImageAlpha);
		draw_sprite(TrademarkLogo,0,room_width/2,room_height/2);
		draw_set_alpha(1);
	break;
	case 2:
		draw_set_alpha(ImageAlpha);
		draw_sprite(TrademarkLogo,1,room_width/2,room_height/2);
		draw_set_alpha(1);
	break;
}