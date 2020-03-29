draw_self();
scrDrawSettings(fText,c_white,fa_center,fa_center,1);

var CenterHeight = sprite_height/2 + 8;

if (defence > 1) {
	draw_sprite(SubAbilityIcon,0,x - 16,y - CenterHeight - 10);
	scrDrawShadow(x + 2 ,y - CenterHeight - 10,string(defence),c_ltgray , c_black,1,0.6);
}

if (CurrentHp > 0) {
	draw_sprite_part_ext(LiveBar,3,0,0,2,6,x-12,y - CenterHeight,1,1,c_white,0.6);
	draw_sprite_part_ext(LiveBar,3,2,0,1,6,x-10,y - CenterHeight,20,1,c_white,0.6);
	draw_sprite_part_ext(LiveBar,3,3,0,2,6,x+10,y - CenterHeight,1,1,c_white,0.6);

	draw_sprite_part_ext(StatusLine,0,2,4,1,4,x-10,y - CenterHeight + 2, HpCell*CurrentHp/2 ,0.5,c_white,0.8);
}
