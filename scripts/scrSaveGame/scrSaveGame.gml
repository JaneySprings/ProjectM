var saveGameFile = ds_map_create();

//All player Stats
	//Stable
ds_map_add(saveGameFile,"Hp",global.PlayerHp);
ds_map_add(saveGameFile,"Force",global.PlayerForce);
ds_map_add(saveGameFile,"Timeline",global.Timeline);
ds_map_add(saveGameFile,"Defense",global.PlayerDefense);
ds_map_add(saveGameFile,"Experience",global.PlayerExperience);
ds_map_add(saveGameFile,"ExperienceCount",global.PlayerExperienceCount);
ds_map_add(saveGameFile,"ForceRestoreSpeed",global.ForceRestoreSpeed);

	//Abilites
ds_map_add(saveGameFile,"DashReduse",global.DashReduse);
ds_map_add(saveGameFile,"DashDamage",global.DashDamage);

ds_map_add(saveGameFile,"FGAttackReduse",global.FlyGroundAttackReduse);
ds_map_add(saveGameFile,"FGAttackDamage",global.FlyGroundAttackDamage);

ds_map_add(saveGameFile,"DJumpReduse",global.DoubleJumpReduse);
ds_map_add(saveGameFile,"DJumpDamage",global.DoubleJumpDamage);

ds_map_add(saveGameFile,"ShieldReduse",global.PartShieldReduse);
ds_map_add(saveGameFile,"ShieldDamage",global.PartShieldDamage);

//Oher
ds_map_add(saveGameFile,"MusicName",global.Music);
ds_map_add(saveGameFile,"ScriptIndex",global.ScriptIndex);
ds_map_add(saveGameFile,"Room",room);
ds_map_add(saveGameFile,"X",oPlayer.x);
ds_map_add(saveGameFile,"Y",oPlayer.y);

ds_map_secure_save(saveGameFile,"user_data");
ds_map_destroy(saveGameFile);