if (CurrentHp < 35) draw_sprite_ext(Vingette,0,0,0,4,4,0,c_white,15/CurrentHp);

if (!function_SetPlayerUiInvisible) {
	#region local init
	scrDrawSettings(fMessages,c_black,fa_right,fa_center,1);

	var _uiWidth = const_ScreenWidth_render;
	var _uiHeight = const_ScreenHeight_render;
	var _uiDelta = const_ScreenHeight_native / const_ScreenHeight_render;
	var _uiXpos = 4*_uiDelta;
	var _uiYpos = (_uiHeight - 22)*_uiDelta;
	
	var _localPlayerHp = floor(global.PlayerHp);
	var _localPlayerSt = floor(global.PlayerForce);
	var _localPlayerExp = global.PlayerExperience;
	var _localMapSprite = global.MapSprite;
	
	var _deltaCell = 10;
	var _deltaHp = CurrentHp / _localPlayerHp;
	var _deltaSt = CurrentForce / _localPlayerSt;
	
	var _originalPlayerHp = 100*_uiDelta+_localPlayerHp/_deltaCell;
	var _originalPlayerSt = 30*_uiDelta+_localPlayerSt/_deltaCell;
	var _finalPlayerHp = (100*_uiDelta+_localPlayerHp/_deltaCell)*_deltaHp;
	var _finalPlayerSt = (30*_uiDelta+_localPlayerSt/_deltaCell)*_deltaSt;
	var _finalPlayerExp = 128*_uiDelta;
	var _finalPlayerAnimHp = 100*_uiDelta+AnimHp/_deltaCell;
	var _finalPlayerAnimSt = 30*_uiDelta+AnimForce/_deltaCell;
	
	#endregion
	#region Abilites
	draw_sprite_ext(AbilitySlot , 0 , _uiXpos , _uiYpos-33*_uiDelta , _uiDelta , _uiDelta , 0 , c_white , 1);
	
	#endregion
	#region PlayerHP and ST
	//stamina line
	draw_sprite_part_ext(LiveBar , 1 , 0 , 0 , 3 , 12 , _uiXpos , _uiYpos , _uiDelta , _uiDelta , c_white , 0.6);
	draw_sprite_part_ext(LiveBar , 1 , 3 , 0 , 1 , 12 , 12+_uiXpos , _uiYpos , _originalPlayerSt , _uiDelta , c_white , 0.6);
	draw_sprite_part_ext(LiveBar , 1 , 4 , 0 , 3 , 12 , 12+_uiXpos+_originalPlayerSt , _uiYpos , _uiDelta , _uiDelta , c_white , 0.6);
	
	//hp line
	draw_sprite_part_ext(LiveBar , 0 , 0 , 0 , 3 , 12 , 24+_uiXpos+_originalPlayerSt , _uiYpos , _uiDelta , _uiDelta , c_white , 0.6);
	draw_sprite_part_ext(LiveBar , 0 , 3 , 0 , 1 , 12 , 36+_uiXpos+_originalPlayerSt , _uiYpos , _originalPlayerHp , _uiDelta , c_white , 0.6);
	draw_sprite_part_ext(LiveBar , 0 , 4 , 0 , 3 , 12 , 36+_uiXpos+_originalPlayerSt+_originalPlayerHp , _uiYpos , _uiDelta , _uiDelta , c_white, 0.6);
	
	//xp cur line
	draw_sprite_part_ext(LiveBar , 2 , 0 , 0 , 3 , 5 , _uiXpos , _uiYpos+_uiDelta*12 , _uiDelta , _uiDelta , c_white , 0.6);
	draw_sprite_part_ext(LiveBar , 2 , 3 , 0 , 1 , 5 , 12+_uiXpos , _uiYpos+_uiDelta*12 , _finalPlayerExp , _uiDelta , c_white , 0.6);
	draw_sprite_part_ext(LiveBar , 2 , 4 , 0 , 3 , 5 , 12+_uiXpos+_finalPlayerExp , _uiYpos+_uiDelta*12 , _uiDelta , _uiDelta , c_white , 0.6);
	
	//logic
	if (_finalPlayerAnimHp > _finalPlayerHp) AnimHp -= 2;
	if (_finalPlayerAnimSt > _finalPlayerSt) AnimForce -= 8;
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_color(c_white);
	
	//stamina cur line
	draw_sprite_part_ext(StatusLine , 0 , 1 , 0 , 1 , 8 , 12+_uiXpos , _uiYpos+2*_uiDelta , _finalPlayerAnimSt , _uiDelta , c_white , 1);
	draw_sprite_part_ext(StatusLine , 0 , 0 , 0 , 1 , 8 , 12+_uiXpos , _uiYpos+2*_uiDelta , _finalPlayerSt , _uiDelta, c_white , 1);
	scrDrawShadow(12+_uiXpos+_originalPlayerSt/2 , _uiYpos+6*_uiDelta , string(floor(CurrentForce))+" | "+ string(_localPlayerSt) , c_white , c_black , 1 , 0.7);
	
	//hp cur line
	draw_sprite_part_ext(StatusLine , 0 , 1 , 0 , 1 , 8 , 36+_uiXpos+_originalPlayerSt , _uiYpos+2*_uiDelta , _finalPlayerAnimHp , _uiDelta , c_white , 1);
	draw_sprite_part_ext(StatusLine , 0 , 2 , 0 , 1 , 8 , 36+_uiXpos+_originalPlayerSt , _uiYpos+2*_uiDelta , _finalPlayerHp , _uiDelta , c_white , 1);
	scrDrawShadow(36+_uiXpos+_originalPlayerSt+_originalPlayerHp/2 ,  _uiYpos+6*_uiDelta , string(floor(CurrentHp))+" | "+ string(_localPlayerHp) , c_white , c_black , 1 , 0.7);
	
	//xp cur line
	draw_sprite_part_ext(StatusLine , 0 , 3 , 0 , 1 , 3 , _uiXpos , _uiYpos+_uiDelta*12 , _localPlayerExp*_uiDelta , _uiDelta , c_white , 1);
	#endregion
	#region Other
	//map
	draw_sprite_ext(MapPlate , 0 ,( _uiWidth-4)*_uiDelta , _uiYpos+_uiDelta*17 , _uiDelta , _uiDelta , 0 , c_white , 0.7);	
	if (sprite_exists(_localMapSprite)) draw_sprite_part_ext(_localMapSprite , 0 , floor(x/16)-28 , floor(y/16)-18 , 56 , 36 , (_uiWidth-115)*_uiDelta , _uiYpos-_uiDelta*54 , _uiDelta*2 , _uiDelta*2 , c_white , 0.9); 
	draw_sprite_ext(MapPlate , 1 , ( _uiWidth-4)*_uiDelta , _uiYpos+_uiDelta*17  , _uiDelta , _uiDelta , 0 , c_white , 1);
	draw_sprite_ext(KeyButton , 1 , ( _uiWidth-11)*_uiDelta ,  _uiYpos+_uiDelta*13 , _uiDelta , _uiDelta , 0 , c_white , 1);

	//reset
	draw_set_font(fMessages);
	#endregion
	#region Debug
	if (debug) {
		draw_set_color(c_fuchsia);
		draw_set_halign(fa_left);
		draw_text(48,16,"<debug>");
		draw_text(48,48,"physics_VelocityHeed: " + string(physics_VelocityH) + "   physics_VelocityVeed:" + string(physics_VelocityV));
		draw_text(48,80,"x: " + string(oPlayer.x) + " y: " + string(oPlayer.y) + " z: " + string(oPlayer.depth));
		draw_text(48,112,"inst: " + string(instance_number(oPlayer)));
		draw_text(48,144,"FPS_real: " + string(fps) + "  FPS_in_Buffer: " + string(fps_real));
	}
	#endregion
}