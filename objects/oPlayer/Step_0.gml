#region Main
//Keyboard binding
var KeyLeft =			global.keyLeft;
var KeyRight =			global.keyRight;
var KeyUp =				global.keyUp;
var KeyDown =			global.keyDown;
var KeyJump =			global.keySpace;
var KeyJumpP =			global.keySpaceP; 
var KeyShift =			global.keyShiftP;
var KeyF =				global.keyOrdfP;
var KeyMenu =			global.keyTabP;

//Collisions define
var isGrounded =		place_meeting(x,y+1,oWall);
var upCollision =		place_meeting(x,y-1,oWall);
var isStaired = 		place_meeting(x,y,oStair);

//Global list define
var GlobalPlayerForce =				global.PlayerForce;
var GlobalRestoreForce =			global.ForceRestoreSpeed;
var GlobalPlayerExp =				global.PlayerExperience;

var GlobalDoubleJumpRed =			global.DoubleJumpReduse;
var GlobalHoriDashRed =				global.DashReduse;
var GlobalPartShieldRed =			global.PartShieldReduse;

var GlobalFlyGroundAttackDamage =	global.FlyGroundAttackDamage;
var GlobalFlyGroundAttackRed =		global.FlyGroundAttackReduse;

//Disable input struct
if (DisableInput) {
	KeyLeft =		false;
	KeyRight =		false;
	KeyUp =			false;
	KeyDown =		false;
	KeyJumpP =		false;
	KeyJump =		false;
	KeyShift =		false;
	KeyF =			false;
	KeyMenu =		false;
}

//main functions
var move = KeyRight - KeyLeft;

if ((move == 0) and (hsp != 0)) or (HoriDash)
	hsp += 0.2 * (-sign(hsp));
else
	hsp = move * walksp;
	
	
if keyboard_check_pressed(vk_f3) debug = !debug;


#endregion
#region Jump
if (KeyJumpP) and (!KeyDown) and (!FlyGroundAttack) {		
	if (isGrounded) {
		PossibleJumping = true;
		HighJump = false;
		
		alarm[0] = 12;
	} else if (CurrentForce > GlobalDoubleJumpRed) { 
		CurrentForce -= GlobalDoubleJumpRed;
		PossibleJumping = true;
		
		if (KeyUp) HighJump = true;
		else HighJump = false;
		
		alarm[0] = 12;
		
		//Particles
		var JumpParticle = part_type_create();
	
		scrPartTypeMain(JumpParticle,false,0,0,0,0,30,45,true);
		
		scrPartSprite(JumpParticle,SimpleParticle,1,1,1,0);
		scrPartAngle(JumpParticle,0,360,2);
		scrPartDirect(JumpParticle,-135,-45);
		scrPartSpeed(JumpParticle,0.25,1,0.1);
		scrPartAlpha(JumpParticle,1,0);
		
		if (HighJump) scrPartColor(JumpParticle,c_green);
		else scrPartColor(JumpParticle,c_white);
		
		part_emitter_region(AbilitySystem, AbilityEmitter, x-32, x+32, y+2, y+12, ps_shape_ellipse, ps_distr_gaussian);
		part_emitter_burst(AbilitySystem, AbilityEmitter,JumpParticle,24)
	}
}
//Jumping logic
if (isGrounded and (sprite_index == PlayerJump) and !DisableInput) {
	var DustPart = part_type_create();
	
	scrPartTypeMain(DustPart,noone,0,0,0.01,90,40,45,0);
	scrPartSprite(DustPart,SimpleParticle,0,2,2,0);
	scrPartAlpha(DustPart,0,0.7,0);
	scrPartAngle(DustPart,0,360,1)
	scrPartColor(DustPart,c_ltgray);
		
	part_emitter_region(AbilitySystem, AbilityEmitter, x-16, x+16, y+16, y+16, ps_shape_line, ps_distr_linear);
	part_emitter_burst(AbilitySystem, AbilityEmitter, DustPart,5);
}
if (KeyJump) and (PossibleJumping)
	if (HighJump) vsp = -9;
	else vsp = -5;
	
if (upCollision) PossibleJumping = false;
#endregion
#region Animation
if (!isGrounded) {
	if (!isStaired) or (!KeyUp) {
	sprite_index = PlayerJump;
	
	if (sign(vsp) > 0) image_index = 1; //maybe sprite_index = jump
	else image_index = 0; //maybe sprite_index = fall
	} else if (KeyUp) {
			image_speed = 1;
			sprite_index = PlayerStair;
			hsp = 0;
			vsp = -1.5;
		}
}
else {
	if (hsp == 0) { //stand
		if (KeyDown) sprite_index = PlayerCrawl;
		else sprite_index = PlayerIdle;
	} else sprite_index = PlayerWalk;
}

if (hsp != 0) image_xscale = sign(hsp);
#endregion
#region Collisions
scrPhysics();
#endregion
#region Ability
//Actions , who take place if player touched a ground
if (isGrounded) {
	if (FlyGroundAttack) {		
		//Create Particles
		var FlyGroundAttackParticle = part_type_create();

		scrPartTypeMain(FlyGroundAttackParticle,noone,0,0,0,0,55,60,true);
		
		scrPartSprite(FlyGroundAttackParticle,LineVParticle,0,1,1.5,1);
		scrPartAlpha(FlyGroundAttackParticle,1,0);
		
		if (FlyGroundAttackDamage > 8) scrPartColor(FlyGroundAttackParticle,c_red,c_white); 
		else scrPartColor(FlyGroundAttackParticle,c_aqua,c_white);
		
		part_emitter_region(AbilitySystem, AbilityEmitter, x-32, x+32, y+12, y+12, ps_shape_line, ps_distr_linear);
		part_emitter_burst(AbilitySystem, AbilityEmitter, FlyGroundAttackParticle,24);
		
		//Create Dust particleObject , if player touch a ground
		repeat(24) with (instance_create_layer(x,y+12,"BulletLayer",oDust)) {
			hsp = random_range(-4,4);
			vsp = random_range(-5,-3);
		}
		
		//Some effects and restore varriable
		scrShakeCamera(10,30);
		audio_play_sound(FlyAttackSound,5,false);
		FlyGroundAttack = false;
	}
	//Part Shield create event
	if (KeyF) and (!PartShield) and (CurrentForce > GlobalPartShieldRed) {
		CurrentForce -= GlobalPartShieldRed;
		
		//Set restore timer
		alarm[2] = 300;
		alarm[1] = 300;
		image_alpha = 0.7;
		
		Invisible = true;
		PartShield = true;
	}
	
	//Restore player force 
	if (CurrentForce <= GlobalPlayerForce) and (!PartShield) {
		CurrentForce += GlobalRestoreForce;
		AnimForce = CurrentForce;
	}
	//Set last xy coord for teleportation
	Last_x = x;
	Last_y = y;
} else { 
	//Actions , who take place if player exists in air
	//FlyAttack moment action , who give down vsp force for player
	if ((KeyDown) and (KeyJump)) and (CurrentForce > GlobalFlyGroundAttackRed) and (!FlyGroundAttack) {
		CurrentForce -= GlobalFlyGroundAttackRed;
		vsp += 18;
		FlyGroundAttack = true;
	}
	//Calculate Damage count and create wind particles
	if (FlyGroundAttack) {
		if (GlobalFlyGroundAttackDamage < abs(vsp)/3) {
			FlyGroundAttackDamage = abs(vsp)/3;
		
			var WindParticle = part_type_create();
		
			scrPartTypeMain(WindParticle,noone,0,0,0.05,90,35,40,true);
			
			scrPartSprite(WindParticle,SimpleParticle,1,1,1,0);
			scrPartAlpha(WindParticle,0.5,0);
		
			part_emitter_region(AbilitySystem, AbilityEmitter, x-8, x+8, y-5, y, ps_shape_ellipse, ps_distr_gaussian);
			part_emitter_burst(AbilitySystem, AbilityEmitter, WindParticle,4);
		}
	}
}

//Choose Dash direction
if (KeyShift) and (CurrentForce > GlobalHoriDashRed) {
	if (KeyUp) {
		CurrentForce -= GlobalHoriDashRed;
		DownDash = true;
		Invisible = true;		
		vsp = -12;
		
		//Invisible restore time
		image_alpha = 0.7;
		alarm[1] = 30;
	} else {
		CurrentForce -= GlobalHoriDashRed;
		HoriDash = true;
		Invisible = true;
		hsp = 8 * image_xscale;
		
		//Invisible restore time
		image_alpha = 0.7;
		alarm[1] = 35;
	}
	audio_play_sound(DashAttackSound,5,false);
}

//Particles Create
if (HoriDash) {
	var HoriDashParticle = part_type_create();
	
	//Part Create condition
	if (abs(hsp) > 4) {
		scrPartTypeMain(HoriDashParticle,noone,0,0,0.1,90+90*image_xscale,50,70,true);
		
		scrPartSprite(HoriDashParticle,SimpleParticle,1,1,1,0);
		scrPartDirect(HoriDashParticle,160,200);
		scrPartSpeed(HoriDashParticle,0.25,1);
		scrPartAngle(HoriDashParticle,0,360,2);
		scrPartAlpha(HoriDashParticle,1,0);
		scrPartColor(HoriDashParticle,c_orange);
		
		part_emitter_region(AbilitySystem, AbilityEmitter, x-15*image_xscale, x-7*image_xscale, y-16, y+16, ps_shape_ellipse, ps_distr_gaussian);
		part_emitter_burst(AbilitySystem, AbilityEmitter,HoriDashParticle,8);
	} else HoriDash = false;
}
if (DownDash) {
	var DownDashParticle = part_type_create();
	
	//Part Create condition
	if (vsp < - 7) {
		scrPartTypeMain(DownDashParticle,noone,0,0,0.1,-90,45,60,true);
		
		scrPartSprite(DownDashParticle,SimpleParticle,1,1,1,0);
		scrPartDirect(DownDashParticle,-70,-150);
		scrPartSpeed(DownDashParticle,0.25,1);
		scrPartAngle(DownDashParticle,0,360,2);
		scrPartAlpha(DownDashParticle,1,0);
		scrPartColor(DownDashParticle,c_orange);
		
		part_emitter_region(AbilitySystem, AbilityEmitter, x-12, x+12, y+4, y+8, ps_shape_ellipse, ps_distr_gaussian);
		part_emitter_burst(AbilitySystem, AbilityEmitter,DownDashParticle,8);
	} else DownDash = false;
} 
if (PartShield) {
	var ShieldParticle = part_type_create();
	
	scrPartTypeMain(ShieldParticle,noone,0,0,0,0,80,100,false);
	
	scrPartSprite(ShieldParticle,SimpleParticle,1,1,1,0);
	scrPartDirect(ShieldParticle,80-90*image_xscale,100-90*image_xscale,4*image_xscale);
	scrPartSpeed(ShieldParticle,4);
	scrPartAngle(ShieldParticle,0,90,1);
	scrPartAlpha(ShieldParticle,0,1,0);
	scrPartColor(ShieldParticle,c_red);
		
	part_emitter_region(AbilitySystem, AbilityEmitter, x, x, y+48, y+48, ps_shape_ellipse, ps_distr_gaussian);
	part_emitter_burst(AbilitySystem, AbilityEmitter,ShieldParticle,2);	
}
#endregion	
#region Other
//Expirience add func
if (GlobalPlayerExp > 256) {
	global.PlayerExperienceCount++;
	global.PlayerExperience -= 256;
}
//Player die func
if (CurrentHp <= 0) {
	CurrentHp = 0;
	
	audio_stop_sound(scrGetAudioId(global.Music));
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
if (KeyMenu) 
	if (!instance_exists(oGameMenu)) {
		instance_create_layer(x,y,"PlayerLayer",oGameMenu);
		audio_play_sound(sMenuConfirm,1,false);
	}
#endregion