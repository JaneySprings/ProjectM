hsp = 0;
vsp = 0;
grv = 0.2;
ydr = 0;

switch(ItemType) {
	case 1: image_index = irandom(image_number-2); break;
	case 2: break;
	case 3: break;
}

switch(image_index) {
	case 0: // Hp recovery 
		UpIncreeceCount = (global.PlayerHp - oPlayer.CurrentHp) * 1/3;
		GradientColor = c_maroon;
	break;
        /*case 1: 
            UpIncreeceCount = global.PartShieldDamage*1/3 + irandom(10);
            DownIncreeceCount = global.PartShieldReduse*1/5 + irandom(5);
            GradientColor = c_maroon;
        break;
        case 2: 
            UpIncreeceCount = global.FlyGroundAttackDamage*1/3 + irandom(10);
            DownIncreeceCount = global.FlyGroundAttackReduse*1/5 + irandom(5);
            GradientColor = $8D5A00;
        break;
        case 3: 
            UpIncreeceCount = global.DoubleJumpDamage*1/3 + irandom(10);
            DownIncreeceCount = global.DoubleJumpReduse*1/5 + irandom(5);
            GradientColor = $266E1D;
        break;
        case 4: 
            UpIncreeceCount = global.DashDamage*1/3 + irandom(10);
            DownIncreeceCount = global.DashReduse*1/5 + irandom(5);
            GradientColor = $1D98FF;
        break;*/
}
StatisticMenuAlpha = 0;