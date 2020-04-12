#region Main
var _keycodeLeft =									global.InputKeycodeLEFT;
var _keycodeRight =								global.InputKeycodeRIGHT;
var _keycodeUp =									global.InputKeycodeUP;
var _keycodeDown =								global.InputKeycodeDOWN;
var _keycodeJump =								global.InputKeycodeSPACE;
var _keycodeJump_pressed =				global.InputKeycodeSPACE_pressed; 
var _keycodeShift =									global.InputKeycodeSHIFT_pressed;
var _keycodeF =										global.InputKeycodeF_pressed;
var _keycodeTab =									global.InputKeycodeTAB_pressed;

var _collisionToGround_bottom =		place_meeting(x,y+1,oWall);
var _collisionToGround_top =				place_meeting(x,y-1,oWall);
var _collisionToStair = 							place_meeting(x,y,oStair);

var _localPlayerForce =							global.PlayerForce;
var _localPlayerForceIncr =					global.ForceRestoreSpeed;
var _localPlayerExp =								global.PlayerExperience;

//Disable input function
if (function_DisableUserInput) {
	_keycodeLeft =					  false;
	_keycodeRight =				  false;
	_keycodeUp =					  false;
	_keycodeDown =				  false;
	_keycodeJump_pressed = false;
	_keycodeJump =				  false;
	_keycodeShift =				  false;
	_keycodeF =						  false;
	_keycodeTab =					  false;
}

//Physics Engine
var _move = _keycodeRight - _keycodeLeft;

if (_move == 0) and (physics_VelocityH != 0) 
		physics_VelocityH -= physics_FrictionForce * sign(physics_VelocityH);
else physics_VelocityH = (_move + physics_AddForceH) * physics_VelocityH_incr;

//Restore force to zero	
if (physics_AddForceH != 0) physics_AddForceH =	0;

//Overlay
if keyboard_check_pressed(vk_f3) debug = !debug;
#endregion
#region Jump
if (_keycodeJump_pressed)  {		
	if (_collisionToGround_bottom) {
		physics_AllowAddVelocityV= true;
		alarm[0] = physics_AllowAddVelocityV_delta;
		
	} else if (CurrentForce > 15 /*MINIMUM STAMINA*/) { 
		CurrentForce -= 15 /*MINIMUM STAMINA*/;
		physics_AllowAddVelocityV= true;
		alarm[0] = physics_AllowAddVelocityV_delta;
		
		var _jumpParticle = part_type_create();
		
		scrPartTypeMain(_jumpParticle,false,0,0,0,0,30,45,true);
		scrPartSprite(_jumpParticle,SimpleParticle,1,1,1,0);
		scrPartAngle(_jumpParticle,0,360,2);
		scrPartDirect(_jumpParticle,-135,-45);
		scrPartSpeed(_jumpParticle,0.25,1,0.1);
		scrPartAlpha(_jumpParticle,1,0);
		scrPartColor(_jumpParticle,c_green);
		
		part_emitter_region(AbilitySystem, AbilityEmitter, x-32, x+32, y+2, y+12, ps_shape_ellipse, ps_distr_gaussian);
		part_emitter_burst(AbilitySystem, AbilityEmitter,_jumpParticle,24)
	}
}

if (_keycodeJump) and (physics_AllowAddVelocityV) physics_VelocityV = -physics_VelocityV_incr;
if (_collisionToGround_top) physics_AllowAddVelocityV= false;

if (_collisionToGround_bottom) and (sprite_index == resource_PlayerJumpAnim)  {
	var DustPart = part_type_create();
	
	scrPartTypeMain(DustPart,noone,0,0,0.01,90,40,45,0);
	scrPartSprite(DustPart,SimpleParticle,0,2,2,0);
	scrPartAlpha(DustPart,0,0.7,0);
	scrPartAngle(DustPart,0,360,1)
	scrPartColor(DustPart,c_ltgray);
		
	part_emitter_region(AbilitySystem, AbilityEmitter, x-16, x+16, y+16, y+16, ps_shape_line, ps_distr_linear);
	part_emitter_burst(AbilitySystem, AbilityEmitter, DustPart,5);
}
#endregion
#region Animation
if (!_collisionToGround_bottom) {
	if (!_collisionToStair) or (!_keycodeUp) {
	sprite_index = resource_PlayerJumpAnim;
	
	if (sign(physics_VelocityV) > 0) image_index = 1; //maybe sprite_index = jump
	else image_index = 0; //maybe sprite_index = fall
	} else if (_keycodeUp) {
			image_speed = 1;
			sprite_index = resource_PlayerLandAnim;
			physics_VelocityH = 0;
			physics_VelocityV = -1.5;
		}
}
else {
	if (physics_VelocityH == 0) { //stand
		if (_keycodeDown) sprite_index = resource_PlayerCrawlAnim;
		else sprite_index = resource_PlayerIdleAnim;
	} else sprite_index = resource_PlayerWalkAnim;
}

if (physics_VelocityH != 0) image_xscale = sign(physics_VelocityH);
#endregion
#region Collisions
scrPhysics();
#endregion
#region Ability
//Actions , who take place if player touched a ground
if (_collisionToGround_bottom) {
	//Restore player force 
	if (CurrentForce <= _localPlayerForce)  {
		CurrentForce += _localPlayerForceIncr;
		AnimForce = CurrentForce;
	}
	position_LastX = x;
	position_LastY = y;
	
//Actions , who take place if player in air
} else { 
	//nothing
}

#endregion	
#region Other
//Expirience add func
if (_localPlayerExp > 256) {
	global.PlayerExperienceCount++;
	global.PlayerExperience -= 256;
}
//Player die func
if (CurrentHp <= 0) {
	CurrentHp = 0;
	
	audio_stop_sound(scrGetAudioByName(global.Music));
	audio_play_sound(sPlayerDeath,1,false);
	with(instance_create_layer(x,y,"TextLayer",oPlayerHitDetect)) SetGameOver = true;
	
	var PlayerDiePart = part_type_create();
	
	scrPartTypeMain(PlayerDiePart,noone,0,0,0.1,-90,60,100,true);
	
	scrPartSprite(PlayerDiePart,TriangleParticle,0,0.5,0.5,0);
	scrPartAlpha(PlayerDiePart,1,0);
	scrPartAngle(PlayerDiePart,0,360,1);
	scrPartDirect(PlayerDiePart,0,360,0,0);
	scrPartSpeed(PlayerDiePart,4,0,-0.05,0);
		
	part_emitter_region(AbilitySystem, AbilityEmitter, x, x, y, y, ps_shape_ellipse, ps_distr_gaussian);
	part_emitter_burst(AbilitySystem, AbilityEmitter, PlayerDiePart,64);
	
	instance_destroy();
}

//Create_menu
if (_keycodeTab) 
	if (!instance_exists(oGameMenu)) {
		instance_create_layer(x,y,"PlayerLayer",oGameMenu);
		audio_play_sound(sMenuConfirm,1,false);
	}
#endregion