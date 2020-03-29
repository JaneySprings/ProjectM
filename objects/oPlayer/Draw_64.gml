if (CurrentHp < 35) draw_sprite_ext(Vingette,0,0,0,4,4,0,c_white,15/CurrentHp);
if (!HideUI) {
	#region Global init
	scrDrawSettings(fMessages,c_black,fa_right,fa_center,1);
	//define
	var ConstScreenW = ScreenWidth;
	var ConstScreenH = ScreenHeight-8;
	
	var GlobalPlayerHp = floor(global.PlayerHp);
	var GlobalPlayerSt = floor(global.PlayerForce);
	var GlobalPlayerExp = global.PlayerExperience;
	var GlobalPlayerExpCount = global.PlayerExperienceCount;
	var GlobalMapSprite = global.MapSprite;
	
	var GlobalDoubleJumpRed = floor(global.DoubleJumpReduse);
	var GlobalFlyGroundAttackRed = global.FlyGroundAttackReduse;
	var GlobalHoriDashRed = global.DashReduse;
	var GlobalPartShieldRed = global.PartShieldReduse;
	
	var GlobalFlyGroundAttackDamage = global.FlyGroundAttackDamage;
	var GlobalHoriDashDamage = global.DashDamage;
	var GlobalDoubleJumpDamage = global.DoubleJumpDamage;
	var GlobalPartShieldDamage = global.PartShieldDamage;
	
	var arrowY = sin(get_timer()/250000)*6;
	var ConstCell = 10;
	
	var DeltaHp = CurrentHp / GlobalPlayerHp;
	var DeltaSt = CurrentForce / GlobalPlayerSt;
	
	var ResizePlayerHp = (200+GlobalPlayerHp/ConstCell)*DeltaHp;
	var ResizePlayerSt = (60+GlobalPlayerSt/ConstCell)*DeltaSt;
	var ResizePlayerAnimHp = 200+AnimHp/ConstCell;
	var ResizePlayerAnimSt = 60+AnimForce/ConstCell;
	
	#endregion
	#region Abilites
		//D1 HoriDash
	draw_sprite_ext(AbilitySlot,0,462,ConstScreenH-148,4,4,0,c_white,0.6);
	draw_sprite_ext(AbilitySlot,4,462,ConstScreenH-148,4,4,0,c_white,1);
	draw_sprite_ext(AbilityIcon,3,462,ConstScreenH-148,4,4,0,c_white,1);
	if (CurrentForce < GlobalHoriDashRed) draw_sprite_ext(Pixel,0,416,ConstScreenH-194,92,92,0,c_black,0.7);
		//D2 djump
	draw_sprite_ext(AbilitySlot,0,338,ConstScreenH-148,4,4,0,c_white,0.6);
	draw_sprite_ext(AbilitySlot,3,338,ConstScreenH-148,4,4,0,c_white,1);
	draw_sprite_ext(AbilityIcon,2,338,ConstScreenH-148,4,4,0,c_white,1);
	if (CurrentForce < GlobalDoubleJumpRed) draw_sprite_ext(Pixel,0,292,ConstScreenH-194,92,92,0,c_black,0.7);
		//D3 FlyGroundAttack
	draw_sprite_ext(AbilitySlot,0,214,ConstScreenH-148,4,4,0,c_white,0.6);
	draw_sprite_ext(AbilitySlot,2,214,ConstScreenH-148,4,4,0,c_white,1);
	draw_sprite_ext(AbilityIcon,1,214,ConstScreenH-148,4,4,0,c_white,1);
	if (CurrentForce < GlobalFlyGroundAttackRed) draw_sprite_ext(Pixel,0,168,ConstScreenH-194,92,92,0,c_black,0.7);
		//D4 Shield
	draw_sprite_ext(AbilitySlot,0,90,ConstScreenH-148,4,4,0,c_white,0.6);
	draw_sprite_ext(AbilitySlot,1,90,ConstScreenH-148,4,4,0,c_white,1);
	draw_sprite_ext(AbilityIcon,0,90,ConstScreenH-148,4,4,0,c_white,1);
	if (CurrentForce < GlobalPartShieldRed) draw_sprite_ext(Pixel,0,44,ConstScreenH-194,92,92,0,c_black,0.7);
	
	//statistic
		//D1
	draw_sprite_ext(ArrowIcon,0,120,ConstScreenH-204+arrowY,2,2,0,c_white,1);
	scrDrawShadow(116,ConstScreenH-202+arrowY,string(GlobalPartShieldDamage),$0F0B9E,c_black,1,0.7);	
	
	draw_sprite_ext(ArrowIcon,1,120,ConstScreenH-88-arrowY,2,2,0,c_white,1);
	scrDrawShadow(116,ConstScreenH-86-arrowY,string(GlobalPartShieldRed),$CD8000,c_black,1,0.7);
		//D2
	draw_sprite_ext(ArrowIcon,0,240,ConstScreenH-204+arrowY,2,2,0,c_white,1);
	scrDrawShadow(236,ConstScreenH-202+arrowY,string(GlobalFlyGroundAttackDamage),$0F0B9E,c_black,1,0.7);		
		
	draw_sprite_ext(ArrowIcon,1,240,ConstScreenH-88-arrowY,2,2,0,c_white,1);
	scrDrawShadow(236,ConstScreenH-86-arrowY,string(GlobalFlyGroundAttackRed),$CD8000,c_black,1,0.7);
		//D3
	draw_sprite_ext(ArrowIcon,0,360,ConstScreenH-204+arrowY,2,2,0,c_white,1);
	scrDrawShadow(356,ConstScreenH-202+arrowY,string(GlobalDoubleJumpDamage),$0F0B9E,c_black,1,0.7);	
		
	draw_sprite_ext(ArrowIcon,1,360,ConstScreenH-88-arrowY,2,2,0,c_white,1);
	scrDrawShadow(356,ConstScreenH-86-arrowY,string(GlobalDoubleJumpRed),$CD8000,c_black,1,0.7);
		//D4
	draw_sprite_ext(ArrowIcon,0,480,ConstScreenH-204+arrowY,2,2,0,c_white,1);
	scrDrawShadow(476,ConstScreenH-202+arrowY,string(GlobalHoriDashDamage),$0F0B9E,c_black,1,0.7);
	
	draw_sprite_ext(ArrowIcon,1,480,ConstScreenH-88-arrowY,2,2,0,c_white,1);
	scrDrawShadow(476,ConstScreenH-86-arrowY,GlobalHoriDashRed,$CD8000,c_black,1,0.7);
	#endregion
	#region PlayerHP and ST
	//hp line
	draw_sprite_part_ext(LiveBar,0,0,0,6,28,176+GlobalPlayerSt*2/ConstCell,ConstScreenH-72,2,2,c_white,0.6);
	draw_sprite_part_ext(LiveBar,0,6,0,2,28,188+GlobalPlayerSt*2/ConstCell,ConstScreenH-72,200+GlobalPlayerHp/ConstCell,2,c_white,0.6);
	draw_sprite_part_ext(LiveBar,0,8,0,6,28,588+GlobalPlayerSt*2/ConstCell+GlobalPlayerHp*2/ConstCell,ConstScreenH-72,2,2,c_white,0.6);
	
	//stamina line
	draw_sprite_part_ext(LiveBar,1,0,0,6,28,32,ConstScreenH-72,2,2,c_white,0.6);
	draw_sprite_part_ext(LiveBar,1,6,0,2,28,44,ConstScreenH-72,60+GlobalPlayerSt/ConstCell,2,c_white,0.6);
	draw_sprite_part_ext(LiveBar,1,8,0,6,28,164+GlobalPlayerSt*2/ConstCell,ConstScreenH-72,2,2,c_white,0.6);
	
	//xp cur line
	draw_sprite_part_ext(LiveBar,2,0,0,6,20,32,ConstScreenH-40,2,2,c_white,0.6);
	draw_sprite_part_ext(LiveBar,2,6,0,2,20,44,ConstScreenH-40,256,2,c_white,0.6);
	draw_sprite_part_ext(LiveBar,2,8,0,6,20,556,ConstScreenH-40,2,2,c_white,0.6);
	
	//logic
	if (ResizePlayerAnimHp > ResizePlayerHp) AnimHp -= 2;
	if (ResizePlayerAnimSt > ResizePlayerSt) AnimForce -= 8;
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_color(c_white);
	//hp cur line
	draw_sprite_part_ext(StatusLine,0,1,0,1,20,188+GlobalPlayerSt*2/ConstCell,ConstScreenH-64,ResizePlayerAnimHp*2,2,c_white,1);
	draw_sprite_part_ext(StatusLine,0,2,0,1,20,188+GlobalPlayerSt*2/ConstCell,ConstScreenH-64,ResizePlayerHp*2,2,c_white,1);
	
	scrDrawShadow(388+GlobalPlayerSt*2/ConstCell+GlobalPlayerHp/ConstCell,ConstScreenH-46,string(floor(CurrentHp)) + " | " + string(GlobalPlayerHp),c_white,c_black,1,0.7);
	
	//stamina cur line
	draw_sprite_part_ext(StatusLine,0,1,0,1,20,44,ConstScreenH-64,ResizePlayerAnimSt*2,2,c_white,1);
	draw_sprite_part_ext(StatusLine,0,0,0,1,20,44,ConstScreenH-64,ResizePlayerSt*2,2,c_white,1);
	
	scrDrawShadow(104+GlobalPlayerSt/ConstCell,ConstScreenH-46,string(floor(CurrentForce)) + " | " + string(GlobalPlayerSt),c_white,c_black,1,0.7);
	
	//xp cur line
	draw_sprite_part_ext(StatusLine,0,3,0,1,10,44,ConstScreenH-24,GlobalPlayerExp*2,2,c_white,1);
	#endregion
	#region Other
	//map
	draw_sprite_ext(MapPlate,0,ConstScreenW-16,16,2,2,0,c_white,0.7);	
	if (sprite_exists(GlobalMapSprite)) draw_sprite_part_ext(GlobalMapSprite,0,floor(x/16)-38,floor(y/16)-24,76,48,1454,8,6,6,c_white,0.9);  //76*48 //scaled 228*144
	draw_sprite_ext(MapPlate,1,ConstScreenW-16,16,2,2,0,c_white,1);
	draw_sprite_ext(KeyButton,1,ConstScreenW-55,300,4,4,0,c_white,1);
	
	//Experience level
	draw_sprite_ext(SoulsIcon,0,ConstScreenW-38,ConstScreenH-46,4,4,0,c_white,1);
	scrDrawShadow(ConstScreenW-86,ConstScreenH-46,string(GlobalPlayerExpCount),c_white,c_black,1,0.7);
	//reset
	draw_set_font(fMessages);
	#endregion
	#region Debug
	if (debug) {
		draw_set_color(c_fuchsia);
		draw_set_halign(fa_left);
		draw_text(48,16,"<debug>");
		draw_text(48,48,"hSpeed: " + string(hsp) + "   vSpeed:" + string(vsp));
		draw_text(48,80,"x: " + string(oPlayer.x) + " y: " + string(oPlayer.y) + " z: " + string(oPlayer.depth));
		draw_text(48,112,"inst: " + string(instance_number(oPlayer)));
		draw_text(48,144,"FPS_real: " + string(fps) + "  FPS_in_Buffer: " + string(fps_real));
		//draw_text(48,196,"ASw: " + string() + " ASh: " +  string();
	}
	#endregion
}