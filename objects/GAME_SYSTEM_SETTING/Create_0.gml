#region SETTINGS

	global.Music = "noone";
	global.MapSprite = noone;
	global.ScriptIndex = -1;
	global.Timeline = scrGetNumber("timeline_mode","timeline");
	
#endregion	
#region Player

	global.PlayerHp = scrGetNumber("player_statistic","player_current_hp");
	global.PlayerForce = scrGetNumber("player_statistic","player_current_force");
	global.PlayerExperience = scrGetNumber("player_statistic","player_experience");
	global.PlayerExperienceCount = scrGetNumber("player_statistic","player_experience_count");
	global.PlayerDefense = scrGetNumber("player_statistic","player_current_def");
	global.ForceRestoreSpeed = scrGetNumber("player_statistic","force_restore_speed");
	
//ABILITES

	global.DashReduse = scrGetNumber("player_abilites_statistic","horizontal_dash_reduse");
	global.DashDamage = scrGetNumber("player_abilites_statistic","horizontal_dash_damage");

	global.FlyGroundAttackReduse = scrGetNumber("player_abilites_statistic","fly_attack_reduse");
	global.FlyGroundAttackDamage = scrGetNumber("player_abilites_statistic","fly_attack_damage");

	global.DoubleJumpReduse = scrGetNumber("player_abilites_statistic","double_jump_reduse");
	global.DoubleJumpDamage = scrGetNumber("player_abilites_statistic","double_jump_damage");
	
	global.PartShieldReduse = scrGetNumber("player_abilites_statistic","shield_reduse");
	global.PartShieldDamage = scrGetNumber("player_abilites_statistic","shield_damage");
	
#endregion

instance_destroy();