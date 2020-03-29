//stable
DisableInput =					false;
PossibleJumping =				false;
Invisible =						false;
HideUI =						false;

//ability
FlyGroundAttack =				false;
DownDash =						false;
HoriDash =						false;
HighJump =						false;
PartShield =					false;

//Damages
FlyGroundAttackDamage =			global.FlyGroundAttackDamage;

//skin default
PlayerIdle =					MishaIdle; 
PlayerWalk =					MishaWalk; 
PlayerJump =					MishaJump;
PlayerCrawl =					MishaCrawl;
PlayerStair =					MishaStairs;

FlyAttackSound =				sPlayerFlyAttack;
DashAttackSound =				sPlayerDash;

//phisics settings
hsp =							0;
vsp =							0;
grv =							0.5;
walksp =						2.2;
Last_x =						0;
Last_y =						0;

//hp and stam
CurrentHp =						global.PlayerHp;
CurrentForce =					global.PlayerForce;
AnimHp =						CurrentHp;
AnimForce =						CurrentForce;

//particle
AbilitySystem = part_system_create();
AbilityEmitter = part_emitter_create(AbilitySystem);	

//debug
debug = false;