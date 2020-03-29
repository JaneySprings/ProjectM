if (instance_exists(oPlayer)) {
    if (!oPlayer.HideUI) {
        var _x = oPlayer.x;
        var _y = oPlayer.y - 32;
        
        DistanceToPlayer = distance_to_object(oPlayer);
        if (DistanceToPlayer < 256) {
            if (alpha < 1) alpha += 0.05;
        } else {
            if (alpha > 0) alpha -= 0.05;
            else if (alpha == 0) instance_destroy();
        }
        //draw keys
        scrDrawSettings(fText,c_gray,fa_left,fa_center,alpha);
        draw_sprite(KeyButton,2,_x-32,_y);
        draw_sprite(KeyButton,3,_x-32,_y-28);
        draw_text(_x,_y,scrGetString(global.langtype,"keys","key_jump"));
        draw_text(_x,_y-28,scrGetString(global.langtype,"keys","key_move"));
    }
} else instance_destroy();