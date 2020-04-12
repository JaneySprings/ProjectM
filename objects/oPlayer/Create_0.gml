//Functions
function_DisableUserInput =			false;
function_SetPlayerInvisible =			false;
function_SetPlayerUiInvisible =		false;

//Default Skin settings
resource_PlayerIdleAnim =				DefaultPlayerIdle; 
resource_PlayerWalkAnim =				DefaultPlayerWalk; 
resource_PlayerJumpAnim =				DefaultPlayerJump;
resource_PlayerCrawlAnim =			DefaultPlayerCrawl;
resource_PlayerLandAnim =				DefaultPlayerLand;
resource_PlayerFallSound =				sPlayerFlyAttack;
resource_PlayerDashSound =			sPlayerDash;
resource_PlayerHitSound =				sDamageDetect;

//phisics settings
physics_VelocityH =								0;
physics_VelocityV =								0;
physics_VelocityH_incr =					2.2;
physics_VelocityV_incr =						5;
physics_AllowAddVelocityV =				false;
physics_AllowAddVelocityV_delta =	12;

physics_Gravity =								0.5;
physics_FrictionForce =						0.2;
physics_AddForceH =							0;

position_LastX =									0;
position_LastY =									0;

//hp and stam
CurrentHp =						global.PlayerHp;
CurrentForce =					global.PlayerForce;
AnimHp =							CurrentHp;
AnimForce =						CurrentForce;

//particle
AbilitySystem = part_system_create();
AbilityEmitter = part_emitter_create(AbilitySystem);	

//debug
debug = false;