if (place_meeting(x,y,oPlayer) and (!StartAnimation)) {
    if (!audio_is_playing(sExperienceCollect)) 
        audio_play_sound(sExperienceCollect,1,false);
    global.PlayerExperience += 4 + irandom(6);
    StartAnimation = true;
    alarm[0] = 120;
}

if (!StartAnimation) {
    scrPhysics();
    if (place_meeting(x+sign(physics_VelocityH),y,oWall)) physics_VelocityH = -physics_VelocityH;
    if (place_meeting(x,y+1,oWall)) physics_VelocityH = 0;
} else {
    var TargetX = oCamera.x - 200;
    var TargetY = oCamera.y + 250;
    x += (TargetX - x) / 40; 
    y += (TargetY - y) / 25;
}