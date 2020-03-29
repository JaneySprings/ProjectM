var saveGameFile = ds_map_secure_load("user_data");

//Setting
global.Music = ds_map_find_value(saveGameFile,"MusicName");

//Stable
global.PlayerHp = ds_map_find_value(saveGameFile,"Hp");
global.PlayerForce = ds_map_find_value(saveGameFile,"Force");
global.PlayerExperience = ds_map_find_value(saveGameFile,"Experience");
global.PlayerExperienceCount = ds_map_find_value(saveGameFile,"ExperienceCount");
global.Timeline = ds_map_find_value(saveGameFile,"Timeline");
global.PlayerDefense = ds_map_find_value(saveGameFile,"Defense");
global.ForceRestoreSpeed = ds_map_find_value(saveGameFile,"ForceRestoreSpeed");
	
//Abilites
global.DashReduse = ds_map_find_value(saveGameFile,"DashReduse");
global.DashDamage = ds_map_find_value(saveGameFile,"DashDamage");

global.FlyGroundAttackReduse = ds_map_find_value(saveGameFile,"FGAttackReduse");
global.FlyGroundAttackDamage = ds_map_find_value(saveGameFile,"FGAttackDamage");

global.DoubleJumpReduse = ds_map_find_value(saveGameFile,"DJumpReduse");
global.DoubleJumpDamage = ds_map_find_value(saveGameFile,"DJumpDamage");
	
global.PartShieldReduse =ds_map_find_value(saveGameFile,"ShieldReduse");
global.PartShieldDamage = ds_map_find_value(saveGameFile,"ShieldDamage");

ds_map_destroy(saveGameFile);